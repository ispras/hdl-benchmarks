module lt_4_10(a, b, c);
  input [3:0] a;
  input [9:0] b;
  output c;

  assign c = (a < b);

endmodule
