module gte_3_2(a, b, c);
  input [2:0] a;
  input [1:0] b;
  output c;

  assign c = (a >= b);

endmodule
