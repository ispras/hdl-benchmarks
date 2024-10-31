-----------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2004 Jiri Gaisler, Gaisler Research
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.tech.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.pci.all;
use gaisler.net.all;
use gaisler.pads.all;
use gaisler.jtag.all;
library esa;
use esa.memoryctrl.all;
use esa.pcicomp.all;
use work.grcomp.all;
use work.debug.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
  port (
    resetn	: in  std_ulogic;
    clk		: in  std_ulogic;
    pllref 	: in  std_ulogic; 
    errorn	: out std_ulogic;
    address 	: out std_logic_vector(27 downto 0);
    data	: inout std_logic_vector(31 downto 0);
    sa      	: out std_logic_vector(14 downto 0);
    sd   	: inout std_logic_vector(63 downto 0);
    sdclk  	: out std_ulogic;
    sdcke  	: out std_logic_vector (1 downto 0);    -- sdram clock enable
    sdcsn  	: out std_logic_vector (1 downto 0);    -- sdram chip select
    sdwen  	: out std_ulogic;                       -- sdram write enable
    sdrasn  	: out std_ulogic;                       -- sdram ras
    sdcasn  	: out std_ulogic;                       -- sdram cas
    sddqm   	: out std_logic_vector (7 downto 0);    -- sdram dqm
    dsutx  	: out std_ulogic; 			-- DSU tx data
    dsurx  	: in  std_ulogic;  			-- DSU rx data
    dsuen   	: in std_ulogic;
    dsubre  	: in std_ulogic;
    dsuact  	: out std_ulogic;
    txd1   	: out std_ulogic; 			-- UART1 tx data
    rxd1   	: in  std_ulogic;  			-- UART1 rx data
    txd2   	: out std_ulogic; 			-- UART2 tx data
    rxd2   	: in  std_ulogic;  			-- UART2 rx data
    ramsn  	: out std_logic_vector (4 downto 0);
    ramoen 	: out std_logic_vector (4 downto 0);
    rwen   	: out std_logic_vector (3 downto 0);
    oen    	: out std_ulogic;
    writen 	: out std_ulogic;
    read   	: out std_ulogic;
    iosn   	: out std_ulogic;
    romsn  	: out std_logic_vector (1 downto 0);
    gpio        : inout std_logic_vector(7 downto 0); 	-- I/O port

    emdio     	: inout std_logic;		-- ethernet PHY interface
    etx_clk 	: in std_ulogic;
    erx_clk 	: in std_ulogic;
    erxd    	: in std_logic_vector(3 downto 0);   
    erx_dv  	: in std_ulogic; 
    erx_er  	: in std_ulogic; 
    erx_col 	: in std_ulogic;
    erx_crs 	: in std_ulogic;
    etxd 	: out std_logic_vector(3 downto 0);   
    etx_en 	: out std_ulogic; 
    etx_er 	: out std_ulogic; 
    emdc 	: out std_ulogic;

    emddis 	: out std_logic;    
    epwrdwn 	: out std_ulogic;
    ereset 	: out std_ulogic;
    esleep 	: out std_ulogic;
    epause 	: out std_ulogic;

    pci_rst     : in std_ulogic;		-- PCI bus
    pci_clk 	: in std_ulogic;
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
    pci_req 	: inout std_ulogic;
    pci_serr    : inout std_ulogic;
    pci_host   	: in std_ulogic;
    pci_66	: in std_ulogic;
    pci_arb_req	: in  std_logic_vector(0 to 3);
    pci_arb_gnt	: out std_logic_vector(0 to 3);

    can_txd	: out std_ulogic;
    can_rxd	: in  std_ulogic;
    can_stb	: out std_ulogic
	);
end;

architecture rtl of leon3mp is

constant blength : integer := 12;
constant fifodepth : integer := 8;

constant sdbits : integer := 32 + 32*CFG_SD64;

