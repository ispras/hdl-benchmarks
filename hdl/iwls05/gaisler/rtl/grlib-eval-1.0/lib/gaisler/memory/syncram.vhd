----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2004 GAISLER RESEARCH
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  See the file COPYING for the full details of the license.
--
-----------------------------------------------------------------------------
-- Entity: 	syncram
-- File:	syncram.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	syncronous 1-port ram with tech selection
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.memory.all;
use gaisler.mem_xilinx.all;
use gaisler.mem_virage.all;
use gaisler.mem_actel.all;
use gaisler.mem_gen.all;
use gaisler.mem_umc.all;
use gaisler.mem_ihp25.all; 
  
entity syncram is
  generic (tech : integer := 0; abits : integer := 6; dbits : integer := 8 );
  port (
    clk      : in std_ulogic;
    address  : in std_logic_vector((abits -1) downto 0);
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    enable   : in std_ulogic;
    write    : in std_ulogic); 
end;

architecture rtl of syncram is
begin

  inf : if tech = inferred generate 
    u0 : generic_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, write);
  end generate;

  xcv : if tech = virtex generate 
    u0 : virtex_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write);
  end generate;

  xc2v : if (tech = virtex2) or (tech = spartan3) generate 
    u0 : virtex2_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write);
  end generate;

  vir  : if tech = memvirage generate 
    u0 : virage_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write);
  end generate;

  axc  : if tech = axcel generate 
    u0 : axcel_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write);
  end generate;

  proa : if tech = proasic generate 
    u0 : proasic_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write);
  end generate;

  rhu  : if tech = rhumc generate 
    u0 : rhumc_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write);
  end generate;

  proa3 : if tech = proasic3 generate 
    u0 : proasic3_syncram generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write);
  end generate;

  ihp : if tech = ihp25 generate
    u0 : ihp25_syncram generic map(abits, dbits)
         port map(clk, address, datain, dataout, enable, write);
  end generate; 
end;

