/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE DMA Register File                                 ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/wb_dma/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Rudolf Usselmann                         ////
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
//  $Id: wb_dma_rf.v,v 1.2 2001/08/15 05:40:30 rudi Exp $
//
//  $Date:   22 Sep 2004 19:16:58  $
//  $Revision:   1.0  $
//  $Author:   kbrunham  $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log:   /pvcs/designs/hdl/oc_wb_dma/wb_dma_rf.v__  $
// 
//    Rev 1.0   22 Sep 2004 19:16:58   kbrunham
// initial version 
// TO, Wed Sep 22 03:16:29 2004
// 
//    Rev 1.0   25 Jun 2003 13:07:34   jpierri
// Initial revision.
//               Revision 1.2  2001/08/15 05:40:30  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//               - Added Section 3.10, describing DMA restart.
//
//               Revision 1.1  2001/07/29 08:57:02  rudi
//
//
//               1) Changed Directory Structure
//               2) Added restart signal (REST)
//
//               Revision 1.4  2001/06/14 08:50:46  rudi
//
//               Changed name of channel register file module.
//
//               Revision 1.3  2001/06/13 02:26:48  rudi
//
//
//               Small changes after running lint.
//
//               Revision 1.2  2001/06/05 10:22:37  rudi
//
//
//               - Added Support of up to 31 channels
//               - Added support for 2,4 and 8 priority levels
//               - Now can have up to 31 channels
//               - Added many configuration items
//               - Changed reset to async
//
//               Revision 1.1.1.1  2001/03/19 13:10:11  rudi
//               Initial Release
//
//
//

