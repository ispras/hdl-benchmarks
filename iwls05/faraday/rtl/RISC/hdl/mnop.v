module ejtag_dmatch_4180

`include "lxr_symbols.vh"

(

EJDM_DATA, EJDM_TRACEHIT, EJDM_BREAKHIT,

EJDI_DATA, EJDI_ADDR, EJDI_RW, EJ_STROBE, EJDI_SELDBS,
EJDI_SELDBRS, LW_DSAMPLE_W, LW_DADDR_W_R, LW_DATA_W_R, CORE_CLOCK,
RESET_D1_R_N, CP0_JXCPN1STIFDMBH_M_P, CP0_JXCPN1STIFNOTDMBH_M_P,
CP0_DBREAKCLR, CP0_DBRKSETIFDMBH, CP0_DDBXIFDMBH_M_P,
CP0_DDBXUNCOND_M_P, TMODE, SEN
);

parameter NDBRK=`EJTAG_RTL_DATAS;

input [31:0] EJDI_DATA;
input [7:2] EJDI_ADDR;
input EJDI_RW;
input EJ_STROBE;



input EJDI_SELDBS;
input EJDI_SELDBRS;

input LW_DSAMPLE_W;
input [31:2] LW_DADDR_W_R;
input [31:0] LW_DATA_W_R;

input CORE_CLOCK;
input RESET_D1_R_N;

output [31:0] EJDM_DATA;
output EJDM_TRACEHIT;
output EJDM_BREAKHIT;

input CP0_JXCPN1STIFDMBH_M_P;
input CP0_JXCPN1STIFNOTDMBH_M_P;
input CP0_DBREAKCLR;
input CP0_DBRKSETIFDMBH;
input CP0_DDBXIFDMBH_M_P;
input CP0_DDBXUNCOND_M_P;

input TMODE;
input SEN;


reg [31:2] AddressBreak_R [NDBRK-1:0],
AddressBreak_P [NDBRK-1:0];
reg [31:0] DataBreak_R [NDBRK-1:0],
DataBreak_P [NDBRK-1:0];
reg [31:2] AddressMask_R [NDBRK-1:0],
AddressMask_P [NDBRK-1:0];
reg [3:0] DataMask_R [NDBRK-1:0],
DataMask_P [NDBRK-1:0];
reg [1:0] BreakControl_R [NDBRK-1:0],
BreakControl_P [NDBRK-1:0];

reg [NDBRK-1:0] DataBreakStatus_R, DataBreakStatus_P;

reg [NDBRK-1:0] Hit_R;
wire [NDBRK-1:0] Hit_P;

reg [NDBRK-1:0] HitPend_R;
wire [NDBRK-1:0] HitPend_P;


reg [NDBRK-1:0] hitaddr;
reg [NDBRK-1:0] hitdata;
reg [NDBRK-1:0] hit_W;


reg [1:0] breakcontrol;
reg [3:0] datamask;

wire JXCPN1ST_M_P = EJDM_BREAKHIT ? CP0_JXCPN1STIFDMBH_M_P :
CP0_JXCPN1STIFNOTDMBH_M_P;