signal vcc, gnd   : std_logic_vector(4 downto 0);
signal memi  : memory_in_type;
signal memo  : memory_out_type;
signal wpo   : wprot_out_type;
signal sdi   : sdctrl_in_type;
signal sdo   : sdram_out_type;
signal sdo2, sdo3 : sdctrl_out_type;

signal apbi  : apb_slv_in_type;
signal apbo  : apb_slv_out_vector := (others => apb_none);
signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

signal clkm, rstn, rstraw, pciclk, sdclkl : std_ulogic;
signal cgi   : clkgen_in_type;
signal cgo   : clkgen_out_type;
signal u1i, u2i, dui : uart_in_type;
signal u1o, u2o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type; 

signal pcii : pci_in_type;
signal pcio : pci_out_type;

signal ethi, ethi1, ethi2 : eth_in_type;
signal etho, etho1, etho2 : eth_out_type;
signal edcli : edcl_in_type;

signal gpti : gptimer_in_type;

signal      gpioi	: gpio_in_type;
signal      gpioo	: gpio_out_type;

signal can_lrx, can_ltx   : std_ulogic;
signal lclk, pci_lclk : std_ulogic;
signal pci_arb_req_n, pci_arb_gnt_n   : std_logic_vector(0 to 3);

signal tck, tms, tdi, tdo : std_ulogic;

constant IOAEN : integer := (CFG_SDEN / CFG_MEMC) + CFG_ETH ;
begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------
  
  vcc <= (others => '1'); gnd <= (others => '0');
  cgi.pllctrl <= "00"; cgi.pllrst <= rstraw;

  pllref_pad : clkpad generic map (tech => padtech) port map (pllref, cgi.pllref); 
  clk_pad : clkpad generic map (tech => padtech) port map (clk, lclk); 
  pci_clk_pad : clkpad generic map (tech => padtech, level => pci33) 
	    port map (pci_clk, pci_lclk); 
  clkgen0 : clkgen  		-- clock generator
    generic map (clktech, CFG_CLKMUL, CFG_CLKDIV, CFG_SDEN, 
	CFG_INVCLK, CFG_PCI, CFG_PCIDLL, CFG_PCISYSCLK)
    port map (lclk, pci_lclk, clkm, open, open, sdclkl, pciclk, cgi, cgo);
  sdclk_pad : outpad generic map (tech => padtech, slew => 1, strength => 24) 
	port map (sdclk, sdclkl);

  rst0 : rstgen			-- reset generator
  port map (resetn, clkm, cgo.clklock, rstn, rstraw);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl 		-- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
	rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO,
	ioen => IOAEN, nahbm => 8, nahbs => 8)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  cpu : for i in 0 to CFG_NCPU-1 generate
    u0 : leon3s			-- LEON3 processor      
    generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8, 
	0, CFG_MAC, pclow, 0, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE, 
	CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
	CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
        CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP, 
        CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR)
    port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso, 
    		irqi(i), irqo(i), dbgi(i), dbgo(i));
  end generate;
  errorn_pad : odpad generic map (tech => padtech) port map (errorn, dbgo(0).error);

  
  dsugen : if CFG_DSU = 1 generate
    dsu0 : dsu3			-- LEON3 Debug Support Unit
    generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#, 
       ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
    port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
    dsuen_pad : inpad generic map (tech => padtech) port map (dsuen, dsui.enable); 
    dsubre_pad : inpad generic map (tech => padtech) port map (dsubre, dsui.break); 
    dsuact_pad : outpad generic map (tech => padtech) port map (dsuact, dsuo.active);
  end generate;
  nodsu : if CFG_DSU = 0 generate 
    ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0: ahbuart		-- Debug UART
    generic map (hindex => CFG_NCPU, pindex => 7, paddr => 7)
    port map (rstn, clkm, dui, duo, apbi, apbo(7), ahbmi, ahbmo(CFG_NCPU));
    dsurx_pad : inpad generic map (tech => padtech) port map (dsurx, dui.rxd); 
    dsutx_pad : outpad generic map (tech => padtech) port map (dsutx, duo.txd);
  end generate;
  nouah : if CFG_AHB_UART = 0 generate apbo(7) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd(0));
  end generate;
  
