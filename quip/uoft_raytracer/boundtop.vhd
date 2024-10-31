library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity boundtop is 
  port(
    triIDvalid : out std_logic;
    triID      : out std_logic_vector(15 downto 0);
    wanttriID  : in std_logic;
    raydata    : out std_logic_vector(31 downto 0);
    rayaddr    : out std_logic_vector(3 downto 0);
    raywe      : out std_logic_vector(2 downto 0);
    resultready : in std_logic;
    resultdata  : in std_logic_vector(31 downto 0);
    globalreset : out std_logic;

    want_braddr  : out std_logic;
    braddr_ready : in std_logic;
    braddrin     : in std_logic_vector(9 downto 0);
    want_brdata  : out std_logic;
    brdata_ready : in std_logic;
    brdatain     : in std_logic_vector(31 downto 0);

    want_addr2  : out std_logic;
    addr2_ready : in std_logic;
    addr2in     : in std_logic_vector(17 downto 0);
    want_data2  : out std_logic;
    data2_ready : in std_logic;
    data2in     : in std_logic_vector(63 downto 0);

    pglobalreset  : in std_logic;
    tm3_clk_v0    : in std_logic;
    tm3_sram_data : inout std_logic_vector(63 downto 0);
    tm3_sram_addr : out std_logic_vector(18 downto 0); 
    tm3_sram_we   : out std_logic_vector(7 downto 0);
    tm3_sram_oe   : out std_logic_vector(1 downto 0);
    tm3_sram_adsp : out std_logic;

    -- Bus Signals (To Ray Generator Unit) 
    raygroup01      : in std_logic_vector(1 downto 0);
    raygroupvalid01 : in std_logic;
    busy01          : out std_logic;
    raygroup10      : in std_logic_vector(1 downto 0);
    raygroupvalid10 : in std_logic;
    busy10          : out std_logic;
  
    rgData      : in std_logic_vector(31 downto 0);
    rgAddr      : in std_logic_vector(3 downto 0);
    rgWE        : in std_logic_vector(2 downto 0);
    rgAddrValid : in std_logic;
    rgDone      : inout std_logic;

    rgResultData  : out std_logic_vector(31 downto 0);
    rgResultReady : out std_logic;
    rgResultSource : out std_logic_vector(1 downto 0);


    input1 : in std_logic);
end;

architecture rtl of boundtop is

component rayinterface is 
  port(

    raygroup : in std_logic_vector(1 downto 0);
    raygroupwe : in std_logic;
    raygroupid : in std_logic_vector(1 downto 0);
    enablenear : in std_logic;

    -- Interchip Bus Signals (Ray Generation Chip)
    rgData      : in std_logic_vector(31 downto 0);
    rgAddr      : in std_logic_vector(3 downto 0);
    rgWE        : in std_logic_vector(2 downto 0);
    rgAddrValid : in std_logic;
    rgDone      : inout std_logic;

    -- Interchip Bus Signals (Ray Tri Chip)
    raydata : out std_logic_vector(31 downto 0);
    rayaddr : out std_logic_vector(3 downto 0);
    raywe   : out std_logic_vector(2 downto 0);

    globalreset : in std_logic;
    clk : in std_logic);
