LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY dctslowout IS
   PORT( 
      clk     : IN     std_logic  ;
      doutput : IN     std_logic_vector (15 DOWNTO 0) ;
      read    : IN     std_logic  ;
      reset   : IN     std_logic  ;
      dout    : OUT    std_logic  ;
      start   : OUT    std_logic 
   );

-- Declarations

END dctslowout ;
--
--
ARCHITECTURE beh3 OF dctslowout IS
signal inreg : std_logic_vector(15 downto 0);
signal start_int : std_logic;

BEGIN

process(reset,clk)
variable done : std_logic;

begin
if rising_edge(clk) then
	if reset = '1' then
		inreg <= "0000000000000000";
		start_int <= '0';
		start <= '0';
		done := '0';
	else
		start <= start_int;

		if read = '1' then
			if done = '0' then
				done := '1';
				start_int <= '1';
			else
				start_int <= '0';
			end if;
		else
			done := '0';
		end if;

		if start_int = '0' then
			inreg <= '0'&inreg(15 downto 1);
		else
			inreg <= doutput;
		end if;


	end if;
end if;
end process;

dout <= inreg(0);

END beh3;

