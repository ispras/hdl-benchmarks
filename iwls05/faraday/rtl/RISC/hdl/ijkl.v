module ejtag_control














(

EJC_CTL, EJC_DEBUGCTL, EJC_DMASTART, EJC_DMAREAD, EJC_DMASIZE,
EJC_DMAINC, EJC_DMAACC, EJC_DINT_R, EJC_ECRPROBEEN_R, EJC_ECRPRRST_R,
EJC_ECRPCAS_R, EJC_STROBE, EJC_DCRTM_R, EJC_DCRMINT_R, EJC_PCTRON_R,
JTAG_CLRIR,

EJSN_CTL, EJSN_UPDATECTL, LBC_MDATA, EJDI_SELDCR, EJDI_SELDBG,
LBC_MRW, LBC_MTOGGLE, LBC_EVAL, CORE_RUN, CORE_DOZE, CORE_HALT,
EJDI_SELPROBE, EJSN_PCTRACEON, JTAG_DINT, EJ_DIS, JTAG_CLOCK,
CORE_CLOCK, JPT_DBM2PCSTSET_P, RESET_D1_JR_N, RESET_D1_R_N,
RESET_PWRON_N, TMODE
);

`include "lxr_symbols.vh"





`define ECR_CLKEN 0
`define ECR_TOF 1
`define ECR_TIF 2
`define ECR_BRKST 3
`define ECR_DINC 4
`define ECR_DLOCK 5
`define ECR_RES6 6
`define ECR_DSZ 8:7
`define ECR_DRWN 9
`define ECR_DERR 10
`define ECR_DSTRT 11
`define ECR_JTAGBRK 12
`define ECR_RES13 13
`define ECR_SETDEV 14
`define ECR_PROBEN 15
`define ECR_PRRST 16
`define ECR_DMAACC 17
`define ECR_PRACC 18
`define ECR_PRNW 19
`define ECR_PERRST 20
`define ECR_RUN 21
`define ECR_DOZE 22
`define ECR_SYNC 23
`define ECR_PCLEN 25:24
`define ECR_PCASID 26
`define ECR_RES30_27 30:27
`define ECR_WASRST 31

