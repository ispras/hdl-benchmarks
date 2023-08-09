-------------------------------------------------------
-- Single Ported Ram Modual w/Registered Output      --
--  - Synpify should infer ram from the coding style --
--  - Depth is the number of bits of address         --
--    the true depth is 2**depth                     --
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--library synplify;
--use synplify.attributes.all;

entity spramblock is 
  generic(
    width : natural := 16;
    depth : natural := 8);
  port(
    we : in std_logic;
    addr : in std_logic_vector(depth-1 downto 0);
    datain  : in std_logic_vector(width-1 downto 0);
    dataout  : out std_logic_vector(width-1 downto 0);
    clk : in std_logic);
end;
	
architecture rtl of spramblock is
  type memarray is array(2**depth-1 downto 0) of std_logic_vector(width-1 downto 0);
 
  signal raddr : std_logic_vector(depth-1 downto 0);
  signal mem : memarray;

--  attribute syn_ramstyle : string;
--  attribute syn_ramstyle of mem : signal is "no_rw_check";

begin
  dataout <= mem(conv_integer(raddr));

  process(clk,we,addr)
  begin
    if (rising_edge (clk)) then
      raddr <= addr;
      if (we = '1') then
        mem(conv_integer(addr)) <= datain;
      end if;
    end if;
  end process;

end rtl;
