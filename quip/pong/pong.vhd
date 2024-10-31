library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pong is
        Port (clock : in std_logic;
                        reset : in std_logic;
                        button1_up, button2_up, button1_down, button2_down : in std_logic;
                        Red : out std_logic_vector(7 downto 0);
                        Blue : out std_logic_vector(7 downto 0);
                        Green : out std_logic_vector(7 downto 0);
                        Horiz_Sync : out std_logic;
                        Vert_Sync : out std_logic
                        );
end pong;

architecture Behavioral of pong is

component monitor_visual is
    Port (clock : in std_logic;
           clock25en : in std_logic;
                ball_x, ball_y : in unsigned (9 downto 0); 
                racket1, racket2 : in unsigned (9 downto 0);
                score1, score2 : in std_logic_vector (1 to 9);
                Red : out std_logic_vector(7 downto 0);
          Blue : out std_logic_vector(7 downto 0);
          Green : out std_logic_vector(7 downto 0);
          HSync : out std_logic;
          VSync : out std_logic;
                vga_comp_synch_in : out std_logic
                );
end component;

component ball_move is
        Port (clock : in std_logic;
           clock25en : in std_logic;
                        reset : in std_logic;
                        racket1, racket2 : unsigned (9 downto 0);
                        score1_out, score2_out : out std_logic_vector (1 to 9);
                        ballx : out unsigned (9 downto 0);
                        bally : out unsigned (9 downto 0)
                        );
end component;

component racket_move is
        Port (clock : in std_logic;
           clock25en : in std_logic;
                        reset : in std_logic;
                        up1, up2, down1, down2 : in std_logic;
                        racket1_pos : out unsigned (9 downto 0);
                        racket2_pos : out unsigned (9 downto 0)
                        );
end component;

component device_in is
        Port(clock: in std_logic;
           clock25en : in std_logic;
                up1_in, up2_in, down1_in, down2_in : in std_logic;
                move : out std_logic_vector(0 to 3)
        );
end component;

signal vga_clock : std_logic;
signal clock50  : std_logic;
signal ball_x_pos : unsigned (9 downto 0);
signal ball_y_pos : unsigned (9 downto 0);
signal racket_1_pos : unsigned (9 downto 0);
signal racket_2_pos : unsigned (9 downto 0);
signal score_1 : std_logic_vector (1 to 9);
signal score_2 : std_logic_vector (1 to 9);
signal device_in_temp : std_logic_vector(0 to 3);

signal clock50en, clock25en : std_logic;
signal clk_delay : std_logic_vector(3 downto 1);

signal vga_comp_synch : std_logic;

begin

        clk_e:process(clock)
        begin
--          clk_delay(3) <= clk_delay(2);
--          clk_delay(2) <= clk_delay(1);
--          clk_delay(1) <= (NOT clk_delay(3)) AND (NOT clk_delay(2)) AND (NOT clk_delay(1));
--            clock25en <= NOT clock25en;
            clock25en <= '1';
        end process;
--        clock50en <= clk_delay(3);
--        clock25en <= clk_delay(3) OR clk_delay(1);
        


        
        BM: ball_move PORT MAP (clock, clock25en, reset, racket_1_pos, racket_2_pos, score_1, score_2, ball_x_pos, ball_y_pos);
        RM: racket_move PORT MAP (clock, clock25en, reset, device_in_temp(1), device_in_temp(0), device_in_temp(3), device_in_temp(2), racket_1_pos, racket_2_pos);
        MV: monitor_visual PORT MAP (clock, clock25en, ball_x_pos, ball_y_pos, racket_1_pos, racket_2_pos, score_1, score_2, Red, Blue, Green, Horiz_Sync, Vert_Sync, vga_comp_synch);
        IP: device_in PORT MAP (clock, clock25en, button1_up, button2_up, button1_down, button2_down, device_in_temp);


end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity monitor_visual is
    Port (clock : in std_logic;
           clock25en : in std_logic;
                ball_x, ball_y : in unsigned (9 downto 0); 
                racket1, racket2 : in unsigned (9 downto 0);
                score1, score2 : in std_logic_vector (1 to 9);
                Red : out std_logic_vector(7 downto 0);
          Blue : out std_logic_vector(7 downto 0);
          Green : out std_logic_vector(7 downto 0);
          HSync : out std_logic;
          VSync : out std_logic;
                vga_comp_synch_in : out std_logic
                );
