module bitwise_xor_2s_4_3s(a, b, c);
  input signed [1:0] a;
  input [3:0] b;
  output signed [2:0] c;
  assign c = a ^ b;
endmodule
