library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity resultstate is 
  port(
    commit : in std_logic;

    -- Input Data Signals
    t1,t2,t3 : in std_logic_vector(31 downto 0);
    u1,u2,u3,v1,v2,v3 : in std_logic_vector(15 downto 0);
    id1,id2,id3 : in std_logic_vector(15 downto 0);
    hit1,hit2,hit3 : in std_logic;
    resultID : in std_logic_vector(1 downto 0);

    resultready : out std_logic;
    resultdata  : out std_logic_vector(31 downto 0);
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of resultstate is
  type state_type is (S_IDLE,S_WRITE1,S_WRITE2,S_WRITE3,S_WRITE4,S_WRITE5,S_WRITE6,S_WRITE7,
                      S_WRITE8, S_WRITE9);
  signal state : state_type;
  signal next_state : state_type;

  signal t1b,t2b,t3b : std_logic_vector(31 downto 0);
  signal u1b,u2b,u3b,v1b,v2b,v3b : std_logic_vector(15 downto 0);
  signal id1b,id2b,id3b : std_logic_vector(15 downto 0);
  signal hit1b,hit2b,hit3b : std_logic;
  signal resultIDb : std_logic_vector(1 downto 0);
begin
  Process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      t1b <= (others => '0'); t2b <= (others => '0'); t3b <= (others => '0');
      u1b <= (others => '0'); u2b <= (others => '0'); u3b <= (others => '0');
      v1b <= (others => '0'); v2b <= (others => '0'); v3b <= (others => '0');
      id1b <= (others => '0'); id2b <= (others => '0'); id3b <= (others => '0');
      hit1b <= '0'; hit2b <= '0'; hit3b <= '0';
      resultready <= '0';
      resultdata <= (others => '0');
      resultIDb <= (others => '0');
    elsif (rising_edge(clk)) then
      state <= next_state;
      resultready <= '0';
      resultdata <= (others => '-');
      case state is
        when S_IDLE =>
          if (commit = '1') then
            t1b <= t1; t2b <= t2; t3b <= t3;
            u1b <= u1; u2b <= u2; u3b <= u3; 
            v1b <= v1; v2b <= v2; v3b <= v3;
            id1b <= id1; id2b <= id2; id3b <= id3; 
            hit1b <= hit1; hit2b <= hit2; hit3b <= hit3; 
            resultIDb <= resultID;
          end if;
        when S_WRITE1 =>
          resultdata <= t1b;
          resultready <= '1';
        when S_WRITE2 =>
          resultdata <= u1b & v1b;
        when S_WRITE3 =>
          resultdata <= "0000000000000" & resultIDb & hit1b & id1b;
        when S_WRITE4 =>
          resultdata <= t2b;
        when S_WRITE5 =>
          resultdata <= u2b & v2b;
        when S_WRITE6 =>
          resultdata <= "000000000000000" & hit2b & id2b;
        when S_WRITE7 =>
          resultdata <= t3b;
        when S_WRITE8 =>
          resultdata <= u3b & v3b;
        when S_WRITE9 =>
          resultdata <= "000000000000000" & hit3b & id3b;
      end case;
    end if;
  end process;

  process (state, commit)
  Begin
    case state IS
      when S_IDLE =>
        if (commit = '1') then 
          next_state <= S_WRITE1;
        else
          next_state <= S_IDLE;
        end if;
      when S_WRITE1 =>
        next_state <= S_WRITE2; 
      when S_WRITE2 =>
        next_state <= S_WRITE3; 
      when S_WRITE3 =>
        next_state <= S_WRITE4; 
      when S_WRITE4 =>
        next_state <= S_WRITE5;
      when S_WRITE5 =>
        next_state <= S_WRITE6; 
      when S_WRITE6 =>
        next_state <= S_WRITE7; 
      when S_WRITE7 =>
        next_state <= S_WRITE8; 
      when S_WRITE8 =>
        next_state <= S_WRITE9; 
      when S_WRITE9 =>
        next_state <= S_IDLE; 
    end case;
  end process;

end rtl;
