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
-- Entity: 	proc3
-- File:	proc3.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	LEON3 processor core with pipeline, mul/div & cache control
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.tech.all;

library gaisler;
use gaisler.memory.all;
use gaisler.leon3.all;
use gaisler.libiu.all;
use gaisler.libcache.all;
use gaisler.arith.all;
library fpu;
use fpu.libfpu.all;

entity proc3 is
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
    ilram      : integer range 0 to 1 := 0;
    ilramsize  : integer range 1 to 64 := 1;
    ilramstart : integer range 0 to 255 := 16#8e#;
    dlram      : integer range 0 to 1 := 0;
    dlramsize  : integer range 1 to 64 := 1;
    dlramstart : integer range 0 to 255 := 16#8f#;
    mmuen     : integer range 0 to 1  := 0;
    itlbnum   : integer range 2 to 64 := 8;
    dtlbnum   : integer range 2 to 64 := 8;
    tlb_type  : integer range 0 to 1 := 1;
    tlb_rep   : integer range 0 to 1 := 0;
    lddel     : integer range 1 to 2 := 2;
    disas     : integer range 0 to 1  := 0;
    tbuf      : integer range 0 to 64 := 0;
    pwd      : integer range 0 to 2 := 0;
    svt      : integer range 0 to 1 := 0;   -- single-vector trapping
    rstaddr  : integer              := 0;
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
end; 

architecture rtl of proc3 is

constant IRFWT    : integer := regfile_3p_write_through(memtech);

signal ici : icache_in_type;
signal ico : icache_out_type;
signal dci : dcache_in_type;
signal dco : dcache_out_type;

signal holdnx, pholdn : std_logic;
signal muli  : mul32_in_type;
signal mulo  : mul32_out_type;
signal divi  : div32_in_type;
signal divo  : div32_out_type;

begin

  holdnx <= ico.hold and dco.hold; holdn <= holdnx;
  pholdn <= '1';

-- integer unit 

   iu3gen : if (cft = 0) generate 
     iu0 : iu3  
       generic map (nwindows, isets, dsets, fpu, v8, cp, mac, dsu, nwp, pclow,
	 0, hindex, lddel, IRFWT, disas, tbuf, pwd, svt, rstaddr, nohalt, fabtech)
       port map (clk, rstn, holdnx, ici, ico, dci, dco, rfi, rfo, irqi, irqo, 
                 dbgi, dbgo, muli, mulo, divi, divo, fpo, fpi, cpo, cpi, tbo, tbi);
   end generate;

  iu3ftgen : if (cft /= 0) generate 
    iuft0 : iu3ft  
      generic map (nwindows, isets, dsets, fpu, v8, cp, mac, dsu, nwp, pclow,
        0, hindex, lddel, IRFWT, disas, tbuf, pwd, svt, rstaddr, rfft, cft, fabtech)
      port map (clk, rstn, holdnx, ici, ico, dci, dco, rfi, rfo, irqi, irqo, 
                dbgi, dbgo, muli, mulo, divi, divo, fpo, fpi, cpo, cpi, tbo, tbi);
  end generate;  

-- multiply and divide units

  mgen : if v8 /= 0 generate
    mul0 : mul32 generic map (is_fpga(fabtech), 0, v8/2, mac)
	    port map (rstn, clk, holdnx, muli, mulo);
    div0 : div32 port map (rstn, clk, holdnx, divi, divo);
  end generate;

-- cache controller

  m0 : if mmuen = 0 generate
    c0 : cache 
      generic map (hindex, dsu, icen, irepl, isets, ilinesize, isetsize, 
                   isetlock, dcen, drepl, dsets, dlinesize, dsetsize,  dsetlock, 
                   dsnoop, ilram, ilramsize, ilramstart, dlram, dlramsize, dlramstart, cft)
      port map ( rstn, clk, ici, ico, dci, dco, ahbi, ahbo, ahbsi, ahbso, crami, cramo, pholdn);
  end generate;
  m1 : if mmuen = 1 generate
    c0mmu : mmu_cache 
       generic map (hindex=>hindex, memtech=>memtech, dsu=>dsu, icen=>icen, irepl=>irepl, 
	  isets=>isets, ilinesize=>ilinesize, isetsize=>isetsize, isetlock=>isetlock,
          dcen=>dcen, drepl=>drepl, dsets=>dsets, dlinesize=>dlinesize, dsetsize=>dsetsize,
	  dsetlock=>dsetlock, dsnoop=>dsnoop, itlbnum=>itlbnum, dtlbnum=>dtlbnum, 
	  tlb_type=>tlb_type, tlb_rep=>tlb_rep)
       port map ( rstn, clk, ici, ico, dci, dco, 
	  ahbi, ahbo, ahbsi, ahbso, crami, cramo, pholdn);
  end generate;

end;
