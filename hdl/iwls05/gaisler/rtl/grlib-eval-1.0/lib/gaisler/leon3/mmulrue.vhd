----------------------------------------------------------------------------
--  This file is a part of the LEON VHDL model
--  Copyright (C) 2003  Gaisler Research, all rights reserved
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2 of the License, or (at your option) any later version.
--
--  See the file COPYING.LGPL for the full details of the license.
----------------------------------------------------------------------------

-- Konrad Eisele<eiselekd@web.de> ,2002  

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.devices.all;
use gaisler.libiu.all;
use gaisler.libcache.all;
use gaisler.leon3.all;
use gaisler.mmuconfig.all;
use gaisler.mmuiface.all;

entity mmulrue is
  generic (
    position : integer;
    entries  : integer := 8 );
  port (
    rst    : in std_logic;
    clk    : in std_logic;
    lruei  : in mmulrue_in_type;
    lrueo  : out mmulrue_out_type );
end mmulrue;

architecture rtl of mmulrue is

  constant entries_log : integer := log2(entries);  
  type lru_rtype is record
    pos      : std_logic_vector(entries_log-1 downto 0);
    movetop  : std_logic;
    -- pragma translate_off
    dummy  : std_logic;
    -- pragma translate_on
  end record;

  signal c,r   : lru_rtype;
begin  
  
  p0: process (clk, rst, r, c, lruei)
    variable v : lru_rtype;
  begin
    v := r;
    -- #init

    if (r.movetop and (not lruei.fromleft)) = '1' then
      v.pos := lruei.left(entries_log-1 downto 0); 
      v.movetop := '0';
    elsif (lruei.fromright) = '1' then
      v.pos := lruei.right(entries_log-1 downto 0);
      v.movetop := not lruei.clear;
    end if;

    if (lruei.touch and not lruei.clear) = '1' then  -- touch request
      if (v.pos = lruei.pos(entries_log-1 downto 0)) then     -- check
          v.movetop := '1';
      end if;
    end if;

    if (rst) = '0' then
      v.pos := conv_std_logic_vector(position, entries_log);
      v.movetop := '0';
    end if;
    
    --# Drive signals
    lrueo.pos(entries_log-1 downto 0) <= r.pos; 
    lrueo.movetop <= r.movetop;
    
    c <= v;
  end process p0;

  p1: process (clk)
  begin if rising_edge(clk) then r <= c; end if;
  end process p1;

end rtl;








