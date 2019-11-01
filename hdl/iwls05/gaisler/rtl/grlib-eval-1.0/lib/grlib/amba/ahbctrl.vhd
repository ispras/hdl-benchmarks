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
-- Author:      Jiri Gaisler, Gaisler Research
-- Modified:    Edvin Catovic, Gaisler Research
-- Description: AMBA arbiter, decoder and multiplexer with plug&play support
------------------------------------------------------------------------------ 

library IEEE;
use IEEE.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
use grlib.amba.all;

entity ahbctrl is
  generic (
    defmast : integer := 0;		-- default master
    split   : integer := 0;		-- split support
    rrobin  : integer := 0;		-- round-robin arbitration
    timeout : integer range 0 to 255 := 0;  -- HREADY timeout
    ioaddr  : ahb_addr_type := 16#fff#;  -- I/O area MSB address
    iomask  : ahb_addr_type := 16#fff#;  -- I/O area address mask
    cfgaddr : ahb_addr_type := 16#ff0#;  -- config area MSB address
    cfgmask : ahb_addr_type := 16#ff0#;   -- config area address mask
    nahbm   : integer range 1 to NAHBMST := NAHBMST; -- number of masters
    nahbs   : integer range 1 to NAHBSLV := NAHBSLV; -- number of slaves
    ioen    : integer range 0 to 15 := 1;   -- enable I/O area
    disirq  : integer range 0 to 1 := 0   -- disable interrupt routing
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    msti    : out ahb_mst_in_type;
    msto    : in  ahb_mst_out_vector;
    slvi    : out ahb_slv_in_type;
    slvo    : in  ahb_slv_out_vector
  );
end;

architecture rtl of ahbctrl is

constant nahbmx : integer := 2**log2(nahbm);
type nmstarr is array (1 to 3) of integer range 0 to nahbmx-1;
type nvalarr is array (1 to 3) of boolean;

type reg_type is record
  hmaster   : integer range 0 to nahbmx -1;
  hmasterd  : integer range 0 to nahbmx -1;
  hslave    : integer range 0 to nahbs-1;
  hmasterlock : std_ulogic;
  hready    : std_ulogic;
  defslv    : std_ulogic;
  htrans    : std_logic_vector(1 downto 0);
  haddr     : std_logic_vector(15 downto 2); 
  cfgsel    : std_ulogic;
  cfga11    : std_ulogic;
  hrdatam   : std_logic_vector(31 downto 0); 
  hrdatas   : std_logic_vector(31 downto 0);
  beat      : std_logic_vector(2 downto 0);
