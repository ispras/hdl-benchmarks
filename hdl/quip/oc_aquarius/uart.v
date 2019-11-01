//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : UART (Asynchronous Serial Interface)
//------------------------------------------------------
// File        : uart.v
// Library     : none
// Description : Asynchronous Serial Interface
//               8bit, 1stop-bit, non-parity
//               Based on "SASC" from www.opencores.org
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 30th October 2002
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
// UART : Asynchronous Serial Interface
//
// [UARTREG] 32bit Register
//
// 2'h0 : UARTBG0 Baud Rate Generator Div0 (read/write)
//  31    30    29    28    27    26    25    24
//   7     6     5     4     3     2     1     0
// -----------------------------------------------
//| B07 | B06 | B05 | B04 | B03 | B02 | B01 | B00 |
// -----------------------------------------------
//
// 2'h1 : UARTBG1 Baud Rate Generator Div1 (read/write)
//  23    22    21    20    19    18    17    16
//   7     6     5     4     3     2     1     0
// -----------------------------------------------
//| B17 | B16 | B15 | B14 | B13 | B12 | B11 | B10 |
// -----------------------------------------------
//
// 2'h2 : UARTCON (TXE=~full_o, RXF=~empty_o) (read only)
//  15    14    13    12    11    10       9          8
//   7     6     5     4     3     2       1          0
// --------------------------------------------------------
//|     |     |     |     |     |     | TX_full | RX_empty |
// --------------------------------------------------------
//
// 2'h3 : UARTTXD(Write)/UARTRXD(Read)
//   7     6     5     4     3     2     1     0
//   7     6     5     4     3     2     1     0
// -----------------------------------------------
//| TR7 | TR6 | TR5 | TR4 | TR3 | TR2 | TR1 | TR0 |
// -----------------------------------------------

//*************************************************
// Module Definition
//*************************************************
module uart (
               CLK, RST, 
               CE, WE, SEL, 
               DATI, DATO,
               RXD, TXD, CTS, RTS
           );

//-------------------
// Module I/O Signals
//-------------------
    input  CLK;          // clock
    input  RST;          // reset
    input  CE;           // chip enable
    input  WE;           // write enable (read = 0, write = 1)
    input  [3:0]SEL;     // data valid position
    input  [31:0] DATI;  // write data
    output [31:0] DATO;  // read data
    input  RXD;          // receive data
    output TXD;          // transmit data
    input  CTS;          // clear to send
    output RTS;          // request to send

//-----------------
// Internal Signals
//-----------------
    reg    WRTXD,  RDRXD;
    reg    WRTXD1, RDRXD1;
    reg    [31:0] DATO;
							
    wire   RXD, TXD, CTS, RTS;
    wire   sio_ce, sio_ce_x4;		   
    reg    [7:0] din_i;  // TX_DATA
    wire   [7:0] dout_o; // RX_DATA
    reg    re_i, we_i;
    wire   full_o, empty_o;
    reg    [7:0] div0;
    reg    [7:0] div1;  
 
//----------------------
// Register R/W Operation
//----------------------
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            div0[7:0] <= 8'h00;
        else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[3] == 1'b1))
            div0[7:0] <= DATI[31:24];
    end
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            div1[7:0] <= 8'h00;
        else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[2] == 1'b1))
            div1[7:0] <= DATI[23:16];
    end
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            din_i[7:0] <= 8'h00;
        else if (WRTXD)
            din_i[7:0] <= DATI[7:0];
    end		   
//-----------------------
    always @(CE or div0 or div1 or full_o or empty_o or dout_o)
    begin
        if (CE == 1'b1)
            begin
                DATO[31:24] <= div0[7:0];
                DATO[23:16] <= div1[7:0];
			    DATO[15: 8] <= {6'h00, full_o, empty_o};
			    DATO[ 7: 0] <= dout_o;
            end
        else
            begin
                DATO[31:0] <= 32'h00000000;
            end
    end
//-----------------------
    always @(CE or WE or SEL)
    begin
        if ((CE == 1'b1) && (WE == 1'b1) && (SEL[0] == 1'b1))
	       WRTXD <= 1'b1;
        else
	       WRTXD <= 1'b0;
    end				
    always @(posedge CLK or posedge RST)
    begin
	   if (RST)
	       WRTXD1 <= 1'b0;
	   else
	       WRTXD1 <= WRTXD;
    end
    always @(WRTXD or WRTXD1)
    begin
	   we_i <= ~WRTXD & WRTXD1; // negate edge of WRTXD
    end
//-----------------------
    always @(CE or WE or SEL)
    begin
        if ((CE == 1'b1) && (WE == 1'b0) && (SEL[0] == 1'b1))
	       RDRXD <= 1'b1;
        else
	       RDRXD <= 1'b0;
    end				
    always @(posedge CLK or posedge RST)
    begin
	   if (RST)
	       RDRXD1 <= 1'b0;
	   else
	       RDRXD1 <= RDRXD;
    end
    always @(RDRXD or RDRXD1)
    begin
	   re_i <= ~RDRXD & RDRXD1; // negate edge of RDRXD
    end

//---------------------
// UART Internal Blocks
//---------------------

sasc_top TOP(.clk(CLK), .rst(~RST),
             .rxd_i(RXD), .txd_o(TXD), .cts_i(CTS), .rts_o(RTS),
		   .sio_ce(sio_ce), .sio_ce_x4(sio_ce_x4),
	        .din_i(din_i), .dout_o(dout_o), .re_i(re_i), .we_i(we_i),
		   .full_o(full_o), .empty_o(empty_o)
	       );

sasc_brg BRG(.clk(CLK), .rst(~RST),
           .div0(div0), .div1(div1),  
		   .sio_ce(sio_ce), .sio_ce_x4(sio_ce_x4)
            );

//======================================================
  endmodule
//======================================================