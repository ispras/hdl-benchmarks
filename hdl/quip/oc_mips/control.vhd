---------------------------------------------------------------------
-- TITLE: Controller / Opcode Decoder
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/8/01
-- FILENAME: control.vhd
-- PROJECT: MIPS CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Controls the CPU by decoding the opcode and generating control 
--    signals to the rest of the CPU.
--    This entity decodes the MIPS opcode into a Very-Long-Word-Instruction.
--    The 32-bit opcode is converted to a 
--       6+6+6+16+5+2+3+3+2+2+3+2+4 = 60 bit VLWI opcode.
--    Based on information found in:
--       "MIPS RISC Architecture" by Gerry Kane and Joe Heinrich
--       and "The Designer's Guide to VHDL" by Peter J. Ashenden
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pack.all;

entity control is
   port(opcode       : in  std_logic_vector(31 downto 0);
        intr_signal  : in  std_logic;
        rs_index     : out std_logic_vector(5 downto 0);
        rt_index     : out std_logic_vector(5 downto 0);
        rd_index     : out std_logic_vector(5 downto 0);
        imm_out      : out std_logic_vector(15 downto 0);
        alu_func     : out alu_function_type;
        shift_func   : out shift_function_type;
        mult_func    : out mult_function_type;
        branch_func  : out branch_function_type;
        a_source_out : out a_source_type;
        b_source_out : out b_source_type;
        c_source_out : out c_source_type;
        pc_source_out: out pc_source_type;
        mem_source_out:out mem_source_type);
end; --entity control

architecture logic of control is
--   type alu_function_type is (alu_nothing, alu_add, alu_subtract, 
--      alu_less_than, alu_less_than_signed, alu_equal, alu_not_equal,
--      alu_ltz, alu_lez, alu_eqz, alu_nez, alu_gez, alu_gtz,
--      alu_or, alu_and, alu_xor, alu_nor);
--   type shift_function_type is (
--      shift_nothing, shift_left_unsigned,  
--      shift_right_signed, shift_right_unsigned);
--   type mult_function_type is (
--      mult_nothing, mult_read_lo, mult_read_hi, mult_write_lo, 
--      mult_write_hi, mult_mult, mult_divide, mult_signed_divide);
--   type a_source_type is (from_reg_source, from_imm10_6);
--   type b_source_type is (from_reg_target, from_imm, from_signed_imm);
--   type c_source_type is (from_null, from_alu, from_shift, 
--      from_mult, from_memory, from_pc, from_imm_shift16,
--      from_reg_source_nez, from_reg_source_eqz);
--   type pc_source_type is (from_inc4, from_inc8, from_reg_source, 
--      from_opcode25_0, from_branch, from_lbranch);
begin

control_proc: process(opcode, intr_signal) 
   variable op, func       : std_logic_vector(5 downto 0);
   variable rs, rt, rd     : std_logic_vector(5 downto 0);
   variable re, rtx        : std_logic_vector(4 downto 0);
   variable imm            : std_logic_vector(15 downto 0);
   variable alu_function   : alu_function_type;
   variable shift_function : shift_function_type;
   variable mult_function  : mult_function_type;
   variable a_source       : a_source_type;
   variable b_source       : b_source_type;
   variable c_source       : c_source_type;
   variable pc_source      : pc_source_type;
   variable branch_function: branch_function_type;
   variable mem_source     : mem_source_type;
