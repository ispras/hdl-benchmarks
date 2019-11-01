//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : CPU
//------------------------------------------------------
// File        : cpu.v
// Library     : none
// Description : Top Layer of CPU.
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 11th April 2002
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

`include "timescale.v"
`include "defines.v"

//*************************************************
// Module Definition
//*************************************************
module cpu(
// system signal
    CLK, RST,
// WISHBONE external bus signal
    CYC_O, STB_O, ACK_I,
    ADR_O, DAT_I, DAT_O,
    WE_O, SEL_O,
    TAG0_I,
// Exception
    EVENT_REQ_I,
    EVENT_ACK_O, 
    EVENT_INFO_I,
// SLEPP
    SLP_O
    );

//-------------------
// Module I/O Signals
//-------------------
    // (WISHBONE)
    input  CLK;           // clock
    input  RST;           // reset
    output CYC_O;         // cycle output
    output STB_O;         // strobe
    input  ACK_I;         // external memory ready
    output [31:0] ADR_O;  // external address
    input  [31:0] DAT_I;  // external data read bus
    output [31:0] DAT_O;  // external data write bus
    output WE_O;          // external write/read
    output [3:0] SEL_O;   // external valid data position
    input  TAG0_I;        // external fetch space width (IF_WIDTH)
    // Hardware Exception Event
    input  [2:0] EVENT_REQ_I;   // Hardware Exception Event Request
    output EVENT_ACK_O;         // Hardware Exception Event Acknowledge
    input  [11:0] EVENT_INFO_I; // Hardware Exception Event Information
    // SLEEP
    output SLP_O;         // SLEEP output
    
//-----------------------
// External Signal Buffer
//-----------------------
    // CLK   ----------------------------------
    //   should be distributed by CTS or CT-GEN
    // RST   ----------------------------------
    //   should be distributed by CTS or CT-GEN
    // CYC_O ------------------------------
    wire   CYC;         //use it internally
    assign CYC_O = CYC;
    // STB_O ------------------------------
    wire   STB;         //use it internally
    assign STB_O = STB;
    // ACK_I ------------------------------
    wire   ACK;         //use it internally
    assign ACK = ACK_I;
    // ADR_O ------------------------------
    wire   [31:0] ADR;  //use it internally
    assign ADR_O = ADR;
    // DAT_I ------------------------------
    wire   [31:0] DATI; //use it internally
    assign DATI = DAT_I;
    // DAT_O ------------------------------
    wire   [31:0] DATO; //use it internally
    assign DAT_O = DATO;
    // WE_O -------------------------------
    wire   WE;          //use it internally
    assign WE_O = WE;
    // SEL_O ------------------------------
    wire   [3:0] SEL;   //use it internally
    assign SEL_O = SEL;
    // TAG0_I -----------------------------
    wire   IF_WIDTH;    //use it internally
    assign IF_WIDTH = TAG0_I;
    // EVENT_REQ_I-------------------------
    wire   [2:0] EVENT_REQ;    // use it internally
    assign EVENT_REQ = EVENT_REQ_I;        
    // EVENT_ACK_O-------------------------
    wire   EVENT_ACK;          // use it internally
    assign EVENT_ACK_O = EVENT_ACK;        
    // EVENT_INFO_I------------------------
    wire   [11:0] EVENT_INFO;  // use it internally
    assign EVENT_INFO = EVENT_INFO_I;
    // SLP_O-------------------------------
    wire   SLP; // use it internally
    assign SLP_O = SLP;
    // ------------------------------------        

