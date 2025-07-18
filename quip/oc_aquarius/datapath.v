//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : Data Path Unit
//------------------------------------------------------
// File        : datapath.v
// Library     : none
// Description : Data Path in CPU.
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 23rd April 2002
// Creator         : Thorn Aitch
// Description     : Initial Design				  
//------------------------------------------------------
// Revision Number : 2
// Date of Change  : 30th April 2003
// Modifier        : Thorn Aitch
// Description     : Release Version 1.0
//------------------------------------------------------
// Revision Number : 3
// Date of Change  : 10th December 2003
// Modifier        : Thorn Aitch
// Description     : Release Version 1.1
//                   Inhibit substitution of "x"
//                   except for defalut statement whose
//                   case describes all logic spaces. 
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
module datapath(
    // system signal
    CLK, RST, SLOT,
    // general register strobe and the number
    RDREG_X,  RDREG_Y,  WRREG_Z,  WRREG_W,
    REGNUM_X, REGNUM_Y, REGNUM_Z, REGNUM_W,
    // ALU function
    ALUFUNC,
    // memory access
    MA_AD,    MA_DW,    MA_DR,
    WRMAAD_Z, WRMADW_X, WRMADW_Y, RDMADR_W,
    // multiplier
    MACIN1, MACIN2,
    MACSEL1, MACSEL2,
    MACH, MACL,
    RDMACH_X, RDMACL_X,
    RDMACH_Y, RDMACL_Y,
    // status register
    RDSR_X, RDSR_Y,
    WRSR_Z, WRSR_W,
    // S bit for MAC
    MAC_S, MAC_S_LATCH,
    // global base register
    RDGBR_X, RDGBR_Y,
    WRGBR_Z, WRGBR_W,
    // vector base register
    RDVBR_X, RDVBR_Y,
    WRVBR_Z, WRVBR_W,
    // procedure register
    RDPR_X, RDPR_Y,
    WRPR_Z, WRPR_W, WRPR_PC,
    // program counter
    RDPC_X, RDPC_Y, WRPC_Z,
    INCPC, IFADSEL, IF_AD,
    // make constant
    CONST_IFDR, 
    CONST_ZERO4, CONST_ZERO42, CONST_ZERO44,                         
    CONST_ZERO8, CONST_ZERO82, CONST_ZERO84,
    CONST_SIGN8, CONST_SIGN82, CONST_SIGN122,
    RDCONST_X, RDCONST_Y,
    // register forward
    REG_FWD_X, REG_FWD_Y,
    // commands for comparator and shifter
    CMPCOM, SFTFUNC,
    // read controls to Z-BUS
    RDSFT_Z, 
    // T value for Bcc judgement
    T_BCC,
    // SR control
    T_CMPSET, T_CRYSET, T_TSTSET, T_SFTSET,
    QT_DV1SET, MQT_DV0SET, T_CLR, T_SET, MQ_CLR,
    // Temporary Register
    RDTEMP_X,
    WRTEMP_Z, WRMAAD_TEMP,
    // I bit in Status Register
    RST_SR, IBIT, ILEVEL, WR_IBIT
    );

