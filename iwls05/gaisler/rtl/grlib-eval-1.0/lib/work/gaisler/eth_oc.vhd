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
----------------------------------------------------------------------------
-- Entity: 	pci_oc
-- File:	pci_oc.vhd
-- Description:	Backend for Opencores PCI_IF
-- Author:     	Daniel Hedberg, Jiri Gaisler - Gaisler Research
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.tech.all;
library gaisler;
use gaisler.devices.all;
use gaisler.net.all;
use gaisler.misc.all;
use gaisler.devices.all;
use gaisler.memory.all;
use work.ocrcomp.all;

entity eth_oc is
  generic (
    mstndx    : integer := 0;
    slvndx    : integer := 0;
    ioaddr    : integer := 16#000#;
    iomask    : integer := 16#FF0#;
    irq       : integer := 0;
    memtech   : integer := inferred);
  port (
    rst  : in  std_logic;
    clk  : in  std_logic;
    ahbsi : in  ahb_slv_in_type;
    ahbso : out ahb_slv_out_type;
    ahbmi : in  ahb_mst_in_type;
    ahbmo : out ahb_mst_out_type;
    ethi : in eth_in_type;
    etho : out eth_out_type);
end;
 
architecture rtl of eth_oc is

constant REVISION : amba_version_type := 0;

constant hconfig : ahb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_ETHAHB , 0, REVISION, irq),
  4 => ahb_iobar (ioaddr, iomask),
  others => zero32);

type wb_mst_in_type is record
  mdat_i : std_logic_vector(31 downto 0);      -- binary data bus
  rty_i  : std_logic;
  ack_i  : std_logic;                          -- data available
end record;                                                            
                                                                           
type wb_mst_out_type is record
  adr_o  : std_logic_vector(11 downto 2); 	-- address bus (byte) 
  mdat_o : std_logic_vector(31 downto 0); 	-- binary data bus    
  we_o   : std_logic;
  stb_o  : std_logic;
  cab_o  : std_logic;
end record;
                                                                           
type wb_slv_in_type is record
  adr_i  : std_logic_vector(31 downto 0);
  sdat_i : std_logic_vector(31 downto 0);
  we_i   : std_logic;
  stb_i  : std_logic;
  cab_i  : std_logic;
  cti_i  : std_logic_vector(2 downto 0);
end record;
 
type wb_slv_out_type is record 
  ack_o  : std_logic;				-- data available 
  rty_o  : std_logic;
  sdat_o : std_logic_vector(31 downto 0);	-- binary data bus    
end record;            

type ahbslv_state_type is (idle, strobe, respond, rty, doreturn);
type ahbmst_state_type is (idle, req, respond);

type ahbslv_reg_type is record
  hresp      : std_logic_vector(1 downto 0);
  hready     : std_logic;
  adr_o      : std_logic_vector(11 downto 2);
  hrdata     : std_logic_vector(31 downto 0);
  mdat_o     : std_logic_vector(31 downto 0);
  mdat_i     : std_logic_vector(31 downto 0);
  ack_i      : std_logic;
  rty_i      : std_logic;
  we_o       : std_logic;
  hburst     : std_logic_vector(2 downto 0);
  htrans     : std_logic_vector(1 downto 0);
end record;

type wb_reg_type is record
  stb_i     : std_logic;
  we_i      : std_logic;
  cab_o     : std_logic;
end record;

type reg_type is record
  ahbslv_state   : ahbslv_state_type;
  ahbmst_state   : ahbmst_state_type;
  ahbslv         : ahbslv_reg_type;
  wb             : wb_reg_type;
  burst          : std_logic;
  start          : std_logic;
  rst            : std_logic;
  ocrst          : std_logic;
end record;

signal r, rin : reg_type;
signal highbits : std_logic_vector(31 downto 0);
signal lowbits : std_logic_vector(31 downto 0);
signal occlk : std_logic;
signal mdio_oe : std_logic;

signal cbe_en : std_logic_vector(3 downto 0);
signal wbmi : wb_mst_in_type;
signal wbmo : wb_mst_out_type;
signal wbsi : wb_slv_in_type;
signal wbso : wb_slv_out_type;

signal dmai : ahb_dma_in_type;
signal dmao : ahb_dma_out_type;
signal eirq  : std_ulogic;

signal ram_ce : std_logic;
signal ram_oe : std_logic;
signal ram_we : std_logic_vector(3 downto 0);
signal ram_addr : std_logic_vector(7 downto 0);
signal ram_di : std_logic_vector(31 downto 0);
signal ram_do : std_logic_vector(31 downto 0);
signal enable : std_logic;
signal we_en  : std_logic;

