--------------------------------------------------
-- Ray Buffer, Output Selection & Bus Interface --
--                                              --
--   Writes are enabled through the bus         --
--     WE    Function                           --
--     000   Idle                               --
--     001   origx <= raydata 27..0             --
--     010   origy <= raydata 27..0             --
--     011   origz <= raydata 27..0             --
--     100   dirx <= raydata 15..0              --
--           diry <= raydata 31..16             --
--     101   dirz <= raydata 15..0              --
--           swap <= raydata 16                 --
--     110   reserved                           --
--     111   activeraygroup <= rayaddr 1..0     --
--           enablenear <= raydata 0            --
--                                              --
--   subraynum is not latched                   --
--   The output ray data is latched             --
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity raybuffer is 
  port(
    origx, origy, origz : out std_logic_vector(27 downto 0);
    dirx, diry, dirz : out std_logic_vector(15 downto 0);
    raygroupID : out std_logic_vector(1 downto 0);
    swap : out std_logic;
    resetout : out std_logic;
    enablenear : out std_logic;

    raydata : in std_logic_vector(31 downto 0);
    rayaddr : in std_logic_vector(3 downto 0);
    raywe   : in std_logic_vector(2 downto 0);  -- May need to be expanded

    subraynum : in std_logic_vector(1 downto 0);
    clk : in std_logic);
end;

architecture rtl of raybuffer is
  signal origxwe, origywe, origzwe : std_logic;
  signal dirxwe, dirywe, dirzwe : std_logic;
  signal swapwe,raygroupwe : std_logic;

  signal raddr : std_logic_vector(3 downto 0);
  signal activeraygroup : std_logic_vector(1 downto 0);
  signal swapvect : std_logic_vector(0 downto 0);
  signal resetl : std_logic;
  signal raygroupIDl : std_logic_vector(1 downto 0);
  signal enablenearl : std_logic;
begin
  -- Ray output address logic
  raddr <= activeraygroup & subraynum;
  process (clk)
  begin
    if (rising_edge (clk)) then
      resetl <= raygroupwe;
      resetout <= resetl;
      raygroupID <= raygroupIDl;
      enablenear <= enablenearl;

      if (raygroupwe = '1') then
        activeraygroup <= rayaddr(1 downto 0);
        enablenearl <= raydata(0);
        raygroupIDl <= rayaddr(3 downto 2);
      end if;
    end if;
  end process;

  -- Decode the write enable signals
  origxwe <= '1' when (raywe = "001") else '0';
  origywe <= '1' when (raywe = "010") else '0';
  origzwe <= '1' when (raywe = "011") else '0';
  dirxwe  <= '1' when (raywe = "100") else '0';
  dirywe  <= '1' when (raywe = "100") else '0';
  dirzwe  <= '1' when (raywe = "101") else '0';
  swapwe  <= '1' when (raywe = "101") else '0';
  raygroupwe <= '1' when (raywe = "111") else '0';

  -- Instantate all the required ram elements
  origxram : dpram
    generic map (28)
    port map (origxwe, raddr, rayaddr, origx, raydata(27 downto 0), clk);
  origyram : dpram
    generic map (28)
    port map (origywe, raddr, rayaddr, origy, raydata(27 downto 0), clk);
  origzram : dpram
    generic map (28)
    port map (origzwe, raddr, rayaddr, origz, raydata(27 downto 0), clk);
  dirxram : dpram
    generic map (16)
    port map (dirxwe, raddr, rayaddr, dirx, raydata(15 downto 0), clk);
  diryram : dpram
    generic map (16)
    port map (dirywe, raddr, rayaddr, diry, raydata(31 downto 16), clk);
  dirzram : dpram
    generic map (16)
    port map (dirzwe, raddr, rayaddr, dirz, raydata(15 downto 0), clk);
  swapram : dpram
    generic map (1)
    port map (swapwe, raddr, rayaddr, swapvect, raydata(16 downto 16), clk);
  swap <= swapvect(0);
end rtl;
