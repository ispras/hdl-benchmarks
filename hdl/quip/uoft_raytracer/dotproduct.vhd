--------------------------------------------
-- Pipelined Vector Dot Product Component --
--  C = A . B                             --
--  Performs a vector cross product in 2  --
--  clock cycles.  Synplify's pipeline    --
--  option should be enable to better     --
--  balance the pipeline cycles.          --
--------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity dotproduct is 
  generic (
    widthA : natural := 32;
    widthB : natural := 32);
  port(
    Ax,Ay,Az : in std_logic_vector(widthA-1 downto 0);
    Bx,By,Bz : in std_logic_vector(widthB-1 downto 0);
    C        : out std_logic_vector(widthA+widthB+1 downto 0);
    clk      : in std_logic);
end;

architecture rtl of dotproduct is
signal AxBx, AyBy, AzBz : std_logic_vector(widthA+widthB-1 downto 0);
begin
  process(clk)
  begin
    if (rising_edge(clk)) then
      AxBx <= Ax*Bx;
      AyBy <= Ay*By;
      AzBz <= Az*Bz;
      C <= (AxBx(widthA+widthB-1) & AxBx(widthA+widthB-1) & AxBx) + 
           (AyBy(widthA+widthB-1) & AyBy(widthA+widthB-1) & AyBy) + 
           (AzBz(widthA+widthB-1) & AzBz(widthA+widthB-1) & AzBz);
    end if;
  end process;
end rtl;
