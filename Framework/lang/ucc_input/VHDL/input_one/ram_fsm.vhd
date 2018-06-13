LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

package ram_fsm_pak is
	TYPE	state_t IS (m3, m2, m1, mx);
	
	function bool_to_std_logic(input : boolean) return std_logic;
	function delay_f(
		state: state_t;
		start: std_logic
		) return std_logic;
	function vwrite_f(state: state_t) return std_logic;
	function calc_output(
		state: state_t;
		start: std_logic
		)return std_logic_vector;
	function calc_next_state(
		state: state_t;
		start: std_logic;
		reset: std_logic
		) return state_t;
	
end package ram_fsm_pak;

package body ram_fsm_pak is

	function bool_to_std_logic(input : boolean) return std_logic is
	begin
		if (input) then return '1';
		else return '0';
		end if;
	end bool_to_std_logic;
	
	
	function vwrite_f(state: state_t) return std_logic is
	begin
		if state = m2 then return '1';
		else return '0';
		end if;
	end vwrite_f;
	
	
	function delay_f(
		state: state_t;
		start: std_logic
		) return std_logic is
	begin
	
		if not (state = mx or state = m3) then
			return start;
		else
			return '0';
		end if;
		
	end delay_f;
	
	
	function calc_output(
		state: state_t;
		start: std_logic
		) return std_logic_vector is
	begin
		return (delay_f(state, start), vwrite_f(state));
	end calc_output;
	
	
	function calc_next_state(
		state: state_t;
		start: std_logic;
		reset: std_logic
		) return state_t is
		
		variable next_state : state_t;
	begin
		
		--by default state stays the same
		next_state := state;
		
		CASE state IS
		
			WHEN mx =>
				if (start = '1') then
					next_state := m1;
				end if;
			WHEN m1 => next_state := m2;
			WHEN m2 => next_state := m3;
			WHEN m3 =>
				if (start = '1') then
					next_state := m1;
				else
					next_state := mx;
				end if;
			
		END CASE;
		
		--if reset is high, override the above with mx
		if (reset = '1') then
			next_state := mx;
		end if;
		
		return next_state;
	end calc_next_state;
	
end package body ram_fsm_pak;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use work.ram_fsm_pak.all;

ENTITY ram_fsm IS
	PORT(
		clk, reset, start : IN std_logic;
		delay, vwrite : OUT std_logic
	);
END ENTITY ram_fsm;

ARCHITECTURE synth OF ram_fsm IS
	SIGNAL state : state_t;
BEGIN

	-- Delay and vwwrite output is function of inputs and state
	(delay, vwrite) <= calc_output(state, start);
	
	-- The clocked process permutes the state using the appropriate inputs
	R1 : process
	begin
		WAIT UNTIL clk'event AND clk = '1';
		
		state <= calc_next_state(state, start, reset);
		
	end process R1;

END ARCHITECTURE synth;










