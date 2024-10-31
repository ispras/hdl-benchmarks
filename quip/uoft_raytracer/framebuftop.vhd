library ieee;
use ieee.std_logic_1164.all;

library work;
use work.complib.all;

entity framebuftop is 
  port(
    fbdata         : in std_logic_vector(63 downto 0);
    fbdatavalid    : in std_logic;
    fbnextscanline : out std_logic;

    tm3_vidout_red   : out std_logic_vector( 9 downto 0);
    tm3_vidout_green : out std_logic_vector( 9 downto 0); 
    tm3_vidout_blue  : out std_logic_vector( 9 downto 0);
    tm3_vidout_clock : out std_logic;
    tm3_vidout_hsync : inout std_logic;
    tm3_vidout_vsync : out std_logic;
    tm3_vidout_blank : out std_logic;

    oe : in std_logic;
    globalreset   : in std_logic;
    tm3_clk_v0    : in std_logic );
end;

architecture rtl of framebuftop is
  signal pixeldataA,pixeldataB,pixeldataC : std_logic_vector(20 downto 0);
  signal startframe,nextscanline,nextpixelA,nextpixelB,nextpixelC : std_logic;
  signal fbnextscanlineint : std_logic;

component vidout is 
  port(
    pixeldataA,pixeldataB,pixeldataC : in std_logic_vector(20 downto 0);
    nextpixelA,nextpixelB,nextpixelC : out std_logic;
    startframe,nextscanline : out std_logic;
    globalreset : in std_logic;
    tm3_clk_v0: in std_logic;
    tm3_vidout_red,tm3_vidout_green,tm3_vidout_blue : out std_logic_vector( 9 downto 0);
    tm3_vidout_clock : out std_logic;
    tm3_vidout_hsync : inout std_logic;
    tm3_vidout_vsync,tm3_vidout_blank : out std_logic);
end component;


begin
  fbnextscanline <= '1' when fbnextscanlineint = '1' and oe = '1' else '0';
  vidoutinst : vidout
    port map(pixeldataA,pixeldataB,pixeldataC, nextpixelA,nextpixelB,nextpixelC,
             startframe,nextscanline,globalreset,tm3_clk_v0,
             tm3_vidout_red,tm3_vidout_green,tm3_vidout_blue,
             tm3_vidout_clock,tm3_vidout_hsync,tm3_vidout_vsync,tm3_vidout_blank);

  scanlinebuf : scanlinebuffer
    port map(pixeldataA,pixeldataB,pixeldataC, nextpixelA,nextpixelB,nextpixelC,
             startframe,nextscanline,fbdata,fbnextscanlineint,fbdatavalid,globalreset,
             tm3_clk_v0);
end rtl;
