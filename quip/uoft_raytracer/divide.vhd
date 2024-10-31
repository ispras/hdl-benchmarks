--------------------------------------------------
-- Parameterized Fixed Point Divide Componenent --
--                                              --
--  Qout = (A / B)*2^widthfrac                  --
--                                              --
--  Performs unsigned fixed point addition      --
--  between 2 numbers.  The divide is pipelined --
--  such that 1 quotient bit is generated per   --
--  clock cycle. The throughput is one divide   --
--  per cycle for any size input.               --
--                                              --
--  widthOut specified the total output widht   --
--  widthFrac specifies how many of the output  --
--            bits are infact fractional        --
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity divide is 
  generic (
    widthA    : natural := 64; 
    widthOut  : natural := 32;  -- Width of the output
    widthB    : natural := 64; 
    widthFrac : natural := 15); -- Fraction bits in output
  port(
    A : in std_logic_vector(widthA-1 downto 0);
    B : in std_logic_vector(widthB-1 downto 0);
    Qout : out std_logic_vector(widthOut-1 downto 0);
    clk : in std_logic);
end;

architecture rtl of divide is 
  type stdlogicarrayn is array(0 to widthOut-1) of std_logic_vector(widthA+widthFrac-1 downto 0);
  type stdlogicarraym is array(0 to widthOut-1) of std_logic_vector(widthOut-1 downto 0);
  type stdlogicarrayo is array(0 to widthOut-1) of std_logic_vector(widthB-1 downto 0);

  signal c : stdlogicarrayn;
  signal q : stdlogicarraym;
  signal bp : stdlogicarrayo;
  signal ca : std_logic_vector (widthA+widthFrac-1 downto 0);

begin
  c(0)(widthA+widthFrac-1 downto widthFrac) <= A;
  c(0)(widthFrac-1 downto 0) <= (others => '0');
  q(0) <= (others => '0');
  bp(0) <= B;

  process (clk)
  begin
    if (clk'event and clk = '1') then
      row: for k in 0 to widthOut-2 loop
      
	  
	     if (c(k)(widthA+widthFrac-1 downto widthOut-1-k)-bp(k) >= 0) then
            q(k+1) <= q(k)(widthOut-2 downto 0) & '1';
         
		 
            
		    ca (widthA+widthFrac-1 downto widthOut-1-k) <= c(k)(widthA+widthFrac-1 downto widthOut-1-k)-bp(k);
         
		 	ca (widthOut-2-k downto 0) <= (others => '0');
			
			
			c(k+1) <= ca(k+(widthA-widthOut)+widthFrac downto 0) & 
                      c(k)(widthOut-k-2 downto 0);
         
		 
		 
		 
		 --	c(k+1) <= (c(k)(widthA+widthFrac-1 downto widthOut-1-k)-bp(k))(k+(widthA-widthOut)+widthFrac downto 0) & 
         --             c(k)(widthOut-k-2 downto 0);	 	

		 	
		 
		 else
            q(k+1) <= q(k)(widthOut-2 downto 0) & '0';
            c(k+1) <= c(k);
         end if;
         bp(k+1) <= bp(k);
      end loop row;
    
      if (c(widthOut-1)-bp(widthOut-1) >= 0) then
        Qout <= q(widthOut-1)(widthOut-2 downto 0) & '1';
      else
        Qout <= q(widthOut-1)(widthOut-2 downto 0) & '0';
      end if;
  
    end if;
  end process;
end rtl;
