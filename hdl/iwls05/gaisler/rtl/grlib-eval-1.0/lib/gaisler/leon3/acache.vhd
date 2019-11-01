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
-- Entity:      acache
-- File:        acache.vhd
-- Author:      Jiri Gaisler - Gaisler Research
-- Description: Interface module between I/D cache controllers and Amba AHB
------------------------------------------------------------------------------  

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

entity acache is
  generic (
    hindex : integer range 0 to NAHBMST-1  := 0;
    ilinesize : integer range 4 to 8 := 4);
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    mcii   : in  memory_ic_in_type;
    mcio   : out memory_ic_out_type;
    mcdi   : in  memory_dc_in_type;
    mcdo   : out memory_dc_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    ahbso  : in  ahb_slv_out_vector    
  );
end;

architecture rtl of acache is

-- cache control register type

type reg_type is record
  bg    : std_ulogic; 	-- bus grant
  bo    : std_ulogic; 	-- bus owner
  ba    : std_ulogic;	-- bus active
  retry : std_ulogic;	-- retry/split pending
  werr  : std_ulogic;	-- write error
  lock  : std_ulogic;  
  hcache :  std_ulogic;
end record;

constant hconfig : ahb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_LEON3, 0, LEON3_VERSION, 0),
  others => zero32);

signal r, rin : reg_type;
begin

  comb : process(ahbi, r, rst, mcii, mcdi )

  variable v : reg_type;
  variable haddr   : std_logic_vector(31 downto 0);   -- address bus
  variable htrans  : std_logic_vector(1 downto 0);    -- transfer type 
  variable hwrite  : std_ulogic;  		      -- read/write
  variable hlock   : std_ulogic;  		      -- bus lock
  variable hsize   : std_logic_vector(2 downto 0);    -- transfer size
  variable hburst  : std_logic_vector(2 downto 0);    -- burst type
  variable hwdata  : std_logic_vector(31 downto 0);   -- write data
  variable hbusreq : std_ulogic;   -- bus request
  variable iready, dready : std_ulogic;   
  variable igrant, dgrant : std_ulogic;   
  variable iretry, dretry : std_ulogic;   
  variable ihcache, dhcache, dec_hcache : std_ulogic;   
  variable imexc, dmexc, nbo, dreq : std_ulogic;   
  variable su : std_ulogic;   

  begin

-- initialisation

    htrans := HTRANS_IDLE;
    v := r; iready := '0'; v.werr := '0';
    dready := '0'; igrant := '0'; dgrant := '0'; 
    imexc := '0'; dmexc := '0'; hlock := '0'; iretry := '0'; dretry := '0';
    ihcache := '0'; dhcache := '0'; su := '0'; --hcache := ahbi.hcache;
    v.lock := mcdi.lock;

-- generate AHB signals

    dreq := mcdi.req and (r.lock or not mcdi.lock or not r.bg); -- and not r.pwd;
    hbusreq := mcii.req or dreq;
    if hbusreq = '1' then htrans := HTRANS_NONSEQ; end if;
    hwdata := mcdi.data;
    nbo := (dreq and not (r.ba and mcii.req and not r.bo));
    dec_hcache := ahb_slv_dec_cache(mcdi.address, ahbso); 
    
    if nbo = '0' then
      haddr := mcii.address; hwrite := '0'; hsize := HSIZE_WORD; hlock := '0';
      su := mcii.su;
      if (mcii.req and r.ba and not r.bo and not r.retry) = '1' then
        htrans := HTRANS_SEQ; haddr(4 downto 2) := haddr(4 downto 2) +1;
        --hburst := HBURST_INCR; 
      end if;
      if mcii.burst = '1' then 
        if mcii.lburst = '1' then 
          if (ilinesize = 4) then hburst := HBURST_INCR4; else hburst := HBURST_INCR8; end if;
        else hburst := HBURST_INCR; end if;
      else hburst := HBURST_SINGLE; end if;      
      if (mcii.req and r.bg and ahbi.hready and not r.retry) = '1' 
      then igrant := '1'; v.hcache := ahbi.hcache; end if; 
    else
      haddr := mcdi.address; hwrite := not mcdi.read; hsize := '0' & mcdi.size;
      hlock := mcdi.lock;
      if mcdi.asi /= "1010" then su := '1'; else su := '0'; end if;
      if mcdi.burst = '1' then hburst := HBURST_INCR; 
      else hburst := HBURST_SINGLE; end if;
      if (dreq and r.ba and r.bo and not r.retry) = '1' then 
        htrans := HTRANS_SEQ; haddr(4 downto 2) := haddr(4 downto 2) +1;
        hburst := HBURST_INCR; 
      end if;
      if (dreq and r.bg and ahbi.hready and not r.retry) = '1' 
      then dgrant := '1'; v.hcache := dec_hcache; end if; 
    end if;
    if mcii.req = '0' then hlock := mcdi.lock; end if;

    if (r.ba = '1') and 
       ((ahbi.hresp = HRESP_RETRY) or (ahbi.hresp = HRESP_SPLIT))
    then v.retry := not ahbi.hready; else v.retry := '0'; end if;
      
    if r.retry = '1' then htrans := HTRANS_IDLE; end if;

    if r.bo = '0' then
      if r.ba = '1' then
	ihcache := r.hcache;
        if ahbi.hready = '1' then
	  case ahbi.hresp is
	  when HRESP_OKAY => iready := '1'; 
	  when HRESP_RETRY | HRESP_SPLIT=> iretry := '1'; 
	  when others => iready := '1'; imexc := '1';
	  end case;
        end if;
      end if;
    else
      if r.ba = '1' then
	dhcache := r.hcache;
        if ahbi.hready = '1' then
	  case ahbi.hresp is
	  when HRESP_OKAY => dready := '1'; 
	  when HRESP_RETRY | HRESP_SPLIT=> dretry := '1'; 
	  when others => dready := '1'; dmexc := '1'; v.werr := not mcdi.read;
	  end case;
        end if;
      end if;
      hlock := mcdi.lock;
    end if;

    -- decode cacheability

    if nbo = '1' and ((hsize = "011") or ((dec_hcache and mcdi.read) = '1')) then 
      hsize := "010"; haddr(1 downto 0) := "00";
    end if;

    if ahbi.hready = '1' then
      v.bo := nbo; v.bg := ahbi.hgrant(hindex);
      if (htrans = HTRANS_NONSEQ) or (htrans = HTRANS_SEQ) then
	v.ba := r.bg;
      else v.ba := '0'; end if;
    end if;