end component;



  signal raygroupwe,raygroupwe01,raygroupwe10 : std_logic;
  signal raygroupout,raygroupout01,raygroupout10 : std_logic_vector(1 downto 0);
  signal raygroupid, raygroupid01,raygroupid10 : std_logic_vector(1 downto 0);
  signal oldresultid,resultid : std_logic_vector(1 downto 0);
  signal t1i,t2i,t3i : std_logic_vector(31 downto 0);
  signal u1i,u2i,u3i,v1i,v2i,v3i : std_logic_vector(15 downto 0);
  signal id1i,id2i,id3i : std_logic_vector(15 downto 0);
  signal hit1i,hit2i,hit3i : std_logic; 
  signal newresult : std_logic;
  signal write,reset,reset01,reset10 : std_logic;
  signal peekdata,peeklatch : std_logic_vector(103 downto 0);
  signal commit01,commit10 : std_logic;
  signal baseaddress01,baseaddress10 : std_logic_vector(1 downto 0);
  signal done : std_logic_vector(1 downto 0);
  signal cntreset,cntreset01,cntreset10 : std_logic;
  signal passCTS01, passCTS10 : std_logic;
  signal triIDvalid01, triIDvalid10 : std_logic;
  signal triID01, triID10 : std_logic_vector(15 downto 0);
  signal boundNodeID,BoundNodeID01, BoundNodeID10 : std_logic_vector(9 downto 0);
  signal enablenear,enablenear01,enablenear10 : std_logic;
  signal ack01,ack10,empty01,dataready01,empty10,dataready10,lhreset01,lhreset10 : std_logic;
  signal boundnodeIDout01,boundnodeIDout10 : std_logic_vector(9 downto 0);
  signal level01,level10 : std_logic_vector(1 downto 0);
  signal hitmask01,hitmask10 : std_logic_vector(2 downto 0);

  -- Offset Block Ram Read Signals
  signal ostaddr,addrind01,addrind10 : std_logic_vector(9 downto 0);
  signal ostaddrvalid,addrindvalid01,addrindvalid10,ostdatavalid : std_logic;
  signal ostdata : std_logic_vector(31 downto 0);
  -- Tri List Ram Read Signals
  signal tladdr,tladdr01,tladdr10 : std_logic_vector(17 downto 0);
  signal tladdrvalid,tladdrvalid01,tladdrvalid10,tldatavalid : std_logic;
  signal tldata : std_logic_vector(63 downto 0);
  -- Final Result Signals
  signal t1_01,t2_01,t3_01,t1_10,t2_10,t3_10 : std_logic_vector(31 downto 0);
  signal v1_01,v2_01,v3_01,v1_10,v2_10,v3_10 : std_logic_vector(15 downto 0);
  signal u1_01,u2_01,u3_01,u1_10,u2_10,u3_10 : std_logic_vector(15 downto 0);
  signal id1_01,id2_01,id3_01,id1_10,id2_10,id3_10 : std_logic_Vector(15 downto 0);
  signal hit1_01,hit2_01,hit3_01,hit1_10,hit2_10,hit3_10 : std_logic;
  signal bcvalid01, bcvalid10 : std_logic;

  signal peekoffset1a,peekoffset1b,peekoffset0a,peekoffset0b : std_logic_vector(2 downto 0);
  signal peekoffset2a,peekoffset2b : std_logic_vector(2 downto 0);
  signal peekaddressa,peekaddressb : std_logic_vector(4 downto 0);

  signal doutput,dack : std_logic;
  signal state01,state10 : std_logic_vector(4 downto 0);

  signal junk1,junk1b : std_logic_vector(2 downto 0);
  signal junk2,junk2a : std_logic;
  signal junk3,junk4 : std_logic_vector(1 downto 0);

  signal debugcount01,debugcount10 : std_logic_vector(13 downto 0);
  signal debugsubcount01, debugsubcount10 : std_logic_vector(1 downto 0);
  signal statesram : std_logic_vector(2 downto 0);

  signal st_datain : std_logic_vector(12 downto 0);
