library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_i is
  generic (
    CON16 : natural   := 4;       
    CON17    : natural      := 16;      
    CON18    : natural      := 16;      
    CON19 : natural      := 32;      
    CON20 : natural    := 32+4     
    );
  port (
    clock0              : in  STD_LOGIC;  
    aclr0               : in  STD_LOGIC;  
    wl             : in  STD_LOGIC;  
    obe         : in  STD_LOGIC;  
    dataa                  : in STD_LOGIC_VECTOR(CON17-1 downto 0); 
    datab                  : in STD_LOGIC_VECTOR(CON18-1 downto 0); 
    out6        : out STD_LOGIC_VECTOR(CON19-1 downto 0);   
    result                 : out STD_LOGIC_VECTOR(CON20-1 downto 0)); 
end obj_i;
architecture behavior of obj_i is
  signal inter1_b : STD_LOGIC_VECTOR(CON20-1 downto 0);  
  signal inter2_b : STD_LOGIC_VECTOR(CON20-1 downto 0);   
  signal inter3_b : STD_LOGIC_VECTOR(CON19-1 downto 0);   
  signal inter25 : STD_LOGIC_VECTOR(CON20-1 downto 0);   
  signal outb41 : STD_LOGIC;  
  signal outb42 : STD_LOGIC;  
  signal outb43 : STD_LOGIC;  
  signal inter5_b1     : STD_LOGIC;  
  signal inter5_b2     : STD_LOGIC;  
  signal inter5_b3     : STD_LOGIC;  
  COMPONENT AS_2
	PORT
	(
	A: IN std_logic_VECTOR(23 downto 0);
	B: IN std_logic_VECTOR(23 downto 0);
	ADD: IN std_logic;
	Q: OUT std_logic_VECTOR(23 downto 0);
	CLK: IN std_logic;
	ACLR: IN std_logic
	);
  END COMPONENT;
  COMPONENT mult2_wrap
	PORT
	(
	clk: IN std_logic;
	a: IN std_logic_VECTOR(11 downto 0);
	b: IN std_logic_VECTOR(11 downto 0);
	q: OUT std_logic_VECTOR(23 downto 0);
	aclr: IN std_logic
	);
  END COMPONENT;
begin  
   result <= inter1_b;
   out6 <= inter3_b;
 proc_a: process(inter3_b)
  begin
  inter25(CON19-1 downto 0) <= inter3_b; 
  for i in CON20-1 downto CON19 loop
     inter25(i)<= inter3_b(CON19-1);   
  end loop;
  end process proc_a;
 proc_b: process(clock0)
  begin
    if aclr0='1' then                         
      inter5_b1 <= '1';
      inter5_b2 <= '1';
      inter5_b3 <= '1';
      outb41 <= '0';
      outb42 <= '0';
      outb43 <= '0';
    elsif clock0'event and clock0 = '1' then    
      inter5_b1 <= wl;
      inter5_b2 <= inter5_b1;
      inter5_b3 <= inter5_b2;
      outb41 <= obe;
      outb42 <= outb41;
      outb43 <= outb42;
    end if;
 end process proc_b;
 proc_c: process(outb43)
  begin
   if outb43 = '0' then
     inter2_b <= inter1_b;
   else
     inter2_b <= STD_LOGIC_VECTOR(to_unsigned(0,CON20));
   end if;
  end process proc_c;
   binst : mult2_wrap
     port map (
       clk  => clock0,
       aclr => aclr0,
       a (10 DOWNTO 0)  => dataa(10 DOWNTO 0),
       b (10 DOWNTO 0)  => datab(10 DOWNTO 0),
       q (21 DOWNTO 0) => inter3_b(21 DOWNTO 0));
  inst2_3 : AS_2
    port map (
      CLK  => clock0,
      ACLR => aclr0,
      A (23 DOWNTO 0) => inter2_b(23 DOWNTO 0),
      B (23 DOWNTO 0)=> inter25(23 DOWNTO 0),
      Q (23 DOWNTO 0) => inter1_b(23 DOWNTO 0),
      ADD => inter5_b3);
end behavior;
