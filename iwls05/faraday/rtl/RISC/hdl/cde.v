module lbc_data










(

LD_LADDR_LR, LD_LDATA_LR, LD_CIDATA, LD_CDDATA, LD_EJDATA, LD_MADDR,
LD_MDATA, LD_MRW, LD_MID, LD_MUC, LD_MEJDEST, LD_LRW, LD_LLINE_LR,
LD_LUC_LR, LD_LID_LR, LD_LEJ_LR, LD_LCMD_LR, LD_FCTLHIT, LD_IVAL,
LD_DVAL, LD_EVAL,

LBUS_DATA, CBUS_IADDR, CBUS_DADDR, CBUS_DADDR_E1, CBUS_DO, CBUS_DUC,
CBUS_IUC, CBUS_DDM, CBUS_IDM, CBUS_DSZ, CBUS_DLINE, EJ_DMAADDR,
EJ_DMADATA, EJ_DMARW, EJ_DMASZ, LC_EJDONE, EJ_SLAVEDATA, LL_CHOLD,
SYSCLK, BUSCLK, MEMSEQUENTIAL, RESET_D1_LR_N, RESET_D1_R_N,
LC_DVALID_R, LC_CILOAD, LC_CDRLOAD, LC_CQSEL, LC_FCTLLOAD,
LUP_CDATAEN_R, LC_FCTLDOSHIFT, LL_FCTLRLOAD, LL_FCTLRDOSHIFT,
LBCSYNCMODE, RESET_DIS
);


`include "lxr_symbols.vh"

input [31:0] LBUS_DATA;

input [31:0] CBUS_IADDR;
input [31:0] CBUS_DADDR;
input [31:0] CBUS_DADDR_E1;
input [31:0] CBUS_DO;

input CBUS_DUC;
input CBUS_IUC;
input CBUS_DDM;
input CBUS_IDM;
input [1:0] CBUS_DSZ;
input CBUS_DLINE;

input [31:0] EJ_DMAADDR;
input [31:0] EJ_DMADATA;
input EJ_DMARW;
input [1:0] EJ_DMASZ;

input LC_EJDONE;

input [31:0] EJ_SLAVEDATA;

input LL_CHOLD;
input SYSCLK;
input BUSCLK;
input MEMSEQUENTIAL;
input RESET_D1_LR_N;
input RESET_D1_R_N;

input LC_DVALID_R;
input LC_CILOAD;
input LC_CDRLOAD;
input [`LBC_NSMUX:0] LC_CQSEL;
input [`LBC_NWRITES:0] LC_FCTLLOAD;

input LUP_CDATAEN_R;

input LC_FCTLDOSHIFT;
input [`LBC_NREADS:0] LL_FCTLRLOAD;
input LL_FCTLRDOSHIFT;

input LBCSYNCMODE;

input RESET_DIS;

output [31:0] LD_LADDR_LR;
output [31:0] LD_LDATA_LR;

output [31:0] LD_CIDATA;
output [31:0] LD_CDDATA;
output [31:0] LD_EJDATA;

output [31:0] LD_MADDR;
output [31:0] LD_MDATA;
output LD_MRW;
output LD_MID;
output LD_MUC;
output LD_MEJDEST;

output LD_LRW;
output LD_LLINE_LR;

output LD_LUC_LR;
output LD_LID_LR;
output LD_LEJ_LR;

