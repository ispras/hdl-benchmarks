LIBRARY ieee;
USE ieee.std_logic_1164.all; 
LIBRARY work;
ENTITY obj_q IS 
	port
	(
		DATA14 :  IN  STD_LOGIC;
		DATA13 :  IN  STD_LOGIC;
		CLKSOURCE1 :  IN  STD_LOGIC;
		VXI2C :  IN  STD_LOGIC;
		VXI2D :  IN  STD_LOGIC;
		VXI2E :  IN  STD_LOGIC;
		DATA12 :  IN  STD_LOGIC;
		CLKSOURCE0 :  IN  STD_LOGIC;
		DATA15 :  IN  STD_LOGIC;
		DATA0 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA1 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA2 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA3 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA4 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA5 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA6 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA7 :  IN  STD_LOGIC_VECTOR(15 downto 0);
		DATA08 :  INOUT  STD_ULOGIC_VECTOR(31 downto 0);
		WEC1 :  INOUT  STD_ULOGIC_VECTOR(7 downto 0);
		DATA10 :  IN  STD_LOGIC_VECTOR(5 downto 1);
		DATA29 :  OUT  STD_LOGIC;
		DATA19 :  OUT  STD_LOGIC;
		DATA24 :  OUT  STD_LOGIC;
		DATA20 :  OUT  STD_LOGIC;
		WEC2 :  OUT  STD_LOGIC;
		WEC3 :  OUT  STD_LOGIC;
		WEC8 :  OUT  STD_LOGIC;
		WEC6 :  OUT  STD_LOGIC;
		WEC7 :  OUT  STD_LOGIC;
		DATA18 :  OUT  STD_LOGIC;
		WEC4 :  OUT  STD_LOGIC_VECTOR(3 downto 0);
		WEC5 :  OUT  STD_LOGIC_VECTOR(7 downto 0);
  		vxi2a : out   STD_LOGIC_VECTOR(31 downto 0);
    	vxi2b : out   STD_LOGIC_VECTOR(31 downto 0);
		
		pr4 : out STD_LOGIC_VECTOR(19 downto 0)
		);
END obj_q;
ARCHITECTURE bdf_type OF obj_q IS 
component altclklock0_wrap
	PORT(inclk0 : IN STD_LOGIC;
		 c0 : OUT STD_LOGIC;
		 c1 : OUT STD_LOGIC
	);
end component;
component obj_l
  generic (
    CON1   : natural      := 16;   
    CON6    : natural      := 20   
    );
	PORT(node1 : IN STD_LOGIC;
		 I0_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I0_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 I1_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I1_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 I2_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I2_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 I3_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I3_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 I4_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I4_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 I5_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I5_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 I6_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I6_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 I7_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 I7_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q0_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q0_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q1_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q1_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q2_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q2_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q3_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q3_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q4_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q4_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q5_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q5_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q6_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q6_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q7_2w : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q7_a : IN STD_LOGIC_VECTOR(15 downto 0);
		 valid_2w : IN STD_LOGIC_VECTOR(19 downto 0);
		 valid_a : IN STD_LOGIC_VECTOR(7 downto 0);
		 val2 : OUT STD_LOGIC;
		 I0_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I1_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I2_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I3_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I4_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I5_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I6_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I7_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q0_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q1_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q2_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q3_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q4_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q5_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q6_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q7_out : OUT STD_LOGIC_VECTOR(15 downto 0)
	);
