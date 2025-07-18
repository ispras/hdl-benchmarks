



















































































module ejtag_imatch_4180














(

EJIM_DATA, EJIM_TRACEHIT, EJIM_BREAKHIT,

EJDI_DATA, EJDI_ADDR, EJDI_RW, EJ_STROBE, EJDI_SELIBS,
EJDI_SELIBRS, LW_ISAMPLE_S, LW_IADDR_S_R, CP0_JCTRLDM_I_R,
CORE_CLOCK, RESET_D1_R_N, EJDM_BREAKHIT_W, PBI_EJHOLD,
CP0_JXCPN1STIFDMBH_M_P, CP0_JXCPN1STIFNOTDMBH_M_P,
CP0_DIBIFNOTDMBH_M_P, TMODE, SEN
);

`include "lxr_symbols.vh"

parameter NIBRK=`EJTAG_RTL_INSTS;

input [31:0] EJDI_DATA;
input [7:2] EJDI_ADDR;
input EJDI_RW;
input EJ_STROBE;

input EJDI_SELIBS;
input EJDI_SELIBRS;

input LW_ISAMPLE_S;
input [31:0] LW_IADDR_S_R;

input CP0_JCTRLDM_I_R;




input CORE_CLOCK;
input RESET_D1_R_N;

output [31:0] EJIM_DATA;
output EJIM_TRACEHIT;
output EJIM_BREAKHIT;

input EJDM_BREAKHIT_W;
input PBI_EJHOLD;
input CP0_JXCPN1STIFDMBH_M_P;
input CP0_JXCPN1STIFNOTDMBH_M_P;
input CP0_DIBIFNOTDMBH_M_P;

input TMODE;
input SEN;


reg [31:1] AddressBreak_R [NIBRK-1:0],
AddressBreak_P [NIBRK-1:0];
reg [31:1] AddressMask_R [NIBRK-1:0],
AddressMask_P [NIBRK-1:0];
reg [1:0] BreakControl_R [NIBRK-1:0],
BreakControl_P [NIBRK-1:0];

reg [NIBRK-1:0] InstBreakStatus_R, InstBreakStatus_P;

reg [NIBRK-1:0] Hit_S;
reg [NIBRK-1:0] HitRaw_S;
reg [NIBRK-1:0] Hit_E_R;
reg [NIBRK-1:0] Hit_M_R;
wire [NIBRK-1:0] Hit_M_P;

reg [NIBRK-1:0] HitPend_R;
wire [NIBRK-1:0] HitPend_P;



reg EJIM_BREAKHIT;
reg [31:0] EJIM_DATA;
reg EJIM_TRACEHIT;



reg [1:0] breakcontrol;
integer i;
integer j;
integer k;
reg [3:0] ibrk;

wire JXCPN1ST_M_P;
wire TMODE;

assign JXCPN1ST_M_P = EJDM_BREAKHIT_W ? CP0_JXCPN1STIFDMBH_M_P : CP0_JXCPN1STIFNOTDMBH_M_P;


