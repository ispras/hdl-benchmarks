//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : Decode Unit
//------------------------------------------------------
// File        : decode.v
// Library     : none
// Description : Decode Unit in CPU.
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 8th April 2002
// Creator         : Thorn Aitch
// Description     : Initial Design				  
//------------------------------------------------------
// Revision Number : 2
// Date of Change  : 11th August 2002
// Modifier        : Thorn Aitch
// Description     : Have Checked Memory Controller I/F					  
//------------------------------------------------------
// Revision Number : 3
// Date of Change  : 30th April 2003
// Modifier        : Thorn Aitch
// Description     : Release Version 1.0  
//------------------------------------------------------
// Revision Number : 4
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
module decode(
    // system signal
    CLK, RST, SLOT,
    // instruction fetch control
    IF_ISSUE, IF_JP,
    IF_DR, IF_BUS, IF_STALL,
    // data access control
    MA_ISSUE, KEEP_CYC, MA_WR, MA_SZ,
    //
    // multplier
    //
    // mult command
    MULCOM1, MULCOM2, WRMACH, WRMACL,
    // mult busy signal
    MAC_BUSY,
    //
    // data path
    //
    // general register
    RDREG_X,  RDREG_Y,  WRREG_Z,  WRREG_W,
    REGNUM_X, REGNUM_Y, REGNUM_Z, REGNUM_W,
    // ALU function
    ALUFUNC,
    // memory access
    WRMAAD_Z, WRMADW_X, WRMADW_Y, RDMADR_W,
    // mult
    MACSEL1, MACSEL2,
    RDMACH_X, RDMACL_X,
    RDMACH_Y, RDMACL_Y,
    // status register
    RDSR_X, RDSR_Y,
    WRSR_Z, WRSR_W,      
    // S bit for MAC
    MAC_S_LATCH,
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
    INCPC, IFADSEL,
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
    // Hardware Exception Event
    EVENT_REQ, EVENT_ACK, EVENT_INFO,
    // I bit in Status Register
    RST_SR, IBIT, ILEVEL, WR_IBIT,
    // SLEEP
    SLP
    );

//-------------------
// Module I/O Signals
//-------------------
    input  CLK;            // clock
    input  RST;            // reset
    input  SLOT;           // pipeline slot
    output IF_ISSUE;       // fetch request
    output IF_JP;          // fetch caused by jump
    input  [15:0] IF_DR;   // fetched instruction
    input  IF_BUS;         // fetch access done to extenal bus
    input  IF_STALL;       // fetch and memory access contention
    output MA_ISSUE;       // memory access request
    output KEEP_CYC;       // request read-modify-write (To be issued on READ-CYC to keep CYC_O on)
    output MA_WR;          // memory access kind : Write(1)/Read(0)
    output [1:0] MA_SZ;    // memory access size : 00 byte, 01 word, 10 long, 11 inhibitted

    output MULCOM1;        // Mult M1 Latch Command
    output [7:0] MULCOM2;  // Mult M2 Latch Command
    output WRMACH, WRMACL; // Write MACH/MACL
    input  MAC_BUSY;       // multiplier busy signal (negate at final operation state)

    output RDREG_X;        // read REG to X
    output RDREG_Y;        // read REG to Y
    output WRREG_Z;        // write REG from Z
    output WRREG_W;        // write REG from W

    output [3:0] REGNUM_X; // specify REG number reading to X
    output [3:0] REGNUM_Y; // specify REG number reading to Y
    output [3:0] REGNUM_Z; // specify REG number writing from Z
    output [3:0] REGNUM_W; // specify REG number writing from W

    output [4:0] ALUFUNC;  // ALU function

    output WRMAAD_Z;       // write MAAD from Z
    output WRMADW_X;       // write MADW from X
    output WRMADW_Y;       // write MADW from Y
    output RDMADR_W;       // read MADR to W

    output [1:0] MACSEL1;  // MAC Selecter 1
    output [1:0] MACSEL2;  // MAC Selecter 2
    output RDMACH_X;       // read MACH to X
    output RDMACL_X;       // read MACL to X
    output RDMACH_Y;       // read MACH to Y
    output RDMACL_Y;       // read MACL to Y
    
    output RDSR_X;         // read SR to X-bus
    output RDSR_Y;         // read SR to Y-bus
    output WRSR_Z;         // write SR from Z-bus
    output WRSR_W;         // write SR from W-bus

    output MAC_S_LATCH;    // latch S bit before MAC operation
                                                    
    output RDGBR_X;        // read GBR to X-bus
    output RDGBR_Y;        // read GBR to Y-bus
    output WRGBR_Z;        // write GBR from Z-bus
    output WRGBR_W;        // write GBR from W-bus

    output RDVBR_X;        // read VBR to X-bus
    output RDVBR_Y;        // read VBR to Y-bus
    output WRVBR_Z;        // write VBR from Z-bus
    output WRVBR_W;        // write VBR from W-bus

    output RDPR_X;         // read PR to X-bus
    output RDPR_Y;         // read PR to Y-bus
    output WRPR_Z;         // write PR from Z-bus
    output WRPR_W;         // write PR from W-bus
    output WRPR_PC;        // write PR from PC

    output RDPC_X;         // read PC to X
    output RDPC_Y;         // read PC to Y
    output WRPC_Z;         // write PC from Z
    output INCPC;          // increment PC
    output IFADSEL;        // IF_AD selecter

    output [15:0] CONST_IFDR; // Constant Value from Instruction Field
    output CONST_ZERO4;       // Const = unsigned lower 4bit
    output CONST_ZERO42;      // Const = unsigned lower 4bit * 2
    output CONST_ZERO44;      // Const = unsigned lower 4bit * 4
    output CONST_ZERO8;       // Const = unsigned lower 8bit
    output CONST_ZERO82;      // Const = unsigned lower 8bit * 2
    output CONST_ZERO84;      // Const = unsigned lower 8bit * 4
    output CONST_SIGN8;       // Const = signed lower 8bit
    output CONST_SIGN82;      // Const = signed lower 8bit * 2
    output CONST_SIGN122;     // Const = signed lower 12bit * 2
    output RDCONST_X;         // read CONST to X
    output RDCONST_Y;         // read CONST to Y
    output REG_FWD_X;         // forward REG from W to X
    output REG_FWD_Y;         // forward REG from W to Y

    output [2:0] CMPCOM;   // define comparator operation (command)
    output [4:0] SFTFUNC;  // Shifter Function

    output RDSFT_Z;        // read SFTOUT to Z-BUS

    input  T_BCC;          // T value for Bcc judgement
    output T_CMPSET;       // reflect comparator result to T
    output T_CRYSET;       // reflect carry/borrow out to T
    output T_TSTSET;       // reflect tst result to T
    output T_SFTSET;       // reflect shifted output to T
    output QT_DV1SET;      // reflect DIV1 result to Q and T
    output MQT_DV0SET;     // reflect DIV0S result to M, Q and T
    output T_CLR;          // clear T
    output T_SET;          // set T
    output MQ_CLR;         // clear M and Q

    output RDTEMP_X;       // read TEMP to X-bus
    output WRTEMP_Z;       // write to TEMP from Z-bus
    output WRMAAD_TEMP;    // output MAAD from TEMP

    input  [2:0] EVENT_REQ;   // event request
    output EVENT_ACK;         // event acknowledge
    input  [11:0] EVENT_INFO; // event information (ILEVEL[3:0],VECTOR[7:0])

    output RST_SR;         // reset SR
    input  [3:0] IBIT;     // I bit in SR
    output [3:0] ILEVEL;   // IRQ Level
    output WR_IBIT;        // Write ILEVEL to I bit in SR

    output SLP;            // Sleep output

//-----------------
// Internal Signals
//-----------------
    reg  [15:0] IF_DR_EVT; // IF_DR reflected by Hardware Event
    reg  EVENT_ACK;        // Hardware Event Acknowledge 
    reg  EVENT_ACK_0;      // Hardware Event Acknowledge from huge truth table
    reg  [15:0] IR;     // instruction register
                        // It is used by only multicycle instruction.
                        // IF_DR is latched to IR when INSTR_SEQ=0.
                        // This means IR is valid after ID stage (=from EX stage).
    reg  [15:0] INSTR_STATE; // Instruction State (what instruction is on going.)
    reg  [ 3:0] INSTR_SEQ;   // Instruction Sequence
    reg  DISPATCH;      // clear INSTR_SEQ (restart sequence for new instruction)
    reg  REG_CONF;      // register conflict (memory load contention)
    reg  ID_STALL;      // indicate a slot of stalled ID stage 
    reg  NEXT_ID_STALL; // indicate next ID should be stalled 
    reg  INSTR_SEQ_ZERO;// if (INSTR_SEQ == 4'b0000) INSTR_SEQ_ZERO is 1 else 0
    reg  INSTR_STATE_SEL; // 0:INSTR_STATE=IFDR, 1:INSTRSTATE=IR
    reg  DELAY_JUMP;    // it shows ID stage of delayed jump instruction
    reg  DELAY_SLOT;    // it shows ID stage of delayed slot instruction

    reg  RST_SR;        // reset SR
    reg  [3:0] ILEVEL;  // IRQ Level
    reg  ILEVEL_CAP;    // Capture IRQ Level
    reg  WR_IBIT;       // Write ILEVEL to I bit in SR
    reg  MASKINT_NEXT;  // Mask Interrupt at next slot
    reg  MASKINT;       // Mask Interrupt at this slot

    reg  SLP;           // Sleep output

//---------------------------------
// Multiplier related Stall Control
//---------------------------------
    reg  WB_MAC_BUSY, WB1_MAC_BUSY, WB2_MAC_BUSY, WB3_MAC_BUSY;
    reg  EX_MAC_BUSY, EX1_MAC_BUSY;
    reg  MAC_STALL;       // Shows "should-be-stalled" ID of multiplier related instruction.
    reg  MAC_STALL_SENSE; // ID stage that is stalled by multiplier operation should set this.
    reg  MAC_S_LATCH;     // command to latch S bit before MAC operation

    always @(posedge CLK or posedge RST)
    begin
        if (RST)
        begin
            WB1_MAC_BUSY <= 1'b0;
            WB2_MAC_BUSY <= 1'b0;
            WB3_MAC_BUSY <= 1'b0;
            EX1_MAC_BUSY <= 1'b0;
        end
        else if (SLOT)
        begin
            WB1_MAC_BUSY <= WB_MAC_BUSY;
            WB2_MAC_BUSY <= WB1_MAC_BUSY;
            WB3_MAC_BUSY <= WB2_MAC_BUSY;
            EX1_MAC_BUSY <= EX_MAC_BUSY;    
        end
    end

    always @(MAC_STALL_SENSE or MAC_BUSY 
          or WB1_MAC_BUSY or WB2_MAC_BUSY or WB3_MAC_BUSY or EX1_MAC_BUSY)
    begin
        MAC_STALL <= MAC_STALL_SENSE 
                   & (WB1_MAC_BUSY | WB2_MAC_BUSY | WB3_MAC_BUSY | EX1_MAC_BUSY | MAC_BUSY);
    end

