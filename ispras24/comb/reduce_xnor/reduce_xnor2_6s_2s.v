module reduce_xnor2_6s_2s(a, b);
  input signed [5:0] a;
  output signed [1:0] b;
  assign b = ^~a;
endmodule
