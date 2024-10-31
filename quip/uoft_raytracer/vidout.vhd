library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vidout is 
  port(
    pixeldataA,pixeldataB,pixeldataC : in std_logic_vector(20 downto 0);
    nextpixelA,nextpixelB,nextpixelC : out std_logic;
    startframe,nextscanline : out std_logic;
    globalreset : in std_logic;
    tm3_clk_v0: in std_logic;
    tm3_vidout_red,tm3_vidout_green,tm3_vidout_blue : out std_logic_vector( 9 downto 0);
    tm3_vidout_clock : out std_logic;
    tm3_vidout_hsync : inout std_logic;
    tm3_vidout_vsync,tm3_vidout_blank : out std_logic);
end vidout;

architecture rtl of vidout is
  signal horiz: std_logic_vector(9 downto 0);
  signal vert: std_logic_vector(9 downto 0);
  signal video_state : std_logic;
  signal nothsyncd : std_logic;
  signal primarypixel,secondarypixel : std_logic_vector(20 downto 0);
  signal primarybuffer,secondarybuffer : std_logic_vector(20 downto 0);
  signal primarynext,secondarynext : std_logic;
  signal pselect : std_logic_vector(1 downto 0);
  signal tm3_vidout_red_1 : std_logic_vector(7 downto 0);
  signal tm3_vidout_green_1 : std_logic_vector(7 downto 0);
  signal tm3_vidout_blue_1 : std_logic_vector(7 downto 0);
  signal tm3_vidout_red_2 : std_logic_vector(8 downto 0);
  signal tm3_vidout_green_2 : std_logic_vector(8 downto 0);
  signal tm3_vidout_blue_2 : std_logic_vector(8 downto 0);
	

