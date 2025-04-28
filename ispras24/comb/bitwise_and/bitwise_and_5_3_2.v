module bitwise_and_5_3_2(a, b, c);
  input [4:0] a;
  input [2:0] b;
  output [1:0] c;
  assign c = a & b;
endmodule