end monitor_visual;

architecture Behavioral of monitor_visual is

signal v_count : unsigned (9 downto 0);
signal h_count : unsigned (9 downto 0);
signal video_out, video_out_h, video_out_v : std_logic;
signal red_temp, blue_temp, green_temp : std_logic;
signal horiz_sync, vert_sync : std_logic;

begin

video_out <= video_out_h and video_out_v;
vga_comp_synch_in <= horiz_sync and vert_sync;

sync: process(clock)
begin
        if clock'event and clock = '1' then
           if            clock25en ='1' then
                if h_count = 799 then h_count <= "0000000000";
                else h_count <= h_count + 1;
                end if;


                if h_count <= 755 and h_count >= 659 then horiz_sync <= '0';
                else horiz_sync <= '1';
                end if;

                if v_count >= 524 and h_count >= 699 then v_count <= "0000000000";
                elsif h_count = 699 then v_count <= v_count + 1;
                end if;

                if v_count <= 494 and v_count >= 493 then vert_sync <= '0';
                else vert_sync <= '1';
                end if;

                if h_count <= 639 then video_out_h <= '1';
                else video_out_h <= '0';
                end if;

                if v_count <= 479 then video_out_v <= '1';
                else video_out_v <= '0';
                end if;

                

                if h_count < 51 or h_count > 589 or v_count < 51 or v_count > 429 then
                        if h_count >= 160 and h_count <= 161 and v_count >= 15 and v_count <= 24 and score1(1) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 160 and h_count <= 161 and v_count >= 25 and v_count <= 34 and score1(2) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 166 and h_count <= 175 and v_count >= 14 and v_count <= 15 and score1(3) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 175 and h_count <= 176 and v_count >= 15 and v_count <= 24 and score1(4) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 175 and h_count <= 176 and v_count >= 25 and v_count <= 34 and score1(5) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 166 and h_count <= 175 and v_count >= 34 and v_count <= 35 and score1(6) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 165 and h_count <= 166 and v_count >= 25 and v_count <= 34 and score1(7) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 165 and h_count <= 166 and v_count >= 15 and v_count <= 24 and score1(8) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 166 and h_count <= 175 and v_count >= 24 and v_count <= 25 and score1(9) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 480 and h_count <= 481 and v_count >= 15 and v_count <= 24 and score2(1) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 480 and h_count <= 481 and v_count >= 25 and v_count <= 34 and score2(2) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 486 and h_count <= 495 and v_count >= 14 and v_count <= 15 and score2(3) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 495 and h_count <= 496 and v_count >= 15 and v_count <= 24 and score2(4) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 495 and h_count <= 496 and v_count >= 25 and v_count <= 34 and score2(5) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 486 and h_count <= 495 and v_count >= 34 and v_count <= 35 and score2(6) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 485 and h_count <= 486 and v_count >= 25 and v_count <= 34 and score2(7) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 485 and h_count <= 486 and v_count >= 15 and v_count <= 24 and score2(8) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        elsif h_count >= 486 and h_count <= 495 and v_count >= 24 and v_count <= 25 and score2(9) = '1' then
                                red_temp <= '0';
                                green_temp <= '1';
                                blue_temp <= '1';
                        else
                                red_temp <= '0';
                                green_temp <= '0';
                                blue_temp <= '0';
                        end if;
                elsif (h_count >= ball_x - 4 and h_count <= ball_x + 4 and v_count >= ball_y - 1 and v_count <= ball_y + 1)
                                or (h_count >= ball_x - 3 and h_count <= ball_x + 3 and v_count >= ball_y - 3 and v_count <= ball_y + 3) 
                                or ((h_count >= ball_x - 1 and h_count <= ball_x + 1) and (v_count = ball_y - 4 or v_count = ball_y + 4)) then
                        red_temp <= '1';
                        green_temp <= '0';
                        blue_temp <= '0';
                elsif h_count >= 55 and h_count <= 57 and v_count >= racket1 + 50 and v_count <= racket1 + 80 then
                        red_temp <= '0';
                        green_temp <= '0';
                        blue_temp <= '1';
                elsif h_count >= 583 and h_count <= 585 and v_count >= racket2 + 50 and v_count <= racket2 + 80 then
                        red_temp <= '0';
                        green_temp <= '0';
                        blue_temp <= '1';
                else
                        red_temp <= '1';
                        green_temp <= '1';
                        blue_temp <= '1';
                end if;
                        
                                        
                Red <= (red_temp and video_out) & (red_temp and video_out) & (red_temp and video_out) & (red_temp and video_out) & (red_temp and video_out) & (red_temp and video_out) & (red_temp and video_out) & (red_temp and video_out);
                Blue <= (blue_temp and video_out) & (blue_temp and video_out) & (blue_temp and video_out) & (blue_temp and video_out) & (blue_temp and video_out) & (blue_temp and video_out) & (blue_temp and video_out) & (blue_temp and video_out);
                Green <= (green_temp and video_out) & (green_temp and video_out) & (green_temp and video_out) & (green_temp and video_out) & (green_temp and video_out) & (green_temp and video_out) & (green_temp and video_out) & (green_temp and video_out);
                HSync <= horiz_sync;
                VSync <= vert_sync;
           end if; -- clock25en
        end if; --clk
