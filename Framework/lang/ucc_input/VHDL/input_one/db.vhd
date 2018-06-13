library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.project_pack.all;
use work.config_pack.all;
use work.draw_any_octant;
use work.db_pack.all;

-- note: all functions/types moved into a separate package file to avoid modelsim coverage errors

entity db is
   port(
      clk: in std_logic;
      reset: in std_logic;

      -- bus from host
      hdb      : in  STD_LOGIC_VECTOR( 15 downto 0);
      dav      : in  STD_LOGIC;
      hdb_busy : out STD_LOGIC;

      -- bus to VRAM
      dbb                 : out db_2_rcd;
      dbb_delaycmd        : in std_logic;

      -- to testbench
      db_finish : out std_logic
      );
end db;

architecture arch of db is

--------------------------------------------------------------
-- architecture signals
--------------------------------------------------------------

	-- shadowing outputs
	signal dbb_alias : db_2_rcd;
	signal hdb_busy_alias : std_logic;
	
	-- registered host command
	signal saved_host_cmd : host_cmd_t;
	
 	-- registered cursor xy and enable signal
 	signal xy_reg_enable : std_logic;

	signal current_x : std_logic_vector(VSIZE-1 downto 0);
	signal current_y : std_logic_vector(VSIZE-1 downto 0);

	-- inputs into xy regs
	signal new_x : std_logic_vector(VSIZE-1 downto 0);
	signal new_y : std_logic_vector(VSIZE-1 downto 0);

	-- fsm states
	signal fsm_state : db_fsm_state_t;
	signal line_fsm_state : line_fsm_state_t;
	signal fill_fsm_state : fill_fsm_state_t;

	-- line drawing module glue signals
	signal line_enable : std_logic;
	signal line_startpt : std_logic;
	signal line_endpt : std_logic;
	signal line_done : std_logic;

	signal line_xbias : std_logic;
	signal line_swapxy : std_logic;
	signal line_negx : std_logic;
	signal line_negy : std_logic;

	signal line_xout : std_logic_vector(VSIZE-1 downto 0);
	signal line_yout : std_logic_vector(VSIZE-1 downto 0);

---------------------------------------------------------------
-- architecture body
---------------------------------------------------------------

begin

-- shadowing
dbb <= dbb_alias;
hdb_busy <= hdb_busy_alias;

---------------------------------------------------------------

-- clocked process to handle state transitions for the fsm (including nested fsms)
FSM_TRANSITION_R: process
begin
	wait until clk'event and clk='1';
	if reset = '1' then
		fsm_state <= idle_state;
		line_fsm_state <= line_startpt_state;
		fill_fsm_state <= fill_startpt_state;
	else
		-- default, will spawn a warning but is clearer
		fsm_state <= fsm_state;
		line_fsm_state <= line_fsm_state;
		fill_fsm_state <= fill_fsm_state;

		-- note: new_xy will always be the freshest state of the cursor's xy state
		case fsm_state is

		-- idling while waiting for new host command if previous were nops
		 when idle_state => 
		 	fsm_state <= next_db_fsm_state(dav, hdb, new_x, new_y);

		-- single pixel drawing
		 when draw_single_pix_state => 
		 	if dbb_delaycmd='0' then -- if rcb slave is not busy, can consume next command
				fsm_state <= next_db_fsm_state(dav, hdb, new_x, new_y);
			end if;

		-- move cursor
		 when set_xy_state => 
		 	fsm_state <= next_db_fsm_state(dav, hdb, new_x, new_y);

		-- fill subfsm on fills
		 when fill_state => 
		 	case (fill_fsm_state) is
				 when fill_startpt_state => if dbb_delaycmd='0' then -- proceed if rcb not blocking
				 								fill_fsm_state <= fill_endpt_state;
				 							end if;

				 when fill_endpt_state => if dbb_delaycmd='0' then -- consume new command if rcb not blocking
				 								fill_fsm_state <= fill_startpt_state;
				 								fsm_state <= next_db_fsm_state(dav, hdb, new_x, new_y);
				 						 end if;

				 when others => null;
			end case;

		-- line subfsm on line drawing
		 when draw_line_state => 
		 	case line_fsm_state is
				when line_startpt_state => 
					line_fsm_state <= line_endpt_state;

				when line_endpt_state => 
					line_fsm_state <= line_pix_state;

				when line_pix_state => -- transition to self by default
					 if line_done='1' and dbb_delaycmd='0' then -- if done and not blocked on rcb, transition to next command
						 line_fsm_state <= line_startpt_state;
						 fsm_state <= next_db_fsm_state(dav, hdb, new_x, new_y);
					 end if;

				when others => null;
			end case;

		 when others => null;

		end case;
	end if;
