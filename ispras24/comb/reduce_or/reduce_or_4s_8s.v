module reduce_or_4s_8s(a, b);
  input signed [3:0] a;
  output signed [7:0] b;
  assign b = |a;
endmodule
