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
-- Package: 	pad_ihp25_gen
-- File:	pad_ihp25_gen.vhd
-- Author:	Marko Isomaki - Gaisler Research
-- Description:	IHP 0.25um pad wrappers 
------------------------------------------------------------------------------

--Input Pad
library ieee;
library ihp25; 
use ieee.std_logic_1164.all; 
use ihp25.ihp25_components.all; 

entity ihp25_inpad is
  generic(level : integer := 0; voltage : integer := 0);
  port (pad : in std_logic; o : out std_logic);
end; 

architecture rtl of ihp25_inpad is
begin
  i0 : inbuf3_16 port map (o, pad);
end;

-- Bidirectional pad
library ieee;
library ihp25;
use ieee.std_logic_1164.all;
use ihp25.ihp25_components.all; 

entity ihp25_iopad is
  generic (level : integer := 0; slew : integer := 0;
           voltage : integer := 0; strength : integer := 0);
  port (pad : inout std_logic; i, en : in std_logic; o : out std_logic);
end;

architecture rtl of ihp25_iopad is
begin
  d0 : if strength <= 4 generate
    i0 : iobuf3_16pu_4 port map (pad, o, i, en);
  end generate;

  d1 : if strength > 4 and strength <= 8 generate
    i0 : iobuf3_16pu_8 port map (pad, o, i, en);
  end generate;
  
  d2 : if strength > 8 generate
    i0 : iobuf3_16pu_12 port map (pad, o, i, en);
  end generate; 
end;

--Output pad
library ieee;
library ihp25;
use ieee.std_logic_1164.all;
use ihp25.ihp25_components.all; 

entity ihp25_outpad is
  generic (level : integer := 0; slew : integer := 0;
           voltage : integer := 0; strength : integer := 0);
  port (pad : out  std_logic; i : in  std_logic);
end; 

architecture rtl of ihp25_outpad is
signal en, di, pad_io : std_logic;
begin
  en <= '1';
  pad <= pad_io;

  d0 : if strength <= 4 generate
    i0 : iobuf3_16_4 port map (pad_io, di, i, en);
  end generate;

  d1 : if strength > 4 and strength <= 8 generate
    i0 : iobuf3_16_8 port map (pad_io, di, i, en);
  end generate;

  d2 : if strength > 8 generate
    i0 : iobuf3_16_12 port map (pad_io, di, i, en);
  end generate; 
end;

--Tristate output pad
library ieee;
library ihp25;
use ieee.std_logic_1164.all;
use ihp25.ihp25_components.all; 

entity ihp25_toutpad is
  generic (level : integer := 0; slew : integer := 0;
           voltage : integer := 0; strength : integer := 0);
  port (pad : out std_logic; i, en : in std_logic);
end;

architecture rtl of ihp25_toutpad is
signal di, pad_io : std_logic;
begin
  pad <= pad_io;
  d0 : if strength <= 4 generate
    i0 : iobuf3_16pu_4 port map (pad_io, di, i, en);
  end generate;

  d1 : if strength > 4 and strength <= 8 generate
    i0 : iobuf3_16pu_8 port map (pad_io, di, i, en);
  end generate;

  d2 : if strength > 8 generate
    i0 : iobuf3_16pu_12 port map (pad_io, di, i, en);
  end generate; 
end;

--Clk Pad
library ieee;
use ieee.std_logic_1164.all; 

entity ihp25_clkpad is
  generic(level : integer := 0; voltage : integer := 0);
  port (pad : in std_logic; o : out std_logic);
end; 

architecture rtl of ihp25_clkpad is
begin
  o <= pad; 
end;
