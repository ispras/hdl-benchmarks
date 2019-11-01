-----------------------------------------------------------------------------
-- Entity:      pci
-- File:        pci.vhd
-- Author:      Jiri Gaisler - Gaisler Research
-- Description: Package with component and type declarations for PCI cores
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.devices.all;
use gaisler.misc.all;

package pci is

type pci_in_type is record
  rst 	   	: std_ulogic;
  gnt 	   	: std_ulogic;
  idsel 	: std_ulogic;
  ad 	   	: std_logic_vector(31 downto 0);
  cbe 	   	: std_logic_vector(3 downto 0);
  frame		: std_ulogic;
  irdy    	: std_ulogic;
  trdy    	: std_ulogic;
  devsel  	: std_ulogic;
  stop    	: std_ulogic;
  lock    	: std_ulogic;
  perr    	: std_ulogic;
  serr    	: std_ulogic;
  par 	   	: std_ulogic;
  host   	: std_ulogic;
  pci66		: std_ulogic;
  pme_status	: std_ulogic;
end record;


type pci_out_type is record
  aden		: std_ulogic;
  vaden         : std_logic_vector(31 downto 0);
  cbeen    	: std_logic_vector(3 downto 0);
  frameen   	: std_ulogic;
  irdyen    	: std_ulogic;
  trdyen    	: std_ulogic;
  devselen	: std_ulogic;
  stopen   	: std_ulogic;
  ctrlen    	: std_ulogic;
  perren    	: std_ulogic;
  paren 	: std_ulogic;
  reqen		: std_ulogic;
  locken    	: std_ulogic;
  serren    	: std_ulogic;
  inten     	: std_ulogic;
  req    	: std_ulogic;
  ad 	   	: std_logic_vector(31 downto 0);
  cbe 	   	: std_logic_vector(3 downto 0);
  frame  	: std_ulogic;
  irdy   	: std_ulogic;
  trdy   	: std_ulogic;
  devsel 	: std_ulogic;
  stop   	: std_ulogic;
  perr   	: std_ulogic;
  serr   	: std_ulogic;
  par 	   	: std_ulogic;
  lock   	: std_ulogic;
  power_state	: std_logic_vector(1 downto 0);
  pme_enable	: std_ulogic;
  pme_clear	: std_ulogic;
  int		: std_ulogic;
end record;


  component pci_target
  generic (
    hindex    : integer := 0;
    abits     : integer := 21;
    device_id : integer := 0;		-- PCI device ID
    vendor_id : integer := 0;	        -- PCI vendor ID
    nsync : integer range 1 to 2 := 1;	-- 1 or 2 sync regs between clocks
    oepol     : integer := 0
  ); 
   port( 
      rst       : in std_ulogic;   
      clk       : in std_ulogic;   
      pciclk    : in std_ulogic;   
      pcii	: in  pci_in_type;
      pcio	: out pci_out_type;
      ahbmi 	: in  ahb_mst_in_type;
      ahbmo 	: out ahb_mst_out_type
  );
  end component;

  component pci_mt 
  generic (
    hmstndx   : integer := 0;
    abits     : integer := 21;
    device_id : integer := 0;		-- PCI device ID
    vendor_id : integer := 0;	        -- PCI vendor ID
    master    : integer := 1; 		-- Enable PCI Master
    hslvndx   : integer := 0;
    haddr     : integer := 16#F00#;
    hmask     : integer := 16#F00#;
    ioaddr    : integer := 16#000#;
    nsync : integer range 1 to 2 := 1;	-- 1 or 2 sync regs between clocks
    oepol     : integer := 0 
  );
   port(
      rst       : in std_logic;
      pcirst    : in std_logic;
      clk       : in std_logic;
      pciclk    : in std_logic;
      pcii	: in  pci_in_type;
      pcio	: out pci_out_type;
      ahbmi 	: in  ahb_mst_in_type;
      ahbmo 	: out ahb_mst_out_type;
      ahbsi 	: in  ahb_slv_in_type;
      ahbso 	: out ahb_slv_out_type
  );
  end component;

  component dmactrl
  generic (
    hindex    : integer := 0;
    pindex    : integer := 0;
    paddr     : integer := 0;
    pmask     : integer := 16#fff#;
    blength   : integer := 4);
  port (
    rst       : in std_logic;
    clk       : in std_logic;
    apbi      : in apb_slv_in_type;
    apbo      : out apb_slv_out_type;
    ahbmi     : in ahb_mst_in_type;
    ahbmo     : out ahb_mst_out_type;
    ahbsi0    : in ahb_slv_in_type;
    ahbso0    : out ahb_slv_out_type;
    ahbsi1    : out ahb_slv_in_type;
    ahbso1    : in ahb_slv_out_type);
  end component;

  component pci_mtf
  generic (
    memtech   : integer := 0;
    hmstndx   : integer := 0;
    dmamst    : integer := NAHBMST;
    readpref  : integer := 0;
    abits     : integer := 21;
    dmaabits  : integer := 26;
    fifodepth : integer := 3; -- FIFO depth
    device_id : integer := 0; -- PCI device ID
    vendor_id : integer := 0; -- PCI vendor ID
    master    : integer := 1; -- Enable PCI Master
    hslvndx   : integer := 0;
    pindex    : integer := 0;
    paddr     : integer := 0;
    pmask     : integer := 16#fff#;
    haddr     : integer := 16#F00#;
    hmask     : integer := 16#F00#;
    ioaddr    : integer := 16#000#;
    nsync     : integer range 1 to 2 := 2;	-- 1 or 2 sync regs between clocks
    oepol     : integer := 0
  );
   port(
      rst       : in std_logic;
      clk       : in std_logic;
      pciclk    : in std_logic;
      pcii      : in  pci_in_type;
      pcio      : out pci_out_type;
      apbi      : in apb_slv_in_type;
      apbo      : out apb_slv_out_type;
      ahbmi     : in  ahb_mst_in_type;
      ahbmo     : out ahb_mst_out_type;
      ahbsi     : in  ahb_slv_in_type;
      ahbso     : out ahb_slv_out_type
);
end component;

