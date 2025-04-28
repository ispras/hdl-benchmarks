module lte_3_4(a, b, c);
  input [2:0] a;
  input [3:0] b;
  output c;

  assign c = (a <= b);

endmodule