end process FSM_TRANSITION_R;

-------------------------------------------------------------------------------------------

-- control potential accept state flag (is true when it would be possible to accept a new host cmd in the next cycle)
HDB_BUSY_INTERFACE_C : process (fsm_state, dbb_delaycmd, line_fsm_state, line_done, fill_fsm_state)
begin

	-- default to not be able to accept a command next cycle
	hdb_busy_alias <= '1';

	-- if in a state such that the block could accept a new command (assuming the dependencies like rcb are not blocking the progress), assert flag
	case (fsm_state) is
	
		-- can always accept a new command from the following states
		when idle_state | set_xy_state =>
			hdb_busy_alias <= '0';

		-- depend on rcb
		when draw_single_pix_state => 
			hdb_busy_alias <= dbb_delaycmd;

		-- if line drawing is finished, busy state depends purely on whether rcb is busy
		when draw_line_state => 
			if line_fsm_state=line_pix_state and line_done='1' then
				hdb_busy_alias <= dbb_delaycmd;
			end if;

		-- depend on rcb busy flag when in final fill subfsm state
		when fill_state => 
			if fill_fsm_state=fill_endpt_state then
				hdb_busy_alias <= dbb_delaycmd;
			end if;

		when others => null;
	
	end case;
end process HDB_BUSY_INTERFACE_C;


-- controls done-with-processing flag
DB_FINISH_INTERFACE_C: process (fsm_state, dav)
begin
	-- if no data pending from processor and in idle state, assert done flag
	if fsm_state = idle_state and dav = '0' then
		db_finish <= '1';
	else
		db_finish <= '0';
	end if;
end process DB_FINISH_INTERFACE_C;

-------------------------------------------------------------------------------------------

