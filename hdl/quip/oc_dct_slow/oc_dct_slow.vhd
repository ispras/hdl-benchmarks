-- Top entity is oc_dct_slow
-- ENTITY oc_dct_slow IS
--    PORT( 
--       clk       : IN     std_logic  ;
--       dctselect : IN     std_logic  ;
--       din       : IN     std_logic  ;
--       mode      : IN     std_logic_vector (1 downto 0) ;
--       reset     : IN     std_logic  ;
--       doutput   : OUT    std_logic_vector (15 DOWNTO 0) ;
--       next_in   : OUT    std_logic  ;
--       read      : OUT    std_logic 
--    );
-- 
-- Please refer to the FreeDCT-L documentation
-- Sherif Taher Eid, sherif_taher@ieee.org
-- 

LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY add12slow IS
   PORT( 
      a      : IN     std_logic_vector (11 downto 0) ;
      b      : IN     std_logic_vector (11 downto 0) ;
      output : OUT    std_logic_vector (12 downto 0)
   );

-- Declarations

END add12slow ;
--
--
ARCHITECTURE beh OF add12slow IS
signal output_temp : unsigned(12 downto 0);
BEGIN
output_temp <= unsigned(a(11)&a) + unsigned(b(11)&b);
output <= std_logic_vector(output_temp);

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY add16bits IS
   PORT( 
      a      : IN     std_logic_vector (15 downto 0) ;
      b      : IN     std_logic_vector (15 downto 0) ;
      output : OUT    std_logic_vector (15 downto 0)
   );

-- Declarations

END add16bits ;
--
--
ARCHITECTURE beh OF add16bits IS
signal output_temp : unsigned(15 downto 0);
BEGIN

output_temp <= unsigned(a) + unsigned(b);
output <= std_logic_vector(output_temp);

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY and15 IS
   PORT( 
      enable : IN     std_logic  ;
      input  : IN     std_logic_vector (15 downto 0) ;
      output : OUT    std_logic_vector (15 downto 0)
   );

-- Declarations

END and15 ;
--
--
ARCHITECTURE struct OF and15 IS
BEGIN

with enable select
	output <= "0000000000001100" when '0',
				  input when others;

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
-- LIBRARY std ;
-- USE std.textio.all;

ENTITY cyclereg IS
   PORT( 
      ck         : IN     std_logic  ;
      din        : IN     std_logic  ;
      first      : IN     std_logic  ;
      mode       : IN     std_logic_vector (1 downto 0) ;
      rst        : IN     std_logic  ;
      enable_rom : OUT    std_logic 
   );

-- Declarations

END cyclereg ;
--
--
ARCHITECTURE beh OF cyclereg IS

signal internal : std_logic_vector(95 downto 0);
signal din_tmp : std_logic;
signal op_mode : std_logic_vector(2 downto 0);

BEGIN

op_mode <= first&mode;

with op_mode select
	din_tmp <= din when "100",
					din when "101",
					din when "110",
					din when "111",
					internal(63) when "000",
					internal(71) when "001",
					internal(79) when "010",
					internal(95) when others;

enable_rom <= internal(0);

process(ck,rst)
begin
	if rising_edge(ck) then
		if rst = '1' then
			internal <= (others => '0');
		elsif mode = "00" then -- 8 bits resolution mode
			internal(63 downto 1) <= internal(62 downto 0);
			internal(0) <= din_tmp;
		elsif mode = "01" then -- 9 bits resolution mode
			internal(71 downto 1) <= internal(70 downto 0);
			internal(0) <= din_tmp;
		elsif mode = "10" then -- 10 bits resolution mode
			internal(79 downto 1) <= internal(78 downto 0);
			internal(0) <= din_tmp;
		else							  -- 12 bits resolution mode
			internal(95 downto 1) <= internal(94 downto 0);
			internal(0) <= din_tmp;
		end if;
	end if;
end process;


END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY div2_9_en IS
   PORT( 
      ain    : IN     std_logic_vector (12 downto 0) ;
      enable : IN     std_logic  ;
      aout   : OUT    std_logic_vector (11 downto 0)
   );

-- Declarations

END div2_9_en ;
--
--
ARCHITECTURE struct OF div2_9_en IS

