library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity scanlinebuffer is 
  port(
    pixeldataA,pixeldataB,pixeldataC : out std_logic_vector(20 downto 0);
    nextpixelA,nextpixelB,nextpixelC : in std_logic;
    startframe, nextscanline : in std_logic;

    fbdata : in std_logic_vector(63 downto 0);
    fbnextscanline : out std_logic;
    fbdatavalid : in std_logic;

    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of scanlinebuffer is
  type state_type is (S_IDLE,S_READ1,S_READ2,S_READ3);

  signal state : state_type;
  signal next_state : state_type;
  signal weA,weB,weC : std_logic;
begin
  scanlineA : scanline
    port map(nextpixelA, weA, fbdata(62 downto 0),pixeldataA,globalreset,clk);
  scanlineB : scanline
    port map(nextpixelB, weB, fbdata(62 downto 0),pixeldataB,globalreset,clk);
  scanlineC : scanline
    port map(nextpixelC, weC, fbdata(62 downto 0),pixeldataC,globalreset,clk);

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      fbnextscanline <= '0';
    elsif (rising_edge(clk)) then
      state <= next_state;
      if fbdatavalid = '1' then 
        fbnextscanline <= '0';
      end if;
      case state is
        when S_IDLE =>
          if startframe = '1' and nextscanline = '1' then
            fbnextscanline <= '1';
          end if;
        when S_READ1 =>
          if nextscanline = '1' then
            fbnextscanline <= '1';
          end if;
        when S_READ2 =>
          if nextscanline = '1' then
            fbnextscanline <= '1';
          end if;
        when S_READ3 =>
          if nextscanline = '1' then
            fbnextscanline <= '1';
          end if;
      end case;
    end if;
  end process;

  process (state,nextscanline,fbdatavalid,startframe)
  Begin
    weA <= '0'; weB <= '0'; weC <= '0';
    case state IS
      when S_IDLE =>
        weA <= fbdatavalid;
        if nextscanline = '1' and startframe = '1' then
          next_state <= S_READ2;
        else
          next_state <= S_IDLE;
        end if;
      when S_READ1 =>
        weA <= fbdatavalid;
        if nextscanline = '1' then
          next_state <= S_READ2;
        else
          next_state <= S_READ1;
        end if;
      when S_READ2 =>
        weB <= fbdatavalid;
        if nextscanline = '1' then
          next_state <= S_READ3;
        else
          next_state <= S_READ2;
        end if;
      when S_READ3 =>
        weC <= fbdatavalid;
        if nextscanline = '1' then
          next_state <= S_READ1;
        else
          next_state <= S_READ3;
        end if;
    end case;
  end process;

end rtl;
