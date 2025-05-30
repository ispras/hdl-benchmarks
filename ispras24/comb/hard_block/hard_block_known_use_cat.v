module hard_block_known_use_cat(A1, A2, B, S, Y);

  parameter WIDTH_A = 2;
  parameter WIDTH_B = 4;

  input [WIDTH_A-1:0] A1;
  input [WIDTH_A-1:0] A2;
  input [WIDTH_B-1:0] B;
  input S;

  output [WIDTH_B-1:0] Y;
  
  hard_block_known hard_block_known_u(.A({A1, A2}), .B(B), .S(S), .Y(Y));
  
endmodule
