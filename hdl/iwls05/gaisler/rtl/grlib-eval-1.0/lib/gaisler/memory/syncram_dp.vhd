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
-- Entity: 	syncram_dp
-- File:	syncram_dp.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	syncronous dual-port ram with tech selection
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

entity syncram_dp is
  generic (tech : integer := 0; abits : integer := 6; dbits : integer := 8 );
  port (
    clk1     : in std_ulogic;
    address1 : in std_logic_vector((abits -1) downto 0);
    datain1  : in std_logic_vector((dbits -1) downto 0);
    dataout1 : out std_logic_vector((dbits -1) downto 0);
    enable1  : in std_ulogic;
    write1   : in std_ulogic;
    clk2     : in std_ulogic;
    address2 : in std_logic_vector((abits -1) downto 0);
    datain2  : in std_logic_vector((dbits -1) downto 0);
    dataout2 : out std_logic_vector((dbits -1) downto 0);
    enable2  : in std_ulogic;
    write2   : in std_ulogic); 
end;

architecture rtl of syncram_dp is
begin

-- pragma translate_off
  inf : if has_dpram(tech) = 0 generate 
    x : process
    begin
      assert false
      report  "Dual-port RAM not supported for selected technology"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on

  xcv : if tech = virtex generate 
    u0 : virtex_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1, enable1, write1, 
                   clk2, address2, datain2, dataout2, enable2, write2);
  end generate;

  xc2v : if (tech = virtex2) or (tech = spartan3) generate 
    u0 : virtex2_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1, enable1, write1, 
                   clk2, address2, datain2, dataout2, enable2, write2);
  end generate;

  vir  : if tech = memvirage generate 
    u0 : virage_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1, enable1, write1, 
                   clk2, address2, datain2, dataout2, enable2, write2);
  end generate;

  pa3  : if tech = proasic3 generate 
    u0 : proasic3_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1, enable1, write1, 
                   clk2, address2, datain2, dataout2, enable2, write2);
  end generate;
  
end;

