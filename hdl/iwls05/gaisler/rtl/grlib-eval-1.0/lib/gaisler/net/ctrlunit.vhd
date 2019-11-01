------------------------------------------------------------------------------
-- Entity: 	ctrlunit 
-- File:	ctrlunit.vhd
-- Author:     	Marko Isomaki
-- Description:	control unit for the ethernet debug interface
------------------------------------------------------------------------------
library ieee;
library grlib;
library gaisler;

use ieee.std_logic_1164.all;
use grlib.amba.all;
use ieee.numeric_std.all;

use gaisler.misc.all;
use gaisler.devices.all;
use gaisler.net.all;
use grlib.stdlib.all;

entity ctrlunit is
  generic (
    ahbndx     : integer := 0;
    ahbndx2    : integer := 1; 
    ahbndx3    : integer := 3; 
    memndx     : integer := 1;
    memaddr    : integer := 16#2000#; 
    macaddrh   : integer := 16#00007A#;
    macaddrl   : integer := 16#000000#;
    ipaddrh    : integer := 16#C0A8#;
    ipaddrl    : integer := 16#0032#;
    udpport    : integer := 10000;
    extip      : integer := 0;
    fullduplex : integer := 0;
    mdioenabled: integer := 0;
    autoneg    : integer := 0;
    speed      : integer := 0;
    phyrstcls  : integer := 100000;
    phyadr     : integer := 0;
    sim        : integer := 0);
  port(
    rst        : in  std_logic;
    clk        : in  std_logic;
    edcli      : in  edcl_in_type;
    ahbmi      : in  ahb_mst_in_type;
    ahbmo      : out ahb_mst_out_type;
    ahbmi_m    : in ahb_mst_in_type;
    ahbmo_m    : out ahb_mst_out_type;
    ahbmi_rt   : in ahb_mst_in_type;
    ahbmo_rt   : out ahb_mst_out_type
    );
end;

architecture rtl of ctrlunit is

type buffer_def is array (0 to 13) of natural;
type FIFO_buf_type is array (0 to 3) of std_logic_vector(31 downto 0);

constant win_block : buffer_def := (4, 256, 4, 512, 8, 512, 8, 1024,
                                    16, 1024, 32, 1024, 64, 1024);     
constant win_size : natural := win_block(2 * memndx);
constant block_size : natural := win_block(2 * memndx + 1);

type buf_type is array (0 to win_size - 1) of std_logic_vector(2 downto 0);  
type initmac_state_type is (idle, initrxbd, initrxbd2, waitphy, addrSel, addrSel2,
                            finished, setphy, setphy2, readdata, pollstat);
type arp_state_type is (idle, arp_1, arp_2, arp_3, finished);
type main_state_type is (idle, clr_int, clr_int2, wr_eth_adr, wr_eth_adr2, 
                         check_type, arp, check_ip, check_seq, app, udp, ip,
                         set_txbd, set_txbd2, upd_tx_offset, no_snd);
type ip_state_type is (idle, ip1, ip2, finished);
type udp_state_type is (idle, udp1, udp2, finished);
type app_state_type is (idle, app1, app2, app3, app4, app5, nak, finished);
type rx_tx_state_type is (init, idle, clrintw, clrintw2, 
                          clrintr, readint, updrxbd, updrxbd2);

type reg_type is record
  rx_offset     : natural range 0 to win_size - 1;
  rx2_offset    : natural range 0 to win_size - 1;
  tx_offset     : natural range 0 to win_size - 1;
  tx2_offset    : natural range 0 to win_size - 1;
  tx3_offset    : natural range 0 to win_size - 1;
  baseadr       : std_logic_vector(31 downto 0);
  readbuf       : std_logic_vector(31 downto 0);
  readbuf2      : std_logic_vector(31 downto 0);
  readbuf3      : std_logic_vector(3 downto 0);
  ipid          : natural range 0 to 65535;   
  ipchksum      : std_logic_vector(19 downto 0);
  counter       : natural range 0 to 127;
  counter2      : natural range 0 to 127;
  rcv_nxt       : std_logic_vector(13 downto 0);
  read_stat     : std_logic_vector(win_size - 1 downto 0);
  write_stat    : std_logic_vector(win_size - 1 downto 0);
  no_snd        : std_logic_vector(win_size - 1 downto 0);
  read_error    : std_logic_vector(win_size - 1 downto 0);
  app_layer_size: natural range 0 to 1024;                
  arp_state     : arp_state_type;
  app_addr      : std_logic_vector(31 downto 0);
  app_length    : std_logic_vector(9 downto 0);
  arp_bad_ip    : std_logic;
  arp           : std_logic;
  nak           : std_logic;
  main_state    : main_state_type;
  rx_tx_state   : rx_tx_state_type;
  initmacstate  : initmac_state_type;
  ip_state      : ip_state_type;
  udp_state     : udp_state_type;
  app_state     : app_state_type;
  app_write     : std_logic;
  dmao          : ahb_dma_in_type;
  dmao_m        : ahb_dma_in_type;
  dmao_rt       : ahb_dma_in_type;
  fifo_buf      : FIFO_buf_type;
  fifo_count    : std_logic_vector(2 downto 0);  
  m0counter     : natural range 0 to 255;
  m1counter     : natural range 0 to 255;
  laddr2        : std_logic_vector(15 downto 0);
  resetcounter  : std_logic_vector(31 downto 0);
