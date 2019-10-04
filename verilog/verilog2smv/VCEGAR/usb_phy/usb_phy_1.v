/*
 *
 * Taken from VCEGAR benchmarks -- http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz
 * Modified by Ahmed Irfan <irfan@fbk.eu>
 *
 */ 
// Adapted for vl2mv by Fabio Somenzi <Fabio@Colorado.EDU>

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB 1.1 PHY                                                ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb_phy/   ////
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
//  $Id: usb_phy_1.v,v 1.1 2004/12/29 00:59:38 hjain Exp $
//
//  $Date: 2004/12/29 00:59:38 $
//  $Revision: 1.1 $
//  $Author: hjain $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: usb_phy_1.v,v $
//               Revision 1.1  2004/12/29 00:59:38  hjain
//               usb
//               sdlx
//               pibus
//               mpeg
//               miim
//               tc bench
//               itccc
//
//               Revision 1.1  2004/05/28 22:17:03  hjain
//               Neq exampleCVS: ----------------------------------------------------------------------
//
//               Revision 1.2  2002/09/16 16:06:37  rudi
//               Changed top level name to be consistent ...
//
//               Revision 1.1.1.1  2002/09/16 14:26:59  rudi
//               Created Directory Structure
//
//
//
//
//
//
//
//


//typedef enum {
//	      IDLE,
//	      SOP,
//	      DATA,
//	      EOP1,
///	      EOP2,
//	      WAIT
//	      } TxState;


`define IDLE 3'b000
`define SOP 3'b001
`define DATA 3'b011
`define EOP1 3'b100
`define EOP2  3'b101
`define WAIT 3'b110


//typedef enum {
//	      FS_IDLE,
//	      K1,
//	      J1,
///	      K2,
//	      J2,
//	      K3,
//	      J3,
//	      K4
//	      } RxState;

`define FS_IDLE 3'b000
`define K1 3'b001
`define J1 3'b010
`define K2 3'b011
`define J2 3'b100
`define K3 3'b101
`define J3 3'b110
`define K4 3'b111



