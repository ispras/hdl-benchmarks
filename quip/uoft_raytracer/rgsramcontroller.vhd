library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RGsramcontroller is 
  port(
    want_addr : out std_logic;
    addr_ready : in std_logic;
    addrin : in std_logic_vector(17 downto 0);
    want_data : out std_logic;
    data_ready : in std_logic;
    datain : in std_logic_vector(63 downto 0);
    want_read : in std_logic;
    read_ready : out std_logic;
    dataout : out std_logic_vector(63 downto 0);

    dirReady : out std_logic;
    wantDir  : in std_logic;
    sramdatal  : out std_logic_vector(47 downto 0);
    addr       : out std_logic_vector(14 downto 0);

    wantwriteback : in std_logic;
    writebackack  : out std_logic;
    writebackdata : in std_logic_vector(63 downto 0);
    writebackaddr : in std_logic_vector(17 downto 0);
    
    -- Frame Buffer Interface 
    fbdata : out std_logic_vector(63 downto 0);
    fbnextscanline : in std_logic; 
    fbdatavalid : out std_logic;
    fbpage : in std_logic;

    -- Shading Data Interface
    shadedata : out std_logic_vector(63 downto 0);
    triID : in std_logic_vector(15 downto 0);
    wantshadedata : in std_logic;
    shadedataready : out std_logic;

    -- Texture Data Interface
    texeladdr : in std_logic_vector(17 downto 0);
    texel : out std_logic_vector(63 downto 0);
    wanttexel : in std_logic;
    texelready : out std_logic;

    tm3_sram_data : inout std_logic_vector(63 downto 0);
    tm3_sram_addr : out std_logic_vector(18 downto 0);
    tm3_sram_we   : out std_logic_vector(7 downto 0);
    tm3_sram_oe   : out std_logic_vector(1 downto 0);
    tm3_sram_adsp : out std_logic;
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of RGsramcontroller is	
  type state_type is (S_IDLE,S_LATCHADDR,S_READ,S_WRITE,S_WAIT,S_READRAY,S_WRITEBACK,
                      S_FBREAD,S_FBNEXTSCANLINE,S_READSHADE,S_READTEXEL);
  signal state : state_type;
  signal next_state : state_type;

  signal waddress : std_logic_vector(17 downto 0);
  signal faddress : std_logic_vector(14 downto 0);
  signal fcount : std_logic_vector(6 downto 0);
  signal fbdatavalidl : std_logic;
begin
  dataout <= tm3_sram_data;
  addr <= tm3_sram_data(62 downto 48);
  shadedata <= tm3_sram_data;
  texel <= tm3_sram_data;

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      waddress <= (others => '0');
      faddress <= (others => '0');
      fcount <= "1101011";
      fbdatavalid <= '0';
      fbdatavalidl <= '0';
      shadedataready <= '0';
      texelready <= '0';
      sramdatal <= (others => '0');
      fbdata <= (others => '0');
    elsif (rising_edge (clk)) then
      state <= next_state;

      sramdatal <= tm3_sram_data(47 downto 0);

      fbdata <= tm3_sram_data;
      fbdatavalid <= fbdatavalidl;
      fbdatavalidl <= '0';
      shadedataready <= '0';
      texelready <= '0';

      case (state) is
        when S_IDLE =>
          if (addr_ready = '1') then
            waddress <= addrin;
          end if;
        when S_WRITE =>
          waddress <= waddress+1;
        when S_READ => 
          if (want_read = '0') then
            waddress <= waddress+1;
          end if;
        when S_READRAY =>
          if wantDir = '0' then
            waddress <= waddress+1;
          end if;
        when S_FBREAD =>
          fbdatavalidl <= '1';
          if (fcount /= 0) then
            faddress <= faddress + 1;
            fcount <= fcount - 1;
          end if;
        when S_FBNEXTSCANLINE =>
          fcount <= "1101011";
          if faddress = 25680 then
            faddress <= (others => '0');
          end if;
        when S_READTEXEL =>
          texelready <= '1';
        when S_READSHADE =>
          shadedataready <= '1';
        when others =>
      end case;
    end if;
  end process;

  process(state,addr_ready,data_ready,waddress,datain,wantdir,want_read, 
          wantwriteback,writebackdata,writebackaddr,fcount,fbpage,faddress,fbnextscanline,
          triID,wantshadedata,wanttexel,texeladdr)
  begin
    tm3_sram_we <= "11111111";
    tm3_sram_oe <= "01";
    tm3_sram_adsp <= '0';
    tm3_sram_data <= (others => 'Z');
    tm3_sram_addr <= '0' & waddress;
    want_addr <= '1';
    want_data <= '1';
    read_ready <= '1';
    dirReady <= '0';
    writebackack <= '0';
    case (state) is
      when S_IDLE =>
        if (addr_ready = '1') then
          next_state <= S_LATCHADDR;
        elsif (want_read = '1') then
          next_state <= S_READ;
        elsif (data_ready = '1') then
          next_state <= S_WRITE;
        elsif (wantDir = '1') then
          next_state <= S_READRAY;
        elsif (wantWriteback = '1') then
          next_state <= S_WRITEBACK;
        elsif (wantShadeData = '1') then
          next_state <= S_READSHADE;
        elsif (wantTexel = '1') then
          next_state <= S_READTEXEL;
        elsif (fcount /= 0) then
          next_state <= S_FBREAD;
        elsif (fbnextscanline = '1') then
          next_state <= S_FBNEXTSCANLINE;
        else
          next_state <= S_IDLE;
        end if;
      when S_READRAY =>
        dirReady <= '1';
        if wantDir = '0' then
          next_state <= S_IDLE;
        else
          next_state <= S_READRAY;
        end if;
      when S_LATCHADDR =>
        want_addr <= '0';
        if (addr_ready = '0') then
          next_state <= S_IDLE;
        else
          next_state <= S_LATCHADDR;
        end if;
      when S_FBREAD =>
        tm3_sram_addr <= "011" & fbpage & faddress;
        if (fcount = 1) or (addr_ready = '1') or (want_read = '1') or (data_ready = '1') or (wantDir = '1') or
           (wantWriteBack = '1') then
          next_state <= S_IDLE;
        else
          next_state <= S_FBREAD;
        end if; 
      when S_FBNEXTSCANLINE =>
        next_state <= S_FBREAD;
      when S_READ =>
        read_ready <= '0';
        if (want_read = '0') then
          next_state <= S_IDLE;
        else
          next_state <= S_READ;
        end if;
      when S_WRITEBACK =>
        tm3_sram_data <= writebackdata;
        tm3_sram_we <= "00000000";
        tm3_sram_oe <= "11";
        tm3_sram_adsp <= '0';
        tm3_sram_addr <= '0' & writebackaddr;
        writebackAck <= '1';
        next_state <= S_IDLE;
      when S_WRITE =>
        tm3_sram_data <= datain;
        tm3_sram_we <= "00000000";
        tm3_sram_oe <= "11";
        tm3_sram_adsp <= '0';
        want_data <= '0';
        next_state <= S_WAIT;
      when S_WAIT =>
        if data_ready = '0' then
          next_state <= S_IDLE;
        else
          next_state <= S_WAIT;
        end if;
        want_data <= '0';
      when S_READTEXEL =>
        tm3_sram_addr <= "0" & texeladdr;
        next_state <= S_IDLE;
      when S_READSHADE =>
        tm3_sram_addr <= "010" & triID; 
        next_state <= S_IDLE;
    end case;
  end process;

end rtl;