end record;

constant ethadr  : std_logic_vector(47 downto 0) := conv_std_logic_vector(macaddrh, 24) & 
                                                     conv_std_logic_vector(macaddrl, 24);
constant ipadr   : std_logic_vector(31 downto 0) := conv_std_logic_vector(ipaddrh, 16) &
                                                     conv_std_logic_vector(ipaddrl, 16);
constant ram_addr : std_logic_vector(31 downto 0) := conv_std_logic_vector(memaddr, 16) &
                                                     "0000000000000000";                    
constant port_nbr : std_logic_vector(15 downto 0) := conv_std_logic_vector(udpport, 16);                                        

signal   ip_adr  : std_logic_vector(31 downto 0); 
signal   eth_adr  : std_logic_vector(47 downto 0);
signal   iptemp1 : std_logic_vector(19 downto 0);
signal   iptemp2 : std_logic_vector(19 downto 0);
constant iptemp3 : std_logic_vector(19 downto 0):="00000100010100000000";

signal r,rin        : reg_type;
signal dmaout       : ahb_dma_in_type;
signal dmain        : ahb_dma_out_type;
signal dmaout_m     : ahb_dma_in_type;
signal dmain_m      : ahb_dma_out_type;
signal dmain_rt     : ahb_dma_out_type;
signal dmaout_rt    : ahb_dma_in_type;

begin

  eip0 : if extip /= 0 generate
    ip_adr <= ipadr(31 downto 4) & edcli.lsbip; 
    eth_adr <= ethadr(47 downto 4) & edcli.lsbip;
  end generate;

  eip1 : if extip = 0 generate
    ip_adr <= ipadr; eth_adr <= ethadr;
  end generate;
  
  iptemp1 <= "0000" & ip_adr(31 downto 16);
  iptemp2 <= "0000" & ip_adr(15 downto 0);

  
  a0 : ahbmst 
  generic map (hindex => ahbndx, venid => VENDOR_GAISLER, 
               devid => GAISLER_DSUCTRL, incaddr => 1)
  port map(rst => rst, clk => clk, dmai => dmaout, 
           dmao => dmain, ahbi => ahbmi,ahbo => ahbmo);
       
  a1 : ahbmst 
  generic map(hindex => ahbndx2, venid => VENDOR_GAISLER,
              devid => GAISLER_DSUCTRL, incaddr => 1)
  port map(rst => rst,clk => clk, dmai => dmaout_m, 
           dmao => dmain_m, ahbi => ahbmi_m, ahbo => ahbmo_m);

  a2 : ahbmst
  generic map(hindex => ahbndx3, venid => VENDOR_GAISLER, 
              devid => GAISLER_DSUCTRL, incaddr => 1)
  port map(rst => rst, clk => clk, dmai => dmaout_rt,
           dmao => dmain_rt, ahbi => ahbmi_rt, ahbo => ahbmo_rt);
          
  comb : process(r, dmain, ahbmi, dmain_m, ahbmi_rt, dmain_rt, rst,
		 ip_adr, eth_adr, iptemp1, iptemp2)
    variable v            : reg_type;
    variable start        : std_logic;
    variable mstart       : std_logic;
    variable rtstart      : std_logic;
    variable haddr, laddr : std_logic_vector(15 downto 0);
    begin
    v := r;
    start := '0'; mstart := '0'; rtstart := '0';
