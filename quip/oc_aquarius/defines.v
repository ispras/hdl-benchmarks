//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : `define Definition
//------------------------------------------------------
// File        : define.v
// Library     : none
// Description : A definition of Constant Value
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 15th April 2002
// Creator         : Thorn Aitch
// Description     : Initial Design
//------------------------------------------------------
// Revision Number : 2
// Date of Change  : 30th April 2003
// Modifier        : Thorn Aitch
// Description     : Release Version 1.0
//======================================================
// Copyright (C) 2002-2003, Thorn Aitch
//
// Designs can be altered while keeping list of
// modifications "the same as in GNU" No money can
// be earned by selling the designs themselves, but
// anyone can get money by selling the implementation
// of the design, such as ICs based on some cores, 
// boards based on some schematics or Layouts, and
// even GUI interfaces to text mode drivers.
// "The same as GPL SW" Any update to the design
// should be documented and returned to the design. 
// Any derivative work based on the IP should be free
// under OpenIP License. Derivative work means any
// update, change or improvement on the design. 
// Any work based on the design can be either made
// free under OpenIP license or protected by any other
// license. Work based on the design means any work uses
// the OpenIP Licensed core as a building black without
// changing anything on it with any other blocks to
// produce larger design.  There is NO WARRANTY on the
// functionality or performance of the design on the
// real hardware implementation.
// On the other hand, the SuperH-2 ISA (Instruction Set
// Architecture) executed by Aquarius is rigidly
// the property of Renesas Corp. Then you have all 
// responsibility to judge if there are not any 
// infringements to Renesas's rights regarding your 
// Aquarius adoption into your design. 
// By adopting Aquarius, the user assumes all 
// responsibility for its use.
// This project may cause any damages around you, for 
// example, loss of properties, data, money, profits,
// life, or business etc. By adopting this source, 
// the user assumes all responsibility for its use.
//======================================================

//------------------
// Simulation Timing
//------------------
`define HALF_CYCLE 25
`define CYCLE      50
`define STROBE     49

//-------------
// ALU Function
//-------------
`define ALU_NOP      5'b00000    // Z=0
`define ALU_THRUX    5'b00001    // Z=X
`define ALU_THRUY    5'b00010    // Z=Y
`define ALU_THRUW    5'b00011    // Z=W

`define ALU_ADD      5'b00100    // Z=X+Y
`define ALU_ADDC     5'b00101    // Z=X+Y, T<-Carry
`define ALU_ADDV     5'b00110    // Z=X+Y, T<-Overflow
`define ALU_INCX     5'b00111    // Z=X+1 
`define ALU_INCX2    5'b01000    // Z=X+2 
`define ALU_INCX4    5'b01001    // Z=X+4
`define ALU_ADDCN    5'b01010    // Z=X+CONST
`define ALU_ADDR0    5'b01011    // Z=X+R0(if necessary, forwarding from WBUS)
`define ALU_ADDXFC   5'b01100    // Z=(X & FC) + Y
`define ALU_SWAPW    5'b01101    // Z=SWAPW(Y)
`define ALU_SWAPB    5'b01110    // Z=SWAPB(Y)
`define ALU_DIV      5'b01111    // DIV1 Function

`define ALU_EXTUB    5'b10000    // Z=EXTUB(Y)
`define ALU_EXTUW    5'b10001    // Z=EXTUW(Y)
`define ALU_EXTSB    5'b10010    // Z=EXTSB(Y)
`define ALU_EXTSW    5'b10011    // Z=EXTSW(Y)

`define ALU_SUB      5'b10100    // Z=X-Y
`define ALU_SUBC     5'b10101    // Z=X-Y, T<-Carry
`define ALU_SUBV     5'b10110    // Z=X-Y, T<-Overflow
`define ALU_DECX     5'b10111    // Z=X-1
`define ALU_DECX2    5'b11000    // Z=X-2
`define ALU_DECX4    5'b11001    // Z=X-4

`define ALU_XTRCT    5'b11010    // Z=XTRCT(X,Y)
`define ALU_TAS      5'b11011    // Z=X & 32'h00000080                  

`define ALU_AND      5'b11100    // Z=X&Y
`define ALU_XOR      5'b11101    // Z=X|Y
`define ALU_OR       5'b11110    // Z=Z^Y
`define ALU_NOT      5'b11111    // Z=~Y

//-----------------
// Compare Function
//-----------------
`define CMPEQ   3'b000  // equal
`define CMPHS   3'b010  // higher or same (unsigned)
`define CMPGE   3'b011  // grater or equal(signed)
`define CMPHI   3'b110  // higher than    (unsigned)
`define CMPGT   3'b111  // grater than    (signed)
`define CMPPL   3'b101  // plus (not 0)   (signed)
`define CMPPZ   3'b001  // plus or zero   (signed)
`define CMPSTR  3'b100  // equal at least 1 byte

//-----------------
// Shifter Function
//-----------------
//corresponding to instruction bit5,4,3,2,0
`define SHLL   5'b00000
`define SHAL   5'b10000
`define SHLR   5'b00001
`define SHAR   5'b10001
`define ROTL   5'b00010
`define ROTCL  5'b10010
`define ROTR   5'b00011
`define ROTCR  5'b10011
`define SHLL2  5'b00100
`define SHLL8  5'b01100
`define SHLL16 5'b10100
`define SHLR2  5'b00101
`define SHLR8  5'b01101
`define SHLR16 5'b10101

//----------------
// SR bit Position
//----------------
`define T   0       // SR[T]
`define S   1       // SR[S]
`define I0  4       // SR[I0], SR[I3:I0]
`define I1  5       // SR[I1], SR[I3:I0]
`define I2  6       // SR[I2], SR[I3:I0]
`define I3  7       // SR[I3], SR[I3:I0]
`define Q   8       // SR[Q]
`define M   9       // SR[M]

//------------------------------------------
// Decode Unit : Instruction State Parameter
//------------------------------------------
`define POWERON_RESET 16'hF700 // Instruction Sequence Code for Power on Reset
`define NO_EVT         3'b111
`define MRES           3'b110
`define DMAERR         3'b011
`define CPUERR         3'b010
`define NMI            3'b001
`define IRQ            3'b000
`define SLOT_ILGL     16'hFE06
`define GNRL_ILGL     16'hFF04

//---------------------------------------------
// Memory Access Unit : State Number Assignment
//---------------------------------------------
`define  S_IDLE       3'h0 // 000
`define  S_IFEX       3'h1 // 001 external bus   IF
`define  S_MAEX       3'h2 // 010 external bus   MA
`define  S_MAEX_IFPD  3'h3 // 011 external bus   MA
`define  S_IDLE_IFKP  3'h4 // 100 
`define  S_IFIN       3'h5 // 101 
`define  S_MAEX_IFKP  3'h6 // 110 external bus   MA
`define  S_MAEX_IFIN  3'h7 // 111 external bus   MA

//------------------------------------------
// Multiplier Unit : State Number Assignment
//------------------------------------------
`define NOP         4'b0000
`define DMULSL      4'b0001
`define DMULSL2     4'b0010
`define DMULUL      4'b0011
`define DMULUL2     4'b0100
`define MACL0       4'b0101
`define MACL2       4'b0110
`define MACLS       4'b0111
`define MACLS2      4'b1000
`define MACW        4'b1001
`define MACWS       4'b1010
`define MULL        4'b1011
`define MULL2       4'b1100
`define MULSW       4'b1101
`define MULUW       4'b1110


//======================================================
// End of Module
//======================================================