BEGIN

with enable select
	aout <= ain(12 downto 1) when '1',
				"000000000000" when others;
END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY reg12bits IS
   PORT( 
      ain    : IN     std_logic_vector (11 downto 0) ;
      clk    : IN     std_logic  ;
      enable : IN     std_logic  ;
      aout   : OUT    std_logic_vector (11 downto 0)
   );

-- Declarations

END reg12bits ;
--
--
ARCHITECTURE beh OF reg12bits IS
BEGIN

process(clk,enable)
begin
	if enable = '0' then
		aout <= "000000000000";
	else
		if rising_edge(clk) then
			aout <= ain;
		end if;
	end if;
end process;


END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY reg13bits IS
   PORT( 
      ain    : IN     std_logic_vector (12 downto 0) ;
      clk    : IN     std_logic  ;
      enable : IN     std_logic  ;
      aout   : OUT    std_logic_vector (12 downto 0)
   );

-- Declarations

END reg13bits ;
--
--
ARCHITECTURE beh OF reg13bits IS
BEGIN

process(clk,enable)
begin
	if enable = '0' then
		aout <= "0000000000000";
	else
		if rising_edge(clk) then
			aout <= ain;
		end if;
	end if;
end process;

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY reg16bits IS
   PORT( 
      ain    : IN     std_logic_vector (15 downto 0) ;
      clk    : IN     std_logic  ;
      enable : IN     std_logic  ;
      aout   : OUT    std_logic_vector (15 downto 0)
   );

-- Declarations

END reg16bits ;
--
--
ARCHITECTURE beh OF reg16bits IS
BEGIN

process(clk,enable)
begin
	if enable = '0' then
		aout <= "0000000000000000";
	else
		if rising_edge(clk) then
			aout <= ain;
		end if;
	end if;
end process;

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROM64 IS
   PORT( 
      columns    : IN     std_logic_vector (2 downto 0) ;
      compl      : IN     std_logic  ;
      enable_rom : IN     std_logic  ;
      rows       : IN     std_logic_vector (2 downto 0) ;
      output     : OUT    std_logic_vector (11 DOWNTO 0)
   );

-- Declarations

END ROM64 ;
--
--
ARCHITECTURE beh OF ROM64 IS


-- ROM used for Forward Discrete Cosine Transform
type ROM_array is array (63 downto 0) of std_logic_vector(11 downto 0);

signal coeff_out : std_logic_vector(11 downto 0);
signal rt,ct : unsigned(2 downto 0);
--signal cmp_c1 : unsigned(11 downto 0);
signal cmp_c2 : std_logic_vector(11 downto 0);
--signal nottemp : std_logic_vector(7 downto 0);

signal coeff: ROM_array;
signal addr : integer range 0 to 63;
--signal ap : std_logic_vector(7 downto 0) := "01011011";
--signal bp : std_logic_vector(7 downto 0) := "01110110";
--signal cp : std_logic_vector(7 downto 0) := "00110001";
--signal dp : std_logic_vector(7 downto 0) := "01111110";
--signal ep : std_logic_vector(7 downto 0) := "01101010";
--signal fp : std_logic_vector(7 downto 0) := "01000111";
--signal gp : std_logic_vector(7 downto 0) := "00011001";

--signal am : std_logic_vector(7 downto 0) := "10100101";
--signal bm : std_logic_vector(7 downto 0) := "10001010";
--signal cm : std_logic_vector(7 downto 0) := "11001111";
--signal dm : std_logic_vector(7 downto 0) := "10000010";
--signal em : std_logic_vector(7 downto 0) := "10010110";
--signal fm : std_logic_vector(7 downto 0) := "10111001";
--signal gm : std_logic_vector(7 downto 0) := "11100111";

signal ap : std_logic_vector(11 downto 0) := "010110101000";
signal bp : std_logic_vector(11 downto 0) := "011101100100";
signal cp : std_logic_vector(11 downto 0) := "001100010000";
signal dp : std_logic_vector(11 downto 0) := "011111011001";
signal ep : std_logic_vector(11 downto 0) := "011010100111";
signal fp : std_logic_vector(11 downto 0) := "010001110010";
signal gp : std_logic_vector(11 downto 0) := "000110010000";

