module main (clock);
input clock;
reg [2:0]a,b;

initial a = 3'b010;
initial b = 3'b110;

always @ (posedge clock) begin
	a[2] <= b[0];
	a[1:0] <= b [2:1];	
	b[2:1] <= a[1:0];
	b[0] <= a[2];
end
endmodule
