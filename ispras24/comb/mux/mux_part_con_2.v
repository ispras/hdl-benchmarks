module mux_part_con_2(B, S, Y);

  parameter WIDTH = 4;

  input [WIDTH-1:0] B;
  input S;

  output [WIDTH-1:0] Y;
  
  mux mux2(.B(B), .S(S), .Y(Y));
  
endmodule
