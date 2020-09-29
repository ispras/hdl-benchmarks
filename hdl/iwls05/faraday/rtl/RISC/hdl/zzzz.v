



















































































`include "lxr_symbols.vh"

module tsyncram_512x32(CLK, CLKN, ADDR, WEN, WE, REN, RE, CSB, DATA_IN, DATA_OUT);

input CLK, CLKN, ADDR, WEN, WE, REN, RE, CSB, DATA_IN;
output DATA_OUT;

endmodule // tsyncram_512x32

module tsyncram_128x22(CLK, CLKN, ADDR, WEN, WE, REN, RE, CSB, DATA_IN, DATA_OUT);

input CLK, CLKN, ADDR, WEN, WE, REN, RE, CSB, DATA_IN;
output DATA_OUT;

endmodule // tsyncram_128x22

module tsyncram_4x32(CLK, CLKN, ADDR, WEN, WE, REN, RE, CSB, DATA_IN, DATA_OUT);

input CLK, CLKN, ADDR, WEN, WE, REN, RE, CSB, DATA_IN;
output DATA_OUT;

endmodule // tsyncram_4x32

module frisc
























































































































































































































































































































































































































































































































































(
ResetN, CResetN,


SYSCLK,



SYSCLKF, SL_SLEEPSYS_R,



BUSCLK,



BUSCLKF, SL_SLEEPBUS_BR,


RESET_D1_R_N,




JTAG_TDO_NR,
JTAG_TDI,
JTAG_TMS,
JTAG_CLOCK,
JTAG_TRST_N,
JTAG_RST_N,




CFG_EJDIS,



CFG_DWDISW,



JPT_PCST_DR,
JPT_TPC_DR,
EJT_DCLK,



LAddrO, LDataO, LDataI, LIrdy, LFrame, LSel, LTrdy, LCmd, LUc, LId, LReq,
LFrameI, LIrdyI, LCoe, LToe, LXoe, LDoe, LGnt, LAbort,







EXT_IWREQRAM_R, IW_GNTRAM_R,



EXT_DWREQRAM_R, DW_GNTRAM_R,



EXT_ICREQRAM_R, IC_GNTRAM_R,



EXT_DCREQRAM_R, DC_GNTRAM_R,






CFG_DWBASE, CFG_DWTOP,


CFG_IWBASE, CFG_IWTOP,






Cond_in1,
C1rd_addr, C1rhold, C1rd_gen, C1rd_con, C1rd_data,
C1wr_addr, C1wr_gen, C1wr_con, C1wr_data,





Cond_in2,
C2rd_addr, C2rhold, C2rd_gen, C2rd_con, C2rd_data,
C2wr_addr, C2wr_gen, C2wr_con, C2wr_data,





Cond_in3,
C3rd_addr, C3rhold, C3rd_gen, C3rd_con, C3rd_data,
C3wr_addr, C3wr_gen, C3wr_con, C3wr_data,
C3cnt_inst, C3cnt_imiss, C3cnt_istall, C3cnt_dmiss, C3cnt_dstall, C3cnt_dload, C3cnt_dstore,





CEI_CE1HOLD,
CEI_XCPN_M_C1,
CEI_CE1OP_S_R,
CEI_INSTM32_S_R_N,
CEI_CE1AOP_E_R,
CEI_CE1BOP_E_R,
CE1_RES_E,
CE1_SEL_E_R,
CE1_HALT_E_R,



EXT_SLEEPREQ_R,



CFG_SLEEPENABLE,



CFG_MEMSEQUENTIAL,



CFG_MEMZEROFIRST,



CFG_MEMFULLWORD,







CFG_LBCSYNCMODE,



CFG_LBCWBDISABLE,



CFG_EJTNMINUS1,



CFG_EJTMLOG2,



CFG_EJTBIT0M16,




IntreqN
);







input SYSCLK;



input SYSCLKF;
output SL_SLEEPSYS_R;





input BUSCLK;



input BUSCLKF;
output SL_SLEEPBUS_BR;


input ResetN;
input CResetN;

output RESET_D1_R_N;









input [5:0] IntreqN;


output JTAG_TDO_NR;

input JTAG_TDI;
input JTAG_TMS;
input JTAG_CLOCK;
input JTAG_TRST_N;
input JTAG_RST_N;




output [11:0] JPT_PCST_DR;
output [8:2] JPT_TPC_DR;
output EJT_DCLK;



input CFG_EJDIS;



input CFG_DWDISW;



output [31:0] LAddrO;
output [31:0] LDataO;
input [31:0] LDataI;
output LIrdy;
input LIrdyI;
output LFrame;
input LFrameI;
input LSel;
input LAbort;
input LTrdy;
output [6:0] LCmd;
output LId;
output LUc;
output [`LBC_COE-1:0] LCoe;
output [`LBC_TOE-1:0] LToe;
output [`LBC_XOE-1:0] LXoe;
output [`LBC_DOE-1:0] LDoe;
output LReq;
input LGnt;







input EXT_IWREQRAM_R;
output IW_GNTRAM_R;



input EXT_DWREQRAM_R;
output DW_GNTRAM_R;



input EXT_ICREQRAM_R;
output IC_GNTRAM_R;



input EXT_DCREQRAM_R;
output DC_GNTRAM_R;






input [`LM_BASE_RANGE] CFG_DWBASE ;
input [`LM_TOP_RANGE ] CFG_DWTOP ;



input [`LM_BASE_RANGE] CFG_IWBASE ;
input [`LM_TOP_RANGE ] CFG_IWTOP ;





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



output CEI_CE1HOLD;
output CEI_XCPN_M_C1;
output [11:0] CEI_CE1OP_S_R;
output CEI_INSTM32_S_R_N;
output [31:0] CEI_CE1AOP_E_R;
output [31:0] CEI_CE1BOP_E_R;
input [31:0] CE1_RES_E;
input CE1_SEL_E_R;
input [`HALT_DRV_RANGE] CE1_HALT_E_R;



