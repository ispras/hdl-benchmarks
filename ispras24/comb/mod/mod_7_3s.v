module mod_7_3s(a, b, c);
  input [6:0] a;
  input signed [2:0] b;
  output [2:0] c;

  assign c = a % b;

endmodule
