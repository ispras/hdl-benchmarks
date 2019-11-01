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
-- Entity: 	syncram_2p
-- File:	syncram_2p.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	syncronous 2-port ram with tech selection
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

entity syncram_2p is
  generic (tech : integer := 0; abits : integer := 6; dbits : integer := 8;
	sepclk : integer := 0; wrfst : integer := 0);
  port (
    rclk     : in std_ulogic;
    renable  : in std_ulogic;
    raddress : in std_logic_vector((abits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    wclk     : in std_ulogic;
    write    : in std_ulogic;
    waddress : in std_logic_vector((abits -1) downto 0);
    datain   : in std_logic_vector((dbits -1) downto 0));
end;

architecture rtl of syncram_2p is
signal vcc, gnd : std_ulogic;
signal vgnd : std_logic_vector(dbits-1 downto 0);
signal write2, renable2 : std_ulogic;
signal datain2 : std_logic_vector((dbits-1) downto 0); 
begin

  vcc <= '1'; gnd <= '0'; vgnd <= (others => '0');

  inf : if tech = inferred generate 
    u0 : generic_syncram_2p generic map (abits, dbits, sepclk)
         port map (rclk, wclk, raddress, waddress, datain, write, dataout);
  end generate;

  xcv : if tech = virtex generate 
    u0 : virtex_syncram_dp generic map (abits, dbits)
         port map (wclk, waddress, datain, open, write, write, 
                   rclk, raddress, vgnd, dataout, renable, gnd);
  end generate;

  xc2v : if (tech = virtex2) or (tech = spartan3)  generate
    nowf: if wrfst = 0 generate 
      write2 <= '0'; renable2 <= renable; datain2 <= (others => '0');
    end generate;
    
    wf : if wrfst = 1 generate
      write2 <= '0' when (waddress /= raddress) else write;
      renable2 <= renable or write2; datain2 <= datain;
    end generate;

    u0 : virtex2_syncram_dp generic map (abits, dbits)
         port map (wclk, waddress, datain, open, write, write, 
                   rclk, raddress, datain2, dataout, renable2, write2);
  end generate;  

  vir  : if tech = memvirage generate 
    u0 : virage_syncram_dp generic map (abits, dbits)
         port map (wclk, waddress, datain, open, write, write, 
                   rclk, raddress, vgnd, dataout, renable, gnd);
  end generate;

  axc  : if tech = axcel generate 
    u0 : axcel_syncram_2p generic map (abits, dbits)
         port map (rclk, renable, raddress, dataout, 
		   wclk, waddress, datain, write);
  end generate;

  proa : if tech = proasic generate 
    u0 : proasic_syncram_2p generic map (abits, dbits)
         port map (rclk, renable, raddress, dataout, 
		   wclk, waddress, datain, write);
  end generate;

  proa3 : if tech = proasic3 generate 
    u0 : proasic3_syncram_2p generic map (abits, dbits)
         port map (rclk, renable, raddress, dataout, 
		   wclk, waddress, datain, write);

  end generate;

  ihp : if tech = ihp25 generate
    u0 : generic_syncram_2p generic map (abits, dbits, sepclk)
         port map (rclk, wclk, raddress, waddress, datain, write, dataout);
  end generate; 

end;

