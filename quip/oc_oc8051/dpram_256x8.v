module dpram_256x8 (
	data,
	wren,
	wraddress,
	rdaddress,
	wrclock,
	wrclocken,
	rdclock,
	rdclocken,
	q);

	input [7:0] data;
	input  wren;
	input [7:0] wraddress;
	input [7:0] rdaddress;
	input  wrclock;
	input  wrclocken;
	input  rdclock;
	input  rdclocken;
	output [7:0] q;


	dpram_256x8_bb ram1 (
		.data(data),
		.wren(wren),
		.wraddress(wraddress),
		.rdaddress(rdaddress),
		.wrclock(wrclock),
		.wrclocken(wrclocken),
		.rdclock(rdclock),
		.rdclocken(rdclocken),
		.q(q));



endmodule
