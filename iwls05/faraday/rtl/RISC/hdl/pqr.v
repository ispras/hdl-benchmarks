`include "opq.v"
`include "hijklm.v"
`include "klmnop.v"
`include "jklmno.v"
`include"dmux.v"
`include"dalu.v"
`include"daddr.v"

module ralu






/**************************************************************************/
/**************************************************************************/




/**************************************************************************/
/**************************************************************************/



















/**************************************************************************/
/**************************************************************************/


(SYSCLK, RESET1_N,
CP0_INSTM32_I_R_C1_N,
CP0_M16IADDRB1_I,
CP0_XCPN_M_C1,
INST_I,
RALU_DREAD_E_R, RALU_DSIGN_E_R, RALU_DWRITE_E_R,
RALU_DADDR_E, RALU_DREAD_E_R_C, RALU_DWRITE_E_R_C, RALU_DADALERR_E,
RALU_DBYEN_E, RALU_DWORD_E,
`ifdef VPP_DATA_TRI
DBUS_M,
`else
DBUSMUPIN, CP0_CDBUS_M_R, CP0_CDBUSOE_R, CLMI_DBUSDIS,
`endif
RALU_ADATAREG_M_R, RALU_RDBDRIVER_R,
RALU_V_E, RALU_Z_E,
RALU_JRA_E_R,
RALU_CE1OP_S_R,
RALU_CE0OP_S_R,
RALU_INSTM32_S_R_N,
CE0_SEL_E_R, CE1_SEL_E_R,
RALU_CINA_E_R, RALU_CINBI_E_R,
CE0_RES_E, CE1_RES_E,
CP0_LINK_E_R, CLMI_RHOLD, RLSHOLD,
CP0_PCREL_S,
CLMI_SELINST_S_P, DLOAD,
RALU_HALT_E_R,

TMODE, SEN
);

`include "lxr_symbols.vh"
`include "core_symbols.vh"


input SYSCLK;
input RESET1_N;
input CP0_INSTM32_I_R_C1_N;
input CP0_M16IADDRB1_I;
input CP0_XCPN_M_C1;

input [31:0] INST_I;
input [31:0] CE0_RES_E;
input [31:0] CE1_RES_E;
input CE0_SEL_E_R;
input CE1_SEL_E_R;
input [31:0] CP0_LINK_E_R;
input [31:0] CP0_PCREL_S;

`ifdef VPP_DATA_TRI
input [31:0] DBUS_M;
`else
input [31:0] DBUSMUPIN;
input [31:0] CP0_CDBUS_M_R;
input CP0_CDBUSOE_R;
input CLMI_DBUSDIS;
`endif

input [`CLMI_SEL_INST_HI:0] CLMI_SELINST_S_P;

input CLMI_RHOLD;
input RLSHOLD;
input DLOAD;

output [31:0] RALU_DADDR_E;

output RALU_DREAD_E_R_C;
output RALU_DWRITE_E_R_C;

output RALU_DREAD_E_R;
output RALU_DSIGN_E_R;
output RALU_DWRITE_E_R;

output [3:0] RALU_DBYEN_E;
output RALU_DWORD_E;
output RALU_DADALERR_E;

output RALU_V_E;
output RALU_Z_E;

output [31:0] RALU_JRA_E_R;

output [31:0] RALU_CINA_E_R;
output [31:0] RALU_CINBI_E_R;

output [31:0] RALU_ADATAREG_M_R;
output RALU_RDBDRIVER_R;

output [11:0] RALU_CE1OP_S_R;
output [11:0] RALU_CE0OP_S_R;
output RALU_INSTM32_S_R_N;

output [`HALT_DRV_RANGE] RALU_HALT_E_R;

`ifdef VPP_PRODUCT_SMOOTHCORE
/* REGFILE FALSE PATH: */


`endif

input TMODE;
input SEN;


/* wires between instanciated modules */

wire [31:0] INST_S_R;
wire [16:0] IMMED_S;
wire [`RALU_WSELA] SELA_S;
wire [`RALU_WSELBR] SELBR_S;
wire [`RALU_WSELBI] SELBI_S;

wire [`RALU_WALUOP:0] ALUOP_E_P;
wire [`RALU_WWIDTH:0] WIDTH_E_P;

wire [`RALU_WSELC] SELC_M;


wire [4:0] REGCADDR_M_R;
wire REGCWRITE_M_R;
wire [31:0] REGA_S;
wire [31:0] REGB_S;
wire [31:0] REGC_W_R;

wire [`RALU_READA_RANGE] READA_S;
wire [`RALU_READA_RANGE] READB_S;
wire [`RALU_WRITEC_RANGE] WRITEC_W_R;



wire [31:0] REGA_E_R;
wire [31:0] REGBI_E_R;
wire [31:0] REGBR_E_R;
wire [31:0] ALURES_E;



wire [4:0] REGAADDR_S;
wire [4:0] REGBADDR_S;


assign RALU_JRA_E_R = REGA_E_R;




`ifdef VPP_DATA_MUX

wire [31:0] DBUS_M;

assign DBUS_M = (CP0_CDBUSOE_R & ~CLMI_DBUSDIS) ? CP0_CDBUS_M_R : DBUSMUPIN;

`endif








