----------------------------------
-- Vector Mux Component         --
--  C = A when ABn = '1' else B --
----------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity vectexchange is 
  generic (
    width : natural := 32);
  port(
    Ax,Ay,Az : in std_logic_vector(width-1 downto 0);
    Bx,By,Bz : in std_logic_vector(width-1 downto 0);
    Cx,Cy,Cz : out std_logic_vector(width-1 downto 0);
    ABn : in std_logic);
end;

architecture rtl of vectexchange is
begin
  Cx <= Ax when (ABn = '1') else Bx;
  Cy <= Ay when (ABn = '1') else By;
  Cz <= Az when (ABn = '1') else Bz;
end rtl;
