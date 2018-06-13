LIBRARY IEEE;
LIBRARY WORK;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;               -- add unsigned, signed
USE work.pix_cache_pak.ALL;


package pix_word_cache_pak is

ALIAS slv IS std_logic_vector;
FUNCTION to_uint( x: slv) RETURN integer;
function invertop( x: pixop_t) return pixop_t;
constant all_same 	: store_t := (others => same);

end package pix_word_cache_pak;



package body pix_word_cache_pak is

	FUNCTION to_uint( x: slv) RETURN integer IS
	BEGIN
		RETURN to_integer(unsigned(x));
	END;
	
	function invertop( x: pixop_t) return pixop_t is
	begin
		case x is
			when same => return invert;
			when black => return white;
			when white => return black;
			when invert => return same;
			when others => return "XX";
		end case;
	end;

end package body pix_word_cache_pak;



LIBRARY IEEE;
LIBRARY WORK;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;               -- add unsigned, signed
USE work.pix_cache_pak.ALL;
USE work.pix_word_cache_pak.all;



ENTITY pix_word_cache IS


  PORT(
    clk, reset, pw, wen_all : IN  std_logic;
    pixnum                  : IN  std_logic_vector(3 DOWNTO 0);
    pixopin                 : IN  pixop_t;
    pixopbus				: in  store_t;
    buswen					: in  std_logic;
    store                   : OUT store_t;
    is_same                 : OUT std_logic
    );

END pix_word_cache;


ARCHITECTURE rtl OF pix_word_cache IS

	signal store_ram 	: store_t;

BEGIN

    --always drive store with contents of ram
	store <= store_ram;
	
	--simple combinatorial logic doesnt require a process
	is_same <= '1' when (store_ram = all_same) else '0';
	
	R1 : PROCESS
		variable temp_ram	: store_t;
	BEGIN
		WAIT UNTIL clk'EVENT AND clk = '1';
		
		--use a temp variable for ram so pw = 1, wen_all = 1 case can be done in 1 cycle
		temp_ram := store_ram;
		
		-- ram clear on reset and wen_all
		if reset = '1' or wen_all = '1' then
			temp_ram := all_same;
		end if;

		-- update pixel(s) if pw/buswen is asserted, but only if not in reset
		if reset = '0' then

			if buswen = '1'then
				busloop : for i in store_t'range loop
					case pixopbus(i) is
						when same 	=> NULL;
						when black 	=> temp_ram(i) := black;
						when white 	=> temp_ram(i) := white;
						when invert => temp_ram(i) := invertop(temp_ram(i));
						when others => NULL;
					end case;
				end loop ; -- busloop

			elsif pw = '1' then
				case pixopin is
					when same 	=> NULL;
					when black 	=> temp_ram(to_uint(pixnum)) := black;
					when white 	=> temp_ram(to_uint(pixnum)) := white;
					when invert => temp_ram(to_uint(pixnum)) := invertop(temp_ram(to_uint(pixnum)));
					when others => NULL;
				end case;

			end if ;
		end if ;
		
		-- drive output
		store_ram <= temp_ram;
		
	END PROCESS R1;
	
END ARCHITECTURE rtl;





