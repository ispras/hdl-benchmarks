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
-- Entity: 	debug
-- File:	debug.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Various debug utilities
------------------------------------------------------------------------------

use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
library grlib; 
use grlib.amba.all;

package debug is

component ahbreport
  generic (
    ioaddr  : ahb_addr_type := 16#fff#;  -- I/O area MSB address
    iomask  : ahb_addr_type := 16#fff#;  -- I/O area address mask
    cfgaddr : ahb_addr_type := 16#ff0#;  -- config area MSB address
    cfgmask : ahb_addr_type := 16#ff0#;  -- config area address mask
    icheck : integer := 1;		-- check bus indexes
    timeout : integer := 0;   		-- check bus timeout
    nmasters: integer := NAHBMST;   	-- Number of masters
    nslaves : integer := NAHBSLV;   	-- Number of slaves
    ioen   : integer := 1		-- enable I/O area
  );
  port (
    msto    : in  ahb_mst_out_vector;
    slvo    : in  ahb_slv_out_vector
  );
end component;

component apbreport
  generic (
    haddr : integer := 0;
    hmask : integer := 16#fff#;
    icheck  : integer := 1;
    nslaves : integer := NAPBSLV   	-- Number of slaves
  );
  port (
    apbo    : in  apb_slv_out_vector
  );
end component;

component grtestmod
  generic (halt : integer := 0);
  port (
    resetn	: in  std_ulogic;
    clk		: in  std_ulogic;
    errorn	: in std_ulogic;
    address 	: in std_logic_vector(21 downto 2);
    data	: inout std_logic_vector(31 downto 0);
    iosn        : in std_ulogic;
    oen         : in std_ulogic;
    writen  	: in std_ulogic; 		
    brdyn  	: out  std_ulogic
 );

end component;


end;
