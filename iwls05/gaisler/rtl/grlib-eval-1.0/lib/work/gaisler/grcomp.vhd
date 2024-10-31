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
-- package: 	grcomp
-- File:	grcomp.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Gaisler components that needs to be in the work library
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.tech.all;
library gaisler;
use gaisler.net.all;

package grcomp is

  component gen_bprom
  port (
    clk  : in  std_logic;
    csn  : in  std_logic;
    addr : in  std_logic_vector (25 downto 0);
    data : out std_logic_vector (31 downto 0));
  end component;

  component ahbrom
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#fff#;
    pipe    : integer := 0;
    tech    : integer := 0;
    kbytes  : integer := 1);
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbsi   : in  ahb_slv_in_type;
    ahbso   : out ahb_slv_out_type
  );
  end component;

  component eth_oc
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
  end component;

  component edcl
  generic (
      mstndx        : integer := 0;
      macaddrh      : integer := 16#00005e#;
      macaddrl      : integer := 16#000000#;
      ipaddrh       : integer := 16#c0a8#;     
      ipaddrl       : integer := 16#0035#;
      udpport       : integer := 8000;
      extip         : integer := 0;
      fullduplex    : integer := 0;
      memtech       : integer := 0;
      bufsize       : integer := 4;
      autoneg       : integer := 0;
      speed         : integer := 0;
      mdioenabled   : integer := 0;
      phyadr        : integer := 0;
      phyrstcls     : integer := 100000;
      sim           : integer := 0);
  port (
    rstn    : in  std_ulogic;
    clk	    : in  std_ulogic;
    edcli   : in  edcl_in_type;
    ahbmim  : in  ahb_mst_in_type; 
    ahbmom  : out ahb_mst_out_type;
    ethi    : in  eth_in_type;
    etho    : out eth_out_type
  );
  end component;

  component can_oc                    
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
      --irq     : out std_logic        
      );                           
   end component;          

  component ahb2wb                                            
    port (                                      

--      // AHB interface
--      // AHB common
    hclk : in std_logic;
    hresetn : in std_logic;
    hwdata : in std_logic_vector(7 downto 0);
    hrdata : out std_logic_vector(7 downto 0);

--      // AHB slave   
    haddr : in std_logic_vector(7 downto 0);
    hready_ba : in std_logic;
    hsel  : in std_logic;
    hresp : out std_logic_vector(1 downto 0);
    hwrite : in std_logic;
    hready : out std_logic;

--      // AHB Additional
    htrans : in std_logic_vector(1 downto 0);
    hsize : in std_logic_vector(2 downto 0);
    hburst : in std_logic_vector(2 downto 0);
    
    hmaster : in std_logic_vector(3 downto 0);
    hmastlock : in std_logic;
    hsplit : out std_logic_vector(15 downto 0);

--      // Wishbone interface
--      // WISHBONE common  
   wbm_dat_i : in std_logic_vector(7 downto 0);
   wbm_dat_o : out std_logic_vector(7 downto 0);   

--      // WISHBONE slave   
   wbm_adr_o : out std_logic_vector(7 downto 0);
   wbm_cyc_o : out std_logic;
   wbm_stb_o : out std_logic;
   wbm_we_o  : out std_logic;
   wbm_ack_i : in std_logic;

--      // WISHBONE Additional
   wb_inta_i : in std_logic;    
   wbm_sel_o : out std_logic_vector(3 downto 0);
   wbm_rty_i : in std_logic;
   wbm_err_i : in std_logic;

--     // miscellaneous signals
   irq_o : out std_logic

    );                                                       
  end component;  

end;

