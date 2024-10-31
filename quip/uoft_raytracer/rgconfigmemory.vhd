library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
library work;
use work.complib.all;

entity rgConfigMemory is 
  port(
    CfgAddr : in std_logic_vector(3 downto 0);
    CfgData : in std_logic_vector(27 downto 0);
    CfgData_Ready : in std_logic;
    want_CfgData : out std_logic;
    -- Latched Data Signals
    origx,origy,origz : out std_logic_vector(27 downto 0);
    m11,m12,m13,m21,m22,m23,m31,m32,m33 : out std_logic_vector(15 downto 0);
    bkcolour : out std_logic_vector(20 downto 0);
    -- Texture Info Interface
    texinfo : out std_logic_vector(20 downto 0);
    texaddr : in std_logic_vector(3 downto 0);

    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of rgconfigMemory is
  type state_type is (S_IDLE,S_WRITE);
  signal state : state_type;
  signal next_state : state_type;
  signal addr : std_logic_vector(3 downto 0);
  signal we : std_logic;
begin

  spraminst : spram
    generic map (21,4)
    port map(we,addr,texinfo,CfgData(20 downto 0),clk);

  addr <= CfgData(27 downto 24) when (CfgData_Ready = '0') else texaddr;
  we <= '1' when (CfgData_Ready = '1') and (CfgAddr = "1110") else '0';

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      origx <= (others => '0'); origy <= (others => '0'); 
      origz <= (others => '0');
      m11 <= (others => '1'); m12 <= (others => '0'); m13 <= (others => '0');
      m21 <= (others => '0'); m22 <= (others => '1'); m23 <= (others => '0');
      m31 <= (others => '0'); m32 <= (others => '0'); m33 <= (others => '1');
      bkcolour <= (others => '0');
    elsif (rising_edge (clk)) then
      state <= next_state;

      case (state) is
        when S_IDLE =>
          if CfgData_Ready = '1' then
            case (CfgAddr) is
              when "0001" => origx <= CfgData;
              when "0010" => origy <= CfgData;
              when "0011" => origz <= CfgData;
              when "0100" => m11 <= CfgData(15 downto 0);
              when "0101" => m12 <= CfgData(15 downto 0);
              when "0110" => m13 <= CfgData(15 downto 0);
              when "0111" => m21 <= CfgData(15 downto 0);
              when "1000" => m22 <= CfgData(15 downto 0);
              when "1001" => m23 <= CfgData(15 downto 0);
              when "1010" => m31 <= CfgData(15 downto 0);
              when "1011" => m32 <= CfgData(15 downto 0);
              when "1100" => m33 <= CfgData(15 downto 0);
              when "1101" => bkcolour <= CfgData(20 downto 0);
              when others =>
            end case;
          end if;
        when others =>
      end case;
    end if;
  end process;

  process (state,cfgData_Ready)
  begin
    case (state) is
      when S_IDLE =>
        want_CfgData <= '1';
        if CfgData_Ready = '1' then
          next_state <= S_WRITE;
        else
          next_state <= S_IDLE;
        end if;
      when S_WRITE =>
        Want_CfgData <= '0';
        if CfgData_Ready = '0' then
          next_state <= S_IDLE;
        else
          next_state <= S_WRITE;
        end if;
    end case;
  end process;

end rtl;
