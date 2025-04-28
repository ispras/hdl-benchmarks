module bitwise_xor_2s_4s_8s(a, b, c);
  input signed [1:0] a;
  input signed [3:0] b;
  output signed [7:0] c;
  assign c = a ^ b;
endmodule
