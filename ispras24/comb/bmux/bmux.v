module bmux(A, S, Y);

  parameter WIDTH = 4;
  parameter S_WIDTH = 4;

  input [(WIDTH << S_WIDTH)-1:0] A;
  input [S_WIDTH-1:0] S;
  output [WIDTH-1:0] Y;

  wire [WIDTH-1:0] bm0_out, bm1_out;

  generate
    if (S_WIDTH > 1) begin:muxlogic
      bmux #(.WIDTH(WIDTH), .S_WIDTH(S_WIDTH-1)) bm0 (.A(A[(WIDTH << (S_WIDTH - 1))-1:0]), .S(S[S_WIDTH-2:0]), .Y(bm0_out));
      bmux #(.WIDTH(WIDTH), .S_WIDTH(S_WIDTH-1)) bm1 (.A(A[(WIDTH << S_WIDTH)-1:WIDTH << (S_WIDTH - 1)]), .S(S[S_WIDTH-2:0]), .Y(bm1_out));
      assign Y = S[S_WIDTH-1] ? bm1_out : bm0_out;
    end else if (S_WIDTH == 1) begin:simple
      assign Y = S ? A[2*WIDTH-1:WIDTH] : A[WIDTH-1:0];
    end else begin:passthru
      assign Y = A;
    end
  endgenerate

endmodule
