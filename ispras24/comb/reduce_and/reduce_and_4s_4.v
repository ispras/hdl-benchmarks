module reduce_and_4s_4(a, b);
  input signed [3:0] a;
  output [3:0] b;
  assign b = &a;
endmodule
