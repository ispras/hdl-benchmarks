module hard_block_unknown_use_part_con(A, B, S, Y);

  parameter WIDTH = 4;

  input [WIDTH-1:0] A, B;
  input S;

  output [WIDTH-1:0] Y;
  
  hard_block hard_block_unknown_u(.A(), .B(B), .S(S), .Y(Y));
  
endmodule
