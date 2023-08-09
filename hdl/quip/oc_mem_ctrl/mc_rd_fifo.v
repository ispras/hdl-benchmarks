/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE Memory Controller                                 ////
////  Read FIFO                                                  ////
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
//  $Id: mc_rd_fifo.v,v 1.1 2001/07/29 07:34:41 rudi Exp $
//
//  $Date:   22 Sep 2004 19:10:48  $
//  $Revision:   1.0  $
//  $Author:   kbrunham  $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log:   /pvcs/designs/hdl/oc_mem_ctrl/mc_rd_fifo.v__  $
// 
//    Rev 1.0   22 Sep 2004 19:10:48   kbrunham
// initial version 
// TO, Wed Sep 22 03:10:19 2004
// 
//    Rev 1.0   09 Sep 2003 15:49:32   kbrunham
// initial version
// TO, Mon Sep 08 23:49:22 2003
//               Revision 1.1  2001/07/29 07:34:41  rudi
//
//
//               1) Changed Directory Structure
//               2) Fixed several minor bugs
//
//               Revision 1.1.1.1  2001/05/13 09:39:44  rudi
//               Created Directory Structure
//
//
//
//

`include "mc_defines.v"

module mc_rd_fifo(clk, rst, din, we, dout, re);

input		clk, rst;
input	[35:0]	din;
input		we;
output	[35:0]	dout;
input		re;

reg	[3:0]	rd_adr, wr_adr;
reg	[35:0]	r0, r1, r2, r3;
reg	[35:0]	dout;

always @(posedge clk)
	if(!rst)	rd_adr <= #1 4'h1;
	else
	if(re)		rd_adr <= #1 {rd_adr[2:0], rd_adr[3]};

always @(posedge clk)
	if(!rst)	wr_adr <= #1 4'h1;
	else
	if(we)		wr_adr <= #1 {wr_adr[2:0], wr_adr[3]};

always @(posedge clk)
	if(we & wr_adr[0])	r0 <= #1 din;

always @(posedge clk)
	if(we & wr_adr[1])	r1 <= #1 din;

always @(posedge clk)
	if(we & wr_adr[2])	r2 <= #1 din;

always @(posedge clk)
	if(we & wr_adr[3])	r3 <= #1 din;

always @(rd_adr or r0 or r1 or r2 or r3 or re or we or din)
	if(re & we)	dout = din;
	else
	case(rd_adr)		// synopsys full_case parallel_case
	   4'h1:	dout = r0;
	   4'h2:	dout = r1;
	   4'h4:	dout = r2;
	   4'h8:	dout = r3;
	endcase

endmodule
