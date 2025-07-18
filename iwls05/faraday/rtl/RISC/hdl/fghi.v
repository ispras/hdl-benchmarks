



















































































`include "lxr_symbols.vh"

module lx0

















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































(
SYSCLK,

SYSCLKF, SL_SLEEPSYS_C1_R, SL_SLEEPSYS_C2_R, SL_SLEEPSYS_C3_R,




BUSCLKF, SL_SLEEPBUS_C1_BR, SL_SLEEPBUS_C2_BR, SL_SLEEPBUS_C3_BR,

BUSCLK,




JTAG_RST_N,

RESET_N, RESET_PWRON_N, EJC_ECRPRRST_R,

RESET_D1_R_N, RESET_D1_BR_N,


RESET_PWRON_C1_N, RESET_PWRON_D1_LR_N,






EXT_SLEEPREQ_R,


IntreqN,

MAC_RES_E,
CE1_RES_E,
CEI_CE0HOLD,
CEI_CE1HOLD,
MAC_SEL_E_R,
CE1_SEL_E_R,

MAC_HALT_E_R,
CE1_HALT_E_R,

CEI_CE1OP_S_R,
CEI_CE0OP_S_R,
CEI_INSTM32_S_R_N,

CEI_CE0AOP_E_R,
CEI_CE0BOP_E_R,
CEI_CE1AOP_E_R,
CEI_CE1BOP_E_R,


CEI_XCPN_M_C0,
CEI_XCPN_M_C1,


LW_ISAMPLE_S,
LW_IADDR_S_R,

LW_DSAMPLE_W,
LW_DWRITE_W_R,
LW_DBYEN_W_R,
LW_DADDR_W_R,
LW_DATA_W_R,




CFG_EJTMLOG2,
CFG_EJTBIT0M16,
EJT_DREN_R,
EJC_DINT_R,
EJIM_BREAKHIT_S,
EJIM_TRACEHIT_S,
EJDM_BREAKHIT_W,
EJDM_TRACEHIT_W,
EJPM_BREAKHIT_R,
EJPM_TRACEHIT_R,
EJC_ECRPROBEEN_R,
EJC_DCRMINT_R,
EJC_ECRPCAS_R,
EJC_DCRTM_R,
EJC_PCTRON_R,


JPT_PCST_DR,
JPT_TPC_DR,
JPT_DBM2PCSTSET_P,
CP0_JCTRLJRST_R,
CP0_JCTRLDM_I_R,

CP0_DBRKSETIFDMBH,
CP0_DBREAKCLR,
CP0_JXCPN1STIFDMBH_M_P,
CP0_JXCPN1STIFNOTDMBH_M_P,
CP0_DDBXIFDMBH_M_P,
CP0_DDBXUNCOND_M_P,
CP0_DIBIFNOTDMBH_M_P,


Cond_in1,
C1rd_addr, C1rhold, C1rd_gen, C1rd_con, C1rd_data,
C1wr_addr, C1wr_gen, C1wr_con, C1wr_data,
C1cnt_inst, C1cnt_imiss, C1cnt_istall, C1cnt_dmiss, C1cnt_dstall, C1cnt_dload, C1cnt_dstore,



Cond_in2,
C2rd_addr, C2rhold, C2rd_gen, C2rd_con, C2rd_data,
C2wr_addr, C2wr_gen, C2wr_con, C2wr_data,
C2cnt_inst, C2cnt_imiss, C2cnt_istall, C2cnt_dmiss, C2cnt_dstall, C2cnt_dload, C2cnt_dstore,



Cond_in3,
C3rd_addr, C3rhold, C3rd_gen, C3rd_con, C3rd_data,
C3wr_addr, C3wr_gen, C3wr_con, C3wr_data,
C3cnt_inst, C3cnt_imiss, C3cnt_istall, C3cnt_dmiss, C3cnt_dstall, C3cnt_dload, C3cnt_dstore,


PBI_EJJPTHOLD,
PBI_EJHOLD,

CBUS_HALT_W_R, CBUS_SWBEMPTY, CBUS_SIVAL, CBUS_SDVAL, CBUS_SIDATA, CBUS_SDDATA,
CBUS_DREQ, CBUS_DADDR, CBUS_DUC, CBUS_DRW, CBUS_DLINE, CBUS_DSZ, CBUS_DBE, CBUS_DO, CBUS_DADDR_E1,
CBUS_DDM, CBUS_IREQ, CBUS_IADDR, CBUS_IUC, CBUS_IDM,

CFG_ICOFF,
EXT_ICREQRAM_R, IC_GNTRAM_R,


IC_TAGINDEX, ICR_TAGRD0, IC_TAGWR0,
ICR_TAGMASK,
IC_TAG0WE, IC_TAG0WEN,
IC_TAG0RE, IC_TAG0REN, IC_TAG0CS, IC_TAG0CSN,
IC_INSTINDEX, IC_INSTWR,
ICR_INST0RD, IC_INST0WE, IC_INST0WEN,
IC_INST0RE, IC_INST0REN, IC_INST0CS, IC_INST0CSN,






IW_VALIDINDEX, IWR_VALIDRD, IW_VALIDWR, IW_VALIDWE, IW_VALIDWEN,
IW_VALIDRE, IW_VALIDREN, IW_VALIDCS, IW_VALIDCSN,
IW_INSTINDEX, IWR_INSTRD, IW_INSTWR, IW_INSTWE, IW_INSTWEN,
IW_INSTRE, IW_INSTREN, IW_INSTCS, IW_INSTCSN,
CFG_IRAMISROM,
IWC_BASE, IWC_RAMTOP,
EXT_IWREQRAM_R, IW_GNTRAM_R,


CFG_DCOFF,
EXT_DCREQRAM_R, DC_GNTRAM_R,



DC_TAGINDEX, DCR_TAGRD, DC_TAGWR, DC_TAGWE, DC_TAGWEN, DCC_TAGMASK,
DC_TAGRE, DC_TAGREN, DC_TAGCS, DC_TAGCSN,
DC_DATAINDEX, DCR_DATARD, DC_DATAWR, DC_DATAWE, DC_DATAWEN,
DC_DATARE, DC_DATAREN, DC_DATACS, DC_DATACSN,




DW_DATAINDEX, DWR_DATARD, DW_DATAWR, DW_DATAWE, DW_DATAWEN, CFG_DWDISW,
DW_DATARE, DW_DATAREN, DW_DATACS, DW_DATACSN,
DWC_BASE, DWC_TOP,
EXT_DWREQRAM_R, DW_GNTRAM_R,



CFG_SLEEPENABLE,


CFG_LINEADDRFILTER,
CFG_HLENABLE,
CFG_MEMSEQUENTIAL,
CFG_MEMZEROFIRST,
CFG_MEMFULLWORD
);







input SYSCLK;



input SYSCLKF;
output SL_SLEEPSYS_C1_R;
output SL_SLEEPSYS_C2_R;
output SL_SLEEPSYS_C3_R;






input BUSCLKF;
output SL_SLEEPBUS_C1_BR;
output SL_SLEEPBUS_C2_BR;
output SL_SLEEPBUS_C3_BR;

input BUSCLK;




input JTAG_RST_N;

input RESET_N;
input RESET_PWRON_N;
input EJC_ECRPRRST_R;

output RESET_D1_R_N;
output RESET_D1_BR_N;


output RESET_PWRON_C1_N;
output RESET_PWRON_D1_LR_N;















input EXT_SLEEPREQ_R;


input [5:0] IntreqN;

input [31:0] MAC_RES_E;
input [31:0] CE1_RES_E;
output CEI_CE0HOLD;
output CEI_CE1HOLD;
input MAC_SEL_E_R;
input CE1_SEL_E_R;
input [`HALT_DRV_RANGE] MAC_HALT_E_R;
input [`HALT_DRV_RANGE] CE1_HALT_E_R;
output [11:0] CEI_CE1OP_S_R;
output [11:0] CEI_CE0OP_S_R;
output CEI_INSTM32_S_R_N;

output [31:0] CEI_CE0AOP_E_R;
output [31:0] CEI_CE0BOP_E_R;
output [31:0] CEI_CE1AOP_E_R;

output [31:0] CEI_CE1BOP_E_R;

output CEI_XCPN_M_C0;
output CEI_XCPN_M_C1;



output LW_ISAMPLE_S;
output [31:0] LW_IADDR_S_R;

output LW_DSAMPLE_W;
output LW_DWRITE_W_R;
output [3:0] LW_DBYEN_W_R;
output [31:0] LW_DADDR_W_R;
output [31:0] LW_DATA_W_R;





input [1:0] CFG_EJTMLOG2;
input CFG_EJTBIT0M16;
input EJT_DREN_R;
input EJC_DINT_R;
input EJIM_BREAKHIT_S;
input EJIM_TRACEHIT_S;
input EJDM_BREAKHIT_W;
input EJDM_TRACEHIT_W;
input EJPM_BREAKHIT_R;
input EJPM_TRACEHIT_R;
input EJC_ECRPROBEEN_R;
input EJC_DCRMINT_R;
input EJC_ECRPCAS_R;
input EJC_DCRTM_R;
input EJC_PCTRON_R;

output [11:0] JPT_PCST_DR;
output [8:1] JPT_TPC_DR;
output JPT_DBM2PCSTSET_P;
output CP0_JCTRLJRST_R;
output CP0_JCTRLDM_I_R;


output CP0_DBRKSETIFDMBH;
output CP0_DBREAKCLR;
output CP0_JXCPN1STIFDMBH_M_P;
output CP0_JXCPN1STIFNOTDMBH_M_P;
output CP0_DDBXIFDMBH_M_P;
output CP0_DDBXUNCOND_M_P;
output CP0_DIBIFNOTDMBH_M_P;


input Cond_in1;
output [4:0] C1rd_addr;
output C1rhold;
output C1rd_gen;
output C1rd_con;
output [4:0] C1wr_addr;
output C1wr_gen;
output C1wr_con;
output [31:0] C1wr_data;
input [31:0] C1rd_data;
output C1cnt_inst;
output C1cnt_imiss;
output C1cnt_istall;
output C1cnt_dmiss;
output C1cnt_dstall;
output C1cnt_dload;
output C1cnt_dstore;



input Cond_in2;
output [4:0] C2rd_addr;
output C2rhold;
output C2rd_gen;
output C2rd_con;
output [4:0] C2wr_addr;
output C2wr_gen;
output C2wr_con;
output [31:0] C2wr_data;
input [31:0] C2rd_data;
output C2cnt_inst;
output C2cnt_imiss;
output C2cnt_istall;
output C2cnt_dmiss;
output C2cnt_dstall;
output C2cnt_dload;
output C2cnt_dstore;



input Cond_in3;
output [4:0] C3rd_addr;
output C3rhold;
output C3rd_gen;
output C3rd_con;
output [4:0] C3wr_addr;
output C3wr_gen;
output C3wr_con;
output [31:0] C3wr_data;
input [31:0] C3rd_data;
output C3cnt_inst;
output C3cnt_imiss;
output C3cnt_istall;
output C3cnt_dmiss;
output C3cnt_dstall;
output C3cnt_dload;
output C3cnt_dstore;



output PBI_EJJPTHOLD;
output PBI_EJHOLD;

input [`HALT_DRV_RANGE] CBUS_HALT_W_R;
input CBUS_SWBEMPTY;

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


