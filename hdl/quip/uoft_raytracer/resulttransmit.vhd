library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity resulttransmit is 
  port(
    valid01,valid10 : in std_logic;
    id01a,id01b,id01c : in std_logic_vector(15 downto 0);
    id10a,id10b,id10c : in std_logic_vector(15 downto 0);
    hit01a,hit01b,hit01c : in std_logic;
    hit10a,hit10b,hit10c : in std_logic;
    u01a,u01b,u01c,v01a,v01b,v01c : in std_logic_vector(15 downto 0);
    u10a,u10b,u10c,v10a,v10b,v10c : in std_logic_vector(15 downto 0);
    -- Interchip Bus Signals
    rgResultData   : out std_logic_vector(31 downto 0);
    rgResultReady  : out std_logic;
    rgResultSource : out std_logic_vector(1 downto 0);

    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of resulttransmit is
  type state_type is (S_IDLE,S_SEND01A,S_SEND01B,S_SEND01C,S_SEND01D,
                             S_SEND10A,S_SEND10B,S_SEND10C,S_SEND10D);
  signal state : state_type;
  signal next_state : state_type;
  signal hit01al,hit01bl,hit01cl : std_logic;
  signal hit10al,hit10bl,hit10cl : std_logic;
  signal pending01,pending10 : std_logic;
  signal valid01d,valid10d : std_logic;
begin

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      pending01 <= '0';
      pending10 <= '0';
      rgresultdata <= (others => '0');
      rgresultsource <= (others => '0');
      rgresultready <= '0';
    elsif (rising_edge (clk)) then
      valid01d <= valid01;
      valid10d <= valid10;
      if valid01 = '1' then
        pending01 <= '1';
      end if;
      if valid01d = '1' then
        hit01al <= hit01a;
        hit01bl <= hit01b;
        hit01cl <= hit01c;
      end if;
      if valid10 = '1' then
        pending10 <= '1';
      end if;
      if valid10d = '1' then
        hit10al <= hit10a;
        hit10bl <= hit10b;
        hit10cl <= hit10c;
      end if;
      rgResultReady <= '0';
      state <= next_state;
      case (state) is
        when S_SEND01A =>
          rgResultData <= id01a & id01b;
          rgResultReady <= '1';
          rgResultSource <= "01";
        when S_SEND01B =>
          rgResultData <= "0000000000000" & hit01al & hit01bl & hit01cl & id01c;
          rgResultReady <= '0';
          rgResultSource <= "01";
          pending01 <= '0';
        when S_SEND01C =>
          rgResultData <= "00000000" & u01a(15 downto 8) & u01b(15 downto 8) & u01c(15 downto 8);
          rgResultReady <= '0';
          rgResultSource <= "01";
        when S_SEND01D =>
          rgResultData <= "00000000" & v01a(15 downto 8) & v01b(15 downto 8) & v01c(15 downto 8);
          rgResultReady <= '0';
          rgResultSource <= "01";
        when S_SEND10A =>
          rgResultData <= id10a & id10b;
          rgResultReady <= '1';
          rgResultSource <= "10";
        when S_SEND10B =>
          rgResultData <= "0000000000000" & hit10al & hit10bl & hit10cl & id10c;
          rgResultReady <= '0';
          rgResultSource <= "10";
          pending10 <= '0';
        when S_SEND10C =>
          rgResultData <= "00000000" & u10a(15 downto 8) & u10b(15 downto 8) & u10c(15 downto 8);
          rgResultReady <= '0';
          rgResultSource <= "10";
        when S_SEND10D =>
          rgResultData <= "00000000" & v10a(15 downto 8) & v10b(15 downto 8) & v10c(15 downto 8);
          rgResultReady <= '0';
          rgResultSource <= "10";
        when others =>
      end case;
    end if;
  end process;

  process (state,pending01,pending10)
  begin
    case (state) is
      when S_IDLE =>
        if pending01 = '1' then
          next_state <= S_SEND01A;
        elsif pending10 = '1' then
          next_state <= S_SEND10A;
        else
          next_state <= S_IDLE;
        end if;
      when S_SEND01A =>
        next_state <= S_SEND01B;
      when S_SEND01B =>
        next_state <= S_SEND01C;
      when S_SEND01C =>
        next_state <= S_SEND01D;
      when S_SEND01D => 
        next_state <= S_IDLE;
      when S_SEND10A => 
        next_state <= S_SEND10B;
      when S_SEND10B => 
        next_state <= S_SEND10C;
      when S_SEND10C => 
        next_state <= S_SEND10D;
      when S_SEND10D =>
        next_state <= S_IDLE;
    end case;
  end process;

end rtl;
