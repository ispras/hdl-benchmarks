------------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2004 Jiri Gaisler, Gaisler Research
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.sim.all;
use gaisler.devices.all;
library grlib;
use grlib.stdlib.all;
use grlib.stdio.all;
use grlib.tech.all;
use work.devlib.all;

use std.textio.all;

entity grtestmod is
  generic (halt : integer := 0);
  port (
    resetn	: in  std_ulogic;
    clk		: in  std_ulogic;
    errorn	: in std_ulogic;
    address 	: in std_logic_vector(21 downto 2);
    data	: inout std_logic_vector(31 downto 0);
    iosn        : in std_ulogic;
    oen         : in std_ulogic;
    writen  	: in std_ulogic; 		
    brdyn  	: out  std_ulogic
 );

end;

architecture sim of grtestmod is
subtype msgtype is string(1 to 40);
constant ntests : integer := 2;
type msgarr is array (0 to ntests) of msgtype;
constant msg : msgarr := (
    "*** Starting GRLIB system test ***      ", -- 0
    "Test completed OK, halting simulation   ", -- 1
    "Test FAILED                             "  -- 2
);

signal ior, iow : std_ulogic;

begin

  ior <= iosn or oen;
  iow <= iosn or writen;

  data <= (others => 'Z');

  log : process(ior, iow)
  variable errno, errcnt, subtest, vendorid, deviceid : integer;
  begin
    brdyn <= '0';
    if rising_edge(iow) then
      case address(7 downto 2) is
      when "000000" =>
        vendorid := conv_integer(data(31 downto 24));
        deviceid := conv_integer(data(23 downto 12));
	print(iptable(vendorid).device_table(deviceid));
      when "000001" =>
        errno := conv_integer(data(15 downto 0));
	if  (halt = 0) then
	  assert false
	  report "test failed, error (" & tost(errno) & ")"
	  severity failure;
	else
	  assert false
	  report "test failed, error (" & tost(errno) & ")"
	  severity warning;
	end if;
      when "000010" =>
        subtest := conv_integer(data(7 downto 0));
	if vendorid = VENDOR_GAISLER then
	  case deviceid is
	  when GAISLER_LEON3 => leon3_subtest(subtest);
	  when others =>
            print ("subtest " & tost(subtest));
	  end case;
	else
          print ("subtest " & tost(subtest));
	end if;
      when "000100" =>
        print ("");
        print ("**** GRLIB system test starting ****");
	errcnt := 0;
      when "000101" =>
	if errcnt = 0 then
          print ("Test passed, halting with IU error mode");
	elsif errcnt = 1 then
          print ("1 error detected, halting with IU error mode");
	else
          print (tost(errcnt) & " errors detected, halting with IU error mode");
        end if;
        print ("");
      when others =>
      end case;
    end if;
  end process;
end;

