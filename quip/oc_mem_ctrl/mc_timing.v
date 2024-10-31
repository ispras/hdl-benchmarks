/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE Memory Controller Main Timing Block               ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/mem_ctrl/  ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: mc_timing.v,v 1.2 2001/08/10 08:16:21 rudi Exp $
//
//  $Date:   22 Sep 2004 19:11:00  $
//  $Revision:   1.0  $
//  $Author:   kbrunham  $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log:   /pvcs/designs/hdl/oc_mem_ctrl/mc_timing.v__  $
// 
//    Rev 1.0   22 Sep 2004 19:11:00   kbrunham
// initial version 
// TO, Wed Sep 22 03:10:33 2004
// 
//    Rev 1.0   09 Sep 2003 15:50:42   kbrunham
// initial version
// TO, Mon Sep 08 23:50:30 2003
//               Revision 1.2  2001/08/10 08:16:21  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//               - Removed "Refresh Early" configuration
//
//               Revision 1.1  2001/07/29 07:34:41  rudi
//
//
//               1) Changed Directory Structure
//               2) Fixed several minor bugs
//
//               Revision 1.4  2001/06/14 01:57:37  rudi
//
//
//               Fixed a potential bug in a corner case situation where the TMS register
//               does not propegate properly during initialisation.
//
//               Revision 1.3  2001/06/12 15:19:49  rudi
//
//
//               Minor changes after running lint, and a small bug fix reading csr and ba_mask registers.
//
//               Revision 1.2  2001/06/03 11:37:17  rudi
//
//
//               1) Fixed Chip Select Mask Register
//               	- Power On Value is now all ones
//               	- Comparison Logic is now correct
//
//               2) All resets are now asynchronous
//
//               3) Converted Power On Delay to an configurable item
//
//               4) Added reset to Chip Select Output Registers
//
//               5) Forcing all outputs to Hi-Z state during reset
//
//               Revision 1.1.1.1  2001/05/13 09:39:44  rudi
//               Created Directory Structure
//
//
//
//