end component;
component obj_p
	PORT(vxi2c : IN STD_LOGIC;
		 vxi2d : IN STD_LOGIC;
		 vxi2e : IN STD_LOGIC;
		 vxi2f : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(5 downto 1);
		 data : INOUT STD_ULOGIC_VECTOR(31 downto 0);
		 vxi2j : IN STD_LOGIC_VECTOR(12 downto 0);
		 wec1 : INOUT STD_ULOGIC_VECTOR(7 downto 0);
		 vxi2i : IN STD_LOGIC_VECTOR(31 downto 0);
		 vxi2g : OUT STD_LOGIC;
		 vxi2k : OUT STD_LOGIC;
		 vxi2l : OUT STD_LOGIC;
		 vxi2m : OUT STD_LOGIC;
		 vxi2p : OUT STD_LOGIC;
		 vxi2r : OUT STD_LOGIC;
		 wec2 : OUT STD_LOGIC;
		 wec3 : OUT STD_LOGIC;
		 wec8 : OUT STD_LOGIC;
		 wec6 : OUT STD_LOGIC;
		 wec7 : OUT STD_LOGIC;
		 set_vxi2z : OUT STD_LOGIC;
		 vxi2v : OUT STD_LOGIC;
		 vxi2s : OUT STD_LOGIC_VECTOR(8 downto 0);
		 vxi2t : OUT STD_LOGIC_VECTOR(15 downto 0);
		 vxi2u : OUT STD_LOGIC_VECTOR(1 downto 0);
		 vxi2n : OUT STD_LOGIC_VECTOR(6 downto 0);
		 vxi2o : OUT STD_LOGIC_VECTOR(15 downto 0);
		 wec4 : OUT STD_LOGIC_VECTOR(3 downto 0);
		 wec5 : OUT STD_LOGIC_VECTOR(7 downto 0);
		 vxi2b : OUT STD_LOGIC_VECTOR(31 downto 0);
		 vxi2a : OUT STD_LOGIC_VECTOR(31 downto 0);
		 vxi2q : OUT STD_LOGIC_VECTOR(18 downto 0);
		 vxi2z : OUT STD_LOGIC_VECTOR(5 downto 0)
	);
end component;
component obj_k
	PORT(ev : IN STD_LOGIC;
		 sp : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 X0 : IN STD_LOGIC_VECTOR(15 downto 0);
		 X1 : IN STD_LOGIC_VECTOR(15 downto 0);
		 X2 : IN STD_LOGIC_VECTOR(15 downto 0);
		 X3 : IN STD_LOGIC_VECTOR(15 downto 0);
		 X4 : IN STD_LOGIC_VECTOR(15 downto 0);
		 X5 : IN STD_LOGIC_VECTOR(15 downto 0);
		 X6 : IN STD_LOGIC_VECTOR(15 downto 0);
		 X7 : IN STD_LOGIC_VECTOR(15 downto 0);
		 bc1 : OUT STD_LOGIC;
		 Y0 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 Y1 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 Y2 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 Y3 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 Y4 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 Y5 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 Y6 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 Y7 : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
end component;
component obj_o
  generic (
        CON6                        : natural := 20;             
        CON21                  : natural := 6;              
		CON5 			: natural := 8;              
		CON1 			: natural := 32;             
        CON22                        : natural := 13;             
		CON23 			: natural := 128*2*20);      
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 vex4 : IN STD_LOGIC;
		 vex5 : IN STD_LOGIC;
		 vex6 : IN STD_LOGIC;
		 set_vxi2z : IN STD_LOGIC;
		 pol1 : IN STD_LOGIC_VECTOR(7 downto 0);
		 sdata : IN STD_LOGIC_VECTOR(19 downto 0);
		 vex10 : IN STD_LOGIC_VECTOR(5 downto 0);
		 ext_ta : OUT STD_LOGIC;
		 vex2 : OUT STD_LOGIC;
		 ce : OUT STD_LOGIC_VECTOR(19 downto 0);
		 vex7 : OUT STD_LOGIC_VECTOR(31 downto 0);
		 vex3 : OUT STD_LOGIC_VECTOR(7 downto 0);
		 vxi2j : OUT STD_LOGIC_VECTOR(12 downto 0)
	);
