module logical_and_1_2(a, b, c);
  input a;
  input [1:0] b;
  output c;
  assign c = a && b;
endmodule
