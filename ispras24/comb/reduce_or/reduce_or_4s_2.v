module reduce_or_4s_2(a, b);
  input signed [3:0] a;
  output [1:0] b;
  assign b = |a;
endmodule
