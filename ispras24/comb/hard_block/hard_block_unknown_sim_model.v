module hard_block_unknown(A, B, S, Y);

  parameter WIDTH = 4;

  input [WIDTH-1:0] A, B;
  input S;
  output [WIDTH-1:0] Y;

  assign Y = S ? B : A;

endmodule
