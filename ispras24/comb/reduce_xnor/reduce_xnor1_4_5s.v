module reduce_xnor1_4_5s(a, b);
  input [3:0] a;
  output signed [4:0] b;
  assign b = ~^a;
endmodule
