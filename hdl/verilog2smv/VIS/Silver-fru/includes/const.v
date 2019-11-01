/*
//-----------------------------------------------------------------------
// constants definitions
//
// Artur Klauser
//
// $Author: klauser $
// $Date: 97/03/15 01:14:37 $
// $Revision: 1.4 $
// $Log:	const.v,v $
# Revision 1.4  97/03/15  01:14:37  01:14:37  klauser (Artur Klauser)
# bugfix: can't use computation in constant if used as `cons'b0
# 
// Revision 1.3  1997/03/13 11:04:06  toavs
// fixed cvs log commenting to ust the right kind of verilog comment
// to avoid log messages from screwing up verilog compile as syntax errors
//
// Revision 1.2  97/03/13  11:00:37  11:00:37  toavs (Coy Toavs)
// fixed commenting to keep cvs logs from screwing things up....
// NEED To Use comment around the section so that new lines that cvs
// adds are commented out automatically
// 
// Revision 1.1  97/03/10  20:46:28  20:46:28  klauser (Artur Klauser)
// include files for IDU and EXU
// 
//-----------------------------------------------------------------------
*/

//-----------------------------------------------------------------------
// data sizes
//-----------------------------------------------------------------------
`define B       8     // byte
`define W      16     // word
`define L      32     // longword
`define Q      32//64     // quadword
`define C      21     // constant

//-----------------------------------------------------------------------
// MSBs
//-----------------------------------------------------------------------
`define BM     7      // byte msb
`define WM     15     // word msb
`define LM     31     // longword msb
`define QM     31//63     // quadword msb try with 31
`define CM     20     // constant msb

//-----------------------------------------------------------------------
// busses
//-----------------------------------------------------------------------
`define DATAX  [`Q:0]     // extended data busses (include a carry bit)
`define DATAQ  [`QM:0]    // quadword data busses
`define DATAL  [`LM:0]    // longword data busses
`define DATAW  [`WM:0]    // word data busses
`define DATAB  [`BM:0]    // byte data busses
`define INSN   [`LM:0]    // instruction
`define CONST  [`C:0]     // valid bit + constants and displacements
`define CONSTN [`CM:0]    // immediate constants and displacements
`define CONSTM [`CM]      // constant msb
`define CONSTV [`C]       // constant valid bit
`define EXC    [ 3:0]     // exceptions
`define EXCV   [ 3]       // exception valid bit
`define OPC    [ 5:0]     // opcode
`define FCT    [ 6:0]     // function code
`define REG    [ 5:0]     // valid bit + register numbers
`define REGN   [ 4:0]     // register numbers
`define REGV   [ 5]       // register valid bit
`define PCADR  [`QM:0]    // program counter

//-----------------------------------------------------------------------
// misc
//-----------------------------------------------------------------------
`define FALSE  1'b0  // boolean true
`define TRUE   1'b1  // boolean false

`define DELTA  1     // delay for behavioral sequential modelling

//-----------------------------------------------------------------------
// Exception Codes
// msb clear ... no exception
// msb set ..... exception type indicated by lower significant bits
//-----------------------------------------------------------------------
`define EXC_NONE    4'b0_000 // no exception
`define EXC_OVFL    4'b1_000 // overflow (from ALU)
`define EXC_PAL     4'b1_001 // pal call (from IDU)
`define EXC_RESV    4'b1_010 // reserved opcode (from IDU)
`define EXC_FP      4'b1_011 // floating point opcode (from IDU)
`define EXC_UDEF    4'b1_100 // undefined function code (from ALU)
`define EXC_LDLSTC  4'b1_101 // LDxL / STxC opcode (from IDU)
