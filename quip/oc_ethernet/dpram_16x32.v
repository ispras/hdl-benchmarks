module dpram_16x32 (
	data,
	wren,
	wraddress,
	rdaddress,
	wrclock,
	rdclock,
	q);

	input [31:0] data;
	input  wren;
	input [3:0] wraddress;
	input [3:0] rdaddress;
	input  wrclock;
	input  rdclock;
	output [31:0] q;


	dpram_16x32_bb ram1 (
		.data(data),
		.wren(wren),
		.wraddress(wraddress),
		.rdaddress(rdaddress),
		.wrclock(wrclock),
		.rdclock(rdclock),
		.q(q));



endmodule
