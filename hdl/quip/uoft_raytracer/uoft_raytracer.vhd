library ieee;
use ieee.std_logic_1164.all;

entity uoft_raytracer is port(
	input1 : in std_logic;
	pglobalreset : in std_logic;
	data2in : in std_logic_vector(63 downto 0);
	data2_ready : in std_logic;
	addr2in : in std_logic_vector(17 downto 0);
	addr2_ready : in std_logic;
	brdatain : in std_logic_vector(31 downto 0);
	brdata_ready : in std_logic;
	braddrin : in std_logic_vector(9 downto 0);
	braddr_ready : in std_logic;
	oe : in std_logic;
	rgCfgData_ready : in std_logic;
	rgCfgData : in std_logic_vector(31 downto 0);
	rgCont : in std_logic_vector(31 downto 0);
	rgaddrin : in std_logic_vector(17 downto 0);
	rgdatain : in std_logic_vector(63 downto 0);
	rgwant_read : in std_logic;
	rgdata_ready : in std_logic;
	rgaddr_ready : in std_logic;
	tm3_clk_v0 : in std_logic;
	sdatain : in std_logic_vector(63 downto 0);
	sdata_ready : in std_logic;
	saddrin : in std_logic_vector(17 downto 0);
	saddr_ready : in std_logic;
	want_data2 : out std_logic;
	want_addr2 : out std_logic;
	want_brdata : out std_logic;
	want_braddr : out std_logic;
	tm3_vidout_blank : out std_logic;
	tm3_vidout_vsync : out std_logic;
	tm3_vidout_hsync : inout std_logic;
	tm3_vidout_clock : out std_logic;
	tm3_vidout_blue : out std_logic_vector(9 downto 0);
	tm3_vidout_green : out std_logic_vector(9 downto 0);
	tm3_vidout_red : out std_logic_vector(9 downto 0);
	rgwant_CfgData : out std_logic;
	rgStat : out std_logic_vector(31 downto 0);
	rgdataout : out std_logic_vector(63 downto 0);
	rgread_ready : out std_logic;
	rgwant_data : out std_logic;
	rgwant_addr : out std_logic;
	tm3_sram_adsp0 : out std_logic;
	tm3_sram_oe0 : out std_logic_vector(1 downto 0);
	tm3_sram_we0 : out std_logic_vector(7 downto 0);
	tm3_sram_addr0 : out std_logic_vector(18 downto 0);
	tm3_sram_data0 : inout std_logic_vector(63 downto 0);

	tm3_sram_adsp1 : out std_logic;
	tm3_sram_oe1 : out std_logic_vector(1 downto 0);
	tm3_sram_we1 : out std_logic_vector(7 downto 0);
	tm3_sram_addr1 : out std_logic_vector(18 downto 0);
	tm3_sram_data1 : inout std_logic_vector(63 downto 0);

	tm3_sram_adsp2 : out std_logic;
	tm3_sram_oe2 : out std_logic_vector(1 downto 0);
	tm3_sram_we2 : out std_logic_vector(7 downto 0);
	tm3_sram_addr2 : out std_logic_vector(18 downto 0);
	tm3_sram_data2 : inout std_logic_vector(63 downto 0);

	want_sdata : out std_logic;
	want_saddr : out std_logic);
end;

architecture arch_uoft_raytracer of uoft_raytracer is
	signal rgResultSource : std_logic_vector(1 downto 0);
	signal rgResultReady : std_logic;
	signal rgResultData : std_logic_vector(31 downto 0);
	signal rgDone : std_logic;
	signal busy10 : std_logic;
	signal busy01 : std_logic;
	signal globalreset : std_logic;
	signal raywe : std_logic_vector(2 downto 0);
	signal rayaddr : std_logic_vector(3 downto 0);
	signal raydata : std_logic_vector(31 downto 0);
	signal triID : std_logic_vector(15 downto 0);
	signal triIDvalid : std_logic;
	signal fbnextscanline : std_logic;
	signal rgAddrValid : std_logic;
	signal rgWE : std_logic_vector(2 downto 0);
	signal rgAddr : std_logic_vector(3 downto 0);
	signal rgData : std_logic_vector(31 downto 0);
	signal raygroupvalid10 : std_logic;
	signal raygroup10 : std_logic_vector(1 downto 0);
	signal raygroupvalid01 : std_logic;
	signal raygroup01 : std_logic_vector(1 downto 0);
	signal fbdatavalid : std_logic;
	signal fbdata : std_logic_vector(63 downto 0);
	signal resultdata : std_logic_vector(31 downto 0);
	signal resultready : std_logic;
	signal wanttriID : std_logic;

