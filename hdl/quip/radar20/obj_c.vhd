library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_c is
  generic (
    CON3     : natural      := 9;   
    CON5    : natural      := 4;   
    CON7     : natural      := 16;  
    CON1    : natural      := 16;  
    CON6    : natural      := 20    
    );
  port (
    clock               : in  STD_LOGIC;  
    reset               : in  STD_LOGIC;  
    valid               : in  STD_LOGIC;  
    val2            : out STD_LOGIC_VECTOR(CON6-1 downto 0);
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
    I0_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I1_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I2_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I3_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I4_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I5_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I6_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I7_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I8_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I9_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I10_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I11_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I12_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I13_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I14_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I15_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I16_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I17_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I18_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I19_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q0_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q1_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q2_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q3_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q4_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q5_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q6_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q7_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q8_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q9_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q10_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q11_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q12_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q13_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q14_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q15_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q16_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q17_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q18_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q19_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    vxi2r            : in   STD_LOGIC;                      
    vxi2s         : in   STD_LOGIC_VECTOR(CON3-1 downto 0);   
    vxi2t         : in   STD_LOGIC_VECTOR(CON1-1 downto 0);  
    pr4        : out STD_LOGIC_VECTOR(CON6-1 downto 0)); 
end obj_c;
architecture behavior of obj_c is
   signal interc_0 :STD_LOGIC:='0';   
   signal interc_1 :STD_LOGIC:='0';   
   signal assert_inter0001 :STD_LOGIC:='0';   
   signal inter0001        :STD_LOGIC_VECTOR(CON6-1 downto 0); 
  type signalarray is array (0 to CON6-1) of STD_LOGIC_VECTOR(CON1-1 downto 0);
  signal i_output : signalarray;
  signal q_output : signalarray;
  constant ST1     : STD_LOGIC := '0';
  constant ST2   : STD_LOGIC := '1';
COMPONENT obj_a
  generic (
    CON3     : natural      := 4; 
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
 END COMPONENT;
begin  
 proc_b: process(clock,vxi2r)
  begin
    if reset='1' then                         
      interc_0 <= '0';
      interc_1 <= '0';     
    elsif clock'event and clock = '1' then    
      interc_0 <= vxi2r;
      interc_1 <= interc_0;
    end if;
 end process proc_b;
 proc_d: process(clock,reset)
 variable state : STD_LOGIC := ST1;
  begin
    if reset='1' then                         
      state:=ST1;
      assert_inter0001 <= '0';
    elsif clock'event and clock = '1' then    
      case state is
        when ST1 =>
         if interc_0 = '1' and interc_1 = '1' then  
           assert_inter0001 <= '1';    
           state:=ST2;
         else
           state:=ST1;
         end if;
        when ST2 =>
         assert_inter0001 <= '0';
         if interc_0 = '0' and interc_1 = '0' then  
           state:=ST1;
         else
           state:=ST2;
         end if;
        when others => null;
       end case;
    end if;
  end process proc_d;
 proc_c: process(assert_inter0001)
  begin
   if assert_inter0001 = '1' then
      case vxi2s(8 downto 4) is
        when "00000" =>
          inter0001 <= "00000000000000000001";
        when "00001" =>
          inter0001 <= "00000000000000000010";
        when "00010" =>
          inter0001 <= "00000000000000000100";
        when "00011" =>
          inter0001 <= "00000000000000001000";
        when "00100" =>
          inter0001 <= "00000000000000010000";
        when "00101" =>
          inter0001 <= "00000000000000100000";
        when "00110" =>
          inter0001 <= "00000000000001000000";
        when "00111" =>
          inter0001 <= "00000000000010000000";
        when "01000" =>
          inter0001 <= "00000000000100000000";
        when "01001" =>
          inter0001 <= "00000000001000000000";
        when "01010" =>
          inter0001 <= "00000000010000000000";
        when "01011" =>
          inter0001 <= "00000000100000000000";
        when "01100" =>
          inter0001 <= "00000001000000000000";
        when "01101" =>
          inter0001 <= "00000010000000000000";
        when "01110" =>
          inter0001 <= "00000100000000000000";
        when "01111" =>
          inter0001 <= "00001000000000000000";
        when "10000" =>
          inter0001 <= "00010000000000000000";
        when "10001" =>
          inter0001 <= "00100000000000000000";
        when "10010" =>
          inter0001 <= "01000000000000000000";
        when "10011" =>
          inter0001 <= "10000000000000000000";
        when others =>
          inter0001 <= "00000000000000000000";
       end case;
   else
     inter0001 <= "00000000000000000000";
   end if;
  end process proc_c;
  pr4 <= inter0001;
  I0_out<=i_output(0);
  I1_out<=i_output(1);
  I2_out<=i_output(2);
  I3_out<=i_output(3);
  I4_out<=i_output(4);
  I5_out<=i_output(5);
  I6_out<=i_output(6);
  I7_out<=i_output(7);
  I8_out<=i_output(8);
  I9_out<=i_output(9);
  I10_out<=i_output(10);
  I11_out<=i_output(11);
  I12_out<=i_output(12);
  I13_out<=i_output(13);
  I14_out<=i_output(14);
  I15_out<=i_output(15);
  I16_out<=i_output(16);
  I17_out<=i_output(17);
  I18_out<=i_output(18);
  I19_out<=i_output(19);
  Q0_out<=q_output(0);
  Q1_out<=q_output(1);
  Q2_out<=q_output(2);
  Q3_out<=q_output(3);
  Q4_out<=q_output(4);
  Q5_out<=q_output(5);
  Q6_out<=q_output(6);
  Q7_out<=q_output(7);
  Q8_out<=q_output(8);
  Q9_out<=q_output(9);
  Q10_out<=q_output(10);
  Q11_out<=q_output(11);
  Q12_out<=q_output(12);
  Q13_out<=q_output(13);
  Q14_out<=q_output(14);
  Q15_out<=q_output(15);
  Q16_out<=q_output(16);
  Q17_out<=q_output(17);
  Q18_out<=q_output(18);
  Q19_out<=q_output(19);
  bar: for i in 0 to CON6-1 generate
    inst : obj_a
      port map (
       clock             =>  clock,
       reset             =>  reset,
       valid             =>  valid,  
       val2          =>  val2(i),  
       I0                =>  I0,  
       I1                =>  I1,  
       I2                =>  I2,  
       I3                =>  I3,  
       I4                =>  I4,  
       I5                =>  I5,  
       I6                =>  I6,  
       I7                =>  I7,  
       Q0                =>  Q0,  
       Q1                =>  Q1,  
       Q2                =>  Q2,  
       Q3                =>  Q3,  
       Q4                =>  Q4,  
       Q5                =>  Q5,  
       Q6                =>  Q6,  
       Q7                =>  Q7,  
       Iout              =>  i_output(i),  
       Qout              =>  q_output(i),
       inter0001          =>  inter0001(i),     
       vxi2s       =>  vxi2s(3 downto 0),   
       vxi2t       =>  vxi2t);   
  end generate bar;
end behavior;
