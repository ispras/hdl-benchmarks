module mul_2s_4s(a, b, c);
  input signed [1:0] a;
  input signed [3:0] b;
  output signed [5:0] c;
  assign c = a * b;
endmodule
