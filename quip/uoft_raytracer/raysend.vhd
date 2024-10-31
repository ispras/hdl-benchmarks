library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity raysend is 
  port(
    as : in std_logic;
    ack : buffer std_logic;
    addr : in std_logic_vector(3 downto 0);
    dir : in std_logic_vector(47 downto 0);
    origx,origy,origz : in std_logic_vector(27 downto 0);

    rgData      : out std_logic_vector(31 downto 0);
    rgAddr      : out std_logic_vector(3 downto 0);   
    rgWE        : out std_logic_vector(2 downto 0);
    rgAddrValid : out std_logic;
    rgDone      : in std_logic;

    globalreset : in std_logic;
    clk : in std_logic;
    statepeek : out std_logic_vector(2 downto 0));
end;

architecture rtl of raysend is	
  type state_type is (S_IDLE,S_ORIGX,S_ORIGY,S_ORIGZ,S_DIRXY,S_DIRZ,
                             S_ORIGXWAIT,S_ORIGYWAIT,S_ORIGZWAIT,S_DIRXYWAIT);
  signal state : state_type;
  signal next_state : state_type;

begin
  process(state)
  begin
    case state is
      when S_IDLE => statepeek <= "001";
      when S_ORIGX => statepeek <= "010";
      when S_ORIGY => statepeek <= "011";
      when S_ORIGZ => statepeek <= "100";
      when S_DIRXY => statepeek <= "101";
      when S_DIRZ  => statepeek <= "110";
      when others => statepeek <= "000";
    end case;
  end process;

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      ack <= '0';
      rgWe <= "000";
      rgData <= (others => '0');
      rgAddrValid <= '0';
      rgAddr <= (others => '0');
    elsif (rising_edge (clk)) then
      state <= next_state;

      case (state) is
        when S_IDLE =>
          if ((as = '1') and (ack = '0')) then
            rgData <= "0000" & origx;
            rgWe   <= "001";
            rgAddrValid <= '1';
            rgAddr <= addr;
          end if;
          if (as = '0' and ack = '1') then 
            ack <= '0';
          end if;
        when S_ORIGX =>
          if rgDONE = '1' then
            rgAddrValid <= '0';
          end if;
        when S_ORIGXWAIT =>
          rgData <= "0000" & origy;
          rgWe <= "010";
          rgAddrValid <= '1';
        when S_ORIGY =>
          if rgDONE = '1' then
            rgAddrValid <= '0';
          end if;
        when S_ORIGYWAIT =>
          rgData <= "0000" & origz;
          rgWe <= "011";   
          rgAddrValid <= '1';
        when S_ORIGZ =>
          if rgDONE = '1' then
            rgAddrValid <= '0';
          end if;
        when S_ORIGZWAIT =>
          rgData <= dir(31 downto 16) & dir(47 downto 32);
          rgWe <= "100";   
          rgAddrValid <= '1';   
        when S_DIRXY =>
          if rgDONE = '1' then
            rgAddrValid <= '0';
          end if;
        when S_DIRXYWAIT =>
          rgData <= "0000000000000000" & dir(15 downto 0);
          rgWe <= "101";   
          rgAddrValid <= '1'; 
        when S_DIRZ =>
          ack <= '1'; 
          if rgDONE = '1' then
            rgAddrValid <= '0';
          end if;
        when others =>
      end case;
    end if;
  end process;

  process (state,ack,as,rgdone)
  begin
    case (state) is
      when S_IDLE =>
        if ((as = '1') and (ack = '0')) then
          next_state <= S_ORIGX;
        else
          next_state <= S_IDLE;
        end if;
      when S_ORIGX =>
        if rgDone = '1' then
          next_state <= S_ORIGXWAIT;
        else
          next_state <= S_ORIGX;
        end if;
      when S_ORIGXWAIT =>
        next_state <= S_ORIGY;
      when S_ORIGY =>
        if rgDone = '1' then
          next_state <= S_ORIGYWAIT;
        else
          next_state <= S_ORIGY;
        end if;
      when S_ORIGYWAIT =>
        next_state <= S_ORIGZ;
      when S_ORIGZ =>
        if rgDone = '1' then
          next_state <= S_ORIGZWAIT;
        else
          next_state <= S_ORIGZ;
        end if;
      when S_ORIGZWAIT =>
        next_state <= S_DIRXY;
      when S_DIRXY =>
        if rgDone = '1' then
          next_state <= S_DIRXYWAIT;
        else
          next_state <= S_DIRXY;
        end if;
      when S_DIRXYWAIT =>
        next_state <= S_DIRZ;
      when S_DIRZ =>
        if rgDone = '1' then
          next_state <= S_IDLE;
        else
          next_state <= S_DIRZ;
        end if;
    end case;
  end process;

end rtl;
