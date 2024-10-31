module dpram40x256 (
	data_a,
	wren_a,
	address_a,
	data_b,
	address_b,
	wren_b,
	clock_a,
	enable_a,
	clock_b,
	enable_b,
	q_a,
	q_b);

	input [39:0] data_a;
	input  wren_a;
	input [7:0] address_a;
	input [39:0] data_b;
	input [7:0] address_b;
	input  wren_b;
	input  clock_a;
	input  enable_a;
	input  clock_b;
	input  enable_b;
	output [39:0] q_a;
	output [39:0] q_b;


	dpram40x256_bb ram1 (
		.data_a(data_a),
		.wren_a(wren_a),
		.address_a(address_a),
		.data_b(data_b),
		.address_b(address_b),
		.wren_b(wren_b),
		.clock_a(clock_a),
		.enable_a(enable_a),
		.clock_b(clock_b),
		.enable_b(enable_b),
		.q_a(q_a),
		.q_b(q_b));



endmodule
