library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_m is
  generic (
    CON4         : natural    := 10;    
    CON12   : natural    := 11;    
    CON13         : natural    := 4;     
    CON14      : natural    := 256;   
    CON5          : natural    := 8;     
    CON15     : natural    := 42;    
    CON1    : natural          := 16     
    );
  port (
    clock               : in  STD_LOGIC;  
    reset               : in  STD_LOGIC;  
    ta             : in  STD_LOGIC_VECTOR(CON13-1 downto 0);  
    I0                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q0                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    I1                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q1                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    I2                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q2                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    I3                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q3                  : in STD_LOGIC_VECTOR(CON1-1 downto 0); 
    valid              : in  STD_LOGIC;  
    vex3       : in STD_LOGIC_VECTOR(CON5-1 downto 0); 
    ext_ta    : in STD_LOGIC;                              
    ce             : in STD_LOGIC_VECTOR(CON13-1 downto 0);   
    store          : in STD_LOGIC;   
    sdata          : out STD_LOGIC_VECTOR(CON13-1 downto 0);  
    val2       : out STD_LOGIC_VECTOR(CON13-1 downto 0);  
    pol1 : in STD_LOGIC_VECTOR(CON5-1 downto 0);        
    pol2 : in STD_LOGIC_VECTOR(CON12-1 downto 0) 
);
end obj_m;
architecture behavior of obj_m is
  type signalarray is array (0 to CON13-1) of STD_LOGIC_VECTOR(CON15-1 downto 0);
  signal inter1_80 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter2_80 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter1_81 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter2_81 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter1_82 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter2_82 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter1_83 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter2_83 : STD_LOGIC_VECTOR(CON1-1 downto 0);    
  signal inter3_8 : STD_LOGIC_VECTOR(CON1-1 downto 0);  
  signal inter5_8 : STD_LOGIC_VECTOR(2*CON1-1 downto 0);  
  signal inter4_8 : STD_LOGIC_VECTOR(CON15-1 downto 0); 
  signal inter6_8 : STD_LOGIC_VECTOR(CON15-1 downto 0);       
  signal inter7_8 : STD_LOGIC_VECTOR(CON15-1 downto 0);        
  signal inter8_8 : STD_LOGIC_VECTOR(CON13-1 downto 0);
  signal inter9_8 : STD_LOGIC_VECTOR(CON13-1 downto 0);
  signal inter10_8 : STD_LOGIC_VECTOR(CON13-1 downto 0);
  signal inter11_8: STD_LOGIC_VECTOR(CON5-1 downto 0);
  signal inter12_8: STD_LOGIC_VECTOR(CON5-1 downto 0);
  signal inter13_8: UNSIGNED(CON5-1 downto 0);    
  signal inter14_8 : signalarray;
  signal inter16_8 : STD_LOGIC_VECTOR(CON15-1 downto 0);    
  signal inter15_8 : STD_LOGIC_VECTOR(CON15-1 downto 0);    
  signal inter48 : STD_LOGIC_VECTOR(CON15-1 downto 0);      
  signal inter17_8 : STD_LOGIC_VECTOR(CON12-1 downto 0);
  signal inter18_8 : STD_LOGIC;     
  signal inter19_8 : STD_LOGIC;    
  signal inter20_8 : STD_LOGIC;  
  signal inter21_8 : STD_LOGIC_VECTOR(1 downto 0);
  constant PQ1            : STD_LOGIC_VECTOR(3 downto 0):="0000";
  constant PQ2                : STD_LOGIC_VECTOR(3 downto 0):="0001";
  constant PQ3                : STD_LOGIC_VECTOR(3 downto 0):="0010";
  constant PQ4            : STD_LOGIC_VECTOR(3 downto 0):="0011";
  constant PQ5          : STD_LOGIC_VECTOR(3 downto 0):="0100";
  constant FGH5                : STD_LOGIC_VECTOR(3 downto 0):="0101";
  constant FGH6                : STD_LOGIC_VECTOR(3 downto 0):="0110";
  constant FGH7                : STD_LOGIC_VECTOR(3 downto 0):="0111";
  constant FGH8                : STD_LOGIC_VECTOR(3 downto 0):="1000";
  constant FGH9                : STD_LOGIC_VECTOR(3 downto 0):="1001";
  constant FGH10                : STD_LOGIC_VECTOR(3 downto 0):="1010";
  constant FGH11                : STD_LOGIC_VECTOR(3 downto 0):="1011";
  constant FGH12                : STD_LOGIC_VECTOR(3 downto 0):="1100";
  constant FGH13                : STD_LOGIC_VECTOR(3 downto 0):="1101";
  constant FGH14                : STD_LOGIC_VECTOR(3 downto 0):="1110";
  constant FGH15                : STD_LOGIC_VECTOR(3 downto 0):="1111";
  constant RAM0                   : STD_LOGIC_VECTOR(1 downto 0):="00";
  constant RAM1                   : STD_LOGIC_VECTOR(1 downto 0):="01";
  constant RAM2                   : STD_LOGIC_VECTOR(1 downto 0):="10";
  constant RAM3                   : STD_LOGIC_VECTOR(1 downto 0):="11";
  signal saved_ta         : STD_LOGIC_VECTOR(CON13-1 downto 0);  
  signal clear_ta         : STD_LOGIC;  
  signal taed             : STD_LOGIC;  
  COMPONENT dpram1_wrap
	PORT
	(
	addra: IN std_logic_VECTOR(7 downto 0);
	addrb: IN std_logic_VECTOR(7 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(41 downto 0);
	doutb: OUT std_logic_VECTOR(41 downto 0);
	ena: IN std_logic;
	enb: IN std_logic;
	wea: IN std_logic
	);  END COMPONENT;
  COMPONENT AS_1
	PORT
	(
	A: IN std_logic_VECTOR(41 downto 0);
	B: IN std_logic_VECTOR(41 downto 0);
	Q: OUT std_logic_VECTOR(41 downto 0);
	CLK: IN std_logic
	);
  END COMPONENT;
COMPONENT obj_e
	PORT
	(
	Q: OUT std_logic_VECTOR(10 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic;
	ACLR: IN std_logic
	);
END COMPONENT;
  COMPONENT mult1_wrap
	PORT
	(
		a		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		b		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		clk		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END COMPONENT;
begin  
  inst00020 : dpram1_wrap
    port map (
      wea      => inter8_8(0),
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',  
      dina      => inter15_8,       
      addra => inter11_8,
      addrb => inter12_8,
      doutb         => inter14_8(0)); 
  inst00021 : dpram1_wrap
    port map (
      wea      => inter8_8(1),
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',  
      dina      => inter15_8,       
      addra => inter11_8,
      addrb => inter12_8,
      doutb        => inter14_8(1)); 
  inst00022 : dpram1_wrap
    port map (
      wea      => inter8_8(2),
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',  
      dina      => inter15_8,       
      addra => inter11_8,
      addrb => inter12_8,
      doutb         => inter14_8(2)); 
  inst00023 : dpram1_wrap
    port map (
      wea      => inter8_8(3),
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',  
      dina      => inter15_8,       
      addra => inter11_8,
      addrb => inter12_8,
      doutb        => inter14_8(3)); 
   binst : mult1_wrap
     port map (
       clk => clock,
       a  => inter3_8,
       b  => inter3_8,
       q => inter5_8);
  cinst : AS_1
    port map (
      A => inter6_8,
      B => inter4_8,
      Q => inter7_8,
      CLK => clock);
  dinst : AS_1
    port map (
      A => inter7_8,
      B => inter16_8,
      Q => inter48,
      CLK => clock);
  einst : obj_e
    port map (
      ACLR => inter19_8,
      CE => inter18_8,
      Q => inter17_8,    
      CLK => clock);
 proc_a: process(inter20_8)
 begin
  for i in CON13-1 downto 0 loop
     val2(i) <= inter20_8;   
  end loop;
 end process proc_a;
 proc_b: process(saved_ta)
 begin
   taed <= saved_ta(0) or saved_ta(1) or saved_ta(2) or saved_ta(3);
 end process proc_b;
 proc_c: process(inter5_8)
  begin
    inter4_8(2*CON1-1 downto 0) <= inter5_8(2*CON1-1 downto 0);
    for i in CON15-1 downto 2*CON1 loop
       inter4_8(i) <= inter5_8(2*CON1-1);
    end loop;
 end process proc_c;
 proc_d: process(reset)
  begin
    inter19_8 <= reset or ext_ta; 
  end process proc_d;
 proc_e: process(inter13_8, vex3, ext_ta)
  begin
    if (ext_ta = '1') then
       inter11_8 <= vex3;
       inter12_8 <= vex3;
       inter15_8 <= STD_LOGIC_VECTOR(to_unsigned(0,CON15));
       inter8_8 <= inter10_8;
    else
       inter11_8 <= STD_LOGIC_VECTOR(inter13_8);
       inter12_8 <= STD_LOGIC_VECTOR(inter13_8);
       inter15_8 <= inter48;
       inter8_8 <= inter9_8 and saved_ta;  
    end if;
  end process proc_e;
 proc_f: process(inter13_8, vex3, ext_ta)
  begin
    case inter21_8 is
      when RAM0 =>
       inter16_8 <= inter14_8(0);
      when RAM1 =>
       inter16_8 <= inter14_8(1);
      when RAM2 =>
       inter16_8 <= inter14_8(2);
      when RAM3 =>
       inter16_8 <= inter14_8(3);
      when others =>
       inter16_8 <= inter14_8(3);
    end case;
  end process proc_f;
 proc_g: process(clock,reset)
  variable state : STD_LOGIC_VECTOR(3 downto 0) := PQ1;
  begin
    if reset='1' then                         
      state := PQ1;
      inter21_8 <= RAM0;
      clear_ta <= '0';
      inter18_8 <= '0';                        
      inter9_8 <= "0000";
      inter13_8 <= to_unsigned(0, CON5); 
    elsif clock'event and clock = '1' then    
      inter6_8 <= inter4_8;
      case state is
        when PQ1 =>    
          inter1_80 <= I0;                        
          inter2_80 <= Q0;
          inter1_81 <= I1;
          inter2_81 <= Q1;
          inter1_82 <= I2;
          inter2_82 <= Q2;
          inter1_83 <= I3;
          inter2_83 <= Q3;
          inter21_8 <= RAM0;
          if valid = '1' and inter20_8 = '0' and ext_ta = '0' and taed = '1' then
            state := PQ2;
          else
            state := PQ1;
          end if;
        when PQ2 =>
          inter3_8 <= inter1_80;                
          state := PQ3;
        when PQ3 =>
          inter3_8 <= inter2_80;                
          state := PQ4;
        when PQ4 =>
          inter3_8 <= inter1_81;                
          state := PQ5;
        when PQ5 =>
          inter3_8 <= inter2_81;                
          state := FGH5;
        when FGH5 =>
          inter3_8 <= inter1_82;                
          inter21_8 <= RAM1;
          inter9_8(0) <= '1';
          state := FGH6;
        when FGH6 =>
          inter3_8 <= inter2_82;                
          inter9_8(0) <= '0';
          state := FGH7;
        when FGH7 =>
          inter3_8 <= inter1_83;                
          inter21_8 <= RAM2;
          inter9_8(1) <= '1';
          state := FGH8;
        when FGH8 =>
          inter3_8 <= inter2_83;                
          inter9_8(1) <= '0';
          state := FGH9;
        when FGH9 =>
          inter21_8 <= RAM3;
          inter9_8(2) <= '1';
          state := FGH10;
        when FGH10 =>
          inter9_8(2) <= '0';
          state := FGH11;
        when FGH11 =>
          inter9_8(3) <= '1';
          state := FGH12;
        when FGH12 =>
          inter9_8(3) <= '0';
          inter13_8 <= inter13_8 + 1;    
          state := FGH13;
        when FGH13 =>
          if STD_LOGIC_VECTOR(inter13_8) = pol1  then 
            clear_ta <= '1';
            inter13_8 <= to_unsigned(0, CON5);
            inter18_8 <= saved_ta(CON13-1); 
          end if;
          state := FGH14;
        when FGH14 =>
          clear_ta <= '0';    
          inter18_8 <= '0';
          state := FGH15;
        when FGH15 =>
          state := PQ1;
        when others => null;
      end case;
    end if;
  end process proc_g;
 proc_h: process(ta,reset,clear_ta)
  begin
  for i in CON13-1 downto 0 loop
     if reset='1' or clear_ta = '1' or ext_ta = '1' then     
       saved_ta(i) <= '0';
    elsif ta(i)'event and ta(i) = '1' then    
       saved_ta(i) <= '1';
    end if;
  end loop;
  end process proc_h;
  proc_i: process (clock)
  variable shift_out : signalarray;
  begin
    for i in CON13-1 downto 0 loop
      sdata(i) <= shift_out(i)(0);
      if clock'event and clock = '1' then  
        if store='1' then
          shift_out(i) := inter14_8(i);    
          inter10_8(i) <= '1';                 
        elsif ce(i)='1' then                 
          shift_out(i)(CON15-2 downto 0):=shift_out(i)(CON15-1 downto 1);
          shift_out(i)(CON15-1):='X';
          inter10_8(i) <= '0';                 
        else
          inter10_8(i) <= '0';
        end if;
      end if;
    end loop;    
  end process proc_i;
 proc_j: process(clock,reset)
  begin
    if reset='1' then     
      inter20_8 <= '0';
    elsif clock'event and clock = '1' then    
      if inter17_8 = pol2 then     
         inter20_8 <= '1';
      else
         inter20_8 <= '0';
      end if;
    end if;
  end process proc_j;
end behavior;
