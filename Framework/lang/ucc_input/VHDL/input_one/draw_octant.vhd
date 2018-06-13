-- Thomas Clarke 2013
-- draw-octant entity modified for variable size vectors
-- used in VHDL & Logic Synthesis Coursework

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY draw_octant IS
  GENERIC( vsize: INTEGER := 12); -- length of vectors
  PORT(
    clk, enable, resetx, draw, xbias : IN  std_logic;
    xin, yin                 : IN  std_logic_vector(vsize-1 DOWNTO 0);
    done                     : OUT std_logic;
    x, y                     : OUT std_logic_vector(vsize-1 DOWNTO 0)
    );
END ENTITY draw_octant;

ARCHITECTURE comb OF draw_octant IS

  SIGNAL done1                    : std_logic; -- internal done
  SIGNAL x1, y1                   : unsigned(vsize-1 DOWNTO 0); -- internal x,y
  SIGNAL xincr, yincr, xnew, ynew : unsigned(vsize-1 DOWNTO 0);
  -- note on vector sizes. err1,err2 must be one bit larger to preserved signed error info
  -- error is always adjusted to minimise signed error and therefore 
  -- can never be larger than vsize bits even though also signed
  SIGNAL error                    : signed(vsize DOWNTO 0);
  SIGNAL err1, err2               : signed(vsize+1 DOWNTO 0);

-- OPERATION
--
-- line drawing is initialted by asserting resetx and draw in successive cycles.
-- this loads the initial and final coordinates of the line to be drawn into
-- (x,y) and xnew,ynew0 respectively
-- drawing must be in ENE octant which implies xincr >= 0, yincr >= 0, xincr >= yincr
-- here xincr = x - xnew, yincr = y - ynew
--
-- Through the drawing process (x,y) represent a new point to be plotted on line each cycle.
-- error represents the signed
--
-- xbias determines whether line goes in x direction or xy direction when both directions have
-- equal offset from the true line.
--
-- done is asserted in the final cycle when x=xnew, y=ynew.

--NOTES ON DATA STRUCTURES
-- The basic data here is a (x,y) coordinate
-- it would make sense to use a record type for this:
-- TYPE coord IS RECORD x,y: std-logic_vector(vsize-1 DOWNTO 0) END RECORD;
-- then decalre internal datas tructures of type coord.
-- the result would be neater, and for example testing the end condition could 
-- be equality on records which works (like equality on arrays)


BEGIN

  x    <= std_logic_vector(x1);
  y    <= std_logic_vector(y1);
  done <= done1;

  C1 : PROCESS(error, xincr, yincr, x1, y1, xnew, ynew, resetx, draw)
    
  BEGIN

    err1 <= abs(resize(error, err1'length) + signed('0' & yincr)); --todo: vsize+1 size

    err2 <= abs(resize(error, err2'length) + signed('0' & yincr) - signed('0' & xincr)); --todo: vsize+2 size?

    done1 <= '0';
    IF x1=xnew and y1=ynew and resetx = '0' and draw = '0' THEN
      done1 <= '1';
    END IF;

  END PROCESS C1;

  R1 : PROCESS
  BEGIN
    WAIT UNTIL clk'event AND clk = '1';
    if enable='1' then
      IF resetx = '1' THEN
        x1    <= unsigned(xin);
        y1    <= unsigned(yin);
        xincr <= (OTHERS => '0');
        yincr <= (OTHERS => '0');
        xnew  <= unsigned(xin);
        ynew  <= unsigned(yin);
        error <= (OTHERS => '0');
        
      ELSIF draw = '1' THEN
        xincr <= unsigned(xin)-x1; --todo: vsize  or vsize-1? always positive so can actually fit into vsize-1 if xincr, yincr are unsigned?
        yincr <= unsigned(yin)-y1;
        xnew  <= unsigned(xin);
        ynew  <= unsigned(yin);
        
      ELSIF done1 = '1' THEN
        NULL;                             -- do nothing more
        
      ELSIF err1 > err2 OR (err1 = err2 AND xbias = '0') THEN
        -- draw new pizel in diagonal direction
        y1    <= y1 + 1;
        x1    <= x1 + 1;
        error <= error + signed('0' & yincr) - signed('0' & xincr);
        
      ELSIF err1 < err2 OR (err1 = err2 AND xbias = '1') THEN
        -- draw new pixel in x direction
        x1    <= x1 + 1;
        error <= error + signed('0' & yincr);
      END IF;
    end if;
  END PROCESS R1;

END ARCHITECTURE comb;
