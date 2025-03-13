
`include "define.v"
<<<<<<< HEAD
`include "cpu.v"
=======
`include "mem.v"
>>>>>>> 8072c14ffe950f490f1872c9fc725d3ca61eced9

/*	The main idea of this module is to randomly assign the address bus grant, using
	BG1_ and BG2_, to at most one of the cpus.  Originally we used two fairness
	constraints to make the arbitration fair, but that seemed computationally
	expensive.  So, we are trying a simple alternating scheme together with a single
	fairness constraint.

	Note that we need at least one fairness assertion, in order to guarantee
	that address and data tenures eventually terminate.  Once we allow address
	tenures to start while a data tenure is active, we may need to introduce more
	fairness in order to guarantee that data tenures terminate; currently we get that
	for free by requiring that address tenures keep starting, since they wait on data
	tenure completion.  Fortunately, at that point we can probably get by with a
	single fairness constraint asserting that we keep getting to points at which both
	the address and data tenures are idle, for all CPUs.  We'll see.....
*/

module	arb2(	.clk(clk),
		.BR1_(BR1_),
		.BR2_(BR2_),
		.BG1_(BG1_),
		.BG2_(BG2_),
		.TS_(TS_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.DBG1_(DBG1_),
		.DBG2_(DBG2_));

	input	clk;


	/* arbitration signals  */

	input		BR1_;		// bus request CPU
	input		BR2_;		// bus request CPU
	output		BG1_;		// bus grant CPU
	output		BG2_;		// bus grant CPU

	/* address start signals */
	
	input		TS_;		// transfer start

	/* address termination signals */

	input		AACK_;		// address ack.
	input		ARTRY_;		// address retry

	/* data bus arbitration signals */

	output		DBG1_;		// data bus grant CPU1
	output		DBG2_;		// data bus grant CPU1


	wire	bus_request;

	// Arbiter FSM

	reg [2:0] arbiter_fsm;


	// Arbiter

	// In this model, the arbiter alternates its address bus grant when it has to
	// decide between competing requests.  An advantage of this model is that with
	// just the three bits of arbiter_fsm, we can state a single fairness requirement
	// that not only requires acknowledge signals to come in but also is fair in
	// granting the bus.

	// The timing diagram on page 76 of Book IV illustrates the following sequence.

	// AACK_	ARTRY_		BR_[snooper]	BG_[arbiter]

	// This sequence tempted us to define our arbiter states to assume the following
	// sequence (assuming cpu1 is the master and cpu2 is the snooper, just to be
	// definite).

	// GRANTED1	GRANTED1_AACK	IDLE1		GRANTED2

	// Our plan was to not issue a bus grant during what we now call the GRANTED1_AACK
	// state.  However, when there was no assertion of ARTRY_ at that time, our plan
	// precluded the possibility of bus parking, as shown by failure of the following
	// spec.

	//      AG(EF(BR1_`negated1 && BR2_`negated1 && EX(EX(TS_`asserted0))))

	// The GRANTED1_AACK and GRANTED2_AACK states permit the assignment of bus grants
	// during the ARTRY_ window.  The appropriate cpu can use this bus grant and stay
	// parked on the bus if ARTRY_ is not asserted; see the AddressTenureAWINDOW state
	// of address_tenure_fsm in the cpu module.  Note that our fairness constraint
	// guarantees that we will not park the same cpu on the bus forever.

	// Note that if there is a snoop, our arbiter will return to the idle state in
	// time to make the necessary bus grant.  If there is no snoop, the same timing
	// applies except that anyone can be granted the bus next, in principle.

	initial arbiter_fsm <= `ArbiterStatusIDLE1;
	always @(posedge clk) begin
		case(arbiter_fsm)

		`ArbiterStatusIDLE1, `ArbiterStatusIDLE2:

			// Grant the address bus if there is a bus request, granting it to
			// the cpu who did not own it last if both cpus are requesting the
			// bus.  But first, there are a couple of exceptions.

			if	(ARTRY_`asserted0)

			// Do not grant the bus:  no bus parking opportunity will be lost,
			// and we need to be ready for the bus request of the snooper.

				arbiter_fsm <= arbiter_fsm;

			else if	(TS_`asserted0)

			// The bus must have been granted the previous cycle; this is a
			// bus parking situation.  Move to the appropriate state to
			// reflect that the bus was granted.  At one time we simply stayed
			// in the idle state, which resulted in moving out of an idle
			// state upon AACK_ assertion.  The arbiter_fsm then stayed in the
			// GRANTED1 state (waiting for the next AACK_, even though no
			// address tenure was underway any more!) while the snooping cpu
			// was unable to get the bus.

				arbiter_fsm <= (arbiter_fsm == `ArbiterStatusIDLE1) ?
						`ArbiterStatusGRANTED1 :
						`ArbiterStatusGRANTED2;

			else if	(BR1_`asserted0 && BR2_`negated1)
				arbiter_fsm <= `ArbiterStatusGRANTED1;
			else if (BR2_`asserted0 && BR1_`negated1)
				arbiter_fsm <= `ArbiterStatusGRANTED2;
			else if (BR1_`negated1 && BR2_`negated1)
				arbiter_fsm <= arbiter_fsm;

			// Otherwise both bus requests are asserted, and we should grant
			// the bus to whomever didn't have it last time.

			else
				arbiter_fsm <= (arbiter_fsm == `ArbiterStatusIDLE1) ?
						`ArbiterStatusGRANTED2 :
						`ArbiterStatusGRANTED1;

		`ArbiterStatusGRANTED1:
			if(AACK_`asserted0)
				arbiter_fsm <= `ArbiterStatusGRANTED1_AACK;

		`ArbiterStatusGRANTED1_AACK:
			arbiter_fsm <= `ArbiterStatusIDLE1;

		`ArbiterStatusGRANTED2:
			if(AACK_`asserted0)
				arbiter_fsm <= `ArbiterStatusGRANTED2_AACK;

		`ArbiterStatusGRANTED2_AACK:
			arbiter_fsm <= `ArbiterStatusIDLE2;

		endcase
	end

	assign BG1_ =  !(arbiter_fsm == `ArbiterStatusGRANTED1 ||
			 arbiter_fsm == `ArbiterStatusGRANTED1_AACK);
	assign BG2_ =  !(arbiter_fsm == `ArbiterStatusGRANTED2 ||
			 arbiter_fsm == `ArbiterStatusGRANTED2_AACK);

   wire ran_DBG1_reg_;
   assign ran_DBG1_reg_ = ND(0,1);
   
	reg DBG1_reg_;
	initial DBG1_reg_ <= 1;
	always @(posedge clk) begin
	   DBG1_reg_ <= ran_DBG1_reg_;
	end

	assign DBG1_ = DBG1_reg_;
	assign DBG2_ = !DBG1_reg_;

endmodule
