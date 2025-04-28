module lte_4_3(a, b, c);
  input [3:0] a;
  input [2:0] b;
  output c;

  assign c = (a <= b);

endmodule