end component;
component obj_n
  generic (
    CON25       : natural   := 1024;  
    CON13       : natural   := 4;     
    CON12 : natural   := 11;    
    CON5        : natural   := 8;     
    CON1     : natural      := 16;    
    CON6      : natural      := 20     
    );
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 valid : IN STD_LOGIC;
		 ext_ta : IN STD_LOGIC;
		 store : IN STD_LOGIC;
		 vxi2p : IN STD_LOGIC;
		 ce : IN STD_LOGIC_VECTOR(19 downto 0);
		 vex3 : IN STD_LOGIC_VECTOR(7 downto 0);
		 I0_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I10_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I11_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I12_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I13_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I14_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I15_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I16_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I17_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I18_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I19_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I1_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I2_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I3_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I4_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I5_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I6_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I7_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I8_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 I9_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q0_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q10_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q11_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q12_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q13_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q14_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q15_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q16_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q17_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q18_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q19_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q1_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q2_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q3_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q4_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q5_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q6_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q7_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q8_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q9_in : IN STD_LOGIC_VECTOR(15 downto 0);
		 vxi2q : IN STD_LOGIC_VECTOR(18 downto 0);
		 ta : IN STD_LOGIC_VECTOR(19 downto 0);
		 val2 : OUT STD_LOGIC;
		 pol1_out : OUT STD_LOGIC_VECTOR(7 downto 0);
		 sdata : OUT STD_LOGIC_VECTOR(19 downto 0)
	);
end component;
component obj_j
  generic (
    CON1    : natural      := 16;  
    CON8     : natural      := 5;   
    CON9     : natural      := 7;   
    CON10      : natural      := 16;  
    CON11  : natural      := 8    
    );
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 bc1 : IN STD_LOGIC;
		 vxi2m : IN STD_LOGIC;
		 vxi2n : IN STD_LOGIC_VECTOR(6 downto 0);
		 vxi2o : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin0 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin1 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin2 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin3 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin4 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin5 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin6 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iin7 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin0 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin1 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin2 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin3 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin4 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin5 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin6 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Qin7 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Iout0 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Iout1 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Iout2 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Iout3 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Iout4 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Iout5 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Iout6 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Iout7 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 val2 : OUT STD_LOGIC_VECTOR(7 downto 0);
		 Qout0 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Qout1 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Qout2 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Qout3 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Qout4 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Qout5 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Qout6 : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Qout7 : OUT STD_LOGIC_VECTOR(15 downto 0)
	);
end component;
component altclklock2_wrap
	PORT(inclk0 : IN STD_LOGIC;
		 c0 : OUT STD_LOGIC
	);
end component;
component obj_c
  generic (
    CON3     : natural      := 9;   
    CON5    : natural      := 4;   
    CON7     : natural      := 16;  
    CON1    : natural      := 16;  
    CON6    : natural      := 20    
    );
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 valid : IN STD_LOGIC;
		 vxi2r : IN STD_LOGIC;
		 vxi2s : IN STD_LOGIC_VECTOR(8 downto 0);
		 vxi2t : IN STD_LOGIC_VECTOR(15 downto 0);
		 I0 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I1 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I2 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I3 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I4 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I5 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I6 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I7 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q0 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q1 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q2 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q3 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q4 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q5 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q6 : IN STD_LOGIC_VECTOR(15 downto 0);
		 Q7 : IN STD_LOGIC_VECTOR(15 downto 0);
		 I0_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I10_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I11_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I12_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I13_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I14_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I15_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I16_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I17_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I18_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I19_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I1_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I2_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I3_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I4_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I5_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I6_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I7_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I8_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 I9_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 val2 : OUT STD_LOGIC_VECTOR(19 downto 0);
		 Q0_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q10_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q11_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q12_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q13_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q14_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q15_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q16_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q17_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q18_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q19_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q1_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q2_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q3_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q4_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q5_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q6_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q7_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q8_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 Q9_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 
		 pr4 : out STD_LOGIC_VECTOR(CON6-1 downto 0)
		 
		 
	);
end component;
component obj_d
  generic (
    CON6       : natural      := 20;
    CON24    : natural      := 5  
    );
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 ta : IN STD_LOGIC;
		 ext_ta : IN STD_LOGIC;
		 mode : IN STD_LOGIC_VECTOR(1 downto 0);
		 mag_ta : OUT STD_LOGIC_VECTOR(19 downto 0)
	);
