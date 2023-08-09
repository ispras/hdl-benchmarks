/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE DMA Priority Encoder                              ////
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
//  $Id: wb_dma_ch_pri_enc.v,v 1.3 2001/08/15 05:40:30 rudi Exp $
//
//  $Date:   22 Sep 2004 19:16:26  $
//  $Revision:   1.0  $
//  $Author:   kbrunham  $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log:   /pvcs/designs/hdl/oc_wb_dma/wb_dma_ch_pri_enc.v__  $
// 
//    Rev 1.0   22 Sep 2004 19:16:26   kbrunham
// initial version 
// TO, Wed Sep 22 03:15:59 2004
// 
//    Rev 1.0   25 Jun 2003 13:07:32   jpierri
// Initial revision.
//               Revision 1.3  2001/08/15 05:40:30  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//               - Added Section 3.10, describing DMA restart.
//
//               Revision 1.2  2001/08/07 08:00:43  rudi
//
//
//               Split up priority encoder modules to separate files
//
//               Revision 1.1  2001/07/29 08:57:02  rudi
//
//
//               1) Changed Directory Structure
//               2) Added restart signal (REST)
//
//               Revision 1.2  2001/06/05 10:22:36  rudi
//
//
//               - Added Support of up to 31 channels
//               - Added support for 2,4 and 8 priority levels
//               - Now can have up to 31 channels
//               - Added many configuration items
//               - Changed reset to async
//
//               Revision 1.1.1.1  2001/03/19 13:10:50  rudi
//               Initial Release
//
//
//

`include "wb_dma_defines.v"

// Priority Encoder
//
// Determines the channel with the highest priority, also takes
// the valid bit in consideration

module wb_dma_ch_pri_enc(clk, valid,
		pri0, pri1, pri2, pri3,
		pri4, pri5, pri6, pri7,
		pri8, pri9, pri10, pri11,
		pri12, pri13, pri14, pri15,
		pri16, pri17, pri18, pri19,
		pri20, pri21, pri22, pri23,
		pri24, pri25, pri26, pri27,
		pri28, pri29, pri30,
		pri_out);

input		clk;
input	[30:0]	valid;				// Channel Valid bits
input	[2:0]	pri0, pri1, pri2, pri3;		// Channel Priorities
input	[2:0]	pri4, pri5, pri6, pri7;
input	[2:0]	pri8, pri9, pri10, pri11;
input	[2:0]	pri12, pri13, pri14, pri15;
input	[2:0]	pri16, pri17, pri18, pri19;
input	[2:0]	pri20, pri21, pri22, pri23;
input	[2:0]	pri24, pri25, pri26, pri27;
input	[2:0]	pri28, pri29, pri30;
output	[2:0]	pri_out;			// Highest unserviced priority

wire	[7:0]	pri0_out, pri1_out, pri2_out, pri3_out;
wire	[7:0]	pri4_out, pri5_out, pri6_out, pri7_out;
wire	[7:0]	pri8_out, pri9_out, pri10_out, pri11_out;
wire	[7:0]	pri12_out, pri13_out, pri14_out, pri15_out;
wire	[7:0]	pri16_out, pri17_out, pri18_out, pri19_out;
wire	[7:0]	pri20_out, pri21_out, pri22_out, pri23_out;
wire	[7:0]	pri24_out, pri25_out, pri26_out, pri27_out;
wire	[7:0]	pri28_out, pri29_out, pri30_out;

wire	[7:0]	pri_out_tmp;
reg	[2:0]	pri_out;

`ifdef WDMA_HAVE_CH1
wb_dma_pri_enc_sub u0(
		.valid(		valid[0]	),
		.pri_in(	pri0		),
		.pri_out(	pri0_out	)
		);

wb_dma_pri_enc_sub u1(
		.valid(		valid[1]	),
		.pri_in(	pri1		),
		.pri_out(	pri1_out	)
		);
`else
assign pri0_out = 0;
assign pri1_out = 0;
`endif

`ifdef WDMA_HAVE_CH2
wb_dma_pri_enc_sub u2(
		.valid(		valid[2]	),
		.pri_in(	pri2		),
		.pri_out(	pri2_out	)
		);
`else
assign pri2_out = 0;
`endif

`ifdef WDMA_HAVE_CH3
wb_dma_pri_enc_sub u3(
		.valid(		valid[3]	),
		.pri_in(	pri3		),
		.pri_out(	pri3_out	)
		);
