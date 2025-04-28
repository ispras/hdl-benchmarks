module reduce_xnor1_4s_7(a, b);
  input signed [3:0] a;
  output [6:0] b;
  assign b = ~^a;
endmodule
