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
-- Entity:      can_oc
-- File:        can_oc.vhd
-- Author:      Harald Obereder, Jiri Gaisler - Gaisler Research
-- Description: AHB interface for the OpenCores CAN MAC
------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.devices.all;
use gaisler.net.all;
use gaisler.misc.all;
use gaisler.devices.all;
use gaisler.memory.all;
use work.ocrcomp.all;
use work.grcomp.all;

entity can_oc is                   
   generic (
    slvndx    : integer := 0;
    ioaddr    : integer := 16#000#;
    iomask    : integer := 16#FF0#;
    irq       : integer := 0;
    memtech   : integer := 0);
   port (                          
      resetn  : in  std_logic;        
      clk     : in  std_logic;        
      ahbsi   : in  ahb_slv_in_type; 
      ahbso   : out ahb_slv_out_type;
      can_rxi : in  std_logic;      
      can_txo : out std_logic    
   );                           
end;                               

architecture rtl of can_oc is 

constant REVISION : amba_version_type := 0;

constant hconfig : ahb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_CANAHB , 0, REVISION, irq),
  4 => ahb_iobar (ioaddr, iomask),
  others => zero32);

--      // AHB interface
--      // AHB common
signal hclk : std_logic;
signal hreset : std_logic;
signal hwdata : std_logic_vector(7 downto 0);
signal hrdata : std_logic_vector(7 downto 0);
       
--     // AHB slave   
signal haddr : std_logic_vector(7 downto 0);
signal hready_ba : std_logic;
signal hsel  : std_logic;
signal hresp : std_logic_vector(1 downto 0);
signal hwrite : std_logic;
signal hready : std_logic;
       
--     // AHB Additional
signal htrans : std_logic_vector(1 downto 0);
signal hsize : std_logic_vector(2 downto 0);
signal hburst : std_logic_vector(2 downto 0);
       
signal hmaster : std_logic_vector(3 downto 0);
signal hmastlock : std_logic;
signal hsplit : std_logic_vector(15 downto 0);
       
--     // Wishbone interface
--     // WISHBONE common  
signal wbm_dat_i : std_logic_vector(7 downto 0);
signal wbm_dat_o : std_logic_vector(7 downto 0);   
       
--     // WISHBONE slave   
signal wbm_adr_o : std_logic_vector(7 downto 0);
signal wbm_cyc_o : std_logic;
signal wbm_stb_o : std_logic;
signal wbm_we_o  : std_logic;
signal wbm_ack_i : std_logic;
       
--     // WISHBONE Additional
signal wb_inta_i : std_logic;    
signal wbm_sel_o : std_logic_vector(3 downto 0);
signal wbm_rty_i : std_logic;
signal wbm_err_i : std_logic;

--     // miscellaneous signals
signal irq_o : std_logic;
signal irqo_tick :  std_logic_vector(NAHBIRQ-1 downto 0);
signal irqo_reg : std_logic;

--      //TX                                                 
signal tx_o :std_logic;    
--      //RX                                                 
signal rx_i : std_logic;

-- // port connections for Ram
--//64x8
signal q_dp_64x8	: std_logic_vector(7 downto 0);
signal data_64x8	: std_logic_vector(7 downto 0);
signal wren_64x8	: std_logic;
signal rden_64x8	: std_logic;
signal wraddress_64x8	: std_logic_vector(5 downto 0);
signal rdaddress_64x8	: std_logic_vector(5 downto 0);
--//64x4
signal q_dp_64x4	: std_logic_vector(3 downto 0);
signal data_64x4	: std_logic_vector(3 downto 0);
signal wren_64x4x1	: std_logic;
signal wraddress_64x4x1 : std_logic_vector(5 downto 0);
signal rdaddress_64x4x1	: std_logic_vector(5 downto 0);
--//64x1
signal q_dp_64x1	:  std_logic_vector(0 downto 0);
signal data_64x1	: std_logic_vector(0 downto 0);

signal gnd : std_ulogic;

