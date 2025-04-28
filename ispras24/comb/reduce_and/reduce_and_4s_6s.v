module reduce_and_4s_6s(a, b);
  input signed [3:0] a;
  output signed [5:0] b;
  assign b = &a;
endmodule
