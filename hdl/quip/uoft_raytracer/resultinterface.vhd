library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity resultinterface is 
  port(
    t1b,t2b,t3b : out std_logic_vector(31 downto 0);
    u1b,u2b,u3b,v1b,v2b,v3b : out std_logic_vector(15 downto 0);
    id1b,id2b,id3b : out std_logic_vector(15 downto 0);
    hit1b,hit2b,hit3b : out std_logic;
    resultID : out std_logic_vector(1 downto 0);
    newdata : out std_logic;
    resultready : in std_logic;
    resultdata  : in std_logic_vector(31 downto 0);
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of resultinterface is
  type state_type is (S_IDLE,S_READ1,S_READ2,S_READ3,S_READ4,S_READ5,S_READ6,
                      S_READ7,S_READ8);
  signal state : state_type;
  signal next_state : state_type;

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
      resultID <= (others => '0');
      newdata <= '0';
    elsif (rising_edge(clk)) then
      state <= next_state;
      newdata <= '0';
      case state is
        when S_IDLE =>
          if (resultready = '1') then
            t1b <= resultdata;
          end if;
        when S_READ1 =>
          u1b <= resultdata(31 downto 16);
          v1b <= resultdata(15 downto 0);
        when S_READ2 =>
          id1b <= resultdata(15 downto 0);
          hit1b <= resultdata(16);
          resultID <= resultdata(18 downto 17);
        when S_READ3 =>
          t2b <= resultdata;
        when S_READ4 =>
          u2b <= resultdata(31 downto 16);
          v2b <= resultdata(15 downto 0);
        when S_READ5 =>
          id2b <= resultdata(15 downto 0);
          hit2b <= resultdata(16);
        when S_READ6 =>
          t3b <= resultdata;
        when S_READ7 =>
          u3b <= resultdata(31 downto 16);
          v3b <= resultdata(15 downto 0);
        when S_READ8 =>
          id3b <= resultdata(15 downto 0);
          hit3b <= resultdata(16);
          newdata <= '1';
     	
	  end case;
    end if;
  end process;

  process (state, resultready)
  Begin
    case state IS
      when S_IDLE =>
        if (resultready = '1')  then 
          next_state <= S_READ1;
        else
          next_state <= S_IDLE;
        end if;
      when S_READ1 =>
        next_state <= S_READ2;
      when S_READ2 =>
        next_state <= S_READ3;
      when S_READ3 =>
        next_state <= S_READ4;
      when S_READ4 =>
        next_state <= S_READ5;
      when S_READ5 =>
        next_state <= S_READ6;
      when S_READ6 =>
        next_state <= S_READ7;
      when S_READ7 =>
        next_state <= S_READ8;
      when S_READ8 =>
        next_state <= S_IDLE;
    end case;
  end process;

end rtl;
