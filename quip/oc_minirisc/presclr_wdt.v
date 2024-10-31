/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Mini-RISC-1                                                ////
////  Prescaler and Wachdog Counter                              ////
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

// Prescaler and Wachdog Counter
module presclr_wdt(clk, rst, tcki, option, tmr0_we, tmr0_cnt_en, wdt_en, wdt_clr, wdt_to);
input		clk;
input		rst;
input		tcki;
input	[5:0]	option;
input		tmr0_we;
output		tmr0_cnt_en;
input		wdt_en, wdt_clr;
output		wdt_to;


reg	[7:0]	prescaler;
reg	[7:0]	wdt;

reg		tmr0_cnt_en;
reg		tcki_r;
reg		wdt_to;

wire		tose;
wire		tosc;
wire		psa;
wire	[2:0]	ps;
wire		tcki_a, tcki_b;
wire		presclr_ce;
wire		prsclr_clr;
wire		wdt_to_direct;
reg		presclr_out, presclr_out_r1;
wire		presclr_out_next;
wire	[7:0]	presclr_plus_1, wdt_plus_1;
wire	[7:0]	prescaler_next, prescaler_next1;
wire	[7:0]	wdt_next, wdt_next1;

// Inputs select
assign	ps = option[2:0];
assign	psa = option[3];
assign	tose = option[4];
assign	tosc = option[5];

always @(posedge clk)
	tcki_r <= #1 tcki;

assign  tcki_a = tose ^ tcki_r;
assign	tcki_b = tosc ? tcki_a : 1'b1;
assign	presclr_ce = psa ? wdt_to_direct : tcki_b;

always @(posedge clk)
	tmr0_cnt_en <= #1 psa ? tcki_b : presclr_out;


// Prescaler
assign	prsclr_clr = psa ? wdt_clr : tmr0_we;

always @(posedge clk)
	//if(rst | prsclr_clr)	prescaler <= #1 8'h00;
	//else
	//if(presclr_ce)		prescaler <= #1 presclr_plus_1;
	prescaler <= #1 prescaler_next;

mux2_8 u3( .sel(rst | prsclr_clr), .in1(8'h00), .in0(prescaler_next1), .out(prescaler_next) );
mux2_8 u4( .sel(presclr_ce), .in1(presclr_plus_1), .in0(prescaler), .out(prescaler_next1) );


mux8_1 u2( .sel(ps), .in(prescaler), .out(presclr_out_next) );

always @(posedge clk)
	presclr_out_r1 <= #1 presclr_out_next;

always @(posedge clk)	// Edge detector for prescaler output
	presclr_out <= #1 presclr_out_next & ~presclr_out_r1 & ~prsclr_clr;

inc8 u0( .in(prescaler), .out(presclr_plus_1));

// Wachdog timer
always @(posedge clk)
	wdt_to <= #1 psa ? presclr_out : wdt_to_direct;

always @(posedge clk)
	//if(rst | wdt_clr)	wdt <= #1 8'h00;
	//else
	//if(wdt_en)		wdt <= #1 wdt_plus_1;
	wdt <= #1 wdt_next;

mux2_8 u5( .sel(rst | wdt_clr), .in1(8'h00), .in0(wdt_next1), .out(wdt_next) );
mux2_8 u6( .sel(wdt_en), .in1(wdt_plus_1), .in0(wdt), .out(wdt_next1) );
 
assign	wdt_to_direct = (wdt == 8'hff);

inc8 u1( .in(wdt), .out(wdt_plus_1) );

endmodule
