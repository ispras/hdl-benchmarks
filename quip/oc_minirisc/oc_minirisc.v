/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Mini-RISC-1                                                ////
////  Mini-Risc Core                                             ////
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

module oc_minirisc(
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

// Basic Core I/O.
input		clk;
input		rst_in;

// Program memory interface
output [10:0]	inst_addr;
input  [11:0]	inst_data;

// Basic I/O Ports
input  [7:0]	portain;
input  [7:0]	portbin;
input  [7:0]	portcin;

output [7:0]	portaout;
output [7:0]	portbout;
output [7:0]	portcout;

output [7:0]	trisa;
output [7:0]	trisb;
output [7:0]	trisc;

input		tcki;
input		wdt_en;

// This should be set to the ROM location where our restart vector is.
// As set here, we have 512 words of program space.
parameter	PC_RST_VECTOR	= 11'h000,	// Should be: 11'h7FF,
		STAT_RST_VALUE	= 8'h18,
		OPT_RST_VALUE	= 8'h3f,
		FSR_RST_VALUE	= 7'h0,
		TRIS_RST_VALUE	= 8'hff;

parameter	ALU_ADD		= 4'h0,
		ALU_SUB 	= 4'h1,
		ALU_INC 	= 4'h2,
		ALU_DEC 	= 4'h3,

		ALU_AND 	= 4'h4,
		ALU_CLR 	= 4'h5,
		ALU_NOT 	= 4'h6,
		ALU_IOR 	= 4'h7,
		ALU_MOV 	= 4'h8,
		ALU_MOVW	= 4'h9,
		ALU_RLF 	= 4'ha,
		ALU_RRF 	= 4'hb,
		ALU_SWP 	= 4'hc,
		ALU_XOR 	= 4'hd,
		ALU_BCF 	= 4'he,
		ALU_BSF 	= 4'hf;

parameter	// Byte Oriented RF Operations
		I_ADDWF		= 12'b0001_11??_????,
		I_ANDWF		= 12'b0001_01??_????,
		I_CLRF		= 12'b0000_011?_????,
		I_CLRW		= 12'b0000_0100_0000,
		I_COMF		= 12'b0010_01??_????,
		I_DEC		= 12'b0000_11??_????,
		I_DECFSZ	= 12'b0010_11??_????,
		I_INCF		= 12'b0010_10??_????,
		I_INCFSZ	= 12'b0011_11??_????,
		I_IORWF		= 12'b0001_00??_????,
		I_MOV		= 12'b0010_00??_????,
		I_MOVWF		= 12'b0000_001?_????,
		I_NOP		= 12'b0000_0000_0000,
		I_RLF		= 12'b0011_01??_????,
		I_RRF		= 12'b0011_00??_????,
		I_SUBWF		= 12'b0000_10??_????,
		I_SWAPF		= 12'b0011_10??_????,
		I_XORWF		= 12'b0001_10??_????,

		// Bit Oriented RF Operations
		I_BCF		= 12'b0100_????_????,
		I_BSF		= 12'b0101_????_????,
		I_BTFSC		= 12'b0110_????_????,
		I_BTFSS		= 12'b0111_????_????,

		// Literal & Controll Operations
		I_ANDLW		= 12'b1110_????_????,
		I_CALL		= 12'b1001_????_????,
		I_CLRWDT	= 12'b0000_0000_0100,
		I_GOTO		= 12'b101?_????_????,
		I_IORLW		= 12'b1101_????_????,
		I_MOVLW		= 12'b1100_????_????,
		I_OPTION	= 12'b0000_0000_0010,
		I_RETLW		= 12'b1000_????_????,
		I_SLEEP		= 12'b0000_0000_0011,
		I_TRIS		= 12'b0000_0000_0???,
		I_XORLW		= 12'b1111_????_????;

parameter	// sfr register address encodings
		INDF_ADDR	= 3'h0,
		TMR0_ADDR	= 3'h1,
		PCL_ADDR	= 3'h2,
		STAT_ADDR	= 3'h3,
		FSR_ADDR	= 3'h4,
		PORTA_ADDR	= 3'h5,
		PORTB_ADDR	= 3'h6,
		PORTC_ADDR	= 3'h7;

parameter	// Source 1 Select
		K_SEL		= 2'b10,
		SFR_SEL 	= 2'b00,
		RF_SEL		= 2'b01;

parameter	// STATUS Register status bits we
		STAT_WR_C	= 3'b001,
		STAT_WR_DC	= 3'b010,
		STAT_WR_Z	= 3'b100;


// Instruction Register
reg		rst;
reg  [11:0]	instr_0, instr_1;
reg		rst_r1, rst_r2;
wire		valid;
reg		valid_1;

reg  [7:0]	mask;
reg  [7:0]	sfr_rd_data;
reg  [3:0]	alu_op;
reg  		src1_sel;
reg  [1:0]	src1_sel_;

wire [7:0]	dout;		// ALU output
wire [7:0]	src1;		// ALU Source 1

reg  [2:0]	stat_bwe;	// status bits we
wire		c_out, dc_out, z_out;

reg		pc_skz, pc_skz_;
reg		pc_bset, pc_bset_;
reg		pc_bclr, pc_bclr_;
reg		pc_call, pc_call_;
reg		pc_goto, pc_goto_;
reg		pc_retlw, pc_retlw_;

wire		invalidate_1;
wire		invalidate_0_;
reg		invalidate_0;

// stage 1 dst decode
reg		w_we_;
reg		rf_we_;
reg		sfr_we_;
reg		tris_we_;

// stage 2 dst decode
reg		w_we;
wire		rf_we;
reg		rf_we1, rf_we2, rf_we3;

reg		opt_we;
reg		trisa_we;
reg		trisb_we;
reg		trisc_we;

wire		indf_we_;
reg		tmr0_we;
wire		pc_we_;
reg		pc_we;
reg		stat_we;
reg		fsr_we;
reg		porta_we;
reg		portb_we;
reg		portc_we;

wire		bit_sel;
wire [7:0]	tmr0_next, tmr0_next1, tmr0_plus_1;
wire		tmr0_cnt_en;
reg		wdt_clr;
wire		wdt_to;
wire		wdt_en;
wire		tcki;

wire [7:0]	sfr_rd_data_tmp1, sfr_rd_data_tmp2, sfr_rd_data_tmp3;

// Register File Connections
wire [1:0]	rf_rd_bnk, rf_wr_bnk;
wire [4:0]	rf_rd_addr, rf_wr_addr;
wire [7:0]	rf_rd_data, rf_wr_data;

// Program Counter 
reg  [10:0]	inst_addr;
reg  [10:0]	pc;
wire [10:0]	pc_next;
wire [10:0]	pc_plus_1;
wire [10:0]	stack_out;
reg  [10:0]	pc_r, pc_r2;
wire [10:0]	pc_next1, pc_next2, pc_next3;

// W Register
reg  [7:0]	w;			// Working Register
reg  [7:0]	status;			// Status Register
wire [7:0]	status_next;
reg  [6:0]	fsr;			// fsr register ( for indirect addressing)
wire [6:0]	fsr_next;
reg  [7:0]	tmr0;			// Timer 0
reg  [5:0]	option;			// Option Register

// Tristate Control registers. 
reg [7:0]	trisa;
reg [7:0]	trisb;
reg [7:0]	trisc;

// I/O Port registers
reg [7:0]	porta_r;	// PORTA input register
reg [7:0]	portb_r;	// PORTB input register
reg [7:0]	portc_r;	// PORTC input register
reg [7:0]	portaout;	// PORTA output register
reg [7:0]	portbout;	// PORTB output register
reg [7:0]	portcout;	// PORTC output register

////////////////////////////////////////////////////////////////////////
// External Reset is Synchrounous to clock
always @(posedge clk)
	rst <= #1 rst_in;

////////////////////////////////////////////////////////////////////////
// Synchrounous Register File
register_file u0(	.clk(clk), .rf_rd_bnk(rf_rd_bnk), .rf_rd_addr(rf_rd_addr), .rf_rd_data(rf_rd_data),
			.rf_we(rf_we), .rf_wr_bnk(rf_wr_bnk), .rf_wr_addr(rf_wr_addr), .rf_wr_data(rf_wr_data) );

////////////////////////////////////////////////////////////////////////
// Always Fetch Next Instruction
always @(posedge clk)
	instr_0 <= #1 inst_data;

////////////////////////////////////////////////////////////////////////
// Instr Decode & Read Logic

always @(posedge clk)
   begin
	rst_r1 <= #1 rst | wdt_to;
	rst_r2 <= #1 rst | rst_r1 | wdt_to;
   end

assign valid = ~rst_r2 & ~invalidate_1;
always @(posedge clk)
	valid_1 <= #1 valid;

always @(posedge clk) // Basic Decode extracted directly from the instruction
   begin
   	instr_1 <= #1 instr_0;
	// Mask for bit modification instructions
	case(instr_0[7:5])	// synopsys full_case parallel_case 
	   0: mask <= #1 8'h01;
	   1: mask <= #1 8'h02;
	   2: mask <= #1 8'h04;
	   3: mask <= #1 8'h08;
	   4: mask <= #1 8'h10;
	   5: mask <= #1 8'h20;
	   6: mask <= #1 8'h40;
	   7: mask <= #1 8'h80;
	endcase
   end

always @(posedge clk)
	pc_r <= #1 pc;	// Previous version of PC to accomodate for pipeline

/*
always @(posedge clk)		// SFR Read Operands
   if(src1_sel_[1])	sfr_rd_data <= #1 instr_0[7:0];
   else
   case(instr_0[2:0])	// synopsys full_case parallel_case
      1: sfr_rd_data <= #1 tmr0_next;
      2: sfr_rd_data <= #1 pc_r[7:0];
      3: sfr_rd_data <= #1 status_next;
      4: sfr_rd_data <= #1 {1'b1, fsr_next};
      5: sfr_rd_data <= #1 porta_r;
      6: sfr_rd_data <= #1 portb_r;
      7: sfr_rd_data <= #1 portc_r;
   endcase
*/

always @(posedge clk)
	sfr_rd_data <= #1 sfr_rd_data_tmp1;


reg	[3:0]	sfr_sel;
wire	[3:0]	sfr_sel_src;

assign	sfr_sel_src = {src1_sel_[1],instr_0[2:0]};

always @(sfr_sel_src)
	casex(sfr_sel_src)	// synopsys full_case parallel_case
	   4'b1_???:	sfr_sel = 4'b01_11;
	   4'b0_001:	sfr_sel = 4'bxx_00;
	   4'b0_010:	sfr_sel = 4'b00_11;
	   4'b0_011:	sfr_sel = 4'bxx_01;
	   4'b0_100:	sfr_sel = 4'bxx_10;
	   4'b0_101:	sfr_sel = 4'b10_11;
	   4'b0_11?:	sfr_sel = 4'b11_11;
	endcase


mux4_8 u1(	.sel(sfr_sel[1:0]), .out(sfr_rd_data_tmp1),
		.in0(tmr0_next), .in1(status_next),
		.in2({1'b1, fsr_next}), .in3(sfr_rd_data_tmp2)	);

mux4_8 u2(	.sel(sfr_sel[3:2]), .out(sfr_rd_data_tmp2),
		.in0(pc_r[7:0]), .in1(instr_0[7:0]),
		.in2(porta_r), .in3(sfr_rd_data_tmp3)	);

mux2_8 u2b(	.sel(instr_0[0]), .out(sfr_rd_data_tmp3),
		.in0(portb_r), .in1(portc_r)	);


// Register File Read Port
assign rf_rd_bnk  = fsr_next[6:5];
assign rf_rd_addr = (instr_0[4:0]==0) ? fsr_next[4:0] : instr_0[4:0];


// ALU OP
always @(posedge clk)
   casex(instr_0)	// synopsys full_case
					// Byte Oriented RF Operations
      I_ADDWF:	alu_op <= #1 ALU_ADD;	// ADDWF
      I_ANDWF:	alu_op <= #1 ALU_AND;	// ANDWF
      I_CLRF:	alu_op <= #1 ALU_CLR;	// CLRF
      I_CLRW:	alu_op <= #1 ALU_CLR;	// CLRW
      I_COMF:	alu_op <= #1 ALU_NOT;	// COMF
      I_DEC:	alu_op <= #1 ALU_DEC;	// DEC
      I_DECFSZ:	alu_op <= #1 ALU_DEC;	// DECFSZ
      I_INCF:	alu_op <= #1 ALU_INC;	// INCF
      I_INCFSZ: alu_op <= #1 ALU_INC;	// INCFSZ
      I_IORWF:	alu_op <= #1 ALU_IOR;	// IORWF
      I_MOV:	alu_op <= #1 ALU_MOV;	// MOV
      I_MOVWF:	alu_op <= #1 ALU_MOVW;	// MOVWF
      I_RLF:	alu_op <= #1 ALU_RLF;	// RLF
      I_RRF:	alu_op <= #1 ALU_RRF;	// RRF
      I_SUBWF:	alu_op <= #1 ALU_SUB;	// SUBWF
      I_SWAPF:	alu_op <= #1 ALU_SWP;	// SWAPF
      I_XORWF:	alu_op <= #1 ALU_XOR;	// XORWF
					// Bit Oriented RF Operations
      I_BCF:	alu_op <= #1 ALU_BCF;	// BCF
      I_BSF:	alu_op <= #1 ALU_BSF;	// BSF
					// Literal & Controll Operations
      I_ANDLW:	alu_op <= #1 ALU_AND;	// ANDLW
      I_IORLW:	alu_op <= #1 ALU_IOR;	// IORLW
      I_MOVLW:	alu_op <= #1 ALU_MOV;	// MOWLW
      I_RETLW:	alu_op <= #1 ALU_MOV;	// RETLW
      I_XORLW:	alu_op <= #1 ALU_XOR;	// XORLW
   endcase



// Source Select
// This CPU source 1 can be one of: rf (or sfr) or k,
// second source (if any) is always w
always @(instr_0)
   casex(instr_0)	// synopsys full_case parallel_case
      I_ANDLW:	src1_sel_ = K_SEL;
      I_CALL:	src1_sel_ = K_SEL;
      I_GOTO:	src1_sel_ = K_SEL;
      I_IORLW:	src1_sel_ = K_SEL;
      I_MOVLW:	src1_sel_ = K_SEL;
      I_RETLW:	src1_sel_ = K_SEL;
      I_XORLW:	src1_sel_ = K_SEL;
      default:	src1_sel_ = (instr_0[4:3]==2'h0 & instr_0[2:0] != 0) ? SFR_SEL : RF_SEL;
   endcase

always @(posedge clk)
	src1_sel <= #1 src1_sel_[0];

// Destination Select
// Destination can be one of: rf, w, option, tris OR one of sfr registers: 
// indf, tmr0, pc, status, fsr, porta, portb, portc, option, trisa, trisb, trisc
// Stage 1
// select w, pc, rf or sfr
reg	w_we1, w_we1_;

always @(instr_0)
   begin
	casex(instr_0)	// synopsys full_case parallel_case
	   I_ADDWF, I_ANDWF, I_COMF, I_DEC,
	   I_DECFSZ, I_INCF, I_INCFSZ, I_IORWF,
	   I_MOV, I_RLF, I_RRF, I_SUBWF,
	   I_SWAPF, I_XORWF:				// w or f
			w_we1_	= 1;
	   default: 	w_we1_	= 0;
	endcase
   end
   
always @(instr_0)
   begin
	w_we_	= 0;
	rf_we_	= 0;
	sfr_we_	= 0;
	tris_we_= 0;
	casex(instr_0)	// synopsys full_case parallel_case

	   I_ADDWF, I_ANDWF, I_COMF, I_DEC,
	   I_DECFSZ, I_INCF, I_INCFSZ, I_IORWF,
	   I_MOV, I_RLF, I_RRF, I_SUBWF,
	   I_SWAPF, I_XORWF:				// w or f
		   begin
			rf_we_	= instr_0[5] & (instr_0[4] | instr_0[3]);
			sfr_we_	= instr_0[5] & ~instr_0[4] & ~instr_0[3];
		   end

	   I_MOVWF, I_CLRF, I_BCF, I_BSF:		// only f
		   begin
			rf_we_	= instr_0[4] | instr_0[3];
			sfr_we_	= ~instr_0[4] & ~instr_0[3];
		   end

	   I_CLRW, I_IORLW, I_MOVLW,
	   I_ANDLW, I_RETLW, I_XORLW:	w_we_ = 1;	// only w
	   I_TRIS:			tris_we_ = 1;	// trisa or trisb or trisc

	endcase
   end

assign	indf_we_ = sfr_we_ & (instr_0[2:0] == INDF_ADDR);
assign  pc_we_   = sfr_we_ & (instr_0[2:0] == PCL_ADDR);

// Stage 2 destination encoder
// write enable outputs are registered now
always @(posedge clk)
	w_we		<= #1 w_we_;	// working register write 0 enable

always @(posedge clk)
	w_we1		<= #1 w_we1_;	// working register write 1 enable


// Register File Write Enable is composed of thee conditions: 1) direct register writing (0x10-0x1f);
// 2) Direct Global Register writing (0x08-0x0f), and 3) Indirect Register File Writing
// The logic has been partitioned and balanced between the decode and execute stage ...
/*
assign	rf_we = (valid_1 & rf_we1) | (valid_1 & rf_we2 & rf_we3);// register file write enable Composite

always @(posedge clk)
	rf_we1		<= #1 rf_we_;				// register file write enable 1

always @(posedge clk)
	rf_we2		<= #1 fsr_next[4] | fsr_next[3];	// register file write enable 2 

always @(posedge clk)
	rf_we3		<= #1 indf_we_;				// register file write enable 3
*/

assign	rf_we = rf_we1 |  (rf_we2 & rf_we3);// register file write enable Composite

always @(posedge clk)
	rf_we1		<= #1 valid & rf_we_;				// register file write enable 1

always @(posedge clk)
	rf_we2		<= #1 valid & (fsr_next[4] | fsr_next[3]);	// register file write enable 2 

always @(posedge clk)
	rf_we3		<= #1 indf_we_;				// register file write enable 3




always @(posedge clk)
	wdt_clr		<= #1 instr_0[11:0] == I_CLRWDT;


always @(posedge clk)
	opt_we		<= #1 instr_0[11:0] == I_OPTION;


always @(posedge clk)
	trisa_we	<= #1 tris_we_ & (instr_0[2:0] == PORTA_ADDR);

always @(posedge clk)
	trisb_we	<= #1 tris_we_ & (instr_0[2:0] == PORTB_ADDR);

always @(posedge clk)
	trisc_we	<= #1 tris_we_ & (instr_0[2:0] == PORTC_ADDR);

always @(posedge clk)
   begin
	// SFR registers
	tmr0_we		<= #1 sfr_we_ & (instr_0[2:0] == TMR0_ADDR);
	pc_we		<= #1 valid & pc_we_;
	stat_we		<= #1 valid & sfr_we_ & (instr_0[2:0] == STAT_ADDR);
	fsr_we		<= #1 valid & sfr_we_ & (instr_0[2:0] == FSR_ADDR);
	porta_we	<= #1 sfr_we_ & (instr_0[2:0] == PORTA_ADDR);
	portb_we	<= #1 sfr_we_ & (instr_0[2:0] == PORTB_ADDR);
	portc_we	<= #1 sfr_we_ & (instr_0[2:0] == PORTC_ADDR);
  end


// Instructions that directly modify PC
always @(instr_0)
   begin
	pc_skz_  = 0;
	pc_bset_ = 0;
	pc_bclr_ = 0;
	pc_call_ = 0;
	pc_goto_ = 0;
	pc_retlw_ = 0;
	casex(instr_0)	// synopsys full_case parallel_case
					// Byte Oriented RF Operations
	   I_DECFSZ,
	   I_INCFSZ:	pc_skz_ = 1;
					// Bit Oriented RF Operations
	   I_BTFSS:	pc_bset_ = 1;
	   I_BTFSC:	pc_bclr_ = 1;
					// Literal & Controll Operations
	   I_CALL:	pc_call_ = 1;
	   I_GOTO:	pc_goto_ = 1;
	   I_RETLW:	pc_retlw_ = 1;
	endcase
   end


always @(posedge clk)
   begin
	pc_skz   <= #1 valid & pc_skz_;
	pc_bset  <= #1 valid & pc_bset_;
	pc_bclr  <= #1 valid & pc_bclr_;
	pc_call  <= #1 valid & pc_call_;
	pc_goto  <= #1 valid & pc_goto_;
	pc_retlw <= #1 valid & pc_retlw_;
   end

assign invalidate_0_ = (pc_call_ | pc_goto_ | pc_retlw_ | pc_we_);

always @(posedge clk)
   	invalidate_0	<= #1 invalidate_0_;

// Status bits WE
always @(posedge clk)
   begin
	stat_bwe <= #1 0;
	if(valid)
	casex(instr_0)	// synopsys full_case parallel_case
							// Byte Oriented RF Operations
	   I_ADDWF:	stat_bwe <= #1 STAT_WR_C | STAT_WR_DC | STAT_WR_Z;
	   I_ANDWF:	stat_bwe <= #1 STAT_WR_Z;
	   I_CLRF:	stat_bwe <= #1 STAT_WR_Z;
	   I_CLRW:	stat_bwe <= #1 STAT_WR_Z;
	   I_COMF:	stat_bwe <= #1 STAT_WR_Z;
	   I_DEC:	stat_bwe <= #1 STAT_WR_Z;
	   I_INCF:	stat_bwe <= #1 STAT_WR_Z;
 	   I_IORWF:	stat_bwe <= #1 STAT_WR_Z;
	   I_MOV:	stat_bwe <= #1 STAT_WR_Z;
	   I_RLF:	stat_bwe <= #1 STAT_WR_C;
	   I_RRF:	stat_bwe <= #1 STAT_WR_C;
	   I_SUBWF:	stat_bwe <= #1 STAT_WR_C | STAT_WR_DC | STAT_WR_Z;
	   I_XORWF:	stat_bwe <= #1 STAT_WR_Z;
							// Literal & Controll Operations
	   I_ANDLW:	stat_bwe <= #1 STAT_WR_Z;
	   //I_CLRWDT:					// Modifies TO & PD   *** FIX ME ***
	   I_IORLW:	stat_bwe <= #1 STAT_WR_Z;
	   //I_SLEEP:					// Modifies TO & PD   *** FIX ME ***
	   I_XORLW:	stat_bwe <= #1 STAT_WR_Z;
	endcase
 end

////////////////////////////////////////////////////////////////////////
// Wr & Execute Logic (including PC)
// Second Pipeline Stage
////////////////////////////////////////////////////////////////////////

// Source OP Sel
//assign src1 = src1_sel ? rf_rd_data : sfr_rd_data;
mux2_8 u3(	.sel(src1_sel), .in0(sfr_rd_data), .in1(rf_rd_data), .out(src1) );

alu u4( .s1(src1), .s2(w), .mask(mask), .out(dout),
	.op(alu_op), .c_in(status[0]), .c(c_out), .dc(dc_out), .z(z_out) );

// Register file connections
assign	rf_wr_bnk  = fsr[6:5];
assign  rf_wr_addr = (instr_1[4:0]==0) ? fsr[4:0] : instr_1[4:0];
assign  rf_wr_data = dout;

wire [7:0]	status_next2;

// Deal with all special registers (SFR) writes
/*
always @(rst or status or stat_we or stat_bwe or dout or c_out or dc_out or z_out)
	if(rst)		status_next = STAT_RST_VALUE;
	else
	   begin
		status_next = status;	// Default Keep Value
		if(stat_we)	status_next = dout | 8'h18;
		else
		   begin
			if(stat_bwe[0])	status_next[0] = c_out;
			if(stat_bwe[1])	status_next[1] = dc_out;
			if(stat_bwe[2])	status_next[2] = z_out;
		   end
	   end
*/

assign status_next2[0] = stat_bwe[0] ?  c_out : status[0];
assign status_next2[1] = stat_bwe[1] ? dc_out : status[1];
assign status_next2[2] = stat_bwe[2] ?  z_out : status[2];

mux2_8 u21( .sel(stat_we), .in1( {dout | 8'h18} ), .in0( {status[7:3],status_next2[2:0]} ), .out(status_next) );

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)	status <= #1 STAT_RST_VALUE;
	else	status <= #1 status_next;

//assign fsr_next = fsr_we ? dout[6:0] : fsr;

mux2_7 u31( .sel(fsr_we), .in1(dout[6:0]), .in0(fsr), .out(fsr_next) );

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)		fsr <= #1 FSR_RST_VALUE;
	else		fsr <= #1 fsr_next;

always @(posedge clk)
   	if(valid_1 & (w_we | (w_we1 & ~instr_1[5])) )	w <= #1 dout;

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)			trisa <= #1 TRIS_RST_VALUE;
	else
	if(trisa_we & valid_1)	trisa <= #1 w;

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)			trisb <= #1 TRIS_RST_VALUE;
	else
	if(trisb_we & valid_1)	trisb <= #1 w;

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)			trisc <= #1 TRIS_RST_VALUE;
	else
	if(trisc_we & valid_1)	trisc <= #1 w;

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)			option <= #1 OPT_RST_VALUE;
	else
	if(opt_we & valid_1)	option <= #1 w[5:0];

always @(posedge clk)
	if(porta_we & valid_1)	portaout <= #1 dout;

always @(posedge clk)
	if(portb_we & valid_1)	portbout <= #1 dout;

always @(posedge clk)
	if(portc_we & valid_1)	portcout <= #1 dout;

always @(posedge clk)
   begin
	porta_r <= #1 portain;
	portb_r <= #1 portbin;
	portc_r <= #1 portcin;
   end

///////////////////////////////////////////////////////////////////////
// Timer Logic

//assign tmr0_next = tmr0_we ? dout : tmr0_cnt_en ? tmr0_plus_1 : tmr0;
//assign tmr0_next = tmr0_we ? dout : tmr0_cnt_en ? (tmr0 + 1) : tmr0;


mux2_8 u5( .sel(tmr0_we & valid_1), .in0(tmr0_next1), .in1(dout), .out(tmr0_next) );
mux2_8 u6( .sel(tmr0_cnt_en), .in0(tmr0), .in1(tmr0_plus_1), .out(tmr0_next1) );
inc8 u7( .in(tmr0), .out(tmr0_plus_1) );


always @(posedge clk)
	tmr0 <= #1 tmr0_next;

presclr_wdt u8(	.clk(clk), .rst(rst), .tcki(tcki),
		.option(option[5:0]),
		.tmr0_we(tmr0_we & valid_1), 
		.tmr0_cnt_en(tmr0_cnt_en), .wdt_en(wdt_en),
		.wdt_clr(wdt_clr & valid_1),
		.wdt_to(wdt_to));


////////////////////////////////////////////////////////////////////////
// Programm Counter Logic

always @(posedge clk)
	pc_r2 <= #1 pc_r;

// 'inst_addr' is a duplication of the 'pc'. The only time when it is really needed
// is when the program memory is not on the chip and we want to place the registers
// directly in the IO pads to reduce Tcq (For example in a Xilinx FPGA implementation).
// If the program memory is on the chip or if the implmentation allows feedback from
// registers in the IO cells, this is not needed. Synopsys FPGA compiler appears to
// make the correct decission either way, and gett rid of unneded logic ...

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)		inst_addr <= #1 PC_RST_VECTOR;
	else		inst_addr <= #1 pc_next;

//synopsys sync_set_reset "rst"
always @(posedge clk)
	if(rst)		pc <= #1 PC_RST_VECTOR;
	else		pc <= #1 pc_next;

/*
always @(pc_plus_1 or dout or pc_we or status or stack_out or
	pc_call or pc_goto or pc_retlw or instr_1)
	if(pc_we)	pc_next = {status[6:5], 1'b0, dout};
	else
	if(!pc_call & !pc_goto & !pc_retlw)	pc_next = pc_plus_1;
	else
	if(pc_call)	pc_next = {status[6:5], 1'b0, instr_1[7:0]};
	else
	if(pc_goto)	pc_next = {status[6:5], instr_1[8:0]};
	else
	if(pc_retlw)	pc_next = stack_out;
*/


wire  [10:0]	pc_tmp1, pc_tmp2, pc_tmp3;
wire		pc_sel1;

assign	pc_tmp1 = {status[6:5], 1'b0, dout[7:0]};
assign	pc_tmp2 = {status[6:5], 1'b0, instr_1[7:0]};
assign	pc_tmp3 = {status[6:5], instr_1[8:0]};
assign	pc_sel1 = (!pc_call & !pc_goto & !pc_retlw);

mux2_11 u9 ( .sel(pc_we),   .in0(pc_next1),  .in1(pc_tmp1),   .out(pc_next)  );
mux2_11 u10( .sel(pc_sel1), .in0(pc_next2),  .in1(pc_plus_1), .out(pc_next1) );
mux2_11 u11( .sel(pc_call), .in0(pc_next3),  .in1(pc_tmp2),   .out(pc_next2) );
mux2_11 u12( .sel(pc_goto), .in0(stack_out), .in1(pc_tmp3),   .out(pc_next3) );


inc11 u13( .in(pc), .out(pc_plus_1) );

reg	invalidate_1_r1, invalidate_1_r2;

assign invalidate_1 =	(pc_skz & z_out) | (pc_bset & bit_sel) |
		 	(pc_bclr & !bit_sel) | (invalidate_0 & valid_1) | invalidate_1_r1;


always @(posedge clk)
   begin
	invalidate_1_r1 <= #1 (invalidate_0 & valid_1) | invalidate_1_r2;
	invalidate_1_r2 <= #1 (invalidate_0 & valid_1);
   end

//assign bit_sel = src1[ instr_1[7:5] ];
mux8_1 u22( .sel(instr_1[7:5]), .in(src1), .out(bit_sel) );

sfifo4x11 u14( .clk(clk), .push(pc_call), .din(pc_r2), .pop(pc_retlw), .dout(stack_out) );

endmodule
