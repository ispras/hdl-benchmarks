module bitwise_xnor1_6_9s_7s(a, b, c);
  input [5:0] a;
  input signed [8:0] b;
  output signed [6:0] c;
  assign c = a ~^ b;
endmodule
