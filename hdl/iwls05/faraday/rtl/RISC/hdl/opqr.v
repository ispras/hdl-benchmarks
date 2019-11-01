



















































































module ejtag_pmatch














(


EJPM_DATA, EJPM_TRACEHIT_R, EJPM_BREAKHIT_R,

EJDI_SELPBS, EJDI_SELPBRS, LBC_MADDR, LBC_MDATA, LBC_MRW, LBC_MUC,
LBC_MID, LBC_MTOGGLE, EJ_STROBE, CORE_CLOCK, RESET_D1_R_N,
RESET_DIS
);

`include "../include/lxr_symbols.vh"

parameter NPBRK=`EJTAG_RTL_PROCS;

input EJDI_SELPBS;
input EJDI_SELPBRS;

input [31:0] LBC_MADDR;
input [31:0] LBC_MDATA;
input LBC_MRW;
input LBC_MUC;
input LBC_MID;
input LBC_MTOGGLE;
input EJ_STROBE;

input CORE_CLOCK;
input RESET_D1_R_N;

input RESET_DIS;

output [31:0] EJPM_DATA;
output EJPM_TRACEHIT_R;
output EJPM_BREAKHIT_R;

reg [31:1] AddressBreak_R [NPBRK-1:0],
AddressBreak_P [NPBRK-1:0];
reg [31:0] DataBreak_R [NPBRK-1:0],
DataBreak_P [NPBRK-1:0];
reg [31:0] DataMask_R [NPBRK-1:0],
DataMask_P [NPBRK-1:0];
reg [31:0] BreakControl_R [NPBRK-1:0],
BreakControl_P [NPBRK-1:0];


reg [NPBRK-1:0] ProcBreakStatus_R, ProcBreakStatus_P;
reg BreakHit_R, BreakHit_P;
reg TraceHit_R, TraceHit_P;

reg Toggle_D1_R;
reg Toggle_D2_R;




reg [NPBRK-1:0] qualify;
reg [NPBRK-1:0] q1;
reg [NPBRK-1:0] q2;
reg [NPBRK-1:0] q3;
reg [NPBRK-1:0] q4;
reg [NPBRK-1:0] hit;
reg [NPBRK-1:0] hitaddr;
reg [NPBRK-1:0] hitdata;

reg [31:0] breakcontrol;


wire cmpstrobe = Toggle_D1_R ^ Toggle_D2_R;




reg [31:0] EJPM_DATA;


integer i;
integer j;
integer k;
reg [3:0] pbrk;

assign EJPM_BREAKHIT_R = BreakHit_R;
assign EJPM_TRACEHIT_R = TraceHit_R;



`define EJ_PBC_BE 0
`define EJ_PBC_TE 2
`define EJ_PBC_IFUC 4
`define EJ_PBC_DLUC 5
`define EJ_PBC_DSUC 6
`define EJ_PBC_DSCA 7
`define EJ_PBC_LAM 31:8



wire NC_RESET_DIS = RESET_DIS;






wire RESET_D2_R_N;

reg RESET_X_R_N;
always @ (posedge CORE_CLOCK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | RESET_DIS;









always @( EJDI_SELPBRS or EJDI_SELPBS
or EJ_STROBE or LBC_MADDR or LBC_MDATA or LBC_MID or LBC_MRW
or LBC_MUC or ProcBreakStatus_R or cmpstrobe) begin




BreakHit_P = 1'b0;
TraceHit_P = 1'b0;

for (i = 0; i < NPBRK; i = i + 1) begin
AddressBreak_P [i] = AddressBreak_R [i];
DataBreak_P [i] = DataBreak_R [i];
DataMask_P [i] = DataMask_R [i];
BreakControl_P [i] = BreakControl_R [i];
end


ProcBreakStatus_P = ProcBreakStatus_R;
pbrk = NPBRK;


if (EJDI_SELPBRS) begin

if (!LBC_MRW && (LBC_MADDR [7:4] < NPBRK) && EJ_STROBE) begin


casex (LBC_MADDR [3:2])
2'b00: begin
AddressBreak_P [LBC_MADDR [7:4]] = LBC_MDATA [31:1];

end

2'b01: begin
DataBreak_P [LBC_MADDR [7:4]] = LBC_MDATA;

end

2'b10: begin
DataMask_P [LBC_MADDR [7:4]] = LBC_MDATA;

end

2'b11: begin
BreakControl_P [LBC_MADDR [7:4]] = LBC_MDATA;

end
endcase

end

casex (LBC_MADDR [3:2])
2'b00: begin
EJPM_DATA = {AddressBreak_R [LBC_MADDR [7:4]], 1'b0};
end

2'b01: begin
EJPM_DATA = DataBreak_R [LBC_MADDR [7:4]];
end

2'b10: begin
EJPM_DATA = DataMask_R [LBC_MADDR [7:4]];
end

2'b11: begin
EJPM_DATA = BreakControl_R [LBC_MADDR [7:4]];
end
endcase



if (LBC_MADDR [7:4] >= NPBRK) begin

EJPM_DATA = 32'h0000_0000;
end


end

else
EJPM_DATA = {4'b0000,
pbrk,
{15-NPBRK+9 {1'b0}},
ProcBreakStatus_R};


if (EJDI_SELPBS) begin
if (!LBC_MRW && EJ_STROBE) begin
ProcBreakStatus_P = LBC_MDATA [NPBRK-1:0];
end
end


for (i = 0; i < NPBRK; i = i + 1) begin

q1[i] = 1'b0;
q2[i] = 1'b0;
q3[i] = 1'b0;
q4[i] = 1'b0;



breakcontrol = BreakControl_R [i];


if (!breakcontrol [`EJ_PBC_IFUC]) begin
if (LBC_MID && LBC_MUC) begin
q1[i] = 1'b1;
end
end


