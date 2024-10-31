library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_h is
  generic (
    CON1    : natural      := 16;  
    CON2    : natural      := 11;  
    CON8     : natural      := 5;   
    CON9     : natural      := 4;   
    CON4   : natural      := 2;   
    CON10      : natural      := 16   
    );
  port (
    clock               : in  STD_LOGIC;  
    reset               : in  STD_LOGIC;  
    val2            : out STD_LOGIC;  
    por1          : in  STD_LOGIC; 
    I_in                : in  STD_LOGIC_VECTOR(CON1-1 downto 0);  
    por2          : out  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q_in                : in  STD_LOGIC_VECTOR(CON1-1 downto 0);  
    por3          : out  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    por4                : in STD_LOGIC_VECTOR(CON9-1 downto 0);
    por5                : in STD_LOGIC_VECTOR(CON8-1 downto 0);
    por6                 : in STD_LOGIC;
    ii_11                   : in STD_LOGIC;  
    vxi2n                : in STD_LOGIC_VECTOR(CON9-1 downto 0); 
    vxi2o                : in STD_LOGIC_VECTOR(CON1-1 downto 0));
end obj_h;
architecture behavior of obj_h is
  signal interi_2 : STD_LOGIC_VECTOR(CON2-1 downto 0);  
  signal interi_3 : STD_LOGIC_VECTOR(CON2-1 downto 0);  
  signal interi_4  : STD_LOGIC_VECTOR(CON2-1 downto 0);     
  signal interi_5  : STD_LOGIC_VECTOR(CON2-1 downto 0);     
  signal interi_6 : STD_LOGIC_VECTOR(CON2-1 downto 0);  
  signal interi_7 : STD_LOGIC_VECTOR(CON2-1 downto 0);  
  signal interi_8 : STD_LOGIC:='0';                          
  signal por6_d1 : STD_LOGIC:='0';   
  signal por6_d2 : STD_LOGIC:='0';   
  signal por6_d3 : STD_LOGIC:='0';   
  signal interi_9: UNSIGNED(CON8-1 downto 0);  
  signal I_result : STD_LOGIC_VECTOR(2*CON2+CON4-1 downto 0);  
  signal Q_result : STD_LOGIC_VECTOR(2*CON2+CON4-1 downto 0);  
  signal interi_10 : STD_LOGIC_VECTOR(CON2-1 downto 0); 
  constant BL0     : STD_LOGIC_VECTOR(1 downto 0):="01";
  constant BL1           : STD_LOGIC_VECTOR(1 downto 0):="10";
  COMPONENT dpram3_wrap
	PORT
	(
	addra: IN std_logic_VECTOR(4 downto 0);
	addrb: IN std_logic_VECTOR(4 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(10 downto 0);
	doutb: OUT std_logic_VECTOR(10 downto 0);
	ena: IN std_logic;
	enb: IN std_logic;
	wea: IN std_logic
	);
  END COMPONENT;
  COMPONENT dpram4_wrap
	PORT
	(
	addra: IN std_logic_VECTOR(3 downto 0);
	addrb: IN std_logic_VECTOR(3 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(10 downto 0);
	doutb: OUT std_logic_VECTOR(10 downto 0);
	ena: IN std_logic;
	enb: IN std_logic;
	wea: IN std_logic
	);
  END COMPONENT;  
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
  val2 <= por6_d3;        
  por2 <= I_result(2*CON2+CON4-1 downto 2*CON2+CON4-CON1);
  por3 <= Q_result(2*CON2+CON4-1 downto 2*CON2+CON4-CON1);
  inst1_2 : dpram3_wrap
    port map (
      wea      => interi_8,
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',            
      dina      => interi_4,
      addra => STD_LOGIC_VECTOR(interi_9),
      addrb => STD_LOGIC_VECTOR(por5),
      doutb         => interi_6);
  inst2_2 : dpram3_wrap
    port map (
      wea      => interi_8,
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',            
      dina      => interi_5,
      addra => STD_LOGIC_VECTOR(interi_9),
      addrb => STD_LOGIC_VECTOR(por5),
      doutb         => interi_7);
  inst3_2 : dpram4_wrap
    port map (
      wea      => ii_11,
      clka   => clock,         
      clkb  => clock,
      ena =>'1',
      enb =>'1',  
      dina      => vxi2o(CON2-1 downto 0),       
      addra => vxi2n,
      addrb => STD_LOGIC_VECTOR(por4),
      doutb         => interi_10);
   inst4_2 : obj_i
     generic map (
       CON16  => CON4,
       CON20   => 2*CON2+CON4,
       CON19     => 2*CON2,
       CON17   => CON2,
       CON18   => CON2)
     port map (
       wl => '1',
       clock0 => clock,
       dataa  => interi_6,
       datab  => interi_10,
       aclr0  => reset,
       obe => por6,
       result => I_result);
   inst5_2 : obj_i
     generic map (
       CON16  => CON4,
       CON19     => 2*CON2,
       CON20   => 2*CON2+CON4,
       CON17   => CON2,
       CON18   => CON2)
     port map (
       wl => '1',
       clock0 => clock,
       dataa  => interi_7,
       datab  => interi_10,
       aclr0  => reset,
       obe => por6,
       result => Q_result);
 proc_a: process(clock,reset)
   variable state : STD_LOGIC_VECTOR(1 downto 0) := BL0;
  begin
    if reset='1' then                         
      state:=BL0;
      interi_8 <= '0';
      interi_9 <=to_unsigned(0,CON8);
    elsif clock'event and clock = '1' then    
      interi_2 <= I_in(CON1-1 downto CON1-CON2);       
      interi_3 <= Q_in(CON1-1 downto CON1-CON2);       
      case state is
        when BL0 =>
         if por1 = '1' then  
           interi_4 <= interi_2;
           interi_5 <= interi_3;
           interi_8 <= '1';     
           state:=BL1;
         end if;
        when BL1 =>
         interi_8 <= '0';
         if por1 = '0' then
           state:=BL0;
           interi_9 <= interi_9 + 1; 
         end if;
        when others => null;
       end case;
    end if;
  end process proc_a;
 proc_b: process(clock,reset)
  begin
    if clock'event and clock = '1' then    
      por6_d1 <= por6;      
      por6_d2 <= por6_d1;   
      por6_d3 <= por6_d2;   
    end if;
  end process proc_b;
end behavior;
