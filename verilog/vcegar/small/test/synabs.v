module main (i, clock);
input i,clock;
reg [5:0]a,b;

initial a = 0;
initial b = 6;

always @ (posedge clock) begin
	a <= a + 2;
	b <= b + 2;	

end
endmodule