----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  mg1 : if CFG_MEMC = 1 generate	-- 32-bit PROM/SRAM controller
    sr0 : srctrl generic map (hindex => 0, romaddr => CFG_ROMADDR,
	ramws => CFG_RAMWS, romws => CFG_PROMWS, ramaddr => 16#400#, 
	rmw => CFG_RAMRMW)
    port map (rstn, clkm, ahbsi, ahbso(0), memi, memo, sdo3);
    apbo(0) <= apb_none;
  end generate;
  sd1 : if CFG_MEMC < 2 generate
    sd0 : if CFG_SDEN = 1 generate 	-- separate SDRAM controller
      sdc : sdctrl generic map (hindex => 3, haddr => 16#600#, hmask => 16#F00#, 
	ioaddr => 1, fast => 0, pwron => 0, invclk => CFG_INVCLK, sdbits => sdbits)
      port map (rstn, clkm, ahbsi, ahbso(3), sdi, sdo2);
      sa_pad : outpadv generic map (width => 15, tech => padtech) 
	   port map (sa, sdo2.address);
      sd_pad : iopadv generic map (width => 32, tech => padtech) 
	   port map (sd(31 downto 0), sdo2.data, sdo2.bdrive, sdi.data(31 downto 0));
      sd2 : if CFG_SD64 = 1 generate
        sd_pad2 : iopadv generic map (width => 32) 
	     port map (sd(63 downto 32), sdo2.data, sdo2.bdrive, sdi.data(63 downto 32));
      end generate;
      sdcke_pad : outpadv generic map (width =>2, tech => padtech) 
	   port map (sdcke, sdo2.sdcke); 
      sdwen_pad : outpad generic map (tech => padtech) 
	   port map (sdwen, sdo2.sdwen);
      sdcsn_pad : outpadv generic map (width =>2, tech => padtech) 
	   port map (sdcsn, sdo2.sdcsn); 
      sdras_pad : outpad generic map (tech => padtech) 
	   port map (sdrasn, sdo2.rasn);
      sdcas_pad : outpad generic map (tech => padtech) 
	   port map (sdcasn, sdo2.casn);
      sddqm_pad : outpadv generic map (width =>8, tech => padtech) 
	   port map (sddqm, sdo2.dqm);
    end generate;
  end generate;
  sdsn : if (CFG_SDEN = 0) or (CFG_MEMC = 2)  generate ahbso(3) <= ahbs_none; end generate;

  mg2 : if CFG_MEMC = 2 generate 	-- LEON2 memory controller
    sr1 : mctrl generic map (hindex => 0, pindex => 0, romaddr => CFG_ROMADDR, 
	rommask => CFG_ROMMASK, paddr => 0, srbanks => 2, sden => CFG_SDEN, 
	invclk => CFG_INVCLK, sepbus => CFG_SEPBUS, sdbits => sdbits)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(0), apbi, apbo(0), wpo, sdo);
    sdpads : if CFG_SDEN = 1 generate 		-- no SDRAM controller
      sd2 : if CFG_SEPBUS = 1 generate
        sa_pad : outpadv generic map (width => 15) port map (sa, memo.sa);
        bdr : for i in 0 to 3 generate
          sd_pad : iopadv generic map (tech => padtech, width => 8)
          port map (sd(31-i*8 downto 24-i*8), memo.data(31-i*8 downto 24-i*8),
		memo.bdrive(i), memi.sd(31-i*8 downto 24-i*8));
          sd2 : if CFG_SD64 = 1 generate
            sd_pad2 : iopadv generic map (tech => padtech, width => 8)
            port map (sd(31-i*8+32 downto 24-i*8+32), memo.data(31-i*8 downto 24-i*8),
		memo.bdrive(i), memi.sd(31-i*8+32 downto 24-i*8+32));
          end generate;
        end generate;
      end generate;
      sdwen_pad : outpad generic map (tech => padtech) 
	   port map (sdwen, sdo.sdwen);
      sdras_pad : outpad generic map (tech => padtech) 
	   port map (sdrasn, sdo.rasn);
      sdcas_pad : outpad generic map (tech => padtech) 
	   port map (sdcasn, sdo.casn);
      sddqm_pad : outpadv generic map (width =>8, tech => padtech) 
	   port map (sddqm, sdo.dqm);
    end generate;
    sdcke_pad : outpadv generic map (width =>2, tech => padtech) 
	   port map (sdcke, sdo.sdcke); 
    sdcsn_pad : outpadv generic map (width =>2, tech => padtech) 
	   port map (sdcsn, sdo.sdcsn); 
  end generate;

  nosd0 : if (CFG_SDEN = 0) and (CFG_MEMC /= 2) generate 		-- no SDRAM controller
      sdcke_pad : outpadv generic map (width =>2, tech => padtech) 
	   port map (sdcke, sdo3.sdcke); 
      sdcsn_pad : outpadv generic map (width =>2, tech => padtech) 
	   port map (sdcsn, sdo3.sdcsn); 
  end generate;

  memi.brdyn <= '1'; memi.bexcn <= '1';
  memi.writen <= '1'; memi.wrn <= "1111"; memi.bwidth <= "10";

  mg0 : if CFG_MEMC = 0 generate	-- None PROM/SRAM controller
    apbo(0) <= apb_none; ahbso(0) <= ahbs_none;
    rams_pad : outpadv generic map (width => 5, tech => padtech) 
	port map (ramsn, vcc); 
    roms_pad : outpadv generic map (width => 2, tech => padtech) 
	port map (romsn, vcc(1 downto 0)); 
  end generate;

  mgpads : if CFG_MEMC /= 0 generate	-- prom/sram pads
    addr_pad : outpadv generic map (width => 28, tech => padtech) 
	port map (address, memo.address); 
    rams_pad : outpadv generic map (width => 5, tech => padtech) 
	port map (ramsn, memo.ramsn); 
    roms_pad : outpadv generic map (width => 2, tech => padtech) 
	port map (romsn, memo.romsn); 
    oen_pad  : outpad generic map (tech => padtech) 
	port map (oen, memo.oen);
    rwen_pad : outpadv generic map (width => 4, tech => padtech) 
	port map (rwen, memo.wrn); 
    roen_pad : outpadv generic map (width => 5, tech => padtech) 
	port map (ramoen, memo.ramoen);
    wri_pad  : outpad generic map (tech => padtech) 
	port map (writen, memo.writen);
    read_pad : outpad generic map (tech => padtech) 
	port map (read, memo.read); 
    iosn_pad : outpad generic map (tech => padtech) 
	port map (iosn, memo.iosn);
    bdr : for i in 0 to 3 generate
      data_pad : iopadv generic map (tech => padtech, width => 8)
      port map (data(31-i*8 downto 24-i*8), memo.data(31-i*8 downto 24-i*8),
	memo.bdrive(i), memi.data(31-i*8 downto 24-i*8));
    end generate;
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : ahbrom
      generic map (hindex => 8, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(8));
  end generate;
  nobpromgen : if CFG_AHBROMEN = 0 generate
     ahbso(8) <= ahbs_none;
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl				-- AHB/APB bridge
  generic map (hindex => 1, haddr => CFG_APBADDR)
  port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart			-- UART 1
    generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
	fifosize => CFG_UART1_FIFO)
    port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd <= rxd1; u1i.ctsn <= '0'; u1i.extclk <= '0'; txd1 <= u1o.txd;
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

  ua2 : if CFG_UART2_ENABLE /= 0 generate
    uart2 : apbuart			-- UART 2
    generic map (pindex => 9, paddr => 9,  pirq => 3, fifosize => CFG_UART2_FIFO)
    port map (rstn, clkm, apbi, apbo(9), u2i, u2o);
    u2i.rxd <= rxd2; u2i.ctsn <= '0'; u2i.extclk <= '0'; txd2 <= u2o.txd;
  end generate;
  noua1 : if CFG_UART2_ENABLE = 0 generate apbo(9) <= apb_none; end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp			-- interrupt controller
    generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
    port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer 			-- timer unit
    generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ, 
	sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM, 
	nbits => CFG_GPT_TW)
    port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti.dhalt <= dsuo.tstop; gpti.extclk <= '0';
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GR GPIO unit
    grgpio0: grgpio
      generic map( pindex => 11, paddr => 11, imask => CFG_GRGPIO_IMASK, nbits => 8)
      port map( rstn, clkm, apbi, apbo(11), gpioi, gpioo);

      pio_pads : for i in 0 to 7 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (gpio(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
      end generate;
   end generate;

-----------------------------------------------------------------------
---  PCI   ------------------------------------------------------------
-----------------------------------------------------------------------

  pp : if CFG_PCI /= 0 generate

    pci_gr0 : if CFG_PCI = 1 generate	-- simple target-only
      pci0 : pci_target generic map (hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
	device_id => CFG_PCIDID, vendor_id => CFG_PCIVID)
      port map (rstn, clkm, pciclk, pcii, pcio, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG));
    end generate;

    pci_mtf0 : if CFG_PCI = 2 generate	-- master/target with fifo
      pci0 : pci_mtf generic map (memtech => memtech, hmstndx => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG, 
	  fifodepth => log2(CFG_PCIDEPTH), device_id => CFG_PCIDID, vendor_id => CFG_PCIVID,
	  hslvndx => 4, pindex => 4, paddr => 4, haddr => 16#E00#,
	  ioaddr => 16#400#, nsync => 2)
      port map (rstn, clkm, pciclk, pcii, pcio, apbi, apbo(4),
	ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), ahbsi, ahbso(4));
    end generate;

    pci_mtf1 : if CFG_PCI = 3 generate	-- master/target with fifo and DMA
      dma : pcidma generic map (memtech => memtech, dmstndx => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1, 
	  dapbndx => 5, dapbaddr => 5, blength => blength, mstndx => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
	  fifodepth => log2(fifodepth), device_id => CFG_PCIDID, vendor_id => CFG_PCIVID,
	  slvndx => 4, apbndx => 4, apbaddr => 4, haddr => 16#E00#, ioaddr => 16#800#, 
	  nsync => 1)
      	port map (rstn, clkm, pciclk, pcii, pcio, apbo(5),  ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1), 
 	  apbi, apbo(4), ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), ahbsi, ahbso(4));
    end generate;

    pci_trc0 : if CFG_PCITBUFEN /= 0 generate	-- PCI trace buffer
      pt0 : pcitrace generic map (depth => (6 + log2(CFG_PCITBUF/256)), 
	memtech => memtech, pindex  => 8, paddr => 16#100#, pmask => 16#f00#)
        port map ( rstn, clkm, pciclk, pcii, apbi, apbo(8));
    end generate;

    pcia0 : if CFG_PCI_ARB = 1 generate	-- PCI arbiter
      pciarb0 : pciarb generic map (pindex => 10, paddr => 10, 
				    apb_en => CFG_PCI_ARBAPB)
       port map ( clk => pciclk, rst_n => pcii.rst,
         req_n => pci_arb_req_n, frame_n => pcii.frame,
         gnt_n => pci_arb_gnt_n, pclk => clkm, 
         prst_n => rstn, apbi => apbi, apbo => apbo(10)
       );
      pgnt_pad : outpadv generic map (tech => padtech, width => 4) 
	port map (pci_arb_gnt, pci_arb_gnt_n);
      preq_pad : inpadv generic map (tech => padtech, width => 4) 
	port map (pci_arb_req, pci_arb_req_n);
    end generate;

    pcipads0 : pcipads generic map (padtech => padtech)	-- PCI pads
    port map ( pci_rst, pci_gnt, pci_idsel, pci_lock, pci_ad, pci_cbe,
      pci_frame, pci_irdy, pci_trdy, pci_devsel, pci_stop, pci_perr,
      pci_par, pci_req, pci_serr, pci_host, pci_66, pcii, pcio );

  end generate;

  nop1 : if CFG_PCI <= 1 generate apbo(4) <= apb_none; end generate;
  nop2 : if CFG_PCI <= 2 generate apbo(5) <= apb_none; end generate;
  nop3 : if CFG_PCI <= 1 generate ahbso(4) <= ahbs_none; end generate;
  notrc : if CFG_PCITBUFEN = 0 generate apbo(8) <= apb_none; end generate;
  noarb : if CFG_PCI_ARB = 0 generate apbo(10) <= apb_none; end generate;


-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

    eth1 : if CFG_ETH = 1 generate -- Opencores ethernet MAC
      e1 : eth_oc 
      generic map (mstndx => CFG_NCPU+CFG_AHB_UART+CFG_PCI+CFG_AHB_JTAG, slvndx => 5, 
	ioaddr => CFG_ETHIO, irq => 12, memtech => memtech)
      port map ( rst => rstn, clk => clkm, ahbsi => ahbsi, ahbso => ahbso(5),
        ahbmi  => ahbmi, ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_PCI+CFG_AHB_JTAG), 
	ethi => ethi1, etho  => etho1);
    end generate;
    neth : if CFG_ETH = 0 generate ahbso(5) <= ahbs_none; end generate;

    eth2 : if CFG_AHB_ETH = 1 generate -- Ethernet DSU
      e2 : edcl generic map (mstndx => CFG_NCPU+CFG_AHB_UART+CFG_PCI+CFG_ETH+CFG_AHB_JTAG,
      macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, ipaddrh => CFG_ETH_IPM, 
      ipaddrl => CFG_ETH_IPL, udpport => 8000, memtech => memtech, bufsize => CFG_ETH_BUF, 
      speed => CFG_ETH100)
      port map (rstn, clkm, edcli, ahbmi, 
	        ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_PCI+CFG_ETH+CFG_AHB_JTAG), ethi2, etho2);
      edcli.lsbip <= "0000";
    end generate;

    earb : if (CFG_ETH = 1) and (CFG_AHB_ETH = 1) generate -- PHY arbiter
      ea0 :  eth_arb port map (rstn, ethi.tx_clk, ethi, etho, etho1, ethi1, etho2, ethi2);
    end generate;

    edr0 : if (CFG_ETH = 1) and (CFG_AHB_ETH = 0) generate
      ethi1 <= ethi; etho <= etho1;
    end generate;

    edr1 : if (CFG_ETH = 0) and (CFG_AHB_ETH = 1) generate 
      ethi2 <= ethi; etho <= etho2;
    end generate;

    ethpads : if (CFG_ETH = 1) or (CFG_AHB_ETH = 1) generate -- eth pads
      emdio_pad : iopad generic map (tech => padtech) 
      port map (emdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
      etxc_pad : clkpad generic map (tech => padtech, arch => 1) 
	port map (etx_clk, ethi.tx_clk);
      erxc_pad : clkpad generic map (tech => padtech, arch => 1) 
	port map (erx_clk, ethi.rx_clk);
      erxd_pad : inpadv generic map (tech => padtech, width => 4) 
	port map (erxd, ethi.rxd);
      erxdv_pad : inpad generic map (tech => padtech) 
	port map (erx_dv, ethi.rx_dv);
      erxer_pad : inpad generic map (tech => padtech) 
	port map (erx_er, ethi.rx_er);
      erxco_pad : inpad generic map (tech => padtech) 
	port map (erx_col, ethi.rx_col);
      erxcr_pad : inpad generic map (tech => padtech) 
	port map (erx_crs, ethi.rx_crs);

      etxd_pad : outpadv generic map (tech => padtech, width => 4) 
	port map (etxd, etho.txd);
      etxen_pad : outpad generic map (tech => padtech) 
	port map ( etx_en, etho.tx_en);
      etxer_pad : outpad generic map (tech => padtech) 
	port map (etx_er, etho.tx_er);
      emdc_pad : outpad generic map (tech => padtech) 
	port map (emdc, etho.mdc);

      emdis_pad : outpad generic map (tech => padtech) 
	port map (emddis, vcc(0));
      eepwrdwn_pad : outpad generic map (tech => padtech) 
	port map (epwrdwn, gnd(0));
      esleep_pad : outpad generic map (tech => padtech) 
	port map (esleep, gnd(0));
      epause_pad : outpad generic map (tech => padtech) 
	port map (epause, gnd(0));
      ereset_pad : outpad generic map (tech => padtech) 
	port map (ereset, gnd(0));

    end generate;

-----------------------------------------------------------------------
---  CAN --------------------------------------------------------------
-----------------------------------------------------------------------
   can0 : if CFG_CAN = 1 generate 
     can0 : can_oc generic map (slvndx => 6, ioaddr => CFG_CANIO,
    	iomask => 16#FF0#, irq => CFG_CANIRQ, memtech => memtech)
      port map (rstn, clkm, ahbsi, ahbso(6), can_lrx, can_ltx );
   end generate;
   ncan : if CFG_CAN = 0 generate ahbso(6) <= ahbs_none; end generate;

   can_stb <= '0';   -- no standby

   can_loopback : if CFG_CANLOOP = 1 generate 
     can_lrx <= can_ltx;
   end generate;

   can_pads : if CFG_CANLOOP = 0 generate 
      can_tx_pad : outpad generic map (tech => padtech) 
	port map (can_txd, can_ltx);
      can_rx_pad : inpad generic map (tech => padtech) 
	port map (can_rxd, can_lrx);
    end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ocram : if CFG_AHBRAMEN = 1 generate 
    ahbram0 : ahbram generic map (hindex => 7, haddr => CFG_AHBRADDR, 
	tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ)
    port map ( rstn, clkm, ahbsi, ahbso(7));
  end generate;
  nram : if CFG_AHBRAMEN = 0 generate ahbso(7) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_PCI+CFG_ETH+CFG_AHB_ETH+CFG_AHB_JTAG) to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;
  nam2 : if CFG_PCI > 1 generate
    ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_PCI-1) <= ahbm_none;
  end generate;
  nap0 : for i in 12 to NAPBSLV-1 generate apbo(i) <= apb_none; end generate;
  apbo(6) <= apb_none;
  nah0 : for i in 9 to NAHBSLV-1 generate ahbso(i) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  apbrep : apbreport 		-- APB reporting module
  generic map (haddr => CFG_APBADDR)
  port map (apbo);
-- pragma translate_on 

-- pragma translate_off
  ahbrep : ahbreport 		-- AHB reporting module
  generic map (ioaddr => CFG_AHBIO, nmasters => 8, nslaves => 8, ioen => IOAEN)
  port map (ahbmo, ahbso);
-- pragma translate_on 

-- pragma translate_off
  x : report_version 
  generic map (
   msg1 => "LEON3 Demonstration design",
   msg2 => "GRLIB Version " & tost(LIBVHDL_VERSION/100) & "." & tost(LIBVHDL_VERSION mod 100),
   msg3 => "Target technology: " & tech_table(fabtech) & ",  memory library: " & tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;
