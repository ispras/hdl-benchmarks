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
-- Package: 	leon3
-- File:	leon3.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	LEON3 types and components
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.tech.all;

package leon3 is

  constant LEON3_VERSION : integer := 0;

  type l3_irq_in_type is record
    irl   	: std_logic_vector(3 downto 0);
    rst   	: std_ulogic;
  end record;

  type l3_irq_out_type is record
    intack	: std_ulogic;
    irl		: std_logic_vector(3 downto 0);
    pwd         : std_ulogic;
  end record;

  type l3_debug_in_type is record
    dsuen   : std_ulogic;  -- DSU enable
    denable : std_ulogic;  -- diagnostic register access enable
    dbreak  : std_ulogic;  -- debug break-in
    step    : std_ulogic;  -- single step    
    halt    : std_ulogic;  -- halt processor
    reset   : std_ulogic;  -- reset processor
    dwrite  : std_ulogic;  -- read/write
    daddr   : std_logic_vector(23 downto 2); -- diagnostic address
    ddata   : std_logic_vector(31 downto 0); -- diagnostic data
    btrapa  : std_ulogic;	   -- break on IU trap
    btrape  : std_ulogic;	-- break on IU trap
    berror  : std_ulogic;	-- break on IU error mode
    bwatch  : std_ulogic;	-- break on IU watchpoint
    bsoft   : std_ulogic;	-- break on software breakpoint (TA 1)
    tenable : std_ulogic;
    timer   :  std_logic_vector(30 downto 0);                                                -- 
  end record;

  type l3_debug_out_type is record
    data   : std_logic_vector(31 downto 0);
    crdy   : std_ulogic;
    dsu    : std_ulogic;
    dsumode: std_ulogic;
    error  : std_ulogic;
    halt   : std_ulogic;
  end record;

  type l3_debug_in_vector is array (natural range <>) of l3_debug_in_type;
  type l3_debug_out_vector is array (natural range <>) of l3_debug_out_type;
  
  component leon3s
  generic (
    hindex    : integer               := 0;
    fabtech   : integer range 0 to NTECH  := 0;
    memtech   : integer range 0 to NTECH  := 0;
    nwindows  : integer range 2 to 32 := 8;
    dsu       : integer range 0 to 1  := 0;
    fpu       : integer range 0 to 3  := 0;
    v8        : integer range 0 to 2  := 0;
    cp        : integer range 0 to 1  := 0;
    mac       : integer range 0 to 1  := 0;
    pclow     : integer range 0 to 2  := 2;
    notag     : integer range 0 to 1  := 0;
    nwp       : integer range 0 to 4  := 0;    
    icen      : integer range 0 to 1  := 0;
    irepl     : integer range 0 to 2  := 2;
    isets     : integer range 1 to 4  := 1;
    ilinesize : integer range 4 to 8  := 4;
    isetsize  : integer range 1 to 64 := 1;
    isetlock  : integer range 0 to 1  := 0;
    dcen      : integer range 0 to 1  := 0;
    drepl     : integer range 0 to 2  := 2;
    dsets     : integer range 1 to 4  := 1;
    dlinesize : integer range 4 to 8  := 4;
    dsetsize  : integer range 1 to 64 := 1;
    dsetlock  : integer range 0 to 1  := 0;
    dsnoop    : integer range 0 to 2  := 0;
    ilram     : integer range 0 to 1 := 0;
    ilramsize : integer range 1 to 64 := 1;
    ilramstart: integer range 0 to 255 := 16#8e#;
    dlram     : integer range 0 to 1 := 0;
    dlramsize : integer range 1 to 64 := 1;
    dlramstart: integer range 0 to 255 := 16#8f#;
    mmuen     : integer range 0 to 1  := 0;
    itlbnum   : integer range 2 to 64 := 8;
    dtlbnum   : integer range 2 to 64 := 8;
    tlb_type  : integer range 0 to 1 := 1;
    tlb_rep   : integer range 0 to 1 := 0;
    lddel     : integer range 1 to 2 := 2;
    disas     : integer range 0 to 1 := 0;
    tbuf      : integer range 0 to 64 := 0;
    pwd       : integer range 0 to 2 := 2;     -- power-down
    svt       : integer range 0 to 1 := 1;     -- single vector trapping
    rstaddr   : integer := 16#00000#;   -- reset vector address [31:12]
    nohalt   : integer range 0 to 1 := 0;    -- don't halt on error    
    rfft      : integer range 0 to 4  := 0;
    cft       : integer range 0 to 1  := 0;
    ceinj     : integer range 0 to 1  := 0    
  );
  port (
    clk    : in  std_ulogic;
    rstn   : in  std_ulogic;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : in  ahb_slv_out_vector;
    irqi   : in  l3_irq_in_type;
    irqo   : out l3_irq_out_type;
    dbgi   : in  l3_debug_in_type;
    dbgo   : out l3_debug_out_type
  );
  end component; 

  type dsu_in_type is record
    enable  : std_ulogic;
    break   : std_ulogic;
  end record;                        

  type dsu_out_type is record
    active          : std_ulogic;
    tstop           : std_ulogic;
  end record;

  component dsu3 
  generic (
    hindex  : integer := 0;
    haddr   : integer := 16#900#;
    hmask   : integer := 16#f00#;
    ncpu    : integer := 1;
    tbits   : integer := 30; -- timer bits (instruction trace time tag)
    tech    : integer := 0; 
    irq     : integer := 0; 
    kbytes  : integer := 0
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    ahbmi  : in  ahb_mst_in_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    dbgi   : in l3_debug_out_vector(0 to NCPU-1);
    dbgo   : out l3_debug_in_vector(0 to NCPU-1);
    dsui   : in dsu_in_type;
    dsuo   : out dsu_out_type
  );
  end component;
  
  type irq_in_vector  is array (Natural range <> ) of l3_irq_in_type;
  type irq_out_vector is array (Natural range <> ) of l3_irq_out_type;

  component irqmp
  generic (
    pindex  : integer := 0;
    paddr   : integer := 0;
    pmask   : integer := 16#fff#;
    ncpu    : integer := 1;
    cmask   : integer := 16#0001#
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    irqi   : in  irq_out_vector(0 to ncpu-1);
    irqo   : out irq_in_vector(0 to ncpu-1)
  );
  end component; 

