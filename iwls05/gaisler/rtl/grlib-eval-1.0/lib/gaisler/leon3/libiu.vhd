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
-- Package: 	libiu
-- File:	libiu.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	LEON3 IU types and components
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.leon3.all;
use gaisler.arith.all;
use gaisler.mmuconfig.all;
library fpu;
use fpu.libfpu.all;

package libiu is

constant RDBITS : integer := 32;
constant IDBITS : integer := 32;

subtype cword is std_logic_vector(IDBITS-1 downto 0);
type cdatatype is array (0 to 3) of cword;

--type ctagpartype is array (0 to 3) of std_logic_vector(1 downto 0);
--type cdatapartype is array (0 to 3) of std_logic_vector(3 downto 0);
--type cvalidtype is array (0 to 3) of std_logic_vector(7 downto 0);
type cpartype is array (0 to 3) of std_logic_vector(3 downto 0); -- byte parity

type iregfile_in_type is record
  raddr1	: std_logic_vector(9 downto 0); -- read address 1
  raddr2	: std_logic_vector(9 downto 0); -- read address 2
  waddr	 	: std_logic_vector(9 downto 0); -- write address
  wdata 	: std_logic_vector(31 downto 0); -- write data
  wpar  	: std_logic_vector(3 downto 0);  -- write data parity
  ren1          : std_ulogic;			 -- read 1 enable
  ren2          : std_ulogic;			 -- read 2 enable
  wren          : std_ulogic;			 -- write enable
end record;

type iregfile_out_type is record
  data1    	: std_logic_vector(RDBITS-1 downto 0); -- read data 1
  data2    	: std_logic_vector(RDBITS-1 downto 0); -- read data 2
  dpar1    	: std_logic_vector(3 downto 0); -- read data 1 parity
  dpar2    	: std_logic_vector(3 downto 0); -- read data 2 parity
end record;

type cctrltype is record
  burst  : std_ulogic;				-- icache burst enable
  dfrz   : std_ulogic;				-- dcache freeze enable
  ifrz   : std_ulogic;				-- icache freeze enable
  dsnoop : std_ulogic;				-- data cache snooping
  dcs    : std_logic_vector(1 downto 0);	-- dcache state
  ics    : std_logic_vector(1 downto 0);	-- icache state
end record;

type ftcctrl_type is record
  par  : std_ulogic;                                    -- 0 - read tag/data,
                                                        -- 1 - read tag/data parity 
  tb   : std_logic_vector(3 downto 0);                  -- test bits
  ite  : std_logic_vector(1 downto 0);                  -- itag errors
  ide  : std_logic_vector(1 downto 0);                  -- idata errors
  dte  : std_logic_vector(1 downto 0);                  -- dtag errors  
  dde  : std_logic_vector(1 downto 0);                  -- ddata errors
end record;                    

type icache_in_type is record
  rpc              : std_logic_vector(31 downto 0); -- raw address (npc)
  fpc              : std_logic_vector(31 downto 0); -- latched address (fpc)
  dpc              : std_logic_vector(31 downto 0); -- latched address (dpc)
  rbranch          : std_ulogic;			-- Instruction branch
  fbranch          : std_ulogic;			-- Instruction branch
  inull            : std_ulogic;			-- instruction nullify
  su               : std_ulogic;			-- super-user
  flush            : std_ulogic;			-- flush icache
  flushl           : std_ulogic;                        -- flush line
end record;

type icache_out_type is record
  data             : cdatatype;
  set              : std_logic_vector(1 downto 0);
  mexc             : std_ulogic;
  hold             : std_ulogic;
  flush            : std_ulogic;			-- flush in progress
  diagrdy          : std_ulogic;			-- diagnostic access ready
  diagdata         : std_logic_vector(IDBITS-1 downto 0);-- diagnostic data
  mds              : std_ulogic;			-- memory data strobe
  cfg              : std_logic_vector(31 downto 0);
  tparv            : std_ulogic;
  dparv            : std_ulogic;
  tpar            : cpartype;
  tcb             : cpartype;
  dpar            : cpartype;
--  tag              : cdatatype;
--  valid            : cvalidtype;

end record;

type icdiag_in_type is record
  addr             : std_logic_vector(31 downto 0); -- memory stage address
  enable           : std_ulogic;
  read             : std_ulogic;
  tag              : std_ulogic;
  ctx              : std_ulogic;
  flush            : std_ulogic;
  ilramen          : std_ulogic;
  cctrl		   : cctrltype;
  pflush           : std_ulogic;
  pflushaddr       : std_logic_vector(VA_I_U downto VA_I_D); 
  pflushtyp        : std_ulogic;
  ftcctrl            : ftcctrl_type;  
end record;

type dcache_in_type is record
  asi              : std_logic_vector(7 downto 0); 
  maddress         : std_logic_vector(31 downto 0); 
  eaddress         : std_logic_vector(31 downto 0); 
  edata            : std_logic_vector(31 downto 0); 
  size             : std_logic_vector(1 downto 0);
  enaddr           : std_ulogic;
  eenaddr          : std_ulogic;
  nullify          : std_ulogic;
  lock             : std_ulogic;
  read             : std_ulogic;
  write            : std_ulogic;
  flush            : std_ulogic;
  flushl           : std_ulogic;                        -- flush line  
  dsuen            : std_ulogic;
  msu              : std_ulogic;                   -- memory stage supervisor
  esu              : std_ulogic;                   -- execution stage supervisor
  itperr           : std_ulogic;
  idperr           : std_ulogic;    
  dtperr           : std_ulogic;
  ddperr           : std_ulogic;    
end record;

