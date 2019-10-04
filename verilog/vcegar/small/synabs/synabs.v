module main (i, clock);
input i,clock;
reg [5:0]a,b,c,t;

initial a = 1;
initial b = 5;
initial c = 7;
initial t = 11;

always @ (posedge clock) begin

	if (b == 5)
		a <= 5;
	else if (c == 1)	
		a <= 7;
	else if (b == 1)	
		a <= 3;
	else a<= t;

	b <= c;
	c <= a;
	t <= t + 2;

end
endmodule
