---------------------------------------------------------------------
-- TITLE: Register Bank
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/2/01
-- FILENAME: reg_bank.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements a register bank with 32 registers that are 32-bits wide.
--    There are two read-ports and one write port.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity reg_bank is
   port(clk            : in  std_logic;
        rs_index       : in  std_logic_vector(5 downto 0);
        rt_index       : in  std_logic_vector(5 downto 0);
        rd_index       : in  std_logic_vector(5 downto 0);
        reg_source_out : out std_logic_vector(31 downto 0);
        reg_target_out : out std_logic_vector(31 downto 0);
        reg_dest_new   : in  std_logic_vector(31 downto 0);
        intr_enable    : out std_logic);
end; --entity reg_bank

architecture logic of reg_bank is
   signal reg31, reg01, reg02, reg03 : std_logic_vector(31 downto 0);
   --For Altera simulations, comment out reg04 through reg30
   signal reg04, reg05, reg06, reg07 : std_logic_vector(31 downto 0);
   signal reg08, reg09, reg10, reg11 : std_logic_vector(31 downto 0);
   signal reg12, reg13, reg14, reg15 : std_logic_vector(31 downto 0);
   signal reg16, reg17, reg18, reg19 : std_logic_vector(31 downto 0);
   signal reg20, reg21, reg22, reg23 : std_logic_vector(31 downto 0);
   signal reg24, reg25, reg26, reg27 : std_logic_vector(31 downto 0);
   signal reg28, reg29, reg30        : std_logic_vector(31 downto 0);
   signal reg_epc                    : std_logic_vector(31 downto 0);
   signal reg_status                 : std_logic;
begin

reg_proc: process(clk, rs_index, rt_index, rd_index, reg_dest_new,
   reg31, reg01, reg02, reg03, reg04, reg05, reg06, reg07,
   reg08, reg09, reg10, reg11, reg12, reg13, reg14, reg15,
   reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23,
   reg24, reg25, reg26, reg27, reg28, reg29, reg30,
   reg_epc, reg_status)
begin
   case rs_index is
   when "000000" => reg_source_out <= ZERO;
   when "000001" => reg_source_out <= reg01;
   when "000010" => reg_source_out <= reg02;
   when "000011" => reg_source_out <= reg03;
   when "000100" => reg_source_out <= reg04;
   when "000101" => reg_source_out <= reg05;
   when "000110" => reg_source_out <= reg06;
   when "000111" => reg_source_out <= reg07;
   when "001000" => reg_source_out <= reg08;
   when "001001" => reg_source_out <= reg09;
   when "001010" => reg_source_out <= reg10;
   when "001011" => reg_source_out <= reg11;
   when "001100" => reg_source_out <= reg12;
   when "001101" => reg_source_out <= reg13;
   when "001110" => reg_source_out <= reg14;
   when "001111" => reg_source_out <= reg15;
   when "010000" => reg_source_out <= reg16;
   when "010001" => reg_source_out <= reg17;
   when "010010" => reg_source_out <= reg18;
   when "010011" => reg_source_out <= reg19;
   when "010100" => reg_source_out <= reg20;
   when "010101" => reg_source_out <= reg21;
   when "010110" => reg_source_out <= reg22;
   when "010111" => reg_source_out <= reg23;
   when "011000" => reg_source_out <= reg24;
   when "011001" => reg_source_out <= reg25;
   when "011010" => reg_source_out <= reg26;
   when "011011" => reg_source_out <= reg27;
   when "011100" => reg_source_out <= reg28;
   when "011101" => reg_source_out <= reg29;
   when "011110" => reg_source_out <= reg30;
   when "011111" => reg_source_out <= reg31;
   when "101100" => reg_source_out <= ZERO(31 downto 1) & reg_status;
   when "101110" => reg_source_out <= reg_epc;     --CP0 14
   when "111111" => reg_source_out <= '1' & ZERO(30 downto 0); --intr vector
   when others =>   reg_source_out <= ZERO;
   end case;

   case rt_index is
   when "000000" => reg_target_out <= ZERO;
   when "000001" => reg_target_out <= reg01;
   when "000010" => reg_target_out <= reg02;
   when "000011" => reg_target_out <= reg03;
   when "000100" => reg_target_out <= reg04;
   when "000101" => reg_target_out <= reg05;
   when "000110" => reg_target_out <= reg06;
   when "000111" => reg_target_out <= reg07;
   when "001000" => reg_target_out <= reg08;
   when "001001" => reg_target_out <= reg09;
   when "001010" => reg_target_out <= reg10;
   when "001011" => reg_target_out <= reg11;
   when "001100" => reg_target_out <= reg12;
   when "001101" => reg_target_out <= reg13;
   when "001110" => reg_target_out <= reg14;
   when "001111" => reg_target_out <= reg15;
   when "010000" => reg_target_out <= reg16;
   when "010001" => reg_target_out <= reg17;
   when "010010" => reg_target_out <= reg18;
   when "010011" => reg_target_out <= reg19;
   when "010100" => reg_target_out <= reg20;
   when "010101" => reg_target_out <= reg21;
   when "010110" => reg_target_out <= reg22;
   when "010111" => reg_target_out <= reg23;
   when "011000" => reg_target_out <= reg24;
   when "011001" => reg_target_out <= reg25;
   when "011010" => reg_target_out <= reg26;
   when "011011" => reg_target_out <= reg27;
   when "011100" => reg_target_out <= reg28;
   when "011101" => reg_target_out <= reg29;
   when "011110" => reg_target_out <= reg30;
   when "011111" => reg_target_out <= reg31;
   when others =>   reg_target_out <= ZERO;
   end case;

   if rising_edge(clk) then
