`define   INFERRAM
`define   CAN_WISHBONE_IF
`define CAN_MBIST_CTRL_WIDTH 3
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_top.v                                                   ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_top.v,v $
// Revision 1.48  2004/10/25 11:44:47  igorm
// Interrupt is always cleared for one clock after the irq register is read.
// This fixes problems when CPU is using IRQs that are edge triggered.
//
// Revision 1.47  2004/02/08 14:53:54  mohor
// Header changed. Address latched to posedge. bus_off_on signal added.
//
// Revision 1.46  2003/10/17 05:55:20  markom
// mbist signals updated according to newest convention
//
// Revision 1.45  2003/09/30 00:55:13  mohor
// Error counters fixed to be compatible with Bosch VHDL reference model.
// Small synchronization changes.
//
// Revision 1.44  2003/09/25 18:55:49  mohor
// Synchronization changed, error counters fixed.
//
// Revision 1.43  2003/08/20 09:57:39  mohor
// Tristate signal tx_o is separated to tx_o and tx_oen_o. Both signals need
// to be joined together on higher level.
//
// Revision 1.42  2003/07/16 15:11:28  mohor
// Fixed according to the linter.
//
// Revision 1.41  2003/07/10 15:32:27  mohor
// Unused signal removed.
//
// Revision 1.40  2003/07/10 01:59:04  tadejm
// Synchronization fixed. In some strange cases it didn't work according to
// the VHDL reference model.
//
// Revision 1.39  2003/07/07 11:21:37  mohor
// Little fixes (to fix warnings).
//
// Revision 1.38  2003/07/03 09:32:20  mohor
// Synchronization changed.
//
// Revision 1.37  2003/06/27 20:56:15  simons
// Virtual silicon ram instances added.
//
// Revision 1.36  2003/06/17 14:30:30  mohor
// "chip select" signal cs_can_i is used only when not using WISHBONE
// interface.
//
// Revision 1.35  2003/06/16 13:57:58  mohor
// tx_point generated one clk earlier. rx_i registered. Data corrected when
// using extended mode.
//
// Revision 1.34  2003/06/13 15:02:24  mohor
// Synchronization is also needed when transmitting a message.
//
// Revision 1.33  2003/06/11 14:21:35  mohor
// When switching to tx, sync stage is overjumped.
//
// Revision 1.32  2003/06/09 11:32:36  mohor
// Ports added for the CAN_BIST.
//
// Revision 1.31  2003/03/26 11:19:46  mohor
// CAN interrupt is active low.
//
// Revision 1.30  2003/03/20 17:01:17  mohor
// unix.
//
// Revision 1.28  2003/03/14 19:36:48  mohor
// can_cs signal used for generation of the cs.
//
// Revision 1.27  2003/03/12 05:56:33  mohor
// Bidirectional port_0_i changed to port_0_io.
// input cs_can changed to cs_can_i.
//
// Revision 1.26  2003/03/12 04:39:40  mohor
// rd_i and wr_i are active high signals. If 8051 is connected, these two signals
// need to be negated one level higher.
//
// Revision 1.25  2003/03/12 04:17:36  mohor
// 8051 interface added (besides WISHBONE interface). Selection is made in
// can_defines.v file.
//
// Revision 1.24  2003/03/10 17:24:40  mohor
// wire declaration added.
//
// Revision 1.23  2003/03/05 15:33:13  mohor
// tx_o is now tristated signal. tx_oen and tx_o combined together.
//
// Revision 1.22  2003/03/05 15:01:56  mohor
// Top level signal names changed.
//
// Revision 1.21  2003/03/01 22:53:33  mohor
// Actel APA ram supported.
//
// Revision 1.20  2003/02/19 15:09:02  mohor
// Incomplete sensitivity list fixed.
//
// Revision 1.19  2003/02/19 15:04:14  mohor
// Typo fixed.
//
// Revision 1.18  2003/02/19 14:44:03  mohor
// CAN core finished. Host interface added. Registers finished.
// Synchronization to the wishbone finished.
//
// Revision 1.17  2003/02/18 00:10:15  mohor
// Most of the registers added. Registers "arbitration lost capture", "error code
// capture" + few more still need to be added.
//
// Revision 1.16  2003/02/14 20:17:01  mohor
// Several registers added. Not finished, yet.
//
// Revision 1.15  2003/02/12 14:25:30  mohor
// abort_tx added.
//
// Revision 1.14  2003/02/11 00:56:06  mohor
// Wishbone interface added.
//
// Revision 1.13  2003/02/09 18:40:29  mohor
// Overload fixed. Hard synchronization also enabled at the last bit of
// interframe.
//
// Revision 1.12  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.11  2003/02/04 14:34:52  mohor
// *** empty log message ***
//
// Revision 1.10  2003/01/31 01:13:38  mohor
// backup.
//
// Revision 1.9  2003/01/15 13:16:48  mohor
// When a frame with "remote request" is received, no data is stored to
// fifo, just the frame information (identifier, ...). Data length that
// is stored is the received data length and not the actual data length
// that is stored to fifo.
//
// Revision 1.8  2003/01/14 17:25:09  mohor
// Addresses corrected to decimal values (previously hex).
//
// Revision 1.7  2003/01/10 17:51:34  mohor
// Temporary version (backup).
//
// Revision 1.6  2003/01/09 21:54:45  mohor
// rx fifo added. Not 100 % verified, yet.
//
// Revision 1.5  2003/01/08 02:10:56  mohor
// Acceptance filter added.
//
// Revision 1.4  2002/12/28 04:13:23  mohor
// Backup version.
//
// Revision 1.3  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.2  2002/12/26 16:00:34  mohor
// Testbench define file added. Clock divider register added.
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_top
( 
  `ifdef CAN_WISHBONE_IF
    wb_clk_i,
    wb_rst_i,
    wb_dat_i,
    wb_dat_o,
    wb_cyc_i,
    wb_stb_i,
    wb_we_i,
    wb_adr_i,
    wb_ack_o,
  `else
    rst_i,
    ale_i,
    rd_i,
    wr_i,
    port_0_io,
    cs_can_i,
  `endif
  clk_i,
  rx_i,
  tx_o,
  bus_off_on,
  irq_on,
  clkout_o,

  // Bist
`ifdef CAN_BIST
  ,
  // debug chain signals
  mbist_si_i,       // bist scan serial in
  mbist_so_o,       // bist scan serial out
  mbist_ctrl_i,        // bist chain shift control
`endif

// port connections for Ram
  //64x8
  q_dp_64x8,
  data_64x8,
  wren_64x8,
  rden_64x8,
  wraddress_64x8,
  rdaddress_64x8,

  //64x4
  q_dp_64x4,
  data_64x4,
  wren_64x4x1,
  wraddress_64x4x1,
  rdaddress_64x4x1,

  //64x1

  q_dp_64x1,
  data_64x1 
);

parameter Tp = 1;


`ifdef CAN_WISHBONE_IF
  input        wb_clk_i;
  input        wb_rst_i;
  input  [7:0] wb_dat_i;
  output [7:0] wb_dat_o;
  input        wb_cyc_i;
  input        wb_stb_i;
  input        wb_we_i;
  input  [7:0] wb_adr_i;
  output       wb_ack_o;

  reg          wb_ack_o;
  reg          cs_sync1;
  reg          cs_sync2;
  reg          cs_sync3;
  
  reg          cs_ack1;
  reg          cs_ack2;
  reg          cs_ack3;
  reg          cs_sync_rst1;
  reg          cs_sync_rst2;
  wire         cs_can_i;
`else
  input        rst_i;
  input        ale_i;
  input        rd_i;
  input        wr_i;
  inout  [7:0] port_0_io;
  input        cs_can_i;
  
  reg    [7:0] addr_latched;
  reg          wr_i_q;
  reg          rd_i_q;
