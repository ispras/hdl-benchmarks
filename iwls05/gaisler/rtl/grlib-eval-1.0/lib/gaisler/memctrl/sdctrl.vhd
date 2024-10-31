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
-- Entity: 	sdctrl
-- File:	sdctrl.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	32-bit SDRAM memory controller.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.devices.all;
use gaisler.memctrl.all;

entity sdctrl is
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#f00#;
    ioaddr  : integer := 16#000#;
    iomask  : integer := 16#fff#;
    wprot   : integer := 0;
    invclk  : integer := 0; 
    fast    : integer := 0; 
    pwron   : integer := 0;
    sdbits  : integer := 32;
    oepol   : integer := 0
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbsi   : in  ahb_slv_in_type;
    ahbso   : out ahb_slv_out_type;
    sdi     : in  sdctrl_in_type;
    sdo     : out sdctrl_out_type
  );
end; 

architecture rtl of sdctrl is

constant WPROTEN   : boolean := wprot = 1;
constant SDINVCLK  : boolean := invclk = 1;
constant BUS64    : boolean := (sdbits = 64);

constant REVISION  : integer := 0;

constant hconfig : ahb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_SDCTRL, 0, REVISION, 0),
  4 => ahb_membar(haddr, '1', '1', hmask),
  5 => ahb_iobar(ioaddr, iomask),
  others => zero32);

type mcycletype is (midle, active, leadout);
type sdcycletype is (act1, act2, act3, rd1, rd2, rd3, rd4, rd5, rd6, rd7, rd8,
		     wr1, wr2, wr3, wr4, sidle);
type icycletype is (iidle, pre, ref, lmode, finish);

-- sdram configuration register

type sdram_cfg_type is record
  command          : std_logic_vector(1 downto 0);
  csize            : std_logic_vector(1 downto 0);
  bsize            : std_logic_vector(2 downto 0);
  casdel           : std_ulogic;  -- CAS to data delay: 2/3 clock cycles
  trfc             : std_logic_vector(2 downto 0);
  trp              : std_ulogic;  -- precharge to activate: 2/3 clock cycles
  refresh          : std_logic_vector(14 downto 0);
  renable          : std_ulogic;
end record;

-- local registers

type reg_type is record
  hready        : std_ulogic;
  hsel          : std_ulogic;
  bdrive        : std_ulogic;
  nbdrive       : std_ulogic; 
  burst         : std_ulogic;
  wprothit      : std_ulogic;
  hio           : std_ulogic;
  startsd       : std_ulogic;

  mstate	: mcycletype;
  sdstate	: sdcycletype;
  cmstate	: mcycletype;
  istate	: icycletype;
  icnt          : std_logic_vector(2 downto 0);

  haddr         : std_logic_vector(31 downto 0);
  hrdata        : std_logic_vector(sdbits-1 downto 0);
  hwdata        : std_logic_vector(31 downto 0);
  hwrite        : std_ulogic;
  htrans        : std_logic_vector(1 downto 0);
  hresp 	: std_logic_vector(1 downto 0);
  size		: std_logic_vector(1 downto 0);

  cfg           : sdram_cfg_type;
  trfc          : std_logic_vector(2 downto 0);
  refresh       : std_logic_vector(14 downto 0);
  sdcsn  	: std_logic_vector(1  downto 0);
  sdwen  	: std_ulogic;
  rasn 		: std_ulogic;
  casn 		: std_ulogic;
  dqm  		: std_logic_vector(7 downto 0);
  address  	: std_logic_vector(16 downto 2);  -- memory address
  bsel 		: std_ulogic;
end record;


signal r, ri : reg_type;
signal rbdrive, ribdrive : std_logic_vector(31 downto 0);
attribute syn_preserve : boolean;
attribute syn_preserve of rbdrive : signal is true; 

