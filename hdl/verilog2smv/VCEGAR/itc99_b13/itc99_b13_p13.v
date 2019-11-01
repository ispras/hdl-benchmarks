/*
 *
 * Taken from VCEGAR benchmarks -- http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz
 * Modified by Ahmed Irfan <irfan@fbk.eu>
 *
 */ 
// Verilog translation of the original b13 circuit from the ITC99
// benchmark set.

// Author: Fabio Somenzi <Fabio@Colorado.EDU>

//typedef enum {GP001, GP010, GP011, GP100, GP100w, GP101, GP110, GP111} State1;
//typedef enum {GP01, GP10, GP11, GP11w} State2;
//typedef enum {G_IDLE, G_LOAD, G_SEND, G_WAIT_END} State3;
//typedef enum {START_BIT, STOP_BIT, BIT0, BIT1, BIT2, BIT3, BIT4, BIT5,
//	      BIT6, BIT7} Bit;


`define START_BIT 4'b0001
`define STOP_BIT 4'b0010
`define BIT0 4'b0011
`define BIT1 4'b0100
`define BIT2 4'b0101
`define BIT3 4'b0110
`define BIT4 4'b0111
`define BIT5 4'b1000
`define BIT6 4'b1001
`define BIT7 4'b1010



`define GP001 3'b000
`define GP010 3'b001
`define GP011 3'b010
`define GP100 3'b011
`define GP100w 3'b100
`define GP101 3'b101
`define GP110 3'b110
`define GP111 3'b111

`define GP01 2'b00
`define GP10 2'b01
`define GP11 2'b10
`define GP11w 2'b11

`define G_IDLE 2'b00
`define G_LOAD 2'b01
`define G_SEND 2'b10
`define G_WAIT_END 2'b11


