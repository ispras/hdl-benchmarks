module bitwise_xnor1_6_9s_2s(a, b, c);
  input [5:0] a;
  input signed [8:0] b;
  output signed [1:0] c;
  assign c = a ~^ b;
endmodule