module main(clk, rst, phy_tx_mode, usb_rst,
	
		// Transciever Interface
		txdp, txdn, txoe,	
		rxd, rxdp, rxdn,

		// UTMI Interface
		DataOut_i, TxValid_i, TxReady_o, RxValid_o,
		RxActive_o, RxError_o, DataIn_o, LineState_o
		);

    input		clk;
    input 		rst;
    input 		phy_tx_mode;
    output 		usb_rst;
    output 		txdp, txdn, txoe;
    input 		rxd, rxdp, rxdn;
    input [7:0] 	DataOut_i;
    input 		TxValid_i;
    output 		TxReady_o;
    output [7:0] 	DataIn_o;
    output 		RxValid_o;
    output 		RxActive_o;
    output 		RxError_o;
    output [1:0] 	LineState_o;

    ///////////////////////////////////////////////////////////////////
    //
    // Local Wires and Registers
    //

    reg [4:0] 		rst_cnt;
    reg 		usb_rst;
    wire 		reset;

    initial begin
	rst_cnt = 5'h0;
	usb_rst = 0;
    end

    ///////////////////////////////////////////////////////////////////
    //
    // Misc Logic
    //

    assign reset = rst & ~usb_rst;

    ///////////////////////////////////////////////////////////////////
    //
    // TX Phy
    //

    usb_tx_phy i_tx_phy(
			.clk(		clk		),
			.rst(		reset		),
			.fs_ce(		fs_ce		),
			.phy_mode(	phy_tx_mode	),

			// Transciever Interface
			.txdp(		txdp		),
			.txdn(		txdn		),
			.txoe(		txoe		),

			// UTMI Interface
			.DataOut_i(	DataOut_i	),
			.TxValid_i(	TxValid_i	),
			.TxReady_o(	TxReady_o	)
			);

    ///////////////////////////////////////////////////////////////////
    //
    // RX Phy and DPLL
    //

    usb_rx_phy i_rx_phy(
			.clk(		clk		),
			.rst(		reset		),
			.fs_ce(		fs_ce		),

			// Transciever Interface
			.rxd(		rxd		),
			.rxdp(		rxdp		),
			.rxdn(		rxdn		),

			// UTMI Interface
			.DataIn_o(	DataIn_o	),
			.RxValid_o(	RxValid_o	),
			.RxActive_o(	RxActive_o	),
			.RxError_o(	RxError_o	),
			.RxEn_i(	txoe		),
			.LineState(	LineState_o	)
			);

    ///////////////////////////////////////////////////////////////////
    //
    // Generate an USB Reset is we see SE0 for at least 2.5uS
    //

    always @(posedge clk)
      if(!rst)				rst_cnt = 5'h0;
      else
	if(LineState_o != 2'h0)		rst_cnt = 5'h0;
	else	
	  if(!usb_rst & fs_ce)		rst_cnt = rst_cnt + 5'h1;

    always @(posedge clk)
      usb_rst = (rst_cnt == 5'd31);

   assert property (~(RxValid_o==1) | (RxActive_o==1));
   
endmodule // usb_phy


//`include "usb_tx_phy.v"

//`include "usb_rx_phy.v"

// Adapted for vl2mv by Fabio Somenzi <Fabio@Colorado.EDU>

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB 1.1 PHY                                                ////
////  TX                                                         ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb_phy/   ////
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
//  $Id: usb_phy_1.v,v 1.1 2004/12/29 00:59:38 hjain Exp $
//
//  $Date: 2004/12/29 00:59:38 $
//  $Revision: 1.1 $
//  $Author: hjain $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: usb_phy_1.v,v $
//               Revision 1.1  2004/12/29 00:59:38  hjain
//               usb
//               sdlx
//               pibus
//               mpeg
//               miim
//               tc bench
//               itccc
//
//               Revision 1.1  2004/05/28 22:17:03  hjain
//               Neq exampleCVS: ----------------------------------------------------------------------
//
//               Revision 1.1.1.1  2002/09/16 14:27:02  rudi
//               Created Directory Structure
//
//
//
//
//
//
//


module usb_tx_phy(
		clk, rst, fs_ce, phy_mode,

		// Transciever Interface
		txdp, txdn, txoe,	

		// UTMI Interface
		DataOut_i, TxValid_i, TxReady_o
		);

    input		clk;
    input 		rst;
    input 		fs_ce;
    input 		phy_mode;
    output 		txdp, txdn, txoe;
    input [7:0] 	DataOut_i;
    input 		TxValid_i;
    output 		TxReady_o;

    ///////////////////////////////////////////////////////////////////
    //
    // Local Wires and Registers
    //

    reg 		TxReady_o;
     reg[2:0] 	state;
    reg 		tx_ready;
    reg 		tx_ready_d;
    reg 		ld_sop_d;
    reg 		ld_data_d;
    reg 		ld_eop_d;
    reg 		tx_ip;
    reg 		tx_ip_sync;
    reg [2:0] 		bit_cnt;
    reg [7:0] 		hold_reg;
    reg 		sd_raw_o;
    wire 		hold;
    reg 		data_done;
    reg 		sft_done;
    reg 		sft_done_r;
    wire 		sft_done_e;
    reg 		ld_data;
    wire 		eop_done;
    reg [2:0] 		one_cnt;
    wire 		stuff;
    reg 		sd_bs_o;
    reg 		sd_nrzi_o;
    reg 		append_eop;
    reg 		append_eop_sync1;
    reg 		append_eop_sync2;
    reg 		append_eop_sync3;
    reg 		txdp, txdn;
    reg 		txoe_r1, txoe_r2;
    reg 		txoe;

    initial begin
	TxReady_o = 1'b0;
	tx_ip = 1'b0;
	tx_ip_sync = 1'b0;
	data_done = 1'b0;
	bit_cnt = 3'h0;
	one_cnt = 3'h0;
	sd_bs_o = 1'h0;
	sd_nrzi_o = 1'b1;
	append_eop = 1'b0;
	append_eop_sync1 = 1'b0;
	append_eop_sync2 = 1'b0;
	append_eop_sync3 = 1'b0;
	txoe_r1 = 1'b0;
	txoe_r2 = 1'b0;
	txoe = 1'b1;
	txdp = 1'b1;
	txdn = 1'b0;
	state = `IDLE;
	ld_data = 0;
	sft_done = 0;
	sd_raw_o = 0;
	ld_eop_d = 0;
	hold_reg = 0;
	sft_done_r = 0;
	tx_ready = 0;
	tx_ready_d = 0;
	ld_data_d = 0;
	ld_sop_d = 0;
    end


    ///////////////////////////////////////////////////////////////////
    //
    // Misc Logic
    //

    always @(posedge clk)
      tx_ready = tx_ready_d;

    always @(posedge clk)
      if(!rst)	TxReady_o = 1'b0;
      else	TxReady_o = tx_ready_d & TxValid_i;

    always @(posedge clk)
      ld_data = ld_data_d;

    ///////////////////////////////////////////////////////////////////
    //
    // Transmit in progress indicator
    //

    always @(posedge clk)
      if(!rst)		tx_ip = 1'b0;
      else
	if(ld_sop_d)	tx_ip = 1'b1;
	else
	  if(eop_done)	tx_ip = 1'b0;

    always @(posedge clk)
      if(!rst)		tx_ip_sync = 1'b0;
      else
	if(fs_ce)	tx_ip_sync = tx_ip;

    // data_done helps us to catch cases where TxValid drops due to
    // packet end and then gets re-asserted as a new packet starts.
    // We might not see this because we are still transmitting.
    // data_done should solve those cases ...
    always @(posedge clk)
      if(!rst)			data_done = 1'b0;
      else
	if(TxValid_i & ! tx_ip)	data_done = 1'b1;
	else
	  if(!TxValid_i)	data_done = 1'b0;

    ///////////////////////////////////////////////////////////////////
    //
    // Shift Register
    //

    always @(posedge clk)
      if(!rst)			bit_cnt = 3'h0;
      else
	if(!tx_ip_sync)		bit_cnt = 3'h0;
	else
	  if(fs_ce & !hold)	bit_cnt = bit_cnt + 3'h1;

    assign hold = stuff;

    always @(posedge clk)
      if(!tx_ip_sync)		sd_raw_o = 1'b0;
      else
	case(bit_cnt)
	  3'h0: sd_raw_o = hold_reg[0];
	  3'h1: sd_raw_o = hold_reg[1];
	  3'h2: sd_raw_o = hold_reg[2];
	  3'h3: sd_raw_o = hold_reg[3];
	  3'h4: sd_raw_o = hold_reg[4];
	  3'h5: sd_raw_o = hold_reg[5];
	  3'h6: sd_raw_o = hold_reg[6];
	  3'h7: sd_raw_o = hold_reg[7];
	endcase

    always @(posedge clk)
      sft_done = !hold & (bit_cnt == 3'h7);

    always @(posedge clk)
      sft_done_r = sft_done;

    assign sft_done_e = sft_done & !sft_done_r;

    // Out Data Hold Register
    always @(posedge clk)
      if(ld_sop_d)	hold_reg = 8'h80;
      else
	if(ld_data)	hold_reg = DataOut_i;

    ///////////////////////////////////////////////////////////////////
    //
    // Bit Stuffer
    //

    always @(posedge clk)
      if(!rst)				one_cnt = 3'h0;
      else
	if(!tx_ip_sync)			one_cnt = 3'h0;
	else
	  if(fs_ce)
	    begin
		if(!sd_raw_o | stuff)	one_cnt = 3'h0;
		else			one_cnt = one_cnt + 3'h1;
	    end

    assign stuff = (one_cnt==3'h6);

    always @(posedge clk)
      if(!rst)		sd_bs_o = 1'h0;
      else
	if(fs_ce)	sd_bs_o = !tx_ip_sync ? 1'b0 :
				  (stuff ? 1'b0 : sd_raw_o);

    ///////////////////////////////////////////////////////////////////
    //
    // NRZI Encoder
    //

    always @(posedge clk)
      if(!rst)				sd_nrzi_o = 1'b1;
      else
	if(!tx_ip_sync | !txoe_r1)	sd_nrzi_o = 1'b1;
	else
	  if(fs_ce)		sd_nrzi_o = sd_bs_o ? sd_nrzi_o : ~sd_nrzi_o;

    ///////////////////////////////////////////////////////////////////
    //
    // EOP append logic
    //

    always @(posedge clk)
      if(!rst)			append_eop = 1'b0;
      else
	if(ld_eop_d)		append_eop = 1'b1;
	else
	  if(append_eop_sync2)	append_eop = 1'b0;

    always @(posedge clk)
      if(!rst)		append_eop_sync1 = 1'b0;
      else
	if(fs_ce)	append_eop_sync1 = append_eop;

    always @(posedge clk)
      if(!rst)		append_eop_sync2 = 1'b0;
      else
	if(fs_ce)	append_eop_sync2 = append_eop_sync1;

    always @(posedge clk)
      if(!rst)		append_eop_sync3 = 1'b0;
      else
	if(fs_ce)	append_eop_sync3 = append_eop_sync2;

    assign eop_done = append_eop_sync3;

    ///////////////////////////////////////////////////////////////////
    //
    // Output Enable Logic
    //

    always @(posedge clk)
      if(!rst)		txoe_r1 = 1'b0;
      else
	if(fs_ce)	txoe_r1 = tx_ip_sync;

    always @(posedge clk)
      if(!rst)		txoe_r2 = 1'b0;
      else
	if(fs_ce)	txoe_r2 = txoe_r1;

    always @(posedge clk)
      if(!rst)		txoe = 1'b1;
      else
	if(fs_ce)	txoe = !(txoe_r1 | txoe_r2);

    ///////////////////////////////////////////////////////////////////
    //
    // Output Registers
    //

    always @(posedge clk)
      if(!rst)		txdp = 1'b1;
      else
	if(fs_ce)	txdp = phy_mode ?
			       (!append_eop_sync3 &  sd_nrzi_o) :
			       sd_nrzi_o;

    always @(posedge clk)
      if(!rst)		txdn = 1'b0;
      else
	if(fs_ce)	txdn = phy_mode ?
			       (!append_eop_sync3 & ~sd_nrzi_o) :
			       append_eop_sync3;

    ///////////////////////////////////////////////////////////////////
    //
    // Tx state machine
    //

    always @(posedge clk) begin
	if(!rst)	
	  state = `IDLE;
	else begin
	    tx_ready_d = 1'b0;

	    ld_sop_d = 1'b0;
	    ld_data_d = 1'b0;
	    ld_eop_d = 1'b0;

	    case(state)
	      `IDLE: begin
		  if(TxValid_i)
		    begin
			ld_sop_d = 1'b1;
			state = `SOP;
		    end
	      end
	      `SOP: begin
		  if(sft_done_e)
		    begin
			tx_ready_d = 1'b1;
			ld_data_d = 1'b1;
			state = `DATA;
		    end
	      end
	      `DATA: begin
		  if(!data_done & sft_done_e)
		    begin
			ld_eop_d = 1'b1;
			state = `EOP1;
		    end

		  if(data_done & sft_done_e)
		    begin
			tx_ready_d = 1'b1;
			ld_data_d = 1'b1;
		    end
	      end
	      `EOP1: begin
		  if(eop_done)		state = `EOP2;
	      end
	      `EOP2: begin
		  if(!eop_done & fs_ce)	state = `WAIT;
	      end
	      `WAIT: begin
		  if(fs_ce)			state = `IDLE;
	      end
	    endcase
	end
    end

endmodule // usb_tx_phy



// Adapted for vl2mv by Fabio Somenzi <Fabio@Colorado.EDU>

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB 1.1 PHY                                                ////
////  RX & DPLL                                                  ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb_phy/   ////
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
//  $Id: usb_phy_1.v,v 1.1 2004/12/29 00:59:38 hjain Exp $
//
//  $Date: 2004/12/29 00:59:38 $
//  $Revision: 1.1 $
//  $Author: hjain $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: usb_phy_1.v,v $
//               Revision 1.1  2004/12/29 00:59:38  hjain
//               usb
//               sdlx
//               pibus
//               mpeg
//               miim
//               tc bench
//               itccc
//
//               Revision 1.1  2004/05/28 22:17:03  hjain
//               Neq exampleCVS: ----------------------------------------------------------------------
//
//               Revision 1.1.1.1  2002/09/16 14:27:01  rudi
//               Created Directory Structure
//
//
//
//
//
//
//
//


module usb_rx_phy(	clk, rst, fs_ce,
			// Transciever Interface
			rxd, rxdp, rxdn,

			// UTMI Interface
			RxValid_o, RxActive_o, RxError_o, DataIn_o,
			RxEn_i, LineState);

    input		clk;
    input 		rst;
    output 		fs_ce;
    input 		rxd, rxdp, rxdn;
    output [7:0] 	DataIn_o;
    output 		RxValid_o;
    output 		RxActive_o;
    output 		RxError_o;
    input 		RxEn_i;
    output [1:0] 	LineState;

    ///////////////////////////////////////////////////////////////////
    //
    // Local Wires and Registers
    //

    reg 		rxd_t1,  rxd_s1,  rxd_s;
    reg 		rxdp_t1, rxdp_s1, rxdp_s;
    reg 		rxdn_t1, rxdn_s1, rxdn_s;
    reg 		synced_d;
    wire 		k, j, se0;
    reg 		rx_en;
    reg 		rx_active;
    reg [2:0] 		bit_cnt;
    reg 		rx_valid1, rx_valid;
    reg 		shift_en;
    reg 		sd_r;
    reg 		sd_nrzi;
    reg [7:0] 		hold_reg;
    wire 		drop_bit;	// Indicates a stuffed bit
    reg [2:0] 		one_cnt;

    reg [1:0] 		dpll_state;
    reg 		fs_ce_d, fs_ce;
    wire 		change;
    reg 		rxdp_s1r, rxdn_s1r;
    wire 		lock_en;
    reg 		fs_ce_r1, fs_ce_r2, fs_ce_r3;
     reg [2:0]	fs_state;
    reg 		rx_valid_r;

    initial begin
	dpll_state = 2'h1;
	fs_state = `FS_IDLE;
	rx_active = 1'b0;
	sd_nrzi = 1'b0;
	one_cnt = 3'h0;
	bit_cnt = 3'b0;
	rx_valid1 = 1'b0;
	rxdp_s1 = 0;
	rxd_t1 = 0;
	rxdn_s1 = 0;
	fs_ce = 0;
	synced_d = 0;
	hold_reg = 0;
	rxdn_t1 = 0;
	sd_r = 0;
	rxdp_s1r = 0;
	rxdn_s1r = 0;
	rxd_s = 0;
	rxdp_t1 = 0;
	fs_ce_r1 = 0;
	rx_valid_r = 0;
	rxdn_s = 0;
	rx_en = 0;
	rx_valid = 0;
	fs_ce_d = 0;
	fs_ce_r2 = 0;
	rxd_s1 = 0;
	rxdp_s = 0;
	shift_en = 0;
	fs_ce_r3 = 0;
    end

    ///////////////////////////////////////////////////////////////////
    //
    // Misc Logic
    //

    assign RxActive_o = rx_active;
    assign RxValid_o = rx_valid;
    assign RxError_o = 0;
    assign DataIn_o = hold_reg;
    assign LineState = {rxdp_s1, rxdn_s1};

    always @(posedge clk)
      rx_en = RxEn_i;

    ///////////////////////////////////////////////////////////////////
    //
    // Synchronize Inputs
    //

    // First synchronize to the local system clock to
    // avoid metastability outside the sync block (*_s1)
    // Second synchronise to the internal bit clock (*_s)
    always @(posedge clk)
      rxd_t1 = rxd;

    always @(posedge clk)
      rxd_s1 = rxd_t1;

    always @(posedge clk)
      rxd_s = rxd_s1;

    always @(posedge clk)
      rxdp_t1 = rxdp;

    always @(posedge clk)
      rxdp_s1 = rxdp_t1;

    always @(posedge clk)
      rxdp_s = rxdp_s1;

    always @(posedge clk)
      rxdn_t1 = rxdn;

    always @(posedge clk)
      rxdn_s1 = rxdn_t1;

    always @(posedge clk)
      rxdn_s = rxdn_s1;

    assign k = !rxdp_s &  rxdn_s;
    assign j =  rxdp_s & !rxdn_s;
    assign se0 = !rxdp_s & !rxdn_s;

    ///////////////////////////////////////////////////////////////////
    //
    // DPLL
    //

    // This design uses a clock enable to do 12MHz timing and not a
    // real 12MHz clock. Everything always runs at 48MHz. We want to
    // make sure however, that the clock enable is always exactly in
    // the middle between two virtual 12MHz rising edges.
    // We monitor rxdp and rxdn for any changes and do the appropiate
    // adjustments.
    // In addition to the locking done in the dpll FSM, we adjust the
    // final latch enable to compensate for various sync registers ...

    // Allow locking only when we are receiving
    assign	lock_en = rx_en;

    // Edge detector
    always @(posedge clk)
      rxdp_s1r = rxdp_s1;

    always @(posedge clk)
      rxdn_s1r = rxdn_s1;

    assign change = (rxdp_s1r != rxdp_s1) | (rxdn_s1r != rxdn_s1);

    // DPLL FSM
    always @(posedge clk)
      if(!rst)	dpll_state = 2'h1;
      else
	begin
	    fs_ce_d = 1'b0;
	    case(dpll_state)
	      2'h0:
		if(lock_en & change)	dpll_state = 2'h0;
		else			dpll_state = 2'h1;
	      2'h1: begin
		  fs_ce_d = 1'b1;
		  if(lock_en & change)	dpll_state = 2'h3;
		  else			dpll_state = 2'h2;
	      end
	      2'h2:
		if(lock_en & change)	dpll_state = 2'h0;
		else			dpll_state = 2'h3;
	      2'h3:
		if(lock_en & change)	dpll_state = 2'h0;
		else			dpll_state = 2'h0;
	    endcase
	end

    // Compensate for sync registers at the input - align full speed
    // clock enable to be in the middle between two bit changes ...
    always @(posedge clk)
      fs_ce_r1 = fs_ce_d;

    always @(posedge clk)
      fs_ce_r2 = fs_ce_r1;

    always @(posedge clk)
      fs_ce_r3 = fs_ce_r2;

    always @(posedge clk)
      fs_ce = fs_ce_r3;

    ///////////////////////////////////////////////////////////////////
    //
    // Find Sync Pattern FSM
    //

    always @(posedge clk)
      if(!rst)	fs_state = `FS_IDLE;
      else
	begin
	    synced_d = 1'b0;
	    if(fs_ce)
	      case(fs_state)
		`FS_IDLE: begin
		    if(k & rx_en)	fs_state = `K1;
		end
		`K1: begin
		    if(j & rx_en)	fs_state = `J1;
		    else		fs_state = `FS_IDLE;
		end
		`J1: begin
		    if(k & rx_en)	fs_state = `K2;
		    else		fs_state = `FS_IDLE;
		end
		`K2: begin
		    if(j & rx_en)	fs_state = `J2;
		    else		fs_state = `FS_IDLE;
		end
		`J2: begin
		    if(k & rx_en)	fs_state = `K3;
		    else		fs_state = `FS_IDLE;
		end
		`K3: begin
		    if(j & rx_en)	fs_state = `J3;
		    else
		      if(k & rx_en)	fs_state = `K4;	// Allow missing one J
		      else		fs_state = `FS_IDLE;
		end
		`J3: begin
		    if(k & rx_en)	fs_state = `K4;
		    else		fs_state = `FS_IDLE;
		end
		`K4: begin
		    if(k)	synced_d = 1'b1;
		    fs_state = `FS_IDLE;
		end
	      endcase
	end

    ///////////////////////////////////////////////////////////////////
    //
    // Generate RxActive
    //

    always @(posedge clk)
      if(!rst)			rx_active = 1'b0;
      else
	if(synced_d & rx_en)	rx_active = 1'b1;
	else
	  if(se0 & rx_valid_r )	rx_active = 1'b0;

    always @(posedge clk)
      if(rx_valid)	rx_valid_r = 1'b1;
      else
	if(fs_ce)	rx_valid_r = 1'b0;

    ///////////////////////////////////////////////////////////////////
    //
    // NRZI Decoder
    //

    always @(posedge clk)
      if(fs_ce)	sd_r = rxd_s;

    always @(posedge clk)
      if(!rst)			sd_nrzi = 1'b0;
      else
	if(rx_active & fs_ce)	sd_nrzi = !(rxd_s ^ sd_r);

    ///////////////////////////////////////////////////////////////////
    //
    // Bit Stuff Detect
    //

    always @(posedge clk)
      if(!rst)		one_cnt = 3'h0;
      else
	if(!shift_en)	one_cnt = 3'h0;
	else
	  if(fs_ce)
	    begin
		if(!sd_nrzi | drop_bit)	one_cnt = 3'h0;
		else			one_cnt = one_cnt + 3'h1;
	    end

    assign drop_bit = (one_cnt==3'h6);

    ///////////////////////////////////////////////////////////////////
    //
    // Serial => Parallel converter
    //

    always @(posedge clk)
      if(fs_ce)	shift_en = synced_d | rx_active;

    always @(posedge clk)
      if(fs_ce & shift_en & !drop_bit)
	hold_reg = {sd_nrzi, hold_reg[7:1]};

    ///////////////////////////////////////////////////////////////////
    //
    // Generate RxValid
    //

    always @(posedge clk)
      if(!rst)			bit_cnt = 3'b0;
      else
	if(!shift_en)		bit_cnt = 3'h0;
	else
	  if(fs_ce & !drop_bit)	bit_cnt = bit_cnt + 3'h1;

    always @(posedge clk)
      if(!rst)					rx_valid1 = 1'b0;
      else
	if(fs_ce & !drop_bit & (bit_cnt==3'h7))	rx_valid1 = 1'b1;
	else
	  if(rx_valid1 & fs_ce & !drop_bit)	rx_valid1 = 1'b0;

    always @(posedge clk)
      rx_valid = !drop_bit & rx_valid1 & fs_ce;

endmodule // usb_rx_phy
