library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;
entity obj_o is
  generic (
        CON6                        : natural := 20;             
        CON21                  : natural := 6;              
	CON5 			: natural := 8;              
	CON1 			: natural := 32;             
        CON22                        : natural := 13;             
	CON23 			: natural := 128*2*20);      
  port (
    clock           : in  STD_LOGIC;
    reset           : in  STD_LOGIC;
    sdata           : in  STD_LOGIC_VECTOR(CON6-1 downto 0);  
    ce              : out STD_LOGIC_VECTOR(CON6-1 downto 0);  
    ext_ta     : out STD_LOGIC;                              
    vex2      : out STD_LOGIC;                              
    vex3        : out STD_LOGIC_VECTOR(CON5-1 downto 0); 
    vex4       : in  STD_LOGIC;  
    pol1     : in STD_LOGIC_VECTOR(CON5-1 downto 0);  
    vex5 	    : in  STD_LOGIC;  
    vex6         : in  STD_LOGIC;                                
    vex7         : out STD_LOGIC_VECTOR(CON1-1 downto 0);   
    vxi2j          : out STD_LOGIC_VECTOR(CON22-1 downto 0);    
    set_vxi2z : in STD_LOGIC; 
    vex10 : in STD_LOGIC_VECTOR(CON21-1 downto 0));  
