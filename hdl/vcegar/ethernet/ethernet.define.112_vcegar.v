/**************************************************************************

ETHERNET PROJECT

***************************************************************************/ 

/*
 * Symbolic variables.
 *
 */
`define myFALSE 0		/* boolean */
`define myTRUE  1

`define Fail 	0		/* TransmissionStatus */
`define Success 1
`define NA	2

`define Jam	0		/* SendType */
`define F	1
`define ND	2

`define NoReq	0		/* ReqType */
`define Req	1


/*
 * The inteconnections between the processors and the cells.
 *
 */
module main( clk );
input clk;


wire fin_bt0, fin_bt1, CS, llc_ack0, llc_ack1, 
		        frame_ready0, frame_ready1, CD, send_plr0, send_plr1;
wire [0:1] ack0, ack1;
wire [0:1] in0, in1, bt0, bt1, send_pls0, send_pls1, chnl_data_in,
		 	chnl_data_out0, chnl_data_out1;
wire req0, req1;

// additions by himanshu ---------------------------------------------

reg old_cs;
reg [0:1] in0_cycle5, in0_cycle4, in0_cycle3, in0_cycle2;
reg [0:1] cntr;

//, in0_cycle1, in0_cycle0

initial begin
	old_cs = CS;
	cntr = 0;
end


always @(posedge clk)
begin
   old_cs <= CS; //additional variables being added as we wan't to prove properties involving 3-4 consecutive states
   in0_cycle5 <= in0;	
   in0_cycle4 <= in0_cycle5;
   in0_cycle3 <= in0_cycle4;
   in0_cycle2 <= in0_cycle3;
//   in0_cycle1 <= in0_cycle2;
//   in0_cycle0 <= in0_cycle1;

   if (cntr < 3)	
      cntr <= cntr + 1;
end

//----------additions by himanshu end here

LLC L0(clk, req0, ack0, frame_ready0, llc_ack0);
LLC L1(clk, req1, ack1, frame_ready1, llc_ack1);

FrameTransmitter FT0 (clk, req0, ack0, bt0, fin_bt0, CS, CD);
FrameTransmitter FT1 (clk, req1, ack1, bt1, fin_bt1, CS, CD);

BitTransmitter BT0(clk, bt0, fin_bt0, send_pls0); 
BitTransmitter BT1(clk, bt1, fin_bt1, send_pls1); 

FrameReceiver FR0(clk, in0, send_plr0, frame_ready0, llc_ack0, CS);
FrameReceiver FR1(clk, in1, send_plr1, frame_ready1, llc_ack1, CS);

PLS pls_0( clk, send_pls0, chnl_data_out0);
PLS pls_1( clk, send_pls1, chnl_data_out1);

PLR plr_0( clk, send_plr0, in0, chnl_data_in);
PLR plr_1( clk, send_plr1, in1, chnl_data_in);

CHNL CHN(clk, chnl_data_out0, chnl_data_out1, CS, CD, chnl_data_in);


endmodule

/******************************************************************************/
/* 
 * Model for the Bit Transmitter.  
 *
 * The Bit Transmitter (BT) process lies below the Frame Transmitter (FT) 
 * process and above the Physical Layer Sender (PLS) process.
 * 
 * Input signal descriptions: send_bt
 * 			   - data signal from the Frame Transmitter
 *
 * Output signal descriptions: finished_bt, send_pls
 *			  - data signal to the Pysical Layer Sender: send_pls
 *			  - control signal to the Frame Transmitter: finished_bt
 *
 * A packet of information to the PLS is sent on the send_pls line and 
 * consists of:	
 * 	1. 4 data bits (good data:F F F F; jam sequence:Jam Jam Jam Jam)
 * 	3. an end bit (ND)
 * 	
 * The above packet transfer takes at most 4 clock cycles.?!? ((not sure))
 *
 */
module BitTransmitter(clk, send_bt, finished_bt, send_pls);

input clk;
input wire [0:1] send_bt;
output finished_bt;
output wire [0:1] send_pls;

wire finished_bt;

reg [0:1] sendpls;
reg finishedbt;

assign send_pls = sendpls;
assign finished_bt = finishedbt;



initial begin
        finishedbt = `myFALSE;
	sendpls = `ND;
end


