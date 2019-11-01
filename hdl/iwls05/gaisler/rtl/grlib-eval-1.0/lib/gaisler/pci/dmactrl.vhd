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
-- Entity:  dmactrl
-- File:  dmactrl.vhd
-- Author:  Alf Vaerneus - Gaisler Research
-- Description:	Simple DMA controller
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.devices.all;
use gaisler.misc.all;
use gaisler.pci.all;

entity dmactrl is
  generic (
    hindex    : integer := 0;
    pindex    : integer := 0;
    paddr     : integer := 0;
    pmask     : integer := 16#fff#;
    blength   : integer := 4
  );
  port (
    rst       : in std_logic;
    clk       : in std_logic;
    apbi      : in apb_slv_in_type;
    apbo      : out apb_slv_out_type;
    ahbmi     : in ahb_mst_in_type;
    ahbmo     : out ahb_mst_out_type;
    ahbsi0    : in ahb_slv_in_type;
    ahbso0    : out ahb_slv_out_type;
    ahbsi1    : out ahb_slv_in_type;
    ahbso1    : in ahb_slv_out_type
  );
end;

architecture rtl of dmactrl is

constant BURST_LENGTH : integer := blength;
constant REVISION : integer := 0;

constant pconfig : apb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_DMACTRL, 0, REVISION, 0),
  1 => apb_iobar(paddr, pmask));

type state_type is(idle, read1, read1w, read2, read3, read4, read5, readw, write1, write2, write3, write4, writeb, turn);
type rbuf_type is array (0 to 2) of std_logic_vector(31 downto 0);
type dmactrl_reg_type is record
  state    : state_type;
  addr0    : std_logic_vector(31 downto 2);
  addr1    : std_logic_vector(31 downto 2);
  hmbsel   : std_logic_vector(0 to NAHBAMR-1);
  htrans   : std_logic_vector(1 downto 0);
  rbuf     : rbuf_type;
  write    : std_logic;
  start    : std_logic;
  ready    : std_logic;
  err      : std_logic;
  first0   : std_logic;
  first1   : std_logic;
  no_ws    : std_logic;
  burstl   : std_logic_vector(BURST_LENGTH - 1 downto 0);
end record;

signal r,rin : dmactrl_reg_type;
signal dmai : ahb_dma_in_type;
signal dmao : ahb_dma_out_type;

procedure ahb_incr(inaddr : in std_logic_vector(31 downto 2); outaddr : out std_logic_vector(31 downto 2)) is
variable newaddr : std_logic_vector(31 downto 2);
begin
  newaddr := inaddr + '1';
  outaddr := newaddr;
end;

procedure ahb_decr(inaddr : in std_logic_vector(31 downto 2); outaddr : out std_logic_vector(31 downto 2)) is
variable newaddr : std_logic_vector(31 downto 2);
begin
  newaddr := inaddr - '1';
  outaddr := newaddr;
end;