end component;
signal	bc1 :  STD_LOGIC;
signal	vxi2m :  STD_LOGIC;
signal	vxi2r :  STD_LOGIC;
signal	vxi2s :  STD_LOGIC_VECTOR(8 downto 0);
signal	vxi2t :  STD_LOGIC_VECTOR(15 downto 0);
signal	vxi2u :  STD_LOGIC_VECTOR(1 downto 0);
signal	ce :  STD_LOGIC_VECTOR(19 downto 0);
signal	vxi2l :  STD_LOGIC;
signal	vxi2n :  STD_LOGIC_VECTOR(6 downto 0);
signal	vxi2o :  STD_LOGIC_VECTOR(15 downto 0);
signal	vex7 :  STD_LOGIC_VECTOR(31 downto 0);
signal	vex3 :  STD_LOGIC_VECTOR(7 downto 0);
signal	ext_ta :  STD_LOGIC;
signal	iva :  STD_LOGIC_VECTOR(7 downto 0);
signal	vxi2j :  STD_LOGIC_VECTOR(12 downto 0);
signal	gates :  STD_LOGIC_VECTOR(31 downto 0);
signal	Iout0_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout10_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout11_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout12_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout13_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout14_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout15_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout16_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout17_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout18_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout19_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout1_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout2_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout3_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout4_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout5_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout6_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout7_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout8_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Iout9_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	vex2 :  STD_LOGIC;
signal	ivb :  STD_LOGIC;
signal	newblock :  STD_LOGIC;
signal	Qout0_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout10_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout11_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout12_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout13_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout14_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout15_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout16_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout17_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout18_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout19_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout1_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout2_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout3_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout4_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout5_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout6_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout7_a :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout8_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	Qout9_2w :  STD_LOGIC_VECTOR(15 downto 0);
signal	vxi2q :  STD_LOGIC_VECTOR(18 downto 0);
signal	pol1 :  STD_LOGIC_VECTOR(7 downto 0);
signal	vex8 :  STD_LOGIC;
signal	vxi2k :  STD_LOGIC;
signal	sdata :  STD_LOGIC_VECTOR(19 downto 0);
signal	vxi2p :  STD_LOGIC;
signal	set_vxi2z :  STD_LOGIC;
signal	synch :  STD_LOGIC;
signal	vex9 :  STD_LOGIC;
signal	sysreset :  STD_LOGIC;
signal	ta :  STD_LOGIC_VECTOR(19 downto 0);
signal	trigs :  STD_LOGIC_VECTOR(31 downto 0);
signal	vex10 :  STD_LOGIC_VECTOR(5 downto 0);
signal	Y0 :  STD_LOGIC_VECTOR(31 downto 0);
signal	Y1 :  STD_LOGIC_VECTOR(31 downto 0);
signal	Y2 :  STD_LOGIC_VECTOR(31 downto 0);
signal	Y3 :  STD_LOGIC_VECTOR(31 downto 0);
signal	Y4 :  STD_LOGIC_VECTOR(31 downto 0);
signal	Y5 :  STD_LOGIC_VECTOR(31 downto 0);
signal	Y6 :  STD_LOGIC_VECTOR(31 downto 0);
signal	Y7 :  STD_LOGIC_VECTOR(31 downto 0);
signal	WB_0 :  STD_LOGIC;
signal	WB_1 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_2 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_3 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_4 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_5 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_6 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_7 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_8 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_9 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_10 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_11 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_12 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_13 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_14 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_15 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_16 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_17 :  STD_LOGIC_VECTOR(19 downto 0);
signal	WB_18 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_19 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_20 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_21 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_22 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_23 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_24 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_25 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_26 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_27 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_28 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_29 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_30 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_31 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_32 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_33 :  STD_LOGIC_VECTOR(15 downto 0);
signal	WB_34 :  STD_LOGIC;
BEGIN 
DATA19 <= WB_34;
DATA24 <= WB_34;
process(vex9)
begin
if (rising_edge(vex9)) then
	sysreset <= WB_0;