input CBUS_SIVAL;
input CBUS_SDVAL;
input [31:0] CBUS_SIDATA;
input [31:0] CBUS_SDDATA;

input CFG_ICOFF;
input EXT_ICREQRAM_R;
output IC_GNTRAM_R;



output [`IC_ADDR_HI:`LINE_ADDR_HI+1] IC_TAGINDEX;
input [32:`IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE] ICR_TAGRD0;
output [32:`IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE] IC_TAGWR0;
output IC_TAG0WE;
output IC_TAG0WEN;
output IC_TAG0RE;
output IC_TAG0REN;
output IC_TAG0CS;
output IC_TAG0CSN;
input [`IC_TAG_EXTRA_SIZE-1:0] ICR_TAGMASK;
output [`IC_ADDR_HI:2] IC_INSTINDEX;
output [31:0] IC_INSTWR;
input [31:0] ICR_INST0RD;
output IC_INST0WE;
output IC_INST0WEN;
output IC_INST0RE;
output IC_INST0REN;
output IC_INST0CS;
output IC_INST0CSN;








output [`IW_ADDR_HI:9] IW_VALIDINDEX;
input [31:0] IWR_VALIDRD;
output [31:0] IW_VALIDWR;
output IW_VALIDWE;
output IW_VALIDWEN;
output IW_VALIDRE;
output IW_VALIDREN;
output IW_VALIDCS;
output IW_VALIDCSN;

output [`IW_ADDR_HI:2] IW_INSTINDEX;
input [31:0] IWR_INSTRD;
output [31:0] IW_INSTWR;
output IW_INSTWE;
output IW_INSTWEN;
output IW_INSTRE;
output IW_INSTREN;
output IW_INSTCS;
output IW_INSTCSN;
input CFG_IRAMISROM;
input [31:`LM_BASE_LO] IWC_BASE;
input [`LM_TOP_HI:4] IWC_RAMTOP;
input EXT_IWREQRAM_R;
output IW_GNTRAM_R;