end record;

  type l0_type is array (0 to 15) of std_logic_vector(2 downto 0);
  type l1_type is array (0 to 7) of std_logic_vector(3 downto 0);
  type l2_type is array (0 to 3) of std_logic_vector(4 downto 0);
  type l3_type is array (0 to 1) of std_logic_vector(5 downto 0);

  type tztab_type is array (0 to 15) of std_logic_vector(2 downto 0);

  constant tztab : tztab_type := ("100", "000", "001", "000",
                                  "010", "000", "001", "000",
                                  "011", "000", "001", "000",
                                  "010", "000", "001", "000");
  
  function tz(vect_in : std_logic_vector) return std_logic_vector is
    variable vect : std_logic_vector(63 downto 0);
    variable l0 : l0_type;
    variable l1 : l1_type;
    variable l2 : l2_type;
    variable l3 : l3_type;
    variable l4 : std_logic_vector(6 downto 0);
    variable bci_lsb, bci_msb : std_logic_vector(3 downto 0);
    variable bco_lsb, bco_msb : std_logic_vector(2 downto 0);    
    variable sel : std_logic;
  begin

    vect := (others => '1');
    vect(vect_in'length-1 downto 0) := vect_in;

    -- level 0
    for i in 0 to 7 loop
      bci_lsb := vect(8*i+3 downto 8*i);
      bci_msb := vect(8*i+7 downto 8*i+4);
      bco_lsb := tztab(conv_integer(bci_lsb));
      bco_msb := tztab(conv_integer(bci_msb));
      sel := bco_lsb(2);
      if sel = '0' then l1(i) := '0' & bco_lsb;
      else l1(i) := bco_msb(2) & not bco_msb(2) & bco_msb(1 downto 0); end if;
    end loop;

    -- level 1
    for i in 0 to 3 loop
      sel := l1(2*i)(3);
      if sel = '0' then l2(i) := '0' & l1(2*i);
      else
        l2(i) := l1(2*i+1)(3) & not l1(2*i+1)(3) & l1(2*i+1)(2 downto 0);
      end if;
    end loop;

    -- level 2
    for i in 0 to 1 loop
      sel := l2(2*i)(4);
      if sel = '0' then l3(i) := '0' & l2(2*i);
      else
        l3(i) := l2(2*i+1)(4) & not l2(2*i+1)(4) & l2(2*i+1)(3 downto 0);
      end if;
    end loop;

    --level 3
    if l3(0)(5) = '0' then l4 := '0' & l3(0);
    else l4 := l3(1)(5) & not l3(1)(5) & l3(1)(4 downto 0); end if;
    
    return(l4);    
  end;

  function lz(vect_in : std_logic_vector) return std_logic_vector is
    variable vect : std_logic_vector(vect_in'length-1 downto 0);
    variable vect2 : std_logic_vector(vect_in'length-1 downto 0);    
  begin
    vect := vect_in;
    for i in vect'right to vect'left loop
      vect2(i) := vect(vect'left-i);
    end loop;
    return(tz(vect2));
  end;

-- Find next master:
--   * 2 arbitration policies: fixed priority or round-robin
--   * Fixed priority: priority is fixed, highest index has highest priority
--   * Round-robin: arbiter maintains circular queue of masters
--   * (master 0, master 1, ..., master (nahbmx-1)). First requesting master
--   * in the queue is granted access to the bus and moved to the end of the queue.  
--   * splitted masters are not granted
--   * burst transfers cannot be interrupted
--   * low-priority masters will be granted if they drive SEQ or NONSEQ
--     on HTRANS, and high-priority masters only drive IDLE
  
  procedure selmast(r      : in reg_type;
                  msto   : in ahb_mst_out_vector;
                  rsplit : in std_logic_vector(0 to nahbmx-1);
                  mast   : out integer range 0 to nahbmx-1) is
  variable nmst    : nmstarr;
  variable nvalid  : nvalarr;                  

  variable rrvec : std_logic_vector(nahbmx*2-1 downto 0);
  variable zcnt  : std_logic_vector(log2(nahbmx)+1 downto 0);
  variable hpvec : std_logic_vector(nahbmx-1 downto 0);
  variable zcnt2 : std_logic_vector(log2(nahbmx) downto 0);
  
begin

    nvalid(1 to 3) := (others => false); nmst(1 to 3) := (others => 0);
    mast := r.hmaster; 
    
    if nahbm = 1 then
      mast := 0;
    elsif rrobin = 0 then

      hpvec := (others => '0');
      for i in 0 to nahbmx-1 loop
	if ((rsplit(i) = '0') or (split = 0)) then
          hpvec(i) := msto(i).hbusreq and msto(i).htrans(1);
        end if;
      end loop;
      zcnt2 := lz(hpvec)(log2(nahbmx) downto 0);
      if zcnt2(log2(nahbmx)) = '0' then nvalid(1) := true; end if;
      nmst(1) := conv_integer(not (zcnt2(log2(nahbmx)-1 downto 0)));
      
      hpvec := (others => '0');
      for i in 0 to nahbmx-1 loop
	if ((rsplit(i) = '0') or (split = 0)) then
          hpvec(i) := msto(i).hbusreq;
        end if;
      end loop;
      zcnt2 := lz(hpvec)(log2(nahbmx) downto 0);
      if zcnt2(log2(nahbmx)) = '0' then nvalid(2) := true; end if;
      nmst(2) := conv_integer(not (zcnt2(log2(nahbmx)-1 downto 0)));

      for i in 0 to nahbmx-1 loop
        if not ((nmst(3) = defmast) and nvalid(3)) then 
          nmst(3) := i; nvalid(3) := true; 
        end if;        
      end loop;
      
    else

      rrvec := (others => '0');
      for i in 0 to nahbmx-1 loop
        if (rsplit(i) = '0') or (split = 0) then 
          if (i <= r.hmaster) then rrvec(i) := '0';
          else rrvec(i) := msto(i).hbusreq and msto(i).htrans(1); end if;
          rrvec(nahbmx+i) := msto(i).hbusreq and msto(i).htrans(1);
        end if;
      end loop;
      zcnt := tz(rrvec)(log2(nahbmx)+1 downto 0);
      if zcnt(log2(nahbmx)+1) = '0' then nvalid(1) := true; end if;
      nmst(1) := conv_integer(zcnt(log2(nahbmx)-1 downto 0));
      
      rrvec := (others => '0');
      for i in 0 to nahbmx-1 loop
        if (rsplit(i) = '0') or (split = 0) then 
          if (i <= r.hmaster) then rrvec(i) := '0';
          else rrvec(i) := msto(i).hbusreq; end if;
          rrvec(nahbmx+i) := msto(i).hbusreq;
        end if;
      end loop;
      zcnt := tz(rrvec)(log2(nahbmx)+1 downto 0);
      if zcnt(log2(nahbmx)+1) = '0' then nvalid(2) := true; end if;
      nmst(2) := conv_integer(zcnt(log2(nahbmx)-1 downto 0));

      nmst(3) := r.hmaster; nvalid(3) := true;

    end if;

    for i in 1 to 3 loop
      if nvalid(i) then mast := nmst(i); exit; end if;
    end loop;      
  end;
                 
  constant MIMAX : integer := log2x(nahbmx) - 1;
  constant SIMAX : integer := log2x(nahbs) - 1;
  constant IOAREA : std_logic_vector(11 downto 0) := 
  	conv_std_logic_vector(ioaddr, 12);
  constant IOMSK  : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(iomask, 12);
  constant CFGAREA : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(cfgaddr, 12);
  constant CFGMSK  : std_logic_vector(11 downto 0) := 
	conv_std_logic_vector(cfgmask, 12);

  signal r, rin : reg_type;
  signal rsplit, rsplitin : std_logic_vector(0 to nahbmx-1);
  
begin

  comb : process(rst, msto, slvo, r, rsplit)
  variable v : reg_type;
  variable nhmaster, hmaster : integer range 0 to nahbmx -1;
  variable hgrant  : std_logic_vector(0 to NAHBMST-1);   -- bus grant
  variable hsel    : std_logic_vector(0 to 31);   -- slave select
  variable hmbsel  : std_logic_vector(0 to NAHBAMR-1);
  variable nslave  : natural range 0 to 31;
  variable vsplit  : std_logic_vector(0 to nahbmx-1);
  variable bnslave : std_logic_vector(3 downto 0);
  variable area    : std_logic_vector(1 downto 0);
  variable hready  : std_ulogic;
  variable defslv  : std_ulogic;
  variable cfgsel  : std_ulogic;
  variable hcache  : std_ulogic;
  variable hresp   : std_logic_vector(1 downto 0);
  variable hrdata  : std_logic_vector(31 downto 0);
  variable haddr   : std_logic_vector(31 downto 0);
  variable hirq    : std_logic_vector(NAHBIRQ-1 downto 0);

  begin

    v := r; hgrant := (others => '0');
    haddr := msto(r.hmaster).haddr;

    nhmaster := r.hmaster; 

    -- bus arbitration
    if (r.hmasterlock = '0') and (
       (msto(r.hmaster).htrans = HTRANS_IDLE) or
       ( (msto(r.hmaster).htrans = HTRANS_SEQ) and
         ( ((msto(r.hmaster).hburst = HBURST_INCR4) and (r.beat = "011")) or
           ((msto(r.hmaster).hburst = HBURST_INCR8) and (r.beat = "111")) ) ) or
       ( (msto(r.hmaster).htrans = HTRANS_NONSEQ) and
         (msto(r.hmaster).hburst = HBURST_SINGLE))) then
      selmast(r, msto, rsplit, nhmaster);
    end if;

    hgrant(nhmaster) := '1';

    -- slave decoding

    hsel := (others => '0'); hmbsel := (others => '0');

    for i in 0 to nahbs-1 loop
      for j in NAHBIR to NAHBCFG-1 loop
        area := slvo(i).hconfig(j)(1 downto 0);
        case area is
	when "10" =>
          if ((ioen = 0) or ((IOAREA and IOMSK) /= (haddr(31 downto 20) and IOMSK))) and
             ((slvo(i).hconfig(j)(31 downto 20) and slvo(i).hconfig(j)(15 downto 4)) = 
              (haddr(31 downto 20) and slvo(i).hconfig(j)(15 downto 4)))
          then hsel(i) := '1'; hmbsel(j-NAHBIR) := '1'; end if;
	when "11" =>
          if ((ioen /= 0) and ((IOAREA and IOMSK) = (haddr(31 downto 20) and IOMSK))) and
             ((slvo(i).hconfig(j)(31 downto 20) and slvo(i).hconfig(j)(15 downto 4)) = 
              (haddr(19 downto  8) and slvo(i).hconfig(j)(15 downto 4)))
          then hsel(i) := '1'; hmbsel(j-NAHBIR) := '1'; end if;
	when others =>
        end case;
      end loop;
    end loop;

    bnslave(0) := hsel(1) or hsel(3) or hsel(5) or hsel(7) or
                  hsel(9) or hsel(11) or hsel(13) or hsel(15);
    bnslave(1) := hsel(2) or hsel(3) or hsel(6) or hsel(7) or
                  hsel(10) or hsel(11) or hsel(14) or hsel(15);
    bnslave(2) := hsel(4) or hsel(5) or hsel(6) or hsel(7) or
                  hsel(12) or hsel(13) or hsel(14) or hsel(15);
    bnslave(3) := hsel(8) or hsel(9) or hsel(10) or hsel(11) or
                  hsel(12) or hsel(13) or hsel(14) or hsel(15);
    nslave := conv_integer(bnslave(SIMAX downto 0));

    if ((((IOAREA and IOMSK) = (haddr(31 downto 20) and IOMSK)) and (ioen /= 0))
      or ((IOAREA = haddr(31 downto 20)) and (ioen = 0))) and
       ((CFGAREA and CFGMSK) = (haddr(19 downto  8) and CFGMSK))
       and (cfgmask /= 0)
    then cfgsel := '1'; hsel := (others => '0');
    else cfgsel := '0'; end if;

    if (nslave = 0) and (hsel(0) = '0') and (cfgsel = '0') then defslv := '1';
    else defslv := '0'; end if;

-- error respons on undecoded area

    v.hready := '0'; 
    hready := slvo(r.hslave).hready; hresp := slvo(r.hslave).hresp;
    if r.defslv = '1' then
      -- default slave
      if (r.htrans = HTRANS_IDLE) or (r.htrans = HTRANS_BUSY) then
        hresp := HRESP_OKAY; hready := '1';
      else
	-- return two-cycle error in case of unimplemented slave access
	hresp := HRESP_ERROR; hready := r.hready; v.hready := not r.hready;
      end if;
    end if;

    hrdata := slvo(r.hslave).hrdata;

    if cfgmask /= 0 then
--      v.hrdatam := msto(conv_integer(r.haddr(MIMAX+5 downto 5))).hconfig(conv_integer(r.haddr(4 downto 2)));
--      if r.haddr(11 downto MIMAX+6) /= zero32(11 downto MIMAX+6) then v.hrdatam := (others => '0'); end if;

      if (r.haddr(10 downto MIMAX+6) = zero32(10 downto MIMAX+6)) and (r.haddr(4 downto 2) = "000")
      then v.hrdatam := msto(conv_integer(r.haddr(MIMAX+5 downto 5))).hconfig(0);
      else v.hrdatam := (others => '0'); end if;

--      v.hrdatas := slvo(conv_integer(r.haddr(SIMAX+5 downto 5))).hconfig(conv_integer(r.haddr(4 downto 2)));
--      if r.haddr(11 downto SIMAX+6) /= ('1' & zero32(10 downto SIMAX+6)) then v.hrdatas := (others => '0'); end if;

      if (r.haddr(10 downto SIMAX+6) = zero32(10 downto SIMAX+6)) and 
	((r.haddr(4 downto 2) = "000") or (r.haddr(4) = '1'))
      then v.hrdatas := slvo(conv_integer(r.haddr(SIMAX+5 downto 5))).hconfig(conv_integer(r.haddr(4 downto 2)));
      else v.hrdatas := (others => '0'); end if;

      if r.cfgsel = '1' then
        hrdata := (others => '0'); 
        -- default slave
        if (r.htrans = HTRANS_IDLE) or (r.htrans = HTRANS_BUSY) then
          hresp := HRESP_OKAY; hready := '1';
        else
  	  -- return two-cycle read/write respons
 	  hresp := HRESP_OKAY; hready := r.hready; v.hready := not r.hready;
        end if;
        if r.cfga11 = '0' then hrdata := r.hrdatam;
        else hrdata := r.hrdatas; end if;
      end if;
    end if;

    -- latch active master and slave
    if hready = '1' then 
      v.hmaster := nhmaster; v.hmasterd := r.hmaster;
      v.hmasterlock := msto(nhmaster).hlock; v.hslave := nslave; v.defslv := defslv;
      v.htrans := msto(r.hmaster).htrans; v.cfgsel := cfgsel;
      v.cfga11 := msto(r.hmaster).haddr(11);
      v.haddr := msto(r.hmaster).haddr(15 downto 2);
      if (msto(r.hmaster).htrans = HTRANS_NONSEQ) or (msto(r.hmaster).htrans = HTRANS_IDLE) then
        v.beat := "001";
      elsif (msto(r.hmaster).htrans = HTRANS_SEQ) then
        if (msto(r.hmaster).hburst = HBURST_INCR4) or (msto(r.hmaster).hburst = HBURST_INCR8) then
          v.beat := r.beat + 1;
        end if;
      end if;
    end if;
      
    -- split support
    vsplit := (others => '0');
    if SPLIT /= 0 then
      vsplit := rsplit;
      if slvo(r.hslave).hresp = HRESP_SPLIT then vsplit(r.hmasterd) := '1'; end if;
      for i in 0 to nahbs-1 loop
	vsplit := vsplit and not slvo(i).hsplit(nahbmx-1 downto 0);
      end loop;
    end if;

    if r.cfgsel = '1' then hcache := '1'; else hcache := slvo(v.hslave).hcache; end if;
    
    -- interrupt merging
    hirq := (others => '0');
    if disirq = 0 then
      for i in 0 to nahbs-1 loop hirq := hirq or slvo(i).hirq; end loop;
      for i in 0 to nahbm-1 loop hirq := hirq or msto(i).hirq; end loop;
    end if;

    -- reset operation
    if (rst = '0') then
      v.hmaster := 0; v.hmasterlock := '0'; vsplit := (others => '0');
      v.htrans := HTRANS_IDLE;  v.defslv := '0'; v.beat := "001";
      v.hslave := 0; v.cfgsel := '0'; 
    end if;
    
    -- drive master inputs
    msti.hgrant  <= hgrant;
    msti.hready  <= hready;
    msti.hresp   <= hresp;
    msti.hrdata  <= hrdata;
    msti.hcache  <= hcache;
    msti.hirq    <= hirq; 

    -- drive slave inputs
    slvi.haddr     <= haddr;
    slvi.htrans    <= msto(r.hmaster).htrans;
    slvi.hwrite    <= msto(r.hmaster).hwrite;
    slvi.hsize     <= msto(r.hmaster).hsize;
    slvi.hburst    <= msto(r.hmaster).hburst;
    slvi.hready    <= hready;
    slvi.hwdata    <= msto(r.hmasterd).hwdata;
    slvi.hprot     <= msto(r.hmaster).hprot;
    slvi.hmastlock <= r.hmasterlock;
    slvi.hmaster   <= conv_std_logic_vector(r.hmaster, 4);
    slvi.hsel      <= hsel(0 to NAHBSLV-1); 
    slvi.hmbsel    <= hmbsel; 
    slvi.hcache    <= hcache; 
    slvi.hirq      <= hirq; 

    rin <= v; rsplitin <= vsplit; 

  end process;


  reg0 : process(clk)
  begin if rising_edge(clk) then r <= rin; end if; end process;

  splitreg : if SPLIT /= 0 generate
    reg1 : process(clk)
    begin if rising_edge(clk) then rsplit <= rsplitin; end if; end process;
  end generate;

  nosplitreg : if SPLIT = 0 generate
    rsplit <= (others => '0');
  end generate;
  
-- pragma translate_off
  diag : process
  variable k : integer;
  variable mask : std_logic_vector(11 downto 0);
  variable iostart : std_logic_vector(11 downto 0) := IOAREA and IOMSK;
  variable cfgstart : std_logic_vector(11 downto 0) := CFGAREA and CFGMSK;
  begin
    wait for 2 ns;
    k := 0; mask := IOMSK;
    while (k<12) and (mask(k) = '0') loop k := k+1; end loop; 
    print("ahbctrl: AHB arbiter/multiplexer rev 1");
    if ioen /= 0 then
      print("ahbctrl: Common I/O area at " & tost(iostart) & "00000, " & tost(2**k) & " Mbyte");
    else
      print("ahbctrl: Common I/O area disabled");
    end if;
    if cfgmask /= 0 then
      print("ahbctrl: Configuration area at " & tost(iostart & cfgstart) & "00, 4 kbyte");
    else
      print("ahbctrl: Configuration area disabled");
    end if;
    wait;
  end process;
-- pragma translate_on

end;

