module mux_part_con_3(S, Y);

  parameter WIDTH = 4;

  input S;

  output [WIDTH-1:0] Y;
  
  mux mux3(.S(S), .Y(Y));
  
endmodule
