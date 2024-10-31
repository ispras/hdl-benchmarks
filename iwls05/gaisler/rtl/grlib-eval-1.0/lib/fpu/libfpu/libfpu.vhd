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
-- package: 	libfpu
-- File:	libfpu.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	LEON3 FPU interface types
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package libfpu is 
  
  constant RDBITS : integer := 32;  --FIXME
  
  type fp_rf_in_type is record
    rd1addr 	: std_logic_vector(3 downto 0); -- read address 1
    rd2addr 	: std_logic_vector(3 downto 0); -- read address 2
    wraddr 	: std_logic_vector(3 downto 0); -- write address
    wrdata 	: std_logic_vector(RDBITS-1 downto 0);     -- write data
    ren1         : std_ulogic;			     -- read 1 enable
    ren2         : std_ulogic;			     -- read 2 enable
    wren         : std_ulogic;			     -- write enable
  end record;

  type fp_rf_out_type is record
    data1    	: std_logic_vector(RDBITS-1 downto 0); -- read data 1
    data2    	: std_logic_vector(RDBITS-1 downto 0); -- read data 2
  end record;
  
  type fpc_pipeline_control_type is record
    pc    : std_logic_vector(31 downto 0);
    inst  : std_logic_vector(31 downto 0);
    cnt   : std_logic_vector(1 downto 0);
    trap  : std_ulogic;
    annul : std_ulogic;
    pv    : std_ulogic;
  end record;  

  type fpc_debug_in_type is record
    enable : std_ulogic;
    write  : std_ulogic;
    fsr    : std_ulogic;                            -- FSR access
    addr   : std_logic_vector(4 downto 0);
    data   : std_logic_vector(31 downto 0);
  end record;

  type fpc_debug_out_type is record
    data   : std_logic_vector(31 downto 0);
  end record;                           
  
  type fpc_in_type is record
    flush  	: std_ulogic;			  -- pipeline flush
    exack    	: std_ulogic;			  -- FP exception acknowledge
    a_rs1  	: std_logic_vector(4 downto 0);
    d             : fpc_pipeline_control_type;
    a             : fpc_pipeline_control_type;
    e             : fpc_pipeline_control_type;
    m             : fpc_pipeline_control_type;
    x             : fpc_pipeline_control_type;    
    lddata        : std_logic_vector(31 downto 0);     -- load data
    dbg           : fpc_debug_in_type;               -- debug signals
  end record;

  type fpc_out_type is record
    data          : std_logic_vector(31 downto 0); -- store data
    exc  	        : std_logic;			 -- FP exception
    cc            : std_logic_vector(1 downto 0);  -- FP condition codes
    ccv  	        : std_ulogic;			 -- FP condition codes valid
    ldlock        : std_logic;			 -- FP pipeline hold
    dbg           : fpc_debug_out_type;             -- FP debug signals
  end record;

-- GRFPU interface

  type grfpu_in_type is record
    start   : std_logic;
    nonstd  : std_logic;
    flop    : std_logic_vector(8 downto 0);
    op1     : std_logic_vector(63 downto 0);
    op2     : std_logic_vector(63 downto 0);
    opid    : std_logic_vector(5 downto 0);
    flush   : std_logic;
    flushid : std_logic_vector(5 downto 0);
    rndmode : std_logic_vector(1 downto 0);                          
  end record;
  
  type grfpu_out_type is record
    res     : std_logic_vector(63 downto 0);
    exc     : std_logic_vector(5 downto 0);
    allow   : std_logic_vector(2 downto 0);
    rdy     : std_logic;
    cc      : std_logic_vector(1 downto 0);
    idout   : std_logic_vector(5 downto 0);
  end record;

  component grfpc
    generic (
      pclow    : integer range 0 to 2 := 2;
      dsu      : integer := 0;
      disas    : integer range 0 to 1 := 0       
    );
    port (
      rst    : in  std_ulogic;			-- Reset
      clk    : in  std_ulogic;
      holdn  : in  std_ulogic;			-- pipeline hold
      cpi    : in  fpc_in_type;
      fpo    : in  grfpu_out_type;      
      cpo    : out fpc_out_type;
      fpi    : out grfpu_in_type;      
      rfi1   : out fp_rf_in_type;
      rfi2   : out fp_rf_in_type;
      rfo1   : in  fp_rf_out_type;
      rfo2   : in  fp_rf_out_type
      );
  end component;

  component grfpu
  generic (infmul : integer range 0 to 1 := 1);
  port(
    clk     : in std_logic;
    reset   : in std_logic;
    start   : in std_logic;
    nonstd  : in std_logic;
    flop    : in std_logic_vector(8 downto 0);
    op1     : in std_logic_vector(63 downto 0);
    op2     : in std_logic_vector(63 downto 0);
    opid    : in std_logic_vector(5 downto 0);
    flush   : in std_logic;
    flushid : in std_logic_vector(5 downto 0);
    rndmode : in std_logic_vector(1 downto 0);
    res     : out std_logic_vector(63 downto 0);
    exc     : out std_logic_vector(5 downto 0);
    allow   : out std_logic_vector(2 downto 0);
    rdy     : out std_logic;
    cc      : out std_logic_vector(1 downto 0);
    idout   : out std_logic_vector(5 downto 0)
    );
  end component;

  component mfpc
  generic (
    pclow    : integer range 0 to 2 := 2;
    dsu      : integer := 0;
    disas    : integer range 0 to 1 := 0
    );
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    fpci   : in  fpc_in_type;
    fpco   : out fpc_out_type;
    rfi1   : out fp_rf_in_type;
    rfi2   : out fp_rf_in_type;
    rfo1   : in  fp_rf_out_type;
    rfo2   : in  fp_rf_out_type
    );
  end component;

  component grlfpc
  generic (
    pclow    : integer range 0 to 2 := 2;
    dsu      : integer := 0;
    disas    : integer range 0 to 1 := 0
    );
  port (
    rst    : in  std_ulogic;			-- Reset
    clk    : in  std_ulogic;
    holdn  : in  std_ulogic;			-- pipeline hold
    fpci   : in  fpc_in_type;
    fpco   : out fpc_out_type;
    rfi1   : out fp_rf_in_type;
    rfi2   : out fp_rf_in_type;
    rfo1   : in  fp_rf_out_type;
    rfo2   : in  fp_rf_out_type
    );
  end component;

end;
