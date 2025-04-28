module bitwise_xnor1_9_6(a, b, c);
  input [8:0] a;
  input [5:0] b;
  output [8:0] c;
  assign c = a ~^ b;
endmodule