signal am : std_logic_vector(11 downto 0) := "101001011000";
signal bm : std_logic_vector(11 downto 0) := "100010011100";
signal cm : std_logic_vector(11 downto 0) := "110011110000";
signal dm : std_logic_vector(11 downto 0) := "100000100111";
signal em : std_logic_vector(11 downto 0) := "100101011001";
signal fm : std_logic_vector(11 downto 0) := "101110001110";
signal gm : std_logic_vector(11 downto 0) := "111001110000";


BEGIN

coeff(0) <= ap;    --     A
coeff(1) <= ap;    --     A
coeff(2) <= ap;    --     A
coeff(3) <= ap;    --     A
coeff(4) <= ap;    --     A
coeff(5) <= ap;    --     A
coeff(6) <= ap;    --     A
coeff(7) <= ap;    --     A

coeff(8) <= dp;    --     D
coeff(9) <= ep;    --     E
coeff(10) <= fp;   --     F
coeff(11) <= gp;   --     G
coeff(12) <= gm;   --    -G
coeff(13) <= fm;   --    -F   
coeff(14) <= em;   --    -E
coeff(15) <= dm;   --    -D

coeff(16) <= bp;   --     B
coeff(17) <= cp;   --     C
coeff(18) <= cm;   --    -C
coeff(19) <= bm;   --    -B
coeff(20) <= bm;   --    -B
coeff(21) <= cm;   --    -C
coeff(22) <= cp;   --     C
coeff(23) <= bp;   --     B

coeff(24) <= ep;   --     E
coeff(25) <= gm;   --    -G
coeff(26) <= dm;   --    -D
coeff(27) <= fm;   --    -F
coeff(28) <= fp;   --     F
coeff(29) <= dp;   --     D
coeff(30) <= gp;   --     G
coeff(31) <= em;   --    -E

coeff(32) <= ap;   --     A
coeff(33) <= am;   --    -A
coeff(34) <= am;   --    -A
coeff(35) <= ap;   --     A
coeff(36) <= ap;   --     A
coeff(37) <= am;   --    -A
coeff(38) <= am;   --    -A
coeff(39) <= ap;   --     A

coeff(40) <= fp;   --     F
coeff(41) <= dm;   --    -D
coeff(42) <= gp;   --     G
coeff(43) <= ep;   --     E
coeff(44) <= em;   --    -E
coeff(45) <= gm;   --    -G
coeff(46) <= dp;   --     D
coeff(47) <= fm;   --    -F

coeff(48) <= cp;   --     C
coeff(49) <= bm;   --    -B
coeff(50) <= bp;   --     B
coeff(51) <= cm;   --    -C
coeff(52) <= cm;   --    -C
coeff(53) <= bp;   --     B
coeff(54) <= bm;   --    -B
coeff(55) <= cp;   --     C

coeff(56) <= gp;   --     G
coeff(57) <= fm;   --    -F
coeff(58) <= ep;   --     E
coeff(59) <= dm;   --    -D
coeff(60) <= dp;   --     D
coeff(61) <= em;   --    -E
coeff(62) <= fp;   --     F
coeff(63) <= gm;   --    -G

rt <= unsigned(rows);
ct <= unsigned(columns);
addr <= CONV_INTEGER(rt&ct);

with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;

--nottemp <= not(coeff_out);
--cmp_c1 <= unsigned(nottemp) + "000000000001";
--cmp_c2 <= std_logic_vector(cmp_c1);
cmp_c2 <= not(coeff_out);

with compl select
output <= cmp_c2 when '1',
	  coeff_out when others;
	
END beh;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
-- LIBRARY std ;
-- USE std.textio.all;

ENTITY dctslowcontroller IS
   PORT( 
      clk          : IN     std_logic  ;
      dctselect    : IN     std_logic  ;
      mode         : IN     std_logic_vector (1 downto 0) ;
      reset        : IN     std_logic  ;
      ck           : OUT    std_logic  ;
      clk_1        : OUT    std_logic  ;
      columns      : OUT    std_logic_vector (2 downto 0) ;
      enable_0     : OUT    std_logic  ;
      enable_1     : OUT    std_logic  ;
      enable_2     : OUT    std_logic  ;
      enable_and12 : OUT    std_logic  ;
      next_in      : OUT    std_logic  ;
      read         : OUT    std_logic  ;
      rows         : OUT    std_logic_vector (2 downto 0) ;
      rst          : OUT    std_logic  ;
      clk_0        : BUFFER std_logic  ;
      clk_2        : BUFFER std_logic  ;
      compl        : BUFFER std_logic  ;
      enable_div   : BUFFER std_logic  ;
      first        : BUFFER std_logic 
   );