-- cache control and power-down handling

    -- cache freeze operation
--    if (r.cctrl.ifrz and iuo.intack and r.cctrl.ics(0)) = '1' then
--      v.cctrl.ics := "01";
--    end if;
--    if (r.cctrl.dfrz and iuo.intack and r.cctrl.dcs(0)) = '1' then
--      v.cctrl.dcs := "01";
--    end if;

--    if dsnoop = 1 then cctrl(23) := r.cctrl.dsnoop; end if;
--    cctrl(16 downto 14) := r.cctrl.ib & mcii.flush  &  mcdi.flush; 
--    cctrl(5 downto 0)   := r.cctrl.dfrz & r.cctrl.ifrz & r.cctrl.dcs & r.cctrl.ics;
--    cctrl(25 downto 24) := conv_std_logic_vector(DSETS-1, 2);
--    cctrl(27 downto 26) := conv_std_logic_vector(ISETS-1, 2);
--    if ISETS /= 1 then
--      if irepl = rnd then cctrl(29 downto 28) := "01"; end if;
--      if irepl = lrr then cctrl(29 downto 28) := "10"; end if;
--      if irepl = lru then cctrl(29 downto 28) := "11"; end if;
--    end if;
--    if DSETS /= 1 then
--      if drepl = rnd then cctrl(31 downto 30) := "01"; end if;
--      if drepl = lrr then cctrl(31 downto 30) := "10"; end if;
--      if drepl = lru then cctrl(31 downto 30) := "11"; end if;
--    end if;
  
    -- exit power-down in DSU debug mode
--    if dsu = 1 then 
--      v.pwd := v.pwd and (not iuo.ipend); -- and not iuo.debug.dbreak;
--    else v.pwd := v.pwd and not iuo.ipend; end if;


-- reset operation

    if rst = '0' then
      v.bg := '0'; v.bo := '0'; v.ba := '0'; v.retry := '0'; v.werr := '0';
    end if;

-- drive ports

    ahbo.haddr   <= haddr ;
    ahbo.htrans  <= htrans;
    ahbo.hbusreq <= hbusreq;
    ahbo.hwdata  <= hwdata;
    ahbo.hlock   <= hlock;
    ahbo.hwrite  <= hwrite;
    ahbo.hsize   <= hsize;
    ahbo.hburst  <= hburst;
    ahbo.hprot   <= "11" & su & nbo;
    ahbo.hindex  <= hindex;
    mcio.grant   <= igrant;
    mcio.ready   <= iready;
    mcio.mexc    <= imexc;
    mcio.retry   <= iretry;
    mcio.cache   <= ihcache;
    mcdo.grant   <= dgrant;
    mcdo.ready   <= dready;
    mcdo.mexc    <= dmexc;
    mcdo.retry   <= dretry;
    mcdo.werr    <= r.werr;
    mcdo.cache   <= dhcache;
    mcdo.ba      <= r.ba;
    mcdo.bg      <= r.bg;

    rin <= v;

  end process;

  mcio.data <= ahbi.hrdata; mcdo.data <= ahbi.hrdata;
  ahbo.hirq    <= (others => '0');
  ahbo.hconfig <= hconfig;

  reg : process(clk)
  begin if rising_edge(clk) then r <= rin; end if; end process;


end;