input EXT_SLEEPREQ_R;



input CFG_SLEEPENABLE;







input CFG_MEMSEQUENTIAL;



input CFG_MEMZEROFIRST;



input CFG_MEMFULLWORD;



input CFG_LBCSYNCMODE;



input CFG_LBCWBDISABLE;



input [1:0] CFG_EJTNMINUS1;



input [1:0] CFG_EJTMLOG2;



input CFG_EJTBIT0M16;











wire RESET_D1_R_N;





wire [`IC_ADDR_HI:`LINE_ADDR_HI+1] IC_TAGINDEX;

wire [32:`IC_ADDR_HI+1-`IC_TAG_EXTRA_USED] ICR_TAGRD0;
wire [32:`IC_ADDR_HI+1-`IC_TAG_EXTRA_USED] IC_TAGWR0;



wire [`IC_TAG_EXTRA_SIZE-`IC_TAG_EXTRA_USED-1:0] IC_TAGWR0UNUSED;
wire [`IC_TAG_EXTRA_SIZE-`IC_TAG_EXTRA_USED-1:0] IC_TAGWR1UNUSED;



wire IC_TAG0WEN;
wire IC_TAG0WE;
wire IC_TAG0REN;
wire IC_TAG0RE;
wire IC_TAG0CSN;
wire IC_TAG0CS;

wire [`IC_ADDR_HI:2] IC_INSTINDEX;

wire [31:0] IC_INSTWR;

wire [31:0] ICR_INST0RD;
wire IC_INST0WEN;
wire IC_INST0WE;
wire IC_INST0REN;
wire IC_INST0RE;
wire IC_INST0CSN;
wire IC_INST0CS;
wire IC_GNTRAM_R;








wire [`IW_ADDR_HI:9] IW_VALIDINDEX;

wire [31:0] IWR_VALIDRD;
wire [31:0] IW_VALIDWR;
wire IW_VALIDWEN;
wire IW_VALIDWE;
wire IW_VALIDREN;
wire IW_VALIDRE;
wire IW_VALIDCSN;
wire IW_VALIDCS;


wire [`IW_ADDR_HI:2] IW_INSTINDEX;

wire [31:0] IWR_INSTRD;
wire [31:0] IW_INSTWR;
wire IW_INSTWEN;
wire IW_INSTWE;
wire IW_INSTREN;
wire IW_INSTRE;
wire IW_INSTCSN;
wire IW_INSTCS;
wire IW_GNTRAM_R;


wire DC_GNTRAM_R;



wire [`DC_ADDR_HI:`LINE_ADDR_HI+1] DC_TAGINDEX;

wire [32:`DC_ADDR_HI+1-`DC_TAG_EXTRA_USED] DC_TAGWR;



wire [`DC_TAG_EXTRA_SIZE-`DC_TAG_EXTRA_USED-1:0] DC_TAGWRUNUSED;



wire DC_TAGWEN;
wire DC_TAGWE;
wire DC_TAGREN;
wire DC_TAGRE;
wire DC_TAGCSN;
wire DC_TAGCS;


wire [`DC_ADDR_HI:2] DC_DATAINDEX;

