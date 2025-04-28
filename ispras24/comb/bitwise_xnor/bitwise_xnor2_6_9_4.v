module bitwise_xnor2_6_9_4(a, b, c);
  input [5:0] a;
  input [8:0] b;
  output [3:0] c;
  assign c = a ^~ b;
endmodule
