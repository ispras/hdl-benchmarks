----------------------------------
-- Scalar Mux Component         --
--  C = A when ABn = '1' else B -- 
----------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity exchange is 
  generic (
    width : natural := 32);
  port(
    A : in std_logic_vector(width-1 downto 0);
    B : in std_logic_vector(width-1 downto 0);
    C : out std_logic_vector(width-1 downto 0);
    ABn : in std_logic);
end;

architecture rtl of exchange is
begin
  C <= A when (ABn = '1') else B;
end rtl;
