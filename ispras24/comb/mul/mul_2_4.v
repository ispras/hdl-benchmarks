module mul_2_4(a, b, c);
  input [1:0] a;
  input [3:0] b;
  output [5:0] c;
  assign c = a * b;
endmodule
