// 163 ins 64 outs
module nut_002_m47 (clock,reset,ins,outs);
input clock,reset;
input [162:0] ins;
output [63:0] outs;
mem_data_sel mem_data_sel_inst (
  .aPCI_SEL(ins[0]),
  .aLSI_REG_SEL(ins[1]),
  .aLSI_INT_SEL(ins[2]),
  .PCICPU_DATA(ins[66:3]),
  .LSIREG_DATA(ins[130:67]),
  .INT_DATA_OUT(ins[162:131]),
  .LSI_DATA(outs[63:0])
);
endmodule

module mem_data_sel(aPCI_SEL,aLSI_REG_SEL,aLSI_INT_SEL,
       PCICPU_DATA,LSIREG_DATA,INT_DATA_OUT,
       LSI_DATA);
input  aPCI_SEL,aLSI_REG_SEL,aLSI_INT_SEL;
input  [63:0] PCICPU_DATA,LSIREG_DATA;
input  [31:0] INT_DATA_OUT;
output [63:0] LSI_DATA;
assign LSI_DATA = ({64{aPCI_SEL}}     | PCICPU_DATA) &
                  ({64{aLSI_REG_SEL}} | LSIREG_DATA) &
                  ({64{aLSI_INT_SEL}} | {32'h00000000,INT_DATA_OUT});
endmodule
