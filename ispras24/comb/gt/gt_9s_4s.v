module gt_9s_4s(a, b, c);
  input signed [8:0] a;
  input signed [3:0] b;
  output c;

  assign c = (a > b);

endmodule