//-----------------
// Internal Signals
//-----------------
    wire   SLOT;          // pipeline slot edge
    wire   IF_ISSUE;      // fetch request
    wire   IF_JP;         // fetch caused by jump
    wire   [31:0] IF_AD;  // fetch address
    wire   [15:0] IF_DR;  // fetched instruction
    wire   IF_BUS;        // fetch access done to extenal bus
    wire   IF_STALL;      // fetch and memory access contention
    wire   MA_ISSUE;      // memory access request
    wire   KEEP_CYC;      // request read-modify-write (To be issued on READ-CYC to keep CYC_O on)
    wire   MA_WR;         // memory access kind :Write(1)/ Read(0)
    wire   [1:0] MA_SZ;   // memory access size : 00 byte, 01 word, 10 long, 11 inhibitted
    wire   [31:0] MA_AD;  // memory access address
    wire   [31:0] MA_DW;  // memory write data
    wire   [31:0] MA_DR;  // memory read data

    wire MULCOM1;
    wire [7:0] MULCOM2;
    wire WRMACH, WRMACL;
    wire [31:0] MACIN1;
    wire [31:0] MACIN2;
    wire [31:0] MACH;
    wire [31:0] MACL;
    wire MAC_BUSY;

    wire RDREG_X, RDREG_Y, WRREG_Z, WRREG_W;
    wire [3:0] REGNUM_X, REGNUM_Y, REGNUM_Z, REGNUM_W;

    wire [4:0] ALUFUNC;
    
    wire WRMAAD_Z, WRMADW_X, WRMADW_Y, RDMADR_W;

    wire [1:0] MACSEL1, MACSEL2;
    wire RDMACH_X, RDMACL_X;
    wire RDMACH_Y, RDMACL_Y;

    wire RDSR_X, RDSR_Y;
    wire WRSR_Z, WRSR_W;

    wire MAC_S;
    wire MAC_S_LATCH;

    wire RDGBR_X, RDGBR_Y;
    wire WRGBR_Z, WRGBR_W;

    wire RDVBR_X, RDVBR_Y;
    wire WRVBR_Z, WRVBR_W;

    wire RDPR_X, RDPR_Y;
    wire WRPR_Z, WRPR_W, WRPR_PC;

    wire RDPC_X, RDPC_Y, WRPC_Z;
    wire INCPC, IFADSEL;

    wire [15:0] CONST_IFDR;
    wire CONST_ZERO4, CONST_ZERO42, CONST_ZERO44; 
    wire CONST_ZERO8, CONST_ZERO82, CONST_ZERO84;
    wire CONST_SIGN8, CONST_SIGN82, CONST_SIGN122;
    wire RDCONST_X, RDCONST_Y;
    wire REG_FWD_X, REG_FWD_Y;

    wire [2:0] CMPCOM;
    wire [4:0] SFTFUNC;

    wire RDSFT_Z;

    wire T_BCC;
    wire T_CMPSET;
    wire T_CRYSET;
    wire T_TSTSET;
    wire T_SFTSET;
    wire QT_DV1SET;
    wire MQT_DV0SET;
    wire T_CLR;
    wire T_SET;
    wire MQ_CLR;

    wire RDTEMP_X;
    wire WRTEMP_Z;
    wire WRMAAD_TEMP;

    wire RST_SR;
    wire [3:0] IBIT;
    wire [3:0] ILEVEL;
    wire WR_IBIT;

//*************************
// Memory Access Controller
//*************************
mem MEM (
    // system signal
    .CLK(CLK), .RST(RST),
    // WISHBONE external bus signal
    .CYC(CYC), .STB(STB), .ACK(ACK),
    .ADR(ADR), .DATI(DATI), .DATO(DATO),
    .WE(WE), .SEL(SEL),
    .IF_WIDTH(IF_WIDTH),
    // internal block control
    .SLOT(SLOT),
    // instruction fetch control
    .IF_ISSUE(IF_ISSUE), .IF_JP(IF_JP), .IF_AD(IF_AD),
    .IF_DR(IF_DR), .IF_BUS(IF_BUS), .IF_STALL(IF_STALL),
    // data access control
    .MA_ISSUE(MA_ISSUE), .KEEP_CYC(KEEP_CYC),
    .MA_WR(MA_WR), .MA_SZ(MA_SZ),
    .MA_AD(MA_AD), .MA_DW(MA_DW), .MA_DR(MA_DR)
    );

