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
-- Entity: 	dsu
-- File:	dsu.vhd
-- Author:	Jiri Gaisler, Edvin Catovic - Gaisler Research
-- Description:	Combined LEON3 debug support and AHB trace unit
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.devices.all;
use gaisler.leon3.all;
use gaisler.libiu.all;

entity dsu3 is
  generic (
    hindex  : integer := 0;
    haddr : integer := 16#900#;
    hmask : integer := 16#f00#;
    ncpu    : integer := 1;
    tbits   : integer := 30; -- timer bits (instruction trace time tag)
    tech    : integer := 0; 
    irq     : integer := 0; 
    kbytes  : integer := 0
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    ahbmi  : in  ahb_mst_in_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    dbgi   : in l3_debug_out_vector(0 to NCPU-1);
    dbgo   : out l3_debug_in_vector(0 to NCPU-1);
    dsui   : in dsu_in_type;
    dsuo   : out dsu_out_type
  );
end; 

architecture rtl of dsu3 is

  constant TBUFABITS : integer := log2(kbytes) + 6;
  constant NBITS  : integer := log2x(ncpu);
  constant PROC_H : integer := 24+NBITS-1;
  constant PROC_L : integer := 24;
  constant AREA_H : integer := 23;
  constant AREA_L : integer := 20;
  constant HBITS : integer := 28;

  constant hconfig : ahb_config_type := (
    0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_LEON3DSU, 0, 0, 0),
    4 => ahb_membar(haddr, '0', '0', hmask),
    others => zero32);
  
  type slv_reg_type is record
    hsel     : std_ulogic;
    haddr    : std_logic_vector(PROC_H downto 0);
    hwrite   : std_ulogic;
    hdata   : std_logic_vector(31 downto 0);
    hready : std_ulogic;    
  end record;                   

  type reg_type is record
    slv  : slv_reg_type;
    en  : std_logic_vector(0 to NCPU-1);
    te  : std_logic_vector(0 to NCPU-1);
    be  : std_logic_vector(0 to NCPU-1);
    bw  : std_logic_vector(0 to NCPU-1);
    bs  : std_logic_vector(0 to NCPU-1);
    bx  : std_logic_vector(0 to NCPU-1);
    bz  : std_logic_vector(0 to NCPU-1);
    halt  : std_logic_vector(0 to NCPU-1);
    reset : std_logic_vector(0 to NCPU-1);
    bn    : std_logic_vector(NCPU-1 downto 0);
    ss    : std_logic_vector(NCPU-1 downto 0);
    bmsk  : std_logic_vector(NCPU-1 downto 0);
    dmsk  : std_logic_vector(NCPU-1 downto 0);
    cnt   : std_logic_vector(2 downto 0);
    dsubre : std_logic_vector(2 downto 0);
    dsuen : std_logic_vector(2 downto 0);
    act   : std_ulogic;
    timer : std_logic_vector(tbits-1 downto 0);
  end record;
                     
  type trace_break_reg is record
    addr          : std_logic_vector(31 downto 2);
    mask          : std_logic_vector(31 downto 2);
    read          : std_logic;
    write         : std_logic;
  end record;

  type tregtype is record
    haddr         : std_logic_vector(31 downto 0);
    hwrite        : std_logic;
    htrans	  : std_logic_vector(1 downto 0);
    hsize         : std_logic_vector(2 downto 0);
    hburst        : std_logic_vector(2 downto 0);
    hwdata        : std_logic_vector(31 downto 0);
    hmaster       : std_logic_vector(3 downto 0);
    hmastlock     : std_logic;
    hsel          : std_logic;
    ahbactive     : std_logic;
    aindex  	  : std_logic_vector(TBUFABITS - 1 downto 0); -- buffer index
    enable        : std_logic;	-- trace enable
    bahb          : std_logic;	-- break on AHB watchpoint hit
    bhit          : std_logic;	-- breakpoint hit
    dcnten        : std_logic;	-- delay counter enable
    delaycnt      : std_logic_vector(TBUFABITS - 1 downto 0); -- delay counter
    tbreg1	  : trace_break_reg;
    tbreg2	  : trace_break_reg;
  end record;

  constant TRACEN : boolean := (kbytes /= 0);
  signal tbi   : tracebuf_in_type;
  signal tbo   : tracebuf_out_type;

  signal tr, trin : tregtype;
  signal r, rin : reg_type;

