module bitwise_xor_2_4s(a, b, c);
  input [1:0] a;
  input signed [3:0] b;
  output [3:0] c;
  assign c = a ^ b;
endmodule
