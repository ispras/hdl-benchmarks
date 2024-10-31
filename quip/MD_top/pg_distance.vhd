------------------------------------------------------------------------------
-- Finds shortest distance between particle A and B in one dimension
-- If distance is exactly half of 2^INTEGER_SIZE then overflow is asserted
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pg_distance is
   generic (
      INTEGER_SIZE : integer := 32
   );
   port (
      a_in      : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
      b_in      : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
      output    : out std_logic_vector(INTEGER_SIZE-2 downto 0);
      force_dir : out std_logic;
      overflow  : out std_logic
   );
end pg_distance;

architecture rtl of pg_distance is
   signal a_sub_b : std_logic_vector(INTEGER_SIZE-1 downto 0);
   signal b_sub_a : std_logic_vector(INTEGER_SIZE-1 downto 0);
begin
   -- Choose smaller of a - b and b - a
   a_sub_b <= a_in - b_in;
   b_sub_a <= b_in - a_in;
   output  <= a_sub_b(INTEGER_SIZE-2 downto 0) when a_sub_b(INTEGER_SIZE-1) = '0' else
              b_sub_a(INTEGER_SIZE-2 downto 0);

   -- Force direction depend on which distance was chosen
   force_dir <= a_sub_b(INTEGER_SIZE-1);

   -- If distance is exactly half of 2^INTEGER_SIZE then overflow is asserted
   overflow <= a_sub_b(INTEGER_SIZE-1) and b_sub_a(INTEGER_SIZE-1);
end rtl;