begin

  lowbits <= (others => '0');
  highbits <= (others => '1');

  comb: process (r, ahbsi, wbmi, rst, cbe_en, ahbmi, wbsi, dmao, eirq)
  variable v : reg_type;
  variable vstb_o, vstart, vburst : std_logic;
  variable vprdata : std_logic_vector(31 downto 0);
  variable ack_o : std_logic;
  variable hirq : std_logic_vector(NAHBIRQ-1 downto 0); 
  begin  -- process comb
    v := r; vstb_o := '0'; v.ahbslv.hready := '1';
    hirq := (others => '0'); hirq(irq) := eirq;
    
    case r.ahbslv_state is
      when idle   =>
        v.ahbslv.ack_i := '0';
        v.ahbslv.hburst := ahbsi.hburst;
        v.ahbslv.htrans := ahbsi.htrans;
        v.ahbslv.adr_o  := ahbsi.haddr(11 downto 2);
        if (ahbsi.hsel(slvndx) and ahbsi.hready and ahbsi.htrans(1)) = '1' then
            v.ahbslv.hready := '0';
            v.ahbslv_state  := strobe;
            v.ahbslv.we_o   := ahbsi.hwrite;
        end if; 
      when strobe  =>
	-- emulate the old reset bit in MODER(11) of the ethernet core
        if r.ahbslv.adr_o = "0000000000" and (r.ahbslv.we_o = '1') then
	  v.rst := ahbsi.hwdata(11);
        end if;
        v.ahbslv_state    := respond;
        v.ahbslv.mdat_o   := ahbsi.hwdata;  --write specific
        v.ahbslv.mdat_i   := wbmi.mdat_i;
        vstb_o            := '1';
        v.ahbslv.ack_i    := wbmi.ack_i;
        v.ahbslv.rty_i    := wbmi.rty_i;
        v.ahbslv.hready   := '0';
        if r.ahbslv.hburst = "001" then v.wb.cab_o := '1'; end if;
      when respond =>
        if (r.rst or r.ahbslv.ack_i) = '1' then
          v.ahbslv_state    := idle;
          v.ahbslv.hrdata   := r.ahbslv.mdat_i;  --read specific
        elsif r.ahbslv.rty_i = '1' then
          v.ahbslv_state    := rty;
          v.ahbslv.hready   := '0';
          v.ahbslv.hresp    := hresp_retry;
        else
          vstb_o     := '1';              --fix
          v.ahbslv.hready   := '0';
          v.ahbslv.mdat_i   := wbmi.mdat_i;  --read specific
          v.ahbslv.ack_i    := wbmi.ack_i;
          v.ahbslv.rty_i    := wbmi.rty_i;
        end if;
        if (r.wb.cab_o = '1' and ahbsi.htrans(0) = '0') then
          v.wb.cab_o := '0';
        end if;
      when rty =>
        v.ahbslv_state  := doreturn;
      when doreturn =>
        v.ahbslv_state  := idle;
        v.ahbslv.hresp  := hresp_okay;
      when others => null;
    end case;