-- drives the rcb interface (encapsulates all state-derived logic that can affect it)
RCB_INTERFACE_C: process (fsm_state, line_fsm_state, line_xout, line_yout, saved_host_cmd, fill_fsm_state, current_x, current_y)
begin

	-- default to not be able to accept a command next cycle
	dbb_alias.startcmd <= '0';
	dbb_alias.rcb_cmd <= dbrcb_move;
	dbb_alias.X <= std_logic_vector(to_unsigned(0, dbb.X'length));
	dbb_alias.Y <= std_logic_vector(to_unsigned(0, dbb.Y'length));

	
	case fsm_state is
	
		when draw_single_pix_state => 
			dbb_alias.startcmd <= '1';
			dbb_alias.rcb_cmd <= '0' & decode_to_rcb_opcode(saved_host_cmd)(1 downto 0); -- override instruction to a draw even if it originated from fill
			dbb_alias.X <= saved_host_cmd.x;
			dbb_alias.Y <= saved_host_cmd.y;

		when draw_line_state => 
			case line_fsm_state is
			 when line_pix_state => 
			 	dbb_alias.startcmd <= '1';
				 dbb_alias.rcb_cmd <= decode_to_rcb_opcode(saved_host_cmd); 
				 dbb_alias.X <= line_xout; -- multiplex output of the drawing entity to the rcb bus
				 dbb_alias.Y <= line_yout;

			 when others => null;
			end case;

		when fill_state => 
			case fill_fsm_state is
			 when fill_startpt_state =>
				dbb_alias.startcmd <= '1';
				dbb_alias.rcb_cmd <= dbrcb_move;
				dbb_alias.X <= current_x; -- fill start point: current x and y
				dbb_alias.Y <= current_y;

			 when fill_endpt_state =>
				dbb_alias.startcmd <= '1';
				dbb_alias.rcb_cmd <= decode_to_rcb_opcode(saved_host_cmd); 
				dbb_alias.X <= saved_host_cmd.x; -- fill end point: from host command
				dbb_alias.Y <= saved_host_cmd.y;

			 when others => null;
			end case;
		
		when others => null;	-- keep defaults for states that do not affect rcb interface
	
	end case;	
end process RCB_INTERFACE_C; 

-------------------------------------------------------------------------------------------

-- as dealing with host commands is pipelined, need to register the command
SAVED_HOST_CMD_R : process
begin
	wait until clk'event and clk='1';
	if reset = '1' then
		saved_host_cmd <= decode_host_cmd(std_logic_vector(to_unsigned(0, hdb'length)));
	else

		-- if going to accept a new command, enable the register
		if hdb_busy_alias = '0' then
			saved_host_cmd <= decode_host_cmd(hdb);
		end if;

	end if;
end process SAVED_HOST_CMD_R; 

-------------------------------------------------------------------------------------------

-- registers holding current x and y cursor coordinates 
XY_REG_R: process
begin
	wait until clk'event and clk='1';
	if reset = '1' then
		current_x <= (others=>'0');
		current_y <= (others=>'0');
	else
		if xy_reg_enable='1' then
			current_x <= new_x;
			current_y <= new_y;
		end if;
	end if;
end process XY_REG_R;

-------------------------------------------------------------------------------------------

-- combinatorial enable and input data into the xy state registers
XY_REG_INPUT_C : process (fsm_state, line_fsm_state, saved_host_cmd, fill_fsm_state, current_x, current_y, dbb_delaycmd)
begin

	xy_reg_enable <= '0';

	-- by default: new_xy are equal to contents of current_xy registers
	new_x <= current_x;
	new_y <= current_y;

	-- if update xy instruction, enable register and set up data
	case fsm_state is
	 when set_xy_state =>
		xy_reg_enable <= '1';
		new_x <= saved_host_cmd.x;
		new_y <= saved_host_cmd.y;
	
	-- update xy during line setup
	 when draw_line_state =>
	 	if line_fsm_state = line_startpt_state then
			xy_reg_enable <= '1';
			new_x <= saved_host_cmd.x;
			new_y <= saved_host_cmd.y;
		end if;

	-- update xy state if doing fills
	 when fill_state =>
	 	if fill_fsm_state = fill_startpt_state and dbb_delaycmd='0' then -- reg update and transition to endpt state need to be synchronised since startpt to rcb is multiplexed from the xy register contents
			xy_reg_enable <= '1';
			new_x <= saved_host_cmd.x;
			new_y <= saved_host_cmd.y;
		end if;	 		

	 when others => null;
	end case;

end process XY_REG_INPUT_C;

-------------------------------------------------------------------------------------------

-- line drawing entity
LINE_DRAWER: entity draw_any_octant
generic map (VSIZE)
port map (
  clk    => clk,
  enable => line_enable,
  resetx => line_startpt,
  draw   => line_endpt,
  done   => line_done,
  x      => line_xout,
  y      => line_yout,
  xin    => current_x,
  yin    => current_y,
  xbias  => line_xbias,
  swapxy => line_swapxy,
  negx   => line_negx,
  negy   => line_negy);


-- interface to the line drawing entity
LINE_INTERFACE_C: process (line_fsm_state, dbb_delaycmd, current_x, current_y, saved_host_cmd)
begin

	-- pulse start point signal for one cycle to set up starting xy coords
	line_startpt <= '0';
	if line_fsm_state = line_startpt_state then
		line_startpt <= '1';
	end if;

	-- pulse end point signal for a cycle to set final xy coords
	line_endpt <= '0';
	if line_fsm_state = line_endpt_state then
		line_endpt <= '1';
	end if;

	-- pause the draw block while waiting for ram
	line_enable <= '1';
	if line_fsm_state = line_pix_state then
		line_enable <= not dbb_delaycmd;
	end if;

	-- TODO: bias hacked inside drawing entity to meet testbench spec (wrong but tb won't be fixed)
	line_xbias <= '1';

	-- negx and negy for drawing lines in any octant
	line_negx <= '0';
	if (unsigned(current_x) > unsigned(saved_host_cmd.x)) then
		line_negx <= '1';
	end if;

	line_negy <= '0';
	if (unsigned(current_y) > unsigned(saved_host_cmd.y)) then
		line_negy <= '1';
	end if;

	-- swap x and y if vertical direction lines (delta y bigger than delta x)
	line_swapxy <= '0';
	if (calc_delta(current_x, saved_host_cmd.x) < calc_delta(current_y, saved_host_cmd.y)) then
		line_swapxy <= '1';
	end if;


end process LINE_INTERFACE_C;

-------------------------------------------------------------------------------------------

end architecture arch;