--------------------------------------------------------------------------------   
--MAIN FSM
--------------------------------------------------------------------------------   
    case r.main_state is
    when idle =>  
      if r.read_stat(r.tx_offset) = '1' then
        v.read_stat(r.tx_offset) := '0';
        v.dmao.address := r.baseadr(31 downto 6) & "001100"; 
        v.dmao.size := "01"; v.dmao.write := '0';
        if r.read_error(r.tx_offset) = '1' then
          v.read_error(r.tx_offset) := '0'; v.main_state := no_snd;  
        else 
          v.main_state := check_type; 
        end if;
      end if;
      v.nak := '0'; v.arp := '0'; v.arp_bad_ip := '0';
    when check_type =>
      start := '1';
      if dmain.ready = '1' then
        start := '0';
        if dmain.rdata(23 downto 16) = X"06" then v.main_state := arp;      
        else v.main_state := check_ip; end if;
      end if;
    when arp =>
      if r.arp_state = finished then 
        v.arp := '1';
        if r.arp_bad_ip = '1' then v.main_state := no_snd; 
        else v.main_state := wr_eth_adr; end if; 
      end if;
    when check_ip =>
      case r.counter is
      when 0 => 
        v.dmao.address := r.baseadr(31 downto 6) & "011110"; 
        v.counter := r.counter + 1;
      when 1 => 
        start := '1';
        if dmain.ready = '1' then 
          start := '0'; v.readbuf(31 downto 16) := dmain.rdata(15 downto 0); 
          v.dmao.address := r.baseadr(31 downto 6) & "100000"; 
          v.counter := r.counter + 1;
        end if;
      when 2 =>  
         start := '1';
         if dmain.ready = '1' then 
           start := '0';  v.counter := 0; 
           v.readbuf(15 downto 0) := dmain.rdata(31 downto 16); 
           if v.readbuf = ip_adr then 
             v.main_state := check_seq; v.dmao.size := "10";  
             v.dmao.address := r.baseadr(31 downto 6) & "101100"; 
           else 
             v.main_state:=no_snd; 
           end if;
         end if;
       when others => null;
       end case;
     when check_seq =>  
       start := '1';
       if dmain.ready = '1' then
         start := '0';
         if dmain.rdata(31 downto 18) /= r.rcv_nxt then v.nak := '1'; 
         else v.rcv_nxt := r.rcv_nxt + 1; end if;
         v.main_state := app;                  
       end if;
     when app => 
       if r.app_state = finished then v.main_state := udp; end if;
     when udp => if r.udp_state = finished then v.main_state := ip; end if;
     when ip =>  if r.ip_state = finished then  v.main_state := wr_eth_adr; end if;
     when wr_eth_adr =>
       if r.counter < 7 then
         case r.counter is
         when 0 => 
           v.dmao.address := r.baseadr(31 downto 6) & "001000"; 
           v.dmao.write := '0'; v.dmao.size := "10";
         when 1 => 
           v.dmao.address := r.baseadr(31 downto 6) & "000100"; v.dmao.write := '1'; 
           v.dmao.size := "01"; v.dmao.wdata(31 downto 16) := r.readbuf(15 downto 0);
         when 2 =>  
           v.dmao.address := r.baseadr(31 downto 6) & "000010"; 
           v.dmao.wdata(15 downto 0) := r.readbuf(31 downto 16);     
         when 3 => 
           v.dmao.address := r.baseadr(31 downto 6) & "000110"; v.dmao.write := '0'; 
         when 4 => 
           v.dmao.address := r.baseadr; v.dmao.write := '1'; 
           v.dmao.wdata(31 downto 16) := r.readbuf(15 downto 0);
         when 5 =>
           v.dmao.address := r.baseadr(31 downto 6) & "000110"; 
           v.dmao.wdata(15 downto 0) := eth_adr(47 downto 32);
         when 6 =>  
           v.dmao.address := r.baseadr(31 downto 6) & "001000"; 
           v.dmao.size := "10";  v.dmao.wdata := eth_adr(31 downto 0);
         when others => null;
         end case;
         v.main_state := wr_eth_adr2;
       else
         v.counter := 0;  v.main_state := set_txbd;  v.no_snd(r.tx_offset) := '0'; 
         v.dmao.address := X"FFF01404" + r.tx2_offset * 8; v.dmao.wdata := r.baseadr;
       end if;
     when wr_eth_adr2 => 
       start := '1';
       if dmain.ready = '1' then
         start := '0';  v.main_state := wr_eth_adr;
         if r.dmao.write = '0' then v.readbuf := dmain.rdata; end if;
         v.counter := r.counter + 1;
       end if;
     when set_txbd =>  
       start := '1';
       if dmain.ready = '1' then 
         start := '0'; v.main_state := set_txbd2; 
         if r.tx2_offset = win_size - 1 then laddr := X"F800";
         else laddr := X"D800"; end if; 
         if r.arp = '1' then haddr := X"002A";
         elsif r.nak = '1' then haddr := X"0030";
         else haddr := conv_std_logic_vector(r.app_layer_size + 52, 16); end if;
         v.dmao.address := r.dmao.address - 4; v.dmao.wdata := haddr & laddr;
       end if;
     when set_txbd2 => 
       start := '1';
       if dmain.ready = '1' then
         start := '0'; v.main_state := upd_tx_offset; 
         if r.tx2_offset < win_size - 1 then v.tx2_offset := r.tx2_offset + 1;
         else v.tx2_offset := 0; end if; 
       end if;
     when no_snd => v.main_state := upd_tx_offset; v.write_stat(r.tx_offset) := '0';
     when upd_tx_offset =>
       if r.tx_offset < win_size - 1 then v.tx_offset := r.tx_offset + 1;
       else v.tx_offset := 0; end if;
       v.main_state := idle; v.baseadr := ram_addr + v.tx_offset * block_size;
     when others => null;
     end case; 

