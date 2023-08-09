-------------------------------------------
-- Variable Length Vector Shift Register --
--  Provides a specified number of       --
--  clock cycle delay for a 3 signals    --
-------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity vectdelay is 
  generic (
    width : natural := 32;
    depth : natural := 8);
  port(
    xin,yin,zin : in std_logic_vector(width-1 downto 0);
    xout,yout,zout : out std_logic_vector(width-1 downto 0);
    clk      : in std_logic);
end;

architecture rtl of vectdelay is
  type delayarray is array(0 to depth-1) of std_logic_vector(width-1 downto 0);

  signal bufferx : delayarray;
  signal buffery : delayarray;
  signal bufferz : delayarray;
begin
  xout <= bufferx(depth-1);
  yout <= buffery(depth-1);
  zout <= bufferz(depth-1);

  process(clk)
  begin
    if (rising_edge(clk)) then
      bufferx(0) <= xin;
      buffery(0) <= yin;
      bufferz(0) <= zin;
      if (depth > 1) then
        row : for k in 0 to depth-2 loop
          bufferx(k+1) <= bufferx(k);
          buffery(k+1) <= buffery(k);
          bufferz(k+1) <= bufferz(k);
        end loop row;
      end if;
    end if;
  end process;
end rtl;
