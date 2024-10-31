
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.tech.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.pci.all;
use gaisler.net.all;
use gaisler.pads.all;
use work.debug.all;
use work.grcomp.all;

entity netcard is
  generic (
    tech    : integer := inferred;
    memtech : integer := inferred;
    dbg     : integer := 1;
    pcitrc  : integer := 1;
    pci     : integer := 2
  );
  port (
    resetn	: in  std_ulogic;
    clk		: in  std_ulogic;
    dsutx  	: out std_ulogic; 			-- DSU tx data
    dsurx  	: in  std_ulogic;  			-- DSU rx data
    dsuen   	: in std_ulogic;
    dsubre  	: in std_ulogic;
    dsuact  	: out std_ulogic;

    emdio     	: inout std_logic;
    etx_clk 	: in std_logic;
    erx_clk 	: in std_logic;
    erxd    	: in std_logic_vector(3 downto 0);   
    erx_dv  	: in std_logic; 
    erx_er  	: in std_logic; 
    erx_col 	: in std_logic;
    erx_crs 	: in std_logic;
    etxd 	: out std_logic_vector(3 downto 0);   
    etx_en 	: out std_logic; 
    etx_er 	: out std_logic; 
    emdc 	: out std_logic;

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
    pci_irq     : out std_ulogic;
    pci_host   	: in std_ulogic;
    pci_66	: in std_ulogic
  );
end;

architecture rtl of netcard is

signal apbi : apb_slv_in_type;
signal apbo : apb_slv_out_vector := (others => apb_none);
signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);
signal clkm, rstn, pciclk : std_ulogic;
signal cgi : clkgen_in_type;
signal cgo : clkgen_out_type;

signal dui : uart_in_type;
signal duo : uart_out_type;

signal pcii : pci_in_type;
signal pcio : pci_out_type;

signal ethi : eth_in_type;
signal etho : eth_out_type;

signal irqn, lclk : std_logic;

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  cgi.pllctrl <= "00"; cgi.pllrst <= resetn; cgi.pllref <= '0';

  clkgen0 : clkgen  		-- clock generator
  generic map (clk_mul => 3, clk_div => 2, pcien => pci, tech => tech)
  port map (lclk, pci_clk, clkm, open, open, open, pciclk, cgi, cgo);
  clk_pad : clkpad generic map (tech => tech) port map (clk, lclk); 


  rst0 : rstgen			-- reset generator
  port map (resetn, clkm, cgo.clklock, rstn);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl 		-- AHB arbiter/multiplexer
  generic map (nahbm => 4, nahbs => 4, ioen => 0)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  e0 : eth_oc
  generic map (mstndx => 1, slvndx => 3, ioaddr => 16#010#, irq => 11)
  port map ( rst => rstn, clk => clkm, ahbsi => ahbsi, ahbso => ahbso(3),
       ahbmi => ahbmi, ahbmo => ahbmo(1), ethi => ethi, etho  => etho);

  emdio       <= etho.mdio_o when etho.mdio_oe = '0' else 'Z';
  ethi.mdio_i <= emdio;
  ethi.tx_clk <= etx_clk;
  ethi.rx_clk <= erx_clk;
  ethi.rxd    <= erxd;
  ethi.rx_dv  <= erx_dv;
  ethi.rx_er  <= erx_er;
  ethi.rx_col <= erx_col;
  ethi.rx_crs <= erx_crs;
  etxd        <= etho.txd;
  etx_en      <= etho.tx_en;
  etx_er      <= etho.tx_er;
  emdc        <= etho.mdc;
  irqn        <= ahbso(3).hirq(11);

  irq_pad : odpad generic map (tech => tech, level => pci33)
  port map (pci_irq, irqn);

----------------------------------------------------------------------
---  AHB/APB Bridge  -------------------------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl			-- AHB/APB bridge
  generic map (hindex => 0, haddr => 16#800#)
  port map (rstn, clkm, ahbsi, ahbso(0), apbi, apbo );

----------------------------------------------------------------------
---  AHB RAM  --------------------------------------------------------
----------------------------------------------------------------------

  ram0 : ahbram 
  generic map (hindex => 2, haddr => 0, hmask => 16#FFF#,
	tech => memtech, kbytes => 8)
  port map (rstn, clkm, ahbsi, ahbso(2));

-----------------------------------------------------------------------
---  PCI   ------------------------------------------------------------
-----------------------------------------------------------------------

  pp : if pci /= 0 generate
    pci_gr0 : if pci = 1 generate
      pci0 : pci_target generic map (hindex => 0,
	device_id => 16#0210#, vendor_id => 16#16E3#)
      port map (rstn, clkm, pciclk, pcii, pcio, ahbmi, ahbmo(0));
    end generate;
    pci_mtf0 : if pci = 2 generate
      pci0 : pci_mtf generic map (memtech => memtech, hmstndx => 0, 
	  fifodepth => 6, device_id => 16#0210#, vendor_id => 16#16E3#,
	  hslvndx => 1, pindex => 6, paddr => 2, haddr => 16#E00#,
	  ioaddr => 16#400#, nsync => 2)
      port map (rstn, clkm, pciclk, pcii, pcio, apbi, apbo(6),
	ahbmi, ahbmo(0), ahbsi, ahbso(1));
    end generate;
    pci_trc0 : if pcitrc /= 0 generate
      pt0 : pcitrace generic map (memtech => memtech, pindex  => 3, 
			     paddr => 16#100#, pmask => 16#f00#)
            port map ( rstn, clkm, pciclk, pcii, apbi, apbo(3));
    end generate;
    pcipads0 : pcipads generic map (tech)
    port map ( pci_rst, pci_gnt, pci_idsel, pci_lock, pci_ad, pci_cbe,
      pci_frame, pci_irdy, pci_trdy, pci_devsel, pci_stop, pci_perr,
      pci_par, pci_req, pci_serr, pci_host, pci_66, pcii, pcio );
  end generate;

----------------------------------------------------------------------
---  Optional DSU UART -----------------------------------------------
----------------------------------------------------------------------

  dcomgen : if dbg = 1 generate
    dcom0: ahbuart		-- Debug UART
    generic map (hindex => 2, pindex => 1, paddr => 1)
    port map (rstn, clkm, dui, duo, apbi, apbo(1), ahbmi, ahbmo(2));
    dui.rxd <= dsurx; dsutx <= duo.txd;
  end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  apbrep : apbreport 		-- APB reporting module
  generic map (haddr => 16#800#)
  port map (apbo);
-- pragma translate_on 

-- pragma translate_off
  ahbrep : ahbreport 		-- AHB reporting module
  port map (ahbmo, ahbso);
-- pragma translate_on 

-- pragma translate_off
  x : report_version 
  generic map (
   msg1 => "Network Card Demonstration design",
   msg2 => "GRLIB Version " & tost(LIBVHDL_VERSION/100) & "." & tost(LIBVHDL_VERSION mod 100),
   msg3 => "Target technology: " & tech_table(tech) & ",  memory library: " & tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;