--------------------------------------------------------------------------------   
--RX_TX FSM 
--------------------------------------------------------------------------------  
    case r.rx_tx_state is
    when init => 
      if r.initmacstate = finished then v.rx_tx_state := idle; end if;
    when idle => 
      if r.write_stat(r.rx_offset) = '0' then
        v.rx_tx_state := updrxbd; 
        v.dmao_rt.address := X"FFF01604" + r.rx_offset * 8;  
        v.dmao_rt.wdata := ram_addr + r.rx_offset * block_size;
        v.dmao_rt.write := '1';
      elsif ahbmi_rt.hirq(11) = '1' then
		    v.rx_tx_state := readint; v.dmao_rt.address := X"FFF01004"; v.dmao_rt.write := '0'; 
      end if;
    when readint =>
      rtstart := '1';
      if dmain_rt.ready = '1' then
        rtstart := '0'; v.readbuf3 := dmain_rt.rdata(3 downto 0);
        if dmain_rt.rdata(0) = '1' or dmain_rt.rdata(1) = '1' then 
          v.rx_tx_state := clrintw; v.dmao_rt.wdata := X"00000003"; 
        else 
          v.rx_tx_state := clrintr; v.dmao_rt.wdata := X"0000000C";
        end if;
          v.dmao_rt.write := '1';
      end if;
    when clrintr => 
      if r.readbuf3(3) = '1' then v.read_error(r.rx2_offset) := '1'; end if;
        rtstart := '1';
        if dmain_rt.ready = '1' then
          v.read_stat(r.rx2_offset) := '1';
          v.rx_tx_state := idle; rtstart := '0'; 
          if r.rx2_offset < win_size - 1 then v.rx2_offset := r.rx2_offset + 1;
          else v.rx2_offset := 0; end if;
        end if;
    when clrintw => 
      rtstart := '1';
      if dmain_rt.ready = '1' then 
        rtstart := '0';  v.rx_tx_state := clrintw2; 
      end if; 
    when clrintw2=> 
      if r.no_snd(r.tx3_offset) = '0' then 
        v.no_snd(r.tx3_offset) := '1'; v.write_stat(r.tx3_offset) := '0'; v.rx_tx_state := idle; 
      end if;
      if v.tx3_offset < win_size - 1 then v.tx3_offset := r.tx3_offset + 1;
      else v.tx3_offset := 0; end if; 
    when updrxbd => 
      rtstart := '1';
      if dmain_rt.ready = '1' then 
        rtstart := '0';
        v.dmao_rt.address := r.dmao_rt.address - 4; v.dmao_rt.wdata := X"0000" & r.laddr2;
        v.write_stat(r.rx_offset) := '1';
        v.rx_tx_state := updrxbd2; 
      end if;
    when updrxbd2 =>
      rtstart := '1';
      if dmain_rt.ready = '1' then 
        rtstart := '0';
        v.rx_tx_state := idle;
        if r.rx_offset < win_size - 1 then v.rx_offset := r.rx_offset + 1;
        else v.rx_offset := 0; end if;
      end if;
      if r.rx_offset = win_size - 2 then v.laddr2 := X"E000"; 
      else v.laddr2 := X"C000"; end if;
    when others => null;
    end case;
--------------------------------------------------------------------------------    
--APP LAYER FSM
--------------------------------------------------------------------------------  
    case r.app_state is
    when idle =>  
      if r.main_state = app then 
        v.app_state := app1; 
        v.dmao.address := r.baseadr(31 downto 6) & "101100";  v.dmao.write := '0';  v.dmao.size := "10";  
      end if;
    when app1 =>  
      start := '1';
      if dmain.ready = '1' then   
        v.app_state := app2;  v.readbuf := dmain.rdata;  start := '0'; 
        v.app_layer_size := conv_integer(dmain.rdata(16 downto 7));
      end if;
    when app2 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "101100"; v.dmao.write := '1'; v.dmao.size := "10"; 
      if r.nak = '1' then 
        v.app_state := nak; 
        v.dmao.wdata := r.rcv_nxt & '1' & r.readbuf(16 downto 0); 
      else
        v.app_state := app3; 
        v.dmao.wdata(31 downto 17) := r.readbuf(31 downto 18) & '0';
        if r.readbuf(17) = '1' then 
          v.dmao.wdata(16 downto 0) := "0000000000" & r.readbuf(6 downto 0);
          v.app_layer_size := 0;     
        else 
          v.dmao.wdata(16 downto 0) := r.readbuf(16 downto 0);  
        end if;
      end if; 
    when nak => 
      start := '1'; v.app_layer_size := 0; 
      if dmain.ready = '1' then start := '0'; v.app_state := finished;  end if;
    when app3 => 
      start := '1';
      if dmain.ready = '1' then
        start := '0';  v.app_state := app4; 
        if r.dmao.write = '0' then v.readbuf := dmain.rdata; end if;
      end if;  
    when app4 => 
      if r.counter < 1 then v.app_state := app3;  v.counter := r.counter + 1;
        v.dmao.address := r.baseadr(31 downto 6) & "110000";  
        v.dmao.write := '0';  v.dmao.size := "10"; 
        v.app_write := r.readbuf(17);  v.app_length := "00" & r.readbuf(16 downto 9);                            
      else 
        v.app_addr := r.readbuf; v.app_state := app5;  v.counter := 0;    
   	    v.dmao.size := "10"; v.dmao.address := r.baseadr + 52; 
        v.dmao.write := not r.app_write; v.dmao.burst := '1';
        v.dmao_m.size := "10"; v.dmao_m.burst := '1'; 
        v.dmao_m.address := v.app_addr; v.dmao_m.write := r.app_write;
      end if;
        v.m0counter := 0; v.m1counter := 0; v.fifo_count := "000"; 
    when app5 =>  
      if r.m0counter >= unsigned(r.app_length) and r.m1counter >= unsigned(r.app_length) then
        v.app_state := finished;
      end if;
    when finished =>  if r.main_state /= app then  v.app_state := idle; end if;
    when others =>  v.app_state := idle;                           
    end case;
    