if (!breakcontrol [`EJ_PBC_DLUC] &&
(!LBC_MID && LBC_MUC && LBC_MRW)) begin
q2[i] = 1'b1;
end

if (!breakcontrol [`EJ_PBC_DSUC] &&
(!LBC_MID && LBC_MUC && !LBC_MRW)) begin
q3[i] = 1'b1;
end

if (!breakcontrol [`EJ_PBC_DSCA] &&
(!LBC_MID && !LBC_MUC && !LBC_MRW)) begin
q4[i] = 1'b1;
end

qualify[i] = ~(q1[i] | q2[i] | q3[i] | q4[i]);


hitaddr[i] = &(({LBC_MADDR[31:1], 1'b0} ~^ {AddressBreak_R[i], 1'b0}) |
{8'h00, breakcontrol [`EJ_PBC_LAM]});
hitdata[i] = &((LBC_MDATA ~^ DataBreak_R[i]) | DataMask_R[i]);
hit[i] = hitaddr[i] & (hitdata[i] & cmpstrobe);


if (hit[i] && qualify[i]) begin
if (breakcontrol [`EJ_PBC_BE]) begin
BreakHit_P = 1'b1;
ProcBreakStatus_P [i] = 1'b1;
end

if (breakcontrol [`EJ_PBC_TE]) begin
TraceHit_P = 1'b1;
ProcBreakStatus_P [i] = 1'b1;
end
end
end

end



always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
for (j = 0; j < NPBRK; j = j + 1) begin

BreakControl_R [j] <= 32'h0000_0000;
end
ProcBreakStatus_R <= {NPBRK {1'b0}};
Toggle_D1_R <= 1'b0;
Toggle_D2_R <= 1'b0;
BreakHit_R <= 1'b0;
TraceHit_R <= 1'b0;
end
else begin
for (j = 0; j < NPBRK; j = j + 1) begin
BreakControl_R [j] <= BreakControl_P [j];
end
ProcBreakStatus_R <= ProcBreakStatus_P;
Toggle_D1_R <= LBC_MTOGGLE;
Toggle_D2_R <= Toggle_D1_R;
BreakHit_R <= BreakHit_P;
TraceHit_R <= TraceHit_P;
end
end


always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
for (k = 0; k < NPBRK; k = k + 1) begin
AddressBreak_R [k] <= 31'b000_0000_0000_0000_0000_0000_0000_0000;
DataBreak_R [k] <= 32'h0000_0000;
DataMask_R [k] <= 32'h0000_0000;
end
end
else begin
for (k = 0; k < NPBRK; k = k + 1) begin
AddressBreak_R [k] <= AddressBreak_P [k];
DataBreak_R [k] <= DataBreak_P [k];
DataMask_R [k] <= DataMask_P [k];
end
end
end



task printregs;
begin

for (i = 0; i < 2; i = i + 1) begin
$display (" *AddressBreak[0]: 0", i, AddressBreak_P [i]);
$display (" *DataBreak[0]: 0", i, DataBreak_P [i]);
$display (" *DataMask[0]: 0", i, DataMask_P [i]);
$display (" *BreakControl[0]: 0", i, BreakControl_P [i]);
$display (" AddressBreak[0]: 0", i, AddressBreak_R [i]);
$display (" DataBreak[0]: 0", i, DataBreak_R [i]);
$display (" DataMask[0]: 0", i, DataMask_R [i]);
$display (" BreakControl[0]: 0", i, BreakControl_R [i]);
end
end
endtask



endmodule