input CFG_DCOFF;
input EXT_DCREQRAM_R;
output DC_GNTRAM_R;




output [`DC_ADDR_HI:`LINE_ADDR_HI+1] DC_TAGINDEX;
input [32:`DC_ADDR_HI+1-`DC_TAG_EXTRA_SIZE] DCR_TAGRD;
output [32:`DC_ADDR_HI+1-`DC_TAG_EXTRA_SIZE] DC_TAGWR;
output DC_TAGWE;
output DC_TAGWEN;
output DC_TAGRE;
output DC_TAGREN;
output DC_TAGCS;
output DC_TAGCSN;
input [`DC_TAG_EXTRA_SIZE-1:0] DCC_TAGMASK;
output [`DC_ADDR_HI:2] DC_DATAINDEX;
input [31:0] DCR_DATARD;
output [31:0] DC_DATAWR;
output DC_DATAWE;
output DC_DATAWEN;
output DC_DATARE;
output DC_DATAREN;
output DC_DATACS;
output DC_DATACSN;





output [`DW_ADDR_HI:2] DW_DATAINDEX;
input [31:0] DWR_DATARD;
output [31:0] DW_DATAWR;
output DW_DATAWE;
output DW_DATAWEN;
output DW_DATARE;
output DW_DATAREN;
output DW_DATACS;
output DW_DATACSN;
input CFG_DWDISW;
input [31:`LM_BASE_LO] DWC_BASE;
input [`LM_TOP_HI:4] DWC_TOP;
input EXT_DWREQRAM_R;
output DW_GNTRAM_R;



input CFG_SLEEPENABLE;


input CFG_LINEADDRFILTER;
input CFG_HLENABLE;
input CFG_MEMSEQUENTIAL;
input CFG_MEMZEROFIRST;
input CFG_MEMFULLWORD;





























wire IstallIF;
wire [31:0] IaddrWB;

wire [31:0] InstIF;











wire [31:0] `InstUpSeg0;


wire [31:0] `InstUpSeg1;







wire [31:0] `DataUpSeg0;


wire [31:0] `DataUpSeg1;


wire [31:0] `DataUpSeg2;


wire [31:0] `DataUpSeg3;


wire [31:0] `DataUpSeg4;


wire [31:0] `DataUpSeg5;





wire [31:0] `DataDownSeg0;


wire [31:0] `DataDownSeg1;


wire [31:0] `DataDownSeg2;


wire [31:0] `DataDownSeg3;


wire [31:0] `DataDownSeg4;


wire [31:0] `DataDownSeg5;











wire [31:0] DaddrEX;
wire [3:0] DbyenEX;
wire CP0_SLEEP_M_R;
wire [7:0] CP0_IM_W_R;

wire [7:0] CcntlWB;

wire DreadEX;
wire DWORD_E;
wire DsignEX;
wire DwriteEX;


wire [31:0] DbusM;



wire SL_SLEEPSYS_C0_R;

wire SL_SLEEPBUS_C0_BR;

wire [`HALT_DRV_RANGE] SL_HALT_W_R;


wire [`HALT_DRV_RANGE] HL_HALT_E_R;
wire [`HALT_DRV_RANGE] JPT_HALT_M_R;
wire [`HALT_DRV_RANGE] RALU_HALT_E_R;



wire [31:0] CE0_RES_E;
wire CE0_SEL_E_R;
wire [31:0] CEI_CEHLW_AOP_E_R;
wire [11:0] RALU_CE0OP_S_R;
wire RALU_INSTM32_S_R_N;
wire HLREGHOLD;
wire RESET_D1_C1_R_N;
wire INSTM32_S_R_N;
wire CP0_XCPN_M;
wire RESET_D1_C1_BR_N;
wire CP0_IEJORDM_I;
wire CP0_JCTRLDM_M_R;



















































wire IC_MISS_P;
wire IC_MISS_R;
wire [`HALT_DRV_RANGE] IC_HALT_S_R;
wire IC_VAL;




wire [`HALT_DRV_RANGE] IW_HALT_S_R;
wire IMissWObs;
wire InstOEWS;
wire IW_MISS_R;
wire IW_VAL;
wire IW_ACK;



wire IS_VAL;
wire InstOECS;
wire DataOECS;



wire DC_MISS_P;
wire DC_MISS_R;
wire DBareMissC;
wire [`HALT_DRV_RANGE] DC_HALT_W_R;
wire [`HALT_DRV_RANGE] DC_HALT_M_R;
wire DC_VAL;
wire DCSTWBUS;
wire DC_RPAlgnIfNBNA;
wire DC_RPAlgnIfB;
wire DC_RPQuietIfNBA;
wire DC_RPQuietIfB;




wire DW_ACK;
wire [`HALT_DRV_RANGE] DW_HALT_W_R;
wire DW_VAL;




