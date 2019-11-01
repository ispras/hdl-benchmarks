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
-- Entity: 	edcl
-- File:	edcl.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Ethernet debug communication link
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.misc.all;
use gaisler.net.all;
use work.grcomp.all;

entity edcl is
  generic (
      mstndx        : integer := 0;
      macaddrh      : integer := 16#00005e#;
      macaddrl      : integer := 16#000000#;
      ipaddrh       : integer := 16#c0a8#;     
      ipaddrl       : integer := 16#0035#;
      udpport       : integer := 8000;
      extip         : integer := 0;
      fullduplex    : integer := 0;
      memtech       : integer := 0;
      bufsize       : integer := 4;
      autoneg       : integer := 0;
      speed         : integer := 0;
      mdioenabled   : integer := 0;
      phyadr        : integer := 0;
      phyrstcls     : integer := 100000;
      sim           : integer := 0);
  port (
    rstn    : in  std_ulogic;
    clk	    : in  std_ulogic;
    edcli   : in  edcl_in_type;
    ahbmim  : in  ahb_mst_in_type; 
    ahbmom  : out ahb_mst_out_type;
    ethi    : in  eth_in_type;
    etho    : out eth_out_type
  );
end;

architecture rtl of edcl is

signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

signal irqn  : std_logic;

begin

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl 		-- AHB arbiter/multiplexer
  port map (rstn, clk, ahbmi, ahbmo, ahbsi, ahbso);
  
----------------------------------------------------------------------
---  Control Unit -----------------------------------------------  
----------------------------------------------------------------------
  ctrl0: ctrlunit
  generic map (ahbndx => 0, ahbndx2=> mstndx, ahbndx3 => 3, 
	memndx => log2(bufsize), memaddr => 16#2000#, macaddrh => macaddrh, 
	macaddrl => macaddrl, ipaddrh => ipaddrh, ipaddrl => ipaddrl, 
	udpport => udpport, fullduplex=> fullduplex, autoneg => autoneg, 
	speed => speed, mdioenabled => mdioenabled, phyadr => phyadr, 
	phyrstcls => phyrstcls, sim => sim)
  port map( rst => rstn, clk => clk, edcli => edcli, ahbmi => ahbmi, 
	ahbmo => ahbmo(0), ahbmi_m => ahbmim, ahbmo_m => ahbmom, 
	ahbmi_rt => ahbmi, ahbmo_rt => ahbmo(3));  

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  e0 : eth_oc
  generic map (mstndx => 1, slvndx => 0, ioaddr => 16#010#, irq => 11,
	       memtech => memtech)
  port map ( rst => rstn, clk => clk, ahbsi => ahbsi, ahbso => ahbso(0),
       ahbmi => ahbmi, ahbmo => ahbmo(1), ethi => ethi, etho  => etho);

----------------------------------------------------------------------
---  AHB RAM  --------------------------------------------------------
----------------------------------------------------------------------

  ram0 : ahbram 
  generic map (hindex => 2, haddr => 16#200#, hmask => 16#FFF#,
	tech => memtech, kbytes => bufsize)
  port map (rstn, clk, ahbsi, ahbso(2));
  
-- pragma translate_off
  bootmsg : report_version 
  generic map (
    "edcl" & tost(mstndx) & ": Ethernet DSU Link, " & tost(bufsize) & " kbyte buffer" 
  );
-- pragma translate_on

end;