end process sync;



end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity device_in is
        Port(clock: in std_logic;
           clock25en : in std_logic;
                up1_in, up2_in, down1_in, down2_in : in std_logic;
                move : out std_logic_vector(0 to 3)
        );
end device_in;

architecture Behavioral of device_in is

begin

        input: process(clock)
        begin
                if clock'event and clock = '1' then
                   if clock25en ='1' then

                        if up1_in = '0' then move(1) <= '1';
                        elsif up1_in = '1' then move(1) <= '0';
                        end if;
                        if up2_in = '0' then move(0) <= '1';
                        elsif up2_in = '1' then move(0) <= '0';
                        end if;
                        if down1_in = '0' then move(3) <= '1';
                        elsif down1_in = '1' then move(3) <= '0';
                        end if;
                        if down2_in = '0' then move(2) <= '1';
                        elsif down2_in = '1' then move(2) <= '0';
                        end if;
                   end if;
                end if;
        end process input;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ball_move is
        Port (clock : in std_logic;
           clock25en : in std_logic;
                        reset : in std_logic;
                        racket1, racket2 : unsigned (9 downto 0);
                        score1_out, score2_out : out std_logic_vector (1 to 9);
                        ballx : out unsigned (9 downto 0);
                        bally : out unsigned (9 downto 0)
                        );
end ball_move;

architecture Behavioral of ball_move is

signal score1, score2 : integer range 0 to 15;
signal counter : integer range 0 to 200000;
signal movex, movey : std_logic;
signal ballx_temp, bally_temp : unsigned (9 downto 0);