dmux DMUX1
(




.SYSCLK (SYSCLK),
.TMODE (TMODE),
.SEN (SEN),
.RESET_D1_R_N (RESET1_N),
.CLMI_RHOLD (CLMI_RHOLD),
.REGA_S (REGA_S),
.REGB_S (REGB_S),
.IMMED_S (IMMED_S),
.SELA_S (SELA_S),
.SELBR_S (SELBR_S),
.SELBI_S (SELBI_S),
.ALURES_E (ALURES_E),
.SELC_M (SELC_M),
.RDBUSINM (DBUS_M),
.REGC_W_R (REGC_W_R),
.REGA_E_R (REGA_E_R),
.REGBI_E_R (REGBI_E_R),
.REGBR_E_R (REGBR_E_R),
.CP0_PCREL_S (CP0_PCREL_S),
.CINA_E_R (RALU_CINA_E_R),
.CINBI_E_R (RALU_CINBI_E_R),
.Z_E (RALU_Z_E)

);


dalu DALU1
(


.SYSCLK (SYSCLK),
.TMODE (TMODE),
.RESET_D1_R_N (RESET1_N),
.CLMI_RHOLD (CLMI_RHOLD),
.REGA_E_R (REGA_E_R),
.REGBI_E_R (REGBI_E_R),
.ALUOP_E_P (ALUOP_E_P),
.CP0_LINK_E_R (CP0_LINK_E_R),
.CE0_RES_E (CE0_RES_E),
.CE1_RES_E (CE1_RES_E),
.CE0_SEL_E_R (CE0_SEL_E_R),
.CE1_SEL_E_R (CE1_SEL_E_R),
.ALURES_E (ALURES_E),
.V_E (RALU_V_E)
);


daddr DADDR1
(


.SYSCLK (SYSCLK),
.TMODE (TMODE),
.RESET_D1_R_N (RESET1_N),
.CLMI_RHOLD (CLMI_RHOLD),
.REGA_E_R (REGA_E_R),
.REGBI_E_R (REGBI_E_R),
.REGBR_E_R (REGBR_E_R),
.WIDTH_E_P (WIDTH_E_P),
.DBYEN_E (RALU_DBYEN_E),
.DADALERR_E (RALU_DADALERR_E),
.DADDR_E (RALU_DADDR_E),
.DWORD_E (RALU_DWORD_E),
.ADATAREG_M_R (RALU_ADATAREG_M_R)
);


dcont DCONT1
(


.SYSCLK (SYSCLK),
.RESET_D1_R_N (RESET1_N),
.CP0_INSTM32_I_R_C1_N (CP0_INSTM32_I_R_C1_N),
.CP0_XCPN_M_C1 (CP0_XCPN_M_C1),
.INST_S_R (INST_S_R),
.CLMI_RHOLD (CLMI_RHOLD),
.RLShold (RLSHOLD),
.DLOAD (DLOAD),
.IMMED_S (IMMED_S),
.SELA_S (SELA_S),
.SELBR_S (SELBR_S),
.SELBI_S (SELBI_S),
.ALUOP_E_P (ALUOP_E_P),
.WIDTH_E_P (WIDTH_E_P),
.DREAD_E_R_C (RALU_DREAD_E_R_C),
.DWRITE_E_R_C (RALU_DWRITE_E_R_C),
.DREAD_E_R (RALU_DREAD_E_R),
.DWRITE_E_R (RALU_DWRITE_E_R),
.DSIGN_E_R (RALU_DSIGN_E_R),
.RDBDRIVER_R (RALU_RDBDRIVER_R),
.SELC_M (SELC_M),
.REGCADDR_M_R (REGCADDR_M_R),
.REGCWRITE_M_R (REGCWRITE_M_R),
.REGAADDR_S (REGAADDR_S),
.REGBADDR_S (REGBADDR_S),
.RALU_HALT_E_R (RALU_HALT_E_R),
.TMODE (TMODE)
);


pcont_ralu PCONT1
(


.SYSCLK (SYSCLK),
.TMODE (TMODE),
.RESET_D1_R_N (RESET1_N),
.INST_I (INST_I),
.CP0_INSTM32_I_R_C1_N (CP0_INSTM32_I_R_C1_N),
.CP0_M16IADDRB1_I (CP0_M16IADDRB1_I),
.CLMI_RHOLD (CLMI_RHOLD),
.INST_S_R (INST_S_R),
.CLMI_SELINST_S_P (CLMI_SELINST_S_P),
.CEI_CE1OP_S_R (RALU_CE1OP_S_R),
.CEI_CE0OP_S_R (RALU_CE0OP_S_R),
.CEI_INSTM32_S_R_N (RALU_INSTM32_S_R_N)
);


`REGFILE_MODULE REGFILE1
(


.SYSCLK (SYSCLK),
.TMODE (TMODE),
.SEN (SEN),
.RESET_D1_R_N (RESET1_N),
.READA_S (READA_S),
.READB_S (READB_S),
.WRITEC_W_R (WRITEC_W_R),
.REGC_W_R (REGC_W_R),
.REGA_S (REGA_S),
.REGB_S (REGB_S)

);


`RF_IF_MODULE RF_IF1
(

.SYSCLK (SYSCLK),
.TMODE (TMODE),
.RESET_D1_R_N (RESET1_N),
.CLMI_RHOLD (RLSHOLD),
.CP0_XCPN_M_C1 (CP0_XCPN_M_C1),
.REGAADDR_S (REGAADDR_S),
.REGBADDR_S (REGBADDR_S),
.REGCADDR_M_R (REGCADDR_M_R),
.REGCWRITE_M_R (REGCWRITE_M_R),
.READA_S (READA_S),
.READB_S (READB_S),
.WRITEC_W_R (WRITEC_W_R)
);


endmodule







