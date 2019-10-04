/*
//-----------------------------------------------------------------------
// opcode definitions
//
// DEC Alpha ISA
//
// Artur Klauser
//
// $Author: klauser $
// $Date: 97/04/04 00:44:59 $
// $Revision: 1.3 $
// $Log:	opcode.v,v $
# Revision 1.3  97/04/04  00:44:59  00:44:59  klauser (Artur Klauser)
# changed JMP_* function codes to 2 bits instead of 7 bits
# 
// Revision 1.2  1997/03/13 11:35:33  toavs
// fixed comment around cvs log so that the # comments cvs inserts
// don't screw up verilog as syntax errors
//
# Revision 1.1  97/03/10  20:46:28  20:46:28  klauser (Artur Klauser)
# include files for IDU and EXU
# 
//-----------------------------------------------------------------------
*/

//----------------------------------------------------------------------------
// Instruction Encoding
//----------------------------------------------------------------------------
//
// All instructions have a 6 bit opcode field which determines the
// further encoding of the instructions. Additional fields are available
// in each encoding format as described below.
// Instruction encoding formats:
//   Bra .. branch encoding:  Ra, 21bit signed displacement
//   Mem .. memory encoding:  Ra, Rb, 16bit signed displacement
//   Mfc .. memory encoding:  Ra, Rb, 16bit function code
//   Mbr .. memory encoding:  Ra, Rb, 2bit flavor + 14bit cache hint
//   Opr .. operate encoding: Ra, Rb, Rc, 7bit function code
//                        or  Ra, 8bit unsigned literal, Rc, 7bit FctCode
//
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
//
// opcodes
//
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// integer operation opcodes
//----------------------------------------------------------------------------
`define OP_INTA   6'h10  // (Opr) integer arithmetic operations
`define OP_INTL   6'h11  // (Opr) integer logical operations
`define OP_INTS   6'h12  // (Opr) integer shift operations
`define OP_INTM   6'h13  // (Opr) integer multiply operations

//----------------------------------------------------------------------------
// memory operation opcodes
//----------------------------------------------------------------------------
//--- LD_L / ST_C --- not implemented ---
`define OP_LDA    6'h08  // (Mem) load address
`define OP_LDAH   6'h09  // (Mem) load address high
`define OP_LDL    6'h28  // (Mem) load sign-extended longword
`define OP_LDQ    6'h29  // (Mem) load quadword
`define OP_LDL_L  6'h2a  // (Mem) load sign-extended longword locked
`define OP_LDQ_L  6'h2b  // (Mem) load quadword locked
`define OP_LDQ_U  6'h0b  // (Mem) load quadword unaligned
`define OP_STL    6'h2c  // (Mem) store longword
`define OP_STQ    6'h2d  // (Mem) store quadword
`define OP_STL_C  6'h2e  // (Mem) store longword conditional
`define OP_STQ_C  6'h2f  // (Mem) store quadword conditional
`define OP_STQ_U  6'h0f  // (Mem) store quadword unaligned

//----------------------------------------------------------------------------
// branch and jump operation opcodes
//----------------------------------------------------------------------------
`define OP_BLBC   6'h38  // (Bra) branch if reg low bit is clear
`define OP_BEQ    6'h39  // (Bra) branch if reg equal to zero
`define OP_BLT    6'h3a  // (Bra) branch if reg less than zero
`define OP_BLE    6'h3b  // (Bra) branch if reg less than or equal to zero
`define OP_BLBS   6'h3c  // (Bra) branch if reg low bit is set
`define OP_BNE    6'h3d  // (Bra) branch if reg not equal to zero
`define OP_BGE    6'h3e  // (Bra) branch if reg greater than or equal to zero
`define OP_BGT    6'h3f  // (Bra) branch if reg greater than zero
`define OP_BR     6'h30  // (Bra) uncond. branch (PC relative)
`define OP_BSR    6'h34  // (Bra) uncond. branch to subroutine (PC relative)
`define OP_JMP    6'h1a  // (Mbr) jump register indirect

//----------------------------------------------------------------------------
// misc operation opcodes
//----------------------------------------------------------------------------
`define OP_MISC   6'h18  // (Mfc) miscellaneous instruction opcodes

//----------------------------------------------------------------------------
//
// function codes
//
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// integer arithmetic function codes (OP_INTA opcode)
//----------------------------------------------------------------------------
`define INTA_ADDL     7'h00  // add longword
`define INTA_ADDLV    7'h40  // add longword (check overflow)
`define INTA_S4ADDL   7'h02  // scaled_4 add longword
`define INTA_S8ADDL   7'h12  // scaled_8 add longword
`define INTA_ADDQ     7'h20  // add quadword
`define INTA_ADDQV    7'h60  // add quadword (check overflow)
`define INTA_S4ADDQ   7'h22  // scaled_4 add quadword
`define INTA_S8ADDQ   7'h32  // scaled_8 add quadword
`define INTA_CMPBGE   7'h0f  // compare byte
`define INTA_CMPEQ    7'h2d  // compare signed quadword equal
`define INTA_CMPLT    7'h4d  // compare signed quadword less than
`define INTA_CMPLE    7'h6d  // compare signed quadword less than or equal
`define INTA_CMPULT   7'h1d  // compare unsigned quadword less than
`define INTA_CMPULE   7'h3d  // compare unsigned quadword less than or equal
`define INTA_SUBL     7'h09  // subtract longword
`define INTA_SUBLV    7'h49  // subtract longword (check overflow)
`define INTA_S4SUBL   7'h0b  // scaled_4 subtract longword
`define INTA_S8SUBL   7'h1b  // scaled_8 subtract longword
`define INTA_SUBQ     7'h29  // subtract quadword
`define INTA_SUBQV    7'h69  // subtract quadword (check overflow)
`define INTA_S4SUBQ   7'h2b  // scaled_4 subtract quadword
`define INTA_S8SUBQ   7'h3b  // scaled_8 subtract quadword

