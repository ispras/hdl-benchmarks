module bitwise_xor_2s_4s(a, b, c);
  input signed [1:0] a;
  input signed [3:0] b;
  output signed [3:0] c;
  assign c = a ^ b;
endmodule
