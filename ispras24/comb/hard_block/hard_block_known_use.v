module hard_block_known_use(A, B, S, Y);

  parameter WIDTH = 4;

  input [WIDTH-1:0] A, B;
  input S;

  output [WIDTH-1:0] Y;
  
  hard_block_known hard_block_known_u(.A(A), .B(B), .S(S), .Y(Y));

endmodule
