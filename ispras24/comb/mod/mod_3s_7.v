module mod_3s_7(a, b, c);
  input signed [2:0] a;
  input [6:0] b;
  output [2:0] c;

  assign c = a % b;

endmodule
