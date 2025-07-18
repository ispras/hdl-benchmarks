/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Mini-RISC-1                                                ////
////  Register File                                              ////
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

module register_file(	clk,
			rf_rd_bnk, rf_rd_addr, rf_rd_data,
			rf_we, rf_wr_bnk, rf_wr_addr, rf_wr_data);

input		clk;
input  [1:0]	rf_rd_bnk;
input  [4:0]	rf_rd_addr;
output [7:0]	rf_rd_data;
input		rf_we;
input  [1:0]	rf_wr_bnk;
input  [4:0]	rf_wr_addr;
input  [7:0]	rf_wr_data;

wire		clk;
wire [7:0]	rf_rd_data;
wire [6:0]	rd_addr;
wire [6:0]	wr_addr;
wire [7:0]	rf_rd_data_mem;
reg  [7:0]	wr_data_tmp;
reg		rd_wr_addr_equal;
wire		rd_wr_addr_equal_tmp;
//reg  [6:0]	rd_adr_r, wr_adr_r;

// Simple Read & Write Address Mapping to memory address

assign	rd_addr = 	rf_rd_addr[4] ?
			{1'b0, rf_rd_bnk, rf_rd_addr[3:0]} :
			{1'b1, 2'b00, 1'b0, rf_rd_addr[2:0]};

assign	wr_addr = 	rf_wr_addr[4] ?
			{1'b0, rf_wr_bnk, rf_wr_addr[3:0]} :
			{1'b1, 2'b00, 1'b0, rf_wr_addr[2:0]};

// This logic is to bypass the register file if we are reading and
// writing (in previous instruction) to the same register
always @(posedge clk)
	rd_wr_addr_equal <= #1 rd_wr_addr_equal_tmp;

//assign rd_wr_addr_equal_tmp = (rd_addr==wr_addr) & rf_we;

cmp8_eq u0( .eq(rd_wr_addr_equal_tmp), .a({rf_we, rd_addr}), .b({1'b1, wr_addr}) );

//always @(posedge clk)
//	rd_adr_r <= #1 {rf_rd_bnk, rf_rd_addr};

//always @(posedge clk)
//	wr_adr_r <= #1 {rf_wr_bnk, rf_wr_addr};

//cmp8_eq u0( .eq(rd_wr_addr_equal), .a({rf_we, rd_adr_r}), .b({1'b1, wr_adr_r}) );

//assign rf_rd_data = rd_wr_addr_equal ? wr_data_tmp : rf_rd_data_mem;

mux2_8 u2( .sel(rd_wr_addr_equal), .in1(wr_data_tmp), .in0(rf_rd_data_mem), .out(rf_rd_data) );

always @(posedge clk)
	wr_data_tmp <= #1 rf_wr_data;

// This is the actual Memory
ssram_128x8	u1(clk, rd_addr, rf_rd_data_mem, rf_we, wr_addr, rf_wr_data);


endmodule