`define DCR_TM 0
`define DCR_MRST 1
`define DCR_MP 2
`define DCR_MNMI 3
`define DCR_MINT 4
`define DCR_TOF 5
`define DCR_TIF 6
`define DCR_RES28_7 28:7
`define DCR_ENM 29
`define DCR_HIS 30
`define DCR_DZS 31

input [31:0] EJSN_CTL;
input EJSN_UPDATECTL;

input [31:0] LBC_MDATA;
input EJDI_SELDCR;
input EJDI_SELDBG;
input LBC_MRW;
input LBC_MTOGGLE;
input LBC_EVAL;

input CORE_RUN;
input CORE_DOZE;
input CORE_HALT;
input EJDI_SELPROBE;


input EJSN_PCTRACEON;
input JTAG_DINT;

input EJ_DIS;

input JTAG_CLOCK;
input CORE_CLOCK;

input JPT_DBM2PCSTSET_P;

input RESET_D1_JR_N;
input RESET_D1_R_N;
input RESET_PWRON_N;

input TMODE;

output [31:0] EJC_CTL;

output [31:0] EJC_DEBUGCTL;


output EJC_DMASTART;
output EJC_DMAREAD;
output [1:0] EJC_DMASIZE;
output EJC_DMAINC;

output EJC_DMAACC;
output EJC_DINT_R;
output EJC_ECRPROBEEN_R;
output EJC_ECRPRRST_R;

output EJC_ECRPCAS_R;
output EJC_STROBE;


output EJC_DCRTM_R;


output EJC_DCRMINT_R;


output EJC_PCTRON_R;
output JTAG_CLRIR;







reg [31:0] EJC_CTL;
reg [31:0] EJC_DEBUGCTL;

wire EJC_ECRPRRST_R;
wire EJC_DCRMINT_R;
wire EJC_DCRTM_R;
wire EJC_ECRPCAS_R;
wire EJC_ECRPROBEEN_R;
wire EJC_PCTRON_R;



wire NC_FOO = TMODE;




reg [31:0] Ecr_JR, Ecr_P;


reg DmaErr_R;
wire DmaErr_P;


reg Write_R;
wire Write_P;
reg [1:0] Size_R;
wire [1:0] Size_P;

reg [31:0] Dcr_R, Dcr_P;
reg SelDbg_D1_R;
reg MToggle_D1_R;
reg MToggle_D2_R;
reg MToggle_D3_R;
reg Pracc_D1_R;
reg StartDma_D1_R;
reg EJC_DINT_R;
wire EJC_DINT_P;

reg PRnW_JR;
wire PRnW_P;


reg [31:0] jctl;

wire dma_ns;
wire dma_sn;
reg dma_start;

wire jtagbreak_ns;
wire jtagbreak_sn;
reg jtagbreak_start;

wire tif_ns;
wire tif_sn;
reg tif_start;
reg tif_done;

wire tof_ns;
wire tof_sn;
reg tof_start;
reg tof_done;

wire pracc_ns;
wire pracc_sn;

wire clear_ir_n;

wire enable = ~EJ_DIS;


wire RESET_D2_R_N;



assign PRnW_P = pracc_sn ? PRnW_JR : ~LBC_MRW;

assign EJC_DMAINC = Ecr_P[`ECR_DINC];
assign EJC_DMAREAD = Write_P;
assign EJC_DMASIZE = Size_P;
assign EJC_DMASTART = dma_sn & ~StartDma_D1_R;
assign EJC_DMAACC = Ecr_JR[`ECR_DMAACC];
assign EJC_STROBE = (~pracc_ns & Pracc_D1_R) |
((MToggle_D2_R ^ MToggle_D3_R) & SelDbg_D1_R);
assign EJC_DINT_P = jtagbreak_sn | JTAG_DINT;


ejtag_async ecr_probeen
(.OUT (EJC_ECRPROBEEN_R),
.IN (Ecr_JR[`ECR_PROBEN] & ~Ecr_JR[`ECR_SETDEV]),
.RESET_N (RESET_PWRON_N),
.CLK (CORE_CLOCK));
ejtag_async ecr_prrst
(.OUT (EJC_ECRPRRST_R),
.IN (Ecr_JR[`ECR_PRRST]),
.RESET_N (RESET_PWRON_N),
.CLK (CORE_CLOCK));
ejtag_async ecr_pcasid
(.OUT (EJC_ECRPCAS_R), .IN (Ecr_JR[`ECR_PCASID]), .RESET_N (`RESET_D2_R_N_), .CLK (CORE_CLOCK));


ejtag_async dcr_tm
(.OUT (EJC_DCRTM_R), .IN (Dcr_R[`DCR_TM]), .RESET_N (`RESET_D2_R_N_), .CLK (CORE_CLOCK));


ejtag_async dcr_mint
(.OUT (EJC_DCRMINT_R), .IN (Dcr_R[`DCR_MINT]), .RESET_N (`RESET_D2_R_N_), .CLK (CORE_CLOCK));



assign Write_P = EJC_DMASTART ? Ecr_JR[`ECR_DRWN] : Write_R;

assign Size_P = EJC_DMASTART ?
{Ecr_JR[8], Ecr_JR[8] ^ Ecr_JR[7]} : Size_R;

assign JTAG_CLRIR = ~clear_ir_n;


always @(CORE_DOZE or CORE_HALT or CORE_RUN or Dcr_R
or EJDI_SELDCR or EJSN_CTL or EJSN_PCTRACEON
or EJSN_UPDATECTL or Ecr_JR or JPT_DBM2PCSTSET_P or LBC_MDATA
or LBC_MRW or PRnW_P or dma_ns or enable or jtagbreak_ns
or pracc_sn or tif_ns or tif_sn or tof_ns or tof_sn) begin














Dcr_P = Dcr_R;
EJC_DEBUGCTL = Dcr_R;


jctl[`ECR_CLKEN] = Ecr_JR[`ECR_CLKEN];
jctl[`ECR_TOF] = tof_sn;
jctl[`ECR_TIF] = tif_ns;
jctl[`ECR_BRKST] = JPT_DBM2PCSTSET_P;
jctl[`ECR_DINC] = Ecr_JR[`ECR_DINC];
jctl[`ECR_DLOCK] = Ecr_JR[`ECR_DLOCK];
jctl[`ECR_RES6] = 1'b0;
jctl[`ECR_DSZ] = Ecr_JR[`ECR_DSZ];
jctl[`ECR_DRWN] = Ecr_JR[`ECR_DRWN];

jctl[`ECR_DERR] = 1'b0;
jctl[`ECR_DSTRT] = dma_ns;
jctl[`ECR_JTAGBRK] = jtagbreak_ns;
jctl[`ECR_RES13] = 1'b0;
jctl[`ECR_SETDEV] = Ecr_JR[`ECR_SETDEV];
jctl[`ECR_PROBEN] = Ecr_JR[`ECR_PROBEN];
jctl[`ECR_PRRST] = Ecr_JR[`ECR_PRRST];
jctl[`ECR_DMAACC] = Ecr_JR[`ECR_DMAACC];
jctl[`ECR_PRACC] = pracc_sn;


jctl[`ECR_PRNW] = PRnW_P;

jctl[`ECR_PERRST] = Ecr_JR[`ECR_PERRST];
jctl[`ECR_RUN] = CORE_RUN;
jctl[`ECR_DOZE] = CORE_DOZE;
jctl[`ECR_SYNC] = Ecr_JR[`ECR_SYNC];
jctl[`ECR_PCLEN] = Ecr_JR[`ECR_PCLEN];
jctl[`ECR_PCASID] = 1'b0;
jctl[`ECR_RES30_27] = 5'b00000;
jctl[`ECR_WASRST] = Ecr_JR[`ECR_WASRST];

EJC_CTL = jctl;

if (EJSN_UPDATECTL) begin


Ecr_P = enable ? EJSN_CTL : 32'b00000000_0000_0110_0000_0001_0000_0010;
tof_done = ~EJSN_CTL[`ECR_TOF] & enable;
tif_start = EJSN_CTL[`ECR_TIF] & enable;

dma_start = EJSN_CTL[`ECR_DSTRT];
jtagbreak_start = EJSN_CTL[`ECR_JTAGBRK] & enable;


Ecr_P[`ECR_SYNC] = EJSN_CTL[`ECR_SYNC] & ~EJSN_CTL[`ECR_PRACC] & Ecr_JR[`ECR_PRACC];
end
else begin

Ecr_P = Ecr_JR;
Ecr_P[`ECR_SYNC] = Ecr_JR[`ECR_SYNC] & ~EJSN_PCTRACEON;
tof_done = 1'b0;
tif_start = 1'b0;
dma_start = 1'b0;
jtagbreak_start = 1'b0;
end

Dcr_P[`DCR_TM] = Dcr_R[`DCR_TM];
Dcr_P[`DCR_MRST] = Dcr_R[`DCR_MRST];
Dcr_P[`DCR_MP] = Dcr_R[`DCR_MP];
Dcr_P[`DCR_MNMI] = Dcr_R[`DCR_MNMI];
Dcr_P[`DCR_MINT] = Dcr_R[`DCR_MINT];
Dcr_P[`DCR_TOF] = tof_ns;
Dcr_P[`DCR_TIF] = tif_sn;
Dcr_P[`DCR_RES28_7] = 22'b00_0000_0000_0000_0000_0000;
Dcr_P[`DCR_ENM] = 1'b1;
Dcr_P[`DCR_HIS] = CORE_HALT;
Dcr_P[`DCR_DZS] = CORE_DOZE;

tof_start = 1'b0;
tif_done = 1'b0;


if (!LBC_MRW && EJDI_SELDCR) begin
Dcr_P[`DCR_TM] = LBC_MDATA[`DCR_TM];
Dcr_P[`DCR_MRST] = LBC_MDATA[`DCR_MRST];
Dcr_P[`DCR_MP] = LBC_MDATA[`DCR_MP];
Dcr_P[`DCR_MNMI] = LBC_MDATA[`DCR_MNMI];
Dcr_P[`DCR_MINT] = LBC_MDATA[`DCR_MINT];
tof_start = LBC_MDATA[`DCR_TOF];
tif_done = ~LBC_MDATA[`DCR_TIF];
end
end

always @(posedge CORE_CLOCK `negedge_RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
Dcr_R <= 32'h0000_0000;
DmaErr_R <= 1'b0;
SelDbg_D1_R <= 1'b0;
MToggle_D1_R <= 1'b0;
MToggle_D2_R <= 1'b0;
MToggle_D3_R <= 1'b0;
Pracc_D1_R <= 1'b0;
StartDma_D1_R <= 1'b0;
Write_R <= 1'b0;
Size_R <= 2'b00;
EJC_DINT_R <= 1'b0;
end
else begin
Dcr_R <= Dcr_P;
DmaErr_R <= DmaErr_P;
SelDbg_D1_R <= EJDI_SELDBG;
MToggle_D1_R <= LBC_MTOGGLE;
MToggle_D2_R <= MToggle_D1_R;
MToggle_D3_R <= MToggle_D2_R;
Pracc_D1_R <= pracc_ns;
StartDma_D1_R <= dma_sn;
Write_R <= Write_P;
Size_R <= Size_P;
EJC_DINT_R <= EJC_DINT_P;
end
end




reg RESET_X_R_N;





always @ (posedge CORE_CLOCK)
RESET_X_R_N <= RESET_D1_R_N;





assign RESET_D2_R_N = RESET_X_R_N | TMODE;









always @(posedge JTAG_CLOCK or negedge RESET_D1_JR_N) begin
if (!RESET_D1_JR_N) begin
Ecr_JR [30:0] <= 31'b000_0000_0000_0000_0000_0000_0000_0000;

end
else begin
Ecr_JR [30:0] <= Ecr_P [30:0];

end
end




always @(posedge JTAG_CLOCK or negedge `RESET_D2_R_N_) begin
if (!`RESET_D2_R_N_) begin
Ecr_JR [31] <= 1'b0;
PRnW_JR <= 1'b0;
end
else begin
Ecr_JR [31] <= Ecr_P [31];
PRnW_JR <= PRnW_P;
end
end





ejtag_setclr dma
(
.SETQ (dma_ns),
.CLRQ (dma_sn),
.SET (dma_start),
.CLR (LBC_EVAL),
.SETCLK (JTAG_CLOCK),
.SETRST_N (`RESET_D2_R_N_),

.CLRCLK (CORE_CLOCK),
.CLRRST_N (`RESET_D2_R_N_)
);

ejtag_setclr tif
(
.SETQ (tif_ns),
.CLRQ (tif_sn),
.SET (tif_start),
.CLR (tif_done),
.SETCLK (JTAG_CLOCK),
.SETRST_N (`RESET_D2_R_N_),

.CLRCLK (CORE_CLOCK),
.CLRRST_N (`RESET_D2_R_N_)
);

ejtag_setclr tof
(
.SETQ (tof_ns),
.CLRQ (tof_sn),
.SET (tof_start),
.CLR (tof_done),
.SETCLK (CORE_CLOCK),
.SETRST_N (`RESET_D2_R_N_),
.CLRCLK (JTAG_CLOCK),
.CLRRST_N (`RESET_D2_R_N_)

);

ejtag_setclr jtagbreak
(
.SETQ (jtagbreak_ns),
.CLRQ (jtagbreak_sn),
.SET (jtagbreak_start),
.CLR (JPT_DBM2PCSTSET_P),
.SETCLK (JTAG_CLOCK),
.SETRST_N (`RESET_D2_R_N_),

.CLRCLK (CORE_CLOCK),

.CLRRST_N (`RESET_D2_R_N_)

);

ejtag_setclr pracc
(
.SETQ (pracc_ns),
.CLRQ (pracc_sn),
.SET (EJDI_SELPROBE & (MToggle_D2_R ^ MToggle_D1_R)),
.CLR (~Ecr_JR[`ECR_PRACC] & ~Ecr_P[`ECR_SYNC] & enable),
.SETCLK (CORE_CLOCK),
.SETRST_N (`RESET_D2_R_N_),
.CLRCLK (JTAG_CLOCK),
.CLRRST_N (`RESET_D2_R_N_)

);

ejtag_setclr pctrace
(
.SETQ (EJC_PCTRON_R),
.CLRQ (clear_ir_n),
.SET (EJSN_PCTRACEON),
.CLR (JPT_DBM2PCSTSET_P),
.SETCLK (JTAG_CLOCK),
.SETRST_N (RESET_D1_JR_N),
.CLRCLK (CORE_CLOCK),
.CLRRST_N (`RESET_D2_R_N_)
);

endmodule
