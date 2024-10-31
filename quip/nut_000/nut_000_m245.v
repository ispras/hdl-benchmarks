// 35 ins 33 outs
module nut_000_m245 (clock,reset,ins,outs);
input clock,reset;
input [34:0] ins;
output [32:0] outs;
io_alarm io_alarm_inst (
  .rst_not(!reset),
  .rp_ta(ins[0]),
  .lias_dv(ins[1]),
  .lias(ins[33:2]),
  .liad_cs(ins[34]),
  .clk(clock),
  .lias_den(outs[0]),
  .alarm(outs[32:1])
);
endmodule

module io_alarm
(
	alarm,
	lias_den, lias, lias_dv,
	liad_cs, rp_ta,
	clk, rst_not
);
	output	[31:0]	alarm;
	output		lias_den;
	input	[31:0]	lias;
	input		lias_dv;
	input		liad_cs;
	input		rp_ta;
	input		clk;
	input		rst_not;
	reg	[31:0]	alarm;
	reg		lias_den;
	reg		lias_dv_z1;
	always @ (posedge clk or negedge rst_not)
	begin: WR_Z1
		if (~rst_not) begin
			lias_dv_z1 <= 1'b0;
		end else begin
			lias_dv_z1 <= lias_dv;
		end
	end
	always @ (posedge clk or negedge rst_not)
	begin: DEN
		if (~rst_not) begin
			lias_den <= 1'b0;
		end else if (lias_dv | lias_dv_z1) begin
			lias_den <= 1'b0;
		end else begin
			lias_den <= 1'b1;
		end
	end
	always @ (posedge clk or negedge rst_not)
	begin: ALARM
		if (~rst_not) begin
			alarm[31:0] <= 32'h0000_0000;
		end else if (lias_dv_z1 & liad_cs & rp_ta) begin
			alarm[31:0] <= lias[31:0];
		end else if (liad_cs & rp_ta) begin
			alarm[31:0] <= 32'h0000_0000;
		end else if (lias_dv_z1) begin
			alarm[31:0] <= alarm[31:0] | lias[31:0];
		end
	end
endmodule
