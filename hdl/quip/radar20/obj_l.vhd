library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_l is
  generic (
    CON1   : natural      := 16;   
    CON6    : natural      := 20   
    );
  port (
    node1              : in  STD_LOGIC;  
    valid_a           : in  STD_LOGIC_VECTOR(7 downto 0);  
    valid_2w          : in  STD_LOGIC_VECTOR(CON6-1 downto 0);  
    val2            : out STD_LOGIC;
    I0_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    I1_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I2_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I3_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I4_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I5_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I6_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I7_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q0_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q1_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q2_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q3_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q4_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q5_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q6_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q7_2w                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I0_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    I1_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I2_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I3_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I4_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I5_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I6_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I7_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q0_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0); 
    Q1_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q2_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q3_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q4_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q5_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q6_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q7_a                  : in  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I0_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I1_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I2_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I3_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I4_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I5_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I6_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    I7_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q0_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q1_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q2_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q3_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q4_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q5_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q6_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0);
    Q7_out               : out  STD_LOGIC_VECTOR(CON1-1 downto 0));
end obj_l;
architecture behavior of obj_l is
begin  
 proc_a: process(node1)
  begin 
   if node1 = '0' then 
     I0_out <= I0_a;
     I1_out <= I1_a;
     I2_out <= I2_a;
     I3_out <= I3_a;
     I4_out <= I4_a;
     I5_out <= I5_a;
     I6_out <= I6_a;
     I7_out <= I7_a;
     Q0_out <= Q0_a;
     Q1_out <= Q1_a;
     Q2_out <= Q2_a;
     Q3_out <= Q3_a;
     Q4_out <= Q4_a;
     Q5_out <= Q5_a;
     Q6_out <= Q6_a;
     Q7_out <= Q7_a;
     val2 <= valid_a(0);
    else
     I0_out <= I0_2w;
     I1_out <= I1_2w;
     I2_out <= I2_2w;
     I3_out <= I3_2w;
     I4_out <= I4_2w;
     I5_out <= I5_2w;
     I6_out <= I6_2w;
     I7_out <= I7_2w;
     Q0_out <= Q0_2w;
     Q1_out <= Q1_2w;
     Q2_out <= Q2_2w;
     Q3_out <= Q3_2w;
     Q4_out <= Q4_2w;
     Q5_out <= Q5_2w;
     Q6_out <= Q6_2w;
     Q7_out <= Q7_2w;
     val2 <= valid_2w(0);
    end if;
  end process proc_a;
end behavior;