begin

  ctrl : process(rst, ahbsi, r, sdi, rbdrive)
  variable v       : reg_type;		-- local variables for registers
  variable startsd : std_ulogic;
  variable dataout : std_logic_vector(31 downto 0); -- data from memory
  variable regsd   : std_logic_vector(31 downto 0);   -- data from registers
  variable dqm     : std_logic_vector(7 downto 0);
  variable raddr   : std_logic_vector(12 downto 0);
  variable adec    : std_ulogic;
  variable rams    : std_logic_vector(1 downto 0);
  variable ba      : std_logic_vector(1 downto 0);
  variable haddr   : std_logic_vector(31 downto 0);
  variable dout    : std_logic_vector(31 downto 0);
  variable hsize   : std_logic_vector(1 downto 0);
  variable hwrite  : std_ulogic;
  variable htrans  : std_logic_vector(1 downto 0);
  variable hready  : std_ulogic;
  variable vbdrive : std_logic_vector(31 downto 0);
  variable bdrive  : std_ulogic; 
  begin

-- Variable default settings to avoid latches

    v := r; startsd := '0'; v.hresp := HRESP_OKAY; vbdrive := rbdrive; 
    v.hrdata(sdbits-1 downto sdbits-32) := sdi.data(sdbits-1 downto sdbits-32); 
    v.hrdata(31 downto 0) := sdi.data(31 downto 0); 
    v.hwdata := ahbsi.hwdata;

    if ((ahbsi.hready and ahbsi.hsel(hindex)) = '1') then
      v.size := ahbsi.hsize(1 downto 0); v.hwrite := ahbsi.hwrite;
      v.htrans := ahbsi.htrans;
      if ahbsi.htrans(1) = '1' then
        v.hio := ahbsi.hmbsel(1);
	v.hsel := '1'; v.hready := v.hio;
      end if;
      v.haddr := ahbsi.haddr;
    end if;

    if (r.hsel = '1') and (ahbsi.hready = '0') then 
      haddr := r.haddr;  hsize := r.size;
      htrans := r.htrans; hwrite := r.hwrite;
    else 
      haddr := ahbsi.haddr;  hsize := ahbsi.hsize(1 downto 0); 
      htrans := ahbsi.htrans; hwrite := ahbsi.hwrite;
    end if;
    if fast = 1 then haddr := r.haddr; end if;

    if ahbsi.hready = '1' then v.hsel := ahbsi.hsel(hindex); end if;

-- main state

    case r.size is
    when "00" =>
      case r.haddr(1 downto 0) is
      when "00" => dqm := "11110111";
      when "01" => dqm := "11111011";
      when "10" => dqm := "11111101";
      when others => dqm := "11111110";
      end case;
    when "01" =>
      if r.haddr(1) = '0' then dqm := "11110011"; else  dqm := "11111100"; end if;
    when others => dqm := "11110000";
    end case;

    if BUS64 and (r.bsel = '1') then dqm := dqm(3 downto 0) & "1111"; end if;

-- main FSM

    case r.mstate is
    when midle =>
      if ((v.hsel and htrans(1) and not v.hio) = '1') then
	if (r.sdstate = sidle) and (r.cfg.command = "00") and 
	   (r.cmstate = midle) and (v.hio = '0')
        then 
	  if fast = 0 then startsd := '1';  else v.startsd := '1'; end if;
	  v.mstate := active;
	end if;
      end if;
    when others => null;
    end case;
      
    startsd := startsd or r.startsd;

-- generate row and column address size

    case r.cfg.csize is
    when "00" => raddr := haddr(22 downto 10);
    when "01" => raddr := haddr(23 downto 11);
    when "10" => raddr := haddr(24 downto 12);
    when others => 
      if r.cfg.bsize = "111" then raddr := haddr(26 downto 14);
      else raddr := haddr(25 downto 13); end if;
    end case;

-- generate bank address

    ba := genmux(r.cfg.bsize, haddr(28 downto 21)) &
          genmux(r.cfg.bsize, haddr(27 downto 20));

