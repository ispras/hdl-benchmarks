`include "lxr_symbols.vh"
`include "mux32.v"
`include "copif.v"

module copif_bus

















(SYSCLK, TMODE, RESET1N, INSTM32_S_R_N,
SEN,
EXCEPTION,
COPNO,
X_HALT_R,
INSTIF, ISTALLIF,
IMISS, DMISS, IVAL, DVAL,
CONDINN, CPCONDN,
CRDADDR, RHOLD, CRDGEN, CRDCON, CRDDATA,
CWRADDR, CWRGEN, CWRCON, CWRDATA,
CNTINST, CNTIMISS, CNTISTALL,
CNTDMISS, CNTDSTALL, CNTDLOAD, CNTDSTORE,

DBUSMUPIN, DBUSMUPOUT, DBUSMDOWNIN, DBUSMDOWNOUT

);


input SYSCLK;
input TMODE;
input RESET1N;
input INSTM32_S_R_N;

input SEN;

input EXCEPTION;

input [1:0] COPNO;

input [31:0] INSTIF;
input ISTALLIF;
input [`HALT_SIG_RANGE] X_HALT_R;

input CONDINN;
output CPCONDN;

output [4:0] CRDADDR;
output CRDGEN;
output CRDCON;
input [31:0] CRDDATA;

output [4:0] CWRADDR;
output CWRGEN;
output CWRCON;
output [31:0] CWRDATA;


input [31:0] DBUSMUPIN;
output [31:0] DBUSMUPOUT;
input [31:0] DBUSMDOWNIN;
output [31:0] DBUSMDOWNOUT;


input [2:0] IMISS;
input [2:0] DMISS;
input [2:0] IVAL;
input [2:0] DVAL;

output RHOLD;
output CNTINST;
output CNTIMISS;
output CNTISTALL;
output CNTDMISS;
output CNTDSTALL;
output CNTDLOAD;
output CNTDSTORE;

wire CdriverM;
wire [31:0] CrdDataM;





wire CmemOpM;


wire [31:0] DbusCopIn;

copif COPIFX
(
.SYSCLK ( SYSCLK ),
.TMODE ( TMODE ),
.SEN ( SEN ),
.RESET1N ( RESET1N ),
.INSTM32_S_R_N (INSTM32_S_R_N ),
.EXCEPTION ( EXCEPTION ),
.X_HALT_R ( X_HALT_R ),
.COPNO ( COPNO ),
.INSTIF ( INSTIF ),
.ISTALLIF ( ISTALLIF ),
.IMISS ( IMISS ),
.DMISS ( DMISS ),
.IVAL ( IVAL ),
.DVAL ( DVAL ),
.CMEMOPM ( CmemOpM ),
.CONDINN ( CONDINN ),
.CPCONDN ( CPCONDN ),
.CRDADDR ( CRDADDR ),
.RHOLD ( RHOLD ),
.CRDGEN ( CRDGEN ),
.CRDCON ( CRDCON ),
.CRDDATA ( CRDDATA ),
.CWRADDR ( CWRADDR ),
.CWRGEN ( CWRGEN ),
.CWRCON ( CWRCON ),
.CWRDATA ( CWRDATA ),
.CNTINST ( CNTINST ),
.CNTIMISS ( CNTIMISS ),
.CNTISTALL ( CNTISTALL ),
.CNTDMISS ( CNTDMISS ),
.CNTDSTALL ( CNTDSTALL ),
.CNTDLOAD ( CNTDLOAD ),
.CNTDSTORE ( CNTDSTORE ),
.DBUSM ( DbusCopIn),
.CDRIVERM ( CdriverM ),
.CRDDATAM ( CrdDataM )
);






assign DbusCopIn = (CmemOpM | X_HALT_R[`DC_HALT_M_INDEX] | X_HALT_R[`DC_HALT_W_INDEX] | X_HALT_R[`DW_HALT_W_INDEX]) ? DBUSMUPIN : DBUSMDOWNIN;

mux32 MUX_COPUP
(
.OUT (DBUSMUPOUT),
.THRU (DBUSMUPIN),
.IN (CrdDataM),
.EN1 (CdriverM),
.DIS1 (X_HALT_R[`DC_HALT_M_INDEX] | X_HALT_R[`DC_HALT_W_INDEX] | X_HALT_R[`DW_HALT_W_INDEX]),
.DIS2 (SEN)
);

mux32 MUX_COPDOWN
(
.OUT (DBUSMDOWNOUT),
.THRU (DBUSMDOWNIN),
.IN (CrdDataM),
.EN1 (CdriverM),
.DIS1 (X_HALT_R[`DC_HALT_M_INDEX] | X_HALT_R[`DC_HALT_W_INDEX] | X_HALT_R[`DW_HALT_W_INDEX]),
.DIS2 (SEN)
);



endmodule



