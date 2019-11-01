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
-- Entity:      apbreport
-- File:        apbreport.vhd
-- Author:      Jiri Gaisler - Gaisler Research
-- Description: AMBA AHB/APB bridge
------------------------------------------------------------------------------ 

library IEEE;
use IEEE.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use std.textio.all;
use work.devlib.all;

entity apbreport is
  generic (
    haddr : integer := 0;
    hmask : integer := 16#fff#;
    icheck  : integer := 1;
    nslaves : integer := NAPBSLV   	-- Number of slaves
  );
  port (
    apbo    : in  apb_slv_out_vector
  );
end;

architecture rtl of apbreport is

constant IOAREA : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(haddr, 12);
constant IOMSK  : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(hmask, 12);

begin
  diag : process
  variable k : integer;
  variable mask : std_logic_vector(11 downto 0);
  variable device : std_logic_vector(11 downto 0);
  variable devicei : integer;
  variable vendor : std_logic_vector( 7 downto 0);
  variable vendori : integer;
  variable iosize : integer;
  variable iounit : string(1 to 5) := "byte ";
  variable memstart : std_logic_vector(11 downto 0) := IOAREA and IOMSK;
  variable L1 : line := new string'("");
  begin
    wait for 3 ns;
    print("apbctrl: APB Bridge at " & tost(memstart) & "00000 rev 1");
    for i in 0 to nslaves-1 loop
      vendor := apbo(i).pconfig(0)(31 downto 24); 
      vendori := conv_integer(vendor);
      if vendori /= 0 then
        device := apbo(i).pconfig(0)(23 downto 12); 
        devicei := conv_integer(device);
	std.textio.write(L1, "apbctrl: slv" & tost(i) & ": " & 
	iptable(vendori).vendordesc  & iptable(vendori).device_table(devicei));
	std.textio.writeline(OUTPUT, L1);
	mask := apbo(i).pconfig(1)(15 downto 4);
	k := 0;
        while (k<15) and (mask(k) = '0') loop k := k+1; end loop; 
	iosize := 256 * 2**k; iounit := "byte ";
	if (iosize > 1023) then iosize := iosize/1024; iounit := "kbyte"; end if;
	print("apbctrl:       I/O ports at " & 
          tost(memstart & (apbo(i).pconfig(1)(31 downto 20) and apbo(i).pconfig(1)(15 downto 4))) &
		"00, size " & tost(iosize) & " " & iounit);
	assert (apbo(i).pindex = i) or (icheck = 0)
	report "APB slave index error on slave " & tost(i) severity failure;
      end if;
    end loop;
    wait;
  end process;
end;

