module mux_part_con_4(A, B, Y);

  parameter WIDTH = 4;

  input [WIDTH-1:0] A, B;

  output [WIDTH-1:0] Y;
  
  mux mux4(.A(A), .B(B), .Y(Y));
  
endmodule
