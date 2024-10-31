-----------------------------------------
-- Signed Vector Subtraction Component --
--   C = A - B                         --
--   The output, C, is latched         --
-----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity vectsub is 
  generic (
    width : natural := 32);
  port(
    Ax,Ay,Az : in std_logic_vector(width-1 downto 0);
    Bx,By,Bz : in std_logic_vector(width-1 downto 0);
    Cx,Cy,Cz : out std_logic_vector(width downto 0);
    clk      : in std_logic);
end;

architecture rtl of vectsub is
begin
  process(clk)
  begin
    if (rising_edge(clk)) then
      Cx <= (Ax(width-1) & Ax) - (Bx(width-1) & Bx);
      Cy <= (Ay(width-1) & Ay) - (By(width-1) & By);
      Cz <= (Az(width-1) & Az) - (Bz(width-1) & Bz);
    end if;
  end process;
end rtl;
