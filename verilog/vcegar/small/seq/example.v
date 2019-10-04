module main (clk);
input clk;
reg [100:0] a,b;	
	
initial a = 1;
initial b = 0;


always @ (posedge clk) begin
	if (a<100) 
	   a<=b+a;

	b <=a;
end

//always begin

//assert property: (a<200);
//end

endmodule