begin

  comb : process(rst,r,dmao,apbi,ahbsi0,ahbso1)
  variable v : dmactrl_reg_type;
  variable vdmai : ahb_dma_in_type;
  variable pdata : std_logic_vector(31 downto 0);
  variable slvbusy : ahb_slv_out_type;
  variable hready, dma_done, request, data_transfer, rundma : std_logic;
  variable bufloc : integer range 0 to 2;
  begin

    slvbusy := ahbso1; v := r;
    slvbusy.hresp := "10"; slvbusy.hready := '1'; slvbusy.hindex := hindex;
    hready := ahbso1.hready;
    vdmai.burst := '1'; vdmai.address := r.addr0 & "00";
    vdmai.write := not r.write; vdmai.start := '0'; vdmai.size := "10";
    vdmai.wdata := r.rbuf(0); pdata := (others => '0');
    vdmai.busy := '0'; vdmai.irq := '0'; data_transfer := '0';
    request := '0'; bufloc := conv_integer(not r.no_ws)+1; rundma := r.start;
    if dmao.active = '0' then v.first0 := '1'; end if;

    if (r.burstl(BURST_LENGTH - 1 downto 1) = zero32(BURST_LENGTH - 1 downto 1)) then
      dma_done := '1'; else dma_done := '0'; end if;

    if (apbi.psel(pindex) and apbi.penable) = '1' then
      case apbi.paddr(4 downto 2) is
      when "000" =>
        if apbi.pwrite = '1' then
          v.start := apbi.pwdata(0);
          v.write := apbi.pwdata(1);
          v.ready := r.ready and not apbi.pwdata(2);
          v.err := r.err and not apbi.pwdata(3);
          v.hmbsel := apbi.pwdata(7 downto 4);
        end if;
        pdata := zero32(31 downto 8) & r.hmbsel & r.err & r.ready & r.write & r.start;
      when "001" =>
        if apbi.pwrite = '1' then v.addr0 := apbi.pwdata(31 downto 2); end if;
        pdata := r.addr0 & "00";
      when "010" =>
        if apbi.pwrite = '1' then v.addr1 := apbi.pwdata(31 downto 2); end if;
        pdata := r.addr1 & "00";
      when "011" =>
        if apbi.pwrite = '1' then v.burstl := apbi.pwdata(BURST_LENGTH - 1 downto 0); end if;
        pdata := zero32(31 downto BURST_LENGTH) & r.burstl;
      when others =>
      end case;
    end if;

    case r.state is
    when idle =>
      v.first0 := '1'; v.first1 := '1';
      if r.start = '1' then
        if r.write = '0' then v.state := read1;
        else v.state := write1; end if;
      end if;
    when read1 =>
      request := not dmao.active; bufloc := 0; v.no_ws := '0';
      if ((r.htrans(1) and ahbso1.hready) = '1' and ahbso1.hresp = HRESP_OKAY) then
        v.state := read1w;
      else v.first1 := '1';
      end if;
    when read1w =>
      request := '1'; bufloc := 1; v.no_ws := '0'; v.state := read2;
    when read2 =>
      vdmai.start := '1'; bufloc := 2;
      if dmao.ready = '1' then
        v.state := read3;
      end if;
      if dmao.active = '1' then
        if dma_done = '1' then v.state := readw; v.burstl(0) := '0'; v.no_ws := '1'; vdmai.start := '0';
        elsif ahbso1.hresp = HRESP_RETRY then v.state := read1;
        end if;
      elsif ahbso1.hresp = HRESP_RETRY then v.state := read5;
      end if;
    when read3 =>
      vdmai.start := not dma_done;
      if (dma_done and dmao.start) = '1' then v.state := readw; v.burstl(0) := '0';
      elsif dmao.active = '0' then v.state := read2;
      elsif ahbso1.hresp = HRESP_RETRY then v.state := read5; rundma := not (dma_done and not r.burstl(0));
      else v.state := read4; end if;
      if (dmao.ready and dmao.start) = '1' then
        v.no_ws := '1'; bufloc := 1;
      end if;
    when read4 =>
      vdmai.start := not (dma_done and dmao.active);
      if (dma_done and dmao.start) = '1' then v.state := readw; v.burstl(0) := '0';
      elsif (ahbso1.hresp = HRESP_RETRY) then
        if dmao.active = '0' then
          v.addr1 := r.addr1 - "11"; v.state := readw;
          rundma := '0'; vdmai.start := '0';
        else
          v.state := read5; rundma := not (dma_done and not r.burstl(0));
        end if;
      end if;
    when read5 =>
      rundma := not (dma_done and not r.burstl(0)); hready := '0';
      vdmai.start := not r.no_ws; v.no_ws := dmao.start or r.no_ws;
      if (r.no_ws and not dmao.active) = '1' then
