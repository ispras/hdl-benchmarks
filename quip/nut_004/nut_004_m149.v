// 2 ins 1 outs
module nut_004_m149 (clock,reset,ins,outs);
input clock,reset;
input [1:0] ins;
output [0:0] outs;
nr nr_inst (
  .B(ins[0]),
  .A(ins[1]),
  .X(outs[0])
);
endmodule

module nr (
   A,
   B,
   X   
);
   input A, B;
   output X;
      wire X = ~(A || B);
endmodule
