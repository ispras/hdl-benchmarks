-------------------------------------------------------
-- Dual Ported Ram Modual w/Registered Output        --
--  - Synpify should infer ram from the coding style --
--  - The virtex distributed ram is 1bitx16          --
--  - Uses approximately 2 LUTs per bit wide         --
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity dpram is 
  generic(
    width : natural := 16);
  port(
    we : in std_logic;
    raddr, waddr : in std_logic_vector(3 downto 0);
    dataout : out std_logic_vector(width-1 downto 0);
    datain  : in  std_logic_vector(width-1 downto 0);
    clk : in std_logic);
end;

architecture rtl of dpram is
  type memarray is array(15 downto 0) of std_logic_vector(width-1 downto 0);
 
  signal mem : memarray;
  signal data : std_logic_vector(width-1 downto 0);
begin
  data <= mem(conv_integer(raddr));

  process(clk,we,waddr)
  begin
    if (rising_edge (clk)) then
      dataout <= data;
      if (we = '1') then
        mem(conv_integer(waddr)) <= datain;
      end if;
    end if;
  end process;

end rtl;
