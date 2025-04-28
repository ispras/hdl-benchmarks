module gt_4_9(a, b, c);
  input [3:0] a;
  input [8:0] b;
  output c;

  assign c = (a > b);

endmodule