//----------------------------------------------------------------------------
// integer logical function codes (OP_INTL opcode)
//----------------------------------------------------------------------------
`define INTL_AND      7'h00  // and
`define INTL_BIC      7'h08  // and not
`define INTL_BIS      7'h20  // or
`define INTL_EQU      7'h48  // xnor
`define INTL_ORNOT    7'h28  // or not
`define INTL_XOR      7'h40  // xor
`define INTL_CMOVEQ   7'h24  // cmove if reg equal to zero
`define INTL_CMOVGE   7'h46  // cmove if reg greater than or equal to zero
`define INTL_CMOVGT   7'h66  // cmove if reg greater than zero
`define INTL_CMOVLBC  7'h16  // cmove low bit clear
`define INTL_CMOVLBS  7'h14  // cmove low bit set
`define INTL_CMOVLE   7'h64  // cmove if reg less than or equal to zero
`define INTL_CMOVLT   7'h44  // cmove if reg less than zero
`define INTL_CMOVNE   7'h26  // cmove if reg not equal to zero
`define INTL_AMASK    7'h61  // ??? found in alpha/inst.h
`define INTL_IMPLVER  7'h6c  // ??? found in alpha/inst.h

//----------------------------------------------------------------------------
// integer shift function codes (OP_INTS opcode)
//----------------------------------------------------------------------------
`define INTS_EXTBL    7'h06  // extract byte low
`define INTS_EXTWL    7'h16  // extract word low
`define INTS_EXTLL    7'h26  // extract longword low
`define INTS_EXTQL    7'h36  // extract quadword low
`define INTS_EXTWH    7'h5a  // extract word high
`define INTS_EXTLH    7'h6a  // extract longword high
`define INTS_EXTQH    7'h7a  // extract quadword high
`define INTS_INSBL    7'h0b  // insert byte low
`define INTS_INSWL    7'h1b  // insert word low
`define INTS_INSLL    7'h2b  // insert longword low
`define INTS_INSQL    7'h3b  // insert quadword low
`define INTS_INSWH    7'h57  // insert word high
`define INTS_INSLH    7'h67  // insert longword high
`define INTS_INSQH    7'h77  // insert quadword high
`define INTS_MSKBL    7'h02  // mask byte low
`define INTS_MSKWL    7'h12  // mask word low
`define INTS_MSKLL    7'h22  // mask longword low
`define INTS_MSKQL    7'h32  // mask quadword low
`define INTS_MSKWH    7'h52  // mask word high
`define INTS_MSKLH    7'h62  // mask longword high
`define INTS_MSKQH    7'h72  // mask quadword high
`define INTS_ZAP      7'h30  // zero bytes
`define INTS_ZAPNOT   7'h31  // zero bytes not
`define INTS_SLL      7'h39  // shift left logical
`define INTS_SRA      7'h3c  // shift right arithmetic
`define INTS_SRL      7'h34  // shift right logical

//----------------------------------------------------------------------------
// integer multiply function codes (OP_INTM opcode)
//----------------------------------------------------------------------------
`define INTM_MULL     7'h00  // multiply longword
`define INTM_MULLV    7'h40  // multiply longword (check overflow)
`define INTM_MULQ     7'h20  // multiply quadword
`define INTM_MULQV    7'h60  // multiply quadword (check overflow)
`define INTM_UMULH    7'h30  // unsigned quadword multiply high

//----------------------------------------------------------------------------
// jump function codes (OP_JMP opcode)
//----------------------------------------------------------------------------
`define JMP_JMP            2'h0 // jump
`define JMP_JSR            2'h1 // jump subroutine
`define JMP_JSR_COROUTINE  2'h3 // jump coroutine
`define JMP_RET            2'h2 // return

//----------------------------------------------------------------------------
// miscellaneous function codes (OP_MISC opcode)
//----------------------------------------------------------------------------
//--- not implemented ---
`define MISC_MB      16'h4000  // memory barrier
`define MISC_WMB     16'h4400  // write memory barrier
`define MISC_EXCB    16'h0400  // exception barrier
`define MISC_TRAPB   16'h0000  // trap barrier
`define MISC_RC      16'he000  // read and clear
`define MISC_RS      16'hf000  // read and set
`define MISC_SEXTB   16'h0000  // ??? found in alpha/inst.h
`define MISC_SEXTW   16'h0001  // ??? found in alpha/inst.h
//--- correct implementation optional ---
`define MISC_FETCH   16'h8000  // prefetch data
`define MISC_FETCH_M 16'ha000  // prefetch data, modify intent
`define MISC_RPCC    16'hc000  // read process cycle counter