end obj_o;
architecture behavior of obj_o is
  signal inter1_9, inter2_9	: STD_LOGIC_VECTOR(CON1-1 downto 0);  
  signal inter3_9, inter4_9    : STD_LOGIC_VECTOR(CON22-1 downto 0);   
  signal inter5_9 		: STD_LOGIC;                               
  signal inter6_9 			: STD_LOGIC_VECTOR(CON22-1 downto 0);  
  signal inter7_9                   : STD_LOGIC;      
  signal inter8_9                  : STD_LOGIC;      
  signal inter9_9               : STD_LOGIC;      
  signal inter10_9              : STD_LOGIC;      
  signal addr                   : STD_LOGIC_VECTOR(CON5-1 downto 0); 
  signal inter11_9            : STD_LOGIC;      
  signal vxi2z            : STD_LOGIC_VECTOR(CON21-1 downto 0); 
  constant SL1       : STD_LOGIC_VECTOR(6 downto 0):="0000001";
  constant SL2    : STD_LOGIC_VECTOR(6 downto 0):="0000010";
  constant SL3     : STD_LOGIC_VECTOR(6 downto 0):="0000100";
  constant SL4   : STD_LOGIC_VECTOR(6 downto 0):="0001000";
  constant SL5        : STD_LOGIC_VECTOR(6 downto 0):="0010000";
  constant SL6        : STD_LOGIC_VECTOR(6 downto 0):="0100000";
  constant SL7       : STD_LOGIC_VECTOR(6 downto 0):="1000000";
  COMPONENT dpram5_wrap
	PORT
	(
	addra: IN std_logic_VECTOR(12 downto 0);
	addrb: IN std_logic_VECTOR(12 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(31 downto 0);
	doutb: OUT std_logic_VECTOR(31 downto 0);
	ena: IN std_logic;
	enb: IN std_logic;
	wea: IN std_logic	
	);
  END COMPONENT;
COMPONENT obj_g
	PORT
	(
	Q: OUT std_logic_VECTOR(7 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic;
	ACLR: IN std_logic
	);
END COMPONENT;
begin  
  vxi2j <= inter6_9;     
  vex3 <= addr;    
  vex2 <= inter8_9; 
  insta : dpram5_wrap
    port map (
      wea      => inter5_9,
      clka   => clock,
      clkb   => clock,
      ena  =>'1',
      enb  =>'1',
      dina      => inter1_9,
      addra => inter4_9,
      addrb => inter3_9,
      doutb         => inter2_9);  
      vex7 <= inter2_9;  
  instb : obj_g
    port map (
      ACLR => inter10_9,
      CE => inter9_9,
      Q => addr,    
      CLK => clock);
 proc_a : process(set_vxi2z, vxi2z, reset)
  begin
    if reset='1' then     
      vxi2z <= "100001";                
     elsif clock'event and clock = '1' then    
      if set_vxi2z = '1' then
        vxi2z <= vex10;       
      end if;
    end if;
  end process proc_a;
 proc_b: process(reset, vex5, inter11_9)
   begin
     if reset = '1' or vex5 = '1' or inter11_9 = '1' then
        inter10_9 <= '1';
     else
        inter10_9 <= '0';
     end if;
   end process proc_b;
 proc_c: process(clock,reset)
   variable state : STD_LOGIC_VECTOR(6 downto 0) := SL1;
  begin
    if reset='1' then                            
      state:=SL1;
      inter11_9 <= '0';
      inter9_9 <= '0';
    elsif clock'event and clock = '1' then    
      case state is
        when SL1 =>
          inter11_9 <= '0';
          if vex4 = '1' then    
            ext_ta <= '1';
            state := SL2;
          else
            state := SL1;     
          end if;
        when SL2 =>        
            state := SL3;
        when SL3 =>
            inter8_9 <= '1';            
            state := SL4;
        when SL4 =>
            inter8_9 <= '0';            
            state := SL5;
        when SL5 =>
            if inter7_9 = '1' then
              state := SL5;
            else
              state := SL6;
              inter9_9 <= '1';
            end if;
        when SL6 =>
            inter9_9 <= '0';                   
            state := SL7;             
        when SL7 =>
            if addr = pol1 then          
              ext_ta <= '0';               
              inter11_9 <= '1';
              state := SL1;
            else
              state := SL2;               
            end if;
        when others => null;
      end case;
    end if;
  end process proc_c;
  proc_d: process (clock, vex5)  
	type t_array is array (0 to 4) of STD_LOGIC;   
	variable var1    : t_array;                      
	variable var2     : natural range 0 to CON6-1;  
	variable var3     : UNSIGNED(CON21-1 downto 0);   
	variable var4    : STD_LOGIC_VECTOR(CON1-1 downto 0); 
  begin
    if vex5='1' then   
       inter4_9 <= STD_LOGIC_VECTOR(to_unsigned(0,CON22));   
       inter3_9 <= STD_LOGIC_VECTOR(to_unsigned(0,CON22));    
       inter6_9 <= STD_LOGIC_VECTOR(to_unsigned(0,CON22));       
       inter5_9 <= '0';                                          
       inter7_9 <= '0';                                              
       var2 := 0;
       var3 := "000000";                                               
       var1:="11111";
    elsif clock'event and clock = '1' then  
       if inter8_9 = '1' then   
         inter7_9 <= '1';        
	 var2 := 0;          
	 var3 := "000000";   
       end if;
       if inter5_9='1' then    
	  if inter4_9=STD_LOGIC_VECTOR(to_unsigned(CON23-1,CON22)) then  
             inter4_9<=STD_LOGIC_VECTOR(to_unsigned(0,CON22));
	     inter6_9<=STD_LOGIC_VECTOR((unsigned(inter6_9)+to_unsigned(1,CON22)));  
          else
             inter4_9<=STD_LOGIC_VECTOR((unsigned(inter4_9)+to_unsigned(1,CON22)));
	     inter6_9<=STD_LOGIC_VECTOR((unsigned(inter6_9)+to_unsigned(1,CON22)));  
          end if;
          inter5_9 <='0';
       end if;
       if inter7_9='1' then     
	  ce(var2)<='1';    
	  var4(CON1-2 downto 0):=var4(CON1-1 downto 1);
	  var4(CON1-1):=sdata(var2);
	  var3 := var3 + 1;
	  
          if STD_LOGIC_VECTOR(var3) = vxi2z then
	     inter1_9(CON1-1 downto 0)<=var4(CON1-1 downto 0);  
	     inter5_9 <= '1';                          
             ce(var2)<='0';
	     var2:=var2+1;                             
	     if var2 = CON6 then                 
		inter7_9 <= '0';
             end if;
	     var3:="000000";
          end if;
      end if;
      for i in 3 downto 0 loop
           var1(i+1):=var1(i);
      end loop;
      var1(0):=vex6;      
      if var1(0)='1' and var1(1)='1' and var1(2)='0' then   
	 if inter3_9=STD_LOGIC_VECTOR(to_unsigned(CON23-1,CON22)) then  
	       inter3_9<=STD_LOGIC_VECTOR(to_unsigned(0,CON22));
	       inter6_9<=STD_LOGIC_VECTOR((unsigned(inter6_9)-to_unsigned(1,CON22)));
	 else
	       inter3_9<=STD_LOGIC_VECTOR((unsigned(inter3_9)+to_unsigned(1,CON22)));  
               inter6_9<=STD_LOGIC_VECTOR((unsigned(inter6_9)-to_unsigned(1,CON22)));
	 end if;   
       end if;
    end if;  
	
  end process proc_d;
end behavior;
