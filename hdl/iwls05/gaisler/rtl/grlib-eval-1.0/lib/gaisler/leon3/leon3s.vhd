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
-- Entity: 	leon3s
-- File:	leon3s.vhd
-- Author:	Jiri Gaisler, Edvin Catovic, Gaisler Research
-- Description:	Top-level LEON3 component
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
use gaisler.libproc3.all;
use gaisler.arith.all;
library fpu;
use fpu.libfpu.all;

entity leon3s is
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
    lddel     : integer range 1 to 2  := 2;
    disas     : integer range 0 to 1  := 0;
    tbuf      : integer range 0 to 64 := 0;
    pwd       : integer range 0 to 2  := 2;     -- power-down
    svt       : integer range 0 to 1  := 1;     -- single vector trapping
    rstaddr   : integer               := 0;
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
end; 

architecture rtl of leon3s is

constant IRFBITS  : integer range 6 to 10 := log2(NWINDOWS+1) + 4;
constant IREGNUM  : integer := NWINDOWS * 16 + 8;

signal holdn : std_logic;
signal rfi   : iregfile_in_type;
signal rfo   : iregfile_out_type;
signal crami : cram_in_type;
signal cramo : cram_out_type;
signal tbi   : tracebuf_in_type;
signal tbo   : tracebuf_out_type;
signal rst   : std_ulogic;
signal fpi   : fpc_in_type;
signal fpo   : fpc_out_type;
signal cpi   : fpc_in_type;
signal cpo   : fpc_out_type;

signal rd1, rd2, wd : std_logic_vector(36 downto 0);

begin

-- leon3 processor core (iu, caches & mul/div)

  p0 : proc3 
  generic map (hindex, fabtech, memtech, nwindows, dsu, fpu, v8, cp, mac,      
    pclow, notag, nwp, icen, irepl, isets, ilinesize, isetsize, isetlock, 
    dcen, drepl, dsets, dlinesize, dsetsize, dsetlock, dsnoop, ilram, 
    ilramsize, ilramstart, dlram, dlramsize, dlramstart, mmuen, itlbnum, dtlbnum,
    tlb_type, tlb_rep, lddel, disas, tbuf, pwd, svt, rstaddr, nohalt, rfft, cft)
  port map (clk, rst, holdn, ahbi, ahbo, ahbsi, ahbso, rfi, rfo, crami, cramo, 
    tbi, tbo, fpi, fpo, cpi, cpo, irqi, irqo, dbgi, dbgo);
  
-- IU register file
  
  rfgen : if (rfft = 0) generate 
    rf0 : regfile_3p generic map (memtech, IRFBITS, 32, 1, IREGNUM)
        port map (clk, rfi.waddr(IRFBITS-1 downto 0), rfi.wdata, rfi.wren, 
		  clk, rfi.raddr1(IRFBITS-1 downto 0), rfi.ren1, rfo.data1, 
		  rfi.raddr2(IRFBITS-1 downto 0), rfi.ren2, rfo.data2);
  end generate;

  rfftgen : if (rfft /= 0) generate
    wd <= rfi.wpar & rfi.wdata;
    rf0 : regfile_3p generic map (memtech, IRFBITS, 36, 1, IREGNUM)
        port map (clk, rfi.waddr(IRFBITS-1 downto 0), wd, rfi.wren,
		  clk, rfi.raddr1(IRFBITS-1 downto 0), rfi.ren1, rd1,
		  rfi.raddr2(IRFBITS-1 downto 0), rfi.ren2, rd2);
    rfo.data1 <= rd1(31 downto 0); rfo.dpar1 <= rd1(35 downto 32);
    rfo.data2 <= rd2(31 downto 0); rfo.dpar2 <= rd2(35 downto 32);
  end generate;

-- cache memory

  cmemgen : if (cft = 0) generate 
    cmem0 : cachemem 
    generic map (memtech, icen, irepl, isets, ilinesize, isetsize, isetlock, dcen,
                 drepl, dsets,  dlinesize, dsetsize, dsetlock, dsnoop, ilram,
                 ilramsize, dlram, dlramsize, mmuen) 
    port map (clk, crami, cramo);
  end generate;

  cmemftgen : if (cft /= 0) generate
    cmem0 : cachememft 
    generic map (memtech, icen, irepl, isets, ilinesize, isetsize, isetlock, dcen,
                 drepl, dsets,  dlinesize, dsetsize, dsetlock, dsnoop, ilram,
                 ilramsize, dlram, dlramsize, mmuen, ceinj) 
    port map (clk, crami, cramo);
  end generate;    

-- instruction trace buffer memory

  tbmem_gen : if (tbuf /= 0) generate
    tbmem0 : tbufmem
      generic map (tech => memtech, tbuf => tbuf)
      port map (clk, tbi, tbo);
  end generate;
    
-- FPU

  fpu0 : if (fpu = 0) generate fpo.ldlock <= '0'; fpo.ccv <= '1'; end generate;

  grfpc0gen : if (fpu = 1) generate
    fpu0: grfpcw
      generic map (memtech, is_fpga(fabtech), pclow, dsu, disas)
      port map (rst, clk, holdn, fpi, fpo);
  end generate;

  mfpc0gen : if (fpu = 2) generate
    fpu0 : mfpcw
      generic map (memtech, pclow, dsu, disas)
      port map (rst, clk, holdn, fpi, fpo);
  end generate;  
  
  grlfpc0gen : if (fpu = 3) generate
    fpu0 : grlfpcw
      generic map (memtech, pclow, dsu, disas)
      port map (rst, clk, holdn, fpi, fpo);
  end generate;  
  
-- 1-clock reset delay

  rstreg : process(clk)
  begin if rising_edge(clk) then rst <= rstn; end if; end process;
  
-- pragma translate_off
  bootmsg : report_version 
  generic map (
    "leon3_" & tost(hindex) & ": LEON3 SPARC V8 processor rev " & tost(LEON3_VERSION),
    "leon3_" & tost(hindex) & ": icache " & tost(isets*icen) & "*" & tost(isetsize*icen) &
	" kbyte, dcache "  & tost(dsets*dcen) & "*" & tost(dsetsize*dcen) & " kbyte"
  );
-- pragma translate_on

end;
