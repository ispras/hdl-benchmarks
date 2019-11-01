/*
 *
 * Taken from VCEGAR benchmarks -- http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz
 * Modified by Ahmed Irfan <irfan@fbk.eu>
 *
 */ 

module main (clk);
input clk;
reg [2500:0] a,b;	
	
initial a = 1;
initial b = 0;


always @ (posedge clk) begin
	if (a<100) 
	   a<=b+a;

	b <=a;
end

//always begin

assert property (a<200);
//end

endmodule