decode DECODE (
    // system signal
    .CLK(CLK), .RST(RST),
    // internal block control
    .SLOT(SLOT),
    // instruction fetch control
    .IF_ISSUE(IF_ISSUE), .IF_JP(IF_JP),
    .IF_DR(IF_DR), .IF_BUS(IF_BUS), .IF_STALL(IF_STALL),
    // data access control
    .MA_ISSUE(MA_ISSUE), .KEEP_CYC(KEEP_CYC),
    .MA_WR(MA_WR), .MA_SZ(MA_SZ),
    // mult command
    .MULCOM1(MULCOM1), .MULCOM2(MULCOM2), 
    .WRMACH(WRMACH), .WRMACL(WRMACL),
    // mult finish signal
    .MAC_BUSY(MAC_BUSY),
    // general register
    .RDREG_X(RDREG_X), .RDREG_Y(RDREG_Y),
    .WRREG_Z(WRREG_Z), .WRREG_W(WRREG_W),
    .REGNUM_X(REGNUM_X), .REGNUM_Y(REGNUM_Y), 
    .REGNUM_Z(REGNUM_Z), .REGNUM_W(REGNUM_W),
    // ALU function
    .ALUFUNC(ALUFUNC),
    // memory access
    .WRMAAD_Z(WRMAAD_Z),
    .WRMADW_X(WRMADW_X), .WRMADW_Y(WRMADW_Y), .RDMADR_W(RDMADR_W),
    // mult
    .MACSEL1(MACSEL1), .MACSEL2(MACSEL2),
    .RDMACH_X(RDMACH_X), .RDMACL_X(RDMACL_X),
    .RDMACH_Y(RDMACH_Y), .RDMACL_Y(RDMACL_Y),
    // status register
    .RDSR_X(RDSR_X), .RDSR_Y(RDSR_Y),
    .WRSR_Z(WRSR_Z), .WRSR_W(WRSR_W),
    // S bit for MAC
    .MAC_S_LATCH(MAC_S_LATCH),
    // global base register
    .RDGBR_X(RDGBR_X), .RDGBR_Y(RDGBR_Y),
    .WRGBR_Z(WRGBR_Z), .WRGBR_W(WRGBR_W),
    // vector base register
    .RDVBR_X(RDVBR_X), .RDVBR_Y(RDVBR_Y),
    .WRVBR_Z(WRVBR_Z), .WRVBR_W(WRVBR_W),
    // procedure register
    .RDPR_X(RDPR_X), .RDPR_Y(RDPR_Y),
    .WRPR_Z(WRPR_Z), .WRPR_W(WRPR_W), .WRPR_PC(WRPR_PC),
    // program counter
    .RDPC_X(RDPC_X), .RDPC_Y(RDPC_Y), .WRPC_Z(WRPC_Z),
    .INCPC(INCPC), .IFADSEL(IFADSEL),
    // make constant
    .CONST_IFDR(CONST_IFDR),
    .CONST_ZERO4(CONST_ZERO4), .CONST_ZERO42(CONST_ZERO42), .CONST_ZERO44(CONST_ZERO44),
    .CONST_ZERO8(CONST_ZERO8), .CONST_ZERO82(CONST_ZERO82), .CONST_ZERO84(CONST_ZERO84),
    .CONST_SIGN8(CONST_SIGN8), .CONST_SIGN82(CONST_SIGN82),
    .CONST_SIGN122(CONST_SIGN122),
    .RDCONST_X(RDCONST_X), .RDCONST_Y(RDCONST_Y),
    // register forward
    .REG_FWD_X(REG_FWD_X), .REG_FWD_Y(REG_FWD_Y),
    // commands for comparator and shifter
    .CMPCOM(CMPCOM), .SFTFUNC(SFTFUNC),
    // read controls to Z-BUS
    .RDSFT_Z(RDSFT_Z), 
    // T value for Bcc judgement
    .T_BCC(T_BCC),
    // SR control
    .T_CMPSET(T_CMPSET), .T_CRYSET(T_CRYSET),
    .T_TSTSET(T_TSTSET), .T_SFTSET(T_SFTSET),
    .QT_DV1SET(QT_DV1SET), .MQT_DV0SET(MQT_DV0SET),
    .T_CLR(T_CLR), .T_SET(T_SET), .MQ_CLR(MQ_CLR),
    // Temporary Register
    .RDTEMP_X(RDTEMP_X),
    .WRTEMP_Z(WRTEMP_Z), .WRMAAD_TEMP(WRMAAD_TEMP),
    // Hardware Exception Event
    .EVENT_REQ(EVENT_REQ),
    .EVENT_ACK(EVENT_ACK),
    .EVENT_INFO(EVENT_INFO),
    // I bit in Status Register
    .RST_SR(RST_SR), .IBIT(IBIT), .ILEVEL(ILEVEL), .WR_IBIT(WR_IBIT),
    // SLEEP
    .SLP(SLP)
    );

mult MULT(
    // system signal
    .CLK(CLK), .RST(RST),
    // command
    .SLOT(SLOT), .MULCOM1(MULCOM1), .MULCOM2(MULCOM2), .MAC_S(MAC_S),
    .WRMACH(WRMACH), .WRMACL(WRMACL),
    // input data
    .MACIN1(MACIN1), .MACIN2(MACIN2),
    // output data
    .MACH(MACH), .MACL(MACL),
    // finish signal
    .MAC_BUSY(MAC_BUSY)
    );