`include "mc_defines.v"

module mc_timing(clk, rst,

		// Wishbone Interface
		wb_cyc_i, wb_we_i,
		wb_read_go, wb_write_go, wb_first, wb_wait, mem_ack,
		err,

		// Suspend/Resume Interface
		susp_req, resume_req, suspended, susp_sel,

		// Memory Interface
		data_oe, oe_, we_, cas_, ras_, cke_, 
		cs_en, wb_cycle, wr_cycle,
		mc_br, mc_bg, mc_adsc, mc_adv,
		mc_c_oe, mc_ack,

		// Register File Interface
		csc, tms, cs, lmr_req, lmr_ack, cs_le,

		// Address Select Signals
		cmd_a10, row_sel, next_adr, page_size,

		// OBCT Signals
		bank_set, bank_clr, bank_clr_all, bank_open, any_bank_open, row_same,

		// Data path Controller Signals
		dv, pack_le0, pack_le1, pack_le2, par_err,

		// Refresh Counter Signals
		rfr_req, rfr_ack,

		// Initialize Request & Ack
		init_req, init_ack
		);

input		clk;
input		rst;

// Wishbone Interface
input		wb_cyc_i, wb_we_i;
input		wb_read_go;
input		wb_write_go;
input		wb_first;
input		wb_wait;
output		mem_ack;
output		err;

// Suspend/Resume Interface
input		susp_req;
input		resume_req;
output		suspended;
output		susp_sel;

// Memory Interface
output		data_oe;
output		oe_;
output		we_;
output		cas_;
output		ras_;
output		cke_;
output		cs_en;
output		wb_cycle;
output		wr_cycle;
input		mc_br;
output		mc_bg;
output		mc_adsc;
output		mc_adv;
output		mc_c_oe;
input		mc_ack;

// Register File Interface
input	[31:0]	csc;
input	[31:0]	tms;
input	[7:0]	cs;
input		lmr_req;
output		lmr_ack;
output		cs_le;

// Address Select Signals
input	[10:0]	page_size;
output		cmd_a10;
output		row_sel;
output		next_adr;

// OBCT Signals
output		bank_set;
output		bank_clr;
output		bank_clr_all;
input		bank_open;
input		any_bank_open;
input		row_same;

// Data path Controller Signals
output		dv;
output		pack_le0, pack_le1, pack_le2;	// Pack Latch Enable
input		par_err;

// Refresh Counter Signals
input		rfr_req;
output		rfr_ack;

// Initialize Request & Ack
input		init_req;
output		init_ack;

////////////////////////////////////////////////////////////////////
//
// Defines & Parameters
//

// Number of states: 66
parameter	[65:0]	// synopsys enum state
POR		= 66'b000000000000000000000000000000000000000000000000000000000000000001,
IDLE		= 66'b000000000000000000000000000000000000000000000000000000000000000010,
IDLE_T		= 66'b000000000000000000000000000000000000000000000000000000000000000100,
IDLE_T2		= 66'b000000000000000000000000000000000000000000000000000000000000001000,
PRECHARGE	= 66'b000000000000000000000000000000000000000000000000000000000000010000,
PRECHARGE_W	= 66'b000000000000000000000000000000000000000000000000000000000000100000,
ACTIVATE	= 66'b000000000000000000000000000000000000000000000000000000000001000000,
ACTIVATE_W	= 66'b000000000000000000000000000000000000000000000000000000000010000000,
SD_RD_WR	= 66'b000000000000000000000000000000000000000000000000000000000100000000,
SD_RD		= 66'b000000000000000000000000000000000000000000000000000000001000000000,
SD_RD_W		= 66'b000000000000000000000000000000000000000000000000000000010000000000,
SD_RD_LOOP	= 66'b000000000000000000000000000000000000000000000000000000100000000000,
SD_RD_W2	= 66'b000000000000000000000000000000000000000000000000000001000000000000,
SD_WR		= 66'b000000000000000000000000000000000000000000000000000010000000000000,
SD_WR_W		= 66'b000000000000000000000000000000000000000000000000000100000000000000,
BT		= 66'b000000000000000000000000000000000000000000000000001000000000000000,
BT_W		= 66'b000000000000000000000000000000000000000000000000010000000000000000,
REFR		= 66'b000000000000000000000000000000000000000000000000100000000000000000,
LMR0		= 66'b000000000000000000000000000000000000000000000001000000000000000000,
LMR1		= 66'b000000000000000000000000000000000000000000000010000000000000000000,
LMR2		= 66'b000000000000000000000000000000000000000000000100000000000000000000,
INIT0		= 66'b000000000000000000000000000000000000000000001000000000000000000000,
INIT		= 66'b000000000000000000000000000000000000000000010000000000000000000000,
INIT_W		= 66'b000000000000000000000000000000000000000000100000000000000000000000,
INIT_REFR1	= 66'b000000000000000000000000000000000000000001000000000000000000000000,
INIT_REFR1_W	= 66'b000000000000000000000000000000000000000010000000000000000000000000,
INIT_LMR	= 66'b000000000000000000000000000000000000000100000000000000000000000000,
SUSP1		= 66'b000000000000000000000000000000000000001000000000000000000000000000,
SUSP2		= 66'b000000000000000000000000000000000000010000000000000000000000000000,
SUSP3		= 66'b000000000000000000000000000000000000100000000000000000000000000000,
SUSP4		= 66'b000000000000000000000000000000000001000000000000000000000000000000,
RESUME1		= 66'b000000000000000000000000000000000010000000000000000000000000000000,
RESUME2		= 66'b000000000000000000000000000000000100000000000000000000000000000000,
BG0		= 66'b000000000000000000000000000000001000000000000000000000000000000000,
BG1		= 66'b000000000000000000000000000000010000000000000000000000000000000000,
BG2		= 66'b000000000000000000000000000000100000000000000000000000000000000000,
ACS_RD		= 66'b000000000000000000000000000001000000000000000000000000000000000000,
ACS_RD1		= 66'b000000000000000000000000000010000000000000000000000000000000000000,
ACS_RD2A	= 66'b000000000000000000000000000100000000000000000000000000000000000000,
ACS_RD2		= 66'b000000000000000000000000001000000000000000000000000000000000000000,
ACS_RD3		= 66'b000000000000000000000000010000000000000000000000000000000000000000,
ACS_RD_8_1	= 66'b000000000000000000000000100000000000000000000000000000000000000000,
ACS_RD_8_2	= 66'b000000000000000000000001000000000000000000000000000000000000000000,
ACS_RD_8_3	= 66'b000000000000000000000010000000000000000000000000000000000000000000,
ACS_RD_8_4	= 66'b000000000000000000000100000000000000000000000000000000000000000000,
ACS_RD_8_5	= 66'b000000000000000000001000000000000000000000000000000000000000000000,
ACS_RD_8_6	= 66'b000000000000000000010000000000000000000000000000000000000000000000,
ACS_WR		= 66'b000000000000000000100000000000000000000000000000000000000000000000,
ACS_WR1		= 66'b000000000000000001000000000000000000000000000000000000000000000000,
ACS_WR2		= 66'b000000000000000010000000000000000000000000000000000000000000000000,
ACS_WR3		= 66'b000000000000000100000000000000000000000000000000000000000000000000,
ACS_WR4		= 66'b000000000000001000000000000000000000000000000000000000000000000000,
SRAM_RD		= 66'b000000000000010000000000000000000000000000000000000000000000000000,
SRAM_RD0	= 66'b000000000000100000000000000000000000000000000000000000000000000000,
SRAM_RD1	= 66'b000000000001000000000000000000000000000000000000000000000000000000,
SRAM_RD2	= 66'b000000000010000000000000000000000000000000000000000000000000000000,
SRAM_RD3	= 66'b000000000100000000000000000000000000000000000000000000000000000000,
SRAM_RD4	= 66'b000000001000000000000000000000000000000000000000000000000000000000,
SRAM_WR		= 66'b000000010000000000000000000000000000000000000000000000000000000000,
SRAM_WR0	= 66'b000000100000000000000000000000000000000000000000000000000000000000,
SCS_RD		= 66'b000001000000000000000000000000000000000000000000000000000000000000,
SCS_RD1		= 66'b000010000000000000000000000000000000000000000000000000000000000000,
SCS_RD2		= 66'b000100000000000000000000000000000000000000000000000000000000000000,
SCS_WR		= 66'b001000000000000000000000000000000000000000000000000000000000000000,
SCS_WR1		= 66'b010000000000000000000000000000000000000000000000000000000000000000,
SCS_ERR		= 66'b100000000000000000000000000000000000000000000000000000000000000000;

////////////////////////////////////////////////////////////////////
//
// Local Registers & Wires
//

reg	[65:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

reg		mc_bg;

wire	[2:0]	mem_type;
wire	[1:0]	bus_width;
wire		kro;

wire		cs_a;
reg	[3:0]	cmd;

reg		mem_ack;
wire		mem_ack_s;
reg		mem_ack_d;
reg		err_d;
reg		err;
reg		cmd_a10;
reg		lmr_ack;
reg		row_sel;
reg		oe_;
reg		oe_d;
reg		data_oe;
reg		data_oe_d;
reg		cke_d;
reg		cke_;
reg		init_ack;
reg		dv;
reg		rfr_ack;
reg		mc_adsc;
reg		mc_adv;

reg		bank_set;
reg		bank_clr;
reg		bank_clr_all;

reg		wr_set, wr_clr;
reg		wr_cycle;

reg		cmd_asserted;
reg		cmd_asserted2;

reg	[10:0]	burst_val;
reg	[10:0]	burst_cnt;
wire		burst_act;
reg		burst_act_rd;
wire		single_write;

reg		cs_le;

reg		susp_req_r;
reg		resume_req_r;
reg		suspended;
reg		suspended_d;
reg		susp_sel;

reg	[3:0]	cmd_del;
reg	[3:0]	cmd_r;
reg		data_oe_r;
reg		data_oe_r2;
reg		cke_r;
reg		cke_rd;
reg		cke_o_del;
reg		cke_o_r1;
reg		cke_o_r2;
reg		wb_cycle_set, wb_cycle;
reg	[3:0]	ack_cnt;
wire		ack_cnt_is_0;
reg		cnt, cnt_next;
reg	[7:0]	timer;
reg		tmr_ld_trp, tmr_ld_trcd, tmr_ld_tcl, tmr_ld_trfc;
reg		tmr_ld_twr, tmr_ld_txsr;
reg		tmr2_ld_tscsto;
reg		tmr_ld_trdv;
reg		tmr_ld_trdz;
reg		tmr_ld_twr2;
wire		timer_is_zero;
reg		tmr_done;
reg		tmr2_ld_trdv, tmr2_ld_trdz;
reg		tmr2_ld_twpw, tmr2_ld_twd, tmr2_ld_twwd;
reg		tmr2_ld_tsrdv;
reg	[8:0]	timer2;
reg		tmr2_done;
wire		timer2_is_zero;
reg	[3:0]	ir_cnt;
reg		ir_cnt_ld;
reg		ir_cnt_dec;
reg		ir_cnt_done;
reg		rfr_ack_r;
reg		burst_cnt_ld;
reg		burst_fp;
reg		wb_wait_r, wb_wait_r2;
reg		lookup_ready1, lookup_ready2;
reg		burst_cnt_ld_4;
reg		dv_r;
reg		mc_adv_r1, mc_adv_r;

reg		next_adr;
reg		pack_le0, pack_le1, pack_le2;
reg		pack_le0_d, pack_le1_d, pack_le2_d;
wire		bw8, bw16;

reg		mc_c_oe_d;
reg		mc_c_oe;

reg		mc_le;

////////////////////////////////////////////////////////////////////
//
// Aliases
//
assign mem_type  = csc[3:1];
assign bus_width = csc[5:4];
assign kro       = csc[10];
assign single_write = tms[9];

////////////////////////////////////////////////////////////////////
//
// Misc Logic
//

// Control Signals Output Enable
always @(posedge clk or negedge rst)
	if(!rst)	mc_c_oe <= #1 1'b0;
	else		mc_c_oe <= mc_c_oe_d;

always @(posedge clk or negedge rst)
	if(!rst)	mc_le <= #1 1'b0;
	else		mc_le <= #1 ~mc_le;

always @(posedge clk)
	pack_le0 <= #1 pack_le0_d;

always @(posedge clk)
	pack_le1 <= #1 pack_le1_d;

always @(posedge clk)
	pack_le2 <= #1 pack_le2_d;

always @(posedge clk)
	if(!mc_le)	mc_adv_r1 <= #1 mc_adv;

always @(posedge clk)
	if(!mc_le)	mc_adv_r <= #1 mc_adv_r1;

// Bus Width decoder
assign bw8  = (bus_width == `MC_BW_8);
assign bw16 = (bus_width == `MC_BW_16);

assign	cs_a = |cs;	// Any Chip Select

// Memory to Wishbone Ack
always @(posedge clk)
	mem_ack <= #1 (mem_ack_d | mem_ack_s) & (wb_read_go | wb_write_go);

always @(posedge clk)
	err <= #1 err_d;

// SDRAM Command, either delayed (for writes) or straight through
always @(posedge clk)
	cmd_r <= #1 cmd;

always @(posedge clk)
	cmd_del <= #1 cmd_r;

assign {cs_en, ras_, cas_, we_} = wr_cycle ? cmd_del : cmd;

// Track Timing of Asserting a command
always @(posedge clk)
	if(!mc_le)	cmd_asserted <= #1 cmd[3];

always @(posedge clk)
	if(mc_le)	cmd_asserted2 <= #1 cmd_asserted;

// Output Enable
always @(posedge clk)
	oe_ <= #1 ~oe_d;

// Memory Bus Data lines Output Enable
always @(posedge clk)
	data_oe_r <= #1 data_oe_d;

always @(posedge clk)
	data_oe_r2 <= #1 data_oe_r;

always @(posedge clk)
	data_oe <= #1 wr_cycle ? data_oe_r2 : data_oe_d;

// Clock Enable
always @(posedge clk)
	cke_r <= #1 cke_d;

always @(posedge clk)
	cke_ <= #1 cke_r & cke_rd;

// CKE output delay line to time DV for reads
always @(posedge clk)
	cke_o_r1 <= #1 cke_;

always @(posedge clk)
	cke_o_r2 <= #1 cke_o_r1;

always @(posedge clk)
	cke_o_del <= #1 cke_o_r2;

// Delayed version of the wb_wait input
always @(posedge clk)
	wb_wait_r2 <= #1 wb_wait;

always @(posedge clk)
	wb_wait_r <= #1 wb_wait_r2;

// Indicates when the row_same and bank_open lookups are done
always @(posedge clk)
	lookup_ready1 <= #1 cs_le;

always @(posedge clk)
	lookup_ready2 <= #1 lookup_ready1;

// Keep Track if it is a SDRAM write cycle
always @(posedge clk or negedge rst)
	if(!rst)	wr_cycle <= #1 1'b0;
	else
	if(wr_set)	wr_cycle <= #1 1'b1;
	else
	if(wr_clr)	wr_cycle <= #1 1'b0;

// Track when a cycle is *still* active
always @(posedge clk or negedge rst)
	if(!rst)			wb_cycle <= #1 1'b0;
	else
	if(wb_cycle_set)		wb_cycle <= #1 1'b1;
	else
	if(!wb_cyc_i)			wb_cycle <= #1 1'b0;

// Track ack's for read cycles 
always @(posedge clk or negedge rst)
	if(!rst)				ack_cnt <= #1 4'h0;
	else
	if(!wb_read_go & !wb_write_go)		ack_cnt <= #1 4'h0;
	else
	if(dv & !mem_ack_s)			ack_cnt <= #1 ack_cnt + 4'h1;
	else
	if(!dv & mem_ack_s)			ack_cnt <= #1 ack_cnt - 4'h1;

assign ack_cnt_is_0 = (ack_cnt==4'h0);

assign mem_ack_s = (ack_cnt != 4'h0) & !wb_wait & !mem_ack & wb_read_go & !wb_we_i;

// Internal Cycle Tracker
always @(posedge clk)
	cnt <= #1 cnt_next;

// Suspend/resume Logic
always @(posedge clk)
	susp_req_r <= #1 susp_req;

always @(posedge clk)
	resume_req_r <= #1 resume_req;

always @(posedge clk)
	suspended <= #1 suspended_d;

always @(posedge clk)
	rfr_ack_r <= #1 rfr_ack;

////////////////////////////////////////////////////////////////////
//
// Timing Logic
//

always @(posedge clk)
	if(tmr2_ld_tscsto)	timer2 <= #1 tms[24:16];
	else
	if(tmr2_ld_tsrdv)	timer2 <= #1 9'd2;	// SSRAM RD->1st DATA VALID
	else
	if(tmr2_ld_twpw)	timer2 <= #1 { 5'h0, tms[15:12]};
	else
	if(tmr2_ld_twd)		timer2 <= #1 { 4'h0, tms[19:16],1'b0};
	else
	if(tmr2_ld_twwd)	timer2 <= #1 { 3'h0, tms[25:20]};
	else
	if(tmr2_ld_trdz)	timer2 <= #1 { 4'h0, tms[11:8], 1'b1};
	else
	if(tmr2_ld_trdv)	timer2 <= #1 { tms[7:0], 1'b1};
	else
	if(!timer2_is_zero)	timer2 <= #1 timer2 - 9'b1;

wire	twd_is_zero;
assign twd_is_zero =  (tms[19:16] == 4'h0);

assign timer2_is_zero = (timer2 == 9'h0);

always @(posedge clk)
	tmr2_done <= #1 timer2_is_zero & !tmr2_ld_trdv & !tmr2_ld_trdz &
			!tmr2_ld_twpw & !tmr2_ld_twd & !tmr2_ld_twwd & !tmr2_ld_tscsto;

// SDRAM Memories timing tracker
always @(posedge clk or negedge rst)
`ifdef MC_POR_DELAY
	if(!rst)		timer <= #1 `MC_POR_DELAY_VAL ;
	else
`endif
	if(tmr_ld_twr2)		timer <= #1 { 4'h0, tms[15:12] };
	else
	if(tmr_ld_trdz)		timer <= #1 { 4'h0, tms[11:8] };
	else
	if(tmr_ld_trdv)		timer <= #1 tms[7:0];
	else
	if(tmr_ld_twr)		timer <= #1 { 6'h0, tms[16:15]};
	else
	if(tmr_ld_trp)		timer <= #1 { 4'h0, tms[23:20]};
	else
	if(tmr_ld_trcd)		timer <= #1 { 5'h0, tms[19:17]};
	else
	if(tmr_ld_tcl)		timer <= #1 { 6'h0, tms[05:04]};
	else
	if(tmr_ld_trfc)		timer <= #1 { 4'h0, tms[27:24]};
	else
	if(tmr_ld_txsr)		timer <= #1 8'd7;
	else
	if(!timer_is_zero & !mc_le)	timer <= #1 timer - 8'b1;

assign timer_is_zero = (timer == 8'h0);

always @(posedge clk)
	tmr_done <= #1 timer_is_zero;

// Init Refresh Cycles Counter
always @(posedge clk)
	if(ir_cnt_ld)	ir_cnt <= #1 `MC_INIT_RFRC_CNT;
	else
	if(ir_cnt_dec)	ir_cnt <= #1 ir_cnt - 4'b1;

always @(posedge clk)
	ir_cnt_done <= #1 (ir_cnt == 4'h0);

// Burst Counter
always @(tms or page_size)
	case(tms[2:0])		// synopsys full_case parallel_case
	   3'h0: burst_val = 11'd1;
	   3'h1: burst_val = 11'd2;
	   3'h2: burst_val = 11'd4;
	   3'h3: burst_val = 11'd8;
	   3'h7: burst_val = page_size;
	endcase

always @(posedge clk)
	if(burst_cnt_ld_4)			burst_cnt <= #1 11'h4;
	else
	if(burst_cnt_ld)			burst_cnt <= #1 burst_val;
	else
	if(wr_cycle ? mem_ack_d : dv)		burst_cnt <= #1 burst_cnt - 11'h1;

always @(posedge clk)
	if(burst_cnt_ld)	burst_fp <= #1 (tms[2:0] == 3'h7);

assign burst_act = |burst_cnt & ( |tms[2:0] );

always @(posedge clk)
	burst_act_rd <= #1 |burst_cnt;

always @(posedge clk)
	dv_r <= #1 dv;

////////////////////////////////////////////////////////////////////
//
// Main State Machine
//

always @(posedge clk or negedge rst)
`ifdef MC_POR_DELAY
	if(!rst)	state <= #1 POR;
`else
	if(!rst)	state <= #1 IDLE;
`endif
	else		state <= #1 next_state;

always @(state or cs_a or
	twd_is_zero or
	wb_first or wb_read_go or wb_write_go or wb_wait or mem_ack or wb_we_i or
	ack_cnt_is_0 or wb_wait_r or cnt or wb_cycle or 
	mem_type or kro or lookup_ready1 or lookup_ready2 or row_same or
	bank_open or single_write or
	cmd_asserted or tmr_done or tmr2_done or ir_cnt_done or cmd_asserted2 or
	burst_act or burst_act_rd or burst_fp or cke_ or cke_r or cke_o_del or
	rfr_req or lmr_req or init_req or rfr_ack_r or susp_req_r or resume_req_r or
	mc_br or bw8 or bw16 or dv_r or mc_adv_r or mc_ack
	)
   begin
	next_state = state;	// Default keep current state
	cnt_next = 1'b0;

	cmd = `MC_CMD_NOP;
	cmd_a10 = ~kro;
	oe_d = 1'b0;
	data_oe_d = 1'b0;
	cke_d = 1'b1;
	cke_rd = 1'b1;
	mc_adsc = 1'b0;
	mc_adv = 1'b0;

	bank_set = 1'b0;
	bank_clr = 1'b0;
	bank_clr_all = 1'b0;

	burst_cnt_ld = 1'b0;
	burst_cnt_ld_4 = 1'b0;
	tmr_ld_trp = 1'b0;
	tmr_ld_trcd = 1'b0;
	tmr_ld_tcl = 1'b0;
	tmr_ld_trfc = 1'b0;
	tmr_ld_twr = 1'b0;
	tmr_ld_txsr = 1'b0;
	tmr_ld_trdv = 1'b0;
	tmr_ld_trdz = 1'b0;
	tmr_ld_twr2 = 1'b0;

	tmr2_ld_trdv = 1'b0;
	tmr2_ld_trdz = 1'b0;
	
	tmr2_ld_twpw = 1'b0;
	tmr2_ld_twd = 1'b0;
	tmr2_ld_twwd = 1'b0;
	tmr2_ld_tsrdv = 1'b0;
	tmr2_ld_tscsto = 1'b0;

	mem_ack_d = 1'b0;
	err_d = 1'b0;
	rfr_ack = 1'b0;
	lmr_ack = 1'b0;
	init_ack = 1'b0;

	ir_cnt_dec = 1'b0;
	ir_cnt_ld = 1'b0;

	row_sel = 1'b0;
	cs_le = 1'b0;
	wr_clr = 1'b0;
	wr_set = 1'b0;
	wb_cycle_set = 1'b0;
	dv = 1'b0;

	suspended_d = 1'b0;
	susp_sel = 1'b0;
	mc_bg = 1'b0;

	next_adr = 1'b0;
	pack_le0_d = 1'b0;
	pack_le1_d = 1'b0;
	pack_le2_d = 1'b0;

	mc_c_oe_d = 1'b1;

	case(state)		// synopsys full_case parallel_case
`ifdef MC_POR_DELAY
	   POR:
	      begin
		if(tmr_done)	next_state = IDLE;
	      end
`endif
	   IDLE:
	      begin
		cs_le = wb_first | lmr_req;
		burst_cnt_ld = 1'b1;
		wr_clr = 1'b1;

		if(rfr_req)
		   begin
			rfr_ack = 1'b1;
			next_state = PRECHARGE;
		   end
		else
		if(init_req)
		   begin
			cs_le = 1'b1;
			next_state = INIT0;
		   end
		else
		if(lmr_req & lookup_ready2)
		   begin
			lmr_ack = 1'b1;
			cs_le = 1'b1;
			next_state = LMR0;
		   end
		else
		if(susp_req_r)
		   begin
			cs_le = 1'b1;
			susp_sel = 1'b1;
			next_state = SUSP1;
		   end
		else
		if(cs_a & (wb_read_go | wb_write_go) & (lookup_ready1 | wb_cycle) )
		  begin
		   wb_cycle_set = 1'b1;
		   case(mem_type)		// synopsys full_case parallel_case
		     `MC_MEM_TYPE_SDRAM:		// SDRAM
			if((lookup_ready2 | wb_cycle) & !wb_wait)
			   begin
				if(wb_write_go  | wb_we_i)	wr_set = 1'b1;
				if(kro & bank_open & row_same)	next_state = SD_RD_WR;
				else
				if(kro & bank_open)		next_state = PRECHARGE;
				else				next_state = ACTIVATE;
			   end
		     `MC_MEM_TYPE_ACS:
			begin				// Async Chip Select
				if(!wb_wait)
				   begin
					cs_le = 1'b1;
					if(wb_write_go)	
					   begin
								data_oe_d = 1'b1;
								next_state = ACS_WR;
					   end
					else			next_state = ACS_RD;
				   end
			end
		     `MC_MEM_TYPE_SCS:
			begin				// Sync Chip Select
				if(!wb_wait)
				   begin
					tmr2_ld_tscsto = 1'b1;
					cs_le = 1'b1;
					if(wb_write_go)	
					   begin
						cmd = `MC_CMD_XWR;
						data_oe_d = 1'b1;
						tmr_ld_twr2 = 1'b1;
						next_state = SCS_WR;
					   end
					else		
					   begin
						cmd = `MC_CMD_XRD;
						oe_d = 1'b1;
						tmr_ld_trdv = 1'b1;
						next_state = SCS_RD;
					   end
				   end
			end
		     `MC_MEM_TYPE_SRAM:
			begin		// SRAM
				if(!wb_wait)
				   begin
					cs_le = 1'b1;
					if(wb_write_go)	
					   begin
						data_oe_d = 1'b1;
						mem_ack_d = 1'b1;
						next_state = SRAM_WR;
					   end
					else		
					   begin
						cmd = `MC_CMD_XRD;
						oe_d = 1'b1;
						mc_adsc = 1'b1;
						tmr2_ld_tsrdv = 1'b1;
						next_state = SRAM_RD;
					   end
				   end
			end
		   endcase
		  end
		else
		if(mc_br)
		   begin
			if(!cmd_asserted2)	next_state = BG0;
		   end
	      end

	   IDLE_T:
	      begin
		if(tmr_done)	next_state = IDLE;
	      end

	   IDLE_T2:
	      begin
		if(tmr2_done)	next_state = IDLE;
	      end

		/////////////////////////////////////////
		// SCS STATES ....
		/////////////////////////////////////////
	   SCS_RD:
	      begin
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		tmr_ld_trdv = 1'b1;
		if(mc_ack)	next_state = SCS_RD1;
		else
		if(tmr2_done)	next_state = SCS_ERR;
	      end

	   SCS_RD1:
	      begin
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		if(tmr_done)
		   begin
			mem_ack_d = 1'b1;
			tmr_ld_trdz = 1'b1;
			next_state = SCS_RD2;
		   end
	      end

	   SCS_RD2:
	      begin
		tmr_ld_trdz = 1'b1;
		next_state = IDLE_T;
	      end

	   SCS_WR:
	      begin
		tmr_ld_twr2 = 1'b1;
		cmd = `MC_CMD_XWR;
		data_oe_d = 1'b1;
		if(mc_ack)	next_state = SCS_WR1;
		else
		if(tmr2_done)	next_state = SCS_ERR;
	      end

	   SCS_WR1:
	      begin
		data_oe_d = 1'b1;
		if(tmr_done)
		   begin
			mem_ack_d = 1'b1;
			next_state = IDLE_T;
		   end
		else	cmd = `MC_CMD_XWR;
	      end

	   SCS_ERR:
	      begin
		mem_ack_d = 1'b1;
		err_d = 1'b1;
		next_state = IDLE_T2;
	      end

		/////////////////////////////////////////
		// SSRAM STATES ....
		/////////////////////////////////////////

	   SRAM_RD:
	      begin
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		mc_adsc = 1'b1;
		tmr2_ld_tsrdv = 1'b1;
		burst_cnt_ld_4 = 1'b1;
		if(cmd_asserted)	next_state = SRAM_RD0;
	      end

	   SRAM_RD0:
	      begin
		mc_adv = 1'b1;
		oe_d = 1'b1;
		if(tmr2_done)
		   begin
			mc_adv = !wb_wait;
			next_state = SRAM_RD1;
		   end
	      end

	   SRAM_RD1:
	      begin
		if(mc_adv_r)	dv = ~dv_r;
		mc_adv = !wb_wait;

		if(!burst_act | !wb_read_go)	next_state = SRAM_RD2;
		else		oe_d = 1'b1;
	      end

	   SRAM_RD2:
	      begin
		if(ack_cnt_is_0 & wb_read_go)	next_state = SRAM_RD3;
		else
		if(!wb_read_go)
		   begin
			mc_adsc = 1'b1;
			next_state = SRAM_RD4;
		   end
	      end

	   SRAM_RD3:
	      begin
		if(!wb_read_go)
		   begin
			mc_adsc = 1'b1;
			next_state = SRAM_RD4;
		   end
		else
		if(!wb_wait)
		   begin
			cs_le = 1'b1;
			next_state = SRAM_RD;
		   end
	      end

	   SRAM_RD4:	// DESELECT
	      begin
		mc_adsc = 1'b1;
		next_state = IDLE;
	      end

	   SRAM_WR: // 80
	      begin
		cmd = `MC_CMD_XWR;
		mc_adsc = 1'b1;
		data_oe_d = 1'b1;
		if(cmd_asserted)
		   begin
			if(wb_wait)		next_state = SRAM_WR0;
			else
			if(!wb_write_go)
			   begin
				mc_adsc = 1'b1;
				next_state = SRAM_RD4;
			   end
			else		
			   begin
				data_oe_d = 1'b1;
				mem_ack_d = ~mem_ack;
			   end
		   end
	      end

	   SRAM_WR0: // 81
	      begin
		if(wb_wait)		next_state = SRAM_WR0;
		else
		if(!wb_write_go)
		   begin
			mc_adsc = 1'b1;
			next_state = SRAM_RD4;
		   end
		else		
		   begin
			data_oe_d = 1'b1;
			//mem_ack_d = ~mem_ack;
			next_state = SRAM_WR;
		   end

		//data_oe_d = 1'b1;
		//if(!wb_wait)	next_state = SRAM_WR;
	      end

		/////////////////////////////////////////
		// Async Devices STATES ....
		/////////////////////////////////////////
	   ACS_RD:
	      begin
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		tmr2_ld_trdv = 1'b1;
		next_state = ACS_RD1;
	      end

	   ACS_RD1:
	      begin	// 32 bit, 8 bit - first; 16 bit - first
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		if(tmr2_done)
		   begin
			if(bw8 | bw16)		next_adr = 1'b1;
			if(bw8)			next_state = ACS_RD_8_1;
			else
			if(bw16)		next_state = ACS_RD_8_5;
			else			next_state = ACS_RD2A;
			//else			next_state = ACS_RD3;
		   end
	      end

	   ACS_RD_8_1:
	      begin	// 8 bit 2nd byte
		pack_le0_d = 1'b1;
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		tmr2_ld_trdv = 1'b1;
		next_state = ACS_RD_8_2;
	      end

	   ACS_RD_8_2:
	      begin
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		if(tmr2_done)
		   begin
			next_adr = 1'b1;
			next_state = ACS_RD_8_3;
		   end
	      end

	   ACS_RD_8_3:
	      begin	// 8 bit 3rd byte
		pack_le1_d = 1'b1;
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		tmr2_ld_trdv = 1'b1;
		next_state = ACS_RD_8_4;
	      end

	   ACS_RD_8_4:
	      begin
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		if(tmr2_done)
		   begin
			next_adr = 1'b1;
			next_state = ACS_RD_8_5;
		   end
	      end

	   ACS_RD_8_5:
	      begin	// 8 bit 4th byte; 16 bit 2nd word
		if(bw8)			pack_le2_d = 1'b1;
		if(bw16)		pack_le0_d = 1'b1;
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		tmr2_ld_trdv = 1'b1;
		next_state = ACS_RD_8_6;
	      end

	   ACS_RD_8_6:
	      begin
		cmd = `MC_CMD_XRD;
		oe_d = 1'b1;
		if(tmr2_done)
		   begin
			next_state = ACS_RD2;
		   end
	      end

	   ACS_RD2A:
	      begin
		oe_d = 1'b1;
		cmd = `MC_CMD_XRD;
		next_state = ACS_RD2;
	      end

	   ACS_RD2:
	      begin
		cmd = `MC_CMD_XRD;
		next_state = ACS_RD3;
	      end

	   ACS_RD3:
	      begin
		mem_ack_d = 1'b1;
		tmr2_ld_trdz = 1'b1;
		next_state = IDLE_T2;
	      end

	   ACS_WR:
	      begin
		tmr2_ld_twpw = 1'b1;
		cmd = `MC_CMD_XWR;
		data_oe_d = 1'b1;
		next_state = ACS_WR1;
	      end

	   ACS_WR1:
	      begin
		if(!cmd_asserted)	tmr2_ld_twpw = 1'b1;
		cmd = `MC_CMD_XWR;
		data_oe_d = 1'b1;
		if(tmr2_done)
		   begin
			tmr2_ld_twd = 1'b1;
			next_state = ACS_WR2;
		   end
	      end

	   ACS_WR2:
	      begin
		if(twd_is_zero)	next_state = ACS_WR3;
		else
		   begin
			cmd = `MC_CMD_XRD;
			data_oe_d = 1'b1;
			next_state = ACS_WR3;
		   end
	      end

	   ACS_WR3:
	      begin
		if(tmr2_done)	next_state = ACS_WR4;
		else		cmd = `MC_CMD_XRD;
	      end

	   ACS_WR4:
	      begin
		tmr2_ld_twwd = 1'b1;
		mem_ack_d = 1'b1;
		next_state = IDLE_T2;
	      end

		/////////////////////////////////////////
		// SDRAM STATES ....
		/////////////////////////////////////////

	   PRECHARGE:
	      begin
		cmd = `MC_CMD_PC;
		if(rfr_ack_r)
		   begin
			rfr_ack = 1'b1;
			cmd_a10 = `MC_ALL_BANKS;
			bank_clr_all = 1'b1;
		   end
		else	
		   begin
			bank_clr = 1'b1;
			cmd_a10 = `MC_SINGLE_BANK;
		   end
		tmr_ld_trp = 1'b1;
		if(cmd_asserted)	next_state = PRECHARGE_W;
	      end

	   PRECHARGE_W:
	      begin
		rfr_ack = rfr_ack_r;
		if(tmr_done)	
		   begin
			if(rfr_ack_r)	next_state = REFR;
			else		next_state = ACTIVATE;
		   end
	      end

	   ACTIVATE:	// 4
	      begin
		if(!wb_wait_r)
		   begin
			row_sel = 1'b1;
			tmr_ld_trcd = 1'b1;
			cmd = `MC_CMD_ACT;
		   end
		if(cmd_asserted)	next_state = ACTIVATE_W;
	      end

	   ACTIVATE_W:
	      begin
		row_sel = 1'b1;
		if(wb_write_go | wb_we_i)	wr_set = 1'b1;

		if(kro)		bank_set = 1'b1;

		if(tmr_done)
		   begin
			if(wb_write_go)
			   begin
				mem_ack_d = !mem_ack;
				next_state = SD_WR;
			   end
			else
			if(!wb_wait_r)	next_state = SD_RD;
		   end
	      end

	   SD_RD_WR:	// 6
	      begin
		if(wb_write_go | wb_we_i)	wr_set = 1'b1;

		if(wb_write_go & !wb_wait)
		   begin	// Write
			data_oe_d = 1'b1;
			mem_ack_d = !mem_ack;
			next_state = SD_WR;
		   end
		else
		if(!wb_wait)
		   begin	// Read
			if(kro)
			   begin
				if(!wb_wait_r)	next_state = SD_RD;
			   end
			else	next_state = SD_RD;
		   end
	      end

	   SD_WR:	// Write Command A
	      begin	// Does the first single write
		data_oe_d = 1'b1;
		tmr_ld_twr = 1'b1;
		cnt_next = ~cnt;
		cmd = `MC_CMD_WR;
		cmd_a10 = ~kro;

		if(!cnt & wb_cycle & burst_act)	cke_d = !wb_wait;
		else				cke_d = cke_r;

		if(cmd_asserted)
		   begin
			mem_ack_d = !mem_ack & wb_write_go & !wb_wait & wb_cycle & burst_act;

			if(wb_cycle & !burst_act)	next_state = IDLE_T;
			else
			if(wb_cycle)			next_state = SD_WR_W;
			else
			if(burst_act & !single_write)	next_state = BT;
			else				next_state = IDLE_T;
		   end

	      end

	   SD_WR_W:	// B
	      begin	// Does additional Writes or Times them
		tmr_ld_twr = 1'b1;
		cnt_next = ~cnt;

		if(single_write & wb_cycle)
		   begin
			cmd = `MC_CMD_WR;
			if(burst_act)	cmd_a10 = 1'b0;
			else		cmd_a10 = ~kro;
		   end

		data_oe_d = 1'b1;
		mem_ack_d = !mem_ack & wb_write_go & !wb_wait & wb_cycle & burst_act;

		if(!cnt)	cke_d = ~wb_wait;
		else		cke_d = cke_r;
	
		if(cke_r)
		   begin
			if(single_write	& !wb_cycle)		next_state = IDLE_T;
			else
			if(burst_act & !single_write & !wb_write_go )
								next_state = BT;
			else
			if(!burst_act)				next_state = IDLE_T;
			else
			if(!wb_write_go & wb_read_go)		next_state = IDLE_T;	// Added for WMR
		   end
	      end

	   SD_RD:	// Read Command 7
	      begin
		cmd = `MC_CMD_RD;
		if(burst_fp)	cmd_a10 = 1'b0;
		else		cmd_a10 = ~kro;
		tmr_ld_tcl = 1'b1;
		if(cmd_asserted)			next_state = SD_RD_W;
	      end

	   SD_RD_W: // 8
	      begin
		if(tmr_done)				next_state = SD_RD_LOOP;
	      end

	   SD_RD_LOOP: // 9
	      begin

		cnt_next = ~cnt;

		if(cnt & !(burst_act & !wb_cycle) & burst_act )		cke_rd = !wb_wait;
		else							cke_rd = cke_;

		if(wb_cycle & !cnt & burst_act_rd & cke_o_del)	dv = 1'b1;

		if(wb_cycle & wb_we_i)			next_state = BT;
		else
		if(burst_act & !wb_cycle)		next_state = BT;
		else
		if(!burst_act)				next_state = SD_RD_W2;
	      end

	   SD_RD_W2: //32
	      begin
		if(wb_cycle & wb_we_i)			next_state = IDLE;
		else
		if(!wb_cycle | ack_cnt_is_0)		next_state = IDLE;
	      end

	   BT:		// Burst Terminate  C
	      begin
		cmd = `MC_CMD_BT;
		tmr_ld_trp = 1'b1;
		if(cmd_asserted)			next_state = BT_W;
	      end

	   BT_W:	// D
	      begin
		if(kro)					next_state = IDLE;
		else
		if(tmr_done & (!burst_fp | kro))	next_state = IDLE;
		else
		if(tmr_done & burst_fp & !kro)	// Must PRECHARGE Full Page Bursts
		   begin
			bank_clr = 1'b1;
			cmd = `MC_CMD_PC;
			cmd_a10 = `MC_SINGLE_BANK;
			tmr_ld_trp = 1'b1;
			if(cmd_asserted)		next_state = IDLE_T;
		   end
	      end

	   REFR:	// Refresh Cycle
	      begin
		cmd = `MC_CMD_ARFR;
		tmr_ld_trfc = 1'b1;
		rfr_ack = 1'b1;
		if(cmd_asserted)		next_state = IDLE_T;
	      end

	   LMR0:
	      begin
		lmr_ack = 1'b1;
		cmd = `MC_CMD_PC;
		cmd_a10 = `MC_ALL_BANKS;
		bank_clr_all = 1'b1;
		tmr_ld_trp = 1'b1;
		if(cmd_asserted)		next_state = LMR1;
	      end

	   LMR1:
	      begin
		lmr_ack = 1'b1;
		if(tmr_done)			next_state = LMR2;
	      end

	   LMR2:
	      begin
		bank_clr_all = 1'b1;
		cmd = `MC_CMD_LMR;
		tmr_ld_trfc = 1'b1;
		lmr_ack = 1'b1;
		if(cmd_asserted)		next_state = IDLE_T;
	      end

	   INIT0:
	      begin
		cs_le = 1'b1;
		next_state = INIT;
	      end

	   INIT:	// Initialize SDRAMS
	      begin	// PRECHARGE
		init_ack = 1'b1;
		cmd = `MC_CMD_PC;
		cmd_a10 = `MC_ALL_BANKS;
		bank_clr_all = 1'b1;
		tmr_ld_trp = 1'b1;
		ir_cnt_ld = 1'b1;
		if(cmd_asserted)		next_state = INIT_W;
	      end

	   INIT_W:
	      begin
		init_ack = 1'b1;
		if(tmr_done)			next_state = INIT_REFR1;
	      end

	   INIT_REFR1:	// Init Refresh Cycle 1
	      begin
		init_ack = 1'b1;
		cmd = `MC_CMD_ARFR;
		tmr_ld_trfc = 1'b1;
		if(cmd_asserted)
		   begin
			ir_cnt_dec = 1'b1;
			next_state = INIT_REFR1_W;
		   end
	      end

	   INIT_REFR1_W:	// 21
	      begin
		init_ack = 1'b1;
		if(tmr_done)
		   begin
			if(ir_cnt_done)		next_state = INIT_LMR;
			else			next_state = INIT_REFR1;
		   end
	      end

	   INIT_LMR:
	      begin
		init_ack = 1'b1;
		cmd = `MC_CMD_LMR;
		bank_clr_all = 1'b1;
		tmr_ld_trfc = 1'b1;
		if(cmd_asserted)		next_state = IDLE_T;
	      end

		/////////////////////////////////////////
		// Bus Arbitration STATES ....
		/////////////////////////////////////////
	   BG0:
	      begin	// Bus Grant
		mc_bg = 1'b1;
		mc_c_oe_d = 1'b0;
		next_state = BG1;
	      end
	   BG1:
	      begin	// Bus Grant
		mc_bg = 1'b1;
		cs_le = 1'b1;
		mc_c_oe_d = 1'b0;
		next_state = BG2;
	      end
	   BG2:
	      begin	// Bus Grant
		mc_bg =	!wb_read_go & !wb_write_go &
			!rfr_req & !init_req & !lmr_req &
			!susp_req_r;
		if(!mc_br)	next_state = IDLE;
		else		mc_c_oe_d = 1'b0;
	      end

		/////////////////////////////////////////
		// SUSPEND/RESUME STATES ....
		/////////////////////////////////////////
	   SUSP1:
	      begin		// Precharge All
		susp_sel = 1'b1;
		cmd = `MC_CMD_PC;
		cmd_a10 = `MC_ALL_BANKS;
		bank_clr_all = 1'b1;
		tmr_ld_trp = 1'b1;
		if(cmd_asserted)	next_state = SUSP2;
	      end

	   SUSP2:
	      begin
		susp_sel = 1'b1;
		if(tmr_done)	next_state = SUSP3;
	      end

	   SUSP3:
	      begin		// Enter Self refresh Mode
		cke_d = 1'b0;
		susp_sel = 1'b1;
		cmd = `MC_CMD_ARFR;
		rfr_ack = 1'b1;
		if(cmd_asserted)
		   begin
			next_state = SUSP4;
		   end
	      end

	   SUSP4:
	      begin		// Now we are suspended
		susp_sel = 1'b1;
		cke_rd = 1'b0;
		suspended_d = 1'b1;
		tmr_ld_txsr = 1'b1;
		if(resume_req_r)	next_state = RESUME1;
	      end

	   RESUME1:
	      begin
		suspended_d = 1'b1;
		susp_sel = 1'b1;
		tmr_ld_txsr = 1'b1;
		next_state = RESUME2;
	      end

	   RESUME2:
	      begin
		suspended_d = 1'b1;
		susp_sel = 1'b1;
		if(tmr_done)	next_state = REFR;
	      end

// synopsys translate_off
//	   default:
//		$display("MC_TIMING SM: Entered non existing state ... (%t)",$time);
// synopsys translate_on

	endcase
   end


endmodule
