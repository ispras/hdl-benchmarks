library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_j is
  generic (
    CON1    : natural      := 16;  
    CON8     : natural      := 5;   
    CON9     : natural      := 7;   
    CON10      : natural      := 16;  
    CON11  : natural      := 8    
    );
  port (
    clock               : in  STD_LOGIC;  
    reset               : in  STD_LOGIC;  
    val2            : out STD_LOGIC_VECTOR(CON11-1 downto 0);  
    bc1             : in  STD_LOGIC;
    Iin0                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iin1                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iin2                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iin3                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iin4                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iin5                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iin6                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iin7                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Iout0               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout1               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout2               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout3               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout4               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout5               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout6               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Iout7               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qin0                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qin1                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qin2                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qin3                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qin4                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qin5                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qin6                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qin7                : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Qout0               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qout1               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qout2               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qout3               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qout4               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qout5               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qout6               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Qout7               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    vxi2m                : in STD_LOGIC;  
    vxi2n                : in STD_LOGIC_VECTOR(CON9-1 downto 0); 
    vxi2o                : in STD_LOGIC_VECTOR(CON1-1 downto 0)); 
end obj_j;
architecture behavior of obj_j is
   signal por5: UNSIGNED(CON8-1 downto 0);  
   signal por4: UNSIGNED(CON9-4 downto 0);           
   signal por6 : STD_LOGIC:='0';                        
   signal inter4 :STD_LOGIC:='0';      
   signal inter4_d1 :STD_LOGIC:='0';   
   signal inter5 :STD_LOGIC:='0';   
   signal ii_11        :STD_LOGIC_VECTOR(CON11-1 downto 0); 
  type signalarray is array (0 to CON11-1) of STD_LOGIC_VECTOR(CON1-1 downto 0);
  signal i_input : signalarray;
  signal q_input : signalarray;
  signal i_output : signalarray;
  signal q_output : signalarray;
  signal por1 :STD_LOGIC:='0';  
  constant vl1     : STD_LOGIC := '0';
  constant vl2   : STD_LOGIC := '1';
  constant vl3     : STD_LOGIC_VECTOR(1 downto 0):="01";
  constant vl4   : STD_LOGIC_VECTOR(1 downto 0):="10";
  COMPONENT obj_h
  generic (
    CON1    : natural := 16;
    CON8     : natural := 5;
    CON9     : natural := 4; 
    CON10      : natural := 16
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
  END COMPONENT;
begin  
 proc_a: process(clock,reset)
   variable sigg1 : unsigned(CON8-1 downto 0);
   variable vl : STD_LOGIC_VECTOR(1 downto 0) := vl3;
  begin
    if reset='1' then                            
      por5 <= to_unsigned(4,CON8);    
      por4 <= to_unsigned(0,CON9-3);  
      sigg1 := to_unsigned(4,CON8);
      vl:=vl3;
    elsif clock'event and clock = '1' then    
      case vl is
        when vl3 =>
          por5 <= por5 + 1;  
          por4 <= por4 + 1; 
          sigg1 := sigg1 + 4;      
          por6 <= '0';               
          vl := vl4;
        when vl4 =>
          if por4 = CON10-1 then           
            por5 <= sigg1;               
            por4 <= to_unsigned(0,CON9-3); 
            por6 <= '1';                      
            vl := vl3;
          else
            por5 <= por5 + 1; 
            por4 <= por4 + 1; 
            por6 <= '0';
            vl := vl4;
          end if; 
        when others => null;
      end case;
    end if;
  end process proc_a;
 proc_b: process(clock,vxi2m)
  begin
    if reset='1' then                         
      inter4 <= '0';
      inter4_d1 <= '0';     
    elsif clock'event and clock = '1' then    
      inter4 <= vxi2m;
      inter4_d1 <= inter4;
      por1 <= bc1;
    end if;
 end process proc_b;
 proc_c: process(clock,reset)
 variable vl : STD_LOGIC := vl1;
  begin
    if reset='1' then                         
      vl:=vl1;
      inter5 <= '0';
    elsif clock'event and clock = '1' then    
      case vl is
        when vl1 =>
         if inter4 = '1' and inter4_d1 = '1' then  
           inter5 <= '1';    
           vl:=vl2;
         else
           vl:=vl1;
         end if;
        when vl2 =>
         inter5 <= '0';
         if inter4 = '0' and inter4_d1 = '0' then  
           vl:=vl1;
         else
           vl:=vl2;
         end if;
        when others => null;
       end case;
    end if;
  end process proc_c;
 proc_d: process(inter5)
  begin
   if inter5 = '1' then
      case vxi2n(6 downto 4) is
        when "000" =>
          ii_11 <= "00000001";
        when "001" =>
          ii_11 <= "00000010";
        when "010" =>
          ii_11 <= "00000100";
        when "011" =>
          ii_11 <= "00001000";
        when "100" =>
          ii_11 <= "00010000";
        when "101" =>
          ii_11 <= "00100000";
        when "110" =>
          ii_11 <= "01000000";
        when "111" =>
          ii_11 <= "10000000";
        when others =>
          ii_11 <= "00000000";  
     end case;
   else
     ii_11 <= "00000000";
   end if;
  end process proc_d;
  i_input(0)<=Iin0;
  i_input(1)<=Iin1;
  i_input(2)<=Iin2;
  i_input(3)<=Iin3;
  i_input(4)<=Iin4;
  i_input(5)<=Iin5;
  i_input(6)<=Iin6;
  i_input(7)<=Iin7;
  q_input(0)<=Qin0;
  q_input(1)<=Qin1;
  q_input(2)<=Qin2;
  q_input(3)<=Qin3;
  q_input(4)<=Qin4;
  q_input(5)<=Qin5;
  q_input(6)<=Qin6;
  q_input(7)<=Qin7;
  Iout0<=i_output(0);
  Iout1<=i_output(1);
  Iout2<=i_output(2);
  Iout3<=i_output(3);
  Iout4<=i_output(4);
  Iout5<=i_output(5);
  Iout6<=i_output(6);
  Iout7<=i_output(7);
  Qout0<=q_output(0);
  Qout1<=q_output(1);
  Qout2<=q_output(2);
  Qout3<=q_output(3);
  Qout4<=q_output(4);
  Qout5<=q_output(5);
  Qout6<=q_output(6);
  Qout7<=q_output(7);
  bar: for i in 0 to CON11-1 generate
    obj_j : obj_h
      port map (
       clock             =>  clock,
       reset             =>  reset,
       val2          =>  val2(i),  
       por1        =>  por1,  
       I_in              =>  i_input(i),  
       por2        =>  i_output(i),  
       Q_in              =>  q_input(i),
       por3        =>  q_output(i),
       por4       =>  STD_LOGIC_VECTOR(por4),
       por5       =>  STD_LOGIC_VECTOR(por5),      
       por6        =>  por6,
       ii_11          =>  ii_11(i),     
       vxi2n       =>  vxi2n(3 downto 0),   
       vxi2o       =>  vxi2o);   
  end generate bar;
end behavior;
