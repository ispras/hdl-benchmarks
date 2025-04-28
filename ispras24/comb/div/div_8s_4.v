module div_8s_4(a, b, c);
  input signed [7:0] a;
  input [3:0] b;
  output [7:0] c;

  assign c = a / b;

endmodule