-- generate chip select

    if BUS64 then
      adec := genmux(r.cfg.bsize, haddr(30 downto 23));
      v.bsel := genmux(r.cfg.bsize, r.haddr(29 downto 22));
    else
      adec := genmux(r.cfg.bsize, haddr(29 downto 22)); v.bsel := '0';
    end if;

    rams := adec & not adec;

-- sdram access FSM

    case r.sdstate is
    when sidle =>
      if (startsd = '1') and (r.cfg.command = "00") and (r.cmstate = midle) then
        v.address(16 downto 2) := ba & raddr;
	v.sdcsn := not rams(1 downto 0); v.rasn := '0'; v.sdstate := act1; 
	v.startsd := '0';
      end if;
    when act1 =>
	v.rasn := '1'; 
	if r.cfg.casdel = '1' then v.sdstate := act2; else
	  v.sdstate := act3;
          v.hready := r.hwrite and ahbsi.htrans(0) and ahbsi.htrans(1);
	end if;
        if WPROTEN then 
	  v.wprothit := sdi.wprot;
	  if sdi.wprot = '1' then v.hresp := HRESP_ERROR; end if;
	end if;
    when act2 =>
	v.sdstate := act3; 
        v.hready := r.hwrite and ahbsi.htrans(0) and ahbsi.htrans(1);
        if WPROTEN and (r.wprothit = '1') then 
	  v.hresp := HRESP_ERROR; v.hready := '0'; 
	end if;
    when act3 =>
      v.casn := '0'; 
      v.address(14 downto 2) := r.haddr(13 downto 12) & '0' & r.haddr(11 downto 2);
      v.dqm := dqm; v.burst := r.hready;

      if r.hwrite = '1' then

	v.sdstate := wr1; v.sdwen := '0'; v.bdrive := '0';
        if ahbsi.htrans = "11" or (r.hready = '0') then v.hready := '1'; end if;
        if WPROTEN and (r.wprothit = '1') then
	  v.hresp := HRESP_ERROR; v.hready := '1'; 
	  v.sdstate := wr1; v.sdwen := '1'; v.bdrive := '1'; v.casn := '1';
	end if;
      else v.sdstate := rd1; end if;
    when wr1 =>
      v.address(14 downto 2) := r.haddr(13 downto 12) & '0' & r.haddr(11 downto 2);
      if (((r.burst and r.hready) = '1') and (r.htrans = "11"))
      and not (WPROTEN and (r.wprothit = '1'))
      then 
	v.hready := ahbsi.htrans(0) and ahbsi.htrans(1) and r.hready;
      else
        v.sdstate := wr2; v.bdrive := '1'; v.casn := '1'; v.sdwen := '1';
	v.dqm := (others => '1');
      end if;
    when wr2 =>
      v.rasn := '0'; v.sdwen := '0'; v.sdstate := wr3;
    when wr3 =>
      v.sdcsn := "11"; v.rasn := '1'; v.sdwen := '1'; 
      if (r.cfg.trp = '1') then v.sdstate := wr4;
      else v.sdstate := sidle; end if;
    when wr4 =>
      v.sdstate := sidle;
    when rd1 =>
      v.casn := '1';
      if SDINVCLK then
        if r.cfg.casdel = '1' then v.sdstate := rd2;
        else
          v.sdstate := rd3;
          if ahbsi.htrans /= "11" then v.rasn := '0'; v.sdwen := '0'; end if;
        end if;
      else v.sdstate := rd7; end if;

    when rd7 =>
      if r.cfg.casdel = '1' then v.sdstate := rd2;
      else
        v.sdstate := rd3;
        if ahbsi.htrans /= "11" then v.rasn := '0'; v.sdwen := '0'; end if;
      end if;

    when rd2 =>
      v.sdstate := rd3;
      if ahbsi.htrans /= "11" then v.rasn := '0'; v.sdwen := '0'; end if;

      if v.sdwen = '0' then v.dqm := (others => '1'); end if;
    when rd3 =>
      v.sdstate := rd4; v.hready := '1';
      if r.sdwen = '0' then
	v.rasn := '1'; v.sdwen := '1'; v.sdcsn := "11"; v.dqm := (others => '1');
      end if;

    when rd4 =>
      v.hready := '1';

      if ahbsi.htrans /= "11" or (r.sdcsn = "11") then

        v.hready := '0'; v.dqm := (others => '1');
        if (r.sdcsn /= "11") then
	  v.rasn := '0'; v.sdwen := '0'; v.sdstate := rd5;
	else
          if r.cfg.trp = '1' then v.sdstate := rd6; 
	  else v.sdstate := sidle; end if;
        end if;
      end if;
    when rd5 =>
      if r.cfg.trp = '1' then 
	v.sdstate := rd6; 
      else v.sdstate := sidle; end if;
      v.sdcsn := (others => '1'); v.rasn := '1'; v.sdwen := '1'; v.dqm := (others => '1');
    when rd6 =>
      v.sdstate := sidle; v.dqm := (others => '1');

      v.sdcsn := (others => '1'); v.rasn := '1'; v.sdwen := '1';

    when others =>
	v.sdstate := sidle;
    end case;

