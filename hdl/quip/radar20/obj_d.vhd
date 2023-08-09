library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_d is
  generic (
    CON6       : natural      := 20;
    CON24    : natural      := 5  
    );
  port (
    clock               : in  STD_LOGIC;  
    reset               : in  STD_LOGIC;  
    ta             : in  STD_LOGIC;  
    mag_ta        : out STD_LOGIC_VECTOR(CON6-1 downto 0); 
    mode               : in STD_LOGIC_VECTOR(1 downto 0);  
    ext_ta        : in STD_LOGIC);   
 end obj_d;
architecture behavior of obj_d is
  signal selb: STD_LOGIC_VECTOR(CON6-1 downto 0);
  constant DAA0            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000000000001";
  constant DAA1            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000000000010";
  constant DAA2            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000000000100";
  constant DAA3            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000000001000";
  constant DAA4            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000000010000";
  constant DAA5            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000000100000";
  constant DAA6            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000001000000";
  constant DAA7            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000010000000";
  constant DAA8            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000000100000000";
  constant DAA9            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000001000000000";
  constant DAA10            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000010000000000";
  constant DAA11            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000000100000000000";
  constant DAA12            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000001000000000000";
  constant DAA13            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000010000000000000";
  constant DAA14            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00000100000000000000";
  constant DAA15            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00001000000000000000";
  constant DAA16            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00010000000000000000";
  constant DAA17            : STD_LOGIC_VECTOR(CON6-1 downto 0):="00100000000000000000";
  constant DAA18            : STD_LOGIC_VECTOR(CON6-1 downto 0):="01000000000000000000";
  constant DAA19            : STD_LOGIC_VECTOR(CON6-1 downto 0):="10000000000000000000";
  signal saved_ta         : STD_LOGIC;  
  signal clear_ta         : STD_LOGIC;  
  signal clear_ta_d1      : STD_LOGIC;  
  signal clear_cnt             : STD_LOGIC;
  signal ta_d1            : STD_LOGIC;
COMPONENT obj_f
	PORT
	(
	Q: OUT std_logic_VECTOR(4 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic;
	ACLR: IN std_logic
	);
END COMPONENT;
begin  
  count0 : obj_f
    port map (
      ACLR => clear_cnt,
      Q(4) => clear_ta,
      CE => saved_ta,
      CLK => clock);
 proc_a: process(mode, ta, selb)
  begin
    clear_cnt <= reset or clear_ta_d1;
    if (mode(1) = '0') then
       for i in CON6-1 downto 0 loop
          mag_ta(i)<=saved_ta;
       end loop;
    else
       for i in CON6-1 downto 0 loop
          mag_ta(i)<= selb(i) and saved_ta;
       end loop;
    end if;
  end process proc_a;
 proc_b: process(clock,reset)
  variable state : STD_LOGIC_VECTOR(CON6-1 downto 0) := DAA0;
  begin
    selb <= state;
    if reset='1' then                         
      state := DAA0;
      clear_ta_d1 <= '0';
    elsif clock'event and clock = '1' then    
      clear_ta_d1 <= clear_ta;
      if clear_ta_d1 = '1' then
        case state is
          when DAA0 => 
             state := DAA1;
          when DAA1 => 
             state := DAA2;
          when DAA2 => 
             state := DAA3;
          when DAA3 => 
             state := DAA4;
          when DAA4 => 
             state := DAA5;
          when DAA5 => 
             state := DAA6;
          when DAA6 => 
             state := DAA7;
          when DAA7 => 
             state := DAA8;
          when DAA8 => 
             state := DAA9;
          when DAA9 => 
             state := DAA10;
          when DAA10 => 
             state := DAA11;
          when DAA11 => 
             state := DAA12;
          when DAA12 => 
             state := DAA13;
          when DAA13 => 
             state := DAA14;
          when DAA14 => 
             state := DAA15;
          when DAA15 => 
             state := DAA16;
          when DAA16 => 
             state := DAA17;
          when DAA17 => 
             state := DAA18;
          when DAA18 => 
             state := DAA19;
          when DAA19 => 
             state := DAA0;
          when others => null;
        end case;
      end if;
    end if;
  end process proc_b;
 delay_ta: process(clock,reset)
  begin
    if clock'event and clock = '1' then    
      ta_d1 <= ta;
    end if;
  end process delay_ta;
 proc_c: process(ta,reset,clear_ta)
  begin
    if reset='1' or clear_ta_d1 = '1' or ext_ta = '1' then     
      saved_ta <= '0';
    elsif ta_d1'event and ta_d1 = '1' then    
      saved_ta <= '1';
    end if;
  end process proc_c;
end behavior;