-- Declarations

END dctslowcontroller ;
--
--
ARCHITECTURE beh3 OF dctslowcontroller IS
signal next_in_tmp,enable_clk_0,enable_clk_2,clk_2_tmp : std_logic;
signal enable_and12_tmp,enable_div_tmp,enable_ck,first_tmp : std_logic;
signal read_tmp,read_tmp2 : std_logic;
signal address,address_tmp,add_tmp2 : std_logic_vector(5 downto 0);

BEGIN

with dctselect select
	rows <= add_tmp2(5 downto 3) when '1',
				add_tmp2(2 downto 0) when others;

with dctselect select
	columns <= add_tmp2(2 downto 0) when '1',
			      add_tmp2(5 downto 3) when others;



clk_0 <= clk and enable_clk_0;
clk_1 <= clk_0;
ck <= clk and enable_ck;
rst <= reset;
enable_0 <= not reset;
enable_1 <= not reset;
enable_2 <= not reset;

next_in <= next_in_tmp and first_tmp;


main : process(clk)
variable cyccount : integer range 0 to 63 := 0;
variable state : integer range 0 to 12 := 0;
variable counter : integer range 0 to 11 := 0;

begin

address_tmp <= conv_std_logic_vector(cyccount,6);

if rising_edge(clk) then
	if clk_2 = '1' then
		if counter = 7 then
			read_tmp <= '1';
			counter := 0;
		else 
			counter := counter + 1;
			read_tmp <= '0';
		end if;
	end if;

	if (reset = '1')then
		first_tmp <= '1';
		cyccount := 0;
		counter := 0;
		state := 0;
		address <= "000000";
		compl <= '0';
		enable_div_tmp <= '1';
		next_in_tmp <= '0';
		enable_clk_0 <= '0';
		enable_clk_2 <= '0';
		enable_ck <= '0';
		enable_and12_tmp <= '0';
		read_tmp <= '0';
		read_tmp2 <= '0';
		read <= '0';
		clk_2_tmp <= '0';
		clk_2 <= '0';
	else

		clk_2 <= clk_2_tmp;
		address <= address_tmp;
		compl <= next_in_tmp;
		enable_div_tmp <= not compl;
		clk_2_tmp <= (not enable_div_tmp) and enable_clk_2;
		enable_and12_tmp <= '1';
		enable_and12 <= enable_and12_tmp;
		enable_div <= enable_div_tmp;
		add_tmp2 <= address;
		first <= first_tmp;
		read_tmp2 <= read_tmp;
		read <= read_tmp2;

		case state is 
			when 0 =>
				first_tmp <= '1';
				cyccount := 0;
				next_in_tmp <= '1';
				state := 1;
			when 1 =>
				next_in_tmp <= '0';
				enable_ck <= '1';
				state := 2;
			when 2 =>
				if counter = 0 then
					enable_and12_tmp <= '0';
				else
					enable_and12_tmp <= '1';
				end if;
				state := 3;
			when 3 =>
				state := 4;
				enable_clk_0 <= '1';
			when 4 =>
				state := 5;
				enable_clk_2 <= '1';
			when 5 =>
				if mode = "00" then
					state := 6;
				elsif mode = "01" then
					state := 12;
				elsif mode = "10" then
					state := 11;
				else
					state := 9;
				end if;
			when 9 =>
				state := 10;
			when 10 =>
				state := 11;
			when 11 =>
				state := 12;
			when 12 =>
				state := 6;
			when 6 =>
				state := 7;
			when 7 =>
				state := 8;
			when 8 =>
				if cyccount = 7 then
					first_tmp <= '0';
					cyccount := cyccount + 1;
				elsif cyccount = 63 then
					first_tmp <= '1';
					cyccount := 0;
				else
					cyccount := cyccount + 1;
				end if;

				next_in_tmp <= '1';
				state := 1;
		end case;
	end if;
