/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE Memory Controller                                 ////
////  WISHBONE Interface                                         ////
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
//  $Id: mc_wb_if.v,v 1.2 2001/08/10 08:16:21 rudi Exp $
//
//  $Date:   22 Sep 2004 19:11:04  $
//  $Revision:   1.0  $
//  $Author:   kbrunham  $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log:   /pvcs/designs/hdl/oc_mem_ctrl/mc_wb_if.v__  $
// 
//    Rev 1.0   22 Sep 2004 19:11:04   kbrunham
// initial version 
// TO, Wed Sep 22 03:10:37 2004
// 
//    Rev 1.0   09 Sep 2003 15:51:08   kbrunham
// initial version
// TO, Mon Sep 08 23:50:56 2003
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
//               Revision 1.1.1.1  2001/05/13 09:39:47  rudi
//               Created Directory Structure
//
//
//
//

`include "mc_defines.v"

module mc_wb_if(clk, rst,
		wb_addr_i, wb_cyc_i, wb_stb_i, wb_we_i, wb_err, wb_ack_o,
		wb_read_go, wb_write_go, 
		wb_first, wb_wait, mem_ack, wr_hold);

input		clk, rst;
input	[31:0]	wb_addr_i;
input		wb_cyc_i;
input		wb_stb_i;
input		wb_we_i;
input		wb_err;
output		wb_ack_o;
output		wb_read_go;
output		wb_write_go;
output		wb_first;
output		wb_wait;
input		mem_ack;
output		wr_hold;

////////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

wire		mem_sel;
reg		read_go_r;
reg		read_go_r1;
reg		write_go_r;
reg		write_go_r1;
reg		wb_first_r;
wire		wb_first_set;
reg		wr_hold;
wire		rmw;
reg		rmw_r;
reg		rmw_en;

////////////////////////////////////////////////////////////////////
//
// Memory Go Logic
//

assign mem_sel = `MC_MEM_SEL;

always @(posedge clk or negedge rst)
	if(!rst)		rmw_en <= #1 1'b0;
	else
	if(mem_ack)		rmw_en <= #1 1'b1;
	else
	if(!wb_cyc_i)		rmw_en <= #1 1'b0;

always @(posedge clk)
	rmw_r <= #1 !wr_hold & wb_we_i & wb_cyc_i & wb_stb_i & rmw_en;

assign rmw = rmw_r | (!wr_hold & wb_we_i & wb_cyc_i & wb_stb_i & rmw_en);


always @(posedge clk)
	read_go_r1 <= #1 !rmw & wb_cyc_i & ((wb_stb_i & mem_sel & !wb_we_i) | read_go_r);

always @(posedge clk)
	read_go_r <= #1 read_go_r1 & wb_cyc_i;

assign	wb_read_go   =  !rmw & read_go_r1 & wb_cyc_i;

always @(posedge clk)
	write_go_r1 <= #1 wb_cyc_i & ((wb_stb_i & mem_sel & wb_we_i) | write_go_r);

always @(posedge clk)
	write_go_r <= #1 write_go_r1 & wb_cyc_i &
			((wb_we_i & wb_stb_i) | !wb_stb_i);

assign wb_write_go   = !rmw & write_go_r1 & wb_cyc_i &
			((wb_we_i & wb_stb_i) | !wb_stb_i);

assign wb_first_set = mem_sel & wb_cyc_i & wb_stb_i & !(read_go_r | write_go_r);
assign wb_first = wb_first_set | (wb_first_r & !mem_ack & !wb_err);

always @(posedge clk or negedge rst)
	if(!rst)		wb_first_r <= #1 1'b0;
	else
	if(wb_first_set)	wb_first_r <= #1 1'b1;
	else
	if(mem_ack | wb_err)	wb_first_r <= #1 1'b0;

always @(posedge clk)
	if(wb_cyc_i & wb_stb_i)	wr_hold <= #1 wb_we_i;

////////////////////////////////////////////////////////////////////
//
// WB Ack
//

assign wb_ack_o = mem_ack;

////////////////////////////////////////////////////////////////////
//
// Memory Wait Logic
//

assign wb_wait = wb_cyc_i & !wb_stb_i & (wb_write_go | wb_read_go);

endmodule
