//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : Memory Access Unit
//------------------------------------------------------
// File        : mem.v
// Library     : none
// Description : Memory Access Unit in CPU.
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 31st March 2002
// Creator         : Thorn Aitch
// Description     : Initial Design				  
//------------------------------------------------------
// Revision Number : 2
// Date of Change  : 7th April 2002
// Modifier        : Thorn Aitch
// Description     : adopt WISHBONE					  
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

//*********************************
// Memory Access Unit Specification
//*********************************
// The Memory Access Unit handles memory access
// that is  instruction fetch and data read/write.
// Also should detect address error exception.

//-------------------
// WISHBONE DATASHEET
//-------------------
// Based on the WISHBONE Specification Revision : B.1
// See http://www.opencores.org/
//
// CPU is defined as MASTER module.
//
//(1)Signal Names
// CLK_I : clock input
// RST_I : reset input
// CYC_O : show bus cycle or read-modify-write cycle
// STB_O : strobe
// ACK_I : bus acknowledge
// ADR_O[31:0] : address output
// DAT_I[31:0] : data input (Read data)
// DAT_O[31:0] : data output (Write data)
// WE_O : read(0)/write(1)
// SEL_O[3:0] : valid data position
// TAG0_I : Instruction Fetch Width(=IF_WIDTH)
//
//(2)Data Organization
// Nomenclature : 8bit
// Big Endian Only
// Terminology : DWORD(32bit) means "Long Word" as SuperH's term.
//               WORD(16bit) and Byte(8bit) have same meanings.
//
// [External data bus alignment]
//            A1 A0
// READ  LONG ** |-HH-|-HL-|-LH-|-LL-|
// READ  WORD 0* |--H-|--L-|****|****|
// READ  WORD 1* |****|****|--H-|--L-|
// READ  BYTE 00 |--B-|****|****|****| 
// READ  BYTE 01 |****|--B-|****|****|
// READ  BYTE 10 |****|****|--B-|****|
// READ  BYTE 11 |****|****|****|--B-|
// WRITE LOMG ** |-HH-|-HL-|-LH-|-LL-|
// WRITE WORD ** |--H-|--L-|--H-|--L-|
// WRITE BYTE ** |--B-|--B-|--B-|--B-|
// 
// FETCH from LONG space ** |-HH-|-HL-|-LH-|-LL-|
// FETCH from WORD space 0* |--H-|--L-|****|****|
// FETCH from WORD space 1* |****|****|--H-|--L-| 