----------------------------------------
----------------------------------------

    v.wb.stb_i := wbsi.stb_i;
    v.wb.we_i := wbsi.we_i;

    ack_o := '0';

    case r.ahbmst_state is
      when idle =>
        if r.wb.stb_i = '1' then
          v.ahbmst_state := req;
          v.start := '1';
          if wbsi.cti_i = "010" then
            v.burst := '1';
          end if;
        end if;
      when req  =>
        if (wbsi.cti_i = "111" or wbsi.cti_i = "000" or 
	    wbsi.adr_i(9 downto 2) = "11111111") and dmao.start = '1'
	then
            v.burst := '0';
            v.start := '0';
        end if;
        if dmao.active = '1' and dmao.ready = '1'  then
          ack_o := '1';
	  if v.start = '0' then v.ahbmst_state := respond; end if;
        end if;
        if dmao.active = '1' and dmao.retry = '1'  then
	  v.start := '1';
	end if;
      when respond =>
          v.ahbmst_state := idle;
      when others => null;
    end case;

    v.ocrst := r.rst or not rst;

    if rst = '0' then
      v.ahbslv_state          := idle;
      v.ahbslv.hresp          := hresp_okay;
      v.ahbslv.hready         := '1';
      v.ahbslv.adr_o          := (others => '0');
      v.ahbslv.hrdata         := (others => '0');
      v.ahbslv.mdat_o         := (others => '0');
      v.ahbslv.mdat_i         := (others => '0');
      v.ahbslv.ack_i          := '0';
      v.ahbslv.rty_i          := '0';
      v.ahbslv.we_o           := '0';

      v.ahbmst_state          := idle;
      v.start                 := '0';
      v.burst                 := '0';

      v.wb.cab_o      := '0';
      v.rst := '0';

    end if;

    wbmo.adr_o         <= r.ahbslv.adr_o;
    wbmo.mdat_o        <= v.ahbslv.mdat_o;
    wbmo.we_o          <= r.ahbslv.we_o;
    wbmo.stb_o         <= vstb_o;
    ahbso.hready       <= r.ahbslv.hready;
    ahbso.hresp        <= r.ahbslv.hresp;
    wbmo.cab_o         <= v.wb.cab_o;
    ahbso.hrdata       <= v.ahbslv.hrdata;
    ahbso.hsplit       <= (others => '0');
    dmai.address       <= wbsi.adr_i;
    dmai.wdata         <= wbsi.sdat_i;
    dmai.start         <= v.start;
    dmai.burst         <= v.burst;
    dmai.write         <= r.wb.we_i;
    dmai.size          <= "10";         -- 32 bit
    --dmai.irq           <= eirq;
    dmai.irq <= '0';
    dmai.busy          <= '0';
    wbso.ack_o         <= ack_o;
    wbso.sdat_o        <= dmao.rdata;
    wbso.rty_o         <= '0';

    rin <= v; 

    ahbso.hconfig <= hconfig;
    ahbso.hirq    <= hirq;
    ahbso.hsplit  <= (others => '0');
    ahbso.hcache  <= '0';
    ahbso.hindex  <= slvndx;
    
  end process comb;

  regs : process(clk)
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process;

  ahbmst0 : ahbmst 
  generic map (hindex => mstndx, venid => VENDOR_GAISLER, 
	       devid => GAISLER_ETHAHB, incaddr => 1, hirq => 0)
  port map (rst, clk, dmai, dmao, ahbmi, ahbmo);

  oc : eth_top port map (
--      // WISHBONE common
      wb_clk_i =>    clk ,
      wb_rst_i =>    r.ocrst ,
      wb_dat_i =>    wbmo.mdat_o ,
      wb_dat_o =>    wbmi.mdat_i , 

--      // WISHBONE slave
      wb_adr_i =>     wbmo.adr_o(11 downto 2),
      wb_sel_i =>     highbits(3 downto 0),
      wb_we_i  =>     wbmo.we_o,
      wb_cyc_i =>     highbits(0),
      wb_stb_i =>     wbmo.stb_o,
      wb_ack_o =>     wbmi.ack_i  ,
      wb_err_o =>     Open  ,

--      // WISHBONE master
      m_wb_adr_o =>     wbsi.adr_i,
      m_wb_sel_o =>     Open,
      m_wb_we_o  =>     wbsi.we_i, 
      m_wb_dat_o =>     wbsi.sdat_i,
      m_wb_dat_i =>     wbso.sdat_o,
      m_wb_cyc_o =>     Open,
      m_wb_stb_o =>     wbsi.stb_i,
      m_wb_ack_i =>     wbso.ack_o,
      m_wb_err_i =>     lowbits(0),

       m_wb_cti_o =>     wbsi.cti_i,
       m_wb_bte_o =>     open,

--       //TX
      mtx_clk_pad_i =>     ethi.tx_clk,
      mtxd_pad_o    =>     etho.txd,
      mtxen_pad_o   =>     etho.tx_en,
      mtxerr_pad_o  =>     etho.tx_er,
      
--      //RX
      mrx_clk_pad_i =>     ethi.rx_clk,
      mrxd_pad_i    =>     ethi.rxd,
      mrxdv_pad_i   =>     ethi.rx_dv,
      mrxerr_pad_i  =>     ethi.rx_er,
      mcoll_pad_i   =>     ethi.rx_col,
      mcrs_pad_i    =>     ethi.rx_crs,
  
--      // MIIM
      mdc_pad_o  =>     etho.mdc,
      md_pad_i   =>     ethi.mdio_i,
      md_pad_o   =>     etho.mdio_o,
      md_padoe_o =>     mdio_oe,

      int_o      =>   eirq,

--     // RAM
      ram_ce     => ram_ce,
      ram_we     => ram_we,
      ram_oe     => ram_oe,
      ram_addr   => ram_addr,
      ram_di     => ram_di,
      ram_do     => ram_do

     );

  etho.mdio_oe <= not mdio_oe; 	-- invert output enable
  etho.reset   <= rst; 		-- reset PHY

  ram0 : syncram
  generic map(tech => memtech, abits => 8, dbits => 32)
  port map(clk => clk, address => ram_addr, datain => ram_di, dataout => ram_do,
  enable => ram_ce, write => we_en);  

  enable <= ram_ce; 
  we_en <= ram_we(3) or ram_we(2) or ram_we(1) or ram_we(0);
  
-- pragma translate_off
  bootmsg : report_version 
  generic map (
	"eth_oc" & tost(slvndx) & 
	": Wishbone/AHB interface for OC ethernet MAC" &
	", irq " & tost(irq),
	"eth_oc" & tost(slvndx) & 
	": Opencores 10/100 Mbit ethernet MAC, rev " & tost(REVISION) );
-- pragma translate_on

end;