component pcitrace
  generic (
    depth     : integer range 6 to 12 := 8;
    iregs     : integer := 1;
    memtech   : integer := 0;
    pindex    : integer := 0;
    paddr     : integer := 0;
    pmask     : integer := 16#f00#
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    pciclk : in  std_ulogic;
    pcii   : in  pci_in_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type
  );
end component;

component pcipads 
  generic (
    padtech      : integer := 0;
    noreset      : integer := 0;
    oepol        : integer := 0
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
end component;

component pcidma
  generic (
    memtech   : integer := 0;
    dmstndx   : integer := 0;
    dapbndx   : integer := 0;
    dapbaddr  : integer := 0;
    dapbmask  : integer := 16#fff#;
    blength   : integer := 16;
    mstndx    : integer := 0;
    abits     : integer := 21;
    dmaabits  : integer := 26;
    fifodepth : integer := 3; -- FIFO depth
    device_id : integer := 0; -- PCI device ID
    vendor_id : integer := 0; -- PCI vendor ID
    slvndx    : integer := 0;
    apbndx    : integer := 0;
    apbaddr   : integer := 0;
    apbmask   : integer := 16#fff#;
    haddr     : integer := 16#F00#;
    hmask     : integer := 16#F00#;
    ioaddr    : integer := 16#000#;
    nsync     : integer range 1 to 2 := 2	-- 1 or 2 sync regs between clocks
);
   port(
      rst       : in std_logic;
      clk       : in std_logic;
      pciclk    : in std_logic;
      pcii      : in  pci_in_type;
      pcio      : out pci_out_type;
      dapbo     : out apb_slv_out_type;
      dahbmo    : out ahb_mst_out_type;
      apbi      : in apb_slv_in_type;
      apbo      : out apb_slv_out_type;
      ahbmi     : in  ahb_mst_in_type;
      ahbmo     : out ahb_mst_out_type;
      ahbsi     : in  ahb_slv_in_type;
      ahbso     : out ahb_slv_out_type
);
end component;

  component pciahbmst
  generic (
    hindex  : integer := 0;
    hirq    : integer := 0;
    venid   : integer := VENDOR_GAISLER;
    devid   : integer := 0;
    version : integer := 0;
    chprot  : integer := 3;
    incaddr : integer := 0);
   port (
      rst  : in  std_ulogic;
      clk  : in  std_ulogic;
      dmai : in ahb_dma_in_type;
      dmao : out ahb_dma_out_type;
      ahbi : in  ahb_mst_in_type;
      ahbo : out ahb_mst_out_type
      );
  end component;

end;
