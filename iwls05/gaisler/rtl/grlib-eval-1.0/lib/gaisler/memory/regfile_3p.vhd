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
-- Entity: 	regfile_3p
-- File:	regfile_3p.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	3-port regfile implemented with two 2-port rams
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.memory.all;
use gaisler.mem_gen.all;

entity regfile_3p is
  generic (tech : integer := 0; abits : integer := 6; dbits : integer := 8;
           wrfst : integer := 0; numregs : integer := 64);
  port (
    wclk   : in  std_ulogic;
    waddr  : in  std_logic_vector((abits -1) downto 0);
    wdata  : in  std_logic_vector((dbits -1) downto 0);
    we     : in  std_ulogic;
    rclk   : in  std_ulogic;
    raddr1 : in  std_logic_vector((abits -1) downto 0);
    re1    : in  std_ulogic;
    rdata1 : out std_logic_vector((dbits -1) downto 0);
    raddr2 : in  std_logic_vector((abits -1) downto 0);
    re2    : in  std_ulogic;
    rdata2 : out std_logic_vector((dbits -1) downto 0)
  );
end;

architecture rtl of regfile_3p is
  
constant rfinfer : boolean := (regfile_3p_infer(tech) = 1);
begin
  
  s0 : if rfinfer generate
   rhu : generic_regfile_3p generic map (tech, abits, dbits, wrfst, numregs)
   port map ( wclk, waddr, wdata, we, rclk, raddr1, re1, rdata1, raddr2, re2, rdata2);
  end generate;

  s1 : if not rfinfer generate
    u0 : syncram_2p generic map (tech, abits, dbits, 0, wrfst)
      port map (rclk, re1, raddr1, rdata1, wclk, we, waddr, wdata);
    u1 : syncram_2p generic map (tech, abits, dbits, 0, wrfst)
      port map (rclk, re2, raddr2, rdata2, wclk, we, waddr, wdata);
  end generate;

end;

