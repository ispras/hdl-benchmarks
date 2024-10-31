
























































































`include "lxr_symbols.vh"

module lmi_lbc

(

DDATAI, DDATAO,




SYS_WBEMPTY_W_R, CBUS_DREQ, CBUS_DADDR, CBUS_DUC,
CBUS_DRW, CBUS_DLINE, CBUS_DSZ, CBUS_DBE, CBUS_DO, CBUS_DADDR_E1,
CBUS_IREQ, CBUS_IADDR, CBUS_IUC, CBUS_DDM, CBUS_IDM, IDATAO, DVALO,
IVALO, PBI_EJHOLD, PBI_EJJPTHOLD,

IDCLOCKI, CFG_MEMFULLWORD, CFG_MEMZEROFIRST, CFG_LINEADDRFILTER,
CFG_DCOFF, CFG_ICOFF, TMODE, RESET_D1_R_N, SEN,
CBUS_SWBEMPTY, CBUS_SIVAL, CBUS_SDVAL, CBUS_SIDATA, CBUS_SDDATA,
LMI_DreadEX, LMI_DwriteEX, LMI_DBE, LMI_DSX, LMI_DAckR, LMI_DAckW,
LMI_DMissQC, LMI_DCSTWBUS, DNXTADDRI, CP0_IEJORDM_I, CP0_JCTRLDM_M_R,
LMI_IstallIF, LMI_IMissQC, LMI_IMissQW, INXTADDRI, X_HALT_R,
LMI_Exception, DOECI, IOECI, IOEWI, DDISI, IDISI
);

input IDCLOCKI;
input CFG_MEMFULLWORD;
input CFG_MEMZEROFIRST;
input CFG_LINEADDRFILTER;
input CFG_DCOFF;
input CFG_ICOFF;
input TMODE;
input RESET_D1_R_N;



input SEN;


output SYS_WBEMPTY_W_R;
reg SYS_WBEMPTY_W_R;



output CBUS_DREQ;
output [31:0] CBUS_DADDR;
output CBUS_DUC;
output CBUS_DRW;
output CBUS_DLINE;
output [1:0] CBUS_DSZ;
output [3:0] CBUS_DBE;
output [31:0] CBUS_DO;
output [31:0] CBUS_DADDR_E1;
output CBUS_DDM;

output CBUS_IREQ;
output [31:0] CBUS_IADDR;
output CBUS_IUC;
output CBUS_IDM;

input CBUS_SWBEMPTY;
input CBUS_SIVAL;
input CBUS_SDVAL;
input [31:0] CBUS_SIDATA;
input [31:0] CBUS_SDDATA;



input LMI_DreadEX;
input LMI_DwriteEX;
input [3:0] LMI_DBE;
input LMI_DSX;
input LMI_DAckR;
input LMI_DAckW;
input LMI_DMissQC;
input LMI_DCSTWBUS;

input [31:0] DNXTADDRI;
input CP0_IEJORDM_I;
input CP0_JCTRLDM_M_R;


input [31:0] DDATAI;
output [31:0] DDATAO;


output [31:0] IDATAO;
output DVALO;



input LMI_IstallIF;
input LMI_IMissQC;
input LMI_IMissQW;

input [31:0] INXTADDRI;

output IVALO;




input [`HALT_SIG_RANGE] X_HALT_R;

input LMI_Exception;

input DOECI;
input IOECI;
input IOEWI;

input DDISI;
input IDISI;

output PBI_EJHOLD;
output PBI_EJJPTHOLD;

wire [31:0] DATAO;





wire RESET_D2_R_N;


reg CBUS_SIVAL_D1_R;
reg CBUS_SDVAL_D1_R;
reg [31:0] CBUS_SIDATA_D1_R;
reg [31:0] CBUS_SDDATA_D1_R;

reg [1:0] DSz_W_D1_R;
reg DSign_W_D1_R;
reg [1:0] DOffset_W_D1_R;

reg [31:0] CBUS_DO;
wire CBUS_DSIGN;


wire NC_FOO = SEN;




reg RESET_X_R_N;


always @ (posedge IDCLOCKI)
RESET_X_R_N <= RESET_D1_R_N;


assign RESET_D2_R_N = RESET_X_R_N | TMODE;





