//--------------
// State Machine
//--------------
// [State Definition] 
// S0 `S_IDLE      :idle
// S1 `S_IFEX      :external fetch
// S2 `S_MAEX      :external data access
// S3 `S_MAEX_IFPD :external data access, pending fetch
// S4 `S_IDLE_IFKP :idle, keeping lower un-decoded instruction
// S5 `S_IFIN      :internal fetch from just keeping one
// S6 `S_MAEX_IFKP :extenal data access, keeping lower un-decoded instruction
// S7 `S_MAEX_IFIN :external data access and do internal fetch from just keeping
// ---
// [Internal Signal]
// IF_KEEP  : fetching from "long boundary" and IF_WIDTH=1
// IF_FORCE : IF_JP=1 or next fetch address is from "long boundary"
// ---
// [State Transition]
// S0 -> S0 no event
// S0 -> S1 by fetch request
// S0 -> S2 by data access request
// S0 -> S3 by both fetch request and data access request
// S0 -> S4 n/a
// S0 -> S5 n/a
// S0 -> S6 n/a
// S0 -> S7 n/a
// ---
// S1 -> S0 no event; IF_KEEP=0
// S1 -> S1 by fetch request; IF_FORCE=1 or IF_KEEP=0
// S1 -> S2 by data access request; IF_KEEP=0
// S1 -> S3 by both fetch and data access request; IF_KEEP=0
// S1 -> S4 no event; IF_KEEP=1
// S1 -> S5 by fetch request; IF_FORCE=0 and IF_KEEP=1
// S1 -> S6 by data access request; IF_KEEP=1
// S1 -> S7 by both fetch and data access request; IF_KEEP=1
// ---
// S2 -> S0 no event
// S2 -> S1 by fetch request
// S2 -> S2 by data access request
// S2 -> S3 by both fetch request and data access request
// S2 -> S4 n/a
// S2 -> S5 n/a
// S2 -> S6 n/a
// S2 -> S7 n/a
// ---
// S3 -> S0 n/a 
// S3 -> S1 always
// S3 -> S2 n/a
// S3 -> S3 n/a
// S3 -> S4 n/a
// S3 -> S5 n/a
// S3 -> S6 n/a
// S3 -> S7 n/a
// ---
// S4 -> S0 n/a
// S4 -> S1 by fetch request; IF_FORCE=1
// S4 -> S2 n/a
// S4 -> S3 by both fetch request and data access request; IF_FORCE=1
// S4 -> S4 no event
// S4 -> S5 by fetch request; IF_FORCE=0
// S4 -> S6 by data access request
// S4 -> S7 by both fetch request and data access request; IF_FORCE=0
// ---
// S5 -> S0 no event
// S5 -> S1 by fetch request
// S5 -> S2 by data access request
// S5 -> S3 by both fetch request and data access request
// S5 -> S4 n/a
// S5 -> S5 n/a
// S5 -> S6 n/a
// S5 -> S7 n/a
// ---
// S6 -> S0 n/a 
// S6 -> S1 by fetch request; IF_FORCE=1
// S6 -> S2 n/a
// S6 -> S3 by both fetch request and data access request; IF_FORCE=1
// S6 -> S4 no event
// S6 -> S5 by fetch request; IF_FORCE=0  
// S6 -> S6 by data access request
// S6 -> S7 by both fetch request and data access request; IF_FORCE=0
// ---
// S7 -> S0 no event 
// S7 -> S1 by fetch request
// S7 -> S2 by data access request
// S7 -> S3 by both fetch request and data access request
// S7 -> S4 n/a
// S7 -> S5 n/a
// S7 -> S6 n/a
// S7 -> S7 n/a
// ---

//-----------------------------------------
// Memory Access Controller Basic Operation
//-----------------------------------------
// [Example]
//            | | | | | | | | | | | | | | | | | | | | | | | | | |
//     pipe      D E M W       D     D E M         M
//                               D     D - E     D - E
//                               F D       D         D
//                                         F         F
//     IF_issue              0 F       F-F(*2)   F-F(*3)   
//     MA_issue  0 M                   M         M  
//     IF_stall                                  1 0 
//    (other_stall)                    1 0 
//     bus cycle     B           B       B B       B B
//     address out   A           A       A A
//     write data    W                   W
//     xxDR            R(*1)       R       R R
//            (*1:should forward to next EX)
//            (*2:load destination register contention)
//            (*3:IF-MA contention)

//*************************************************
// Module Definition
//*************************************************
module mem(
// system signal
    CLK, RST,
// WISHBONE external bus signal
    CYC, STB, ACK,
    ADR, DATI, DATO,
    WE, SEL,
    IF_WIDTH, 
// pipeline slot edge
    SLOT,
// instruction fetch control
    IF_ISSUE, IF_JP, IF_AD,
    IF_DR, IF_BUS, IF_STALL,
// data access control
    MA_ISSUE, KEEP_CYC, MA_WR, MA_SZ,
    MA_AD, MA_DW, MA_DR
    );
//-------------------
// Module I/O Signals
//-------------------
    // (WISHBONE)
    input  CLK;           // clock
    input  RST;           // reset
    output CYC;           // cycle output
    output STB;           // strobe
    input  ACK;           // external memory ready
    output [31:0] ADR;    // external address
    input  [31:0] DATI;   // external data read bus
    output [31:0] DATO;   // external data write bus
    output WE;            // external write/read
    output [3:0] SEL;     // external valid data position
    input  IF_WIDTH;      // external fetch space width (IF_WIDTH)
    // (To/From other blocks)
    output SLOT;          // pipeline slot edge
    input  IF_ISSUE;      // fetch request
    input  IF_JP;         // fetch caused by jump
    input  [31:0] IF_AD;  // fetch address
    output [15:0] IF_DR;  // fetched instruction
    output IF_BUS;        // fetch access done to extenal bus
    output IF_STALL;      // fetch and memory access contention
    input  MA_ISSUE;      // memory access request
    input  KEEP_CYC;      // request read-modify-write (To be issued on READ-CYC to keep CYC_O on)
    input  MA_WR;         // memory access kind : Write(1)/Read(0)
    input  [1:0] MA_SZ;   // memory access size : 00 byte, 01 word, 10 long, 11 inhibitted
    input  [31:0] MA_AD;  // memory access address
    input  [31:0] MA_DW;  // memory write data
    output [31:0] MA_DR;  // memory read data


