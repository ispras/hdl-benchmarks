module main(out1, out2, in1, in2);
output [7:0] out1;
output [7:0] out2;
input [7:0] in1;
input [7:0] in2;

assign out1 = in1%in2;
assign out2 = in1-(in1/in2)*in2;
endmodule
