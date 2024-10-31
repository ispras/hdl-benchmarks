library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library altera;
use altera.altera_mf_components.all;
-- pragma translate_on

entity altera_pll is
  generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    clk_freq : integer := 25000
  );
  port (
    inclk0  : in  std_ulogic;
    c0	    : out std_ulogic;
    e0	    : out std_ulogic; 
    locked  : out std_ulogic
);
end;

architecture rtl of altera_pll is

  component altpll
  generic (   
    operation_mode         : string := "NORMAL" ;
    inclk0_input_frequency : positive;
    clk0_multiply_by       : positive := 1;
    clk0_divide_by         : positive := 1;
    extclk0_multiply_by    : positive := 1;
    extclk0_divide_by      : positive := 1
  );
  port (
    inclk       : in std_logic_vector(1 downto 0);
    clkena      : in std_logic_vector(5 downto 0);
    extclkena   : in std_logic_vector(3 downto 0);
    clk         : out std_logic_vector(5 downto 0);
    extclk      : out std_logic_vector(3 downto 0);
    locked      : out std_logic
  );
  end component;

  signal clkena	: std_logic_vector (5 downto 0);
  signal clkout	: std_logic_vector (5 downto 0);
  signal inclk	: std_logic_vector (1 downto 0);
  signal extclk : std_logic_vector (3 downto 0);

begin

  clkena <= "000001"; inclk <= '0' & inclk0;
  c0 <= clkout(0); e0 <= extclk(0);

  altpll0 : altpll
  generic map ( 
--    operation_mode => "ZERO_DELAY_BUFFER", inclk0_input_frequency => clk_freq, 
    inclk0_input_frequency => clk_freq, 
    extclk0_multiply_by => clk_mul, extclk0_divide_by => clk_div,
    clk0_multiply_by => clk_mul, clk0_divide_by => clk_div)
  port map ( clkena => clkena, inclk => inclk, extclkena => clkena(3 downto 0),
    clk => clkout, locked => locked, extclk => extclk
 );

end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.misc.all;
use gaisler.libclk.all;
library grlib;
use grlib.stdlib.all;


------------------------------------------------------------------
-- Stratix clock generator ---------------------------------------
------------------------------------------------------------------

entity clkgen_stratix is
 generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    sdramen  : integer := 0;
    sdinvclk : integer := 0;
    pcien    : integer := 0;
    pcidll   : integer := 0;
    pcisysclk: integer := 0;
    freq     : integer := 25000);
  port (
    clkin   : in  std_logic;
    pciclkin: in  std_logic;
    clk     : out std_logic;			-- main clock
    clkn    : out std_logic;			-- inverted main clock
    sdclk   : out std_logic;			-- SDRAM clock
    pciclk  : out std_logic;			-- PCI clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type);
end; 

architecture rtl of clkgen_stratix is

  constant VERSION : integer := 1;
  constant CLKIN_PERIOD : integer := 20;

  signal   Clk_i             : std_logic;
  signal   Clkint, pciclkint : std_logic;
  signal   pllclk, pllclkn   : std_logic;  -- generated clocks
  signal   s_clk             : std_logic;
  
  -- altera pll
  component altera_pll
    generic (
      clk_mul  : integer := 1; 
      clk_div  : integer := 1;
      clk_freq : integer := 25000
    );
    port (
      inclk0 : in  std_ulogic;
      e0     : out std_ulogic;
      c0     : out std_ulogic;
      locked : out std_ulogic);
  end component;
  
  
begin

  cgo.pcilock <= '1';

  c0 : if (PCISYSCLK = 0) generate
    Clkint <= Clkin;
  end generate;

  c1 : if (PCISYSCLK = 1) generate
    Clkint <= pciclkin;
  end generate;

  c2 : if (PCIEN = 1) generate
    p0 : if (PCIDLL = 1) generate
      pciclkint <= pciclkin;
      pciclk    <= pciclkint;
    end generate;
    p1 : if (PCIDLL = 0) generate
      u0 : if (PCISYSCLK = 0) generate
        pciclkint <= pciclkin;
      end generate;
      pciclk <= clk_i when (PCISYSCLK = 1) else pciclkint;
    end generate;
  end generate;

  c3 : if (PCIEN = 0) generate
    pciclk <= Clkint;
  end generate;

  sdclk_pll : altera_pll 
  generic map (clk_mul, clk_div, freq)
  port map ( inclk0 => cgi.pllref, e0 => sdclk, c0 => s_clk, 
	locked => cgo.clklock);
  clk <= s_clk;
  clkn <= not s_clk;
 
  -- pragma translate_off
  bootmsg : report_version 
  generic map (
    "clkgen_stratix" & ": stratix sdram/pci clock generator, version " & tost(VERSION),
    "clkgen_stratix" & ": Frequency " &  tost(freq) & " KHz, PLL scaler " & tost(clk_mul) & "/" & tost(clk_div));
  -- pragma translate_on


end;


