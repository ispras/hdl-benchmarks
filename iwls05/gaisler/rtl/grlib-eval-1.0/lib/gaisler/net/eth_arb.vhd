-----------------------------------------------------------------------------
-- Entity:      eth_arb
-- File:        eth_arb.vhd
-- Author:      Marko Isomaki
-- Description: Arbiter for two Ethernet MAC:s using one PHY
------------------------------------------------------------------------------  
library ieee;
library gaisler;

use ieee.std_logic_1164.all;
use gaisler.net.all;

entity eth_arb is 
  generic(
    fullduplex : integer := 0;
    mdiomaster : integer := 0);
    port(
      rst   : in std_logic;
      clk   : in std_logic; 
      ethi  : in eth_in_type;
      etho  : out eth_out_type;
      methi : in eth_out_type;
      metho : out eth_in_type; 
      dethi : in eth_out_type;
      detho : out eth_in_type
      );
end;

architecture rtl of eth_arb is 

type state_type is (reset,mainh,debugh,mt,dt,mainf,debugf);

type buf_elem is record 
  tx_en : std_logic;
  tx_er : std_logic;
  txd   : std_logic_vector(3 downto 0);
end record;

type fifo_buf_type is array (0 to 25) of buf_elem; 

type reg_type is record
  ifgcounter  : integer range 0 to 25;
  main_state  : state_type;
  fifo_buf    : fifo_buf_type;
end record;

signal r,rin : reg_type;
    
begin
       
  comb:process(r,methi,dethi,ethi,rst)
    variable v : reg_type;
    variable mcol, dcol, tx_en, tx_er : std_logic;
    variable txd : std_logic_vector(3 downto 0);
    begin
      v := r;
      tx_en := methi.tx_en; tx_er := methi.tx_er; txd := methi.txd;
      mcol := ethi.rx_col; dcol := dethi.tx_en;
      v.fifo_buf(1 to 25) := r.fifo_buf(0 to 24);
      case r.main_state is
      when reset => 
        if fullduplex=1 then v.main_state := mainf;
        else v.main_state := mainh; end if;
      --half duplex part
      when mainh =>
        if dethi.tx_en = '0' and methi.tx_en = '0' and ethi.rx_crs = '0' then  
          v.main_state:=mt; 
        end if; 
      when mt =>
        dcol := ethi.rx_col;
        if methi.tx_en = '1' then 
          v.main_state := mainh;
        elsif dethi.tx_en = '1' then 
          v.main_state := debugh;
          tx_en := dethi.tx_en; tx_er := dethi.tx_er; txd := dethi.txd;
        end if;
      when dt =>
        dcol := ethi.rx_col;
        tx_en := dethi.tx_en; tx_er := dethi.tx_er; txd := dethi.txd;
        if dethi.tx_en = '1' then
          v.main_state := debugh;
        elsif methi.tx_en = '1' then
          v.main_state := mainh;
          tx_en := methi.tx_en; tx_er := methi.tx_er; txd := methi.txd;
        end if;
      when debugh =>
        tx_en := dethi.tx_en; tx_er := dethi.tx_er; txd := dethi.txd; 
        dcol := ethi.rx_col; mcol := methi.tx_en;
        if methi.tx_en = '0' and dethi.tx_en = '0' and ethi.rx_crs = '0' then    
          v.main_state := dt;
        end if;
      --full duplex part 
      when mainf =>
        if methi.tx_en = '0' and dethi.tx_en = '1' then  
          v.main_state := debugf; v.ifgcounter := 25; 
          v.fifo_buf(0).tx_en := dethi.tx_en;  v.fifo_buf(0).tx_er := dethi.tx_er; 
          v.fifo_buf(0).txd := dethi.txd;
        end if;
        v.fifo_buf(0).tx_en := methi.tx_en;  v.fifo_buf(0).tx_er := methi.tx_er;  
        v.fifo_buf(0).txd := methi.txd;
      when debugf =>
        if methi.tx_en = '1' then  
          v.main_state := mainf;  v.ifgcounter := 25; 
          v.fifo_buf(0).tx_en := methi.tx_en;  v.fifo_buf(0).tx_er := methi.tx_er;  
          v.fifo_buf(0).txd := methi.txd;
        end if;                    
        v.fifo_buf(0).tx_en := dethi.tx_en;  v.fifo_buf(0).tx_er := dethi.tx_er;  
        v.fifo_buf(0).txd := dethi.txd;
      when others => null;
      end case;
            
      if fullduplex = 1 then
        if r.ifgcounter > 0 then 
          tx_en := '0'; tx_er := '0'; txd := (others=>'0');
        else 
          tx_en := r.fifo_buf(25).tx_en; tx_er := r.fifo_buf(25).tx_er; txd := r.fifo_buf(25).txd; 
        end if;
      end if; 
            
      if r.ifgcounter > 0 then
        v.ifgcounter := r.ifgcounter-1;
      end if;
                                                                    
      etho.tx_en <= tx_en; etho.tx_er <= tx_er; etho.txd <= txd;
      metho.rx_col <= mcol; detho.rx_col <= dcol; 
            
      detho.rx_clk <= ethi.rx_clk; detho.tx_clk <= ethi.tx_clk;
      metho.rx_clk <= ethi.rx_clk; metho.tx_clk <= ethi.tx_clk;
        
      detho.rxd <= ethi.rxd; detho.rx_dv <= ethi.rx_dv; detho.rx_er <= ethi.rx_er;
      metho.rxd <= ethi.rxd; metho.rx_dv <= ethi.rx_dv; metho.rx_er <= ethi.rx_er;
        
      metho.rx_crs <= ethi.rx_crs; detho.rx_crs <= ethi.rx_crs;
        
      if mdiomaster = 1 then
        etho.mdc <= methi.mdc;
        etho.mdio_o <= methi.mdio_o; etho.mdio_oe <= methi.mdio_oe;
        detho.mdio_i <= dethi.mdio_o; metho.mdio_i <= ethi.mdio_i;  
        etho.reset <= methi.reset; 
      else 
        etho.mdc <= dethi.mdc;
        etho.mdio_o <= dethi.mdio_o; etho.mdio_oe <= dethi.mdio_oe;
        metho.mdio_i <= methi.mdio_o; detho.mdio_i <= ethi.mdio_i;
        etho.reset <= dethi.reset; 
      end if; 
      
      if rst = '0' then
        v.ifgcounter := 0; v.main_state := reset;
      end if;
                 
      rin <= v;
  end process;
        
  reg : process(clk) 
  begin if rising_edge(clk) then r <= rin; end if; end process;
end;

