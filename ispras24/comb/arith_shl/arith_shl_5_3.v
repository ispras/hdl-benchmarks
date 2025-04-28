module arith_shl_5_3(a, b, c);
  input [4:0] a;
  input [2:0] b;
  output [12:0] c;
  assign c = a <<< b;
endmodule