begin
   alu_function := alu_nothing;
   shift_function := shift_nothing;
   mult_function := mult_nothing;
   a_source := a_from_reg_source;
   b_source := b_from_reg_target;
   c_source := c_from_null;
   pc_source := from_inc4;
   branch_function := branch_eq;
   mem_source := mem_none;
   op := opcode(31 downto 26);
   rs := '0' & opcode(25 downto 21);
   rt := '0' & opcode(20 downto 16);
   rtx := opcode(20 downto 16);
   rd := '0' & opcode(15 downto 11);
   re := opcode(10 downto 6);
   func := opcode(5 downto 0);
   imm := opcode(15 downto 0);

   case op is
   when "000000" =>   --00 SPECIAL
      case func is
      when "000000" =>   --00 SLL   r[rd]=r[rt]<<re;
         a_source := a_from_imm10_6;
         c_source := c_from_shift;
         shift_function := shift_left_unsigned;
      when "000010" =>   --02 SRL   r[rd]=u[rt]>>re;
         a_source := a_from_imm10_6;
         c_source := c_from_shift;
         shift_function := shift_right_unsigned;
      when "000011" =>   --03 SRA   r[rd]=r[rt]>>re;
         a_source := a_from_imm10_6;
         c_source := c_from_shift;
         shift_function := shift_right_signed;
      when "000100" =>   --04 SLLV  r[rd]=r[rt]<<r[rs];
         c_source := c_from_shift;
         shift_function := shift_left_unsigned;
      when "000110" =>   --06 SRLV  r[rd]=u[rt]>>r[rs];
         c_source := c_from_shift;
         shift_function := shift_right_unsigned;
      when "000111" =>   --07 SRAV  r[rd]=r[rt]>>r[rs];
         c_source := c_from_shift;
         shift_function := shift_right_signed;
      when "001000" =>   --08 JR    s->pc_next=r[rs];
         pc_source := from_branch;
         alu_function := alu_add;
         branch_function := branch_yes;
      when "001001" =>   --09 JALR  r[rd]=s->pc_next; s->pc_next=r[rs];
         c_source := c_from_pc;
         pc_source := from_branch;
         alu_function := alu_add;
         branch_function := branch_yes;
      when "001010" =>   --0a MOVZ  if(!r[rt]) r[rd]=r[rs]; /*IV*/
--         c_source := c_from_reg_source_eqz;
      when "001011" =>   --0b MOVN  if(r[rt]) r[rd]=r[rs];  /*IV*/
--         c_source := from_reg_source_nez;
      when "001100" =>   --0c SYSCALL