//-------------------
// Module I/O Signals
//-------------------
    input  CLK;            // clock
    input  RST;            // reset
    input  SLOT;           // cpu pipe slot

    input  RDREG_X;        // read Rn to X-bus
    input  RDREG_Y;        // read Rn to Y-bus
    input  WRREG_Z;        // write Rn from Z-bus
    input  WRREG_W;        // write Rn from W-bus

    input [3:0] REGNUM_X;  // register number to read to X-bus
    input [3:0] REGNUM_Y;  // register number to read to Y-bus
    input [3:0] REGNUM_Z;  // register number to write from Z-bus
    input [3:0] REGNUM_W;  // register number to write from W-bus

    input  [4:0]  ALUFUNC; // ALU function

    output [31:0] MA_AD;   // memory access address
    output [31:0] MA_DW;   // memory write data
    input  [31:0] MA_DR;   // memory read data
    input  WRMAAD_Z;       // output MA_AD from Z-bus
    input  WRMADW_X;       // output MA_DW from X-bus  
    input  WRMADW_Y;       // output MA_DW from Y-bus
    input  RDMADR_W;       // input MA_DR to W-bus

    output [31:0] MACIN1;  // data1 to mult.v
    output [31:0] MACIN2;  // data2 to mult.v
    input  [1:0] MACSEL1;  // select data of MACIN1 (00:from X, 01:from Z, 1?:from W) 
    input  [1:0] MACSEL2;  // select data of MACIN2 (00:from Y, 01:from Z, 1?:from W) 
    input  [31:0] MACH;    // physical data of MACH
    input  [31:0] MACL;    // physical data of MACL
    input  RDMACH_X;       // read MACH to X-bus
    input  RDMACL_X;       // read MACL to X-bus
    input  RDMACH_Y;       // read MACH to Y-bus
    input  RDMACL_Y;       // read MACL to Y-bus

    input  RDSR_X;         // read SR to X-bus
    input  RDSR_Y;         // read SR to Y-bus
    input  WRSR_Z;         // write SR from Z-bus
    input  WRSR_W;         // write SR from W-bus
    output MAC_S;          // latched S bit in SR (= SR[S])
    input  MAC_S_LATCH;    // latch command of S bit in SR

    input  RDGBR_X;        // read GBR to X-bus
    input  RDGBR_Y;        // read GBR to Y-bus
    input  WRGBR_Z;        // write GBR from Z-bus
    input  WRGBR_W;        // write GBR from W-bus

    input  RDVBR_X;        // read VBR to X-bus
    input  RDVBR_Y;        // read VBR to Y-bus
    input  WRVBR_Z;        // write VBR from Z-bus
    input  WRVBR_W;        // write VBR from W-bus

    input  RDPR_X;         // read PR to X-bus
    input  RDPR_Y;         // read PR to Y-bus
    input  WRPR_Z;         // write PR from Z-bus
    input  WRPR_W;         // write PR from W-bus
    input  WRPR_PC;        // write PR from PC

    input  RDPC_X;         // read PC to X-bus
    input  RDPC_Y;         // read PC to Y-bus
    inout  WRPC_Z;         // write PC from Z-bus
    input  INCPC;          // increment PC (PC+2->PC)
    input  IFADSEL;        // select IF_AD output from INC(0) or Z-bus(1)
    output [31:0] IF_AD;   // instruction fetch address

    input  [15:0] CONST_IFDR;   // instruction fetch data to make constant
    input  CONST_ZERO4;    // take constant from lower 4 bit as unsigned value 
    input  CONST_ZERO42;   // take constant from lower 4 bit as unsigned value * 2
    input  CONST_ZERO44;   // take constant from lower 4 bit as unsigned value * 4
    input  CONST_ZERO8;    // take constant from lower 8 bit as unsigned value
    input  CONST_ZERO82;   // take constant from lower 8 bit as unsigned value * 2
    input  CONST_ZERO84;   // take constant from lower 8 bit as unsigned value * 4
    input  CONST_SIGN8;    // take constant from lower 8 bit as signed value      
    input  CONST_SIGN82;   // take constant from lower 8 bit as signed value * 2
    input  CONST_SIGN122;  // take constant from lower 12 bit as signed value * 2
    input  RDCONST_X;      // read constant to X-bus
    input  RDCONST_Y;      // read constant to Y-bus
    input  REG_FWD_X;      // register forward from W-bus to X-bus
    input  REG_FWD_Y;      // register forward from W-bus to Y-bus

    input  [2:0] CMPCOM;   // define comparator operation (command)
    input  [4:0] SFTFUNC;  // Shifter Function

    input  RDSFT_Z;        // read SFTOUT to Z-BUS

    output T_BCC;          // T value for Bcc judgement
    input  T_CMPSET;       // reflect comparator result to T
    input  T_CRYSET;       // reflect carry/borrow out to T
    input  T_TSTSET;       // reflect tst result to T
    input  T_SFTSET;       // reflect shifted output to T
    input  QT_DV1SET;      // reflect DIV1 result to Q and T
    input  MQT_DV0SET;     // reflect DIV0S result to M, Q and T
    input  T_CLR;          // clear T
    input  T_SET;          // set T
    input  MQ_CLR;         // clear M and Q

    input  RDTEMP_X;       // read TEMP to X-bus
    input  WRTEMP_Z;       // write to TEMP from Z-bus
    input  WRMAAD_TEMP;    // output MAAD from TEMP

    input  RST_SR;         // reset SR
    output [3:0] IBIT;     // I bit in SR
    input  [3:0] ILEVEL;   // IRQ Level
    input  WR_IBIT;        // Write ILEVEL to I bit in SR 

//-----------------
// Internal Signals
//-----------------
    integer i, j, k, l, m, n;

    reg  [31:0] XBUS;     // internal X-bus
    reg  [31:0] YBUS;     // internal Y-bus
    reg  [31:0] ZBUS;     // internal Z-bus
    reg  [31:0] WBUS;     // internal W-bus
    reg  [31:0] VBUS;     // internal V-bus

    wire [31:0] REG_X;     // register out toward X
    wire [31:0] REG_Y;     // register out toward Y
    wire [31:0] REG_0;     // R0 value

    reg  [9:0]  SR;        // Status Register
    reg  MAC_S;            // latched S bit in SR

    reg  [31:0] GBR;       // Global Base Register
    reg  [31:0] VBR;       // Vector Base Register
    reg  [31:0] PR;        // Procedure Register

    reg  [31:0] ALUINX;    // ALU internal signal on X-side
    reg  [31:0] ALUINY;    // ALU internal signal on Y-side
    reg  ADDSUB;           // Specify ADD or SUB (ADD=0, SUB=1)
    reg  [32:0] ADDSUBXY;  // Carry :ADDSUBXY = ALUINX + ALUINY + Carry
                           // Borrow:ADDSUBXY = ALUINX - ALUINY - Borrow
    reg  [32:0] ALUINY_EOR;// = ADDSUB ^ ALUINY[]
    reg  [31:0] ALUOUT;    // ALU output
    reg  [31:0] MACIN1;    // data1 to mult.v
    reg  [31:0] MACIN2;    // data2 to mult.v

    reg  [31:0] MA_AD;     // Memory Access Address
    reg  [31:0] MA_DW;     // Memory Write Data
    reg  [31:0] IF_AD;     // Instruction Fetch Address

    reg  [31:0] PC;        // program counter
    reg  [31:0] PCADD2;    // =PC+2

    reg  [31:0] CONST;     // Constant Value generated from Instruction Field

    reg  EQMSB;                  // XBUS[31] == YBUS[31]
    reg  EQHH, EQHL, EQLH, EQLL; // XBUS[n+7:n] == YBUS[n+7:n], n=28,16,8,0
    reg  EQ;                     // XBUS[30:0] == YBUS[30:0]
    reg  HI;                     // XBUS[30:0] > YBUS[30:0]
    reg  CMPRESULT;              // result from comparator according to CMPCOM  
    reg  T_BCC;                  // T value for Bcc judgement

    reg  [31:0] SFTOUT;   // Shifter Output
    reg  SFTO;            // Shifted Output to be sent to T bit
    
    reg  SUBGT, ADDLT;    // Divider internal signal
    reg  Q_DIV1;          // Divider Result of Q by DIV1
    reg  T_DIV1;          // Divider Result of T by DIV1
    reg  T_DIV0S;         // Divider Result of T by DIV0S

    reg  CRYI;   // carry/borrow input to ALU operation
    reg  CRYO;   // carry/borrow output to T
    reg  TSTO;   // test resut to T

    reg  [31:0] R0;    // index register R0 to make MA address; @(R0,Rn)
    reg  [31:0] TEMP ; // Temorary Register

    wire [3:0] IBIT;   // I bit in SR