wire [31:0] DC_DATAWR;
wire DC_DATAWEN;
wire DC_DATAWE;
wire DC_DATAREN;
wire DC_DATARE;
wire DC_DATACSN;
wire DC_DATACS;



wire [32:`DC_ADDR_HI+1-`DC_TAG_EXTRA_USED] DCR_TAGRD;
wire [31:0] DCR_DATARD;









wire [`DW_ADDR_HI:2] DW_DATAINDEX;

wire [31:0] DWR_DATARD;
wire [31:0] DW_DATAWR;
wire DW_DATAWEN;
wire DW_DATAWE;
wire DW_DATAREN;
wire DW_DATARE;
wire DW_DATACSN;
wire DW_DATACS;
wire DW_GNTRAM_R;






























wire Cond_in1;
wire [31:0] C1rd_data;

wire [4:0] C1rd_addr;
wire C1rhold;
wire C1rd_gen;
wire C1rd_con;
wire [4:0] C1wr_addr;
wire C1wr_gen;
wire C1wr_con;
wire [31:0] C1wr_data;




wire Cond_in2;
wire [31:0] C2rd_data;

wire [4:0] C2rd_addr;
wire C2rhold;
wire C2rd_gen;
wire C2rd_con;
wire [4:0] C2wr_addr;
wire C2wr_gen;
wire C2wr_con;
wire [31:0] C2wr_data;




wire Cond_in3;
wire [31:0] C3rd_data;

wire C3rhold;
wire [4:0] C3rd_addr;
wire C3rd_gen;
wire C3rd_con;
wire [4:0] C3wr_addr;
wire C3wr_gen;
wire C3wr_con;
wire [31:0] C3wr_data;
wire C3cnt_inst;
wire C3cnt_imiss;
wire C3cnt_istall;
wire C3cnt_dmiss;
wire C3cnt_dstall;
wire C3cnt_dload;
wire C3cnt_dstore;



wire SL_SLEEPSYS_C2_R;
wire SL_SLEEPBUS_C2_BR;



wire [31:0] CFG_BASE_SC;
wire [31:0] CFG_TOP_SC;

assign CFG_BASE_SC = 32'h0000_0400;
assign CFG_TOP_SC = 32'h0000_0000;






lx1 lx1
(
.SYSCLK ( `LX2_SYSCLK_ ),

.SYSCLKF ( `LX2_SYSCLKF_ ),
.SL_SLEEPSYS_C2_R ( SL_SLEEPSYS_C2_R ),
.SL_SLEEPSYS_C3_R ( SL_SLEEPSYS_R ),




.BUSCLK ( `LX2_BUSCLK_ ),

.BUSCLKF ( `LX2_BUSCLKF_ ),
.SL_SLEEPBUS_C2_BR ( SL_SLEEPBUS_C2_BR ),
.SL_SLEEPBUS_C3_BR ( SL_SLEEPBUS_BR ),










.ResetN ( ResetN ),
.RESET_PWRON_N ( CResetN ),
.RESET_D1_R_N ( RESET_D1_R_N ),


.CFG_MEMSEQUENTIAL ( CFG_MEMSEQUENTIAL ),



.CFG_MEMZEROFIRST ( CFG_MEMZEROFIRST ),



.CFG_MEMFULLWORD ( CFG_MEMFULLWORD ),








.CFG_LBCSYNCMODE ( CFG_LBCSYNCMODE ),



.CFG_LBCWBDISABLE ( CFG_LBCWBDISABLE ),



.CFG_EJTNMINUS1 ( CFG_EJTNMINUS1 ),



.CFG_EJTMLOG2 ( CFG_EJTMLOG2 ),



.CFG_EJTBIT0M16 ( CFG_EJTBIT0M16 ),



.JTAG_TDO_NR (JTAG_TDO_NR),
.JTAG_TDI (JTAG_TDI),
.JTAG_TMS (JTAG_TMS),
.JTAG_CLOCK (`LX2_JTAG_CLOCK_),
.JTAG_TRST_N (JTAG_TRST_N),
.JTAG_RST_N (JTAG_RST_N),