lmi_lbc_cbi lmi(

.DSysReq (CBUS_DREQ),
.DSysRW (CBUS_DRW),
.DSysLine (CBUS_DLINE),
.DSysSz (CBUS_DSZ),
.DSysBE (CBUS_DBE),
.DSysSign (CBUS_DSIGN),
.ISysReq (CBUS_IREQ),
.ISysAddr (CBUS_IADDR),
.IDM (CBUS_IDM),
.DDM (CBUS_DDM),
.DSysAddr (CBUS_DADDR),
.DCmpAddr (CBUS_DADDR_E1),
.ISysUC (CBUS_IUC),
.DSysUC (CBUS_DUC),
.PBI_EJHOLD (PBI_EJHOLD),
.PBI_EJJPTHOLD (PBI_EJJPTHOLD),

.IDCLOCKI (IDCLOCKI),
.RESET_D1_R_N (RESET_D1_R_N),
.TMODE (TMODE),
.CFG_MEMFULLWORD (CFG_MEMFULLWORD),
.CFG_MEMZEROFIRST (CFG_MEMZEROFIRST),
.CFG_LINEADDRFILTER (CFG_LINEADDRFILTER),
.CFG_DCOFF (CFG_DCOFF),
.CFG_ICOFF (CFG_ICOFF),
.C_DREAD_E (LMI_DreadEX),
.C_DWRITE_E (LMI_DwriteEX),
.C_DSIGN_E (LMI_DSX),
.C_DBE_E (LMI_DBE),
.C_DADDR_E (DNXTADDRI),
.DR_ACK_M (LMI_DAckR),
.DW_ACK_M (LMI_DAckW),
.DC_MISS_W_R (LMI_DMissQC),
.DC_WRITE_W (LMI_DCSTWBUS),
.C_ISTALL_I (LMI_IstallIF),
.C_IADDR_B (INXTADDRI),
.IC_MISS_S_R (LMI_IMissQC),
.IW_MISS_S_R (LMI_IMissQW),
.C_EXCEPTION_M (LMI_Exception),
.CP0_IEJORDM_I (CP0_IEJORDM_I),
.CP0_JCTRLDM_M_R (CP0_JCTRLDM_M_R),
.X_HALT_R (X_HALT_R[`HALT_SIG_RANGE]));












lmi_lbc_align align(

.DO (DATAO),

.SXI (DSign_W_D1_R),
.SZI (DSz_W_D1_R),
.OFFSETI (DOffset_W_D1_R),
.DI (CBUS_SDDATA_D1_R));




assign IDATAO = CBUS_SIDATA_D1_R;

wire NC_FOO1 = IOECI;
wire NC_FOO2 = IOEWI;
wire NC_FOO3 = IDISI;








assign DDATAO = DATAO;

wire NC_FOO4 = DOECI;
wire NC_FOO5 = DDISI;




assign IVALO = CBUS_SIVAL_D1_R;
assign DVALO = CBUS_SDVAL_D1_R;

always @ (posedge IDCLOCKI `negedge_RESET_D2_R_N_)
if (!`RESET_D2_R_N_)
begin
DSz_W_D1_R <= 2'b00;
DSign_W_D1_R <= 1'b0;
DOffset_W_D1_R <= 2'b00;
end
else if (CBUS_DREQ)
begin
DSz_W_D1_R <= CBUS_DSZ;
DSign_W_D1_R <= CBUS_DSIGN;
DOffset_W_D1_R <= CBUS_DADDR[1:0];
end


always @ (posedge IDCLOCKI `negedge_RESET_D2_R_N_)
if (!`RESET_D2_R_N_)
begin
CBUS_DO <= 32'd0;
SYS_WBEMPTY_W_R <= 1'b0;
CBUS_SIVAL_D1_R <= 1'b0;
CBUS_SDVAL_D1_R <= 1'b0;
CBUS_SIDATA_D1_R <= 32'd0;
CBUS_SDDATA_D1_R <= 32'd0;
end
else
begin
CBUS_DO <= DDATAI;
SYS_WBEMPTY_W_R <= CBUS_SWBEMPTY;
CBUS_SIVAL_D1_R <= CBUS_SIVAL;
CBUS_SDVAL_D1_R <= CBUS_SDVAL;
CBUS_SIDATA_D1_R <= CBUS_SIDATA;
CBUS_SDDATA_D1_R <= CBUS_SDDATA;
end

endmodule
