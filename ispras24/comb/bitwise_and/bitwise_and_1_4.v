module bitwise_and_1_4(a, b, c);
  input a;
  input [3:0] b;
  output [3:0] c;
  assign c = a & b;
endmodule
