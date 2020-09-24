



















































































`include "lxr_symbols.vh"
`include "lmi_symbols.vh"

module lmi_dram
















(
CLK, TMODE, RESET_D1_R_N, DISABLEC, CFG_DWDISW,

EXT_DWREQRAM_R, DW_GNTRAM_R,

DATAIN, DW_DATAOUT, DW_DATAOE,

NEXTADDR, NEXTRDOP, NEXTWROP, NEXTBE, NEXTSX, DW_VAL,

EXCP,

DW_ACK,

X_HALT_R,

DC_RPQUIETIFNBA, DC_RPQUIETIFB, DC_RPALGNIFNBNA, DC_RPALGNIFB,

DW_HALT_W_R,

DW_DATAINDEX, DWR_DATARD, DW_DATAWR,
DW_DATAWE, DW_DATAWEN, DW_DATARE, DW_DATAREN, DW_DATACS, DW_DATACSN,

CONFIGBASE, CONFIGTOP
);




















parameter BASE_HI = 31;
parameter BASE_LO = `LM_BASE_LO;
parameter TOP_HI = `LM_TOP_HI;
parameter TOP_LO = 4;
parameter DATA_INDEX_HI = `DW_ADDR_HI;
parameter DATA_INDEX_LO = 2;














input CLK;
input TMODE;
input RESET_D1_R_N;
input DISABLEC;
input CFG_DWDISW;

input EXT_DWREQRAM_R;
output DW_GNTRAM_R;
reg DW_GNTRAM_R;

input [31:0] DATAIN;
output [31:0] DW_DATAOUT;
output DW_DATAOE;

input [31:0] NEXTADDR;
input NEXTRDOP;
input NEXTWROP;
input [3:0] NEXTBE;
input NEXTSX;
input EXCP;

output DW_ACK;
output [`HALT_DRV_RANGE] DW_HALT_W_R;
reg [`HALT_DRV_RANGE] DW_HALT_W_R;

input [`HALT_SIG_RANGE] X_HALT_R;

input DC_RPQUIETIFNBA;
input DC_RPQUIETIFB;
input DC_RPALGNIFNBNA;
input DC_RPALGNIFB;
output DW_VAL;



output [DATA_INDEX_HI:DATA_INDEX_LO] DW_DATAINDEX;
input [31:0] DWR_DATARD;
output [31:0] DW_DATAWR;
reg [31:0] DW_DATAWR;
output DW_DATAWE;
output DW_DATAWEN;
output DW_DATARE;
output DW_DATAREN;
output DW_DATACS;
output DW_DATACSN;

input [BASE_HI:BASE_LO] CONFIGBASE;
input [TOP_HI:TOP_LO] CONFIGTOP;





reg RESET_X_R_N;
always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;
wire RESET_D2_R_N = RESET_X_R_N | TMODE;







wire NC_FOO = TMODE;










