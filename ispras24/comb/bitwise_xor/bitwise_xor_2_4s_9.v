module bitwise_xor_2_4s_9(a, b, c);
  input [1:0] a;
  input signed [3:0] b;
  output [8:0] c;
  assign c = a ^ b;
endmodule
