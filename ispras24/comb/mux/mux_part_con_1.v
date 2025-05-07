module mux_part_con_1(A, S, Y);

  parameter WIDTH = 4;

  input [WIDTH-1:0] A;
  input S;

  output [WIDTH-1:0] Y;
  
  mux mux1(.A(A), .S(S), .Y(Y));
  
endmodule
