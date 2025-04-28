module div_4s_8(a, b, c);
  input signed [3:0] a;
  input [7:0] b;
  output [3:0] c;

  assign c = a / b;

endmodule