reg [BASE_HI:BASE_LO] ConfigBase_R;
reg [TOP_HI:TOP_LO] ConfigTop_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
ConfigBase_R <= { BASE_HI-BASE_LO+1 { 1'b0 } };
ConfigTop_R <= { TOP_HI-TOP_LO+1 { 1'b0 } };
end
else
begin
ConfigBase_R <= CONFIGBASE;
ConfigTop_R <= CONFIGTOP;
end






reg WasWrite_R;

reg [DATA_INDEX_HI:DATA_INDEX_LO] dataAddrMux;

reg [3:0] BE_R;
reg RDOP_R;
reg WROP_R;
reg SX_R;

reg Partial_R;

reg ack;

reg ackOut;

assign DW_VAL = 1'b0;




















wire RamOff = DISABLEC;
wire RamOn = ~DISABLEC;
wire RamDisW = CFG_DWDISW;

















parameter
CST_RESET = 0,
CST_LOOKUP = 1,
CST_WB = 2,
CST_OFF = 3,
CST_RPALGN = 4,
CST_QUIET = 5,
CST_GNTRAM = 6,
CST_WAIT = 7,

CST_LAST = 7;

parameter CST_CLEAR_VECT = 8'd0;
parameter CST_RESET_VECT = 8'd1;

reg [CST_LAST:0] CST_R;
reg [CST_LAST:0] CST_P;

reg MyBusy_R;






wire otherBusy = | (X_HALT_R & ~`DW_HALT_W_MASK & ~`RALU_HALT_E_MASK);






wire anyBusy = otherBusy | MyBusy_R;



wire otherBusyDC = | (X_HALT_R & ~`DC_HALT_W_MASK & ~`DC_HALT_M_MASK & ~`RALU_HALT_E_MASK);








wire wrOp = (CST_R[CST_LOOKUP] | CST_R[CST_WB]) & WROP_R & ~otherBusy;

wire WrPartialReq_P = NEXTWROP & ~(NEXTBE[3] & NEXTBE[1]);
wire wrPartialReq = WROP_R & ~(BE_R[3] & BE_R[1]);
wire wrPartial = wrOp & ~(BE_R[3] & BE_R[1]);
wire wrPartialMiss = wrPartial & ~ack;
wire wrPartialHit = wrPartial & ack;

wire wrWordReq = WROP_R & BE_R[3] & BE_R[1];
wire wrWord = wrOp & BE_R[3] & BE_R[1];
wire wrWordMiss = wrWord & ~ack;
wire wrWordHit = wrWord & ack;

wire wrHit = wrOp & ack;

wire rdWordReq = RDOP_R & BE_R[3] & BE_R[1];



reg RdPartialReq_R;



wire dataRamWE = (~EXCP & ~RamDisW & wrWordHit)
| (~EXCP & ~RamDisW & wrPartialHit & ~WasWrite_R);

assign DW_DATAWE = dataRamWE;
assign DW_DATAWEN = ~dataRamWE;

wire dataRamRE = CST_R[CST_LOOKUP] & (NEXTRDOP | NEXTWROP | RDOP_R | WROP_R) & ~dataRamWE
| CST_R[CST_WB] & ~dataRamWE
| CST_R[CST_RPALGN]
| CST_R[CST_QUIET]
| CST_R[CST_WAIT];

assign DW_DATARE = dataRamRE;
assign DW_DATAREN = ~dataRamRE;

assign DW_DATACS = dataRamRE | dataRamWE;
assign DW_DATACSN = ~dataRamRE & ~dataRamWE;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
WasWrite_R <= 1'b0;
else
WasWrite_R <= dataRamWE;



  // synopsys translate_off
  // verilint translate off


always @ (posedge CLK `negedge_RESET_D2_R_N_)
if ( dataRamWE && EXCP && (CST_R[CST_LOOKUP] | CST_R[CST_WB]) )
begin
$display ("ERROR %t %m: wrote data cache data store during exception", $time);
$stop;
end

  // verilint translate on
  // synopsys translate_on






reg RdOp_P;

wire BusyState_P = ~CST_P[CST_LOOKUP] & ~CST_P[CST_WB] & ~CST_P[CST_OFF] & ~CST_P[CST_RPALGN] & ~CST_P[CST_QUIET];

wire BusyRAW_P = (RdOp_P||WrPartialReq_P) && dataRamWE && (CST_P[CST_LOOKUP]||CST_P[CST_WB]) && RamOn;

reg BusyRAW_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
BusyRAW_R <= 1'b0;
else
BusyRAW_R <= BusyRAW_P;



wire DW_HALT_W_P = BusyState_P | BusyRAW_P;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
MyBusy_R <= 1'b0;
DW_HALT_W_R <= { `HALT_DRV_COUNT { 1'b0 } };
end
else
begin
MyBusy_R <= DW_HALT_W_P;
DW_HALT_W_R <= { `HALT_DRV_COUNT { DW_HALT_W_P } };
end

assign DW_ACK = ackOut;



reg [31:0] LogAddr_R;




reg Kseg1_R;
reg [31:0] LogAddr_P;
reg [3:0] BE_P;
reg WrOp_P;
reg SX_P;
reg Partial_P;
reg Kseg1_P;
reg RdPartialReq_P;





always @ (LogAddr_R or BE_R or RDOP_R or WROP_R or SX_R or Partial_R or Kseg1_R or RdPartialReq_R or NEXTADDR or NEXTBE or NEXTRDOP or NEXTWROP or NEXTSX or anyBusy or EXCP)
if (anyBusy)
begin
LogAddr_P = LogAddr_R;
BE_P = BE_R;
RdOp_P = RDOP_R & ~EXCP;
WrOp_P = WROP_R & ~EXCP;
SX_P = SX_R;
Partial_P = Partial_R;
Kseg1_P = Kseg1_R;
RdPartialReq_P = RdPartialReq_R & ~EXCP;
end
else
begin
LogAddr_P = NEXTADDR;
BE_P = NEXTBE;
RdOp_P = NEXTRDOP & ~EXCP;
WrOp_P = NEXTWROP & ~EXCP;
SX_P = NEXTSX;
Partial_P = ~(NEXTBE[3] & NEXTBE[1]);
Kseg1_P = NEXTADDR[31:29] == 3'b101;
RdPartialReq_P = NEXTRDOP & ~(NEXTBE[3] & NEXTBE[1]) & ~EXCP;
end

wire DW_GNTRAM_P = EXT_DWREQRAM_R & CST_R[CST_GNTRAM];

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
LogAddr_R <= 32'd0;
BE_R <= 4'b1111;
RDOP_R <= 1'b0;
WROP_R <= 1'b0;
SX_R <= 1'b0;
Partial_R <= 1'b0;
Kseg1_R <= 1'b0;
RdPartialReq_R <= 1'b0;
DW_GNTRAM_R <= 1'b0;
end
else
begin
LogAddr_R <= LogAddr_P;
BE_R <= BE_P;
RDOP_R <= RdOp_P;
WROP_R <= WrOp_P;
SX_R <= SX_P;
Partial_R <= Partial_P;
Kseg1_R <= Kseg1_P;
RdPartialReq_R <= RdPartialReq_P;
DW_GNTRAM_R <= DW_GNTRAM_P;
end


reg [31:0] physAddr;

always @ (LogAddr_R)
begin

physAddr[28:0] = LogAddr_R[28:0];

case (LogAddr_R[31:29])
3'b000: physAddr[31:29] = 3'b010;
3'b001: physAddr[31:29] = 3'b011;
3'b010: physAddr[31:29] = 3'b100;
3'b011: physAddr[31:29] = 3'b101;
3'b100: physAddr[31:29] = 3'b000;
3'b101: physAddr[31:29] = 3'b000;
3'b110: physAddr[31:29] = 3'b110;
3'b111: physAddr[31:29] = 3'b111;









endcase



end



wire rangeCompare;

lmi_dram_cmp COMPARE
(
.CMP (rangeCompare),
.ADDR (physAddr),
.BASE (ConfigBase_R),
.TOP (ConfigTop_R)
);

wire myAddr = rangeCompare;












reg [31:0] HoldAddr_R;
reg [3:0] HoldBE_R;
reg HoldSX_R;
reg [31:0] HoldDataIn_R;

reg [31:0] DataRd_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
DataRd_R <= 32'd0;
else
DataRd_R <= DWR_DATARD;

always @ (posedge CLK `negedge_RESET_D2_R_N_)

if (~`RESET_D2_R_N_)

begin
HoldAddr_R <= 32'd0;
HoldBE_R <= 4'b1111;
HoldSX_R <= 1'b0;
HoldDataIn_R <= 32'd0;
end

else if (CST_R[CST_LOOKUP]||CST_R[CST_WB])



begin
HoldAddr_R <= physAddr;
HoldBE_R <= BE_R;
HoldSX_R <= SX_R;
HoldDataIn_R <= DATAIN;
end







assign DW_DATAOE = (CST_R[CST_LOOKUP]|CST_R[CST_WB]) & RDOP_R & myAddr | BusyRAW_R | CST_R[CST_RPALGN];





wire [31:0] alignOut;

lmi_align LMI_ALIGN1 (.SX(HoldSX_R), .BE(HoldBE_R), .DI(DataRd_R), .DO(alignOut));

assign DW_DATAOUT = CST_R[CST_RPALGN] ? alignOut : DWR_DATARD;













always @ (wrPartial or HoldDataIn_R or CST_R or DATAIN or BE_R or DWR_DATARD)
begin




DW_DATAWR = DATAIN;





if (CST_R[CST_LOOKUP] & wrPartial & ~BE_R[3])
DW_DATAWR[31:24] = DWR_DATARD[31:24];





if (CST_R[CST_LOOKUP] & wrPartial & ~BE_R[2])
DW_DATAWR[23:16] = DWR_DATARD[23:16];





if (CST_R[CST_LOOKUP] & wrPartial & ~BE_R[1])
DW_DATAWR[15: 8] = DWR_DATARD[15: 8];





if (CST_R[CST_LOOKUP] & wrPartial & ~BE_R[0])
DW_DATAWR[ 7: 0] = DWR_DATARD[ 7: 0];

end







wire cacheReady = (CST_R[CST_LOOKUP]|CST_R[CST_WB]|CST_R[CST_RPALGN]|CST_R[CST_QUIET]);

always @ (CST_R or physAddr or HoldAddr_R or NEXTADDR or cacheReady or anyBusy or wrHit or RdPartialReq_R or ack)

if (cacheReady && ~wrHit && ~anyBusy && ~(CST_R[CST_LOOKUP]&&RdPartialReq_R&&ack) )
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = NEXTADDR[DATA_INDEX_HI:DATA_INDEX_LO];
else
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = physAddr[DATA_INDEX_HI:DATA_INDEX_LO];




assign DW_DATAINDEX = dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO];






always @ (CST_R or physAddr or RDOP_R or WROP_R or myAddr or otherBusy or EXCP)
begin
ackOut = (CST_R[CST_LOOKUP]|CST_R[CST_WB]) & (RDOP_R||WROP_R) & myAddr;
ack = ackOut & ~otherBusy & ~EXCP;
end











always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
CST_R <= CST_RESET_VECT;
else
CST_R <= CST_P;






  // synopsys translate_off
  // verilint translate off

always @(posedge CLK)

if (`RESET_D2_R_N_ &&
(CST_R[CST_RESET]
+CST_R[CST_LOOKUP]
+CST_R[CST_WB]
+CST_R[CST_RPALGN]
+CST_R[CST_QUIET]
+CST_R[CST_WAIT]
+CST_R[CST_GNTRAM]
+CST_R[CST_OFF]) != 1)
begin
$display ("ERROR %t %m: CST reached invalid state %b", $time, CST_R);
$stop;
end

  // verilint translate on
  // synopsys translate_on



wire RPQUIETC = DC_RPQUIETIFB & otherBusyDC | DC_RPQUIETIFNBA & ackOut & ~otherBusyDC & ~EXCP;
wire RPALGNC = DC_RPALGNIFB & otherBusyDC | DC_RPALGNIFNBNA & ~ackOut & ~otherBusyDC & ~EXCP;

always @ (CST_R or RamOn or RamOff or ack or RDOP_R or WROP_R or Partial_R or RPQUIETC or RPALGNC or otherBusy or EXCP or EXT_DWREQRAM_R)

begin

CST_P = CST_CLEAR_VECT;

case (1'b1)










CST_R[CST_RESET]:
begin
CST_P[CST_LOOKUP] = RamOn;
CST_P[CST_OFF] = RamOff;
end




CST_R[CST_LOOKUP]:
begin
CST_P[CST_LOOKUP] = ~(ack & WROP_R & ~EXCP) & ~RPQUIETC & ~RPALGNC & ~(EXT_DWREQRAM_R & ~RDOP_R & ~WROP_R);
CST_P[CST_WB] = ack & WROP_R & ~EXCP;
CST_P[CST_RPALGN] = RPQUIETC;
CST_P[CST_QUIET] = RPALGNC;
CST_P[CST_GNTRAM] = EXT_DWREQRAM_R & ~RDOP_R & ~WROP_R;
end




CST_R[CST_WB]:
begin
CST_P[CST_WB] = ack & WROP_R & ~Partial_R & ~EXCP;
CST_P[CST_LOOKUP] = ~ack | RDOP_R | Partial_R | EXCP;
end














CST_R[CST_RPALGN]:
begin
CST_P[CST_RPALGN] = otherBusy;
CST_P[CST_LOOKUP] = ~otherBusy;
end










CST_R[CST_QUIET]:
begin
CST_P[CST_LOOKUP] = 1'b1;
end







CST_R[CST_WAIT]:
begin
CST_P[CST_LOOKUP] = 1'b1;
end












CST_R[CST_GNTRAM]:
begin
CST_P[CST_WAIT] = ~EXT_DWREQRAM_R;
CST_P[CST_GNTRAM] = EXT_DWREQRAM_R;
end

endcase

end

endmodule