end if;
end process;
b2v_inst10 : altclklock0_wrap
PORT MAP(inclk0 => vex8,
		 c0 => DATA29,
		 c1 => vex9);
b2v_inst11 : obj_l
GENERIC MAP(CON6 => 20,CON1 => 16)
PORT MAP(node1 => vxi2u(0),
		 I0_2w => WB_1,
		 I0_a => Iout0_a,
		 I1_2w => WB_2,
		 I1_a => Iout1_a,
		 I2_2w => WB_3,
		 I2_a => Iout2_a,
		 I3_2w => WB_4,
		 I3_a => Iout3_a,
		 I4_2w => WB_5,
		 I4_a => Iout4_a,
		 I5_2w => WB_6,
		 I5_a => Iout5_a,
		 I6_2w => WB_7,
		 I6_a => Iout6_a,
		 I7_2w => WB_8,
		 I7_a => Iout7_a,
		 Q0_2w => WB_9,
		 Q0_a => Qout0_a,
		 Q1_2w => WB_10,
		 Q1_a => Qout1_a,
		 Q2_2w => WB_11,
		 Q2_a => Qout2_a,
		 Q3_2w => WB_12,
		 Q3_a => Qout3_a,
		 Q4_2w => WB_13,
		 Q4_a => Qout4_a,
		 Q5_2w => WB_14,
		 Q5_a => Qout5_a,
		 Q6_2w => WB_15,
		 Q6_a => Qout6_a,
		 Q7_2w => WB_16,
		 Q7_a => Qout7_a,
		 valid_2w => WB_17,
		 valid_a => iva,
		 val2 => ivb,
		 I0_out => WB_18,
		 I1_out => WB_19,
		 I2_out => WB_20,
		 I3_out => WB_21,
		 I4_out => WB_22,
		 I5_out => WB_23,
		 I6_out => WB_24,
		 I7_out => WB_25,
		 Q0_out => WB_26,
		 Q1_out => WB_27,
		 Q2_out => WB_28,
		 Q3_out => WB_29,
		 Q4_out => WB_30,
		 Q5_out => WB_31,
		 Q6_out => WB_32,
		 Q7_out => WB_33);
b2v_inst12 : obj_p
PORT MAP(vxi2c => VXI2C,
		 vxi2d => VXI2D,
		 vxi2e => VXI2E,
		 vxi2f => DATA12,
		 addr => DATA10,
		 data => DATA08,
		 vxi2j => vxi2j,
		 wec1 => WEC1,
		 vxi2i => vex7,
		 vxi2g => DATA20,
		 vxi2k => vxi2k,
		 vxi2l => vxi2l,
		 vxi2m => vxi2m,
		 vxi2p => vxi2p,
		 vxi2r => vxi2r,
		 wec2 => WEC2,
		 wec3 => WEC3,
		 wec8 => WEC8,
		 wec6 => WEC6,
		 wec7 => synch,
		 set_vxi2z => set_vxi2z,
		 vxi2v => WB_0,
		 vxi2s => vxi2s,
		 vxi2t => vxi2t,
		 vxi2u => vxi2u,
		 vxi2n => vxi2n,
		 vxi2o => vxi2o,
		 wec4 => WEC4,
		 wec5 => WEC5,
		 vxi2q => vxi2q,
		 vxi2z => vex10,
		 vxi2a => vxi2a,
		 vxi2b => vxi2b );
		 
		 
		 
b2v_inst2 : obj_k
PORT MAP(ev => DATA14,
		 sp => DATA13,
		 clock => vex8,
		 X0 => DATA0,
		 X1 => DATA1,
		 X2 => DATA2,
		 X3 => DATA3,
		 X4 => DATA4,
		 X5 => DATA5,
		 X6 => DATA6,
		 X7 => DATA7,
		 bc1 => bc1,
		 Y0 => Y0,
		 Y1 => Y1,
		 Y2 => Y2,
		 Y3 => Y3,
		 Y4 => Y4,
		 Y5 => Y5,
		 Y6 => Y6,
		 Y7 => Y7);