begin


  comb: process(rst, r, ahbsi, dbgi, dsui, ahbmi, tr, tbo)
                
    variable v : reg_type;
    variable iuacc : std_ulogic;
    variable dbgmode, tstop : std_ulogic;
    variable rawindex : integer range 0 to (2**NBITS)-1;
    variable index : natural range 0 to NCPU-1;
    variable hasel1 : std_logic_vector(AREA_H-1 downto AREA_L);
    variable hasel2 : std_logic_vector(6 downto 2);
    variable tv : tregtype;
    variable vabufi : tracebuf_in_type;
    variable aindex : std_logic_vector(TBUFABITS - 1 downto 0); -- buffer index
    variable bphit : std_logic;
    variable hirq : std_logic_vector(NAHBIRQ-1 downto 0); 
    variable hrdata : std_logic_vector(31 downto 0);
    
  begin
    
    v := r;
    iuacc := '0'; v.slv.hready := '0';
    dbgmode := '0'; tstop := '1';
    v.dsubre := r.dsubre(1 downto 0) & dsui.break;
    v.dsuen := r.dsuen(1 downto 0) & dsui.enable;
    v.act := '0'; hrdata := r.slv.hdata;
    
    tv := tr; vabufi.enable := '0'; tv.bhit := '0';
    vabufi.data := (others => '0'); vabufi.addr := (others => '0'); 
    vabufi.write := (others => '0'); bphit := '0'; aindex := (others => '0');
    hirq := (others => '0'); v.halt := (others => '0'); v.reset := (others => '0');
    if TRACEN then 
      hirq(irq) := tr.bhit; aindex := tr.aindex + 1;
    end if;


-- check for AHB watchpoints
    if TRACEN and ((ahbsi.hready and tr.ahbactive ) = '1') then
      if ((((tr.tbreg1.addr xor tr.haddr(31 downto 2)) and tr.tbreg1.mask) = zero32(29 downto 0)) and
         (((tr.tbreg1.read and not tr.hwrite) or (tr.tbreg1.write and tr.hwrite)) = '1')) 
        or ((((tr.tbreg2.addr xor tr.haddr(31 downto 2)) and tr.tbreg2.mask) = zero32(29 downto 0)) and
           (((tr.tbreg2.read and not tr.hwrite) or (tr.tbreg2.write and tr.hwrite)) = '1')) 
      then
	if ((tr.enable and not r.act) = '1') and (tr.dcnten = '0') and 
	   (tr.delaycnt /= zero32(TBUFABITS-1 downto 0))
        then tv.dcnten := '1'; 
	else bphit := '1'; tv.enable := '0'; end if;
      end if;
    end if;

-- generate AHB buffer inputs

    vabufi.write := "0000";
    if TRACEN then
      if (tr.enable = '1') and (r.act = '0') then
        vabufi.addr(TBUFABITS-1 downto 0) := tr.aindex;
        vabufi.data(127) := bphit;
        vabufi.data(96+tbits-1 downto 96) := r.timer; 
        vabufi.data(94 downto 80) := ahbmi.hirq(15 downto 1);
        vabufi.data(79) := tr.hwrite;
        vabufi.data(78 downto 77) := tr.htrans;
        vabufi.data(76 downto 74) := tr.hsize;
        vabufi.data(73 downto 71) := tr.hburst;
        vabufi.data(70 downto 67) := tr.hmaster;
        vabufi.data(66) := tr.hmastlock;
        vabufi.data(65 downto 64) := ahbmi.hresp;
        if tr.hwrite = '1' then
          vabufi.data(63 downto 32) := ahbsi.hwdata;
        else
          vabufi.data(63 downto 32) := ahbmi.hrdata;
        end if; 
        vabufi.data(31 downto 0) := tr.haddr;
      else
        vabufi.addr(TBUFABITS-1 downto 0) := tr.haddr(TBUFABITS+3 downto 4);
        vabufi.data := ahbsi.hwdata & ahbsi.hwdata & ahbsi.hwdata & ahbsi.hwdata;
      end if;

-- write trace buffer

      if (tr.enable and not r.act) = '1' then 
        if (tr.ahbactive and ahbsi.hready) = '1' then
	    tv.aindex := aindex;
            vabufi.enable := '1'; vabufi.write := "1111"; 
        end if;
      end if;