`include "wb_dma_defines.v"

module wb_dma_rf(clk, rst,

	// WISHBONE Access
	wb_rf_adr, wb_rf_din, wb_rf_dout, wb_rf_re, wb_rf_we,

	// WISHBONE Interrupt outputs
	inta_o, intb_o,

	// DMA Registers Outputs
	pointer0, pointer0_s, ch0_csr, ch0_txsz, ch0_adr0, ch0_adr1, ch0_am0, ch0_am1,
	pointer1, pointer1_s, ch1_csr, ch1_txsz, ch1_adr0, ch1_adr1, ch1_am0, ch1_am1,
	pointer2, pointer2_s, ch2_csr, ch2_txsz, ch2_adr0, ch2_adr1, ch2_am0, ch2_am1,
	pointer3, pointer3_s, ch3_csr, ch3_txsz, ch3_adr0, ch3_adr1, ch3_am0, ch3_am1,
	pointer4, pointer4_s, ch4_csr, ch4_txsz, ch4_adr0, ch4_adr1, ch4_am0, ch4_am1,
	pointer5, pointer5_s, ch5_csr, ch5_txsz, ch5_adr0, ch5_adr1, ch5_am0, ch5_am1,
	pointer6, pointer6_s, ch6_csr, ch6_txsz, ch6_adr0, ch6_adr1, ch6_am0, ch6_am1,
	pointer7, pointer7_s, ch7_csr, ch7_txsz, ch7_adr0, ch7_adr1, ch7_am0, ch7_am1,
	pointer8, pointer8_s, ch8_csr, ch8_txsz, ch8_adr0, ch8_adr1, ch8_am0, ch8_am1,
	pointer9, pointer9_s, ch9_csr, ch9_txsz, ch9_adr0, ch9_adr1, ch9_am0, ch9_am1,
	pointer10, pointer10_s, ch10_csr, ch10_txsz, ch10_adr0, ch10_adr1, ch10_am0, ch10_am1,
	pointer11, pointer11_s, ch11_csr, ch11_txsz, ch11_adr0, ch11_adr1, ch11_am0, ch11_am1,
	pointer12, pointer12_s, ch12_csr, ch12_txsz, ch12_adr0, ch12_adr1, ch12_am0, ch12_am1,
	pointer13, pointer13_s, ch13_csr, ch13_txsz, ch13_adr0, ch13_adr1, ch13_am0, ch13_am1,
	pointer14, pointer14_s, ch14_csr, ch14_txsz, ch14_adr0, ch14_adr1, ch14_am0, ch14_am1,
	pointer15, pointer15_s, ch15_csr, ch15_txsz, ch15_adr0, ch15_adr1, ch15_am0, ch15_am1,
	pointer16, pointer16_s, ch16_csr, ch16_txsz, ch16_adr0, ch16_adr1, ch16_am0, ch16_am1,
	pointer17, pointer17_s, ch17_csr, ch17_txsz, ch17_adr0, ch17_adr1, ch17_am0, ch17_am1,
	pointer18, pointer18_s, ch18_csr, ch18_txsz, ch18_adr0, ch18_adr1, ch18_am0, ch18_am1,
	pointer19, pointer19_s, ch19_csr, ch19_txsz, ch19_adr0, ch19_adr1, ch19_am0, ch19_am1,
	pointer20, pointer20_s, ch20_csr, ch20_txsz, ch20_adr0, ch20_adr1, ch20_am0, ch20_am1,
	pointer21, pointer21_s, ch21_csr, ch21_txsz, ch21_adr0, ch21_adr1, ch21_am0, ch21_am1,
	pointer22, pointer22_s, ch22_csr, ch22_txsz, ch22_adr0, ch22_adr1, ch22_am0, ch22_am1,
	pointer23, pointer23_s, ch23_csr, ch23_txsz, ch23_adr0, ch23_adr1, ch23_am0, ch23_am1,
	pointer24, pointer24_s, ch24_csr, ch24_txsz, ch24_adr0, ch24_adr1, ch24_am0, ch24_am1,
	pointer25, pointer25_s, ch25_csr, ch25_txsz, ch25_adr0, ch25_adr1, ch25_am0, ch25_am1,
	pointer26, pointer26_s, ch26_csr, ch26_txsz, ch26_adr0, ch26_adr1, ch26_am0, ch26_am1,
	pointer27, pointer27_s, ch27_csr, ch27_txsz, ch27_adr0, ch27_adr1, ch27_am0, ch27_am1,
	pointer28, pointer28_s, ch28_csr, ch28_txsz, ch28_adr0, ch28_adr1, ch28_am0, ch28_am1,
	pointer29, pointer29_s, ch29_csr, ch29_txsz, ch29_adr0, ch29_adr1, ch29_am0, ch29_am1,
	pointer30, pointer30_s, ch30_csr, ch30_txsz, ch30_adr0, ch30_adr1, ch30_am0, ch30_am1,

	// DMA Registers Write Back Channel Select
	ch_sel, ndnr,

	// DMA Engine Status
	pause_req, paused, dma_abort, dma_busy, dma_err, dma_done, dma_done_all,

	// DMA Engine Reg File Update ctrl signals
	de_csr, de_txsz, de_adr0, de_adr1,
	de_csr_we, de_txsz_we, de_adr0_we, de_adr1_we, de_fetch_descr, dma_rest,
	ptr_set
	);

input		clk, rst;

// WISHBONE Access
input	[7:0]	wb_rf_adr;
input	[31:0]	wb_rf_din;
output	[31:0]	wb_rf_dout;
input		wb_rf_re;
input		wb_rf_we;

// WISHBONE Interrupt outputs
output		inta_o, intb_o;

// Channel Registers Inputs
output	[31:0]	pointer0, pointer0_s, ch0_csr, ch0_txsz, ch0_adr0, ch0_adr1, ch0_am0, ch0_am1;
output	[31:0]	pointer1, pointer1_s, ch1_csr, ch1_txsz, ch1_adr0, ch1_adr1, ch1_am0, ch1_am1;
output	[31:0]	pointer2, pointer2_s, ch2_csr, ch2_txsz, ch2_adr0, ch2_adr1, ch2_am0, ch2_am1;
output	[31:0]	pointer3, pointer3_s, ch3_csr, ch3_txsz, ch3_adr0, ch3_adr1, ch3_am0, ch3_am1;
output	[31:0]	pointer4, pointer4_s, ch4_csr, ch4_txsz, ch4_adr0, ch4_adr1, ch4_am0, ch4_am1;
output	[31:0]	pointer5, pointer5_s, ch5_csr, ch5_txsz, ch5_adr0, ch5_adr1, ch5_am0, ch5_am1;
output	[31:0]	pointer6, pointer6_s, ch6_csr, ch6_txsz, ch6_adr0, ch6_adr1, ch6_am0, ch6_am1;
output	[31:0]	pointer7, pointer7_s, ch7_csr, ch7_txsz, ch7_adr0, ch7_adr1, ch7_am0, ch7_am1;
output	[31:0]	pointer8, pointer8_s, ch8_csr, ch8_txsz, ch8_adr0, ch8_adr1, ch8_am0, ch8_am1;
output	[31:0]	pointer9, pointer9_s, ch9_csr, ch9_txsz, ch9_adr0, ch9_adr1, ch9_am0, ch9_am1;
output	[31:0]	pointer10, pointer10_s, ch10_csr, ch10_txsz, ch10_adr0, ch10_adr1, ch10_am0, ch10_am1;
output	[31:0]	pointer11, pointer11_s, ch11_csr, ch11_txsz, ch11_adr0, ch11_adr1, ch11_am0, ch11_am1;
output	[31:0]	pointer12, pointer12_s, ch12_csr, ch12_txsz, ch12_adr0, ch12_adr1, ch12_am0, ch12_am1;
output	[31:0]	pointer13, pointer13_s, ch13_csr, ch13_txsz, ch13_adr0, ch13_adr1, ch13_am0, ch13_am1;
output	[31:0]	pointer14, pointer14_s, ch14_csr, ch14_txsz, ch14_adr0, ch14_adr1, ch14_am0, ch14_am1;
output	[31:0]	pointer15, pointer15_s, ch15_csr, ch15_txsz, ch15_adr0, ch15_adr1, ch15_am0, ch15_am1;
output	[31:0]	pointer16, pointer16_s, ch16_csr, ch16_txsz, ch16_adr0, ch16_adr1, ch16_am0, ch16_am1;
output	[31:0]	pointer17, pointer17_s, ch17_csr, ch17_txsz, ch17_adr0, ch17_adr1, ch17_am0, ch17_am1;
output	[31:0]	pointer18, pointer18_s, ch18_csr, ch18_txsz, ch18_adr0, ch18_adr1, ch18_am0, ch18_am1;
output	[31:0]	pointer19, pointer19_s, ch19_csr, ch19_txsz, ch19_adr0, ch19_adr1, ch19_am0, ch19_am1;
output	[31:0]	pointer20, pointer20_s, ch20_csr, ch20_txsz, ch20_adr0, ch20_adr1, ch20_am0, ch20_am1;
output	[31:0]	pointer21, pointer21_s, ch21_csr, ch21_txsz, ch21_adr0, ch21_adr1, ch21_am0, ch21_am1;
output	[31:0]	pointer22, pointer22_s, ch22_csr, ch22_txsz, ch22_adr0, ch22_adr1, ch22_am0, ch22_am1;
output	[31:0]	pointer23, pointer23_s, ch23_csr, ch23_txsz, ch23_adr0, ch23_adr1, ch23_am0, ch23_am1;
output	[31:0]	pointer24, pointer24_s, ch24_csr, ch24_txsz, ch24_adr0, ch24_adr1, ch24_am0, ch24_am1;
output	[31:0]	pointer25, pointer25_s, ch25_csr, ch25_txsz, ch25_adr0, ch25_adr1, ch25_am0, ch25_am1;
output	[31:0]	pointer26, pointer26_s, ch26_csr, ch26_txsz, ch26_adr0, ch26_adr1, ch26_am0, ch26_am1;
output	[31:0]	pointer27, pointer27_s, ch27_csr, ch27_txsz, ch27_adr0, ch27_adr1, ch27_am0, ch27_am1;
output	[31:0]	pointer28, pointer28_s, ch28_csr, ch28_txsz, ch28_adr0, ch28_adr1, ch28_am0, ch28_am1;
output	[31:0]	pointer29, pointer29_s, ch29_csr, ch29_txsz, ch29_adr0, ch29_adr1, ch29_am0, ch29_am1;
output	[31:0]	pointer30, pointer30_s, ch30_csr, ch30_txsz, ch30_adr0, ch30_adr1, ch30_am0, ch30_am1;

input	[4:0]	ch_sel;		// Write Back Channel Select
input	[30:0]	ndnr;		// Next Descriptor No Request

// DMA Engine Abort
output		dma_abort;

// DMA Engine Status
output		pause_req;
input		paused;
input		dma_busy, dma_err, dma_done, dma_done_all;

// DMA Engine Reg File Update ctrl signals
input	[31:0]	de_csr;
input	[11:0]	de_txsz;
input	[31:0]	de_adr0;
input	[31:0]	de_adr1;
input		de_csr_we, de_txsz_we, de_adr0_we, de_adr1_we, ptr_set;
input		de_fetch_descr;
input	[30:0]	dma_rest;

////////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg	[31:0]	wb_rf_dout;
reg		inta_o, intb_o;
reg	[30:0]	int_maska_r, int_maskb_r;
wire	[31:0]	int_maska, int_maskb;
wire	[31:0]	int_srca, int_srcb;
wire		int_maska_we, int_maskb_we;
wire	[30:0]	ch_int;
wire		csr_we;
wire	[31:0]	csr;
reg	[7:0]	csr_r;

wire	[30:0]	ch_stop;
wire	[30:0]	ch_dis;

wire	[31:0]	ch0_csr, ch0_txsz, ch0_adr0, ch0_adr1, ch0_am0, ch0_am1;
wire	[31:0]	ch1_csr, ch1_txsz, ch1_adr0, ch1_adr1, ch1_am0, ch1_am1;
wire	[31:0]	ch2_csr, ch2_txsz, ch2_adr0, ch2_adr1, ch2_am0, ch2_am1;
wire	[31:0]	ch3_csr, ch3_txsz, ch3_adr0, ch3_adr1, ch3_am0, ch3_am1;
wire	[31:0]	ch4_csr, ch4_txsz, ch4_adr0, ch4_adr1, ch4_am0, ch4_am1;
wire	[31:0]	ch5_csr, ch5_txsz, ch5_adr0, ch5_adr1, ch5_am0, ch5_am1;
wire	[31:0]	ch6_csr, ch6_txsz, ch6_adr0, ch6_adr1, ch6_am0, ch6_am1;
wire	[31:0]	ch7_csr, ch7_txsz, ch7_adr0, ch7_adr1, ch7_am0, ch7_am1;
wire	[31:0]	ch8_csr, ch8_txsz, ch8_adr0, ch8_adr1, ch8_am0, ch8_am1;
wire	[31:0]	ch9_csr, ch9_txsz, ch9_adr0, ch9_adr1, ch9_am0, ch9_am1;
wire	[31:0]	ch10_csr, ch10_txsz, ch10_adr0, ch10_adr1, ch10_am0, ch10_am1;
wire	[31:0]	ch11_csr, ch11_txsz, ch11_adr0, ch11_adr1, ch11_am0, ch11_am1;
wire	[31:0]	ch12_csr, ch12_txsz, ch12_adr0, ch12_adr1, ch12_am0, ch12_am1;
wire	[31:0]	ch13_csr, ch13_txsz, ch13_adr0, ch13_adr1, ch13_am0, ch13_am1;
wire	[31:0]	ch14_csr, ch14_txsz, ch14_adr0, ch14_adr1, ch14_am0, ch14_am1;
wire	[31:0]	ch15_csr, ch15_txsz, ch15_adr0, ch15_adr1, ch15_am0, ch15_am1;
wire	[31:0]	ch16_csr, ch16_txsz, ch16_adr0, ch16_adr1, ch16_am0, ch16_am1;
wire	[31:0]	ch17_csr, ch17_txsz, ch17_adr0, ch17_adr1, ch17_am0, ch17_am1;
wire	[31:0]	ch18_csr, ch18_txsz, ch18_adr0, ch18_adr1, ch18_am0, ch18_am1;
wire	[31:0]	ch19_csr, ch19_txsz, ch19_adr0, ch19_adr1, ch19_am0, ch19_am1;
wire	[31:0]	ch20_csr, ch20_txsz, ch20_adr0, ch20_adr1, ch20_am0, ch20_am1;
wire	[31:0]	ch21_csr, ch21_txsz, ch21_adr0, ch21_adr1, ch21_am0, ch21_am1;
wire	[31:0]	ch22_csr, ch22_txsz, ch22_adr0, ch22_adr1, ch22_am0, ch22_am1;
wire	[31:0]	ch23_csr, ch23_txsz, ch23_adr0, ch23_adr1, ch23_am0, ch23_am1;
wire	[31:0]	ch24_csr, ch24_txsz, ch24_adr0, ch24_adr1, ch24_am0, ch24_am1;
wire	[31:0]	ch25_csr, ch25_txsz, ch25_adr0, ch25_adr1, ch25_am0, ch25_am1;
wire	[31:0]	ch26_csr, ch26_txsz, ch26_adr0, ch26_adr1, ch26_am0, ch26_am1;
wire	[31:0]	ch27_csr, ch27_txsz, ch27_adr0, ch27_adr1, ch27_am0, ch27_am1;
wire	[31:0]	ch28_csr, ch28_txsz, ch28_adr0, ch28_adr1, ch28_am0, ch28_am1;
wire	[31:0]	ch29_csr, ch29_txsz, ch29_adr0, ch29_adr1, ch29_am0, ch29_am1;
wire	[31:0]	ch30_csr, ch30_txsz, ch30_adr0, ch30_adr1, ch30_am0, ch30_am1;

wire	[31:0]	sw_pointer0, sw_pointer1, sw_pointer2, sw_pointer3;
wire	[31:0]	sw_pointer4, sw_pointer5, sw_pointer6, sw_pointer7;
wire	[31:0]	sw_pointer8, sw_pointer9, sw_pointer10, sw_pointer11;
wire	[31:0]	sw_pointer12, sw_pointer13, sw_pointer14, sw_pointer15;
wire	[31:0]	sw_pointer16, sw_pointer17, sw_pointer18, sw_pointer19;
wire	[31:0]	sw_pointer20, sw_pointer21, sw_pointer22, sw_pointer23;
wire	[31:0]	sw_pointer24, sw_pointer25, sw_pointer26, sw_pointer27;
wire	[31:0]	sw_pointer28, sw_pointer29, sw_pointer30;

////////////////////////////////////////////////////////////////////
//
// Aliases
//

assign int_maska = {1'h0, int_maska_r};
assign int_maskb = {1'h0, int_maskb_r};
assign csr = {31'h0, paused};

////////////////////////////////////////////////////////////////////
//
// Misc Logic
//

assign dma_abort = |ch_stop;
assign pause_req = csr_r[0];

////////////////////////////////////////////////////////////////////
//
// WISHBONE Register Read Logic
//

always @(posedge clk)
	case(wb_rf_adr)		// synopsys parallel_case full_case
	   8'h0:	wb_rf_dout <= #1 csr;
	   8'h1:	wb_rf_dout <= #1 int_maska;
	   8'h2:	wb_rf_dout <= #1 int_maskb;
	   8'h3:	wb_rf_dout <= #1 int_srca;
	   8'h4:	wb_rf_dout <= #1 int_srcb;

	   8'h8:	wb_rf_dout <= #1 ch0_csr;
	   8'h9:	wb_rf_dout <= #1 ch0_txsz;
	   8'ha:	wb_rf_dout <= #1 ch0_adr0;
	   8'hb:	wb_rf_dout <= #1 ch0_am0;
	   8'hc:	wb_rf_dout <= #1 ch0_adr1;
	   8'hd:	wb_rf_dout <= #1 ch0_am1;
	   8'he:	wb_rf_dout <= #1 pointer0;
	   8'hf:	wb_rf_dout <= #1 sw_pointer0;

`ifdef WDMA_HAVE_CH1
	   8'h10:	wb_rf_dout <= #1 ch1_csr;
	   8'h11:	wb_rf_dout <= #1 ch1_txsz;
	   8'h12:	wb_rf_dout <= #1 ch1_adr0;
	   8'h13:	wb_rf_dout <= #1 ch1_am0;
	   8'h14:	wb_rf_dout <= #1 ch1_adr1;
	   8'h15:	wb_rf_dout <= #1 ch1_am1;
	   8'h16:	wb_rf_dout <= #1 pointer1;
	   8'h17:	wb_rf_dout <= #1 sw_pointer1;
`endif

`ifdef WDMA_HAVE_CH2
	   8'h18:	wb_rf_dout <= #1 ch2_csr;
	   8'h19:	wb_rf_dout <= #1 ch2_txsz;
	   8'h1a:	wb_rf_dout <= #1 ch2_adr0;
	   8'h1b:	wb_rf_dout <= #1 ch2_am0;
	   8'h1c:	wb_rf_dout <= #1 ch2_adr1;
	   8'h1d:	wb_rf_dout <= #1 ch2_am1;
	   8'h1e:	wb_rf_dout <= #1 pointer2;
	   8'h1f:	wb_rf_dout <= #1 sw_pointer2;
