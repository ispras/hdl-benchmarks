-------------------------------------------------------
-- Signal Ported Ram Modual                          --
--                                                   --
--  - Synplify should infer ram from the coding style--
--  - The depth of the ram is equal to 2**depth      --
--                                                   --
-------------------------------------------------------
-- Further Reading: RAM Inferencing with Synplify
-- http://www.synplicity.com/literature/pdf/ram_inferencing.pdf


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity spram is 
  generic(
    width : natural := 16;
    depth : natural := 4);
  port(
    we : in std_logic;
    addr : in std_logic_vector(depth-1 downto 0);
    dataout : out std_logic_vector(width-1 downto 0);
    datain  : in  std_logic_vector(width-1 downto 0);
    clk : in std_logic);
end;

architecture rtl of spram is
  type memarray is array(2**depth-1 downto 0) of 
      std_logic_vector(width-1 downto 0);
 
  signal mem : memarray;
begin
  dataout <= mem(conv_integer(addr));

  process(clk,we,addr)
  begin
    if (rising_edge (clk)) then
      if (we = '1') then
        mem(conv_integer(addr)) <= datain;
      end if;
    end if;
  end process;

end rtl;
