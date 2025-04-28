module bitwise_and_3_5(a, b, c);
  input [2:0] a;
  input [4:0] b;
  output [4:0] c;
  assign c = a & b;
endmodule