--         if(r[4]==0) printf("0x%8.8lx ",r[5]);
      when "001101" =>   --0d BREAK s->wakeup=1;
      when "001111" =>   --0f SYNC  s->wakeup=1;
      when "010000" =>   --10 MFHI  r[rd]=s->hi;
         c_source := c_from_mult;
         mult_function := mult_read_hi;
      when "010001" =>   --11 FTHI  s->hi=r[rs];
         mult_function := mult_write_hi;
      when "010010" =>   --12 MFLO  r[rd]=s->lo;
         c_source := c_from_mult;
         mult_function := mult_read_lo;
      when "010011" =>   --13 MTLO  s->lo=r[rs];
         mult_function := mult_write_lo;
      when "011000" =>   --18 MULT  s->lo=r[rs]*r[rt]; s->hi=0;
         mult_function := mult_mult;
      when "011001" =>   --19 MULTU s->lo=r[rs]*r[rt]; s->hi=0;
         mult_function := mult_mult;
      when "011010" =>   --1a DIV   s->lo=r[rs]/r[rt]; s->hi=r[rs]%r[rt];
         mult_function := mult_signed_divide;
      when "011011" =>   --1b DIVU  s->lo=r[rs]/r[rt]; s->hi=r[rs]%r[rt];
         mult_function := mult_divide;
      when "100000" =>   --20 ADD   r[rd]=r[rs]+r[rt];
         c_source := c_from_alu;
         alu_function := alu_add;
      when "100001" =>   --21 ADDU  r[rd]=r[rs]+r[rt];
         c_source := c_from_alu;
         alu_function := alu_add;
      when "100010" =>   --22 SUB   r[rd]=r[rs]-r[rt];
         c_source := c_from_alu;
         alu_function := alu_subtract;
      when "100011" =>   --23 SUBU  r[rd]=r[rs]-r[rt];
         c_source := c_from_alu;
         alu_function := alu_subtract;
      when "100100" =>   --24 AND   r[rd]=r[rs]&r[rt];
         c_source := c_from_alu;
         alu_function := alu_and;
      when "100101" =>   --25 OR    r[rd]=r[rs]|r[rt];
         c_source := c_from_alu;
         alu_function := alu_or;
      when "100110" =>   --26 XOR   r[rd]=r[rs]^r[rt];
         c_source := c_from_alu;
         alu_function := alu_xor;
      when "100111" =>   --27 NOR   r[rd]=~(r[rs]|r[rt]);
         c_source := c_from_alu;
         alu_function := alu_nor;
      when "101010" =>   --2a SLT   r[rd]=r[rs]<r[rt];
         c_source := c_from_alu;
         alu_function := alu_less_than_signed;
      when "101011" =>   --2b SLTU  r[rd]=u[rs]<u[rt];
         c_source := c_from_alu;
         alu_function := alu_less_than;
      when "101101" =>   --2d DADDU r[rd]=r[rs]+u[rt];
         c_source := c_from_alu;
         alu_function := alu_add;
      when "110001" =>   --31 TGEU
      when "110010" =>   --32 TLT
      when "110011" =>   --33 TLTU
      when "110100" =>   --34 TEQ 
      when "110110" =>   --36 TNE 
      when others =>
      end case;
   when "000001" =>   --00 REGIMM
      rt := "000000";
      rd := "011111";
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_branch;
      branch_function := branch_gtz;
      --if(test) pc=pc+imm*4
      case rtx is
      when "10000" =>   --10 BLTZAL  r[31]=s->pc_next; branch=r[rs]<0;
         c_source := c_from_pc;
         branch_function := branch_ltz;
      when "00000" =>   --00 BLTZ    branch=r[rs]<0;
         branch_function := branch_ltz;
      when "10001" =>   --11 BGEZAL  r[31]=s->pc_next; branch=r[rs]>=0;
         c_source := c_from_pc;
         branch_function := branch_gez;
      when "00001" =>   --01 BGEZ    branch=r[rs]>=0;
         branch_function := branch_gez;
      when "10010" =>   --12 BLTZALL r[31]=s->pc_next; lbranch=r[rs]<0;
         c_source := c_from_pc;
         pc_source := from_lbranch;
         branch_function := branch_ltz;
      when "00010" =>   --02 BLTZL   lbranch=r[rs]<0;
         pc_source := from_lbranch;
         branch_function := branch_ltz;
      when "10011" =>   --13 BGEZALL r[31]=s->pc_next; lbranch=r[rs]>=0;
         c_source := c_from_pc;
         pc_source := from_lbranch;
         branch_function := branch_gez;
      when "00011" =>   --03 BGEZL   lbranch=r[rs]>=0;
         pc_source := from_lbranch;
         branch_function := branch_gez;
	  when others =>
	  end case;
   when "000011" =>   --03 JAL    r[31]=s->pc_next; s->pc_next=(s->pc&0xf0000000)|target;
      c_source := c_from_pc;
      rd := "011111";
      pc_source := from_opcode25_0;
   when "000010" =>   --02 J      s->pc_next=(s->pc&0xf0000000)|target; 
      pc_source := from_opcode25_0;
   when "000100" =>   --04 BEQ    branch=r[rs]==r[rt];
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_branch;
      branch_function := branch_eq;
   when "000101" =>   --05 BNE    branch=r[rs]!=r[rt];
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_branch;
      branch_function := branch_ne;
   when "000110" =>   --06 BLEZ   branch=r[rs]<=0;
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_branch;
      branch_function := branch_ltz;
   when "000111" =>   --07 BGTZ   branch=r[rs]>0;
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_branch;
      branch_function := branch_gtz;
   when "001000" =>   --08 ADDI   r[rt]=r[rs]+(short)imm;
      b_source := b_from_signed_imm;
      c_source := c_from_alu;
      rd := rt;
      alu_function := alu_add;
   when "001001" =>   --09 ADDIU  u[rt]=u[rs]+(short)imm;
      b_source := b_from_signed_imm;
      c_source := c_from_alu;
      rd := rt;
      alu_function := alu_add;
   when "001010" =>   --0a SLTI   r[rt]=r[rs]<(short)imm;
      b_source := b_from_signed_imm;
      c_source := c_from_alu;
      rd := rt;
      alu_function := alu_less_than;
   when "001011" =>   --0b SLTIU  u[rt]=u[rs]<(unsigned long)(short)imm;
      b_source := b_from_imm;
      c_source := c_from_alu;
      rd := rt;
      alu_function := alu_less_than;
   when "001100" =>   --0c ANDI   r[rt]=r[rs]&imm;
      b_source := b_from_imm;
      c_source := c_from_alu;
      rd := rt;
      alu_function := alu_and;
   when "001101" =>   --0d ORI    r[rt]=r[rs]|imm;
      b_source := b_from_imm;
      c_source := c_from_alu;
      rd := rt;
      alu_function := alu_or;
   when "001110" =>   --0e XORI   r[rt]=r[rs]^imm;
      b_source := b_from_imm;
      c_source := c_from_alu;
      rd := rt;
      alu_function := alu_xor;
   when "001111" =>   --0f LUI    r[rt]=(imm<<16);
      c_source := c_from_imm_shift16;
      rd := rt;
   when "010000" =>   --10 COP0
      alu_function := alu_or;
      c_source := c_from_alu;
      if opcode(23) = '0' then  --move from CP0
         rs := '1' & opcode(15 downto 11);
         rt := "000000";
         rd := '0' & opcode(20 downto 16);
      else                      --move to CP0
         rs := "000000";
         rd(5) := '1';
      end if;
   when "010001" =>   --11 COP1
   when "010010" =>   --12 COP2
   when "010011" =>   --13 COP3
   when "010100" =>   --14 BEQL   lbranch=r[rs]==r[rt];
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_lbranch;
      branch_function := branch_eq;
   when "010101" =>   --15 BNEL   lbranch=r[rs]!=r[rt];
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_lbranch;
      branch_function := branch_ne;
   when "010110" =>   --16 BLEZL  lbranch=r[rs]<=0;
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_lbranch;
      branch_function := branch_lez;
   when "010111" =>   --17 BGTZL  lbranch=r[rs]>0;
      a_source := a_from_pc;
      b_source := b_from_immX4;
      alu_function := alu_add;
      pc_source := from_lbranch;
      branch_function := branch_gtz;
   when "100000" =>   --20 LB     r[rt]=*(signed char*)ptr;
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  rd := rt;
      c_source := c_from_memory;
	  mem_source := mem_read8s;    --address=(short)imm+r[rs];
   when "100001" =>   --21 LH     r[rt]=*(signed short*)ptr;
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  rd := rt;
      c_source := c_from_memory;
	  mem_source := mem_read16s;   --address=(short)imm+r[rs];
   when "100010" =>   --22 LWL    //fixme
   when "100011" =>   --23 LW     r[rt]=*(long*)ptr;
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  rd := rt;
      c_source := c_from_memory;
	  mem_source := mem_read32;
   when "100100" =>   --24 LBU    r[rt]=*(unsigned char*)ptr;
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  rd := rt;
      c_source := c_from_memory;
	  mem_source := mem_read8;    --address=(short)imm+r[rs];
   when "100101" =>   --25 LHU    r[rt]=*(unsigned short*)ptr;
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  rd := rt;
      c_source := c_from_memory;
	  mem_source := mem_read16;    --address=(short)imm+r[rs];
   when "100110" =>   --26 LWR    //fixme
   when "101000" =>   --28 SB     *(char*)ptr=(char)r[rt];
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  mem_source := mem_write8;   --address=(short)imm+r[rs];
   when "101001" =>   --29 SH     *(short*)ptr=(short)r[rt];
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  mem_source := mem_write16;
   when "101010" =>   --2a SWL    //fixme
   when "101011" =>   --2b SW     *(long*)ptr=r[rt];
	  a_source := a_from_reg_source;
	  b_source := b_from_imm;
	  alu_function := alu_add;
	  mem_source := mem_write32;  --address=(short)imm+r[rs];
   when "101110" =>   --2e SWR    //fixme
   when "101111" =>   --2f CACHE
   when "110000" =>   --30 LL     r[rt]=*(long*)ptr;
   when "110001" =>   --31 LWC1 
   when "110010" =>   --32 LWC2 
   when "110011" =>   --33 LWC3 
   when "110101" =>   --35 LDC1 
   when "110110" =>   --36 LDC2 
   when "110111" =>   --37 LDC3 
   when "111000" =>   --38 SC     *(long*)ptr=r[rt]; r[rt]=1;
   when "111001" =>   --39 SWC1 
   when "111010" =>   --3a SWC2 
   when "111011" =>   --3b SWC3 
   when "111101" =>   --3d SDC1 
   when "111110" =>   --3e SDC2 
   when "111111" =>   --3f SDC3 
   when others =>
   end case;

   if c_source = c_from_null then
      rd := "000000";
   end if;

   if intr_signal = '1' then
      rd := "101110";  --EPC
      c_source := c_from_pc;
      rs := "111111";  --interrupt vector
      rt := "000000";
      a_source := a_from_reg_source;
      b_source := b_from_reg_target;
      alu_function := alu_or;
      pc_source := from_branch;
      branch_function := branch_yes;
   end if;

   rs_index <= rs;
   rt_index <= rt;
   rd_index <= rd;
   imm_out <= imm;
   alu_func <= alu_function;
   shift_func <= shift_function;
   mult_func <= mult_function;
   branch_func <= branch_function;
   a_source_out <= a_source;
   b_source_out <= b_source;
   c_source_out <= c_source;
   pc_source_out <= pc_source;
   mem_source_out <= mem_source;

end process;

end; --logic