b2v_inst3 : obj_o
GENERIC MAP(CON22 => 13,CON23 => 5120,CON21 => 6,CON6 => 20,CON5 => 8,CON1 => 32)
PORT MAP(clock => vex9,
		 reset => sysreset,
		 vex4 => newblock,
		 vex5 => vxi2l,
		 vex6 => vxi2k,
		 set_vxi2z => set_vxi2z,
		 pol1 => pol1,
		 sdata => sdata,
		 vex10 => vex10,
		 ext_ta => ext_ta,
		 vex2 => vex2,
		 ce => ce,
		 vex7 => vex7,
		 vex3 => vex3,
		 vxi2j => vxi2j);
b2v_inst4 : obj_n
GENERIC MAP(CON25 => 1024,CON12 => 11,CON6 => 20,CON5 => 8,CON1 => 16)
PORT MAP(clock => vex9,
		 reset => sysreset,
		 valid => ivb,
		 ext_ta => ext_ta,
		 store => vex2,
		 vxi2p => vxi2p,
		 ce => ce,
		 vex3 => vex3,
		 I0_in => WB_18,
		 I10_in => Iout10_2w,
		 I11_in => Iout11_2w,
		 I12_in => Iout12_2w,
		 I13_in => Iout13_2w,
		 I14_in => Iout14_2w,
		 I15_in => Iout15_2w,
		 I16_in => Iout16_2w,
		 I17_in => Iout17_2w,
		 I18_in => Iout18_2w,
		 I19_in => Iout19_2w,
		 I1_in => WB_19,
		 I2_in => WB_20,
		 I3_in => WB_21,
		 I4_in => WB_22,
		 I5_in => WB_23,
		 I6_in => WB_24,
		 I7_in => WB_25,
		 I8_in => Iout8_2w,
		 I9_in => Iout9_2w,
		 Q0_in => WB_26,
		 Q10_in => Qout10_2w,
		 Q11_in => Qout11_2w,
		 Q12_in => Qout12_2w,
		 Q13_in => Qout13_2w,
		 Q14_in => Qout14_2w,
		 Q15_in => Qout15_2w,
		 Q16_in => Qout16_2w,
		 Q17_in => Qout17_2w,
		 Q18_in => Qout18_2w,
		 Q19_in => Qout19_2w,
		 Q1_in => WB_27,
		 Q2_in => WB_28,
		 Q3_in => WB_29,
		 Q4_in => WB_30,
		 Q5_in => WB_31,
		 Q6_in => WB_32,
		 Q7_in => WB_33,
		 Q8_in => Qout8_2w,
		 Q9_in => Qout9_2w,
		 vxi2q => vxi2q,
		 ta => ta,
		 val2 => newblock,
		 pol1_out => pol1,
		 sdata => sdata);
b2v_inst5 : obj_j
GENERIC MAP(CON9 => 7,CON8 => 5,CON11 => 8,CON10 => 16,CON1 => 16)
PORT MAP(clock => vex9,
		 reset => sysreset,
		 bc1 => bc1,
		 vxi2m => vxi2m,
		 vxi2n => vxi2n,
		 vxi2o => vxi2o,
		 Iin0 => Y0(31 downto 16),
		 Iin1 => Y1(31 downto 16),
		 Iin2 => Y2(31 downto 16),
		 Iin3 => Y3(31 downto 16),
		 Iin4 => Y4(31 downto 16),
		 Iin5 => Y5(31 downto 16),
		 Iin6 => Y6(31 downto 16),
		 Iin7 => Y7(31 downto 16),
		 Qin0 => Y0(15 downto 0),
		 Qin1 => Y1(15 downto 0),
		 Qin2 => Y2(15 downto 0),
		 Qin3 => Y3(15 downto 0),
		 Qin4 => Y4(15 downto 0),
		 Qin5 => Y5(15 downto 0),
		 Qin6 => Y6(15 downto 0),
		 Qin7 => Y7(15 downto 0),
		 Iout0 => Iout0_a,
		 Iout1 => Iout1_a,
		 Iout2 => Iout2_a,
		 Iout3 => Iout3_a,
		 Iout4 => Iout4_a,
		 Iout5 => Iout5_a,
		 Iout6 => Iout6_a,
		 Iout7 => Iout7_a,
		 val2 => iva,
		 Qout0 => Qout0_a,
		 Qout1 => Qout1_a,
		 Qout2 => Qout2_a,
		 Qout3 => Qout3_a,
		 Qout4 => Qout4_a,
		 Qout5 => Qout5_a,
		 Qout6 => Qout6_a,
		 Qout7 => Qout7_a);