wire [`HALT_DRV_RANGE] CBUS_HALT_W_R;
wire SYS_WBEMPTY_W_R;
wire DS_VAL;


wire CpCond1;



wire CpCond2;



wire CpCond3;




wire BUSCLK;









core CORE1
(
.SYSCLK (SYSCLK),
.RESET1N (`LX_RESET_D1_C1_R_N_),

.SEN (`CFG_SEN ),
.TMODE (`CFG_TMODE ),

.CFG_INSTM16EN (`CFG_INST16MEN),
.INTREQN (IntreqN),
.CP0_INSTM32_S_R_N (INSTM32_S_R_N ),


.CFG_EJTMLOG2 (CFG_EJTMLOG2),
.CFG_EJTBIT0M16 (CFG_EJTBIT0M16),
.EJT_DREN_R (EJT_DREN_R),
.EJC_DINT_R (EJC_DINT_R),
.EJIM_BREAKHIT_S (EJIM_BREAKHIT_S),
.EJIM_TRACEHIT_S (EJIM_TRACEHIT_S),
.EJDM_BREAKHIT_W (EJDM_BREAKHIT_W),
.EJDM_TRACEHIT_W (EJDM_TRACEHIT_W),
.EJPM_BREAKHIT_R (EJPM_BREAKHIT_R),
.EJPM_TRACEHIT_R (EJPM_TRACEHIT_R),
.EJC_ECRPROBEEN_R (EJC_ECRPROBEEN_R),
.EJC_DCRMINT_R (EJC_DCRMINT_R),
.EJC_ECRPCAS_R (EJC_ECRPCAS_R),
.EJC_DCRTM_R (EJC_DCRTM_R),
.EJC_PCTRON_R (EJC_PCTRON_R),


.JPT_PCST_DR (JPT_PCST_DR),
.JPT_TPC_DR (JPT_TPC_DR),
.JPT_DBM2PCSTSET_P (JPT_DBM2PCSTSET_P),
.CP0_JCTRLJRST_R (CP0_JCTRLJRST_R),
.CP0_JCTRLDM_I_R (CP0_JCTRLDM_I_R),
.CP0_IEJORDM_I (CP0_IEJORDM_I),
.CP0_JCTRLDM_M_R (CP0_JCTRLDM_M_R),
.CP0_JXCPN1STIFDMBH_M_P (CP0_JXCPN1STIFDMBH_M_P),
.CP0_JXCPN1STIFNOTDMBH_M_P (CP0_JXCPN1STIFNOTDMBH_M_P),
.CP0_DIBIFNOTDMBH_M_P (CP0_DIBIFNOTDMBH_M_P),
.CP0_DBREAKCLR (CP0_DBREAKCLR),
.CP0_DBRKSETIFDMBH (CP0_DBRKSETIFDMBH),
.CP0_DDBXIFDMBH_M_P (CP0_DDBXIFDMBH_M_P),
.CP0_DDBXUNCOND_M_P (CP0_DDBXUNCOND_M_P),

.CP0_XCPN_M (CP0_XCPN_M),
.CEI_XCPN_M_C0 (CEI_XCPN_M_C0),
.CEI_XCPN_M_C1 (CEI_XCPN_M_C1),
.CE1_RES_E (CE1_RES_E),
.CE1_SEL_E_R (CE1_SEL_E_R),

.CE1HOLD (CEI_CE1HOLD),

.CE0_RES_E (CE0_RES_E),
.CE0_SEL_E_R (CE0_SEL_E_R),

.CE0HOLD (CEI_CE0HOLD),
.HLREGHOLD (HLREGHOLD),

.RALU_CE0OP_S_R (RALU_CE0OP_S_R),
.RALU_INSTM32_S_R_N (RALU_INSTM32_S_R_N),

.CEI_CE1OP_S_R (CEI_CE1OP_S_R),
.CEI_CE0OP_S_R (CEI_CE0OP_S_R),
.CEI_INSTM32_S_R_N (CEI_INSTM32_S_R_N),

.CEI_CE0AOP_E_R (CEI_CE0AOP_E_R),
.CEI_CE0BOP_E_R (CEI_CE0BOP_E_R),

.CEI_CE1AOP_E_R (CEI_CE1AOP_E_R),
.CEI_CE1BOP_E_R (CEI_CE1BOP_E_R),



.CEI_CEHLW_AOP_E_R (CEI_CEHLW_AOP_E_R),

.CP0_IADDR_I_P (IaddrWB),
.CP0_INULL_I (IstallIF),
.INST_I (InstIF),
.RALU_DADDR_E (DaddrEX),
.RALU_DREAD_E_R (DreadEX),
.RALU_DSIGN_E_R (DsignEX),
.RALU_DWRITE_E_R (DwriteEX),
.RALU_DBYEN_E (DbyenEX),
.RALU_DWORD_E (DWORD_E),

.DBUSMUPIN (`DataPUpIn),
.RALU_ADATAREG_M_R (`DataPDownOut),

.CI1_COND (`CpCond1),
.CI2_COND (`CpCond2),
.CI3_COND (`CpCond3),

