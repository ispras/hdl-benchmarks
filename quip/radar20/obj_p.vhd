library ieee;
use ieee.std_logic_1164.all;
entity obj_p is
  port (
    vxi2a            : out   STD_LOGIC_VECTOR(31 downto 0);
    vxi2b            : out   STD_LOGIC_VECTOR(31 downto 0);
    vxi2c                : in    STD_LOGIC;
    vxi2d               : in    STD_LOGIC;
    vxi2e               : in    STD_LOGIC;
    vxi2f               : in    STD_LOGIC;
    vxi2g              : out   STD_LOGIC;
    addr                : in    STD_LOGIC_VECTOR(5 downto 1);
    data                : inout STD_ULOGIC_VECTOR(31 downto 0);
    vxi2i            : in    STD_LOGIC_VECTOR(31 downto 0);  
    vxi2j              : in    STD_LOGIC_VECTOR(12 downto 0);  
    vxi2k            : out   STD_LOGIC;                      
    vxi2l           : out   STD_LOGIC;                      
    vxi2m       : out   STD_LOGIC;                      
    vxi2n         : out   STD_LOGIC_VECTOR(6 downto 0);   
    vxi2o         : out   STD_LOGIC_VECTOR(15 downto 0);  
    vxi2p     : out   STD_LOGIC;                      
    vxi2q         : out   STD_LOGIC_VECTOR(18 downto 0);  
    vxi2r            : out   STD_LOGIC;                      
    vxi2s         : out   STD_LOGIC_VECTOR(8 downto 0);   
    vxi2t         : out   STD_LOGIC_VECTOR(15 downto 0);  
    wec2                : out   STD_LOGIC;
    wec3                : out   STD_LOGIC;
    wec4                 : out   STD_LOGIC_VECTOR(3 downto 0);
    wec1                 : inout STD_ULOGIC_VECTOR(7 downto 0);
    wec5                : out   STD_LOGIC_VECTOR(7 downto 0);
    wec8                : out   STD_LOGIC;
    wec6                : out   STD_LOGIC;
    wec7                : out   STD_LOGIC;
    set_vxi2z     : out   STD_LOGIC;                      
    vxi2z         : out   STD_LOGIC_VECTOR(5 downto 0);  
    vxi2u           : out   STD_LOGIC_VECTOR(1 downto 0);  
    vxi2v           : out   STD_LOGIC);                      
