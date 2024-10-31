
// Simple 16x16 crossbar
//
// Mike Hutton, Altera Corp.
//

module xbar_16x16(in,out,s,clk);
    input [15:0] in;			// 16-bit input bus
    input [63:0] s;				// 16 select signals by 4-bit
    input clk;
    output [15:0] out;			// 16-bit output bus
    reg [15:0] out;				
    integer k;

    reg [15:0] inreg;
 
    always@ (posedge clk)
    begin
	  inreg <= in;
        for (k = 0; k < 16; k = k+1)
        begin
            out[k] <= inreg[{s[4*k+3],s[4*k+2],s[4*k+1],s[4*k]}];
        end
    end
endmodule