//----------
// X-BUS
//----------
    always @(WBUS  or REG_FWD_X
          or REG_X or RDREG_X 
          or MACH  or RDMACH_X
          or MACL  or RDMACL_X
          or PC    or RDPC_X
          or CONST or RDCONST_X
          or SR    or RDSR_X
          or GBR   or RDGBR_X
          or VBR   or RDVBR_X
          or PR    or RDPR_X
          or TEMP  or RDTEMP_X)
    begin
        casex ({REG_FWD_X,
                RDREG_X, RDMACH_X, RDMACL_X, RDPC_X, RDCONST_X, 
                RDSR_X, RDGBR_X, RDVBR_X, RDPR_X, RDTEMP_X})
            11'b1?????????? : XBUS <= WBUS;
            11'b01000000000 : XBUS <= REG_X;
            11'b00100000000 : XBUS <= MACH;
            11'b00010000000 : XBUS <= MACL;
            11'b00001000000 : XBUS <= PC;
            11'b00000100000 : XBUS <= CONST;
            11'b00000010000 : XBUS <= {22'h000000, SR};
            11'b00000001000 : XBUS <= GBR;
            11'b00000000100 : XBUS <= VBR;
            11'b00000000010 : XBUS <= PR; 
            11'b00000000001 : XBUS <= TEMP;
            default         : XBUS <= 32'h00000000;
        endcase
    end

//----------
// Y-BUS
//----------
    always @(WBUS  or REG_FWD_Y
          or REG_Y or RDREG_Y
          or MACH  or RDMACH_Y
          or MACL  or RDMACL_Y
          or PC    or RDPC_Y
          or CONST or RDCONST_Y
          or SR    or RDSR_Y 
          or GBR   or RDGBR_Y
          or VBR   or RDVBR_Y
          or PR    or RDPR_Y)
    begin
        casex ({REG_FWD_Y,
                RDREG_Y, RDMACH_Y, RDMACL_Y, RDPC_Y, RDCONST_Y, 
                RDSR_Y, RDGBR_Y, RDVBR_Y, RDPR_Y})
            10'b1????????? : YBUS <= WBUS;
            10'b0100000000 : YBUS <= REG_Y;
            10'b0010000000 : YBUS <= MACH;
            10'b0001000000 : YBUS <= MACL;
            10'b0000100000 : YBUS <= PC;
            10'b0000010000 : YBUS <= CONST;
            10'b0000001000 : YBUS <= {22'h000000, SR}; 
            10'b0000000100 : YBUS <= GBR;
            10'b0000000010 : YBUS <= VBR;
            10'b0000000001 : YBUS <= PR;
            default        : YBUS <= 32'h00000000;
        endcase
    end

//------
// Z-BUS
//------
    always @(ALUOUT
          or SFTOUT or RDSFT_Z)
    begin
        case (RDSFT_Z)
            1'b0    : ZBUS <= ALUOUT;
            1'b1    : ZBUS <= SFTOUT;
            default : ZBUS <= 32'hxxxxxxxx;
        endcase
    end

