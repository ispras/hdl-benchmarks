/*
//----------------------------------------------------------------------------
//
// decoding definitions
//
// This file contains decoding information for the original Alpha 
// insn encoding as well as for the processor's internal decoded format
//
// Artur Klauser
//
// $Author: klauser $
// $Date $
// $Revision: 1.3 $
// $Log:	decode.v,v $
# Revision 1.3  97/03/18  15:36:10  15:36:10  klauser (Artur Klauser)
# additional field definitions
# 
// Revision 1.2  1997/03/13 11:04:08  toavs
// fixed cvs log commenting to ust the right kind of verilog comment
// to avoid log messages from screwing up verilog compile as syntax errors
//
# Revision 1.1  97/03/11  01:47:04  01:47:04  klauser (Artur Klauser)
# decoding information for Alpha insn encoding and
# processor internal encoding
# 
//----------------------------------------------------------------------------
*/

//----------------------------------------------------------------------------
// Alpha encoding
// instruction encoding field positions
//----------------------------------------------------------------------------
`define POS_OPCODE    31:26
`define POS_FUNCTION  11: 5
`define POS_HINT      15:14
`define POS_REGA      25:21
`define POS_REGB      20:16
`define POS_REGC       4: 0
`define POS_IMMEDIATE 20: 0
`define POS_DISP      15: 0
`define POS_DISPHI    15
`define POS_LITERAL   20:13

//----------------------------------------------------------------------------
// processor internal enconding
// decoded information
//
// Always use these constants when querying information on the internal
// decoded bus. The bus has to be declared with size `DEC
//----------------------------------------------------------------------------
                               // vertical encoding (1 bit per category)
`define DEC_FCT  2             // decoder function codes (msb)
                               // horizontal encoding (shared bits)
`define DEC_ALU  `DEC_FCT+1    // is ALU operation
`define DEC_CTR  `DEC_ALU+1    // is control transfer operation
`define DEC_MEM  `DEC_CTR+1    // is memory operation

`define DEC_HOR  `DEC_MEM:`DEC_ALU // horizontal encoding part
`define DEC_VERT `DEC_FCT:0        // vertical encoding part

`define DEC      [`DEC_MEM:0]  // bus size definition

//----------------------------------------------------------------------------
// vertically encoded information is only valid when the respective
// horizontally encoded group is active;
// ie. DEC_MEM_xx is only valid when DEC_MEM is active;
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// function codes for memory operations
//----------------------------------------------------------------------------
`define DEC_MEM_ST    0        // store..1 / load..0
`define DEC_MEM_QW    1        // quadword..1 / longword..0
`define DEC_MEM_ACC   2        // memory access..1 / addr.computation..0

//----------------------------------------------------------------------------
// function codes for control transfer operations
//----------------------------------------------------------------------------
`define DEC_CTR_COND  0        // conditional..1 / unconditional..0
`define DEC_CTR_PC    1        // PCrelative..1 / Reg.Indirect..0

//----------------------------------------------------------------------------
// function codes for ALU operations
//----------------------------------------------------------------------------
`define DEC_ALU_MULT  0        // multiply..1 / other..0
