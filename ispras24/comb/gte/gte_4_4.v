module gte_4_4(a, b, c);
  input [3:0] a;
  input [3:0] b;
  output c;

  assign c = (a >= b);

endmodule
