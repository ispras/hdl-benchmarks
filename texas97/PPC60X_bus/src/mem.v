`include "define.v"
<<<<<<< HEAD
`include "arbiter.v"
=======
`include "include.lib"
>>>>>>> 8072c14ffe950f490f1872c9fc725d3ca61eced9

module	mem(	.clk(clk),
		.TS_(TS_),
		.TT(TT),
		.GBL_(GBL_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.DBB_(DBB_),
		.TA_(TA_),
		.DRTRY_(DRTRY_),
		.BG1_(BG1_),
		.BG2_(BG2_),
		.DBG1_(DBG1_));

	input	clk;

	/* address start signals */
	
	input		TS_;		// transfer start

	/* transfer attributes; see page 70, Book IV */

	input	[0:4] TT;	       	// transfer type
   
	input		GBL_;		// global

	/* address termination signals */

	output		AACK_;		// address ack.
	input		ARTRY_;		// address retry

	/* data bus arbitration signals */

	input		DBB_;		// data bus busy

	/* data bus transfer termination signals */

	output		TA_;		// transfer ack.
	output		DRTRY_;		// data retry

	input		BG1_,BG2_,DBG1_;

	// TEA_ is omitted here.

        // need to add a random variable for use with Address Status
        wire [1:0] ran_address_status;
   

        reg [1:0] addr_status_fsm;
   
	initial addr_status_fsm <= `AddrStatusIDLE;

	reg hold_ta;

        assign ran_address_status = ND_2(`AddrStatusAACK_WAIT,`AddrStatusAACK);
   
	initial hold_ta <= 0;

	// As explained in a comment in define.c, AACK_ may not be asserted until at least
	// 3 cycles after assertion of TS_.  Also TA_ may not be asserted too soon
	// according to the same rule; see page 77, point #1.  So, we introduce a finite
	// state machine addr_status_fsm that monitors the progress of an address tenure.
	// We also introduce a register hold_ta that tells us to wait before asserting
	// TA_, which becomes 1 exactly at the first time that AACK_ *could* be asserted,
	// whether it is actually asserted then or not.

	// There is no need to wait when the operation is a snoop push, indeed whenever
	// GBL_ is negated.  We take advantage of this use of hold_ta as suggested by the
	// scenario in Note 2 below.

	always @(posedge clk)
		case (addr_status_fsm)

		`AddrStatusIDLE:

			if (TS_`asserted0) begin
				addr_status_fsm <= `AddrStatusDELAY;
				if (TT != 5'b00110)	// was XferTypeWRITE_N_KILL J. Denison// not a snoop push
					hold_ta <= 1;
			end

		`AddrStatusDELAY:

			addr_status_fsm <= `AddrStatusAACK_WAIT;

		`AddrStatusAACK_WAIT: begin

			hold_ta <= 0;
		   addr_status_fsm <= ran_address_status;
		   
		end

		`AddrStatusAACK:

			addr_status_fsm <= `AddrStatusIDLE;

		endcase

	/*
	** logic for AACK_
	*/

	assign AACK_ = (addr_status_fsm == `AddrStatusAACK) ? 1'b0 : 1'bz;

	// The Data Bus stuff

	// The protocol requires (page 77, point #1; see also comments.v) that TA_ not be
	// asserted until at least 3 cycles after TS_ is asserted.  However, we support
	// split-bus transactions.  Consider what happens if cpu2 starts an address tenure
	// (by asserting TS_) when cpu1 starts its data tenure.  There need be no delay in
	// that case.  The rule is:  when a data tenure starts, the memory only needs to
	// delay TA_ if the data bus master is the same as the address bus master.
	// Otherwise, the opportunity for ARTRY_ has already passed.

	// NOTE 1:  Suppose that cpu1 is ready to start a data tenure, then cpu2 starts an
	// address tenure, and cpu1 then snoops cpu2's address tenure.  Then there does
	// not need to be any delay in sending TA for the cpu1 (original) data tenure,
	// because the delay in asserting ARTRY_ on cpu2's address tenure is more than
	// enough delay for cpu1's (first) data tenure.

	// NOTE 2:  We allow address bus pipelining when a snoop push needs to take place.
	// A snoop push is never snooped (see the shared_enabled signal in cpu.v; also see
	// the comment below above the assignment of must_delay_ta), and it's a good
	// thing.  For suppose (for example) that cpu1 starts a data tenure (for an
	// earlier address tenure), then cpu2 starts an address tenure, then cpu1 snoops
	// cpu2's address tenure and starts an address tenure for its snoop push (but
	// suppose that cpu1's earlier data tenure is far from complete), and then cpu2
	// snoops cpu1 (we are presuming this can't happen and are about to show why we
	// care).  Since cpu1 currently owns both the data bus and the address bus (even
	// though the data tenure does not correspond to the address tenure), our model
	// would use this ARTRY_ to cancel the current cpu1 data tenure, which would be a
	// mistake.  As it is, since hold_ta is not set when we are doing a snoop push, we
	// will be ready to assert TA_ on the old data tenure.


	/*
	** Address and data bus masters
	*/

	// First, let's figure out which cpu is the address bus master.  The idea is that
	// whenever we see a bus grant, we remember who was granted the bus, and if TS_ is
	// asserted at the next cycle then we know who asserted it.  Here, we define the
	// address bus master as the cpu which last asserted TS_ (and by this we mean to
	// consider a cpu currently asserting TS_ as the address bus master).

	 reg next_address_bus_master;
         reg address_bus_master_fsm;

// LOOK HERE JUSTIN
        initial address_bus_master_fsm <= `CPU1;

	always @(posedge clk) begin
		if (BG1_`asserted0)
			next_address_bus_master <= `CPU1;
		else if (BG2_`asserted0)
			next_address_bus_master <= `CPU2;
	end // always @ (posedge clk)
   
	always @(posedge clk) begin
	   if (TS_`asserted0) begin
	      if (next_address_bus_master == `CPU1) address_bus_master_fsm <= `CPU1;
	      else address_bus_master_fsm <= `CPU2;
	   end // if (TS_`asserted0)
	end // always @ (posedge clk)
   

//	verdict_init address_bus_master_fsm == `CPU1 ||
//		     address_bus_master_fsm == `CPU2;

	 wire address_bus_master =
		(TS_`asserted0) ? next_address_bus_master : address_bus_master_fsm;

	// Next, let's figure out which cpu is the data bus master.  The idea is that
	// whenever we see a data bus grant, we remember who was granted the data bus.
	// Here, we define the data bus master as the cpu that last took the data bus
	// (starting with the cycle where DBB_ is asserted, including that cycle).

	 reg data_bus_master;

	initial data_bus_master <= `CPU1;

	always @(posedge clk)
		if (DBB_`negated1)
			data_bus_master <= (DBG1_`asserted0) ? `CPU1 : `CPU2;

	/*
	** Assignment of TA_
	*/

	wire valid_artry = (ARTRY_`asserted0 && data_bus_master == address_bus_master);
	reg ta_reg_;	// the value of TA_ at the next cycle, if TA_ is legal
	
		// The wire must_delay_ta is only valid when a data tenure in progress, as defined
	// by assertion of DBB_ or DRTRY_ (cf. page 56, Book IV).  If GBL_ is negated,
	// then we do not have to delay TA_.  (Thanks to Anna Lam for pointing this out;
	// note also that GBL_ is negated during a snoop push, cf. Book IV page 49).

	wire must_delay_ta = (data_bus_master == address_bus_master && hold_ta
							&& GBL_`asserted0);
	
	assign TA_ = (	(DBB_`asserted0 || DRTRY_`asserted0) &&
			!valid_artry &&
			!must_delay_ta ) ? ta_reg_ : 1;
   wire ran_ta_reg_;
   assign ran_ta_reg_ = ND_2(0,1);
   
	
	initial ta_reg_ <= 1;
	always @(posedge clk)
	   ta_reg_ <= ran_ta_reg_;
   



	

	/*
	** Assignment of DRTRY_
	*/
   wire ran_DRTRY_;
   
   assign ran_DRTRY_ = ND_2(0,1);
   
	reg DRTRY_;
	initial DRTRY_ <= 1;

	// Note:  page 56, Book IV says that "DRTRY_ is ignored by Typhoon processor on
	// write transactions."  It seems appropriate, then, not to over-constrain our
	// memory model by insisting that it only assert DRTRY_ during read transactions;
	// at least, that's a reasonable rationalization for ignoring the transaction type
	// if doing so will simplify our model.

	always @(posedge clk)
		if (valid_artry)
			DRTRY_ <= 1;
		else if (TA_`asserted0)
		   DRTRY_	<= ran_DRTRY_;
   
		else if (DRTRY_`asserted0)
			// must hold DRTRY_ asserted (Book IV, top of page 83)
			DRTRY_	<= 0;
		else
			DRTRY_	<= 1;

endmodule
