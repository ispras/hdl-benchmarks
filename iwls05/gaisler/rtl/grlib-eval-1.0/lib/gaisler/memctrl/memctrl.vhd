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
-- Entity: 	memctrl
-- File:	memctrl.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Memory controller package
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;

package memctrl is

type memory_in_type is record
  data          : std_logic_vector(31 downto 0); -- Data bus address
  brdyn         : std_logic;
  bexcn         : std_logic;
  writen        : std_logic;
  wrn           : std_logic_vector(3 downto 0);
  bwidth        : std_logic_vector(1 downto 0);
  sd            : std_logic_vector(63 downto 0);
  cb            : std_logic_vector(7 downto 0); 
  edac          : std_logic;
end record;

type memory_out_type is record
  address       : std_logic_vector(27 downto 0);
  data          : std_logic_vector(31 downto 0);
  sddata        : std_logic_vector(63 downto 0);
  ramsn         : std_logic_vector(4 downto 0);
  ramoen        : std_logic_vector(4 downto 0); 
  mben          : std_logic_vector(3 downto 0); 
  iosn          : std_logic;
  romsn         : std_logic_vector(1 downto 0);
  oen           : std_logic;
  writen        : std_logic;
  wrn           : std_logic_vector(3 downto 0);
  bdrive        : std_logic_vector(3 downto 0);
  vbdrive       : std_logic_vector(31 downto 0); --vector bus drive
  svbdrive      : std_logic_vector(63 downto 0); --vector bus drive sdram
  read          : std_logic;
  sa            : std_logic_vector(14 downto 0);
  cb            : std_logic_vector(7 downto 0);
  ce            : std_ulogic;
end record;

type sdctrl_in_type is record
  wprot		: std_ulogic;
  data     	: std_logic_vector (63 downto 0);  -- data in
  cb            : std_logic_vector(7 downto 0);
end record;

type sdctrl_out_type is record
  sdcke    	: std_logic_vector ( 1 downto 0);  -- clk en
  sdcsn    	: std_logic_vector ( 1 downto 0);  -- chip sel
  sdwen    	: std_ulogic;                       -- write en
  rasn   	: std_ulogic;                       -- row addr stb
  casn   	: std_ulogic;                       -- col addr stb
  dqm    	: std_logic_vector ( 7 downto 0);  -- data i/o mask
  bdrive 	: std_ulogic;                       -- bus drive
  vbdrive       : std_logic_vector(31 downto 0);   -- vector bus drive 
  address	: std_logic_vector (16 downto 2);  -- address out
  data   	: std_logic_vector (31 downto 0);  -- data out
  cb            : std_logic_vector(7 downto 0);
  ce            : std_ulogic;
end record;

type sdram_out_type is record
  sdcke    	: std_logic_vector ( 1 downto 0);  -- clk en
  sdcsn    	: std_logic_vector ( 1 downto 0);  -- chip sel
  sdwen    	: std_ulogic;                       -- write en
  rasn   	: std_ulogic;                       -- row addr stb
  casn   	: std_ulogic;                       -- col addr stb
  dqm    	: std_logic_vector ( 7 downto 0);  -- data i/o mask
end record;

component sdctrl
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#f00#;
    ioaddr  : integer := 16#000#;
    iomask  : integer := 16#fff#;
    wprot   : integer := 0;
    invclk  : integer := 0; 
    fast    : integer := 0; 
    pwron   : integer := 0;
    sdbits  : integer := 32;
    oepol   : integer := 0
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    sdi    : in  sdctrl_in_type;
    sdo    : out sdctrl_out_type
  );
end component;

component ftsdctrl is
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#f00#;
    ioaddr  : integer := 16#000#;
    iomask  : integer := 16#fff#;
    wprot   : integer := 0;
    invclk  : integer := 0; 
    fast    : integer := 0; 
    pwron   : integer := 0;
    sdbits  : integer := 32;
    edacen  : integer := 0;
    errcnt  : integer := 0;
    cntbits : integer range 1 to 8 := 1
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbsi   : in  ahb_slv_in_type;
    ahbso   : out ahb_slv_out_type;
    sdi     : in  sdctrl_in_type;
    sdo     : out sdctrl_out_type
  );
end component; 


component srctrl
  generic (
    hindex  : integer := 0;
    romaddr : integer := 0;
    rommask : integer := 16#ff0#;
    ramaddr : integer := 16#400#;
    rammask : integer := 16#ff0#;
    ramws   : integer := 0;
    romws   : integer := 2;
    rmw     : integer := 0;
    prom8en : integer := 0;
    oepol   : integer := 0;
    srbanks : integer range 1 to 5 := 1;
    banksz  : integer range 0 to 13 := 13;
    romasel : integer range 0 to 28 := 19
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbsi   : in  ahb_slv_in_type;
    ahbso   : out ahb_slv_out_type;
    sri     : in  memory_in_type;
    sro     : out memory_out_type;
    sdo     : out sdctrl_out_type
  );
end component;


component ftsrctrl is
  generic (
    hindex  : integer := 0;
    romaddr : integer := 0;
    rommask : integer := 16#ff0#;
    ramaddr : integer := 16#400#;
    rammask : integer := 16#ff0#;
    ioaddr  : integer := 16#200#;
    iomask  : integer := 16#ff0#;
    ramws   : integer := 0;
    romws   : integer := 2;
    iows    : integer := 2;
    rmw     : integer := 0;
    srbanks : integer range 1 to 4  := 1;
    banksz  : integer range 0 to 13 := 13;
    romasel : integer range 0 to 28 := 19;
    pindex  : integer := 0;
    paddr   : integer := 0;
    pmask   : integer := 16#fff#;
    edacen  : integer range 0 to 1 := 0;
    errcnt  : integer range 0 to 1 := 0;   
    cntbits : integer range 1 to 8 := 1;
    wsreg   : integer := 0
    );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    sri    : in  memory_in_type;
    sro    : out memory_out_type;
    sdo    : out sdctrl_out_type
  );
end component;

type sdram_in_type is record
  haddr         : std_logic_vector(31 downto 0);  -- memory address
  rhaddr        : std_logic_vector(31 downto 0);  -- latched memory address
  hready        : std_ulogic;
  hsize         : std_logic_vector(1 downto 0);
  hsel          : std_ulogic;
  hwrite        : std_ulogic;
  htrans        : std_logic_vector(1 downto 0);
  rhtrans       : std_logic_vector(1 downto 0);
  nhtrans       : std_logic_vector(1 downto 0);
  idle     	: std_ulogic;
  enable   	: std_ulogic;
end record;
  
type sdram_mctrl_out_type is record
  address       : std_logic_vector(16 downto 2);
  busy          : std_ulogic;
  aload         : std_ulogic;
  bdrive        : std_ulogic;
  hready        : std_ulogic;
  hsel          : std_ulogic;
  bsel          : std_ulogic;
  hresp    	: std_logic_vector ( 1 downto 0);
end record;

type wprot_out_type is record
  wprothit      : std_ulogic;
end record;

component sdmctrl
  generic (
    pindex  : integer := 0;
    invclk  : integer := 0;
    fast    : integer := 0; 
    wprot   : integer := 0;
    sdbits  : integer := 32
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    sdi    : in  sdram_in_type;
    sdo    : out sdram_out_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    wpo    : in  wprot_out_type;
    sdmo   : out sdram_mctrl_out_type
  );
end component; 

end;