end if;

end process main;


END beh3;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY oc_dct_slow IS
   PORT( 
      clk       : IN     std_logic  ;
      dctselect : IN     std_logic  ;
      din       : IN     std_logic  ;
      mode      : IN     std_logic_vector (1 downto 0) ;
      reset     : IN     std_logic  ;
      doutput   : OUT    std_logic_vector (15 DOWNTO 0) ;
      next_in   : OUT    std_logic  ;
      read      : OUT    std_logic 
   );

-- Declarations

END oc_dct_slow ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
-- LIBRARY std ;
-- USE std.textio.ALL;
LIBRARY work;

ARCHITECTURE struct OF oc_dct_slow IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL ck           : std_logic;
SIGNAL clk_0        : std_logic;
SIGNAL clk_1        : std_logic;
SIGNAL clk_2        : std_logic;
SIGNAL columns      : std_logic_vector(2 downto 0);
SIGNAL compl        : std_logic;
SIGNAL enable_0     : std_logic;
SIGNAL enable_1     : std_logic;
SIGNAL enable_2     : std_logic;
SIGNAL enable_and12 : std_logic;
SIGNAL enable_div   : std_logic;
SIGNAL enable_rom   : std_logic;
SIGNAL first        : std_logic;
SIGNAL inadd_1_1    : std_logic_vector(11 downto 0);
SIGNAL inadd_1_2    : std_logic_vector(11 downto 0);
SIGNAL inadd_2_1    : std_logic_vector(15 downto 0);
SIGNAL inadd_2_2    : std_logic_vector(15 downto 0);
SIGNAL outadd_1     : std_logic_vector(12 downto 0);
SIGNAL outadd_2     : std_logic_vector(15 downto 0);
SIGNAL outdct       : std_logic_vector(15 downto 0);
SIGNAL register_1   : std_logic_vector(12 DOWNTO 0);
SIGNAL rom_output   : std_logic_vector(11 DOWNTO 0);
SIGNAL rows         : std_logic_vector(2 downto 0);
SIGNAL rst          : std_logic;

