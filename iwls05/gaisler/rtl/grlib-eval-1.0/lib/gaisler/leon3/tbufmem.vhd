-----------------------------------------------------------------------------
-- Entity: 	tbufmem
-- File:	tbufmem.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	128-bit trace buffer memory (CPU/AHB)
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.libiu.all;
use gaisler.memory.all;
library grlib;
use grlib.stdlib.all;

entity tbufmem is
  generic (
    tech   : integer := 0;
    tbuf   : integer := 0 -- trace buf size in kB (0 - no trace buffer)
    );
  port (
    clk : in std_ulogic;
    di  : in tracebuf_in_type;
    do  : out tracebuf_out_type);
end;

architecture rtl of tbufmem is

constant ADDRBITS : integer := 10 + log2(tbuf) - 4;
  
begin
  mem0 : for i in 0 to 3 generate
    ram0 : syncram generic map ( tech => tech, abits => addrbits, dbits => 32   )
      port map ( clk, di.addr(addrbits-1 downto 0), di.data(((i*32)+31) downto (i*32)),
                 do.data(((i*32)+31) downto (i*32)), di.enable,di.write(i));
  end generate;
end;
  
