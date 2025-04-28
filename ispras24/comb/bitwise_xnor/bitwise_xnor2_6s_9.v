module bitwise_xnor2_6s_9(a, b, c);
  input signed [5:0] a;
  input [8:0] b;
  output [8:0] c;
  assign c = a ^~ b;
endmodule
