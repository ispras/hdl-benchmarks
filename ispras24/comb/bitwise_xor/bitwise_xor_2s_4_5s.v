module bitwise_xor_2s_4_5s(a, b, c);
  input signed [1:0] a;
  input [3:0] b;
  output signed [4:0] c;
  assign c = a ^ b;
endmodule