//------
// W-BUS
//------
    always @(MA_DR or RDMADR_W)
    begin
        if (RDMADR_W == 1'b1)
            WBUS <= MA_DR;
        else
            WBUS <= 32'h00000000;
    end

//-----------------
// General Register
//-----------------
   register REGISTER(
    // system signal
    .CLK(CLK), .SLOT(SLOT),
    // general register strobe and the number
    .WRREG_Z(WRREG_Z),  .WRREG_W(WRREG_W),
    .REGNUM_X(REGNUM_X), .REGNUM_Y(REGNUM_Y),
    .REGNUM_Z(REGNUM_Z), .REGNUM_W(REGNUM_W),
    // input & outout
    .REG_X(REG_X), .REG_Y(REG_Y), .REG_0(REG_0), 
    .ZBUS(ZBUS), .WBUS(WBUS)
    ); 

//-------------
// ALU Function
//-------------
    always @(WRREG_W or REGNUM_W or WBUS or REG_0)
    begin
        if ((WRREG_W) & (REGNUM_W == 4'h0))
            R0 <= WBUS;
        else
            R0 <= REG_0;
    end

    always @(ALUFUNC or XBUS or YBUS or R0 or CONST or SFTOUT)
    begin
        case(ALUFUNC)
            `ALU_ADDXFC  : begin
                               ALUINX <= {XBUS[31:2], 2'b0};
                               ALUINY <= YBUS;
                           end
            `ALU_INCX    : begin
                               ALUINX <= XBUS;
                               ALUINY <= 32'h00000001;
                           end
            `ALU_DECX    : begin
                               ALUINX <= XBUS;
                               ALUINY <= 32'h00000001;
                           end
            `ALU_INCX2   : begin
                               ALUINX <= XBUS;
                               ALUINY <= 32'h00000002;
                           end
            `ALU_DECX2   : begin
                               ALUINX <= XBUS;
                               ALUINY <= 32'h00000002;
                           end
            `ALU_INCX4   : begin
                               ALUINX <= XBUS;
                               ALUINY <= 32'h00000004;
                           end
            `ALU_DECX4   : begin
                               ALUINX <= XBUS;
                               ALUINY <= 32'h00000004;
                           end
            `ALU_ADDR0   : begin
                               ALUINX <= XBUS;
                               ALUINY <= R0;
                           end
            `ALU_ADDCN   : begin
                               ALUINX <= XBUS;
                               ALUINY <= CONST;
                           end
            `ALU_TAS     : begin
                               ALUINX <= XBUS;
                               ALUINY <= 32'h00000080;
                           end
            `ALU_DIV     : begin
                               ALUINX <= SFTOUT;
                               ALUINY <= YBUS;
                           end
            default      : begin
                               ALUINX <= XBUS;
                               ALUINY <= YBUS;
                           end
        endcase
    end

    always @(ALUFUNC or SR)
    begin
        case (ALUFUNC)
            `ALU_ADDC : CRYI <= SR[`T];
            `ALU_SUBC : CRYI <= SR[`T];
            default   : CRYI <= 1'b0;
        endcase
    end

    // Overflow and Underflow
    // [Addition] ADDV             [Subtruction] SUBV
    // X[31] Y[31] Z[31] OVF       X[31] Y[31] Z[31] UDF
    // 0     0     0     0         0     0     0     0
    // 0     0     1     1 <--     0     0     1     0
    // 0     1     0     0         0     1     0     0
    // 0     1     1     0         0     1     1     1 <--
    // 1     0     0     0         1     0     0     1 <--
    // 1     0     1     0         1     0     1     0
    // 1     1     0     1 <--     1     1     0     0
    // 1     1     1     0         1     1     1     0
    always @(ALUFUNC or ADDSUBXY or ALUINX or ALUINY)
    begin
        case (ALUFUNC)
            `ALU_ADDC : CRYO <= ADDSUBXY[32];
            `ALU_SUBC : CRYO <= ADDSUBXY[32];
            `ALU_ADDV : CRYO <= (~ALUINX[31]&~ALUINY[31]& ADDSUBXY[31])
                               |( ALUINX[31]& ALUINY[31]&~ADDSUBXY[31]);
            `ALU_SUBV : CRYO <= (~ALUINX[31]& ALUINY[31]& ADDSUBXY[31])
                               |( ALUINX[31]&~ALUINY[31]&~ADDSUBXY[31]);
            // default   : CRYO <= 1'bx; // Thorn Aitch 2003/12/10
		  default   : CRYO <= 1'b0;    // Thorn Aitch 2003/12/10
        endcase
    end

    // Adder / Subtractor
    //     add : ADDSUBXY = ALUINX + ALUINY + CRYI
    //     sub : ADDSUBXY = ALUINX - ALUINY - CRYI  
    // (Note)
    // A[] - B[]     =    A[] + /B[] + 1
    // A[] - B[]     = /(/A[] +  B[])
    // A[] - B[] - C =    A[] + /B[] + /C
    always  @(ALUFUNC or SR)
    begin
        casex ({ALUFUNC, SR[`Q], SR[`M]})   // (ALUFUNC, old_Q, M)
	       7'b00???_?? : ADDSUB <= 1'b0; //ADD
	       7'b010??_?? : ADDSUB <= 1'b0; //ADD			
	       7'b0110?_?? : ADDSUB <= 1'b0; //ADD
	       7'b01110_?? : ADDSUB <= 1'b0; //ADD
	       7'b01111_00 : ADDSUB <= 1'b1; //SUB(DIV)
	       7'b01111_01 : ADDSUB <= 1'b0; //ADD(DIV)
	       7'b01111_10 : ADDSUB <= 1'b0; //ADD(DIV)
	       7'b01111_11 : ADDSUB <= 1'b1; //SUB(DIV)
		  7'b1????_?? : ADDSUB <= 1'b1; //SUB
            default : ADDSUB <= 1'bx;
	   endcase
    end
    always @(ADDSUB or ALUINY)
    begin
        for (i=0;i<=31;i=i+1) ALUINY_EOR[i] <= ADDSUB ^ ALUINY[i];

        ALUINY_EOR[32] <= ADDSUB;
    end
    always @(ALUINX or ALUINY_EOR or ADDSUB or CRYI)
    begin //33bit operation
        ADDSUBXY <= {1'b0,ALUINX} + ALUINY_EOR + (ADDSUB ^ CRYI);
    end

    //Make ALU Output
    always @(ALUFUNC or ALUINX or ALUINY or WBUS or ADDSUBXY)
    begin
        case(ALUFUNC)
            `ALU_THRUX    : ALUOUT <= ALUINX;
            `ALU_THRUY    : ALUOUT <= ALUINY;
            `ALU_THRUW    : ALUOUT <= WBUS; 
            `ALU_ADDXFC   : ALUOUT <= ADDSUBXY[31:0];
            `ALU_ADD      : ALUOUT <= ADDSUBXY[31:0];
            `ALU_ADDC     : ALUOUT <= ADDSUBXY[31:0];
            `ALU_ADDV     : ALUOUT <= ADDSUBXY[31:0];
            `ALU_INCX     : ALUOUT <= ADDSUBXY[31:0];
            `ALU_INCX2    : ALUOUT <= ADDSUBXY[31:0];
            `ALU_INCX4    : ALUOUT <= ADDSUBXY[31:0];
            `ALU_SUB      : ALUOUT <= ADDSUBXY[31:0];
            `ALU_SUBC     : ALUOUT <= ADDSUBXY[31:0];
            `ALU_SUBV     : ALUOUT <= ADDSUBXY[31:0];
            `ALU_DECX     : ALUOUT <= ADDSUBXY[31:0];
            `ALU_DECX2    : ALUOUT <= ADDSUBXY[31:0];
            `ALU_DECX4    : ALUOUT <= ADDSUBXY[31:0];
            `ALU_NOT      : ALUOUT <= ~ALUINY;
            `ALU_AND      : ALUOUT <= ALUINX & ALUINY;
            `ALU_OR       : ALUOUT <= ALUINX | ALUINY;
            `ALU_XOR      : ALUOUT <= ALUINX ^ ALUINY;
            `ALU_SWAPB    : ALUOUT <= {ALUINY[31:16], ALUINY[ 7: 0], ALUINY[15:8]};
            `ALU_SWAPW    : ALUOUT <= {ALUINY[15: 0], ALUINY[31:16]};
            `ALU_EXTUB    : ALUOUT <= {24'h000000, ALUINY[ 7:0]};
            `ALU_EXTUW    : ALUOUT <= {16'h0000,   ALUINY[15:0]};
            `ALU_EXTSB    : begin
                                for (j= 8;j<=31;j=j+1) ALUOUT[j] <= ALUINY[ 7];
                                ALUOUT[ 7:0] <= ALUINY[ 7:0];
                            end
            `ALU_EXTSW    : begin
                                for (k=16;k<=31;k=k+1) ALUOUT[k] <= ALUINY[15];
                                ALUOUT[15:0] <= ALUINY[15:0];
                            end
            `ALU_XTRCT    : ALUOUT <= {ALUINY[15:0], ALUINX[31:16]};
            `ALU_ADDR0    : ALUOUT <= ADDSUBXY[31:0];                  
            `ALU_ADDCN    : ALUOUT <= ADDSUBXY[31:0];
            `ALU_TAS      : ALUOUT <= ALUINX | ALUINY;
            `ALU_DIV      : ALUOUT <= ADDSUBXY[31:0];
            default       : ALUOUT <= 32'h00000000; // ALU_NOP
        endcase
    end

    always @(ALUFUNC or ALUOUT or XBUS) 
    begin
        if (ALUFUNC == `ALU_TAS)
            TSTO <= (XBUS == 32'h00000000);
        else
            TSTO <= (ALUOUT == 32'h00000000);
    end

//-----------------
// Divider Function
//-----------------
    // old_Q : SR[`Q]
    // Q     : MSB of Rn (XBUS[31])
    // Rn = (Q <--[   Rn   ]<--T) (SFTOUT by ROTCL)
    // tmp0 = Rn (SFTOUT)
    // In ALU....
    // SR[`Q] SR[`M] ADDSUBXY(ALUOUT)
    // 0      0      SFTOUT - YBUS by ALU_DIV : Rn-=Rm
    // 0      1      SFTOUT + YBUS by ALU_DIV : Rn+=Rm
    // 1      0      SFTOUT + YBUS by ALU_DIV : Rn+=Rm
    // 1      1      SFTOUT - YBUS by ALU_DIV : Rn-=Rm
    always @(ADDSUBXY or SFTOUT)
    begin
        SUBGT <= (ADDSUBXY[31:0] > SFTOUT); // make SUBGT = (ADDSUBXY>tmp0)
        ADDLT <= (ADDSUBXY[31:0] < SFTOUT); // make ADDLT = (ADDSUBXY<tmp0)
    end
    always @(SR[`Q] or SR[`M] or XBUS or SUBGT or ADDLT)
    begin
        case ({SR[`Q], SR[`M], XBUS[31]}) // case (old_Q, M, Q)
            3'b000  : Q_DIV1 <=  SUBGT;
            3'b001  : Q_DIV1 <= ~SUBGT;
            3'b010  : Q_DIV1 <= ~ADDLT;
            3'b011  : Q_DIV1 <=  ADDLT;
            3'b100  : Q_DIV1 <=  ADDLT;
            3'b101  : Q_DIV1 <= ~ADDLT;
            3'b110  : Q_DIV1 <= ~SUBGT;
            3'b111  : Q_DIV1 <=  SUBGT;
            default : Q_DIV1 <=  1'bx;
        endcase
    end
    always @(Q_DIV1 or SR[`M]) T_DIV1  <= ~(Q_DIV1 ^ SR[`M]);
    always @(XBUS or YBUS)     T_DIV0S <=  (XBUS[31] ^ YBUS[31]);

//-----------
// Comparator
//-----------
//  CMPSIGN XBUS[31] YBUS[31] XBUS[30:0]-YBUS[30:0] : X=Y X>Y X<Y
//  0       0        0        ==                    :  1   0   0
//  0       0        0        >                     :  0   1   0
//  0       0        0        <                     :  0   0   1
//  0       0        1        don't care            :  0   0   1
//  0       1        0        don't care            :  0   1   0
//  0       1        1        ==                    :  1   0   0
//  0       1        1        >                     :  0   1   0
//  0       1        1        <                     :  0   0   1
//  1       0        0        ==                    :  1   0   0
//  1       0        0        >                     :  0   1   0
//  1       0        0        <                     :  0   0   1
//  1       0        1        don't care            :  0   1   0
//  1       1        0        don't care            :  0   0   1
//  1       1        1        ==                    :  1   0   0
//  1       1        1        >                     :  0   1   0
//  1       1        1        <                     :  0   0   1
//----------------------
// Comparator Commands
//     CMPEQ  : 000 equal
//     CMPHS  : 010 higher or same (unsigned)
//     CMPGE  : 011 grater or equal(signed)
//     CMPHI  : 110 higher than    (unsigned)
//     CMPGT  : 111 grater than    (signed)
//     CMPPL  : 101 plus (not 0)   (signed)
//     CMPPZ  : 001 plus or zero   (signed)
//     CMPSTR : 100 equal at least 1 byte

    always @(XBUS[31] or YBUS[31])
    begin
        EQMSB <= (XBUS[31] == YBUS[31]);
    end

    always @(XBUS[30:0] or YBUS[30:0])
    begin
        EQHH <= (XBUS[30:24] == YBUS[30:24]);
        EQHL <= (XBUS[23:16] == YBUS[23:16]);
        EQLH <= (XBUS[15: 8] == YBUS[15: 8]);
        EQLL <= (XBUS[ 7: 0] == YBUS[ 7: 0]);
    end

    always @(EQHH or EQHL or EQLH or EQLL)
    begin
        EQ <= EQHH & EQHL & EQLH & EQLL;
    end

    always @(XBUS or YBUS)
    begin
        if (XBUS[30:0] > YBUS[30:0])
            HI <= 1'b1;
        else
            HI <= 1'b0;
    end

    always @(CMPCOM or EQ or HI or XBUS or YBUS or EQMSB or EQHH or EQHL or EQLH or EQLL)
    begin
        case (CMPCOM)
            `CMPEQ : //000 equal
                     if (EQMSB & EQ)
                         CMPRESULT <= 1'b1;
                     else 
                         CMPRESULT <= 1'b0;
            `CMPHS : //010 higher or same (unsigned)
                     if ( (EQMSB & (HI | EQ))
                        | ((XBUS[31] == 1'b1) & (YBUS[31] == 1'b0)) )
                         CMPRESULT <= 1'b1;
                     else
                         CMPRESULT <= 1'b0;         
            `CMPGE : //011 grater or equal(signed)
                     if ( (EQMSB & (HI | EQ))
                        | ((XBUS[31] == 1'b0) & (YBUS[31] == 1'b1)) )
                         CMPRESULT <= 1'b1;
                     else
                         CMPRESULT <= 1'b0;
            `CMPHI : //110 higher than    (unsigned)
                     if ( (EQMSB & HI)
                        | ((XBUS[31] == 1'b1) & (YBUS[31] == 1'b0)) )
                         CMPRESULT <= 1'b1;
                     else
                         CMPRESULT <= 1'b0;  
            `CMPGT : //111 grater than    (signed) 
                     if ( (EQMSB & HI)
                        | ((XBUS[31] == 1'b0) & (YBUS[31] == 1'b1)) )
                         CMPRESULT <= 1'b1;
                     else
                         CMPRESULT <= 1'b0;
            `CMPPL : //101 plus (not 0)   (signed)
                     CMPRESULT <= ~XBUS[31] & ~(EQMSB & EQ);
            `CMPPZ : //001 plus or zero   (signed)
                     CMPRESULT <= ~XBUS[31] | (EQMSB & EQ);
            `CMPSTR: //100 equal at least 1 byte
                         CMPRESULT <= (EQMSB & EQHH) | EQHL | EQLH | EQLL;
            default : CMPRESULT <= 1'b0;
        endcase
    end

//-----------------
// Shifter Function
//-----------------
    always @(SFTFUNC or XBUS or SR)
    begin
        case (SFTFUNC)
            `SHLL   : SFTOUT <= {XBUS[30:0], 1'b0};
            `SHAL   : SFTOUT <= {XBUS[30:0], 1'b0};
            `SHLR   : SFTOUT <= {1'b0, XBUS[31:1]};
            `SHAR   : SFTOUT <= {XBUS[31], XBUS[31:1]};
            `ROTL   : SFTOUT <= {XBUS[30:0], XBUS[31]};
            `ROTCL  : SFTOUT <= {XBUS[30:0], SR[`T]};
            `ROTR   : SFTOUT <= {XBUS[0], XBUS[31:1]};
            `ROTCR  : SFTOUT <= {SR[`T], XBUS[31:1]};
            `SHLL2  : SFTOUT <= {XBUS[29:0], 2'b00};
            `SHLL8  : SFTOUT <= {XBUS[23:0], 8'h00};
            `SHLL16 : SFTOUT <= {XBUS[15:0], 16'h0000};
            `SHLR2  : SFTOUT <= {2'b00, XBUS[31:2]};
            `SHLR8  : SFTOUT <= {8'h00, XBUS[31:8]};
            `SHLR16 : SFTOUT <= {16'h0000, XBUS[31:16]};
            default: SFTOUT <= 32'hxxxxxxxx;
        endcase
        case (SFTFUNC)
            `SHLL   : SFTO <= XBUS[31];
            `SHAL   : SFTO <= XBUS[31];
            `SHLR   : SFTO <= XBUS[0];
            `SHAR   : SFTO <= XBUS[0];
            `ROTL   : SFTO <= XBUS[31];
            `ROTCL  : SFTO <= XBUS[31];
            `ROTR   : SFTO <= XBUS[0];
            `ROTCR  : SFTO <= XBUS[0];
            default: SFTO <= 1'bx;
        endcase
    end

//---------------
// Output to Mult
//---------------
    always @(MACSEL1 or XBUS or ZBUS or WBUS)
    begin
        casex (MACSEL1)
            2'b00   : MACIN1 <= XBUS;
            2'b01   : MACIN1 <= ZBUS;
            2'b1?   : MACIN1 <= WBUS;
            default : MACIN1 <= WBUS;
        endcase
    end

    always @(MACSEL2 or YBUS or ZBUS or WBUS)
    begin
        casex (MACSEL2)
            2'b00   : MACIN2 <= YBUS;
            2'b01   : MACIN2 <= ZBUS;
            2'b1?   : MACIN2 <= WBUS;
            default : MACIN2 <= WBUS;
        endcase
    end

//------------------------
// Memory Access Interface
//------------------------
    always @(WRMAAD_Z or ZBUS or WRMAAD_TEMP or TEMP or XBUS)
    begin
        if (WRMAAD_Z)
            MA_AD <= ZBUS;
        else if (WRMAAD_TEMP)
            MA_AD <= TEMP;
        else
            MA_AD <= XBUS; // default MA_AD is XBUS
    end

    always @(WRMADW_X or WRMADW_Y or XBUS or YBUS or ZBUS)
    begin
        if (WRMADW_X)
            MA_DW <= XBUS;
        else if (WRMADW_Y)
            MA_DW <= YBUS;
        else
            MA_DW <= ZBUS;
    end

//---------------------
// Program Counter : PC
//---------------------
    always @(posedge CLK)
    begin
        if (SLOT)
        begin
            if (WRPC_Z)
                PC <= ZBUS;
            else if (INCPC)
                PC <= PCADD2;
        end
    end

    always @(PC)
    begin
        PCADD2 <= PC + 2;
    end

    always @(IFADSEL or PCADD2 or ZBUS)
    begin
        if (IFADSEL == 1'b0)
            IF_AD <= PCADD2;
        else
            IF_AD <= ZBUS;
    end

//---------
// Constant
//---------
    always @(CONST_IFDR
          or CONST_ZERO4 or CONST_ZERO42 or CONST_ZERO44
          or CONST_ZERO8 or CONST_ZERO82 or CONST_ZERO84
          or CONST_SIGN8 or CONST_SIGN82
          or CONST_SIGN122)
    begin
        if (CONST_ZERO4)
            begin
                CONST[31:4] <= 28'h0000000;
                CONST[ 3:0] <= CONST_IFDR[3:0];
            end                          
        else if (CONST_ZERO42)
            begin
                CONST[31:5] <= 27'h0000000;
                CONST[ 4:1] <= CONST_IFDR[3:0];
                CONST[   0] <= 1'b0;    
            end                          
        else if (CONST_ZERO44)
            begin
                CONST[31:6] <= 26'h0000000;
                CONST[ 5:2] <= CONST_IFDR[3:0];
                CONST[ 1:0] <= 2'b00;    
            end
        else if (CONST_ZERO8)
            begin
                CONST[31:8] <= 24'h000000;
                CONST[ 7:0] <= CONST_IFDR[7:0];
            end                          
        else if (CONST_ZERO82)
            begin
                CONST[31:9] <= 23'h000000;
                CONST[ 8:1] <= CONST_IFDR[7:0];
                CONST[   0] <= 1'b0;    
            end                          
        else if (CONST_ZERO84)
            begin
                CONST[31:10] <= 22'h000000;
                CONST[ 9: 2] <= CONST_IFDR[7:0];
                CONST[ 1: 0] <= 2'b00;    
            end
        else if (CONST_SIGN8)
            begin
                for (l = 8 ; l <= 31 ; l = l + 1) CONST[l] <= CONST_IFDR[7];
                CONST[ 7:0] <= CONST_IFDR[7:0];
            end
        else if (CONST_SIGN82)
            begin
                for (m = 9 ; m <= 31 ; m = m + 1) CONST[m] <= CONST_IFDR[7];
                CONST[ 8:1] <= CONST_IFDR[7:0];
                CONST[   0] <= 1'b0;
            end
        else if (CONST_SIGN122)
            begin
                for (n = 13 ; n <= 31 ; n = n + 1) CONST[n] <= CONST_IFDR[11];
                CONST[12:1] <= CONST_IFDR[11:0];
                CONST[   0] <= 1'b0;
            end
        else
            CONST[31:0] <= 32'hxxxxxxxx;
    end

//--------------------------
// T value for Bcc judgement
//--------------------------
    always @(T_CMPSET   or CMPRESULT
          or T_CRYSET   or CRYO
          or T_TSTSET   or TSTO
          or T_SFTSET   or SFTO
          or QT_DV1SET  or T_DIV1
          or MQT_DV0SET or T_DIV0S
          or T_CLR
          or T_SET
          or WRSR_Z     or ZBUS
          or WRSR_W     or WBUS
          or SR[`T])
    begin
             if (T_CMPSET)   T_BCC <= CMPRESULT;
        else if (T_CRYSET)   T_BCC <= CRYO;
        else if (T_TSTSET)   T_BCC <= TSTO;
        else if (T_SFTSET)   T_BCC <= SFTO;
        else if (QT_DV1SET)  T_BCC <= T_DIV1;
        else if (MQT_DV0SET) T_BCC <= T_DIV0S;
        else if (T_CLR)      T_BCC <= 1'b0;
        else if (T_SET)      T_BCC <= 1'b1;
        else if (WRSR_W)     T_BCC <= WBUS[0];
        else if (WRSR_Z)     T_BCC <= ZBUS[0];
        else                 T_BCC <= SR[`T];
    end

//----------------
// Status Register
//----------------
    assign IBIT = SR[`I3:`I0];

    always @(posedge CLK)
    begin
        if (RST_SR)
            begin
              //SR[31:16] <= 16'h0000;
              //SR[15:10] <= 6'b000000;
                SR[`I3:`I0] <= 4'b1111;
                SR[3:2] <= 2'b00;
            end
        else if (SLOT)
        begin
            //---------------
            // T bit (bit 0)
            //---------------
            SR[`T] <= T_BCC;
            //--------------
            // Q bit (bit 8)
            //--------------
                 if (QT_DV1SET)  SR[`Q] <= Q_DIV1;
            else if (MQT_DV0SET) SR[`Q] <= XBUS[31];
            else if (MQ_CLR)     SR[`Q] <= 1'b0;
            else if (WRSR_W)     SR[`Q] <= WBUS[8];
            else if (WRSR_Z)     SR[`Q] <= ZBUS[8];
            //--------------
            // M bit (bit 9)
            //--------------
                 if (MQT_DV0SET) SR[`M] <= YBUS[31];
            else if (MQ_CLR)     SR[`M] <= 1'b0;
            else if (WRSR_W)     SR[`M] <= WBUS[9];
            else if (WRSR_Z)     SR[`M] <= ZBUS[9];
            //------
            // I bit
            //------
            if (WR_IBIT)
                SR[`I3:`I0] <= ILEVEL;    
            else if (WRSR_Z)     //ZBUS has the higher priority than WBUS.
                begin
                    SR[`I3:`I0] <= ZBUS[7:4];
                end
            else if (WRSR_W)
                begin
                    SR[`I3:`I0] <= WBUS[7:4];
                end
            //------
            // S bit
            //------
            if (WRSR_Z)     //ZBUS has the higher priority than WBUS.
                begin
                    SR[`S] <= ZBUS[1];
                end
            else if (WRSR_W)
                begin
                    SR[`S] <= WBUS[1];
                end
        end
    end

    always @(posedge CLK)
    begin
        if (MAC_S_LATCH)
            MAC_S <= SR[`S]; 
    end
        
//---------------------
// Global Base Register
//---------------------
    always @(posedge CLK)
    begin
        if (SLOT)
        begin
            if (WRGBR_Z)     //ZBUS has the higher priority than WBUS.
                GBR <= ZBUS;
            else if (WRGBR_W)
                GBR <= WBUS;
        end
    end

//---------------------
// Vector Base Register
//---------------------
    always @(posedge CLK)
    begin
        if (SLOT)
        begin
            if (WRVBR_Z)     //ZBUS has the higher priority than WBUS.
                VBR <= ZBUS;
            else if (WRVBR_W)
                VBR <= WBUS;
        end
    end

//-------------------
// Procedure Register
//-------------------
    always @(posedge CLK)
    begin
        if (SLOT)
        begin
            if (WRPR_PC)
                PR <= PC;
            else if (WRPR_Z)     //ZBUS has the higher priority than WBUS.
                PR <= ZBUS;
            else if (WRPR_W)
                PR <= WBUS;
        end
    end

//-------------------
// Temporary Register
//-------------------
    always @(posedge CLK)
    begin
        if (SLOT)
        begin
            if (WRTEMP_Z)
                TEMP <= ZBUS;
        end
    end

//======================================================
  endmodule
//======================================================