--   component leon3ft
--   generic (
--     hindex    : integer               := 0;
--     fabtech   : integer range 0 to NTECH  := 0;
--     memtech   : integer range 0 to NTECH  := 0;
--     nwindows  : integer range 2 to 32 := 8;
--     dsu       : integer range 0 to 1  := 0;
--     fpu       : integer range 0 to 2  := 0;
--     v8        : integer range 0 to 2  := 0;
--     cp        : integer range 0 to 1  := 0;
--     mac       : integer range 0 to 1  := 0;
--     pclow     : integer range 0 to 2  := 2;
--     notag     : integer range 0 to 1  := 0;
--     nwp       : integer range 0 to 4  := 0;
--     icen      : integer range 0 to 1  := 0;
--     irepl     : integer range 0 to 2  := 2;
--     isets     : integer range 1 to 4  := 1;
--     ilinesize : integer range 4 to 8  := 4;
--     isetsize  : integer range 1 to 64 := 1;
--     isetlock  : integer range 0 to 1  := 0;
--     dcen      : integer range 0 to 1  := 0;
--     drepl     : integer range 0 to 2  := 2;
--     dsets     : integer range 1 to 4  := 1;
--     dlinesize : integer range 4 to 8  := 4;
--     dsetsize  : integer range 1 to 64 := 1;
--     dsetlock  : integer range 0 to 1  := 0;
--     dsnoop    : integer range 0 to 2  := 0;
--     ilram      : integer range 0 to 1 := 0;
--     ilramsize  : integer range 1 to 64 := 1;
--     ilramstart : integer range 0 to 255 := 16#8e#;
--     dlram      : integer range 0 to 1 := 0;
--     dlramsize  : integer range 1 to 64 := 1;
--     dlramstart : integer range 0 to 255 := 16#8f#;
--     mmuen     : integer range 0 to 1  := 0;
--     itlbnum   : integer range 2 to 64 := 8;
--     dtlbnum   : integer range 2 to 64 := 8;
--     tlb_type  : integer range 0 to 1 := 1;
--     tlb_rep   : integer range 0 to 1 := 0;
--     lddel     : integer range 1 to 2  := 2;
--     disas     : integer range 0 to 1  := 0;
--     tbuf      : integer range 0 to 64 := 0;
--     pwd       : integer range 0 to 2  := 2;     -- power-down
--     svt       : integer range 0 to 1  := 1;     -- single vector trapping
--     rfft      : integer range 0 to 2  := 0;
--     caft      : integer range 0 to 2  := 0 
--   );
--   port (
--     clk    : in  std_ulogic;
--     rstn   : in  std_ulogic;
--     ahbi   : in  ahb_mst_in_type;
--     ahbo   : out ahb_mst_out_type;
--     ahbsi  : in  ahb_slv_in_type;
--     ahbso  : in  ahb_slv_out_vector;            
--     irqi   : in  l3_irq_in_type;
--     irqo   : out l3_irq_out_type;
--     dbgi   : in  l3_debug_in_type;
--     dbgo   : out l3_debug_out_type
--   );
--   end component; 

end;