-- trace buffer delay counter handling

      if (tr.dcnten = '1') then
        if (tr.delaycnt = zero32(TBUFABITS-1 downto 0)) then
	  tv.enable := '0'; tv.dcnten := '0';
          end if;
        tv.delaycnt := tr.delaycnt - 1;
      end if;

-- save AHB transfer parameters

      if (ahbsi.hready = '1' ) then
        tv.haddr := ahbsi.haddr; tv.hwrite := ahbsi.hwrite; tv.htrans := ahbsi.htrans;
        tv.hsize := ahbsi.hsize; tv.hburst := ahbsi.hburst;
        tv.hmaster := ahbsi.hmaster; tv.hmastlock := ahbsi.hmastlock;
      end if;
      if tr.hsel = '1' then tv.hwdata := ahbsi.hwdata; end if;
      if ahbsi.hready = '1' then
        tv.hsel := ahbsi.hsel(hindex);
        tv.ahbactive := ahbsi.htrans(1);
      end if;
    end if;

    if r.slv.hsel = '1' then v.cnt := r.cnt - 1; end if;
    if r.slv.hready = '1' then  v.slv.hsel := '0'; end if;
    
    for i in 0 to NCPU-1 loop
      if dbgi(i).dsumode = '1' then
        if r.dmsk(i) = '0' then dbgmode := '1'; v.act := '1'; end if;
        v.bn(i) := '1';
      else
        tstop := '0';
      end if;
    end loop;

    if tstop = '0' then v.timer := r.timer + 1; end if;
    
    for i in 0 to NCPU-1 loop
      v.bn(i) := v.bn(i) or (dbgmode and r.bmsk(i)) or (r.dsubre(2) and not r.dsubre(1));
    end loop;

    if (ahbsi.hready and ahbsi.hsel(hindex)) = '1' then
      if (ahbsi.htrans(1) = '1') then
        v.slv.hsel := '1';      
        v.slv.haddr := ahbsi.haddr(PROC_H downto 0);
        v.slv.hwrite := ahbsi.hwrite;
        v.cnt := "111";
      end if;
    end if;


    
    for i in 0 to NCPU-1 loop
      v.en(i) := r.dsuen(2) and dbgi(i).dsu;
    end loop;

    rawindex := conv_integer(r.slv.haddr(PROC_H downto PROC_L));    
    if ncpu = 1 then index := 0; else
      if rawindex > ncpu then index := ncpu-1; else index := rawindex; end if;
    end if;

    hasel1 := r.slv.haddr(AREA_H-1 downto AREA_L);
    hasel2 := r.slv.haddr(6 downto 2);
    if r.slv.hsel = '1' then
      case hasel1 is 
        
        when "000" =>  -- DSU registers
          v.slv.hready := '1';
          hrdata := (others => '0');          
          case hasel2 is
            when "00000" =>
              if r.slv.hwrite = '1' then
                v.te(index) := ahbsi.hwdata(0);
                v.be(index) := ahbsi.hwdata(1);
                v.bw(index) := ahbsi.hwdata(2);
                v.bs(index) := ahbsi.hwdata(3);
                v.bx(index) := ahbsi.hwdata(4);                
                v.bz(index) := ahbsi.hwdata(5);                
                v.reset(index) := ahbsi.hwdata(9);                
                v.halt(index) := ahbsi.hwdata(10);                
              else
                hrdata(0) := r.te(index);
                hrdata(1) := r.be(index);
                hrdata(2) := r.bw(index);
                hrdata(3) := r.bs(index);
                hrdata(4) := r.bx(index);
                hrdata(5) := r.bz(index);
                hrdata(6) := dbgi(index).dsumode;
                hrdata(7) := r.dsuen(2);
                hrdata(8) := r.dsubre(2);
                hrdata(9) := not dbgi(index).error;
                hrdata(10) := dbgi(index).halt;
              end if;
            when "00010" =>  -- timer
              if r.slv.hwrite = '1' then
                v.timer := ahbsi.hwdata(tbits-1 downto 0);
              else
                hrdata(tbits-1 downto 0) := r.timer;
              end if;
            when "01000" =>
              if r.slv.hwrite = '1' then
                v.bn := ahbsi.hwdata(NCPU-1 downto 0);
                v.ss := ahbsi.hwdata(16+NCPU-1 downto 16);
              else
                hrdata(NCPU-1 downto 0) := r.bn;
                hrdata(16+NCPU-1 downto 16) := r.ss; 
              end if;
            when "01001" =>
              if r.slv.hwrite = '1' then
                v.bmsk(NCPU-1 downto 0) := ahbsi.hwdata(NCPU-1 downto 0);
                v.dmsk(NCPU-1 downto 0) := ahbsi.hwdata(NCPU-1+16 downto 16);
              else
                hrdata(NCPU-1 downto 0) := r.bmsk;
                hrdata(NCPU-1+16 downto 16) := r.dmsk;
              end if;
            when "10000" =>
	      if TRACEN then
	        hrdata((TBUFABITS + 15) downto 16) := tr.delaycnt;
	        hrdata(1 downto 0) := tr.dcnten & tr.enable;
	        if r.slv.hwrite = '1' then
	          tv.delaycnt := ahbsi.hwdata((TBUFABITS+ 15) downto 16); 
	          tv.dcnten := ahbsi.hwdata(1);
	          tv.enable := ahbsi.hwdata(0);
	        end if;
	      end if;
            when "10001" =>
	      if TRACEN then
	        hrdata((TBUFABITS - 1 + 4) downto 4) := tr.aindex;
	        if r.slv.hwrite = '1' then
	          tv.aindex := ahbsi.hwdata((TBUFABITS- 1) downto 0); 
	        end if;
	      end if;
            when "10100" =>
	      if TRACEN then
	        hrdata(31 downto 2) := tr.tbreg1.addr; 
	        if r.slv.hwrite = '1' then
	          tv.tbreg1.addr := ahbsi.hwdata(31 downto 2); 
	        end if;
	      end if;
            when "10101" =>
	      if TRACEN then
	        hrdata := tr.tbreg1.mask & tr.tbreg1.read & tr.tbreg1.write; 
	        if r.slv.hwrite = '1' then
	          tv.tbreg1.mask := ahbsi.hwdata(31 downto 2); 
	          tv.tbreg1.read := ahbsi.hwdata(1); 
	          tv.tbreg1.write := ahbsi.hwdata(0); 
	        end if;
	      end if;
            when "10110" =>
	      if TRACEN then
	        hrdata(31 downto 2) := tr.tbreg2.addr; 
	        if r.slv.hwrite = '1' then
	          tv.tbreg2.addr := ahbsi.hwdata(31 downto 2); 
	        end if;
	      end if;
            when "10111" =>
	      if TRACEN then
	        hrdata := tr.tbreg2.mask & tr.tbreg2.read & tr.tbreg2.write; 
	        if r.slv.hwrite = '1' then
	          tv.tbreg2.mask := ahbsi.hwdata(31 downto 2); 
	          tv.tbreg2.read := ahbsi.hwdata(1); 
	          tv.tbreg2.write := ahbsi.hwdata(0); 
	        end if;
	      end if;
            when others =>
          end case;

        when "010"  =>  -- AHB tbuf
	  if TRACEN then
            if r.cnt(1 downto 0) = "10" then v.slv.hready := '1'; end if;
            vabufi.enable := not (tr.enable and not r.act);
            case tr.haddr(3 downto 2) is
            when "00" =>
	      hrdata := tbo.data(127 downto 96);
	      if r.slv.hwrite = '1' then 
	        vabufi.write(3) := vabufi.enable;
	      end if;
            when "01" =>
	      hrdata := tbo.data(95 downto 64);
	      if r.slv.hwrite = '1' then 
	        vabufi.write(2) := vabufi.enable;
	      end if;
            when "10" =>
	      hrdata := tbo.data(63 downto 32);
	      if r.slv.hwrite = '1' then 
	        vabufi.write(1) := vabufi.enable;
	      end if;
            when others =>
	      hrdata := tbo.data(31 downto 0);
	      if r.slv.hwrite = '1' then 
	        vabufi.write(0) := vabufi.enable;
	      end if;
	    end case;
	  end if;
        when "011" | "001"  =>  -- IU reg file, IU tbuf
          iuacc := '1';
          hrdata := dbgi(index).data;
          if r.cnt(1 downto 0) = "10" then v.slv.hready := '1'; end if;
        when "100" =>  -- IU reg access
          iuacc := '1';
          hrdata := dbgi(index).data;
          if r.cnt(1 downto 0) = "11" then v.slv.hready := '1'; end if;
        when "111" => -- DSU ASI
          if r.cnt(2 downto 1) = "11" then iuacc := '1'; else iuacc := '0'; end if;
          if (dbgi(index).crdy = '1') or (r.cnt = "000") then v.slv.hready := '1'; end if;
          hrdata := dbgi(index).data;          
        when others =>
          v.slv.hready := '1';
      end case;
      if (r.slv.hready and not v.slv.hsel) = '1' then v.slv.hready := '0'; end if;      
    end if;

    if r.slv.hsel  = '1' then
      if r.slv.hwrite = '1' then v.slv.hdata := ahbsi.hwdata;
      else v.slv.hdata := hrdata; end if;
    end if;
    
    if ((ahbsi.hready and ahbsi.hsel(hindex)) = '1') and (ahbsi.htrans(1) = '0') then
      v.slv.hready := '1';
    end if;
    
    if rst = '0' then
      v.bn := (others => r.dsubre(2)); v.bmsk := (others => '0');
      v.dmsk := (others => '0');
      v.ss := (others => '0'); v.timer := (others => '0'); v.slv.hsel := '0';
      for i in 0 to NCPU-1 loop
        v.bw(i) := r.dsubre(2); v.be(i) := r.dsubre(2); 
        v.bx(i) := r.dsubre(2); v.bz(i) := r.dsubre(2); 
        v.bs(i) := '0'; v.te(i) := '0';
      end loop;
      tv.ahbactive := '0'; tv.enable := '0';
      tv.hsel := '0'; tv.dcnten := '0';
      tv.tbreg1.read := '0'; tv.tbreg1.write := '0';
      tv.tbreg2.read := '0'; tv.tbreg2.write := '0';
      v.slv.hready := '1';
    end if;

    rin <= v; trin <= tv; tbi <= vabufi;

    for i in 0 to NCPU-1 loop
      dbgo(i).tenable <= r.te(i);
      dbgo(i).dsuen <= r.en(i);  
      dbgo(i).dbreak <= r.bn(i); -- or (dbgmode and r.bmsk(i));
      if conv_integer(r.slv.haddr(PROC_H downto PROC_L)) = i then
        dbgo(i).denable <= iuacc;
      else
        dbgo(i).denable <= '0';
      end if;
      dbgo(i).step <= r.ss(i);    
      dbgo(i).berror <= r.be(i);
      dbgo(i).bsoft <= r.bs(i);
      dbgo(i).bwatch <= r.bw(i);
      dbgo(i).btrapa <= r.bx(i);
      dbgo(i).btrape <= r.bz(i);
      dbgo(i).daddr <= r.slv.haddr(PROC_L-1 downto 2);
      dbgo(i).ddata <= r.slv.hdata;    
      dbgo(i).dwrite <= r.slv.hwrite;
      dbgo(i).halt <= r.halt(i);
      dbgo(i).reset <= r.reset(i);
      dbgo(i).timer(tbits-1 downto 0) <= r.timer; 
      dbgo(i).timer(30 downto tbits) <= (others => '0');      
    end loop;
    
    ahbso.hconfig <= hconfig;
    ahbso.hresp <= HRESP_OKAY;
    ahbso.hready <= r.slv.hready;
    ahbso.hrdata <= r.slv.hdata;    
    ahbso.hsplit <= (others => '0');
    ahbso.hcache <= '0';
    ahbso.hirq   <= hirq;
    ahbso.hindex <= hindex;
    

    dsuo.active <= r.act;
    dsuo.tstop <= tstop;
    
  end process;
  
  reg : process(clk)
  begin if rising_edge(clk) then r <= rin; end if; end process;
    
  tb0 : if TRACEN generate
    treg : process(clk)
    begin if rising_edge(clk) then tr <= trin; end if; end process;
    mem0 : tbufmem
    generic map (tech => tech, tbuf => kbytes) port map (clk, tbi, tbo);
-- pragma translate_off
    bootmsg : report_version 
    generic map ("dsu3_" & tost(hindex) &
    ": LEON3 Debug support unit + AHB Trace Buffer, " & tost(kbytes) & " kbytes");
-- pragma translate_on
  end generate;
    
  notb : if not TRACEN generate
-- pragma translate_off
    bootmsg : report_version 
    generic map ("dsu3_" & tost(hindex) &
    ": LEON3 Debug support unit");
-- pragma translate_on
  end generate;

end;
