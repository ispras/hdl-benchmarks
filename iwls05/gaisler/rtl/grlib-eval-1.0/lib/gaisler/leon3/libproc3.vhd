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
-- Package: 	libproc3
-- File:	libproc3.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	LEON3 proc3 component declaration
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.tech.all;
library gaisler;
use gaisler.leon3.all;
use gaisler.libcache.all;
use gaisler.libiu.all;
library fpu;
use fpu.libfpu.all;

package libproc3 is

  component proc3 
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
    ilram     : integer range 0 to 1  := 0;
    ilramsize : integer range 1 to 64 := 1;
    ilramstart: integer range 0 to 255 := 16#8e#;
    dlram     : integer range 0 to 1  := 0;
    dlramsize : integer range 1 to 64 := 1;
    dlramstart: integer range 0 to 255 := 16#8f#;
    mmuen     : integer range 0 to 1  := 0;
    itlbnum   : integer range 2 to 64 := 8;
    dtlbnum   : integer range 2 to 64 := 8;
    tlb_type  : integer range 0 to 1  := 1;
    tlb_rep   : integer range 0 to 1  := 0;
    lddel     : integer range 1 to 2  := 2;
    disas     : integer range 0 to 1  := 0;
    tbuf      : integer range 0 to 64 := 0;
    pwd       : integer range 0 to 2  := 0;     -- power-down
    svt       : integer range 0 to 1  := 0;   -- single-vector trapping
    rstaddr   : integer               := 0;
    nohalt   : integer range 0 to 1 := 0;    -- don't halt on error
    rfft      : integer range 0 to 2 := 0;        
    cft      : integer range 0 to 1  := 0            
  );
  port (
    clk    : in  std_ulogic;
    rstn   : in  std_ulogic;
    holdn  : out std_ulogic;    
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : in  ahb_slv_out_vector;    
    rfi    : out iregfile_in_type;
    rfo    : in  iregfile_out_type;
    crami  : out cram_in_type;
    cramo  : in  cram_out_type;
    tbi    : out tracebuf_in_type;
    tbo    : in  tracebuf_out_type;
    fpi    : out fpc_in_type;
    fpo    : in  fpc_out_type;
    cpi    : out fpc_in_type;
    cpo    : in  fpc_out_type;
    irqi   : in  l3_irq_in_type;
    irqo   : out l3_irq_out_type;
    dbgi   : in  l3_debug_in_type;
    dbgo   : out l3_debug_out_type
  );
  end component; 

  component grfpcx 
  generic (tech     : integer := 0;
           infmul   : integer range 0 to 1 := 1;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type
    );
  end component;

  component grfpcw 
  generic (tech     : integer := 0;
           infmul   : integer range 0 to 1 := 1;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
    rst    : in  std_ulogic;			
    clk    : in  std_ulogic;
    holdn  : in  std_logic;			
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type    
    );
  end component;
  
  component mfpcx 
  generic (tech     : integer := 0;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type
    );
  end component;

  component mfpcw 
  generic (tech     : integer := 0;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
    rst    : in  std_ulogic;			
    clk    : in  std_ulogic;
    holdn  : in  std_logic;			
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type    
    );
  end component;

  component grlfpcx 
  generic (tech     : integer := 0;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type
    );
  end component;

  component grlfpcw 
  generic (tech     : integer := 0;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
    rst    : in  std_ulogic;			
    clk    : in  std_ulogic;
    holdn  : in  std_logic;			
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type    
    );
  end component;

end;