`endif

`ifdef WDMA_HAVE_CH3
	   8'h20:	wb_rf_dout <= #1 ch3_csr;
	   8'h21:	wb_rf_dout <= #1 ch3_txsz;
	   8'h22:	wb_rf_dout <= #1 ch3_adr0;
	   8'h23:	wb_rf_dout <= #1 ch3_am0;
	   8'h24:	wb_rf_dout <= #1 ch3_adr1;
	   8'h25:	wb_rf_dout <= #1 ch3_am1;
	   8'h26:	wb_rf_dout <= #1 pointer3;
	   8'h27:	wb_rf_dout <= #1 sw_pointer3;
`endif

`ifdef WDMA_HAVE_CH4
	   8'h28:	wb_rf_dout <= #1 ch4_csr;
	   8'h29:	wb_rf_dout <= #1 ch4_txsz;
	   8'h2a:	wb_rf_dout <= #1 ch4_adr0;
	   8'h2b:	wb_rf_dout <= #1 ch4_am0;
	   8'h2c:	wb_rf_dout <= #1 ch4_adr1;
	   8'h2d:	wb_rf_dout <= #1 ch4_am1;
	   8'h2e:	wb_rf_dout <= #1 pointer4;
	   8'h2f:	wb_rf_dout <= #1 sw_pointer4;
`endif

`ifdef WDMA_HAVE_CH5
	   8'h30:	wb_rf_dout <= #1 ch5_csr;
	   8'h31:	wb_rf_dout <= #1 ch5_txsz;
	   8'h32:	wb_rf_dout <= #1 ch5_adr0;
	   8'h33:	wb_rf_dout <= #1 ch5_am0;
	   8'h34:	wb_rf_dout <= #1 ch5_adr1;
	   8'h35:	wb_rf_dout <= #1 ch5_am1;
	   8'h36:	wb_rf_dout <= #1 pointer5;
	   8'h37:	wb_rf_dout <= #1 sw_pointer5;
`endif

`ifdef WDMA_HAVE_CH6
	   8'h38:	wb_rf_dout <= #1 ch6_csr;
	   8'h39:	wb_rf_dout <= #1 ch6_txsz;
	   8'h3a:	wb_rf_dout <= #1 ch6_adr0;
	   8'h3b:	wb_rf_dout <= #1 ch6_am0;
	   8'h3c:	wb_rf_dout <= #1 ch6_adr1;
	   8'h3d:	wb_rf_dout <= #1 ch6_am1;
	   8'h3e:	wb_rf_dout <= #1 pointer6;
	   8'h3f:	wb_rf_dout <= #1 sw_pointer6;
`endif

`ifdef WDMA_HAVE_CH7
	   8'h40:	wb_rf_dout <= #1 ch7_csr;
	   8'h41:	wb_rf_dout <= #1 ch7_txsz;
	   8'h42:	wb_rf_dout <= #1 ch7_adr0;
	   8'h43:	wb_rf_dout <= #1 ch7_am0;
	   8'h44:	wb_rf_dout <= #1 ch7_adr1;
	   8'h45:	wb_rf_dout <= #1 ch7_am1;
	   8'h46:	wb_rf_dout <= #1 pointer7;
	   8'h47:	wb_rf_dout <= #1 sw_pointer7;
`endif

`ifdef WDMA_HAVE_CH8
	   8'h48:	wb_rf_dout <= #1 ch8_csr;
	   8'h49:	wb_rf_dout <= #1 ch8_txsz;
	   8'h4a:	wb_rf_dout <= #1 ch8_adr0;
	   8'h4b:	wb_rf_dout <= #1 ch8_am0;
	   8'h4c:	wb_rf_dout <= #1 ch8_adr1;
	   8'h4d:	wb_rf_dout <= #1 ch8_am1;
	   8'h4e:	wb_rf_dout <= #1 pointer8;
	   8'h4f:	wb_rf_dout <= #1 sw_pointer8;
`endif

`ifdef WDMA_HAVE_CH9
	   8'h50:	wb_rf_dout <= #1 ch9_csr;
	   8'h51:	wb_rf_dout <= #1 ch9_txsz;
	   8'h52:	wb_rf_dout <= #1 ch9_adr0;
	   8'h53:	wb_rf_dout <= #1 ch9_am0;
	   8'h54:	wb_rf_dout <= #1 ch9_adr1;
	   8'h55:	wb_rf_dout <= #1 ch9_am1;
	   8'h56:	wb_rf_dout <= #1 pointer9;
	   8'h57:	wb_rf_dout <= #1 sw_pointer9;
`endif

`ifdef WDMA_HAVE_CH10
	   8'h58:	wb_rf_dout <= #1 ch10_csr;
	   8'h59:	wb_rf_dout <= #1 ch10_txsz;
	   8'h5a:	wb_rf_dout <= #1 ch10_adr0;
	   8'h5b:	wb_rf_dout <= #1 ch10_am0;
	   8'h5c:	wb_rf_dout <= #1 ch10_adr1;
	   8'h5d:	wb_rf_dout <= #1 ch10_am1;
	   8'h5e:	wb_rf_dout <= #1 pointer10;
	   8'h5f:	wb_rf_dout <= #1 sw_pointer10;
`endif

`ifdef WDMA_HAVE_CH11
	   8'h60:	wb_rf_dout <= #1 ch11_csr;
	   8'h61:	wb_rf_dout <= #1 ch11_txsz;
	   8'h62:	wb_rf_dout <= #1 ch11_adr0;
	   8'h63:	wb_rf_dout <= #1 ch11_am0;
	   8'h64:	wb_rf_dout <= #1 ch11_adr1;
	   8'h65:	wb_rf_dout <= #1 ch11_am1;
	   8'h66:	wb_rf_dout <= #1 pointer11;
	   8'h67:	wb_rf_dout <= #1 sw_pointer11;
`endif

`ifdef WDMA_HAVE_CH12
	   8'h68:	wb_rf_dout <= #1 ch12_csr;
	   8'h69:	wb_rf_dout <= #1 ch12_txsz;
	   8'h6a:	wb_rf_dout <= #1 ch12_adr0;
	   8'h6b:	wb_rf_dout <= #1 ch12_am0;
	   8'h6c:	wb_rf_dout <= #1 ch12_adr1;
	   8'h6d:	wb_rf_dout <= #1 ch12_am1;
	   8'h6e:	wb_rf_dout <= #1 pointer12;
	   8'h6f:	wb_rf_dout <= #1 sw_pointer12;
`endif

`ifdef WDMA_HAVE_CH13
	   8'h70:	wb_rf_dout <= #1 ch13_csr;
	   8'h71:	wb_rf_dout <= #1 ch13_txsz;
	   8'h72:	wb_rf_dout <= #1 ch13_adr0;
	   8'h73:	wb_rf_dout <= #1 ch13_am0;
	   8'h74:	wb_rf_dout <= #1 ch13_adr1;
	   8'h75:	wb_rf_dout <= #1 ch13_am1;
	   8'h76:	wb_rf_dout <= #1 pointer13;
	   8'h77:	wb_rf_dout <= #1 sw_pointer13;
`endif

`ifdef WDMA_HAVE_CH14
	   8'h78:	wb_rf_dout <= #1 ch14_csr;
	   8'h79:	wb_rf_dout <= #1 ch14_txsz;
	   8'h7a:	wb_rf_dout <= #1 ch14_adr0;
	   8'h7b:	wb_rf_dout <= #1 ch14_am0;
	   8'h7c:	wb_rf_dout <= #1 ch14_adr1;
	   8'h7d:	wb_rf_dout <= #1 ch14_am1;
	   8'h7e:	wb_rf_dout <= #1 pointer14;
	   8'h7f:	wb_rf_dout <= #1 sw_pointer14;
`endif

`ifdef WDMA_HAVE_CH15
	   8'h80:	wb_rf_dout <= #1 ch15_csr;
	   8'h81:	wb_rf_dout <= #1 ch15_txsz;
	   8'h82:	wb_rf_dout <= #1 ch15_adr0;
	   8'h83:	wb_rf_dout <= #1 ch15_am0;
	   8'h84:	wb_rf_dout <= #1 ch15_adr1;
	   8'h85:	wb_rf_dout <= #1 ch15_am1;
	   8'h86:	wb_rf_dout <= #1 pointer15;
	   8'h87:	wb_rf_dout <= #1 sw_pointer15;
`endif

`ifdef WDMA_HAVE_CH16
	   8'h88:	wb_rf_dout <= #1 ch16_csr;
	   8'h89:	wb_rf_dout <= #1 ch16_txsz;
	   8'h8a:	wb_rf_dout <= #1 ch16_adr0;
	   8'h8b:	wb_rf_dout <= #1 ch16_am0;
	   8'h8c:	wb_rf_dout <= #1 ch16_adr1;
	   8'h8d:	wb_rf_dout <= #1 ch16_am1;
	   8'h8e:	wb_rf_dout <= #1 pointer16;
	   8'h8f:	wb_rf_dout <= #1 sw_pointer16;
`endif

`ifdef WDMA_HAVE_CH17
	   8'h90:	wb_rf_dout <= #1 ch17_csr;
	   8'h91:	wb_rf_dout <= #1 ch17_txsz;
	   8'h92:	wb_rf_dout <= #1 ch17_adr0;
	   8'h93:	wb_rf_dout <= #1 ch17_am0;
	   8'h94:	wb_rf_dout <= #1 ch17_adr1;
	   8'h95:	wb_rf_dout <= #1 ch17_am1;
	   8'h96:	wb_rf_dout <= #1 pointer17;
	   8'h97:	wb_rf_dout <= #1 sw_pointer17;
`endif

`ifdef WDMA_HAVE_CH18
	   8'h98:	wb_rf_dout <= #1 ch18_csr;
	   8'h99:	wb_rf_dout <= #1 ch18_txsz;
	   8'h9a:	wb_rf_dout <= #1 ch18_adr0;
	   8'h9b:	wb_rf_dout <= #1 ch18_am0;
	   8'h9c:	wb_rf_dout <= #1 ch18_adr1;
	   8'h9d:	wb_rf_dout <= #1 ch18_am1;
	   8'h9e:	wb_rf_dout <= #1 pointer18;
	   8'h9f:	wb_rf_dout <= #1 sw_pointer18;
`endif

`ifdef WDMA_HAVE_CH19
	   8'ha0:	wb_rf_dout <= #1 ch19_csr;
	   8'ha1:	wb_rf_dout <= #1 ch19_txsz;
	   8'ha2:	wb_rf_dout <= #1 ch19_adr0;
	   8'ha3:	wb_rf_dout <= #1 ch19_am0;
	   8'ha4:	wb_rf_dout <= #1 ch19_adr1;
	   8'ha5:	wb_rf_dout <= #1 ch19_am1;
	   8'ha6:	wb_rf_dout <= #1 pointer19;
	   8'ha7:	wb_rf_dout <= #1 sw_pointer19;