begin

   oc : onlyonecycle 
     port map(input1,doutput,pglobalreset,tm3_clk_v0);

  -- Real Stuff Starts Here

  ostaddr <= addrind01 or addrind10;
  ostaddrvalid <= addrindvalid01 or addrindvalid10;

  offsettable : vblockramcontroller
    generic map(32,10)
    port map(want_braddr,braddr_ready,braddrin,want_brdata,brdata_ready,brdatain,
             ostaddr,ostaddrvalid,ostdata,ostdatavalid,pglobalreset,tm3_clk_v0);

  tladdr <= tladdr01 or tladdr10;
  tladdrvalid <= tladdrvalid01 or tladdrvalid10;

  trilist : sramcontroller
    port map(want_addr2,addr2_ready,addr2in,want_data2,data2_ready,data2in,
             tladdr,tladdrvalid,tldata,tldatavalid,
             tm3_sram_data,tm3_sram_addr,tm3_sram_we,tm3_sram_oe,tm3_sram_adsp,
             pglobalreset,tm3_clk_v0, statesram);

  globalreset <= pglobalreset;

  ri : resultinterface
    port map(t1i,t2i,t3i,u1i,u2i,u3i,
             v1i,v2i,v3i,id1i,id2i,id3i,hit1i,hit2i,hit3i,
             resultID,newresult,resultready,resultdata,pglobalreset,tm3_clk_v0);

  rayint : rayinterface
    port map(raygroupout,raygroupwe,raygroupid,enablenear, 
             rgData,rgAddr,rgWe,rgAddrvalid,rgDone,
             raydata,rayaddr,raywe, pglobalreset,tm3_clk_v0);

  boundcont01 : boundcontroller
    generic map('1',"01")
    port map(raygroupout01,raygroupwe01,raygroupid01,
             enablenear01,raygroup01,raygroupvalid01,busy01,
             triIDvalid01, triID01, wanttriID,reset01,baseaddress01,newresult,boundNodeID01, 
             resultID,hitmask01,dataready01,empty01,level01,
             boundNodeIDout01,ack01,lhreset01, 
             addrind01,addrindvalid01,ostdata,ostdatavalid,
             tladdr01,tladdrvalid01,tldata,tldatavalid,
             t1i,t2i,t3i,u1i,u2i,u3i,v1i,v2i,v3i,id1i,id2i,id3i,hit1i,hit2i,hit3i,
             t1_01,t2_01,t3_01,u1_01,u2_01,u3_01,v1_01,v2_01,v3_01,id1_01,id2_01,id3_01,hit1_01,hit2_01,hit3_01,
             bcvalid01,done,cntreset01,passCTS01,passCTS10,
pglobalreset,tm3_clk_v0,state01,
             debugsubcount01,debugcount01);
 
  boundcont10 : boundcontroller
    generic map('0',"10")
    port map(raygroupout10,raygroupwe10,raygroupid10,
             enablenear10, raygroup10, raygroupvalid10, busy10,
             triIDvalid10, triID10, wanttriID,reset10, baseaddress10,newresult,BoundNodeID10,
             resultID,hitmask10,dataready10,empty10,level10,
             boundNodeIDout10,ack10, lhreset10,
             addrind10,addrindvalid10,ostdata,ostdatavalid,
             tladdr10,tladdrvalid10,tldata,tldatavalid,
             t1i,t2i,t3i,u1i,u2i,u3i,v1i,v2i,v3i,id1i,id2i,id3i,hit1i,hit2i,hit3i,
             t1_10,t2_10,t3_10,u1_10,u2_10,u3_10,v1_10,v2_10,v3_10,id1_10,id2_10,id3_10,hit1_10,hit2_10,hit3_10,
             bcvalid10,done,cntreset10,passCTS10,passCTS01,pglobalreset,tm3_clk_v0,state10,
             debugsubcount10,debugcount10);

  restransinst : resulttransmit
   port map(bcvalid01,bcvalid10,id1_01,id2_01,id3_01,id1_10,id2_10,id3_10,
            hit1_01,hit2_01,hit3_01,hit1_10,hit2_10,hit3_10,
            u1_01,u2_01,u3_01,v1_01,v2_01,v3_01,u1_10,u2_10,u3_10,v1_10,v2_10,v3_10,
            rgResultData,rgResultReady,rgResultSource, pglobalreset,tm3_clk_v0);


  raygroupout <= raygroupout01 or raygroupout10;
  raygroupwe <= raygroupwe01 or raygroupwe10;
  raygroupid <= raygroupid01 or raygroupid10;
  triIDvalid <= triIDvalid01 or triIDvalid10;
  enablenear <= enablenear01 or enablenear10;
  triID <= triID01 or triID10;
  cntreset <= cntreset01 or cntreset10;
--  reset <= reset01 or reset10;

  process (boundNodeID01,boundNodeID10,resultID)
  begin
    if resultID = "01" then
      boundNodeID <= BoundNodeID01;
    elsif resultID = "10" then
      boundNodeID <= BoundNodeID10;
    else
      boundNodeID <= (others => '-');
    end if;
  end process;

  write <= '1' when (newresult = '1') and (resultID /= 0) and 
           ((hit1i = '1') or (hit2i = '1') or (hit3i = '1')) else '0';

  st_datain <= hit3i&hit2i&hit1i&boundNodeID;
  st : sortedstack
    generic map(32, 13, 8) 
    port map(t1i,st_datain,write,reset,peekdata,pglobalreset,tm3_clk_v0);


  commit01 <= '1' when done = "01" else '0';
  commit10 <= '1' when done = "10" else '0';

  dack <= doutput or ack01;

  lh01 : listhandler
    port map(peeklatch,commit01,hitmask01,dack,
             boundnodeIDout01,level01,empty01,dataready01,lhreset01, pglobalreset,tm3_clk_v0, 
peekoffset0a,peekoffset1a, peekoffset2a,junk2a,junk4);

  lh02 : listhandler
    port map(peeklatch,commit10,hitmask10,ack10,
             boundnodeIDout10,level10,empty10,dataready10,lhreset10, pglobalreset,tm3_clk_v0, 
junk1,junk1b,peekoffset2b,junk2,junk3);

  process (tm3_clk_v0,pglobalreset)
  begin
   -- The reset is only for debugging
    if (pglobalreset = '1') then
      peeklatch <= (others => '0');
      reset <= '0';
      oldresultID <= "00";
    elsif rising_edge(tm3_clk_v0) then
      oldresultID <= resultID;
      if (resultID /= oldresultID) then
        reset <= '1';
      else
        reset <= '0';
      end if;
      if (done /= 0) then
        peeklatch <= peekdata;
      end if;
    end if;
  end process;

  rc : resultcounter
    port map(resultID,newresult,done,cntreset,pglobalreset,tm3_clk_v0);
end rtl;

