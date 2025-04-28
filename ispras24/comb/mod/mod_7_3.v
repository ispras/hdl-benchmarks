module mod_7_3(a, b, c);
  input [6:0] a;
  input [2:0] b;
  output [2:0] c;

  assign c = a % b;

endmodule