assign HitPend_P = CP0_DBREAKCLR ? {NDBRK {1'd0}} :
(CP0_DBRKSETIFDMBH & EJDM_BREAKHIT) ? hit_W :
HitPend_R;

assign Hit_P = (CP0_DDBXIFDMBH_M_P & JXCPN1ST_M_P) ? hit_W :
(CP0_DDBXUNCOND_M_P & JXCPN1ST_M_P) ? HitPend_R :
Hit_R;


wire NC_FOO1 = SEN;
wire NC_FOO2 = TMODE;




reg EJDM_BREAKHIT;
reg [31:0] EJDM_DATA;
reg EJDM_TRACEHIT;


integer i;
integer j;
integer k;
reg dummy_strobe;
reg dummy_strobe_p;
reg [3:0] dbrk;


wire RESET_D2_R_N;


reg RESET_X_R_N;



always @(posedge CORE_CLOCK)
RESET_X_R_N <= RESET_D1_R_N;



assign RESET_D2_R_N = RESET_X_R_N | TMODE;






always @( DataBreakStatus_R or EJDI_ADDR
or EJDI_DATA or EJDI_RW or EJDI_SELDBRS or EJDI_SELDBS
or EJ_STROBE or Hit_R or LW_DADDR_W_R or LW_DATA_W_R
or LW_DSAMPLE_W or dummy_strobe) begin



dummy_strobe_p = dummy_strobe;


breakcontrol = 2'b00;
datamask = 4'b0000;
hitaddr = {NDBRK {1'b0}};
hitdata = {NDBRK {1'b0}};

for (i = 0; i < NDBRK; i = i + 1) begin
AddressBreak_P [i] = AddressBreak_R [i];
DataBreak_P [i] = DataBreak_R [i];
AddressMask_P [i] = AddressMask_R [i];
DataMask_P [i] = DataMask_R [i];
BreakControl_P [i] = BreakControl_R [i];
end

dbrk = NDBRK;


if (EJDI_SELDBRS) begin

if (!EJDI_RW && (EJDI_ADDR [7:4] < NDBRK) && EJ_STROBE) begin

dummy_strobe_p = ~dummy_strobe;


casex (EJDI_ADDR [3:2])
2'b00: begin
AddressBreak_P [EJDI_ADDR [7:4]] = EJDI_DATA [31:2];

end

2'b01: begin
breakcontrol [0] = EJDI_DATA[0];
breakcontrol [1] = EJDI_DATA[2];
BreakControl_P [EJDI_ADDR [7:4]] = breakcontrol;
DataMask_P[EJDI_ADDR [7:4]] = EJDI_DATA[7:4];

end

2'b10: begin
AddressMask_P [EJDI_ADDR [7:4]] = EJDI_DATA[31:2];

end

2'b11: begin
DataBreak_P [EJDI_ADDR [7:4]] = EJDI_DATA;

end

endcase

end

casex (EJDI_ADDR [3:2])
2'b00: begin
EJDM_DATA = {AddressBreak_R [EJDI_ADDR [7:4]], 2'b00};
end

2'b01: begin
breakcontrol = BreakControl_R [EJDI_ADDR [7:4]];
EJDM_DATA [0] = breakcontrol [0];
EJDM_DATA [2] = breakcontrol [1];
EJDM_DATA [1] = 1'b0;
EJDM_DATA [3] = 1'b0;
EJDM_DATA [7:4] = DataMask_R [EJDI_ADDR [7:4]];
EJDM_DATA [31:8] = 24'h000000;
end

2'b10: begin
EJDM_DATA = {AddressMask_R [EJDI_ADDR [7:4]], 2'b00};
end

2'b11: begin
EJDM_DATA = DataBreak_R [EJDI_ADDR [7:4]];
end

endcase



if (EJDI_ADDR [7:4] >= NDBRK) begin

EJDM_DATA = 32'h00000000;
end


end

else begin
EJDM_DATA = {4'b0000,
dbrk,
{15-NDBRK+9 {1'b0}},
DataBreakStatus_R};
end

DataBreakStatus_P = DataBreakStatus_R | Hit_R;


if (EJDI_SELDBS) begin
if (!EJDI_RW && EJ_STROBE) begin
DataBreakStatus_P = EJDI_DATA [NDBRK-1:0];
end
end

EJDM_BREAKHIT = 1'b0;
EJDM_TRACEHIT = 1'b0;
hit_W = {NDBRK {1'b0}};


if (LW_DSAMPLE_W) begin
for (i = 0; i < NDBRK; i = i + 1) begin



breakcontrol = BreakControl_R [i];
datamask = DataMask_R [i];


hitaddr[i] = &(({LW_DADDR_W_R, 2'b00} ~^ {AddressBreak_R[i], 2'b00}) |
{AddressMask_R[i], 2'b00});
hitdata[i] = &((LW_DATA_W_R ~^ DataBreak_R[i]) |
({{8 {datamask[3]}}, {8 {datamask[2]}},
{8 {datamask[1]}}, {8 {datamask[0]}}}));
hit_W[i] = hitaddr[i] & hitdata[i];



EJDM_BREAKHIT = hit_W[i] & breakcontrol[0] | EJDM_BREAKHIT;
EJDM_TRACEHIT = hit_W[i] & breakcontrol[1] | EJDM_TRACEHIT;

end
end
end



always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
for (j = 0; j < NDBRK; j = j + 1) begin
BreakControl_R [j] <= 2'b00;
DataMask_R[j] <= 4'b0000;
end
DataBreakStatus_R <= {NDBRK {1'b0}};
Hit_R <= {NDBRK {1'b0}};
HitPend_R <= {NDBRK {1'b0}};
dummy_strobe <= 1'b0;
end
else begin
for (j = 0; j < NDBRK; j = j + 1) begin
BreakControl_R [j] <= BreakControl_P [j];
DataMask_R[j] <= DataMask_P[j];
end
dummy_strobe <= dummy_strobe_p;
DataBreakStatus_R <= DataBreakStatus_P;
Hit_R <= Hit_P;
HitPend_R <= HitPend_P;
end
end

always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
for (k = 0; k < NDBRK; k = k + 1) begin
AddressBreak_R [k] <= 30'b00_0000_0000_0000_0000_0000_0000_0000;
DataBreak_R [k] <= 32'h0000_0000;
AddressMask_R [k] <= 30'b00_0000_0000_0000_0000_0000_0000_0000;
end
end
else begin
for (k = 0; k < NDBRK; k = k + 1) begin
AddressBreak_R [k] <= AddressBreak_P [k];
DataBreak_R [k] <= DataBreak_P [k];
AddressMask_R [k] <= AddressMask_P [k];
end
end
end



task printregs;
begin

for (i = 0; i < 2; i = i + 1) begin
$display ("AddressBreak[0]: 0", i, AddressBreak_P [i]);
$display ("DataBreak[0]: 0", i, DataBreak_P [i]);
$display ("AddressMask[0]: 0", i, AddressMask_P [i]);
$display ("BreakControl[0]: 0", i, BreakControl_P [i]);
$display ("AddressBreak[0]: 0", i, AddressBreak_R [i]);
$display ("DataBreak[0]: 0", i, DataBreak_R [i]);
$display ("AddressMask[0]: 0", i, AddressMask_R [i]);
$display ("BreakControl[0]: 0", i, BreakControl_R [i]);
end
end
endtask


endmodule