output [6:0] LD_LCMD_LR;
output [`LBC_NWRITES:0] LD_FCTLHIT;

output LD_IVAL;
output LD_DVAL;
output LD_EVAL;





reg [31:0] Laddr_LR, Laddr_P;
reg [31:0] Ldata_LR, Ldata_P;
reg [1:0] Lsz_LR, Lsz_P;
reg Lrw_LR, Lrw_P;
reg Lline_LR, Lline_P;
reg Lid_LR, Lid_P;
reg Luc_LR, Luc_P;
reg Ldm_LR, Ldm_P;
reg Lej_LR, Lej_P;

reg [6:0] LCmd_LR;
wire [6:0] LCmd_P;


reg [31:0] Maddr_R, Maddr_P;
reg [31:0] Mdata_R, Mdata_P;
reg [1:0] Msz_R, Msz_P;
reg Mrw_R, Mrw_P;
reg Mline_R, Mline_P;
reg Mid_R, Mid_P;
reg Mej_R, Mej_P;
reg Muc_R, Muc_P;
reg Mdm_R, Mdm_P;
reg Mejdest_R, Mejdest_P;

reg [31:0] Iaddr_R, Iaddr_P;
reg Iuc_R, Iuc_P;
reg Idm_R, Idm_P;
reg [31:0] DRaddr_R, DRaddr_P;
wire [31:0] ddata = CBUS_DO;
reg [1:0] DRsz_R, DRsz_P;
reg DRline_R, DRline_P;
reg DRuc_R, DRuc_P;
reg DRdm_R, DRdm_P;

wire Interleave_C1;


wire [31:0] dwdata;
wire [31:0] dwaddr;
wire [1:0] dwsz;
wire dwuc;
wire dwdm;

wire [31:0] cdata;
wire cid;
wire cej;
wire ival;
wire dval;

assign LD_LDATA_LR = Ldata_LR;
assign LD_LADDR_LR = Laddr_LR;
assign LD_LRW = Mrw_R;
assign LD_LLINE_LR = Lline_LR;
assign LD_LCMD_LR = LCmd_LR;
assign LD_LUC_LR = Luc_LR;
assign LD_LID_LR = Lid_LR;
assign LD_LEJ_LR = Lej_LR;














assign LCmd_P[6] = ~Lrw_P;
assign LCmd_P[5] = Lline_P;
assign LCmd_P[4] = Lline_P & ~Interleave_C1;
assign LCmd_P[3:0] = {2'b10, Lsz_P} & {4 {~Lline_P}};

assign LD_MADDR = Maddr_R;
assign LD_MDATA = Mdata_R;
assign LD_MRW = Mrw_R;
assign LD_MID = Mid_R;
assign LD_MUC = Muc_R;
assign LD_MEJDEST = Mejdest_R;




lbc_and ival_and (.OUT (ival), .IN1 (LUP_CDATAEN_R), .IN2 (cid & ~cej));
lbc_and dval_and (.OUT (dval), .IN1 (LUP_CDATAEN_R), .IN2 (~cid & ~cej));

lbc_and eval_and (.OUT (LD_EVAL), .IN1 (LUP_CDATAEN_R), .IN2 (cej));


assign LD_IVAL = ival | (LC_EJDONE & Mid_R);
assign LD_DVAL = dval | (LC_EJDONE & ~Mid_R & Mrw_R);


assign LD_CIDATA = (LC_EJDONE & Mid_R) ? EJ_SLAVEDATA : cdata;
assign LD_CDDATA = (LC_EJDONE & ~Mid_R) ? EJ_SLAVEDATA : cdata;
assign LD_EJDATA = LD_EVAL ? cdata : 32'h0000_0000;



wire RESET_D2_LR_N;
wire RESET_D2_R_N;



assign Interleave_C1 = ~MEMSEQUENTIAL;








reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | RESET_DIS;





reg RESET_X_LR_N;
always @(posedge BUSCLK)
RESET_X_LR_N <= RESET_D1_LR_N;
assign RESET_D2_LR_N = RESET_X_LR_N | RESET_DIS;





always @(posedge SYSCLK `negedge_RESET_D2_R_N_)
begin
if (!`RESET_D2_R_N_) begin
DRaddr_R <= 32'h0000_0000;
DRsz_R <= 2'b00;
DRline_R <= 1'b0;
DRuc_R <= 1'b0;
DRdm_R <= 1'b0;
Iaddr_R <= 32'h0000_0000;
Iuc_R <= 1'b0;
Idm_R <= 1'b0;

Maddr_R <= 32'h0000_0000;
Mdata_R <= 32'h0000_0000;
Msz_R <= 2'b00;
Mid_R <= 1'b0;
Mej_R <= 1'b0;
Mrw_R <= 1'b0;
Mline_R <= 1'b0;
Muc_R <= 1'b0;
Mdm_R <= 1'b0;
Mejdest_R <= 1'b0;
end
else begin
DRaddr_R <= DRaddr_P;
DRsz_R <= DRsz_P;
DRline_R <= DRline_P;
DRuc_R <= DRuc_P;
DRdm_R <= DRdm_P;
Iaddr_R <= Iaddr_P;
Iuc_R <= Iuc_P;
Idm_R <= Idm_P;

Maddr_R <= Maddr_P;
Mdata_R <= Mdata_P;
Msz_R <= Msz_P;
Mid_R <= Mid_P;
Mej_R <= Mej_P;
Muc_R <= Muc_P;
Mdm_R <= Mdm_P;
Mrw_R <= Mrw_P;
Mline_R <= Mline_P;
Mejdest_R <= Mejdest_P;
end

end









always @(LBCSYNCMODE or LL_CHOLD or Laddr_LR or Ldata_LR
or Ldm_LR or Lej_LR or Lid_LR or Lline_LR or Lrw_LR or Lsz_LR
or Luc_LR or Maddr_P or Maddr_R or Mdata_P or Mdata_R
or Mdm_P or Mdm_R or Mej_P or Mej_R or Mid_P or Mid_R
or Mline_P or Mline_R or Mrw_P or Mrw_R or Msz_P or Msz_R
or Muc_P or Muc_R)
begin

if (LL_CHOLD) begin
Laddr_P = Laddr_LR;
Ldata_P = Ldata_LR;
Lsz_P = Lsz_LR;
Lid_P = Lid_LR;
Luc_P = Luc_LR;
Ldm_P = Ldm_LR;
Lej_P = Lej_LR;
Lrw_P = Lrw_LR;
Lline_P = Lline_LR;
end
else begin
if (LBCSYNCMODE) begin
Laddr_P = Maddr_P;
Ldata_P = Mdata_P;
Lsz_P = Msz_P;
Lid_P = Mid_P;
Luc_P = Muc_P;
Ldm_P = Mdm_P;
Lej_P = Mej_P;
Lrw_P = Mrw_P;
Lline_P = Mline_P;
end
else begin
Laddr_P = Maddr_R;
Ldata_P = Mdata_R;
Lsz_P = Msz_R;
Lid_P = Mid_R;
Luc_P = Muc_R;
Ldm_P = Mdm_R;
Lej_P = Mej_R;
Lrw_P = Mrw_R;
Lline_P = Mline_R;
end
end
end

always @(posedge BUSCLK `negedge_RESET_D2_LR_N_) begin
if (!`RESET_D2_LR_N_)
begin
Laddr_LR <= 0;
Ldata_LR <= 0;
Lsz_LR <= 0;
Lid_LR <= 0;
Luc_LR <= 0;
Ldm_LR <= 0;
Lej_LR <= 0;
Lrw_LR <= 0;
Lline_LR <= 0;
LCmd_LR <= 0;
end
else
begin
Laddr_LR <= Laddr_P;
Ldata_LR <= Ldata_P;
Lsz_LR <= Lsz_P;
Lid_LR <= Lid_P;
Luc_LR <= Luc_P;
Ldm_LR <= Ldm_P;
Lej_LR <= Lej_P;
Lrw_LR <= Lrw_P;
Lline_LR <= Lline_P;
LCmd_LR <= LCmd_P;
end
end


always @(CBUS_DADDR or CBUS_DADDR_E1 or CBUS_DDM
or CBUS_DLINE or CBUS_DSZ or CBUS_DUC or CBUS_IADDR
or CBUS_IDM or CBUS_IUC or DRaddr_R or DRdm_R or DRline_R
or DRsz_R or DRuc_R or EJ_DMAADDR or EJ_DMADATA or EJ_DMARW
or EJ_DMASZ or Iaddr_R or Idm_R or Iuc_R or LC_CDRLOAD
or LC_CILOAD or LC_CQSEL or LC_DVALID_R or dwaddr or dwdata
or dwdm or dwsz or dwuc)

begin









if (LC_CILOAD)
begin
Iaddr_P = CBUS_IADDR;
Iuc_P = CBUS_IUC;
Idm_P = CBUS_IDM;
end
else
begin
Iaddr_P = Iaddr_R;
Iuc_P = Iuc_R;
Idm_P = Idm_R;
end


if (LC_CDRLOAD)
begin
DRaddr_P = CBUS_DADDR;
DRsz_P = CBUS_DSZ;
DRline_P = CBUS_DLINE;
DRuc_P = CBUS_DUC;
DRdm_P = CBUS_DDM;
end
else
begin
if (LC_DVALID_R)
DRaddr_P = DRaddr_R;
else
DRaddr_P = CBUS_DADDR_E1;
DRsz_P = DRsz_R;
DRline_P = DRline_R;
DRuc_P = DRuc_R;
DRdm_P = DRdm_R;
end














casex (1'b1)

LC_CQSEL[0]:
begin
Maddr_P = EJ_DMAADDR;
Mdata_P = EJ_DMADATA;
Msz_P = EJ_DMASZ;
Mrw_P = EJ_DMARW;
Mline_P = 1'b0;
Mid_P = 1'b1;
Mej_P = 1'b1;
Muc_P = 1'b0;
Mdm_P = 1'b1;
end

LC_CQSEL[1]:
begin
Maddr_P = Iaddr_P;
Mdata_P = 32'hxxxx_xxxx;
Msz_P = 2'b11;
Mrw_P = 1'b1;
Mline_P = ~Iuc_P;
Mid_P = 1'b1;
Mej_P = 1'b0;
Muc_P = Iuc_P;
Mdm_P = Idm_P;
end

LC_CQSEL[2]:
begin
Maddr_P = DRaddr_P;
Mdata_P = 32'hxxxx_xxxx;
Msz_P = DRsz_P;
Mrw_P = 1'b1;
Mline_P = DRline_P;
Mid_P = 1'b0;
Mej_P = 1'b0;
Muc_P = DRuc_P;
Mdm_P = DRdm_P;
end

LC_CQSEL[3]:
begin
Maddr_P = dwaddr;
Mdata_P = dwdata;
Msz_P = dwsz;
Mrw_P = 1'b0;
Mline_P = 1'b0;
Mid_P = 1'b0;
Mej_P = 1'b0;
Muc_P = dwuc;
Mdm_P = dwdm;
end

default:
begin


if ((LC_CQSEL[0] + LC_CQSEL[1] + LC_CQSEL[2] +
LC_CQSEL[3] + LC_CQSEL[4] + LC_CQSEL[5]) > 1)
$display ("Ambiguous states in lbc_data");




Mdata_P = 32'h0000_0000;
Maddr_P = 32'h0000_0000;
Msz_P = 2'b00;
Mrw_P = 1'b0;
Mline_P = 1'b0;
Mid_P = 1'b0;
Mej_P = 1'b0;
Muc_P = 1'b0;
Mdm_P = 1'b0;
end

endcase




Mejdest_P = Maddr_P [31:21] == 11'b1111_1111_001 & Mdm_P;

end






wire [`LBC_NWRITES:0] wdummyhito;



