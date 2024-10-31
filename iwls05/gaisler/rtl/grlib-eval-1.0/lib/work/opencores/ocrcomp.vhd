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
-- Package: 	ocrcomp
-- File:	ocrcomp.vhd
-- Description:	Declaration of Opencores ethernet MAC and CAN cores
-- Author:     	Jiri Gaisler - Gaisler Research
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.amba.all;
library gaisler;
use gaisler.net.all;
use gaisler.pci.all;

package ocrcomp is

  component eth_top
    port (

--      // WISHBONE common
      wb_clk_i : in std_logic;
      wb_rst_i : in std_logic;
      wb_dat_i : in std_logic_vector(31 downto 0);
      wb_dat_o : out std_logic_vector(31 downto 0);

--      // WISHBONE slave
      wb_adr_i : in std_logic_vector(11 downto 2);
      wb_sel_i : in std_logic_vector(3 downto 0);
      wb_we_i  : in std_logic;
      wb_cyc_i : in std_logic; 
      wb_stb_i : in std_logic;
      wb_ack_o : out std_logic;
      wb_err_o : out std_logic;

--      // WISHBONE master
      m_wb_adr_o : out std_logic_vector(31 downto 0);
      m_wb_sel_o : out std_logic_vector(3 downto 0);
      m_wb_we_o  : out std_logic; 
      m_wb_dat_o : out std_logic_vector(31 downto 0);
      m_wb_dat_i : in std_logic_vector(31 downto 0);
      m_wb_cyc_o : out std_logic;
      m_wb_stb_o : out std_logic;
      m_wb_ack_i : in std_logic;
      m_wb_err_i : in std_logic;

      m_wb_cti_o : out std_logic_vector(2 downto 0);
      m_wb_bte_o : out std_logic_vector(1 downto 0);

--      //TX
      mtx_clk_pad_i : in std_logic;
      mtxd_pad_o    : out std_logic_vector(3 downto 0);
      mtxen_pad_o   : out std_logic;
      mtxerr_pad_o  : out std_logic;
      
--      //RX
      mrx_clk_pad_i : in std_logic;
      mrxd_pad_i    : in std_logic_vector(3 downto 0);
      mrxdv_pad_i   : in std_logic;
      mrxerr_pad_i  : in std_logic;
      mcoll_pad_i   : in std_logic;
      mcrs_pad_i    : in std_logic;
  
--      // MIIM
      mdc_pad_o  : out std_logic;
      md_pad_i   : in std_logic;
      md_pad_o   : out std_logic;
      md_padoe_o : out std_logic;

      int_o      : out std_logic;

--     // BDRAM
      ram_ce     : out std_logic;
      ram_we     : out std_logic_vector(3 downto 0);
      ram_oe     : out std_logic;
      ram_addr   : out std_logic_vector(7 downto 0);
      ram_di     : out std_logic_vector(31 downto 0);
      ram_do     : in std_logic_vector(31 downto 0)
    );
  end component;

  component can_top
    port(
        wb_clk_i        : in    std_logic;
        wb_rst_i        : in    std_logic;
        wb_dat_i        : in    std_logic_vector(7 downto 0);
        wb_dat_o        : out   std_logic_vector(7 downto 0);
        wb_cyc_i        : in    std_logic;
        wb_stb_i        : in    std_logic;
        wb_we_i         : in    std_logic;
        wb_adr_i        : in    std_logic_vector(7 downto 0);
        wb_ack_o        : out   std_logic;
        clk_i           : in    std_logic;
        rx_i            : in    std_logic;
        tx_o            : out   std_logic;
        bus_off_on      : out   std_logic;
        irq_on          : out   std_logic;
        clkout_o        : out   std_logic;
	-- // port connections for Ram
  	--//64x8
  	q_dp_64x8	: in  std_logic_vector(7 downto 0);
  	data_64x8	: out std_logic_vector(7 downto 0);
  	wren_64x8	: out std_logic;
  	rden_64x8	: out std_logic;
  	wraddress_64x8	: out std_logic_vector(5 downto 0);
  	rdaddress_64x8	: out std_logic_vector(5 downto 0);
	
	--//64x4
	q_dp_64x4	: in std_logic_vector(3 downto 0);
	data_64x4	: out std_logic_vector(3 downto 0);
	wren_64x4x1	: out std_logic;
	wraddress_64x4x1: out std_logic_vector(5 downto 0);
	rdaddress_64x4x1: out std_logic_vector(5 downto 0);

  	--//64x1

  	q_dp_64x1	: in std_logic_vector(0 downto 0);
  	data_64x1	: out std_logic_vector(0 downto 0)

    );
  end component;

end;
