






`include "x_def.v"











module BTBmem (clk, wa, web, cs, wd, ra, rd
`ifdef FD_DFT
, SCAN_TEST);
`else
);
`endif

input [4:0] wa,
ra;
input [25:0] wd;
input clk,
cs,
web;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output [25:0] rd;

SW10201A I0 ( .A0(ra[0]),
.A1(ra[1]),
.A2(ra[2]),
.A3(ra[3]),
.A4(ra[4]),
.B0(wa[0]),
.B1(wa[1]),
.B2(wa[2]),
.B3(wa[3]),
.B4(wa[4]),
.CKA(clk),
.CKB(clk),
.CSA(cs),
.CSB(cs),
.DI0(wd[0]),
.DI1(wd[1]),
.DI2(wd[2]),
.DI3(wd[3]),
.DI4(wd[4]),
.DI5(wd[5]),
.DI6(wd[6]),
.DI7(wd[7]),
.DI8(wd[8]),
.DI9(wd[9]),
.DI10(wd[10]),
.DI11(wd[11]),
.DI12(wd[12]),
.DI13(wd[13]),
.DI14(wd[14]),
.DI15(wd[15]),
.DI16(wd[16]),
.DI17(wd[17]),
.DI18(wd[18]),
.DI19(wd[19]),
.DI20(wd[20]),
.DI21(wd[21]),
.DI22(wd[22]),
.DI23(wd[23]),
.DI24(wd[24]),
.DI25(wd[25]),
.DO0(rd[0]),
.DO1(rd[1]),
.DO2(rd[2]),
.DO3(rd[3]),
.DO4(rd[4]),
.DO5(rd[5]),
.DO6(rd[6]),
.DO7(rd[7]),
.DO8(rd[8]),
.DO9(rd[9]),
.DO10(rd[10]),
.DO11(rd[11]),
.DO12(rd[12]),
.DO13(rd[13]),
.DO14(rd[14]),
.DO15(rd[15]),
.DO16(rd[16]),
.DO17(rd[17]),
.DO18(rd[18]),
.DO19(rd[19]),
.DO20(rd[20]),
.DO21(rd[21]),
.DO22(rd[22]),
.DO23(rd[23]),
.DO24(rd[24]),
.DO25(rd[25]),
`ifdef FD_DFT
.OE(!SCAN_TEST),
`else
.OE(1'b1),
`endif
.WEB(web)
);

endmodule

