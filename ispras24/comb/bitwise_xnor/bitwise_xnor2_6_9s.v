module bitwise_xnor2_6_9s(a, b, c);
  input [5:0] a;
  input signed [8:0] b;
  output [8:0] c;
  assign c = a ^~ b;
endmodule
