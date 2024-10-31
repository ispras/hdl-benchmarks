library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_n is
  generic (
    CON25       : natural   := 1024;  
    CON13       : natural   := 4;     
    CON12 : natural   := 11;    
    CON5        : natural   := 8;     
    CON1     : natural      := 16;    
    CON6      : natural      := 20     
    );
  port (
    clock               : in  STD_LOGIC;  
    reset               : in  STD_LOGIC;  
    ta             : in  STD_LOGIC_VECTOR(CON6-1 downto 0);  
    I0_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I1_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I2_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I3_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I4_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I5_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I6_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I7_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I8_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I9_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I10_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I11_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I12_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I13_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I14_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I15_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I16_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I17_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I18_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I19_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q0_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q1_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q2_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q3_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q4_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q5_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q6_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q7_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q8_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q9_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q10_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q11_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q12_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q13_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q14_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q15_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q16_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q17_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q18_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q19_in               : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    valid              : in  STD_LOGIC; 
    vex3       : in STD_LOGIC_VECTOR(CON5-1 downto 0);    
    ext_ta    : in STD_LOGIC;                                 
    ce             : in STD_LOGIC_VECTOR(CON6-1 downto 0);     
    store          : in STD_LOGIC;   
    sdata          : out STD_LOGIC_VECTOR(CON6-1 downto 0);    
    val2       : out STD_LOGIC;                                
    pol1_out : out STD_LOGIC_VECTOR(CON5-1 downto 0); 
    vxi2p : in STD_LOGIC;
    vxi2q     : in STD_LOGIC_VECTOR(18 downto 0));
end obj_n;
architecture behavior of obj_n is
  type signalarray is array (0 to CON6-1) of STD_LOGIC_VECTOR(CON1-1 downto 0);
  signal i_input : signalarray;
  signal q_input : signalarray;
  signal inter22 : STD_LOGIC_VECTOR(CON6-1 downto 0);
  signal pol2 : STD_LOGIC_VECTOR(CON12-1 downto 0);  
  signal pol1 : STD_LOGIC_VECTOR(CON5-1 downto 0);   
  signal vxi2p_d1 : STD_LOGIC; 
COMPONENT obj_m
  generic (
    CON12   : natural    := 11;    
    CON13         : natural    := 4;    
    CON14      : natural := 256;       
    CON5    : natural       := 8;        
    CON1    : natural      := 16         
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
    pol2 : in STD_LOGIC_VECTOR(CON12-1 downto 0));
 END COMPONENT;
begin  
  val2 <= inter22(CON6-1);  
  pol1_out <= pol1;      
  i_input(0) <= I0_in;
  i_input(1) <= I1_in;
  i_input(2) <= I2_in;
  i_input(3) <= I3_in;
  i_input(4) <= I4_in;
  i_input(5) <= I5_in;
  i_input(6) <= I6_in;
  i_input(7) <= I7_in;
  i_input(8) <= I8_in;
  i_input(9) <= I9_in;
  i_input(10) <= I10_in;
  i_input(11) <= I11_in;
  i_input(12) <= I12_in;
  i_input(13) <= I13_in;
  i_input(14) <= I14_in;
  i_input(15) <= I15_in;
  i_input(16) <= I16_in;
  i_input(17) <= I17_in;
  i_input(18) <= I18_in;
  i_input(19) <= I19_in;
  q_input(0) <= Q0_in;
  q_input(1) <= Q1_in;
  q_input(2) <= Q2_in;
  q_input(3) <= Q3_in;
  q_input(4) <= Q4_in;
  q_input(5) <= Q5_in;
  q_input(6) <= Q6_in;
  q_input(7) <= Q7_in;
  q_input(8) <= Q8_in;
  q_input(9) <= Q9_in;
  q_input(10) <= Q10_in;
  q_input(11) <= Q11_in;
  q_input(12) <= Q12_in;
  q_input(13) <= Q13_in;
  q_input(14) <= Q14_in;
  q_input(15) <= Q15_in;
  q_input(16) <= Q16_in;
  q_input(17) <= Q17_in;
  q_input(18) <= Q18_in;
  q_input(19) <= Q19_in;
 proc_k: process(vxi2p, reset)
  begin
    if clock'event and clock = '1' then    
      vxi2p_d1 <= vxi2p;
    end if;
  end process proc_k;
 proc_l: process(vxi2p, reset)
  begin
    if reset='1' then     
      pol1 <= "00000010";
      pol2 <= "00000000010";
     elsif clock'event and clock = '1' then    
      if vxi2p = '1' and vxi2p_d1 = '1' then
        pol1 <= vxi2q(7 downto 0);
        pol2 <= vxi2q(18 downto 8);
      end if;
    end if;
  end process proc_l;
  bar: for i in 0 to 4 generate
    inst0001 : obj_m
      port map (
       clock             =>  clock,
       reset             =>  reset,
       ta           =>  ta(CON13*i+3 downto CON13*i),
       I0                 =>  i_input(CON13*i),  
       Q0                 =>  q_input(CON13*i),  
       I1                 =>  i_input(CON13*i+1),  
       Q1                 =>  q_input(CON13*i+1),  
       I2                 =>  i_input(CON13*i+2),  
       Q2                 =>  q_input(CON13*i+2),  
       I3                 =>  i_input(CON13*i+3),  
       Q3                 =>  q_input(CON13*i+3),  
       valid             =>  valid,  
       vex3          =>  vex3,
       ext_ta       =>  ext_ta,
       ce                =>  ce(CON13*i+3 downto CON13*i),
       store             =>  store,
       sdata             =>  sdata(CON13*i+3 downto CON13*i),
       val2          =>  inter22(CON13*i+3 downto CON13*i),
       pol1       =>  pol1,
       pol2       =>  pol2);
  end generate bar;
end behavior;
