module demux(A, S, Y);

  parameter WIDTH = 4;
  parameter S_WIDTH = 4;

  input [WIDTH-1:0] A;
  input [S_WIDTH-1:0] S;
  output [(WIDTH << S_WIDTH)-1:0] Y;

  genvar i;
  generate
    for (i = 0; i < (1 << S_WIDTH); i = i + 1) begin:slices
      assign Y[i*WIDTH+:WIDTH] = (S == i) ? A : 0;
    end
  endgenerate

endmodule
