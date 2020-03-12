/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/

// Model to check the equivalence of two different FIFO implementations.
// This example is taken from Ken McMillan's "A Conjunctively Decomposed
// Boolean Representation for Symbolic Model Checking" (CAV'96), though
// the details are probably different.
//
// Author: Fabio Somenzi <Fabio@Colorado.EDU>

module compareFIFOs(clock,dataIn,push,pop,equal);
    parameter	   MSBD = 3;
    parameter	   LAST = 15;
    parameter	   MSBA = 3;
    input	   clock;
    input [MSBD:0] dataIn;
    input	   push;
    input	   pop;
    output	   equal;

    wire [MSBD:0]  srDataOut;
    wire	   srFull, srEmpty;
    wire [MSBD:0]  rbDataOut;
    wire	   rbFull, rbEmpty;

    srFIFO #(MSBD,LAST,MSBA) sr (clock, dataIn, push, pop,
				srDataOut, srFull, srEmpty);

    rbFIFO #(MSBD,LAST,MSBA) rb (clock, dataIn, push, pop,
				rbDataOut, rbFull, rbEmpty);

    // The outputs of the two FIFOs are not specified when the
    // buffers are empty.
    assign equal = (srFull == rbFull) & (srEmpty == rbEmpty) &
	(srEmpty | (srDataOut == rbDataOut));
	
always @(posedge clock) begin
	assert(equal == 1'd1);
end
endmodule // compareFIFOs


// Shift register FIFO.
// tail points to the first element of the queue unless the buffer is empty.
// the new data is always inserted in position 0 of the buffer, after
// shifting the contents up by one position.
// A push on a full buffer is a NOOP.
// A pop from an empty buffer is a NOOP.
// If both push and pop are asserted at the same clock cycle, only the push
// operation is performed.
// dataOut gives the first element of the queue unless the buffer is empty,
// in which case its value is arbitrary.
module srFIFO(clock,dataIn,push,pop,dataOut,full,empty);
    parameter	    MSBD = 3;
    parameter	    LAST = 15;
    parameter	    MSBA = 3;
    input	    clock;
    input [MSBD:0]  dataIn;
    input	    push;
    input	    pop;
    output [MSBD:0] dataOut;
    output	    full;
    output	    empty;

    reg [MSBD:0]    mem[0:LAST];
    reg [MSBA:0]    tail;
    reg		    empty;
    wire full;
    integer	    i;

    initial begin
        for (i = 0; i <= LAST; i = i + 1)
	    mem[i] = 0;
	tail = 0;
	empty = 1;
    end // initial begin

    always @ (posedge clock) begin
	if (push & ~full) begin
	    for (i = LAST; i > 0; i = i - 1)
		mem[i] <= mem[i - 1];
	    mem[0] <= dataIn;
	    if (~empty)
		tail <= tail + 1;
	    empty <= 0;
	end // if (push & ~full)
	else if (pop & ~empty) begin
	    if (tail == 0)
		empty <= 1;
	    else
		tail <= tail - 1;
	end // if (pop & ~empty)
    end // always @ (posedge clock)

    assign dataOut = mem[tail];
	
    assign full = tail == LAST;

endmodule // srFIFO


/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified for YOSYS BTOR Backend <http://www.clifford.at/yosys/>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Ring buffer FIFO.
// head points to the insertion point unless the buffer is full.
// tail points to the first element in the queue unless the buffer is empty.
// A push on a full buffer is a NOOP.
// A pop from an empty buffer is a NOOP.
// If both push and pop are asserted at the same clock cycle, only the push
// operation is performed.
// dataOut gives the first element of the queue unless the buffer is empty,
// in which case its value is arbitrary. 
module rbFIFO(clock,dataIn,push,pop,dataOut,full,empty);
    parameter	    MSBD = 3;
    parameter	    LAST = 15;
    parameter	    MSBA = 3;
    input	    clock;
    input [MSBD:0]  dataIn;
    input	    push;
    input	    pop;
    output [MSBD:0] dataOut;
    output	    full;
    output	    empty;

    reg [MSBD:0]    mem[0:LAST];
    reg [MSBA:0]    head;   
    reg [MSBA:0]    tail;
    reg		    empty;
    wire full;
    integer	    i;

    initial begin
       for (i = 0; i <= LAST; i = i + 1)
	 mem[i] = 0;
	head = 0;
	tail = 0;
	empty = 1;
    end // initial begin

    always @ (posedge clock) begin
	if (push & ~full) begin
	    mem[head] <= dataIn;
	    head <= head + 1;
	    empty <= 0;
	end // if (push & ~full)
	else if (pop & ~empty) begin
	    tail <= tail + 1;
	    if (tail == head)
		empty <= 1;
	end // if (pop & ~empty)
    end // always @ (posedge clock)

    assign dataOut = mem[tail];
	
    assign full = (tail == head) & ~empty;

endmodule // rbFIFO
