module sub_2_6(a, b, c);
  input [1:0] a;
  input [5:0] b;
  output [6:0] c;
  assign c = a - b;
endmodule