//-----------------------------------
// Control Signal & Pipeline Shifting
//-----------------------------------
// Examples of Naming Convention
//    ID_ddd  : control signal for ID stage (output by Decoder)
//    EX_eee  : control signal for EX stage (output by Decoder)
//    eee     : shifted EX_eee by one slot (control output to datapath) 
//    WB_www  : control signal for WB stage (output by Decoder)
//    WB1_www : shifted WB_www by one slot (active at EX stage)
//    WB2_www : shifted WB1_www by one slot (active at MA stage)
//    www     : shifted WB2_www by one slot (control output to datapath) 
//                                   
//-----------------------------------
    reg [1:0] WB_MACSEL1, WB1_MACSEL1, WB2_MACSEL1, EX_MACSEL1, MACSEL1;
    reg WB_MULCOM1, WB1_MULCOM1, WB2_MULCOM1, EX_MULCOM1, MULCOM1;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WB1_MULCOM1 <= 1'b0;
            WB2_MULCOM1 <= 1'b0;
            MULCOM1     <= 1'b0;
            WB1_MACSEL1 <= 2'b00;
            WB2_MACSEL1 <= 2'b00;
            MACSEL1     <= 2'b00;
        end
        else if (SLOT)
        begin
            WB1_MULCOM1 <= ((NEXT_ID_STALL)? 1'b0 : WB_MULCOM1);
            WB2_MULCOM1 <= WB1_MULCOM1;
            MULCOM1     <= WB2_MULCOM1 | ((NEXT_ID_STALL)? 1'b0 : EX_MULCOM1);
            WB1_MACSEL1 <= ((NEXT_ID_STALL)? 1'b0 : WB_MACSEL1);
            WB2_MACSEL1 <= WB1_MACSEL1;
            MACSEL1     <= WB2_MACSEL1 | ((NEXT_ID_STALL)? 1'b0 : EX_MACSEL1);
        end
        
    reg [1:0] WB_MACSEL2, WB1_MACSEL2, WB2_MACSEL2, EX_MACSEL2, MACSEL2;
    reg [7:0] WB_MULCOM2, WB1_MULCOM2, WB2_MULCOM2, EX_MULCOM2, MULCOM2;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WB1_MULCOM2 <= 8'h00;
            WB2_MULCOM2 <= 8'h00;
            MULCOM2     <= 8'h00;
            WB1_MACSEL2 <= 2'b00;
            WB2_MACSEL2 <= 2'b00;
            MACSEL2     <= 2'b00;
        end
        else if (SLOT)
        begin
            WB1_MULCOM2 <= ((NEXT_ID_STALL)? 1'b0 : WB_MULCOM2);
            WB2_MULCOM2 <= WB1_MULCOM2;
            MULCOM2     <= WB2_MULCOM2 | ((NEXT_ID_STALL)? 1'b0 : EX_MULCOM2);
            WB1_MACSEL2 <= ((NEXT_ID_STALL)? 1'b0 : WB_MACSEL2);
            WB2_MACSEL2 <= WB1_MACSEL2;
            MACSEL2     <= WB2_MACSEL2 | ((NEXT_ID_STALL)? 1'b0 : EX_MACSEL2);
        end                                                             
//-----------------------------------
    reg EX_RDMACH_X, RDMACH_X;
    reg EX_RDMACL_X, RDMACL_X;
    reg EX_RDMACH_Y, RDMACH_Y;
    reg EX_RDMACL_Y, RDMACL_Y;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
             RDMACH_X <= 1'b0;
             RDMACL_X <= 1'b0;
             RDMACH_Y <= 1'b0;
             RDMACL_Y <= 1'b0;
        end
        else if (SLOT)
        begin
             RDMACH_X <= EX_RDMACH_X;
             RDMACL_X <= EX_RDMACL_X;
             RDMACH_Y <= EX_RDMACH_Y;
             RDMACL_Y <= EX_RDMACL_Y;
        end

    reg WB_WRMACH, EX_WRMACH, WRMACH, WB1_WRMACH, WB2_WRMACH;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WB1_WRMACH <= 1'b0;
            WB2_WRMACH <= 1'b0;
            WRMACH     <= 1'b0;
        end
        else if (SLOT)
        begin
            WB1_WRMACH <= ((NEXT_ID_STALL)? 1'b0 : WB_WRMACH);
            WB2_WRMACH <= WB1_WRMACH;
            WRMACH     <= WB2_WRMACH | ((NEXT_ID_STALL)? 1'b0 : EX_WRMACH);
        end

    reg WB_WRMACL, EX_WRMACL, WRMACL, WB1_WRMACL, WB2_WRMACL;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WB1_WRMACL <= 1'b0;
            WB2_WRMACL <= 1'b0;
            WRMACL     <= 1'b0;
        end
        else if (SLOT)
        begin
            WB1_WRMACL <= ((NEXT_ID_STALL)? 1'b0 : WB_WRMACL);
            WB2_WRMACL <= WB1_WRMACL;
            WRMACL     <= WB2_WRMACL | ((NEXT_ID_STALL)? 1'b0 : EX_WRMACL);
        end
//-----------------------------------
    reg EX_RDREG_X, RDREG_X;
    reg EX_RDREG_Y, RDREG_Y;
    reg [3:0] EX_REGNUM_X, REGNUM_X;
    reg [3:0] EX_REGNUM_Y, REGNUM_Y;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDREG_X <= 1'b0;
            RDREG_Y <= 1'b0;
        end
        else if (SLOT)
        begin
            RDREG_X  <= EX_RDREG_X;
            RDREG_Y  <= EX_RDREG_Y;
            REGNUM_X <= EX_REGNUM_X;
            REGNUM_Y <= EX_REGNUM_Y;
        end

    reg EX_WRREG_Z, WRREG_Z;
    reg [3:0] EX_REGNUM_Z, REGNUM_Z;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WRREG_Z  <= 1'b0;
        end
        else if (SLOT)
        begin
            WRREG_Z  <= ((NEXT_ID_STALL)? 1'b0 : EX_WRREG_Z);
            REGNUM_Z <= EX_REGNUM_Z;
        end

    reg WB_WRREG_W, WRREG_W, WB1_WRREG_W, WB2_WRREG_W;
    reg [3:0] WB_REGNUM_W, REGNUM_W, WB1_REGNUM_W, WB2_REGNUM_W;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WB1_WRREG_W  <= 1'b0;
            WB2_WRREG_W  <= 1'b0;
            WRREG_W      <= 1'b0;
        end
        else if (SLOT) begin
            WB1_WRREG_W  <= ((NEXT_ID_STALL)? 1'b0 : WB_WRREG_W);
            WB2_WRREG_W  <= WB1_WRREG_W;
            WRREG_W      <= WB2_WRREG_W;
            WB1_REGNUM_W <= WB_REGNUM_W;
            WB2_REGNUM_W <= WB1_REGNUM_W;
            REGNUM_W     <= WB2_REGNUM_W;
        end
//-----------------------------------
    reg [4:0] EX_ALUFUNC, ALUFUNC;
    always @(posedge CLK or posedge RST)
        if (RST)
            ALUFUNC <= `ALU_NOP;
        else if (SLOT) begin
            ALUFUNC <= EX_ALUFUNC;
        end
//-----------------------------------
    reg EX_WRMAAD_Z, WRMAAD_Z;
    reg EX_WRMADW_X, WRMADW_X;
    reg EX_WRMADW_Y, WRMADW_Y;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WRMAAD_Z <= 1'b0;
            WRMADW_X <= 1'b0;
            WRMADW_Y <= 1'b0;
        end
        else if (SLOT)
        begin
            WRMAAD_Z <= ((NEXT_ID_STALL)? 1'b0 : EX_WRMAAD_Z);
            WRMADW_X <= ((NEXT_ID_STALL)? 1'b0 : EX_WRMADW_X); 
            WRMADW_Y <= ((NEXT_ID_STALL)? 1'b0 : EX_WRMADW_Y);
        end

    reg WB_RDMADR_W, RDMADR_W, WB1_RDMADR_W, WB2_RDMADR_W;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            WB1_RDMADR_W <= 1'b0;
            WB2_RDMADR_W <= 1'b0;
            RDMADR_W     <= 1'b0;
        end
        else if (SLOT)
        begin
            WB1_RDMADR_W <= WB_RDMADR_W;
            WB2_RDMADR_W <= WB1_RDMADR_W;
            RDMADR_W     <= WB2_RDMADR_W;
        end
//-----------------------------------
    reg EX_RDPC_X, RDPC_X;
    reg EX_RDPC_Y, RDPC_Y;
    reg EX_WRPC_Z, WRPC_Z;
    reg ID_INCPC, INCPC;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDPC_X <= 1'b0;
            RDPC_Y <= 1'b0;
            WRPC_Z <= 1'b0;
        end
        else if (SLOT)
        begin
            RDPC_X <= EX_RDPC_X;
            RDPC_Y <= EX_RDPC_Y;
            WRPC_Z <= ((NEXT_ID_STALL)? 1'b0 : EX_WRPC_Z);
        end

    always @(ID_INCPC or NEXT_ID_STALL)
    begin
        INCPC <= ((NEXT_ID_STALL)? 1'b0 : ID_INCPC);
    end

    reg EX_IFADSEL, ID_IFADSEL, IFADSEL, EX1_IFADSEL;
    always @(posedge CLK or posedge RST)
        if (RST)
            EX1_IFADSEL <= 1'b0;
        else if (SLOT) begin
            EX1_IFADSEL <= EX_IFADSEL;
        end

    always @(EX1_IFADSEL or ID_IFADSEL)
        IFADSEL <= EX1_IFADSEL | ID_IFADSEL;

    reg  EX_IF_ISSUE, ID_IF_ISSUE, IF_ISSUE, EX1_IF_ISSUE;  // fetch request
    reg  EX_IF_JP, ID_IF_JP, IF_JP, EX1_IF_JP;              // fetch caused by jump
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            EX1_IF_ISSUE <= 1'b0;
            EX1_IF_JP    <= 1'b0;
        end
        else if (SLOT) begin
            EX1_IF_ISSUE <= ((NEXT_ID_STALL)? 1'b0 : EX_IF_ISSUE);
            EX1_IF_JP    <= ((NEXT_ID_STALL)? 1'b0 : EX_IF_JP);
        end

    // [CAUTION]
    // IF_ISSUE and IF_JP should be masked by REG_CONF.
    // If they are masked by NEXT_ID_STALL which is made from IF_STALL, 
    // a oscillation loop from DECODE--(issue command)-->MEM--(IF_STALL)-->DECODE appears.
    // The IF issue operation is stalled only by register conflict stall, so
    // this function is correct.
    // And also, IF_ISSUE should be masked by MAC_STALL, because, if the ID stage of instruction
    // stalled by MAC_STALL issues IF at every stalled cycle, the fetched instruction 
    // may be diappeared.
    always @(EX1_IF_ISSUE or ID_IF_ISSUE or EX1_IF_JP or ID_IF_JP or REG_CONF or MAC_STALL)
    begin
        IF_ISSUE <= EX1_IF_ISSUE | (ID_IF_ISSUE & ~REG_CONF & ~MAC_STALL);
        IF_JP <= EX1_IF_JP | (ID_IF_JP & ~REG_CONF);
    end
//-----------------------------------
    reg  EX_MA_ISSUE, MA_ISSUE;   // memory access request
    reg  EX_KEEP_CYC, KEEP_CYC;   // request read-modify-write (To be issued on READ-CYC to keep CYC_O on)
    reg  EX_MA_WR, MA_WR;         // memory access kind : Write(1)/Read(0)
    reg  [1:0] EX_MA_SZ, MA_SZ;   // memory access size : 00 byte, 01 word, 10 long, 11 inhibitted
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            MA_ISSUE <= 1'b0;
            KEEP_CYC <= 1'b0;
            MA_WR    <= 1'b0;
            MA_SZ    <= 2'b00;
        end
        else if (SLOT)
        begin
            MA_ISSUE <= ((NEXT_ID_STALL)? 1'b0 : EX_MA_ISSUE);
            KEEP_CYC <= EX_KEEP_CYC;
            MA_WR <= EX_MA_WR;
            MA_SZ <= EX_MA_SZ;
        end
//-----------------------------------
    reg EX_CONST_ZERO4,  CONST_ZERO4;  
    reg EX_CONST_ZERO42, CONST_ZERO42;
    reg EX_CONST_ZERO44, CONST_ZERO44;
    reg EX_CONST_ZERO8,  CONST_ZERO8;  
    reg EX_CONST_ZERO82, CONST_ZERO82;
    reg EX_CONST_ZERO84, CONST_ZERO84;
    reg EX_CONST_SIGN8,  CONST_SIGN8;  
    reg EX_CONST_SIGN82, CONST_SIGN82;
    reg EX_CONST_SIGN122,CONST_SIGN122;
    reg EX_RDCONST_X, RDCONST_X;
    reg EX_RDCONST_Y, RDCONST_Y;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            CONST_ZERO4  <= 1'b0;
            CONST_ZERO42 <= 1'b0;
            CONST_ZERO44 <= 1'b0;  
            CONST_ZERO8  <= 1'b0;
            CONST_ZERO82 <= 1'b0;
            CONST_ZERO84 <= 1'b0;
            CONST_SIGN8  <= 1'b0;
            CONST_SIGN82 <= 1'b0;
            CONST_SIGN122<= 1'b0; 
            RDCONST_X    <= 1'b0;
            RDCONST_Y    <= 1'b0;
        end
        else if (SLOT)
        begin
            CONST_ZERO4  <= EX_CONST_ZERO4;
            CONST_ZERO44 <= EX_CONST_ZERO44;
            CONST_ZERO42 <= EX_CONST_ZERO42;
            CONST_ZERO8  <= EX_CONST_ZERO8; 
            CONST_ZERO82 <= EX_CONST_ZERO82;
            CONST_ZERO84 <= EX_CONST_ZERO84;
            CONST_SIGN8  <= EX_CONST_SIGN8; 
            CONST_SIGN82 <= EX_CONST_SIGN82;
            CONST_SIGN122<= EX_CONST_SIGN122;
            RDCONST_X    <= EX_RDCONST_X;
            RDCONST_Y    <= EX_RDCONST_Y;
        end

    reg [15:0] CONST_IFDR;
    //always @(posedge CLK)
    //    if (SLOT & INSTR_SEQ_ZERO & ~NEXT_ID_STALL)
    //        CONST_IFDR <= IF_DR[15:0];
    //    else if (SLOT & ~INSTR_SEQ_ZERO & ~NEXT_ID_STALL)
    //        CONST_IFDR <= IR[15:0];
    always @(posedge CLK)
        if (SLOT)
            CONST_IFDR <= INSTR_STATE;
//-----------------------------------
    reg EX_RDSR_X, RDSR_X;
    reg EX_RDSR_Y, RDSR_Y;
    reg EX_WRSR_Z, WRSR_Z;
    reg WB_WRSR_W, WRSR_W, WB1_WRSR_W, WB2_WRSR_W;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDSR_X     <= 1'b0;
            RDSR_Y     <= 1'b0;
            WRSR_Z     <= 1'b0;
            WB1_WRSR_W <= 1'b0;
            WB2_WRSR_W <= 1'b0;
            WRSR_W     <= 1'b0;
        end
        else if (SLOT)
        begin
            RDSR_X     <= EX_RDSR_X;
            RDSR_Y     <= EX_RDSR_Y;
            WRSR_Z     <= ((NEXT_ID_STALL)? 1'b0 : EX_WRSR_Z);
            WB1_WRSR_W <= ((NEXT_ID_STALL)? 1'b0 : WB_WRSR_W);
            WB2_WRSR_W <= WB1_WRSR_W;
            WRSR_W     <= WB2_WRSR_W;
        end                                        
//-----------------------------------
    reg EX_RDGBR_X, RDGBR_X;
    reg EX_RDGBR_Y, RDGBR_Y;
    reg EX_WRGBR_Z, WRGBR_Z;
    reg WB_WRGBR_W, WRGBR_W, WB1_WRGBR_W, WB2_WRGBR_W;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDGBR_X     <= 1'b0;
            RDGBR_Y     <= 1'b0;
            WRGBR_Z     <= 1'b0;
            WB1_WRGBR_W <= 1'b0;
            WB2_WRGBR_W <= 1'b0;
            WRGBR_W     <= 1'b0;
        end
        else if (SLOT)
        begin
            RDGBR_X     <= EX_RDGBR_X;
            RDGBR_Y     <= EX_RDGBR_Y;
            WRGBR_Z     <= ((NEXT_ID_STALL)? 1'b0 : EX_WRGBR_Z);
            WB1_WRGBR_W <= ((NEXT_ID_STALL)? 1'b0 : WB_WRGBR_W);
            WB2_WRGBR_W <= WB1_WRGBR_W;
            WRGBR_W     <= WB2_WRGBR_W;
        end
//-----------------------------------
    reg EX_RDVBR_X, RDVBR_X;
    reg EX_RDVBR_Y, RDVBR_Y;
    reg EX_WRVBR_Z, WRVBR_Z;
    reg WB_WRVBR_W, WRVBR_W, WB1_WRVBR_W, WB2_WRVBR_W;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDVBR_X     <= 1'b0;
            RDVBR_Y     <= 1'b0;
            WRVBR_Z     <= 1'b0;
            WB1_WRVBR_W <= 1'b0;
            WB2_WRVBR_W <= 1'b0;
            WRVBR_W     <= 1'b0;
        end
        else if (SLOT)
        begin
            RDVBR_X     <= EX_RDVBR_X;
            RDVBR_Y     <= EX_RDVBR_Y;
            WRVBR_Z     <= ((NEXT_ID_STALL)? 1'b0 : EX_WRVBR_Z);
            WB1_WRVBR_W <= ((NEXT_ID_STALL)? 1'b0 : WB_WRVBR_W);
            WB2_WRVBR_W <= WB1_WRVBR_W;
            WRVBR_W     <= WB2_WRVBR_W;
        end
//-----------------------------------
    reg EX_RDPR_X, RDPR_X;
    reg EX_RDPR_Y, RDPR_Y;
    reg EX_WRPR_Z, WRPR_Z;
    reg WB_WRPR_W, WRPR_W, WB1_WRPR_W, WB2_WRPR_W;
    reg EX_WRPR_PC,WRPR_PC;
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDPR_X     <= 1'b0;
            RDPR_Y     <= 1'b0;
            WRPR_Z     <= 1'b0;
            WB1_WRPR_W <= 1'b0;
            WB2_WRPR_W <= 1'b0;
            WRPR_W     <= 1'b0;
            WRPR_PC    <= 1'b0;
        end
        else if (SLOT)
        begin
            RDPR_X     <= EX_RDPR_X;
            RDPR_Y     <= EX_RDPR_Y;
            WRPR_Z     <= ((NEXT_ID_STALL)? 1'b0 : EX_WRPR_Z);
            WB1_WRPR_W <= ((NEXT_ID_STALL)? 1'b0 : WB_WRPR_W);
            WB2_WRPR_W <= WB1_WRPR_W;
            WRPR_W     <= WB2_WRPR_W;
            WRPR_PC    <= ((NEXT_ID_STALL)? 1'b0 : EX_WRPR_PC);
        end
//-----------------------------------
    reg [2:0] EX_CMPCOM, CMPCOM;
    reg [4:0] EX_SFTFUNC, SFTFUNC;
    reg EX_RDSFT_Z, RDSFT_Z;
    reg EX_T_CMPSET, T_CMPSET;
    reg EX_T_CRYSET, T_CRYSET;
    reg EX_T_TSTSET, T_TSTSET;    
    reg EX_T_SFTSET, T_SFTSET;
    reg EX_QT_DV1SET, QT_DV1SET;
    reg EX_MQT_DV0SET, MQT_DV0SET;
    reg EX_T_CLR, T_CLR;
    reg EX_T_SET, T_SET;
    reg EX_MQ_CLR, MQ_CLR;

    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDSFT_Z    <= 1'b0;
            T_CMPSET   <= 1'b0;
            T_CRYSET   <= 1'b0;
            T_TSTSET   <= 1'b0;
            T_SFTSET   <= 1'b0;
            QT_DV1SET  <= 1'b0;
            MQT_DV0SET <= 1'b0;
            T_CLR      <= 1'b0;
            T_SET      <= 1'b0;
            MQ_CLR     <= 1'b0;
        end
        else if (SLOT)
        begin                                                  
            CMPCOM     <= ((NEXT_ID_STALL)? 3'b000 : EX_CMPCOM);   
            SFTFUNC    <= ((NEXT_ID_STALL)? 3'b000 : EX_SFTFUNC);
            RDSFT_Z    <= ((NEXT_ID_STALL)? 1'b0: EX_RDSFT_Z);
            T_CMPSET   <= ((NEXT_ID_STALL)? 1'b0: EX_T_CMPSET);
            T_CRYSET   <= ((NEXT_ID_STALL)? 1'b0: EX_T_CRYSET);
            T_TSTSET   <= ((NEXT_ID_STALL)? 1'b0: EX_T_TSTSET);
            T_SFTSET   <= ((NEXT_ID_STALL)? 1'b0: EX_T_SFTSET);
            QT_DV1SET  <= ((NEXT_ID_STALL)? 1'b0: EX_QT_DV1SET);
            MQT_DV0SET <= ((NEXT_ID_STALL)? 1'b0: EX_MQT_DV0SET);
            T_CLR      <= ((NEXT_ID_STALL)? 1'b0: EX_T_CLR);
            T_SET      <= ((NEXT_ID_STALL)? 1'b0: EX_T_SET);
            MQ_CLR     <= ((NEXT_ID_STALL)? 1'b0: EX_MQ_CLR);
        end                          
//-----------------------------------
    reg EX_RDTEMP_X,    RDTEMP_X;    
    reg EX_WRTEMP_Z,    WRTEMP_Z;
    reg EX_WRMAAD_TEMP, WRMAAD_TEMP;    
    reg EX_FWD_W2X,     FWD_W2X;     // force forward from W-bus to X-bus
    always @(posedge CLK or posedge RST)
        if (RST)
        begin
            RDTEMP_X    <= 1'b0;
            WRTEMP_Z    <= 1'b0;
            WRMAAD_TEMP <= 1'b0;
            FWD_W2X     <= 1'b0;
        end
        else if (SLOT)
        begin                                                   
            RDTEMP_X    <= ((NEXT_ID_STALL)? 1'b0: EX_RDTEMP_X);
            WRTEMP_Z    <= ((NEXT_ID_STALL)? 1'b0: EX_WRTEMP_Z);
            WRMAAD_TEMP <= ((NEXT_ID_STALL)? 1'b0: EX_WRMAAD_TEMP);
            FWD_W2X     <= ((NEXT_ID_STALL)? 1'b0: EX_FWD_W2X);
        end 

//-------------------
// Main State Machine
//-------------------
    // ----------------------Input State------------------ : ---Output--  ---@Next Slot---
    // SLOT  NEXT_ID_STALL  ID_STALL  DISPATCH  INSTR_SEQ  : INSTR_STATE  INSTR_SEQ  IR  
    // --------------------------------------------------- : -----------------------------
    // 0     *              *         *         *          : IR           Keep       Keep 
    // --------------------------------------------------- : -----------------------------
    // 1     0              0         0         >=0001     : IR           +1         Keep      
    // 1     0              0         0         ==0000     : IF_DR        +1         IF_DR
    // 1     0              0         1         >=0001     : IR           Clear0     Keep
    // 1     0              0         1         ==0000     : IF_DR        Clear0     IF_DR
    // 1     0              1         0         >=0001     : IR           +1         Keep      
    // 1     0              1         0         ==0000     : IR           +1         Keep
    // 1     0              1         1         >=0001     : IR           Clear0     Keep
    // 1     0              1         1         ==0000     : IR           Clear0     Keep
    // --------------------------------------------------- : -----------------------------
    // 1     1              0         0         >=0001     : IR           Keep       Keep
    // 1     1              0         0         ==0000     : IF_DR        Keep       IF_DR
    // 1     1              0         1         >=0001     : IR           Keep       Keep
    // 1     1              0         1         ==0000     : IF_DR        Keep       IF_DR
    // 1     1              1         0         >=0001     : IR           Keep       Keep
    // 1     1              1         0         ==0000     : IR           Keep       Keep
    // 1     1              1         1         >=0001     : IR           Keep       Keep
    // 1     1              1         1         ==0000     : IR           Keep       Keep
    //

    //-----------------------
    // Detect Exception Event
    //-----------------------
    always @(IF_DR or EVENT_REQ or EVENT_INFO or MASKINT or IBIT or DELAY_SLOT)
    begin
        //--------Hardware Event--------
        if (~DELAY_SLOT & (
               (~MASKINT & (EVENT_REQ == `NMI))
             | (~MASKINT & (EVENT_REQ == `IRQ) & (IBIT < EVENT_INFO[11:8]))
             | (EVENT_REQ == `CPUERR)
             | (EVENT_REQ == `DMAERR)
             | (EVENT_REQ == `MRES)
           ))
            begin
                IF_DR_EVT <= {5'b11110, EVENT_REQ, EVENT_INFO[7:0]};
            end
        //--------General & Slot Illegal Instruction--------
        else if (DELAY_SLOT)
            casex (IF_DR)
                16'b0000????00?00011 : IF_DR_EVT <= `SLOT_ILGL; // BSRF,BRAF
                16'b0000000000101011 : IF_DR_EVT <= `SLOT_ILGL; // RTE
                16'b0100????00?01011 : IF_DR_EVT <= `SLOT_ILGL; // JSR, JMP
                16'b10001??1???????? : IF_DR_EVT <= `SLOT_ILGL; // Bcc, Bcc/S
                16'b101????????????? : IF_DR_EVT <= `SLOT_ILGL; // RRA, BSR
                16'b11000011???????? : IF_DR_EVT <= `SLOT_ILGL; // TRAPA
                16'b11111111???????? : IF_DR_EVT <= `SLOT_ILGL; // General Illegal
                default              : IF_DR_EVT <= IF_DR;
            endcase
        else if (IF_DR[15:8] == 8'hFF)
                IF_DR_EVT <= `GNRL_ILGL; // General Illegal Instruction
        else
                IF_DR_EVT <= IF_DR;
    end
    //----------------------
    always @(posedge CLK)
    begin
        if (SLOT & ILEVEL_CAP) ILEVEL <= EVENT_INFO[11:8];
    end
    //----------------------
    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            MASKINT <= 1'b0;
        else if (SLOT) 
            MASKINT <= MASKINT_NEXT;
    end
    //----------------------
    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            DELAY_SLOT <= 1'b0;
        else if (SLOT)
            DELAY_SLOT <= (NEXT_ID_STALL)? DELAY_SLOT : DELAY_JUMP;
    end
    //----------------------
    always@ (EVENT_ACK_0 or SLOT) EVENT_ACK <= SLOT & EVENT_ACK_0;

    //---------------------
    // instruction register
    //---------------------
    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            IR <= `POWERON_RESET;
        //else if ((SLOT & ~DISPATCH & INSTR_SEQ_ZERO) | (~SLOT & ~DISPATCH))
        else if (SLOT & ~ID_STALL & INSTR_SEQ_ZERO)
        begin
            IR <= IF_DR_EVT;
        end
    end

    //------------------
    // instruction state
    //------------------
    always @(ID_STALL or INSTR_SEQ_ZERO)
    begin
        case ({ID_STALL, INSTR_SEQ_ZERO})
            2'b00 : INSTR_STATE_SEL <= 1'b1;
            2'b01 : INSTR_STATE_SEL <= 1'b0;
            2'b10 : INSTR_STATE_SEL <= 1'b1;
            3'b11 : INSTR_STATE_SEL <= 1'b1;
            default : INSTR_STATE_SEL <= 1'bx;
        endcase
    end

    always @(INSTR_STATE_SEL or IR or IF_DR_EVT)
    begin
        if (INSTR_STATE_SEL) 
            INSTR_STATE <= IR;
        else
            INSTR_STATE <= IF_DR_EVT;
    end

    //--------------
    // Next ID STALL
    //--------------
    always @(REG_CONF or IF_STALL or MAC_STALL)
    begin
        if (REG_CONF | IF_STALL | MAC_STALL)
            NEXT_ID_STALL <= 1'b1;
        else
            NEXT_ID_STALL <= 1'b0;
    end

    //---------
    // ID STALL
    //---------
    always @(posedge CLK or posedge RST)
    begin
        if (RST)
            ID_STALL <= 1'b0;
        else if (SLOT)
            ID_STALL <= NEXT_ID_STALL;
    end
    
    //---------------------
    // instruction sequence
    //---------------------
    always @(posedge CLK or posedge RST) begin
        if (RST)
            INSTR_SEQ <= 4'b0001;
        else if (SLOT & ~NEXT_ID_STALL & DISPATCH)
            INSTR_SEQ <= 4'b0000;
        else if (SLOT & ~NEXT_ID_STALL & ~DISPATCH)
            INSTR_SEQ <= INSTR_SEQ + 1;
    end

    always @(INSTR_SEQ)
    begin
        if (INSTR_SEQ == 4'b0000)
            INSTR_SEQ_ZERO <= 1'b1;
        else
            INSTR_SEQ_ZERO <= 1'b0;
    end

    //------------------------
    // check register conflict
    //------------------------
    // following conditions mean register conflict
    // (1) EX_RDREG_X and WB1_WRREG_W and (EX_REGNUM_X == WB1_REGNUM_W)
    // (2) EX_RDREG_Y and WB1_WRREG_W and (EX_REGNUM_Y == WB1_REGNUM_W)
    // (3) EX_WRREG_Z and WB1_WRREG_W and (EX_REGNUM_Z == WB1_REGNUM_W)
    // (4) EX_RDPR_X and WB1_WRPR_W
    // (5) EX_RDPR_Y and WB1_WRPR_W
    // (6) EX_WRPR_Z and WB1_WRPR_W
    // (7) (EX_ALUFUNC == `ALU_ADDR0) and WB1_WRREG_W and (WB1_REGNUM_W == 4'h0)


    always @(EX_RDREG_X  or EX_RDREG_Y or EX_WRREG_Z
          or EX_REGNUM_X or EX_REGNUM_Y or EX_REGNUM_Z  // Thorn Aitch 2003/12/10
          or WB1_WRREG_W or WB1_REGNUM_W
          or EX_RDPR_X   or EX_RDPR_Y  or EX_WRPR_Z
          or WB1_WRPR_W
       // or EX_RDMACH_X or EX_RDMACH_Y or WB1_WRMACH
       // or EX_RDMACL_X or EX_RDMACL_Y or WB1_WRMACL
          or EX_ALUFUNC)
    //always @(posedge CLK)
    begin
        if ((EX_RDREG_X & WB1_WRREG_W & (EX_REGNUM_X == WB1_REGNUM_W))
          | (EX_RDREG_Y & WB1_WRREG_W & (EX_REGNUM_Y == WB1_REGNUM_W))
          | (EX_WRREG_Z & WB1_WRREG_W & (EX_REGNUM_Z == WB1_REGNUM_W))
          | (EX_RDPR_X & WB1_WRPR_W)
          | (EX_RDPR_Y & WB1_WRPR_W)
          | (EX_WRPR_Z & WB1_WRPR_W)
       // | (EX_RDMACH_X & WB1_WRMACH)
       // | (EX_RDMACH_Y & WB1_WRMACH)
       // | (EX_RDMACL_X & WB1_WRMACL)
       // | (EX_RDMACL_Y & WB1_WRMACL)
          | ((EX_ALUFUNC == `ALU_ADDR0) & WB1_WRREG_W & (WB1_REGNUM_W == 4'h0)) 
           )
            REG_CONF <= 1;
        else
            REG_CONF <= 0;
    end

    //---------------------------
    // check forwarding condition
    //---------------------------
    // following conditions mean register forwarding from W-bus to X/Y-bus
    // (1) RDREG_X and WRREG_W and (REGNUM_X == REGNUM_W) : W-bus to X-bus
    // (2) RDREG_Y and WRREG_W and (REGNUM_Y == REGNUM_W) : W-bus to Y-bus
    // (3) RDPR_X and WRPR_W : W-bus to X-bus
    // (4) RDPR_Y and WRPR_W : W-bus to Y-bus
    // (5) RDMACH_X and WRMACH : W-bus to X-bus
    // (6) RDMACH_Y and WRMACH : W-bus to Y-bus
    // (7) RDMACL_X and WRMACL : W-bus to X-bus
    // (8) RDMACL_Y and WRMACL : W-bus to Y-bus
  
    reg  REG_FWD_X;     // register forward from W-bus to X-bus
    reg  REG_FWD_Y;     // register forward from W-bus to Y-bus

    always @(RDREG_X  or RDREG_Y 
          or REGNUM_X or REGNUM_Y 
          or WRREG_W or REGNUM_W
          or RDPR_X or RDPR_Y or WRPR_W
       // or RDMACH_X or RDMACH_Y or WRMACH
       // or RDMACL_X or RDMACL_Y or WRMACL
          or FWD_W2X)
    begin
        if ((FWD_W2X)
          | (RDREG_X & WRREG_W & (REGNUM_X == REGNUM_W))
          | (RDPR_X & WRPR_W)) 
       // | (RDMACH_X & WRMACH)
       // | (RDMACL_X & WRMACL)
            REG_FWD_X <= 1'b1;
        else
            REG_FWD_X <= 1'b0;

        if ((RDREG_Y & WRREG_W & (REGNUM_Y == REGNUM_W))
          | (RDPR_Y & WRPR_W))
       // | (RDMACH_Y & WRMACH)
       // | (RDMACL_Y & WRMACL)
            REG_FWD_Y <= 1'b1;
        else
            REG_FWD_Y <= 1'b0;
    end

//------------------------------------
// Output Signals : A huge truth table
//------------------------------------
    always @(INSTR_STATE or INSTR_SEQ or T_BCC or NEXT_ID_STALL)
    begin
        // ---- CAUTION ----------------------------------------------------------------
        // To simplify the RTL description rule, 
        // only non-blocking substitution (<=) is recommended for this project.
        // But in this "always @" statement, 
        // I use blocking substitution (=) to reduce typing errors. 
        // You should take care when you modify or reuse this statement.
        //
        // Moreover, in this scope area, I use casex to specify "don't care input ?".
	    // But the use of casex is permitted only for this truth table.
        //------------------------------------------------------------------------------

	   //===============
        // default values
	   //===============
        DISPATCH = 0;
        {ID_IF_ISSUE,ID_IF_JP} =  2'b00;
        {EX_IF_ISSUE,EX_IF_JP} =  2'b00;
        {EX_RDREG_X, EX_RDREG_Y, EX_WRREG_Z, WB_WRREG_W } =  4'b0000;
        // {EX_REGNUM_X,EX_REGNUM_Y,EX_REGNUM_Z,WB_REGNUM_W} = 16'hxxxx; // Thorn Aitch 2003/12/10
	   {EX_REGNUM_X,EX_REGNUM_Y,EX_REGNUM_Z,WB_REGNUM_W} = 16'h0000;    // Thorn Aitch 2003/12/10
        {EX_ALUFUNC}  = `ALU_NOP;
        {EX_MULCOM1, EX_MULCOM2}   = 9'b000000000;
        {WB_MULCOM1, WB_MULCOM2}   = 9'b000000000;
        {EX_MACSEL1,EX_MACSEL2}   =  4'b0000;
        {WB_MACSEL1,WB_MACSEL2}   =  4'b0000;
        {EX_WRMACH,EX_WRMACL}     =  2'b00;
        {WB_WRMACH,WB_WRMACL}     =  2'b00;
        {EX_RDMACH_X,EX_RDMACL_X} = 2'b00; 
        {EX_RDMACH_Y,EX_RDMACL_Y} = 2'b00;
        {WB_MAC_BUSY, EX_MAC_BUSY, MAC_STALL_SENSE} = 3'b000;
        {EX_RDSR_X, EX_RDSR_Y, EX_WRSR_Z, WB_WRSR_W}     = 4'b0000;
        {MAC_S_LATCH} = 1'b0;
        {EX_RDGBR_X, EX_RDGBR_Y, EX_WRGBR_Z, WB_WRGBR_W} = 4'b0000;
        {EX_RDVBR_X, EX_RDVBR_Y, EX_WRVBR_Z, WB_WRVBR_W} = 4'b0000;
        {EX_RDPR_X, EX_RDPR_Y, EX_WRPR_Z, WB_WRPR_W, EX_WRPR_PC} = 5'b00000;
        // {EX_MA_ISSUE,EX_MA_WR,EX_MA_SZ,EX_KEEP_CYC} =  5'b0xxxx; // Thorn Aitch 2003/12/10
	   {EX_MA_ISSUE,EX_MA_WR,EX_MA_SZ,EX_KEEP_CYC} =  5'b00000;    // Thorn Aitch 2003/12/10
        {EX_WRMAAD_Z,EX_WRMADW_X,EX_WRMADW_Y,WB_RDMADR_W} = 4'b0000;    
        {EX_RDPC_X,EX_RDPC_Y,EX_WRPC_Z,ID_INCPC} = 4'b0000;
        {ID_IFADSEL, EX_IFADSEL}                 = 2'b00;
        {EX_CONST_ZERO4,EX_CONST_ZERO42,EX_CONST_ZERO44} = 3'b000;
        {EX_CONST_ZERO8,EX_CONST_ZERO82,EX_CONST_ZERO84} = 3'b000;
        {EX_CONST_SIGN8,EX_CONST_SIGN82,EX_CONST_SIGN122} = 3'b000;
        {EX_RDCONST_X,EX_RDCONST_Y} = 2'b00;
        // {EX_CMPCOM}  = 3'bxxx;  // Thorn Aitch 2003/12/10
	   {EX_CMPCOM}  = 3'b000;     // Thorn Aitch 2003/12/10
        // {EX_SFTFUNC} = 5'bxxxx; // Thorn Aitch 2003/12/10
	   {EX_SFTFUNC} = 5'b0000;    // Thorn Aitch 2003/12/10
        {EX_RDSFT_Z} = 1'b0;
        {EX_T_CMPSET, EX_T_CRYSET, EX_T_TSTSET, EX_T_SFTSET} = 4'b0000;
        {EX_QT_DV1SET, EX_MQT_DV0SET} = 2'b00;
        {EX_T_CLR, EX_T_SET, EX_MQ_CLR} = 3'b000;
        {EX_RDTEMP_X, EX_WRTEMP_Z, EX_WRMAAD_TEMP} = 3'b000;
        {EX_FWD_W2X} = 1'b0;
        {EVENT_ACK_0, RST_SR, ILEVEL_CAP, WR_IBIT} = 4'b0000;
        {MASKINT_NEXT} = 1'b0;
        {SLP} = 1'b0;
        {DELAY_JUMP} = 1'b0;

        //============================================
        // Line 0xxx
        //============================================
        casex (INSTR_STATE[15:12])
          4'b0000 : // 0xxx
        //------------------
        // STC SR,  Rn (0n02)
        // STC GBR, Rn (0n12)
        // STC VBR, Rn (0n22)
        //------------------
            casex (INSTR_STATE[3:0])
              4'b0010 : // 0xx2
                begin
                  casex (INSTR_STATE[5:4])
                    2'b00   : EX_RDSR_Y  = 1'b1;
                    2'b01   : EX_RDGBR_Y = 1'b1;
                    2'b1?   : EX_RDVBR_Y = 1'b1;
                    default : ;
                  endcase
                  EX_ALUFUNC = `ALU_THRUY;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  EX_WRREG_Z = 1'b1;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //---------------
        // BSRF Rm (0m03)
        // BRAF Rm (0m23) 
        //---------------
              4'b0011 : // 0xx3 
                begin
                  case (INSTR_SEQ)
                    0: begin                 
                         EX_RDPC_X = 1'b1;
                         EX_RDREG_Y = 1'b1;
                         EX_REGNUM_Y = INSTR_STATE[11:8];
                         EX_ALUFUNC = `ALU_ADD;
                         EX_WRPC_Z = 1'b1;
                         if (~INSTR_STATE[5]) EX_WRPR_PC = 1; // BSRF operation
                         ID_INCPC = 1'b1;
                       end
                    1: begin
                         ID_IF_ISSUE = 1'b1;
                         ID_IFADSEL = 1'b1;
                         ID_IF_JP = 1'b1;
                         DISPATCH = 1'b1;
                         DELAY_JUMP = 1'b1;
                       end
                    default : ;
                  endcase
                end
        //---------------------------
        // MUL.L Rm, Rn        (0nm7)
        //---------------------------
              4'b01?? : // 0xx4, 0xx5, 0xx6, 0xx7  
                begin 
                  if (INSTR_STATE[1:0] == 2'b11) // 0xx7
                    begin
                      MAC_STALL_SENSE = 1'b1;
                      EX_MAC_BUSY = (NEXT_ID_STALL)? 1'b0:1'b1;
                      EX_RDREG_X = 1'b1;
                      EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                      EX_RDREG_Y = 1'b1;
                      EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                      EX_MACSEL1 = 2'b00; // XBUS -> MACIN1
                      EX_MACSEL2 = 2'b00; // YBUS -> MACIN2
                      EX_MULCOM1 = 1'b1;
                      EX_MULCOM2 = {1'b1, INSTR_STATE[14:12], INSTR_STATE[3:0]};
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end              
        //---------------------------
        // MOV.B Rm, @(R0, Rn) (0nm4)
        // MOV.W Rm, @(R0, Rn) (0nm5)
        // MOV.L Rm, @(R0, Rn) (0nm6)
        //---------------------------
                  else // 0xx4, 0xx5, 0xx6
                    begin
                      EX_RDREG_X = 1'b1;
                      EX_REGNUM_X = INSTR_STATE[11:8]; //Rn
                      EX_ALUFUNC = `ALU_ADDR0; //@(R0, Rn)
                      EX_WRMAAD_Z = 1'b1;
                      EX_RDREG_Y = 1'b1;
                      EX_REGNUM_Y = INSTR_STATE[7:4];  //Rm
                      EX_WRMADW_Y = 1'b1;
                      {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                      EX_MA_SZ = INSTR_STATE[1:0];
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
                  end
        //--------------
        // CLRT   (0008)
        // SETT   (0018)
        // CLRMAC (0028)
        //--------------
              4'b1000 : // 0xx8
                begin
                  casex (INSTR_STATE[5:4])
                    2'b00   : EX_T_CLR = 1'b1;
                    2'b01   : EX_T_SET = 1'b1;
                    2'b1?   : {EX_WRMACH, EX_WRMACL, MAC_STALL_SENSE} = 3'b111;
                    default : ;
                  endcase
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //---------------
        // NOP (0009)
        //---------------
              4'b1001 : // 0xx9
                begin
                  if(INSTR_STATE[5:4] == 2'b00) //(don't care INSTR_STATE[11:6])
                    begin // ID
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
        //---------------
        // DIV0U (0019)
        //---------------
                  else if (INSTR_STATE[5:4] == 2'b01) //(don't care INSTR_STATE[11:6])
                    begin
                      EX_T_CLR = 1'b1;
                      EX_MQ_CLR = 1'b1;
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
        //---------------
        // MOVT Rn (0n29)
        //---------------
                  else
                    begin
                      if (T_BCC) EX_ALUFUNC = `ALU_INCX; // if T=1 then 1->Rn else 0->Rn
                      EX_WRREG_Z = 1'b1;
                      EX_REGNUM_Z = INSTR_STATE[11:8];
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
                end
        //--------------------
        // STS MACH, Rn (0n0A)
        // STS MACL, Rn (0n1A)
        // STS PR  , Rn (0n2A) 
        //--------------------
              4'b1010 : // 0xxA
                begin
                  casex (INSTR_STATE[5:4])
                    2'b00   : // don't care INSTR_STATE[7:6]
                              {EX_RDMACH_Y, MAC_STALL_SENSE} = 2'b11; 
                    2'b01   : // don't care INSTR_STATE[7:6]
                              {EX_RDMACL_Y, MAC_STALL_SENSE} = 2'b11;
                    2'b1?   : EX_RDPR_Y = 1'b1;   // don't care INSTR_STATE[7:6],[4]
                    default : ;
                  endcase
                  EX_ALUFUNC = `ALU_THRUY;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  EX_WRREG_Z = 1'b1;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-----------
        // RTS (000B)
        //-----------
              4'b1011 : // 0xxB
                begin
                  if(INSTR_STATE[5:4] == 2'b00) // 000B (don't care INSTR_STATE[11:6])
                    case (INSTR_SEQ)
                      0: begin
                           EX_RDPR_Y = 1'b1;
                           EX_ALUFUNC = `ALU_THRUY;
                           EX_WRPC_Z = 1'b1;
                         end
                      1: begin
                           ID_IF_ISSUE = 1'b1;
                           ID_IFADSEL = 1'b1;
                           ID_IF_JP = 1'b1;
                           DISPATCH = 1'b1;
                           DELAY_JUMP = 1'b1;
                         end
                      default : ;
                    endcase
        //-----------
        // RTE (002B)
        //-----------  
                  else if(INSTR_STATE[5:4] == 2'b10) // 002B (don't care INSTR_STATE[11:6])
                    case (INSTR_SEQ)
                      0: begin
                           EX_RDREG_X = 1'b1;
                           EX_REGNUM_X = 4'hF;
                           EX_ALUFUNC = `ALU_INCX4;
                           EX_WRREG_Z = 1'b1;
                           EX_REGNUM_Z = 4'hF;
                           EX_WRMAAD_Z = 0; // MAAD = XBUS
                           {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                           EX_MA_SZ = 2'b10;
                           WB_RDMADR_W = 1'b1;
                           ID_INCPC = 1'b1;
                         end
                      1: begin
                           EX_RDREG_X = 1'b1;
                           EX_REGNUM_X = 4'hF;
                           EX_ALUFUNC = `ALU_INCX4;
                           EX_WRREG_Z = 1'b1;
                           EX_REGNUM_Z = 4'hF;
                           EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                           {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                           EX_MA_SZ = 2'b10;
                           WB_RDMADR_W = 1'b1;
                           WB_WRSR_W = 1'b1;
                         end
                      2: begin
                           EX_ALUFUNC = `ALU_THRUW;
                           EX_WRPC_Z = 1'b1;
                         end
                      3: begin
                           ID_IF_ISSUE = 1'b1;
                           ID_IFADSEL = 1'b1;
                           ID_IF_JP = 1'b1;
                           DISPATCH = 1'b1;
                           DELAY_JUMP = 1'b1;
                         end
                      default : ;
                    endcase
        //-------------
        // SLEEP (001B)
        //-------------  
                  else // 001B
                    case (INSTR_SEQ)
                      0: begin
                         end
                      1: begin
                           SLP = 1'b1;
                         end
                      2: begin
                         end
                      3: begin
                           ID_INCPC = 1'b1;
                           ID_IF_ISSUE = 1'b1;
                           DISPATCH = 1'b1;
                         end
                    endcase
                end
        //------------------------
        // MAC.L @Rm+, @Rn+ (0nmF)
        //------------------------
              4'b11?? : // 0xxC, 0xxD, 0xxE, 0xxF
                begin
                  if (INSTR_STATE[1:0] == 2'b11)
                    case (INSTR_SEQ)
                      0: begin
                           EX_RDREG_X = 1'b1;
                           EX_REGNUM_X = INSTR_STATE[11:8]; //@Rn+
                           EX_ALUFUNC = `ALU_INCX4;
                           EX_WRREG_Z = 1'b1;
                           EX_REGNUM_Z = INSTR_STATE[11:8]; //@Rn+
                           EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                           {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                           EX_MA_SZ = 2'b10;
                           WB_RDMADR_W = 1'b1;
                           WB_MACSEL1 = 2'b10; // WBUS -> MACIN1
                           WB_MULCOM1 = 1'b1;
                         end
                      1: begin
                           WB_MAC_BUSY = 1'b1;
                           MAC_S_LATCH = 1'b1;
                           EX_RDREG_X = 1'b1;
                           EX_REGNUM_X = INSTR_STATE[7:4]; //@Rm+
                           EX_ALUFUNC = `ALU_INCX4;
                           EX_WRREG_Z = 1'b1;
                           EX_REGNUM_Z = INSTR_STATE[7:4]; //@Rm+
                           EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                           {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                           EX_MA_SZ = 2'b10;
                           WB_RDMADR_W = 1'b1;
                           WB_MACSEL2 = 2'b10; // WBUS -> MACIN2
                           WB_MULCOM2 = {1'b1, INSTR_STATE[14:12], INSTR_STATE[3:0]};
                           ID_INCPC = 1'b1;
                           ID_IF_ISSUE = 1'b1;
                           DISPATCH = 1'b1;
                         end
                      default : ;
                    endcase
        //------------------------------
        // MOV.B    @(R0, Rm), Rn (0nmC)
        // MOV.W    @(R0, Rm), Rn (0nmD)
        // MOV.L    @(R0, Rm), Rn (0nmE)
        //------------------------------
                  else
                    begin
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[7:4]; //Rm
                       EX_ALUFUNC = `ALU_ADDR0; //@(R0, Rm)
                       EX_WRMAAD_Z = 1'b1;
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = INSTR_STATE[1:0];
                       WB_RDMADR_W = 1'b1;
                       WB_WRREG_W = 1'b1;
                       WB_REGNUM_W = INSTR_STATE[11:8]; //Rn
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                    end
                end
        //---------------
        // Default = NOP
        //---------------
              default :
                begin
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
            endcase
        //============================================
        // Line 1xxx
        //============================================
        //-----------------------------
        // MOV.L Rm, @(disp, Rn) (1nmd)
        //-----------------------------               
          4'b0001 : // 1xxx
            begin              
                EX_RDREG_X = 1'b1;
                EX_REGNUM_X = INSTR_STATE[11:8]; //Rn
                EX_CONST_ZERO44 = 1'b1;
                EX_ALUFUNC = `ALU_ADDCN; //@(disp, Rn)
                EX_WRMAAD_Z = 1'b1;
                EX_RDREG_Y = 1'b1;
                EX_REGNUM_Y = INSTR_STATE[7:4];  //Rm
                EX_WRMADW_Y = 1'b1;
                {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                EX_MA_SZ = 2'b10;
                ID_INCPC = 1'b1;
                ID_IF_ISSUE = 1'b1;
                DISPATCH = 1'b1;
            end                                       
        //============================================
        // Line 2xxx
        //============================================
          4'b0010 : // 2xxx
            casex (INSTR_STATE[3:0])
        //-----------------------------------
        // MOV.L/W/B Rm, @Rn (2nm2/2nm1/2nm0)
        //-----------------------------------
              4'b00?? : // 2xx0, 2xx1, 2xx2 (don't care 2xx3)
                begin              
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; //@Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; //Rm
                  EX_WRMADW_Y = 1'b1;
                  EX_ALUFUNC = `ALU_THRUX;
                  EX_WRMAAD_Z = 1'b1;
                  {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                  EX_MA_SZ = INSTR_STATE[1:0];
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------------------------------
        // MOV.L/W/B Rm, @-Rn (2nm6/2nm5/2nm4)
        // DIV0S              (2nm7)
        //------------------------------------
              4'b01?? : // 2xx4, 2xx5, 2xx6, 2xx7
                begin
                  if (INSTR_STATE[1:0] == 2'b11) // 2xx7
                    begin
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[11:8]; //Rn
                       EX_RDREG_Y = 1'b1;
                       EX_REGNUM_Y = INSTR_STATE[7:4]; //Rm
                       EX_MQT_DV0SET = 1'b1;
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                    end
                  else // 2xx4, 2xx5, 2xx6
                    begin              
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[11:8]; //@Rn
                       case (INSTR_STATE[1:0])
                           2'b00   : EX_ALUFUNC = `ALU_DECX;
                           2'b01   : EX_ALUFUNC = `ALU_DECX2;
                           2'b10   : EX_ALUFUNC = `ALU_DECX4;
                           default : EX_ALUFUNC = `ALU_NOP;
                       endcase
                       EX_WRREG_Z = 1'b1;
                       EX_REGNUM_Z = INSTR_STATE[11:8]; // @-Rn
                       EX_WRMAAD_Z = 1'b1;
                       EX_RDREG_Y = 1'b1;
                       EX_REGNUM_Y = INSTR_STATE[7:4]; //Rm
                       EX_WRMADW_Y = 1'b1;
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                       EX_MA_SZ = INSTR_STATE[1:0];
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                    end
                end
        //------------------
        // TST Rm, Rn (2nm8)
        // AND Rm, Rn (2nm9)
        // XOR Rm, Rn (2nmA)
        // OR  Rm, Rn (2nmB)
        //------------------
              4'b10?? : // 2xx8, 2xx9, 2xxA, 2xxB
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  case (INSTR_STATE[1:0])
                      2'b00   : {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_AND, 1'b0, 1'b1};
                      2'b01   : {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_AND, 1'b1, 1'b0};
                      2'b10   : {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_XOR, 1'b1, 1'b0};
                      2'b11   : {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_OR , 1'b1, 1'b0};
                      default : ;
                  endcase
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //----------------------
        // CMP/STR Rm, Rn (2nmC)
        //----------------------
              4'b1100 : // 2xxC
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  EX_CMPCOM = INSTR_STATE[2:0];
                  EX_T_CMPSET = 1'b1;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //--------------------
        // XTRCT Rm, Rn (2nmD)
        //--------------------
              4'b1101 : // 2xxD
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  EX_ALUFUNC = `ALU_XTRCT;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-----------------------------
        // MULU/S.W Rm, Rn (2nmE/2nmF)
        //-----------------------------
              4'b111? : // 2nmE/2nmF
                begin
                  MAC_STALL_SENSE = 1'b1;
                  EX_MAC_BUSY = (NEXT_ID_STALL)? 1'b0:1'b1;
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  EX_MACSEL1 = 2'b00; // XBUS -> MACIN1
                  EX_MACSEL2 = 2'b00; // YBUS -> MACIN2
                  EX_MULCOM1 = 1'b1;
                  EX_MULCOM2 = {1'b1, INSTR_STATE[14:12], INSTR_STATE[3:0]};
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //---------------
        // Default = NOP
        //---------------
              default :
                begin
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
            endcase
        //============================================
        // Line 3xxx
        //============================================ 
          4'b0011 : // 3xxx
            casex (INSTR_STATE[3:0])
        //--------------------------------------------------------------
        // CMP/xx Rm, Rn (EQ, HS, GE, HI, GT) (3nm0/3nm2/3nm3/3nm6/3nm7)
        //--------------------------------------------------------------
              4'b0000 : // 3xx0 
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  EX_CMPCOM = INSTR_STATE[2:0];
                  EX_T_CMPSET = 1'b1;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
              4'b0?1? : // 3xx2, 3xx3, 3xx6, 3xx7 
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  EX_CMPCOM = INSTR_STATE[2:0];
                  EX_T_CMPSET = 1'b1;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------
        // DIV1 (3nm4)
        //------------
              4'b0100 : // 3nm4
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm

                  EX_SFTFUNC = `ROTCL;
                  EX_ALUFUNC = `ALU_DIV;

                  EX_QT_DV1SET = 1'b1;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-----------------------------
        // DMULU/S.L Rm, Rn (3nm5/3nmD)
        //-----------------------------
              4'b?101 : // 3nm5/3nmD
                begin
                  MAC_STALL_SENSE = 1'b1;
                  EX_MAC_BUSY = (NEXT_ID_STALL)? 1'b0:1'b1;
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  EX_MACSEL1 = 2'b00; // XBUS -> MACIN1
                  EX_MACSEL2 = 2'b00; // YBUS -> MACIN2
                  EX_MULCOM1 = 1'b1;
                  EX_MULCOM2 = {1'b1, INSTR_STATE[14:12], INSTR_STATE[3:0]};
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------------
        // SUB Rm, Rn (3nm8)
        // ADD Rm, Rn (3nmC)
        //------------------
              4'b1?00 : // 3xx8, 3xxC
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  case (INSTR_STATE[2])
                      1'b0 : EX_ALUFUNC = `ALU_SUB;
                      1'b1 : EX_ALUFUNC = `ALU_ADD;
                      default : ;
                  endcase
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-------------------
        // SUBC Rm, Rn (3nmA)
        // SUBV Rm, Rn (3nmB)
        // ADDC Rm, Rn (3nmE)
        // ADDV Rm, Rn (3nmF)
        //-------------------
              4'b1?1? : // 3xxA, 3xxB, 3xxE, 3xxF
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  case ({INSTR_STATE[2], INSTR_STATE[0]})
                      2'b00 : EX_ALUFUNC = `ALU_SUBC;
                      2'b01 : EX_ALUFUNC = `ALU_SUBV;    
                      2'b10 : EX_ALUFUNC = `ALU_ADDC;
                      2'b11 : EX_ALUFUNC = `ALU_ADDV;
                      default : ;
                  endcase
                  EX_T_CRYSET = 1'b1;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //---------------
        // Default = NOP
        //---------------
              default :
                begin
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
            endcase
        //============================================
        // Line 4xxx
        //============================================
          4'b0100 : // 4xxx
            casex (INSTR_STATE[5:0])
        //------------------------
        // SHLL   Rn (4n00) 000000
        // SHAL   Rn (4n20) 100000
        // SHLR   Rn (4n01) 000001
        // SHAR   Rn (4n21) 100001
        // ROTL   Rn (4n04) 000100
        // ROTCL  Rn (4n24) 100100
        // ROTR   Rn (4n05) 000101
        // ROTCR  Rn (4n25) 100101
        //------------------------
              6'b?00?0? :
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_SFTFUNC = {INSTR_STATE[5:2], INSTR_STATE[0]};
                  EX_T_SFTSET = 1'b1;
                  EX_RDSFT_Z = 1'b1;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end 
        //------------------------
        // SHLL2  Rn (4n08) 001000
        // SHLL8  Rn (4n18) 011000
        // SHLL16 Rn (4n28) 101000
        // SHLR2  Rn (4n09) 001001
        // SHLR8  Rn (4n19) 011001
        // SHLR16 Rn (4n29) 101001
        //------------------------
              6'b??100? :
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_SFTFUNC = {INSTR_STATE[5:2], INSTR_STATE[0]};
                  EX_RDSFT_Z = 1'b1;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-------------
        // DT Rn (4n10)
        //-------------
              6'b010000 : // 4x10 (don't care INSTR_STATE[7:6])
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_ALUFUNC = `ALU_DECX;
                  EX_T_TSTSET = 1'b1;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-------------------------------
        // CMP/xx Rn (PL, PZ) (4n15/4n11)
        //-------------------------------
              6'b010?01 : // 4x11, 4x15 (don't care INSTR_STATE[7:6])
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                  EX_CMPCOM = INSTR_STATE[2:0]; //Y-BUS is default zero
                  EX_T_CMPSET = 1'b1;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------------------
        // STS.L MACH, @-Rn (4n02)
        // STS.L MACL, @-Rn (4n12)
        // STS.L PR,   @-Rn (4n22)
        //------------------------
              6'b??0010 : // 4xx2 (don't care INSTR_STATE[7:6])
                begin             
                  casex (INSTR_STATE[5:4])
                    2'b00   : // don't care INSTR_STATE[7:6]
                              begin
                                {EX_RDMACH_Y, MAC_STALL_SENSE} = 2'b11;
                              end   
                    2'b01   : // don't care INSTR_STATE[7:6]
                              begin
                                {EX_RDMACL_Y, MAC_STALL_SENSE} = 2'b11;
                              end   
                    2'b1?   : EX_RDPR_Y = 1'b1;   // don't care INSTR_STATE[7:6],[4]
                    default : ;
                  endcase
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; //@Rn
                  EX_ALUFUNC = `ALU_DECX4;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // @-Rn
                  EX_WRMAAD_Z = 1'b1;
                  EX_WRMADW_Y = 1'b1;
                  {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                  EX_MA_SZ = 2'b10;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-----------------------
        // STC.L SR,  @-Rn (4n03)
        // STC.L GBR, @-Rn (4n13)
        // STC.L VBR, @-Rn (4n23)
        //-----------------------
              6'b??0011 : // 4xx3 (don't care INSTR_STATE[7:6])
                begin              
                  case (INSTR_SEQ)
                    0: begin
                         EX_RDREG_X = 1'b1;
                         EX_REGNUM_X = INSTR_STATE[11:8]; //@Rn
                         EX_ALUFUNC = `ALU_DECX4;
                         EX_WRREG_Z = 1'b1;
                         EX_REGNUM_Z = INSTR_STATE[11:8]; // @-Rn
                         EX_WRMAAD_Z = 1'b1;
                         casex (INSTR_STATE[5:4])
                           2'b00   : EX_RDSR_Y  = 1'b1;
                           2'b01   : EX_RDGBR_Y = 1'b1;
                           2'b1?   : EX_RDVBR_Y = 1'b1;
                           default : ;
                         endcase
                         EX_WRMADW_Y = 1'b1;
                         {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                         EX_MA_SZ = 2'b10;
                       end
                    1: begin
                         ID_INCPC = 1'b1;
                         ID_IF_ISSUE = 1'b1;
                         DISPATCH = 1'b1;
                       end
                    default: ;
                  endcase
                end
        //----------------------
        // LDS.L @Rm+, MACH (4m06)
        // LDS.L @Rm+, MACL (4m16)
        // LDS.L @Rm+, PR   (4m26)
        //----------------------
              6'b??0110 : // 4xx6 (don't care INSTR_STATE[7:6])
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[11:8]; //@Rm
                  EX_ALUFUNC = `ALU_INCX4;
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // @Rm+
                  EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                  {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                  EX_MA_SZ = 2'b10;
                  WB_RDMADR_W = 1'b1;
                  casex (INSTR_STATE[5:4])
                    2'b00   : begin
                                {WB_MACSEL1, WB_WRMACH, MAC_STALL_SENSE} = 4'b1011; // from WBUS
                                WB_MAC_BUSY = (NEXT_ID_STALL)? 1'b0:1'b1;
                              end
                    2'b01   : begin
                                {WB_MACSEL2, WB_WRMACL, MAC_STALL_SENSE} = 4'b1011; // from WBUS
                                WB_MAC_BUSY = (NEXT_ID_STALL)? 1'b0:1'b1;
                              end
                    2'b1?   : WB_WRPR_W = 1'b1; // don't care INSTR_STATE[7:6],[4]
                    default : ;
                  endcase
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //-----------------------
        // LDC.L @Rm+, SR  (4n07)
        // LDC.L @Rm+, GBR (4n17)
        // LDC.L @Rm+, VBR (4n27)
        //-----------------------
              6'b??0111 : // 4xx7 (don't care INSTR_STATE[7:6])
                begin              
                  case (INSTR_SEQ)
                    0: begin  // ID
                         EX_RDREG_X = 1'b1;
                         EX_REGNUM_X = INSTR_STATE[11:8]; //@Rm
                         EX_ALUFUNC = `ALU_INCX4;
                         EX_WRREG_Z = 1'b1;
                         EX_REGNUM_Z = INSTR_STATE[11:8]; // @-Rm
                         EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                         {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                         EX_MA_SZ = 2'b10;
                         WB_RDMADR_W = 1'b1;
                         casex (INSTR_STATE[5:4])
                           2'b00   : WB_WRSR_W  = 1'b1;
                           2'b01   : WB_WRGBR_W = 1'b1;
                           2'b1?   : WB_WRVBR_W = 1'b1;
                           default : ;
                         endcase
                       end
                    1: begin // EX
                       end
                    2: begin // MA
                         ID_INCPC = 1'b1;
                         ID_IF_ISSUE = 1'b1;
                         DISPATCH = 1'b1;
                         MASKINT_NEXT = 1'b1;
                       end
                    default: ;
                  endcase
                end
        //--------------------
        // LDS Rm, MACH (4m0A)
        // LDS Rm, MACL (4m1A)
        // LDS Rm, PR   (4m2A) 
        //--------------------
              6'b??1010 : // 4xxA
                begin
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rm
                  EX_RDREG_X = 1'b1;
                  EX_ALUFUNC = `ALU_THRUX;
                  casex (INSTR_STATE[5:4])
                    2'b00   : {EX_MACSEL1, EX_WRMACH, MAC_STALL_SENSE} = 4'b0111; // from ZBUS
                    2'b01   : {EX_MACSEL2, EX_WRMACL, MAC_STALL_SENSE} = 4'b0111; // from ZBUS
                    2'b1?   : EX_WRPR_Z = 1'b1; // don't care INSTR_STATE[7:6],[4]
                    default : ;
                  endcase
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------------------
        // JMP/JSR @Rm (4m2B/4m0B)
        //------------------------
              6'b?01011 : // 4x0B, 4x2B (don't care INSTR_STATE[7:6])
                case (INSTR_SEQ)
                  0: begin
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[11:8]; // Rm
                       EX_ALUFUNC = `ALU_THRUX;
                       EX_WRPC_Z = 1'b1;
                       if (INSTR_STATE[5] == 1'b0) EX_WRPR_PC = 1'b1; // JSR operation
                       ID_INCPC = 1'b1;
                     end
                  1: begin
                       ID_IF_ISSUE = 1'b1;
                       ID_IFADSEL = 1'b1;
                       ID_IF_JP = 1'b1;
                       DISPATCH = 1'b1;
                       DELAY_JUMP = 1'b1;
                     end
                  default : ;
                endcase
        //-----------------
        // TAS.B @Rn (4n1B)
        //-----------------
              6'b011011 : // 4x1B (don't care INSTR_STATE[7:6])
                case (INSTR_SEQ)
                  0: begin //ID
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
                       EX_ALUFUNC = `ALU_THRUX;
                       EX_WRTEMP_Z = 1'b1;
                       EX_WRMAAD_Z = 1'b1;
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = 2'b00;
                       EX_KEEP_CYC = 1'b1;
                       WB_RDMADR_W = 1'b1;
                     end
                  1: begin //EX ID
                     end
                  2: begin //MA -- ID
                       EX_FWD_W2X = 1'b1;
                       EX_ALUFUNC = `ALU_TAS;
                       EX_T_TSTSET = 1'b1;
                       EX_WRMAAD_TEMP = 1'b1;
                       // WRMADW = ZBUS (default path)
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                       EX_MA_SZ = 2'b00;
                     end
                  3: begin //WB -- EX  ID 
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                     end
                  default : ;
                endcase
        //-------------------
        // LDC Rm, SR  (4m0E)
        // LDC Rm, GBR (4m1E)
        // LDC Rm, VBR (4m2E)
        //-------------------
              6'b??1110 : // 4xxE
                begin
                  EX_REGNUM_X = INSTR_STATE[11:8]; // Rm
                  EX_RDREG_X = 1'b1;
                  EX_ALUFUNC = `ALU_THRUX;
                  casex (INSTR_STATE[5:4])
                    2'b00   : EX_WRSR_Z = 1'b1;
                    2'b01   : EX_WRGBR_Z = 1'b1;
                    2'b1?   : EX_WRVBR_Z = 1'b1;
                    default : ;
                  endcase
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                  MASKINT_NEXT = 1'b1;
                end
        //------------------------
        // MAC.W @Rm+, @Rn+ (4nmF)
        //------------------------
              6'b??1111 : // 4xxF
                case (INSTR_SEQ)
                  0: begin
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[11:8]; //@Rn+
                       EX_ALUFUNC = `ALU_INCX2;
                       EX_WRREG_Z = 1'b1;
                       EX_REGNUM_Z = INSTR_STATE[11:8]; //@Rn+
                       EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = 2'b01;
                       WB_RDMADR_W = 1'b1;
                       WB_MACSEL1 = 2'b10; // WBUS -> MACIN1
                       WB_MULCOM1 = 1'b1;
                     end
                  1: begin
                       WB_MAC_BUSY = 1'b1;
                       MAC_S_LATCH = 1'b1;
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[7:4]; //@Rm+
                       EX_ALUFUNC = `ALU_INCX2;
                       EX_WRREG_Z = 1'b1;
                       EX_REGNUM_Z = INSTR_STATE[7:4]; //@Rm+
                       EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = 2'b01;
                       WB_RDMADR_W = 1'b1;
                       WB_MACSEL2 = 2'b10; // WBUS -> MACIN2
                       WB_MULCOM2 = {1'b1, INSTR_STATE[14:12], INSTR_STATE[3:0]};
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                     end
                  default : ;
                endcase
        //---------------
        // Default = NOP
        //---------------
              default :
                begin
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
            endcase
        //============================================
        // Line 5xxx
        //============================================
        //-----------------------------
        // MOV.L @(disp, Rm), Rn (5nmd)
        //-----------------------------               
          4'b0101 : // 5xxx
                    begin
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[7:4]; //Rm
                       EX_CONST_ZERO44 = 1'b1;
                       EX_ALUFUNC = `ALU_ADDCN; //@(disp, Rm)
                       EX_WRMAAD_Z = 1'b1;
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = 2'b10;
                       WB_RDMADR_W = 1'b1;
                       WB_WRREG_W = 1'b1;
                       WB_REGNUM_W = INSTR_STATE[11:8]; //Rn
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                    end
        //============================================
        // Line 6xxx
        //============================================
          4'b0110 : // 6xxx
            casex (INSTR_STATE[3:0])
              4'b00?? : // 6xx0, 6xx1, 6xx2, 6xx3
                begin
        //------------------
        // MOV Rm, Rn (6nm3)
        //------------------
                  if (INSTR_STATE[1:0] == 2'b11) // 6xx3 
                    begin
                      EX_RDREG_Y = 1'b1;
                      EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                      EX_ALUFUNC = `ALU_THRUY;
                      EX_WRREG_Z = 1'b1;
                      EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end 
        //-----------------------------------
        // MOV.L/W/B @Rm, Rn (6nm2/6nm1/6nm0)
        //-----------------------------------
                  else // 6xx0, 6xx1, 6xx2 
                    begin
                       EX_RDREG_Y = 1'b1;
                       EX_REGNUM_Y = INSTR_STATE[7:4]; //@Rm
                       EX_ALUFUNC = `ALU_THRUY;
                       EX_WRMAAD_Z = 1'b1;
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = INSTR_STATE[1:0];
                       WB_RDMADR_W = 1'b1;
                       WB_WRREG_W = 1'b1;
                       WB_REGNUM_W = INSTR_STATE[11:8]; //Rn
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                    end
                end
        //------------------
        // NOT Rm, Rn (6nm7)
        //------------------
              4'b01?? : // 6xx4, 6xx5, 6xx6, 6xx7
                begin
                  if (INSTR_STATE[1:0] == 2'b11) // 6xx7
                    begin
                      EX_RDREG_Y = 1'b1;
                      EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                      EX_ALUFUNC = `ALU_NOT;
                      EX_WRREG_Z = 1'b1;
                      EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
        //-----------------------------------
        // MOV.L/W/B @Rm+, Rn (6nm6/6nm5/6nm4)
        //-----------------------------------
                  else // 6xx4, 6xx5, 6xx6 
                    begin
                       EX_RDREG_X = 1'b1;
                       EX_REGNUM_X = INSTR_STATE[7:4]; //@Rm
                       case (INSTR_STATE[1:0])
                           2'b00   : EX_ALUFUNC = `ALU_INCX;
                           2'b01   : EX_ALUFUNC = `ALU_INCX2;
                           2'b10   : EX_ALUFUNC = `ALU_INCX4;
                           default : EX_ALUFUNC = `ALU_NOP;
                       endcase
                       EX_WRREG_Z = 1'b1;
                       EX_REGNUM_Z = INSTR_STATE[7:4]; // @Rm+
                       EX_WRMAAD_Z = 1'b0; // MAAD = XBUS
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = INSTR_STATE[1:0];
                       WB_RDMADR_W = 1'b1;
                       WB_WRREG_W = 1'b1;
                       WB_REGNUM_W = INSTR_STATE[11:8]; //Rn
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                    end
                end
        //---------------------
        // SWAP.B Rm, Rn (6nm8)
        // SWAP.W Rm, Rn (6nm9)
        //---------------------
              4'b100? : // 6xx8, 6xx9
                begin
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  case (INSTR_STATE[0])
                      1'b0 : EX_ALUFUNC = `ALU_SWAPB;
                      1'b1 : EX_ALUFUNC = `ALU_SWAPW;
                      default : ;
                  endcase
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //---------------------
        // NEGC Rm, Rn (6nmA)
        // NEG  Rm, Rn (6nmB)
        //---------------------
              4'b101? : // 6xxA, 6xxB
                begin
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  case (INSTR_STATE[0])
                      1'b0 : EX_ALUFUNC = `ALU_SUBC;
                      1'b1 : EX_ALUFUNC = `ALU_SUB;
                      default : ;
                  endcase
                  case (INSTR_STATE[0])
                      1'b0 : EX_T_CRYSET = 1'b1;
                      1'b1 : EX_T_CRYSET = 1'b0;
                      default : ;
                  endcase
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //---------------------
        // EXTU.B Rm, Rn (6nmC)
        // EXTU.W Rm, Rn (6nmD)
        // EXTS.B Rm, Rn (6nmE)
        // EXTS.W Rm, Rn (6nmF)
        //---------------------
              4'b11?? : // 6xxC, 6xxD, 6xxE, 6xxF
                begin
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = INSTR_STATE[7:4]; // Rm
                  case (INSTR_STATE[1:0])
                      2'b00 : EX_ALUFUNC = `ALU_EXTUB;
                      2'b01 : EX_ALUFUNC = `ALU_EXTUW;
                      2'b10 : EX_ALUFUNC = `ALU_EXTSB;
                      2'b11 : EX_ALUFUNC = `ALU_EXTSW;
                      default : ;
                  endcase
                  EX_WRREG_Z = 1'b1;
                  EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //---------------
        // Default = NOP
        //---------------
              default :
                begin
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
            endcase
        //============================================
        // Line 7xxx
        //============================================  
        //---------------------
        // ADD #imm8, Rn (7nii)
        //---------------------
          4'b0111 : // 7xxx
            begin
              EX_RDREG_X = 1'b1;
              EX_REGNUM_X = INSTR_STATE[11:8]; // Rn
              EX_CONST_SIGN8 = 1'b1;
              EX_RDCONST_Y = 1'b1;
              EX_ALUFUNC = `ALU_ADD;
              EX_WRREG_Z = 1'b1;
              EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
              ID_INCPC = 1'b1;
              ID_IF_ISSUE = 1'b1;
              DISPATCH = 1'b1;
            end
        //============================================
        // Line 8xxx
        //============================================
          4'b1000 : // 8xxx
            casex (INSTR_STATE[11:8])
        //-----------------------------
        // MOV.B R0, @(disp, Rn) (80nd)
        // MOV.W R0, @(disp, Rn) (81nd)
        //-----------------------------
              4'b000? : // 80xx, 81xx
                begin   
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[7:4]; //Rn
                  if (INSTR_STATE[8])
                      EX_CONST_ZERO42 = 1'b1; //.W
                  else
                      EX_CONST_ZERO4  = 1'b1; //.B
                  EX_ALUFUNC = `ALU_ADDCN; //@(disp, Rn)
                  EX_WRMAAD_Z = 1'b1;
                  EX_RDREG_Y = 1'b1;
                  EX_REGNUM_Y = 4'h0;  //R0
                  EX_WRMADW_Y = 1'b1;
                  {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                  EX_MA_SZ = INSTR_STATE[9:8];
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end 
        //-----------------------------
        // MOV.B @(disp, Rm), R0 (84md)
        // MOV.W @(disp, Rm), R0 (85md)
        //-----------------------------
              4'b010? : // 84xx, 85xx
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = INSTR_STATE[7:4]; //Rm
                  if (INSTR_STATE[8])
                      EX_CONST_ZERO42 = 1'b1; //.W
                  else
                      EX_CONST_ZERO4  = 1'b1; //.B
                  EX_ALUFUNC = `ALU_ADDCN; //@(disp, Rm)
                  EX_WRMAAD_Z = 1'b1;
                  {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                  EX_MA_SZ = INSTR_STATE[9:8];
                  WB_RDMADR_W = 1'b1;
                  WB_WRREG_W = 1'b1;
                  WB_REGNUM_W = 4'h0; //R0
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------------------
        // CMP/EQ #imm8, R0 (88ii)
        //------------------------
              4'b1000 : // 88xx
                begin               
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = 4'b0000; // R0
                  EX_CONST_SIGN8 = 1'b1;
                  EX_RDCONST_Y = 1'b1;
                  EX_CMPCOM = 3'b000; //equal command
                  EX_T_CMPSET = 1'b1;
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------------------
        // BT/BF disp8 (89dd/8Bdd)
        //------------------------
              4'b10?1 : // 89xx, 8Bxx
                case (INSTR_SEQ)
                  0: begin               
                       ID_INCPC = 1'b1;   
                       ID_IF_ISSUE = 1'b1;              
                       EX_RDPC_X = 1'b1;
                       EX_CONST_SIGN82 = 1'b1;
                       EX_RDCONST_Y = 1'b1;
                       EX_ALUFUNC = `ALU_ADD;
                       if (INSTR_STATE[9] == T_BCC) // if not taken (same as NOP)
                         DISPATCH = 1'b1;
                       else // if taken
                         EX_WRPC_Z = 1'b1;
                     end
                  1: begin
                       ID_IF_ISSUE = 1'b1;
                       ID_IFADSEL = 1'b1;
                       ID_IF_JP = 1'b1;
                     end
                  2: begin 
                       ID_INCPC = 1'b1;
                       ID_IF_ISSUE = 1'b1;
                       DISPATCH = 1'b1;
                     end
                  default: ;
                endcase
        //------------------
        // BT/S disp8 (8Ddd)
        // BF/S disp8 (8Fdd)
        //------------------
              4'b11?1 : // 8Dxx, 8Fxx
                case (INSTR_SEQ)
                  0: begin         
                       ID_INCPC = 1'b1;
                       EX_RDPC_X = 1'b1;
                       EX_CONST_SIGN82 = 1'b1;
                       EX_RDCONST_Y = 1'b1;
                       EX_ALUFUNC = `ALU_ADD;
                       if (INSTR_STATE[9] == T_BCC) // if not taken (same as NOP)
                         begin              
                           ID_IF_ISSUE = 1'b1;
                           DISPATCH = 1'b1;
                         end
                       else // if taken
                         EX_WRPC_Z = 1'b1;
                     end
                  1: begin
                       ID_IF_ISSUE = 1'b1;
                       ID_IFADSEL = 1'b1;
                       ID_IF_JP = 1'b1;
                       DISPATCH = 1'b1;
                       DELAY_JUMP = 1'b1;
                     end
                  default : ;
                endcase
        //---------------
        // Default = NOP
        //---------------
              default :
                begin
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
            endcase
        //============================================
        // Line 9xxx
        //============================================
        //------------------------------
        // MOV.W @(disp8, PC), Rn (9ndd)
        //------------------------------
          4'b1001 : // 9xxx
            begin               
              EX_RDPC_X = 1;
              EX_CONST_ZERO82 = 1'b1;
              EX_RDCONST_Y = 1'b1;
              EX_ALUFUNC = `ALU_ADD;
              EX_WRMAAD_Z = 1'b1;
              {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
              EX_MA_SZ = 2'b01;
              WB_RDMADR_W = 1'b1;
              WB_WRREG_W = 1'b1;
              WB_REGNUM_W = INSTR_STATE[11:8]; // Rn
              ID_INCPC = 1'b1;
              ID_IF_ISSUE = 1'b1;
              DISPATCH = 1'b1;
            end
        //============================================
        // Line Axxx / Bxxx
        //============================================
        //---------------------------
        // BRA/BSR disp12 (Addd/Bddd)
        //---------------------------
          4'b101? : // Axxx, Bxxx
            case (INSTR_SEQ)
              0: begin                 
                   EX_RDPC_X = 1'b1;
                   EX_CONST_SIGN122 = 1'b1;
                   EX_RDCONST_Y = 1'b1;
                   EX_ALUFUNC = `ALU_ADD;
                   EX_WRPC_Z = 1'b1;
                   if (INSTR_STATE[12]) EX_WRPR_PC = 1'b1; // BSR operation
                   ID_INCPC = 1'b1;
                 end
              1: begin
                   ID_IF_ISSUE = 1'b1;
                   ID_IFADSEL = 1'b1;
                   ID_IF_JP = 1'b1;
                   DISPATCH = 1'b1;
                   DELAY_JUMP = 1'b1;
                 end
              default : ;
            endcase
        //============================================
        // Line Cxxx
        //============================================
          4'b1100 : // Cxxx
            casex (INSTR_STATE[11:8])
        //------------------------------
        // MOV.B R0, @(disp, GBR) (C0dd)
        // MOV.W R0, @(disp, GBR) (C1dd) 
        // MOV.L R0, @(disp, GBR) (C2dd)
        //------------------------------
              4'b00??: // C0xx, C1xx, C2xx, C3xx
                begin
                  if (~INSTR_STATE[9] | ~INSTR_STATE[8])
                    begin // C0xx, C1xx, C2xx
                      EX_RDGBR_X = 1'b1;
                      case (INSTR_STATE[9:8])
                          2'b00  : EX_CONST_ZERO8  = 1'b1;
                          2'b01  : EX_CONST_ZERO82 = 1'b1;
                          default: EX_CONST_ZERO84 = 1'b1;
                      endcase 
                      EX_ALUFUNC = `ALU_ADDCN; //@(disp, GBR)
                      EX_WRMAAD_Z = 1'b1;
                      EX_RDREG_Y = 1'b1;
                      EX_REGNUM_Y = 4'h0;  //R0
                      EX_WRMADW_Y = 1'b1;
                      {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                      EX_MA_SZ = INSTR_STATE[9:8];
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
        //-----------
        // TRAPA #imm
        //-----------
                  else
                    begin // C3xx
                      case (INSTR_SEQ)
                        0 : begin
                              EX_RDREG_X = 1'b1;
                              EX_REGNUM_X = 4'hF;
                              EX_ALUFUNC = `ALU_DECX4;
                              EX_WRREG_Z = 1'b1;
                              EX_REGNUM_Z = 4'hF;
                              EX_WRMAAD_Z = 1'b1;
                              EX_RDSR_Y = 1'b1;
                              EX_WRMADW_Y = 1'b1;
                              {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                              EX_MA_SZ = 2'b10;
                            end
                        1 : begin
                              EX_RDREG_X = 1'b1;
                              EX_REGNUM_X = 4'hF;
                              EX_ALUFUNC = `ALU_DECX4;
                              EX_WRREG_Z = 1'b1;
                              EX_REGNUM_Z = 4'hF;
                              EX_WRMAAD_Z = 1'b1;
                              EX_RDPC_Y = 1'b1;
                              EX_WRMADW_Y = 1'b1;
                              {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                              EX_MA_SZ = 2'b10;
                            end
                        2 : begin
                              EX_RDCONST_X = 1'b1;
                              EX_CONST_ZERO84 = 1'b1;
                              EX_RDVBR_Y = 1'b1;
                              EX_ALUFUNC = `ALU_ADD;
                              EX_WRMAAD_Z = 1'b1;
                              {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                              EX_MA_SZ = 2'b10;
                              WB_RDMADR_W = 1'b1;
                            end
                        3 : begin
                            end                
                        4 : begin
                              EX_ALUFUNC = `ALU_THRUW;
                              EX_WRPC_Z = 1'b1;
                            end
                        5 : begin
                              ID_IFADSEL = 1'b1;
                              ID_IF_ISSUE = 1'b1;
                              ID_IF_JP = 1'b1;
                            end
                        6 : begin
                              ID_INCPC = 1'b1;
                              ID_IF_ISSUE = 1'b1;
                              DISPATCH = 1'b1;
                            end
                        default : ;
                      endcase
                    end
                end
        //------------------------------
        // MOV.B @(disp, GBR), R0 (C4dd)
        // MOV.W @(disp, GBR), R0 (C5dd) 
        // MOV.L @(disp, GBR), R0 (C6dd)
        //------------------------------
              4'b01??: // C4xx, C5xx, C6xx, C7xx
                begin
                  if (~INSTR_STATE[9] | ~INSTR_STATE[8])
                    begin // C4xx, C5xx, C6xx
                      EX_RDGBR_X = 1'b1;
                      case (INSTR_STATE[9:8])
                          2'b00  : EX_CONST_ZERO8  = 1'b1;
                          2'b01  : EX_CONST_ZERO82 = 1'b1;
                          default: EX_CONST_ZERO84 = 1'b1;
                      endcase 
                      EX_ALUFUNC = `ALU_ADDCN; //@(disp, GBR)
                      EX_WRMAAD_Z = 1'b1;
                      {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                      EX_MA_SZ = INSTR_STATE[9:8];
                      WB_RDMADR_W = 1'b1;
                      WB_WRREG_W = 1'b1;
                      WB_REGNUM_W = 4'h0; //R0
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
        //---------------------------
        // MOVA @(disp,PC), R0 (C7dd)
        //---------------------------
                  else
                    begin // C7xx               
                      EX_RDPC_X = 1'b1;
                      EX_CONST_ZERO84 = 1'b1;
                      EX_RDCONST_Y = 1'b1;
                      EX_ALUFUNC = `ALU_ADDXFC;
                      EX_WRREG_Z = 1'b1;
                      EX_REGNUM_Z = 4'h0; // R0
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                    end
                end 
        //---------------------
        // TST #imm8, R0 (C8ii)
        // AND #imm8, R0 (C9ii)
        // XOR #imm8, R0 (CAii)
        // OR  #imm8, R0 (CBii)
        //---------------------     
              4'b10??: // C8xx, C9xx, CAxx, CBxx
                begin
                  EX_RDREG_X = 1'b1;
                  EX_REGNUM_X = 4'b0000; // R0
                  EX_CONST_ZERO8 = 1'b1;
                  EX_RDCONST_Y = 1'b1;
                  EX_REGNUM_Z = 4'b0000; // R0
                  case (INSTR_STATE[9:8])
                      2'b00 :  {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_AND, 1'b0, 1'b1};
                      2'b01 :  {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_AND, 1'b1, 1'b0};
                      2'b10 :  {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_XOR, 1'b1, 1'b0};
                      2'b11 :  {EX_ALUFUNC, EX_WRREG_Z, EX_T_TSTSET} = {`ALU_OR , 1'b1, 1'b0};
                      default : ;
                  endcase
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end
        //------------------------------
        // TST.B #imm8, @(R0,GBR) (CCii)
        // AND.B #imm8, @(R0,GBR) (CDii)
        // XOR.B #imm8, @(R0,GBR) (CEii)
        // OR.B  #imm8, @(R0,GBR) (CFii)
        //------------------------------
              4'b11??: // CCxx, CDxx, CExx, CFxx
                case (INSTR_SEQ)
                  0: begin
                       EX_RDGBR_X = 1'b1;     // GBR
                       EX_RDREG_Y = 1'b1;
                       EX_REGNUM_Y = 4'h0; // R0
                       EX_ALUFUNC = `ALU_ADD;
                       EX_WRMAAD_Z = 1'b1;
                       EX_WRTEMP_Z = 1'b1;
                       {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                       EX_MA_SZ = 2'b00;
                       WB_RDMADR_W = 1'b1;
                     end
                  1: begin
                     end
                  2: begin
                       EX_WRMAAD_TEMP = 1'b1;
                       EX_FWD_W2X = 1'b1;
                       EX_CONST_ZERO8 = 1'b1;
                       EX_RDCONST_Y = 1'b1;
                       case (INSTR_STATE[9:8])
                         2'b00 :  {EX_ALUFUNC, EX_MA_ISSUE, EX_T_TSTSET} = {`ALU_AND, 1'b0, 1'b1};
                         2'b01 :  {EX_ALUFUNC, EX_MA_ISSUE, EX_T_TSTSET} = {`ALU_AND, 1'b1, 1'b0};
                         2'b10 :  {EX_ALUFUNC, EX_MA_ISSUE, EX_T_TSTSET} = {`ALU_XOR, 1'b1, 1'b0};
                         2'b11 :  {EX_ALUFUNC, EX_MA_ISSUE, EX_T_TSTSET} = {`ALU_OR , 1'b1, 1'b0};
                         default : ;
                      endcase
                      EX_WRMAAD_TEMP = 1'b1;
                      EX_MA_WR = 1'b1;
                      EX_MA_SZ = 2'b00;
                      ID_INCPC = 1'b1;
                      ID_IF_ISSUE = 1'b1;
                      DISPATCH = 1'b1;
                     end
                  default : ;
                endcase
        //---------------
        // Default = NOP
        //---------------
              default :
                begin
                  ID_INCPC = 1'b1;
                  ID_IF_ISSUE = 1'b1;
                  DISPATCH = 1'b1;
                end 
            endcase
        //============================================
        // Line Dxxx
        //============================================
        //------------------------------
        // MOV.L @(disp8, PC), Rn (Dndd)
        //------------------------------
          4'b1101 : // Dxxx
            begin               
              EX_RDPC_X = 1'b1;
              EX_CONST_ZERO84 = 1'b1;
              EX_RDCONST_Y = 1'b1;
              EX_ALUFUNC = `ALU_ADDXFC;
              EX_WRMAAD_Z = 1'b1;
              {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
              EX_MA_SZ = 2'b10;
              WB_RDMADR_W = 1'b1;
              WB_WRREG_W = 1'b1;
              WB_REGNUM_W = INSTR_STATE[11:8]; // Rn
              ID_INCPC = 1'b1;
              ID_IF_ISSUE = 1'b1;
              DISPATCH = 1'b1;
            end
        //============================================
        // Line Exxx
        //============================================
        //---------------------
        // MOV #imm8, Rn (Enii)
        //---------------------
          4'b1110 : // Exxx
            begin
              EX_CONST_SIGN8 = 1'b1;
              EX_RDCONST_Y = 1'b1;
              EX_ALUFUNC = `ALU_THRUY;
              EX_WRREG_Z = 1'b1;
              EX_REGNUM_Z = INSTR_STATE[11:8]; // Rn
              ID_INCPC = 1'b1;
              ID_IF_ISSUE = 1'b1;
              DISPATCH = 1'b1;
            end
        //============================================
        // Line Fxxx
        //============================================  
          default : //Fxxx or else
            casex (INSTR_STATE[11:8])
        //---------------------- 
        // Power on Reset (F700)
        // Manual   Reset (F602)     
        //----------------------
              4'b011? : // F6xx, F7xx                 
                begin
                  case (INSTR_SEQ)
                    1: begin // ID  
                         EVENT_ACK_0 = 1'b1;
                         EX_ALUFUNC = `ALU_NOP;
                         RST_SR = 1'b1;
                       end
                    2: begin // EX ID
                         EX_CONST_ZERO84 = 1'b1;
                         EX_RDCONST_Y = 1'b1;
                         EX_ALUFUNC = `ALU_THRUY;
                         EX_WRMAAD_Z = 1'b1; // MAAD=00000000 or 00000008
                         EX_WRTEMP_Z = 1'b1; 
                         EX_MA_ISSUE = 1'b1;
                         EX_MA_WR = 1'b0;
                         EX_MA_SZ = 2'b10; // read long
                         WB_RDMADR_W = 1'b1;
                       end
                    3: begin //    EX ID
                         EX_RDTEMP_X = 1'b1;
                         EX_ALUFUNC = `ALU_INCX4; // Z = TEMP + 4
                         EX_WRMAAD_Z = 1'b1; // MAAD=00000004 or 0000000C
                         EX_MA_ISSUE = 1'b1;
                         EX_MA_WR = 1'b0;
                         EX_MA_SZ = 2'b10; // read long
                         WB_RDMADR_W = 1'b1;
                         WB_WRREG_W = 1'b1;
                         WB_REGNUM_W = 4'hf;
                       end
                    4: begin //    MA EX ID
                         EX_ALUFUNC = `ALU_THRUW;
                         EX_WRPC_Z = 1'b1;
                       end
                    5: begin //    WB MA EX ID
                         EX_WRVBR_Z = 1'b1;  // clear VBR = 00000000
                         ID_IFADSEL = 1'b1;
                         ID_IF_ISSUE = 1'b1;
                         ID_IF_JP = 1'b1;
                      end
                    6: begin //       WB    EX
                         ID_INCPC = 1'b1;
                         ID_IF_ISSUE = 1'b1;
                         DISPATCH = 1'b1;
                       end
                    default : ;
                  endcase
                end
        //-------------------------
        // DMA Address Error (F30A)
        // CPU Address Error (F209)
        // NMI Interrupt     (F10B)
        // IRQ Interrupt     (F0xx)
        //-------------------------
              4'b00??: // F0xx, F1xx, F2xx, F3xx
                begin
                  case (INSTR_SEQ)
                    0 : begin  
                          EVENT_ACK_0 = 1'b1;
                          ILEVEL_CAP = 1'b1;
                          EX_RDPC_X = 1'b1;
                          EX_ALUFUNC = `ALU_DECX2;
                          EX_WRPC_Z = 1'b1;  
                        end
                    1 : begin
                          EX_RDREG_X = 1'b1;
                          EX_REGNUM_X = 4'hF;
                          EX_ALUFUNC = `ALU_ADDXFC; // prevent repeating address error 
                          EX_WRTEMP_Z = 1'b1;
                        end
                    2 : begin
                          EX_RDTEMP_X = 1'b1;
                          EX_ALUFUNC = `ALU_DECX4;
                          EX_WRTEMP_Z = 1'b1;
                          EX_WRMAAD_Z = 1'b1;
                          EX_RDSR_Y = 1'b1;
                          EX_WRMADW_Y = 1'b1;
                          {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                          EX_MA_SZ = 2'b10;
                        end
                    3 : begin
                          EX_RDTEMP_X = 1'b1;
                          EX_ALUFUNC = `ALU_DECX4;
                          EX_WRTEMP_Z = 1'b1;
                          EX_WRMAAD_Z = 1'b1;
                          EX_RDPC_Y = 1'b1;
                          EX_WRMADW_Y = 1'b1;
                          {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                          EX_MA_SZ = 2'b10;
                        end
                    4 : begin                 
                          EX_RDVBR_X = 1'b1;
                          EX_RDCONST_Y = 1'b1;
                          EX_CONST_ZERO84 = 1'b1;
                          EX_ALUFUNC = `ALU_ADD;
                          EX_WRMAAD_Z = 1'b1;
                          {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                          EX_MA_SZ = 2'b10;
                          WB_RDMADR_W = 1'b1;
                        end
                    5 : begin
                          if (~INSTR_STATE[9]) WR_IBIT = 1'b1; // if NMI or IRQ
                          EX_RDREG_X = 1'b1;
                          EX_REGNUM_X = 4'hF;
                          EX_ALUFUNC = `ALU_DECX4;
                          EX_WRREG_Z = 1'b1; 
                          EX_REGNUM_Z = 4'hF;
                        end                
                    6 : begin
                          EX_ALUFUNC = `ALU_THRUW;
                          EX_WRPC_Z = 1'b1;
                        end
                    7 : begin
                          EX_RDREG_X = 1'b1;
                          EX_REGNUM_X = 4'hF;
                          EX_ALUFUNC = `ALU_DECX4;
                          EX_WRREG_Z = 1'b1; 
                          EX_REGNUM_Z = 4'hF;
                          ID_IFADSEL = 1'b1;
                          ID_IF_ISSUE = 1'b1;
                          ID_IF_JP = 1'b1;
                        end
                    8 : begin
                          ID_INCPC = 1'b1;
                          ID_IF_ISSUE = 1'b1;
                          DISPATCH = 1'b1;
                        end
                    default : ;
                  endcase
                end
        //-----------------------------------
        // General Illegal Instruction (FFxx)
        // Slot    Illegal Instruction (FExx)
        //-----------------------------------
              default : // FFxx, FExx,  etc
                begin
                  case (INSTR_SEQ)
                    0 : begin
                          EX_RDPC_X = 1'b1;
                          if (INSTR_STATE[8])
                              EX_ALUFUNC = `ALU_DECX2; // GNRL_ILGL
                          else
                              EX_ALUFUNC = `ALU_THRUX; // SLOT_ILGL
                          EX_WRPC_Z = 1'b1;  
                        end
                    1 : begin
                          EX_RDREG_X = 1'b1;
                          EX_REGNUM_X = 4'hF;
                          EX_ALUFUNC = `ALU_DECX4;
                          EX_WRREG_Z = 1'b1;
                          EX_REGNUM_Z = 4'hF;
                          EX_WRMAAD_Z = 1'b1;
                          EX_RDSR_Y = 1'b1;
                          EX_WRMADW_Y = 1'b1;
                          {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                          EX_MA_SZ = 2'b10;
                        end
                    2 : begin
                          EX_RDREG_X = 1'b1;
                          EX_REGNUM_X = 4'hF;
                          EX_ALUFUNC = `ALU_DECX4;
                          EX_WRREG_Z = 1'b1;
                          EX_REGNUM_Z = 4'hF;
                          EX_WRMAAD_Z = 1'b1;
                          EX_RDPC_Y = 1'b1;
                          EX_WRMADW_Y = 1'b1;
                          {EX_MA_ISSUE,EX_MA_WR} =  2'b11;
                          EX_MA_SZ = 2'b10;
                        end
                    3 : begin
                          EX_RDCONST_X = 1'b1;
                          EX_CONST_ZERO84 = 1'b1;
                          EX_RDVBR_Y = 1'b1;
                          EX_ALUFUNC = `ALU_ADD;
                          EX_WRMAAD_Z = 1'b1;
                          {EX_MA_ISSUE,EX_MA_WR} =  2'b10;
                          EX_MA_SZ = 2'b10;
                          WB_RDMADR_W = 1'b1;
                        end
                    4 : begin
                        end                
                    5 : begin
                          EX_ALUFUNC = `ALU_THRUW;
                          EX_WRPC_Z = 1'b1;
                        end
                    6 : begin
                          ID_IFADSEL = 1'b1;
                          ID_IF_ISSUE = 1'b1;
                          ID_IF_JP = 1'b1;
                        end
                    7 : begin
                          ID_INCPC = 1'b1;
                          ID_IF_ISSUE = 1'b1;
                          DISPATCH = 1'b1;
                        end
                    default : ;
                  endcase
                end
            endcase
        endcase
    end

//======================================================
  endmodule
//======================================================