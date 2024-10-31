/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Buffer allocation model derived from Ken McMillan's.
// The modifications were meant to adapt the description to the requirements
// of vl2mv.
//
// Author: Fabio Somenzi <Fabio@Colorado.EDU>
//
module buffer_alloc(clock,alloc_raw,nack,alloc_addr,free_raw,free_addr_raw);
    input		     clock;
    input 		     alloc_raw;
    output 		     nack;
    output [(4-1):0] alloc_addr;
    input 		     free_raw;
    input [(4-1):0]  free_addr_raw;

    reg 		     busy [0:(16 - 1)];
    reg [4:0] 	     count;
    reg 		     alloc, free;
    reg [(4-1):0]    free_addr;
    integer 		     i;

    initial begin
        for (i = 0; i < 16; i = i + 1)
	  busy[i] = 0;
	count = 0;
	alloc = 0;
	free = 0;
	free_addr = 0;
    end

    assign nack = alloc & (count == 16);
    assign alloc_addr =
		       ~busy[0] ? 0 :
		       ~busy[1] ? 1 :
		       ~busy[2] ? 2 :
		       ~busy[3] ? 3 :
		       ~busy[4] ? 4 :
		       ~busy[5] ? 5 :
		       ~busy[6] ? 6 :
		       ~busy[7] ? 7 :
		       ~busy[8] ? 8 :
		       ~busy[9] ? 9 :
		       ~busy[10] ? 10 :
		       ~busy[11] ? 11 :
		       ~busy[12] ? 12 :
		       ~busy[13] ? 13 :
		       ~busy[14] ? 14 :
		       ~busy[15] ? 15 :
		       0;

    always @ (posedge clock) begin
	alloc = alloc_raw;
	free = free_raw;
	free_addr = free_addr_raw;
	count = count + (alloc & ~nack) - (free & busy[free_addr]);
	if (free) busy[free_addr] = 0;
	if (alloc & ~nack) busy[alloc_addr] = 1;
    end

/*#PASS: count is less than or equal to 16.
count[4]=0 + count[3:0]=0;*/	
	assert property (count<=5'd16);

endmodule // buffer_alloc
