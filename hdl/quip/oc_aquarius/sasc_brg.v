/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Simple Baud Rate Generator                                 ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/sasc/      ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
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
//  $Id: sasc_brg.v,v 1.1.1.1 2003/07/12 13:19:55 thorn_aitch Exp $
//
//  $Date: 2003/07/12 13:19:55 $
//  $Revision: 1.1.1.1 $
//  $Author: thorn_aitch $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: sasc_brg.v,v $
//               Revision 1.1.1.1  2003/07/12 13:19:55  thorn_aitch
//               First Release
//
//               Revision 1.1.1.1  2002/09/16 16:16:40  rudi
//               Initial Checkin
//
//
//
//
//
//
//
//

`include "timescale.v"

/*
	Baud rate Generator
	==================

	div0 -	is the first stage divider
		Set this to the desired number of cycles less two
	div1 -	is the second stage divider
		Set this to the actual number of cycles

	Remember you have to generate a baud rate that is 4 higher than what
	you really want. This is because of the DPLL in the RX section ...

	Example:
	If your system clock is 50MHz and you want to generate a 9.6 Kbps baud rate:
	9600*4 = 38400KHz
	50MHz/38400KHz=1302 or 6*217
	set div0=4 (6-2) and set div1=217

*/

// Following Comments are added by Thorn Aitch, Nov.02,2002
//=========================================================
// <Actual Baud Rate>
//
//     Baud Rate = freq/[(div0 + 2)*(div1 + 1)*4]
//
//     ex)9600bps : 20MHz, div0=3, div1=103
//        20MHz/5*105*4=9524bps (error=  0.79%)            
//=========================================================

module sasc_brg(clk, rst, div0, div1, sio_ce, sio_ce_x4);
input		clk;
input		rst;
input	[7:0]	div0, div1;
output		sio_ce, sio_ce_x4;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg	[7:0]	ps;
reg		ps_clr;
reg	[7:0]	br_cnt;
reg		br_clr;
reg		sio_ce_x4_r;
reg	[1:0]	cnt;
reg		sio_ce, sio_ce_x4;
reg		sio_ce_r ;
reg		sio_ce_x4_t;

///////////////////////////////////////////////////////////////////
//
// Boud Rate Generator
//

// -----------------------------------------------------
// Prescaler
always @(posedge clk)
  	if(!rst)	ps <= #1 8'h0;
	else
	if(ps_clr)	ps <= #1 8'h0;
	else		ps <= #1 ps + 8'h1;

always @(posedge clk)
	ps_clr <= #1 (ps == div0);	// Desired number of cycles less 2

// -----------------------------------------------------
// Oversampled Boud Rate (x4)
always @(posedge clk)
  	if(!rst)	br_cnt <= #1 8'h0;
	else
	if(br_clr)	br_cnt <= #1 8'h0;
//	else		br_cnt <= #1 br_cnt + 8'h1;      // *** Deleted *** Oct.30,2002 Thorn Aitch
 	else if (ps_clr) br_cnt <= #1 br_cnt + 8'h1; // *** Added   *** Oct.30,2002 Thorn Aitch


always @(posedge clk)
	br_clr <= #1 (br_cnt == div1); // Prciese number of PS cycles

always @(posedge clk)
	sio_ce_x4_r <= #1 br_clr;

always @(posedge clk)
	sio_ce_x4_t <= #1 !sio_ce_x4_r & br_clr;

always @(posedge clk)
	sio_ce_x4 <= #1 sio_ce_x4_t;

// -----------------------------------------------------
// Actual Boud rate
always @(posedge clk)
  	if(!rst)			cnt <= #1 2'h0;
	else
	if(!sio_ce_x4_r & br_clr)	cnt <= #1 cnt + 2'h1;

always @(posedge clk)
	sio_ce_r <= #1 (cnt == 2'h0);

always @(posedge clk)
	sio_ce <= #1 !sio_ce_r & (cnt == 2'h0);

endmodule