.JPT_PCST_DR (JPT_PCST_DR),
.JPT_TPC_DR (JPT_TPC_DR),
.EJT_DCLK (EJT_DCLK),



.CFG_EJDIS (CFG_EJDIS),



.CFG_DWDISW (CFG_DWDISW),



.Cond_in1 ( Cond_in1 ),
.C1rd_data ( C1rd_data ),
.C1rd_addr ( C1rd_addr ),
.C1rhold ( C1rhold ),
.C1rd_gen ( C1rd_gen ),
.C1rd_con ( C1rd_con ),
.C1wr_addr ( C1wr_addr ),
.C1wr_gen ( C1wr_gen ),
.C1wr_con ( C1wr_con ),
.C1wr_data ( C1wr_data ),



.Cond_in2 ( Cond_in2 ),
.C2rd_data ( C2rd_data ),
.C2rd_addr ( C2rd_addr ),
.C2rhold ( C2rhold ),
.C2rd_gen ( C2rd_gen ),
.C2rd_con ( C2rd_con ),
.C2wr_addr ( C2wr_addr ),
.C2wr_gen ( C2wr_gen ),
.C2wr_con ( C2wr_con ),
.C2wr_data ( C2wr_data ),



.Cond_in3 ( Cond_in3 ),
.C3rd_data ( C3rd_data ),
.C3rd_addr ( C3rd_addr ),
.C3rhold ( C3rhold ),
.C3rd_gen ( C3rd_gen ),
.C3rd_con ( C3rd_con ),
.C3wr_addr ( C3wr_addr ),
.C3wr_gen ( C3wr_gen ),
.C3wr_con ( C3wr_con ),
.C3wr_data ( C3wr_data ),
.C3cnt_inst ( C3cnt_inst ),
.C3cnt_imiss ( C3cnt_imiss ),
.C3cnt_istall ( C3cnt_istall ),
.C3cnt_dmiss ( C3cnt_dmiss ),
.C3cnt_dstall ( C3cnt_dstall ),
.C3cnt_dload ( C3cnt_dload ),
.C3cnt_dstore ( C3cnt_dstore ),



.CEI_INSTM32_S_R_N ( CEI_INSTM32_S_R_N ),
.CE1_RES_E ( `CE1_RES_E_ ),
.CEI_CE1HOLD ( CEI_CE1HOLD ),
.CEI_XCPN_M_C1 ( CEI_XCPN_M_C1 ),
.CE1_SEL_E_R ( `CE1_SEL_E_R_ ),
.CE1_HALT_E_R ( `CE1_HALT_E_R_ ),
.CEI_CE1OP_S_R ( CEI_CE1OP_S_R ),
.CEI_CE1AOP_E_R ( CEI_CE1AOP_E_R),
.CEI_CE1BOP_E_R ( CEI_CE1BOP_E_R),




.LDataI ( LDataI ),
.LIrdyI ( LIrdyI ),
.LFrameI ( LFrameI ),
.LSel ( LSel ),
.LAbort ( LAbort ),
.LTrdy ( LTrdy ),
.LId ( LId ),
.LUc ( LUc ),
.LReq ( LReq ),
.LGnt ( LGnt ),
.LAddrO ( LAddrO ),
.LDataO ( LDataO ),
.LIrdy ( LIrdy ),
.LFrame ( LFrame ),
.LCmd ( LCmd ),
.LCoe ( LCoe ),
.LToe ( LToe ),
.LXoe ( LXoe ),
.LDoe ( LDoe ),





.EXT_ICREQRAM_R (`EXT_ICREQRAM_R_),
.IC_GNTRAM_R ( IC_GNTRAM_R ),