//-----------------
// Internal Signals
//-----------------
    reg    CYC;
    reg    STB;
    reg    [31:0] ADR;
    reg    [31:0] DATO;
    reg    WE;
    reg    [3:0] SEL;

    reg    [31:0] ADR_PREV;         // previous ADR to be latched
    reg    [31:0] DATO_PREV;        // previous DATO to be latched
    reg    CYC_PREV, NEXT_KEEP_CYC; // previous CYC to be latched, keep CYC assertion
    reg    [3:0] SEL_PREV;          // previous SEL to be latched
    reg    [15:0] IF_DR;     // output to decoder 
    reg    [31:0] IF_DR_PREV;// directly latched DATI for instruction
    reg    [31:0] MA_DR;     // output to datapath (sign extended)
    reg    [31:0] MA_DR_PREV;// directly latched DATI for data
    reg    IF_BUS;           // a instruction in lower 16bit of long size fetched instructions(32bit)
    reg    IF_STALL;
    reg    [15:0] IF_BUF;    // buffer to keep the lower 16bit of previous long fetch
    reg    IF_KEEP;          // fetching was from "long boundary" AND IF_WIDTH=1
    reg    IF_FORCE;         // IF_JP=1 or next fetch address is from "long boundary"
    reg    [2:0] STATE;      // state
    reg    [2:0] NEXT_STATE; // next state
    reg    [1:0] ACCESS_SZ;  // current data access size
    reg    NXTBUS;           // next state is exernal bus
    reg    MEMEND;           // finish memory cycle or no memory cycle
    reg    MEMACK;           // memory control unit can accept next memory request
    reg [1:0] MA_ACCESS_SZ;  // latched ACCESS_SZ to extend sign bit of MA_DR output
    reg [1:0] MA_ADR;        // latched lower 2bit of ADR to extend sign bit of MA_DR output
    reg [2:0] IF_STATE;      // latched STATE to make IF_DR from IF_DR_PREV
    reg IF_ADR1;             // latched ADR[1] to make IF_DR from IF_DR_PREV
    reg [15:0] IF_IF_BUF;    // latched IF_BUF to make IF_DR from IF_DR_PREV
    wire SLOT;               // pipeline slot edge (= MEMACK)

    integer i;

//-----------------
// Make signal SLOT
//-----------------
    assign SLOT = MEMACK;

//-----------------------------------------------------------------------
// Make MEMACK : shows memory control unit can accept next memory request
//-----------------------------------------------------------------------
//     MEMACK = memory controller can accept next request (not equal ACK),
//              and if memory controller is generating external bus cycle now,
//              MEMACK confirms current bus cycle will be finished in this clock cycle.
//     MEMEND = finish memory cycle or no memory cycle
//     NXTBUS = begin memory cycle (next cycle is external bus)
//     ACK    = shows only "bus cycle finished"  

    always @(NEXT_STATE or MEMEND) begin
        case (NEXT_STATE)
            //`S_MAEX_IFPD : MEMACK <= 1'b0;
            default     : MEMACK <= MEMEND;
        endcase
    end
    // May be MEMACK can be generated from ~IF_STALL & MEMEND
    // From timing point of view, ACK should be 
    // combined at final stage of the MEMACK logic, not MEMEND.
    
    always @(STATE or ACK) begin
        case (STATE)
            `S_IDLE      : MEMEND <= 1'b1;
            `S_IDLE_IFKP : MEMEND <= 1'b1;
            `S_IFIN      : MEMEND <= 1'b1;
            default      : if (ACK == 1'b1)
                               MEMEND <= 1'b1;
                           else
                               MEMEND <= 1'b0;
        endcase
    end

    always @(NEXT_STATE) begin
        if ((NEXT_STATE[1] == 1'b1) || (NEXT_STATE == `S_IFEX))
            NXTBUS <= 1'b1;
        else
            NXTBUS <= 1'b0;
    end

