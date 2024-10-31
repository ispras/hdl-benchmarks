library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library work;
use work.complib.all;

entity listhandler is
  port(
    dataarrayin : in std_logic_vector(8*13-1 downto 0);
    commit : in std_logic;

    hitmask : in std_logic_vector(2 downto 0);
    ack     : in std_logic;   
    boundnodeID     : out std_logic_vector(9 downto 0);
    level           : out std_logic_vector(1 downto 0);
    empty,dataready : buffer std_logic;

    reset : in std_logic;
    globalreset : in std_logic;
    clk : in std_logic;

    peekoffset0,peekoffset1,peekoffset2 : out std_logic_vector(2 downto 0);
    peekhit : out std_logic;
    peekstate : out std_logic_vector(1 downto 0) );
end;

architecture rtl of listhandler is
  type state_type is (S_IDLE,S_WRITE,S_ALIGN);
  signal next_state, state : state_type;

  signal readlevel, writelevel : std_logic_vector(1 downto 0);
  signal offset0, offset1, offset2 : std_logic_vector(2 downto 0);
  signal address : std_logic_vector(4 downto 0);
  signal we : std_logic;
  signal datain,dataout : std_logic_vector(12 downto 0);
  signal lvempty : std_logic_vector(2 downto 0);
  signal busy : std_logic;
begin
  -- Debug Stuff
  peekoffset0 <= offset0;
  peekoffset1 <= offset1;
  peekoffset2 <= offset2;
  peekhit <= '1' when (datain(10) = '1' or datain(11) = '1' or datain(12) = '1') else '0';

  process (state)
  begin
    case (state) is
      when S_IDLE => peekstate <= "01";
      when S_WRITE => peekstate <= "10";
      when S_ALIGN => peekstate <= "11";
      when others => peekstate <= "00";
    end case;
  end process;

  -- Real Code
  ram : spram
    generic map(13,5)
    port map(we, address,dataout,datain,clk);

  level <= readlevel;
  boundnodeID <= dataout(9 downto 0);

  empty <= '1' when (lvempty = "111" and busy = '0') else '0';
  dataready <= '1' when ((dataout(10) = '1' and hitmask(0) = '1') or
                         (dataout(11) = '1' and hitmask(1) = '1') or
                         (dataout(12) = '1' and hitmask(2) = '1')) and 
                         (empty = '0') and (busy = '0') else '0';

  address(4 downto 3) <= readlevel;

  process (offset0,offset1,offset2,address)
  begin
    if address(4 downto 3) = "00" then
      address(2 downto 0) <= offset0;
    elsif address(4 downto 3) = "01" then
      address(2 downto 0) <= offset1;
    elsif address(4 downto 3) = "10" then
      address(2 downto 0) <= offset2;
    else
      address(2 downto 0) <= (others => '-');
    end if;
  end process;

  process (clk,globalreset)
  begin
     if (globalreset = '1') then
       state <= S_IDLE;
       lvempty <= (others => '1');
       busy <= '0';
       readlevel <= "00";
       writelevel <= "00";
       offset0 <= "000";
       offset1 <= "000";
       offset2 <= "000";
     elsif (rising_edge(clk)) then
       state <= next_state;
       case state is
         when S_IDLE =>
           if (reset = '1') then
             busy <= '0';
             lvempty <= (others => '1');
             readlevel <= "00"; writelevel <= "00";
             offset0 <= "000"; offset1 <= "000"; offset2 <= "000";
           elsif (commit = '1') then
             busy <= '1';
             if writelevel = "00" then
               offset0 <= "000";
             elsif writelevel = "01" then
               offset1 <= "000";
             elsif writelevel = "10" then
               offset2 <= "000";
             end if;
             readlevel <= writelevel;
           elsif (ack = '1') then
             writelevel <= readlevel+1;
             busy <= '1';  -- This will ensure that align skips one
           end if;
         when S_WRITE =>
           if readlevel = "00" then
             offset0 <= offset0 + 1;
           elsif readlevel = "01" then
             offset1 <= offset1 + 1;
           elsif readlevel = "10" then 
             offset2 <= offset2 + 1;
           end if;
           if address(2 downto 0) = "111" then
             busy <= '0';
           end if;
           if datain(10) = '1' or datain(11) = '1' or datain(12) = '1' then
             if readlevel = "00" then
               lvempty(0) <= '0';
             elsif readlevel = "01" then
               lvempty(1) <= '0';
             elsif readlevel = "10" then
               lvempty(2) <= '0';
             end if;
          end if;
         when S_ALIGN =>
           busy <= '0';
           if empty = '0' and dataready = '0' then
             if readlevel = "00" then
               if offset0 = "111" then
                 lvempty(0) <= '1';
               else
                 offset0 <= offset0 + 1;
               end if;
             elsif readlevel = "01" then
               if offset1 = "111" then
                 lvempty(1) <= '1';
                 readlevel <= "00";
               else
                 offset1 <= offset1 + 1;
               end if;
             elsif readlevel = "10" then
               if offset2 = "111" then
                 lvempty(2) <= '1';
                 if lvempty(1) = '1' then
                   readlevel <= "00";
                 else
                   readlevel <= "01";
                 end if;
               else
                 offset2 <= offset2 + 1;
               end if;
             end if;
           end if;
       end case;
     end if;
  end process;

  process (state,commit,ack,address,dataarrayin,reset,dataready,empty)
  begin
    we <= '0';
    datain <= (others => '-');
    case state is
      when S_IDLE =>
        if reset = '1' then
          next_state <= S_IDLE;
        elsif commit = '1' then
          next_state <= S_WRITE;
        elsif (ack  = '1') or (dataready = '0' and empty = '0') then
          next_state <= S_ALIGN;
        else
          next_state <= S_IDLE;
        end if;
      when S_WRITE =>
        writelp : for k in 0 to 7 loop
          if k=address(2 downto 0) then
            datain <= dataarrayin((k+1)*13-1 downto k*13);
          end if;
        end loop writelp;
        we <= '1';
        if address(2 downto 0) = "111" then
          next_state <= S_ALIGN;
        else
          next_state <= S_WRITE;
        end if;
      when S_ALIGN => 
        if empty = '0' and dataready = '0' then
          next_state <= S_ALIGN;
        else
          next_state <= S_IDLE;
        end if;
    end case;
  end process;

end rtl;