`endif

`ifdef WDMA_HAVE_CH20
	   8'ha8:	wb_rf_dout <= #1 ch20_csr;
	   8'ha9:	wb_rf_dout <= #1 ch20_txsz;
	   8'haa:	wb_rf_dout <= #1 ch20_adr0;
	   8'hab:	wb_rf_dout <= #1 ch20_am0;
	   8'hac:	wb_rf_dout <= #1 ch20_adr1;
	   8'had:	wb_rf_dout <= #1 ch20_am1;
	   8'hae:	wb_rf_dout <= #1 pointer20;
	   8'haf:	wb_rf_dout <= #1 sw_pointer20;
`endif

`ifdef WDMA_HAVE_CH21
	   8'hb0:	wb_rf_dout <= #1 ch21_csr;
	   8'hb1:	wb_rf_dout <= #1 ch21_txsz;
	   8'hb2:	wb_rf_dout <= #1 ch21_adr0;
	   8'hb3:	wb_rf_dout <= #1 ch21_am0;
	   8'hb4:	wb_rf_dout <= #1 ch21_adr1;
	   8'hb5:	wb_rf_dout <= #1 ch21_am1;
	   8'hb6:	wb_rf_dout <= #1 pointer21;
	   8'hb7:	wb_rf_dout <= #1 sw_pointer21;
`endif

`ifdef WDMA_HAVE_CH22
	   8'hb8:	wb_rf_dout <= #1 ch22_csr;
	   8'hb9:	wb_rf_dout <= #1 ch22_txsz;
	   8'hba:	wb_rf_dout <= #1 ch22_adr0;
	   8'hbb:	wb_rf_dout <= #1 ch22_am0;
	   8'hbc:	wb_rf_dout <= #1 ch22_adr1;
	   8'hbd:	wb_rf_dout <= #1 ch22_am1;
	   8'hbe:	wb_rf_dout <= #1 pointer22;
	   8'hbf:	wb_rf_dout <= #1 sw_pointer22;
`endif

`ifdef WDMA_HAVE_CH23
	   8'hc0:	wb_rf_dout <= #1 ch23_csr;
	   8'hc1:	wb_rf_dout <= #1 ch23_txsz;
	   8'hc2:	wb_rf_dout <= #1 ch23_adr0;
	   8'hc3:	wb_rf_dout <= #1 ch23_am0;
	   8'hc4:	wb_rf_dout <= #1 ch23_adr1;
	   8'hc5:	wb_rf_dout <= #1 ch23_am1;
	   8'hc6:	wb_rf_dout <= #1 pointer23;
	   8'hc7:	wb_rf_dout <= #1 sw_pointer23;
`endif

`ifdef WDMA_HAVE_CH24
	   8'hc8:	wb_rf_dout <= #1 ch24_csr;
	   8'hc9:	wb_rf_dout <= #1 ch24_txsz;
	   8'hca:	wb_rf_dout <= #1 ch24_adr0;
	   8'hcb:	wb_rf_dout <= #1 ch24_am0;
	   8'hcc:	wb_rf_dout <= #1 ch24_adr1;
	   8'hcd:	wb_rf_dout <= #1 ch24_am1;
	   8'hce:	wb_rf_dout <= #1 pointer24;
	   8'hcf:	wb_rf_dout <= #1 sw_pointer24;
`endif

`ifdef WDMA_HAVE_CH25
	   8'hd0:	wb_rf_dout <= #1 ch25_csr;
	   8'hd1:	wb_rf_dout <= #1 ch25_txsz;
	   8'hd2:	wb_rf_dout <= #1 ch25_adr0;
	   8'hd3:	wb_rf_dout <= #1 ch25_am0;
	   8'hd4:	wb_rf_dout <= #1 ch25_adr1;
	   8'hd5:	wb_rf_dout <= #1 ch25_am1;
	   8'hd6:	wb_rf_dout <= #1 pointer25;
	   8'hd7:	wb_rf_dout <= #1 sw_pointer25;
`endif

`ifdef WDMA_HAVE_CH26
	   8'hd8:	wb_rf_dout <= #1 ch26_csr;
	   8'hd9:	wb_rf_dout <= #1 ch26_txsz;
	   8'hda:	wb_rf_dout <= #1 ch26_adr0;
	   8'hdb:	wb_rf_dout <= #1 ch26_am0;
	   8'hdc:	wb_rf_dout <= #1 ch26_adr1;
	   8'hdd:	wb_rf_dout <= #1 ch26_am1;
	   8'hde:	wb_rf_dout <= #1 pointer26;
	   8'hdf:	wb_rf_dout <= #1 sw_pointer26;
`endif

`ifdef WDMA_HAVE_CH27
	   8'he0:	wb_rf_dout <= #1 ch27_csr;
	   8'he1:	wb_rf_dout <= #1 ch27_txsz;
	   8'he2:	wb_rf_dout <= #1 ch27_adr0;
	   8'he3:	wb_rf_dout <= #1 ch27_am0;
	   8'he4:	wb_rf_dout <= #1 ch27_adr1;
	   8'he5:	wb_rf_dout <= #1 ch27_am1;
	   8'he6:	wb_rf_dout <= #1 pointer27;
	   8'he7:	wb_rf_dout <= #1 sw_pointer27;
`endif

`ifdef WDMA_HAVE_CH28
	   8'he8:	wb_rf_dout <= #1 ch28_csr;
	   8'he9:	wb_rf_dout <= #1 ch28_txsz;
	   8'hea:	wb_rf_dout <= #1 ch28_adr0;
	   8'heb:	wb_rf_dout <= #1 ch28_am0;
	   8'hec:	wb_rf_dout <= #1 ch28_adr1;
	   8'hed:	wb_rf_dout <= #1 ch28_am1;
	   8'hee:	wb_rf_dout <= #1 pointer28;
	   8'hef:	wb_rf_dout <= #1 sw_pointer28;
`endif

`ifdef WDMA_HAVE_CH29
	   8'hf0:	wb_rf_dout <= #1 ch29_csr;
	   8'hf1:	wb_rf_dout <= #1 ch29_txsz;
	   8'hf2:	wb_rf_dout <= #1 ch29_adr0;
	   8'hf3:	wb_rf_dout <= #1 ch29_am0;
	   8'hf4:	wb_rf_dout <= #1 ch29_adr1;
	   8'hf5:	wb_rf_dout <= #1 ch29_am1;
	   8'hf6:	wb_rf_dout <= #1 pointer29;
	   8'hf7:	wb_rf_dout <= #1 sw_pointer29;
`endif

`ifdef WDMA_HAVE_CH30
	   8'hf8:	wb_rf_dout <= #1 ch30_csr;
	   8'hf9:	wb_rf_dout <= #1 ch30_txsz;
	   8'hfa:	wb_rf_dout <= #1 ch30_adr0;
	   8'hfb:	wb_rf_dout <= #1 ch30_am0;
	   8'hfc:	wb_rf_dout <= #1 ch30_adr1;
	   8'hfd:	wb_rf_dout <= #1 ch30_am1;
	   8'hfe:	wb_rf_dout <= #1 pointer30;
	   8'hff:	wb_rf_dout <= #1 sw_pointer30;
`endif

`ifdef WDMA_HAVE_CH31
	   8'h100:	wb_rf_dout <= #1 ch31_csr;
	   8'h101:	wb_rf_dout <= #1 ch31_txsz;
	   8'h102:	wb_rf_dout <= #1 ch31_adr0;
	   8'h103:	wb_rf_dout <= #1 ch31_am0;
	   8'h104:	wb_rf_dout <= #1 ch31_adr1;
	   8'h105:	wb_rf_dout <= #1 ch31_am1;
	   8'h106:	wb_rf_dout <= #1 pointer31;
	   8'h107:	wb_rf_dout <= #1 sw_pointer31;
`endif
	endcase


////////////////////////////////////////////////////////////////////
//
// WISHBONE Register Write Logic
// And DMA Engine register Update Logic
//

// Global Registers
assign csr_we		= wb_rf_we & (wb_rf_adr == 8'h0);
assign int_maska_we	= wb_rf_we & (wb_rf_adr == 8'h1);
assign int_maskb_we	= wb_rf_we & (wb_rf_adr == 8'h2);

// ---------------------------------------------------

always @(posedge clk or negedge rst)
	if(!rst)		csr_r <= #1 8'h0;
	else
	if(csr_we)		csr_r <= #1 wb_rf_din[7:0];

// ---------------------------------------------------
// INT_MASK
always @(posedge clk or negedge rst)
	if(!rst)		int_maska_r <= #1 31'h0;
	else
	if(int_maska_we)	int_maska_r <= #1 wb_rf_din[30:0];

always @(posedge clk or negedge rst)
	if(!rst)		int_maskb_r <= #1 31'h0;
	else
	if(int_maskb_we)	int_maskb_r <= #1 wb_rf_din[30:0];

////////////////////////////////////////////////////////////////////
//
// Interrupts
//

assign int_srca = {1'b0, (int_maska_r & ch_int) };
assign int_srcb = {1'b0, (int_maskb_r & ch_int) };

// Interrupt Outputs
always @(posedge clk)
	inta_o <= #1 |int_srca;

always @(posedge clk)
	intb_o <= #1 |int_srcb;

////////////////////////////////////////////////////////////////////
//
// Channel Register File
//

wb_dma_ch_rf #(0, `WDMA_HAVE_ARS0, `WDMA_HAVE_ED0, `WDMA_HAVE_CBUF0) u0(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer0	),
		.pointer_s(	pointer0_s	),
		.ch_csr(	ch0_csr		),
		.ch_txsz(	ch0_txsz	),
		.ch_adr0(	ch0_adr0	),
		.ch_adr1(	ch0_adr1	),
		.ch_am0(	ch0_am0		),
		.ch_am1(	ch0_am1		),
		.sw_pointer(	sw_pointer0	),
		.ch_stop(	ch_stop[0]	),
		.ch_dis(	ch_dis[0]	),
		.wint(		ch_int[0]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[0]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[0]	),
		.ptr_set(	ptr_set		)
		);

