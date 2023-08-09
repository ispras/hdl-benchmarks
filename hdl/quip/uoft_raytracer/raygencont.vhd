library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity raygencont is 
  generic(
    id : std_logic := '0');
  port(
    go : in std_logic;
    initcount : in std_logic_vector(14 downto 0);
    busyout : out std_logic;
    cycles : buffer std_logic_vector(30 downto 0);
    nextaddr : out std_logic_vector(17 downto 0);
    nas0,nas1 : out std_logic;
    page : in std_logic;

    -- Memory Controller Interface
    dirReady : in std_logic;
    wantDir  : out std_logic;
    dirIn    : in std_logic_vector(47 downto 0);
    addrIn   : in std_logic_vector(14 downto 0);

    -- RayInterface Interface
    as : out std_logic;
    addr : buffer std_logic_vector(3 downto 0);
    ack : in std_logic;
    dir : out std_logic_vector(47 downto 0);

    -- Bound Controller Interface 0
    raygroup0 : out std_logic_vector(1 downto 0);
    raygroupvalid0 : out std_logic;
    busy0 : in std_logic;

    raygroup1 : out std_logic_vector(1 downto 0);
    raygroupvalid1 : out std_logic;
    busy1 : in std_logic;

    globalreset : in std_logic;
    clk : in std_logic;
    statepeek : out std_logic_vector(2 downto 0));
end;

architecture rtl of raygencont is	
  type state_type is (S_IDLE,S_SENDSET,S_WAITSENT,S_ENABLEBOUND0,S_ENABLEBOUND1);
  signal state : state_type;
  signal next_state : state_type;
  signal count : std_logic_vector(14 downto 0);
  signal first : std_logic;
  signal destaddr : std_logic_vector(17 downto 0);
  signal busy,loaded,groupID : std_logic_vector(1 downto 0);
  signal active : std_logic;
begin
  process(state)
  begin
    case (state) is
      when S_IDLE => statepeek <= "001";
      when S_SENDSET => statepeek <= "010";
      when S_WAITSENT => statepeek <= "011";
      when S_ENABLEBOUND0 => statepeek <= "100";
      when S_ENABLEBOUND1 => statepeek <= "101";
      when others => statepeek <= "000";
    end case;
  end process;

  busy <= busy1 & busy0;

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      cycles <= (others => '0');
      dir <= (others => '0');
      addr(1 downto 0) <= "00";
      groupID <= "00";
      count <= (others => '0');
      first <= '0';
      destAddr <= (others => '0');
      raygroupvalid0 <= '0';
      raygroupvalid1 <= '0';
      loaded <= "00";
      active <= '0';
    elsif (rising_edge (clk)) then
      state <= next_state;
      if (state /= S_IDLE) then
        cycles <= cycles + 1;
      end if;
      case (state) is
        when S_IDLE =>
          if go = '1' then 
            cycles <= (others => '0');
          end if; 
          addr(1 downto 0) <= "00";
          loaded <= "00";
          groupID <= "00";
          count <= initcount;
          active <= '0';
        when S_SENDSET =>
          dir <= dirIn;
          if dirReady = '1' and addr(1 downto 0) = "10" then
            if active = '0' then
              loaded(0) <= '1';
            else
              loaded(1) <= '1';
            end if;
          end if;
        when S_WAITSENT =>
          if (ack = '1') and (addr(1 downto 0) /= "10") then
            addr(1 downto 0) <= addr(1 downto 0) + "01";
          end if;
          if (ack = '1') and addr(1 downto  0) = "10" then
            if loaded(0) = '1' and busy(0) = '0' then 
              raygroupvalid0 <= '1';
            elsif loaded(1) = '1' and busy(1) = '0' then
              raygroupvalid1 <= '1';
            elsif loaded(0) = '0' then
              active <= '0';
              addr(1 downto 0) <= "00";
            elsif loaded(1) = '0' then
              active <= '1';
              addr(1 downto 0) <= "00";
            end if;
          end if;
        when S_ENABLEBOUND0 =>
          if busy(0) = '1' then
            groupID(0) <= not groupID(0);
            raygroupvalid0 <= '0';
            count <= count - 1;
            if loaded(1) = '1' and busy(1) = '0' then
              raygroupvalid1 <= '1';
            elsif loaded(1) = '0' then
              active <= '1';
            else
              active <= '0';
            end if;
          end if;
          loaded(0) <= '0';
          addr(1 downto 0) <= "00"; 
        when S_ENABLEBOUND1 =>
          if busy(1) = '1' then
            groupID(1) <= not groupID(1);
            raygroupvalid1 <= '0';
            count <= count - 1;
            if loaded(0) = '1' and busy(0) = '0' then
              raygroupvalid0 <= '1';
            elsif loaded(0) = '0' then
              active <= '0';
            else
              active <= '1';
            end if;
          end if;
          loaded(1) <= '0';
          addr(1 downto 0) <= "00"; 
        when others =>
      end case;
    end if;
  end process;

  busyout <= '0' when state = S_IDLE else '1';
  raygroup0 <= '0' & groupID(0);
  raygroup1 <= '1' & groupID(1);
  addr(3 downto 2) <= '0' & groupID(0) when active = '0' else '1' & groupID(1);
  nextaddr <= "11" & page & addrIn;
  nas0 <= '1' when (state = S_SENDSET and addr(1 downto 0) = "00" and dirReady = '1' and active = '0') else '0';
  nas1 <= '1' when (state = S_SENDSET and addr(1 downto 0) = "00" and dirReady = '1' and active = '1') else '0';

  process (state,go,ack,busy,dirReady,addr,count,loaded)
  begin
    as <= '0';
    wantDir <= '0';
    case (state) is
      when S_IDLE =>
        if (go = '1') then
          next_state <= S_SENDSET;
        else
          next_state <= S_IDLE;
        end if;
      when S_SENDSET =>
        as <= dirReady;
        wantdir <= '1';
        if dirReady = '1' then 
          next_state <= S_WAITSENT;
        else
          next_State <= S_SENDSET;
        end if;
      when S_WAITSENT =>
        wantdir <= '0';
        as <= '1';
        if (ack = '1') and (addr(1 downto 0) /= "10") then
          next_state <= S_SENDSET;
        elsif (ack = '1') then
          if loaded(0) = '1' and busy(0) = '0' then 
            next_state <= S_ENABLEBOUND0;
          elsif loaded(1) = '1' and busy(1) = '0' then
            next_state <= S_ENABLEBOUND1;
          elsif loaded /= "11" then
            next_state <= S_SENDSET;
          else
            next_state <= S_WAITSENT;
          end if;
        else
          next_state <= S_WAITSENT;
        end if;
      when S_ENABLEBOUND1 =>
        if busy(1) = '0' then
          next_state <= S_ENABLEBOUND1;
        elsif loaded(0) = '1' and busy(0) = '0' then
          next_state <= S_ENABLEBOUND0;
        elsif (count > 0)  then
          next_state <= S_SENDSET;
        else
          next_state <= S_IDLE;
        end if;                
      when S_ENABLEBOUND0 =>
        if busy(0) = '0' then
          next_state <= S_ENABLEBOUND0;
        elsif loaded(1) = '1' and busy(1) = '0' then
          next_state <= S_ENABLEBOUND1;
        elsif (count > 0) then
          next_state <= S_SENDSET;
        else
          next_state <= S_IDLE;
        end if;                
    end case;
  end process;

end rtl;
