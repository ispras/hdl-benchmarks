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
-- Package: 	components
-- File:	components.vhd
-- Author:	Edvin Catovic, Jiri Gaisler - Gaisler Research
-- Description:	FPU component and type declaration
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package components is 
  

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

  component meiko 
    port (
      ss_clock   : in  std_logic;
      fpinst     : in  std_logic_vector(9 downto 0);
      fpop       : in  std_logic;
      fpld       : in  std_logic;
      reset      : in  std_logic;
      fprf_dout1 : in  std_logic_vector(63 downto 0);
      fprf_dout2 : in  std_logic_vector(63 downto 0);
      roundingmode : in  std_logic_vector(1 downto 0);
      fpbusy     : out std_logic;
      fracresult : out std_logic_vector(54 downto 3);
      expresult  : out std_logic_vector(10 downto 0);
      signresult : out std_logic;
      snnotdb    : out std_logic;
      excep      : out std_logic_vector(5 downto 0);
      conditioncodes : out std_logic_vector(1 downto 0);
      ss_scan_mode : in  std_logic;
      fp_ctl_scan_in : in  std_logic;
      fp_ctl_scan_out : out std_logic
    );
  end component;

end;
