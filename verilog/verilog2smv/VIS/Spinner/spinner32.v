/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Spinner.
//
// Author: Fabio Somenzi <Fabio@Colorado.EDU>


module spinner(clock,spin,amount,din,dout);
    input	      clock;
    input 	      spin;
    input [4:0]       amount;
    input [31:0]      din;
    output [31:0]     dout;

    reg [31:0] 	      dout;
    reg [31:0] 	      inr;
    reg 	      spl;

    wire [31:0]       tmp0;
    wire [31:0]       tmp1;
    wire [31:0]       tmp2;
    wire [31:0]       tmp3;
    wire [31:0]       tmp4;
    wire [31:0]       tmp5;

    initial begin
	dout = 0;
	inr = 0;
	spl = 0;
    end

    assign tmp0 = inr;
    assign tmp1[30:0] = amount[0] ?  tmp0[31:1] : tmp0[30:0];
    assign tmp1[31] = amount[0] ?  tmp0[0] : tmp0[31];
    assign tmp2[29:0] = amount[1] ?  tmp1[31:2] : tmp1[29:0];
    assign tmp2[31:30] = amount[1] ?  tmp1[1:0] : tmp1[31:30];
    assign tmp3[27:0] = amount[2] ?  tmp2[31:4] : tmp2[27:0];
    assign tmp3[31:28] = amount[2] ?  tmp2[3:0] : tmp2[31:28];
    assign tmp4[23:0] = amount[3] ?  tmp3[31:8] : tmp3[23:0];
    assign tmp4[31:24] = amount[3] ?  tmp3[7:0] : tmp3[31:24];
    assign tmp5[15:0] = amount[4] ?  tmp4[31:16] : tmp4[15:0];
    assign tmp5[31:16] = amount[4] ?  tmp4[15:0] : tmp4[31:16];

    always @ (posedge clock) begin
	if (spl)
	  inr <= dout;
	else
	  inr <= din;
	dout <= tmp5;
	spl <= spin;
    end // always @ (posedge clock)

//invariant: # FAIL:
//!(dout[31:0]=b10101010101010101010101010101010);
	assert property (	dout!=32'b10101010101010101010101010101010	);

endmodule // rotate
