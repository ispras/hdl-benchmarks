library ieee;
use ieee.std_logic_1164.all;

entity delay is 
  generic (
    width : natural := 32;
    depth : natural := 8);
  port(
    datain  : in std_logic_vector(width-1 downto 0);
    dataout : out std_logic_vector(width-1 downto 0);
    clk     : in std_logic);
end;

architecture rtl of delay is
  type delayarray is array (0 to depth-1) of std_logic_vector (width-1 downto 0);

  signal buff : delayarray;
begin
  dataout <= buff(depth-1);

  process(clk)
  begin
    if (rising_edge (clk)) then
      buff(0) <= datain;
      if (depth > 1) then
        row : for k in 0 to depth-2 loop
          buff(k+1) <= buff(k);
        end loop row;
      end if;
    end if;
  end process;
end rtl;