begin

        clkdiv: process(clock)
        begin
                if clock'event and clock = '1' then
                  if clock25en ='1' then
                        if counter = 200000 then counter <= 0;
                        else counter <= counter + 1;
                        end if;
                  end if;
                end if;
        end process clkdiv;

        move: process(clock)
        begin
                if clock'event and clock = '1' then
                    if            clock25en = '1' then
                        if reset = '0' then
                                score1 <= 0;
                                score2 <= 0;
                                ballx_temp <= "0101000000";
                                bally_temp <= "0011110000";
                        else
                                        if score1 < 15 and score2 < 15 then
                                                if ballx_temp = 55 then --linker Rand
                                                        score2 <= score2 + 1;
                                                        ballx_temp <= "0101000000";
                                                        bally_temp <= "0011110000";
                                                        movex <= '1';
                                                elsif ballx_temp = 585 then --rechter Rand
                                                        score1 <= score1 + 1;
                                                        ballx_temp <= "0101000000";
                                                        bally_temp <= "0011110000";
                                                        movex <= '0';
                                                elsif bally_temp = 55 then movey <= '1'; --oberer Rand
                                                elsif bally_temp = 425 then movey <= '0'; --unterer Rand
                                                elsif ballx_temp = 62 and bally_temp > racket1 + 48 and bally_temp < racket1 + 82 then movex <= '1'; --linker Schlaeger beruehrt
                                                elsif ballx_temp = 578 and bally_temp > racket2 + 48 and bally_temp < racket2 + 82 then movex <= '0'; --rechter Schlaeger beruehrt
                                                end if;
                                        if counter = 0 then
                                                if movex = '0' then ballx_temp <= ballx_temp - 1;
                                                elsif movex = '1' then ballx_temp <= ballx_temp + 1;
                                                end if;
                                                if movey = '0' then bally_temp <= bally_temp - 1;
                                                elsif movey = '1' then bally_temp <= bally_temp + 1;
                                                end if;
                                        end if;
                                end if;
                        end if;
                   end if;
                end if;
        end process move;

        score: process(clock)
        begin
        if clock'event and clock = '1' then
        if           clock25en = '1' then
        case score1 is
                when 0 => score1_out <= "001111110";
                when 1 => score1_out <= "000110000";
                when 2 => score1_out <= "001101101";
                when 3 => score1_out <= "001111001";
                when 4 => score1_out <= "000110011";
                when 5 => score1_out <= "001011011";
                when 6 => score1_out <= "001011111";
                when 7 => score1_out <= "001110000";
                when 8 => score1_out <= "001111111";
                when 9 => score1_out <= "001111011";
                when 10 => score1_out <= "111111110";
                when 11 => score1_out <= "110110000";
                when 12 => score1_out <= "111101101";
                when 13 => score1_out <= "111111001";
                when 14 => score1_out <= "110110011";
                when 15 => score1_out <= "111011011";
        end case;

        case score2 is
                when 0 => score2_out <= "001111110";
                when 1 => score2_out <= "000110000";
                when 2 => score2_out <= "001101101";
                when 3 => score2_out <= "001111001";
                when 4 => score2_out <= "000110011";
                when 5 => score2_out <= "001011011";
                when 6 => score2_out <= "001011111";
                when 7 => score2_out <= "001110000";
                when 8 => score2_out <= "001111111";
                when 9 => score2_out <= "001111011";
                when 10 => score2_out <= "111111110";
                when 11 => score2_out <= "110110000";
                when 12 => score2_out <= "111101101";
                when 13 => score2_out <= "111111001";
                when 14 => score2_out <= "110110011";
                when 15 => score2_out <= "111011011";
        end case;
        end if; -- clock25en 
        end if; -- clock
        end process score;

        ballx <= ballx_temp;
        bally <= bally_temp;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity racket_move is
        Port (clock : in std_logic;
           clock25en : in std_logic;
                        reset : in std_logic;
                        up1, up2, down1, down2 : in std_logic;
                        racket1_pos : out unsigned (9 downto 0);
                        racket2_pos : out unsigned (9 downto 0)
                        );
end racket_move;

architecture Behavioral of racket_move is

        signal racket1_temp : unsigned (9 downto 0);
        signal racket2_temp : unsigned (9 downto 0);
        signal counter : integer range 0 to 100000;

begin

        count: process(clock)
        begin
                if clock'event and clock = '1' then
                    if            clock25en ='1' then
                        if counter = 100000 then counter <= 0;
                        else counter <= counter + 1;
                        end if;
                    end if;
                end if;
        end process count;

        move: process(clock)
        begin
                if clock'event and clock = '1' then
                   if           clock25en = '1' then
                        if reset = '0' then
                                racket1_temp <= "0000000000";
                                racket2_temp <= "0000000000";
                        else
                                if counter = 0 then
                                        if up1 = '1' and racket1_temp > 0 then --oberer Spielfeldrand
                                                racket1_temp <= racket1_temp - 1;
                                        elsif up2 = '1' and racket2_temp > 0 then
                                                racket2_temp <= racket2_temp - 1;
                                        elsif down1 = '1' and racket1_temp < 350 then --unterer Spielfeldrand
                                                racket1_temp <= racket1_temp + 1;
                                        elsif down2 = '1' and racket2_temp < 350 then
                                                racket2_temp <= racket2_temp + 1;
                                        end if;
                                end if;
                        end if;
                   end if;
                end if;
        end process move;

racket1_pos <= racket1_temp;
racket2_pos <= racket2_temp;


end Behavioral;
