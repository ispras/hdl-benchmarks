library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library work;
use work.complib.all;

entity resultwriter is 
  port(
    valid01,valid10 : in std_logic;
    id01a,id01b,id01c : in std_logic_vector(15 downto 0);
    id10a,id10b,id10c : in std_logic_vector(15 downto 0);
    hit01a,hit01b,hit01c : in std_logic;
    hit10a,hit10b,hit10c : in std_logic;
    u01a,u01b,u01c,v01a,v01b,v01c : in std_logic_vector(7 downto 0);
    u10a,u10b,u10c,v10a,v10b,v10c : in std_logic_vector(7 downto 0);

    addr : in std_logic_vector(17 downto 0);
    as01,as10 : in std_logic;

    -- Shade Data Interface
    bkcolour : in std_logic_vector(20 downto 0);
    shadedata : in std_logic_vector(63 downto 0);
    triID : out std_logic_vector(15 downto 0);
    wantshadedata : out std_logic;
    shadedataready : in std_logic;
    -- Texture Info Interface
    texinfo : in std_logic_vector(20 downto 0);
    texaddr : out std_logic_vector(3 downto 0);
    -- Texture Data Interface
    texeladdr : out std_logic_vector(17 downto 0);
    texel : in std_logic_vector(63 downto 0);
    wanttexel : out std_logic;
    texelready : in std_logic;

    dataout : out std_logic_vector(63 downto 0);
    addrout : out std_logic_vector(17 downto 0);
    write : out std_logic;
    ack   : in std_logic;
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of resultwriter is
  type state_type is (S_IDLE,S_WRITEBACK,S_READSHADEA,S_READSHADEA2,S_READSHADEB,S_READSHADEC,
                      S_READSHADEB2,S_READSHADEC2,S_READSHADEA3,S_READSHADEB3,S_READSHADEC3,
                      S_READSHADEAT, S_READSHADEBT, S_READSHADECT);
  signal state : state_type;
  signal next_state : state_type;

  signal pending01, pending10 : std_logic;
  signal process01 : std_logic;
  signal addrout01, addrout10 : std_logic_vector(17 downto 0);
  signal shiften01,shiften10  : std_logic;
  signal shadedataa, shadedatab, shadedatac : std_logic_vector(20 downto 0);
  signal hita,hitb,hitc : std_logic;
  signal selectuv : std_logic_vector(2 downto 0);
  signal blr,blg,blb : std_logic_vector(6 downto 0);
  signal texmap : std_logic;
  signal lmenable : std_logic;
  signal texelselect : std_logic_vector(1 downto 0);
  signal texelr, texelg, texelb : std_logic_vector(6 downto 0);
  signal texinfol : std_logic_vector(20 downto 0);
begin
  col16to21inst : col16to21
    port map(texel,texelselect,texelr,texelg,texelb);
  linearmapinst : linearmap
    port map(blb,blg,texinfol(17 downto 0),texeladdr,texelselect,texinfol(20 downto 18),lmenable,clk);

  bilinearimp : bilinearintrp
    port map(u01a,u01b,u01c,v01a,v01b,v01c,u10a,u10b,u10c,v10a,v10b,v10c,
             selectuv,shadedata(41 downto 35), shadedata(62 downto 56),
             shadedata(20 downto 14),shadedata(34 downto 28),shadedata(55 downto 49),
             shadedata(13 downto 7),shadedata(27 downto 21),shadedata(48 downto 42),
             shadedata(6 downto 0),blr,blg,blb,clk);

  fifo3insta : fifo3
    port map(addr,as01,addrout01,shiften01,globalreset,clk);

  fifo3instb : fifo3
    port map(addr,as10,addrout10,shiften10,globalreset,clk);

  shiften01 <= '1' when process01 = '1' and (state = S_WRITEBACK) and ack = '1' else '0';
  shiften10 <= '1' when process01 = '0' and (state = S_WRITEBACK) and ack = '1' else '0';
  hita <= (hit01a and process01) or (hit10a and not process01);
  hitb <= (hit01b and process01) or (hit10b and not process01);
  hitc <= (hit01c and process01) or (hit10c and not process01);
  texaddr <= shadedata(59 downto 56);

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      pending01 <= '0';
      pending10 <= '0';
      shadedataa <= (others => '0');
      shadedatab <= (others => '0');
      shadedatac <= (others => '0');
      process01 <= '0';
      texmap <= '0';
      texinfol <= (others => '0');
    elsif (rising_edge (clk)) then
      state <= next_state;
      if valid01 = '1' then
        pending01 <= '1';
      end if;
      if valid10 = '1' then
        pending10 <= '1';
      end if;
      case (state) is
        when S_IDLE =>
          process01 <= pending01;
        when S_WRITEBACK =>
          if ack = '1' and process01 = '1' then
            pending01 <= '0';
          elsif ack = '1' and process01 = '0' then
            pending10 <= '0';
          end if;
        when S_READSHADEA =>
          if hita = '1' then
            shadedataa <= shadedata(20 downto 0);
            texmap <= (not shadedata(63)) and shadedata(62);
          else
            shadedataa <= bkcolour;
          end if;
        when S_READSHADEA2 =>
          texinfol <= texinfo;
        when S_READSHADEB2 =>
          texinfol <= texinfo;
        when S_READSHADEC2 =>
          texinfol <= texinfo;
        when S_READSHADEAT =>
          shadedataa(6 downto 0) <= texelb;
          shadedataa(13 downto 7) <= texelg;
          shadedataa(20 downto 14) <= texelr;
        when S_READSHADEBT =>
          shadedatab(6 downto 0) <= texelb;
          shadedatab(13 downto 7) <= texelg;
          shadedatab(20 downto 14) <= texelr;
        when S_READSHADECT =>
          shadedatac(6 downto 0) <= texelb;
          shadedatac(13 downto 7) <= texelg;
          shadedatac(20 downto 14) <= texelr;
        when S_READSHADEA3 =>
          shadedataa(6 downto 0) <= blb;
          shadedataa(13 downto 7) <= blg;
          shadedataa(20 downto 14) <= blr;
        when S_READSHADEB3 =>
          shadedatab(6 downto 0) <= blb;
          shadedatab(13 downto 7) <= blg;
          shadedatab(20 downto 14) <= blr;
        when S_READSHADEC3 =>
          shadedatac(6 downto 0) <= blb;
          shadedatac(13 downto 7) <= blg;
          shadedatac(20 downto 14) <= blr;
        when S_READSHADEB =>
          if hitb = '1' then
            shadedatab <= shadedata(20 downto 0);
            texmap <= (not shadedata(63)) and shadedata(62);
          else
            shadedatab <= bkcolour;
          end if;
        when S_READSHADEC =>
          if hitc = '1' then
            shadedatac <= shadedata(20 downto 0);
            texmap <= (not shadedata(63)) and shadedata(62);
          else
            shadedatac <= bkcolour;
          end if;
        when others =>
      end case;
    end if;
  end process;

  dataout <= '0' & shadedataa & shadedatab & shadedatac;

  addrout <= addrout01 when process01 = '1' else addrout10;
  write <= '1' when state = S_WRITEBACK else '0';

  process (state,process01,pending10,ack,shadedataready,
           id01a,id01b,id01c,id10a,id10b,id10c,selectuv,
           hita,hitb,hitc,shadedata,pending01,texmap,texelready)
  begin
    wantshadedata <= '0';
    triID <= (others => '-');
    selectuv <= (others => '-');
    lmenable <= '0';
    wanttexel <= '0';
    case (state) is
      when S_IDLE =>
        if pending01 = '1' or pending10 = '1' then
          next_state <= S_READSHADEA;
        else
          next_state <= S_IDLE;
        end if;
      when S_READSHADEA =>
        wantshadedata <= '1';
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "00";
        if process01 = '1' then
          triID <= ID01a;
        else
          triID <= ID10a;
        end if;
        if shadedataready = '1' then
          if hita = '1' and (shadedata(63) = '1' or shadedata(63 downto 62) = "01") then
            next_state <= S_READSHADEA2;
          else
            next_state <= S_READSHADEB;
          end if;
        else
          next_state <= S_READSHADEA;
        end if;
      when S_READSHADEA2 =>
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "00";
        next_state <= S_READSHADEA3;
      when S_READSHADEA3 =>
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "00";
        lmenable <= '1';
        if texmap = '1' then
          next_state <= S_READSHADEAT;
        else
          next_state <= S_READSHADEB;
        end if;
      when S_READSHADEAT =>
        wanttexel <= '1';
        if texelready = '1' then
          next_state <= S_READSHADEB;
        else
          next_state <= S_READSHADEAT;
        end if;
      when S_READSHADEBT =>
        wanttexel <= '1';
        if texelready = '1' then
          next_state <= S_READSHADEC;
        else
          next_state <= S_READSHADEBT;
        end if;
      when S_READSHADECT =>
        wanttexel <= '1';
        if texelready = '1' then
          next_state <= S_WRITEBACK;
        else
          next_state <= S_READSHADECT;
        end if;
      when S_READSHADEB2 =>
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "01";
        next_state <= S_READSHADEB3;
      when S_READSHADEB3 =>
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "01";
        lmenable <= '1';
        if texmap = '1' then
          next_state <= S_READSHADEBT;
        else
          next_state <= S_READSHADEC;
        end if;
      when S_READSHADEC2 =>
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "10";
        next_state <= S_READSHADEC3;
      when S_READSHADEC3 =>
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "10";
        if texmap = '1' then
          next_state <= S_READSHADECT;
        else
          next_state <= S_WRITEBACK;
        end if;
        lmenable <= '1';
      when S_READSHADEB =>
        wantshadedata <= '1';
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "01";
        if process01 = '1' then
          triID <= ID01b;
        else
          triID <= ID10b;
        end if;
        if shadedataready = '1' then
          if hitb = '1' and (shadedata(63) = '1' or shadedata(63 downto 62) = "01") then
            next_state <= S_READSHADEB2;
          else
            next_state <= S_READSHADEC;
          end if;
        else
          next_state <= S_READSHADEB;
        end if;
      when S_READSHADEC =>
        wantshadedata <= '1';
        selectuv(2) <= not process01;
        selectuv(1 downto 0) <= "10";
        if process01 = '1' then
          triID <= ID01c;
        else
          triID <= ID10c;
        end if;
        if shadedataready = '1' then
          if hitc = '1' and (shadedata(63) = '1' or shadedata(63 downto 62) = "01") then
            next_state <= S_READSHADEC2;
          else
            next_state <= S_WRITEBACK;
          end if;
        else
          next_state <= S_READSHADEC;
        end if;
      when S_WRITEBACK =>
        if ack = '1' then
          next_state <= S_IDLE;
        else 
          next_state <= S_WRITEBACK;
        end if;
    end case;
  end process;

end rtl;
