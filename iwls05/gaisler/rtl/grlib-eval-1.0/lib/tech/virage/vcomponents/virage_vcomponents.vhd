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
-- Package: 	virage_vcomponents
-- File:	virage_vcomponents.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Simple simulation models for ACTEL RAM and pads
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package virage_vcomponents is

  component hdss1_128x32cm4sw0
  port (
    addr, taddr : in std_logic_vector(6 downto 0);
    clk         : in std_logic;
    di, tdi     : in std_logic_vector(31 downto 0);
    do          : out std_logic_vector(31 downto 0);
    me, oe, we, tme, twe, awt, biste, toe : in std_logic
  );
  end component;

  component hdss1_256x32cm4sw0
  port (
    addr, taddr : in std_logic_vector(7 downto 0);
    clk         : in std_logic;
    di, tdi     : in std_logic_vector(31 downto 0);
    do          : out std_logic_vector(31 downto 0);
    me, oe, we, tme, twe, awt, biste, toe : in std_logic
  );
  end component;

  component hdss1_512x32cm4sw0
  port (
    addr, taddr : in std_logic_vector(8 downto 0);
    clk         : in std_logic;
    di, tdi     : in std_logic_vector(31 downto 0);
    do          : out std_logic_vector(31 downto 0);
    me, oe, we, tme, twe, awt, biste, toe : in std_logic
  );
  end component;

  component hdss1_1024x32cm4sw0
  port (
    addr, taddr : in std_logic_vector(9 downto 0);
    clk         : in std_logic;
    di, tdi     : in std_logic_vector(31 downto 0);
    do          : out std_logic_vector(31 downto 0);
    me, oe, we, tme, twe, awt, biste, toe : in std_logic
  );
  end component;

  component hdss1_2048x32cm8sw0
  port (
    addr, taddr : in std_logic_vector(10 downto 0);
    clk         : in std_logic;
    di, tdi     : in std_logic_vector(31 downto 0);
    do          : out std_logic_vector(31 downto 0);
    me, oe, we, tme, twe, awt, biste, toe : in std_logic
  );
  end component;

  component rfss2_136x32cm2sw0
  port (
    addra, taddra : in std_logic_vector(7 downto 0);
    addrb, taddrb : in std_logic_vector(7 downto 0);
    clka, clkb    : in std_logic;
    dia, tdia     : in std_logic_vector(31 downto 0);
    dob      : out std_logic_vector(31 downto 0);
    mea, wea, tmea, twea, bistea : in std_logic;
    meb, oeb, tmeb,  awtb, bisteb, toeb : in std_logic
  );
  end component;

  component rfss2_168x32cm2sw0
  port (
    addra, taddra : in std_logic_vector(7 downto 0);
    addrb, taddrb : in std_logic_vector(7 downto 0);
    clka, clkb    : in std_logic;
    dia, tdia     : in std_logic_vector(31 downto 0);
    dob      : out std_logic_vector(31 downto 0);
    mea, wea, tmea, twea, bistea : in std_logic;
    meb, oeb, tmeb,  awtb, bisteb, toeb : in std_logic
  );
  end component;

  component hdss2_64x32cm4sw0
  port (
    addra, taddra : in std_logic_vector(5 downto 0);
    addrb, taddrb : in std_logic_vector(5 downto 0);
    clka, clkb    : in std_logic;
    dia, tdia     : in std_logic_vector(31 downto 0);
    dib, tdib     : in std_logic_vector(31 downto 0);
    doa, dob      : out std_logic_vector(31 downto 0);
    mea, oea, wea, tmea, twea, awta, bistea, toea : in std_logic;
    meb, oeb, web, tmeb, tweb, awtb, bisteb, toeb : in std_logic
  );
  end component;

  component hdss2_128x32cm4sw0
  port (
    addra, taddra : in std_logic_vector(6 downto 0);
    addrb, taddrb : in std_logic_vector(6 downto 0);
    clka, clkb    : in std_logic;
    dia, tdia     : in std_logic_vector(31 downto 0);
    dib, tdib     : in std_logic_vector(31 downto 0);
    doa, dob      : out std_logic_vector(31 downto 0);
    mea, oea, wea, tmea, twea, awta, bistea, toea : in std_logic;
    meb, oeb, web, tmeb, tweb, awtb, bisteb, toeb : in std_logic
  );
  end component;

  component hdss2_256x32cm4sw0
  port (
    addra, taddra : in std_logic_vector(7 downto 0);
    addrb, taddrb : in std_logic_vector(7 downto 0);
    clka, clkb    : in std_logic;
    dia, tdia     : in std_logic_vector(31 downto 0);
    dib, tdib     : in std_logic_vector(31 downto 0);
    doa, dob      : out std_logic_vector(31 downto 0);
    mea, oea, wea, tmea, twea, awta, bistea, toea : in std_logic;
    meb, oeb, web, tmeb, tweb, awtb, bisteb, toeb : in std_logic
  );
  end component;

  component hdss2_512x32cm4sw0
  port (
    addra, taddra : in std_logic_vector(8 downto 0);
    addrb, taddrb : in std_logic_vector(8 downto 0);
    clka, clkb    : in std_logic;
    dia, tdia     : in std_logic_vector(31 downto 0);
    dib, tdib     : in std_logic_vector(31 downto 0);
    doa, dob      : out std_logic_vector(31 downto 0);
    mea, oea, wea, tmea, twea, awta, bistea, toea : in std_logic;
    meb, oeb, web, tmeb, tweb, awtb, bisteb, toeb : in std_logic
  );
  end component;

end;
