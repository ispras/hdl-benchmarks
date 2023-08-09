library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity matmult is 
  generic (
    widthA : natural := 16;
    widthB : natural := 16);
  port(
    Ax,Ay,Az : in std_logic_vector(widthA-1 downto 0);
    m11,m12,m13 : in std_logic_vector(widthB-1 downto 0);
    m21,m22,m23 : in std_logic_vector(widthB-1 downto 0);
    m31,m32,m33 : in std_logic_vector(widthB-1 downto 0);
    Cx,Cy,Cz : out std_logic_vector(widthA-1 downto 0);
    clk      : in std_logic);
end;

architecture rtl of matmult is
signal am11,am12,am13 : std_logic_vector(widthA+widthB-1 downto 0); 
signal am21,am22,am23 : std_logic_vector(widthA+widthB-1 downto 0); 
signal am31,am32,am33 : std_logic_vector(widthA+widthB-1 downto 0); 
signal Cx_1,Cy_1,Cz_1 : std_logic_vector(widthA+widthB-1 downto 0);

begin
  process(clk)
  begin
    if (rising_edge(clk)) then
      am11 <= Ax * m11;
      am12 <= Ay * m12;
      am13 <= Az * m13;
      am21 <= Ax * m21;
      am22 <= Ay * m22;
      am23 <= Az * m23;
      am31 <= Ax * m31;
      am32 <= Ay * m32;
      am33 <= Az * m33;
      
	  Cx_1 <= (am11 + am12 + am13); 
      Cx <= Cx_1(widthA+widthB-2 downto widthB-1);
	  Cy_1 <= (am21 + am22 + am23) ;
      Cy <= Cy_1(widthA+widthB-2 downto widthB-1);
	  Cz_1 <= (am31 + am32 + am33) ;
      Cz <= Cz_1(widthA+widthB-2 downto widthB-1);
	end if;
  end process;
end rtl;
