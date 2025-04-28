module bitwise_xnor2_6s_9_5(a, b, c);
  input signed [5:0] a;
  input [8:0] b;
  output [4:0] c;
  assign c = a ^~ b;
endmodule
