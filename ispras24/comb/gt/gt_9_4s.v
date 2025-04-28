module gt_9_4s(a, b, c);
  input [8:0] a;
  input signed [3:0] b;
  output c;

  assign c = (a > b);

endmodule
