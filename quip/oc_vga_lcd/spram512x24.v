module spram512x24 (
	address,
	clock,
	data,
	wren,
	q);

	input [8:0] address;
	input  clock;
	input [23:0] data;
	input  wren;
	output [23:0] q;


	spram512x24_bb ram1 (
		.address(address),
		.clock(clock),
		.data(data),
		.wren(wren),
		.q(q));



endmodule