--      assert reg_dest_new'last_event >= 10 ns
--         report "Reg_dest timing error";
      case rd_index is
      when "000001" => reg01 <= reg_dest_new;
      when "000010" => reg02 <= reg_dest_new;
      when "000011" => reg03 <= reg_dest_new;
      when "000100" => reg04 <= reg_dest_new;
      when "000101" => reg05 <= reg_dest_new;
      when "000110" => reg06 <= reg_dest_new;
      when "000111" => reg07 <= reg_dest_new;
      when "001000" => reg08 <= reg_dest_new;
      when "001001" => reg09 <= reg_dest_new;
      when "001010" => reg10 <= reg_dest_new;
      when "001011" => reg11 <= reg_dest_new;
      when "001100" => reg12 <= reg_dest_new;
      when "001101" => reg13 <= reg_dest_new;
      when "001110" => reg14 <= reg_dest_new;
      when "001111" => reg15 <= reg_dest_new;
      when "010000" => reg16 <= reg_dest_new;
      when "010001" => reg17 <= reg_dest_new;
      when "010010" => reg18 <= reg_dest_new;
      when "010011" => reg19 <= reg_dest_new;
      when "010100" => reg20 <= reg_dest_new;
      when "010101" => reg21 <= reg_dest_new;
      when "010110" => reg22 <= reg_dest_new;
      when "010111" => reg23 <= reg_dest_new;
      when "011000" => reg24 <= reg_dest_new;
      when "011001" => reg25 <= reg_dest_new;
      when "011010" => reg26 <= reg_dest_new;
      when "011011" => reg27 <= reg_dest_new;
      when "011100" => reg28 <= reg_dest_new;
      when "011101" => reg29 <= reg_dest_new;
      when "011110" => reg30 <= reg_dest_new;
      when "011111" => reg31 <= reg_dest_new;
      when "101100" => reg_status <= reg_dest_new(0);
      when "101110" => reg_epc <= reg_dest_new;  --CP0 14
                       reg_status <= '0';        --disable interrupts
      when others =>
      end case;
   end if;
   intr_enable <= reg_status;
end process;

end; --architecture logic

