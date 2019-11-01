




























































































module jtag_tap
(

JTAG_TDO_NR, JTAG_SCANIN, JTAG_ESCANIN, JTAG_CAPTURE, JTAG_UPDATE,
JTAG_SHIFT_DR, JTAG_SHIFT_IR, JTAG_RUNTEST, JTAG_RESET, JTAG_IR,
JTAG_DINT,

JTAG_TDI, JTAG_TMS, JTAG_CLOCK, JTAG_TRST_N, JTAG_SCANOUT,
JTAG_ESCANOUT, RESET_PWRON_N, CP0_JCTRLJRST_R, EJC_PCTRON_R,
JPT_TPC_DR, JTAG_USR, TMODE
);

`include "../include/lxr_symbols.vh"


parameter
TAP_TEST_JRST = 0,
TAP_JRUN_IDLE = 1,
TAP_SEL_DR = 2,
TAP_CAP_DR = 3,
TAP_SHIFT_DR = 4,
TAP_EXIT_DR = 5,
TAP_PAUSE_DR = 6,
TAP_EXIT2_DR = 7,
TAP_UPDATE_DR = 8,
TAP_SEL_IR = 9,
TAP_CAP_IR = 10,
TAP_SHIFT_IR = 11,
TAP_EXIT_IR = 12,
TAP_PAUSE_IR = 13,
TAP_EXIT2_IR = 14,
TAP_UPDATE_IR = 15;


parameter
TAP_EXTEST = 5'b0_0000,
TAP_IDCODE = 5'b0_0001,
TAP_SAMPLE = 5'b0_0010,
TAP_INTEST = 5'b0_0100,
TAP_HIZ = 5'b0_0101,
TAP_CLAMP = 5'b0_0110,
TAP_BYPASS1 =5'b0_0111,
TAP_CUST0 = 5'b1_1000,
TAP_CUST1 = 5'b1_1001,
TAP_CUST2 = 5'b1_1010,
TAP_CUST3 = 5'b1_1011,
TAP_BYPASS = 5'b1_1111;


input JTAG_TDI;
input JTAG_TMS;
input JTAG_CLOCK;
input JTAG_TRST_N;
input JTAG_SCANOUT;
input JTAG_ESCANOUT;

input RESET_PWRON_N;
input CP0_JCTRLJRST_R;
input EJC_PCTRON_R;
input JPT_TPC_DR;

input [2:0] JTAG_USR;

input TMODE;

output JTAG_TDO_NR;
output JTAG_SCANIN;
output JTAG_ESCANIN;
output JTAG_CAPTURE;
output JTAG_UPDATE;
output JTAG_SHIFT_DR;
output JTAG_SHIFT_IR;
output JTAG_RUNTEST;
output JTAG_RESET;
output [4:0] JTAG_IR;
output JTAG_DINT;


reg [4:0] JtagInstScan_JR, JtagInstScan_P;
reg [4:0] JtagInst_JR, JtagInst_P;
reg [31:0] JtagIDScan_JR, JtagIDScan_P;
reg JtagBypScan_JR, JtagBypScan_P;

reg [15:0] TapState_JR, TapState_P;

reg tdo;
reg Tdo_NR;




reg JTAG_ESCANIN;
reg JTAG_SCANIN;


wire reset_N = JTAG_TRST_N & RESET_PWRON_N & ~CP0_JCTRLJRST_R;


wire NC_FOO = TMODE;


assign JTAG_CAPTURE = TapState_JR[TAP_CAP_DR];
assign JTAG_SHIFT_DR = TapState_JR[TAP_SHIFT_DR];
assign JTAG_SHIFT_IR = TapState_JR[TAP_SHIFT_IR];
assign JTAG_UPDATE = TapState_JR[TAP_UPDATE_DR];
assign JTAG_RUNTEST = TapState_JR[TAP_JRUN_IDLE];

assign JTAG_RESET = ~(TapState_JR[TAP_TEST_JRST]);



assign JTAG_TDO_NR = EJC_PCTRON_R ? JPT_TPC_DR : Tdo_NR;
assign JTAG_DINT = EJC_PCTRON_R & ~JTAG_TDI;

assign JTAG_IR = JtagInst_JR;

always @(JTAG_ESCANOUT or JTAG_SCANOUT or JTAG_TDI
or JTAG_TMS or JTAG_USR or JtagBypScan_JR or JtagIDScan_JR
or JtagInstScan_JR or JtagInst_JR or TapState_JR)
begin






tdo = 1'bx;
JTAG_SCANIN = 1'b0;
JTAG_ESCANIN = 1'b0;


TapState_P = 16'h0000;

JtagInstScan_P = JtagInstScan_JR;
JtagInst_P = JtagInst_JR;
JtagIDScan_P = JtagIDScan_JR;
JtagBypScan_P = JtagBypScan_JR;

case (1'b1)

TapState_JR [TAP_TEST_JRST]:
begin
JtagInst_P = TAP_IDCODE;
if (JTAG_TMS)
TapState_P [TAP_TEST_JRST] = 1;
else
TapState_P [TAP_JRUN_IDLE] = 1;
end

TapState_JR [TAP_JRUN_IDLE]:
begin
if (JTAG_TMS)
TapState_P [TAP_SEL_DR] = 1;
else
TapState_P [TAP_JRUN_IDLE] = 1;
end

TapState_JR [TAP_SEL_DR]:
begin
if (JTAG_TMS)
TapState_P [TAP_SEL_IR] = 1;
else
TapState_P [TAP_CAP_DR] = 1;
end

TapState_JR [TAP_CAP_DR]:
begin
if (JTAG_TMS)
TapState_P [TAP_EXIT_DR] = 1;
else
TapState_P [TAP_SHIFT_DR] = 1;
end

TapState_JR [TAP_SHIFT_DR]:
begin
if (JTAG_TMS)
TapState_P [TAP_EXIT_DR] = 1;
else
TapState_P [TAP_SHIFT_DR] = 1;
end

TapState_JR [TAP_EXIT_DR]:
begin
if (JTAG_TMS)
TapState_P [TAP_UPDATE_DR] = 1;
else
TapState_P [TAP_PAUSE_DR] = 1;
end

TapState_JR [TAP_PAUSE_DR]:
begin
if (JTAG_TMS)
TapState_P [TAP_EXIT2_DR] = 1;
else
TapState_P [TAP_PAUSE_DR] = 1;
end

TapState_JR [TAP_EXIT2_DR]:
begin
if (JTAG_TMS)
TapState_P [TAP_UPDATE_DR] = 1;
else
TapState_P [TAP_SHIFT_DR] = 1;
end

TapState_JR [TAP_UPDATE_DR]:
begin
if (JTAG_TMS)
TapState_P [TAP_SEL_DR] = 1;
else
TapState_P [TAP_JRUN_IDLE] = 1;
end

TapState_JR [TAP_SEL_IR]:
begin
if (JTAG_TMS)
TapState_P [TAP_TEST_JRST] = 1;
else
TapState_P [TAP_CAP_IR] = 1;
end

TapState_JR [TAP_CAP_IR]:
begin

JtagInstScan_P = {JTAG_USR, 2'b01};

if (JTAG_TMS)
TapState_P [TAP_EXIT_IR] = 1;
else
TapState_P [TAP_SHIFT_IR] = 1;
end

TapState_JR [TAP_SHIFT_IR]:
begin

{JtagInstScan_P, tdo} = {JTAG_TDI, JtagInstScan_JR};

if (JTAG_TMS)
TapState_P [TAP_EXIT_IR] = 1;
else
TapState_P [TAP_SHIFT_IR] = 1;
end

TapState_JR [TAP_EXIT_IR]:
begin
if (JTAG_TMS)
TapState_P [TAP_UPDATE_IR] = 1;
else
TapState_P [TAP_PAUSE_IR] = 1;
end

TapState_JR [TAP_PAUSE_IR]:
begin
if (JTAG_TMS)
TapState_P [TAP_EXIT2_IR] = 1;
else
TapState_P [TAP_PAUSE_IR] = 1;
end

TapState_JR [TAP_EXIT2_IR]:
begin
if (JTAG_TMS)
TapState_P [TAP_UPDATE_IR] = 1;
else
TapState_P [TAP_SHIFT_IR] = 1;
end

TapState_JR [TAP_UPDATE_IR]:
begin
JtagInst_P = JtagInstScan_JR;

if (JTAG_TMS)
TapState_P [TAP_SEL_DR] = 1;
else
TapState_P [TAP_JRUN_IDLE] = 1;
end

endcase






if (TapState_JR [TAP_CAP_DR])
case (JtagInst_JR)

TAP_IDCODE: begin
JtagIDScan_P[0] = 1'b1;
JtagIDScan_P[31:1] = `LX_JTAG_ID;
end

