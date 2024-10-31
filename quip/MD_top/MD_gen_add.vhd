------------------------------------------------------------------------------
-- Generic unsigned adder
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MD_gen_add is
   generic (
      INTEGER_SIZE : integer := 32
   );
   port (
      a_in     : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
      b_in     : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
      output   : out std_logic_vector(INTEGER_SIZE-1 downto 0);
      overflow : out std_logic
   );
end MD_gen_add;

architecture rtl of MD_gen_add is
   signal sum : std_logic_vector(INTEGER_SIZE downto 0);
begin
   -- Calculate sum and check for overflow
   sum      <= ("0" & a_in) + ("0" & b_in);
   output   <= sum(INTEGER_SIZE-1 downto 0);
   overflow <= sum(INTEGER_SIZE);
end rtl;