always @(posedge clk) begin

	/* assert finishedbt for only 1 clock cycle */
	if (finishedbt == `myTRUE)	finishedbt = `myFALSE;
	
	if (send_bt == `F)		sendpls = `F;	

	else if (send_bt == `Jam)	sendpls = `Jam;
	
	else if (sendpls == `F || sendpls == `Jam)
		begin			/* no transmission */
	     	finishedbt = `myTRUE;	/* will always finish */
	     	sendpls = `ND;
	     	end

end	/* end of "always @(posedge clk)" */
endmodule
	
/*****************************************************************************/
/* 
 * Model for the Frame Transmitter.
 *
 * The Frame Transmitter (FT) process lies below the Logical Link Control (LLC)
 * process and above the Bit Transmitter (BT) process.  
 *
 * Input signal descriptions: llc_f_ready, finished_bt, CS, CD
 *                         - signal from Logical Link Control: llc_f_ready
 *			   - signal from Bit Transmitter: finished_bt
 *			   - signal from Channel Data: CS, CD
 *                         - control signals: llc_f_ready, finished_bt, CS, CD
 *
 * Output signal descriptions: okay, send_bt
 *                         - signal to Logical Link Control: okay
 *                         - signal to Bit Transmitter: send_bt
 *                         - control signal: okay
 *                         - data line: send_bt
 *
 */

module FrameTransmitter(clk, llc_f_ready, okay, send_bt, finished_bt, CS, CD, end_bt);

input clk;
input llc_f_ready, finished_bt, CS, CD;
output end_bt;
output wire [0:1] okay;

wire	finished_bt, CS, CD;
output wire reg [0:1] send_bt;
wire llc_f_ready;

reg [0:1] oka;

assign send_bt = sendbt;
assign okay = oka;


wire [0:5] delay;
reg [0:5] delay_reg;
reg [0:3] num_of_collisions;
reg [0:2] count;
reg [0:2] prop_delay;	/* propagation delay - length of channel */
reg finish_flag;        /* used to account for 2 cycle delay between
			 * assertion of reqbit and receiving of good
			 * data */	
reg done_Jam;
wire r_bit0;		/* random bits used for collision delay */
wire r_bit1;
wire r_bit2;
wire r_bit3;
wire r_bit4;
wire r_bit5;

//assign r_bit0 = $ND(0,1);
//assign r_bit1 = $ND(0,1);
//assign r_bit2 = $ND(0,1);
//assign r_bit3 = $ND(0,1);
//assign r_bit4 = $ND(0,1);
//assign r_bit5 = $ND(0,1);


/* value of delay is dependent on the number of collisions seen */
assign delay = (num_of_collisions == 1) ? {5'b00000, r_bit0} :
              /* (num_of_collisions == 2) ? {4'b0000, r_bit1, r_bit0} :*/
       /* (num_of_collisions == 3) ? {3'b000, r_bit2, r_bit1, r_bit0} :*/
				   {6'b000000};
/*
        (num_of_collisions == 4) ? {2'b00, r_bit3, r_bit2, r_bit1, r_bit0} :
(num_of_collisions == 5) ? {1'b0, r_bit4, r_bit3, r_bit2, r_bit1, r_bit0} :
(num_of_collisions == 6) ? {r_bit5, r_bit4, r_bit3, r_bit2, r_bit1, r_bit0} :
                           {6'b000000};
*/

initial begin
	sendbt = `ND;
	oka = `NA;		
	delay_reg = 0;		/* number of cycles to wait after a collision */
	num_of_collisions = 0;
	count = 0;		/* number of data bits in a frame */
	done_Jam = `myFALSE;
	prop_delay = 0;
	finish_flag = 0;
end

always @(posedge clk) begin

	prop_delay = prop_delay + 1;

	/* oka = Success is asserted for only 1 cycle */
	if (oka == `Success || oka == `Fail)	oka = `NA;
	
	else begin	/* 1 clock delay required for llc_f_ready to deassert */

	/* Synchronous delay count down - collision arbitration implementation */
	if (delay_reg > 0)
	   begin 
	   delay_reg = delay_reg - 1;
	   end


	else begin	/* delay = 0 */
	/* send first good data bit. */
	if (llc_f_ready == `Req && CS == `myFALSE && 
	    count == 0 && CD == `myFALSE) 
	   begin 
	   count = count + 1;
	   sendbt = `F;
	   prop_delay = 0;
	   end

	/* Collision detected while FT was transmitting. */
	/* send first jam bit */
	else if (CD == `myTRUE && count > 0 && sendbt != `Jam && 
		 done_Jam == `myFALSE)
	   begin
	   count = 1;
	   sendbt = `Jam;
	   done_Jam = `myTRUE;
	   end 

	/* send successive data/jam bits */
	else if ((sendbt == `F || sendbt == `Jam) && count > 0)   
		begin
		count = count + 1;
		if (count == 2)
			begin
			sendbt = `ND;
			end
		end


	/* Received finish signal from BT.  
	   ASSUMPTION : finish_bt asserted high for 1 cycle only */  
	else if (finished_bt == `myTRUE)	
	   begin 
	   if (done_Jam == `myTRUE) 	/* check for collision case */	
		begin
		count = 0;
		finish_flag = 0;        /* ignore previous finish_flag */
		done_Jam = `myFALSE;
		num_of_collisions = num_of_collisions + 1;
		if (num_of_collisions > 1)
			begin
			oka = `Fail;
			num_of_collisions = 0;
			end
		delay_reg = delay;
		end	/* if sendbt == Jam */

	   else if (prop_delay >= 4)
		begin  /* no collision occurred, transmission was successful */	
		num_of_collisions = 0;
		oka = `Success;   
		count = 0;
		end
	   else finish_flag = 1;        /* remember finish_bt was asserted */
	   end

	if (finish_flag == 1 && prop_delay >= 4 && done_Jam != `myTRUE)
                begin
                num_of_collisions = 0;
                oka = `Success;
                count = 0;      /* momeng*/
                finish_flag = 0;
                end
 
	end /* if delay = 0 */

     end /* wait for llc_f_ready to deassert */

end	/* end of "always @(posedge clk)" */
endmodule

/*****************************************************************************/
/*
 * Model for the Logical Link Control.
 *
 * The Logical Link Control (LLC) process lies at the highest level.  It has 
 * connections to the Frame Transmitter (FT) and the Frame Receiver (FR),
 * both of which lie below it.
 *
 * Input signal descriptions: ack, frame_ready
 *                         - control signal from Frame Transmitter: ack
 *                         - control signal from Frame Receiver: frame_ready
 *
 * Output signal descriptions: req, llc_ack
 *                         - control signal to Frame Transmitter: req
 *                         - control signal to Frame Receiver: llc_ack
 *
 * Description: 
 * To request a transmission the LLC sets its req signal to "Req".  The req 
 * signal is asserted until the transmission is completed or has failed
 * (i.e. ack = Success or ack = Fail).  Transmission requests are not queued
 * by the LLC so if it is busy doing a transmission, no other transmission 
 * requests will be generated until the current transmission has completed.
 *
 *
 * Upon seeing frame_ready asserted the LLC will assert llc_ack in the 
 * following clock cycle and deassert it one clock cycle later.  There is no 
 * actual transfer of data from the FR to the LLC.  The data transfer at this
 * stage was not modeled because once the FR has good data, the LLC is 
 * guaranteed to get it.  There can be no collisions from the FR to the LLC.
 *
 * 
 */
module LLC(clk, req, ack, frame_ready, llc_ack);
input clk;
input frame_ready;
input wire [0:1] ack;
output req, llc_ack;

wire req;
wire llc_ack, frame_ready;

reg reqState;
reg llc__ack;

assign req = reqState;
assign llc_ack = llc__ack;

reg temp_frame;

wire[0:2] randChoice;

initial begin
	reqState = `NoReq;
	llc__ack = `myFALSE;
	temp_frame = 0;
end

//assign randChoice = $ND(0,1,2,3,4,5,6,7);

always @(posedge clk) begin
    /* assert llc__ack for 1 cycle only */
    if (llc__ack == `myTRUE)	llc__ack = `myFALSE;

    else if (frame_ready == `myTRUE)	/* no need to actually read data in */
		begin
        	llc__ack = `myTRUE;
        	end

    if (reqState == `NoReq)
	begin
	if (randChoice > 3)	reqState = `Req;	
	end

    /* doing a transfer, so wait for completion */
    else if (ack == `Success || ack == `Fail) 	reqState = `NoReq;

end

endmodule

/*****************************************************************************/
/*
 *  Model for the Frame Receiver.
 *
 * The Frame Receiver (FR) process lies below the Logical Link Control (LLC)
 * process and above the Physical Layer Receiver (PLR) process.
 *
 * Input signal descriptions: FR_address, data_in, llc_ack, CS
 *                         - signal from the Physical Layer Receiver: data_in
 *			   - signal from the Logical Link Control: llc_ack
 *			   - signal from the Channel Data: CS
 *			   - control signals: llc_ack, CS
 *                         - data bit: data_in
 *
 * Output signal descriptions: req_bit, frame_ready
 *                         - signals to the Pysical Layer Receiver: req_bit
 *                         - signals to the Logical Link Control: frame_ready
 *                         - control signals: req_bit, frame_ready
 *
 * Description:
 * The FR continuously polls the CS signal.  If CS is asserted then the FR 
 * asserts send_plr in the following clock cycle.  send_plr remains asserted
 * so long as CS is asserted, and it is deasserted by the FR one clock cycle 
 * after CS is deasserted.  For each cycle that send_plr is asserted, the FR
 * expects data from the PLR on the data_in signal.  If the FR sees 4 
 * consecutive F bits followed by an ND bit on data_in, then it has received
 * a "good" frame of data.  Upon receiving a "good" frame of data, the FR 
 * asserts frame_ready and continues to do so until one cycle after llc_ack is
 * asserted by the LLC.
 *
 * NOTE: CS only asserts if there is an F/Jam on the channel line!
 *       Once reqbit is asserted, the data is received 2 clock cycles later!
 * 
 */
module FrameReceiver(clk, data_in, send_plr, frame_ready, llc_ack, CS);
input clk;
input llc_ack, CS;
input wire [0:1] data_in;
output frame_ready, send_plr;

wire send_plr, frame_ready, llc_ack, CS;

reg frm_ready;
reg reqbit;

assign frame_ready = frm_ready;
assign send_plr = reqbit;

reg count;

reg extra_cycle;

initial begin
	count = 0;
	reqbit = `myFALSE;
	frm_ready = `myFALSE;
	extra_cycle = 0;
end


always @(posedge clk) begin

	if (frm_ready == `myTRUE)
	 	begin 
		if (llc_ack == `myTRUE)		frm_ready = `myFALSE;
		end

	/*else begin */		/* frm_ready == `myFALSE */
	if (count == 1 && data_in == `ND)        /* valid data seen */
		begin
                frm_ready = `myTRUE;
                count = 0;
                end
        else if (count == 1)    count = 0;      /* not valid data */

	if (reqbit == `myTRUE || extra_cycle == 1)
		begin
		if (reqbit == `myTRUE)   extra_cycle = 1;
		else extra_cycle = 0;

		if (data_in == `F)        count = count + 1;      /* good data */
                end

	if (CS == `myTRUE)	reqbit = `myTRUE;
	else reqbit = `myFALSE;

/*	end */	/* end of frm_ready == `myFALSE */
		
end

endmodule

/*****************************************************************************/

module PLS(clk, send_signal, channel );
input clk;
input wire [0:1] send_signal;
output wire [0:1] channel;

reg [0:1] channel_send_data;

assign channel   = channel_send_data;

initial channel_send_data = `ND;

always @(posedge clk) begin
   channel_send_data = send_signal;
end

endmodule


/*****************************************************************************/

module PLR(clk, send_next_bit, send_FR_signal, channel);
input clk;
input send_next_bit;
input wire [0:1] channel;
output wire [0:1] send_FR_signal;

wire [0:1] connect;
wire send_next_bit;

reg [0:1] channel_receive_data;
reg [0:1] receive_to_FR;

assign connect        = channel_receive_data;
assign send_FR_signal = receive_to_FR; 

initial channel_receive_data = `ND;
initial receive_to_FR       = `ND;

always @(posedge clk) begin

   if (send_next_bit == `myTRUE)	receive_to_FR = connect;
   else receive_to_FR = `ND;     /* added by momeng */
   
   channel_receive_data = channel;

end

endmodule


/*****************************************************************************/

module CHNL(clk, data_in_1, data_in_2, carrier_sense, collision_detect, data_out);
input clk;
input wire [0:1] data_in_1, data_in_2;
output carrier_sense, collision_detect;
output wire [0:1] data_out;

wire carrier_sense, collision_detect;

reg carrier_sense_reg;
reg collision_detect_reg;
reg [0:1] data_out_reg;

assign carrier_sense    = carrier_sense_reg;
assign collision_detect = collision_detect_reg;
assign data_out         = data_out_reg;

initial data_out_reg         = `ND;
initial carrier_sense_reg    = `myFALSE;
initial collision_detect_reg = `myFALSE;

always @(posedge clk) begin

   if ( data_in_1 == `ND )
   begin
      data_out_reg = data_in_2;
   end
   else if ( data_in_2 == `ND )
   begin
      data_out_reg = data_in_1;
   end
   else
   begin
      data_out_reg = `Jam;
   end

   if ( !( (data_in_1 == `ND ) && ( data_in_2 == `ND) ) )
   begin
      carrier_sense_reg = `myTRUE;
   end
   else
   begin
      carrier_sense_reg = `myFALSE;
   end

   if ( !( (data_in_1 == `ND) || (data_in_2 == `ND)) || (data_in_1 == `Jam) || (data_in_2 == `Jam))
   begin
      collision_detect_reg = `myTRUE;
   end
   else
   begin
      collision_detect_reg = `myFALSE;
   end

end
endmodule
