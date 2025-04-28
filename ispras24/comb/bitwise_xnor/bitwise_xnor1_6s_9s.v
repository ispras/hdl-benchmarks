module bitwise_xnor1_6s_9s(a, b, c);
  input signed [5:0] a;
  input signed [8:0] b;
  output signed [8:0] c;
  assign c = a ~^ b;
endmodule