.IC_TAGINDEX ( IC_TAGINDEX ),
.ICR_TAGRD0 ( {ICR_TAGRD0 `IC_TAG_RD_FILL_}),


.IC_TAGWR0 ( {IC_TAGWR0, IC_TAGWR0UNUSED}),



.IC_TAG0WE ( IC_TAG0WE ),
.IC_TAG0WEN ( IC_TAG0WEN ),
.IC_TAG0RE ( IC_TAG0RE ),
.IC_TAG0REN ( IC_TAG0REN ),
.IC_TAG0CS ( IC_TAG0CS ),
.IC_TAG0CSN ( IC_TAG0CSN ),

.IC_INSTINDEX ( IC_INSTINDEX ),
.IC_INSTWR ( IC_INSTWR ),
.IC_INST0WE ( IC_INST0WE ),
.IC_INST0WEN ( IC_INST0WEN ),
.IC_INST0RE ( IC_INST0RE ),
.IC_INST0REN ( IC_INST0REN ),
.IC_INST0CS ( IC_INST0CS ),
.IC_INST0CSN ( IC_INST0CSN ),






.CFG_ICOFF ( 1'b0 ),
.ICR_TAGMASK (`IC_TAG_MASK ),
.ICR_INST0RD ( ICR_INST0RD ),






.IW_VALIDINDEX ( IW_VALIDINDEX ),

.IWR_VALIDRD ( IWR_VALIDRD ),

.IW_VALIDWR ( IW_VALIDWR ),
.IW_VALIDWE ( IW_VALIDWE ),
.IW_VALIDWEN ( IW_VALIDWEN ),
.IW_VALIDRE ( IW_VALIDRE ),
.IW_VALIDREN ( IW_VALIDREN ),
.IW_VALIDCS ( IW_VALIDCS ),
.IW_VALIDCSN ( IW_VALIDCSN ),

.IW_INSTINDEX ( IW_INSTINDEX ),
.IWR_INSTRD ( IWR_INSTRD ),
.IW_INSTWR ( IW_INSTWR ),
.IW_INSTWE ( IW_INSTWE ),
.IW_INSTWEN ( IW_INSTWEN ),
.IW_INSTRE ( IW_INSTRE ),
.IW_INSTREN ( IW_INSTREN ),
.IW_INSTCS ( IW_INSTCS ),
.IW_INSTCSN ( IW_INSTCSN ),
.EXT_IWREQRAM_R (`EXT_IWREQRAM_R_),
.IW_GNTRAM_R ( IW_GNTRAM_R ),


.CFG_IWBASE ( CFG_IWBASE ),
.CFG_IWTOP ( CFG_IWTOP ),




.EXT_DCREQRAM_R (`EXT_DCREQRAM_R_),
.DC_GNTRAM_R ( DC_GNTRAM_R ),



.DC_TAGINDEX ( DC_TAGINDEX ),

.DC_TAGWR ( {DC_TAGWR, DC_TAGWRUNUSED }),

.DC_TAGWE ( DC_TAGWE ),
.DC_TAGWEN ( DC_TAGWEN ),
.DC_TAGRE ( DC_TAGRE ),
.DC_TAGREN ( DC_TAGREN ),
.DC_TAGCS ( DC_TAGCS ),
.DC_TAGCSN ( DC_TAGCSN ),
.DCC_TAGMASK ( `DC_TAG_MASK ),

.DC_DATAINDEX ( DC_DATAINDEX ),
.DC_DATAWR ( DC_DATAWR ),
.DC_DATAWE ( DC_DATAWE ),
.DC_DATAWEN ( DC_DATAWEN ),
.DC_DATARE ( DC_DATARE ),
.DC_DATAREN ( DC_DATAREN ),
.DC_DATACS ( DC_DATACS ),
.DC_DATACSN ( DC_DATACSN ),


.CFG_DCOFF ( 1'b0 ),
.DCR_TAGRD ( {DCR_TAGRD `DC_TAG_RD_FILL_}),
.DCR_DATARD ( DCR_DATARD ),