component boundtop
	port(
	triIDvalid : out std_logic;
	triID : out std_logic_vector(15 downto 0);
	wanttriID : in std_logic;
	raydata : out std_logic_vector(31 downto 0);
	rayaddr : out std_logic_vector(3 downto 0);
	raywe : out std_logic_vector(2 downto 0);
	resultready : in std_logic;
	resultdata : in std_logic_vector(31 downto 0);
	globalreset : out std_logic;
	want_braddr : out std_logic;
	braddr_ready : in std_logic;
	braddrin : in std_logic_vector(9 downto 0);
	want_brdata : out std_logic;
	brdata_ready : in std_logic;
	brdatain : in std_logic_vector(31 downto 0);
	want_addr2 : out std_logic;
	addr2_ready : in std_logic;
	addr2in : in std_logic_vector(17 downto 0);
	want_data2 : out std_logic;
	data2_ready : in std_logic;
	data2in : in std_logic_vector(63 downto 0);
	pglobalreset : in std_logic;
	tm3_clk_v0 : in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	raygroup01 : in std_logic_vector(1 downto 0);
	raygroupvalid01 : in std_logic;
	busy01 : out std_logic;
	raygroup10 : in std_logic_vector(1 downto 0);
	raygroupvalid10 : in std_logic;
	busy10 : out std_logic;
	rgData : in std_logic_vector(31 downto 0);
	rgAddr : in std_logic_vector(3 downto 0);
	rgWE : in std_logic_vector(2 downto 0);
	rgAddrValid : in std_logic;
	rgDone : inout std_logic;
	rgResultData : out std_logic_vector(31 downto 0);
	rgResultReady : out std_logic;
	rgResultSource : out std_logic_vector(1 downto 0);
	input1 : in std_logic);
end component;


component framebuftop
	port(
	fbdata : in std_logic_vector(63 downto 0);
	fbdatavalid : in std_logic;
	fbnextscanline : out std_logic;
	tm3_vidout_red : out std_logic_vector(9 downto 0);
	tm3_vidout_green : out std_logic_vector(9 downto 0);
	tm3_vidout_blue : out std_logic_vector(9 downto 0);
	tm3_vidout_clock : out std_logic;
	tm3_vidout_hsync : inout std_logic;
	tm3_vidout_vsync : out std_logic;
	tm3_vidout_blank : out std_logic;
	oe : in std_logic;
	globalreset : in std_logic;
	tm3_clk_v0 : in std_logic);
end component;


component raygentop
	port(
	rgwant_addr : out std_logic;
	rgwant_data : out std_logic;
	rgread_ready : out std_logic;
	rgaddr_ready : in std_logic;
	rgdata_ready : in std_logic;
	rgwant_read : in std_logic;
	rgdatain : in std_logic_vector(63 downto 0);
	rgdataout : out std_logic_vector(63 downto 0);
	rgaddrin : in std_logic_vector(17 downto 0);
	rgCont : in std_logic_vector(31 downto 0);
	rgStat : out std_logic_vector(31 downto 0);
	rgCfgData : in std_logic_vector(31 downto 0);
	rgwant_CfgData : out std_logic;
	rgCfgData_ready : in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	tm3_clk_v0 : in std_logic;
	fbdata : out std_logic_vector(63 downto 0);
	fbdatavalid : out std_logic;
	fbnextscanline : in std_logic;
	raygroup01 : out std_logic_vector(1 downto 0);
	raygroupvalid01 : out std_logic;
	busy01 : in std_logic;
	raygroup10 : out std_logic_vector(1 downto 0);
	raygroupvalid10 : out std_logic;
	busy10 : in std_logic;
	globalreset : in std_logic;
	rgData : out std_logic_vector(31 downto 0);
	rgAddr : out std_logic_vector(3 downto 0);
	rgWE : out std_logic_vector(2 downto 0);
	rgAddrValid : out std_logic;
	rgDone : in std_logic;
	rgResultData : in std_logic_vector(31 downto 0);
	rgResultReady : in std_logic;
	rgResultSource : in std_logic_vector(1 downto 0));
end component;


component top
	port(
	want_saddr : out std_logic;
	saddr_ready : in std_logic;
	saddrin : in std_logic_vector(17 downto 0);
	want_sdata : out std_logic;
	sdata_ready : in std_logic;
	sdatain : in std_logic_vector(63 downto 0);
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	triIDvalid : in std_logic;
	triID : in std_logic_vector(15 downto 0);
	wanttriID : out std_logic;
	raydata : in std_logic_vector(31 downto 0);
	rayaddr : in std_logic_vector(3 downto 0);
	raywe : in std_logic_vector(2 downto 0);
	resultready : out std_logic;
	resultdata : out std_logic_vector(31 downto 0);
	globalreset : in std_logic;
	tm3_clk_v0 : in std_logic);
end component;

begin


