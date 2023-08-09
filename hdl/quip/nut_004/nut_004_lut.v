/////////////////////////////////////////////////////////////////
// Altera Corporation
// 
// LUT helper circuit.
//   Uses LUT IO buffers to make SGATE LUT directly.
/////////////////////////////////////////////////////////////////
module nut_004_lut (din,mask,out);

parameter LUT_SIZE = 4;
parameter NUM_BITS = 2**LUT_SIZE;

input [LUT_SIZE-1:0] din;
input [NUM_BITS-1:0] mask;
output out;
wire out;

// buffer the LUT inputs
wire [LUT_SIZE-1:0] din_w;
genvar i;
generate
  for (i=0; i<LUT_SIZE; i=i+1)
  begin : liloop
    lut_input li_buf (din[i],din_w[i]);
  end
endgenerate

// build up the pterms for the LUT
wire [NUM_BITS-1:0] pterms;
generate
for (i=0; i<NUM_BITS; i=i+1)
  begin : ploop
    assign pterms[i] = ((din_w == i) & mask[i]);
  end
endgenerate

// OR them all up and spit it out
wire result;
assign result = | pterms;
lut_output lo_buf (result,out);
endmodule

