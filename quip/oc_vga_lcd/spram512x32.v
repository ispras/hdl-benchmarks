module spram512x32 (
	address,
	clock,
	data,
	wren,
	q);

	input [8:0] address;
	input  clock;
	input [31:0] data;
	input  wren;
	output [31:0] q;


	spram512x32_bb ram1 (
		.address(address),
		.clock(clock),
		.data(data),
		.wren(wren),
		.q(q));



endmodule
