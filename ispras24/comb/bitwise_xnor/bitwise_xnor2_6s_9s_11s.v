module bitwise_xnor2_6s_9s_11s(a, b, c);
  input signed [5:0] a;
  input signed [8:0] b;
  output signed [10:0] c;
  assign c = a ^~ b;
endmodule