boundtop_inst: boundtop port map (
	triIDvalid => triIDvalid,
	triID => triID,
	wanttriID => wanttriID,
	raydata => raydata,
	rayaddr => rayaddr,
	raywe => raywe,
	resultready => resultready,
	resultdata => resultdata,
	globalreset => globalreset,
	want_braddr => want_braddr,
	braddr_ready => braddr_ready,
	braddrin => braddrin,
	want_brdata => want_brdata,
	brdata_ready => brdata_ready,
	brdatain => brdatain,
	want_addr2 => want_addr2,
	addr2_ready => addr2_ready,
	addr2in => addr2in,
	want_data2 => want_data2,
	data2_ready => data2_ready,
	data2in => data2in,
	pglobalreset => pglobalreset,
	tm3_clk_v0 => tm3_clk_v0,
	tm3_sram_data => tm3_sram_data0,
	tm3_sram_addr => tm3_sram_addr0,
	tm3_sram_we => tm3_sram_we0,
	tm3_sram_oe => tm3_sram_oe0,
	tm3_sram_adsp => tm3_sram_adsp0,
	raygroup01 => raygroup01,
	raygroupvalid01 => raygroupvalid01,
	busy01 => busy01,
	raygroup10 => raygroup10,
	raygroupvalid10 => raygroupvalid10,
	busy10 => busy10,
	rgData => rgData,
	rgAddr => rgAddr,
	rgWE => rgWE,
	rgAddrValid => rgAddrValid,
	rgDone => rgDone,
	rgResultData => rgResultData,
	rgResultReady => rgResultReady,
	rgResultSource => rgResultSource,
	input1 => input1);

framebuftop_inst: framebuftop port map (
	fbdata => fbdata,
	fbdatavalid => fbdatavalid,
	fbnextscanline => fbnextscanline,
	tm3_vidout_red => tm3_vidout_red,
	tm3_vidout_green => tm3_vidout_green,
	tm3_vidout_blue => tm3_vidout_blue,
	tm3_vidout_clock => tm3_vidout_clock,
	tm3_vidout_hsync => tm3_vidout_hsync,
	tm3_vidout_vsync => tm3_vidout_vsync,
	tm3_vidout_blank => tm3_vidout_blank,
	oe => oe,
	globalreset => globalreset,
	tm3_clk_v0 => tm3_clk_v0);

raygentop_inst: raygentop port map (
	rgwant_addr => rgwant_addr,
	rgwant_data => rgwant_data,
	rgread_ready => rgread_ready,
	rgaddr_ready => rgaddr_ready,
	rgdata_ready => rgdata_ready,
	rgwant_read => rgwant_read,
	rgdatain => rgdatain,
	rgdataout => rgdataout,
	rgaddrin => rgaddrin,
	rgCont => rgCont,
	rgStat => rgStat,
	rgCfgData => rgCfgData,
	rgwant_CfgData => rgwant_CfgData,
	rgCfgData_ready => rgCfgData_ready,
	tm3_sram_data => tm3_sram_data1,
	tm3_sram_addr => tm3_sram_addr1,
	tm3_sram_we => tm3_sram_we1,
	tm3_sram_oe => tm3_sram_oe1,
	tm3_sram_adsp => tm3_sram_adsp1,
	tm3_clk_v0 => tm3_clk_v0,
	fbdata => fbdata,
	fbdatavalid => fbdatavalid,
	fbnextscanline => fbnextscanline,
	raygroup01 => raygroup01,
	raygroupvalid01 => raygroupvalid01,
	busy01 => busy01,
	raygroup10 => raygroup10,
	raygroupvalid10 => raygroupvalid10,
	busy10 => busy10,
	globalreset => globalreset,
	rgData => rgData,
	rgAddr => rgAddr,
	rgWE => rgWE,
	rgAddrValid => rgAddrValid,
	rgDone => rgDone,
	rgResultData => rgResultData,
	rgResultReady => rgResultReady,
	rgResultSource => rgResultSource);

top_inst: top port map (
	want_saddr => want_saddr,
	saddr_ready => saddr_ready,
	saddrin => saddrin,
	want_sdata => want_sdata,
	sdata_ready => sdata_ready,
	sdatain => sdatain,
	tm3_sram_data => tm3_sram_data2,
	tm3_sram_addr => tm3_sram_addr2,
	tm3_sram_we => tm3_sram_we2,
	tm3_sram_oe => tm3_sram_oe2,
	tm3_sram_adsp => tm3_sram_adsp2,
	triIDvalid => triIDvalid,
	triID => triID,
	wanttriID => wanttriID,
	raydata => raydata,
	rayaddr => rayaddr,
	raywe => raywe,
	resultready => resultready,
	resultdata => resultdata,
	globalreset => globalreset,
	tm3_clk_v0 => tm3_clk_v0);

end arch_uoft_raytracer;