b2v_inst7 : altclklock2_wrap
PORT MAP(inclk0 => CLKSOURCE0,
		 c0 => DATA18);
b2v_inst8 : obj_c
GENERIC MAP(CON3 => 9,CON6 => 20,CON7 => 16,CON5 => 4,CON1 => 16)
PORT MAP(clock => vex9,
		 reset => sysreset,
		 valid => iva(0),
		 vxi2r => vxi2r,
		 vxi2s => vxi2s,
		 vxi2t => vxi2t,
		 I0 => Iout0_a,
		 I1 => Iout1_a,
		 I2 => Iout2_a,
		 I3 => Iout3_a,
		 I4 => Iout4_a,
		 I5 => Iout5_a,
		 I6 => Iout6_a,
		 I7 => Iout7_a,
		 Q0 => Qout0_a,
		 Q1 => Qout1_a,
		 Q2 => Qout2_a,
		 Q3 => Qout3_a,
		 Q4 => Qout4_a,
		 Q5 => Qout5_a,
		 Q6 => Qout6_a,
		 Q7 => Qout7_a,
		 I0_out => WB_1,
		 I10_out => Iout10_2w,
		 I11_out => Iout11_2w,
		 I12_out => Iout12_2w,
		 I13_out => Iout13_2w,
		 I14_out => Iout14_2w,
		 I15_out => Iout15_2w,
		 I16_out => Iout16_2w,
		 I17_out => Iout17_2w,
		 I18_out => Iout18_2w,
		 I19_out => Iout19_2w,
		 I1_out => WB_2,
		 I2_out => WB_3,
		 I3_out => WB_4,
		 I4_out => WB_5,
		 I5_out => WB_6,
		 I6_out => WB_7,
		 I7_out => WB_8,
		 I8_out => Iout8_2w,
		 I9_out => Iout9_2w,
		 val2 => WB_17,
		 Q0_out => WB_9,
		 Q10_out => Qout10_2w,
		 Q11_out => Qout11_2w,
		 Q12_out => Qout12_2w,
		 Q13_out => Qout13_2w,
		 Q14_out => Qout14_2w,
		 Q15_out => Qout15_2w,
		 Q16_out => Qout16_2w,
		 Q17_out => Qout17_2w,
		 Q18_out => Qout18_2w,
		 Q19_out => Qout19_2w,
		 Q1_out => WB_10,
		 Q2_out => WB_11,
		 Q3_out => WB_12,
		 Q4_out => WB_13,
		 Q5_out => WB_14,
		 Q6_out => WB_15,
		 Q7_out => WB_16,
		 Q8_out => Qout8_2w,
		 Q9_out => Qout9_2w,
		
		 pr4 => pr4
		 
		 );
b2v_inst9 : obj_d
GENERIC MAP(CON24 => 5,CON6 => 20)
PORT MAP(clock => vex9,
		 reset => sysreset,
		 ta => DATA15,
		 ext_ta => ext_ta,
		 mode => vxi2u,
		 mag_ta => ta);
vex8 <= CLKSOURCE1;
WEC7 <= synch;
END; 
