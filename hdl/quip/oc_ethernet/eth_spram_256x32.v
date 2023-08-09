module eth_spram_256x32 (clk, rst, ce, we, oe, addr, di, do);

	input           clk;  // Clock, rising edge
	input           rst;  // Reset, active high
	input           ce;   // Chip enable input, active high
	input  [3:0]    we;   // Write enable input, active high
	input           oe;   // Output enable input, active high
	input  [7:0]    addr; // address bus inputs
	input  [31:0]   di;   // input data bus
	output [31:0]   do;   // output data bus


	eth_spram_256x32_bb ram1 (
		.address(addr),
		.clock(clk),
		.clken(ce),
		.data(di),
		.wren(we[0]),
		.q(do));



endmodule