`else
assign pri3_out = 0;
`endif

`ifdef WDMA_HAVE_CH4
wb_dma_pri_enc_sub u4(
		.valid(		valid[4]	),
		.pri_in(	pri4		),
		.pri_out(	pri4_out	)
		);
`else
assign pri4_out = 0;
`endif

`ifdef WDMA_HAVE_CH5
wb_dma_pri_enc_sub u5(
		.valid(		valid[5]	),
		.pri_in(	pri5		),
		.pri_out(	pri5_out	)
		);
`else
assign pri5_out = 0;
`endif

`ifdef WDMA_HAVE_CH6
wb_dma_pri_enc_sub u6(
		.valid(		valid[6]	),
		.pri_in(	pri6		),
		.pri_out(	pri6_out	)
		);
`else
assign pri6_out = 0;
`endif

`ifdef WDMA_HAVE_CH7
wb_dma_pri_enc_sub u7(
		.valid(		valid[7]	),
		.pri_in(	pri7		),
		.pri_out(	pri7_out	)
		);
`else
assign pri7_out = 0;
`endif

`ifdef WDMA_HAVE_CH8
wb_dma_pri_enc_sub u8(
		.valid(		valid[8]	),
		.pri_in(	pri8		),
		.pri_out(	pri8_out	)
		);
`else
assign pri8_out = 0;
`endif

`ifdef WDMA_HAVE_CH9
wb_dma_pri_enc_sub u9(
		.valid(		valid[9]	),
		.pri_in(	pri9		),
		.pri_out(	pri9_out	)
		);
`else
assign pri9_out = 0;
`endif

`ifdef WDMA_HAVE_CH10
wb_dma_pri_enc_sub u10(
		.valid(		valid[10]	),
		.pri_in(	pri10		),
		.pri_out(	pri10_out	)
		);
`else
assign pri10_out = 0;
`endif

`ifdef WDMA_HAVE_CH11
wb_dma_pri_enc_sub u11(
		.valid(		valid[11]	),
		.pri_in(	pri11		),
		.pri_out(	pri11_out	)
		);
`else
assign pri11_out = 0;
`endif

`ifdef WDMA_HAVE_CH12
wb_dma_pri_enc_sub u12(
		.valid(		valid[12]	),
		.pri_in(	pri12		),
		.pri_out(	pri12_out	)
		);
`else
assign pri12_out = 0;
`endif

`ifdef WDMA_HAVE_CH13
wb_dma_pri_enc_sub u13(
		.valid(		valid[13]	),
		.pri_in(	pri13		),
		.pri_out(	pri13_out	)
		);
`else
assign pri13_out = 0;
`endif

`ifdef WDMA_HAVE_CH14
wb_dma_pri_enc_sub u14(
		.valid(		valid[14]	),
		.pri_in(	pri14		),
		.pri_out(	pri14_out	)
		);
`else
assign pri14_out = 0;
`endif

`ifdef WDMA_HAVE_CH15
wb_dma_pri_enc_sub u15(
		.valid(		valid[15]	),
		.pri_in(	pri15		),
		.pri_out(	pri15_out	)
		);
`else
assign pri15_out = 0;
`endif

`ifdef WDMA_HAVE_CH16
wb_dma_pri_enc_sub u16(
		.valid(		valid[16]	),
		.pri_in(	pri16		),
		.pri_out(	pri16_out	)
		);
`else
assign pri16_out = 0;
`endif

`ifdef WDMA_HAVE_CH17
wb_dma_pri_enc_sub u17(
		.valid(		valid[17]	),
		.pri_in(	pri17		),
		.pri_out(	pri17_out	)
		);
`else
assign pri17_out = 0;
`endif

`ifdef WDMA_HAVE_CH18
wb_dma_pri_enc_sub u18(
		.valid(		valid[18]	),
		.pri_in(	pri18		),
		.pri_out(	pri18_out	)
		);
`else
assign pri18_out = 0;
`endif

`ifdef WDMA_HAVE_CH19
wb_dma_pri_enc_sub u19(
		.valid(		valid[19]	),
		.pri_in(	pri19		),
		.pri_out(	pri19_out	)
		);
`else
assign pri19_out = 0;
`endif

