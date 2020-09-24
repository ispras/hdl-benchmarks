



















































































module ejtag_scan














(

JTAG_ESCANOUT, EJSN_DATA, EJSN_ADDR, EJSN_CTL, EJSN_UPDATEDATA,
EJSN_UPDATEADDR, EJSN_UPDATECTL, EJSN_PCTRACEON,

JTAG_IR, JTAG_ESCANIN, JTAG_CAPTURE, JTAG_UPDATE, JTAG_SHIFT,
JTAG_RUNTEST, LBC_MDATA, LBC_MADDR, EJDD_CAPDATA, EJDD_ADDR,
EJC_CTL, EJ_DIS, CFG_EJTNMINUS1, CFG_EJTMLOG2, CFG_EJTBIT0M16, JTAG_CLOCK,
RESET_D1_JR_N, TMODE
);

`include "lxr_symbols.vh"

parameter
TAP_EJTAG_IMPLEMENTATION = 5'b00011,
TAP_EJTAG_ADDRESS = 5'b01000,
TAP_EJTAG_DATA = 5'b01001,
TAP_EJTAG_CONTROL = 5'b01010,
TAP_EJTAG_ALL = 5'b01011,
TAP_EJTAG_PCTRACE = 5'b10000;


input [4:0] JTAG_IR;
input JTAG_ESCANIN;
input JTAG_CAPTURE;
input JTAG_UPDATE;
input JTAG_SHIFT;
input JTAG_RUNTEST;

input [31:0] LBC_MDATA;
input [31:0] LBC_MADDR;
input [31:0] EJDD_CAPDATA;
input [31:0] EJDD_ADDR;
input [31:0] EJC_CTL;
input EJ_DIS;

input [1:0] CFG_EJTNMINUS1;
input [1:0] CFG_EJTMLOG2;
input CFG_EJTBIT0M16;

input JTAG_CLOCK;
input RESET_D1_JR_N;

input TMODE;

output JTAG_ESCANOUT;

output [31:0] EJSN_DATA;
output [31:0] EJSN_ADDR;
output [31:0] EJSN_CTL;
output EJSN_UPDATEDATA;
output EJSN_UPDATEADDR;
output EJSN_UPDATECTL;
output EJSN_PCTRACEON;


reg [31:0] ScanData_JR, ScanData_P;
reg [31:0] ScanAddr_JR, ScanAddr_P;
reg [31:0] ScanCtl_JR, ScanCtl_P;





reg EJSN_PCTRACEON;
reg EJSN_UPDATEADDR;
reg EJSN_UPDATECTL;
reg EJSN_UPDATEDATA;
reg JTAG_ESCANOUT;






assign EJSN_DATA = ScanData_JR;
assign EJSN_ADDR = ScanAddr_JR;
assign EJSN_CTL = ScanCtl_JR;


wire dmaacc = EJC_CTL[17];
wire [31:0] datain = dmaacc ? EJDD_CAPDATA : LBC_MDATA;
wire [31:0] addrin = dmaacc ? EJDD_ADDR : LBC_MADDR;

wire [4:0] JTAG_IR_SD;
wire JTAG_CAPTURE_SD;
wire JTAG_UPDATE_SD;
wire JTAG_SHIFT_SD;
wire JTAG_RUNTEST_SD;



wire NC_TMODE = TMODE;





assign JTAG_IR_SD = JTAG_IR;
assign JTAG_CAPTURE_SD = JTAG_CAPTURE;
assign JTAG_UPDATE_SD = JTAG_UPDATE;
assign JTAG_SHIFT_SD = JTAG_SHIFT;
assign JTAG_RUNTEST_SD = JTAG_RUNTEST;



always @(EJC_CTL or EJ_DIS or JTAG_CAPTURE_SD
or JTAG_ESCANIN or JTAG_IR_SD or JTAG_RUNTEST_SD
or JTAG_SHIFT_SD or JTAG_UPDATE_SD or ScanAddr_JR
or CFG_EJTMLOG2 or CFG_EJTNMINUS1 or CFG_EJTBIT0M16
or ScanCtl_JR or ScanData_JR or addrin or datain) begin

EJSN_UPDATEDATA = 1'b0;
EJSN_UPDATEADDR = 1'b0;
EJSN_UPDATECTL = 1'b0;

JTAG_ESCANOUT = 1'b0;

ScanData_P = ScanData_JR;
ScanAddr_P = ScanAddr_JR;
ScanCtl_P = ScanCtl_JR;




if (JTAG_CAPTURE_SD) begin
case (JTAG_IR_SD)

TAP_EJTAG_DATA: begin
ScanData_P = datain;
end

TAP_EJTAG_ADDRESS: begin
ScanAddr_P = addrin;
end

TAP_EJTAG_CONTROL: begin
ScanCtl_P = EJC_CTL;
end

TAP_EJTAG_ALL: begin
ScanData_P = datain;
ScanAddr_P = addrin;
ScanCtl_P = EJC_CTL;
end


TAP_EJTAG_IMPLEMENTATION: begin
ScanData_P[0] = 1'b0;
ScanData_P[4:1] = 4'b0000;

ScanData_P[5] = 1'b0;


ScanData_P[6] = 1'b0;


ScanData_P[7] = 1'b0;

ScanData_P[10:8]
= {1'b0, CFG_EJTNMINUS1};
ScanData_P[13:11]
= {1'b0, CFG_EJTMLOG2};
ScanData_P[14] = 1'b0;
ScanData_P[15] = 1'b0;
ScanData_P[16] = 1'b1;
ScanData_P[17] = 1'b0;
ScanData_P[18] = 1'b0;
ScanData_P[19] = 1'b0;
ScanData_P[22:20] = 3'b000;
ScanData_P[23] = 1'b1;
ScanData_P[25:24] = 2'b00;
ScanData_P[26] = EJ_DIS;
ScanData_P[27] = CFG_EJTBIT0M16;
ScanData_P[31:28] = 4'b0000;
end
endcase
end

if (JTAG_SHIFT_SD) begin
case (JTAG_IR_SD)

TAP_EJTAG_IMPLEMENTATION,
TAP_EJTAG_DATA: begin
{ScanData_P, JTAG_ESCANOUT} = {JTAG_ESCANIN, ScanData_JR};
end

TAP_EJTAG_ADDRESS: begin
{ScanAddr_P, JTAG_ESCANOUT} = {JTAG_ESCANIN, ScanAddr_JR};
end

TAP_EJTAG_CONTROL: begin
{ScanCtl_P, JTAG_ESCANOUT} = {JTAG_ESCANIN, ScanCtl_JR};
end

TAP_EJTAG_ALL: begin
{ScanAddr_P, ScanData_P, ScanCtl_P, JTAG_ESCANOUT}
= {JTAG_ESCANIN, ScanAddr_JR, ScanData_JR, ScanCtl_JR};
end

endcase
end

if (JTAG_UPDATE_SD) begin
case (JTAG_IR_SD)

TAP_EJTAG_DATA: begin
EJSN_UPDATEDATA = 1'b1;
end

TAP_EJTAG_ADDRESS: begin
EJSN_UPDATEADDR = 1'b1;
end

TAP_EJTAG_CONTROL: begin
EJSN_UPDATECTL = 1'b1;
end

TAP_EJTAG_ALL: begin
EJSN_UPDATEDATA = 1'b1;
EJSN_UPDATEADDR = 1'b1;
EJSN_UPDATECTL = 1'b1;
end
endcase
end




if (JTAG_RUNTEST_SD) begin
if (JTAG_IR_SD == TAP_EJTAG_PCTRACE) begin
EJSN_PCTRACEON = 1'b1;
end
else begin
EJSN_PCTRACEON = 1'b0;
end
end
else begin
EJSN_PCTRACEON = 1'b0;
end

end



always @(posedge JTAG_CLOCK or negedge RESET_D1_JR_N) begin
if (!RESET_D1_JR_N) begin
ScanData_JR <= 32'h0000_0000;
ScanAddr_JR <= 32'h0000_0000;
ScanCtl_JR <= 32'h0000_0000;
end
else begin
ScanData_JR <= ScanData_P;
ScanAddr_JR <= ScanAddr_P;
ScanCtl_JR <= ScanCtl_P;
end
end




endmodule