`ifdef WDMA_HAVE_CH1
wb_dma_ch_rf #(1, `WDMA_HAVE_ARS1, `WDMA_HAVE_ED1, `WDMA_HAVE_CBUF1) u1(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer1	),
		.pointer_s(	pointer1_s	),
		.ch_csr(	ch1_csr		),
		.ch_txsz(	ch1_txsz	),
		.ch_adr0(	ch1_adr0	),
		.ch_adr1(	ch1_adr1	),
		.ch_am0(	ch1_am0		),
		.ch_am1(	ch1_am1		),
		.sw_pointer(	sw_pointer1	),
		.ch_stop(	ch_stop[1]	),
		.ch_dis(	ch_dis[1]	),
		.wint(		ch_int[1]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[1]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[1]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(1, `WDMA_HAVE_ARS1, `WDMA_HAVE_ED1, `WDMA_HAVE_CBUF1) u1(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer1	),
		.pointer_s(	pointer1_s	),
		.ch_csr(	ch1_csr		),
		.ch_txsz(	ch1_txsz	),
		.ch_adr0(	ch1_adr0	),
		.ch_adr1(	ch1_adr1	),
		.ch_am0(	ch1_am0		),
		.ch_am1(	ch1_am1		),
		.sw_pointer(	sw_pointer1	),
		.ch_stop(	ch_stop[1]	),
		.ch_dis(	ch_dis[1]	),
		.wint(		ch_int[1]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[1]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[1]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH2
wb_dma_ch_rf #(2, `WDMA_HAVE_ARS2, `WDMA_HAVE_ED2, `WDMA_HAVE_CBUF2) u2(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer2	),
		.pointer_s(	pointer2_s	),
		.ch_csr(	ch2_csr		),
		.ch_txsz(	ch2_txsz	),
		.ch_adr0(	ch2_adr0	),
		.ch_adr1(	ch2_adr1	),
		.ch_am0(	ch2_am0		),
		.ch_am1(	ch2_am1		),
		.sw_pointer(	sw_pointer2	),
		.ch_stop(	ch_stop[2]	),
		.ch_dis(	ch_dis[2]	),
		.wint(		ch_int[2]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[2]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[2]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(2, `WDMA_HAVE_ARS2, `WDMA_HAVE_ED2, `WDMA_HAVE_CBUF2) u2(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer2	),
		.pointer_s(	pointer2_s	),
		.ch_csr(	ch2_csr		),
		.ch_txsz(	ch2_txsz	),
		.ch_adr0(	ch2_adr0	),
		.ch_adr1(	ch2_adr1	),
		.ch_am0(	ch2_am0		),
		.ch_am1(	ch2_am1		),
		.sw_pointer(	sw_pointer2	),
		.ch_stop(	ch_stop[2]	),
		.ch_dis(	ch_dis[2]	),
		.wint(		ch_int[2]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[2]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[2]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH3
wb_dma_ch_rf #(3, `WDMA_HAVE_ARS3, `WDMA_HAVE_ED3, `WDMA_HAVE_CBUF3) u3(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer3	),
		.pointer_s(	pointer3_s	),
		.ch_csr(	ch3_csr		),
		.ch_txsz(	ch3_txsz	),
		.ch_adr0(	ch3_adr0	),
		.ch_adr1(	ch3_adr1	),
		.ch_am0(	ch3_am0		),
		.ch_am1(	ch3_am1		),
		.sw_pointer(	sw_pointer3	),
		.ch_stop(	ch_stop[3]	),
		.ch_dis(	ch_dis[3]	),
		.wint(		ch_int[3]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[3]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[3]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(3, `WDMA_HAVE_ARS3, `WDMA_HAVE_ED3, `WDMA_HAVE_CBUF3) u3(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer3	),
		.pointer_s(	pointer3_s	),
		.ch_csr(	ch3_csr		),
		.ch_txsz(	ch3_txsz	),
		.ch_adr0(	ch3_adr0	),
		.ch_adr1(	ch3_adr1	),
		.ch_am0(	ch3_am0		),
		.ch_am1(	ch3_am1		),
		.sw_pointer(	sw_pointer3	),
		.ch_stop(	ch_stop[3]	),
		.ch_dis(	ch_dis[3]	),
		.wint(		ch_int[3]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[3]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[3]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH4
wb_dma_ch_rf #(4, `WDMA_HAVE_ARS4, `WDMA_HAVE_ED4, `WDMA_HAVE_CBUF4) u4(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer4	),
		.pointer_s(	pointer4_s	),
		.ch_csr(	ch4_csr		),
		.ch_txsz(	ch4_txsz	),
		.ch_adr0(	ch4_adr0	),
		.ch_adr1(	ch4_adr1	),
		.ch_am0(	ch4_am0		),
		.ch_am1(	ch4_am1		),
		.sw_pointer(	sw_pointer4	),
		.ch_stop(	ch_stop[4]	),
		.ch_dis(	ch_dis[4]	),
		.wint(		ch_int[4]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[4]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[4]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(4, `WDMA_HAVE_ARS4, `WDMA_HAVE_ED4, `WDMA_HAVE_CBUF4) u4(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer4	),
		.pointer_s(	pointer4_s	),
		.ch_csr(	ch4_csr		),
		.ch_txsz(	ch4_txsz	),
		.ch_adr0(	ch4_adr0	),
		.ch_adr1(	ch4_adr1	),
		.ch_am0(	ch4_am0		),
		.ch_am1(	ch4_am1		),
		.sw_pointer(	sw_pointer4	),
		.ch_stop(	ch_stop[4]	),
		.ch_dis(	ch_dis[4]	),
		.wint(		ch_int[4]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[4]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[4]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH5
wb_dma_ch_rf #(5, `WDMA_HAVE_ARS5, `WDMA_HAVE_ED5, `WDMA_HAVE_CBUF5) u5(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer5	),
		.pointer_s(	pointer5_s	),
		.ch_csr(	ch5_csr		),
		.ch_txsz(	ch5_txsz	),
		.ch_adr0(	ch5_adr0	),
		.ch_adr1(	ch5_adr1	),
		.ch_am0(	ch5_am0		),
		.ch_am1(	ch5_am1		),
		.sw_pointer(	sw_pointer5	),
		.ch_stop(	ch_stop[5]	),
		.ch_dis(	ch_dis[5]	),
		.wint(		ch_int[5]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[5]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[5]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(5, `WDMA_HAVE_ARS5, `WDMA_HAVE_ED5, `WDMA_HAVE_CBUF5) u5(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer5	),
		.pointer_s(	pointer5_s	),
		.ch_csr(	ch5_csr		),
		.ch_txsz(	ch5_txsz	),
		.ch_adr0(	ch5_adr0	),
		.ch_adr1(	ch5_adr1	),
		.ch_am0(	ch5_am0		),
		.ch_am1(	ch5_am1		),
		.sw_pointer(	sw_pointer5	),
		.ch_stop(	ch_stop[5]	),
		.ch_dis(	ch_dis[5]	),
		.wint(		ch_int[5]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[5]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[5]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH6
wb_dma_ch_rf #(6, `WDMA_HAVE_ARS6, `WDMA_HAVE_ED6, `WDMA_HAVE_CBUF6) u6(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer6	),
		.pointer_s(	pointer6_s	),
		.ch_csr(	ch6_csr		),
		.ch_txsz(	ch6_txsz	),
		.ch_adr0(	ch6_adr0	),
		.ch_adr1(	ch6_adr1	),
		.ch_am0(	ch6_am0		),
		.ch_am1(	ch6_am1		),
		.sw_pointer(	sw_pointer6	),
		.ch_stop(	ch_stop[6]	),
		.ch_dis(	ch_dis[6]	),
		.wint(		ch_int[6]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[6]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[6]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(6, `WDMA_HAVE_ARS6, `WDMA_HAVE_ED6, `WDMA_HAVE_CBUF6) u6(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer6	),
		.pointer_s(	pointer6_s	),
		.ch_csr(	ch6_csr		),
		.ch_txsz(	ch6_txsz	),
		.ch_adr0(	ch6_adr0	),
		.ch_adr1(	ch6_adr1	),
		.ch_am0(	ch6_am0		),
		.ch_am1(	ch6_am1		),
		.sw_pointer(	sw_pointer6	),
		.ch_stop(	ch_stop[6]	),
		.ch_dis(	ch_dis[6]	),
		.wint(		ch_int[6]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[6]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[6]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH7
wb_dma_ch_rf #(7, `WDMA_HAVE_ARS7, `WDMA_HAVE_ED7, `WDMA_HAVE_CBUF7) u7(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer7	),
		.pointer_s(	pointer7_s	),
		.ch_csr(	ch7_csr		),
		.ch_txsz(	ch7_txsz	),
		.ch_adr0(	ch7_adr0	),
		.ch_adr1(	ch7_adr1	),
		.ch_am0(	ch7_am0		),
		.ch_am1(	ch7_am1		),
		.sw_pointer(	sw_pointer7	),
		.ch_stop(	ch_stop[7]	),
		.ch_dis(	ch_dis[7]	),
		.wint(		ch_int[7]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[7]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[7]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(7, `WDMA_HAVE_ARS7, `WDMA_HAVE_ED7, `WDMA_HAVE_CBUF7) u7(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer7	),
		.pointer_s(	pointer7_s	),
		.ch_csr(	ch7_csr		),
		.ch_txsz(	ch7_txsz	),
		.ch_adr0(	ch7_adr0	),
		.ch_adr1(	ch7_adr1	),
		.ch_am0(	ch7_am0		),
		.ch_am1(	ch7_am1		),
		.sw_pointer(	sw_pointer7	),
		.ch_stop(	ch_stop[7]	),
		.ch_dis(	ch_dis[7]	),
		.wint(		ch_int[7]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[7]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[7]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH8
wb_dma_ch_rf #(8, `WDMA_HAVE_ARS8, `WDMA_HAVE_ED8, `WDMA_HAVE_CBUF8) u8(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer8	),
		.pointer_s(	pointer8_s	),
		.ch_csr(	ch8_csr		),
		.ch_txsz(	ch8_txsz	),
		.ch_adr0(	ch8_adr0	),
		.ch_adr1(	ch8_adr1	),
		.ch_am0(	ch8_am0		),
		.ch_am1(	ch8_am1		),
		.sw_pointer(	sw_pointer8	),
		.ch_stop(	ch_stop[8]	),
		.ch_dis(	ch_dis[8]	),
		.wint(		ch_int[8]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[8]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[8]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(8, `WDMA_HAVE_ARS8, `WDMA_HAVE_ED8, `WDMA_HAVE_CBUF8) u8(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer8	),
		.pointer_s(	pointer8_s	),
		.ch_csr(	ch8_csr		),
		.ch_txsz(	ch8_txsz	),
		.ch_adr0(	ch8_adr0	),
		.ch_adr1(	ch8_adr1	),
		.ch_am0(	ch8_am0		),
		.ch_am1(	ch8_am1		),
		.sw_pointer(	sw_pointer8	),
		.ch_stop(	ch_stop[8]	),
		.ch_dis(	ch_dis[8]	),
		.wint(		ch_int[8]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[8]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[8]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH9
wb_dma_ch_rf #(9, `WDMA_HAVE_ARS9, `WDMA_HAVE_ED9, `WDMA_HAVE_CBUF9) u9(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer9	),
		.pointer_s(	pointer9_s	),
		.ch_csr(	ch9_csr		),
		.ch_txsz(	ch9_txsz	),
		.ch_adr0(	ch9_adr0	),
		.ch_adr1(	ch9_adr1	),
		.ch_am0(	ch9_am0		),
		.ch_am1(	ch9_am1		),
		.sw_pointer(	sw_pointer9	),
		.ch_stop(	ch_stop[9]	),
		.ch_dis(	ch_dis[9]	),
		.wint(		ch_int[9]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[9]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[9]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(9, `WDMA_HAVE_ARS9, `WDMA_HAVE_ED9, `WDMA_HAVE_CBUF9) u9(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer9	),
		.pointer_s(	pointer9_s	),
		.ch_csr(	ch9_csr		),
		.ch_txsz(	ch9_txsz	),
		.ch_adr0(	ch9_adr0	),
		.ch_adr1(	ch9_adr1	),
		.ch_am0(	ch9_am0		),
		.ch_am1(	ch9_am1		),
		.sw_pointer(	sw_pointer9	),
		.ch_stop(	ch_stop[9]	),
		.ch_dis(	ch_dis[9]	),
		.wint(		ch_int[9]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[9]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[9]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH10
wb_dma_ch_rf #(10, `WDMA_HAVE_ARS10, `WDMA_HAVE_ED10, `WDMA_HAVE_CBUF10) u10(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer10	),
		.pointer_s(	pointer10_s	),
		.ch_csr(	ch10_csr		),
		.ch_txsz(	ch10_txsz	),
		.ch_adr0(	ch10_adr0	),
		.ch_adr1(	ch10_adr1	),
		.ch_am0(	ch10_am0		),
		.ch_am1(	ch10_am1		),
		.sw_pointer(	sw_pointer10	),
		.ch_stop(	ch_stop[10]	),
		.ch_dis(	ch_dis[10]	),
		.wint(		ch_int[10]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[10]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[10]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(10, `WDMA_HAVE_ARS10, `WDMA_HAVE_ED10, `WDMA_HAVE_CBUF10) u10(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer10	),
		.pointer_s(	pointer10_s	),
		.ch_csr(	ch10_csr		),
		.ch_txsz(	ch10_txsz	),
		.ch_adr0(	ch10_adr0	),
		.ch_adr1(	ch10_adr1	),
		.ch_am0(	ch10_am0		),
		.ch_am1(	ch10_am1		),
		.sw_pointer(	sw_pointer10	),
		.ch_stop(	ch_stop[10]	),
		.ch_dis(	ch_dis[10]	),
		.wint(		ch_int[10]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[10]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[10]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH11
wb_dma_ch_rf #(11, `WDMA_HAVE_ARS11, `WDMA_HAVE_ED11, `WDMA_HAVE_CBUF11) u11(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer11	),
		.pointer_s(	pointer11_s	),
		.ch_csr(	ch11_csr		),
		.ch_txsz(	ch11_txsz	),
		.ch_adr0(	ch11_adr0	),
		.ch_adr1(	ch11_adr1	),
		.ch_am0(	ch11_am0		),
		.ch_am1(	ch11_am1		),
		.sw_pointer(	sw_pointer11	),
		.ch_stop(	ch_stop[11]	),
		.ch_dis(	ch_dis[11]	),
		.wint(		ch_int[11]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[11]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[11]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(11, `WDMA_HAVE_ARS11, `WDMA_HAVE_ED11, `WDMA_HAVE_CBUF11) u11(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer11	),
		.pointer_s(	pointer11_s	),
		.ch_csr(	ch11_csr		),
		.ch_txsz(	ch11_txsz	),
		.ch_adr0(	ch11_adr0	),
		.ch_adr1(	ch11_adr1	),
		.ch_am0(	ch11_am0		),
		.ch_am1(	ch11_am1		),
		.sw_pointer(	sw_pointer11	),
		.ch_stop(	ch_stop[11]	),
		.ch_dis(	ch_dis[11]	),
		.wint(		ch_int[11]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[11]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[11]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH12
wb_dma_ch_rf #(12, `WDMA_HAVE_ARS12, `WDMA_HAVE_ED12, `WDMA_HAVE_CBUF12) u12(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer12	),
		.pointer_s(	pointer12_s	),
		.ch_csr(	ch12_csr		),
		.ch_txsz(	ch12_txsz	),
		.ch_adr0(	ch12_adr0	),
		.ch_adr1(	ch12_adr1	),
		.ch_am0(	ch12_am0		),
		.ch_am1(	ch12_am1		),
		.sw_pointer(	sw_pointer12	),
		.ch_stop(	ch_stop[12]	),
		.ch_dis(	ch_dis[12]	),
		.wint(		ch_int[12]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[12]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[12]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(12, `WDMA_HAVE_ARS12, `WDMA_HAVE_ED12, `WDMA_HAVE_CBUF12) u12(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer12	),
		.pointer_s(	pointer12_s	),
		.ch_csr(	ch12_csr		),
		.ch_txsz(	ch12_txsz	),
		.ch_adr0(	ch12_adr0	),
		.ch_adr1(	ch12_adr1	),
		.ch_am0(	ch12_am0		),
		.ch_am1(	ch12_am1		),
		.sw_pointer(	sw_pointer12	),
		.ch_stop(	ch_stop[12]	),
		.ch_dis(	ch_dis[12]	),
		.wint(		ch_int[12]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[12]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[12]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH13
wb_dma_ch_rf #(13, `WDMA_HAVE_ARS13, `WDMA_HAVE_ED13, `WDMA_HAVE_CBUF13) u13(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer13	),
		.pointer_s(	pointer13_s	),
		.ch_csr(	ch13_csr		),
		.ch_txsz(	ch13_txsz	),
		.ch_adr0(	ch13_adr0	),
		.ch_adr1(	ch13_adr1	),
		.ch_am0(	ch13_am0		),
		.ch_am1(	ch13_am1		),
		.sw_pointer(	sw_pointer13	),
		.ch_stop(	ch_stop[13]	),
		.ch_dis(	ch_dis[13]	),
		.wint(		ch_int[13]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[13]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[13]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(13, `WDMA_HAVE_ARS13, `WDMA_HAVE_ED13, `WDMA_HAVE_CBUF13) u13(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer13	),
		.pointer_s(	pointer13_s	),
		.ch_csr(	ch13_csr		),
		.ch_txsz(	ch13_txsz	),
		.ch_adr0(	ch13_adr0	),
		.ch_adr1(	ch13_adr1	),
		.ch_am0(	ch13_am0		),
		.ch_am1(	ch13_am1		),
		.sw_pointer(	sw_pointer13	),
		.ch_stop(	ch_stop[13]	),
		.ch_dis(	ch_dis[13]	),
		.wint(		ch_int[13]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[13]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[13]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH14
wb_dma_ch_rf #(14, `WDMA_HAVE_ARS14, `WDMA_HAVE_ED14, `WDMA_HAVE_CBUF14) u14(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer14	),
		.pointer_s(	pointer14_s	),
		.ch_csr(	ch14_csr		),
		.ch_txsz(	ch14_txsz	),
		.ch_adr0(	ch14_adr0	),
		.ch_adr1(	ch14_adr1	),
		.ch_am0(	ch14_am0		),
		.ch_am1(	ch14_am1		),
		.sw_pointer(	sw_pointer14	),
		.ch_stop(	ch_stop[14]	),
		.ch_dis(	ch_dis[14]	),
		.wint(		ch_int[14]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[14]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[14]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(14, `WDMA_HAVE_ARS14, `WDMA_HAVE_ED14, `WDMA_HAVE_CBUF14) u14(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer14	),
		.pointer_s(	pointer14_s	),
		.ch_csr(	ch14_csr		),
		.ch_txsz(	ch14_txsz	),
		.ch_adr0(	ch14_adr0	),
		.ch_adr1(	ch14_adr1	),
		.ch_am0(	ch14_am0		),
		.ch_am1(	ch14_am1		),
		.sw_pointer(	sw_pointer14	),
		.ch_stop(	ch_stop[14]	),
		.ch_dis(	ch_dis[14]	),
		.wint(		ch_int[14]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[14]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[14]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH15
wb_dma_ch_rf #(15, `WDMA_HAVE_ARS15, `WDMA_HAVE_ED15, `WDMA_HAVE_CBUF15) u15(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer15	),
		.pointer_s(	pointer15_s	),
		.ch_csr(	ch15_csr		),
		.ch_txsz(	ch15_txsz	),
		.ch_adr0(	ch15_adr0	),
		.ch_adr1(	ch15_adr1	),
		.ch_am0(	ch15_am0		),
		.ch_am1(	ch15_am1		),
		.sw_pointer(	sw_pointer15	),
		.ch_stop(	ch_stop[15]	),
		.ch_dis(	ch_dis[15]	),
		.wint(		ch_int[15]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[15]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[15]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(15, `WDMA_HAVE_ARS15, `WDMA_HAVE_ED15, `WDMA_HAVE_CBUF15) u15(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer15	),
		.pointer_s(	pointer15_s	),
		.ch_csr(	ch15_csr		),
		.ch_txsz(	ch15_txsz	),
		.ch_adr0(	ch15_adr0	),
		.ch_adr1(	ch15_adr1	),
		.ch_am0(	ch15_am0		),
		.ch_am1(	ch15_am1		),
		.sw_pointer(	sw_pointer15	),
		.ch_stop(	ch_stop[15]	),
		.ch_dis(	ch_dis[15]	),
		.wint(		ch_int[15]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[15]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[15]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH16
wb_dma_ch_rf #(16, `WDMA_HAVE_ARS16, `WDMA_HAVE_ED16, `WDMA_HAVE_CBUF16) u16(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer16	),
		.pointer_s(	pointer16_s	),
		.ch_csr(	ch16_csr		),
		.ch_txsz(	ch16_txsz	),
		.ch_adr0(	ch16_adr0	),
		.ch_adr1(	ch16_adr1	),
		.ch_am0(	ch16_am0		),
		.ch_am1(	ch16_am1		),
		.sw_pointer(	sw_pointer16	),
		.ch_stop(	ch_stop[16]	),
		.ch_dis(	ch_dis[16]	),
		.wint(		ch_int[16]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[16]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[16]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(16, `WDMA_HAVE_ARS16, `WDMA_HAVE_ED16, `WDMA_HAVE_CBUF16) u16(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer16	),
		.pointer_s(	pointer16_s	),
		.ch_csr(	ch16_csr		),
		.ch_txsz(	ch16_txsz	),
		.ch_adr0(	ch16_adr0	),
		.ch_adr1(	ch16_adr1	),
		.ch_am0(	ch16_am0		),
		.ch_am1(	ch16_am1		),
		.sw_pointer(	sw_pointer16	),
		.ch_stop(	ch_stop[16]	),
		.ch_dis(	ch_dis[16]	),
		.wint(		ch_int[16]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[16]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[16]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH17
wb_dma_ch_rf #(17, `WDMA_HAVE_ARS17, `WDMA_HAVE_ED17, `WDMA_HAVE_CBUF17) u17(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer17	),
		.pointer_s(	pointer17_s	),
		.ch_csr(	ch17_csr		),
		.ch_txsz(	ch17_txsz	),
		.ch_adr0(	ch17_adr0	),
		.ch_adr1(	ch17_adr1	),
		.ch_am0(	ch17_am0		),
		.ch_am1(	ch17_am1		),
		.sw_pointer(	sw_pointer17	),
		.ch_stop(	ch_stop[17]	),
		.ch_dis(	ch_dis[17]	),
		.wint(		ch_int[17]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[17]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[17]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(17, `WDMA_HAVE_ARS17, `WDMA_HAVE_ED17, `WDMA_HAVE_CBUF17) u17(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer17	),
		.pointer_s(	pointer17_s	),
		.ch_csr(	ch17_csr		),
		.ch_txsz(	ch17_txsz	),
		.ch_adr0(	ch17_adr0	),
		.ch_adr1(	ch17_adr1	),
		.ch_am0(	ch17_am0		),
		.ch_am1(	ch17_am1		),
		.sw_pointer(	sw_pointer17	),
		.ch_stop(	ch_stop[17]	),
		.ch_dis(	ch_dis[17]	),
		.wint(		ch_int[17]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[17]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[17]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH18
wb_dma_ch_rf #(18, `WDMA_HAVE_ARS18, `WDMA_HAVE_ED18, `WDMA_HAVE_CBUF18) u18(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer18	),
		.pointer_s(	pointer18_s	),
		.ch_csr(	ch18_csr		),
		.ch_txsz(	ch18_txsz	),
		.ch_adr0(	ch18_adr0	),
		.ch_adr1(	ch18_adr1	),
		.ch_am0(	ch18_am0		),
		.ch_am1(	ch18_am1		),
		.sw_pointer(	sw_pointer18	),
		.ch_stop(	ch_stop[18]	),
		.ch_dis(	ch_dis[18]	),
		.wint(		ch_int[18]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[18]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[18]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(18, `WDMA_HAVE_ARS18, `WDMA_HAVE_ED18, `WDMA_HAVE_CBUF18) u18(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer18	),
		.pointer_s(	pointer18_s	),
		.ch_csr(	ch18_csr		),
		.ch_txsz(	ch18_txsz	),
		.ch_adr0(	ch18_adr0	),
		.ch_adr1(	ch18_adr1	),
		.ch_am0(	ch18_am0		),
		.ch_am1(	ch18_am1		),
		.sw_pointer(	sw_pointer18	),
		.ch_stop(	ch_stop[18]	),
		.ch_dis(	ch_dis[18]	),
		.wint(		ch_int[18]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[18]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[18]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH19
wb_dma_ch_rf #(19, `WDMA_HAVE_ARS19, `WDMA_HAVE_ED19, `WDMA_HAVE_CBUF19) u19(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer19	),
		.pointer_s(	pointer19_s	),
		.ch_csr(	ch19_csr		),
		.ch_txsz(	ch19_txsz	),
		.ch_adr0(	ch19_adr0	),
		.ch_adr1(	ch19_adr1	),
		.ch_am0(	ch19_am0		),
		.ch_am1(	ch19_am1		),
		.sw_pointer(	sw_pointer19	),
		.ch_stop(	ch_stop[19]	),
		.ch_dis(	ch_dis[19]	),
		.wint(		ch_int[19]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[19]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[19]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(19, `WDMA_HAVE_ARS19, `WDMA_HAVE_ED19, `WDMA_HAVE_CBUF19) u19(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer19	),
		.pointer_s(	pointer19_s	),
		.ch_csr(	ch19_csr		),
		.ch_txsz(	ch19_txsz	),
		.ch_adr0(	ch19_adr0	),
		.ch_adr1(	ch19_adr1	),
		.ch_am0(	ch19_am0		),
		.ch_am1(	ch19_am1		),
		.sw_pointer(	sw_pointer19	),
		.ch_stop(	ch_stop[19]	),
		.ch_dis(	ch_dis[19]	),
		.wint(		ch_int[19]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[19]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[19]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH20
wb_dma_ch_rf #(20, `WDMA_HAVE_ARS20, `WDMA_HAVE_ED20, `WDMA_HAVE_CBUF20) u20(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer20	),
		.pointer_s(	pointer20_s	),
		.ch_csr(	ch20_csr		),
		.ch_txsz(	ch20_txsz	),
		.ch_adr0(	ch20_adr0	),
		.ch_adr1(	ch20_adr1	),
		.ch_am0(	ch20_am0		),
		.ch_am1(	ch20_am1		),
		.sw_pointer(	sw_pointer20	),
		.ch_stop(	ch_stop[20]	),
		.ch_dis(	ch_dis[20]	),
		.wint(		ch_int[20]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[20]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[20]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(20, `WDMA_HAVE_ARS20, `WDMA_HAVE_ED20, `WDMA_HAVE_CBUF20) u20(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer20	),
		.pointer_s(	pointer20_s	),
		.ch_csr(	ch20_csr		),
		.ch_txsz(	ch20_txsz	),
		.ch_adr0(	ch20_adr0	),
		.ch_adr1(	ch20_adr1	),
		.ch_am0(	ch20_am0		),
		.ch_am1(	ch20_am1		),
		.sw_pointer(	sw_pointer20	),
		.ch_stop(	ch_stop[20]	),
		.ch_dis(	ch_dis[20]	),
		.wint(		ch_int[20]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[20]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[20]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH21
wb_dma_ch_rf #(21, `WDMA_HAVE_ARS21, `WDMA_HAVE_ED21, `WDMA_HAVE_CBUF21) u21(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer21	),
		.pointer_s(	pointer21_s	),
		.ch_csr(	ch21_csr		),
		.ch_txsz(	ch21_txsz	),
		.ch_adr0(	ch21_adr0	),
		.ch_adr1(	ch21_adr1	),
		.ch_am0(	ch21_am0		),
		.ch_am1(	ch21_am1		),
		.sw_pointer(	sw_pointer21	),
		.ch_stop(	ch_stop[21]	),
		.ch_dis(	ch_dis[21]	),
		.wint(		ch_int[21]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[21]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[21]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(21, `WDMA_HAVE_ARS21, `WDMA_HAVE_ED21, `WDMA_HAVE_CBUF21) u21(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer21	),
		.pointer_s(	pointer21_s	),
		.ch_csr(	ch21_csr		),
		.ch_txsz(	ch21_txsz	),
		.ch_adr0(	ch21_adr0	),
		.ch_adr1(	ch21_adr1	),
		.ch_am0(	ch21_am0		),
		.ch_am1(	ch21_am1		),
		.sw_pointer(	sw_pointer21	),
		.ch_stop(	ch_stop[21]	),
		.ch_dis(	ch_dis[21]	),
		.wint(		ch_int[21]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[21]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[21]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH22
wb_dma_ch_rf #(22, `WDMA_HAVE_ARS22, `WDMA_HAVE_ED22, `WDMA_HAVE_CBUF22) u22(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer22	),
		.pointer_s(	pointer22_s	),
		.ch_csr(	ch22_csr		),
		.ch_txsz(	ch22_txsz	),
		.ch_adr0(	ch22_adr0	),
		.ch_adr1(	ch22_adr1	),
		.ch_am0(	ch22_am0		),
		.ch_am1(	ch22_am1		),
		.sw_pointer(	sw_pointer22	),
		.ch_stop(	ch_stop[22]	),
		.ch_dis(	ch_dis[22]	),
		.wint(		ch_int[22]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[22]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[22]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(22, `WDMA_HAVE_ARS22, `WDMA_HAVE_ED22, `WDMA_HAVE_CBUF22) u22(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer22	),
		.pointer_s(	pointer22_s	),
		.ch_csr(	ch22_csr		),
		.ch_txsz(	ch22_txsz	),
		.ch_adr0(	ch22_adr0	),
		.ch_adr1(	ch22_adr1	),
		.ch_am0(	ch22_am0		),
		.ch_am1(	ch22_am1		),
		.sw_pointer(	sw_pointer22	),
		.ch_stop(	ch_stop[22]	),
		.ch_dis(	ch_dis[22]	),
		.wint(		ch_int[22]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[22]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[22]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH23
wb_dma_ch_rf #(23, `WDMA_HAVE_ARS23, `WDMA_HAVE_ED23, `WDMA_HAVE_CBUF23) u23(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer23	),
		.pointer_s(	pointer23_s	),
		.ch_csr(	ch23_csr		),
		.ch_txsz(	ch23_txsz	),
		.ch_adr0(	ch23_adr0	),
		.ch_adr1(	ch23_adr1	),
		.ch_am0(	ch23_am0		),
		.ch_am1(	ch23_am1		),
		.sw_pointer(	sw_pointer23	),
		.ch_stop(	ch_stop[23]	),
		.ch_dis(	ch_dis[23]	),
		.wint(		ch_int[23]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[23]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[23]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(23, `WDMA_HAVE_ARS23, `WDMA_HAVE_ED23, `WDMA_HAVE_CBUF23) u23(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer23	),
		.pointer_s(	pointer23_s	),
		.ch_csr(	ch23_csr		),
		.ch_txsz(	ch23_txsz	),
		.ch_adr0(	ch23_adr0	),
		.ch_adr1(	ch23_adr1	),
		.ch_am0(	ch23_am0		),
		.ch_am1(	ch23_am1		),
		.sw_pointer(	sw_pointer23	),
		.ch_stop(	ch_stop[23]	),
		.ch_dis(	ch_dis[23]	),
		.wint(		ch_int[23]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[23]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[23]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH24
wb_dma_ch_rf #(24, `WDMA_HAVE_ARS24, `WDMA_HAVE_ED24, `WDMA_HAVE_CBUF24) u24(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer24	),
		.pointer_s(	pointer24_s	),
		.ch_csr(	ch24_csr		),
		.ch_txsz(	ch24_txsz	),
		.ch_adr0(	ch24_adr0	),
		.ch_adr1(	ch24_adr1	),
		.ch_am0(	ch24_am0		),
		.ch_am1(	ch24_am1		),
		.sw_pointer(	sw_pointer24	),
		.ch_stop(	ch_stop[24]	),
		.ch_dis(	ch_dis[24]	),
		.wint(		ch_int[24]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[24]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[24]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(24, `WDMA_HAVE_ARS24, `WDMA_HAVE_ED24, `WDMA_HAVE_CBUF24) u24(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer24	),
		.pointer_s(	pointer24_s	),
		.ch_csr(	ch24_csr		),
		.ch_txsz(	ch24_txsz	),
		.ch_adr0(	ch24_adr0	),
		.ch_adr1(	ch24_adr1	),
		.ch_am0(	ch24_am0		),
		.ch_am1(	ch24_am1		),
		.sw_pointer(	sw_pointer24	),
		.ch_stop(	ch_stop[24]	),
		.ch_dis(	ch_dis[24]	),
		.wint(		ch_int[24]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[24]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[24]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH25
wb_dma_ch_rf #(25, `WDMA_HAVE_ARS25, `WDMA_HAVE_ED25, `WDMA_HAVE_CBUF25) u25(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer25	),
		.pointer_s(	pointer25_s	),
		.ch_csr(	ch25_csr		),
		.ch_txsz(	ch25_txsz	),
		.ch_adr0(	ch25_adr0	),
		.ch_adr1(	ch25_adr1	),
		.ch_am0(	ch25_am0		),
		.ch_am1(	ch25_am1		),
		.sw_pointer(	sw_pointer25	),
		.ch_stop(	ch_stop[25]	),
		.ch_dis(	ch_dis[25]	),
		.wint(		ch_int[25]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[25]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[25]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(25, `WDMA_HAVE_ARS25, `WDMA_HAVE_ED25, `WDMA_HAVE_CBUF25) u25(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer25	),
		.pointer_s(	pointer25_s	),
		.ch_csr(	ch25_csr		),
		.ch_txsz(	ch25_txsz	),
		.ch_adr0(	ch25_adr0	),
		.ch_adr1(	ch25_adr1	),
		.ch_am0(	ch25_am0		),
		.ch_am1(	ch25_am1		),
		.sw_pointer(	sw_pointer25	),
		.ch_stop(	ch_stop[25]	),
		.ch_dis(	ch_dis[25]	),
		.wint(		ch_int[25]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[25]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[25]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH26
wb_dma_ch_rf #(26, `WDMA_HAVE_ARS26, `WDMA_HAVE_ED26, `WDMA_HAVE_CBUF26) u26(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer26	),
		.pointer_s(	pointer26_s	),
		.ch_csr(	ch26_csr		),
		.ch_txsz(	ch26_txsz	),
		.ch_adr0(	ch26_adr0	),
		.ch_adr1(	ch26_adr1	),
		.ch_am0(	ch26_am0		),
		.ch_am1(	ch26_am1		),
		.sw_pointer(	sw_pointer26	),
		.ch_stop(	ch_stop[26]	),
		.ch_dis(	ch_dis[26]	),
		.wint(		ch_int[26]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[26]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[26]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(26, `WDMA_HAVE_ARS26, `WDMA_HAVE_ED26, `WDMA_HAVE_CBUF26) u26(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer26	),
		.pointer_s(	pointer26_s	),
		.ch_csr(	ch26_csr		),
		.ch_txsz(	ch26_txsz	),
		.ch_adr0(	ch26_adr0	),
		.ch_adr1(	ch26_adr1	),
		.ch_am0(	ch26_am0		),
		.ch_am1(	ch26_am1		),
		.sw_pointer(	sw_pointer26	),
		.ch_stop(	ch_stop[26]	),
		.ch_dis(	ch_dis[26]	),
		.wint(		ch_int[26]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[26]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[26]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH27
wb_dma_ch_rf #(27, `WDMA_HAVE_ARS27, `WDMA_HAVE_ED27, `WDMA_HAVE_CBUF27) u27(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer27	),
		.pointer_s(	pointer27_s	),
		.ch_csr(	ch27_csr		),
		.ch_txsz(	ch27_txsz	),
		.ch_adr0(	ch27_adr0	),
		.ch_adr1(	ch27_adr1	),
		.ch_am0(	ch27_am0		),
		.ch_am1(	ch27_am1		),
		.sw_pointer(	sw_pointer27	),
		.ch_stop(	ch_stop[27]	),
		.ch_dis(	ch_dis[27]	),
		.wint(		ch_int[27]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[27]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[27]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(27, `WDMA_HAVE_ARS27, `WDMA_HAVE_ED27, `WDMA_HAVE_CBUF27) u27(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer27	),
		.pointer_s(	pointer27_s	),
		.ch_csr(	ch27_csr		),
		.ch_txsz(	ch27_txsz	),
		.ch_adr0(	ch27_adr0	),
		.ch_adr1(	ch27_adr1	),
		.ch_am0(	ch27_am0		),
		.ch_am1(	ch27_am1		),
		.sw_pointer(	sw_pointer27	),
		.ch_stop(	ch_stop[27]	),
		.ch_dis(	ch_dis[27]	),
		.wint(		ch_int[27]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[27]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[27]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH28
wb_dma_ch_rf #(28, `WDMA_HAVE_ARS28, `WDMA_HAVE_ED28, `WDMA_HAVE_CBUF28) u28(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer28	),
		.pointer_s(	pointer28_s	),
		.ch_csr(	ch28_csr		),
		.ch_txsz(	ch28_txsz	),
		.ch_adr0(	ch28_adr0	),
		.ch_adr1(	ch28_adr1	),
		.ch_am0(	ch28_am0		),
		.ch_am1(	ch28_am1		),
		.sw_pointer(	sw_pointer28	),
		.ch_stop(	ch_stop[28]	),
		.ch_dis(	ch_dis[28]	),
		.wint(		ch_int[28]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[28]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[28]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(28, `WDMA_HAVE_ARS28, `WDMA_HAVE_ED28, `WDMA_HAVE_CBUF28) u28(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer28	),
		.pointer_s(	pointer28_s	),
		.ch_csr(	ch28_csr		),
		.ch_txsz(	ch28_txsz	),
		.ch_adr0(	ch28_adr0	),
		.ch_adr1(	ch28_adr1	),
		.ch_am0(	ch28_am0		),
		.ch_am1(	ch28_am1		),
		.sw_pointer(	sw_pointer28	),
		.ch_stop(	ch_stop[28]	),
		.ch_dis(	ch_dis[28]	),
		.wint(		ch_int[28]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[28]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[28]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH29
wb_dma_ch_rf #(29, `WDMA_HAVE_ARS29, `WDMA_HAVE_ED29, `WDMA_HAVE_CBUF29) u29(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer29	),
		.pointer_s(	pointer29_s	),
		.ch_csr(	ch29_csr		),
		.ch_txsz(	ch29_txsz	),
		.ch_adr0(	ch29_adr0	),
		.ch_adr1(	ch29_adr1	),
		.ch_am0(	ch29_am0		),
		.ch_am1(	ch29_am1		),
		.sw_pointer(	sw_pointer29	),
		.ch_stop(	ch_stop[29]	),
		.ch_dis(	ch_dis[29]	),
		.wint(		ch_int[29]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[29]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[29]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(29, `WDMA_HAVE_ARS29, `WDMA_HAVE_ED29, `WDMA_HAVE_CBUF29) u29(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer29	),
		.pointer_s(	pointer29_s	),
		.ch_csr(	ch29_csr		),
		.ch_txsz(	ch29_txsz	),
		.ch_adr0(	ch29_adr0	),
		.ch_adr1(	ch29_adr1	),
		.ch_am0(	ch29_am0		),
		.ch_am1(	ch29_am1		),
		.sw_pointer(	sw_pointer29	),
		.ch_stop(	ch_stop[29]	),
		.ch_dis(	ch_dis[29]	),
		.wint(		ch_int[29]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[29]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[29]	),
		.ptr_set(	ptr_set		)
		);
`endif


`ifdef WDMA_HAVE_CH30
wb_dma_ch_rf #(30, `WDMA_HAVE_ARS30, `WDMA_HAVE_ED30, `WDMA_HAVE_CBUF30) u30(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer30	),
		.pointer_s(	pointer30_s	),
		.ch_csr(	ch30_csr		),
		.ch_txsz(	ch30_txsz	),
		.ch_adr0(	ch30_adr0	),
		.ch_adr1(	ch30_adr1	),
		.ch_am0(	ch30_am0		),
		.ch_am1(	ch30_am1		),
		.sw_pointer(	sw_pointer30	),
		.ch_stop(	ch_stop[30]	),
		.ch_dis(	ch_dis[30]	),
		.wint(		ch_int[30]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[30]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[30]	),
		.ptr_set(	ptr_set		)
		);
`else
wb_dma_ch_rf_dummy #(30, `WDMA_HAVE_ARS30, `WDMA_HAVE_ED30, `WDMA_HAVE_CBUF30) u30(
		.clk(		clk		),
		.rst(		rst		),
		.pointer(	pointer30	),
		.pointer_s(	pointer30_s	),
		.ch_csr(	ch30_csr		),
		.ch_txsz(	ch30_txsz	),
		.ch_adr0(	ch30_adr0	),
		.ch_adr1(	ch30_adr1	),
		.ch_am0(	ch30_am0		),
		.ch_am1(	ch30_am1		),
		.sw_pointer(	sw_pointer30	),
		.ch_stop(	ch_stop[30]	),
		.ch_dis(	ch_dis[30]	),
		.wint(		ch_int[30]	),
		.wb_rf_din(	wb_rf_din	),
		.wb_rf_adr(	wb_rf_adr	),
		.wb_rf_we(	wb_rf_we	),
		.wb_rf_re(	wb_rf_re	),
		.ch_sel(	ch_sel		),
		.ndnr(		ndnr[30]		),
		.dma_busy(	dma_busy	),
		.dma_err(	dma_err		),
		.dma_done(	dma_done	),
		.dma_done_all(	dma_done_all	),
		.de_csr(	de_csr		),
		.de_txsz(	de_txsz		),
		.de_adr0(	de_adr0		),
		.de_adr1(	de_adr1		),
		.de_csr_we(	de_csr_we	),
		.de_txsz_we(	de_txsz_we	),
		.de_adr0_we(	de_adr0_we	),
		.de_adr1_we(	de_adr1_we	),
		.de_fetch_descr(de_fetch_descr	),
		.dma_rest(	dma_rest[30]	),
		.ptr_set(	ptr_set		)
		);
`endif

endmodule
