module reduce_xnor2_4_3(a, b);
  input [3:0] a;
  output [2:0] b;
  assign b = ^~a;
endmodule