--------------------------------------------------------------------------------   
--AHB BRIDGE
--------------------------------------------------------------------------------          
   if r.app_state = app5 then
     
     if dmain.ready = '1' then 
       v.m0counter := r.m0counter + 1; v.dmao.address := r.dmao.address + 4; 
     end if;
        
     if dmain_m.ready = '1' then 
       v.m1counter := r.m1counter + 1; v.dmao_m.address := r.dmao_m.address + 4; 
     end if;
          
     start := '1';  mstart := '1';
               
     if r.app_write = '1' then
       if dmain_m.ready = '1' then 
         v.fifo_buf(0 to 2) := r.fifo_buf(1 to 3); v.fifo_count := v.fifo_count - 1; 
       end if;
       if dmain.ready = '1' then 
         v.fifo_buf(conv_integer(v.fifo_count)) := dmain.rdata; v.fifo_count := v.fifo_count + 1;
       end if;
       if unsigned(v.fifo_count) = 0 then mstart := '0'; end if;
       if unsigned(v.fifo_count) = 4 then start := '0'; end if;
     else
       if dmain.ready = '1' then 
         v.fifo_buf(0 to 2) := r.fifo_buf(1 to 3); v.fifo_count := v.fifo_count - 1; 
       end if;
       if dmain_m.ready = '1' then 
         v.fifo_buf(conv_integer(v.fifo_count)) := dmain_m.rdata; v.fifo_count := v.fifo_count + 1; 
       end if;
       if unsigned(v.fifo_count) = 4 then mstart := '0'; end if;
       if unsigned(v.fifo_count) = 0 then start := '0'; end if;
     end if;
        
      v.dmao.wdata := v.fifo_buf(0);
      v.dmao_m.wdata := v.fifo_buf(0);       
                     
      if dmain.ready = '1' and r.dmao.address(9 downto 0) = "1111111100" then
        start := '0';
      end if;
        
      if dmain_m.ready = '1' and r.dmao_m.address(9 downto 0) = "1111111100" then
        mstart := '0';
      end if;
        
      if r.m0counter = unsigned(r.app_length) - 1 and dmain.ready = '1' then start := '0'; end if;
      if r.m1counter = unsigned(r.app_length) - 1 and dmain_m.ready = '1' then mstart := '0'; end if;
      
      if r.m0counter >= unsigned(r.app_length) then start := '0'; end if; 
      if r.m1counter >= unsigned(r.app_length) then mstart := '0'; end if;
   end if;
--------------------------------------------------------------------------------   
--UDP FSM
--------------------------------------------------------------------------------
  case r.udp_state is
  when idle => 
    if r.main_state = udp then
      v.udp_state := udp1; v.dmao.address := r.baseadr(31 downto 6) & "101000";  v.dmao.write := '1';  
      v.dmao.size := "10";  v.dmao.wdata := X"00000000";  
    end if;
  when udp1 => 
    start := '1';
    if dmain.ready = '1' then
      start := '0';  v.udp_state := udp2;  
      if r.dmao.write = '0' then v.readbuf := dmain.rdata; end if;
    end if;    
  when udp2 =>
    if r.counter < 4 then v.udp_state := udp1;  v.counter := r.counter + 1; 
    else v.udp_state := finished; v.counter := 0; end if;
    case r.counter is
    when 0 =>  v.dmao.address := r.baseadr(31 downto 6) & "100110";  
               v.dmao.size:="01"; v.dmao.write := '1';  
               v.dmao.wdata(15 downto 0):=conv_std_logic_vector(18+r.app_layer_size,16);
    when 1 =>  v.dmao.address := r.baseadr(31 downto 6) & "100010"; 
               v.dmao.write := '0';  v.dmao.size:="01";  
    when 2 =>  v.dmao.address := r.baseadr(31 downto 6) & "100100";  
               v.dmao.write := '1';  v.dmao.size := "01";  
               v.dmao.wdata(31 downto 16) := r.readbuf(15 downto 0);
    when 3 =>  v.dmao.address := r.baseadr(31 downto 6) & "100010";  
               v.dmao.write := '1';  v.dmao.size := "01"; 
               v.dmao.wdata(15 downto 0) := port_nbr;
    when others => null;
    end case;
  when finished => if r.main_state /= udp then v.udp_state := idle; end if; 
  end case;    
