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
-- Entity: 	pcipads
-- File:	pcipads.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	PCI pads module
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.pads.all;
use gaisler.pci.all;

entity pcipads is
  generic (
    padtech      : integer := 0;
    noreset      : integer := 0;
    oepol       : integer := 0
  );
  port (
    pci_rst     : in std_ulogic;
    pci_gnt     : in std_ulogic;
    pci_idsel   : in std_ulogic;
    pci_lock    : inout std_ulogic;
    pci_ad 	: inout std_logic_vector(31 downto 0);
    pci_cbe 	: inout std_logic_vector(3 downto 0);
    pci_frame   : inout std_ulogic;
    pci_irdy 	: inout std_ulogic;
    pci_trdy 	: inout std_ulogic;
    pci_devsel  : inout std_ulogic;
    pci_stop 	: inout std_ulogic;
    pci_perr 	: inout std_ulogic;
    pci_par 	: inout std_ulogic;    
    pci_req 	: inout std_ulogic;  -- tristate pad but never read
    pci_serr    : inout std_ulogic;  -- open drain output
    pci_host   	: in std_ulogic;
    pci_66	: in std_ulogic;
    pcii   	: out pci_in_type;
    pcio   	: in  pci_out_type
  );
end; 
 
architecture rtl of pcipads is
signal vcc : std_ulogic;
begin

  vcc <= '1';

  norst : if noreset = 0 generate
    pad_pci_rst   : inpad generic map (padtech, pci33, 0) port map (pci_rst, pcii.rst);
  end generate;
  dorst : if noreset = 1 generate
    pcii.rst <= pci_rst;
  end generate;
  pad_pci_gnt   : inpad generic map (padtech, pci33, 0) port map (pci_gnt, pcii.gnt);
  pad_pci_idsel : inpad generic map (padtech, pci33, 0) port map (pci_idsel, pcii.idsel);
  pad_pci_host  : inpad generic map (padtech, pci33, 0) port map (pci_host, pcii.host);
  pad_pci_66    : inpad generic map (padtech, pci33, 0) port map (pci_66, pcii.pci66);
  pad_pci_lock  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_lock, pcio.lock, pcio.locken, pcii.lock);
  pad_pci_ad    : iopadvv generic map (tech => padtech, level => pci33, width => 32,
				      oepol => oepol)
	          port map (pci_ad, pcio.ad, pcio.vaden, pcii.ad);
  pad_pci_cbe0  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_cbe(0), pcio.cbe(0), pcio.cbeen(0), pcii.cbe(0));
  pad_pci_cbe1  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_cbe(1), pcio.cbe(1), pcio.cbeen(1), pcii.cbe(1));
  pad_pci_cbe2  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_cbe(2), pcio.cbe(2), pcio.cbeen(2), pcii.cbe(2));
  pad_pci_cbe3  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_cbe(3), pcio.cbe(3), pcio.cbeen(3), pcii.cbe(3));
  pad_pci_frame : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_frame, pcio.frame, pcio.frameen, pcii.frame);
  pad_pci_trdy  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_trdy, pcio.trdy, pcio.trdyen, pcii.trdy);
  pad_pci_irdy  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_irdy, pcio.irdy, pcio.irdyen, pcii.irdy);
  pad_pci_devsel: iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_devsel, pcio.devsel, pcio.devselen, pcii.devsel);
  pad_pci_stop  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_stop, pcio.stop, pcio.stopen, pcii.stop);
  pad_pci_perr  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_perr, pcio.perr, pcio.perren, pcii.perr);
  pad_pci_par   : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_par, pcio.par, pcio.paren, pcii.par);
  pad_pci_req   : toutpad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_req, pcio.req, pcio.reqen);
  pad_pci_serr  : iopad generic map (tech => padtech, level => pci33, oepol => oepol)
	          port map (pci_serr, pcio.serr, pcio.serren, pcii.serr);

end;
