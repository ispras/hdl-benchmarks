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
-- Entity:      ahbctrl
-- File:        ahbctrl.vhd
-- Author:      Jiri Gaisler
-- Description: AMBA Plug&Play AHB report module
------------------------------------------------------------------------------ 

library IEEE;
use IEEE.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use std.textio.all;
use work.devlib.all;

entity ahbreport is
  generic (
    ioaddr  : ahb_addr_type := 16#fff#;  -- I/O area MSB address
    iomask  : ahb_addr_type := 16#fff#;  -- I/O area address mask
    cfgaddr : ahb_addr_type := 16#ff0#;  -- config area MSB address
    cfgmask : ahb_addr_type := 16#ff0#;  -- config area address mask
    icheck : integer := 1;		-- check bus indexes
    timeout : integer := 0;   		-- check bus timeout
    nmasters: integer := NAHBMST;   	-- Number of masters
    nslaves : integer := NAHBSLV;   	-- Number of slaves
    ioen   : integer := 1		-- enable I/O area
  );
  port (
    msto    : in  ahb_mst_out_vector;
    slvo    : in  ahb_slv_out_vector
  );
end;

architecture rtl of ahbreport is

  constant MIMAX : integer := log2x(nmasters) - 1;
  constant SIMAX : integer := log2x(nslaves) - 1;
  constant IOAREA : std_logic_vector(11 downto 0) := 
  	conv_std_logic_vector(ioaddr, 12);
  constant IOMSK  : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(iomask, 12);
  constant CFGAREA : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(cfgaddr, 12);
  constant CFGMSK  : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(cfgmask, 12);

begin

  diag : process
  variable k : integer;
  variable mask : std_logic_vector(11 downto 0);
  variable device : std_logic_vector(11 downto 0);
  variable devicei : integer;
  variable vendor : std_logic_vector( 7 downto 0);
  variable area : std_logic_vector( 1 downto 0);
  variable vendori : integer;
  variable iosize, tmp : integer;
  variable iounit : string(1 to 5) := " byte";
  variable memtype : string(1 to 9);
  variable iostart : std_logic_vector(11 downto 0) := IOAREA and IOMSK;
  variable cfgstart : std_logic_vector(11 downto 0) := CFGAREA and CFGMSK;
  variable L1 : line := new string'("");
  variable S1 : string(1 to 255);
  begin
    wait for 2 ns;
    k := 0; mask := IOMSK;
    for i in 0 to nmasters-1 loop
      vendor := msto(i).hconfig(0)(31 downto 24); 
      vendori := conv_integer(vendor);
      if vendori /= 0 then
        device := msto(i).hconfig(0)(23 downto 12); 
        devicei := conv_integer(device);
	print("ahbctrl: mst" & tost(i) & ": " & iptable(vendori).vendordesc &
	   iptable(vendori).device_table(devicei));
	assert (msto(i).hindex = i) or (icheck = 0)
	report "AHB master index error on master " & tost(i) severity failure;
      end if;
    end loop;
    for i in 0 to nslaves-1 loop
      vendor := slvo(i).hconfig(0)(31 downto 24); 
      vendori := conv_integer(vendor);
      if vendori /= 0 then
        device := slvo(i).hconfig(0)(23 downto 12); 
        devicei := conv_integer(device);
	std.textio.write(L1, "ahbctrl: slv" & tost(i) & ": " & iptable(vendori).vendordesc &
	   iptable(vendori).device_table(devicei));
	std.textio.writeline(OUTPUT, L1);
        for j in NAHBIR to NAHBCFG-1 loop
          area := slvo(i).hconfig(j)(1 downto 0);
          case area is
	  when "01" =>
	  when "10" =>
	    mask := slvo(i).hconfig(j)(15 downto 4);
	    k := 0;
            while (k<15) and (mask(k) = '0') loop k := k+1; end loop; 
	    std.textio.write(L1, "ahbctrl:       memory at " & tost( slvo(i).hconfig(j)(31 downto 20))&
		"00000, size "& tost(2**k) & " Mbyte");
	    if slvo(i).hconfig(j)(16) = '1' then 
	      std.textio.write(L1, string'(", cacheable"));
	    end if;
	    if slvo(i).hconfig(j)(17) = '1' then 
	      std.textio.write(L1, string'(", prefetch"));
	     end if;
	    std.textio.writeline(OUTPUT, L1);
	  when "11" =>
            if ioen /= 0 then
	      mask := slvo(i).hconfig(j)(15 downto 4);
	      k := 0;
              while (k<15) and (mask(k) = '0') loop k := k+1; end loop; 
	      iosize := 256 * 2**k; iounit(1) := ' ';
	      if (iosize > 1023) then
	        iosize := iosize/1024; iounit(1) := 'k';
	      end if;
	      print("ahbctrl:       I/O port at " & tost( iostart & 
		((slvo(i).hconfig(j)(31 downto 20)) and slvo(i).hconfig(j)(15 downto 4))) &
		"00, size "& tost(iosize) & iounit);
	    end if;
	  when others =>
          end case;
        end loop;
	assert (slvo(i).hindex = i) or (icheck = 0)
	report "AHB slave index error on slave " & tost(i) severity failure;
      end if;
    end loop;
    wait;
  end process;
end;