//-------------------
// Main State Machine
//-------------------
    // state machine F/F
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            STATE <= `S_IDLE ;
        else
            STATE <= NEXT_STATE;
    end

    // make IF_KEEP
    always @(ADR or IF_WIDTH) begin
        IF_KEEP <= (~ADR[1]) & (~ADR[0]) & IF_WIDTH;
    end

    // make IF_FORCE
    always @(IF_JP or IF_AD) begin
      //IF_FORCE <= IF_JP | ((~IF_AD[1]) & (~IF_AD[0]));
        IF_FORCE <= IF_JP | (~IF_AD[1]);
    end

    // make NEXT_STATE : state machine combinational circuit
    always @(STATE or IF_ISSUE or MA_ISSUE or IF_FORCE or IF_KEEP or ACK) begin
        case (STATE)
            `S_IDLE: // S0 idle
                     if ({IF_ISSUE, MA_ISSUE} == 2'b00) NEXT_STATE <= `S_IDLE;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b10) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b01) NEXT_STATE <= `S_MAEX;
                else NEXT_STATE <= `S_MAEX_IFPD;
            `S_IFEX: // S1 external fetch
                     if (ACK == 1'b0) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE, IF_KEEP} == 3'b000) NEXT_STATE <= `S_IDLE;
                else if ({IF_ISSUE, MA_ISSUE, IF_KEEP} == 3'b001) NEXT_STATE <= `S_IDLE_IFKP;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE, IF_KEEP} == 4'b1000) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE, IF_KEEP} == 4'b1010) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE, IF_KEEP} == 4'b1001) NEXT_STATE <= `S_IFIN;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE, IF_KEEP} == 4'b1011) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE, IF_KEEP} == 3'b010) NEXT_STATE <= `S_MAEX;
                else if ({IF_ISSUE, MA_ISSUE, IF_KEEP} == 3'b011) NEXT_STATE <= `S_MAEX_IFKP;
                else if ({IF_ISSUE, MA_ISSUE, IF_KEEP} == 3'b110) NEXT_STATE <= `S_MAEX_IFPD;
                else NEXT_STATE <= `S_MAEX_IFIN;
            `S_MAEX: // S2 external data access
                     if (ACK == 1'b0) NEXT_STATE <= `S_MAEX;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b00) NEXT_STATE <= `S_IDLE;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b10) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b01) NEXT_STATE <= `S_MAEX;
                else NEXT_STATE <= `S_MAEX_IFPD;
            `S_MAEX_IFPD: // S3 external data access, pending fetch
                     if (ACK == 1'b0) NEXT_STATE <= `S_MAEX_IFPD;
                else NEXT_STATE <= `S_IFEX;
            `S_IDLE_IFKP: // S4 idle, keeping lower un-decodeed instruction
                     if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b101) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b100) NEXT_STATE <= `S_IFIN;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b01) NEXT_STATE <= `S_MAEX_IFKP;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b111) NEXT_STATE <= `S_MAEX_IFPD;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b110) NEXT_STATE <= `S_MAEX_IFIN;
                else NEXT_STATE <= `S_IDLE_IFKP;
            `S_IFIN: // S5 internal fetch from just keeping one
                     if ({IF_ISSUE, MA_ISSUE} == 2'b00) NEXT_STATE <= `S_IDLE;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b10) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b01) NEXT_STATE <= `S_MAEX;
                else NEXT_STATE <= `S_MAEX_IFPD;
            `S_MAEX_IFKP: // S6 extenal data access, keeping lower un- decoded instruction
                     if (ACK == 1'b0) NEXT_STATE <= `S_MAEX_IFKP;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b101) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b100) NEXT_STATE <= `S_IFIN;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b01) NEXT_STATE <= `S_MAEX_IFKP;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b111) NEXT_STATE <= `S_MAEX_IFPD;
                else if ({IF_ISSUE, MA_ISSUE, IF_FORCE} == 3'b110) NEXT_STATE <= `S_MAEX_IFIN;
                else NEXT_STATE <= `S_IDLE_IFKP;
            `S_MAEX_IFIN: // S7 external data access and do internal fetch from just keeping
                     if (ACK == 1'b0) NEXT_STATE <= `S_MAEX_IFIN;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b00) NEXT_STATE <= `S_IDLE;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b10) NEXT_STATE <= `S_IFEX;
                else if ({IF_ISSUE, MA_ISSUE} == 2'b01) NEXT_STATE <= `S_MAEX;
                else NEXT_STATE <= `S_MAEX_IFPD;
            
            default: NEXT_STATE <= `S_IDLE;
        endcase
    end            

//-------------------------------
// ADR : external addresss output
//-------------------------------
    // selector
    always @(NEXT_STATE or MA_AD or IF_AD) begin
        if (NEXT_STATE[1] == 1'b1) //memory access
            ADR_PREV <= MA_AD;
        else                       // instruction fetch
            ADR_PREV <= IF_AD;
    end
    // output
    always @(posedge CLK) begin
        if ((NXTBUS == 1'b1) && (MEMEND == 1'b1)) begin
            ADR <= ADR_PREV;
        end
    end

//-------------------------------------
// ACCESS_SZ : current data access size
//-------------------------------------
    always @(posedge CLK) begin
        if ((NXTBUS == 1'b1) && (MEMEND == 1'b1)) begin
            ACCESS_SZ <= MA_SZ; // have meaning only when data access
        end
    end

//----------------------------
// DATO : external data output
//----------------------------
    // prepare
    always @(MA_SZ or MA_DW) begin
        case (MA_SZ)
            2'b00: begin // byte
                       DATO_PREV[31:24] <= MA_DW[7:0];
                       DATO_PREV[23:16] <= MA_DW[7:0];
                       DATO_PREV[15: 8] <= MA_DW[7:0];
                       DATO_PREV[ 7: 0] <= MA_DW[7:0];
                   end
            2'b01: begin // word
                       DATO_PREV[31:24] <= MA_DW[15:8];
                       DATO_PREV[23:16] <= MA_DW[ 7:0];
                       DATO_PREV[15: 8] <= MA_DW[15:8];
                       DATO_PREV[ 7: 0] <= MA_DW[ 7:0];
                   end
            2'b10: begin // long
                       DATO_PREV[31:24] <= MA_DW[31:24];
                       DATO_PREV[23:16] <= MA_DW[23:16];
                       DATO_PREV[15: 8] <= MA_DW[15: 8];
                       DATO_PREV[ 7: 0] <= MA_DW[ 7: 0];
                   end
            default: // 2'b11 don't care
                   begin
                       DATO_PREV[31:24] <= MA_DW[31:24]; // Thorn Aitch 2003/12/10
                       DATO_PREV[23:16] <= MA_DW[23:16]; // Thorn Aitch 2003/12/10
                       DATO_PREV[15: 8] <= MA_DW[15: 8]; // Thorn Aitch 2003/12/10
                       DATO_PREV[ 7: 0] <= MA_DW[15: 8]; // Thorn Aitch 2003/12/10
                   end
        endcase
    end

    // output
    always @(posedge CLK) begin
        if ((NXTBUS == 1'b1) && (MEMEND == 1'b1) && (MA_WR == 1'b1))
            DATO <= DATO_PREV;
    end

//----------------------------
// IF_DR : fetched instruction
//----------------------------
    // capture DATI    
    always @(posedge CLK) begin
        if ((MEMEND == 1'b1) & ((STATE == `S_IFEX) | ((STATE[2] == 1'b1) && (STATE[0] == 1'b1))))
        begin
            IF_STATE   <= STATE;
            IF_ADR1    <= ADR[1];
            IF_IF_BUF  <= IF_BUF;
            IF_DR_PREV <= DATI;
        end
    end
    // output to IF_DR
    always @(IF_STATE or IF_ADR1 or IF_DR_PREV or IF_IF_BUF) begin
        if (IF_STATE == `S_IFEX)
            begin
                // IF from 0,4,8,C
                if (IF_ADR1 == 1'b0)
                    begin
                        IF_DR <= IF_DR_PREV[31:16];
                    end
                // IF from 2,6,A,E
                else
                    IF_DR <= IF_DR_PREV[15:0];
            end
        else
        // IF from IF_BUF
            //if ((IF_STATE[2] == 1'b1) && (IF_STATE[0] == 1'b1)) // `S_IFIN or `S_MAEX_IFIN
            //    IF_DR <= IF_IF_BUF;	    // Thorn Aitch 2003/12/10
            //else 					    // Thorn Aitch 2003/12/10
            //    IF_DR <= 32'hxxxxxxxx;    // Thorn Aitch 2003/12/10
		  IF_DR <= IF_IF_BUF;		    // Thorn Aitch 2003/12/10
    end
    // output
    //always @(posedge CLK) begin
    //   if ((MEMEND == 1'b1) & ((STATE == `S_IFEX) | ((STATE[2] == 1'b1) && (STATE[0] == 1'b1))))
    //    begin
    //        IF_DR <= IF_DR_PREV;
    //    end
    //end

//---------------------------------------------------------------
// IF_BUF : buffer to keep the lower 16bit of previous long fetch
//---------------------------------------------------------------
    always @(posedge CLK) begin
        if (MEMEND == 1'b1) begin
            if (STATE == `S_IFEX)
                // IF from long space external
                if ((IF_WIDTH == 1'b1) && (ADR[1] == 1'b0))
                    IF_BUF <= DATI[15:0];
        end
    end

//------------------
// MA_DR : read data
//------------------
    // capture DATI
    always @(posedge CLK) begin
        if (ACK == 1'b1) begin // it must be captured by ACK (not MEMEND)
            if ((STATE[1] == 1'b1) && (WE == 1'b0)) begin
                MA_ACCESS_SZ <= ACCESS_SZ;
                MA_ADR <= ADR[1:0];
                MA_DR_PREV <= DATI;
            end
        end
    end
   // output to MA_DR with Sign Extended
    always @(MA_ACCESS_SZ or MA_DR_PREV or MA_ADR) begin
        case (MA_ACCESS_SZ)
            2'b00: begin //byte
                       if ({MA_ADR[1], MA_ADR[0]} == 2'b00)
                           begin
                               for (i = 8 ; i <= 31 ; i = i + 1) MA_DR[i] <= MA_DR_PREV[31];
                               MA_DR[7:0] <= MA_DR_PREV[31:24];
                           end
                       else if ({MA_ADR[1], MA_ADR[0]} == 2'b01)
                           begin
                               for (i = 8 ; i <= 31 ; i = i + 1) MA_DR[i] <= MA_DR_PREV[23];
                               MA_DR[7:0] <= MA_DR_PREV[23:16];
                           end
                       else if ({MA_ADR[1], MA_ADR[0]} == 2'b10)
                           begin
                               for (i = 8 ; i <= 31 ; i = i + 1) MA_DR[i] <= MA_DR_PREV[15];
                               MA_DR[7:0] <= MA_DR_PREV[15:8];
                           end
                       else if ({MA_ADR[1], MA_ADR[0]} == 2'b11)
                           begin
                               for (i = 8 ; i <= 31 ; i = i + 1) MA_DR[i] <= MA_DR_PREV[7];
                               MA_DR[7:0] <= MA_DR_PREV[7:0];
                           end
                   end
            2'b01: begin //word
                       if (MA_ADR[1] == 1'b0)
                           begin
                               for (i = 16 ; i <= 31 ; i = i + 1) MA_DR[i] <= MA_DR_PREV[31];
                               MA_DR[15:0] <= MA_DR_PREV[31:16];
                           end
                       else
                           begin
                               for (i = 16 ; i <= 31 ; i = i + 1) MA_DR[i] <= MA_DR_PREV[15];
                               MA_DR[15:0] <= MA_DR_PREV[15:0];
                           end
                   end
            2'b10: begin //long
                       MA_DR[31:0] <= MA_DR_PREV[31:0];
                   end
            default : begin
                          //MA_DR[31:0] <= 32'hxxxxxxxx;    // Thorn Aitch 2003/12/10 
					 MA_DR[31:0] <= MA_DR_PREV[31:0];  // Thorn Aitch 2003/12/10
                      end
        endcase
    end
    // output
    //always @(posedge CLK) begin
    //    if (ACK == 1'b1) begin // it must be captured by ACK (not MEMEND)
    //        if ((STATE[1] == 1'b1) && (WE == 1'b0)) begin
    //            MA_DR <= MA_DR_PREV;
    //        end
    //    end
    //end

//------------------------------------------
// IF_BUS : fetch access done to extenal bus
//------------------------------------------
    always @(posedge CLK) begin
        if (MEMEND == 1'b1) begin
            if (NEXT_STATE == `S_IFEX)
                IF_BUS <= 1'b1;
           else
                IF_BUS <= 1'b0;
        end
    end

//----------------------------------------------
// IF_STALL : fetch and memory access contention
//----------------------------------------------
    always @(NEXT_STATE) begin
        if (NEXT_STATE == `S_MAEX_IFPD)
            IF_STALL <= 1'b1;
        else
            IF_STALL <= 1'b0;
    end

//-------------------------
// WE : WISHBONE write/read
//-------------------------
    // WE
    always @(posedge CLK) begin
        if (MEMEND == 1'b1) begin
            if (((NEXT_STATE[1] == 1'b1) && (MA_WR == 1'b0)) || (NEXT_STATE == `S_IFEX))
                WE <= 1'b0; // read
            else
                WE <= 1'b1; // write
        end
    end

//--------------------------
// STB : WISHBONE bus strobe
//--------------------------
    always @(posedge CLK) begin
        if (MEMEND == 1'b1) begin
            STB <= NXTBUS;
        end
    end

//------------------------------------
// CYC :WOSHBONE show cycle to be kept
//------------------------------------
    //     req     STB CYC
    //     ---------------
    //     RD,CYC  off off
    //     nop     on  on
    //     WR      off on
    //     nop     on  on
    //             off off  
    // prepare
    always @(NXTBUS or NEXT_KEEP_CYC) begin
        if ((NXTBUS == 1'b1) || (NEXT_KEEP_CYC == 1'b1))
            CYC_PREV <= 1'b1;
        else 
            CYC_PREV <= 1'b0;
    end
    // remember for next cyc
    always @(posedge CLK) begin
        if (MEMEND == 1'b1) begin
            NEXT_KEEP_CYC <= KEEP_CYC;
        end
    end
    // output
    always @(posedge CLK) begin
        if (MEMEND == 1'b1) begin
            CYC <= CYC_PREV;
        end
    end

//----------------------------------------
// SEL : WISHBONE show valid data position
//----------------------------------------
    // prepare
    always @(NEXT_STATE or MA_SZ or MA_AD or IF_AD) begin
      //if ((NEXT_STATE == `S_IFEX) && (IF_AD[1:0] == 2'b00))
        if ((NEXT_STATE == `S_IFEX) && (IF_AD[1] == 1'b0))
            SEL_PREV <= 4'b1111;
      //else if ((NEXT_STATE == `S_IFEX) && (IF_AD[1:0] == 2'b10))
        else if ((NEXT_STATE == `S_IFEX) && (IF_AD[1] == 1'b1))
            SEL_PREV <= 4'b0011;
        else 
            if (NEXT_STATE[1] == 1'b1)
                begin
                    if (MA_SZ == 2'b10)
                        SEL_PREV <= 4'b1111;
                    else if ((MA_SZ == 2'b01) && (MA_AD[1] == 1'b0))
                        SEL_PREV <= 4'b1100;
                    else if ((MA_SZ == 2'b01) && (MA_AD[1] == 1'b1))
                        SEL_PREV <= 4'b0011;
                    else if ((MA_SZ == 2'b00) && (MA_AD[1:0] == 2'b00))
                        SEL_PREV <= 4'b1000;
                    else if ((MA_SZ == 2'b00) && (MA_AD[1:0] == 2'b01))
                        SEL_PREV <= 4'b0100;
                    else if ((MA_SZ == 2'b00) && (MA_AD[1:0] == 2'b10))
                        SEL_PREV <= 4'b0010;
                    else //if ((MA_SZ == 2'b00) && (MA_AD[1:0] == 2'b11))
                        SEL_PREV <= 4'b0001;
                end
            else SEL_PREV <= 4'b0000;
    end
    // output
    always @(posedge CLK) begin
        if ((NXTBUS == 1'b1) && (MEMEND == 1'b1)) begin
            SEL <= SEL_PREV;
        end
    end

//======================================================
  endmodule
//======================================================