--------------------------------------------------------------------------------    
--IP FSM 
-------------------------------------------------------------------------------- 
  case r.ip_state is
  when idle => 
    if r.main_state = ip then 
      v.ip_state := ip1; v.dmao.address := r.baseadr(31 downto 6) & "010000";  
      v.dmao.write := '1';  v.dmao.size := "10"; 
      v.dmao.wdata := conv_std_logic_vector(r.app_layer_size + 38, 16) &
                      conv_std_logic_vector(r.ipid, 16);           
      v.ipchksum:=r.ipchksum + conv_std_logic_vector(r.ipid, 16) +
                  conv_std_logic_vector(r.app_layer_size + 38, 16);  
    end if;  
  when ip1 =>  
    start := '1';
    if dmain.ready = '1' then
      start := '0';  v.ip_state := ip2;  
      if r.dmao.write = '0' then v.readbuf2 := dmain.rdata; end if;
    end if; 
  when ip2 => 
    if r.counter2 < 11 then 
      v.ip_state := ip1; v.counter2 := r.counter2 + 1;
    else 
      v.ip_state := finished; v.counter2 := 0; 
      v.ipchksum := iptemp1 + iptemp2 + iptemp3; v.ipid := r.ipid + 1; 
    end if;
    case r.counter2 is
    when 0 => 
      v.dmao.address := r.baseadr(31 downto 6) & "010110"; 
      v.dmao.write := '1';  v.dmao.size := "00"; 
      v.dmao.wdata(15 downto 8) := conv_std_logic_vector(64, 8);        
    when 1 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "010100";  v.dmao.write := '1';  
      v.dmao.size := "01";  v.dmao.wdata(31 downto 16) := X"0000";    
    when 2 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "011010"; 
      v.dmao.write := '0';  v.dmao.size := "01";                                          
    when 3 =>  
      v.dmao.address:=r.baseadr(31 downto 6) & "011110";  
      v.dmao.write := '1';  v.dmao.size := "01";  
      v.dmao.wdata(15 downto 0) := r.readbuf2(15 downto 0);
      v.ipchksum := r.ipchksum + r.readbuf2(15 downto 0); 
    when 4 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "011100"; 
      v.dmao.write := '0'; v.dmao.size := "01"; 
    when 5 => 
      v.dmao.address := r.baseadr(31 downto 6) & "100000"; 
      v.dmao.write := '1'; v.dmao.size := "01"; 
      v.dmao.wdata(31 downto 16) := r.readbuf2(31 downto 16); 
      v.ipchksum := r.ipchksum + r.readbuf2(31 downto 16);
    when 6 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "010110";  
      v.dmao.write := '0'; v.dmao.size := "01";  
    when 7 =>  
      v.ipchksum := r.ipchksum + r.readbuf2(15 downto 0);
    when 8 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "011010"; 
      v.dmao.write := '1';  v.dmao.size := "01";  
      v.dmao.wdata(15 downto 0) := ip_adr(31 downto 16);
      v.ipchksum := "0000" & r.ipchksum(15 downto 0) + r.ipchksum(19 downto 16);                                                          
    when 9 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "011100";  
      v.dmao.write := '1'; v.dmao.size := "01";  v.dmao.wdata(31 downto 16) := ip_adr(15 downto 0);
      v.ipchksum := "0000" & not (r.ipchksum(15 downto 0) + r.ipchksum(16));
    when 10 => 
      v.dmao.address := r.baseadr(31 downto 6) & "011000";  
      v.dmao.write := '1';  v.dmao.size := "01";  
      v.dmao.wdata(31 downto 16) := r.ipchksum(15 downto 0);
    when others => null;
    end case; 
  when finished =>  if r.main_state /= ip then v.ip_state := idle; end if; 
  when others => v.ip_state := idle;
  end case;
