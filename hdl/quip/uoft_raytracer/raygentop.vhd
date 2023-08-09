library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;    
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity raygentop is
  port(
    -- Ports Package Signals
    rgwant_addr  : out std_logic;
    rgwant_data  : out std_logic;
    rgread_ready : out std_logic;
    rgaddr_ready : in std_logic;
    rgdata_ready : in std_logic;
    rgwant_read  : in std_logic;
    rgdatain     : in std_logic_vector(63 downto 0);
    rgdataout    : out std_logic_vector(63 downto 0);
    rgaddrin     : in std_logic_vector(17 downto 0);
    rgCont : in std_logic_vector(31 downto 0);
    rgStat : out std_logic_vector(31 downto 0);
    rgCfgData : in std_logic_vector(31 downto 0);
    rgwant_CfgData : out std_logic;
    rgCfgData_ready : in std_logic;
    -- Memory Signals
    tm3_sram_data : inout std_logic_vector(63 downto 0);
    tm3_sram_addr : out std_logic_vector(18 downto 0);
    tm3_sram_we   : out std_logic_vector(7 downto 0);
    tm3_sram_oe   : out std_logic_vector(1 downto 0);
    tm3_sram_adsp : out std_logic;
    tm3_clk_v0 : in std_logic;

    -- Frame Buffer Chip Signals
    fbdata         : out std_logic_vector(63 downto 0);
    fbdatavalid    : out std_logic;
    fbnextscanline : in std_logic;

    -- Interchip signals
    raygroup01      : out std_logic_vector(1 downto 0);
    raygroupvalid01 : out std_logic;
    busy01          : in std_logic;
    raygroup10      : out std_logic_vector(1 downto 0);  
    raygroupvalid10 : out std_logic;
    busy10          : in std_logic;
  
    globalreset : in std_logic;
    
    rgData      : out std_logic_vector(31 downto 0);
    rgAddr      : out std_logic_vector(3 downto 0);
    rgWE        : out std_logic_vector(2 downto 0);
    rgAddrValid : out std_logic;
    rgDone      : in std_logic;

    rgResultData   : in std_logic_vector(31 downto 0);
    rgResultReady  : in std_logic;
    rgResultSource : in std_logic_vector(1 downto 0));
end;

architecture rtl of raygentop is

component raygencont is 
  generic(
    id : std_logic := '0');
  port(
    go : in std_logic;
    initcount : in std_logic_vector(14 downto 0);
    busyout : out std_logic;
    cycles : out std_logic_vector(30 downto 0);
    nextaddr : out std_logic_vector(17 downto 0);
    nas0,nas1 : out std_logic;
    page : in std_logic;

    -- Memory Controller Interface
    dirReady : in std_logic;
    wantDir  : out std_logic;
    dirIn    : in std_logic_vector(47 downto 0);
    addrIn   : in std_logic_vector(14 downto 0);

    -- RayInterface Interface
    as : out std_logic;
    addr : out std_logic_vector(3 downto 0);
    ack : in std_logic;
    dir : out std_logic_vector(47 downto 0);

    -- Bound Controller Interface 0
    raygroup0 : out std_logic_vector(1 downto 0);
    raygroupvalid0 : out std_logic;
    busy0 : in std_logic;

    raygroup1 : out std_logic_vector(1 downto 0);
    raygroupvalid1 : out std_logic;
    busy1 : in std_logic;

    globalreset : in std_logic;
    clk : in std_logic;
    statepeek : out std_logic_vector(2 downto 0));
end component;


signal statepeek2 : std_logic_vector(2 downto 0);
signal as01,ack01 : std_logic;
signal addr01: std_logic_vector( 3 downto 0);
signal dir01,dir,sramdatal : std_logic_vector(47 downto 0);
signal wantDir : std_logic;
signal dirReady,dirReadyl : std_logic_vector(0 downto 0);
signal address : std_logic_vector(14 downto 0);
signal cyclecounter : std_logic_vector(30 downto 0);
signal nas01,nas10 : std_logic;
signal go,page : std_logic;
signal statepeekct : std_logic_vector(2 downto 0);
-- result Signals
signal valid01,valid10 : std_logic;
signal id01a,id01b,id01c : std_logic_vector(15 downto 0);
signal id10a,id10b,id10c : std_logic_vector(15 downto 0);
signal hit01a,hit01b,hit01c : std_logic;
signal hit10a,hit10b,hit10c : std_logic;
signal u01a,u01b,u01c,v01a,v01b,v01c : std_logic_vector(7 downto 0);
signal u10a,u10b,u10c,v10a,v10b,v10c : std_logic_vector(7 downto 0);
signal wantwriteback, writebackack : std_logic;
signal writebackdata : std_logic_vector(63 downto 0);
signal writebackaddr : std_logic_vector(17 downto 0);
signal nextaddr01 : std_logic_vector(17 downto 0);
-- Shading Signals
signal shadedata : std_logic_vector(63 downto 0);
signal triID : std_logic_vector(15 downto 0);
signal wantshadedata,shadedataready : std_logic;
-- CfgData Signals
signal origx,origy,origz  : std_logic_vector(27 downto 0);
signal m11,m12,m13,m21,m22,m23,m31,m32,m33 : std_logic_vector(15 downto 0);
signal bkcolour : std_logic_vector(20 downto 0);
-- Texture signals
signal texinfo : std_logic_vector(20 downto 0);
signal texaddr : std_logic_vector(3 downto 0);
signal texel : std_logic_vector(63 downto 0);
signal texeladdr : std_logic_vector(17 downto 0);
signal wanttexel,texelready : std_logic;
-- Frame Buffer Read Signals
signal fbpage : std_logic;
-- debug signals
signal wantcfg : std_logic;

