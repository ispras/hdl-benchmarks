---------------------------------------------------------------------------
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
-- Entity:      net
-- File:        net.vhd
-- Author:      Jiri Gaisler - Gaisler Research
-- Description: Package with component and type declarations for network cores
------------------------------------------------------------------------------
  
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;

package net is

  type eth_in_type is record
    tx_clk : std_ulogic;
    rx_clk : std_ulogic;
    rxd    : std_logic_vector(3 downto 0);   
    rx_dv  : std_ulogic; 
    rx_er  : std_ulogic; 
    rx_col : std_ulogic;
    rx_crs : std_ulogic;
    mdio_i : std_ulogic; 
  end record;

  type eth_out_type is record
    reset   : std_ulogic;
    txd     : std_logic_vector(3 downto 0);   
    tx_en   : std_ulogic; 
    tx_er   : std_ulogic; 
    mdc     : std_ulogic;    
    mdio_o  : std_ulogic; 
    mdio_oe : std_ulogic;
  end record;

  type edcl_in_type is record
    lsbip   : std_logic_vector(3 downto 0);   
  end record;

  component ctrlunit 
      generic (
        ahbndx     : integer := 0;
        ahbndx2    : integer := 0; 
        ahbndx3    : integer := 1;
        memndx     : integer := 1; 
        memaddr    : integer := 16#2000#;
        macaddrh   : integer := 16#00007A#; 
        macaddrl   : integer := 16#000000#; 
        ipaddrh    : integer := 16#C0A8#; 
        ipaddrl    : integer := 16#0032#; 
        udpport    : integer := 10000; 
	extip      : integer := 0;
	fullduplex : integer := 0;
        mdioenabled: integer := 0;
        autoneg    : integer := 0;
        speed      : integer := 0;
        phyrstcls  : integer := 100000;
        phyadr     : integer := 0;
	sim        : integer := 0);
      port(
        rst   : in  std_logic;
        clk   : in  std_logic;
        edcli   : in  edcl_in_type;
        ahbmi : in  ahb_mst_in_type;
        ahbmo : out ahb_mst_out_type;
        ahbmi_m: in ahb_mst_in_type;
        ahbmo_m: out ahb_mst_out_type;
        ahbmi_rt: in ahb_mst_in_type;
        ahbmo_rt: out ahb_mst_out_type
       );
  end component;

  component eth_arb
    generic(
      fullduplex : integer := 0;
      mdiomaster : integer := 0);
    port(
      rst   : in std_logic;
      clk   : in std_logic; 
      ethi  : in eth_in_type;
      etho  : out eth_out_type;
      methi : in eth_out_type;
      metho : out eth_in_type; 
      dethi : in eth_out_type;
      detho : out eth_in_type
      );
  end component;

end;