datapath DATAPATH(
    // system signal
    .CLK(CLK), .RST(RST), .SLOT(SLOT),
    // general register
    .RDREG_X(RDREG_X), .RDREG_Y(RDREG_Y),
    .WRREG_Z(WRREG_Z), .WRREG_W(WRREG_W),
    .REGNUM_X(REGNUM_X), .REGNUM_Y(REGNUM_Y), 
    .REGNUM_Z(REGNUM_Z), .REGNUM_W(REGNUM_W),
    // ALU function
    .ALUFUNC(ALUFUNC),
    // memory access
    .MA_AD(MA_AD),    .MA_DW(MA_DW),    .MA_DR(MA_DR),
    .WRMAAD_Z(WRMAAD_Z),
    .WRMADW_X(WRMADW_X), .WRMADW_Y(WRMADW_Y), .RDMADR_W(RDMADR_W),
    // multiplier
    .MACIN1(MACIN1), .MACIN2(MACIN2),
    .MACSEL1(MACSEL1), .MACSEL2(MACSEL2),
    .MACH(MACH), .MACL(MACL),
    .RDMACH_X(RDMACH_X), .RDMACL_X(RDMACL_X),
    .RDMACH_Y(RDMACH_Y), .RDMACL_Y(RDMACL_Y),
    // status register
    .RDSR_X(RDSR_X), .RDSR_Y(RDSR_Y),
    .WRSR_Z(WRSR_Z), .WRSR_W(WRSR_W),
    // S bit for MAC
    .MAC_S(MAC_S), .MAC_S_LATCH(MAC_S_LATCH),
    // global base register
    .RDGBR_X(RDGBR_X), .RDGBR_Y(RDGBR_Y),
    .WRGBR_Z(WRGBR_Z), .WRGBR_W(WRGBR_W),
    // vector base register
    .RDVBR_X(RDVBR_X), .RDVBR_Y(RDVBR_Y),
    .WRVBR_Z(WRVBR_Z), .WRVBR_W(WRVBR_W),
    // procedure register
    .RDPR_X(RDPR_X), .RDPR_Y(RDPR_Y),
    .WRPR_Z(WRPR_Z), .WRPR_W(WRPR_W), .WRPR_PC(WRPR_PC),
    // program counter
    .RDPC_X(RDPC_X), .RDPC_Y(RDPC_Y), .WRPC_Z(WRPC_Z),
    .INCPC(INCPC), .IFADSEL(IFADSEL), .IF_AD(IF_AD),
    // make constant
    .CONST_IFDR(CONST_IFDR),
    .CONST_ZERO4(CONST_ZERO4), .CONST_ZERO42(CONST_ZERO42), .CONST_ZERO44(CONST_ZERO44),
    .CONST_ZERO8(CONST_ZERO8), .CONST_ZERO82(CONST_ZERO82), .CONST_ZERO84(CONST_ZERO84),
    .CONST_SIGN8(CONST_SIGN8), .CONST_SIGN82(CONST_SIGN82),
    .CONST_SIGN122(CONST_SIGN122),
    .RDCONST_X(RDCONST_X), .RDCONST_Y(RDCONST_Y),
    // register forward
    .REG_FWD_X(REG_FWD_X), .REG_FWD_Y(REG_FWD_Y),
    // commands for comparator and shifter
    .CMPCOM(CMPCOM), .SFTFUNC(SFTFUNC),
    // read controls to Z-BUS
    .RDSFT_Z(RDSFT_Z), 
    // T value for Bcc judgement
    .T_BCC(T_BCC),
    // SR control
    .T_CMPSET(T_CMPSET), .T_CRYSET(T_CRYSET),
    .T_TSTSET(T_TSTSET), .T_SFTSET(T_SFTSET),
    .QT_DV1SET(QT_DV1SET), .MQT_DV0SET(MQT_DV0SET),
    .T_CLR(T_CLR), .T_SET(T_SET), .MQ_CLR(MQ_CLR),
    // Temporary Register
    .RDTEMP_X(RDTEMP_X),
    .WRTEMP_Z(WRTEMP_Z), .WRMAAD_TEMP(WRMAAD_TEMP),
    // I bit in Status Register
    .RST_SR(RST_SR), .IBIT(IBIT), .ILEVEL(ILEVEL), .WR_IBIT(WR_IBIT)
    );

//======================================================
  endmodule
//======================================================