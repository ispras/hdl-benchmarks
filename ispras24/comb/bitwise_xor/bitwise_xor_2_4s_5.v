module bitwise_xor_2_4s_5(a, b, c);
  input [1:0] a;
  input signed [3:0] b;
  output [4:0] c;
  assign c = a ^ b;
endmodule