-- sdram commands

    case r.cmstate is
    when midle =>
      if r.sdstate = sidle then
        case r.cfg.command is
        when "01" => -- precharge
	    v.sdcsn := (others => '0'); v.rasn := '0'; v.sdwen := '0';
	    v.address(12) := '1'; v.cmstate := active;
        when "10" => -- auto-refresh
	  v.sdcsn := (others => '0'); v.rasn := '0'; v.casn := '0';
          v.cmstate := active;
        when "11" =>
	    v.sdcsn := (others => '0'); v.rasn := '0'; v.casn := '0'; 
	    v.sdwen := '0'; v.cmstate := active;
	    v.address(15 downto 2) := "000010001" & r.cfg.casdel & "0111";
        when others => null;
        end case;
      end if;
    when active =>
      v.sdcsn := (others => '1'); v.rasn := '1'; v.casn := '1'; 
      v.sdwen := '1'; v.cfg.command := "00";
      v.cmstate := leadout; v.trfc := r.cfg.trfc;
    when leadout =>
      v.trfc := r.trfc - 1;
      if r.trfc = "000" then v.cmstate := midle; end if;

    end case;

-- sdram init

    case r.istate is
    when iidle =>
      if r.cfg.renable = '1' then
        v.cfg.command := "01"; v.istate := pre;
      end if;
    when pre =>
      if r.cfg.command = "00" then
        v.cfg.command := "10"; v.istate := ref; v.icnt := "111"; 
      end if;
    when ref =>
      if r.cfg.command = "00" then
        v.cfg.command := "10"; v.icnt := r.icnt - 1;
	if r.icnt = "000" then v.istate := lmode; v.cfg.command := "11"; end if; 
      end if;
    when lmode =>
      if r.cfg.command = "00" then
        v.istate := finish;
      end if;
    when others =>
      if r.cfg.renable = '0' then
        v.istate := iidle;
      end if;
    end case;

    if (ahbsi.hready and ahbsi.hsel(hindex) ) = '1' then
      if ahbsi.htrans(1) = '0' then v.hready := '1'; end if;
    end if;

    if (r.hsel and r.hio and not r.hready) = '1' then v.hready := '1'; end if;

-- second part of main fsm

    case r.mstate is
    when active =>
      if v.hready = '1' then
	v.mstate := midle;
      end if;
    when others => null;
    end case;

-- sdram refresh counter

-- pragma translate_off
    if not is_x(r.cfg.refresh) then
-- pragma translate_on
      if (r.cfg.renable = '1') and (r.istate = finish) then 
	v.refresh := r.refresh - 1;
        if (v.refresh(14) and not r.refresh(14))  = '1' then 
	  v.refresh := r.cfg.refresh;
	  v.cfg.command := "10";
	end if;
      end if;
-- pragma translate_off
    end if;
-- pragma translate_on