assign Hit_M_P = (CP0_DIBIFNOTDMBH_M_P & ~EJDM_BREAKHIT_W & JXCPN1ST_M_P) ? Hit_E_R : {NIBRK {1'b0}};


assign HitPend_P = (PBI_EJHOLD & ~CP0_JCTRLDM_I_R) ? (Hit_S | HitPend_R) : {NIBRK {1'b0}};


wire NC_FOO1 = SEN;
wire NC_FOO2 = TMODE;



wire RESET_D2_R_N;


reg RESET_X_R_N;





always @(posedge CORE_CLOCK)
RESET_X_R_N <= RESET_D1_R_N;




assign RESET_D2_R_N = RESET_X_R_N | TMODE;






always @( EJDI_ADDR or EJDI_DATA
or EJDI_RW or EJDI_SELIBRS or EJDI_SELIBS or EJ_STROBE
or Hit_M_R or InstBreakStatus_R or LW_IADDR_S_R
or LW_ISAMPLE_S) begin


breakcontrol = 2'b00;
HitRaw_S = {NIBRK {1'b0}};

for (i = 0; i < NIBRK; i = i + 1) begin
AddressBreak_P [i] = AddressBreak_R [i];
AddressMask_P [i] = AddressMask_R [i];
BreakControl_P [i] = BreakControl_R [i];
end

ibrk = NIBRK;

InstBreakStatus_P = InstBreakStatus_R | Hit_M_R;


if (EJDI_SELIBRS) begin

if (!EJDI_RW && (EJDI_ADDR [7:4] < NIBRK) && EJ_STROBE) begin




casex (EJDI_ADDR [3:2])
2'b00: begin
AddressBreak_P [EJDI_ADDR [7:4]] = EJDI_DATA [31:1];

end






2'b01: begin
breakcontrol [0] = EJDI_DATA[0];
breakcontrol [1] = EJDI_DATA[2];
BreakControl_P [EJDI_ADDR [7:4]] = breakcontrol;

end

2'b10: begin
AddressMask_P [EJDI_ADDR [7:4]] = EJDI_DATA [31:1];

end
endcase

end

casex (EJDI_ADDR [3:2])
2'b00: begin
EJIM_DATA = {AddressBreak_R [EJDI_ADDR [7:4]], 1'b0};
end





2'b01: begin
breakcontrol = BreakControl_R [EJDI_ADDR [7:4]];
EJIM_DATA [0] = breakcontrol [0];
EJIM_DATA [2] = breakcontrol [1];
EJIM_DATA [1] = 1'b0;
EJIM_DATA [31:3] = {29{1'b0}};
end

2'b10: begin
EJIM_DATA = {AddressMask_R [EJDI_ADDR [7:4]], 1'b0};
end




default:
begin
EJIM_DATA = 32'h00000000;




end
endcase



if (EJDI_ADDR [7:4] >= NIBRK) begin

EJIM_DATA = 32'h00000000;
end


end

else begin
EJIM_DATA = {4'b0000,
ibrk,
{15-NIBRK+9 {1'b0}},
InstBreakStatus_R};
end


if (EJDI_SELIBS) begin

if (!EJDI_RW && EJ_STROBE) begin
InstBreakStatus_P = EJDI_DATA [NIBRK-1:0];
end
end

EJIM_BREAKHIT = 1'b0;
EJIM_TRACEHIT = 1'b0;
Hit_S = {NIBRK {1'b0}};


if (LW_ISAMPLE_S) begin
for (i = 0; i < NIBRK; i = i + 1) begin


breakcontrol = BreakControl_R [i];


HitRaw_S[i] = &((LW_IADDR_S_R ~^ {AddressBreak_R[i], 1'b0}) |
{AddressMask_R[i], 1'b1});

Hit_S[i] = HitRaw_S[i] & breakcontrol[0];



EJIM_BREAKHIT = Hit_S[i] | EJIM_BREAKHIT;
EJIM_TRACEHIT = HitRaw_S[i] & breakcontrol[1] | EJIM_TRACEHIT;
end
end
end



always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
for (j = 0; j < NIBRK; j = j + 1) begin
BreakControl_R [j] <= 2'b00;
end
InstBreakStatus_R <= {NIBRK {1'b0}};
Hit_E_R <= {NIBRK {1'b0}};
Hit_M_R <= {NIBRK {1'b0}};
HitPend_R <= {NIBRK {1'b0}};
end
else begin
if (!PBI_EJHOLD) begin
Hit_E_R <= Hit_S | HitPend_R;
end
for (j = 0; j < NIBRK; j = j + 1) begin
BreakControl_R [j] <= BreakControl_P [j];
end
InstBreakStatus_R <= InstBreakStatus_P;
Hit_M_R <= Hit_M_P;
HitPend_R <= HitPend_P;
end
end

always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
for (k = 0; k < NIBRK; k = k + 1) begin
AddressBreak_R [k] <= 31'b000_0000_0000_0000_0000_0000_0000_0000;
AddressMask_R [k] <= 31'b000_0000_0000_0000_0000_0000_0000_0000;
end
end
else begin
for (k = 0; k < NIBRK; k = k + 1) begin
AddressBreak_R [k] <= AddressBreak_P [k];
AddressMask_R [k] <= AddressMask_P [k];
end
end
end




task printregs;
begin

for (i = 0; i < 2; i = i + 1) begin
$display ("AddressBreak[0]: 0", i, AddressBreak_P [i]);

$display ("AddressMask[0]: 0", i, AddressMask_P [i]);
$display ("BreakControl[0]: 0", i, BreakControl_P [i]);
$display ("AddressBreak[0]: 0", i, AddressBreak_R [i]);

$display ("AddressMask[0]: 0", i, AddressMask_R [i]);
$display ("BreakControl[0]: 0", i, BreakControl_R [i]);
end
end
endtask


endmodule