--        if (dma_done and not r.burstl(0)) = '1' then v.state := turn;
        if (dma_done and not r.burstl(0)) = '1' then v.state := readw;
        else v.state := read1; end if;
      end if;
    when readw =>
      v.first1 := '1'; rundma := '0';
      if ((r.htrans(1) and ahbso1.hready) = '1' and ahbso1.hresp = HRESP_OKAY) then
        if (dma_done and not r.burstl(0)) = '1' then v.state := turn;
        else v.state := read1; end if;
      else request := '1'; end if;
    when write1 =>
      vdmai.start := '1'; bufloc := 0; hready := '0';
      v.first1 := '1'; v.first0 := '1'; v.no_ws := '0';
      if dmao.ready = '1' then v.state := write2; end if;
    when write2 =>
      vdmai.start := '1'; bufloc := 1;
      if (dmao.ready and dmao.start) = '1' then v.no_ws := '1'; end if;
      if (dmao.active or r.first0) = '0' then v.state := writeb; request := '1';
      elsif ahbso1.hresp = HRESP_RETRY then
        v.state := write3; v.first1 := '1'; v.first0 := '1'; rundma := not r.no_ws;
      elsif (dma_done and dmao.active) = '1' then v.state := write4; end if;
    when write3 =>
      rundma := '0';
      if ((r.htrans(1) and ahbso1.hready) = '1' and ahbso1.hresp = HRESP_OKAY) then
        v.state := write2; v.first0 := '1'; v.no_ws := '0';
      else request := '1'; end if;
    when write4 =>
      if (dmao.active = '0' and ahbso1.hresp = HRESP_OKAY) then v.state := turn;
      else request := not dmao.active; end if;
    when writeb =>
      v.state := write1;
    when turn =>
      v.ready := '1'; v.first1 := '1';
      v.start := '0'; v.state := idle;
    end case;


    if ((r.htrans(1) and ahbso1.hready) = '1' and ahbso1.hresp = HRESP_OKAY) then
      v.addr1 := r.addr1 + '1'; v.first1 := '0';
      if r.write = '0' then
        v.rbuf(bufloc) := ahbso1.hrdata;
      else data_transfer := '1'; end if;
    end if;

    if (dmao.ready and rundma) = '1' then
      v.addr0 := r.addr0 + '1'; v.first0 := '0';
      if r.write = '1' then v.rbuf(bufloc) := dmao.rdata;
      else data_transfer := '1'; end if;
    end if;

    if data_transfer = '1' then
      v.rbuf(0) := r.rbuf(1);
      if (r.write = '0' and bufloc = 2) then v.rbuf(1) := r.rbuf(2); end if;
      v.burstl := r.burstl - (not (dma_done and not r.burstl(0)));
    end if;

    v.htrans(0) := not (v.first1 or (dmao.ready and request));
    v.htrans(1) := (dmao.ready and hready) or request;

    if (ahbso1.hresp = HRESP_ERROR or (dmao.mexc or dmao.retry) = '1') then
      v.err := '1'; v.state := turn; v.htrans := HTRANS_IDLE;
    end if;



    if rst = '0' then
      v.state := idle;
      v.start := '0';
      v.write := '0';
      v.err := '0';
      v.ready := '0';
      v.first1 := '1';
      v.hmbsel := (others => '0');
      v.addr1 := (others => '0');
    end if;


    if r.start = '1' then
      ahbsi1.hsel <= (others => '1');
      ahbsi1.hmbsel(0 to 3) <= r.hmbsel;
      ahbsi1.hsize <= "010";
      ahbsi1.hwrite <= r.write;
      ahbsi1.htrans <= v.htrans;
      ahbsi1.haddr <= r.addr1 & "00";
      ahbsi1.hburst <= "001";
      ahbsi1.hwdata <= r.rbuf(0);
      ahbsi1.hready <= ahbso1.hready;
      ahbsi1.hmaster <= conv_std_logic_vector(hindex,4);
      ahbso0 <= slvbusy;
    else
      ahbsi1.hsel <= ahbsi0.hsel;
      ahbsi1.hmbsel(0 to 3) <= ahbsi0.hmbsel(0 to 3);
      ahbsi1.hsize <= ahbsi0.hsize;
      ahbsi1.hwrite <= ahbsi0.hwrite;
      ahbsi1.htrans <= ahbsi0.htrans;
      ahbsi1.haddr <= ahbsi0.haddr;
      ahbsi1.hburst <= ahbsi0.hburst;
      ahbsi1.hwdata <= ahbsi0.hwdata;
      ahbsi1.hready <= ahbsi0.hready;
      ahbsi1.hmaster <= ahbsi0.hmaster;
      ahbso0 <= ahbso1;
      v.state := idle;
    end if;

    dmai <= vdmai;
    rin <= v;
    apbo.pconfig <= pconfig;
    apbo.prdata <= pdata;
    apbo.pirq <= (others => '0');
    apbo.pindex <= pindex;
    ahbsi1.hirq <= (others => '0');
    ahbsi1.hprot <= (others => '0');
    ahbsi1.hmastlock <= '0';
    ahbsi1.hcache <= '0';

  end process;

  cpur : process (clk)
  begin
    if rising_edge (clk) then
      r <= rin;
    end if;
  end process;

  ahbmst0 : pciahbmst generic map (hindex => hindex, devid => GAISLER_DMACTRL, incaddr => 1)
  port map (rst, clk, dmai, dmao, ahbmi, ahbmo);

-- pragma translate_off
    bootmsg : report_version
    generic map ("dmactrl" & tost(pindex) &
	": 32-bit DMA controller & AHB/AHB bridge  rev " & tost(REVISION));
-- pragma translate_on

end;