type dcache_out_type is record
  data             : cdatatype;
  set              : std_logic_vector(1 downto 0);
  mexc             : std_ulogic;
  hold             : std_ulogic;
  mds              : std_ulogic;
  werr             : std_ulogic;	
  icdiag           : icdiag_in_type;
  tparv            : std_ulogic;
  --tparerr          : std_ulogic;
  dparv            : std_ulogic;
  tpar            : cpartype;
  tcb             : cpartype;
  dpar            : cpartype;
  cache           : std_ulogic;
end record;

type tracebuf_in_type is record 
  addr             : std_logic_vector(11 downto 0);
  data             : std_logic_vector(127 downto 0);
  enable           : std_logic;
  write            : std_logic_vector(3 downto 0);
end record;

type tracebuf_out_type is record 
  data             : std_logic_vector(127 downto 0);
end record;                           

component iu3
  generic (
    nwin     : integer range 2 to 32 := 8;
    isets    : integer range 1 to 4 := 1;
    dsets    : integer range 1 to 4 := 1;
    fpu      : integer range 0 to 3  := 0;    
    v8       : integer range 0 to 3 := 0;
    cp, mac  : integer range 0 to 1 := 0;
    dsu      : integer range 0 to 1 := 0;
    nwp      : integer range 0 to 4 := 0;
    pclow    : integer range 0 to 2 := 2;
    notag    : integer range 0 to 1 := 0;
    index    : integer range 0 to 15:= 0;
    lddel    : integer range 1 to 2 := 2;
    irfwt    : integer range 0 to 1 := 0;
    disas    : integer range 0 to 1 := 0;
    tbuf     : integer range 0 to 64 := 0;  -- trace buf size in kB (0 - no trace buffer)
    pwd      : integer range 0 to 2 := 0;   -- power-down    
    svt      : integer range 0 to 1 := 0;   -- single-vector trapping
    rstaddr  : integer              := 0;
    nohalt   : integer range 0 to 1 := 0;   -- don't halt on error
    fabtech  : integer range 0 to NTECH := 0
    );
  port (
    clk   : in  std_ulogic;
    rstn  : in  std_ulogic;
    holdn : in  std_ulogic;
    ici   : out icache_in_type;
    ico   : in  icache_out_type;
    dci   : out dcache_in_type;
    dco   : in  dcache_out_type;
    rfi   : out iregfile_in_type;
    rfo   : in  iregfile_out_type;
    irqi  : in  l3_irq_in_type;
    irqo  : out l3_irq_out_type;
    dbgi  : in  l3_debug_in_type;
    dbgo  : out l3_debug_out_type;
    muli  : out mul32_in_type;
    mulo  : in  mul32_out_type;
    divi  : out div32_in_type;
    divo  : in  div32_out_type;
    fpo   : in  fpc_out_type;
    fpi   : out fpc_in_type;
    cpo   : in  fpc_out_type;
    cpi   : out fpc_in_type;
    tbo   : in  tracebuf_out_type;
    tbi   : out tracebuf_in_type
  );
end component;

component iu3ft
  generic (
    nwin     : integer range 2 to 32 := 8;
    isets    : integer range 1 to 4 := 1;
    dsets    : integer range 1 to 4 := 1;
    fpu      : integer range 0 to 3 := 0;
    v8       : integer range 0 to 3 := 0;
    cp, mac  : integer range 0 to 1 := 0;
    dsu      : integer range 0 to 1 := 0;
    nwp      : integer range 0 to 4 := 0;
    pclow    : integer range 0 to 2 := 2;
    notag    : integer range 0 to 1 := 0;
    index    : integer range 0 to 15:= 0;
    lddel    : integer range 1 to 2 := 2;
    irfwt    : integer range 0 to 1 := 0;
    disas    : integer range 0 to 1 := 0;
    tbuf     : integer range 0 to 64 := 0;  -- trace buf size in kB (0 - no trace buffer)
    pwd      : integer range 0 to 2 := 0;   -- power-down
    svt      : integer range 0 to 1 := 0;   -- single-vector trapping
    rstaddr  : integer := 16#00000#;   -- reset vector MSB address
    rfft     : integer range 0 to 2 := 0;
    cft      : integer range 0 to 2 := 0;   -- 0 - no parity check, 1 - parity check in exc stage
                                            -- 2 - parity check in mem stage
    fabtech  : integer range 0 to NTECH := 0
  );
  port (
    clk   : in  std_ulogic;
    rstn  : in  std_ulogic;
    holdn : in  std_ulogic;
    ici   : out icache_in_type;
    ico   : in  icache_out_type;
    dci   : out dcache_in_type;
    dco   : in  dcache_out_type;
    rfi   : out iregfile_in_type;
    rfo   : in  iregfile_out_type;
    irqi  : in  l3_irq_in_type;
    irqo  : out l3_irq_out_type;
    dbgi  : in  l3_debug_in_type;
    dbgo  : out l3_debug_out_type;
    muli  : out mul32_in_type;
    mulo  : in  mul32_out_type;
    divi  : out div32_in_type;
    divo  : in  div32_out_type;
    fpo   : in  fpc_out_type;
    fpi   : out fpc_in_type;
    cpo   : in  fpc_out_type;
    cpi   : out fpc_in_type;
    tbo   : in  tracebuf_out_type;
    tbi   : out tracebuf_in_type
    );
end component;


  component tbufmem 
  generic (
    tech   : integer := 0;
    tbuf  : integer := 0
    );
  port (
    clk : in std_ulogic;
    di  : in tracebuf_in_type;
    do  : out tracebuf_out_type);
  end component;

end;