`ifdef WDMA_HAVE_CH20
wb_dma_pri_enc_sub u20(
		.valid(		valid[20]	),
		.pri_in(	pri20		),
		.pri_out(	pri20_out	)
		);
`else
assign pri20_out = 0;
`endif

`ifdef WDMA_HAVE_CH21
wb_dma_pri_enc_sub u21(
		.valid(		valid[21]	),
		.pri_in(	pri21		),
		.pri_out(	pri21_out	)
		);
`else
assign pri21_out = 0;
`endif

`ifdef WDMA_HAVE_CH22
wb_dma_pri_enc_sub u22(
		.valid(		valid[22]	),
		.pri_in(	pri22		),
		.pri_out(	pri22_out	)
		);
`else
assign pri22_out = 0;
`endif

`ifdef WDMA_HAVE_CH23
wb_dma_pri_enc_sub u23(
		.valid(		valid[23]	),
		.pri_in(	pri23		),
		.pri_out(	pri23_out	)
		);
`else
assign pri23_out = 0;
`endif

`ifdef WDMA_HAVE_CH24
wb_dma_pri_enc_sub u24(
		.valid(		valid[24]	),
		.pri_in(	pri24		),
		.pri_out(	pri24_out	)
		);
`else
assign pri24_out = 0;
`endif

`ifdef WDMA_HAVE_CH25
wb_dma_pri_enc_sub u25(
		.valid(		valid[25]	),
		.pri_in(	pri25		),
		.pri_out(	pri25_out	)
		);
`else
assign pri25_out = 0;
`endif

`ifdef WDMA_HAVE_CH26
wb_dma_pri_enc_sub u26(
		.valid(		valid[26]	),
		.pri_in(	pri26		),
		.pri_out(	pri26_out	)
		);
`else
assign pri26_out = 0;
`endif

`ifdef WDMA_HAVE_CH27
wb_dma_pri_enc_sub u27(
		.valid(		valid[27]	),
		.pri_in(	pri27		),
		.pri_out(	pri27_out	)
		);
`else
assign pri27_out = 0;
`endif

`ifdef WDMA_HAVE_CH28
wb_dma_pri_enc_sub u28(
		.valid(		valid[28]	),
		.pri_in(	pri28		),
		.pri_out(	pri28_out	)
		);
`else
assign pri28_out = 0;
`endif

`ifdef WDMA_HAVE_CH29
wb_dma_pri_enc_sub u29(
		.valid(		valid[29]	),
		.pri_in(	pri29		),
		.pri_out(	pri29_out	)
		);
`else
assign pri29_out = 0;
`endif

`ifdef WDMA_HAVE_CH30
wb_dma_pri_enc_sub u30(
		.valid(		valid[30]	),
		.pri_in(	pri30		),
		.pri_out(	pri30_out	)
		);
`else
assign pri30_out = 0;
`endif

assign pri_out_tmp =	pri0_out | pri1_out | pri2_out | pri3_out |
			pri4_out | pri5_out | pri6_out | pri7_out |
			pri8_out | pri9_out | pri10_out | pri11_out |
			pri12_out | pri13_out | pri14_out | pri15_out |
			pri16_out | pri17_out | pri18_out | pri19_out |
			pri20_out | pri21_out | pri22_out | pri23_out |
			pri24_out | pri25_out | pri26_out | pri27_out |
			pri28_out | pri29_out | pri30_out;

always @(posedge clk)
`ifdef WDMA_PRI_8
	if(pri_out_tmp[7])	pri_out <= #1 3'h7;
	else
	if(pri_out_tmp[6])	pri_out <= #1 3'h6;
	else
	if(pri_out_tmp[5])	pri_out <= #1 3'h5;
	else
	if(pri_out_tmp[4])	pri_out <= #1 3'h4;
	else
	if(pri_out_tmp[3])	pri_out <= #1 3'h3;
	else
	if(pri_out_tmp[2])	pri_out <= #1 3'h2;
	else
`endif
`ifdef WDMA_PRI_4
	if(pri_out_tmp[3])	pri_out <= #1 3'h3;
	else
	if(pri_out_tmp[2])	pri_out <= #1 3'h2;
	else
`endif
	if(pri_out_tmp[1])	pri_out <= #1 3'h1;
	else			pri_out <= #1 3'h0;

endmodule
