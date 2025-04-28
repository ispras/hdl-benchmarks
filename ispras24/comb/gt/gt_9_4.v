module gt_9_4(a, b, c);
  input [8:0] a;
  input [3:0] b;
  output c;

  assign c = (a > b);

endmodule
