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
-- Simple simulation models for some Xilinx blocks
-- Author: Jiri Gaisler
----------------------------------------------------------------------------

-- pragma translate_off

library ieee;
use ieee.std_logic_1164.all;

package simple_simprim is

  component ramb4_generic
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (DI     : in std_logic_vector (dbits-1 downto 0);
        EN     : in std_ulogic;
        WE     : in std_ulogic;
        RST    : in std_ulogic;
        CLK    : in std_ulogic;
        ADDR   : in std_logic_vector (abits-1 downto 0);
        DO     : out std_logic_vector (dbits-1 downto 0)
       );
  end component;     

  component ramb4_sx_sx
  generic (abits : integer := 10; dbits : integer := 8 );
  port (DIA    : in std_logic_vector (dbits-1 downto 0);
        DIB    : in std_logic_vector (dbits-1 downto 0);
        ENA    : in std_ulogic;
        ENB    : in std_ulogic;
        WEA    : in std_ulogic;
        WEB    : in std_ulogic;
        RSTA   : in std_ulogic;
        RSTB   : in std_ulogic;
        CLKA   : in std_ulogic;
        CLKB   : in std_ulogic;
        ADDRA  : in std_logic_vector (abits-1 downto 0);
        ADDRB  : in std_logic_vector (abits-1 downto 0);
        DOA    : out std_logic_vector (dbits-1 downto 0);
        DOB    : out std_logic_vector (dbits-1 downto 0)
       );
  end component;

  component ramb16_sx
  generic (abits : integer := 10; dbits : integer := 8 );
  port (
    DO : out std_logic_vector (dbits-1 downto 0);
    ADDR : in std_logic_vector (abits-1 downto 0);
    DI : in std_logic_vector (dbits-1 downto 0);
    EN : in std_ulogic;
    CLK : in std_ulogic;
    WE : in std_ulogic;
    SSR : in std_ulogic);
  end component;

  component ram16_sx_sx 
  generic (abits : integer := 10; dbits : integer := 8 );
  port (
   DOA : out std_logic_vector (dbits-1 downto 0);
   DOB : out std_logic_vector (dbits-1 downto 0);
   ADDRA : in std_logic_vector (abits-1 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (dbits-1 downto 0);
   ENA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (abits-1 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (dbits-1 downto 0);
   ENB : in std_ulogic;
   WEB : in std_ulogic);
  end component;

end;

-- simulation models for select-rams

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ramb4_generic is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (DI     : in std_logic_vector (dbits-1 downto 0);
        EN     : in std_ulogic;
        WE     : in std_ulogic;
        RST    : in std_ulogic;
        CLK    : in std_ulogic;
        ADDR   : in std_logic_vector (abits-1 downto 0);
        DO     : out std_logic_vector (dbits-1 downto 0)
       );
end;     

architecture behavioral of ramb4_generic is
  type mem is array(0 to (2**abits -1)) 
	of std_logic_vector((dbits -1) downto 0);
begin
  main : process(clk)
  variable memarr : mem;
  begin
    if rising_edge(clk)then
      if (en = '1') and not (is_x(addr)) then
        do <= memarr(to_integer(unsigned(addr)));
      end if;
      if (we and en) = '1' then
        if not is_x(addr) then
   	  memarr(to_integer(unsigned(addr))) := di;
        end if;
      end if;
    end if;
  end process;

end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ramb16_sx is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    DO : out std_logic_vector (dbits-1 downto 0);
    ADDR : in std_logic_vector (abits-1 downto 0);
    DI : in std_logic_vector (dbits-1 downto 0);
    EN : in std_ulogic;
    CLK : in std_ulogic;
    WE : in std_ulogic;
    SSR : in std_ulogic
  );
end;
architecture behav of ramb16_sx is
begin
  rp : process(clk)
  subtype dword is std_logic_vector(dbits-1 downto 0);
  type dregtype is array (0 to 2**abits -1) of DWord;
  variable rfd : dregtype;
  begin
    if rising_edge(clk) and not is_x (addr) then 
      if en = '1' then
        do <= rfd(to_integer(unsigned(addr)));
        if we = '1' then rfd(to_integer(unsigned(addr))) := di; end if;
      end if;
    end if;
  end process;
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S16 is
  port (DI     : in std_logic_vector (15 downto 0);
        EN     : in std_ulogic;
        WE     : in std_ulogic;
        RST    : in std_ulogic;
        CLK    : in std_ulogic;
        ADDR   : in std_logic_vector (7 downto 0);
        DO     : out std_logic_vector (15 downto 0)
       );
end;
architecture behav of RAMB4_S16 is
begin x : ramb4_generic generic map (8,16)
          port map (di, en, we, rst, clk, addr, do); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S8 is
  port (DI     : in std_logic_vector (7 downto 0);
        EN     : in std_ulogic;
        WE     : in std_ulogic;
        RST    : in std_ulogic;
        CLK    : in std_ulogic;
        ADDR   : in std_logic_vector (8 downto 0);
        DO     : out std_logic_vector (7 downto 0)
       );
end;
architecture behav of RAMB4_S8 is
begin x : ramb4_generic generic map (9,8)
          port map (di, en, we, rst, clk, addr, do); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S4 is
  port (DI     : in std_logic_vector (3 downto 0);
        EN     : in std_ulogic;
        WE     : in std_ulogic;
        RST    : in std_ulogic;
        CLK    : in std_ulogic;
        ADDR   : in std_logic_vector (9 downto 0);
        DO     : out std_logic_vector (3 downto 0)
       );
end;
architecture behav of RAMB4_S4 is
begin x : ramb4_generic generic map (10,4)
          port map (di, en, we, rst, clk, addr, do); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S2 is
  port (DI     : in std_logic_vector (1 downto 0);
        EN     : in std_ulogic;
        WE     : in std_ulogic;
        RST    : in std_ulogic;
        CLK    : in std_ulogic;
        ADDR   : in std_logic_vector (10 downto 0);
        DO     : out std_logic_vector (1 downto 0)
       );
end;
architecture behav of RAMB4_S2 is
begin x : ramb4_generic generic map (11,2)
          port map (di, en, we, rst, clk, addr, do); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S1 is
  port (DI     : in std_logic_vector (0 downto 0);
        EN     : in std_ulogic;
        WE     : in std_ulogic;
        RST    : in std_ulogic;
        CLK    : in std_ulogic;
        ADDR   : in std_logic_vector (11 downto 0);
        DO     : out std_logic_vector (0 downto 0)
       );
end;
architecture behav of RAMB4_S1 is
begin x : ramb4_generic generic map (12,1)
          port map (di, en, we, rst, clk, addr, do); 
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAMB4_SX_SX is
  generic (abits : integer := 10; dbits : integer := 8 );
  port (DIA    : in std_logic_vector (dbits-1 downto 0);
        DIB    : in std_logic_vector (dbits-1 downto 0);
        ENA    : in std_ulogic;
        ENB    : in std_ulogic;
        WEA    : in std_ulogic;
        WEB    : in std_ulogic;
        RSTA   : in std_ulogic;
        RSTB   : in std_ulogic;
        CLKA   : in std_ulogic;
        CLKB   : in std_ulogic;
        ADDRA  : in std_logic_vector (abits-1 downto 0);
        ADDRB  : in std_logic_vector (abits-1 downto 0);
        DOA    : out std_logic_vector (dbits-1 downto 0);
        DOB    : out std_logic_vector (dbits-1 downto 0)
       );
end;
architecture behav of RAMB4_SX_SX is
begin
  rp : process(clka, clkb)
  subtype dword is std_logic_vector(dbits-1 downto 0);
  type dregtype is array (0 to 2**abits-1) of DWord;
  variable rfd : dregtype;
  begin
    if rising_edge(clka) and not is_x (addra) then 
      if ena = '1' then
        doa <= rfd(to_integer(unsigned(addra)));
        if wea = '1' then rfd(to_integer(unsigned(addra))) := dia; end if;
      end if;
    end if;
    if rising_edge(clkb) and not is_x (addrb) then 
      if enb = '1' then
        dob <= rfd(to_integer(unsigned(addrb)));
        if web = '1' then rfd(to_integer(unsigned(addrb))) := dib; end if;
      end if;
    end if;
  end process;
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S1_S1 is
  port (DIA    : in std_logic_vector (0 downto 0);
        DIB    : in std_logic_vector (0 downto 0);
        ENA    : in std_ulogic;
        ENB    : in std_ulogic;
        WEA    : in std_ulogic;
        WEB    : in std_ulogic;
        RSTA   : in std_ulogic;
        RSTB   : in std_ulogic;
        CLKA   : in std_ulogic;
        CLKB   : in std_ulogic;
        ADDRA  : in std_logic_vector (11 downto 0);
        ADDRB  : in std_logic_vector (11 downto 0);
        DOA    : out std_logic_vector (0 downto 0);
        DOB    : out std_logic_vector (0 downto 0)
       );
end;
architecture behav of RAMB4_S1_S1 is
begin
  u0 : RAMB4_Sx_Sx generic map (12, 1)
       port map (DIA, DIB, ENA, ENB, WEA, WEB, RSTA, RSTB, CLKA, CLKB, ADDRA,
       ADDRB, DOA, DOB);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S2_S2 is
  port (DIA    : in std_logic_vector (1 downto 0);
        DIB    : in std_logic_vector (1 downto 0);
        ENA    : in std_ulogic;
        ENB    : in std_ulogic;
        WEA    : in std_ulogic;
        WEB    : in std_ulogic;
        RSTA   : in std_ulogic;
        RSTB   : in std_ulogic;
        CLKA   : in std_ulogic;
        CLKB   : in std_ulogic;
        ADDRA  : in std_logic_vector (10 downto 0);
        ADDRB  : in std_logic_vector (10 downto 0);
        DOA    : out std_logic_vector (1 downto 0);
        DOB    : out std_logic_vector (1 downto 0)
       );
end;
architecture behav of RAMB4_S2_S2 is
begin
  u0 : RAMB4_Sx_Sx generic map (11, 2)
       port map (DIA, DIB, ENA, ENB, WEA, WEB, RSTA, RSTB, CLKA, CLKB, ADDRA,
       ADDRB, DOA, DOB);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S8_S8 is
  port (DIA    : in std_logic_vector (7 downto 0);
        DIB    : in std_logic_vector (7 downto 0);
        ENA    : in std_ulogic;
        ENB    : in std_ulogic;
        WEA    : in std_ulogic;
        WEB    : in std_ulogic;
        RSTA   : in std_ulogic;
        RSTB   : in std_ulogic;
        CLKA   : in std_ulogic;
        CLKB   : in std_ulogic;
        ADDRA  : in std_logic_vector (8 downto 0);
        ADDRB  : in std_logic_vector (8 downto 0);
        DOA    : out std_logic_vector (7 downto 0);
        DOB    : out std_logic_vector (7 downto 0)
       );
end;

architecture behav of RAMB4_S8_S8 is
begin
  u0 : RAMB4_Sx_Sx generic map (9, 8)
       port map (DIA, DIB, ENA, ENB, WEA, WEB, RSTA, RSTB, CLKA, CLKB, ADDRA,
       ADDRB, DOA, DOB);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S4_S4 is
  port (DIA    : in std_logic_vector (3 downto 0);
        DIB    : in std_logic_vector (3 downto 0);
        ENA    : in std_ulogic;
        ENB    : in std_ulogic;
        WEA    : in std_ulogic;
        WEB    : in std_ulogic;
        RSTA   : in std_ulogic;
        RSTB   : in std_ulogic;
        CLKA   : in std_ulogic;
        CLKB   : in std_ulogic;
        ADDRA  : in std_logic_vector (9 downto 0);
        ADDRB  : in std_logic_vector (9 downto 0);
        DOA    : out std_logic_vector (3 downto 0);
        DOB    : out std_logic_vector (3 downto 0)
       );
end;
architecture behav of RAMB4_S4_S4 is
begin
  u0 : RAMB4_Sx_Sx generic map (4, 10)
       port map (DIA, DIB, ENA, ENB, WEA, WEB, RSTA, RSTB, CLKA, CLKB, ADDRA,
       ADDRB, DOA, DOB);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB4_S16_S16 is
  port (DIA    : in std_logic_vector (15 downto 0);
        DIB    : in std_logic_vector (15 downto 0);
        ENA    : in std_ulogic;
        ENB    : in std_ulogic;
        WEA    : in std_ulogic;
        WEB    : in std_ulogic;
        RSTA   : in std_ulogic;
        RSTB   : in std_ulogic;
        CLKA   : in std_ulogic;
        CLKB   : in std_ulogic;
        ADDRA  : in std_logic_vector (7 downto 0);
        ADDRB  : in std_logic_vector (7 downto 0);
        DOA    : out std_logic_vector (15 downto 0);
        DOB    : out std_logic_vector (15 downto 0)
       );
end;
architecture behav of RAMB4_S16_S16 is
begin
  u0 : RAMB4_Sx_Sx generic map (8, 16)
       port map (DIA, DIB, ENA, ENB, WEA, WEB, RSTA, RSTB, CLKA, CLKB, ADDRA,
       ADDRB, DOA, DOB);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S1 is
 port (
   DO : out std_logic_vector (0 downto 0);
   ADDR : in std_logic_vector (13 downto 0);
   DI : in std_logic_vector (0 downto 0);
   EN : in std_ulogic;
   CLK : in std_ulogic;
   WE : in std_ulogic;
   SSR : in std_ulogic
 );
end;
architecture behav of RAMB16_S1 is
begin x : ramb16_sx generic map (14,1)
          port map (do, addr, di, en, clk, we, ssr); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S2 is
 port (
   DO : out std_logic_vector (1 downto 0);
   ADDR : in std_logic_vector (12 downto 0);
   DI : in std_logic_vector (1 downto 0);
   EN : in std_ulogic;
   CLK : in std_ulogic;
   WE : in std_ulogic;
   SSR : in std_ulogic
 );
end;
architecture behav of RAMB16_S2 is
begin x : ramb16_sx generic map (13,2)
          port map (do, addr, di, en, clk, we, ssr); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S4 is
 port (
   DO : out std_logic_vector (3 downto 0);
   ADDR : in std_logic_vector (11 downto 0);
   DI : in std_logic_vector (3 downto 0);
   EN : in std_ulogic;
   CLK : in std_ulogic;
   WE : in std_ulogic;
   SSR : in std_ulogic
 );
end;
architecture behav of RAMB16_S4 is
begin x : ramb16_sx generic map (12,4)
          port map (do, addr, di, en, clk, we, ssr); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S9 is
 port (
   DO : out std_logic_vector (7 downto 0);
   DOP : out std_logic_vector (0 downto 0);
   ADDR : in std_logic_vector (10 downto 0);
   DI : in std_logic_vector (7 downto 0);
   DIP : in std_logic_vector (0 downto 0);
   EN : in std_ulogic;
   CLK : in std_ulogic;
   WE : in std_ulogic;
   SSR : in std_ulogic
 );
end;
architecture behav of RAMB16_S9 is
signal dix, dox : std_logic_vector (8 downto 0);
begin x : ramb16_sx generic map (11,9)
          port map (dox, addr, dix, en, clk, we, ssr); 
  dix <= dip & di; dop <= dox(8 downto 8); do <= dox(7 downto 0);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S18 is
 port (
   DO : out std_logic_vector (15 downto 0);
   DOP : out std_logic_vector (1 downto 0);
   ADDR : in std_logic_vector (9 downto 0);
   DI : in std_logic_vector (15 downto 0);
   DIP : in std_logic_vector (1 downto 0);
   EN : in std_ulogic;
   CLK : in std_ulogic;
   WE : in std_ulogic;
   SSR : in std_ulogic
 );
end;
architecture behav of RAMB16_S18 is
signal dix, dox : std_logic_vector (17 downto 0);
begin x : ramb16_sx generic map (10,18)
          port map (dox, addr, dix, en, clk, we, ssr); 
  dix <= dip & di; dop <= dox(17 downto 16); do <= dox(15 downto 0);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S36 is
 port (
   DO : out std_logic_vector (31 downto 0);
   DOP : out std_logic_vector (3 downto 0);
   ADDR : in std_logic_vector (8 downto 0);
   DI : in std_logic_vector (31 downto 0);
   DIP : in std_logic_vector (3 downto 0);
   EN : in std_ulogic;
   CLK : in std_ulogic;
   WE : in std_ulogic;
   SSR : in std_ulogic
 );
end;
architecture behav of RAMB16_S36 is
signal dix, dox : std_logic_vector (35 downto 0);
begin x : ramb16_sx generic map (9, 36)
          port map (dox, addr, dix, en, clk, we, ssr); 
  dix <= dip & di; dop <= dox(35 downto 32); do <= dox(31 downto 0);
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram16_sx_sx is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
   DOA : out std_logic_vector (dbits-1 downto 0);
   DOB : out std_logic_vector (dbits-1 downto 0);
   ADDRA : in std_logic_vector (abits-1 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (dbits-1 downto 0);
   ENA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (abits-1 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (dbits-1 downto 0);
   ENB : in std_ulogic;
   WEB : in std_ulogic
  );
end;

architecture behav of ram16_sx_sx is
    signal async : std_ulogic := '0';
begin
  
  ramproc : process(clka, clkb)
    subtype dword is std_logic_vector(dbits-1 downto 0);
    type dregtype is array (0 to 2**abits -1) of DWord;
    variable rfd : dregtype;    
  begin
    
    if rising_edge(clka) and not is_x (addra) then
      if ena = '1' then
        if wea = '1' then
          rfd(to_integer(unsigned(addra))) := dia;
        end if;
          doa <= rfd(to_integer(unsigned(addra)));
      end if;
    end if;
    
    if rising_edge(clkb) and not is_x (addrb) then
      if enb = '1' then
        if web = '1' then
          rfd(to_integer(unsigned(addrb))) := dib;
        end if;
          dob <= rfd(to_integer(unsigned(addrb)));
        end if;
    end if;    

  end process;
  
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S1_S1 is
  port (
   DOA : out std_logic_vector (0 downto 0);
   DOB : out std_logic_vector (0 downto 0);
   ADDRA : in std_logic_vector (13 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (0 downto 0);
   ENA : in std_ulogic;
   SSRA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (13 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (0 downto 0);
   ENB : in std_ulogic;
   SSRB : in std_ulogic;
   WEB : in std_ulogic
  );
end;
architecture behav of RAMB16_S1_S1 is
begin 
  x : ram16_sx_sx generic map (14, 1)
  port map (doa, dob, addra, clka, dia, ena, wea, addrb, clkb, dib, enb, web); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S2_S2 is
  port (
   DOA : out std_logic_vector (1 downto 0);
   DOB : out std_logic_vector (1 downto 0);
   ADDRA : in std_logic_vector (12 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (1 downto 0);
   ENA : in std_ulogic;
   SSRA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (12 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (1 downto 0);
   ENB : in std_ulogic;
   SSRB : in std_ulogic;
   WEB : in std_ulogic
  );
end;
architecture behav of RAMB16_S2_S2 is
begin 
  x : ram16_sx_sx generic map (13, 2)
  port map (doa, dob, addra, clka, dia, ena, wea, addrb, clkb, dib, enb, web); 
end;


library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S4_S4 is
  port (
   DOA : out std_logic_vector (3 downto 0);
   DOB : out std_logic_vector (3 downto 0);
   ADDRA : in std_logic_vector (11 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (3 downto 0);
   ENA : in std_ulogic;
   SSRA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (11 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (3 downto 0);
   ENB : in std_ulogic;
   SSRB : in std_ulogic;
   WEB : in std_ulogic
  );
end;
architecture behav of RAMB16_S4_S4 is
begin 
  x : ram16_sx_sx generic map (12, 4)
  port map (doa, dob, addra, clka, dia, ena, wea, addrb, clkb, dib, enb, web); 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S9_S9 is
  port (
   DOA : out std_logic_vector (7 downto 0);
   DOPA : out std_logic_vector (0 downto 0);
   DOB : out std_logic_vector (7 downto 0);
   DOPB : out std_logic_vector (0 downto 0);
   ADDRA : in std_logic_vector (10 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (7 downto 0);
   DIPA : in std_logic_vector (0 downto 0);
   ENA : in std_ulogic;
   SSRA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (10 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (7 downto 0);
   DIPB : in std_logic_vector (0 downto 0);
   ENB : in std_ulogic;
   SSRB : in std_ulogic;
   WEB : in std_ulogic
  );
end;
architecture behav of RAMB16_S9_S9 is
signal diax, doax, dibx, dobx : std_logic_vector (8 downto 0);
begin 
  x : ram16_sx_sx generic map (11, 9)
  port map (doax, dobx, addra, clka, diax, ena, wea, addrb, clkb, dibx, enb, web); 
  diax <= dipa & dia; dopa <= doax(8 downto 8); doa <= doax(7 downto 0);
  dibx <= dipb & dib; dopb <= dobx(8 downto 8); dob <= dobx(7 downto 0);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S18_S18 is
  port (
   DOA : out std_logic_vector (15 downto 0);
   DOPA : out std_logic_vector (1 downto 0);
   DOB : out std_logic_vector (15 downto 0);
   DOPB : out std_logic_vector (1 downto 0);
   ADDRA : in std_logic_vector (9 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (15 downto 0);
   DIPA : in std_logic_vector (1 downto 0);
   ENA : in std_ulogic;
   SSRA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (9 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (15 downto 0);
   DIPB : in std_logic_vector (1 downto 0);
   ENB : in std_ulogic;
   SSRB : in std_ulogic;
   WEB : in std_ulogic
  );
end;
architecture behav of RAMB16_S18_S18 is
signal diax, doax, dibx, dobx : std_logic_vector (17 downto 0);
begin 
  x : ram16_sx_sx generic map (10, 18)
  port map (doax, dobx, addra, clka, diax, ena, wea, addrb, clkb, dibx, enb, web); 
  diax <= dipa & dia; dopa <= doax(17 downto 16); doa <= doax(15 downto 0);
  dibx <= dipb & dib; dopb <= dobx(17 downto 16); dob <= dobx(15 downto 0);
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.simple_simprim.all;

entity RAMB16_S36_S36 is
  port (
   DOA : out std_logic_vector (31 downto 0);
   DOPA : out std_logic_vector (3 downto 0);
   DOB : out std_logic_vector (31 downto 0);
   DOPB : out std_logic_vector (3 downto 0);
   ADDRA : in std_logic_vector (8 downto 0);
   CLKA : in std_ulogic;
   DIA : in std_logic_vector (31 downto 0);
   DIPA : in std_logic_vector (3 downto 0);
   ENA : in std_ulogic;
   SSRA : in std_ulogic;
   WEA : in std_ulogic;
   ADDRB : in std_logic_vector (8 downto 0);
   CLKB : in std_ulogic;
   DIB : in std_logic_vector (31 downto 0);
   DIPB : in std_logic_vector (3 downto 0);
   ENB : in std_ulogic;
   SSRB : in std_ulogic;
   WEB : in std_ulogic
  );
end;
architecture behav of RAMB16_S36_S36 is
signal diax, doax, dibx, dobx : std_logic_vector (35 downto 0);
begin 
  x : ram16_sx_sx generic map (9, 36)
  port map (doax, dobx, addra, clka, diax, ena, wea, addrb, clkb, dibx, enb, web); 
  diax <= dipa & dia; dopa <= doax(35 downto 32); doa <= doax(31 downto 0);
  dibx <= dipb & dib; dopb <= dobx(35 downto 32); dob <= dobx(31 downto 0);
end;

library ieee;
use ieee.std_logic_1164.all;

entity BSCAN_VIRTEX2 is
  port (CAPTURE : out STD_ULOGIC;
        DRCK1 : out STD_ULOGIC;
        DRCK2 : out STD_ULOGIC;
        RESET : out STD_ULOGIC;
        SEL1 : out STD_ULOGIC;
        SEL2 : out STD_ULOGIC;
        SHIFT : out STD_ULOGIC;
        TDI : out STD_ULOGIC;
        UPDATE : out STD_ULOGIC;
        TDO1 : in STD_ULOGIC;
        TDO2 : in STD_ULOGIC);
end;

architecture behav of BSCAN_VIRTEX2 is
begin
  CAPTURE <= '0'; DRCK1 <= '0'; DRCK2 <= '0'; 
  RESET <= '0'; SEL1 <= '0'; SEL2 <= '0'; 
  SHIFT <= '0'; TDI  <= '0'; UPDATE <= '0'; 
end;

library ieee;
use ieee.std_logic_1164.all;
  
entity BSCAN_SPARTAN3 is
  port (CAPTURE : out STD_ULOGIC;
        DRCK1 : out STD_ULOGIC;
        DRCK2 : out STD_ULOGIC;
        RESET : out STD_ULOGIC;
        SEL1 : out STD_ULOGIC;
        SEL2 : out STD_ULOGIC;
        SHIFT : out STD_ULOGIC;
        TDI : out STD_ULOGIC;
        UPDATE : out STD_ULOGIC;
        TDO1 : in STD_ULOGIC;
        TDO2 : in STD_ULOGIC);
end;

architecture behav of BSCAN_SPARTAN3 is
begin
  CAPTURE <= '0'; DRCK1 <= '0'; DRCK2 <= '0'; 
  RESET <= '0'; SEL1 <= '0'; SEL2 <= '0'; 
  SHIFT <= '0'; TDI  <= '0'; UPDATE <= '0';       
end;

library ieee; use ieee.std_logic_1164.all;
entity BUFGMUX is port (O : out std_logic; I0, I1, S : in std_logic); end;
architecture beh of BUFGMUX is 
begin o <= to_X01(I0) when to_X01(S) = '0' else I1; end;

library ieee; use ieee.std_logic_1164.all;
entity BUFG is port (O : out std_logic; I : in std_logic); end;
architecture beh of BUFG is begin o <= to_X01(i); end;

library ieee; use ieee.std_logic_1164.all;
entity BUFGP is port (O : out std_logic; I : in std_logic); end;
architecture beh of BUFGP is begin o <= to_X01(i); end;

library ieee; use ieee.std_logic_1164.all;
entity BUFGDLL is port (O : out std_logic; I : in std_logic); end;
architecture beh of BUFGDLL is begin o <= to_X01(i); end;

library ieee; use ieee.std_logic_1164.all;
entity IBUFG is generic (
    CAPACITANCE : string := "DONT_CARE"; IOSTANDARD : string := "LVCMOS25");
  port (O : out std_logic; I : in std_logic); end;
architecture beh of IBUFG is begin o <= to_X01(i) after 1 ns; end;

library ieee; use ieee.std_logic_1164.all;
entity IBUF is generic (
    CAPACITANCE : string := "DONT_CARE"; IOSTANDARD : string := "LVCMOS25");
  port (O : out std_logic; I : in std_logic); end;
architecture beh of IBUF is begin o <= to_X01(i) after 1 ns; end;

library ieee;
use ieee.std_logic_1164.all;
entity OBUF is generic (
    CAPACITANCE : string := "DONT_CARE"; DRIVE : integer := 12;
    IOSTANDARD  : string := "LVCMOS25"; SLEW : string := "SLOW");
  port (O : out std_ulogic; I : in std_ulogic); end;
architecture beh of OBUF is
begin o <= to_X01(i) after 5 ns / (drive/8+1) when SLEW = "SLOW" else 
           to_X01(i) after 4 ns / (drive/8+1); end;

library ieee;
use ieee.std_logic_1164.all;
entity IOBUF is  generic (
    CAPACITANCE : string := "DONT_CARE"; DRIVE : integer := 12;
    IOSTANDARD  : string := "LVCMOS25"; SLEW : string := "SLOW");
  port ( O  : out std_ulogic; IO : inout std_logic; I, T : in std_ulogic);
end;
architecture beh of IOBUF is
begin
  io <= 'X' after 4 ns / (drive/8+1) when to_X01(t) = 'X' else 
        I after 5 ns / (drive/8+1) when (to_X01(t) = '0') and (SLEW = "SLOW") else 
        I after 4 ns / (drive/8+1) when (to_X01(t) = '0') else 
       'Z' after 2 ns / (drive/8+1) when to_X01(t) = '1';
  o <= to_X01(io) after 1 ns;
end;

library ieee;
use ieee.std_logic_1164.all;
entity OBUFT is  generic (
    CAPACITANCE : string := "DONT_CARE"; DRIVE : integer := 12;
    IOSTANDARD  : string := "LVCMOS25"; SLEW : string := "SLOW");
  port ( O  : out std_ulogic; I, T : in std_ulogic);
end;
architecture beh of OBUFT is
begin
  o <= I after 5 ns / (drive/8+1) when (to_X01(t) = '0') and (SLEW = "SLOW") else 
       I after 4 ns / (drive/8+1) when to_X01(t) = '0' else 
       'Z' after 4 ns / (drive/8+1) when to_X01(t) = '1' else 'X' after 4 ns / (drive/8+1);
end;

----- CELL DCM  -----
----- dcm_clock_divide_by_2        -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dcm_clock_divide_by_2 is
  port(
    clock_out : out std_ulogic := '0';

    clock : in std_ulogic;
    clock_type : in integer;
    rst : in std_ulogic
    );
end dcm_clock_divide_by_2;

architecture dcm_clock_divide_by_2_V of dcm_clock_divide_by_2 is
  signal clock_div2 : std_ulogic := '0';
  signal rst_reg : std_logic_vector(2 downto 0);
begin

  CLKIN_DIVIDER : process
  begin
    if (rising_edge(clock)) then
      clock_div2 <= not clock_div2;
    end if;
    wait on clock;
  end process CLKIN_DIVIDER;

  gen_reset : process
    begin
    if (rising_edge(clock)) then      
      rst_reg(0) <= rst;
      rst_reg(1) <= rst_reg(0) and rst;
      rst_reg(2) <= rst_reg(1) and rst_reg(0) and rst;
    end if;      
    wait on clock;    
  end process gen_reset;

  assign_clkout : process
  begin
    if ((clock_type = 0) and (rst = '0')) then
      clock_out <= clock;
    elsif ((clock_type = 1) and (rst = '0')) then
      clock_out <= clock_div2;
    elsif (rst = '1') then
      clock_out <= '0';
      wait until falling_edge(rst_reg(2));
    end if;
    wait on clock_div2, clock, rst;
  end process assign_clkout;
end dcm_clock_divide_by_2_V;

----- dcm_maximum_period_check  -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

entity dcm_maximum_period_check is
  generic (
    InstancePath : string := "*";

    clock_name : string := "";
    maximum_period : time);
  port(
    clock : in std_ulogic
    );
end dcm_maximum_period_check;

architecture dcm_maximum_period_check_V of dcm_maximum_period_check is
begin

  MAX_PERIOD_CHECKER : process
    variable clock_edge_previous : time := 0 ps;
    variable clock_edge_current : time := 0 ps;
    variable clock_period : time := 0 ps;
    variable Message : line;
  begin

    clock_edge_previous := clock_edge_current;
    clock_edge_current := NOW;

    if (clock_edge_previous > 0 ps) then
      clock_period := clock_edge_current - clock_edge_previous;
    end if;

    if (clock_period > maximum_period) then
      Write ( Message, string'(" Timing Violation Warning : Input Clock Period of"));
      Write ( Message, clock_period );
      Write ( Message, string'(" on the ") );
      Write ( Message, clock_name );      
      Write ( Message, string'(" port ") );      
      Write ( Message, string'(" of DCM instance ") );
      Write ( Message, InstancePath );
      Write ( Message, string'(" exceeds allotted value of ") );
      Write ( Message, maximum_period);
      Write ( Message, string'(" at simulation time ") );
      Write ( Message, clock_edge_current);
      Write ( Message, '.' & LF );
      assert false report Message.all severity warning;
      DEALLOCATE (Message);
    end if;
    wait on clock;
  end process MAX_PERIOD_CHECKER;
end dcm_maximum_period_check_V;

----- dcm_clock_lost  -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dcm_clock_lost is
  port(
    lost : out std_ulogic := '1';

    clock : in std_ulogic
    );
end dcm_clock_lost;

architecture dcm_clock_lost_V of dcm_clock_lost is
  signal period : time := 0 ps;
  signal lost_r : std_ulogic := '0';
  signal lost_f : std_ulogic := '0';
  signal clock_negedge, clock_posedge : std_ulogic;
  signal temp1 : boolean := false;
  signal temp2 : boolean := false;
  signal clock_low, clock_high : std_ulogic := '0';
begin
  determine_period : process
    variable clock_edge_previous : time := 0 ps;
    variable clock_edge_current : time := 0 ps;    
  begin
    if (rising_edge(clock)) then
      clock_edge_previous := clock_edge_current;
      clock_edge_current := NOW;
      if (period /= 0 ps and ((clock_edge_current - clock_edge_previous) <= (1.5 * period))) then
        period <= NOW - clock_edge_previous;
      elsif (period /= 0 ps and ((NOW - clock_edge_previous) > (1.5 * period))) then
        period <= 0 ps;
      elsif ((period = 0 ps) and (clock_edge_previous /= 0 ps)) then
        period <= NOW - clock_edge_previous;
      end if;
    end if;
    wait on clock;
  end process determine_period;
  
  CLOCK_LOST_CHECKER : process
    variable clock_low, clock_high : std_ulogic := '0';

  begin
    if (rising_edge(clock)) then
      clock_low := '0';
      clock_high := '1';
      clock_posedge <= '0';              
      clock_negedge <= '1';            
    end if;

    if (falling_edge(clock)) then
      clock_high := '0';
      clock_low := '1';
      clock_posedge <= '1';
      clock_negedge <= '0';      
    end if;
    wait on clock;
  end process CLOCK_LOST_CHECKER;    

  SET_RESET_LOST_R : process
    begin
    if (rising_edge(clock)) then
      wait for 0 ps;
      wait for 0 ps;
      wait for 0 ps;            
      if (period /= 0 ps) then
        lost_r <= '0';        
      end if;    
      wait for (period * 9.1)/10;
      if ((clock_low /= '1') and (clock_posedge /= '1')) then
        lost_r <= '1';
      end if;
    end if;
    wait on clock;    
  end process SET_RESET_LOST_R;

  SET_RESET_LOST_F : process
    begin
    if (falling_edge(clock)) then    
      if (period /= 0 ps) then      
        lost_f <= '0';
      end if;
      wait for (period * 9.1)/10;
      if ((clock_high /= '1') and (clock_negedge /= '1')) then
        lost_f <= '1';
      end if;      
    end if;
    wait on clock;    
  end process SET_RESET_LOST_F;      

  assign_lost : process
    begin
      if (lost_r'event) then
        lost <= lost_r;
      end if;
      if (lost_f'event) then
        lost <= lost_f;
      end if;
      wait on lost_r, lost_f;
    end process assign_lost;
end dcm_clock_lost_V;


----- DCM  -----
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;

library STD;
use STD.TEXTIO.all;

library unisim;
--use unisim.VPKG.all;

entity DCM is
  generic (
    TimingChecksOn : boolean := true;
    InstancePath : string := "*";
    Xon : boolean := true;
    MsgOn : boolean := false;

    thold_PSEN_PSCLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_PSEN_PSCLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_PSINCDEC_PSCLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_PSINCDEC_PSCLK_posedge_posedge : VitalDelayType := 0.000 ns;

    tipd_CLKFB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_CLKIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_DSSEN : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_PSCLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_PSEN : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_PSINCDEC : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_RST : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpd_CLKIN_LOCKED : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_PSCLK_PSDONE : VitalDelayType01 := (0.000 ns, 0.000 ns);    

    tperiod_CLKIN_POSEDGE : VitalDelayType := 0.000 ns;
    tperiod_PSCLK_POSEDGE : VitalDelayType := 0.000 ns;

    tpw_CLKIN_negedge : VitalDelayType := 0.000 ns;
    tpw_CLKIN_posedge : VitalDelayType := 0.000 ns;
    tpw_PSCLK_negedge : VitalDelayType := 0.000 ns;
    tpw_PSCLK_posedge : VitalDelayType := 0.000 ns;
    tpw_RST_posedge : VitalDelayType := 0.000 ns;

    tsetup_PSEN_PSCLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_PSEN_PSCLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_PSINCDEC_PSCLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_PSINCDEC_PSCLK_posedge_posedge : VitalDelayType := 0.000 ns;

    CLKDV_DIVIDE : real := 2.0;
    CLKFX_DIVIDE : integer := 1;
    CLKFX_MULTIPLY : integer := 4;
    CLKIN_DIVIDE_BY_2 : boolean := false;
    CLKIN_PERIOD : real := 0.0;                         --non-simulatable
    CLKOUT_PHASE_SHIFT : string := "NONE";
    CLK_FEEDBACK : string := "1X";
    DESKEW_ADJUST : string := "SYSTEM_SYNCHRONOUS";     --non-simulatable
    DFS_FREQUENCY_MODE : string := "LOW";
    DLL_FREQUENCY_MODE : string := "LOW";
    DSS_MODE : string := "NONE";                        --non-simulatable
    DUTY_CYCLE_CORRECTION : boolean := true;
    FACTORY_JF : bit_vector := X"C080";                 --non-simulatable
    MAXPERCLKIN : time := 1000000 ps;                   --non-modifiable simulation parameter
    MAXPERPSCLK : time := 100000000 ps;                 --non-modifiable simulation parameter
    PHASE_SHIFT : integer := 0;
    SIM_CLKIN_CYCLE_JITTER : time := 300 ps;            --non-modifiable simulation parameter
    SIM_CLKIN_PERIOD_JITTER : time := 1000 ps;          --non-modifiable simulation parameter
    STARTUP_WAIT : boolean := false                     --non-simulatable
    );

  port (
    CLK0 : out std_ulogic := '0';
    CLK180 : out std_ulogic := '0';
    CLK270 : out std_ulogic := '0';
    CLK2X : out std_ulogic := '0';
    CLK2X180 : out std_ulogic := '0';
    CLK90 : out std_ulogic := '0';
    CLKDV : out std_ulogic := '0';
    CLKFX : out std_ulogic := '0';
    CLKFX180 : out std_ulogic := '0';
    LOCKED : out std_ulogic := '0';
    PSDONE : out std_ulogic := '0';
    STATUS : out std_logic_vector(7 downto 0) := "00000000";
    
    CLKFB : in std_ulogic := '0';
    CLKIN : in std_ulogic := '0';
    DSSEN : in std_ulogic := '0';
    PSCLK : in std_ulogic := '0';
    PSEN : in std_ulogic := '0';
    PSINCDEC : in std_ulogic := '0';
    RST : in std_ulogic := '0'
    );

  attribute VITAL_LEVEL0 of DCM : entity is true;

end DCM;

architecture DCM_V of DCM is
  
  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN STRING := "";
    Constant Unit : IN STRING := "";
    Constant ExpectedValueMsg : IN STRING := "";
    Constant ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;

  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN INTEGER;
    CONSTANT Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN INTEGER;
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;

  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN BOOLEAN;
    Constant Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;

  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN INTEGER;
    CONSTANT Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;
  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN REAL;
    CONSTANT Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;


  procedure detect_resolution (
    constant model_name : in string
    ) IS
    
    variable test_value : time;
    variable Message : LINE;
  BEGIN
    test_value := 1 ps;
    if (test_value = 0 ps) then
      Write (Message, STRING'(" Simulator Resolution Error : "));
      Write (Message, STRING'(" Simulator resolution is set to a value greater than 1 ps. "));
      Write (Message, STRING'(" In order to simulate the "));
      Write (Message, model_name);
      Write (Message, STRING'(", the simulator resolution must be set to 1ps or smaller "));
      ASSERT FALSE REPORT Message.ALL SEVERITY ERROR;
      DEALLOCATE (Message);      
    end if;
  END detect_resolution;      


  component dcm_clock_divide_by_2
    port(
      clock_out : out std_ulogic;

      clock : in std_ulogic;
      clock_type : in integer;
      rst : in std_ulogic
      );
  end component;

  component dcm_maximum_period_check
    generic (
      InstancePath : string := "*";

      clock_name : string := "";
      maximum_period : time);
    port(
      clock : in std_ulogic
      );
  end component;

  component dcm_clock_lost
    port(
      lost : out std_ulogic;

      clock : in std_ulogic
      );    
  end component;


  signal CLKFB_ipd, CLKIN_ipd, DSSEN_ipd : std_ulogic;
  signal PSCLK_ipd, PSEN_ipd, PSINCDEC_ipd, RST_ipd : std_ulogic;
  signal clk0_out : std_ulogic;
  signal clk2x_out, clkdv_out : std_ulogic := '0';
  signal clkfx_out, locked_out, psdone_out, ps_overflow_out, ps_lock : std_ulogic := '0';

  signal clkfb_type : integer;
  signal divide_type : integer;
  signal clkin_type : integer;
  signal ps_type : integer;
  signal deskew_adjust_mode : integer;
  signal dfs_mode_type : integer;
  signal dll_mode_type : integer;
  signal clk1x_type : integer;

  signal lock_period, lock_delay, lock_clkin, lock_clkfb : std_ulogic := '0';
  signal lock_out : std_logic_vector(1 downto 0) := "00";  

  signal lock_fb : std_ulogic := '0';
  signal fb_delay_found : std_ulogic := '0';

  signal clkin_div : std_ulogic;
  signal clkin_ps, clkin_ps0, clkin_ps1, clkin_ps2 : std_ulogic;
  signal clkin_fb, clkin_fb0, clkin_fb1, clkin_fb2 : std_ulogic;


  signal ps_delay : time := 0 ps;
  signal clkin_period_real : VitalDelayArrayType(2 downto 0) := (0.000 ns, 0.000 ns, 0.000 ns);
  signal period : time := 0 ps;
  signal period_div : time := 0 ps;
  signal period_orig : time := 0 ps;
  signal period_ps : time := 0 ps;
  signal clkout_delay : time := 0 ps;
  signal fb_delay : time := 0 ps;
  signal period_fx, remain_fx : time := 0 ps;
  signal period_dv_high, period_dv_low : time := 0 ps;
  signal cycle_jitter, period_jitter : time := 0 ps;

  signal clkin_window, clkfb_window : std_ulogic := '0';
  signal clkin_5050 : std_ulogic := '0';
  signal rst_reg : std_logic_vector(2 downto 0) := "000";
  signal numerator, denominator, gcd : integer := 1;

  signal clkin_lost_out : std_ulogic;
  signal clkfx_lost_out : std_ulogic;

  signal remain_fx_temp : integer := 0;

  signal clkin_period_real0_temp : time := 0 ps;
  signal ps_lock_temp : std_ulogic := '0';

  signal clk0_temp : std_ulogic := '0';
  signal clk2x_temp : std_ulogic := '0';

  signal no_stop : boolean := false;

  signal clkfx180_en : std_ulogic := '0';

  signal status_out  : std_logic_vector(7 downto 0) := "00000000";  

begin
  INITPROC : process
  begin
    detect_resolution
      (model_name => "DCM"
       );
    
    if (CLKDV_DIVIDE = 1.5) then
      divide_type <= 3;
    elsif (CLKDV_DIVIDE = 2.0) then
      divide_type <= 4;
    elsif (CLKDV_DIVIDE = 2.5) then
      divide_type <= 5;
    elsif (CLKDV_DIVIDE = 3.0) then
      divide_type <= 6;
    elsif (CLKDV_DIVIDE = 3.5) then
      divide_type <= 7;
    elsif (CLKDV_DIVIDE = 4.0) then
      divide_type <= 8;
    elsif (CLKDV_DIVIDE = 4.5) then
      divide_type <= 9;
    elsif (CLKDV_DIVIDE = 5.0) then
      divide_type <= 10;
    elsif (CLKDV_DIVIDE = 5.5) then
      divide_type <= 11;
    elsif (CLKDV_DIVIDE = 6.0) then
      divide_type <= 12;
    elsif (CLKDV_DIVIDE = 6.5) then
      divide_type <= 13;
    elsif (CLKDV_DIVIDE = 7.0) then
      divide_type <= 14;
    elsif (CLKDV_DIVIDE = 7.5) then
      divide_type <= 15;
    elsif (CLKDV_DIVIDE = 8.0) then
      divide_type <= 16;
    elsif (CLKDV_DIVIDE = 9.0) then
      divide_type <= 18;
    elsif (CLKDV_DIVIDE = 10.0) then
      divide_type <= 20;
    elsif (CLKDV_DIVIDE = 11.0) then
      divide_type <= 22;
    elsif (CLKDV_DIVIDE = 12.0) then
      divide_type <= 24;
    elsif (CLKDV_DIVIDE = 13.0) then
      divide_type <= 26;
    elsif (CLKDV_DIVIDE = 14.0) then
      divide_type <= 28;
    elsif (CLKDV_DIVIDE = 15.0) then
      divide_type <= 30;
    elsif (CLKDV_DIVIDE = 16.0) then
      divide_type <= 32;
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "CLKDV_DIVIDE",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => CLKDV_DIVIDE,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, or 16.0",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    if ((CLKFX_DIVIDE <= 0) or (32 < CLKFX_DIVIDE)) then
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "CLKFX_DIVIDE",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => CLKFX_DIVIDE,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are 1....32",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;
    if ((CLKFX_MULTIPLY <= 1) or (32 < CLKFX_MULTIPLY)) then
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "CLKFX_MULTIPLY",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => CLKFX_MULTIPLY,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are 2....32",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;
    case CLKIN_DIVIDE_BY_2 is
      when false => clkin_type <= 0;
      when true => clkin_type <= 1;
      when others =>
        GenericValueCheckMessage
          (HeaderMsg => "Attribute Syntax Error",
           GenericName => "CLKIN_DIVIDE_BY_2",
           EntityName => "DCM",
           InstanceName => InstancePath,
           GenericValue => CLKIN_DIVIDE_BY_2,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are TRUE or FALSE",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
    end case;


    if ((CLKOUT_PHASE_SHIFT = "none") or (CLKOUT_PHASE_SHIFT = "NONE")) then
      ps_type <= 0;      
    elsif ((CLKOUT_PHASE_SHIFT = "fixed") or (CLKOUT_PHASE_SHIFT = "FIXED")) then
      ps_type <= 1;
    elsif ((CLKOUT_PHASE_SHIFT = "variable") or (CLKOUT_PHASE_SHIFT = "VARIABLE")) then
      ps_type <= 2;
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "CLKOUT_PHASE_SHIFT",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => CLKOUT_PHASE_SHIFT,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are NONE, FIXED or VARIABLE",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    if ((CLK_FEEDBACK = "none") or (CLK_FEEDBACK = "NONE")) then
      clkfb_type <= 0;
    elsif ((CLK_FEEDBACK = "1x") or (CLK_FEEDBACK = "1X")) then
      clkfb_type <= 1;
    elsif ((CLK_FEEDBACK = "2x") or (CLK_FEEDBACK = "2X")) then
      clkfb_type <= 2;
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "CLK_FEEDBACK",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => CLK_FEEDBACK,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are NONE, 1X or 2X",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;



    if ((DESKEW_ADJUST = "source_synchronous") or (DESKEW_ADJUST = "SOURCE_SYNCHRONOUS")) then
      DESKEW_ADJUST_mode <= 8;
    elsif ((DESKEW_ADJUST = "system_synchronous") or (DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS")) then
      DESKEW_ADJUST_mode <= 11;
    elsif ((DESKEW_ADJUST = "0")) then
      DESKEW_ADJUST_mode <= 0;
    elsif ((DESKEW_ADJUST = "1")) then
      DESKEW_ADJUST_mode <= 1;
    elsif ((DESKEW_ADJUST = "2")) then
      DESKEW_ADJUST_mode <= 2;
    elsif ((DESKEW_ADJUST = "3")) then
      DESKEW_ADJUST_mode <= 3;
    elsif ((DESKEW_ADJUST = "4")) then
      DESKEW_ADJUST_mode <= 4;
    elsif ((DESKEW_ADJUST = "5")) then
      DESKEW_ADJUST_mode <= 5;
    elsif ((DESKEW_ADJUST = "6")) then
      DESKEW_ADJUST_mode <= 6;
    elsif ((DESKEW_ADJUST = "7")) then
      DESKEW_ADJUST_mode <= 7;
    elsif ((DESKEW_ADJUST = "8")) then
      DESKEW_ADJUST_mode <= 8;
    elsif ((DESKEW_ADJUST = "9")) then
      DESKEW_ADJUST_mode <= 9;
    elsif ((DESKEW_ADJUST = "10")) then
      DESKEW_ADJUST_mode <= 10;
    elsif ((DESKEW_ADJUST = "11")) then
      DESKEW_ADJUST_mode <= 11;
    elsif ((DESKEW_ADJUST = "12")) then
      DESKEW_ADJUST_mode <= 12;
    elsif ((DESKEW_ADJUST = "13")) then
      DESKEW_ADJUST_mode <= 13;
    elsif ((DESKEW_ADJUST = "14")) then
      DESKEW_ADJUST_mode <= 14;
    elsif ((DESKEW_ADJUST = "15")) then
      DESKEW_ADJUST_mode <= 15;
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "DESKEW_ADJUST_MODE",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => DESKEW_ADJUST_MODE,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or 1....15",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    if ((DFS_FREQUENCY_MODE = "high") or (DFS_FREQUENCY_MODE = "HIGH")) then
      dfs_mode_type <= 1;
    elsif ((DFS_FREQUENCY_MODE = "low") or (DFS_FREQUENCY_MODE = "LOW")) then
      dfs_mode_type <= 0;
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "DFS_FREQUENCY_MODE",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => DFS_FREQUENCY_MODE,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are HIGH or LOW",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    if ((DLL_FREQUENCY_MODE = "high") or (DLL_FREQUENCY_MODE = "HIGH")) then
      dll_mode_type <= 1;
    elsif ((DLL_FREQUENCY_MODE = "low") or (DLL_FREQUENCY_MODE = "LOW")) then
      dll_mode_type <= 0;
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "DLL_FREQUENCY_MODE",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => DLL_FREQUENCY_MODE,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are HIGH or LOW",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    if ((DSS_MODE = "none") or (DSS_MODE = "NONE")) then
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "DSS_MODE",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => DSS_MODE,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are NONE",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    case DUTY_CYCLE_CORRECTION is
      when false => clk1x_type <= 0;
      when true => clk1x_type <= 1;
      when others =>
        GenericValueCheckMessage
          (HeaderMsg => "Attribute Syntax Error",
           GenericName => "DUTY_CYCLE_CORRECTION",
           EntityName => "DCM",
           InstanceName => InstancePath,
           GenericValue => DUTY_CYCLE_CORRECTION,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are TRUE or FALSE",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
    end case;

    if ((PHASE_SHIFT < -255) or (PHASE_SHIFT > 255)) then
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "PHASE_SHIFT",
         EntityName => "DCM",
         InstanceName => InstancePath,
         GenericValue => PHASE_SHIFT,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are -255 ... 255",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    period_jitter <= SIM_CLKIN_PERIOD_JITTER;
    cycle_jitter <= SIM_CLKIN_CYCLE_JITTER;
    
    case STARTUP_WAIT is
      when false => null;
      when true => null;
      when others =>
        GenericValueCheckMessage
          (HeaderMsg => "Attribute Syntax Error",
           GenericName => "STARTUP_WAIT",
           EntityName => "DCM",
           InstanceName => InstancePath,
           GenericValue => STARTUP_WAIT,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are TRUE or FALSE",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
    end case;

--
-- fx parameters
--    
    gcd <= 1;
    for i in 2 to CLKFX_MULTIPLY loop
      if (((CLKFX_MULTIPLY mod i) = 0) and ((CLKFX_DIVIDE mod i) = 0)) then
        gcd <= i;
      end if;
    end loop;    
    numerator <= CLKFX_MULTIPLY / gcd;
    denominator <= CLKFX_DIVIDE / gcd;          
    wait;
  end process INITPROC;

--
-- input wire delays
--  

  WireDelay : block
  begin
    VitalWireDelay (CLKIN_ipd, CLKIN, tipd_CLKIN);
    VitalWireDelay (CLKFB_ipd, CLKFB, tipd_CLKFB);
    VitalWireDelay (DSSEN_ipd, DSSEN, tipd_DSSEN);
    VitalWireDelay (PSCLK_ipd, PSCLK, tipd_PSCLK);
    VitalWireDelay (PSEN_ipd, PSEN, tipd_PSEN);
    VitalWireDelay (PSINCDEC_ipd, PSINCDEC, tipd_PSINCDEC);
    VitalWireDelay (RST_ipd, RST, tipd_RST);
  end block;

  i_clock_divide_by_2 : dcm_clock_divide_by_2
    port map (
      clock => clkin_ipd,
      clock_type => clkin_type,
      rst => rst_ipd,
      clock_out => clkin_div);

  i_max_clkin : dcm_maximum_period_check
    generic map (
      clock_name => "CLKIN",
      maximum_period => MAXPERCLKIN)

    port map (
      clock => clkin_ipd);

  i_max_psclk : dcm_maximum_period_check
    generic map (
      clock_name => "PSCLK",
      maximum_period => MAXPERPSCLK)

    port map (
      clock => psclk_ipd);

  i_clkin_lost : dcm_clock_lost
    port map (
      lost  => clkin_lost_out,
      clock => clkin_ipd);

  i_clkfx_lost : dcm_clock_lost
    port map (
      lost  => clkfx_lost_out,
      clock => clkfx_out);  
  
  clkin_ps0 <= transport clkin_div after ps_delay/4;
  clkin_ps1 <= transport clkin_ps0 after ps_delay/4;
  clkin_ps2 <= transport clkin_ps1 after ps_delay/4;
  clkin_ps <= transport clkin_ps2 after ps_delay/4;

  clkin_fb0 <= transport (clkin_ps and lock_fb) after period_ps/4;
  clkin_fb1 <= transport clkin_fb0 after period_ps/4;
  clkin_fb2 <= transport clkin_fb1 after period_ps/4;
  clkin_fb <= transport clkin_fb2 after period_ps/4;
  
  determine_period_div : process
    variable clkin_div_edge_previous : time := 0 ps; 
    variable clkin_div_edge_current : time := 0 ps;
  begin
    if (rst_ipd'event) then
      clkin_div_edge_previous := 0 ps; 
      clkin_div_edge_current := 0 ps;
      period_div <= 0 ps;
    else
      if (rising_edge(clkin_div)) then
        clkin_div_edge_previous := clkin_div_edge_current;
        clkin_div_edge_current := NOW;
        if ((clkin_div_edge_current - clkin_div_edge_previous) <= (1.5 * period_div)) then
          period_div <= clkin_div_edge_current - clkin_div_edge_previous;
        elsif ((period_div = 0 ps) and (clkin_div_edge_previous /= 0 ps)) then
          period_div <= clkin_div_edge_current - clkin_div_edge_previous;      
        end if;          
      end if;    
    end if;
    wait on clkin_div, rst_ipd;
  end process determine_period_div;

  determine_period_ps : process
    variable clkin_ps_edge_previous : time := 0 ps; 
    variable clkin_ps_edge_current : time := 0 ps;    
  begin
    if (rst_ipd'event) then
      clkin_ps_edge_previous := 0 ps; 
      clkin_ps_edge_current := 0 ps;
      period_ps <= 0 ps;
    else    
      if (rising_edge(clkin_ps)) then
        clkin_ps_edge_previous := clkin_ps_edge_current;
        clkin_ps_edge_current := NOW;
        wait for 0 ps;
        if ((clkin_ps_edge_current - clkin_ps_edge_previous) <= (1.5 * period_ps)) then
          period_ps <= clkin_ps_edge_current - clkin_ps_edge_previous;
        elsif ((period_ps = 0 ps) and (clkin_ps_edge_previous /= 0 ps)) then
          period_ps <= clkin_ps_edge_current - clkin_ps_edge_previous;      
        end if;
      end if;
    end if;
    wait on clkin_ps, rst_ipd;    
  end process determine_period_ps;

  assign_lock_ps_fb : process
  variable lock_ps : std_ulogic := '0';
  begin
    if (rst_ipd'event) then
      lock_fb <= '0';
      lock_ps := '0';                                
    else
      if (rising_edge(clkin_ps)) then
        lock_ps := lock_period;
        lock_fb <= lock_ps;            
      end if;          
    end if;
    wait on clkin_ps, rst_ipd;
  end process assign_lock_ps_fb;

  calculate_clkout_delay : process
  begin
    if (rst_ipd'event) then
      clkout_delay <= 0 ps;        
    elsif (period'event or fb_delay'event) then
      clkout_delay <= period - fb_delay;        
    end if;
    wait on period, fb_delay, rst_ipd;
  end process calculate_clkout_delay;

--
--generate master reset signal
--  

  gen_master_rst : process
  begin
    if (rising_edge(clkin_ipd)) then    
      rst_reg(2) <= rst_reg(1) and rst_reg(0) and rst_ipd;    
      rst_reg(1) <= rst_reg(0) and rst_ipd;
      rst_reg(0) <= rst_ipd;
    end if;
    wait on clkin_ipd;     
  end process gen_master_rst;

  check_rst_width : process
    variable Message : line;    
    begin
      if (falling_edge(rst_ipd)) then
        if ((rst_reg(2) and rst_reg(1) and rst_reg(0)) = '0') then
          Write ( Message, string'(" Timing Violation Error : RST on instance "));
          Write ( Message, Instancepath );                    
          Write ( Message, string'(" must be asserted for 3 CLKIN clock cycles. "));          
          assert false report Message.all severity error;
          DEALLOCATE (Message);
        end if;        
      end if;

      wait on rst_ipd;
    end process check_rst_width;

--
--phase shift parameters
--  

  determine_phase_shift : process
    variable Message : line;
    variable  FINE_SHIFT_RANGE : time;
    variable first_time : boolean := true;
    variable ps_in : integer;        
  begin
    if (first_time = true) then
      if ((CLKOUT_PHASE_SHIFT = "none") or (CLKOUT_PHASE_SHIFT = "NONE")) then
        ps_in := 256;      
      elsif ((CLKOUT_PHASE_SHIFT = "fixed") or (CLKOUT_PHASE_SHIFT = "FIXED")) then
        ps_in := 256 + PHASE_SHIFT;
      elsif ((CLKOUT_PHASE_SHIFT = "variable") or (CLKOUT_PHASE_SHIFT = "VARIABLE")) then
        ps_in := 256 + PHASE_SHIFT;
      end if;
      first_time := false;
    end if;
    if (rst_ipd'event) then
      if ((CLKOUT_PHASE_SHIFT = "none") or (CLKOUT_PHASE_SHIFT = "NONE")) then
        ps_in := 256;      
      elsif ((CLKOUT_PHASE_SHIFT = "fixed") or (CLKOUT_PHASE_SHIFT = "FIXED")) then
        ps_in := 256 + PHASE_SHIFT;
      elsif ((CLKOUT_PHASE_SHIFT = "variable") or (CLKOUT_PHASE_SHIFT = "VARIABLE")) then
        ps_in := 256 + PHASE_SHIFT;
      else
      end if;
      ps_lock <= '0';
      ps_overflow_out <= '0';
      ps_delay <= 0 ps;
    else
      if (rising_edge (lock_period)) then
        if (ps_type = 1) then
          FINE_SHIFT_RANGE := 10000 ps;
        elsif (ps_type = 2) then
          FINE_SHIFT_RANGE := 5000 ps;
        end if;
        ps_delay <= (ps_in * period_div / 256);
        if (PHASE_SHIFT > 0) then
          if (((ps_in * period_orig) / 256) > (period_orig + FINE_SHIFT_RANGE)) then
            Write ( Message, string'(" Timing Violation Error : FINE_SHIFT_RANGE on instance "));
            Write ( Message, Instancepath );          
            Write ( Message, string'(" exceeds "));
            Write ( Message, FINE_SHIFT_RANGE / 1000.0);
            Write ( Message, string'(" PHASE_SHIFT * PERIOD/256 = "));
            Write ( Message, PHASE_SHIFT);
            Write ( Message, string'(" * "));            
            Write ( Message, period_orig / 1000.0/256);            
            Write ( Message, string'(" = "));
            Write ( Message, (PHASE_SHIFT) * period_orig / 256 / 1000.0);                      
            assert false report Message.all severity error;
            DEALLOCATE (Message);          
          end if;
        elsif (PHASE_SHIFT < 0) then
          if ((period_orig > FINE_SHIFT_RANGE) and ((ps_in * period_orig / 256) < period_orig - FINE_SHIFT_RANGE)) then
            Write ( Message, string'(" Timing Violation Error : FINE_SHIFT_RANGE on instance "));
            Write ( Message, Instancepath );          
            Write ( Message, string'(" exceeds "));
            Write ( Message, FINE_SHIFT_RANGE / 1000.0);
            Write ( Message, string'(" PHASE_SHIFT * PERIOD/256 = "));
            Write ( Message, PHASE_SHIFT);
            Write ( Message, string'(" * "));            
            Write ( Message, period_orig / 1000.0/256);            
            Write ( Message, string'(" = "));
            Write ( Message, -(PHASE_SHIFT) * period_orig / 256 / 1000.0);                      
            assert false report Message.all severity error;
            DEALLOCATE (Message);                  
          end if;
        end if;
      end if;      
      if (rising_edge(PSCLK_ipd)) then
        if (ps_type = 2) then
          if (psen_ipd = '1') then
            if (ps_lock = '1') then
              Write ( Message, string'(" Timing Violation Warning : Please wait for PSDONE signal before adjusting the Phase Shift. "));
              assert false report Message.all severity warning;
              DEALLOCATE (Message);              
            else
              if (psincdec_ipd = '1') then
                if (ps_in = 511) then
                  ps_overflow_out <= '1';
                elsif (((ps_in + 1) * period_orig / 256) > period_orig + FINE_SHIFT_RANGE) then
                  ps_overflow_out <= '1';
                else
                  ps_in := ps_in + 1;
                  ps_delay <= (ps_in * period_div / 256);
                  ps_overflow_out <= '0';
                end if;
                ps_lock <= '1';                
              elsif (psincdec_ipd = '0') then
                if (ps_in = 1) then
                  ps_overflow_out <= '1';
                elsif ((period_orig > FINE_SHIFT_RANGE) and (((ps_in - 1) * period_orig / 256) < period_orig - FINE_SHIFT_RANGE)) then
                  ps_overflow_out <= '1';
                else
                  ps_in := ps_in - 1;
                  ps_delay <= (ps_in * period_div / 256);
                  ps_overflow_out <= '0';
                end if;
                ps_lock <= '1';                                
              end if;
            end if;
          end if;
        end if;
      end if;          
    end if;
    if (ps_lock_temp'event) then
      ps_lock <= ps_lock_temp;
    end if;
    wait on lock_period, psclk_ipd, ps_lock_temp, rst_ipd;
  end process determine_phase_shift;

  determine_psdone_out : process
  begin
    if (rising_edge(ps_lock)) then
      ps_lock_temp <= '1';      
      wait until (rising_edge(clkin_ps));
      wait until (rising_edge(psclk_ipd));
      wait until (rising_edge(psclk_ipd));
      wait until (rising_edge(psclk_ipd));
      psdone_out <= '1';
      wait until (rising_edge(psclk_ipd));
      psdone_out <= '0';
      ps_lock_temp <= '0';
    end if;
    wait on ps_lock;
  end process determine_psdone_out;      
  
--
--determine clock period
--    
  determine_clock_period : process
    variable clkin_edge_previous : time := 0 ps; 
    variable clkin_edge_current : time := 0 ps;
  begin
    if (rst_ipd'event) then
      clkin_period_real(0) <= 0 ps;
      clkin_period_real(1) <= 0 ps;
      clkin_period_real(2) <= 0 ps;
      clkin_edge_previous := 0 ps;      
      clkin_edge_current := 0 ps;
    elsif (rising_edge(clkin_div)) then
      clkin_edge_previous := clkin_edge_current;
      clkin_edge_current := NOW;
      clkin_period_real(2) <= clkin_period_real(1);
      clkin_period_real(1) <= clkin_period_real(0);      
      if (clkin_edge_previous /= 0 ps) then
	clkin_period_real(0) <= clkin_edge_current - clkin_edge_previous;
      end if;
    end if;      
    if (no_stop'event) then
      clkin_period_real(0) <= clkin_period_real0_temp;
    end if;
    wait on clkin_div, no_stop, rst_ipd;
  end process determine_clock_period;
  
  evaluate_clock_period : process
    variable clock_stopped : std_ulogic := '1';
    variable Message : line;
  begin
    if (rst_ipd'event) then
      lock_period <= '0';
      clock_stopped := '1';
      clkin_period_real0_temp <= 0 ps;                  
    else
      if (falling_edge(clkin_div)) then
        if (lock_period = '0') then
          if ((clkin_period_real(0) /= 0 ps ) and (clkin_period_real(0) - cycle_jitter <= clkin_period_real(1)) and (clkin_period_real(1) <= clkin_period_real(0) + cycle_jitter) and (clkin_period_real(1) - cycle_jitter <= clkin_period_real(2)) and (clkin_period_real(2) <= clkin_period_real(1) + cycle_jitter)) then
            lock_period <= '1';
            period_orig <= (clkin_period_real(0) + clkin_period_real(1) + clkin_period_real(2)) / 3;
            period <= clkin_period_real(0);
          end if;
        elsif (lock_period = '1') then
          if (100000000 ps < clkin_period_real(0)/1000) then
            Write ( Message, string'(" Timing Violation Error : CLKIN stopped toggling on instance "));
            Write ( Message, Instancepath );          
            Write ( Message, string'(" exceeds "));
            Write ( Message, string'(" 10000 "));
            Write ( Message, string'(" Current CLKIN Period = "));
            Write ( Message, string'(" clkin_period(0) / 10000.0 "));
            Write ( Message, string'(" ns "));            
            assert false report Message.all severity warning;
            DEALLOCATE (Message);
            lock_period <= '0';
            wait until (falling_edge(rst_reg(2)));            
          elsif ((period_orig * 2 < clkin_period_real(0)) and (clock_stopped = '0')) then
              clkin_period_real0_temp <= clkin_period_real(1);            
              no_stop <= not no_stop;
              clock_stopped := '1';
          elsif ((clkin_period_real(0) < period_orig - period_jitter) or (period_orig + period_jitter < clkin_period_real(0))) then
            Write ( Message, string'(" Timing Violation Error : Input Clock Period Jitter on instance "));
            Write ( Message, Instancepath );          
            Write ( Message, string'(" exceeds "));
            Write ( Message, period_jitter / 1000.0 );
            Write ( Message, string'(" Locked CLKIN Period =  "));
            Write ( Message, period_orig / 1000.0 );
            Write ( Message, string'(" Current CLKIN Period =  "));
            Write ( Message, clkin_period_real(0) / 1000.0 );
            assert false report Message.all severity warning;
            DEALLOCATE (Message);
            lock_period <= '0';
            wait until (falling_edge(rst_reg(2)));                                  
          elsif ((clkin_period_real(0) < clkin_period_real(1) - cycle_jitter) or (clkin_period_real(1) + cycle_jitter < clkin_period_real(0))) then
            Write ( Message, string'(" Timing Violation Error : Input Clock Cycle Jitter on on instance "));
            Write ( Message, Instancepath );
            Write ( Message, string'(" exceeds "));
            Write ( Message, cycle_jitter / 1000.0 );
            Write ( Message, string'(" Previous CLKIN Period =  "));
            Write ( Message, clkin_period_real(1) / 1000.0 );
            Write ( Message, string'(" Current CLKIN Period =  "));
            Write ( Message, clkin_period_real(0) / 1000.0 );                    
            assert false report Message.all severity warning;
            DEALLOCATE (Message);
            lock_period <= '0';
            wait until (falling_edge(rst_reg(2)));
          else           
            period <= clkin_period_real(0);
            clock_stopped := '0';
          end if;
        end if;  
      end if;          
    end if;
    wait on clkin_div, rst_ipd;
  end process evaluate_clock_period;    

--
--determine clock delay
--  
  
  determine_clock_delay : process
    variable delay_edge : time := 0 ps;
    variable temp1 : integer := 0;
    variable temp2 : integer := 0;        
    variable temp : integer := 0;
    variable delay_edge_current : time := 0 ps;    
  begin
    if (rst_ipd'event) then
      fb_delay <= 0 ps;
      fb_delay_found <= '0';                        
    else
      if (rising_edge(lock_period)) then
        if  ((lock_period = '1') and (clkfb_type /= 0)) then
          if (clkfb_type = 1) then
            wait until ((rising_edge(clk0_temp)) or (rst_ipd'event));                                
            delay_edge := NOW;
          elsif (clkfb_type = 2) then
            wait until ((rising_edge(clk2x_temp)) or (rst_ipd'event));            
            delay_edge := NOW;
          end if;
          wait until ((rising_edge(clkfb_ipd)) or (rst_ipd'event));          
          temp1 := ((NOW*1) - (delay_edge*1))/ (1 ps);
          temp2 := (period_orig * 1)/ (1 ps);
          temp := temp1 mod temp2;
          fb_delay <= temp * 1 ps;
        end if;
      end if;
      fb_delay_found <= '1';          
    end if;
    wait on lock_period, rst_ipd;
  end process determine_clock_delay;
--
--  determine feedback lock
--  
  GEN_CLKFB_WINDOW : process
  begin
    if (rst_ipd'event) then
      clkfb_window <= '0';  
    else
      if (rising_edge(CLKFB_ipd)) then
        wait for 0 ps;
        clkfb_window <= '1';
        wait for cycle_jitter;        
        clkfb_window <= '0';
      end if;          
    end if;      
    wait on clkfb_ipd, rst_ipd;
  end process GEN_CLKFB_WINDOW;

  GEN_CLKIN_WINDOW : process
  begin
    if (rst_ipd'event) then
      clkin_window <= '0';
    else
      if (rising_edge(clkin_fb)) then
        wait for 0 ps;
        clkin_window <= '1';
        wait for cycle_jitter;        
        clkin_window <= '0';
      end if;          
    end if;      
    wait on clkin_fb, rst_ipd;
  end process GEN_CLKIN_WINDOW;  

  set_reset_lock_clkin : process
  begin
    if (rst_ipd'event) then
      lock_clkin <= '0';                  
    else
      if (rising_edge(clkin_fb)) then
        wait for 1 ps;
        if ((clkfb_window = '1') and (fb_delay_found = '1')) then
          lock_clkin <= '1';
        else
          lock_clkin <= '0';        
        end if;
      end if;          
    end if;
    wait on clkin_fb, rst_ipd;
  end process set_reset_lock_clkin;

  set_reset_lock_clkfb : process
  begin
    if (rst_ipd'event) then
      lock_clkfb <= '0';                  
    else
      if (rising_edge(clkfb_ipd)) then
        wait for 1 ps;
        if ((clkin_window = '1') and (fb_delay_found = '1')) then
          lock_clkfb <= '1';
        else
          lock_clkfb <= '0';        
        end if;
      end if;          
    end if;
    wait on clkfb_ipd, rst_ipd;
  end process set_reset_lock_clkfb;

  assign_lock_delay : process
  begin
    if (rst_ipd'event) then
      lock_delay <= '0';          
    else
      if (falling_edge(clkin_fb)) then
        lock_delay <= lock_clkin or lock_clkfb;
      end if;
    end if;
    wait on clkin_fb, rst_ipd;    
  end process;

--
--generate lock signal
--  
  
  generate_lock : process
  begin
    if (rst_ipd'event) then
      lock_out <= "00";
      locked_out <= '0';      
    else
      if (rising_edge(clkin_ps)) then
        if (clkfb_type = 0) then
          lock_out(0) <= lock_period;
        else
          lock_out(0) <= lock_period and lock_delay and lock_fb;
        end if;                           
          lock_out(1) <= lock_out(0);
          locked_out <= lock_out(1);          

      end if;
    end if;
    wait on clkin_ps, rst_ipd;
  end process generate_lock;  

--
--generate the clk1x_out
--  
  
  gen_clk1x : process
  begin
    if (rst_ipd'event) then
      clkin_5050 <= '0';
    else
      if (rising_edge(clkin_ps)) then
        clkin_5050 <= '1';
        wait for (period/2);
        clkin_5050 <= '0';          
      end if;          
    end if;
    wait on clkin_ps, rst_ipd;
  end process gen_clk1x;
  
  clk0_out <= clkin_5050 when (clk1x_type = 1) else clkin_ps;

--
--generate the clk2x_out
--    

  gen_clk2x : process
  begin
    
    if (rising_edge(clkin_ps)) then
      clk2x_out <= '1';
      wait for (period / 4);
      clk2x_out <= '0';
      if (lock_out(0) = '1') then
        wait for (period / 4);
        clk2x_out <= '1';
        wait for (period / 4);
        clk2x_out <= '0';
      else 
        wait for (period / 2);
      end if;
    end if;
    wait on clkin_ps;
  end process gen_clk2x;
  
-- 
--generate the clkdv_out
-- 

  determine_clkdv_period : process
  begin
    if (period'event) then
      if (dll_mode_type = 1) then
        period_dv_high <= (period / 2) * (divide_type / 2);
        period_dv_low <= (period / 2) * (divide_type / 2 + divide_type mod 2);
      else 
        period_dv_high <= (period * divide_type) / 4;
        period_dv_low <= (period * divide_type) / 4;
      end if;      
    end if;
    wait on period;
  end process determine_clkdv_period;

  
  gen_clkdv : process
  begin
    if (rising_edge(clkin_ps)) then
      if (lock_out(0) = '1') then
        clkdv_out <= '1';
        wait for (period_dv_high);
        clkdv_out <= '0';
        wait for (period_dv_low);        
        clkdv_out <= '1';
        wait for (period_dv_high);        
        clkdv_out <= '0';
        wait for (period_dv_low - period/2);
      end if;    
    end if;
    wait on clkin_ps;
  end process gen_clkdv;

--
-- generate fx output signal
--
  
  calculate_period_fx : process
  begin
    if (rising_edge(rst_ipd)) then
      period_fx <= 0 ps;
    else
      if (lock_period = '1') then
        period_fx <= (period * denominator) / (numerator * 2);
        remain_fx_temp <= ((period/1 ps) * denominator) mod (numerator * 2);        
      end if;
    end if;
    wait on lock_period, period, denominator, numerator, rst_ipd;
  end process calculate_period_fx;

    remain_fx <= remain_fx_temp * 1 ps;  
  
  generate_clkfx : process
    variable a : integer := 0;
    variable temp : integer;
  begin
    if (rst_ipd = '1') then
      clkfx_out <= '0';
    elsif (rising_edge(clkin_lost_out)) then
      wait until (falling_edge(rst_reg(2)));        
    elsif (rising_edge(clkin_ps)) then
      if (lock_out(0) = '1') then
        a := 0;
        clkfx_out <= '1';
        temp := numerator * 2 - 1 - 1;
        for p in 0 to temp loop
          wait for (period_fx);
          if (a < (remain_fx/1 ps * 1)) then
            wait for 1 ps;
          end if;
          a := a + 1;
          clkfx_out <= not clkfx_out;
        end loop;
        if (period_fx > (period / 2)) then
          wait for (period_fx - (period / 2));
        end if;
      end if;
    end if;
    wait on clkin_ps, clkin_lost_out, rst_ipd;
  end process generate_clkfx;

  set_reset_clkfx180_en : process
    begin
      if ((rising_edge(clkfx_out)) or (rising_edge(rst_ipd))) then
        if (rst_ipd = '1') then
          clkfx180_en <= '0';          
        else
          clkfx180_en <= '1';                    
        end if;
      end if;
      wait on clkfx_out, rst_ipd;
    end process;
    
--
--generate all output signal
--
  CLKFX180 <= transport ((not clkfx_out) and clkfx180_en) after clkout_delay;        
  schedule_outputs : process
    variable PSDONE_GlitchData : VitalGlitchDataType;
    variable LOCKED_GlitchData : VitalGlitchDataType;
  begin
    if (CLK0_out'event) then
      if (clkfb_type /= 0) then
        CLK0 <= transport CLK0_out after clkout_delay;
        clk0_temp <= transport CLK0_out after clkout_delay; 
      end if;                 
      if ((dll_mode_type = 0) and (clkfb_type /= 0)) then
        CLK90 <= transport clk0_out after (clkout_delay + period / 4);
      end if;
      if (clkfb_type /= 0) then        
        CLK180 <= transport clk0_out after (clkout_delay + period / 2);
      end if;
      if ((dll_mode_type = 0) and (clkfb_type /= 0)) then        
        CLK270 <= transport clk0_out after (clkout_delay + (3 * period) / 4);
      end if;          
    end if;

    if (clk2x_out'event) then
      if ((dll_mode_type = 0) and (clkfb_type /= 0)) then
        CLK2X <= transport clk2x_out after clkout_delay;
        clk2x_temp <= transport clk2x_out after clkout_delay;  
      end if;
      if ((dll_mode_type = 0) and (clkfb_type /= 0)) then
        CLK2X180 <= transport clk2x_out after (clkout_delay + period/4);  
      end if;        
    end if;

    if (clkdv_out'event) then
      if (clkfb_type /= 0) then                
        CLKDV <= transport clkdv_out after clkout_delay;
      end if;
    end if;

     if (clkfx_out'event) then
       CLKFX <= transport clkfx_out after clkout_delay;               

     end if;
    
    if (status_out(0)'event) then
      status(0) <= status_out(0);
    end if;

    if (status_out(1)'event) then
      status(1) <= status_out(1);
    end if;

    if (status_out(2)'event) then
      status(2) <= status_out(2);
    end if;
    
    VitalPathDelay01 (
      OutSignal  => PSDONE,
      GlitchData => PSDONE_GlitchData,
      OutSignalName => "PSDONE",
      OutTemp => psdone_out,
      Paths => (0 => (psdone_out'last_event, tpd_PSCLK_PSDONE, true)),
      Mode => OnEvent,
      Xon => Xon,
      MsgOn => MsgOn,
      MsgSeverity => warning
      );
    
    VitalPathDelay01 (
      OutSignal  => LOCKED,
      GlitchData => LOCKED_GlitchData,
      OutSignalName => "LOCKED",
      OutTemp => locked_out,
      Paths => (0 => (locked_out'last_event, tpd_CLKIN_LOCKED, true)),
      Mode => OnEvent,
      Xon => Xon,
      MsgOn => MsgOn,
      MsgSeverity => warning
      );
    wait on clk0_out, clk2x_out, clkdv_out, clkfx_out, locked_out, psdone_out, status_out;
  end process schedule_outputs;

  assign_status_out : process
    begin
      if (rst_ipd = '1') then
        status_out(0) <= '0';
        status_out(1) <= '0';
        status_out(2) <= '0';
      elsif (ps_overflow_out'event) then
        status_out(0) <= ps_overflow_out;
      elsif (clkin_lost_out'event) then  
        status_out(1) <= clkin_lost_out;
      elsif (clkfx_lost_out'event) then    
        status_out(2) <= clkfx_lost_out;
      end if;
      wait on clkin_lost_out, clkfx_lost_out, ps_overflow_out, rst_ipd;
    end process assign_status_out;


  VitalTimingCheck : process
    variable Tviol_PSINCDEC_PSCLK_posedge : std_ulogic := '0';
    variable Tmkr_PSINCDEC_PSCLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_PSEN_PSCLK_posedge        : std_ulogic := '0';
    variable Tmkr_PSEN_PSCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Pviol_CLKIN   : std_ulogic := '0';
    variable PInfo_CLKIN   : VitalPeriodDataType := VitalPeriodDataInit;   
    variable Pviol_PSCLK   : std_ulogic := '0';
    variable PInfo_PSCLK   : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_RST   : std_ulogic := '0';
    variable PInfo_RST   : VitalPeriodDataType := VitalPeriodDataInit;
    
  begin
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation               => Tviol_PSINCDEC_PSCLK_posedge,
        TimingData              => Tmkr_PSINCDEC_PSCLK_posedge,
        TestSignal              => PSINCDEC_ipd,
        TestSignalName          => "PSINCDEC",
        TestDelay               => 0 ns,
        RefSignal               => PSCLK_ipd,
        RefSignalName          => "PSCLK",
        RefDelay                => 0 ns,
        SetupHigh               => tsetup_PSINCDEC_PSCLK_posedge_posedge,
        SetupLow                => tsetup_PSINCDEC_PSCLK_negedge_posedge,
        HoldLow                => thold_PSINCDEC_PSCLK_posedge_posedge,
        HoldHigh                 => thold_PSINCDEC_PSCLK_negedge_posedge,
        CheckEnabled            => (TO_X01(((NOT RST_ipd)) AND (PSEN_ipd)) /= '0'),
        RefTransition           => 'R',
        HeaderMsg               => InstancePath & "/DCM",
        Xon                     => Xon,
        MsgOn                   => MsgOn,
        MsgSeverity             => warning);

      VitalSetupHoldCheck (
        Violation               => Tviol_PSEN_PSCLK_posedge,
        TimingData              => Tmkr_PSEN_PSCLK_posedge,
        TestSignal              => PSEN_ipd, 
        TestSignalName          => "PSEN",
        TestDelay               => 0 ns,
        RefSignal               => PSCLK_ipd,
        RefSignalName          => "PSCLK",
        RefDelay                => 0 ns,
        SetupHigh               => tsetup_PSEN_PSCLK_posedge_posedge,
        SetupLow                => tsetup_PSEN_PSCLK_negedge_posedge,
        HoldLow                => thold_PSEN_PSCLK_posedge_posedge,
        HoldHigh                 => thold_PSEN_PSCLK_negedge_posedge,
        CheckEnabled            => TO_X01(NOT RST_ipd)  /= '0',
        RefTransition           => 'R',
        HeaderMsg               => InstancePath & "/DCM",
        Xon                     => Xon,
        MsgOn                   => MsgOn,
        MsgSeverity             => warning);

      VitalPeriodPulseCheck (
        Violation               => Pviol_PSCLK,
        PeriodData              => PInfo_PSCLK,
        TestSignal              => PSCLK_ipd,
        TestSignalName          => "PSCLK",
        TestDelay               => 0 ns,
        Period                  => tperiod_PSCLK_POSEDGE,
        PulseWidthHigh          => tpw_PSCLK_posedge,
        PulseWidthLow           => tpw_PSCLK_negedge,
        CheckEnabled            => true,
        HeaderMsg               => InstancePath &"/DCM",
        Xon                     => Xon,
        MsgOn                   => MsgOn,
        MsgSeverity             => warning);

      VitalPeriodPulseCheck (
        Violation               => Pviol_CLKIN,
        PeriodData              => PInfo_CLKIN,
        TestSignal              => CLKIN_ipd, 
        TestSignalName          => "CLKIN",
        TestDelay               => 0 ns,
        Period                  => tperiod_CLKIN_POSEDGE,
        PulseWidthHigh          => tpw_CLKIN_posedge,
        PulseWidthLow           => tpw_CLKIN_negedge,
        CheckEnabled            => TO_X01(NOT RST_ipd)  /= '0',
        HeaderMsg               => InstancePath &"/DCM",
        Xon                     => Xon,
        MsgOn                   => MsgOn,
        MsgSeverity             => warning);         

      VitalPeriodPulseCheck (
        Violation               => Pviol_RST,
        PeriodData              => PInfo_RST,
        TestSignal              => RST_ipd, 
        TestSignalName          => "RST",
        TestDelay               => 0 ns,
        Period                  => 0 ns,
        PulseWidthHigh          => tpw_RST_posedge,
        PulseWidthLow           => 0 ns,
        CheckEnabled            => true,
        HeaderMsg               => InstancePath &"/DCM",
        Xon                     => Xon,
        MsgOn                   => MsgOn,
        MsgSeverity             => warning);
    end if;
    wait on PSINCDEC_ipd, PSCLK_ipd, PSEN_ipd, CLKIN_ipd, RST_ipd;
  end process VITALTimingCheck;
end DCM_V;

----- CELL CLKDLL                     -----
----- x_clkdll_maximum_period_check     -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

entity x_clkdll_maximum_period_check is
  generic (
    InstancePath : string := "*";

    clock_name : string := "";
    maximum_period : time);
  port(
    clock : in std_ulogic
    );
end x_clkdll_maximum_period_check;

architecture x_clkdll_maximum_period_check_V of x_clkdll_maximum_period_check is
begin

  MAX_PERIOD_CHECKER : process
    variable clock_edge_previous : time := 0 ps;
    variable clock_edge_current : time := 0 ps;
    variable clock_period : time := 0 ps;
    variable Message : line;
  begin

    clock_edge_previous := clock_edge_current;
    clock_edge_current := NOW;

    if (clock_edge_previous > 0 ps) then
      clock_period := clock_edge_current - clock_edge_previous;
    end if;

    if (clock_period > maximum_period) then
      Write ( Message, string'(" Timing Violation Error : Input Clock Period of"));
      Write ( Message, clock_period/1000.0 );
      Write ( Message, string'(" on the ") );
      Write ( Message, clock_name );
      Write ( Message, string'(" port ") );
      Write ( Message, string'(" of CLKDLL instance ") );
      Write ( Message, InstancePath );
      Write ( Message, string'(" exceeds allotted value of ") );
      Write ( Message, maximum_period/1000.0 );
      Write ( Message, string'(" at simulation time ") );
      Write ( Message, clock_edge_current/1000.0 );
      Write ( Message, '.' & LF );
      assert false report Message.all severity warning;
      DEALLOCATE (Message);
    end if;
    wait on clock;
  end process MAX_PERIOD_CHECKER;
end x_clkdll_maximum_period_check_V;

----- CLKDLL  -----
library IEEE;
use IEEE.std_logic_1164.all;

library STD;
use STD.TEXTIO.all;

library IEEE;
use Ieee.Vital_Primitives.all;
use Ieee.Vital_Timing.all;

--library simprim;
--use simprim.VPACKAGE.all;

entity CLKDLL is
  generic (
    TimingChecksOn : boolean := true;
    InstancePath : string := "*";
    Xon : boolean := true;
    MsgOn : boolean := false;

    tipd_CLKFB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_CLKIN : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_RST : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpd_CLKIN_LOCKED : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tperiod_CLKIN_POSEDGE : VitalDelayType := 0.000 ns;

    tpw_CLKIN_negedge : VitalDelayType := 0.000 ns;
    tpw_CLKIN_posedge : VitalDelayType := 0.000 ns;
    tpw_RST_posedge : VitalDelayType := 0.000 ns;

    CLKDV_DIVIDE : real := 2.0;
    DUTY_CYCLE_CORRECTION : boolean := true;
    FACTORY_JF : bit_vector := X"C080";  --non-simulatable
    MAXPERCLKIN : time := 40000 ps;  --simulation parameter
    SIM_CLKIN_CYCLE_JITTER : time := 300 ps;  --simulation parameter
    SIM_CLKIN_PERIOD_JITTER : time := 1000 ps;  --simulation parameter
    STARTUP_WAIT : boolean := false  --non-simulatable
    );

  port (
    CLK0 : out std_ulogic := '0';
    CLK180 : out std_ulogic := '0';
    CLK270 : out std_ulogic := '0';
    CLK2X : out std_ulogic := '0';
    CLK90 : out std_ulogic := '0';
    CLKDV : out std_ulogic := '0';
    LOCKED : out std_ulogic := '0';

    CLKFB : in std_ulogic := '0';
    CLKIN : in std_ulogic := '0';
    RST : in std_ulogic := '0'
    );

  attribute VITAL_LEVEL0 of CLKDLL : entity is true;

end CLKDLL;

architecture CLKDLL_V of CLKDLL is

  component x_clkdll_maximum_period_check
    generic (
      InstancePath : string := "*";

      clock_name : string := "";
      maximum_period : time);
    port(
      clock : in std_ulogic
      );
  end component;

  signal CLKFB_ipd, CLKIN_ipd, RST_ipd : std_ulogic;
  signal clk0_out : std_ulogic;
  signal clk2x_out, clkdv_out, locked_out : std_ulogic := '0';

  signal clkfb_type : integer;
  signal divide_type : integer;
  signal clk1x_type : integer;

  signal lock_period, lock_delay, lock_clkin, lock_clkfb : std_ulogic := '0';
  signal lock_out : std_logic_vector(1 downto 0) := "00";

  signal lock_fb : std_ulogic := '0';
  signal fb_delay_found : std_ulogic := '0';

  signal clkin_ps : std_ulogic;
  signal clkin_fb, clkin_fb0, clkin_fb1, clkin_fb2 : std_ulogic;

  signal clkin_period_real : VitalDelayArrayType(2 downto 0) := (0.000 ns, 0.000 ns, 0.000 ns);
  signal period : time := 0 ps;
  signal period_orig : time := 0 ps;
  signal period_ps : time := 0 ps;
  signal clkout_delay : time := 0 ps;
  signal fb_delay : time := 0 ps;
  signal period_dv_high, period_dv_low : time := 0 ps;
  signal cycle_jitter, period_jitter : time := 0 ps;

  signal clkin_window, clkfb_window : std_ulogic := '0';
  signal clkin_5050 : std_ulogic := '0';
  signal rst_reg : std_logic_vector(2 downto 0) := "000";

  signal clkin_period_real0_temp : time := 0 ps;
  signal ps_lock_temp : std_ulogic := '0';

  signal clk0_temp : std_ulogic := '0';
  signal clk2x_temp : std_ulogic := '0';

  signal no_stop : boolean := false;

  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN STRING := "";
    Constant Unit : IN STRING := "";
    Constant ExpectedValueMsg : IN STRING := "";
    Constant ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;

  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN INTEGER;
    CONSTANT Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN INTEGER;
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;

  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN BOOLEAN;
    Constant Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;

  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN INTEGER;
    CONSTANT Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;
  PROCEDURE GenericValueCheckMessage (
    CONSTANT HeaderMsg      : IN STRING := " Attribute Syntax Error ";        
    CONSTANT GenericName : IN STRING := "";
    CONSTANT EntityName : IN STRING := "";
    CONSTANT InstanceName : IN STRING := "";
    CONSTANT GenericValue : IN REAL;
    CONSTANT Unit : IN STRING := "";
    CONSTANT ExpectedValueMsg : IN STRING := "";
    CONSTANT ExpectedGenericValue : IN STRING := "";
    CONSTANT TailMsg      : IN STRING;                    

    CONSTANT MsgSeverity    : IN SEVERITY_LEVEL := WARNING
    
    ) IS
    VARIABLE Message : LINE;
  BEGIN

    Write ( Message, HeaderMsg );
    Write ( Message, STRING'(" The attribute ") );                
    Write ( Message, GenericName );
    Write ( Message, STRING'(" on ") );
    Write ( Message, EntityName );
    Write ( Message, STRING'(" instance ") );
    Write ( Message, InstanceName );
    Write ( Message, STRING'(" is set to  ") );        
    Write ( Message, GenericValue );
    Write ( Message, Unit );        
    Write ( Message, '.' & LF );
    Write ( Message, ExpectedValueMsg );
    Write ( Message, ExpectedGenericValue );        
    Write ( Message, Unit );
    Write ( Message, TailMsg );        

    ASSERT FALSE REPORT Message.ALL SEVERITY MsgSeverity;

    DEALLOCATE (Message);
  END GenericValueCheckMessage;


  procedure detect_resolution (
    constant model_name : in string
    ) IS
    
    variable test_value : time;
    variable Message : LINE;
  BEGIN
    test_value := 1 ps;
    if (test_value = 0 ps) then
      Write (Message, STRING'(" Simulator Resolution Error : "));
      Write (Message, STRING'(" Simulator resolution is set to a value greater than 1 ps. "));
      Write (Message, STRING'(" In order to simulate the "));
      Write (Message, model_name);
      Write (Message, STRING'(", the simulator resolution must be set to 1ps or smaller "));
      ASSERT FALSE REPORT Message.ALL SEVERITY ERROR;
      DEALLOCATE (Message);      
    end if;
  END detect_resolution;     

begin
  INITPROC : process
  begin
    detect_resolution
      (model_name => "CLKDLL"
       );
    if (CLKDV_DIVIDE = 1.5) then
      divide_type <= 3;
    elsif (CLKDV_DIVIDE = 2.0) then
      divide_type <= 4;
    elsif (CLKDV_DIVIDE = 2.5) then
      divide_type <= 5;
    elsif (CLKDV_DIVIDE = 3.0) then
      divide_type <= 6;
    elsif (CLKDV_DIVIDE = 4.0) then
      divide_type <= 8;
    elsif (CLKDV_DIVIDE = 5.0) then
      divide_type <= 10;
    elsif (CLKDV_DIVIDE = 8.0) then
      divide_type <= 16;
    elsif (CLKDV_DIVIDE = 16.0) then
      divide_type <= 32;
    else
      GenericValueCheckMessage
        (HeaderMsg => "Attribute Syntax Error",
         GenericName => "CLKDV_DIVIDE",
         EntityName => "CLKDLL",
         InstanceName => InstancePath,
         GenericValue => CLKDV_DIVIDE,
         Unit => "",
         ExpectedValueMsg => "Legal Values for this attribute are 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 8.0 or 16.0",
         ExpectedGenericValue => "",
         TailMsg => "",
         MsgSeverity => error
         );
    end if;

    clkfb_type <= 2;

    period_jitter <= SIM_CLKIN_PERIOD_JITTER;
    cycle_jitter <= SIM_CLKIN_CYCLE_JITTER;

    case DUTY_CYCLE_CORRECTION is
      when false => clk1x_type <= 0;
      when true => clk1x_type <= 1;
      when others =>
        GenericValueCheckMessage
          (HeaderMsg => "Attribute Syntax Error",
           GenericName => "DUTY_CYCLE_CORRECTION",
           EntityName => "CLKDLL",
           InstanceName => InstancePath,
           GenericValue => DUTY_CYCLE_CORRECTION,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are TRUE or FALSE",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
    end case;

    case STARTUP_WAIT is
      when false => null;
      when true => null;
      when others =>
        GenericValueCheckMessage
          (HeaderMsg => "Attribute Syntax Error",
           GenericName => "STARTUP_WAIT",
           EntityName => "CLKDLL",
           InstanceName => InstancePath,
           GenericValue => STARTUP_WAIT,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are TRUE or FALSE",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
    end case;
    wait;
  end process INITPROC;

--
-- input wire delays
--

  WireDelay : block
  begin
    VitalWireDelay (CLKIN_ipd, CLKIN, tipd_CLKIN);
    VitalWireDelay (CLKFB_ipd, CLKFB, tipd_CLKFB);
    VitalWireDelay (RST_ipd, RST, tipd_RST);
  end block;

  i_max_clkin : x_clkdll_maximum_period_check
    generic map (
      clock_name => "CLKIN",
      maximum_period => MAXPERCLKIN)

    port map (
      clock => clkin_ipd);

  assign_clkin_ps : process
  begin
    if (rst_ipd = '0') then
      clkin_ps <= clkin_ipd;
    elsif (rst_ipd = '1') then
      clkin_ps <= '0';      
      wait until (falling_edge(rst_reg(2)));
    end if;
    wait on clkin_ipd, rst_ipd;
  end process assign_clkin_ps;

  clkin_fb0 <= transport (clkin_ps and lock_fb) after period_ps/4;
  clkin_fb1 <= transport clkin_fb0 after period_ps/4;
  clkin_fb2 <= transport clkin_fb1 after period_ps/4;
  clkin_fb <= transport clkin_fb2 after period_ps/4;

  determine_period_ps : process
    variable clkin_ps_edge_previous : time := 0 ps;
    variable clkin_ps_edge_current : time := 0 ps;
  begin
    if (rst_ipd'event) then
      clkin_ps_edge_previous := 0 ps;
      clkin_ps_edge_current := 0 ps;
      period_ps <= 0 ps;
    else
      if (rising_edge(clkin_ps)) then
        clkin_ps_edge_previous := clkin_ps_edge_current;
        clkin_ps_edge_current := NOW;
        wait for 0 ps;
        if ((clkin_ps_edge_current - clkin_ps_edge_previous) <= (1.5 * period_ps)) then
          period_ps <= clkin_ps_edge_current - clkin_ps_edge_previous;
        elsif ((period_ps = 0 ps) and (clkin_ps_edge_previous /= 0 ps)) then
          period_ps <= clkin_ps_edge_current - clkin_ps_edge_previous;
        end if;
      end if;
    end if;
    wait on clkin_ps, rst_ipd;
  end process determine_period_ps;

  assign_lock_fb : process
  begin
    if (rising_edge(clkin_ps)) then
      lock_fb <= lock_period;
    end if;
    wait on clkin_ps;
  end process assign_lock_fb;

  calculate_clkout_delay : process
  begin
    if (rst_ipd'event) then
      clkout_delay <= 0 ps;        
    elsif (period'event or fb_delay'event) then
      clkout_delay <= period - fb_delay;
    end if;
    wait on period, fb_delay, rst_ipd;
  end process calculate_clkout_delay;

--
--generate master reset signal
--

  gen_master_rst : process
  begin
    if (rising_edge(clkin_ipd)) then
      rst_reg(2) <= rst_reg(1) and rst_reg(0) and rst_ipd;
      rst_reg(1) <= rst_reg(0) and rst_ipd;
      rst_reg(0) <= rst_ipd;
    end if;
    wait on clkin_ipd;
  end process gen_master_rst;

  check_rst_width : process
    variable Message : line;
  begin
    if (falling_edge(rst_ipd)) then
      if ((rst_reg(2) and rst_reg(1) and rst_reg(0)) = '0') then
        Write ( Message, string'(" Timing Violation Error : RST on instance "));
        Write ( Message, Instancepath );
        Write ( Message, string'(" must be asserted for 3 CLKIN clock cycles. "));
        assert false report Message.all severity error;
        DEALLOCATE (Message);
      end if;
    end if;

    wait on rst_ipd;
  end process check_rst_width;

--
--determine clock period
--
  determine_clock_period : process
    variable clkin_edge_previous : time := 0 ps;
    variable clkin_edge_current : time := 0 ps;
  begin
    if (rst_ipd'event) then
      clkin_period_real(0) <= 0 ps;
      clkin_period_real(1) <= 0 ps;
      clkin_period_real(2) <= 0 ps;
    elsif (rising_edge(clkin_ps)) then
      clkin_edge_previous := clkin_edge_current;
      clkin_edge_current := NOW;
      clkin_period_real(2) <= clkin_period_real(1);
      clkin_period_real(1) <= clkin_period_real(0);
      if (clkin_edge_previous /= 0 ps) then
        clkin_period_real(0) <= clkin_edge_current - clkin_edge_previous;
      end if;
    end if;
    if (no_stop'event) then
      clkin_period_real(0) <= clkin_period_real0_temp;
    end if;
    wait on clkin_ps, no_stop, rst_ipd;
  end process determine_clock_period;

  evaluate_clock_period : process
    variable clock_stopped : std_ulogic := '1';    
    variable Message : line;
  begin
    if (rst_ipd'event) then
      lock_period <= '0';
      clock_stopped := '1';
      clkin_period_real0_temp <= 0 ps;                              
    else
      if (falling_edge(clkin_ps)) then
        if (lock_period = '0') then
          if ((clkin_period_real(0) /= 0 ps ) and (clkin_period_real(0) - cycle_jitter <= clkin_period_real(1)) and (clkin_period_real(1) <= clkin_period_real(0) + cycle_jitter) and (clkin_period_real(1) - cycle_jitter <= clkin_period_real(2)) and (clkin_period_real(2) <= clkin_period_real(1) + cycle_jitter)) then
            lock_period <= '1';
            period_orig <= (clkin_period_real(0) + clkin_period_real(1) + clkin_period_real(2)) / 3;
            period <= clkin_period_real(0);
          end if;
        elsif (lock_period = '1') then
          if (100000000 ps < clkin_period_real(0)/1000) then
            Write ( Message, string'(" Timing Violation Error : CLKIN stopped toggling on instance "));
            Write ( Message, Instancepath );
            Write ( Message, string'(" exceeds "));
            Write ( Message, string'(" 10000 "));
            Write ( Message, string'(" Current CLKIN Period = "));
            Write ( Message, string'(" clkin_period(0) / 10000.0 "));
            Write ( Message, string'(" ns "));
            assert false report Message.all severity warning;
            DEALLOCATE (Message);
            lock_period <= '0';
            wait until (falling_edge(rst_reg(2)));
          elsif ((period_orig * 2 < clkin_period_real(0)) and (clock_stopped = '0')) then
            clkin_period_real0_temp <= clkin_period_real(1);
            no_stop <= not no_stop;
            clock_stopped := '1';            
          elsif ((clkin_period_real(0) < period_orig - period_jitter) or (period_orig + period_jitter < clkin_period_real(0))) then
            Write ( Message, string'(" Timing Violation Error : Input Clock Period Jitter on instance "));
            Write ( Message, Instancepath );
            Write ( Message, string'(" exceeds "));
            Write ( Message, period_jitter / 1000.0 );
            Write ( Message, string'(" Locked CLKIN Period = "));
            Write ( Message, period_orig / 1000.0 );
            Write ( Message, string'(" Current CLKIN Period = "));
            Write ( Message, clkin_period_real(0) / 1000.0 );
            assert false report Message.all severity warning;
            DEALLOCATE (Message);
            lock_period <= '0';
            wait until (falling_edge(rst_reg(2)));
          elsif ((clkin_period_real(0) < clkin_period_real(1) - cycle_jitter) or (clkin_period_real(1) + cycle_jitter < clkin_period_real(0))) then
            Write ( Message, string'(" Timing Violation Error : Input Clock Cycle Jitter on on instance "));
            Write ( Message, Instancepath );
            Write ( Message, string'(" exceeds "));
            Write ( Message, cycle_jitter / 1000.0 );
            Write ( Message, string'(" Previous CLKIN Period = "));
            Write ( Message, clkin_period_real(1) / 1000.0 );
            Write ( Message, string'(" Current CLKIN Period = "));
            Write ( Message, clkin_period_real(0) / 1000.0 );
            assert false report Message.all severity warning;
            DEALLOCATE (Message);
            lock_period <= '0';
            wait until (falling_edge(rst_reg(2)));
          else
            period <= clkin_period_real(0);
            clock_stopped := '0';            
          end if;
        end if;
      end if;
    end if;
    wait on clkin_ps, rst_ipd;
  end process evaluate_clock_period;

--
--determine clock delay
--

  determine_clock_delay : process
    variable delay_edge : time := 0 ps;
    variable temp1 : integer := 0;
    variable temp2 : integer := 0;
    variable temp : integer := 0;
    variable delay_edge_current : time := 0 ps;
  begin
    if (rst_ipd'event) then
      fb_delay <= 0 ps;      
      fb_delay_found <= '0';
    else
      if (rising_edge(lock_period)) then
        if ((lock_period = '1') and (clkfb_type /= 0)) then
          if (clkfb_type = 1) then
            wait until ((rising_edge(clk0_temp)) or (rst_ipd'event));                                
            delay_edge := NOW;
          elsif (clkfb_type = 2) then
            wait until ((rising_edge(clk2x_temp)) or (rst_ipd'event));            
            delay_edge := NOW;
          end if;
          wait until ((rising_edge(clkfb_ipd)) or (rst_ipd'event));          
          temp1 := ((NOW*1) - (delay_edge*1))/ (1 ps);
          temp2 := (period_orig * 1)/ (1 ps);
          temp := temp1 mod temp2;
          fb_delay <= temp * 1 ps;
        end if;
      end if;
      fb_delay_found <= '1';
    end if;
    wait on lock_period, rst_ipd;
  end process determine_clock_delay;
--
-- determine feedback lock
--
  GEN_CLKFB_WINDOW : process
  begin
    if (rst_ipd'event) then
      clkfb_window <= '0';
    else
      if (rising_edge(CLKFB_ipd)) then
        wait for 0 ps;
        clkfb_window <= '1';
        wait for cycle_jitter;
        clkfb_window <= '0';
      end if;
    end if;
    wait on clkfb_ipd, rst_ipd;
  end process GEN_CLKFB_WINDOW;

  GEN_CLKIN_WINDOW : process
  begin
    if (rst_ipd'event) then
      clkin_window <= '0';
    else
      if (rising_edge(clkin_fb)) then
        wait for 0 ps;
        clkin_window <= '1';
        wait for cycle_jitter;
        clkin_window <= '0';
      end if;
    end if;
    wait on clkin_fb, rst_ipd;
  end process GEN_CLKIN_WINDOW;

  set_reset_lock_clkin : process
  begin
    if (rst_ipd'event) then
      lock_clkin <= '0';
    else
      if (rising_edge(clkin_fb)) then
        wait for 1 ps;
        if ((clkfb_window = '1') and (fb_delay_found = '1')) then
          lock_clkin <= '1';
        else
          lock_clkin <= '0';
        end if;
      end if;
    end if;
    wait on clkin_fb, rst_ipd;
  end process set_reset_lock_clkin;

  set_reset_lock_clkfb : process
  begin
    if (rst_ipd'event) then
      lock_clkfb <= '0';
    else
      if (rising_edge(clkfb_ipd)) then
        wait for 1 ps;
        if ((clkin_window = '1') and (fb_delay_found = '1')) then
          lock_clkfb <= '1';
        else
          lock_clkfb <= '0';
        end if;
      end if;
    end if;
    wait on clkfb_ipd, rst_ipd;
  end process set_reset_lock_clkfb;

  assign_lock_delay : process
  begin
    if (rst_ipd'event) then
      lock_delay <= '0';
    else
      if (falling_edge(clkin_fb)) then
        lock_delay <= lock_clkin or lock_clkfb;
      end if;
    end if;
    wait on clkin_fb, rst_ipd;
  end process;

--
--generate lock signal
--

  generate_lock : process
  begin
    if (rst_ipd'event) then
      lock_out <= "00";
      locked_out <= '0';
    else
      if (rising_edge(clkin_ps)) then
        if (clkfb_type = 0) then
          lock_out(0) <= lock_period;
        else
          lock_out(0) <= lock_period and lock_delay and lock_fb;
        end if;
        lock_out(1) <= lock_out(0);
        locked_out <= lock_out(1);

      end if;
    end if;
    wait on clkin_ps, rst_ipd;
  end process generate_lock;

--
--generate the clk1x_out
--

  gen_clk1x : process
  begin
    if (rst_ipd'event) then
      clkin_5050 <= '0';
    else
      if (rising_edge(clkin_ps)) then
        clkin_5050 <= '1';
        wait for (period/2);
        clkin_5050 <= '0';
      end if;
    end if;
    wait on clkin_ps, rst_ipd;
  end process gen_clk1x;

  clk0_out <= clkin_5050 when (clk1x_type = 1) else clkin_ps;

--
--generate the clk2x_out
--

  gen_clk2x : process
  begin

    if (rising_edge(clkin_ps)) then
      clk2x_out <= '1';
      wait for (period / 4);
      clk2x_out <= '0';
      if (lock_out(0) = '1') then
        wait for (period / 4);
        clk2x_out <= '1';
        wait for (period / 4);
        clk2x_out <= '0';
      else
        wait for (period / 2);
      end if;
    end if;
    wait on clkin_ps;
  end process gen_clk2x;

--
--generate the clkdv_out
--

  determine_clkdv_period : process
  begin
    if (period'event) then
      period_dv_high <= (period / 2) * (divide_type / 2);
      period_dv_low <= (period / 2) * (divide_type / 2 + divide_type mod 2);
    end if;
    wait on period;
  end process determine_clkdv_period;


  gen_clkdv : process
  begin
    if (rising_edge(clkin_ps)) then
      if (lock_out(0) = '1') then
        clkdv_out <= '1';
        wait for (period_dv_high);
        clkdv_out <= '0';
        wait for (period_dv_low);
        clkdv_out <= '1';
        wait for (period_dv_high);
        clkdv_out <= '0';
        wait for (period_dv_low - period/2);
      end if;
    end if;
    wait on clkin_ps;
  end process gen_clkdv;


--
--generate all output signal
--
  schedule_outputs : process
    variable LOCKED_GlitchData : VitalGlitchDataType;
  begin
    if (CLK0_out'event) then
      CLK0 <= transport CLK0_out after clkout_delay;
      clk0_temp <= transport CLK0_out after clkout_delay;
      CLK90 <= transport clk0_out after (clkout_delay + period / 4);
      CLK180 <= transport clk0_out after (clkout_delay + period / 2);
      CLK270 <= transport clk0_out after (clkout_delay + (3 * period) / 4);
    end if;

    if (clk2x_out'event) then
      CLK2X <= transport clk2x_out after clkout_delay;
      clk2x_temp <= transport clk2x_out after clkout_delay;
    end if;

    if (clkdv_out'event) then
      CLKDV <= transport clkdv_out after clkout_delay;
    end if;

    VitalPathDelay01 (
      OutSignal => LOCKED,
      GlitchData => LOCKED_GlitchData,
      OutSignalName => "LOCKED",
      OutTemp => locked_out,
      Paths => (0 => (locked_out'last_event, tpd_CLKIN_LOCKED, true)),
      Mode => OnEvent,
      Xon => Xon,
      MsgOn => MsgOn,
      MsgSeverity => warning
      );
    wait on clk0_out, clk2x_out, clkdv_out, locked_out;
  end process schedule_outputs;

  VitalTimingCheck : process
    variable Tviol_PSINCDEC_PSCLK_posedge : std_ulogic := '0';
    variable Tmkr_PSINCDEC_PSCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_PSEN_PSCLK_posedge : std_ulogic := '0';
    variable Tmkr_PSEN_PSCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Pviol_CLKIN : std_ulogic := '0';
    variable PInfo_CLKIN : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_PSCLK : std_ulogic := '0';
    variable PInfo_PSCLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_RST : std_ulogic := '0';
    variable PInfo_RST : VitalPeriodDataType := VitalPeriodDataInit;

  begin
    if (TimingChecksOn) then
      VitalPeriodPulseCheck (
        Violation => Pviol_CLKIN,
        PeriodData => PInfo_CLKIN,
        TestSignal => CLKIN_ipd,
        TestSignalName => "CLKIN",
        TestDelay => 0 ns,
        Period => tperiod_CLKIN_POSEDGE,
        PulseWidthHigh => tpw_CLKIN_posedge,
        PulseWidthLow => tpw_CLKIN_negedge,
        CheckEnabled => TO_X01(not RST_ipd) /= '0',
        HeaderMsg => InstancePath &"/CLKDLL",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        Violation => Pviol_RST,
        PeriodData => PInfo_RST,
        TestSignal => RST_ipd,
        TestSignalName => "RST",
        TestDelay => 0 ns,
        Period => 0 ns,
        PulseWidthHigh => tpw_RST_posedge,
        PulseWidthLow => 0 ns,
        CheckEnabled => true,
        HeaderMsg => InstancePath &"/CLKDLL",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);
    end if;
    wait on CLKIN_ipd, RST_ipd;
  end process VITALTimingCheck;
end CLKDLL_V;

-- pragma translate_on

