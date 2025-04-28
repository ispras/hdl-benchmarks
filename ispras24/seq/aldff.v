module aldff(CLK, ALOAD, AD, D, Q);

  parameter WIDTH = 3;
  parameter CLK_POLARITY = 1'b1;
  parameter ALOAD_POLARITY = 1'b1;

  input CLK, ALOAD;
  input [WIDTH-1:0] AD;
  input [WIDTH-1:0] D;
  output reg [WIDTH-1:0] Q;
  wire pos_clk = CLK == CLK_POLARITY;
  wire pos_aload = ALOAD == ALOAD_POLARITY;

  always @(posedge pos_clk, posedge pos_aload) begin
    if (pos_aload)
      Q <= AD;
    else
      Q <= D;
  end

endmodule
