module bitwise_xor_2_4_6(a, b, c);
  input [1:0] a;
  input [3:0] b;
  output [5:0] c;
  assign c = a ^ b;
endmodule
