library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity rayinterface is 
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
end;

architecture rtl of rayinterface is
signal rgDatal : std_logic_vector(31 downto 0);
signal rgAddrl : std_logic_vector(3 downto 0);
signal rgWEl : std_logic_vector(2 downto 0);
signal rgAddrValidl : std_logic;
begin
  Process(clk,globalreset)
  begin
    if (globalreset = '1') then
      raydata <= (others => '0');
      rayaddr <= (others => '0');
      raywe   <= (others => '0');
      rgDone  <= '0';
      rgDatal <= (others => '0');
      rgAddrl <= (others => '0');
      rgWEl <= (others => '0');
      rgAddrValidl <= '0';
    elsif (rising_edge(clk)) then
      raywe <= (others => '0');  -- Default to no write
      rgDatal <= rgData;         -- Latch interchip signals
      rgAddrl <= rgAddr;         -- To Meet Timing
      rgWEl <= rgWE;
      rgAddrValidl <= rgAddrValid;

      if rgAddrValidl = '0' then
        rgDone <= '0';
      end if;
      if raygroupwe = '1' then
        raydata(0) <= enablenear;
        raydata(31 downto 1) <= (others => '0');
        raywe   <= "111";
        rayaddr <= raygroupid & raygroup;
      elsif rgAddrValidl = '1' and rgDone = '0' then
        raydata <= rgDatal;
        raywe   <= rgWel;
        rayaddr <= rgAddrl;
        rgDone <= '1';
      end if;
    end if;
  end process;

end rtl;
