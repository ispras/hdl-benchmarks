module bitwise_xnor1_6s_9s_3s(a, b, c);
  input signed [5:0] a;
  input signed [8:0] b;
  output signed [2:0] c;
  assign c = a ~^ b;
endmodule