--------------------------------------------------------------------------------    
--ARP FSM
--------------------------------------------------------------------------------    
  case r.arp_state is
  when idle => 
    if v.main_state = arp then 
      v.arp_state := arp_1; v.dmao.address := r.baseadr(31 downto 6) & "100110";
      v.dmao.write := '0'; v.dmao.size := "01"; end if;
  when arp_1 =>
    case r.counter2 is 
    when 0 => start := '1';
      if dmain.ready = '1' then 
        start := '0';  v.readbuf2(31 downto 16) := dmain.rdata(15 downto 0);
        v.counter2 := r.counter2 + 1;  
        v.dmao.address := r.baseadr(31 downto 6) & "101000";
        v.dmao.write := '0'; v.dmao.size := "01"; 
      end if; 
    when 1 =>
      start := '1';       
      if dmain.ready = '1' then
      	start := '0';  v.readbuf2(15 downto 0) := dmain.rdata(31 downto 16);
        v.counter2 := r.counter2 + 1;  
      end if;
    when 2 =>
      if r.readbuf2 = ip_adr then  v.arp_state := arp_2; 
      else v.arp_state := finished; v.arp_bad_ip := '1'; end if;
      v.counter2 := 0;
    when others =>  null;
    end case;
  when arp_2 =>
    case r.counter2 is
    when 0 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "010100";  
      v.dmao.write := '1';  v.dmao.size := "01";  v.dmao.wdata(31 downto 16) := X"0002";
    when 1 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "010110";  
      v.dmao.write := '0';  v.dmao.size := "01";                                                          
    when 2 =>
      v.dmao.address := r.baseadr(31 downto 6) & "100000";
      v.dmao.write := '1';  v.dmao.size := "01";  
      v.dmao.wdata(31 downto 16) := r.readbuf2(15 downto 0);
    when 3 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "011000"; 
      v.dmao.write := '0';  v.dmao.size := "10";
    when 4 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "100010";  
      v.dmao.write := '1';  v.dmao.size := "01";  
      v.dmao.wdata(15 downto 0) := r.readbuf2(31 downto 16);
    when 5 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "100100"; 
      v.dmao.write := '1';  v.dmao.size := "01"; 
      v.dmao.wdata(31 downto 16) := r.readbuf2(15 downto 0); 
    when 6 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "011100";  
      v.dmao.write := '0';  v.dmao.size := "10";
    when 7 => 
      v.dmao.address := r.baseadr(31 downto 6) & "100110"; 
      v.dmao.write := '1';  v.dmao.size := "01"; 
      v.dmao.wdata(15 downto 0) := r.readbuf2(31 downto 16);
    when 8 => 
      v.dmao.address := r.baseadr(31 downto 6) & "101000"; 
      v.dmao.write := '1';  v.dmao.size := "01";  
      v.dmao.wdata(31 downto 16) := r.readbuf2(15 downto 0); 
    when 9 =>  
      v.dmao.address := r.baseadr(31 downto 6) & "011100"; 
      v.dmao.write := '1';  v.dmao.size := "10";  v.dmao.wdata := ip_adr;                               
    when 10 =>
      v.dmao.address := r.baseadr(31 downto 6) & "011000"; 
      v.dmao.write := '1';  v.dmao.size := "10";  v.dmao.wdata := eth_adr(31 downto 0);
    when 11 =>
      v.dmao.address := r.baseadr(31 downto 6) & "010110";  
      v.dmao.write := '1';  v.dmao.size := "01";  
      v.dmao.wdata(15 downto 0):=eth_adr(47 downto 32);    
    when others => null;   
    end case;
    if r.counter2 < 12 then  v.counter2 := r.counter2 + 1;  v.arp_state := arp_3;     
    else  v.counter2 := 0;  v.arp_state := finished;  end if;
  when arp_3 =>
    start := '1';
    if dmain.ready = '1' then
      start := '0';  v.arp_state := arp_2;
      if r.dmao.write = '0' then v.readbuf2 := dmain.rdata; end if;
    end if;   
  when finished => if r.main_state /= arp then v.arp_state := idle; end if;       
  end case; 
