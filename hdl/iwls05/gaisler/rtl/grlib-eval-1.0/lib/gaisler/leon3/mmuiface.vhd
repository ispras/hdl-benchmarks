



----------------------------------------------------------------------------
--  This file is a part of the LEON VHDL model
--  Copyright (C) 2003  Gaisler Research
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2 of the License, or (at your option) any later version.
--
--  See the file COPYING.LGPL for the full details of the license.


-----------------------------------------------------------------------------   
-- Entity:      icache
-- File:        icache.vhd
-- Author:      Jiri Gaisler - Gaisler Research, Konrad Eisele <eiselekd@web.de>
-- Description: This unit implements the instruction cache controller.
------------------------------------------------------------------------------  

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.mmuconfig.all;
package mmuiface is

-- mmu i/o

type mmuidc_data_in_type is record
  data             : std_logic_vector(31 downto 0);
  su               : std_logic;
  read             : std_logic;
  isid             : mmu_idcache;
end record;

type mmuidc_data_out_type is record
  finish           : std_logic;
  data             : std_logic_vector(31 downto 0);
  cache            : std_logic;
  accexc           : std_logic;
end record;

type mmudc_in_type is record
  trans_op         : std_logic; 
  transdata        : mmuidc_data_in_type;
  
  -- dcache extra signals
  flush_op         : std_logic;
  diag_op          : std_logic;

  fsread           : std_logic;
  mmctrl1          : mmctrl_type1;
end record;

type mmudc_out_type is record
  grant            : std_logic;
  transdata        : mmuidc_data_out_type;
  -- dcache extra signals
  mmctrl2          : mmctrl_type2;
end record;

type mmuic_in_type is record
  trans_op         : std_logic; 
  transdata        : mmuidc_data_in_type;
end record;

type mmuic_out_type is record
  grant            : std_logic;
  transdata        : mmuidc_data_out_type;
end record;

type mmutlbcam_in_type is record
  tagin    : tlbcam_tfp;
  tagwrite : tlbcam_reg;
  trans_op : std_logic;
  flush_op : std_logic;
  write_op : std_logic;
  mmuen    : std_logic;
  mset     : std_logic;
end record;
type mmutlbcami_a is array (natural range <>) of mmutlbcam_in_type;

type mmutlbcam_out_type is record
  pteout   : std_logic_vector(31 downto 0);
  LVL      : std_logic_vector(1 downto 0);    -- level in pth
  hit      : std_logic;
  ctx      : std_logic_vector(M_CTX_SZ-1 downto 0);    -- for diagnostic access
  valid    : std_logic;                                -- for diagnostic access
  vaddr    : std_logic_vector(31 downto 0);            -- for diagnostic access
  NEEDSYNC : std_logic;
end record;
type mmutlbcamo_a is array (natural range <>) of mmutlbcam_out_type;

--#lrue i/o
type mmulrue_in_type is record
  touch        : std_logic;
  pos          : std_logic_vector(M_ENT_MAX_LOG-1 downto 0);
  clear        : std_logic;
  
  left         : std_logic_vector(M_ENT_MAX_LOG-1 downto 0);
  fromleft     : std_logic;
  right        : std_logic_vector(M_ENT_MAX_LOG-1 downto 0);
  fromright    : std_logic;
end record;
type mmulruei_a is array (natural range <>) of mmulrue_in_type;

type mmulrue_out_type is record
  pos          : std_logic_vector(M_ENT_MAX_LOG-1 downto 0);
  movetop      : std_logic;
end record;
type mmulrueo_a is array (natural range <>) of mmulrue_out_type;

--#lru i/o
type mmulru_in_type is record
  touch     : std_logic;
  touchmin  : std_logic;
  pos       : std_logic_vector(M_ENT_MAX_LOG-1 downto 0);
  mmctrl1   : mmctrl_type1;
end record;

type mmulru_out_type is record
  pos      : std_logic_vector(M_ENT_MAX_LOG-1 downto 0);
end record;

--#mmu: tw i/o
type memory_mm_in_type is record
  address          : std_logic_vector(31 downto 0); 
  data             : std_logic_vector(31 downto 0);
  size             : std_logic_vector(1 downto 0);
  burst            : std_logic;
  read             : std_logic;
  req              : std_logic;
  lock             : std_logic;
end record;

type memory_mm_out_type is record
  data             : std_logic_vector(31 downto 0); -- memory data
  ready            : std_logic;			    -- cycle ready
  grant            : std_logic;			    -- 
  retry            : std_logic;			    -- 
  mexc             : std_logic;			    -- memory exception
  werr             : std_logic;			    -- memory write error
  cache            : std_logic;		            -- cacheable data
end record;

type mmutw_in_type is record
  walk_op_ur       : std_logic;
  areq_ur          : std_logic;
  
  data             : std_logic_vector(31 downto 0);
  adata            : std_logic_vector(31 downto 0);
  aaddr            : std_logic_vector(31 downto 0);
end record;
type mmutwi_a is array (natural range <>) of mmutw_in_type;

type mmutw_out_type is record
  finish           : std_logic;
  data             : std_logic_vector(31 downto 0);
  addr             : std_logic_vector(31 downto 0);
  lvl              : std_logic_vector(1 downto 0);
  fault_mexc       : std_logic;
  fault_trans      : std_logic;
  fault_inv        : std_logic;
  fault_lvl        : std_logic_vector(1 downto 0);
end record;
type mmutwo_a is array (natural range <>) of mmutw_out_type;

-- mmu tlb i/o

type mmutlb_in_type is record
  flush_op    : std_logic;
  diag_op_ur  : std_logic;
  
  trans_op    : std_logic;
  transdata   : mmuidc_data_in_type;
  s2valid     : std_logic;
  
  annul       : std_logic;
  mmctrl1     : mmctrl_type1;
end record;
type mmutlbi_a is array (natural range <>) of mmutlb_in_type;

type mmutlbfault_out_type is record
  fault_pro   : std_logic;
  fault_pri   : std_logic;
  fault_access     : std_logic; 
  fault_mexc       : std_logic;
  fault_trans      : std_logic;
  fault_inv        : std_logic;
  fault_lvl        : std_logic_vector(1 downto 0);
  fault_su         : std_logic;
  fault_read       : std_logic;
  fault_isid       : mmu_idcache;
  fault_addr       : std_logic_vector(31 downto 0);
end record;
  
type mmutlb_out_type is record
  transdata   : mmuidc_data_out_type;
  fault       : mmutlbfault_out_type;
  nexttrans   : std_logic;
  s1finished  : std_logic;
end record; 
type mmutlbo_a is array (natural range <>) of mmutlb_out_type;

end;


