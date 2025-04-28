module mul_11s_11s_22s(a, b, c);
  input signed [10:0] a;
  input signed [10:0] b;
  output signed [21:0] c;
  assign c = a * b;
endmodule