-- Component Declarations
COMPONENT ROM64
   PORT (
      columns    : IN     std_logic_vector (2 downto 0);
      compl      : IN     std_logic ;
      enable_rom : IN     std_logic ;
      rows       : IN     std_logic_vector (2 downto 0);
      output     : OUT    std_logic_vector (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12slow
   PORT (
      a      : IN     std_logic_vector (11 downto 0);
      b      : IN     std_logic_vector (11 downto 0);
      output : OUT    std_logic_vector (12 downto 0)
   );
END COMPONENT;
COMPONENT add16bits
   PORT (
      a      : IN     std_logic_vector (15 downto 0);
      b      : IN     std_logic_vector (15 downto 0);
      output : OUT    std_logic_vector (15 downto 0)
   );
END COMPONENT;
COMPONENT and15
   PORT (
      enable : IN     std_logic ;
      input  : IN     std_logic_vector (15 downto 0);
      output : OUT    std_logic_vector (15 downto 0)
   );
END COMPONENT;
COMPONENT cyclereg
   PORT (
      ck         : IN     std_logic ;
      din        : IN     std_logic ;
      first      : IN     std_logic ;
      mode       : IN     std_logic_vector (1 downto 0);
      rst        : IN     std_logic ;
      enable_rom : OUT    std_logic 
   );
END COMPONENT;
COMPONENT dctslowcontroller
   PORT (
      clk          : IN     std_logic ;
      dctselect    : IN     std_logic ;
      mode         : IN     std_logic_vector (1 downto 0);
      reset        : IN     std_logic ;
      ck           : OUT    std_logic ;
      clk_1        : OUT    std_logic ;
      columns      : OUT    std_logic_vector (2 downto 0);
      enable_0     : OUT    std_logic ;
      enable_1     : OUT    std_logic ;
      enable_2     : OUT    std_logic ;
      enable_and12 : OUT    std_logic ;
      next_in      : OUT    std_logic ;
      read         : OUT    std_logic ;
      rows         : OUT    std_logic_vector (2 downto 0);
      rst          : OUT    std_logic ;
      clk_0        : BUFFER std_logic ;
      clk_2        : BUFFER std_logic ;
      compl        : BUFFER std_logic ;
      enable_div   : BUFFER std_logic ;
      first        : BUFFER std_logic 
   );
END COMPONENT;
COMPONENT div2_9_en
   PORT (
      ain    : IN     std_logic_vector (12 downto 0);
      enable : IN     std_logic ;
      aout   : OUT    std_logic_vector (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12bits
   PORT (
      ain    : IN     std_logic_vector (11 downto 0);
      clk    : IN     std_logic ;
      enable : IN     std_logic ;
      aout   : OUT    std_logic_vector (11 downto 0)
   );
END COMPONENT;
COMPONENT reg13bits
   PORT (
      ain    : IN     std_logic_vector (12 downto 0);
      clk    : IN     std_logic ;
      enable : IN     std_logic ;
      aout   : OUT    std_logic_vector (12 downto 0)
   );
END COMPONENT;
COMPONENT reg16bits
   PORT (
      ain    : IN     std_logic_vector (15 downto 0);
      clk    : IN     std_logic ;
      enable : IN     std_logic ;
      aout   : OUT    std_logic_vector (15 downto 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROM64 USE ENTITY work.ROM64;
FOR ALL : add12slow USE ENTITY work.add12slow;
FOR ALL : add16bits USE ENTITY work.add16bits;
FOR ALL : and15 USE ENTITY work.and15;
FOR ALL : cyclereg USE ENTITY work.cyclereg;
FOR ALL : dctslowcontroller USE ENTITY work.dctslowcontroller;
FOR ALL : div2_9_en USE ENTITY work.div2_9_en;
FOR ALL : reg12bits USE ENTITY work.reg12bits;
FOR ALL : reg13bits USE ENTITY work.reg13bits;
FOR ALL : reg16bits USE ENTITY work.reg16bits;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 1 eb1
inadd_2_1 <= register_1(12)&register_1(12)&register_1(12)&register_1;


-- HDL Embedded Text Block 2 eb2
--with dctselect select
--   doutput <= outdct(9 downto 2) when '1',
--        outdct(7 downto 0) when others;
-- 14 downto 0 is the useful output
doutput <= outdct;


   -- Instance port mappings.
   I10 : ROM64
      PORT MAP (
         columns    => columns,
         compl      => compl,
         enable_rom => enable_rom,
         rows       => rows,
         output     => rom_output
      );
   I2 : add12slow
      PORT MAP (
         a      => inadd_1_1,
         b      => inadd_1_2,
         output => outadd_1
      );
   I4 : add16bits
      PORT MAP (
         a      => inadd_2_1,
         b      => inadd_2_2,
         output => outadd_2
      );
   I6 : and15
      PORT MAP (
         enable => enable_and12,
         input  => outdct,
         output => inadd_2_2
      );
   I8 : cyclereg
      PORT MAP (
         ck         => ck,
         din        => din,
         first      => first,
         mode       => mode,
         rst        => rst,
         enable_rom => enable_rom
      );
   I1 : dctslowcontroller
      PORT MAP (
         clk          => clk,
         dctselect    => dctselect,
         mode         => mode,
         reset        => reset,
         ck           => ck,
         clk_1        => clk_1,
         columns      => columns,
         enable_0     => enable_0,
         enable_1     => enable_1,
         enable_2     => enable_2,
         enable_and12 => enable_and12,
         next_in      => next_in,
         read         => read,
         rows         => rows,
         rst          => rst,
         clk_0        => clk_0,
         clk_2        => clk_2,
         compl        => compl,
         enable_div   => enable_div,
         first        => first
      );
   I5 : div2_9_en
      PORT MAP (
         ain    => register_1,
         enable => enable_div,
         aout   => inadd_1_2
      );
   I0 : reg12bits
      PORT MAP (
         ain    => rom_output,
         clk    => clk_0,
         enable => enable_0,
         aout   => inadd_1_1
      );
   I7 : reg13bits
      PORT MAP (
         ain    => outadd_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => register_1
      );
   I9 : reg16bits
      PORT MAP (
         ain    => outadd_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => outdct
      );

END struct;
