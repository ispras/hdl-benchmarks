module dpram128x24 (
	data,
	wren,
	wraddress,
	rdaddress,
	wrclock,
	rdclock,
	q);

	input [23:0] data;
	input  wren;
	input [6:0] wraddress;
	input [6:0] rdaddress;
	input  wrclock;
	input  rdclock;
	output [23:0] q;


	dpram128x24_bb ram1 (
		.data(data),
		.wren(wren),
		.wraddress(wraddress),
		.rdaddress(rdaddress),
		.wrclock(wrclock),
		.rdclock(rdclock),
		.q(q));



endmodule
