module dpram_32x32 (
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

	input [31:0] data_a;
	input  wren_a;
	input [5:0] address_a;
	input [31:0] data_b;
	input [5:0] address_b;
	input  wren_b;
	input  clock_a;
	input  enable_a;
	input  clock_b;
	input  enable_b;
	output [31:0] q_a;
	output [31:0] q_b;


	dpram_32x32_bb ram1 (
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