end obj_p;
architecture behavior of obj_p is
  signal datai : STD_LOGIC_VECTOR(31 downto 0);  
  signal datao : STD_LOGIC_VECTOR(31 downto 0);  
  signal inter1_6 : STD_LOGIC_VECTOR(7 downto 0);
  signal inter2_6 : STD_LOGIC_VECTOR(3 downto 0);
  signal inter3_6 : STD_LOGIC_VECTOR(7 downto 0);
  signal inter4_6 : STD_LOGIC_VECTOR(7 downto 0);
  signal inter8_6,inter9_6 : STD_LOGIC;
  signal inter5_6 : STD_LOGIC_VECTOR(3 downto 0);   
  signal reg10,reg14,reg18,reg1c,reg20,reg24,reg28 : STD_LOGIC_VECTOR(31 downto 0);
  signal intern_2 : STD_LOGIC;
  signal vxi2o_req : STD_LOGIC_VECTOR(15 downto 0);
  signal vxi2n_req : STD_LOGIC_VECTOR(6 downto 0);
  signal vxi2p_req : STD_LOGIC;
  signal vxi2q_req : STD_LOGIC_VECTOR(18 downto 0);
  signal inter7_6 : STD_LOGIC;
  signal vxi2t_req : STD_LOGIC_VECTOR(15 downto 0);
  signal vxi2s_req : STD_LOGIC_VECTOR(8 downto 0);
  signal set_vxi2z_req : STD_LOGIC;
  signal vxi2z_req : STD_LOGIC_VECTOR(5 downto 0);
  signal vxi2u_req : STD_LOGIC_VECTOR(1 downto 0);
  signal vxi2v_req : STD_LOGIC;
 begin
  data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when vxi2c='0' else
          STD_ULOGIC_VECTOR(datao);
  datai <= STD_LOGIC_VECTOR(data);
  wec1 <= "ZZZZZZZZ" when inter8_6='0' else
         STD_ULOGIC_VECTOR(inter4_6);
  inter1_6 <= STD_LOGIC_VECTOR(wec1);
  vxi2g <= '0' when (vxi2f='0')and(addr(5)='1' or addr(4)='1' or addr(3)='1')
            else '1';
  wec2 <= inter8_6 when addr(5 downto 1)="01010" and vxi2f='0' else '1';
  wec3 <= inter9_6 when addr(5 downto 1)="01010" and vxi2f='0' else '1';
  wec4<=inter2_6;
  wec5<=inter3_6;
  datao <=  reg10 when inter5_6="0001"
            else reg14 when inter5_6="0010"
            else reg18 when inter5_6="0011"
            else reg1c when inter5_6="0100"
            else reg20 when inter5_6="0101"
            else reg24 when inter5_6="0110"
            else reg28 when inter5_6="0111";
  reg10(31 downto 24)<="00000000";
  reg10(23 downto 16)<=inter3_6;
  reg10(15 downto 12)<="0000";
  reg10(11 downto 8)<=inter2_6;
  reg10(7 downto 0)<=inter4_6;
  reg14(31 downto 8)<="000000001010101011111111";
  reg14(7 downto 0)<=inter1_6;
  reg18<=vxi2i;   
  reg28(12 downto 0) <=vxi2j;                  
  reg28(31 downto 13) <="0000000000000000000";  
  vxi2a<=reg20;
  vxi2b<=reg24;
  vxi2m <= intern_2;   
  vxi2o <= vxi2o_req;
  vxi2n <= vxi2n_req;
  vxi2p <= vxi2p_req;
  vxi2q <= vxi2q_req;
  vxi2r <= inter7_6;
  vxi2t <= vxi2t_req;
  vxi2s <= vxi2s_req;
  set_vxi2z <= set_vxi2z_req;
  vxi2z <= vxi2z_req;
  vxi2u <= vxi2u_req;
  vxi2v <= vxi2v_req;     
  proc_a: process (vxi2d)
  begin
    if vxi2d'event and vxi2d='0' then
      case addr(5 downto 1) is
        when "01000" =>                 
          inter5_6<="0001";
        when "01010" =>                 
          inter5_6<="0010";
        when "01100" =>                 
          inter5_6<="0011";
        when "01110" =>                 
          inter5_6<="0100";
        when "10000" =>                 
          inter5_6<="0101";
        when "10010" =>                 
          inter5_6<="0110";
        when "10011" =>                 
          inter5_6<="0111";
        when others => null;
      end case;
    end if;
  end process proc_a;
  proc_b: process (vxi2e)
  begin
    if vxi2e'event and vxi2e = '0' then
      case addr(5 downto 1) is
        when "01000" =>                 
          inter9_6<='1';
          inter8_6<='1';
          case datai(31 downto 24) is
            when "00010000" =>          
              inter3_6<=datai(23 downto 16);
              inter2_6<=datai(11 downto 8);
              inter4_6<=datai(7 downto 0);
              inter8_6<='1';
              inter9_6<='0';
            when "00100000" =>          
              inter3_6<=datai(23 downto 16);
              inter2_6<=datai(11 downto 8);
              inter8_6<='0';
              inter9_6<='1';
            when "00110000" =>          
              wec8<='0';
            when "01000000" =>          
              wec6<='0';
            when "01010000" =>          
              wec7<='0';
            when "00110001" =>          
              wec8<='1';
            when "01000001" =>          
              wec6<='1';
            when "01010001" =>          
              wec7<='1';
            when "01100000" =>          
              vxi2k <= '1';          
            when "01100001" =>          
              vxi2k <= '0';          
            when "01100010" =>          
              vxi2l <= '1';          
            when "01100011" =>          
              vxi2l <= '0';          
            when "01110000" =>          
              vxi2o_req <= datai(15 downto 0); 
              vxi2n_req <= datai(22 downto 16); 
            when "01110001" =>          
              intern_2 <= '1';
            when "01110010" =>          
              intern_2 <= '0';
            when "01110011" =>          
              vxi2q_req <= datai(18 downto 0); 
            when "01110100" =>          
              vxi2p_req <= '1';
            when "01110101" =>          
              vxi2p_req <= '0';
            when "01110110" =>          
              vxi2t_req <= datai(15 downto 0); 
              vxi2s_req <= datai(23 downto 15); 
            when "01110111" =>          
              inter7_6 <= '1';
            when "01111000" =>          
              inter7_6 <= '0';
            when "01111001" =>          
              vxi2z_req <= datai(5 downto 0); 
            when "01111010" =>          
              set_vxi2z_req <= '1';
            when "01111011" =>          
              set_vxi2z_req <= '0';
            when "01111100" =>          
              vxi2u_req <= datai(1 downto 0); 
            when "01111101" =>          
              vxi2v_req <= '1';
            when "01111110" =>          
              vxi2v_req <= '0';
            when others => null;
          end case;
        when "01010" =>                 
          null;
        when "01100" =>                 
          null;
        when "10000" =>                 
          reg20<=datai;
        when "10010" =>                 
          reg24<=datai;
        when others => null;   
      end case;
    end if;
  end process proc_b;
end behavior;