signal debugglobalreset : std_logic;
begin
  rgWant_CfgData <= wantcfg;

  onlyeonecycleinst : onlyonecycle
    port map(rgCont(0),go,globalreset,tm3_clk_v0);

  process(tm3_clk_v0,globalreset) 
  begin
    if (globalreset = '1') then
      page <= '1';  -- Reset to 1 such that first flip sets to 0
    elsif rising_edge(tm3_clk_v0) then 
		if(go = '1') then
      page <= not page;
    	end if;
	end if;
  end process;
  fbpage <= not page;

  matmultinst : matmult
    generic map(16,16)
    port map(sramdatal(47 downto 32),sramdatal(31 downto 16),sramdatal(15 downto 0),
             m11,m12,m13,m21,m22,m23,m31,m32,m33,
             dir(47 downto 32),dir(31 downto 16),dir(15 downto 0),tm3_clk_v0);

  dir01delay : delay
    generic map(1,3)
    port map(dirready,dirreadyl,tm3_clk_v0);


  ConfigMemoryInst : rgconfigmemory
    port map(rgCfgData(31 downto 28),rgCfgData(27 downto 0),rgCfgData_Ready,
             wantcfg,origx,origy,origz,m11,m12,m13,m21,m22,m23,m31,m32,m33,
             bkcolour,texinfo,texaddr,globalreset,tm3_clk_v0);

  sramcont : rgsramcontroller
    port map(rgwant_addr,rgaddr_ready,rgaddrin,rgwant_data,rgdata_ready,rgdatain,
             rgwant_read,rgread_ready,rgdataout, 
             dirReady(0),wantDir,sramdatal,address,
             wantwriteback,writebackack,writebackdata,writebackaddr,
             fbdata,fbnextscanline,fbdatavalid,fbpage,
             shadedata,triID,wantshadedata,shadedataready,texeladdr,texel,wanttexel,texelready,
             tm3_sram_data,tm3_sram_addr,tm3_sram_we,tm3_sram_oe,tm3_sram_adsp,
             globalreset, tm3_clk_v0);

  raysendinst : raysend
    port map(as01,ack01,addr01,dir01,origx,origy,origz,
             rgData,rgAddr, rgWE,rgAddrValid, rgDone, globalreset,tm3_clk_v0, statepeek2);

  raygencontinst : raygencont
    generic map('1')
    port map(go, rgCont(15 downto 1),rgStat(31), cyclecounter, nextaddr01, nas01, nas10,page,
             dirReadyl(0), wantDir, dir, address, as01,addr01,ack01,dir01,
             raygroup01,raygroupvalid01,busy01, raygroup10,raygroupvalid10,busy10, 
             globalreset,tm3_clk_v0,statepeekct);

  resultrecieveinst : resultrecieve
    port map(valid01,valid10,id01a,id01b,id01c,id10a,id10b,id10c,
             hit01a,hit01b,hit01c,hit10a,hit10b,hit10c,
             u01a,u01b,u01c,v01a,v01b,v01c,u10a,u10b,u10c,v10a,v10b,v10c,
             rgResultData,rgResultReady,rgResultSource, globalreset,tm3_clk_v0);

  debugglobalreset <= globalreset or go;
  resultwriteinst : resultwriter
    port map(valid01,valid10,id01a,id01b,id01c,id10a,id10b,id10c,
             hit01a,hit01b,hit01c,hit10a,hit10b,hit10c,
             u01a,u01b,u01c,v01a,v01b,v01c,u10a,u10b,u10c,v10a,v10b,v10c,
             nextaddr01,nas01,nas10,bkcolour,
             shadedata,triID,wantshadedata,shadedataready,texinfo,texaddr,
             texeladdr,texel,wanttexel,texelready,
             writebackdata,writebackaddr,wantwriteback,writebackack,
             debugglobalreset,tm3_clk_v0);

  rgStat(30 downto 0) <= cyclecounter;

end rtl;