--------------------------------------------------------------------------------   
--MAC INITIALIZATION
--------------------------------------------------------------------------------       
    case r.initmacstate is
    when idle => 
      if mdioenabled = 0 and autoneg = 1 then 
        v.initmacstate := addrSel; v.dmao.size := "10"; v.dmao.write := '1';
        v.dmao.address := X"FFF01018";  
        v.dmao.wdata := X"0040" & conv_std_logic_vector(block_size, 16);
      else 
        v.initmacstate := waitphy;
	-- pragma translate_off
	if sim = 1 then v.initmacstate := setphy; end if; 
	-- pragma translate_on
      end if;                         
    when waitphy => 
      if unsigned(r.resetcounter) < phyrstcls then 
        v.resetcounter := r.resetcounter + 1;
      else 
        v.resetcounter := (others => '0'); 
        v.initmacstate := setphy; 
      end if;
    when setphy => 
      if autoneg = 1 then
        case r.counter2 is
        when 0 =>
          v.dmao.address := X"FFF01030"; v.dmao.size := "10"; v.dmao.write := '1';
          v.dmao.wdata := X"000000" & conv_std_logic_vector(phyadr,8);    
          v.initmacstate := setphy2;
        when 1 =>     
          v.dmao.address := X"FFF0102C"; v.dmao.size := "10"; v.dmao.write := '1';
          v.dmao.wdata := X"00000002"; v.initmacstate := setphy2;
        when 2 => 
          v.dmao.address := X"FFF0103C"; v.dmao.size := "10"; v.dmao.write := '0'; 
          v.initmacstate := pollstat; v.counter2 := 0;
        when others => null;
        end case;
      else 
        case r.counter2 is
        when 0 =>
          v.dmao.address := X"FFF01030"; v.dmao.size := "10"; v.dmao.write := '1';
          v.dmao.wdata := X"000000" & conv_std_logic_vector(phyadr,8);    
          v.initmacstate := setphy2;
        when 1 => 
          v.dmao.address := X"FFF01034"; v.dmao.size := "10"; v.dmao.write := '1'; 
          v.initmacstate := setphy2; 
          if speed = 1 and fullduplex = 1 then v.dmao.wdata := X"00002100"; 
          elsif speed = 1 and fullduplex = 0 then v.dmao.wdata := X"00002000";
          elsif speed = 0 and fullduplex = 1 then v.dmao.wdata := X"00000100";
          else v.dmao.wdata := X"00000000"; end if;
        when 2 =>     
          v.dmao.address := X"FFF0102C"; v.dmao.size := "10"; v.dmao.write := '1';
          v.dmao.wdata := X"00000004"; v.initmacstate := setphy2;
        when 3 => 
          v.initmacstate := addrSel; v.dmao.address := X"FFF01018"; v.counter2 := 0;
          v.dmao.wdata := X"0040" & conv_std_logic_vector(block_size, 16);
        when others => null;
        end case;
      end if;
    when setphy2 => 
      start := '1';
      if dmain.ready = '1' then 
        v.initmacstate := setphy; start := '0'; v.counter2 := r.counter2 + 1; 
      end if;   
    when pollstat =>
      start := '1'; 
      if dmain.ready = '1' and dmain.rdata(1) = '0' then 
        start := '0'; v.initmacstate := readdata; v.dmao.address := X"FFF01038";
      end if;
    when readdata =>
      start := '1'; 
      if dmain.ready = '1' then 
        v.readbuf2 := dmain.rdata; start := '0'; v.initmacstate := addrSel; 
        v.dmao.address := X"FFF01018"; v.dmao.write := '1';
        v.dmao.wdata := X"0040" & conv_std_logic_vector(block_size, 16);
      end if; 
    when addrSel =>
      start := '1';  
      if dmain.ready = '1' then  v.initmacstate := addrSel2;  start := '0'; end if;
    when addrSel2 => 
      if r.counter2 < 4 then  v.counter2 := r.counter2 + 1;  v.initmacstate := addrSel;
        case r.counter2 is
        when 0 => 
          v.dmao.address := X"FFF01008";  v.dmao.wdata := X"0000000F";                                    
        when 1 => 
          v.dmao.address := X"FFF01040";  v.dmao.wdata := eth_adr(31 downto 0);                          
        when 2 =>
          v.dmao.address := X"FFF01044";  v.dmao.wdata := X"0000" & eth_adr(47 downto 32);             
        when 3 => 
          v.dmao.address := X"FFF01000";    
          if autoneg = 1 and mdioenabled = 1 then
            if r.readbuf(2) = '1' then v.dmao.wdata := X"0000A403";
            else v.dmao.wdata := X"0000A003"; end if;
          else
            if fullduplex = 1 then v.dmao.wdata := X"0000A403";  
            else v.dmao.wdata := X"0000A003"; end if;
          end if;
	  -- pragma translate_off
	  if sim = 1 then v.dmao.wdata(6) := '1'; end if; 
	  -- pragma translate_on 
        when others => null;  
        end case;
      else 
        v.initmacstate := finished;  v.counter2 := 0; 
      end if;
    when finished => null;  
    when others => v.initmacstate := finished;
    end case;
    
    if rst = '0' then
      v.tx_offset := 0; v.tx2_offset := 0; v.rx_offset := 0; v.rx2_offset := 0; 
      v.tx3_offset := 0; v.baseadr := ram_addr; v.counter := 0; v.counter2 := 0;
      v.resetcounter := (others => '0'); v.laddr2 := X"C000"; v.ip_state := idle;
      v.arp_state := idle;   v.udp_state := idle; 
      v.app_state := idle;  v.initmacstate := idle; v.main_state := idle; 
      v.rx_tx_state := init; v.write_stat := (others => '0'); v.no_snd := (others => '1');
      v.read_stat := (others => '0'); v.read_error := (others => '0');
      -- pragma translate_off
      if sim = 1 then v.rcv_nxt := (others => '0'); end if; 
      -- pragma translate_on
    end if;
-------------------------------------------------------------------------------   
--SIGNAL ASSIGNMENTS
-------------------------------------------------------------------------------         
    rin <= v;
    dmaout.address <= r.dmao.address;
    dmaout.wdata <= r.dmao.wdata;
    dmaout.start <= start;
    dmaout.burst <=r.dmao.burst;
    dmaout.write <= r.dmao.write;
    dmaout.busy <= r.dmao.busy;
    dmaout.irq <= r.dmao.irq;
    dmaout.size <= r.dmao.size;
    
    dmaout_m.address <= r.dmao_m.address;
    dmaout_m.wdata <= r.dmao_m.wdata;
    dmaout_m.start <= mstart;
    dmaout_m.burst <= r.dmao_m.burst;
    dmaout_m.write <= r.dmao_m.write;
    dmaout_m.busy <= r.dmao_m.busy;
    dmaout_m.irq <= r.dmao_m.irq;
    dmaout_m.size <= r.dmao_m.size;
    
    dmaout_rt.address <= r.dmao_rt.address;
    dmaout_rt.wdata <= r.dmao_rt.wdata;
    dmaout_rt.start <= rtstart;
    dmaout_rt.burst <= r.dmao_rt.burst;
    dmaout_rt.write <= r.dmao_rt.write;
    dmaout_rt.busy <= r.dmao_rt.busy;
    dmaout_rt.irq <= r.dmao_rt.irq;
    dmaout_rt.size <= r.dmao_rt.size;
    
    end process;
--------------------------------------------------------------------------------   
--REGISTERS
--------------------------------------------------------------------------------
    reg0: process(rst,clk)
    begin if rising_edge(clk) then r<=rin; end if; end process;
end;
