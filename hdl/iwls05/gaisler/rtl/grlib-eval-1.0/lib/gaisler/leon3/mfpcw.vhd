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
-- Entity: 	mfpcw
-- File:	mfpcw.vhd
-- Author:	Jiri Gaisler, Edvin Catovic, Gaisler Research
-- Description:	MFPC wrapper
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library fpu;
use fpu.libfpu.all;
library gaisler;
use gaisler.libproc3.all;


entity mfpcw is
  generic (tech     : integer := 0;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
    rst    : in  std_ulogic;			
    clk    : in  std_ulogic;
    holdn  : in  std_logic;			
    cpi    : in  fpc_in_type;
    cpo    : out fpc_out_type    
    );
end;


architecture rtl of mfpcw is

component mfpcw2 
  generic (tech     : integer := 0;
           pclow    : integer range 0 to 2 := 2;
           dsu      : integer range 0 to 1 := 0;           
           disas    : integer range 0 to 1 := 0);
  port (
  rst    : in  std_ulogic;			
  clk    : in  std_ulogic;
  holdn  : in  std_ulogic;  
  cpi_flush : in  std_logic;			
  cpi_exack   : in  std_logic;			
  cpi_a_rs1   : in  std_logic_vector(4 downto 0);
  cpi_d_pc    : in std_logic_vector(31 downto 0);
  cpi_d_inst  : in std_logic_vector(31 downto 0);
  cpi_d_cnt   : in std_logic_vector(1 downto 0);
  cpi_d_trap  : in std_ulogic;
  cpi_d_annul : in std_ulogic;
  cpi_d_pv    : in std_ulogic;  
  cpi_a_pc    : in std_logic_vector(31 downto 0);
  cpi_a_inst  : in std_logic_vector(31 downto 0);
  cpi_a_cnt   : in std_logic_vector(1 downto 0);
  cpi_a_trap  : in std_ulogic;
  cpi_a_annul : in std_ulogic;
  cpi_a_pv    : in std_ulogic;
  cpi_e_pc    : in std_logic_vector(31 downto 0);
  cpi_e_inst  : in std_logic_vector(31 downto 0);
  cpi_e_cnt   : in std_logic_vector(1 downto 0);
  cpi_e_trap  : in std_ulogic;
  cpi_e_annul : in std_ulogic;
  cpi_e_pv    : in std_ulogic;
  cpi_m_pc    : in std_logic_vector(31 downto 0);
  cpi_m_inst  : in std_logic_vector(31 downto 0);
  cpi_m_cnt   : in std_logic_vector(1 downto 0);
  cpi_m_trap  : in std_ulogic;
  cpi_m_annul : in std_ulogic;
  cpi_m_pv    : in std_ulogic;
  cpi_x_pc    : in std_logic_vector(31 downto 0);
  cpi_x_inst  : in std_logic_vector(31 downto 0);
  cpi_x_cnt   : in std_logic_vector(1 downto 0);
  cpi_x_trap  : in std_ulogic;
  cpi_x_annul : in std_ulogic;
  cpi_x_pv    : in std_ulogic;  
  cpi_lddata  : in std_logic_vector(31 downto 0);
  cpi_dbg_enable : in std_ulogic;
  cpi_dbg_write  : in std_ulogic;
  cpi_dbg_fsr    : in std_ulogic;                            -- FSR access
  cpi_dbg_addr   : in std_logic_vector(4 downto 0);
  cpi_dbg_data   : in std_logic_vector(31 downto 0);

  cpo_data          : out std_logic_vector(31 downto 0); -- store data
  cpo_exc  	    :  out std_logic;			 -- FP exception
  cpo_cc            : out std_logic_vector(1 downto 0);  -- FP condition codes
  cpo_ccv  	    : out std_ulogic;			 -- FP condition codes valid
  cpo_ldlock        : out std_logic;			 -- FP pipeline hold
  cpo_dbg_data      : out std_logic_vector(31 downto 0)
    );
end component;

begin
  
  mfpcw2_0 : mfpcw2 
    generic map (tech, pclow, dsu, disas)
    port map (
  rst            ,
  clk            ,
  holdn,
  cpi.flush      , 
  cpi.exack      , 
  cpi.a_rs1      ,
  cpi.d.pc       ,
  cpi.d.inst     ,
  cpi.d.cnt      ,
  cpi.d.trap     ,
  cpi.d.annul    ,
  cpi.d.pv       ,
  cpi.a.pc       ,
  cpi.a.inst     ,
  cpi.a.cnt      ,
  cpi.a.trap     ,
  cpi.a.annul    ,
  cpi.a.pv       ,
  cpi.e.pc       ,
  cpi.e.inst     ,
  cpi.e.cnt      ,
  cpi.e.trap     ,
  cpi.e.annul    ,
  cpi.e.pv       ,
  cpi.m.pc       ,
  cpi.m.inst     ,
  cpi.m.cnt      ,
  cpi.m.trap     ,
  cpi.m.annul    ,
  cpi.m.pv       ,
  cpi.x.pc       ,
  cpi.x.inst     ,
  cpi.x.cnt      ,
  cpi.x.trap     ,
  cpi.x.annul    ,
  cpi.x.pv       ,
  cpi.lddata     ,
  cpi.dbg.enable ,
  cpi.dbg.write  ,
  cpi.dbg.fsr    ,
  cpi.dbg.addr   ,
  cpi.dbg.data   ,
                 
  cpo.data       ,
  cpo.exc  	 ,
  cpo.cc         ,
  cpo.ccv  	 ,
  cpo.ldlock     ,
  cpo.dbg.data);

end;  
