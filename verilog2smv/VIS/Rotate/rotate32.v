/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Right rotator.
//
// Author: Fabio Somenzi <Fabio@Colorado.EDU>


module rotate(clock,amount,din,dout);
    input	      clock;
    input [4:0] amount;
    input [31:0]    din;
    output [31:0]   dout;

    reg [31:0]      dout;
    reg [31:0]      inr;

    wire [31:0] tmp0;
    wire [31:0] tmp1;
    wire [31:0] tmp2;
    wire [31:0] tmp3;
    wire [31:0] tmp4;
    wire [31:0] tmp5;

    initial begin
	dout = 0;
	inr = 0;
    end

    assign tmp0 = inr;
    assign tmp1 = amount[0] ?
	{tmp0[0:0], tmp0[31:1]} : tmp0;
    assign tmp2 = amount[1] ?
	{tmp1[1:0], tmp1[31:2]} : tmp1;
    assign tmp3 = amount[2] ?
	{tmp2[3:0], tmp2[31:4]} : tmp2;
    assign tmp4 = amount[3] ?
	{tmp3[7:0], tmp3[31:8]} : tmp3;
    assign tmp5 = amount[4] ?
	{tmp4[15:0], tmp4[31:16]} : tmp4;

    always @ (posedge clock) begin
	dout <= tmp5;
	inr <= din;
    end // always @ (posedge clock)

//# FAIL:
//!(dout[31:0]=b10101010101010101010101010101010);
	assert property (!(dout==32'b10101010101010101010101010101010));
endmodule // rotate