.DW_DATAINDEX ( DW_DATAINDEX ),
.DWR_DATARD ( DWR_DATARD ),
.DW_DATAWR ( DW_DATAWR ),
.DW_DATAWE ( DW_DATAWE ),
.DW_DATAWEN ( DW_DATAWEN ),
.DW_DATARE ( DW_DATARE ),
.DW_DATAREN ( DW_DATAREN ),
.DW_DATACS ( DW_DATACS ),
.DW_DATACSN ( DW_DATACSN ),
.EXT_DWREQRAM_R (`EXT_DWREQRAM_R_),
.DW_GNTRAM_R ( DW_GNTRAM_R ),


.CFG_DWBASE ( CFG_DWBASE ),
.CFG_DWTOP ( CFG_DWTOP ),





.EXT_SLEEPREQ_R ( EXT_SLEEPREQ_R ),



.CFG_SLEEPENABLE ( CFG_SLEEPENABLE ),


.IntreqN ( IntreqN )

);







`IC_DATA_RAM_ ICACHE_INST0
(


.CLK ( `LX2_SYSCLK_ ),
.CLKN ( 1'b0 ),


.ADDR ( IC_INSTINDEX[`IC_ADDR_HI-`IC_TAG_EXTRA_USED:2] ),
.WEN ( IC_INST0WEN ),
.WE ( IC_INST0WE ),
.REN ( IC_INST0REN ),
.RE ( IC_INST0RE ),


.CSB ( IC_INST0CSN ),
.DATA_IN ( IC_INSTWR ),
.DATA_OUT ( ICR_INST0RD )
);



`IC_TAG0_RAM_ ICACHE_TAG0
(


.CLK ( `LX2_SYSCLK_ ),
.CLKN ( 1'b0 ),


.ADDR ( IC_TAGINDEX[`IC_ADDR_HI-`IC_TAG_EXTRA_USED:`LINE_ADDR_HI+1] ),
.WEN ( IC_TAG0WEN ),
.WE ( IC_TAG0WE ),
.REN ( IC_TAG0REN ),
.RE ( IC_TAG0RE ),


.CSB ( IC_TAG0CSN ),
.DATA_IN ( IC_TAGWR0 ),
.DATA_OUT ( ICR_TAGRD0 )
);











`DC_DATA_RAM_ DCACHE_DATA
(


.CLK ( `LX2_SYSCLK_),
.CLKN ( 1'b0 ),


.ADDR ( DC_DATAINDEX[`DC_ADDR_HI-`DC_TAG_EXTRA_USED:2] ),
.WEN ( DC_DATAWEN ),
.WE ( DC_DATAWE ),
.REN ( DC_DATAREN ),
.RE ( DC_DATARE ),


.CSB ( DC_DATACSN ),
.DATA_IN ( DC_DATAWR ),
.DATA_OUT ( DCR_DATARD )
);

`DC_TAG_RAM_ DCACHE_TAG
(


.CLK ( `LX2_SYSCLK_),
.CLKN ( 1'b0 ),


.ADDR ( DC_TAGINDEX[`DC_ADDR_HI-`DC_TAG_EXTRA_USED:`LINE_ADDR_HI+1] ),
.WEN ( DC_TAGWEN ),
.WE ( DC_TAGWE ),
.REN ( DC_TAGREN ),
.RE ( DC_TAGRE ),


.CSB ( DC_TAGCSN ),
.DATA_IN ( DC_TAGWR ),
.DATA_OUT ( DCR_TAGRD )
);









`DW_DATA_RAM_ DRAM_DATA
(


.CLK ( `LX2_SYSCLK_ ),
.CLKN ( 1'b0 ),


.ADDR ( DW_DATAINDEX[`DWR_ADDR_HI:2] ),
.WEN ( DW_DATAWEN ),
.WE ( DW_DATAWE ),
.REN ( DW_DATAREN ),
.RE ( DW_DATARE ),


.CSB ( DW_DATACSN ),
.DATA_IN ( DW_DATAWR ),
.DATA_OUT ( DWR_DATARD )
);









`IW_DATA_RAM_ IRAM_DATA
(


.CLK ( `LX2_SYSCLK_ ),
.CLKN ( 1'b0 ),


.ADDR ( IW_INSTINDEX[`IWR_ADDR_HI:2] ),

.WEN ( IW_INSTWEN ),
.WE ( IW_INSTWE ),
.DATA_IN ( IW_INSTWR ),

.REN ( IW_INSTREN ),
.RE ( IW_INSTRE ),


.CSB ( IW_INSTCSN ),
.DATA_OUT ( IWR_INSTRD )
);



`IW_VAL_RAM_ IRAM_VALID
(


.CLK ( `LX2_SYSCLK_ ),
.CLKN ( 1'b0 ),


.ADDR ( IW_VALIDINDEX[`IWR_ADDR_HI:`LINE_ADDR_HI+6] ),
.WEN ( IW_VALIDWEN ),
.WE ( IW_VALIDWE ),
.REN ( IW_VALIDREN ),
.RE ( IW_VALIDRE ),


.CSB ( IW_VALIDCSN ),
.DATA_IN ( IW_VALIDWR ),
.DATA_OUT ( IWR_VALIDRD )
);














endmodule

