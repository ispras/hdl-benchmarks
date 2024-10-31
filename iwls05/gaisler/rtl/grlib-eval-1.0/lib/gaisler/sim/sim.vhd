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
-- Package:     sim
-- File:        sim.vhd
-- Author:      Jiri Gaisler - Gaisler Research
-- Description: Simulation models and functions declarations
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
library grlib;
use grlib.stdlib.all;
use grlib.stdio.all;

package sim is

  component sram
      generic (index : integer := 0;		-- Byte lane (0 - 3)
	       Abits: Positive := 10;		-- Default 10 address bits (1 Kbyte)
	       tacc : integer := 10;		-- access time (ns)
	       fname : string := "ram.dat");	-- File to read from
      port (  
        a : in std_logic_vector(abits-1 downto 0);
        D : inout std_logic_vector(7 downto 0);
        CE1 : in std_logic;
        WE : in std_logic;
        OE : in std_logic);
  end component;  

  component sram16
  generic (
    index : integer := 0;		-- Byte lane (0 - 3)
    abits: Positive := 10;		-- Default 10 address bits (1 Kbyte)
    echk : integer := 0;		-- Generate EDAC checksum
    tacc : integer := 10;		-- access time (ns)
    fname : string := "ram.dat");	-- File to read from
  port (  
    a : in std_logic_vector(abits-1 downto 0);
    d : inout std_logic_vector(15 downto 0);
    lb : in std_logic;
    ub : in std_logic;
    ce : in std_logic;
    we : in std_ulogic;
    oe : in std_ulogic);
  end component;     

  procedure hexread(L : inout line; value:out bit_vector);
  procedure hexread(L : inout line; value:out std_logic_vector);
  function ishex(c : character) return boolean;
  function buskeep(signal v : in std_logic_vector) return std_logic_vector;
  function buskeep(signal c : in std_logic) return std_logic;

  component phy is
    generic(
      win_size : natural := 3);
    port(
      resetn   : in std_logic;
      led_cfg  : in std_logic_vector(2 downto 0);
      mdio     : inout std_logic;
      tx_clk   : out std_logic;
      rx_clk   : out std_logic;
      rxd      : out std_logic_vector(3 downto 0);   
      rx_dv    : out std_logic; 
      rx_er    : out std_logic; 
      rx_col   : out std_logic;
      rx_crs   : out std_logic;
      txd      : in std_logic_vector(3 downto 0);   
      tx_en    : in std_logic; 
      tx_er    : in std_logic; 
      mdc      : in std_logic
    );
  end component;
  
  procedure leon3_subtest(subtest : integer);


end;

package body sim is

  function to_xlhz(i : std_logic) return std_logic is
  begin
    case to_X01Z(i) is
    when 'Z' => return('Z');
    when '0' => return('L');
    when '1' => return('H');
    when others => return('X');
    end case;
  end;

  type logic_xlhz_table IS ARRAY (std_logic'LOW TO std_logic'HIGH) OF std_logic;

  constant cvt_to_xlhz : logic_xlhz_table := (
                         'Z',  -- 'U'
                         'Z',  -- 'X'
                         'L',  -- '0'
                         'H',  -- '1'
                         'Z',  -- 'Z'
                         'Z',  -- 'W'
                         'L',  -- 'L'
                         'H',  -- 'H'
                         'Z'   -- '-'
                        );
  function buskeep (signal v : in std_logic_vector) return std_logic_vector is
  variable res : std_logic_vector(v'range);
  begin
    for i in v'range loop res(i) := cvt_to_xlhz(v(i)); end loop;
    return(res);
  end;

  function buskeep (signal c : in std_logic) return std_logic is
  begin
    return(cvt_to_xlhz(c));
  end;

  procedure char2hex(C: character; result: out bit_vector(3 downto 0);
            good: out boolean; report_error: in boolean) is
  begin
    good := true;
    case C is
    when '0' => result :=  x"0"; 
    when '1' => result :=  x"1"; 
    when '2' => result :=  X"2"; 
    when '3' => result :=  X"3"; 
    when '4' => result :=  X"4"; 
    when '5' => result :=  X"5"; 
    when '6' => result :=  X"6"; 
    when '7' => result :=  X"7"; 
    when '8' => result :=  X"8"; 
    when '9' => result :=  X"9"; 
    when 'A' => result :=  X"A"; 
    when 'B' => result :=  X"B"; 
    when 'C' => result :=  X"C"; 
    when 'D' => result :=  X"D"; 
    when 'E' => result :=  X"E"; 
    when 'F' => result :=  X"F"; 

    when 'a' => result :=  X"A"; 
    when 'b' => result :=  X"B"; 
    when 'c' => result :=  X"C"; 
    when 'd' => result :=  X"D"; 
    when 'e' => result :=  X"E"; 
    when 'f' => result :=  X"F"; 
    when others =>
      if report_error then
        assert false report 
	  "hexread error: read a '" & C & "', expected a hex character (0-F).";
      end if;
      good := false;
    end case;
  end;

  procedure hexread(L:inout line; value:out bit_vector)  is
                variable OK: boolean;
                variable C:  character;
                constant NE: integer := value'length/4;	--'
                variable BV: bit_vector(0 to value'length-1);	--'
                variable S:  string(1 to NE-1);
  begin
    if value'length mod 4 /= 0 then	--'
      assert false report
        "hexread Error: Trying to read vector " &
        "with an odd (non multiple of 4) length";
      return;
    end if;
 
    loop                                    -- skip white space
      read(L,C);
      exit when ((C /= ' ') and (C /= CR) and (C /= HT));
    end loop;
 
    char2hex(C, BV(0 to 3), OK, false);
    if not OK then
      return;
    end if;
 
    read(L, S, OK);
--    if not OK then
--      assert false report "hexread Error: Failed to read the STRING";
--      return;
--    end if;
 
    for I in 1 to NE-1 loop
      char2hex(S(I), BV(4*I to 4*I+3), OK, false);
      if not OK then
        return;
      end if;
    end loop;
    value := BV;
  end hexread;

  procedure hexread(L:inout line; value:out std_ulogic_vector) is
    variable tmp: bit_vector(value'length-1 downto 0);	--'
  begin
    hexread(L, tmp);
    value := TO_X01(tmp);
  end hexread;

  procedure hexread(L:inout line; value:out std_logic_vector) is
    variable tmp: std_ulogic_vector(value'length-1 downto 0);	--'
  begin
    hexread(L, tmp);
    value := std_logic_vector(tmp);
  end hexread;

  function ishex(c:character) return boolean is
  variable tmp : bit_vector(3 downto 0);
  variable OK : boolean;
  begin
    char2hex(C, tmp, OK, false);
    return OK;
  end ishex;


  procedure leon3_subtest(subtest : integer) is
  begin

    case subtest is
    when 3 => print("  register file");
    when 4 => print("  multiplier");
    when 5 => print("  radix-2 divider");
    when 6 => print("  cache system");
    when others => print("  sub-system test " & tost(subtest));
    end case;

  end;

end;
