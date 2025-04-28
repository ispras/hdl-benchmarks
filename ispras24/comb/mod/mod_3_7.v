module mod_3_7(a, b, c);
  input [2:0] a;
  input [6:0] b;
  output [2:0] c;

  assign c = a % b;

endmodule
