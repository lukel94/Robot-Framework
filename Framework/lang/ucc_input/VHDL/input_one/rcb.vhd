library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;
library work;
	use work.project_pack.all;
	use work.pix_cache_pak.all;

entity rcb is
  port (
	clk, reset          : IN  std_logic;

    -- bus to DB
    dbb                 : IN db_2_rcd;
    dbb_delaycmd        : OUT std_logic;

    -- signal to testbench
    rcb_finish             : OUT std_logic;
    -- bus to VRAM
    vdin   : OUT STD_LOGIC_VECTOR(RAM_WORD_SIZE-1 DOWNTO 0);
    vdout  : IN  STD_LOGIC_VECTOR(RAM_WORD_SIZE-1 DOWNTO 0);
    vaddr  : OUT STD_LOGIC_VECTOR; -- open port, exact size depends on VSIZE
    vwrite : OUT STD_LOGIC
  ) ;
end entity rcb;

architecture arch of rcb is
	type rcb_state_t is (UNINITIALIZED, IDLE, drawpix, fill, do_fill, move);
	signal rcb_state : rcb_state_t;
	SIGNAL ready : std_logic;
	signal nop_flush_countdown : unsigned(FLUSH_LATENCY_COUNTER_SIZE-1 downto 0);

	signal storetag : unsigned(vaddr'range);
	signal requested_storetag : unsigned(vaddr'range);
	signal currcmd : db_2_rcd;

	signal pw 			: std_logic;
	signal wen_all		: std_logic;
	signal pixnum		: unsigned(3 DOWNTO 0);
	signal pixopin		: pixop_t;
	signal store		: store_t; --out
	signal is_same 		: std_logic; --out

	signal start_rmw	: std_logic;
	signal delay_rmw	: std_logic; --out

	SUBTYPE  xyutype IS unsigned(dbb.x'range);

	signal fillstart_x	: xyutype;
	signal fillstart_y	: xyutype;
	signal lastfill		:std_logic;

	signal pixopbus		: store_t;
	signal buswen	: std_logic;

	subtype block_t is unsigned(vaddr'length/2 - 1 downto 0);
	signal currxblock : block_t;
	signal curryblock : block_t;

	-- swx, swy, nex, ney
	type pixcorners_t is array(0 to 3) of unsigned(1 downto 0);
	signal pixcorners : pixcorners_t;
	signal pixcorner_in_currblock : std_logic_vector(0 to 3);

	FUNCTION an(x : xyutype; y : xyutype) RETURN integer IS
	BEGIN
		RETURN (to_integer(x)/ 4) + 16 * (to_integer(y)/4);
	END;

	FUNCTION pn(x : xyutype; y : xyutype) RETURN integer IS
	BEGIN
		RETURN (to_integer(x) MOD 4) + 4 * (to_integer(y) MOD 4);
	END;

	function compute_next_state(dbcmd: db_2_rcd) return rcb_state_t is
	begin
		if dbcmd.startcmd = '1' then
			case( dbcmd.rcb_cmd ) is
							
				when dbrcb_notused => return IDLE;
				
				when dbrcb_draw_white
					| dbrcb_draw_black
					| dbrcb_draw_invert	=> return drawpix;
				
				when dbrcb_move => return move;

				when dbrcb_fill_white
					| dbrcb_fill_black
					| dbrcb_fill_invert	=> return fill;
				
				when others => NULL;
			
			end case ;
		else
			return IDLE;
		end if;
	end;

begin

	PWC: entity work.pix_word_cache port map(
	    clk => clk,
	    reset => reset,
	    pw => pw,
	    wen_all => wen_all,
	    pixnum => std_logic_vector(pixnum),
	    pixopin => pixopin,
	    pixopbus => pixopbus,
    	buswen => buswen,
	    store => store,
	    is_same => is_same
    );

    RMW: entity work.read_modify_write port map(
		clk => clk,
		reset => reset,
		start => start_rmw,
		delay => delay_rmw,
		vwrite => vwrite,
		store => store,
		storetag => storetag,
		vdin => vdin,
    	vdout => vdout,
   		vaddr => vaddr
	);

    -- Registered process: does FSM transitions and fill sequencing
	R1 : process
		--fill sequencing vars
		variable startxblock : block_t;
		variable startyblock : block_t;
		variable finalxblock : block_t;
		variable finalyblock : block_t;

		-- Shadowing variables required to do some in-place operations
		variable currxblock_s : block_t;
		variable curryblock_s : block_t;
		variable pixcorners_s : pixcorners_t;
	begin
		WAIT UNTIL clk'event AND clk = '1';

		--by default decrement if nonzero
		if (nop_flush_countdown > 0) then
			nop_flush_countdown <= nop_flush_countdown - 1;
		end if;

		if reset = '1' then
			rcb_state <= IDLE;
			storetag <= to_unsigned(0, storetag'length);
			nop_flush_countdown <= to_unsigned(FLUSH_LATENCY, nop_flush_countdown'length);
			fillstart_x <= xyutype(to_unsigned(0,xyutype'length));
			fillstart_x <= xyutype(to_unsigned(0,xyutype'length));
			lastfill <= '1';

			--various other registers don't need to be reset as staring state is IDLE
		else

			-- update the store tag if we wrote to cache. Also delay autoflush if cache is active.
			if buswen = '1' or pw = '1'then
				nop_flush_countdown <= to_unsigned(FLUSH_LATENCY, nop_flush_countdown'length);
				storetag <= requested_storetag;
			end if ;

			case( rcb_state ) is 

				when IDLE => 
					--always accept new command when in idle
					rcb_state <= compute_next_state(dbb);
					currcmd <= dbb;

				when drawpix =>

					--update finish point of current command to be used if we get a fill command
					fillstart_x <= unsigned(currcmd.x);
					fillstart_y <= unsigned(currcmd.y);

					-- update state if we are ready for next command
					if ready = '1' then
						rcb_state <= compute_next_state(dbb);
						currcmd <= dbb;
					end if ;

				when fill => 

					-- initalise the fill sequencing
					startxblock := fillstart_x(fillstart_x'left downto 2);
					startyblock := fillstart_y(fillstart_y'left downto 2);
					finalxblock := unsigned(currcmd.x(currcmd.x'left downto 2));
					finalyblock := unsigned(currcmd.y(currcmd.y'left downto 2));
					pixcorners_s(0) := fillstart_x(1 downto 0);
					pixcorners_s(1) := fillstart_y(1 downto 0);
					pixcorners_s(2) := unsigned(currcmd.x(1 downto 0));
					pixcorners_s(3) := unsigned(currcmd.y(1 downto 0));

					-- always fill from bottom left to top right
					if finalxblock < startxblock then
						swap_arrays(startxblock, finalxblock);
						swap_arrays(pixcorners_s(0), pixcorners_s(2));

					elsif finalxblock = startxblock and pixcorners_s(0) > pixcorners_s(2) then
						swap_arrays(pixcorners_s(0), pixcorners_s(2));
					end if ;

					if finalyblock < startyblock then
						swap_arrays(startyblock, finalyblock);
						swap_arrays(pixcorners_s(1), pixcorners_s(3));

					elsif finalyblock = startyblock and pixcorners_s(1) > pixcorners_s(3) then
						swap_arrays(pixcorners_s(1), pixcorners_s(3));
					end if ;

					pixcorners <= pixcorners_s;
					
					-- As we start from bottom left, we always will use the bottom left corner pixels
					pixcorner_in_currblock <= (others => '0');
					pixcorner_in_currblock(0) <= '1';
					pixcorner_in_currblock(1) <= '1';

					-- Figure out if the top right pixel is only one block wide/tall
					if startxblock = finalxblock then
						pixcorner_in_currblock(2) <= '1';
					end if;

					if startyblock = finalyblock then
						pixcorner_in_currblock(3) <= '1';
					end if;
					
					currxblock <= startxblock;
					curryblock <= startyblock;

					-- We have the possibility of a single block fill
					lastfill <= '0';
					if startxblock = finalxblock and startyblock = finalyblock then
						lastfill <= '1';
					end if;

					--update finish point of current command to be used if we get a fill command
					fillstart_x <= unsigned(currcmd.x);
					fillstart_y <= unsigned(currcmd.y);

					--Execute the fill!
					rcb_state <= do_fill;

				when do_fill =>

					if ready = '1' then

						-- If lastfill, then go to next state
						if lastfill = '1' then
							rcb_state <= compute_next_state(dbb);
							currcmd <= dbb;
						end if;
					  
					  	-- Step to next block in sequence
						currxblock_s := currxblock;
						curryblock_s := curryblock;
						if currxblock = finalxblock then
							currxblock_s := startxblock;
							curryblock_s := curryblock + to_unsigned(1, curryblock'length);
						else
							currxblock_s := currxblock + to_unsigned(1, currxblock'length);
						end if;

						-- Figure out if next cycle is the last one
						if currxblock_s = finalxblock and curryblock_s = finalyblock then
							lastfill <= '1';
						end if;

					end if ;

					-- Tell the combinatorial block which pixel corner to use
					pixcorner_in_currblock <= (others => '0');
					if currxblock_s = startxblock then
						pixcorner_in_currblock(0) <= '1';
					end if;

					if curryblock_s = startyblock then
						pixcorner_in_currblock(1) <= '1';
					end if;

					if currxblock_s = finalxblock then
						pixcorner_in_currblock(2) <= '1';
					end if;

					if curryblock_s = finalyblock then
						pixcorner_in_currblock(3) <= '1';
					end if;

					currxblock <= currxblock_s;
					curryblock <= curryblock_s;

				when move =>
					
					--update finish point of current command to be used if we get a fill command
					fillstart_x <= unsigned(currcmd.x);
					fillstart_y <= unsigned(currcmd.y);

					--move command always finishes in 1 cycle
					rcb_state <= compute_next_state(dbb);
					currcmd <= dbb;

				when others => NULL;
			
			end case ;

		end if;

	end process R1;


	-- Combinatorial block: Does all datapath logic

	dbb_delaycmd <= dbb.startcmd and not (ready and lastfill);
	rcb_finish <= ready and lastfill and not dbb.startcmd and not reset and is_same when nop_flush_countdown = to_unsigned(0, nop_flush_countdown'length) else '0';

	C1 : process(rcb_state, storetag, wen_all, start_rmw, delay_rmw, currcmd, pw, is_same, pixcorners, pixcorner_in_currblock, buswen, requested_storetag, curryblock, currxblock)
		variable startpix_x : unsigned(1 downto 0) ;
		variable startpix_y : unsigned(1 downto 0) ;
		variable endpix_x : unsigned(1 downto 0) ;
		variable endpix_y : unsigned(1 downto 0) ;
	begin

		--by default do not perform any operation or accept new commands
		pw <= '0';
		start_rmw <= '0';
		wen_all <= '0';
		buswen <= '0';
		ready <= '0';

		--as we per default do no operation, we dont care what the operands are
  		pixopin <= pixop_t(std_logic_vector'("--"));
  		pixnum <= to_unsigned(0, pixnum'length);
  		pixopbus <= (others => pixop_t(std_logic_vector'("--")));
  		requested_storetag <= to_unsigned(0, requested_storetag'length);
  		
		case( rcb_state ) is

			when IDLE =>
				ready <= '1';

				--take the opportunity to flush cache
				if is_same = '0' then
					start_rmw <= '1';
				end if;
				wen_all <= start_rmw and not delay_rmw;
		
			when drawpix|do_fill =>

				--compute requested tag
				case( rcb_state ) is
					when drawpix =>
						requested_storetag <= to_unsigned(an(xyutype(currcmd.x), xyutype(currcmd.y)), storetag'length);
					when do_fill =>
						requested_storetag <= curryblock & currxblock;
					when others => null;
				end case ;

				--figure out bounds of current fill block
				if pixcorner_in_currblock(0) = '1' then
					startpix_x := pixcorners(0);
				else
					startpix_x := to_unsigned(0, startpix_x'length);
				end if ;

				if pixcorner_in_currblock(1) = '1' then
					startpix_y := pixcorners(1);
				else
					startpix_y := to_unsigned(0, startpix_y'length);
				end if ;

				if pixcorner_in_currblock(2) = '1' then
					endpix_x := pixcorners(2);
				else
					endpix_x := to_unsigned(3, endpix_x'length);
				end if ;

				if pixcorner_in_currblock(3) = '1' then
					endpix_y := pixcorners(3);
				else
					endpix_y := to_unsigned(3, endpix_y'length);
				end if ;

				-- generate fill block
				pixopbus <= (others => same);
				fillloopy : for y in 0 to 4 loop
					fillloopx : for x in 0 to 4 loop
						if x >= startpix_x and x <= endpix_x and y >= startpix_y and y <= endpix_y then
							pixopbus((x mod 4) + 4 * (y mod 4)) <= pixop_t(currcmd.rcb_cmd(1 downto 0));
						end if ;
					end loop ; -- fillloopx
				end loop ; -- fillloopy

				-- flush cache if incomming command doesn't match cached word, but only if there are any operations to flush
				if not (storetag = requested_storetag) and is_same = '0' then
					start_rmw <= '1';
				end if;

				-- clear cache on sucessful RMW transfer
				wen_all <= start_rmw and not delay_rmw;

				-- store pixel command in cache if correct word is loaded, or if cache will be flushed or is clean
				if (storetag = requested_storetag) or wen_all = '1' or is_same = '1' then
					case( rcb_state ) is
						when do_fill => buswen <= '1';
						when drawpix => pw <= '1';
						when others => NULL;
					end case ;
				end if ;
				
				-- decode pixel address straight from command
				pixnum <= to_unsigned(pn(unsigned(currcmd.x), unsigned(currcmd.y)), pixnum'length);

				-- pass pixop straight from command
				pixopin <= pixop_t(currcmd.rcb_cmd(1 downto 0));
				
				-- we are ready for a new op if we wrote last pixel/busload to cache
				ready <= pw or buswen;
			
			when fill => 
				-- set ready to 0 to hold the command bus
				ready <= '0';

			when move =>
				-- move command captured in registered process, requires no logic
				ready <= '1';

			when others => NULL;
		
		end case ;

	end process C1;

end architecture arch;