-- AHB register access

    if (r.hsel and r.hio and r.hwrite and r.htrans(1)) = '1' then
      v.cfg.command   :=  ahbsi.hwdata(20 downto 19); 
      v.cfg.csize     :=  ahbsi.hwdata(22 downto 21); 
      v.cfg.bsize     :=  ahbsi.hwdata(25 downto 23); 
      v.cfg.casdel    :=  ahbsi.hwdata(26); 
      v.cfg.trfc      :=  ahbsi.hwdata(29 downto 27); 
      v.cfg.trp       :=  ahbsi.hwdata(30); 
      v.cfg.renable   :=  ahbsi.hwdata(31); 
      v.cfg.refresh   :=  ahbsi.hwdata(14 downto 0); 
      v.refresh       :=  (others => '0');
    end if;

    regsd := (others => '0');
    regsd(31 downto 19) := r.cfg.renable & r.cfg.trp & r.cfg.trfc &
	 r.cfg.casdel & r.cfg.bsize & r.cfg.csize & r.cfg.command; 
    if BUS64 then regsd(15) := '1'; end if;
    regsd(14 downto 0) := r.cfg.refresh; 

    if (r.hsel and r.hio) = '1' then dout := regsd;
    else 
      if BUS64 and r.bsel = '1' then dout := r.hrdata(63 downto 32);
      else dout := r.hrdata(31 downto 0); end if;
    end if;

    v.nbdrive := not v.bdrive; 

    if oepol = 1 then bdrive := r.nbdrive; vbdrive := (others => v.nbdrive);
    else bdrive := r.bdrive; vbdrive := (others => v.bdrive);end if; 
    
-- reset

    if rst = '0' then
      v.sdstate	      := sidle; 
      v.mstate	      := midle; 
      v.istate	      := iidle; 
      v.cmstate	      := midle; 
      v.hsel	      := '0';
      v.cfg.command   := "00";
      v.cfg.csize     := "10";
      v.cfg.bsize     := "000";
      v.cfg.casdel    :=  '1';
      v.cfg.trfc      := "111";
      if pwron = 1 then v.cfg.renable :=  '1';
      else v.cfg.renable :=  '0'; end if;
      v.cfg.trp       :=  '1';
      v.dqm	      := (others => '1');
      v.sdwen	      := '1';
      v.rasn	      := '1';
      v.casn	      := '1';
      v.hready	      := '1';
      v.bsel	      := '0';
      v.startsd       := '0';
    end if;

    ri <= v; 
    ribdrive <= vbdrive; 
    
    sdo.address  <= r.address;
    sdo.bdrive   <= bdrive;
    sdo.vbdrive  <= rbdrive; 
    sdo.sdcsn    <= r.sdcsn;
    sdo.sdwen    <= r.sdwen;
    sdo.dqm      <= r.dqm;
    sdo.rasn     <= r.rasn;
    sdo.casn     <= r.casn;
    sdo.data     <= r.hwdata;

    ahbso.hready  <= r.hready;
    ahbso.hresp   <= r.hresp;
    ahbso.hrdata  <= dout;
    ahbso.hcache  <= not r.hio;


  end process;

  sdo.sdcke     <= (others => '1');
  ahbso.hconfig <= hconfig;
  ahbso.hirq    <= (others => '0');
  ahbso.hindex  <= hindex;

  regs : process(clk,rst)
  begin 
    if rising_edge(clk) then
      r <= ri; rbdrive <= ribdrive;
      if rst = '0' then
        r.icnt <= (others => '0');
      end if; 
    end if;
    if rst = '0' then
      r.sdcsn  <= (others => '1');
      r.bdrive <= '1'; r.nbdrive <= '0';
      if oepol = 0 then rbdrive <= (others => '1');
      else rbdrive <= (others => '0'); end if;
    end if;
  end process;

-- pragma translate_off
  bootmsg : report_version 
  generic map ("sdctrl" & tost(hindex) & 
	": PC133 SDRAM controller rev " & tost(REVISION));
-- pragma translate_on

end;