begin

  gnd <= '0';

  can : can_top port map (
  
--      // CAN    
     clk_i => hclk,               -- Can clock

--      // WISHBONE common                                   
    wb_clk_i => hclk,
    wb_rst_i => hreset,
    wb_dat_i => wbm_dat_o,
    wb_dat_o => wbm_dat_i,
 
--      // WISHBONE slave                                    
    wb_adr_i => wbm_adr_o,
    wb_cyc_i => wbm_cyc_o,
    wb_stb_i => wbm_stb_o,
    wb_we_i  => wbm_we_o,
    wb_ack_o => wbm_ack_i,
    
--      //TX                                                 
    tx_o => tx_o,    
--      //RX                                                 
    rx_i => rx_i,

--      //Additional Signals
    bus_off_on => open ,  
    irq_on => wb_inta_i,
    clkout_o => open ,
    -- // port connections for Ram
    --//64x8
    q_dp_64x8			=> q_dp_64x8 ,
    data_64x8			=> data_64x8,
    wren_64x8			=> wren_64x8,
    rden_64x8			=> rden_64x8,
    wraddress_64x8		=> wraddress_64x8,
    rdaddress_64x8		=> rdaddress_64x8,
    --//64x4
    q_dp_64x4			=> q_dp_64x4,
    data_64x4			=> data_64x4,
    wren_64x4x1			=> wren_64x4x1,
    wraddress_64x4x1		=> wraddress_64x4x1,
    rdaddress_64x4x1		=> rdaddress_64x4x1,
    --//64x1
    q_dp_64x1			=> q_dp_64x1,
    data_64x1			=> data_64x1
    );
    

	fifo : syncram_2p 
		generic map(memtech,6,8,0)
		port map(
	rclk     => hclk, 
	renable  => rden_64x8, 
      	wclk	 => hclk,
	raddress => rdaddress_64x8,
	waddress => wraddress_64x8,
	datain   => data_64x8,
     	write    => wren_64x8,
	dataout  => q_dp_64x8
	);

	info_fifo : syncram_2p 
		generic map(memtech,6,4,0)
		port map(
	rclk     => hclk, 
     	wclk	 => hclk,
	raddress => rdaddress_64x4x1,
	waddress => wraddress_64x4x1,
	datain   => data_64x4,
     	write    => wren_64x4x1,
	dataout  => q_dp_64x4,
	renable  =>gnd 
	);
	
	
	
	overrun_fifo : syncram_2p
		generic map(0,6,1,0) 
		port map(
	rclk     => hclk, 
     	wclk	 => hclk,
	raddress => rdaddress_64x4x1,
	waddress => wraddress_64x4x1,
	datain   => data_64x1,
     	write    => wren_64x4x1,
	dataout  => q_dp_64x1,
	renable  => gnd
	);




  bridge : ahb2wb port map (
  
--      // AHB interface
--      // AHB common
    hclk => hclk,
    hresetn => resetn,
    hwdata => hwdata,
    hrdata => hrdata,

--      // AHB slave   
    haddr => haddr,
    hready_ba => hready_ba,
    hsel => hsel,
    hresp => hresp,
    hwrite => hwrite,
    hready => hready,

--      // AHB Additional
    htrans => htrans,
    hsize => hsize,
    hburst => hburst,
    
    hmaster => hmaster,
    hmastlock => hmastlock,
    hsplit => hsplit,

--      // Wishbone interface
--      // WISHBONE common  
   wbm_dat_i => wbm_dat_i,
   wbm_dat_o => wbm_dat_o,

--      // WISHBONE slave   
   wbm_adr_o => wbm_adr_o,
   wbm_cyc_o => wbm_cyc_o,
   wbm_stb_o => wbm_stb_o,
   wbm_we_o  => wbm_we_o,
   wbm_ack_i => wbm_ack_i,

--      // WISHBONE Additional
   wb_inta_i => wb_inta_i,
   wbm_sel_o => open ,
   wbm_rty_i => wbm_rty_i,
   wbm_err_i => wbm_err_i,

--     // miscellaneous signals
   irq_o => irq_o  

    );
    
    -- Interrupt goes to low when appeard and is normal high
    -- but the irq controller from leon is active high and the interrupt should appear only
    -- for 1 Clk cycle,
    
    regs : process(clk)
    begin 
      if rising_edge(clk) then irqo_reg <= not irq_o; end if;
    end process;
    irqcom : process (irqo_reg, irq_o)
    variable irqvec : std_logic_vector(NAHBIRQ-1 downto 0);
    begin
      irqvec := (others => '0');
      irqvec(irq) := (not(irqo_reg) and not (irq_o));
      irqo_tick <= irqvec;
    end process;
    
--      // convert signals from verilog to VHDL style

--      // fill ahb slave-in vector
    hsel      <= ahbsi.HSEL(slvndx);
    hready_ba <= ahbsi.HREADY;
    haddr     <= ahbsi.HADDR(7 downto 0);
    hwrite    <= ahbsi.HWRITE;
    htrans    <= ahbsi.HTRANS;
    hsize     <= ahbsi.HSIZE;
    hburst    <= ahbsi.HBURST;
    hwdata    <= ahbsi.HWDATA(7 downto 0);
    hmaster   <= ahbsi.HMASTER;
    hmastlock <= ahbsi.HMASTLOCK;
    

--      // fill ahb slave-out vector
--    ahbso <= (hready, hresp, hrdata, hsplit);
    ahbso.HREADY  <= hready;
    ahbso.HRESP   <= hresp;
    ahbso.HRDATA(31 downto 24) <= hrdata;
    ahbso.HRDATA(23 downto 16) <= hrdata;
    ahbso.HRDATA(15 downto 8) <= hrdata;
    ahbso.HRDATA(7 downto 0) <= hrdata;
    ahbso.HSPLIT  <= hsplit; -- maybe better way (others => '0');
    ahbso.HCACHE  <= '0';
    ahbso.HCONFIG <= hconfig;
    ahbso.HINDEX  <= slvndx; 
    ahbso.HIRQ <= irqo_tick;

--      // CAN signals 
    hclk    <= clk;
    hreset <= not resetn;
 
--      // CAN signals
    rx_i    <= can_rxi;
    can_txo <= tx_o;
    
--      // wbm_rty_i and wbm_err_i are not used
    wbm_rty_i <= '0';
    wbm_err_i <= '0';

-- pragma translate_off
  bootmsg : report_version 
  generic map (
	"can_oc" & tost(slvndx) & 
	": Opencores CAN MAC, rev " & tost(REVISION) & ", irq " & tost(irq));
-- pragma translate_on
   
end;