module main(eoc, soc, load_dato, add_mpx2, canale, mux_en,  clock, data_in,
	   dsr, error, data_out);
    input        eoc;
    output 	 soc, load_dato, add_mpx2;
    output [3:0] canale;
    output 	 mux_en;
    input 	 clock;
    input [7:0]  data_in;
    input 	 dsr;
    output 	 error;
    output 	 data_out;

    reg [3:0] 	 canale;
    reg 	 soc, load_dato, add_mpx2, mux_en, error, data_out;
    reg   S1;
    reg   S2;
   	reg   itfc_state;
    reg      next_bit;
    reg 	 mpx, rdy, send_data, confirm, shot, send_en, tre;
    reg [7:0] 	 out_reg;
    reg 	 tx_end, send, load;
    reg [9:0] 	 tx_conta;

    reg [3:0] 	 conta_tmp;

    initial begin
	S1 = `GP001;
	soc = 0;
	canale = 0;
	conta_tmp = 0;
	send_data = 0;
	load_dato = 0;
	mux_en = 0;
    end

    always @ (posedge clock) begin
	case (S1)
	  `GP001: begin
	      mux_en = 1;
	      S1 = `GP010;
	  end
	  `GP010: begin
	      S1 = `GP011;
	  end
	  `GP011: begin
	      soc = 1;	
	      S1 = `GP101;
	  end
	  `GP101: begin
	      if (eoc) begin
		  S1 = `GP101;
	      end else begin
		  load_dato = 1;
		  S1 = `GP110;
		  mux_en = 0;
	      end
	  end
	  `GP110: begin
	      load_dato = 0;
	      soc = 0;			
	      conta_tmp = conta_tmp + 1;
	      if (conta_tmp == 8)
		conta_tmp = 0;
	      canale = conta_tmp;
	      S1 = `GP111;
	  end
	  `GP111: begin
	      send_data = 1;
	      S1 = `GP100w;
	  end
	  `GP100w: begin
	      S1 = `GP100;
	  end
	  `GP100: begin
	      if (!rdy) begin
		  S1 = `GP100;
	      end else begin
		  S1 = `GP001;
		  send_data = 0;
	      end
	  end
	endcase
    end

    initial begin
	S2 = `GP01;
	rdy = 0;
	add_mpx2 = 0;
	mpx = 0;
	shot = 0;
    end

    always @ (posedge clock) begin
	case (S2)
	  `GP01: begin
	      if (send_data) begin
		  rdy = 1;
		  S2 = `GP10;
	      end else begin
		  S2 = `GP01;
	      end
	  end
	  `GP10: begin
	      shot = 1;
	      S2 = `GP11;
	  end
	  `GP11: begin
	      if (!confirm) begin
		  shot = 0;
		  S2 = `GP11;
	      end else begin
		  if (!mpx) begin
		      add_mpx2 = 1;
		      mpx = 1;
		      S2 = `GP10;
		  end else begin
		      mpx = 0;
		      rdy = 0;
		      S2 = `GP11w;
		  end
	      end
	  end
	  `GP11w: begin
	      S2 = `GP01;
	  end
	endcase
    end

    initial begin
	load = 0; 
	send = 0;
	confirm = 0;
	itfc_state = `G_IDLE;
    end

    always @ (posedge clock) begin
	case (itfc_state)
	  `G_IDLE: begin
	      if (shot) begin
		  load = 1;
		  confirm = 0;
		  itfc_state = `G_LOAD;
	      end else begin
		  confirm = 0;
		  itfc_state = `G_IDLE;
	      end
	  end
	  `G_LOAD: begin
	      load = 0;
	      send = 1;
	      itfc_state = `G_SEND;
	  end
	  `G_SEND: begin
	      send = 0;
	      itfc_state = `G_WAIT_END;
	  end
	  `G_WAIT_END: begin
	      if (tx_end) begin
		  confirm = 1;
		  itfc_state = `G_IDLE;
	      end
	  end
	endcase
    end

    initial begin
	send_en = 0;
	out_reg = 0;
	tre = 0;
	error = 0;
    end

    always @ (posedge clock) begin
	if (tx_end) begin
	    send_en = 0;
	    tre = 1;
	end

	if (load) begin
	    if (!tre) begin
		out_reg = data_in;
		tre = 1;
		error = 0;
	    end else begin
		error = 1;
	    end
	end

	if (send) begin
	    if (!tre || !dsr) begin
		error = 1;
	    end else begin
		error = 0;		
		send_en = 1;
	    end
	end
    end

    initial begin
	tx_end = 0;
	data_out = 0;
	next_bit = `START_BIT;
	tx_conta = 0;
    end

    parameter DelayTime = 104;

    always @ (posedge clock) begin
	tx_end = 0;
	data_out = 1;
	if (send_en) begin
	    if (tx_conta > DelayTime) begin
		case (next_bit)
		  `START_BIT: begin
		      data_out = 0;
		      next_bit = `BIT0;
		  end
		  `BIT0: begin
		      data_out = out_reg[7];
		      next_bit = `BIT1;
		  end
		  `BIT1: begin
		      data_out = out_reg[6];
		      next_bit = `BIT2;
		  end
		  `BIT2: begin
		      data_out = out_reg[5];
		      next_bit = `BIT3;
		  end
		  `BIT3: begin
		      data_out = out_reg[4];
		      next_bit = `BIT4;
		  end
		  `BIT4: begin
		      data_out = out_reg[3];
		      next_bit = `BIT5;
		  end
		  `BIT5: begin
		      data_out = out_reg[2];
		      next_bit = `BIT6;
		  end
		  `BIT6: begin
		      data_out = out_reg[1];
		      next_bit = `BIT7;
		  end
		  `BIT7: begin
		      data_out = out_reg[0];
		      next_bit = `STOP_BIT;
		  end
		  `STOP_BIT: begin
		      data_out = 1;
		      next_bit = `START_BIT;
		      tx_end = 1;
		  end
		endcase
		tx_conta = 0;
	    end else begin
		tx_conta = tx_conta + 1;
	    end
	end
    end

//   assert property (~(error==1) | tre==1);

//   assert property (canale[3]==0);

//   assert property (tx_conta[9:8]==0);

//   assert property (~(mpx==1) | rdy==1);

//   assert property (canale[3:0] == conta_tmp[3:0]);
   
//   assert property (~(tre==1) | (error==1));

//   assert property (load==0 | send==0);

//   assert property (load==0 | confirm==0);

//   assert property (send==0 | confirm==0);

//   assert property (error==0 | send_en==0);

//   assert property (error==0 | confirm==0);

//   assert property (error==0 | tx_end==0);

   assert property (confirm==0 | send_en==0);

//   assert property (~(send_en==0) | (tx_end==0));

//   assert property (~(tx_end==1) | (next_bit==4'b0001));

//   assert property (~(load_dato==1) | (soc==1));

//   assert property (~(send_data==0) | (soc==0));

//   assert property (~(mpx==1) | (add_mpx2==1));

//   assert property (~(add_mpx2==1) | (tre==1));

//   assert property (~(shot==1) | (rdy==1));

//   assert property ((load_dato==0) | (mux_en==0));

//   assert property ((out_reg[7:0]==0) | (tre==1));
   
endmodule // b13