begin 
  process (horiz,vert) 
  begin
    primarynext <= '0';
    secondarynext <= '0';
    if (horiz < 641 and vert < 480) and video_state = '0' then
      if vert(0) = '0' then  -- Horizontaly Interpt Line
        if horiz(0) = '0' then
          primarynext <= '1';
        end if;
      else  -- Bilinear Line
        if horiz(0) = '0' then
          primarynext <= '1';
          secondarynext <= '1';
        end if;
      end if;
    end if;
  end process;

  process (pixeldataA,pixeldataB,pixeldataC,pselect,secondarynext,primarynext)
  begin
    nextpixelA <= '0';
    nextpixelB <= '0';
    nextpixelC <= '0';
    case pselect is
      when "00" => primarypixel <= pixeldataA;
                   secondarypixel <= pixeldataB;
                   nextpixelA <= primarynext;
                   nextpixelB <= secondarynext;
      when "01" => primarypixel <= pixeldataB;
                   secondarypixel <= pixeldataC;
                   nextpixelB <= primarynext;
                   nextpixelC <= secondarynext;
      when "10" => primarypixel <= pixeldataC;
                   secondarypixel <= pixeldataA;
                   nextpixelC <= primarynext;
                   nextpixelA <= secondarynext;
      when others => primarypixel <= (others => '0');
                     secondarypixel <= (others => '0');
    end case;
  end process;

  tm3_vidout_clock <= not(video_state);

  process(tm3_clk_v0,globalreset) 
  begin
    if globalreset = '1' then
       nothsyncd <= '0';
       vert <= (others => '0');
       horiz <= (others => '0');
       startframe <= '0';
       pselect <= "00";
       video_state <= '0';
       tm3_vidout_blank <= '0';
       tm3_vidout_vsync <= '0';
       tm3_vidout_hsync <= '0';
       tm3_vidout_green <= (others => '0');
       tm3_vidout_red <= (others => '0');
       tm3_vidout_blue <= (others => '0');
       primarybuffer <= (others => '0');
       secondarybuffer <= (others => '0');
       nextscanline <= '0';
    elsif (tm3_clk_v0'event and tm3_clk_v0 = '1') then
      video_state <= not(video_state);

      -- Code that handles active scanline
      -- Code that handle new scanline requests
      nothsyncd <= not tm3_vidout_hsync;
      startframe <= '0';  
      nextscanline <= '0';
      if tm3_vidout_hsync = '1' and nothsyncd = '1' then
        if (vert < 478) and vert(0) = '0' then
          nextscanline <= '1';
        end if;
        if (vert < 480) and vert(0) = '1' then
          case pselect is
            when "00" => pselect <= "01";
            when "01" => pselect <= "10";
            when "10" => pselect <= "00";
            when others => pselect <= "--";
          end case;
        end if;
        if (vert = 525) then
          nextscanline <= '1';
          startframe <= '1';
          pselect <= "00";     
        end if;
      end if;      

      if video_state = '0' then
        if horiz = 800 then
          horiz <= "0000000000";
          if vert = 525 then
            vert <= "0000000000";
          else
            vert <= vert + 1;
          end if;
        else
          horiz <= horiz + 1;
        end if;
        if ((vert >= 491) AND (vert <= 493)) then
          tm3_vidout_vsync <= '1';
        else
          tm3_vidout_vsync <= '0';
        end if;
        if ((horiz >= 664) AND (horiz <= 760)) then
          tm3_vidout_hsync <= '1';
        else
          tm3_vidout_hsync <= '0';
        end if;
        if ((horiz < 640) AND (vert < 480)) then
          tm3_vidout_blank <= '1';
        else
          tm3_vidout_blank <= '0';
        end if;

        tm3_vidout_green <= (others => '-'); 
        tm3_vidout_red <= (others => '-');
        tm3_vidout_blue <= (others => '-');
        if (horiz < 643 and vert < 480) then
          if vert(0) = '0' then  -- Horizontaly Interpt Line
            if horiz(0) = '0' then
              primarybuffer <= primarypixel;
              tm3_vidout_red <= primarypixel(20 downto 14) & "000";
              tm3_vidout_green <= primarypixel(13 downto 7) & "000";
              tm3_vidout_blue <= primarypixel(6 downto 0) & "000";
            else
              primarybuffer <= primarypixel;
              
			  tm3_vidout_red_1 <= ('0' &primarypixel(20 downto 14))+('0' &primarybuffer(20 downto 14));
              tm3_vidout_red <= tm3_vidout_red_1 (7 downto 1) & "000";
			  
			  tm3_vidout_green_1 <= ('0' &primarypixel(13 downto 7))+('0' &primarybuffer(13 downto 7));
			  tm3_vidout_green <= tm3_vidout_green_1 (7 downto 1) & "000";            

			  tm3_vidout_blue_1 <= ('0'&primarypixel(6 downto 0))+('0' &primarybuffer(6 downto 0));
              tm3_vidout_blue <= tm3_vidout_blue_1 (7 downto 1) & "000";
			
			end if;
          else  -- Bilinear Line
            if horiz(0) = '0' then
              primarybuffer <= primarypixel;
              secondarybuffer <= secondarypixel;
              
			  
			  tm3_vidout_red_1 <= ('0' & primarypixel(20 downto 14))+('0' & secondarypixel(20 downto 14));
              tm3_vidout_red <= tm3_vidout_red_1 (7 downto 1) & "000"; 

			  tm3_vidout_green_1 <= ('0' & primarypixel(13 downto 7))+('0' & secondarypixel(13 downto 7));
              tm3_vidout_green <= tm3_vidout_green_1 (7 downto 1) & "000";
			  
			  tm3_vidout_blue_1 <= ('0' & primarypixel(6 downto 0))+('0' & secondarypixel(6 downto 0));
              tm3_vidout_blue <= tm3_vidout_blue_1 (7 downto 1) & "000";
			
			else
              tm3_vidout_red_2 <= ("00" &primarypixel(20 downto 14))+("00" &secondarypixel(20 downto 14))+
                                 ("00" &primarybuffer(20 downto 14))+("00" &secondarybuffer(20 downto 14));
              tm3_vidout_red <= tm3_vidout_red_2(8 downto 2) & "000";
			  
			  tm3_vidout_green_2 <= ("00" & primarypixel(13 downto 7))+("00" & secondarypixel(13 downto 7))+
                                   ("00" & primarybuffer(13 downto 7))+("00" & secondarybuffer(13 downto 7));
              tm3_vidout_green <= tm3_vidout_green_2(8 downto 2) & "000";
			  
			  tm3_vidout_blue_2 <= ("00" & primarypixel(6 downto 0))+("00" & secondarypixel(6 downto 0))+
                                  ("00" & primarybuffer(6 downto 0))+("00" & secondarybuffer(6 downto 0));
           	  tm3_vidout_blue  <= tm3_vidout_blue_2(8 downto 2) & "000";
		   
		    end if;
          end if;
        end if;
      end if;
    end if;
  end process;

end rtl;