.JPT_HALT_M_R (JPT_HALT_M_R),
.RALU_HALT_E_R (RALU_HALT_E_R),
.X_HALT_R (`HALT_OBS_CORE_),

.IVALC ( `IC_VAL_ ),
.IVALW ( `IW_VAL_ ),
.IVALR ( 1'b0 ),
.IMISSC ( `IC_MISS_R_ ),
.IMISSW ( `IW_MISS_R_ ),
.IMISSR ( 1'b0 ),
.DVALC ( `DC_VAL_ ),
.DVALW ( `DW_VAL_ ),
.DVALR ( 1'b0 ),
.DMISSC ( `DC_MISS_R_ ),
.DMISSW ( `DW_MISS_R_ ),
.DMISSR ( 1'b0 ),
.CP0_SLEEP_M_R ( CP0_SLEEP_M_R ),
.CP0_IM_W_R ( CP0_IM_W_R ),
.CP0_CCNTL_W_R ( CcntlWB )

);








copif_bus COPIF1

(

.SYSCLK (SYSCLK),
.TMODE ( `CFG_TMODE ),
.RESET1N (`LX_RESET_D1_C1_R_N_),
.INSTM32_S_R_N (INSTM32_S_R_N ),
.SEN (`CFG_SEN ),
.EXCEPTION (CP0_XCPN_M),
.COPNO (2'b01),
.INSTIF (InstIF),
.ISTALLIF (IstallIF),
.IMISS ({`IC_MISS_R_, `IW_MISS_R_, 1'b0}),
.DMISS ({`DC_MISS_R_, `DW_MISS_R_, 1'b0}),
.IVAL ({`IC_VAL_, `IW_VAL_, 1'b0}),
.DVAL ({`DC_VAL_, `DW_VAL_, 1'b0}),
.X_HALT_R (`HALT_OBS_COP1_),
.CONDINN (Cond_in1),
.CPCONDN (CpCond1),
.CRDADDR (C1rd_addr),
.RHOLD (C1rhold),
.CRDGEN (C1rd_gen),
.CRDCON (C1rd_con),
.CRDDATA (C1rd_data),
.CWRADDR (C1wr_addr),
.CWRGEN (C1wr_gen),
.CWRCON (C1wr_con),
.CWRDATA (C1wr_data),
.CNTINST (C1cnt_inst),
.CNTIMISS (C1cnt_imiss),
.CNTISTALL (C1cnt_istall),
.CNTDMISS (C1cnt_dmiss),
.CNTDSTALL (C1cnt_dstall),
.CNTDLOAD (C1cnt_dload),
.CNTDSTORE (C1cnt_dstore),

.DBUSMUPIN (`DataC1UpIn),
.DBUSMUPOUT (`DataC1UpOut),
.DBUSMDOWNIN (`DataC1DownIn),
.DBUSMDOWNOUT (`DataC1DownOut)

);






copif_bus COPIF2

(

.SYSCLK (SYSCLK),
.TMODE ( `CFG_TMODE ),
.RESET1N (`LX_RESET_D1_C1_R_N_),
.INSTM32_S_R_N (INSTM32_S_R_N ),
.SEN (`CFG_SEN ),
.EXCEPTION (CP0_XCPN_M),
.COPNO (2'b10),
.INSTIF (InstIF),
.ISTALLIF (IstallIF),
.IMISS ({`IC_MISS_R_, `IW_MISS_R_, 1'b0}),
.DMISS ({`DC_MISS_R_, `DW_MISS_R_, 1'b0}),
.IVAL ({`IC_VAL_, `IW_VAL_, 1'b0}),
.DVAL ({`DC_VAL_, `DW_VAL_, 1'b0}),
.X_HALT_R (`HALT_OBS_COP2_),
.CONDINN (Cond_in2),
.CPCONDN (CpCond2),
.CRDADDR (C2rd_addr),
.RHOLD (C2rhold),
.CRDGEN (C2rd_gen),
.CRDCON (C2rd_con),
.CRDDATA (C2rd_data),
.CWRADDR (C2wr_addr),
.CWRGEN (C2wr_gen),
.CWRCON (C2wr_con),
.CWRDATA (C2wr_data),
.CNTINST (C2cnt_inst),
.CNTIMISS (C2cnt_imiss),
.CNTISTALL (C2cnt_istall),
.CNTDMISS (C2cnt_dmiss),
.CNTDSTALL (C2cnt_dstall),
.CNTDLOAD (C2cnt_dload),
.CNTDSTORE (C2cnt_dstore),

.DBUSMUPIN (`DataC2UpIn),
.DBUSMUPOUT (`DataC2UpOut),
.DBUSMDOWNIN (`DataC2DownIn),
.DBUSMDOWNOUT (`DataC2DownOut)


);





copif_bus COPIF3

(

.SYSCLK (SYSCLK),
.TMODE ( `CFG_TMODE ),
.RESET1N (`LX_RESET_D1_C1_R_N_),
.INSTM32_S_R_N (INSTM32_S_R_N ),
.SEN (`CFG_SEN ),
.EXCEPTION (CP0_XCPN_M),
.COPNO (2'b11),
.INSTIF (InstIF),
.ISTALLIF (IstallIF),
.IMISS ({`IC_MISS_R_, `IW_MISS_R_, 1'b0}),
.DMISS ({`DC_MISS_R_, `DW_MISS_R_, 1'b0}),
.IVAL ({`IC_VAL_, `IW_VAL_, 1'b0}),
.DVAL ({`DC_VAL_, `DW_VAL_, 1'b0}),
.X_HALT_R (`HALT_OBS_COP3_),
.CONDINN (Cond_in3),
.CPCONDN (CpCond3),
.CRDADDR (C3rd_addr),
.RHOLD (C3rhold),
.CRDGEN (C3rd_gen),
.CRDCON (C3rd_con),
.CRDDATA (C3rd_data),
.CWRADDR (C3wr_addr),
.CWRGEN (C3wr_gen),
.CWRCON (C3wr_con),
.CWRDATA (C3wr_data),
.CNTINST (C3cnt_inst),
.CNTIMISS (C3cnt_imiss),
.CNTISTALL (C3cnt_istall),
.CNTDMISS (C3cnt_dmiss),
.CNTDSTALL (C3cnt_dstall),
.CNTDLOAD (C3cnt_dload),
.CNTDSTORE (C3cnt_dstore),

.DBUSMUPIN (`DataC3UpIn),
.DBUSMUPOUT (`DataC3UpOut),
.DBUSMDOWNIN (`DataC3DownIn),
.DBUSMDOWNOUT (`DataC3DownOut)

);






lmi_icache_bus ICACHE

(
.CLK ( SYSCLK ),
.TMODE ( `CFG_TMODE ),
.RESET_D1_R_N ( `LX_RESET_D1_C1_R_N_ ),




.SEN ( `CFG_SEN ),

.DISABLEC ( CFG_ICOFF ),
.INVALIDATE ( `IInval_ ),

.MEMSEQUENTIAL ( CFG_MEMSEQUENTIAL ),
.MEMZEROFIRST ( CFG_MEMZEROFIRST ),

.EXT_ICREQRAM_R( EXT_ICREQRAM_R ),
.IC_GNTRAM_R ( IC_GNTRAM_R ),




.IX_DATAUPI ( `InstCUpIn ),
.IC_DATAUPO ( `InstCUpOut ),

.IC_LBCOE ( InstOECS ),
.NEXTADDR ( IaddrWB ),
.RDOP_N ( IstallIF ),
.LACK ( {`IW_ACK_, 1'b0} ),
.IS_VAL ( IS_VAL ),
.IC_VAL ( IC_VAL ),
.IC_MISS_P ( IC_MISS_P ),
.IC_MISS_R (`IC_MISS_R_ ),
.IC_HALT_S_R ( IC_HALT_S_R ),
.X_HALT_R ( `HALT_OBS_IC_ ),





.IC_TAGINDEX ( IC_TAGINDEX ),
.ICR_TAGRD0 ( ICR_TAGRD0 ),
.IC_TAGWR0 ( IC_TAGWR0 ),
.ICC_TAGMASK ( ICR_TAGMASK ),
.IC_TAG0WE ( IC_TAG0WE ),
.IC_TAG0WEN ( IC_TAG0WEN ),
.IC_TAG0RE ( IC_TAG0RE ),
.IC_TAG0REN ( IC_TAG0REN ),
.IC_TAG0CS ( IC_TAG0CS ),
.IC_TAG0CSN ( IC_TAG0CSN ),
.IC_DATAINDEX ( IC_INSTINDEX ),
.IC_DATA0WE ( IC_INST0WE ),
.IC_DATA0WEN ( IC_INST0WEN ),
.IC_DATA0RE ( IC_INST0RE ),
.IC_DATA0REN ( IC_INST0REN ),
.IC_DATA0CS ( IC_INST0CS ),
.IC_DATA0CSN ( IC_INST0CSN ),
.ICR_DATA0RD ( ICR_INST0RD ),
.IC_DATAWR ( IC_INSTWR )



);








lmi_iram_bus IRAM

(
.CLK ( SYSCLK),
.TMODE ( `CFG_TMODE),
.RESET_D1_R_N ( `LX_RESET_D1_C1_R_N_),



.SEN ( `CFG_SEN ),

.INVALIDATE ( `IInval_),

.MEMSEQUENTIAL ( CFG_MEMSEQUENTIAL),
.MEMZEROFIRST ( CFG_MEMZEROFIRST),

.EXT_IWREQRAM_R( EXT_IWREQRAM_R ),
.IW_GNTRAM_R ( IW_GNTRAM_R ),




.DATAUPI ( `InstWUpIn),
.IW_DATAUPO ( `InstWUpOut),

.IW_LBCOE ( InstOEWS),

.NEXTADDR ( IaddrWB),
.RDOP_N ( IstallIF),
.IS_VAL ( IS_VAL),
.IW_VAL ( IW_VAL),
.X_HALT_R ( `HALT_OBS_IW_ ),
.IW_ACK ( IW_ACK),
.IW_MISS_P ( IMissWObs),
.IW_MISS_R ( IW_MISS_R),
.IW_HALT_S_R ( IW_HALT_S_R),



.IW_VALINDEX ( IW_VALIDINDEX),
.IWR_VALRD ( IWR_VALIDRD),
.IW_VALWR ( IW_VALIDWR),
.IW_VALWE ( IW_VALIDWE),
.IW_VALWEN ( IW_VALIDWEN),
.IW_VALRE ( IW_VALIDRE),
.IW_VALREN ( IW_VALIDREN),
.IW_VALCS ( IW_VALIDCS),
.IW_VALCSN ( IW_VALIDCSN),

.IW_DATAINDEX ( IW_INSTINDEX),
.IW_DATAWE ( IW_INSTWE),
.IW_DATAWEN ( IW_INSTWEN),
.IW_DATARE ( IW_INSTRE),
.IW_DATAREN ( IW_INSTREN),
.IW_DATACS ( IW_INSTCS),
.IW_DATACSN ( IW_INSTCSN),
.IWR_DATARD ( IWR_INSTRD),
.IW_DATAWR ( IW_INSTWR),

.CFG_IRAMISROM ( CFG_IRAMISROM ),
.CONFIGBASE ( IWC_BASE ),
.CONFIGTOP ( IWC_RAMTOP )

);





lmi_dcache_bus DCACHE

(
.CLK ( SYSCLK ),
.TMODE ( `CFG_TMODE ),
.RESET_D1_R_N ( `LX_RESET_D1_C1_R_N_),




.SEN ( `CFG_SEN ),

.DISABLEC ( CFG_DCOFF ),
.INVALIDATE ( `DInval_ ),

.MEMSEQUENTIAL ( CFG_MEMSEQUENTIAL ),
.MEMZEROFIRST ( CFG_MEMZEROFIRST ),
.MEMFULLWORD ( CFG_MEMFULLWORD ),

.EXT_DCREQRAM_R( EXT_DCREQRAM_R ),
.DC_GNTRAM_R ( DC_GNTRAM_R ),



.DATADOWNI ( `DataCDownIn ),
.DC_DATADOWNO ( `DataCDownOut ),
.DATAUPI ( `DataCUpIn ),
.DC_DATAUPO ( `DataCUpOut ),


.DC_LBCOE ( DataOECS ),

.NEXTADDR ( DaddrEX ),
.NEXTRDOP ( DreadEX ),
.NEXTWROP ( DwriteEX ),
.NEXTBE ( DbyenEX ),
.NEXTSX ( DsignEX ),
.DWORD_E ( DWORD_E ),
.EXCP ( CP0_XCPN_M ),

.LACK ( {`DW_ACK_, 1'b0}),
.DS_VAL ( DS_VAL ),
.DC_VAL ( DC_VAL ),
.DC_MISS_P ( DC_MISS_P ),
.DC_MISS_R ( `DC_MISS_R_ ),
.DC_BAREMISS_R ( DBareMissC ),
.DC_HALT_W_R ( DC_HALT_W_R ),
.DC_HALT_M_R ( DC_HALT_M_R ),
.X_HALT_R ( `HALT_OBS_DC_ ),
.DC_RPALGNIFNBNA ( DC_RPAlgnIfNBNA ),
.DC_RPALGNIFB ( DC_RPAlgnIfB ),
.DC_RPQUIETIFNBA ( DC_RPQuietIfNBA ),
.DC_RPQUIETIFB ( DC_RPQuietIfB ),




.DC_TAGINDEX ( DC_TAGINDEX ),
.DCR_TAGRD ( DCR_TAGRD ),
.DC_TAGWR ( DC_TAGWR ),
.DC_TAGWE ( DC_TAGWE ),
.DC_TAGWEN ( DC_TAGWEN ),
.DC_TAGRE ( DC_TAGRE ),
.DC_TAGREN ( DC_TAGREN ),
.DC_TAGCS ( DC_TAGCS ),
.DC_TAGCSN ( DC_TAGCSN ),
.DCC_TAGMASK ( DCC_TAGMASK ),
.DC_DATAINDEX ( DC_DATAINDEX ),
.DCR_DATARD ( DCR_DATARD ),
.DC_DATAWR ( DC_DATAWR ),
.DC_DATAWE ( DC_DATAWE ),
.DC_DATAWEN ( DC_DATAWEN ),
.DC_DATARE ( DC_DATARE ),
.DC_DATAREN ( DC_DATAREN ),
.DC_DATACS ( DC_DATACS ),
.DC_DATACSN ( DC_DATACSN ),


.DC_CSTWBUS ( DCSTWBUS )

);








lmi_dram_bus DRAM

(
.CLK ( SYSCLK ),
.TMODE ( `CFG_TMODE ),
.RESET_D1_R_N ( `LX_RESET_D1_C1_R_N_),




.SEN ( `CFG_SEN ),

.DISABLEC ( 1'b0 ),
.CFG_DWDISW ( CFG_DWDISW ),

.EXT_DWREQRAM_R ( EXT_DWREQRAM_R ),
.DW_GNTRAM_R ( DW_GNTRAM_R ),




.DATADOWNI ( `DataWDownIn ),
.DW_DATADOWNO ( `DataWDownOut ),
.DATAUPI ( `DataWUpIn ),
.DW_DATAUPO ( `DataWUpOut ),

.NEXTADDR ( DaddrEX ),
.NEXTRDOP ( DreadEX ),
.NEXTWROP ( DwriteEX ),
.NEXTBE ( DbyenEX ),
.NEXTSX ( DsignEX ),
.EXCP ( CP0_XCPN_M ),

.DW_ACK ( DW_ACK ),
.DW_HALT_W_R ( DW_HALT_W_R ),
.DW_VAL ( DW_VAL ),

.X_HALT_R ( `HALT_OBS_DW_ ),
.DC_RPALGNIFNBNA( DC_RPAlgnIfNBNA ),
.DC_RPALGNIFB ( DC_RPAlgnIfB ),
.DC_RPQUIETIFNBA( DC_RPQuietIfNBA ),
.DC_RPQUIETIFB ( DC_RPQuietIfB ),



.DW_DATAINDEX ( DW_DATAINDEX ),
.DWR_DATARD ( DWR_DATARD ),
.DW_DATAWR ( DW_DATAWR ),
.DW_DATAWE ( DW_DATAWE ),
.DW_DATAWEN ( DW_DATAWEN ),
.DW_DATARE ( DW_DATARE ),
.DW_DATAREN ( DW_DATAREN ),
.DW_DATACS ( DW_DATACS ),
.DW_DATACSN ( DW_DATACSN ),

.CONFIGBASE ( DWC_BASE ),
.CONFIGTOP ( DWC_TOP )

);




lmi_lbc PBI(

.SEN (`CFG_SEN),


.TMODE (`CFG_TMODE),
.RESET_D1_R_N (`LX_RESET_D1_C1_R_N_),
.CFG_MEMFULLWORD (CFG_MEMFULLWORD),
.CFG_DCOFF (CFG_DCOFF),
.CFG_ICOFF (CFG_ICOFF),
.CFG_MEMZEROFIRST (CFG_MEMZEROFIRST),
.CFG_LINEADDRFILTER (CFG_LINEADDRFILTER),


.DNXTADDRI (DaddrEX),


.DDATAI (`DataSDownIn),
.DDATAO (`DataSUpOut),



.IDATAO (`InstSUpOut),



.INXTADDRI ({IaddrWB[31:2], 2'b00}),

.IDCLOCKI (SYSCLK),


.DVALO (DS_VAL),
.DOECI (DataOECS),


.IVALO (IS_VAL),
.IOECI (InstOECS),
.IOEWI (`InstOEWS),


.X_HALT_R (`HALT_OBS_LBC_),

.LMI_DreadEX (DreadEX),
.LMI_DwriteEX (DwriteEX),
.LMI_DBE (DbyenEX),
.LMI_DSX (DsignEX),
.LMI_DAckR (1'b0),
.LMI_DAckW (`DW_ACK_),
.LMI_DMissQC (DBareMissC),
.LMI_DCSTWBUS (DCSTWBUS),
.LMI_IstallIF (IstallIF),
.LMI_IMissQC (IC_MISS_R),
.LMI_IMissQW (`IW_MISS_R_),
.LMI_Exception (CP0_XCPN_M),

.SYS_WBEMPTY_W_R (SYS_WBEMPTY_W_R),

.CBUS_SWBEMPTY (CBUS_SWBEMPTY),
.CBUS_SIVAL (CBUS_SIVAL),
.CBUS_SDVAL (CBUS_SDVAL),
.CBUS_SIDATA (CBUS_SIDATA),
.CBUS_SDDATA (CBUS_SDDATA),

.CBUS_DREQ (CBUS_DREQ),
.CBUS_DADDR (CBUS_DADDR),
.CBUS_DUC (CBUS_DUC),
.CBUS_DRW (CBUS_DRW),
.CBUS_DDM (CBUS_DDM),
.CBUS_DLINE (CBUS_DLINE),
.CBUS_DSZ (CBUS_DSZ),
.CBUS_DBE (CBUS_DBE),
.CBUS_DO (CBUS_DO),
.CBUS_DADDR_E1 (CBUS_DADDR_E1),

.CBUS_IREQ (CBUS_IREQ),
.CBUS_IADDR (CBUS_IADDR),
.CBUS_IUC (CBUS_IUC),
.CBUS_IDM (CBUS_IDM),

.PBI_EJHOLD (PBI_EJHOLD),
.PBI_EJJPTHOLD (PBI_EJJPTHOLD),
.CP0_IEJORDM_I (CP0_IEJORDM_I),
.CP0_JCTRLDM_M_R (CP0_JCTRLDM_M_R),

.DDISI (1'b0),
.IDISI (1'b0));






lmi_watch LMI_WATCH
(
.CLK ( SYSCLK ),
.TMODE ( `CFG_TMODE ),
.SEN ( `CFG_SEN ),
.RESET_D1_R_N ( `LX_RESET_D1_C1_R_N_),


.DATAUPI ( `DataSUpOut ),
.DATADOWNI ( `DataSDownIn ),


.X_HALT_R ( `HALT_OBS_LMIE_),

.C_IADDR_A ( IaddrWB ),
.C_IREAD_I_N ( IstallIF ),
.IX_VAL ( {`IC_VAL_, `IW_VAL_}),
.IX_MISS_S_R ( {`IC_MISS_R_, `IW_MISS_R_}),

.C_DADDR_E ( DaddrEX ),
.C_DREAD_E ( DreadEX ),
.C_DWRITE_E ( DwriteEX ),
.C_DBYEN_E ( DbyenEX ),
.DC_VAL ( `DC_VAL_ ),
.CP0_XCPN_M ( CP0_XCPN_M ),
.DC_MISS_W_R ( `DC_MISS_R_ ),

.LW_ISAMPLE_S ( LW_ISAMPLE_S ),
.LW_IADDR_S_R ( LW_IADDR_S_R ),

.LW_DSAMPLE_W ( LW_DSAMPLE_W ),
.LW_DWRITE_W_R ( LW_DWRITE_W_R ),
.LW_DBYEN_W_R ( LW_DBYEN_W_R ),
.LW_DADDR_W_R ( LW_DADDR_W_R ),
.LW_DATA_W_R ( LW_DATA_W_R )
);




ce_hlw ce_hlw

(


.CE_RES_E (CE0_RES_E ),
.CE_SEL_E_R (CE0_SEL_E_R),
.CE_HALT_E_R_C (HL_HALT_E_R),

.CLK (SYSCLK),
.TMODE (`CFG_TMODE),
.SEN (`CFG_SEN),
.RESET_D1_R_N (`LX_RESET_D1_C1_R_N_),
.CFG_CEENBL (CFG_HLENABLE),
.CEI_CEHOLD (HLREGHOLD),
.CEI_XCPN_M (CP0_XCPN_M),
.CEI_OP_S_R (RALU_CE0OP_S_R),
.CEI_INSTM32_S_R_N (RALU_INSTM32_S_R_N),
.CEI_AOP_E_R (CEI_CEHLW_AOP_E_R),
.MAC_RES_E (MAC_RES_E ),
.MAC_SEL_E_R (MAC_SEL_E_R)
);


reset_dist reset_dist
(


.SYSCLKF ( SYSCLKF ),

.SL_SLEEPSYS_C0_R ( SL_SLEEPSYS_C0_R ),
.SL_SLEEPSYS_C1_R ( SL_SLEEPSYS_C1_R ),
.SL_SLEEPSYS_C2_R ( SL_SLEEPSYS_C2_R ),
.SL_SLEEPSYS_C3_R ( SL_SLEEPSYS_C3_R ),




.BUSCLKF ( BUSCLKF ),

.SL_SLEEPBUS_C0_BR ( SL_SLEEPBUS_C0_BR ),
.SL_SLEEPBUS_C1_BR ( SL_SLEEPBUS_C1_BR ),
.SL_SLEEPBUS_C2_BR ( SL_SLEEPBUS_C2_BR ),
.SL_SLEEPBUS_C3_BR ( SL_SLEEPBUS_C3_BR ),



.JTAG_RST_N ( JTAG_RST_N ),

.RESET_N ( RESET_N ),
.RESET_PWRON_N ( RESET_PWRON_N ),
.EJC_ECRPRRST_R ( EJC_ECRPRRST_R ),
.RESET_D1_R_N ( RESET_D1_R_N ),
.RESET_D1_BR_N ( RESET_D1_BR_N ),

.RESET_D1_C1_R_N ( RESET_D1_C1_R_N ),
.RESET_D1_C1_BR_N ( RESET_D1_C1_BR_N ),
.RESET_PWRON_C1_N ( RESET_PWRON_C1_N ),
.RESET_PWRON_D1_LR_N ( RESET_PWRON_D1_LR_N ),



.CFG_SLEEPENABLE ( CFG_SLEEPENABLE ),
.X_HALT_R ( `HALT_OBS_SL_ ),
.CP0_SLEEP_M_R ( CP0_SLEEP_M_R ),
.SYS_WBEMPTY_W_R ( SYS_WBEMPTY_W_R ),
.EJC_DINT_R ( EJC_DINT_R ),
.INTREQ_N ( IntreqN ),
.CP0_IM_W_R ( CP0_IM_W_R ),
.EXT_SLEEPREQ_R ( EXT_SLEEPREQ_R ),
.SL_HALT_W_R ( SL_HALT_W_R ),





.SEN_N (1'b1 ),
.TMODE_N (1'b1 )


);






endmodule





