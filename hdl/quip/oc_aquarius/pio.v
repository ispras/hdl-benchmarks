//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : Parallel Input / Output Port
//------------------------------------------------------
// File        : pio.v
// Library     : none
// Description : Parallel Input / Output Port
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 14th October 2002
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

//======================================================
// PIO : PORT IN/OUT Module
//
//      [PIODATA] 32bit register
//        bit31        bit16 bit15        bit0
//       --------------------------------------
//       |PIO31|......|PIO16|PIO15|......|PIO00|
//       --------------------------------------
//   init   0   ......   0     0   ......   0
//   R/W   R/W          R/W   R/W          R/W
//======================================================

//*************************************************
// Module Definition
//*************************************************
module pio (
               CLK, RST, 
               CE, WE, SEL, 
               DATI, DATO,
               PI, PO
           );

//-------------------
// Module I/O Signals
//-------------------
    input CLK;          // clock
    input RST;          // reset
    input CE;           // chip enable
    input WE;           // write enable (read = 0, write = 1)
    input [3:0]SEL;     // data valid position
    input [31:0] DATI;  // write data
    output [31:0] DATO; // read data
    input  [31:0] PI;   // PORT input
    output [31:0] PO;   // PORT output

//-----------------
// Internal Signals
//-----------------
    reg    [31:0] PIODATA;
    reg    [31:0] DATO;
    wire   [31:0] PO;

    assign PO = PIODATA;
 
//----------------------
// PIODATA R/W Operation
//----------------------
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            PIODATA[31:24] <= 8'h00;
        else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[3] == 1'b1))
            PIODATA[31:24] <= DATI[31:24];
    end
    
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            PIODATA[23:16] <= 8'h00;
        else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[2] == 1'b1))
            PIODATA[23:16] <= DATI[23:16];
    end
    
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            PIODATA[15: 8] <= 8'h00;
        else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[1] == 1'b1))
            PIODATA[15: 8] <= DATI[15: 8];
    end
    
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            PIODATA[ 7: 0] <= 8'h00;
        else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[0] == 1'b1))
            PIODATA[ 7: 0] <= DATI[ 7: 0];
    end

    always @(CE or PI) begin
        if (CE == 1'b1)
            begin
                DATO[31:24] <= PI[31:24];
                DATO[23:16] <= PI[23:16];
                DATO[15: 8] <= PI[15: 8];
                DATO[ 7: 0] <= PI[ 7: 0];
            end
        else
            begin
                DATO[31:0] <= 32'h00000000;
            end
    end

//======================================================
  endmodule
//======================================================