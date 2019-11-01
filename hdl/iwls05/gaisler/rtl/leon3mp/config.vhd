-----------------------------------------------------------------------------
-- LEON3 Demonstration design test bench configuration
-- Copyright (C) 2004 Jiri Gaisler, Gaisler Research
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
------------------------------------------------------------------------------


library grlib;
use grlib.tech.all;

package config is

  constant CFG_FABTECH : integer := inferred;
  constant CFG_MEMTECH : integer := inferred;
  constant CFG_PADTECH : integer := inferred;

  constant CFG_CLKTECH : integer := inferred;
  constant CFG_CLKMUL : integer := 2;
  constant CFG_CLKDIV : integer := 2;
  constant CFG_PCIDLL : integer := 0;
  constant CFG_PCISYSCLK : integer := 0;

  constant CFG_NCPU : integer := (1);
  constant CFG_NWIN : integer := (8);
  constant CFG_V8 : integer := 0;
  constant CFG_MAC : integer := 0;
  constant CFG_SVT : integer := 0;
  constant CFG_RSTADDR : integer := 16#00000#;
  constant CFG_LDDEL : integer := (1);
  constant CFG_NWP : integer := (2);
  constant CFG_PWD : integer := 1*2;
  constant CFG_FPU : integer := 0;

  constant CFG_ICEN : integer := 1;
  constant CFG_ISETS : integer := 2;
  constant CFG_ISETSZ : integer := 2;
  constant CFG_ILINE : integer := 8;
  constant CFG_IREPL : integer := 1;
  constant CFG_ILOCK : integer := 0;
  constant CFG_ILRAMEN : integer := 0;
  constant CFG_ILRAMADDR: integer := 16#8E#;
  constant CFG_ILRAMSZ : integer := 1;

  constant CFG_DCEN : integer := 1;
  constant CFG_DSETS : integer := 2;
  constant CFG_DSETSZ : integer := 2;
  constant CFG_DLINE : integer := 8;
  constant CFG_DREPL : integer := 1;
  constant CFG_DLOCK : integer := 0;
  constant CFG_DSNOOP : integer := 0;
  constant CFG_DLRAMEN : integer := 0;
  constant CFG_DLRAMADDR : integer := 16#8F#;
  constant CFG_DLRAMSZ : integer := 1;

  constant CFG_MMUEN : integer := 0;
  constant CFG_ITLBNUM : integer := 2;
  constant CFG_DTLBNUM : integer := 2;
  constant CFG_TLB_TYPE : integer := 1;
  constant CFG_TLB_REP : integer := 1;

  constant CFG_DSU : integer := 1;
  constant CFG_AHB_UART : integer := 1;
  constant CFG_AHB_JTAG : integer := 0;
  constant CFG_ITBSZ : integer := 1;
  constant CFG_ATBSZ : integer := 1;
  constant CFG_AHB_ETH : integer := 0;
  constant CFG_ETH100 : integer := 0;
  constant CFG_ETH_BUF : integer := 1;
  constant CFG_ETH_IPM : integer := 16#C0A8#;
  constant CFG_ETH_IPL : integer := 16#0033#;
  constant CFG_ETH_ENM : integer := 16#00007A#;
  constant CFG_ETH_ENL : integer := 16#CC0001#;
  constant CFG_ETH_UDP : integer := 8000;

  constant CFG_DEFMST : integer := (0);
  constant CFG_RROBIN : integer := 1;
  constant CFG_SPLIT : integer := 0;
  constant CFG_AHBIO : integer := 16#FFF#;
  constant CFG_APBADDR : integer := 16#800#;

  constant CFG_MEMC : integer := 1;
  constant CFG_PROMWS : integer := (3);
  constant CFG_RAMWS : integer := (0);
  constant CFG_RAMRMW : integer := 1;
  constant CFG_SDEN : integer := 0;
  constant CFG_SEPBUS : integer := 0;
  constant CFG_INVCLK : integer := 0;
  constant CFG_SD64 : integer := 0;

  constant CFG_AHBRAMEN : integer := 0;
  constant CFG_AHBRSZ : integer := 1;
  constant CFG_AHBRADDR : integer := 16#A00#;
  constant CFG_AHBROMEN : integer := 0;
  constant CFG_AHBROPIP : integer := 0;
  constant CFG_AHBRODDR : integer := 16#000#;
  constant CFG_ROMADDR : integer := 16#000#;
  constant CFG_ROMMASK : integer := 16#E00# + 16#000#;

  constant CFG_ETH : integer := 0;
  constant CFG_ETHIO : integer := 16#B00#;

  constant CFG_PCI : integer := 0;
  constant CFG_PCIVID : integer := 0;
  constant CFG_PCIDID : integer := 0;
  constant CFG_PCIDEPTH : integer := 8;
  constant CFG_PCI_ARB : integer := 0;
  constant CFG_PCI_ARBAPB : integer := 0;
  constant CFG_PCITBUFEN: integer := 0;
  constant CFG_PCITBUF : integer := 256;

  constant CFG_CAN : integer := 0;
  constant CFG_CANIO : integer := 16#0#;
  constant CFG_CANIRQ : integer := 0;
  constant CFG_CANLOOP : integer := 0;

  constant CFG_UART1_ENABLE : integer := 1;
  constant CFG_UART1_FIFO : integer := 4;
  constant CFG_UART2_ENABLE : integer := 1;
  constant CFG_UART2_FIFO : integer := 4;
  constant CFG_IRQ3_ENABLE : integer := 1;
  constant CFG_GPT_ENABLE : integer := 1;
  constant CFG_GPT_NTIM : integer := (2);
  constant CFG_GPT_SW : integer := (8);
  constant CFG_GPT_TW : integer := (32);
  constant CFG_GPT_IRQ : integer := (8);
  constant CFG_GPT_SEPIRQ : integer := 1;


  constant CFG_GRGPIO_ENABLE : integer := 0;
  constant CFG_GRGPIO_IMASK : integer := 16#0000#;
  constant CFG_GRGPIO_WIDTH : integer := 1;

  constant CFG_DISAS : integer := 0;
  constant CFG_DUART : integer := 0;
  constant CFG_PCLOW : integer := 2;

-- constant CFG_FT_IU_REGFILE : integer := CONFIG_FT_IU_REGFILE;
-- constant CFG_FT_CACHE : integer := 0;
-- constant CFG_FT_CACHE_ERRINJ : integer := 0;
end;
