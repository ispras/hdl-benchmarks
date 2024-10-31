--------------------------------------------
-- Variable Combinational Shift Component --
--                                        --
--  B = A shifted left by specified amt   --
--                                        --
--  Factor   Bits Shifted Right           --
--    00      0    1                      --
--    01      4    1/16                   --
--    10      8    1/256                  --
--    11      12   1/4096                 --
--------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity shifter is 
  generic (
    width : natural := 32);
  port(
    A   : in std_logic_vector(width-1 downto 0);
    B   : out std_logic_vector(width-1 downto 0);
    factor : in std_logic_vector(1 downto 0));
end;

architecture rtl of shifter is
begin
  process (factor,A) 
  begin
    case (factor) is 
      when "00" => B <= A;
      when "01" => B <= "0000" & A(width-1 downto 4);
      when "10" => B <= "00000000" & A(width-1 downto 8);
      when others => B <= "000000000000" & A(width-1 downto 12);
    end case;
  end process;
end rtl;
