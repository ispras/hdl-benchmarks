library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_a is
  generic (
    CON2    : natural      := 12;  
    CON4   : natural      := 2;   
    CON3   : natural      := 4;   
    CON5    : natural      := 4;   
    CON7     : natural      := 16;  
    CON1    : natural      := 16   
    );
  port (
    clock               : in  STD_LOGIC;  
    reset               : in  STD_LOGIC;  
    valid             : in  STD_LOGIC;    
    val2          : out STD_LOGIC;    
    I0                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    I1                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I2                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I3                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I4                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I5                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I6                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I7                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q0                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q1                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q2                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q3                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q4                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q5                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q6                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q7                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout                : out  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qout                : out  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    inter0001                   : in STD_LOGIC;  
    vxi2s                : in STD_LOGIC_VECTOR(CON3-1 downto 0);
    vxi2t                : in STD_LOGIC_VECTOR(CON1-1 downto 0));
end obj_a;
architecture behavior of obj_a is
  type inarray is array (7 downto 0) of STD_LOGIC_VECTOR(CON2-1 downto 0);
  signal i : inarray;
  signal q : inarray;
  signal inter0004 : STD_LOGIC_VECTOR(CON2-1 downto 0);    
  signal por6 : STD_LOGIC:='0';                               
  signal inter0005: STD_LOGIC_VECTOR(CON5-1 downto 0);     
  signal inter0007: STD_LOGIC:='1';                 
  signal inter0008: STD_LOGIC_VECTOR(CON2-1 downto 0);   
  signal inter0009: STD_LOGIC_VECTOR(CON2-1 downto 0);   
  signal res1: STD_LOGIC_VECTOR(2*CON2+CON4-1 downto 0);
  signal res2: STD_LOGIC_VECTOR(2*CON2+CON4-1 downto 0);
  signal out_trig : STD_LOGIC;
  signal out_trigd1 : STD_LOGIC;
  signal out_trigd2 : STD_LOGIC;
  signal out_trigd3 : STD_LOGIC;
  signal out_trigd4 : STD_LOGIC;
  constant START     : STD_LOGIC_VECTOR(3 downto 0):="0000";
  constant CYCLE1    : STD_LOGIC_VECTOR(3 downto 0):="0001";
  constant CYCLE2    : STD_LOGIC_VECTOR(3 downto 0):="0010";
  constant CYCLE3    : STD_LOGIC_VECTOR(3 downto 0):="0011";
  constant CYCLE4    : STD_LOGIC_VECTOR(3 downto 0):="0100";
  constant CYCLE5    : STD_LOGIC_VECTOR(3 downto 0):="0101";
  constant CYCLE6    : STD_LOGIC_VECTOR(3 downto 0):="0110";
  constant CYCLE7    : STD_LOGIC_VECTOR(3 downto 0):="0111";
  constant CYCLE8    : STD_LOGIC_VECTOR(3 downto 0):="1000";
  constant CYCLE9    : STD_LOGIC_VECTOR(3 downto 0):="1001";
  constant CYCLE10    : STD_LOGIC_VECTOR(3 downto 0):="1010";
  constant CYCLE11    : STD_LOGIC_VECTOR(3 downto 0):="1011";
  constant CYCLE12    : STD_LOGIC_VECTOR(3 downto 0):="1100";
  constant CYCLE13    : STD_LOGIC_VECTOR(3 downto 0):="1101";
  constant CYCLE14    : STD_LOGIC_VECTOR(3 downto 0):="1110";
  constant CYCLE15    : STD_LOGIC_VECTOR(3 downto 0):="1111";
  COMPONENT dpram2_wrap
	PORT
	(
	addra: IN std_logic_VECTOR(3 downto 0);
	addrb: IN std_logic_VECTOR(3 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(11 downto 0);
	doutb: OUT std_logic_VECTOR(11 downto 0);
	ena: IN std_logic;
	enb: IN std_logic;
	wea: IN std_logic
	);  END COMPONENT;
COMPONENT obj_i is
  generic (
    CON16 : natural;
    CON19 : natural;
    CON17    : natural;     
    CON18    : natural;     
    CON20 : natural    
    );
  port (
    clock0              : in  STD_LOGIC;  
    aclr0               : in  STD_LOGIC;  
    wl             : in  STD_LOGIC;  
    obe         : in  STD_LOGIC;  
    dataa                  : in STD_LOGIC_VECTOR(CON17-1 downto 0); 
    datab                  : in STD_LOGIC_VECTOR(CON18-1 downto 0); 
    result                 : out STD_LOGIC_VECTOR(CON20-1 downto 0)); 
 END COMPONENT;
begin  
    val2 <= out_trigd4;
    Iout <= res1(2*CON2+CON4-1 downto 2*CON2+CON4-CON1);
    Qout <= res2(2*CON2+CON4-1 downto 2*CON2+CON4-CON1);
  inputram : dpram2_wrap
    port map (
      wea      => inter0001,
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',  
      dina      => vxi2t(CON2-1 downto 0),
      addra => vxi2s,
      addrb => inter0005,
      doutb         => inter0004);
   inst0_0 : obj_i
     generic map (
       CON16  => CON4,
       CON19     => 2*CON2,
       CON20   => 2*CON2+CON4,
       CON17   => CON2,
       CON18   => CON2)
   port map (
       clock0 => clock,
       aclr0 => reset,
       dataa  => inter0004,
       datab  => inter0008,
       obe => por6,
       wl => inter0007,
       result => res1);
   inst1 : obj_i
     generic map (
       CON16  => CON4,
       CON19     => 2*CON2,
       CON20   => 2*CON2+CON4,
       CON17   => CON2,
       CON18   => CON2)
     port map (
       clock0 => clock,
       aclr0 => reset,
       dataa  => inter0004,
       datab  => inter0009,
       obe => por6,
       wl => '1',
       result => res2);
 proc_a: process(clock,reset)
   variable state : STD_LOGIC_VECTOR(3 downto 0) := START;
  begin
    if reset='1' then                         
      state := START;
      inter0007 <= '1';
    elsif clock'event and clock = '1' then    
      inter0005 <= STD_LOGIC_VECTOR(state);
      out_trigd1 <= out_trig;
      out_trigd2 <= out_trigd1;  
      out_trigd3 <= out_trigd2;
      out_trigd4 <= out_trigd3;  
      case state is
        when START =>    
          out_trig <= '0';
          inter0008 <= I0(CON1-1 downto CON1-CON2);
          inter0009 <= Q0(CON1-1 downto CON1-CON2);
          por6 <= '1';   
          inter0007 <= '1'; 
          i(0) <= I0(CON1-1 downto CON1-CON2);
          i(1) <= I1(CON1-1 downto CON1-CON2);
          i(2) <= I2(CON1-1 downto CON1-CON2);
          i(3) <= I3(CON1-1 downto CON1-CON2);
          i(4) <= I4(CON1-1 downto CON1-CON2);
          i(5) <= I5(CON1-1 downto CON1-CON2);
          i(6) <= I6(CON1-1 downto CON1-CON2);
          i(7) <= I7(CON1-1 downto CON1-CON2);
          q(0) <= Q0(CON1-1 downto CON1-CON2);
          q(1) <= Q1(CON1-1 downto CON1-CON2);
          q(2) <= Q2(CON1-1 downto CON1-CON2);
          q(3) <= Q3(CON1-1 downto CON1-CON2);
          q(4) <= Q4(CON1-1 downto CON1-CON2);
          q(5) <= Q5(CON1-1 downto CON1-CON2);
          q(6) <= Q6(CON1-1 downto CON1-CON2);
          q(7) <= Q7(CON1-1 downto CON1-CON2);
          if valid = '1' then  
            state := CYCLE1;
          else
            state := START;
          end if;
        when CYCLE1 =>  
          inter0008 <= q(0);
          inter0009 <= i(0);
          state := CYCLE2;
          por6 <= '0';   
          inter0007 <= '0'; 
        when CYCLE2 =>
          inter0008 <= i(1);
          inter0009 <= q(1);
          state := CYCLE3;
          por6 <= '0';   
          inter0007 <= '1'; 
        when CYCLE3 =>
          inter0008 <= q(1);
          inter0009 <= i(1);
          state := CYCLE4;
          por6 <= '0';   
          inter0007 <= '0'; 
        when CYCLE4 =>
          inter0008 <= i(2);
          inter0009 <= q(2);
          state := CYCLE5;
          por6 <= '0';   
          inter0007 <= '1'; 
        when CYCLE5 =>
          inter0008 <= q(2);
          inter0009 <= i(2);
          state := CYCLE6;
          por6 <= '0';   
          inter0007 <= '0'; 
        when CYCLE6 =>
          inter0008 <= i(3);
          inter0009 <= q(3);
          state := CYCLE7;
          por6 <= '0';   
          inter0007 <= '1'; 
        when CYCLE7 =>
          inter0008 <= q(3);
          inter0009 <= i(3);
          state := CYCLE8;
          por6 <= '0';   
          inter0007 <= '0'; 
        when CYCLE8 =>
          inter0008 <= i(4);
          inter0009 <= q(4);
          state := CYCLE9;
          por6 <= '0';   
          inter0007 <= '1'; 
        when CYCLE9 =>
          inter0008 <= q(4);
          inter0009 <= i(4);
          state := CYCLE10;
          por6 <= '0';   
          inter0007 <= '0'; 
        when CYCLE10 =>
          inter0008 <= i(5);
          inter0009 <= q(5);
          state := CYCLE11;
          por6 <= '0';   
          inter0007 <= '1'; 
        when CYCLE11 =>
          inter0008 <= q(5);
          inter0009 <= i(5);
          state := CYCLE12;
          por6 <= '0';   
          inter0007 <= '0'; 
        when CYCLE12 =>
          inter0008 <= i(6);
          inter0009 <= q(6);
          state := CYCLE13;
          por6 <= '0';   
          inter0007 <= '1'; 
        when CYCLE13 =>
          inter0008 <= q(6);
          inter0009 <= i(6);
          state := CYCLE14;
          por6 <= '0';   
          inter0007 <= '0'; 
        when CYCLE14 =>
          inter0008 <= i(7);
          inter0009 <= q(7);
          state := CYCLE15;
          por6 <= '0';   
          inter0007 <= '1'; 
        when CYCLE15 =>
          inter0008 <= q(7);
          inter0009 <= i(7);
          state := START;
          por6 <= '0';   
          inter0007 <= '0'; 
          out_trig <= '1';     
        when others => null;
      end case;
    end if;
  end process proc_a;
end behavior;
