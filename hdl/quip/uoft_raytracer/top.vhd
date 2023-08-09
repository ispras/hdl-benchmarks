library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity top is 
  port(
    want_saddr : out std_logic;
    saddr_ready : in std_logic;
    saddrin : in std_logic_vector(17 downto 0);
    want_sdata : out std_logic;   
    sdata_ready : in std_logic;
    sdatain : in std_logic_vector(63 downto 0);

    tm3_sram_data : inout std_logic_vector(63 downto 0);
    tm3_sram_addr : out std_logic_vector(18 downto 0);
    tm3_sram_we   : out std_logic_vector(7 downto 0);
    tm3_sram_oe   : out std_logic_vector(1 downto 0);
    tm3_sram_adsp : out std_logic;

    triIDvalid : in std_logic;
    triID      : in std_logic_vector(15 downto 0);
    wanttriID  : out std_logic;
    raydata    : in std_logic_vector(31 downto 0);
    rayaddr    : in std_logic_vector(3 downto 0);
    raywe      : in std_logic_vector(2 downto 0);
    resultready : out std_logic;
    resultdata  : out std_logic_vector(31 downto 0);

    globalreset : in std_logic;
    tm3_clk_v0 : in std_logic
  );
end;

architecture rtl of top is
  type stdlogicarray32 is array(0 to 2) of std_logic_vector(31 downto 0);
  type stdlogicarray16 is array(0 to 2) of std_logic_vector(15 downto 0);

  -- Memory Interface Signals 
  signal tridata : std_logic_vector(191 downto 0); 
  signal triID_out : std_logic_vector(15 downto 0); 
  signal cyclenum : std_logic_vector(1 downto 0); 
  signal masterenable,masterenablel : std_logic_vector(0 downto 0);
  signal swap : std_logic;

  -- Ray Tri Interface Signals
  signal tout : std_logic_vector(31 downto 0);
  signal uout : std_logic_vector(15 downto 0);
  signal vout : std_logic_vector(15 downto 0);
  signal triIDout : std_logic_vector(15 downto 0);
  signal hitout : std_logic;
  signal origx,origy,origz : std_logic_vector(27 downto 0);
  signal dirx,diry,dirz    : std_logic_vector(15 downto 0);

  -- Nearest Unit Signals
  signal nt : stdlogicarray32;
  signal nu,nv,ntriID : stdlogicarray16;
  signal anyhit : std_logic_vector(2 downto 0);
  signal n0enable, n1enable, n2enable,nxenable : std_logic;
  signal enablenear,enablenearl : std_logic_vector(0 downto 0);
  signal resetl,reset : std_logic_vector(0 downto 0);
  signal raygroupID, raygroupIDl : std_logic_vector(1 downto 0);
begin
  mem : memoryinterface
    port map(
      want_saddr,saddr_ready,saddrin,want_sdata,sdata_ready,sdatain,
      tridata, triID_out, masterenable(0), triIDvalid, triID, wanttriID,cyclenum, 
      tm3_sram_data,tm3_sram_addr,tm3_sram_we,
      tm3_sram_oe,tm3_sram_adsp,
      globalreset, tm3_clk_v0);

  triunit : raytri
    port map(
      tm3_clk_v0,
      tout,uout,vout,triIDout,hitout,
      tridata(123 downto 96), tridata(155 downto 128), tridata(187 downto 160),
      origx,origy,origz, dirx,diry,dirz,
      tridata(15 downto 0), tridata(31 downto 16), tridata(47 downto 32), tridata(125 downto 124),
      tridata(63 downto 48), tridata(79 downto 64), tridata(95 downto 80), tridata(157 downto 156),
      tridata(191 downto 191), swap,triID_out);
  nc0 : nearcmpspec
    port map(
      tout,uout,vout,triIDout,hitout,
      nt(0),nu(0),nv(0),ntriID(0),anyhit(0), 
      n0enable,nxenable,resetl(0),globalreset,tm3_clk_v0);
  nc1 : nearcmp
    port map(
      tout,uout,vout,triIDout,hitout,
      nt(1),nu(1),nv(1),ntriID(1),anyhit(1),
      n1enable,resetl(0),globalreset,tm3_clk_v0);
  nc2 : nearcmp
    port map(
      tout,uout,vout,triIDout,hitout,
      nt(2),nu(2),nv(2),ntriID(2),anyhit(2),
      n2enable,resetl(0),globalreset,tm3_clk_v0);

  n0enable <= '1' when (cyclenum = "10") and (masterenablel(0) = '1') else '0';
  n1enable <= '1' when (cyclenum = "00") and (masterenablel(0) = '1') else '0';
  n2enable <= '1' when (cyclenum = "01") and (masterenablel(0) = '1') else '0';
  nxenable <= '1' when (enablenearl(0) = '1')  and (masterenablel(0) = '1') else '0';

  raygroupdelay : delay
    generic map (2,37+1)  -- One delay level to account for near cmp internal latch
    port map(raygroupID,raygroupIDl,tm3_clk_v0);

  enableneardelay : delay
    generic map (1,37)
    port map(enablenear,enablenearl,tm3_clk_v0);

  mastdelay : delay
    generic map (1,37)
    port map(masterenable,masterenablel,tm3_clk_v0);

  resetdelay : delay
    generic map (1,37) 
    port map(reset,resetl,tm3_clk_v0);

  resstate : resultstate
    port map (resetl(0), nt(0),nt(1),nt(2),nu(0),nu(1),nu(2),nv(0),nv(1),nv(2),
              ntriID(0),ntriID(1),ntriID(2),anyhit(0),anyhit(1),anyhit(2),raygroupIDl,resultready,
              resultdata,globalreset, tm3_clk_v0);

  raybuff : raybuffer
    port map ( origx, origy, origz, dirx, diry, dirz, raygroupID, swap, reset(0),enablenear(0), 
               raydata, rayaddr, raywe, cyclenum,tm3_clk_v0);

end rtl;