`endif

input        clk_i;
input        rx_i;
output       tx_o;
output       bus_off_on;
output       irq_on;
output       clkout_o;

// Bist
`ifdef CAN_BIST
input   mbist_si_i;       // bist scan serial in
output  mbist_so_o;       // bist scan serial out
input [`CAN_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;       // bist chain shift control
`endif


 // port connections for Ram
  //64x8
  input [7:0] q_dp_64x8;
  output[7:0] data_64x8;
  output      wren_64x8;
  output      rden_64x8;
  output[5:0] wraddress_64x8;
  output[5:0] rdaddress_64x8;

  //64x4
  input [3:0] q_dp_64x4;
  output[3:0] data_64x4;
  output      wren_64x4x1;
  output[5:0] wraddress_64x4x1;
  output[5:0] rdaddress_64x4x1;

  //64x1

  input[0:0]  q_dp_64x1;
  output[0:0] data_64x1; 

//-------------------------------


reg          data_out_fifo_selected;


wire   [7:0] data_out_fifo;
wire   [7:0] data_out_regs;


/* Mode register */
wire         reset_mode;
wire         listen_only_mode;
wire         acceptance_filter_mode;
wire         self_test_mode;

/* Command register */
wire         release_buffer;
wire         tx_request;
wire         abort_tx;
wire         self_rx_request;
wire         single_shot_transmission;
wire         tx_state;
wire         tx_state_q;
wire         overload_request;
wire         overload_frame;


/* Arbitration Lost Capture Register */
wire         read_arbitration_lost_capture_reg;

/* Error Code Capture Register */
wire         read_error_code_capture_reg;
wire   [7:0] error_capture_code;

/* Bus Timing 0 register */
wire   [5:0] baud_r_presc;
wire   [1:0] sync_jump_width;

/* Bus Timing 1 register */
wire   [3:0] time_segment1;
wire   [2:0] time_segment2;
wire         triple_sampling;

/* Error Warning Limit register */
wire   [7:0] error_warning_limit;

/* Rx Error Counter register */
wire         we_rx_err_cnt;

/* Tx Error Counter register */
wire         we_tx_err_cnt;

/* Clock Divider register */
wire         extended_mode;

/* This section is for BASIC and EXTENDED mode */
/* Acceptance code register */
wire   [7:0] acceptance_code_0;

/* Acceptance mask register */
wire   [7:0] acceptance_mask_0;
/* End: This section is for BASIC and EXTENDED mode */


/* This section is for EXTENDED mode */
/* Acceptance code register */
wire   [7:0] acceptance_code_1;
wire   [7:0] acceptance_code_2;
wire   [7:0] acceptance_code_3;

/* Acceptance mask register */
wire   [7:0] acceptance_mask_1;
wire   [7:0] acceptance_mask_2;
wire   [7:0] acceptance_mask_3;
/* End: This section is for EXTENDED mode */

/* Tx data registers. Holding identifier (basic mode), tx frame information (extended mode) and data */
wire   [7:0] tx_data_0;
wire   [7:0] tx_data_1;
wire   [7:0] tx_data_2;
wire   [7:0] tx_data_3;
wire   [7:0] tx_data_4;
wire   [7:0] tx_data_5;
wire   [7:0] tx_data_6;
wire   [7:0] tx_data_7;
wire   [7:0] tx_data_8;
wire   [7:0] tx_data_9;
wire   [7:0] tx_data_10;
wire   [7:0] tx_data_11;
wire   [7:0] tx_data_12;
/* End: Tx data registers */

wire         cs;

/* Output signals from can_btl module */
wire         sample_point;
wire         sampled_bit;
wire         sampled_bit_q;
wire         tx_point;
wire         hard_sync;

/* output from can_bsp module */
wire         rx_idle;
wire         transmitting;
wire         transmitter;
wire         go_rx_inter;
wire         not_first_bit_of_inter;
wire         set_reset_mode;
wire         node_bus_off;
wire         error_status;
wire   [7:0] rx_err_cnt;
wire   [7:0] tx_err_cnt;
wire         rx_err_cnt_dummy;  // The MSB is not displayed. It is just used for easier calculation (no counter overflow).
wire         tx_err_cnt_dummy;  // The MSB is not displayed. It is just used for easier calculation (no counter overflow).
wire         transmit_status;
wire         receive_status;
wire         tx_successful;
wire         need_to_tx;
wire         overrun;
wire         info_empty;
wire         set_bus_error_irq;
wire         set_arbitration_lost_irq;
wire   [4:0] arbitration_lost_capture;
wire         node_error_passive;
wire         node_error_active;
wire   [6:0] rx_message_counter;
wire         tx_next;

wire         go_overload_frame;
wire         go_error_frame;
wire         go_tx;
wire         send_ack;

wire         rst;
wire         we;
wire   [7:0] addr;
wire   [7:0] data_in;
reg    [7:0] data_out;
reg          rx_sync_tmp;
reg          rx_sync;



// port connections for Ram
  //64x8
  wire[7:0] w_q_dp_64x8;
  wire[7:0] w_data_64x8;
  wire      w_wren_64x8;
  wire      w_rden_64x8;
  wire[5:0] w_wraddress_64x8;
  wire[5:0] w_rdaddress_64x8;

  //64x4
  wire[3:0] w_q_dp_64x4;
  wire[3:0] w_data_64x4;
  wire      w_wren_64x4x1;
  wire[5:0] w_wraddress_64x4x1;
  wire[5:0] w_rdaddress_64x4x1;

  //64x1

  wire[0:0]  w_q_dp_64x1;
  wire[0:0] w_data_64x1;  

  // port connections for Ram
  //64x8
assign  w_q_dp_64x8   	= q_dp_64x8;
assign  data_64x8 	= w_data_64x8;
assign  wren_64x8 	= w_wren_64x8;
assign  rden_64x8 	= w_rden_64x8;
assign  wraddress_64x8 = w_wraddress_64x8;
assign  rdaddress_64x8 = w_rdaddress_64x8;

  //64x4
assign  w_q_dp_64x4 	= q_dp_64x4;
assign  data_64x4 		= w_data_64x4;
assign  wren_64x4x1 		= w_wren_64x4x1;
assign  wraddress_64x4x1 	= w_wraddress_64x4x1;
assign  rdaddress_64x4x1 	= w_rdaddress_64x4x1;

  //64x1

assign  w_q_dp_64x1 		= q_dp_64x1;
assign  data_64x1 		= w_data_64x1;
  
/* Connecting can_registers module */
can_registers i_can_registers
( 
  .clk(clk_i),
  .rst(rst),
  .cs(cs),
  .we(we),
  .addr(addr),
  .data_in(data_in),
  .data_out(data_out_regs),
  .irq_n(irq_on),

  .sample_point(sample_point),
  .transmitting(transmitting),
  .set_reset_mode(set_reset_mode),
  .node_bus_off(node_bus_off),
  .error_status(error_status),
  .rx_err_cnt(rx_err_cnt),
  .tx_err_cnt(tx_err_cnt),
  .transmit_status(transmit_status),
  .receive_status(receive_status),
  .tx_successful(tx_successful),
  .need_to_tx(need_to_tx),
  .overrun(overrun),
  .info_empty(info_empty),
  .set_bus_error_irq(set_bus_error_irq),
  .set_arbitration_lost_irq(set_arbitration_lost_irq),
  .arbitration_lost_capture(arbitration_lost_capture),
  .node_error_passive(node_error_passive),
  .node_error_active(node_error_active),
  .rx_message_counter(rx_message_counter),


  /* Mode register */
  .reset_mode(reset_mode),
  .listen_only_mode(listen_only_mode),
  .acceptance_filter_mode(acceptance_filter_mode),
  .self_test_mode(self_test_mode),

  /* Command register */
  .clear_data_overrun(),
  .release_buffer(release_buffer),
  .abort_tx(abort_tx),
  .tx_request(tx_request),
  .self_rx_request(self_rx_request),
  .single_shot_transmission(single_shot_transmission),
  .tx_state(tx_state),
  .tx_state_q(tx_state_q),
  .overload_request(overload_request),
  .overload_frame(overload_frame),

  /* Arbitration Lost Capture Register */
  .read_arbitration_lost_capture_reg(read_arbitration_lost_capture_reg),

  /* Error Code Capture Register */
  .read_error_code_capture_reg(read_error_code_capture_reg),
  .error_capture_code(error_capture_code),

  /* Bus Timing 0 register */
  .baud_r_presc(baud_r_presc),
  .sync_jump_width(sync_jump_width),

  /* Bus Timing 1 register */
  .time_segment1(time_segment1),
  .time_segment2(time_segment2),
  .triple_sampling(triple_sampling),

  /* Error Warning Limit register */
  .error_warning_limit(error_warning_limit),

  /* Rx Error Counter register */
  .we_rx_err_cnt(we_rx_err_cnt),

  /* Tx Error Counter register */
  .we_tx_err_cnt(we_tx_err_cnt),

  /* Clock Divider register */
  .extended_mode(extended_mode),
  .clkout(clkout_o),
  
  /* This section is for BASIC and EXTENDED mode */
  /* Acceptance code register */
  .acceptance_code_0(acceptance_code_0),

  /* Acceptance mask register */
  .acceptance_mask_0(acceptance_mask_0),
  /* End: This section is for BASIC and EXTENDED mode */
  
  /* This section is for EXTENDED mode */
  /* Acceptance code register */
  .acceptance_code_1(acceptance_code_1),
  .acceptance_code_2(acceptance_code_2),
  .acceptance_code_3(acceptance_code_3),

  /* Acceptance mask register */
  .acceptance_mask_1(acceptance_mask_1),
  .acceptance_mask_2(acceptance_mask_2),
  .acceptance_mask_3(acceptance_mask_3),
  /* End: This section is for EXTENDED mode */

  /* Tx data registers. Holding identifier (basic mode), tx frame information (extended mode) and data */
  .tx_data_0(tx_data_0),
  .tx_data_1(tx_data_1),
  .tx_data_2(tx_data_2),
  .tx_data_3(tx_data_3),
  .tx_data_4(tx_data_4),
  .tx_data_5(tx_data_5),
  .tx_data_6(tx_data_6),
  .tx_data_7(tx_data_7),
  .tx_data_8(tx_data_8),
  .tx_data_9(tx_data_9),
  .tx_data_10(tx_data_10),
  .tx_data_11(tx_data_11),
  .tx_data_12(tx_data_12)
  /* End: Tx data registers */
);




/* Connecting can_btl module */
can_btl i_can_btl
( 
  .clk(clk_i),
  .rst(rst),
  .rx(rx_sync), 
  .tx(tx_o),

  /* Bus Timing 0 register */
  .baud_r_presc(baud_r_presc),
  .sync_jump_width(sync_jump_width),

  /* Bus Timing 1 register */
  .time_segment1(time_segment1),
  .time_segment2(time_segment2),
  .triple_sampling(triple_sampling),

  /* Output signals from this module */
  .sample_point(sample_point),
  .sampled_bit(sampled_bit),
  .sampled_bit_q(sampled_bit_q),
  .tx_point(tx_point),
  .hard_sync(hard_sync),

  
  /* output from can_bsp module */
  .rx_idle(rx_idle),
  .rx_inter(rx_inter),
  .transmitting(transmitting),
  .transmitter(transmitter),
  .go_rx_inter(go_rx_inter),
  .tx_next(tx_next),

  .go_overload_frame(go_overload_frame),
  .go_error_frame(go_error_frame),
  .go_tx(go_tx),
  .send_ack(send_ack),
  .node_error_passive(node_error_passive)
  


);



can_bsp i_can_bsp
(
  .clk(clk_i),
  .rst(rst),
  
  /* From btl module */
  .sample_point(sample_point),
  .sampled_bit(sampled_bit),
  .sampled_bit_q(sampled_bit_q),
  .tx_point(tx_point),
  .hard_sync(hard_sync),

  .addr(addr),
  .data_in(data_in),
  .data_out(data_out_fifo),
  .fifo_selected(data_out_fifo_selected),

  /* Mode register */
  .reset_mode(reset_mode),
  .listen_only_mode(listen_only_mode),
  .acceptance_filter_mode(acceptance_filter_mode),
  .self_test_mode(self_test_mode),
  
  /* Command register */
  .release_buffer(release_buffer),
  .tx_request(tx_request),
  .abort_tx(abort_tx),
  .self_rx_request(self_rx_request),
  .single_shot_transmission(single_shot_transmission),
  .tx_state(tx_state),
  .tx_state_q(tx_state_q),
  .overload_request(overload_request),
  .overload_frame(overload_frame),

  /* Arbitration Lost Capture Register */
  .read_arbitration_lost_capture_reg(read_arbitration_lost_capture_reg),

  /* Error Code Capture Register */
  .read_error_code_capture_reg(read_error_code_capture_reg),
  .error_capture_code(error_capture_code),

  /* Error Warning Limit register */
  .error_warning_limit(error_warning_limit),

  /* Rx Error Counter register */
  .we_rx_err_cnt(we_rx_err_cnt),

  /* Tx Error Counter register */
  .we_tx_err_cnt(we_tx_err_cnt),

  /* Clock Divider register */
  .extended_mode(extended_mode),

  /* output from can_bsp module */
  .rx_idle(rx_idle),
  .transmitting(transmitting),
  .transmitter(transmitter),
  .go_rx_inter(go_rx_inter),
  .not_first_bit_of_inter(not_first_bit_of_inter),
  .rx_inter(rx_inter),
  .set_reset_mode(set_reset_mode),
  .node_bus_off(node_bus_off),
  .error_status(error_status),
  .rx_err_cnt({rx_err_cnt_dummy, rx_err_cnt[7:0]}),   // The MSB is not displayed. It is just used for easier calculation (no counter overflow).
  .tx_err_cnt({tx_err_cnt_dummy, tx_err_cnt[7:0]}),   // The MSB is not displayed. It is just used for easier calculation (no counter overflow).
  .transmit_status(transmit_status),
  .receive_status(receive_status),
  .tx_successful(tx_successful),
  .need_to_tx(need_to_tx),
  .overrun(overrun),
  .info_empty(info_empty),
  .set_bus_error_irq(set_bus_error_irq),
  .set_arbitration_lost_irq(set_arbitration_lost_irq),
  .arbitration_lost_capture(arbitration_lost_capture),
  .node_error_passive(node_error_passive),
  .node_error_active(node_error_active),
  .rx_message_counter(rx_message_counter),
  
  /* This section is for BASIC and EXTENDED mode */
  /* Acceptance code register */
  .acceptance_code_0(acceptance_code_0),

  /* Acceptance mask register */
  .acceptance_mask_0(acceptance_mask_0),
  /* End: This section is for BASIC and EXTENDED mode */
  
  /* This section is for EXTENDED mode */
  /* Acceptance code register */
  .acceptance_code_1(acceptance_code_1),
  .acceptance_code_2(acceptance_code_2),
  .acceptance_code_3(acceptance_code_3),

  /* Acceptance mask register */
  .acceptance_mask_1(acceptance_mask_1),
  .acceptance_mask_2(acceptance_mask_2),
  .acceptance_mask_3(acceptance_mask_3),
  /* End: This section is for EXTENDED mode */

  /* Tx data registers. Holding identifier (basic mode), tx frame information (extended mode) and data */
  .tx_data_0(tx_data_0),
  .tx_data_1(tx_data_1),
  .tx_data_2(tx_data_2),
  .tx_data_3(tx_data_3),
  .tx_data_4(tx_data_4),
  .tx_data_5(tx_data_5),
  .tx_data_6(tx_data_6),
  .tx_data_7(tx_data_7),
  .tx_data_8(tx_data_8),
  .tx_data_9(tx_data_9),
  .tx_data_10(tx_data_10),
  .tx_data_11(tx_data_11),
  .tx_data_12(tx_data_12),
  /* End: Tx data registers */
  
  /* Tx signal */
  .tx(tx_o),
  .tx_next(tx_next),
  .bus_off_on(bus_off_on),

  .go_overload_frame(go_overload_frame),
  .go_error_frame(go_error_frame),
  .go_tx(go_tx),
  .send_ack(send_ack),


`ifdef CAN_BIST
  ,
  /* BIST signals */
  .mbist_si_i(mbist_si_i),
  .mbist_so_o(mbist_so_o),
  .mbist_ctrl_i(mbist_ctrl_i),
`endif

  // port connections for Ram
  //64x8
  .q_dp_64x8(w_q_dp_64x8),
  .data_64x8(w_data_64x8),
  .wren_64x8(w_wren_64x8),
  .rden_64x8(w_rden_64x8),
  .wraddress_64x8(w_wraddress_64x8),
  .rdaddress_64x8(w_rdaddress_64x8),

  //64x4
  .q_dp_64x4(w_q_dp_64x4),
  .data_64x4(w_data_64x4),
  .wren_64x4x1(w_wren_64x4x1),
  .wraddress_64x4x1(w_wraddress_64x4x1),
  .rdaddress_64x4x1(w_rdaddress_64x4x1),

  //64x1

  .q_dp_64x1(w_q_dp_64x1),
  .data_64x1(w_data_64x1) 
);



// Multiplexing wb_dat_o from registers and rx fifo
always @ (extended_mode or addr or reset_mode)
begin
  if (extended_mode & (~reset_mode) & ((addr >= 8'd16) && (addr <= 8'd28)) | (~extended_mode) & ((addr >= 8'd20) && (addr <= 8'd29)))
    data_out_fifo_selected = 1'b1;
  else
    data_out_fifo_selected = 1'b0;
end


always @ (posedge clk_i)
begin
  if (cs & (~we))
    begin
      if (data_out_fifo_selected)
        data_out <=#Tp data_out_fifo;
      else
        data_out <=#Tp data_out_regs;
    end
end



always @ (posedge clk_i or posedge rst)
begin
  if (rst)
    begin
      rx_sync_tmp <= 1'b1;
      rx_sync     <= 1'b1;
    end
  else
    begin
      rx_sync_tmp <=#Tp rx_i;
      rx_sync     <=#Tp rx_sync_tmp;
    end
end



`ifdef CAN_WISHBONE_IF

  assign cs_can_i = 1'b1;

  // Combining wb_cyc_i and wb_stb_i signals to cs signal. Than synchronizing to clk_i clock domain. 
  always @ (posedge clk_i or posedge rst)
  begin
    if (rst)
      begin
        cs_sync1     <= 1'b0;
        cs_sync2     <= 1'b0;
        cs_sync3     <= 1'b0;
        cs_sync_rst1 <= 1'b0;
        cs_sync_rst2 <= 1'b0;
      end
    else
      begin
        cs_sync1     <=#Tp wb_cyc_i & wb_stb_i & (~cs_sync_rst2) & cs_can_i;
        cs_sync2     <=#Tp cs_sync1            & (~cs_sync_rst2);
        cs_sync3     <=#Tp cs_sync2            & (~cs_sync_rst2);
        cs_sync_rst1 <=#Tp cs_ack3;
        cs_sync_rst2 <=#Tp cs_sync_rst1;
      end
  end
  
  
  assign cs = cs_sync2 & (~cs_sync3);
  
  
  always @ (posedge wb_clk_i)
  begin
    cs_ack1 <=#Tp cs_sync3;
    cs_ack2 <=#Tp cs_ack1;
    cs_ack3 <=#Tp cs_ack2;
  end
  
  
  
  // Generating acknowledge signal
  always @ (posedge wb_clk_i)
  begin
    wb_ack_o <=#Tp (cs_ack2 & (~cs_ack3));
  end


  assign rst      = wb_rst_i;
  assign we       = wb_we_i;
  assign addr     = wb_adr_i;
  assign data_in  = wb_dat_i;
  assign wb_dat_o = data_out;


`else

  // Latching address
  always @ (posedge clk_i or posedge rst)
  begin
    if (rst)
      addr_latched <= 8'h0;
    else if (ale_i)
      addr_latched <=#Tp port_0_io;
  end


  // Generating delayed wr_i and rd_i signals
  always @ (posedge clk_i or posedge rst)
  begin
    if (rst)
      begin
        wr_i_q <= 1'b0;
        rd_i_q <= 1'b0;
      end
    else
      begin
        wr_i_q <=#Tp wr_i;
        rd_i_q <=#Tp rd_i;
      end
  end


  assign cs = ((wr_i & (~wr_i_q)) | (rd_i & (~rd_i_q))) & cs_can_i;


  assign rst       = rst_i;
  assign we        = wr_i;
  assign addr      = addr_latched;
  assign data_in   = port_0_io;
  assign port_0_io = (cs_can_i & rd_i)? data_out : 8'hz;

`endif


endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_acf.v                                                   ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_acf.v,v $
// Revision 1.9  2004/05/31 14:46:11  igorm
// Bit acceptance_filter_mode was inverted.
//
// Revision 1.8  2004/02/08 14:16:44  mohor
// Header changed.
//
// Revision 1.7  2003/07/16 13:41:34  mohor
// Fixed according to the linter.
//
// Revision 1.6  2003/02/10 16:02:11  mohor
// CAN is working according to the specification. WB interface and more
// registers (status, IRQ, ...) needs to be added.
//
// Revision 1.5  2003/02/09 18:40:29  mohor
// Overload fixed. Hard synchronization also enabled at the last bit of
// interframe.
//
// Revision 1.4  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.3  2003/01/31 01:13:37  mohor
// backup.
//
// Revision 1.2  2003/01/14 12:19:35  mohor
// rx_fifo is now working.
//
// Revision 1.1  2003/01/08 02:13:15  mohor
// Acceptance filter added.
//
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_acf
( 
  clk,
  rst,

  id,
  
  /* Mode register */
  reset_mode,
  acceptance_filter_mode,

  extended_mode,
  
  acceptance_code_0,
  acceptance_code_1,
  acceptance_code_2,
  acceptance_code_3,
  acceptance_mask_0,
  acceptance_mask_1,
  acceptance_mask_2,
  acceptance_mask_3,
  
  go_rx_crc_lim,
  go_rx_inter,
  go_error_frame,
  
  data0,
  data1,
  rtr1,
  rtr2,
  ide,
  no_byte0,
  no_byte1,

  
  id_ok
  
  
);

parameter Tp = 1;

input         clk;
input         rst;
input  [28:0] id;
input         reset_mode;
input         acceptance_filter_mode;
input         extended_mode;

input   [7:0] acceptance_code_0;
input   [7:0] acceptance_code_1;
input   [7:0] acceptance_code_2;
input   [7:0] acceptance_code_3;
input   [7:0] acceptance_mask_0;
input   [7:0] acceptance_mask_1;
input   [7:0] acceptance_mask_2;
input   [7:0] acceptance_mask_3;
input         go_rx_crc_lim;
input         go_rx_inter;
input         go_error_frame;
input   [7:0] data0;
input   [7:0] data1;
input         rtr1;
input         rtr2;
input         ide;
input         no_byte0;
input         no_byte1;


output        id_ok;

reg           id_ok;

wire          match;
wire          match_sf_std;
wire          match_sf_ext;
wire          match_df_std;
wire          match_df_ext;


// Working in basic mode. ID match for standard format (11-bit ID).
assign match =        ( (id[3]  == acceptance_code_0[0] | acceptance_mask_0[0] ) &
                        (id[4]  == acceptance_code_0[1] | acceptance_mask_0[1] ) &
                        (id[5]  == acceptance_code_0[2] | acceptance_mask_0[2] ) &
                        (id[6]  == acceptance_code_0[3] | acceptance_mask_0[3] ) &
                        (id[7]  == acceptance_code_0[4] | acceptance_mask_0[4] ) &
                        (id[8]  == acceptance_code_0[5] | acceptance_mask_0[5] ) &
                        (id[9]  == acceptance_code_0[6] | acceptance_mask_0[6] ) &
                        (id[10] == acceptance_code_0[7] | acceptance_mask_0[7] )
                      );


// Working in extended mode. ID match for standard format (11-bit ID). Using single filter.
assign match_sf_std = ( (id[3]  == acceptance_code_0[0] | acceptance_mask_0[0] ) &
                        (id[4]  == acceptance_code_0[1] | acceptance_mask_0[1] ) &
                        (id[5]  == acceptance_code_0[2] | acceptance_mask_0[2] ) &
                        (id[6]  == acceptance_code_0[3] | acceptance_mask_0[3] ) &
                        (id[7]  == acceptance_code_0[4] | acceptance_mask_0[4] ) &
                        (id[8]  == acceptance_code_0[5] | acceptance_mask_0[5] ) &
                        (id[9]  == acceptance_code_0[6] | acceptance_mask_0[6] ) &
                        (id[10] == acceptance_code_0[7] | acceptance_mask_0[7] ) &

                        (rtr1   == acceptance_code_1[4] | acceptance_mask_1[4] ) &
                        (id[0]  == acceptance_code_1[5] | acceptance_mask_1[5] ) &
                        (id[1]  == acceptance_code_1[6] | acceptance_mask_1[6] ) &
                        (id[2]  == acceptance_code_1[7] | acceptance_mask_1[7] ) &

                        (data0[0]  == acceptance_code_2[0] | acceptance_mask_2[0] | no_byte0) &
                        (data0[1]  == acceptance_code_2[1] | acceptance_mask_2[1] | no_byte0) &
                        (data0[2]  == acceptance_code_2[2] | acceptance_mask_2[2] | no_byte0) &
                        (data0[3]  == acceptance_code_2[3] | acceptance_mask_2[3] | no_byte0) &
                        (data0[4]  == acceptance_code_2[4] | acceptance_mask_2[4] | no_byte0) &
                        (data0[5]  == acceptance_code_2[5] | acceptance_mask_2[5] | no_byte0) &
                        (data0[6]  == acceptance_code_2[6] | acceptance_mask_2[6] | no_byte0) &
                        (data0[7]  == acceptance_code_2[7] | acceptance_mask_2[7] | no_byte0) &

                        (data1[0]  == acceptance_code_3[0] | acceptance_mask_3[0] | no_byte1) &
                        (data1[1]  == acceptance_code_3[1] | acceptance_mask_3[1] | no_byte1) &
                        (data1[2]  == acceptance_code_3[2] | acceptance_mask_3[2] | no_byte1) &
                        (data1[3]  == acceptance_code_3[3] | acceptance_mask_3[3] | no_byte1) &
                        (data1[4]  == acceptance_code_3[4] | acceptance_mask_3[4] | no_byte1) &
                        (data1[5]  == acceptance_code_3[5] | acceptance_mask_3[5] | no_byte1) &
                        (data1[6]  == acceptance_code_3[6] | acceptance_mask_3[6] | no_byte1) &
                        (data1[7]  == acceptance_code_3[7] | acceptance_mask_3[7] | no_byte1)
                      );



// Working in extended mode. ID match for extended format (29-bit ID). Using single filter.
assign match_sf_ext = ( (id[21]  == acceptance_code_0[0] | acceptance_mask_0[0] ) &
                        (id[22]  == acceptance_code_0[1] | acceptance_mask_0[1] ) &
                        (id[23]  == acceptance_code_0[2] | acceptance_mask_0[2] ) &
                        (id[24]  == acceptance_code_0[3] | acceptance_mask_0[3] ) &
                        (id[25]  == acceptance_code_0[4] | acceptance_mask_0[4] ) &
                        (id[26]  == acceptance_code_0[5] | acceptance_mask_0[5] ) &
                        (id[27]  == acceptance_code_0[6] | acceptance_mask_0[6] ) &
                        (id[28]  == acceptance_code_0[7] | acceptance_mask_0[7] ) &

                        (id[13]  == acceptance_code_1[0] | acceptance_mask_1[0] ) &
                        (id[14]  == acceptance_code_1[1] | acceptance_mask_1[1] ) &
                        (id[15]  == acceptance_code_1[2] | acceptance_mask_1[2] ) &
                        (id[16]  == acceptance_code_1[3] | acceptance_mask_1[3] ) &
                        (id[17]  == acceptance_code_1[4] | acceptance_mask_1[4] ) &
                        (id[18]  == acceptance_code_1[5] | acceptance_mask_1[5] ) &
                        (id[19]  == acceptance_code_1[6] | acceptance_mask_1[6] ) &
                        (id[20]  == acceptance_code_1[7] | acceptance_mask_1[7] ) &

                        (id[5]  == acceptance_code_2[0] | acceptance_mask_2[0] ) &
                        (id[6]  == acceptance_code_2[1] | acceptance_mask_2[1] ) &
                        (id[7]  == acceptance_code_2[2] | acceptance_mask_2[2] ) &
                        (id[8]  == acceptance_code_2[3] | acceptance_mask_2[3] ) &
                        (id[9]  == acceptance_code_2[4] | acceptance_mask_2[4] ) &
                        (id[10] == acceptance_code_2[5] | acceptance_mask_2[5] ) &
                        (id[11] == acceptance_code_2[6] | acceptance_mask_2[6] ) &
                        (id[12] == acceptance_code_2[7] | acceptance_mask_2[7] ) &

                        (rtr2   == acceptance_code_3[2] | acceptance_mask_3[2] ) &
                        (id[0]  == acceptance_code_3[3] | acceptance_mask_3[3] ) &
                        (id[1]  == acceptance_code_3[4] | acceptance_mask_3[4] ) &
                        (id[2]  == acceptance_code_3[5] | acceptance_mask_3[5] ) &
                        (id[3]  == acceptance_code_3[6] | acceptance_mask_3[6] ) &
                        (id[4]  == acceptance_code_3[7] | acceptance_mask_3[7] )

                      );


// Working in extended mode. ID match for standard format (11-bit ID). Using double filter.
assign match_df_std = (((id[3]  == acceptance_code_0[0] | acceptance_mask_0[0] ) &
                        (id[4]  == acceptance_code_0[1] | acceptance_mask_0[1] ) &
                        (id[5]  == acceptance_code_0[2] | acceptance_mask_0[2] ) &
                        (id[6]  == acceptance_code_0[3] | acceptance_mask_0[3] ) &
                        (id[7]  == acceptance_code_0[4] | acceptance_mask_0[4] ) &
                        (id[8]  == acceptance_code_0[5] | acceptance_mask_0[5] ) &
                        (id[9]  == acceptance_code_0[6] | acceptance_mask_0[6] ) &
                        (id[10] == acceptance_code_0[7] | acceptance_mask_0[7] ) &

                        (rtr1   == acceptance_code_1[4] | acceptance_mask_1[4] ) &
                        (id[0]  == acceptance_code_1[5] | acceptance_mask_1[5] ) &
                        (id[1]  == acceptance_code_1[6] | acceptance_mask_1[6] ) &
                        (id[2]  == acceptance_code_1[7] | acceptance_mask_1[7] ) &

                        (data0[0] == acceptance_code_3[0] | acceptance_mask_3[0] | no_byte0) &
                        (data0[1] == acceptance_code_3[1] | acceptance_mask_3[1] | no_byte0) &
                        (data0[2] == acceptance_code_3[2] | acceptance_mask_3[2] | no_byte0) &
                        (data0[3] == acceptance_code_3[3] | acceptance_mask_3[3] | no_byte0) &
                        (data0[4] == acceptance_code_1[4] | acceptance_mask_1[4] | no_byte0) &
                        (data0[5] == acceptance_code_1[5] | acceptance_mask_1[5] | no_byte0) &
                        (data0[6] == acceptance_code_1[6] | acceptance_mask_1[6] | no_byte0) &
                        (data0[7] == acceptance_code_1[7] | acceptance_mask_1[7] | no_byte0) )
                        
                       |

                       ((id[3]  == acceptance_code_2[0] | acceptance_mask_2[0] ) &
                        (id[4]  == acceptance_code_2[1] | acceptance_mask_2[1] ) &
                        (id[5]  == acceptance_code_2[2] | acceptance_mask_2[2] ) &
                        (id[6]  == acceptance_code_2[3] | acceptance_mask_2[3] ) &
                        (id[7]  == acceptance_code_2[4] | acceptance_mask_2[4] ) &
                        (id[8]  == acceptance_code_2[5] | acceptance_mask_2[5] ) &
                        (id[9]  == acceptance_code_2[6] | acceptance_mask_2[6] ) &
                        (id[10] == acceptance_code_2[7] | acceptance_mask_2[7] ) &

                        (rtr1   == acceptance_code_3[4] | acceptance_mask_3[4] ) &
                        (id[0]  == acceptance_code_3[5] | acceptance_mask_3[5] ) &
                        (id[1]  == acceptance_code_3[6] | acceptance_mask_3[6] ) &
                        (id[2]  == acceptance_code_3[7] | acceptance_mask_3[7] ) )

                      );


// Working in extended mode. ID match for extended format (29-bit ID). Using double filter.
assign match_df_ext = (((id[21]  == acceptance_code_0[0] | acceptance_mask_0[0] ) &
                        (id[22]  == acceptance_code_0[1] | acceptance_mask_0[1] ) &
                        (id[23]  == acceptance_code_0[2] | acceptance_mask_0[2] ) &
                        (id[24]  == acceptance_code_0[3] | acceptance_mask_0[3] ) &
                        (id[25]  == acceptance_code_0[4] | acceptance_mask_0[4] ) &
                        (id[26]  == acceptance_code_0[5] | acceptance_mask_0[5] ) &
                        (id[27]  == acceptance_code_0[6] | acceptance_mask_0[6] ) &
                        (id[28]  == acceptance_code_0[7] | acceptance_mask_0[7] ) &

                        (id[13]  == acceptance_code_1[0] | acceptance_mask_1[0] ) &
                        (id[14]  == acceptance_code_1[1] | acceptance_mask_1[1] ) &
                        (id[15]  == acceptance_code_1[2] | acceptance_mask_1[2] ) &
                        (id[16]  == acceptance_code_1[3] | acceptance_mask_1[3] ) &
                        (id[17]  == acceptance_code_1[4] | acceptance_mask_1[4] ) &
                        (id[18]  == acceptance_code_1[5] | acceptance_mask_1[5] ) &
                        (id[19]  == acceptance_code_1[6] | acceptance_mask_1[6] ) &
                        (id[20]  == acceptance_code_1[7] | acceptance_mask_1[7] ) )
                        
                       |
                        
                       ((id[21]  == acceptance_code_2[0] | acceptance_mask_2[0] ) &
                        (id[22]  == acceptance_code_2[1] | acceptance_mask_2[1] ) &
                        (id[23]  == acceptance_code_2[2] | acceptance_mask_2[2] ) &
                        (id[24]  == acceptance_code_2[3] | acceptance_mask_2[3] ) &
                        (id[25]  == acceptance_code_2[4] | acceptance_mask_2[4] ) &
                        (id[26]  == acceptance_code_2[5] | acceptance_mask_2[5] ) &
                        (id[27]  == acceptance_code_2[6] | acceptance_mask_2[6] ) &
                        (id[28]  == acceptance_code_2[7] | acceptance_mask_2[7] ) &

                        (id[13]  == acceptance_code_3[0] | acceptance_mask_3[0] ) &
                        (id[14]  == acceptance_code_3[1] | acceptance_mask_3[1] ) &
                        (id[15]  == acceptance_code_3[2] | acceptance_mask_3[2] ) &
                        (id[16]  == acceptance_code_3[3] | acceptance_mask_3[3] ) &
                        (id[17]  == acceptance_code_3[4] | acceptance_mask_3[4] ) &
                        (id[18]  == acceptance_code_3[5] | acceptance_mask_3[5] ) &
                        (id[19]  == acceptance_code_3[6] | acceptance_mask_3[6] ) &
                        (id[20]  == acceptance_code_3[7] | acceptance_mask_3[7] ) )
                      );



// ID ok signal generation
always @ (posedge clk or posedge rst)
begin
  if (rst)
    id_ok <= 1'b0;
  else if (go_rx_crc_lim)                   // sample_point is already included in go_rx_crc_lim
    begin
      if (extended_mode)
        begin
          if (~acceptance_filter_mode)      // dual filter
            begin
              if (ide)                      // extended frame message
                id_ok <=#Tp match_df_ext;
              else                          // standard frame message
                id_ok <=#Tp match_df_std;
            end           
          else                              // single filter
            begin
              if (ide)                      // extended frame message
                id_ok <=#Tp match_sf_ext;
              else                          // standard frame message
                id_ok <=#Tp match_sf_std;
            end
        end
      else      
        id_ok <=#Tp match;
    end
  else if (reset_mode | go_rx_inter | go_error_frame)        // sample_point is already included in go_rx_inter
    id_ok <=#Tp 1'b0;
end









endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_bsp.v                                                   ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_bsp.v,v $
// Revision 1.52  2004/11/18 12:39:21  igorm
// Fixes for compatibility after the SW reset.
//
// Revision 1.51  2004/11/15 18:23:21  igorm
// When CAN was reset by setting the reset_mode signal in mode register, it
// was possible that CAN was blocked for a short period of time. Problem
// occured very rarly.
//
// Revision 1.50  2004/10/27 18:51:36  igorm
// Fixed synchronization problem in real hardware when 0xf is used for TSEG1.
//
// Revision 1.49  2004/10/25 06:37:51  igorm
// Arbitration bug fixed.
//
// Revision 1.48  2004/05/12 15:58:41  igorm
// Core improved to pass all tests with the Bosch VHDL Reference system.
//
// Revision 1.47  2004/02/08 14:24:10  mohor
// Error counters changed.
//
// Revision 1.46  2003/10/17 05:55:20  markom
// mbist signals updated according to newest convention
//
// Revision 1.45  2003/09/30 21:14:33  mohor
// Error counters changed.
//
// Revision 1.44  2003/09/30 00:55:12  mohor
// Error counters fixed to be compatible with Bosch VHDL reference model.
// Small synchronization changes.
//
// Revision 1.43  2003/09/25 18:55:49  mohor
// Synchronization changed, error counters fixed.
//
// Revision 1.42  2003/08/29 07:01:14  mohor
// When detecting bus-free, signal bus_free_cnt_en was cleared to zero
// although the last sampled bit was zero instead of one.
//
// Revision 1.41  2003/07/18 15:23:31  tadejm
// Tx and rx length are limited to 8 bytes regardless to the DLC value.
//
// Revision 1.40  2003/07/16 15:10:17  mohor
// Fixed according to the linter.
//
// Revision 1.39  2003/07/16 13:12:46  mohor
// Fixed according to the linter.
//
// Revision 1.38  2003/07/10 01:59:04  tadejm
// Synchronization fixed. In some strange cases it didn't work according to
// the VHDL reference model.
//
// Revision 1.37  2003/07/07 11:21:37  mohor
// Little fixes (to fix warnings).
//
// Revision 1.36  2003/07/03 09:32:20  mohor
// Synchronization changed.
//
// Revision 1.35  2003/06/27 20:56:12  simons
// Virtual silicon ram instances added.
//
// Revision 1.34  2003/06/22 09:43:03  mohor
// synthesi full_case parallel_case fixed.
//
// Revision 1.33  2003/06/21 12:16:30  mohor
// paralel_case and full_case compiler directives added to case statements.
//
// Revision 1.32  2003/06/17 14:28:32  mohor
// Form error was detected when stuff bit occured at the end of crc.
//
// Revision 1.31  2003/06/16 14:31:29  tadejm
// Bit stuffing corrected when stuffing comes at the end of the crc.
//
// Revision 1.30  2003/06/16 13:57:58  mohor
// tx_point generated one clk earlier. rx_i registered. Data corrected when
// using extended mode.
//
// Revision 1.29  2003/06/11 14:21:35  mohor
// When switching to tx, sync stage is overjumped.
//
// Revision 1.28  2003/03/01 22:53:33  mohor
// Actel APA ram supported.
//
// Revision 1.27  2003/02/20 00:26:02  mohor
// When a dominant bit was detected at the third bit of the intermission and
// node had a message to transmit, bit_stuff error could occur. Fixed.
//
// Revision 1.26  2003/02/19 23:21:54  mohor
// When bit error occured while active error flag was transmitted, counter was
// not incremented.
//
// Revision 1.25  2003/02/19 14:44:03  mohor
// CAN core finished. Host interface added. Registers finished.
// Synchronization to the wishbone finished.
//
// Revision 1.24  2003/02/18 00:10:15  mohor
// Most of the registers added. Registers "arbitration lost capture", "error code
// capture" + few more still need to be added.
//
// Revision 1.23  2003/02/14 20:17:01  mohor
// Several registers added. Not finished, yet.
//
// Revision 1.22  2003/02/12 14:23:59  mohor
// abort_tx added. Bit destuff fixed.
//
// Revision 1.21  2003/02/11 00:56:06  mohor
// Wishbone interface added.
//
// Revision 1.20  2003/02/10 16:02:11  mohor
// CAN is working according to the specification. WB interface and more
// registers (status, IRQ, ...) needs to be added.
//
// Revision 1.19  2003/02/09 18:40:29  mohor
// Overload fixed. Hard synchronization also enabled at the last bit of
// interframe.
//
// Revision 1.18  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.17  2003/02/04 17:24:41  mohor
// Backup.
//
// Revision 1.16  2003/02/04 14:34:52  mohor
// *** empty log message ***
//
// Revision 1.15  2003/01/31 01:13:37  mohor
// backup.
//
// Revision 1.14  2003/01/16 13:36:19  mohor
// Form error supported. When receiving messages, last bit of the end-of-frame
// does not generate form error. Receiver goes to the idle mode one bit sooner.
// (CAN specification ver 2.0, part B, page 57).
//
// Revision 1.13  2003/01/15 21:59:45  mohor
// Data is stored to fifo at the end of ack stage.
//
// Revision 1.12  2003/01/15 21:05:11  mohor
// CRC checking fixed (when bitstuff occurs at the end of a CRC sequence).
//
// Revision 1.11  2003/01/15 14:40:23  mohor
// RX state machine fixed to receive "remote request" frames correctly.
// No data bytes are written to fifo when such frames are received.
//
// Revision 1.10  2003/01/15 13:16:47  mohor
// When a frame with "remote request" is received, no data is stored to
// fifo, just the frame information (identifier, ...). Data length that
// is stored is the received data length and not the actual data length
// that is stored to fifo.
//
// Revision 1.9  2003/01/14 12:19:35  mohor
// rx_fifo is now working.
//
// Revision 1.8  2003/01/10 17:51:33  mohor
// Temporary version (backup).
//
// Revision 1.7  2003/01/09 21:54:45  mohor
// rx fifo added. Not 100 % verified, yet.
//
// Revision 1.6  2003/01/09 14:46:58  mohor
// Temporary files (backup).
//
// Revision 1.5  2003/01/08 13:30:31  mohor
// Temp version.
//
// Revision 1.4  2003/01/08 02:10:53  mohor
// Acceptance filter added.
//
// Revision 1.3  2002/12/28 04:13:23  mohor
// Backup version.
//
// Revision 1.2  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_bsp
( 
  clk,
  rst,

  sample_point,
  sampled_bit,
  sampled_bit_q,
  tx_point,
  hard_sync,

  addr,
  data_in,
  data_out,
  fifo_selected,
  


  /* Mode register */
  reset_mode,
  listen_only_mode,
  acceptance_filter_mode,
  self_test_mode,

  /* Command register */
  release_buffer,
  tx_request,
  abort_tx,
  self_rx_request,
  single_shot_transmission,
  tx_state,
  tx_state_q,
  overload_request,
  overload_frame,

  /* Arbitration Lost Capture Register */
  read_arbitration_lost_capture_reg,

  /* Error Code Capture Register */
  read_error_code_capture_reg,
  error_capture_code,

  /* Error Warning Limit register */
  error_warning_limit,

  /* Rx Error Counter register */
  we_rx_err_cnt,

  /* Tx Error Counter register */
  we_tx_err_cnt,

  /* Clock Divider register */
  extended_mode,

  rx_idle,
  transmitting,
  transmitter,
  go_rx_inter,
  not_first_bit_of_inter,
  rx_inter,
  set_reset_mode,
  node_bus_off,
  error_status,
  rx_err_cnt,
  tx_err_cnt,
  transmit_status,
  receive_status,
  tx_successful,
  need_to_tx,
  overrun,
  info_empty,
  set_bus_error_irq,
  set_arbitration_lost_irq,
  arbitration_lost_capture,
  node_error_passive,
  node_error_active,
  rx_message_counter,

  /* This section is for BASIC and EXTENDED mode */
  /* Acceptance code register */
  acceptance_code_0,

  /* Acceptance mask register */
  acceptance_mask_0,
  /* End: This section is for BASIC and EXTENDED mode */
  
  /* This section is for EXTENDED mode */
  /* Acceptance code register */
  acceptance_code_1,
  acceptance_code_2,
  acceptance_code_3,

  /* Acceptance mask register */
  acceptance_mask_1,
  acceptance_mask_2,
  acceptance_mask_3,
  /* End: This section is for EXTENDED mode */
  
  /* Tx data registers. Holding identifier (basic mode), tx frame information (extended mode) and data */
  tx_data_0,
  tx_data_1,
  tx_data_2,
  tx_data_3,
  tx_data_4,
  tx_data_5,
  tx_data_6,
  tx_data_7,
  tx_data_8,
  tx_data_9,
  tx_data_10,
  tx_data_11,
  tx_data_12,
  /* End: Tx data registers */
  
  /* Tx signal */
  tx,
  tx_next,
  bus_off_on,

  go_overload_frame,
  go_error_frame,
  go_tx,
  send_ack,

  /* Bist */
`ifdef CAN_BIST
  ,
  mbist_si_i,
  mbist_so_o,
  mbist_ctrl_i,
`endif

  // port connections for Ram
  //64x8
  q_dp_64x8,
  data_64x8,
  wren_64x8,
  rden_64x8,
  wraddress_64x8,
  rdaddress_64x8,

  //64x4
  q_dp_64x4,
  data_64x4,
  wren_64x4x1,
  wraddress_64x4x1,
  rdaddress_64x4x1,

  //64x1

  q_dp_64x1,
  data_64x1  
);

parameter Tp = 1;

input         clk;
input         rst;
input         sample_point;
input         sampled_bit;
input         sampled_bit_q;
input         tx_point;
input         hard_sync;
input   [7:0] addr;
input   [7:0] data_in;
output  [7:0] data_out;
input         fifo_selected;

input         reset_mode;
input         listen_only_mode;
input         acceptance_filter_mode;
input         extended_mode;
input         self_test_mode;

/* Command register */
input         release_buffer;
input         tx_request;
input         abort_tx;
input         self_rx_request;
input         single_shot_transmission;
output        tx_state;
output        tx_state_q;
input         overload_request;     // When receiver is busy, it needs to send overload frame. Only 2 overload frames are allowed to
output        overload_frame;       // be send in a row. This is not implemented, yet,  because host can not send an overload request.

/* Arbitration Lost Capture Register */
input         read_arbitration_lost_capture_reg;

/* Error Code Capture Register */
input         read_error_code_capture_reg;
output  [7:0] error_capture_code;

/* Error Warning Limit register */
input   [7:0] error_warning_limit;

/* Rx Error Counter register */
input         we_rx_err_cnt;

/* Tx Error Counter register */
input         we_tx_err_cnt;

output        rx_idle;
output        transmitting;
output        transmitter;
output        go_rx_inter;
output        not_first_bit_of_inter;
output        rx_inter;
output        set_reset_mode;
output        node_bus_off;
output        error_status;
output  [8:0] rx_err_cnt;
output  [8:0] tx_err_cnt;
output        transmit_status;
output        receive_status;
output        tx_successful;
output        need_to_tx;
output        overrun;
output        info_empty;
output        set_bus_error_irq;
output        set_arbitration_lost_irq;
output  [4:0] arbitration_lost_capture;
output        node_error_passive;
output        node_error_active;
output  [6:0] rx_message_counter;


/* This section is for BASIC and EXTENDED mode */
/* Acceptance code register */
input   [7:0] acceptance_code_0;

/* Acceptance mask register */
input   [7:0] acceptance_mask_0;

/* End: This section is for BASIC and EXTENDED mode */


/* This section is for EXTENDED mode */
/* Acceptance code register */
input   [7:0] acceptance_code_1;
input   [7:0] acceptance_code_2;
input   [7:0] acceptance_code_3;

/* Acceptance mask register */
input   [7:0] acceptance_mask_1;
input   [7:0] acceptance_mask_2;
input   [7:0] acceptance_mask_3;
/* End: This section is for EXTENDED mode */

/* Tx data registers. Holding identifier (basic mode), tx frame information (extended mode) and data */
input   [7:0] tx_data_0;
input   [7:0] tx_data_1;
input   [7:0] tx_data_2;
input   [7:0] tx_data_3;
input   [7:0] tx_data_4;
input   [7:0] tx_data_5;
input   [7:0] tx_data_6;
input   [7:0] tx_data_7;
input   [7:0] tx_data_8;
input   [7:0] tx_data_9;
input   [7:0] tx_data_10;
input   [7:0] tx_data_11;
input   [7:0] tx_data_12;
/* End: Tx data registers */

/* Tx signal */
output        tx;
output        tx_next;
output        bus_off_on;

output        go_overload_frame;
output        go_error_frame;
output        go_tx;
output        send_ack;


/* Bist */
`ifdef CAN_BIST
input         mbist_si_i;
output        mbist_so_o;
input [`CAN_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;       // bist chain shift control
`endif

 // port connections for Ram
  //64x8
input [7:0] q_dp_64x8;
output[7:0] data_64x8;
output      wren_64x8;
output      rden_64x8;
output[5:0] wraddress_64x8;
output[5:0] rdaddress_64x8;
//64x4
input [3:0] q_dp_64x4;
output[3:0] data_64x4;
output      wren_64x4x1;
output[5:0] wraddress_64x4x1;
output[5:0] rdaddress_64x4x1;
//64x1
input[0:0]  q_dp_64x1;
output[0:0] data_64x1;  

//----------------------------

reg           reset_mode_q;
reg     [5:0] bit_cnt;

reg     [3:0] data_len;
reg    [28:0] id;
reg     [2:0] bit_stuff_cnt;
reg     [2:0] bit_stuff_cnt_tx;
reg           tx_point_q;

reg           rx_idle;
reg           rx_id1;
reg           rx_rtr1;
reg           rx_ide;
reg           rx_id2;
reg           rx_rtr2;
reg           rx_r1;
reg           rx_r0;
reg           rx_dlc;
reg           rx_data;
reg           rx_crc;
reg           rx_crc_lim;
reg           rx_ack;
reg           rx_ack_lim;
reg           rx_eof;
reg           rx_inter;
reg           go_early_tx_latched;

reg           rtr1;
reg           ide;
reg           rtr2;
reg    [14:0] crc_in;

reg     [7:0] tmp_data;
reg     [7:0] tmp_fifo [0:7];
reg           write_data_to_tmp_fifo;
reg     [2:0] byte_cnt;
reg           bit_stuff_cnt_en;
reg           crc_enable;

reg     [2:0] eof_cnt;
reg     [2:0] passive_cnt;

reg           transmitting;

reg           error_frame;
reg           enable_error_cnt2;
reg     [2:0] error_cnt1;
reg     [2:0] error_cnt2;
reg     [2:0] delayed_dominant_cnt;
reg           enable_overload_cnt2;
reg           overload_frame;
reg           overload_frame_blocked;
reg     [1:0] overload_request_cnt;
reg     [2:0] overload_cnt1;
reg     [2:0] overload_cnt2;
reg           tx;
reg           crc_err;

reg           arbitration_lost;
reg           arbitration_lost_q;
reg           read_arbitration_lost_capture_reg_q;
reg     [4:0] arbitration_lost_capture;
reg           arbitration_cnt_en;
reg           arbitration_blocked;
reg           tx_q;

reg           need_to_tx;   // When the CAN core has something to transmit and a dominant bit is sampled at the third bit
reg     [3:0] data_cnt;     // Counting the data bytes that are written to FIFO
reg     [2:0] header_cnt;   // Counting header length
reg           wr_fifo;      // Write data and header to 64-byte fifo
reg     [7:0] data_for_fifo;// Multiplexed data that is stored to 64-byte fifo

reg     [5:0] tx_pointer;
reg           tx_bit;
reg           tx_state;
reg           tx_state_q;
reg           transmitter;
reg           finish_msg;

reg     [8:0] rx_err_cnt;
reg     [8:0] tx_err_cnt;
reg     [3:0] bus_free_cnt;
reg           bus_free_cnt_en;
reg           bus_free;
reg           waiting_for_bus_free;

reg           node_error_passive;
reg           node_bus_off;
reg           node_bus_off_q;
reg           ack_err_latched;
reg           bit_err_latched;
reg           stuff_err_latched;
reg           form_err_latched;
reg           rule3_exc1_1;
reg           rule3_exc1_2;
reg           suspend;
reg           susp_cnt_en;
reg     [2:0] susp_cnt;
reg           error_flag_over_latched;

reg     [7:0] error_capture_code;
reg     [7:6] error_capture_code_type;
reg           error_capture_code_blocked;
reg           tx_next;
reg           first_compare_bit;


wire    [4:0] error_capture_code_segment;
wire          error_capture_code_direction;

wire          bit_de_stuff;
wire          bit_de_stuff_tx;

wire          rule5;

/* Rx state machine */
wire          go_rx_idle;
wire          go_rx_id1;
wire          go_rx_rtr1;
wire          go_rx_ide;
wire          go_rx_id2;
wire          go_rx_rtr2;
wire          go_rx_r1;
wire          go_rx_r0;
wire          go_rx_dlc;
wire          go_rx_data;
wire          go_rx_crc;
wire          go_rx_crc_lim;
wire          go_rx_ack;
wire          go_rx_ack_lim;
wire          go_rx_eof;
wire          go_rx_inter;

wire          last_bit_of_inter;

wire          go_crc_enable;
wire          rst_crc_enable;

wire          bit_de_stuff_set;
wire          bit_de_stuff_reset;

wire          go_early_tx;

wire   [14:0] calculated_crc;
wire   [15:0] r_calculated_crc;
wire          remote_rq;
wire    [3:0] limited_data_len;
wire          form_err;

wire          error_frame_ended;
wire          overload_frame_ended;
wire          bit_err;
wire          ack_err;
wire          stuff_err;

wire          id_ok;                // If received ID matches ID set in registers
wire          no_byte0;             // There is no byte 0 (RTR bit set to 1 or DLC field equal to 0). Signal used for acceptance filter.
wire          no_byte1;             // There is no byte 1 (RTR bit set to 1 or DLC field equal to 1). Signal used for acceptance filter.

wire    [2:0] header_len;
wire          storing_header;
wire    [3:0] limited_data_len_minus1;
wire          reset_wr_fifo;
wire          err;

wire          arbitration_field;

wire   [18:0] basic_chain;
wire   [63:0] basic_chain_data;
wire   [18:0] extended_chain_std;
wire   [38:0] extended_chain_ext;
wire   [63:0] extended_chain_data_std;
wire   [63:0] extended_chain_data_ext;

wire          rst_tx_pointer;

wire    [7:0] r_tx_data_0;
wire    [7:0] r_tx_data_1;
wire    [7:0] r_tx_data_2;
wire    [7:0] r_tx_data_3;
wire    [7:0] r_tx_data_4;
wire    [7:0] r_tx_data_5;
wire    [7:0] r_tx_data_6;
wire    [7:0] r_tx_data_7;
wire    [7:0] r_tx_data_8;
wire    [7:0] r_tx_data_9;
wire    [7:0] r_tx_data_10;
wire    [7:0] r_tx_data_11;
wire    [7:0] r_tx_data_12;

wire          send_ack;
wire          bit_err_exc1;
wire          bit_err_exc2;
wire          bit_err_exc3;
wire          bit_err_exc4;
wire          bit_err_exc5;
wire          bit_err_exc6;
wire          error_flag_over;
wire          overload_flag_over;

wire    [5:0] limited_tx_cnt_ext;
wire    [5:0] limited_tx_cnt_std;

// port connections for Ram
//64x8
wire[7:0] w_q_dp_64x8;
wire[7:0] w_data_64x8;
wire      w_wren_64x8;
wire      w_rden_64x8;
wire[5:0] w_wraddress_64x8;
wire[5:0] w_rdaddress_64x8;
//64x4
wire[3:0] w_q_dp_64x4;
wire[3:0] w_data_64x4;
wire      w_wren_64x4x1;
wire[5:0] w_wraddress_64x4x1;
wire[5:0] w_rdaddress_64x4x1;
//64x1
wire[0:0]  w_q_dp_64x1;
wire[0:0] w_data_64x1;  


// port connections for Ram
  //64x8
assign  w_q_dp_64x8   	= q_dp_64x8;
assign  data_64x8 	= w_data_64x8;
assign  wren_64x8 	= w_wren_64x8;
assign  rden_64x8 	= w_rden_64x8;
assign  wraddress_64x8 = w_wraddress_64x8;
assign  rdaddress_64x8 = w_rdaddress_64x8;

  //64x4
assign  w_q_dp_64x4 	= q_dp_64x4;
assign  data_64x4 		= w_data_64x4;
assign  wren_64x4x1 		= w_wren_64x4x1;
assign  wraddress_64x4x1 	= w_wraddress_64x4x1;
assign  rdaddress_64x4x1 	= w_rdaddress_64x4x1;

  //64x1

assign  w_q_dp_64x1 		= q_dp_64x1;
assign  data_64x1 		= w_data_64x1;    
  
// ----------------------


assign go_rx_idle     =                   sample_point &  sampled_bit & last_bit_of_inter | bus_free & (~node_bus_off);
assign go_rx_id1      =                   sample_point &  (~sampled_bit) & (rx_idle | last_bit_of_inter);
assign go_rx_rtr1     = (~bit_de_stuff) & sample_point &  rx_id1  & (bit_cnt[3:0] == 4'd10);
assign go_rx_ide      = (~bit_de_stuff) & sample_point &  rx_rtr1;
assign go_rx_id2      = (~bit_de_stuff) & sample_point &  rx_ide  &   sampled_bit;
assign go_rx_rtr2     = (~bit_de_stuff) & sample_point &  rx_id2  & (bit_cnt[4:0] == 5'd17);
assign go_rx_r1       = (~bit_de_stuff) & sample_point &  rx_rtr2;
assign go_rx_r0       = (~bit_de_stuff) & sample_point & (rx_ide  & (~sampled_bit) | rx_r1);
assign go_rx_dlc      = (~bit_de_stuff) & sample_point &  rx_r0;
assign go_rx_data     = (~bit_de_stuff) & sample_point &  rx_dlc  & (bit_cnt[1:0] == 2'd3) &  (sampled_bit   |   (|data_len[2:0])) & (~remote_rq);
assign go_rx_crc      = (~bit_de_stuff) & sample_point & (rx_dlc  & (bit_cnt[1:0] == 2'd3) & ((~sampled_bit) & (~(|data_len[2:0])) | remote_rq) |
                                                          rx_data & (bit_cnt[5:0] == ((limited_data_len<<3) - 1'b1)));  // overflow works ok at max value (8<<3 = 64 = 0). 0-1 = 6'h3f
assign go_rx_crc_lim  = (~bit_de_stuff) & sample_point &  rx_crc  & (bit_cnt[3:0] == 4'd14);
assign go_rx_ack      = (~bit_de_stuff) & sample_point &  rx_crc_lim;
assign go_rx_ack_lim  =                   sample_point &  rx_ack;
assign go_rx_eof      =                   sample_point &  rx_ack_lim;
assign go_rx_inter    =                 ((sample_point &  rx_eof  & (eof_cnt == 3'd6)) | error_frame_ended | overload_frame_ended) & (~overload_request);

assign go_error_frame = (form_err | stuff_err | bit_err | ack_err | (crc_err & go_rx_eof));
assign error_frame_ended = (error_cnt2 == 3'd7) & tx_point;
assign overload_frame_ended = (overload_cnt2 == 3'd7) & tx_point;

assign go_overload_frame = (     sample_point & ((~sampled_bit) | overload_request) & (rx_eof & (~transmitter) & (eof_cnt == 3'd6) | error_frame_ended | overload_frame_ended) | 
                                 sample_point & (~sampled_bit) & rx_inter & (bit_cnt[1:0] < 2'd2)                                                            |
                                 sample_point & (~sampled_bit) & ((error_cnt2 == 3'd7) | (overload_cnt2 == 3'd7))
                           )
                           & (~overload_frame_blocked)
                           ;


assign go_crc_enable  = hard_sync | go_tx;
assign rst_crc_enable = go_rx_crc;

assign bit_de_stuff_set   = go_rx_id1 & (~go_error_frame);
assign bit_de_stuff_reset = go_rx_ack | reset_mode | go_error_frame | go_overload_frame;

assign remote_rq = ((~ide) & rtr1) | (ide & rtr2);
assign limited_data_len = (data_len < 4'h8)? data_len : 4'h8;

assign ack_err = rx_ack & sample_point & sampled_bit & tx_state & (~self_test_mode);
assign bit_err = (tx_state | error_frame | overload_frame | rx_ack) & sample_point & (tx != sampled_bit) & (~bit_err_exc1) & (~bit_err_exc2) & (~bit_err_exc3) & (~bit_err_exc4) & (~bit_err_exc5) & (~bit_err_exc6);
assign bit_err_exc1 = tx_state & arbitration_field & tx;
assign bit_err_exc2 = rx_ack & tx;
assign bit_err_exc3 = error_frame & node_error_passive & (error_cnt1 < 3'd7);
assign bit_err_exc4 = (error_frame & (error_cnt1 == 3'd7) & (~enable_error_cnt2)) | (overload_frame & (overload_cnt1 == 3'd7) & (~enable_overload_cnt2));
assign bit_err_exc5 = (error_frame & (error_cnt2 == 3'd7)) | (overload_frame & (overload_cnt2 == 3'd7));
assign bit_err_exc6 = (eof_cnt == 3'd6) & rx_eof & (~transmitter); 

assign arbitration_field = rx_id1 | rx_rtr1 | rx_ide | rx_id2 | rx_rtr2;

assign last_bit_of_inter = rx_inter & (bit_cnt[1:0] == 2'd2);
assign not_first_bit_of_inter = rx_inter & (bit_cnt[1:0] != 2'd0);


// Rx idle state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_idle <= 1'b0;
  else if (reset_mode | go_rx_id1 | go_error_frame)
    rx_idle <=#Tp 1'b0;
  else if (go_rx_idle)
    rx_idle <=#Tp 1'b1;
end


// Rx id1 state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_id1 <= 1'b0;
  else if (reset_mode | go_rx_rtr1 | go_error_frame)
    rx_id1 <=#Tp 1'b0;
  else if (go_rx_id1)
    rx_id1 <=#Tp 1'b1;
end


// Rx rtr1 state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_rtr1 <= 1'b0;
  else if (reset_mode | go_rx_ide | go_error_frame)
    rx_rtr1 <=#Tp 1'b0;
  else if (go_rx_rtr1)
    rx_rtr1 <=#Tp 1'b1;
end


// Rx ide state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_ide <= 1'b0;
  else if (reset_mode | go_rx_r0 | go_rx_id2 | go_error_frame)
    rx_ide <=#Tp 1'b0;
  else if (go_rx_ide)
    rx_ide <=#Tp 1'b1;
end


// Rx id2 state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_id2 <= 1'b0;
  else if (reset_mode | go_rx_rtr2 | go_error_frame)
    rx_id2 <=#Tp 1'b0;
  else if (go_rx_id2)
    rx_id2 <=#Tp 1'b1;
end


// Rx rtr2 state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_rtr2 <= 1'b0;
  else if (reset_mode | go_rx_r1 | go_error_frame)
    rx_rtr2 <=#Tp 1'b0;
  else if (go_rx_rtr2)
    rx_rtr2 <=#Tp 1'b1;
end


// Rx r0 state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_r1 <= 1'b0;
  else if (reset_mode | go_rx_r0 | go_error_frame)
    rx_r1 <=#Tp 1'b0;
  else if (go_rx_r1)
    rx_r1 <=#Tp 1'b1;
end


// Rx r0 state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_r0 <= 1'b0;
  else if (reset_mode | go_rx_dlc | go_error_frame)
    rx_r0 <=#Tp 1'b0;
  else if (go_rx_r0)
    rx_r0 <=#Tp 1'b1;
end


// Rx dlc state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_dlc <= 1'b0;
  else if (reset_mode | go_rx_data | go_rx_crc | go_error_frame)
    rx_dlc <=#Tp 1'b0;
  else if (go_rx_dlc)
    rx_dlc <=#Tp 1'b1;
end


// Rx data state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_data <= 1'b0;
  else if (reset_mode | go_rx_crc | go_error_frame)
    rx_data <=#Tp 1'b0;
  else if (go_rx_data)
    rx_data <=#Tp 1'b1;
end


// Rx crc state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_crc <= 1'b0;
  else if (reset_mode | go_rx_crc_lim | go_error_frame)
    rx_crc <=#Tp 1'b0;
  else if (go_rx_crc)
    rx_crc <=#Tp 1'b1;
end


// Rx crc delimiter state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_crc_lim <= 1'b0;
  else if (reset_mode | go_rx_ack | go_error_frame)
    rx_crc_lim <=#Tp 1'b0;
  else if (go_rx_crc_lim)
    rx_crc_lim <=#Tp 1'b1;
end


// Rx ack state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_ack <= 1'b0;
  else if (reset_mode | go_rx_ack_lim | go_error_frame)
    rx_ack <=#Tp 1'b0;
  else if (go_rx_ack)
    rx_ack <=#Tp 1'b1;
end


// Rx ack delimiter state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_ack_lim <= 1'b0;
  else if (reset_mode | go_rx_eof | go_error_frame)
    rx_ack_lim <=#Tp 1'b0;
  else if (go_rx_ack_lim)
    rx_ack_lim <=#Tp 1'b1;
end


// Rx eof state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_eof <= 1'b0;
  else if (reset_mode | go_rx_inter | go_error_frame | go_overload_frame)
    rx_eof <=#Tp 1'b0;
  else if (go_rx_eof)
    rx_eof <=#Tp 1'b1;
end



// Interframe space
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_inter <= 1'b0;
  else if (reset_mode | go_rx_idle | go_rx_id1 | go_overload_frame | go_error_frame)
    rx_inter <=#Tp 1'b0;
  else if (go_rx_inter)
    rx_inter <=#Tp 1'b1;
end


// ID register
always @ (posedge clk or posedge rst)
begin
  if (rst)
    id <= 29'h0;
  else if (reset_mode)
    id <= 29'h0;
  else if (sample_point & (rx_id1 | rx_id2) & (~bit_de_stuff))
    id <=#Tp {id[27:0], sampled_bit};
end


// rtr1 bit
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rtr1 <= 1'b0;
  else if (reset_mode)
    rtr1 <= 1'b0;
  else if (sample_point & rx_rtr1 & (~bit_de_stuff))
    rtr1 <=#Tp sampled_bit;
end


// rtr2 bit
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rtr2 <= 1'b0;
  else if (reset_mode)
    rtr2 <= 1'b0;
  else if (sample_point & rx_rtr2 & (~bit_de_stuff))
    rtr2 <=#Tp sampled_bit;
end


// ide bit
always @ (posedge clk or posedge rst)
begin
  if (rst)
    ide <= 1'b0;
  else if (reset_mode)
    ide <= 1'b0;
  else if (sample_point & rx_ide & (~bit_de_stuff))
    ide <=#Tp sampled_bit;
end


// Data length
always @ (posedge clk or posedge rst)
begin
  if (rst)
    data_len <= 4'b0;
  else if (reset_mode)
    data_len <= 4'b0;
  else if (sample_point & rx_dlc & (~bit_de_stuff))
    data_len <=#Tp {data_len[2:0], sampled_bit};
end


// Data
always @ (posedge clk or posedge rst)
begin
  if (rst)
    tmp_data <= 8'h0;
  else if (reset_mode)
    tmp_data <= 8'h0;
  else if (sample_point & rx_data & (~bit_de_stuff))
    tmp_data <=#Tp {tmp_data[6:0], sampled_bit};
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    write_data_to_tmp_fifo <= 1'b0;
  else if (reset_mode)
    write_data_to_tmp_fifo <= 1'b0;
  else if (sample_point & rx_data & (~bit_de_stuff) & (&bit_cnt[2:0]))
    write_data_to_tmp_fifo <=#Tp 1'b1;
  else
    write_data_to_tmp_fifo <=#Tp 1'b0;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    byte_cnt <= 3'h0;
  else if (reset_mode)
    byte_cnt <= 3'h0;
  else if (write_data_to_tmp_fifo)
    byte_cnt <=#Tp byte_cnt + 1'b1;
  else if (sample_point & go_rx_crc_lim)
    byte_cnt <=#Tp 3'h0;
end


always @ (posedge clk)
begin
  if (write_data_to_tmp_fifo)
    tmp_fifo[byte_cnt] <=#Tp tmp_data;
end



// CRC
always @ (posedge clk or posedge rst)
begin
  if (rst)
    crc_in <= 15'h0;
  else if (reset_mode)
    crc_in <= 15'h0;
  else if (sample_point & rx_crc & (~bit_de_stuff))
    crc_in <=#Tp {crc_in[13:0], sampled_bit};
end


// bit_cnt
always @ (posedge clk or posedge rst)
begin
  if (rst)
    bit_cnt <= 6'd0;
  else if (reset_mode)
    bit_cnt <= 6'd0;
  else if (go_rx_id1 | go_rx_id2 | go_rx_dlc | go_rx_data | go_rx_crc | 
           go_rx_ack | go_rx_eof | go_rx_inter | go_error_frame | go_overload_frame)
    bit_cnt <=#Tp 6'd0;
  else if (sample_point & (~bit_de_stuff))
    bit_cnt <=#Tp bit_cnt + 1'b1;
end


// eof_cnt
always @ (posedge clk or posedge rst)
begin
  if (rst)
    eof_cnt <= 3'd0;
  else if (reset_mode)
    eof_cnt <= 3'd0;
  else if (sample_point)
    begin
      if (go_rx_inter | go_error_frame | go_overload_frame)
        eof_cnt <=#Tp 3'd0;
      else if (rx_eof)
        eof_cnt <=#Tp eof_cnt + 1'b1;
    end
end


// Enabling bit de-stuffing
always @ (posedge clk or posedge rst)
begin
  if (rst)
    bit_stuff_cnt_en <= 1'b0;
  else if (reset_mode)
    bit_stuff_cnt_en <= 1'b0;
  else if (bit_de_stuff_set)
    bit_stuff_cnt_en <=#Tp 1'b1;
  else if (bit_de_stuff_reset)
    bit_stuff_cnt_en <=#Tp 1'b0;
end


// bit_stuff_cnt
always @ (posedge clk or posedge rst)
begin
  if (rst)
    bit_stuff_cnt <= 3'h1;
  else if (reset_mode)
    bit_stuff_cnt <= 3'h1;
  else if (bit_de_stuff_reset)
    bit_stuff_cnt <=#Tp 3'h1;
  else if (sample_point & bit_stuff_cnt_en)
    begin
      if (bit_stuff_cnt == 3'h5)
        bit_stuff_cnt <=#Tp 3'h1;
      else if (sampled_bit == sampled_bit_q)
        bit_stuff_cnt <=#Tp bit_stuff_cnt + 1'b1;
      else
        bit_stuff_cnt <=#Tp 3'h1;
    end
end


// bit_stuff_cnt_tx
always @ (posedge clk or posedge rst)
begin
  if (rst)
    bit_stuff_cnt_tx <= 3'h1;
  else if (reset_mode)
    bit_stuff_cnt_tx <= 3'h1;
  else if (bit_de_stuff_reset)
    bit_stuff_cnt_tx <=#Tp 3'h1;
  else if (tx_point_q & bit_stuff_cnt_en)
    begin
      if (bit_stuff_cnt_tx == 3'h5)
        bit_stuff_cnt_tx <=#Tp 3'h1;
      else if (tx == tx_q)
        bit_stuff_cnt_tx <=#Tp bit_stuff_cnt_tx + 1'b1;
      else
        bit_stuff_cnt_tx <=#Tp 3'h1;
    end
end


assign bit_de_stuff = bit_stuff_cnt == 3'h5;
assign bit_de_stuff_tx = bit_stuff_cnt_tx == 3'h5;



// stuff_err
assign stuff_err = sample_point & bit_stuff_cnt_en & bit_de_stuff & (sampled_bit == sampled_bit_q);



// Generating delayed signals
always @ (posedge clk or posedge rst)
begin
  if (rst)
    begin
      reset_mode_q <=#Tp 1'b0;
      node_bus_off_q <=#Tp 1'b0;
    end
  else
    begin
      reset_mode_q <=#Tp reset_mode;
      node_bus_off_q <=#Tp node_bus_off;
    end
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    crc_enable <= 1'b0;
  else if (reset_mode | rst_crc_enable)
    crc_enable <=#Tp 1'b0;
  else if (go_crc_enable)
    crc_enable <=#Tp 1'b1;
end


// CRC error generation
always @ (posedge clk or posedge rst)
begin
  if (rst)
    crc_err <= 1'b0;
  else if (reset_mode | error_frame_ended)
    crc_err <=#Tp 1'b0;
  else if (go_rx_ack)
    crc_err <=#Tp crc_in != calculated_crc;
end


// Conditions for form error
assign form_err = sample_point & ( ((~bit_de_stuff) & rx_crc_lim & (~sampled_bit)                  ) |
                                   (                  rx_ack_lim & (~sampled_bit)                  ) |
                                   ((eof_cnt < 3'd6)& rx_eof     & (~sampled_bit) & (~transmitter) ) |
                                   (                & rx_eof     & (~sampled_bit) &   transmitter  )
                                 );


always @ (posedge clk or posedge rst)
begin
  if (rst)
    ack_err_latched <= 1'b0;
  else if (reset_mode | error_frame_ended | go_overload_frame)
    ack_err_latched <=#Tp 1'b0;
  else if (ack_err)
    ack_err_latched <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    bit_err_latched <= 1'b0;
  else if (reset_mode | error_frame_ended | go_overload_frame)
    bit_err_latched <=#Tp 1'b0;
  else if (bit_err)
    bit_err_latched <=#Tp 1'b1;
end



// Rule 5 (Fault confinement).
assign rule5 = bit_err &  ( (~node_error_passive) & error_frame    & (error_cnt1    < 3'd7)
                            | 
                                                    overload_frame & (overload_cnt1 < 3'd7)
                          );

// Rule 3 exception 1 - first part (Fault confinement).
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rule3_exc1_1 <= 1'b0;
  else if (reset_mode | error_flag_over | rule3_exc1_2)
    rule3_exc1_1 <=#Tp 1'b0;
  else if (transmitter & node_error_passive & ack_err)
    rule3_exc1_1 <=#Tp 1'b1;
end


// Rule 3 exception 1 - second part (Fault confinement).
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rule3_exc1_2 <= 1'b0;
  else if (reset_mode | go_error_frame | rule3_exc1_2)
    rule3_exc1_2 <=#Tp 1'b0;
  else if (rule3_exc1_1 & (error_cnt1 < 3'd7) & sample_point & (~sampled_bit))
    rule3_exc1_2 <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    stuff_err_latched <= 1'b0;
  else if (reset_mode | error_frame_ended | go_overload_frame)
    stuff_err_latched <=#Tp 1'b0;
  else if (stuff_err)
    stuff_err_latched <=#Tp 1'b1;
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    form_err_latched <= 1'b0;
  else if (reset_mode | error_frame_ended | go_overload_frame)
    form_err_latched <=#Tp 1'b0;
  else if (form_err)
    form_err_latched <=#Tp 1'b1;
end



// Instantiation of the RX CRC module
can_crc i_can_crc_rx 
(
  .clk(clk),
  .data(sampled_bit),
  .enable(crc_enable & sample_point & (~bit_de_stuff)),
  .initialize(go_crc_enable),
  .crc(calculated_crc)
);




assign no_byte0 = rtr1 | (data_len<4'h1);
assign no_byte1 = rtr1 | (data_len<4'h2);

can_acf i_can_acf
(
  .clk(clk),
  .rst(rst),
  
  .id(id),

  /* Mode register */
  .reset_mode(reset_mode),
  .acceptance_filter_mode(acceptance_filter_mode),

  // Clock Divider register
  .extended_mode(extended_mode),
  
  /* This section is for BASIC and EXTENDED mode */
  /* Acceptance code register */
  .acceptance_code_0(acceptance_code_0),

  /* Acceptance mask register */
  .acceptance_mask_0(acceptance_mask_0),
  /* End: This section is for BASIC and EXTENDED mode */
  
  /* This section is for EXTENDED mode */
  /* Acceptance code register */
  .acceptance_code_1(acceptance_code_1),
  .acceptance_code_2(acceptance_code_2),
  .acceptance_code_3(acceptance_code_3),

  /* Acceptance mask register */
  .acceptance_mask_1(acceptance_mask_1),
  .acceptance_mask_2(acceptance_mask_2),
  .acceptance_mask_3(acceptance_mask_3),
  /* End: This section is for EXTENDED mode */

  .go_rx_crc_lim(go_rx_crc_lim),
  .go_rx_inter(go_rx_inter),
  .go_error_frame(go_error_frame),
  
  .data0(tmp_fifo[0]),
  .data1(tmp_fifo[1]),
  .rtr1(rtr1),
  .rtr2(rtr2),
  .ide(ide),
  .no_byte0(no_byte0),
  .no_byte1(no_byte1),

  .id_ok(id_ok)

);




assign header_len[2:0] = extended_mode ? (ide? (3'h5) : (3'h3)) : 3'h2;
assign storing_header = header_cnt < header_len;
assign limited_data_len_minus1[3:0] = remote_rq? 4'hf : ((data_len < 4'h8)? (data_len -1'b1) : 4'h7);   // - 1 because counter counts from 0
assign reset_wr_fifo = (data_cnt == (limited_data_len_minus1 + {1'b0, header_len})) | reset_mode;

assign err = form_err | stuff_err | bit_err | ack_err | form_err_latched | stuff_err_latched | bit_err_latched | ack_err_latched | crc_err;



// Write enable signal for 64-byte rx fifo
always @ (posedge clk or posedge rst)
begin
  if (rst)
    wr_fifo <= 1'b0;
  else if (reset_wr_fifo)
    wr_fifo <=#Tp 1'b0;
  else if (go_rx_inter & id_ok & (~error_frame_ended) & ((~tx_state) | self_rx_request))
    wr_fifo <=#Tp 1'b1;
end


// Header counter. Header length depends on the mode of operation and frame format.
always @ (posedge clk or posedge rst)
begin
  if (rst)
    header_cnt <= 3'h0;
  else if (reset_wr_fifo)
    header_cnt <=#Tp 3'h0;
  else if (wr_fifo & storing_header)
    header_cnt <=#Tp header_cnt + 1'h1;
end


// Data counter. Length of the data is limited to 8 bytes.
always @ (posedge clk or posedge rst)
begin
  if (rst)
    data_cnt <= 4'h0;
  else if (reset_wr_fifo)
    data_cnt <=#Tp 4'h0;
  else if (wr_fifo)
    data_cnt <=#Tp data_cnt + 4'h1;
end


// Multiplexing data that is stored to 64-byte fifo depends on the mode of operation and frame format
always @ (extended_mode or ide or data_cnt or header_cnt or  header_len or 
          storing_header or id or rtr1 or rtr2 or data_len or
          tmp_fifo[0] or tmp_fifo[2] or tmp_fifo[4] or tmp_fifo[6] or 
          tmp_fifo[1] or tmp_fifo[3] or tmp_fifo[5] or tmp_fifo[7])
begin
  casex ({storing_header, extended_mode, ide, header_cnt}) /* synthesis parallel_case */ 
    6'b1_1_1_000  : data_for_fifo = {1'b1, rtr2, 2'h0, data_len};  // extended mode, extended format header
    6'b1_1_1_001  : data_for_fifo = id[28:21];                     // extended mode, extended format header
    6'b1_1_1_010  : data_for_fifo = id[20:13];                     // extended mode, extended format header
    6'b1_1_1_011  : data_for_fifo = id[12:5];                      // extended mode, extended format header
    6'b1_1_1_100  : data_for_fifo = {id[4:0], 3'h0};               // extended mode, extended format header
    6'b1_1_0_000  : data_for_fifo = {1'b0, rtr1, 2'h0, data_len};  // extended mode, standard format header
    6'b1_1_0_001  : data_for_fifo = id[10:3];                      // extended mode, standard format header
    6'b1_1_0_010  : data_for_fifo = {id[2:0], rtr1, 4'h0};         // extended mode, standard format header
    6'b1_0_x_000  : data_for_fifo = id[10:3];                      // normal mode                    header
    6'b1_0_x_001  : data_for_fifo = {id[2:0], rtr1, data_len};     // normal mode                    header
    default       : data_for_fifo = tmp_fifo[data_cnt - {1'b0, header_len}]; // data 
  endcase
end




// Instantiation of the RX fifo module
can_fifo i_can_fifo
( 
  .clk(clk),
  .rst(rst),

  .wr(wr_fifo),

  .data_in(data_for_fifo),
  .addr(addr[5:0]),
  .data_out(data_out),
  .fifo_selected(fifo_selected),

  .reset_mode(reset_mode),
  .release_buffer(release_buffer),
  .extended_mode(extended_mode),
  .overrun(overrun),
  .info_empty(info_empty),
  .info_cnt(rx_message_counter),

`ifdef CAN_BIST
  ,
  .mbist_si_i(mbist_si_i),
  .mbist_so_o(mbist_so_o),
  .mbist_ctrl_i(mbist_ctrl_i),
`endif

// port connections for Ram
  //64x8
  .q_dp_64x8(w_q_dp_64x8),
  .data_64x8(w_data_64x8),
  .wren_64x8(w_wren_64x8),
  .rden_64x8(w_rden_64x8),
  .wraddress_64x8(w_wraddress_64x8),
  .rdaddress_64x8(w_rdaddress_64x8),

  //64x4
  .q_dp_64x4(w_q_dp_64x4),
  .data_64x4(w_data_64x4),
  .wren_64x4x1(w_wren_64x4x1),
  .wraddress_64x4x1(w_wraddress_64x4x1),
  .rdaddress_64x4x1(w_rdaddress_64x4x1),

  //64x1

  .q_dp_64x1(w_q_dp_64x1),
  .data_64x1(w_data_64x1)  

);


// Transmitting error frame.
always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_frame <= 1'b0;
  else if (reset_mode | error_frame_ended | go_overload_frame)
    error_frame <=#Tp 1'b0;
  else if (go_error_frame)
    error_frame <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_cnt1 <= 3'd0;
  else if (reset_mode | error_frame_ended | go_error_frame | go_overload_frame)
    error_cnt1 <=#Tp 3'd0;
  else if (error_frame & tx_point & (error_cnt1 < 3'd7))
    error_cnt1 <=#Tp error_cnt1 + 1'b1;
end



assign error_flag_over = ((~node_error_passive) & sample_point & (error_cnt1 == 3'd7) | node_error_passive  & sample_point & (passive_cnt == 3'h6)) & (~enable_error_cnt2);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_flag_over_latched <= 1'b0;
  else if (reset_mode | error_frame_ended | go_error_frame | go_overload_frame)
    error_flag_over_latched <=#Tp 1'b0;
  else if (error_flag_over)
    error_flag_over_latched <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    enable_error_cnt2 <= 1'b0;
  else if (reset_mode | error_frame_ended | go_error_frame | go_overload_frame)
    enable_error_cnt2 <=#Tp 1'b0;
  else if (error_frame & (error_flag_over & sampled_bit))
    enable_error_cnt2 <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_cnt2 <= 3'd0;
  else if (reset_mode | error_frame_ended | go_error_frame | go_overload_frame)
    error_cnt2 <=#Tp 3'd0;
  else if (enable_error_cnt2 & tx_point)
    error_cnt2 <=#Tp error_cnt2 + 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    delayed_dominant_cnt <= 3'h0;
  else if (reset_mode | enable_error_cnt2 | go_error_frame | enable_overload_cnt2 | go_overload_frame)
    delayed_dominant_cnt <=#Tp 3'h0;
  else if (sample_point & (~sampled_bit) & ((error_cnt1 == 3'd7) | (overload_cnt1 == 3'd7)))
    delayed_dominant_cnt <=#Tp delayed_dominant_cnt + 1'b1;
end


// passive_cnt
always @ (posedge clk or posedge rst)
begin
  if (rst)
    passive_cnt <= 3'h1;
  else if (reset_mode | error_frame_ended | go_error_frame | go_overload_frame | first_compare_bit)
    passive_cnt <=#Tp 3'h1;
  else if (sample_point & (passive_cnt < 3'h6))
    begin
      if (error_frame & (~enable_error_cnt2) & (sampled_bit == sampled_bit_q))
        passive_cnt <=#Tp passive_cnt + 1'b1;
      else
        passive_cnt <=#Tp 3'h1;
    end
end


// When comparing 6 equal bits, first is always equal
always @ (posedge clk or posedge rst)
begin
  if (rst)
    first_compare_bit <= 1'b0;
  else if (go_error_frame)
    first_compare_bit <=#Tp 1'b1;
  else if (sample_point)
    first_compare_bit <= 1'b0;
end


// Transmitting overload frame.
always @ (posedge clk or posedge rst)
begin
  if (rst)
    overload_frame <= 1'b0;
  else if (reset_mode | overload_frame_ended | go_error_frame)
    overload_frame <=#Tp 1'b0;
  else if (go_overload_frame)
    overload_frame <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    overload_cnt1 <= 3'd0;
  else if (reset_mode | overload_frame_ended | go_error_frame | go_overload_frame)
    overload_cnt1 <=#Tp 3'd0;
  else if (overload_frame & tx_point & (overload_cnt1 < 3'd7))
    overload_cnt1 <=#Tp overload_cnt1 + 1'b1;
end


assign overload_flag_over = sample_point & (overload_cnt1 == 3'd7) & (~enable_overload_cnt2);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    enable_overload_cnt2 <= 1'b0;
  else if (reset_mode | overload_frame_ended | go_error_frame | go_overload_frame)
    enable_overload_cnt2 <=#Tp 1'b0;
  else if (overload_frame & (overload_flag_over & sampled_bit))
    enable_overload_cnt2 <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    overload_cnt2 <= 3'd0;
  else if (reset_mode | overload_frame_ended | go_error_frame | go_overload_frame)
    overload_cnt2 <=#Tp 3'd0;
  else if (enable_overload_cnt2 & tx_point)
    overload_cnt2 <=#Tp overload_cnt2 + 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    overload_request_cnt <= 2'b0;
  else if (reset_mode | go_error_frame | go_rx_id1)
    overload_request_cnt <=#Tp 2'b0;
  else if (overload_request & overload_frame)
    overload_request_cnt <=#Tp overload_request_cnt + 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    overload_frame_blocked <= 1'b0;
  else if (reset_mode | go_error_frame | go_rx_id1)
    overload_frame_blocked <=#Tp 1'b0;
  else if (overload_request & overload_frame & overload_request_cnt == 2'h2)   // This is a second sequential overload_request
    overload_frame_blocked <=#Tp 1'b1;
end


assign send_ack = (~tx_state) & rx_ack & (~err) & (~listen_only_mode);



always @ (reset_mode or node_bus_off or tx_state or go_tx or bit_de_stuff_tx or tx_bit or tx_q or
          send_ack or go_overload_frame or overload_frame or overload_cnt1 or
          go_error_frame or error_frame or error_cnt1 or node_error_passive)
begin
  if (reset_mode | node_bus_off)                                                // Reset or node_bus_off
    tx_next = 1'b1;
  else
    begin
      if (go_error_frame | error_frame)                                         // Transmitting error frame
        begin
          if (error_cnt1 < 3'd6)
            begin
              if (node_error_passive)
                tx_next = 1'b1;
              else
                tx_next = 1'b0;
            end
          else
            tx_next = 1'b1;
        end
      else if (go_overload_frame | overload_frame)                              // Transmitting overload frame
        begin
          if (overload_cnt1 < 3'd6)
            tx_next = 1'b0;
          else
            tx_next = 1'b1;
        end
      else if (go_tx | tx_state)                                                        // Transmitting message
        tx_next = ((~bit_de_stuff_tx) & tx_bit) | (bit_de_stuff_tx & (~tx_q));
      else if (send_ack)                                                        // Acknowledge
        tx_next = 1'b0;
      else
        tx_next = 1'b1;
    end
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx <= 1'b1;
  else if (reset_mode)
    tx <= 1'b1;
  else if (tx_point)
    tx <=#Tp tx_next;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_q <=#Tp 1'b0;
  else if (reset_mode)
    tx_q <=#Tp 1'b0;
  else if (tx_point)
    tx_q <=#Tp tx & (~go_early_tx_latched);
end


/* Delayed tx point */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_point_q <=#Tp 1'b0;
  else if (reset_mode)
    tx_point_q <=#Tp 1'b0;
  else
    tx_point_q <=#Tp tx_point;
end


/* Changing bit order from [7:0] to [0:7] */
can_ibo i_ibo_tx_data_0  (.di(tx_data_0),  .do(r_tx_data_0));
can_ibo i_ibo_tx_data_1  (.di(tx_data_1),  .do(r_tx_data_1));
can_ibo i_ibo_tx_data_2  (.di(tx_data_2),  .do(r_tx_data_2));
can_ibo i_ibo_tx_data_3  (.di(tx_data_3),  .do(r_tx_data_3));
can_ibo i_ibo_tx_data_4  (.di(tx_data_4),  .do(r_tx_data_4));
can_ibo i_ibo_tx_data_5  (.di(tx_data_5),  .do(r_tx_data_5));
can_ibo i_ibo_tx_data_6  (.di(tx_data_6),  .do(r_tx_data_6));
can_ibo i_ibo_tx_data_7  (.di(tx_data_7),  .do(r_tx_data_7));
can_ibo i_ibo_tx_data_8  (.di(tx_data_8),  .do(r_tx_data_8));
can_ibo i_ibo_tx_data_9  (.di(tx_data_9),  .do(r_tx_data_9));
can_ibo i_ibo_tx_data_10 (.di(tx_data_10), .do(r_tx_data_10));
can_ibo i_ibo_tx_data_11 (.di(tx_data_11), .do(r_tx_data_11));
can_ibo i_ibo_tx_data_12 (.di(tx_data_12), .do(r_tx_data_12));

/* Changing bit order from [14:0] to [0:14] */
can_ibo i_calculated_crc0 (.di(calculated_crc[14:7]), .do(r_calculated_crc[7:0]));
can_ibo i_calculated_crc1 (.di({calculated_crc[6:0], 1'b0}), .do(r_calculated_crc[15:8]));


assign basic_chain = {r_tx_data_1[7:4], 2'h0, r_tx_data_1[3:0], r_tx_data_0[7:0], 1'b0};
assign basic_chain_data = {r_tx_data_9, r_tx_data_8, r_tx_data_7, r_tx_data_6, r_tx_data_5, r_tx_data_4, r_tx_data_3, r_tx_data_2};
assign extended_chain_std = {r_tx_data_0[7:4], 2'h0, r_tx_data_0[1], r_tx_data_2[2:0], r_tx_data_1[7:0], 1'b0};
assign extended_chain_ext = {r_tx_data_0[7:4], 2'h0, r_tx_data_0[1], r_tx_data_4[4:0], r_tx_data_3[7:0], r_tx_data_2[7:3], 1'b1, 1'b1, r_tx_data_2[2:0], r_tx_data_1[7:0], 1'b0};
assign extended_chain_data_std = {r_tx_data_10, r_tx_data_9, r_tx_data_8, r_tx_data_7, r_tx_data_6, r_tx_data_5, r_tx_data_4, r_tx_data_3};
assign extended_chain_data_ext = {r_tx_data_12, r_tx_data_11, r_tx_data_10, r_tx_data_9, r_tx_data_8, r_tx_data_7, r_tx_data_6, r_tx_data_5};

always @ (extended_mode or rx_data or tx_pointer or extended_chain_data_std or extended_chain_data_ext or rx_crc or r_calculated_crc or
          r_tx_data_0   or extended_chain_ext or extended_chain_std or basic_chain_data or basic_chain or
          finish_msg)
begin
  if (extended_mode)
    begin
      if (rx_data)  // data stage
        if (r_tx_data_0[0])    // Extended frame
          tx_bit = extended_chain_data_ext[tx_pointer];
        else
          tx_bit = extended_chain_data_std[tx_pointer];
      else if (rx_crc)
        tx_bit = r_calculated_crc[tx_pointer];
      else if (finish_msg)
        tx_bit = 1'b1;
      else
        begin
          if (r_tx_data_0[0])    // Extended frame
            tx_bit = extended_chain_ext[tx_pointer];
          else
            tx_bit = extended_chain_std[tx_pointer];
        end
    end
  else  // Basic mode
    begin
      if (rx_data)  // data stage
        tx_bit = basic_chain_data[tx_pointer];
      else if (rx_crc)
        tx_bit = r_calculated_crc[tx_pointer];
      else if (finish_msg)
        tx_bit = 1'b1;
      else
        tx_bit = basic_chain[tx_pointer];
    end
end


assign limited_tx_cnt_ext = tx_data_0[3] ? 6'h3f : ((tx_data_0[2:0] <<3) - 1'b1);
assign limited_tx_cnt_std = tx_data_1[3] ? 6'h3f : ((tx_data_1[2:0] <<3) - 1'b1);

assign rst_tx_pointer = ((~bit_de_stuff_tx) & tx_point & (~rx_data) &   extended_mode  &   r_tx_data_0[0]   & tx_pointer == 6'd38             ) |   // arbitration + control for extended format
                        ((~bit_de_stuff_tx) & tx_point & (~rx_data) &   extended_mode  & (~r_tx_data_0[0])  & tx_pointer == 6'd18             ) |   // arbitration + control for extended format
                        ((~bit_de_stuff_tx) & tx_point & (~rx_data) & (~extended_mode)                      & tx_pointer == 6'd18             ) |   // arbitration + control for standard format
                        ((~bit_de_stuff_tx) & tx_point &   rx_data  &   extended_mode                       & tx_pointer == limited_tx_cnt_ext) |   // data       (overflow is OK here)
                        ((~bit_de_stuff_tx) & tx_point &   rx_data  & (~extended_mode)                      & tx_pointer == limited_tx_cnt_std) |   // data       (overflow is OK here)
                        (                     tx_point &   rx_crc_lim                                                                         ) |   // crc
                        (go_rx_idle                                                                                                           ) |   // at the end
                        (reset_mode                                                                                                           ) |
                        (overload_frame                                                                                                       ) |
                        (error_frame                                                                                                          ) ;

always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_pointer <= 6'h0;
  else if (rst_tx_pointer)
    tx_pointer <=#Tp 6'h0;
  else if (go_early_tx | (tx_point & (tx_state | go_tx) & (~bit_de_stuff_tx)))
    tx_pointer <=#Tp tx_pointer + 1'b1;
end


assign tx_successful = transmitter & go_rx_inter & (~go_error_frame) & (~error_frame_ended) & (~overload_frame_ended) & (~arbitration_lost);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    need_to_tx <= 1'b0;
  else if (tx_successful | reset_mode | (abort_tx & (~transmitting)) | ((~tx_state) & tx_state_q & single_shot_transmission))
    need_to_tx <=#Tp 1'h0;
  else if (tx_request & sample_point)
    need_to_tx <=#Tp 1'b1;
end



assign go_early_tx = (~listen_only_mode) & need_to_tx & (~tx_state) & (~suspend | (susp_cnt == 3'h7)) & sample_point & (~sampled_bit) & (rx_idle | last_bit_of_inter);
assign go_tx       = (~listen_only_mode) & need_to_tx & (~tx_state) & (~suspend | (sample_point & (susp_cnt == 3'h7))) & (go_early_tx | rx_idle);

// go_early_tx latched (for proper bit_de_stuff generation)
always @ (posedge clk or posedge rst)
begin
  if (rst)
    go_early_tx_latched <= 1'b0;
  else if (reset_mode || tx_point)
    go_early_tx_latched <=#Tp 1'b0;
  else if (go_early_tx)
    go_early_tx_latched <=#Tp 1'b1;
end



// Tx state
always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_state <= 1'b0;
  else if (reset_mode | go_rx_inter | error_frame | arbitration_lost)
    tx_state <=#Tp 1'b0;
  else if (go_tx)
    tx_state <=#Tp 1'b1;
end

always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_state_q <=#Tp 1'b0;
  else if (reset_mode)
    tx_state_q <=#Tp 1'b0;
  else
    tx_state_q <=#Tp tx_state;
end



// Node is a transmitter
always @ (posedge clk or posedge rst)
begin
  if (rst)
    transmitter <= 1'b0;
  else if (go_tx)
    transmitter <=#Tp 1'b1;
  else if (reset_mode | go_rx_idle | suspend & go_rx_id1)
    transmitter <=#Tp 1'b0;
end
 


// Signal "transmitting" signals that the core is a transmitting (message, error frame or overload frame). No synchronization is done meanwhile.
// Node might be both transmitter or receiver (sending error or overload frame)
always @ (posedge clk or posedge rst)
begin
  if (rst)
    transmitting <= 1'b0;
  else if (go_error_frame | go_overload_frame | go_tx | send_ack)
    transmitting <=#Tp 1'b1;
  else if (reset_mode | go_rx_idle | (go_rx_id1 & (~tx_state)) | (arbitration_lost & tx_state))
    transmitting <=#Tp 1'b0;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    suspend <= 1'b0;
  else if (reset_mode | (sample_point & (susp_cnt == 3'h7)))
    suspend <=#Tp 1'b0;
  else if (not_first_bit_of_inter & transmitter & node_error_passive)
    suspend <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    susp_cnt_en <= 1'b0;
  else if (reset_mode | (sample_point & (susp_cnt == 3'h7)))
    susp_cnt_en <=#Tp 1'b0;
  else if (suspend & sample_point & last_bit_of_inter)
    susp_cnt_en <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    susp_cnt <= 3'h0;
  else if (reset_mode | (sample_point & (susp_cnt == 3'h7)))
    susp_cnt <=#Tp 3'h0;
  else if (susp_cnt_en & sample_point)
    susp_cnt <=#Tp susp_cnt + 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    finish_msg <= 1'b0;
  else if (go_rx_idle | go_rx_id1 | error_frame | reset_mode)
    finish_msg <=#Tp 1'b0;
  else if (go_rx_crc_lim)
    finish_msg <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    arbitration_lost <= 1'b0;
  else if (go_rx_idle | error_frame_ended | reset_mode)
    arbitration_lost <=#Tp 1'b0;
  else if (transmitter & sample_point & tx & arbitration_field & ~sampled_bit)
    arbitration_lost <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    begin
      arbitration_lost_q <=#Tp 1'b0;
      read_arbitration_lost_capture_reg_q <=#Tp 1'b0;
    end
  else if (reset_mode)
    begin
      arbitration_lost_q <=#Tp 1'b0;
      read_arbitration_lost_capture_reg_q <=#Tp 1'b0;
    end
  else
    begin
      arbitration_lost_q <=#Tp arbitration_lost;
      read_arbitration_lost_capture_reg_q <=#Tp read_arbitration_lost_capture_reg;
    end
end


assign set_arbitration_lost_irq = arbitration_lost & (~arbitration_lost_q) & (~arbitration_blocked);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    arbitration_cnt_en <= 1'b0;
  else if (reset_mode || arbitration_blocked)
    arbitration_cnt_en <=#Tp 1'b0;
  else if (rx_id1 & sample_point & (~arbitration_blocked))
    arbitration_cnt_en <=#Tp 1'b1;
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    arbitration_blocked <= 1'b0;
  else if (reset_mode || read_arbitration_lost_capture_reg)
    arbitration_blocked <=#Tp 1'b0;
  else if (set_arbitration_lost_irq)
    arbitration_blocked <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    arbitration_lost_capture <= 5'h0;
  else if (read_arbitration_lost_capture_reg_q)
    arbitration_lost_capture <=#Tp 5'h0;
  else if (sample_point & (~arbitration_blocked) & arbitration_cnt_en & (~bit_de_stuff))
    arbitration_lost_capture <=#Tp arbitration_lost_capture + 1'b1;
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    rx_err_cnt <= 9'h0;
  else if (we_rx_err_cnt & (~node_bus_off))
    rx_err_cnt <=#Tp {1'b0, data_in};
  else if (set_reset_mode)
    rx_err_cnt <=#Tp 9'h0;
  else
    begin
      if ((~listen_only_mode) & (~transmitter | arbitration_lost))
        begin
          if (go_rx_ack_lim & (~go_error_frame) & (~crc_err) & (rx_err_cnt > 9'h0))
            begin
              if (rx_err_cnt > 9'd127)
                rx_err_cnt <=#Tp 9'd127;
              else
                rx_err_cnt <=#Tp rx_err_cnt - 1'b1;
            end
          else if (rx_err_cnt < 9'd128)
            begin
              if (go_error_frame & (~rule5))                                                                                          // 1  (rule 5 is just the opposite then rule 1 exception
                rx_err_cnt <=#Tp rx_err_cnt + 1'b1;
              else if ( (error_flag_over & (~error_flag_over_latched) & sample_point & (~sampled_bit) & (error_cnt1 == 3'd7)     ) |  // 2
                        (go_error_frame & rule5                                                                                  ) |  // 5
                        (sample_point & (~sampled_bit) & (delayed_dominant_cnt == 3'h7)                            )                  // 6
                      )
                rx_err_cnt <=#Tp rx_err_cnt + 4'h8;
            end
        end
    end
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_err_cnt <= 9'h0;
  else if (we_tx_err_cnt)
    tx_err_cnt <=#Tp {1'b0, data_in};
  else
    begin
      if (set_reset_mode)
        tx_err_cnt <=#Tp 9'd128;
      else if ((tx_err_cnt > 9'd0) & (tx_successful | bus_free))
        tx_err_cnt <=#Tp tx_err_cnt - 1'h1;
      else if (transmitter & (~arbitration_lost))
        begin
          if ( (sample_point & (~sampled_bit) & (delayed_dominant_cnt == 3'h7)                                          ) |       // 6
               (go_error_frame & rule5                                                                                  ) |       // 4  (rule 5 is the same as rule 4)
               (go_error_frame & (~(transmitter & node_error_passive & ack_err)) & (~(transmitter & stuff_err & 
                arbitration_field & sample_point & tx & (~sampled_bit)))                                                ) |       // 3 
               (error_frame & rule3_exc1_2                                                                              )         // 3
             )
            tx_err_cnt <=#Tp tx_err_cnt + 4'h8;
        end
    end
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    node_error_passive <= 1'b0;
  else if ((rx_err_cnt < 128) & (tx_err_cnt < 9'd128))
    node_error_passive <=#Tp 1'b0;
  else if (((rx_err_cnt >= 128) | (tx_err_cnt >= 9'd128)) & (error_frame_ended | go_error_frame | (~reset_mode) & reset_mode_q) & (~node_bus_off))
    node_error_passive <=#Tp 1'b1;
end


assign node_error_active = ~(node_error_passive | node_bus_off);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    node_bus_off <= 1'b0;
  else if ((rx_err_cnt == 9'h0) & (tx_err_cnt == 9'd0) & (~reset_mode) | (we_tx_err_cnt & (data_in < 8'd255)))
    node_bus_off <=#Tp 1'b0;
  else if ((tx_err_cnt >= 9'd256) | (we_tx_err_cnt & (data_in == 8'd255)))
    node_bus_off <=#Tp 1'b1;
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    bus_free_cnt <= 4'h0;
  else if (reset_mode)
    bus_free_cnt <=#Tp 4'h0;
  else if (sample_point)
    begin
      if (sampled_bit & bus_free_cnt_en & (bus_free_cnt < 4'd10))
        bus_free_cnt <=#Tp bus_free_cnt + 1'b1;
      else
        bus_free_cnt <=#Tp 4'h0;
    end
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    bus_free_cnt_en <= 1'b0;
  else if ((~reset_mode) & reset_mode_q | node_bus_off_q & (~reset_mode))
    bus_free_cnt_en <=#Tp 1'b1;
  else if (sample_point & sampled_bit & (bus_free_cnt==4'd10) & (~node_bus_off))
    bus_free_cnt_en <=#Tp 1'b0;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    bus_free <= 1'b0;
  else if (reset_mode)
    bus_free <= 1'b0;
  else if (sample_point & sampled_bit & (bus_free_cnt==4'd10))
    bus_free <=#Tp 1'b1;
  else
    bus_free <=#Tp 1'b0;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    waiting_for_bus_free <= 1'b1;
  else if (reset_mode)
    waiting_for_bus_free <= 1'b1;
  else if (bus_free & (~node_bus_off))
    waiting_for_bus_free <=#Tp 1'b0;
  else if ((~reset_mode) & reset_mode_q | node_bus_off_q & (~reset_mode))
    waiting_for_bus_free <=#Tp 1'b1;
end


assign bus_off_on = ~node_bus_off;

assign set_reset_mode = node_bus_off & (~node_bus_off_q);
assign error_status = extended_mode? ((rx_err_cnt >= error_warning_limit) | (tx_err_cnt >= error_warning_limit))    :
                                     ((rx_err_cnt >= 9'd96) | (tx_err_cnt >= 9'd96))                                ;

assign transmit_status = transmitting  || (extended_mode && waiting_for_bus_free);
assign receive_status  = extended_mode ? (waiting_for_bus_free || (!rx_idle) && (!transmitting)) : 
                                         ((!waiting_for_bus_free) && (!rx_idle) && (!transmitting));

/* Error code capture register */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_capture_code <= 8'h0;
  else if (read_error_code_capture_reg)
    error_capture_code <=#Tp 8'h0;
  else if (set_bus_error_irq)
    error_capture_code <=#Tp {error_capture_code_type[7:6], error_capture_code_direction, error_capture_code_segment[4:0]};
end



assign error_capture_code_segment[0] = rx_idle | rx_ide | (rx_id2 & (bit_cnt<6'd13)) | rx_r1 | rx_r0 | rx_dlc | rx_ack | rx_ack_lim | error_frame & node_error_active;
assign error_capture_code_segment[1] = rx_idle | rx_id1 | rx_id2 | rx_dlc | rx_data | rx_ack_lim | rx_eof | rx_inter | error_frame & node_error_passive;
assign error_capture_code_segment[2] = (rx_id1 & (bit_cnt>6'd7)) | rx_rtr1 | rx_ide | rx_id2 | rx_rtr2 | rx_r1 | error_frame & node_error_passive | overload_frame;
assign error_capture_code_segment[3] = (rx_id2 & (bit_cnt>6'd4)) | rx_rtr2 | rx_r1 | rx_r0 | rx_dlc | rx_data | rx_crc | rx_crc_lim | rx_ack | rx_ack_lim | rx_eof | overload_frame;
assign error_capture_code_segment[4] = rx_crc_lim | rx_ack | rx_ack_lim | rx_eof | rx_inter | error_frame | overload_frame;
assign error_capture_code_direction  = ~transmitting;


always @ (bit_err or form_err or stuff_err)
begin
  if (bit_err)
    error_capture_code_type[7:6] = 2'b00;
  else if (form_err)
    error_capture_code_type[7:6] = 2'b01;
  else if (stuff_err)
    error_capture_code_type[7:6] = 2'b10;
  else
    error_capture_code_type[7:6] = 2'b11;
end


assign set_bus_error_irq = go_error_frame & (~error_capture_code_blocked);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_capture_code_blocked <= 1'b0;
  else if (read_error_code_capture_reg)
    error_capture_code_blocked <=#Tp 1'b0;
  else if (set_bus_error_irq)
    error_capture_code_blocked <=#Tp 1'b1;
end


endmodule




//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_btl.v                                                   ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_btl.v,v $
// Revision 1.30  2004/10/27 18:51:37  igorm
// Fixed synchronization problem in real hardware when 0xf is used for TSEG1.
//
// Revision 1.29  2004/05/12 15:58:41  igorm
// Core improved to pass all tests with the Bosch VHDL Reference system.
//
// Revision 1.28  2004/02/08 14:25:26  mohor
// Header changed.
//
// Revision 1.27  2003/09/30 00:55:13  mohor
// Error counters fixed to be compatible with Bosch VHDL reference model.
// Small synchronization changes.
//
// Revision 1.26  2003/09/25 18:55:49  mohor
// Synchronization changed, error counters fixed.
//
// Revision 1.25  2003/07/16 13:40:35  mohor
// Fixed according to the linter.
//
// Revision 1.24  2003/07/10 15:32:28  mohor
// Unused signal removed.
//
// Revision 1.23  2003/07/10 01:59:04  tadejm
// Synchronization fixed. In some strange cases it didn't work according to
// the VHDL reference model.
//
// Revision 1.22  2003/07/07 11:21:37  mohor
// Little fixes (to fix warnings).
//
// Revision 1.21  2003/07/03 09:32:20  mohor
// Synchronization changed.
//
// Revision 1.20  2003/06/20 14:51:11  mohor
// Previous change removed. When resynchronization occurs we go to seg1
// stage. sync stage does not cause another start of seg1 stage.
//
// Revision 1.19  2003/06/20 14:28:20  mohor
// When hard_sync or resync occure we need to go to seg1 segment. Going to
// sync segment is in that case blocked.
//
// Revision 1.18  2003/06/17 15:53:33  mohor
// clk_cnt reduced from [8:0] to [6:0].
//
// Revision 1.17  2003/06/17 14:32:17  mohor
// Removed few signals.
//
// Revision 1.16  2003/06/16 13:57:58  mohor
// tx_point generated one clk earlier. rx_i registered. Data corrected when
// using extended mode.
//
// Revision 1.15  2003/06/13 15:02:24  mohor
// Synchronization is also needed when transmitting a message.
//
// Revision 1.14  2003/06/13 14:55:11  mohor
// Counters width changed.
//
// Revision 1.13  2003/06/11 14:21:35  mohor
// When switching to tx, sync stage is overjumped.
//
// Revision 1.12  2003/02/14 20:17:01  mohor
// Several registers added. Not finished, yet.
//
// Revision 1.11  2003/02/09 18:40:29  mohor
// Overload fixed. Hard synchronization also enabled at the last bit of
// interframe.
//
// Revision 1.10  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.9  2003/01/31 01:13:38  mohor
// backup.
//
// Revision 1.8  2003/01/10 17:51:34  mohor
// Temporary version (backup).
//
// Revision 1.7  2003/01/08 02:10:53  mohor
// Acceptance filter added.
//
// Revision 1.6  2002/12/28 04:13:23  mohor
// Backup version.
//
// Revision 1.5  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.4  2002/12/26 01:33:05  mohor
// Tripple sampling supported.
//
// Revision 1.3  2002/12/25 23:44:16  mohor
// Commented lines removed.
//
// Revision 1.2  2002/12/25 14:17:00  mohor
// Synchronization working.
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_btl
( 
  clk,
  rst,
  rx,
  tx,

  /* Bus Timing 0 register */
  baud_r_presc,
  sync_jump_width,

  /* Bus Timing 1 register */
  time_segment1,
  time_segment2,
  triple_sampling,

  /* Output signals from this module */
  sample_point,
  sampled_bit,
  sampled_bit_q,
  tx_point,
  hard_sync,
  
  /* Output from can_bsp module */
  rx_idle,
  rx_inter,
  transmitting,
  transmitter,
  go_rx_inter,
  tx_next,

  go_overload_frame,
  go_error_frame,
  go_tx,
  send_ack,
  node_error_passive
);

parameter Tp = 1;

input         clk;
input         rst;
input         rx;
input         tx;


/* Bus Timing 0 register */
input   [5:0] baud_r_presc;
input   [1:0] sync_jump_width;

/* Bus Timing 1 register */
input   [3:0] time_segment1;
input   [2:0] time_segment2;
input         triple_sampling;

/* Output from can_bsp module */
input         rx_idle;
input         rx_inter;
input         transmitting;
input         transmitter;
input         go_rx_inter;
input         tx_next;

input         go_overload_frame;
input         go_error_frame;
input         go_tx;
input         send_ack;
input         node_error_passive;

/* Output signals from this module */
output        sample_point;
output        sampled_bit;
output        sampled_bit_q;
output        tx_point;
output        hard_sync;

reg     [6:0] clk_cnt;
reg           clk_en;
reg           clk_en_q;
reg           sync_blocked;
reg           hard_sync_blocked;
reg           sampled_bit;
reg           sampled_bit_q;
reg     [4:0] quant_cnt;
reg     [3:0] delay;
reg           sync;
reg           seg1;
reg           seg2;
reg           resync_latched;
reg           sample_point;
reg     [1:0] sample;
reg           tx_point;
reg           tx_next_sp;

wire          go_sync;
wire          go_seg1;
wire          go_seg2;
wire [7:0]    preset_cnt;
wire          sync_window;
wire          resync;


assign preset_cnt = (baud_r_presc + 1'b1)<<1;        // (BRP+1)*2
assign hard_sync  =   (rx_idle | rx_inter)    & (~rx) & sampled_bit & (~hard_sync_blocked);  // Hard synchronization
assign resync     =  (~rx_idle) & (~rx_inter) & (~rx) & sampled_bit & (~sync_blocked);       // Re-synchronization



/* Generating general enable signal that defines baud rate. */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    clk_cnt <= 7'h0;
  else if (clk_cnt >= (preset_cnt-1'b1))
    clk_cnt <=#Tp 7'h0;
  else
    clk_cnt <=#Tp clk_cnt + 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    clk_en  <= 1'b0;
  else if ({1'b0, clk_cnt} == (preset_cnt-1'b1))
    clk_en  <=#Tp 1'b1;
  else
    clk_en  <=#Tp 1'b0;
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    clk_en_q  <= 1'b0;
  else
    clk_en_q  <=#Tp clk_en;
end



/* Changing states */
assign go_sync = clk_en_q & seg2 & (quant_cnt[2:0] == time_segment2) & (~hard_sync) & (~resync);
assign go_seg1 = clk_en_q & (sync | hard_sync | (resync & seg2 & sync_window) | (resync_latched & sync_window));
assign go_seg2 = clk_en_q & (seg1 & (~hard_sync) & (quant_cnt == (time_segment1 + delay)));



always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_point <= 1'b0;
  else
    tx_point <=#Tp ~tx_point & seg2 & (  clk_en & (quant_cnt[2:0] == time_segment2)
                                       | (clk_en | clk_en_q) & (resync | hard_sync)
                                      );    // When transmitter we should transmit as soon as possible.
end



/* When early edge is detected outside of the SJW field, synchronization request is latched and performed when
   SJW is reached */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    resync_latched <= 1'b0;
  else if (resync & seg2 & (~sync_window))
    resync_latched <=#Tp 1'b1;
  else if (go_seg1)
    resync_latched <= 1'b0;
end



/* Synchronization stage/segment */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    sync <= 1'b0;
  else if (clk_en_q)
    sync <=#Tp go_sync;
end


/* Seg1 stage/segment (together with propagation segment which is 1 quant long) */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    seg1 <= 1'b1;
  else if (go_seg1)
    seg1 <=#Tp 1'b1;
  else if (go_seg2)
    seg1 <=#Tp 1'b0;
end


/* Seg2 stage/segment */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    seg2 <= 1'b0;
  else if (go_seg2)
    seg2 <=#Tp 1'b1;
  else if (go_sync | go_seg1)
    seg2 <=#Tp 1'b0;
end


/* Quant counter */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    quant_cnt <= 5'h0;
  else if (go_sync | go_seg1 | go_seg2)
    quant_cnt <=#Tp 5'h0;
  else if (clk_en_q)
    quant_cnt <=#Tp quant_cnt + 1'b1;
end


/* When late edge is detected (in seg1 stage), stage seg1 is prolonged. */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    delay <= 4'h0;
  else if (resync & seg1 & (~transmitting | transmitting & (tx_next_sp | (tx & (~rx)))))  // when transmitting 0 with positive error delay is set to 0
    delay <=#Tp (quant_cnt > {3'h0, sync_jump_width})? ({2'h0, sync_jump_width} + 1'b1) : (quant_cnt + 1'b1);
  else if (go_sync | go_seg1)
    delay <=#Tp 4'h0;
end


// If early edge appears within this window (in seg2 stage), phase error is fully compensated
assign sync_window = ((time_segment2 - quant_cnt[2:0]) < ( sync_jump_width + 1'b1));


// Sampling data (memorizing two samples all the time).
always @ (posedge clk or posedge rst)
begin
  if (rst)
    sample <= 2'b11;
  else if (clk_en_q)
    sample <= {sample[0], rx};
end


// When enabled, tripple sampling is done here.
always @ (posedge clk or posedge rst)
begin
  if (rst)
    begin
      sampled_bit <= 1'b1;
      sampled_bit_q <= 1'b1;
      sample_point <= 1'b0;
    end
  else if (go_error_frame)
    begin
      sampled_bit_q <=#Tp sampled_bit;
      sample_point <=#Tp 1'b0;
    end
  else if (clk_en_q & (~hard_sync))
    begin
      if (seg1 & (quant_cnt == (time_segment1 + delay)))
        begin
          sample_point <=#Tp 1'b1;
          sampled_bit_q <=#Tp sampled_bit;
          if (triple_sampling)
            sampled_bit <=#Tp (sample[0] & sample[1]) | ( sample[0] & rx) | (sample[1] & rx);
          else
            sampled_bit <=#Tp rx;
        end
    end
  else
    sample_point <=#Tp 1'b0;
end


// tx_next_sp shows next value that will be driven on the TX. When driving 1 and receiving 0 we
// need to synchronize (even when we are a transmitter)
always @ (posedge clk or posedge rst)
begin
  if (rst)
    tx_next_sp <= 1'b0;
  else if (go_overload_frame | (go_error_frame & (~node_error_passive)) | go_tx | send_ack)
    tx_next_sp <=#Tp 1'b0;
  else if (go_error_frame & node_error_passive)
    tx_next_sp <=#Tp 1'b1;
  else if (sample_point)
    tx_next_sp <=#Tp tx_next;
end



/* Blocking synchronization (can occur only once in a bit time) */

always @ (posedge clk or posedge rst)
begin
  if (rst)
    sync_blocked <=#Tp 1'b1;
  else if (clk_en_q)
    begin
      if (resync)
        sync_blocked <=#Tp 1'b1;
      else if (go_seg2)
        sync_blocked <=#Tp 1'b0;
    end
end


/* Blocking hard synchronization when occurs once or when we are transmitting a msg */
always @ (posedge clk or posedge rst)
begin
  if (rst)
    hard_sync_blocked <=#Tp 1'b0;
  else if (hard_sync & clk_en_q | (transmitting & transmitter | go_tx) & tx_point & (~tx_next))
    hard_sync_blocked <=#Tp 1'b1;
  else if (go_rx_inter | (rx_idle | rx_inter) & sample_point & sampled_bit)  // When a glitch performed synchronization
    hard_sync_blocked <=#Tp 1'b0;
end





endmodule






//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_crc.v                                                   ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_crc.v,v $
// Revision 1.5  2004/02/08 14:25:57  mohor
// Header changed.
//
// Revision 1.4  2003/07/16 13:16:51  mohor
// Fixed according to the linter.
//
// Revision 1.3  2003/02/10 16:02:11  mohor
// CAN is working according to the specification. WB interface and more
// registers (status, IRQ, ...) needs to be added.
//
// Revision 1.2  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.1  2003/01/08 02:10:54  mohor
// Acceptance filter added.
//
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_crc (clk, data, enable, initialize, crc);


parameter Tp = 1;

input         clk;
input         data;
input         enable;
input         initialize;

output [14:0] crc;

reg    [14:0] crc;

wire          crc_next;
wire   [14:0] crc_tmp;


assign crc_next = data ^ crc[14];
assign crc_tmp = {crc[13:0], 1'b0};

always @ (posedge clk)
begin
  if(initialize)
    crc <= #Tp 15'h0;
  else if (enable)
    begin
      if (crc_next)
        crc <= #Tp crc_tmp ^ 15'h4599;
      else
        crc <= #Tp crc_tmp;
    end    
end


endmodule




//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_fifo.v                                                  ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_fifo.v,v $
// Revision 1.27  2004/11/18 12:39:34  igorm
// Fixes for compatibility after the SW reset.
//
// Revision 1.26  2004/02/08 14:30:57  mohor
// Header changed.
//
// Revision 1.25  2003/10/23 16:52:17  mohor
// Active high/low problem when Altera devices are used. Bug fixed by
// Rojhalat Ibrahim.
//
// Revision 1.24  2003/10/17 05:55:20  markom
// mbist signals updated according to newest convention
//
// Revision 1.23  2003/09/05 12:46:41  mohor
// ALTERA_RAM supported.
//
// Revision 1.22  2003/08/20 09:59:16  mohor
// Artisan RAM fixed (when not using BIST).
//
// Revision 1.21  2003/08/14 16:04:52  simons
// Artisan ram instances added.
//
// Revision 1.20  2003/07/16 14:00:45  mohor
// Fixed according to the linter.
//
// Revision 1.19  2003/07/03 09:30:44  mohor
// PCI_BIST replaced with CAN_BIST.
//
// Revision 1.18  2003/06/27 22:14:23  simons
// Overrun fifo implemented with FFs, because it is not possible to create such a memory.
//
// Revision 1.17  2003/06/27 20:56:15  simons
// Virtual silicon ram instances added.
//
// Revision 1.16  2003/06/18 23:03:44  mohor
// Typo fixed.
//
// Revision 1.15  2003/06/11 09:37:05  mohor
// overrun and length_info fifos are initialized at the end of reset.
//
// Revision 1.14  2003/03/05 15:02:30  mohor
// Xilinx RAM added.
//
// Revision 1.13  2003/03/01 22:53:33  mohor
// Actel APA ram supported.
//
// Revision 1.12  2003/02/19 14:44:03  mohor
// CAN core finished. Host interface added. Registers finished.
// Synchronization to the wishbone finished.
//
// Revision 1.11  2003/02/14 20:17:01  mohor
// Several registers added. Not finished, yet.
//
// Revision 1.10  2003/02/11 00:56:06  mohor
// Wishbone interface added.
//
// Revision 1.9  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.8  2003/01/31 01:13:38  mohor
// backup.
//
// Revision 1.7  2003/01/17 17:44:31  mohor
// Fifo corrected to be synthesizable.
//
// Revision 1.6  2003/01/15 13:16:47  mohor
// When a frame with "remote request" is received, no data is stored
// to fifo, just the frame information (identifier, ...). Data length
// that is stored is the received data length and not the actual data
// length that is stored to fifo.
//
// Revision 1.5  2003/01/14 17:25:09  mohor
// Addresses corrected to decimal values (previously hex).
//
// Revision 1.4  2003/01/14 12:19:35  mohor
// rx_fifo is now working.
//
// Revision 1.3  2003/01/09 21:54:45  mohor
// rx fifo added. Not 100 % verified, yet.
//
// Revision 1.2  2003/01/09 14:46:58  mohor
// Temporary files (backup).
//
// Revision 1.1  2003/01/08 02:10:55  mohor
// Acceptance filter added.
//
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_fifo
( 
  clk,
  rst,

  wr,

  data_in,
  addr,
  data_out,
  fifo_selected,

  reset_mode,
  release_buffer,
  extended_mode,
  overrun,
  info_empty,
  info_cnt,

`ifdef CAN_BIST
  ,
  mbist_si_i,
  mbist_so_o,
  mbist_ctrl_i,
`endif

  // ---- Signals for ram
  
  // port connections for Ram
  //64x8
  q_dp_64x8,
  data_64x8,
  wren_64x8,
  rden_64x8,
  wraddress_64x8,
  rdaddress_64x8,

  //64x4
  q_dp_64x4,
  data_64x4,
  wren_64x4x1,
  wraddress_64x4x1,
  rdaddress_64x4x1,

  //64x1

  q_dp_64x1,
  data_64x1 
);

parameter Tp = 1;

input         clk;
input         rst;
input         wr;
input   [7:0] data_in;
input   [5:0] addr;
input         reset_mode;
input         release_buffer;
input         extended_mode;
input         fifo_selected;

output  [7:0] data_out;
output        overrun;
output        info_empty;
output  [6:0] info_cnt;

`ifdef CAN_BIST
input         mbist_si_i;
output        mbist_so_o;
input [`CAN_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;       // bist chain shift control
wire          mbist_s_0;
`endif

//------------------------------------------------
  // port connections for Ram
  //64x8
  input [7:0] q_dp_64x8;
  output[7:0] data_64x8;
  output      wren_64x8;
  output      rden_64x8;
  output[5:0] wraddress_64x8;
  output[5:0] rdaddress_64x8;

  //64x4
  input [3:0] q_dp_64x4;
  output[3:0] data_64x4;
  output      wren_64x4x1;
  output[5:0] wraddress_64x4x1;
  output[5:0] rdaddress_64x4x1;

  //64x1

  input[0:0]  q_dp_64x1;
  output[0:0] data_64x1;  


//------------------------------------------------


`ifdef ALTERA_RAM
`else
`ifdef ACTEL_APA_RAM
`else
`ifdef XILINX_RAM
`else
`ifdef ARTISAN_RAM
  reg           overrun_info[0:63];
`else
`ifdef VIRTUALSILICON_RAM
  reg           overrun_info[0:63];
`else
  reg     [7:0] fifo [0:63];
  reg     [3:0] length_fifo[0:63];
  reg           overrun_info[0:63];
`endif
`endif
`endif
`endif
`endif

reg     [5:0] rd_pointer;
reg     [5:0] wr_pointer;
reg     [5:0] read_address;
reg     [5:0] wr_info_pointer;
reg     [5:0] rd_info_pointer;
reg           wr_q;
reg     [3:0] len_cnt;
reg     [6:0] fifo_cnt;
reg     [6:0] info_cnt;
reg           latch_overrun;
reg           initialize_memories;

wire    [3:0] length_info;
wire          write_length_info;
wire          fifo_empty;
wire          fifo_full;
wire          info_full;

assign write_length_info = (~wr) & wr_q;

// Delayed write signal
always @ (posedge clk or posedge rst)
begin
  if (rst)
    wr_q <=#Tp 1'b0;
  else if (reset_mode)
    wr_q <=#Tp 1'b0;
  else
    wr_q <=#Tp wr;
end


// length counter
always @ (posedge clk or posedge rst)
begin
  if (rst)
    len_cnt <= 4'h0;
  else if (reset_mode | write_length_info)
    len_cnt <=#Tp 4'h0;
  else if (wr & (~fifo_full))
    len_cnt <=#Tp len_cnt + 1'b1;
end


// wr_info_pointer
always @ (posedge clk or posedge rst)
begin
  if (rst)
    wr_info_pointer <= 6'h0;
  else if (write_length_info & (~info_full) | initialize_memories)
    wr_info_pointer <=#Tp wr_info_pointer + 1'b1;
  else if (reset_mode)
    wr_info_pointer <=#Tp rd_info_pointer;
end



// rd_info_pointer
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rd_info_pointer <= 6'h0;
  else if (release_buffer & (~fifo_empty))
    rd_info_pointer <=#Tp rd_info_pointer + 1'b1;
end


// rd_pointer
always @ (posedge clk or posedge rst)
begin
  if (rst)
    rd_pointer <= 5'h0;
  else if (release_buffer & (~fifo_empty))
    rd_pointer <=#Tp rd_pointer + {2'h0, length_info};
end


// wr_pointer
always @ (posedge clk or posedge rst)
begin
  if (rst)
    wr_pointer <= 5'h0;
  else if (reset_mode)
    wr_pointer <=#Tp rd_pointer;
  else if (wr & (~fifo_full))
    wr_pointer <=#Tp wr_pointer + 1'b1;
end


// latch_overrun
always @ (posedge clk or posedge rst)
begin
  if (rst)
    latch_overrun <= 1'b0;
  else if (reset_mode | write_length_info)
    latch_overrun <=#Tp 1'b0;
  else if (wr & fifo_full)
    latch_overrun <=#Tp 1'b1;
end


// Counting data in fifo
always @ (posedge clk or posedge rst)
begin
  if (rst)
    fifo_cnt <= 7'h0;
  else if (reset_mode)
    fifo_cnt <=#Tp 7'h0;
  else if (wr & (~release_buffer) & (~fifo_full))
    fifo_cnt <=#Tp fifo_cnt + 1'b1;
  else if ((~wr) & release_buffer & (~fifo_empty))
    fifo_cnt <=#Tp fifo_cnt - {3'h0, length_info};
  else if (wr & release_buffer & (~fifo_full) & (~fifo_empty))
    fifo_cnt <=#Tp fifo_cnt - {3'h0, length_info} + 1'b1;
end

assign fifo_full = fifo_cnt == 7'd64;
assign fifo_empty = fifo_cnt == 7'd0;


// Counting data in length_fifo and overrun_info fifo
always @ (posedge clk or posedge rst)
begin
  if (rst)
    info_cnt <=#Tp 7'h0;
  else if (reset_mode)
    info_cnt <=#Tp 7'h0;
  else if (write_length_info ^ release_buffer)
    begin
      if (release_buffer & (~info_empty))
        info_cnt <=#Tp info_cnt - 1'b1;
      else if (write_length_info & (~info_full))
        info_cnt <=#Tp info_cnt + 1'b1;
    end
end
        
assign info_full = info_cnt == 7'd64;
assign info_empty = info_cnt == 7'd0;


// Selecting which address will be used for reading data from rx fifo
always @ (extended_mode or rd_pointer or addr)
begin
  if (extended_mode)      // extended mode
    read_address = rd_pointer + (addr - 6'd16);
  else                    // normal mode
    read_address = rd_pointer + (addr - 6'd20);
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    initialize_memories <= 1'b1;
  else if (&wr_info_pointer)
    initialize_memories <=#Tp 1'b0;
end


`ifdef INFERRAM
  // port connections for Ram
  //64x8
assign data_out  	= q_dp_64x8;
assign data_64x8 	= data_in;
assign wren_64x8 	= wr & (~fifo_full);
assign rden_64x8  	= fifo_selected;
assign wraddress_64x8 = wr_pointer;
assign rdaddress_64x8 = read_address;

  //64x4
assign length_info 		= q_dp_64x4;
assign data_64x4 		= (len_cnt & {4{~initialize_memories}});
assign wren_64x4x1 		= (write_length_info & (~info_full) | initialize_memories);
assign wraddress_64x4x1 	= wr_info_pointer;
assign rdaddress_64x4x1 	= rd_info_pointer;

  //64x1

assign overrun 	= q_dp_64x1;
assign data_64x1 	= ((latch_overrun | (wr & fifo_full)) & (~initialize_memories)); 

// `ifdef ALTERA_RAM
// //  altera_ram_64x8_sync fifo
//   lpm_ram_dp fifo
//   (
//     .q         (data_out),
//     .rdclock   (clk),
//     .wrclock   (clk),
//     .data      (data_in),
//     .wren      (wr & (~fifo_full)),
//     .rden      (fifo_selected),
//     .wraddress (wr_pointer),
//     .rdaddress (read_address)
//   );
//   defparam fifo.lpm_width = 8;
//   defparam fifo.lpm_widthad = 6;
//   defparam fifo.lpm_numwords = 64;
// 
// 
// //  altera_ram_64x4_sync info_fifo
//   lpm_ram_dp info_fifo
//   (
//     .q         (length_info),
//     .rdclock   (clk),
//     .wrclock   (clk),
//     .data      (len_cnt & {4{~initialize_memories}}),
//     .wren      (write_length_info & (~info_full) | initialize_memories),
//     .wraddress (wr_info_pointer),
//     .rdaddress (rd_info_pointer)
//   );
//   defparam info_fifo.lpm_width = 4;
//   defparam info_fifo.lpm_widthad = 6;
//   defparam info_fifo.lpm_numwords = 64;
// 
// 
// //  altera_ram_64x1_sync overrun_fifo
//   lpm_ram_dp overrun_fifo
//   (
//     .q         (overrun),
//     .rdclock   (clk),
//     .wrclock   (clk),
//     .data      ((latch_overrun | (wr & fifo_full)) & (~initialize_memories)),
//     .wren      (write_length_info & (~info_full) | initialize_memories),
//     .wraddress (wr_info_pointer),
//     .rdaddress (rd_info_pointer)
//   );
//   defparam overrun_fifo.lpm_width = 1;
//   defparam overrun_fifo.lpm_widthad = 6;
//   defparam overrun_fifo.lpm_numwords = 64;

`else
`ifdef ACTEL_APA_RAM
  actel_ram_64x8_sync fifo
  (
    .DO      (data_out),
    .RCLOCK  (clk),
    .WCLOCK  (clk),
    .DI      (data_in),
    .PO      (),                       // parity not used
    .WRB     (~(wr & (~fifo_full))),
    .RDB     (~fifo_selected),
    .WADDR   (wr_pointer),
    .RADDR   (read_address)
  );


  actel_ram_64x4_sync info_fifo
  (
    .DO      (length_info),
    .RCLOCK  (clk),
    .WCLOCK  (clk),
    .DI      (len_cnt & {4{~initialize_memories}}),
    .PO      (),                       // parity not used
    .WRB     (~(write_length_info & (~info_full) | initialize_memories)),
    .RDB     (1'b0),                   // always enabled
    .WADDR   (wr_info_pointer),
    .RADDR   (rd_info_pointer)
  );


  actel_ram_64x1_sync overrun_fifo
  (
    .DO      (overrun),
    .RCLOCK  (clk),
    .WCLOCK  (clk),
    .DI      ((latch_overrun | (wr & fifo_full)) & (~initialize_memories)),
    .PO      (),                       // parity not used
    .WRB     (~(write_length_info & (~info_full) | initialize_memories)),
    .RDB     (1'b0),                   // always enabled
    .WADDR   (wr_info_pointer),
    .RADDR   (rd_info_pointer)
  );
`else
`ifdef XILINX_RAM

  RAMB4_S8_S8 fifo
  (
    .DOA(),
    .DOB(data_out),
    .ADDRA({3'h0, wr_pointer}),
    .CLKA(clk),
    .DIA(data_in),
    .ENA(1'b1),
    .RSTA(1'b0),
    .WEA(wr & (~fifo_full)),
    .ADDRB({3'h0, read_address}),
    .CLKB(clk),
    .DIB(8'h0),
    .ENB(1'b1),
    .RSTB(1'b0),
    .WEB(1'b0)
  );


  RAMB4_S4_S4 info_fifo
  (
    .DOA(),
    .DOB(length_info),
    .ADDRA({4'h0, wr_info_pointer}),
    .CLKA(clk),
    .DIA(len_cnt & {4{~initialize_memories}}),
    .ENA(1'b1),
    .RSTA(1'b0),
    .WEA(write_length_info & (~info_full) | initialize_memories),
    .ADDRB({4'h0, rd_info_pointer}),
    .CLKB(clk),
    .DIB(4'h0),
    .ENB(1'b1),
    .RSTB(1'b0),
    .WEB(1'b0)
  );


  RAMB4_S1_S1 overrun_fifo
  (
    .DOA(),
    .DOB(overrun),
    .ADDRA({6'h0, wr_info_pointer}),
    .CLKA(clk),
    .DIA((latch_overrun | (wr & fifo_full)) & (~initialize_memories)),
    .ENA(1'b1),
    .RSTA(1'b0),
    .WEA(write_length_info & (~info_full) | initialize_memories),
    .ADDRB({6'h0, rd_info_pointer}),
    .CLKB(clk),
    .DIB(1'h0),
    .ENB(1'b1),
    .RSTB(1'b0),
    .WEB(1'b0)
  );


`else
`ifdef VIRTUALSILICON_RAM

`ifdef CAN_BIST
    vs_hdtp_64x8_bist fifo
`else
    vs_hdtp_64x8 fifo
`endif
    (
        .RCK        (clk),
        .WCK        (clk),
        .RADR       (read_address),
        .WADR       (wr_pointer),
        .DI         (data_in),
        .DOUT       (data_out),
        .REN        (~fifo_selected),
        .WEN        (~(wr & (~fifo_full)))
    `ifdef CAN_BIST
        ,
        // debug chain signals
        .mbist_si_i   (mbist_si_i),
        .mbist_so_o   (mbist_s_0),
        .mbist_ctrl_i   (mbist_ctrl_i)
    `endif
    );

`ifdef CAN_BIST
    vs_hdtp_64x4_bist info_fifo
`else
    vs_hdtp_64x4 info_fifo
`endif
    (
        .RCK        (clk),
        .WCK        (clk),
        .RADR       (rd_info_pointer),
        .WADR       (wr_info_pointer),
        .DI         (len_cnt & {4{~initialize_memories}}),
        .DOUT       (length_info),
        .REN        (1'b0),
        .WEN        (~(write_length_info & (~info_full) | initialize_memories))
    `ifdef CAN_BIST
        ,
        // debug chain signals
        .mbist_si_i   (mbist_s_0),
        .mbist_so_o   (mbist_so_o),
        .mbist_ctrl_i   (mbist_ctrl_i)
    `endif
    );

    // overrun_info
    always @ (posedge clk)
    begin
      if (write_length_info & (~info_full) | initialize_memories)
        overrun_info[wr_info_pointer] <=#Tp (latch_overrun | (wr & fifo_full)) & (~initialize_memories);
    end
    
    
    // reading overrun
    assign overrun = overrun_info[rd_info_pointer];

`else
`ifdef ARTISAN_RAM

`ifdef CAN_BIST
    art_hstp_64x8_bist fifo
    (
        .CLKR       (clk),
        .CLKW       (clk),
        .AR         (read_address),
        .AW         (wr_pointer),
        .D          (data_in),
        .Q          (data_out),
        .REN        (~fifo_selected),
        .WEN        (~(wr & (~fifo_full))),
        .mbist_si_i   (mbist_si_i),
        .mbist_so_o   (mbist_s_0),
        .mbist_ctrl_i   (mbist_ctrl_i)
    );
    art_hstp_64x4_bist info_fifo
    (
        .CLKR       (clk),
        .CLKW       (clk),
        .AR         (rd_info_pointer),
        .AW         (wr_info_pointer),
        .D          (len_cnt & {4{~initialize_memories}}),
        .Q          (length_info),
        .REN        (1'b0),
        .WEN        (~(write_length_info & (~info_full) | initialize_memories)),
        .mbist_si_i   (mbist_s_0),
        .mbist_so_o   (mbist_so_o),
        .mbist_ctrl_i   (mbist_ctrl_i)
    );
`else
    art_hsdp_64x8 fifo
    (
        .CENA       (1'b0),
        .CENB       (1'b0),
        .CLKA       (clk),
        .CLKB       (clk),
        .AA         (read_address),
        .AB         (wr_pointer),
        .DA         (8'h00),
        .DB         (data_in),
        .QA         (data_out),
        .QB         (),
        .OENA       (~fifo_selected),
        .OENB       (1'b1),
        .WENA       (1'b1),
        .WENB       (~(wr & (~fifo_full)))
    );
    art_hsdp_64x4 info_fifo
    (
        .CENA       (1'b0),
        .CENB       (1'b0),
        .CLKA       (clk),
        .CLKB       (clk),
        .AA         (rd_info_pointer),
        .AB         (wr_info_pointer),
        .DA         (4'h0),
        .DB         (len_cnt & {4{~initialize_memories}}),
        .QA         (length_info),
        .QB         (),
        .OENA       (1'b0),
        .OENB       (1'b1),
        .WENA       (1'b1),
        .WENB       (~(write_length_info & (~info_full) | initialize_memories))
    );
`endif

    // overrun_info
    always @ (posedge clk)
    begin
      if (write_length_info & (~info_full) | initialize_memories)
        overrun_info[wr_info_pointer] <=#Tp (latch_overrun | (wr & fifo_full)) & (~initialize_memories);
    end
    
    
    // reading overrun
    assign overrun = overrun_info[rd_info_pointer];

`else
  // writing data to fifo
  always @ (posedge clk)
  begin
    if (wr & (~fifo_full))
      fifo[wr_pointer] <=#Tp data_in;
  end

  // reading from fifo
  assign data_out = fifo[read_address];


  // writing length_fifo
  always @ (posedge clk)
  begin
    if (write_length_info & (~info_full) | initialize_memories)
      length_fifo[wr_info_pointer] <=#Tp len_cnt & {4{~initialize_memories}};
  end


  // reading length_fifo
  assign length_info = length_fifo[rd_info_pointer];

  // overrun_info
  always @ (posedge clk)
  begin
    if (write_length_info & (~info_full) | initialize_memories)
      overrun_info[wr_info_pointer] <=#Tp (latch_overrun | (wr & fifo_full)) & (~initialize_memories);
  end
  
  
  // reading overrun
  assign overrun = overrun_info[rd_info_pointer];


`endif
`endif
`endif
`endif
`endif





endmodule






//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_ibo.v                                                   ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_ibo.v,v $
// Revision 1.3  2004/02/08 14:31:44  mohor
// Header changed.
//
// Revision 1.2  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.1  2003/02/04 14:34:52  mohor
// *** empty log message ***
//
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

// This module only inverts bit order
module can_ibo
( 
  di,
  do
);

input   [7:0] di;
output  [7:0] do;

assign do[0] = di[7];
assign do[1] = di[6];
assign do[2] = di[5];
assign do[3] = di[4];
assign do[4] = di[3];
assign do[5] = di[2];
assign do[6] = di[1];
assign do[7] = di[0];

endmodule




//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_register.v                                              ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_register.v,v $
// Revision 1.7  2004/02/08 14:32:31  mohor
// Header changed.
//
// Revision 1.6  2003/03/20 16:58:50  mohor
// unix.
//
// Revision 1.4  2003/03/11 16:32:34  mohor
// timescale.v is used for simulation only.
//
// Revision 1.3  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.2  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on


module can_register
( data_in,
  data_out,
  we,
  clk
);

parameter WIDTH = 8; // default parameter of the register width

input [WIDTH-1:0] data_in;
input             we;
input             clk;

output [WIDTH-1:0] data_out;
reg    [WIDTH-1:0] data_out;



always @ (posedge clk)
begin
  if (we)                        // write
    data_out<=#1 data_in;
end



endmodule




//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_register_asyn.v                                         ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_register_asyn.v,v $
// Revision 1.7  2004/02/08 14:33:19  mohor
// Header changed.
//
// Revision 1.6  2003/03/20 16:58:50  mohor
// unix.
//
// Revision 1.4  2003/03/11 16:32:34  mohor
// timescale.v is used for simulation only.
//
// Revision 1.3  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.2  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on


module can_register_asyn
( data_in,
  data_out,
  we,
  clk,
  rst
);

parameter WIDTH = 8; // default parameter of the register width
parameter RESET_VALUE = 0;

input [WIDTH-1:0] data_in;
input             we;
input             clk;
input             rst;

output [WIDTH-1:0] data_out;
reg    [WIDTH-1:0] data_out;



always @ (posedge clk or posedge rst)
begin
  if (rst)                            // asynchronous reset
    data_out<=#1 RESET_VALUE;
  else if (we)                        // write
    data_out<=#1 data_in;
end



endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_register_asyn_syn.v                                     ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_register_asyn_syn.v,v $
// Revision 1.7  2004/02/08 14:33:59  mohor
// Header changed.
//
// Revision 1.6  2003/03/20 16:52:43  mohor
// unix.
//
// Revision 1.4  2003/03/11 16:32:34  mohor
// timescale.v is used for simulation only.
//
// Revision 1.3  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.2  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_register_asyn_syn
( data_in,
  data_out,
  we,
  clk,
  rst,
  rst_sync
);

parameter WIDTH = 8; // default parameter of the register width
parameter RESET_VALUE = 0;

input [WIDTH-1:0] data_in;
input             we;
input             clk;
input             rst;
input             rst_sync;

output [WIDTH-1:0] data_out;
reg    [WIDTH-1:0] data_out;



always @ (posedge clk or posedge rst)
begin
  if(rst)
    data_out<=#1 RESET_VALUE;
  else if (rst_sync)                  // synchronous reset
    data_out<=#1 RESET_VALUE;
  else if (we)                        // write
    data_out<=#1 data_in;
end



endmodule




//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_register_syn.v                                          ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003, 2004 Authors                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_register_syn.v,v $
// Revision 1.5  2004/02/08 14:34:40  mohor
// Header changed.
//
// Revision 1.4  2003/03/11 16:31:58  mohor
// timescale.v is used for simulation only.
//
// Revision 1.3  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.2  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on


module can_register_syn
( data_in,
  data_out,
  we,
  clk,
  rst_sync
);

parameter WIDTH = 8; // default parameter of the register width
parameter RESET_VALUE = 0;

input [WIDTH-1:0] data_in;
input             we;
input             clk;
input             rst_sync;

output [WIDTH-1:0] data_out;
reg    [WIDTH-1:0] data_out;



always @ (posedge clk)
begin
  if (rst_sync)                       // synchronous reset
    data_out<=#1 RESET_VALUE;
  else if (we)                        // write
    data_out<=#1 data_in;
end



endmodule




//////////////////////////////////////////////////////////////////////
////                                                              ////
////  can_registers.v                                             ////
////                                                              ////
////                                                              ////
////  This file is part of the CAN Protocol Controller            ////
////  http://www.opencores.org/projects/can/                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Igor Mohor                                             ////
////       igorm@opencores.org                                    ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002, 2003 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The CAN protocol is developed by Robert Bosch GmbH and       ////
//// protected by patents. Anybody who wants to implement this    ////
//// CAN IP core on silicon has to obtain a CAN protocol license  ////
//// from Bosch.                                                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: can_registers.v,v $
// Revision 1.34  2004/11/18 12:39:43  igorm
// Fixes for compatibility after the SW reset.
//
// Revision 1.33  2004/10/25 11:44:38  igorm
// Interrupt is always cleared for one clock after the irq register is read.
// This fixes problems when CPU is using IRQs that are edge triggered.
//
// Revision 1.32  2004/05/12 15:58:41  igorm
// Core improved to pass all tests with the Bosch VHDL Reference system.
//
// Revision 1.31  2003/09/25 18:55:49  mohor
// Synchronization changed, error counters fixed.
//
// Revision 1.30  2003/07/16 15:19:34  mohor
// Fixed according to the linter.
// Case statement for data_out joined.
//
// Revision 1.29  2003/07/10 01:59:04  tadejm
// Synchronization fixed. In some strange cases it didn't work according to
// the VHDL reference model.
//
// Revision 1.28  2003/07/07 11:21:37  mohor
// Little fixes (to fix warnings).
//
// Revision 1.27  2003/06/22 09:43:03  mohor
// synthesi full_case parallel_case fixed.
//
// Revision 1.26  2003/06/22 01:33:14  mohor
// clkout is clk/2 after the reset.
//
// Revision 1.25  2003/06/21 12:16:30  mohor
// paralel_case and full_case compiler directives added to case statements.
//
// Revision 1.24  2003/06/09 11:22:54  mohor
// data_out is already registered in the can_top.v file.
//
// Revision 1.23  2003/04/15 15:31:24  mohor
// Some features are supported in extended mode only (listen_only_mode...).
//
// Revision 1.22  2003/03/20 16:58:50  mohor
// unix.
//
// Revision 1.20  2003/03/11 16:31:05  mohor
// Mux used for clkout to avoid "gated clocks warning".
//
// Revision 1.19  2003/03/10 17:34:25  mohor
// Doubled declarations removed.
//
// Revision 1.18  2003/03/01 22:52:11  mohor
// Data is latched on read.
//
// Revision 1.17  2003/02/19 15:09:02  mohor
// Incomplete sensitivity list fixed.
//
// Revision 1.16  2003/02/19 14:44:03  mohor
// CAN core finished. Host interface added. Registers finished.
// Synchronization to the wishbone finished.
//
// Revision 1.15  2003/02/18 00:10:15  mohor
// Most of the registers added. Registers "arbitration lost capture", "error code
// capture" + few more still need to be added.
//
// Revision 1.14  2003/02/14 20:17:01  mohor
// Several registers added. Not finished, yet.
//
// Revision 1.13  2003/02/12 14:25:30  mohor
// abort_tx added.
//
// Revision 1.12  2003/02/11 00:56:06  mohor
// Wishbone interface added.
//
// Revision 1.11  2003/02/09 02:24:33  mohor
// Bosch license warning added. Error counters finished. Overload frames
// still need to be fixed.
//
// Revision 1.10  2003/01/31 01:13:38  mohor
// backup.
//
// Revision 1.9  2003/01/15 13:16:48  mohor
// When a frame with "remote request" is received, no data is stored
// to fifo, just the frame information (identifier, ...). Data length
// that is stored is the received data length and not the actual data
// length that is stored to fifo.
//
// Revision 1.8  2003/01/14 17:25:09  mohor
// Addresses corrected to decimal values (previously hex).
//
// Revision 1.7  2003/01/14 12:19:35  mohor
// rx_fifo is now working.
//
// Revision 1.6  2003/01/10 17:51:34  mohor
// Temporary version (backup).
//
// Revision 1.5  2003/01/09 14:46:58  mohor
// Temporary files (backup).
//
// Revision 1.4  2003/01/08 02:10:55  mohor
// Acceptance filter added.
//
// Revision 1.3  2002/12/27 00:12:52  mohor
// Header changed, testbench improved to send a frame (crc still missing).
//
// Revision 1.2  2002/12/26 16:00:34  mohor
// Testbench define file added. Clock divider register added.
//
// Revision 1.1.1.1  2002/12/20 16:39:21  mohor
// Initial
//
//
//

// synopsys translate_off
//`include "can_defines.v"
`timescale 1ns/10ps
// synopsys translate_on

module can_registers
( 
  clk,
  rst,
  cs,
  we,
  addr,
  data_in,
  data_out,
  irq_n,

  sample_point,
  transmitting,
  set_reset_mode,
  node_bus_off,
  error_status,
  rx_err_cnt,
  tx_err_cnt,
  transmit_status,
  receive_status,
  tx_successful,
  need_to_tx,
  overrun,
  info_empty,
  set_bus_error_irq,
  set_arbitration_lost_irq,
  arbitration_lost_capture,
  node_error_passive,
  node_error_active,
  rx_message_counter,


  /* Mode register */
  reset_mode,
  listen_only_mode,
  acceptance_filter_mode,
  self_test_mode,


  /* Command register */
  clear_data_overrun,
  release_buffer,
  abort_tx,
  tx_request,
  self_rx_request,
  single_shot_transmission,
  tx_state,
  tx_state_q,
  overload_request,
  overload_frame,

  /* Arbitration Lost Capture Register */
  read_arbitration_lost_capture_reg,

  /* Error Code Capture Register */
  read_error_code_capture_reg,
  error_capture_code,

  /* Bus Timing 0 register */
  baud_r_presc,
  sync_jump_width,

  /* Bus Timing 1 register */
  time_segment1,
  time_segment2,
  triple_sampling,
  
  /* Error Warning Limit register */
  error_warning_limit,

  /* Rx Error Counter register */
  we_rx_err_cnt,

  /* Tx Error Counter register */
  we_tx_err_cnt,

  /* Clock Divider register */
  extended_mode,
  clkout,
  
  
  /* This section is for BASIC and EXTENDED mode */
  /* Acceptance code register */
  acceptance_code_0,

  /* Acceptance mask register */
  acceptance_mask_0,
  /* End: This section is for BASIC and EXTENDED mode */
  
  /* This section is for EXTENDED mode */
  /* Acceptance code register */
  acceptance_code_1,
  acceptance_code_2,
  acceptance_code_3,

  /* Acceptance mask register */
  acceptance_mask_1,
  acceptance_mask_2,
  acceptance_mask_3,
  /* End: This section is for EXTENDED mode */
  
  /* Tx data registers. Holding identifier (basic mode), tx frame information (extended mode) and data */
  tx_data_0,
  tx_data_1,
  tx_data_2,
  tx_data_3,
  tx_data_4,
  tx_data_5,
  tx_data_6,
  tx_data_7,
  tx_data_8,
  tx_data_9,
  tx_data_10,
  tx_data_11,
  tx_data_12
  /* End: Tx data registers */
  
  


);

parameter Tp = 1;

input         clk;
input         rst;
input         cs;
input         we;
input   [7:0] addr;
input   [7:0] data_in;

output  [7:0] data_out;
reg     [7:0] data_out;

output        irq_n;

input         sample_point;
input         transmitting;
input         set_reset_mode;
input         node_bus_off;
input         error_status;
input   [7:0] rx_err_cnt;
input   [7:0] tx_err_cnt;
input         transmit_status;
input         receive_status;
input         tx_successful;
input         need_to_tx;
input         overrun;
input         info_empty;
input         set_bus_error_irq;
input         set_arbitration_lost_irq;
input   [4:0] arbitration_lost_capture;
input         node_error_passive;
input         node_error_active;
input   [6:0] rx_message_counter;



/* Mode register */
output        reset_mode;
output        listen_only_mode;
output        acceptance_filter_mode;
output        self_test_mode;

/* Command register */
output        clear_data_overrun;
output        release_buffer;
output        abort_tx;
output        tx_request;
output        self_rx_request;
output        single_shot_transmission;
input         tx_state;
input         tx_state_q;
output        overload_request;
input         overload_frame;


/* Arbitration Lost Capture Register */
output        read_arbitration_lost_capture_reg;

/* Error Code Capture Register */
output        read_error_code_capture_reg;
input   [7:0] error_capture_code;

/* Bus Timing 0 register */
output  [5:0] baud_r_presc;
output  [1:0] sync_jump_width;


/* Bus Timing 1 register */
output  [3:0] time_segment1;
output  [2:0] time_segment2;
output        triple_sampling;

/* Error Warning Limit register */
output  [7:0] error_warning_limit;

/* Rx Error Counter register */
output        we_rx_err_cnt;

/* Tx Error Counter register */
output        we_tx_err_cnt;

/* Clock Divider register */
output        extended_mode;
output        clkout;


/* This section is for BASIC and EXTENDED mode */
/* Acceptance code register */
output  [7:0] acceptance_code_0;

/* Acceptance mask register */
output  [7:0] acceptance_mask_0;

/* End: This section is for BASIC and EXTENDED mode */


/* This section is for EXTENDED mode */
/* Acceptance code register */
output  [7:0] acceptance_code_1;
output  [7:0] acceptance_code_2;
output  [7:0] acceptance_code_3;

/* Acceptance mask register */
output  [7:0] acceptance_mask_1;
output  [7:0] acceptance_mask_2;
output  [7:0] acceptance_mask_3;

/* End: This section is for EXTENDED mode */

/* Tx data registers. Holding identifier (basic mode), tx frame information (extended mode) and data */
output  [7:0] tx_data_0;
output  [7:0] tx_data_1;
output  [7:0] tx_data_2;
output  [7:0] tx_data_3;
output  [7:0] tx_data_4;
output  [7:0] tx_data_5;
output  [7:0] tx_data_6;
output  [7:0] tx_data_7;
output  [7:0] tx_data_8;
output  [7:0] tx_data_9;
output  [7:0] tx_data_10;
output  [7:0] tx_data_11;
output  [7:0] tx_data_12;
/* End: Tx data registers */


reg           tx_successful_q;
reg           overrun_q;
reg           overrun_status;
reg           transmission_complete;
reg           transmit_buffer_status_q;
reg           receive_buffer_status;
reg           error_status_q;
reg           node_bus_off_q;
reg           node_error_passive_q;
reg           transmit_buffer_status;
reg           single_shot_transmission;
reg           self_rx_request;
reg           irq_n;

// Some interrupts exist in basic mode and in extended mode. Since they are in different registers they need to be multiplexed.
wire          data_overrun_irq_en;
wire          error_warning_irq_en;
wire          transmit_irq_en;
wire          receive_irq_en;

wire    [7:0] irq_reg;
wire          irq;

wire we_mode                  = cs & we & (addr == 8'd0);
wire we_command               = cs & we & (addr == 8'd1);
wire we_bus_timing_0          = cs & we & (addr == 8'd6) & reset_mode;
wire we_bus_timing_1          = cs & we & (addr == 8'd7) & reset_mode;
wire we_clock_divider_low     = cs & we & (addr == 8'd31);
wire we_clock_divider_hi      = we_clock_divider_low & reset_mode;

wire read = cs & (~we);
wire read_irq_reg = read & (addr == 8'd3);
assign read_arbitration_lost_capture_reg = read & extended_mode & (addr == 8'd11);
assign read_error_code_capture_reg = read & extended_mode & (addr == 8'd12);

/* This section is for BASIC and EXTENDED mode */
wire we_acceptance_code_0       = cs & we &   reset_mode  & ((~extended_mode) & (addr == 8'd4)  | extended_mode & (addr == 8'd16));
wire we_acceptance_mask_0       = cs & we &   reset_mode  & ((~extended_mode) & (addr == 8'd5)  | extended_mode & (addr == 8'd20));
wire we_tx_data_0               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd10) | extended_mode & (addr == 8'd16)) & transmit_buffer_status;
wire we_tx_data_1               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd11) | extended_mode & (addr == 8'd17)) & transmit_buffer_status;
wire we_tx_data_2               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd12) | extended_mode & (addr == 8'd18)) & transmit_buffer_status;
wire we_tx_data_3               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd13) | extended_mode & (addr == 8'd19)) & transmit_buffer_status;
wire we_tx_data_4               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd14) | extended_mode & (addr == 8'd20)) & transmit_buffer_status;
wire we_tx_data_5               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd15) | extended_mode & (addr == 8'd21)) & transmit_buffer_status;
wire we_tx_data_6               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd16) | extended_mode & (addr == 8'd22)) & transmit_buffer_status;
wire we_tx_data_7               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd17) | extended_mode & (addr == 8'd23)) & transmit_buffer_status;
wire we_tx_data_8               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd18) | extended_mode & (addr == 8'd24)) & transmit_buffer_status;
wire we_tx_data_9               = cs & we & (~reset_mode) & ((~extended_mode) & (addr == 8'd19) | extended_mode & (addr == 8'd25)) & transmit_buffer_status;
wire we_tx_data_10              = cs & we & (~reset_mode) & (                                     extended_mode & (addr == 8'd26)) & transmit_buffer_status;
wire we_tx_data_11              = cs & we & (~reset_mode) & (                                     extended_mode & (addr == 8'd27)) & transmit_buffer_status;
wire we_tx_data_12              = cs & we & (~reset_mode) & (                                     extended_mode & (addr == 8'd28)) & transmit_buffer_status;
/* End: This section is for BASIC and EXTENDED mode */


/* This section is for EXTENDED mode */
wire   we_interrupt_enable      = cs & we & (addr == 8'd4)  & extended_mode;
wire   we_error_warning_limit   = cs & we & (addr == 8'd13) & reset_mode & extended_mode;
assign we_rx_err_cnt            = cs & we & (addr == 8'd14) & reset_mode & extended_mode;
assign we_tx_err_cnt            = cs & we & (addr == 8'd15) & reset_mode & extended_mode;
wire   we_acceptance_code_1     = cs & we & (addr == 8'd17) & reset_mode & extended_mode;
wire   we_acceptance_code_2     = cs & we & (addr == 8'd18) & reset_mode & extended_mode;
wire   we_acceptance_code_3     = cs & we & (addr == 8'd19) & reset_mode & extended_mode;
wire   we_acceptance_mask_1     = cs & we & (addr == 8'd21) & reset_mode & extended_mode;
wire   we_acceptance_mask_2     = cs & we & (addr == 8'd22) & reset_mode & extended_mode;
wire   we_acceptance_mask_3     = cs & we & (addr == 8'd23) & reset_mode & extended_mode;
/* End: This section is for EXTENDED mode */



always @ (posedge clk)
begin
  tx_successful_q           <=#Tp tx_successful;
  overrun_q                 <=#Tp overrun;
  transmit_buffer_status_q  <=#Tp transmit_buffer_status;
  error_status_q            <=#Tp error_status;
  node_bus_off_q            <=#Tp node_bus_off;
  node_error_passive_q      <=#Tp node_error_passive;
end



/* Mode register */
wire   [0:0] mode;
wire   [4:1] mode_basic;
wire   [3:1] mode_ext;
wire         receive_irq_en_basic;
wire         transmit_irq_en_basic;
wire         error_irq_en_basic;
wire         overrun_irq_en_basic;

can_register_asyn_syn #(1, 1'h1) MODE_REG0
( .data_in(data_in[0]),
  .data_out(mode[0]),
  .we(we_mode),
  .clk(clk),
  .rst(rst),
  .rst_sync(set_reset_mode)
);

can_register_asyn #(4, 0) MODE_REG_BASIC
( .data_in(data_in[4:1]),
  .data_out(mode_basic[4:1]),
  .we(we_mode),
  .clk(clk),
  .rst(rst)
);

can_register_asyn #(3, 0) MODE_REG_EXT
( .data_in(data_in[3:1]),
  .data_out(mode_ext[3:1]),
  .we(we_mode & reset_mode),
  .clk(clk),
  .rst(rst)
);

assign reset_mode             = mode[0];
assign listen_only_mode       = extended_mode & mode_ext[1];
assign self_test_mode         = extended_mode & mode_ext[2];
assign acceptance_filter_mode = extended_mode & mode_ext[3];

assign receive_irq_en_basic  = mode_basic[1];
assign transmit_irq_en_basic = mode_basic[2];
assign error_irq_en_basic    = mode_basic[3];
assign overrun_irq_en_basic  = mode_basic[4];
/* End Mode register */


/* Command register */
wire   [4:0] command;
can_register_asyn_syn #(1, 1'h0) COMMAND_REG0
( .data_in(data_in[0]),
  .data_out(command[0]),
  .we(we_command),
  .clk(clk),
  .rst(rst),
  .rst_sync(command[0] & sample_point | reset_mode)
);

can_register_asyn_syn #(1, 1'h0) COMMAND_REG1
( .data_in(data_in[1]),
  .data_out(command[1]),
  .we(we_command),
  .clk(clk),
  .rst(rst),
  .rst_sync(sample_point & (tx_request | (abort_tx & ~transmitting)) | reset_mode)
);

can_register_asyn_syn #(2, 2'h0) COMMAND_REG
( .data_in(data_in[3:2]),
  .data_out(command[3:2]),
  .we(we_command),
  .clk(clk),
  .rst(rst),
  .rst_sync(|command[3:2] | reset_mode)
);

can_register_asyn_syn #(1, 1'h0) COMMAND_REG4
( .data_in(data_in[4]),
  .data_out(command[4]),
  .we(we_command),
  .clk(clk),
  .rst(rst),
  .rst_sync(command[4] & sample_point | reset_mode)
);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    self_rx_request <= 1'b0;
  else if (command[4] & (~command[0]))
    self_rx_request <=#Tp 1'b1;
  else if ((~tx_state) & tx_state_q)
    self_rx_request <=#Tp 1'b0;
end


assign clear_data_overrun = command[3];
assign release_buffer = command[2];
assign tx_request = command[0] | command[4];
assign abort_tx = command[1] & (~tx_request);


always @ (posedge clk or posedge rst)
begin
  if (rst)
    single_shot_transmission <= 1'b0;
  else if (tx_request & command[1] & sample_point)
    single_shot_transmission <=#Tp 1'b1;
  else if ((~tx_state) & tx_state_q)
    single_shot_transmission <=#Tp 1'b0;
end


/*
can_register_asyn_syn #(1, 1'h0) COMMAND_REG_OVERLOAD  // Uncomment this to enable overload requests !!!
( .data_in(data_in[5]),
  .data_out(overload_request),
  .we(we_command),
  .clk(clk),
  .rst(rst),
  .rst_sync(overload_frame & ~overload_frame_q)
);

reg           overload_frame_q;

always @ (posedge clk or posedge rst)
begin
  if (rst)
    overload_frame_q <= 1'b0;
  else
    overload_frame_q <=#Tp overload_frame;
end
*/
assign overload_request = 0;  // Overload requests are not supported, yet !!!





/* End Command register */


/* Status register */

wire   [7:0] status;

assign status[7] = node_bus_off;
assign status[6] = error_status;
assign status[5] = transmit_status;
assign status[4] = receive_status;
assign status[3] = transmission_complete;
assign status[2] = transmit_buffer_status;
assign status[1] = overrun_status;
assign status[0] = receive_buffer_status;



always @ (posedge clk or posedge rst)
begin
  if (rst)
    transmission_complete <= 1'b1;
  else if (tx_successful & (~tx_successful_q) | abort_tx)
    transmission_complete <=#Tp 1'b1;
  else if (tx_request)
    transmission_complete <=#Tp 1'b0;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    transmit_buffer_status <= 1'b1;
  else if (tx_request)
    transmit_buffer_status <=#Tp 1'b0;
  else if (reset_mode || !need_to_tx)
    transmit_buffer_status <=#Tp 1'b1;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    overrun_status <= 1'b0;
  else if (overrun & (~overrun_q))
    overrun_status <=#Tp 1'b1;
  else if (reset_mode || clear_data_overrun)
    overrun_status <=#Tp 1'b0;
end


always @ (posedge clk or posedge rst)
begin
  if (rst)
    receive_buffer_status <= 1'b0;
  else if (reset_mode || release_buffer)
    receive_buffer_status <=#Tp 1'b0;
  else if (~info_empty)
    receive_buffer_status <=#Tp 1'b1;
end

/* End Status register */


/* Interrupt Enable register (extended mode) */
wire   [7:0] irq_en_ext;
wire         bus_error_irq_en;
wire         arbitration_lost_irq_en;
wire         error_passive_irq_en;
wire         data_overrun_irq_en_ext;
wire         error_warning_irq_en_ext;
wire         transmit_irq_en_ext;
wire         receive_irq_en_ext;

can_register #(8) IRQ_EN_REG
( .data_in(data_in),
  .data_out(irq_en_ext),
  .we(we_interrupt_enable),
  .clk(clk)
);


assign bus_error_irq_en             = irq_en_ext[7];
assign arbitration_lost_irq_en      = irq_en_ext[6];
assign error_passive_irq_en         = irq_en_ext[5];
assign data_overrun_irq_en_ext      = irq_en_ext[3];
assign error_warning_irq_en_ext     = irq_en_ext[2];
assign transmit_irq_en_ext          = irq_en_ext[1];
assign receive_irq_en_ext           = irq_en_ext[0];
/* End Bus Timing 0 register */


/* Bus Timing 0 register */
wire   [7:0] bus_timing_0;
can_register #(8) BUS_TIMING_0_REG
( .data_in(data_in),
  .data_out(bus_timing_0),
  .we(we_bus_timing_0),
  .clk(clk)
);

assign baud_r_presc = bus_timing_0[5:0];
assign sync_jump_width = bus_timing_0[7:6];
/* End Bus Timing 0 register */


/* Bus Timing 1 register */
wire   [7:0] bus_timing_1;
can_register #(8) BUS_TIMING_1_REG
( .data_in(data_in),
  .data_out(bus_timing_1),
  .we(we_bus_timing_1),
  .clk(clk)
);

assign time_segment1 = bus_timing_1[3:0];
assign time_segment2 = bus_timing_1[6:4];
assign triple_sampling = bus_timing_1[7];
/* End Bus Timing 1 register */


/* Error Warning Limit register */
can_register_asyn #(8, 96) ERROR_WARNING_REG
( .data_in(data_in),
  .data_out(error_warning_limit),
  .we(we_error_warning_limit),
  .clk(clk),
  .rst(rst)
);
/* End Error Warning Limit register */



/* Clock Divider register */
wire   [7:0] clock_divider;
wire         clock_off;
wire   [2:0] cd;
reg    [2:0] clkout_div;
reg    [2:0] clkout_cnt;
reg          clkout_tmp;

can_register_asyn #(1, 0) CLOCK_DIVIDER_REG_7
( .data_in(data_in[7]),
  .data_out(clock_divider[7]),
  .we(we_clock_divider_hi),
  .clk(clk),
  .rst(rst)
);

assign clock_divider[6:4] = 3'h0;

can_register_asyn #(1, 0) CLOCK_DIVIDER_REG_3
( .data_in(data_in[3]),
  .data_out(clock_divider[3]),
  .we(we_clock_divider_hi),
  .clk(clk),
  .rst(rst)
);

can_register_asyn #(3, 0) CLOCK_DIVIDER_REG_LOW
( .data_in(data_in[2:0]),
  .data_out(clock_divider[2:0]),
  .we(we_clock_divider_low),
  .clk(clk),
  .rst(rst)
);

assign extended_mode = clock_divider[7];
assign clock_off     = clock_divider[3];
assign cd[2:0]       = clock_divider[2:0];



always @ (cd)
begin
  case (cd)                       /* synthesis full_case parallel_case */ 
    3'b000 : clkout_div = 3'd0;
    3'b001 : clkout_div = 3'd1;
    3'b010 : clkout_div = 3'd2;
    3'b011 : clkout_div = 3'd3;
    3'b100 : clkout_div = 3'd4;
    3'b101 : clkout_div = 3'd5;
    3'b110 : clkout_div = 3'd6;
    3'b111 : clkout_div = 3'd0;
  endcase
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    clkout_cnt <= 3'h0;
  else if (clkout_cnt == clkout_div)
    clkout_cnt <=#Tp 3'h0;
  else
    clkout_cnt <= clkout_cnt + 1'b1;
end



always @ (posedge clk or posedge rst)
begin
  if (rst)
    clkout_tmp <= 1'b0;
  else if (clkout_cnt == clkout_div)
    clkout_tmp <=#Tp ~clkout_tmp;
end


assign clkout = clock_off ? 1'b1 : ((&cd)? clk : clkout_tmp);



/* End Clock Divider register */




/* This section is for BASIC and EXTENDED mode */

/* Acceptance code register */
can_register #(8) ACCEPTANCE_CODE_REG0
( .data_in(data_in),
  .data_out(acceptance_code_0),
  .we(we_acceptance_code_0),
  .clk(clk)
);
/* End: Acceptance code register */


/* Acceptance mask register */
can_register #(8) ACCEPTANCE_MASK_REG0
( .data_in(data_in),
  .data_out(acceptance_mask_0),
  .we(we_acceptance_mask_0),
  .clk(clk)
);
/* End: Acceptance mask register */
/* End: This section is for BASIC and EXTENDED mode */


/* Tx data 0 register. */
can_register #(8) TX_DATA_REG0
( .data_in(data_in),
  .data_out(tx_data_0),
  .we(we_tx_data_0),
  .clk(clk)
);
/* End: Tx data 0 register. */


/* Tx data 1 register. */
can_register #(8) TX_DATA_REG1
( .data_in(data_in),
  .data_out(tx_data_1),
  .we(we_tx_data_1),
  .clk(clk)
);
/* End: Tx data 1 register. */


/* Tx data 2 register. */
can_register #(8) TX_DATA_REG2
( .data_in(data_in),
  .data_out(tx_data_2),
  .we(we_tx_data_2),
  .clk(clk)
);
/* End: Tx data 2 register. */


/* Tx data 3 register. */
can_register #(8) TX_DATA_REG3
( .data_in(data_in),
  .data_out(tx_data_3),
  .we(we_tx_data_3),
  .clk(clk)
);
/* End: Tx data 3 register. */


/* Tx data 4 register. */
can_register #(8) TX_DATA_REG4
( .data_in(data_in),
  .data_out(tx_data_4),
  .we(we_tx_data_4),
  .clk(clk)
);
/* End: Tx data 4 register. */


/* Tx data 5 register. */
can_register #(8) TX_DATA_REG5
( .data_in(data_in),
  .data_out(tx_data_5),
  .we(we_tx_data_5),
  .clk(clk)
);
/* End: Tx data 5 register. */


/* Tx data 6 register. */
can_register #(8) TX_DATA_REG6
( .data_in(data_in),
  .data_out(tx_data_6),
  .we(we_tx_data_6),
  .clk(clk)
);
/* End: Tx data 6 register. */


/* Tx data 7 register. */
can_register #(8) TX_DATA_REG7
( .data_in(data_in),
  .data_out(tx_data_7),
  .we(we_tx_data_7),
  .clk(clk)
);
/* End: Tx data 7 register. */


/* Tx data 8 register. */
can_register #(8) TX_DATA_REG8
( .data_in(data_in),
  .data_out(tx_data_8),
  .we(we_tx_data_8),
  .clk(clk)
);
/* End: Tx data 8 register. */


/* Tx data 9 register. */
can_register #(8) TX_DATA_REG9
( .data_in(data_in),
  .data_out(tx_data_9),
  .we(we_tx_data_9),
  .clk(clk)
);
/* End: Tx data 9 register. */


/* Tx data 10 register. */
can_register #(8) TX_DATA_REG10
( .data_in(data_in),
  .data_out(tx_data_10),
  .we(we_tx_data_10),
  .clk(clk)
);
/* End: Tx data 10 register. */


/* Tx data 11 register. */
can_register #(8) TX_DATA_REG11
( .data_in(data_in),
  .data_out(tx_data_11),
  .we(we_tx_data_11),
  .clk(clk)
);
/* End: Tx data 11 register. */


/* Tx data 12 register. */
can_register #(8) TX_DATA_REG12
( .data_in(data_in),
  .data_out(tx_data_12),
  .we(we_tx_data_12),
  .clk(clk)
);
/* End: Tx data 12 register. */





/* This section is for EXTENDED mode */

/* Acceptance code register 1 */
can_register #(8) ACCEPTANCE_CODE_REG1
( .data_in(data_in),
  .data_out(acceptance_code_1),
  .we(we_acceptance_code_1),
  .clk(clk)
);
/* End: Acceptance code register */


/* Acceptance code register 2 */
can_register #(8) ACCEPTANCE_CODE_REG2
( .data_in(data_in),
  .data_out(acceptance_code_2),
  .we(we_acceptance_code_2),
  .clk(clk)
);
/* End: Acceptance code register */


/* Acceptance code register 3 */
can_register #(8) ACCEPTANCE_CODE_REG3
( .data_in(data_in),
  .data_out(acceptance_code_3),
  .we(we_acceptance_code_3),
  .clk(clk)
);
/* End: Acceptance code register */


/* Acceptance mask register 1 */
can_register #(8) ACCEPTANCE_MASK_REG1
( .data_in(data_in),
  .data_out(acceptance_mask_1),
  .we(we_acceptance_mask_1),
  .clk(clk)
);
/* End: Acceptance code register */


/* Acceptance mask register 2 */
can_register #(8) ACCEPTANCE_MASK_REG2
( .data_in(data_in),
  .data_out(acceptance_mask_2),
  .we(we_acceptance_mask_2),
  .clk(clk)
);
/* End: Acceptance code register */


/* Acceptance mask register 3 */
can_register #(8) ACCEPTANCE_MASK_REG3
( .data_in(data_in),
  .data_out(acceptance_mask_3),
  .we(we_acceptance_mask_3),
  .clk(clk)
);
/* End: Acceptance code register */


/* End: This section is for EXTENDED mode */




// Reading data from registers
always @ ( addr or extended_mode or mode or bus_timing_0 or bus_timing_1 or clock_divider or
           acceptance_code_0 or acceptance_code_1 or acceptance_code_2 or acceptance_code_3 or
           acceptance_mask_0 or acceptance_mask_1 or acceptance_mask_2 or acceptance_mask_3 or
           reset_mode or tx_data_0 or tx_data_1 or tx_data_2 or tx_data_3 or tx_data_4 or 
           tx_data_5 or tx_data_6 or tx_data_7 or tx_data_8 or tx_data_9 or status or 
           error_warning_limit or rx_err_cnt or tx_err_cnt or irq_en_ext or irq_reg or mode_ext or
           arbitration_lost_capture or rx_message_counter or mode_basic or error_capture_code
         )
begin
  case({extended_mode, addr[4:0]})  /* synthesis parallel_case */ 
    {1'h1, 5'd00} :  data_out = {4'b0000, mode_ext[3:1], mode[0]};      // extended mode
    {1'h1, 5'd01} :  data_out = 8'h0;                                   // extended mode
    {1'h1, 5'd02} :  data_out = status;                                 // extended mode
    {1'h1, 5'd03} :  data_out = irq_reg;                                // extended mode
    {1'h1, 5'd04} :  data_out = irq_en_ext;                             // extended mode
    {1'h1, 5'd06} :  data_out = bus_timing_0;                           // extended mode
    {1'h1, 5'd07} :  data_out = bus_timing_1;                           // extended mode
    {1'h1, 5'd11} :  data_out = {3'h0, arbitration_lost_capture[4:0]};  // extended mode
    {1'h1, 5'd12} :  data_out = error_capture_code;                     // extended mode
    {1'h1, 5'd13} :  data_out = error_warning_limit;                    // extended mode
    {1'h1, 5'd14} :  data_out = rx_err_cnt;                             // extended mode
    {1'h1, 5'd15} :  data_out = tx_err_cnt;                             // extended mode
    {1'h1, 5'd16} :  data_out = acceptance_code_0;                      // extended mode
    {1'h1, 5'd17} :  data_out = acceptance_code_1;                      // extended mode
    {1'h1, 5'd18} :  data_out = acceptance_code_2;                      // extended mode
    {1'h1, 5'd19} :  data_out = acceptance_code_3;                      // extended mode
    {1'h1, 5'd20} :  data_out = acceptance_mask_0;                      // extended mode
    {1'h1, 5'd21} :  data_out = acceptance_mask_1;                      // extended mode
    {1'h1, 5'd22} :  data_out = acceptance_mask_2;                      // extended mode
    {1'h1, 5'd23} :  data_out = acceptance_mask_3;                      // extended mode
    {1'h1, 5'd24} :  data_out = 8'h0;                                   // extended mode
    {1'h1, 5'd25} :  data_out = 8'h0;                                   // extended mode
    {1'h1, 5'd26} :  data_out = 8'h0;                                   // extended mode
    {1'h1, 5'd27} :  data_out = 8'h0;                                   // extended mode
    {1'h1, 5'd28} :  data_out = 8'h0;                                   // extended mode
    {1'h1, 5'd29} :  data_out = {1'b0, rx_message_counter};             // extended mode
    {1'h1, 5'd31} :  data_out = clock_divider;                          // extended mode
    {1'h0, 5'd00} :  data_out = {3'b001, mode_basic[4:1], mode[0]};     // basic mode
    {1'h0, 5'd01} :  data_out = 8'hff;                                  // basic mode
    {1'h0, 5'd02} :  data_out = status;                                 // basic mode
    {1'h0, 5'd03} :  data_out = {4'hf, irq_reg[3:0]};                   // basic mode
    {1'h0, 5'd04} :  data_out = reset_mode? acceptance_code_0 : 8'hff;  // basic mode
    {1'h0, 5'd05} :  data_out = reset_mode? acceptance_mask_0 : 8'hff;  // basic mode
    {1'h0, 5'd06} :  data_out = reset_mode? bus_timing_0 : 8'hff;       // basic mode
    {1'h0, 5'd07} :  data_out = reset_mode? bus_timing_1 : 8'hff;       // basic mode
    {1'h0, 5'd10} :  data_out = reset_mode? 8'hff : tx_data_0;          // basic mode
    {1'h0, 5'd11} :  data_out = reset_mode? 8'hff : tx_data_1;          // basic mode
    {1'h0, 5'd12} :  data_out = reset_mode? 8'hff : tx_data_2;          // basic mode
    {1'h0, 5'd13} :  data_out = reset_mode? 8'hff : tx_data_3;          // basic mode
    {1'h0, 5'd14} :  data_out = reset_mode? 8'hff : tx_data_4;          // basic mode
    {1'h0, 5'd15} :  data_out = reset_mode? 8'hff : tx_data_5;          // basic mode
    {1'h0, 5'd16} :  data_out = reset_mode? 8'hff : tx_data_6;          // basic mode
    {1'h0, 5'd17} :  data_out = reset_mode? 8'hff : tx_data_7;          // basic mode
    {1'h0, 5'd18} :  data_out = reset_mode? 8'hff : tx_data_8;          // basic mode
    {1'h0, 5'd19} :  data_out = reset_mode? 8'hff : tx_data_9;          // basic mode
    {1'h0, 5'd31} :  data_out = clock_divider;                          // basic mode
    default :  data_out = 8'h0;                                   // the rest is read as 0
  endcase
end


// Some interrupts exist in basic mode and in extended mode. Since they are in different registers they need to be multiplexed.
assign data_overrun_irq_en  = extended_mode ? data_overrun_irq_en_ext  : overrun_irq_en_basic;
assign error_warning_irq_en = extended_mode ? error_warning_irq_en_ext : error_irq_en_basic;
assign transmit_irq_en      = extended_mode ? transmit_irq_en_ext      : transmit_irq_en_basic;
assign receive_irq_en       = extended_mode ? receive_irq_en_ext       : receive_irq_en_basic;


reg data_overrun_irq;
always @ (posedge clk or posedge rst)
begin
  if (rst)
    data_overrun_irq <= 1'b0;
  else if (overrun & (~overrun_q) & data_overrun_irq_en)
    data_overrun_irq <=#Tp 1'b1;
  else if (reset_mode || read_irq_reg)
    data_overrun_irq <=#Tp 1'b0;
end


reg transmit_irq;
always @ (posedge clk or posedge rst)
begin
  if (rst)
    transmit_irq <= 1'b0;
  else if (reset_mode || read_irq_reg)
    transmit_irq <=#Tp 1'b0;
  else if (transmit_buffer_status & (~transmit_buffer_status_q) & transmit_irq_en)
    transmit_irq <=#Tp 1'b1;
end


reg receive_irq;
always @ (posedge clk or posedge rst)
begin
  if (rst)
    receive_irq <= 1'b0;
  else if ((~info_empty) & (~receive_irq) & receive_irq_en)
    receive_irq <=#Tp 1'b1;
  else if (reset_mode || release_buffer)
    receive_irq <=#Tp 1'b0;
end


reg error_irq;
always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_irq <= 1'b0;
  else if (((error_status ^ error_status_q) | (node_bus_off ^ node_bus_off_q)) & error_warning_irq_en)
    error_irq <=#Tp 1'b1;
  else if (read_irq_reg)
    error_irq <=#Tp 1'b0;
end


reg bus_error_irq;
always @ (posedge clk or posedge rst)
begin
  if (rst)
    bus_error_irq <= 1'b0;
  else if (set_bus_error_irq & bus_error_irq_en)
    bus_error_irq <=#Tp 1'b1;
  else if (reset_mode || read_irq_reg)
    bus_error_irq <=#Tp 1'b0;
end


reg arbitration_lost_irq;
always @ (posedge clk or posedge rst)
begin
  if (rst)
    arbitration_lost_irq <= 1'b0;
  else if (set_arbitration_lost_irq & arbitration_lost_irq_en)
    arbitration_lost_irq <=#Tp 1'b1;
  else if (reset_mode || read_irq_reg)
    arbitration_lost_irq <=#Tp 1'b0;
end



reg error_passive_irq;
always @ (posedge clk or posedge rst)
begin
  if (rst)
    error_passive_irq <= 1'b0;
  else if ((node_error_passive & (~node_error_passive_q) | (~node_error_passive) & node_error_passive_q & node_error_active) & error_passive_irq_en)
    error_passive_irq <=#Tp 1'b1;
  else if (reset_mode || read_irq_reg)
    error_passive_irq <=#Tp 1'b0;
end



assign irq_reg = {bus_error_irq, arbitration_lost_irq, error_passive_irq, 1'b0, data_overrun_irq, error_irq, transmit_irq, receive_irq};

assign irq = data_overrun_irq | transmit_irq | receive_irq | error_irq | bus_error_irq | arbitration_lost_irq | error_passive_irq;


always @ (posedge clk or posedge rst)
begin
  if (rst)
    irq_n <= 1'b1;
  else if (read_irq_reg)
    irq_n <=#Tp 1'b1;
  else if (irq)
    irq_n <=#Tp 1'b0;
end

endmodule
