library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity resultrecieve is 
  port(
    valid01,valid10 : out std_logic;
    id01a,id01b,id01c : out std_logic_vector(15 downto 0);
    id10a,id10b,id10c : out std_logic_vector(15 downto 0);
    hit01a,hit01b,hit01c : out std_logic;
    hit10a,hit10b,hit10c : out std_logic;
    u01a,u01b,u01c,v01a,v01b,v01c : out std_logic_vector(7 downto 0);
    u10a,u10b,u10c,v10a,v10b,v10c : out std_logic_vector(7 downto 0);

    rgResultData   : in std_logic_vector(31 downto 0);
    rgResultReady  : in std_logic;
    rgResultSource : in std_logic_vector(1 downto 0);

    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of resultrecieve is
  type state_type is (S_IDLE,S_READ01A,S_READ01B,S_READ01C,S_READ10A,S_READ10B,S_READ10C);
  signal state : state_type;
  signal next_state : state_type;
begin

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      valid01 <= '0'; valid10 <= '0';
      hit01a <= '0'; hit01b <= '0'; hit01c <= '0';
      hit10a <= '0'; hit10b <= '0'; hit10c <= '0';
      id01a <= (others => '0'); id01b <= (others => '0'); id01c <= (others => '0');
      id10a <= (others => '0'); id10b <= (others => '0'); id10c <= (others => '0');
      u01a <= (others => '0'); u01b <= (others => '0'); u01c <= (others => '0');
      v01a <= (others => '0'); v01b <= (others => '0'); v01c <= (others => '0');
      u10a <= (others => '0'); u10b <= (others => '0'); u10c <= (others => '0');
      v10a <= (others => '0'); v10b <= (others => '0'); v10c <= (others => '0');
    elsif (rising_edge (clk)) then
      state <= next_state;
      valid01 <= '0';
      valid10 <= '0';
      case (state) is
        when S_IDLE =>
          if rgResultReady = '1' and rgResultSource = "01"  then 
            id01a <= rgResultData(31 downto 16);
            id01b <= rgResultData(15 downto 0);
          elsif rgResultReady = '1' and rgResultSource = "10" then
            id10a <= rgResultData(31 downto 16);
            id10b <= rgResultData(15 downto 0);
          end if;
        when S_READ01A =>
          id01c <= rgResultData(15 downto 0);
          hit01a <= rgResultData(18);
          hit01b <= rgResultData(17);
          hit01c <= rgResultData(16);
        when S_READ01B =>
          u01a <= rgResultData(23 downto 16);
          u01b <= rgResultData(15 downto 8);
          u01c <= rgResultData(7 downto 0);
        when S_READ01C =>
          v01a <= rgResultData(23 downto 16);
          v01b <= rgResultData(15 downto 8);
          v01c <= rgResultData(7 downto 0);
          valid01 <= '1';
        when S_READ10A =>
          id10c <= rgResultData(15 downto 0);
          hit10a <= rgResultData(18);
          hit10b <= rgResultData(17);
          hit10c <= rgResultData(16);
        when S_READ10B =>
          u10a <= rgResultData(23 downto 16);
          u10b <= rgResultData(15 downto 8);
          u10c <= rgResultData(7 downto 0);
        when S_READ10C =>
          v10a <= rgResultData(23 downto 16);
          v10b <= rgResultData(15 downto 8);
          v10c <= rgResultData(7 downto 0);
          valid10 <= '1';
        when others =>
      end case;
    end if;
  end process;

  process (state,rgResultReady,rgResultSource)
  begin
    case (state) is
      when S_IDLE =>
        if rgResultReady = '1' and rgResultSource = "01" then
          next_state <= S_READ01A;
        elsif rgResultReady = '1' and rgResultSource = "10" then
          next_state <= S_READ10A;
        else
          next_state <= S_IDLE;
        end if;
      when S_READ01A =>
        next_state <= S_READ01B;
      when S_READ01B =>
        next_state <= S_READ01C;
      when S_READ01C =>
        next_state <= S_IDLE;
      when S_READ10A =>
        next_state <= S_READ10B;
      when S_READ10B =>
        next_state <= S_READ10C;
      when S_READ10C =>
        next_state <= S_IDLE;
    end case;
  end process;

end rtl;