default:
;
endcase


if (TapState_JR [TAP_SHIFT_DR])
begin
case (JtagInst_JR)

TAP_EXTEST,
TAP_CUST0,
TAP_CUST1,
TAP_CUST2,
TAP_CUST3,
TAP_SAMPLE: begin
tdo = JTAG_SCANOUT;
JTAG_SCANIN = JTAG_TDI;
end


TAP_INTEST,
TAP_HIZ,
TAP_CLAMP,
TAP_BYPASS1,
TAP_BYPASS:
begin
{JtagBypScan_P, tdo} = {JTAG_TDI, JtagBypScan_JR};
end

TAP_IDCODE:
begin

{JtagIDScan_P, tdo} = {JTAG_TDI, JtagIDScan_JR};
end

default: begin
tdo = JTAG_ESCANOUT;
JTAG_ESCANIN = JTAG_TDI;
end
endcase
end


if (TapState_JR [TAP_UPDATE_DR])
case (JtagInst_JR)

TAP_EXTEST,
TAP_SAMPLE:
;

TAP_INTEST,
TAP_CLAMP,
TAP_BYPASS1,
TAP_BYPASS,
TAP_HIZ:
;

TAP_IDCODE:
;

default:
;
endcase

end





always @(negedge JTAG_CLOCK or negedge reset_N) begin
if (!reset_N) begin
Tdo_NR <= 1'b0;
end
else begin
Tdo_NR <= tdo;
end
end



always @(posedge JTAG_CLOCK or negedge reset_N) begin
if (!reset_N) begin

TapState_JR <= 16'd1;
JtagInst_JR <= TAP_IDCODE;
JtagInstScan_JR <= 5'd0;
JtagIDScan_JR <= 32'd0;
JtagBypScan_JR <= 1'b0;
end
else begin
TapState_JR <= TapState_P;
JtagInst_JR <= JtagInst_P;
JtagInstScan_JR <= JtagInstScan_P;
JtagIDScan_JR <= JtagIDScan_P;
JtagBypScan_JR <= JtagBypScan_P;
end
end







endmodule
