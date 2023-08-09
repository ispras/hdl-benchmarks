----------------------------------------------
-- Pipelined Vector Cross Product Component --
--  C = A x B                               --
--  Performs a vector cross product in 2    --
--  clock cycles.  Synplify's pipeline      --
--  option should be enable to better       --
--  balance the pipeline cycles.            --
----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity crossproduct is 
  generic (
    widthA : natural := 32;
    widthB : natural := 32);
  port(
    Ax,Ay,Az : in std_logic_vector(widthA-1 downto 0);
    Bx,By,Bz : in std_logic_vector(widthB-1 downto 0);
    Cx,Cy,Cz : out std_logic_vector(widthA+widthB downto 0);
    clk      : in std_logic);
end;

architecture rtl of crossproduct is
signal AyBz, AzBy, AzBx : std_logic_vector(widthA+widthB-1 downto 0); 
signal AxBz, AxBy, AyBx : std_logic_vector(widthA+widthB-1 downto 0);	
begin
  process(clk)
  begin
    if (rising_edge(clk)) then
      AyBz <= Ay*Bz;
      AzBy <= Az*By;
      AzBx <= Az*Bx;
      AxBz <= Ax*Bz;
      AxBy <= Ax*By;
      AyBx <= Ay*Bx;

      Cx <= (AyBz(widthA+widthB-1) & AyBz) - (AzBy(widthA+widthB-1) & AzBy);
      Cy <= (AzBx(widthA+widthB-1) & AzBx) - (AxBz(widthA+widthB-1) & AxBz);
      Cz <= (AxBy(widthA+widthB-1) & AxBy) - (AyBx(widthA+widthB-1) & AyBx);
    end if;
  end process;
end rtl;