fifo_data #(`LBC_WRITES, 35) write_data
(
.CLOCKI (SYSCLK),
.DATAI ({CBUS_DSZ, CBUS_DDM, ddata}),
.DATAO ({dwsz, dwdm, dwdata}),

.CMPI ({35 {1'bx}}),

.CTLLOADI (LC_FCTLLOAD),
.CTLDOSHIFTI (LC_FCTLDOSHIFT),
.CTLHITO (wdummyhito),
.RESET_DIS (RESET_DIS),
.RESET_D1_R_N (RESET_D1_R_N)
);

wire [`LBC_NWRITES:0] uchit;
wire [`LBC_NWRITES:0] addrhit;





assign LD_FCTLHIT = addrhit | uchit;

fifo_data #(`LBC_WRITES, 1, 0) write_uc
(
.CLOCKI (SYSCLK),
.DATAI (CBUS_DUC),
.DATAO (dwuc),
.CMPI (1'b1),
.CTLLOADI (LC_FCTLLOAD),
.CTLDOSHIFTI (LC_FCTLDOSHIFT),
.CTLHITO (uchit),
.RESET_DIS (RESET_DIS),
.RESET_D1_R_N (RESET_D1_R_N)
);

fifo_data #(`LBC_WRITES) write_addr
(
.CLOCKI (SYSCLK),
.DATAI (CBUS_DADDR),
.DATAO (dwaddr),
.CMPI (DRaddr_R),
.CTLLOADI (LC_FCTLLOAD),
.CTLDOSHIFTI (LC_FCTLDOSHIFT),
.CTLHITO (addrhit),
.RESET_DIS (RESET_DIS),
.RESET_D1_R_N (RESET_D1_R_N)
);


wire [`LBC_NREADS:0] rdummyhito;


fifo_data #(`LBC_READS, 34) read_data
(
.CLOCKI (BUSCLK),
.DATAI ({Lid_LR, Lej_LR, LBUS_DATA}),
.DATAO ({cid, cej, cdata}),

.CMPI ({34 {1'bx}}),

.CTLLOADI (LL_FCTLRLOAD),
.CTLDOSHIFTI (LL_FCTLRDOSHIFT),
.CTLHITO (rdummyhito),
.RESET_DIS (RESET_DIS),
.RESET_D1_R_N (RESET_D1_LR_N)
);





endmodule

