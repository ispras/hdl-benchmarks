/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Mini-RISC-1                                                ////
////  Mini-Risc Core Top Levcel                                  ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          russelmann@hotmail.com                             ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000 Rudolf Usselmann                         ////
////                    russelmann@hotmail.com                   ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
//// THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY        ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT           ////
//// LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND   ////
//// FITNESS FOR A PARTICULAR PURPOSE.                           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


`timescale 1ns / 10ps

module oc_minirisc_top(
   clk, rst_in,
   porta, portb, portc,
   tcki,
   wdt_en );

// Basic Core I/O.
input		clk;
input		rst_in;

// I/O Ports
inout  [7:0]	porta;
inout  [7:0]	portb;
inout  [7:0]	portc;

input		tcki;
input		wdt_en;

////////////////////////////////////////////////////////////////////////
//
// Local Wires
//

wire [10:0]	inst_addr;
wire [11:0]	inst_data;

wire [7:0]	portain;
wire [7:0]	portbin;
wire [7:0]	portcin;

wire [7:0]	portaout;
wire [7:0]	portbout;
wire [7:0]	portcout;

wire [7:0]	trisa;
wire [7:0]	trisb;
wire [7:0]	trisc;

wire		block0, block1, wr_block0, wr_block1;

wire [10:0]	wr_adr;		// This signals can be used to optionally
wire [11:0]	wr_data;	// fill the internal ram from external memory
wire		we;

wire [11:0]	dout_unused;

////////////////////////////////////////////////////////////////////////
//
// IO Buffers
//

assign porta[0] = trisa[0] ? 1'bz : portaout[0];
assign porta[1] = trisa[1] ? 1'bz : portaout[1];
assign porta[2] = trisa[2] ? 1'bz : portaout[2];
assign porta[3] = trisa[3] ? 1'bz : portaout[3];
assign porta[4] = trisa[4] ? 1'bz : portaout[4];
assign porta[5] = trisa[5] ? 1'bz : portaout[5];
assign porta[6] = trisa[6] ? 1'bz : portaout[6];
assign porta[7] = trisa[7] ? 1'bz : portaout[7];

assign portb[0] = trisb[0] ? 1'bz : portbout[0];
assign portb[1] = trisb[1] ? 1'bz : portbout[1];
assign portb[2] = trisb[2] ? 1'bz : portbout[2];
assign portb[3] = trisb[3] ? 1'bz : portbout[3];
assign portb[4] = trisb[4] ? 1'bz : portbout[4];
assign portb[5] = trisb[5] ? 1'bz : portbout[5];
assign portb[6] = trisb[6] ? 1'bz : portbout[6];
assign portb[7] = trisb[7] ? 1'bz : portbout[7];

assign portc[0] = trisc[0] ? 1'bz : portcout[0];
assign portc[1] = trisc[1] ? 1'bz : portcout[1];
assign portc[2] = trisc[2] ? 1'bz : portcout[2];
assign portc[3] = trisc[3] ? 1'bz : portcout[3];
assign portc[4] = trisc[4] ? 1'bz : portcout[4];
assign portc[5] = trisc[5] ? 1'bz : portcout[5];
assign portc[6] = trisc[6] ? 1'bz : portcout[6];
assign portc[7] = trisc[7] ? 1'bz : portcout[7];

assign portain = porta;
assign portbin = portb;
assign portcin = portc;

////////////////////////////////////////////////////////////////////////
//
// Mini Risc Core
//

oc_minirisc u0(
   clk,
   rst_in,
   
   inst_addr,
   inst_data,

   portain,
   portbin,
   portcin,

   portaout,
   portbout,
   portcout,

   trisa,
   trisb,
   trisc,
   
   tcki,
   wdt_en );


////////////////////////////////////////////////////////////////////////
//
// Program memory
//

// Optional interface to fill the memory from external ROM
assign	wr_adr = 11'h0;
assign	wr_data = 12'h0;
assign	we = 1'b0;

// Block selects
assign	block0 = ~inst_addr[10];
assign	block1 = inst_addr[10];
assign  wr_block0 = ~wr_adr[10];
assign  wr_block1 = wr_adr[10];


RAMB4_S4_S4 u10(
	.CLKA(		clk	),
	.CLKB(		clk	),
	.RSTB(		1'b0	),
	.RSTA(		1'b0	),

	.DOA(	inst_data[3:0]	),
	.ADDRA(	inst_addr[9:0]	),
	.DIA(		4'h0	),
	.ENA(		block0	),
	.WEA(		1'b0	),

	.DOB(	dout_unused[3:0]	),
	.ADDRB(	wr_adr[9:0]	),
	.DIB(	wr_data[3:0]	),
	.ENB(	wr_block0	),
	.WEB(		we	)	);

RAMB4_S4_S4 u11(
	.CLKA(		clk	),
	.CLKB(		clk	),
	.RSTB(		1'b0	),
	.RSTA(		1'b0	),

	.DOA(	inst_data[7:4]	),
	.ADDRA(	inst_addr[9:0]	),
	.DIA(		4'h0	),
	.ENA(		block0	),
	.WEA(		1'b0	),

	.DOB(	dout_unused[7:4]	),
	.ADDRB(	wr_adr[9:0]	),
	.DIB(	wr_data[7:4]	),
	.ENB(	wr_block0	),
	.WEB(		we	)	);

RAMB4_S4_S4 u12(
	.CLKA(		clk	),
	.CLKB(		clk	),
	.RSTB(		1'b0	),
	.RSTA(		1'b0	),

	.DOA(	inst_data[11:8]	),
	.ADDRA(	inst_addr[9:0]	),
	.DIA(		4'h0	),
	.ENA(		block0	),
	.WEA(		1'b0	),

	.DOB(	dout_unused[11:8]	),
	.ADDRB(	wr_adr[9:0]	),
	.DIB(	wr_data[11:8]	),
	.ENB(	wr_block0	),
	.WEB(		we	)	);

//	Depending on how much memory you need and how much is
//	available in the device uncomment the below block
/*
RAMB4_S4_S4 u10(
	.CLKA(		clk	),
	.CLKB(		clk	),
	.RSTB(		1'b0	),
	.RSTA(		1'b0	),

	.DOA(	inst_data[3:0]	),
	.ADDRA(	inst_addr[9:0]	),
	.DIA(		4'h0	),
	.ENA(		block1	),
	.WEA(		1'b0	),

	.DOB(			),
	.ADDRB(	wr_adr[9:0]	),
	.DIB(	wr_data[3:0]	),
	.ENB(	wr_block1	),
	.WEB(		we	)	);

RAMB4_S4_S4 u11(
	.CLKA(		clk	),
	.CLKB(		clk	),
	.RSTB(		1'b0	),
	.RSTA(		1'b0	),

	.DOA(	inst_data[7:4]	),
	.ADDRA(	inst_addr[9:0]	),
	.DIA(		4'h0	),
	.ENA(		block1	),
	.WEA(		1'b0	),

	.DOB(			),
	.ADDRB(	wr_adr[9:0]	),
	.DIB(	wr_data[7:4]	),
	.ENB(	wr_block1	),
	.WEB(		we	)	);

RAMB4_S4_S4 u12(
	.CLKA(		clk	),
	.CLKB(		clk	),
	.RSTB(		1'b0	),
	.RSTA(		1'b0	),

	.DOA(	inst_data[11:8]	),
	.ADDRA(	inst_addr[9:0]	),
	.DIA(		4'h0	),
	.ENA(		block1	),
	.WEA(		1'b0	),

	.DOB(			),
	.ADDRB(	wr_adr[9:0]	),
	.DIB(	wr_data[11:8]	),
	.ENB(	wr_block1	),
	.WEB(		we	)	);

*/



endmodule
