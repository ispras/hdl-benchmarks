



















































































`include "lxr_symbols.vh"
`include "lmi_symbols.vh"

module lmi_iram






























(
CLK, TMODE, RESET_D1_R_N, INVALIDATE,

MEMSEQUENTIAL, MEMZEROFIRST, CFG_IRAMISROM,

EXT_IWREQRAM_R, IW_GNTRAM_R,

IW_DATAOE, IW_LBCOE,

NEXTADDR, RDOP_N, IS_VAL, IW_VAL,

X_HALT_R,

IW_ACK, IW_MISS_P, IW_MISS_R, IW_HALT_S_R,

IW_VALINDEX, IWR_VALRD, IW_VALWR,
IW_VALWE, IW_VALWEN, IW_VALRE, IW_VALREN, IW_VALCS, IW_VALCSN,

IW_DATAINDEX,
IW_DATAWE, IW_DATAWEN, IW_DATARE, IW_DATAREN, IW_DATACS, IW_DATACSN,

CONFIGBASE, CONFIGTOP
);


















parameter BEAT_INDEX_HI = `LINE_ADDR_HI;
parameter BEAT_INDEX_LO = 2;
parameter BEAT_INDEX_ONES = `LINE_CTR_LAST;
parameter VAL_INDEX_HI = `IW_ADDR_HI;
parameter VAL_INDEX_LO = `LINE_ADDR_HI+1;
parameter VAL_RINDEX_HI = `IW_ADDR_HI;
parameter VAL_RINDEX_LO = 9;
parameter VAL_IINDEX_HI = `IW_ADDR_HI;
parameter VAL_IINDEX_LO = `LINE_ADDR_HI+6;
parameter VAL_IINDEX_ONES = {(VAL_IINDEX_HI-VAL_IINDEX_LO+1){1'b1}};
parameter VAL_WINDEX_HI = `LINE_ADDR_HI+5;
parameter VAL_WINDEX_LO = `LINE_ADDR_HI+1;
parameter BASE_HI = 31;
parameter BASE_LO = `LM_BASE_LO;
parameter TOP_HI = `LM_TOP_HI;
parameter TOP_LO = 4;

parameter DATA_INDEX_HI = `IW_ADDR_HI;
parameter DATA_INDEX_LO = 2;

parameter VAL_HI = `IW_VAL_HI;









input CLK;
input TMODE;
input RESET_D1_R_N;
input INVALIDATE;
input MEMSEQUENTIAL;
input MEMZEROFIRST;
input CFG_IRAMISROM;

input EXT_IWREQRAM_R;
output IW_GNTRAM_R;
reg IW_GNTRAM_R;

output IW_DATAOE;
output IW_LBCOE;

input [31:0] NEXTADDR;
input RDOP_N;
input IS_VAL;
output IW_VAL;
reg IW_VAL;

output IW_ACK;
output IW_MISS_P;
output IW_MISS_R;
output [`HALT_DRV_RANGE] IW_HALT_S_R;
reg [`HALT_DRV_RANGE] IW_HALT_S_R;

input [`HALT_SIG_RANGE] X_HALT_R;



output [VAL_RINDEX_HI:VAL_RINDEX_LO] IW_VALINDEX;
input [31:0] IWR_VALRD;
output [31:0] IW_VALWR;
output IW_VALWE;
output IW_VALWEN;
output IW_VALRE;
output IW_VALREN;
output IW_VALCS;
output IW_VALCSN;

output [DATA_INDEX_HI:DATA_INDEX_LO] IW_DATAINDEX;
output IW_DATAWE;
output IW_DATAWEN;
output IW_DATARE;
output IW_DATAREN;
output IW_DATACS;
output IW_DATACSN;

input [BASE_HI:BASE_LO] CONFIGBASE;
input [TOP_HI:TOP_LO] CONFIGTOP;



wire NC_FOO = TMODE;





reg RESET_X_R_N;


always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;


wire RESET_D2_R_N = RESET_X_R_N | TMODE;







wire ZeroFirst = MEMZEROFIRST;




wire InterLv = ~MEMSEQUENTIAL;




wire IsROM = CFG_IRAMISROM;








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

reg missO;

assign IW_MISS_P = missO & (RDOP_N | ~WasWrite_R);

reg IW_MISS_R;
always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
IW_MISS_R <= 1'b0;
else
IW_MISS_R <= IW_MISS_P;



reg [VAL_INDEX_HI:VAL_INDEX_LO] valAddrMux;
reg [DATA_INDEX_HI:DATA_INDEX_LO] dataAddrMux;

reg [VAL_IINDEX_HI:VAL_IINDEX_LO] ValInitCtr_R;

wire anyBusy;

reg MyBusy_R;

reg foundDesiredBeat;
















parameter
CST_INIT = 0,
CST_LOOKUP = 1,
CST_WB = 2,
CST_FILL = 3,
CST_GNTRAM = 4,
CST_LAST = 4,
CST_RESET_VECT = 5'd1;

reg [CST_LAST:0] CST_R;
reg [CST_LAST:0] CST_P;



parameter
IST_RESET = 0,
IST_WRITE = 1,
IST_WAIT = 2,
IST_IDLE = 3,
IST_LAST = 3,
IST_RESET_VECT = 4'd1;

reg [IST_LAST:0] IST_R;
reg [IST_LAST:0] IST_P;












reg Inval1_R;
reg Inval2_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
Inval1_R <= 1'b0;
Inval2_R <= 1'b0;
end
else
begin
Inval1_R <= INVALIDATE;
Inval2_R <= Inval1_R;
end


reg InvalPending_R;

wire InvalPending_P = ~CST_R[CST_INIT] & (~Inval2_R & Inval1_R | InvalPending_R);

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
InvalPending_R <= 1'b0;
else
InvalPending_R <= InvalPending_P;



wire IW_GNTRAM_P = EXT_IWREQRAM_R & CST_R[CST_GNTRAM];

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
IW_GNTRAM_R <= 1'b0;
else
IW_GNTRAM_R <= IW_GNTRAM_P;



reg [31:0] LogAddr_R;




reg Kseg1_R;
reg INIT_D1_R;
reg INIT_D2_R;
reg INIT_D3_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
LogAddr_R <= 32'h0000_0000;
Kseg1_R <= 1'b0;
end
else if (~anyBusy | INIT_D3_R)
begin
LogAddr_R <= NEXTADDR;
Kseg1_R <= NEXTADDR[31:29] == 3'b101;
end

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
INIT_D1_R <= 1'b1;
INIT_D2_R <= 1'b1;
INIT_D3_R <= 1'b1;
end
else begin
INIT_D1_R <= 1'b0;
INIT_D2_R <= INIT_D1_R;
INIT_D3_R <= INIT_D2_R;
end

wire Kseg2UC = LogAddr_R[`KSEG2_UC_BITS] == `KSEG2_UC_VALUE;

wire Uncached_M = Kseg1_R | Kseg2UC;

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

lmi_iram_cmp COMPARE
(
.CMP (rangeCompare),
.ADDR (physAddr),
.BASE (ConfigBase_R),
.TOP (ConfigTop_R)
);

wire myAddr = rangeCompare & (~Uncached_M | IsROM);





wire ValWE = CST_R[CST_FILL] & IS_VAL&foundDesiredBeat | IST_R[IST_WRITE];

assign IW_VALWE = ValWE;
assign IW_VALWEN = ~ValWE;

assign IW_VALRE = ~ValWE;
assign IW_VALREN = ValWE;

assign IW_VALCS = 1'b1;
assign IW_VALCSN = 1'b0;











reg [VAL_WINDEX_HI:VAL_WINDEX_LO] ValBitDecAddr_R;
reg [VAL_HI:0] valBitDec;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
ValBitDecAddr_R <= { VAL_WINDEX_HI-VAL_WINDEX_LO+1 { 1'b0 } };
else
ValBitDecAddr_R <= valAddrMux[VAL_WINDEX_HI:VAL_WINDEX_LO];

always @(ValBitDecAddr_R)
begin
valBitDec = { VAL_HI+1 { 1'b0 } };
valBitDec[ValBitDecAddr_R] = 1'b1;
end








reg [VAL_HI:0] valWrO;
wire [VAL_HI:0] ValRd;

always @(IST_R or valBitDec or ValRd)
begin
if (IST_R[IST_WRITE])
valWrO = { VAL_HI+1 { 1'b0 } };
else
valWrO = valBitDec | ValRd;
end

assign IW_VALWR = { {32-VAL_HI {1'b0}} , valWrO };









wire dataRamWE = CST_R[CST_FILL];

assign IW_DATAWE = dataRamWE;
assign IW_DATAWEN = ~dataRamWE;

assign IW_DATARE = ~dataRamWE;
assign IW_DATAREN = dataRamWE;

assign IW_DATACS = 1'b1;
assign IW_DATACSN = 1'b0;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
WasWrite_R <= 1'b0;
else
WasWrite_R <= dataRamWE;



wire otherBusy;

wire IW_HALT_S_P = ~CST_P[CST_LOOKUP] | CST_P[CST_LOOKUP] & InvalPending_P;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
MyBusy_R <= 1'b1;
IW_HALT_S_R <= { `HALT_DRV_COUNT { 1'b1 } };
end
else
begin
MyBusy_R <= IW_HALT_S_P;
IW_HALT_S_R <= { `HALT_DRV_COUNT { IW_HALT_S_P } };
end




wire otherIBusy = X_HALT_R[`IC_HALT_S_INDEX] | X_HALT_R[`IT_HALT_S_INDEX];
assign otherBusy = | (X_HALT_R & ~`IW_HALT_S_MASK);






assign anyBusy = otherBusy | MyBusy_R;












reg [31:0] HoldAddr_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
begin

if (~`RESET_D2_R_N_)
HoldAddr_R <= 32'd0;
else if (CST_R[CST_LOOKUP] | CST_R[CST_WB])
HoldAddr_R <= physAddr;

end









assign IW_LBCOE = CST_R[CST_WB] | CST_R[CST_FILL] | CST_R[CST_INIT];






assign ValRd = IWR_VALRD;









reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstCounter_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] FirstOffset_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstOffset_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstCounter_P;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] FirstOffset_P;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstOffset_P;

always @(CST_R or physAddr or IS_VAL or BurstCounter_R or FirstOffset_R or BurstOffset_R or InterLv or ZeroFirst)
begin
BurstCounter_P = BurstCounter_R;
FirstOffset_P = FirstOffset_R;
BurstOffset_P = BurstOffset_R;
if (CST_R[CST_LOOKUP])
begin
BurstCounter_P = `LINE_CTR_FIRST;
if (ZeroFirst)
begin
FirstOffset_P = `LINE_CTR_FIRST;
BurstOffset_P = `LINE_CTR_FIRST;
end
else
begin
FirstOffset_P = physAddr[BEAT_INDEX_HI:BEAT_INDEX_LO];
BurstOffset_P = physAddr[BEAT_INDEX_HI:BEAT_INDEX_LO];
end
end
else if (CST_R[CST_FILL] & IS_VAL)
begin

BurstCounter_P = BurstCounter_R + `LINE_CTR_ONE;
if (InterLv)
BurstOffset_P = FirstOffset_R ^ BurstCounter_P;
else
BurstOffset_P = BurstOffset_R + `LINE_CTR_ONE;

end
end

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
BurstCounter_R <= `LINE_CTR_FIRST;
FirstOffset_R <= `LINE_CTR_FIRST;
BurstOffset_R <= `LINE_CTR_FIRST;
end
else
begin
BurstCounter_R <= BurstCounter_P;
FirstOffset_R <= FirstOffset_P;
BurstOffset_R <= BurstOffset_P;
end







always @(HoldAddr_R or BurstOffset_R or IS_VAL or CST_R)
begin
foundDesiredBeat = BurstOffset_R == HoldAddr_R[BEAT_INDEX_HI:BEAT_INDEX_LO];
IW_VAL = foundDesiredBeat & IS_VAL & CST_R[CST_FILL];
end
















wire cacheReady = CST_R[CST_LOOKUP];

always @ (CST_R or physAddr or HoldAddr_R or BurstOffset_R or NEXTADDR or cacheReady or otherBusy)

if (cacheReady & ~otherBusy)
dataAddrMux = NEXTADDR[DATA_INDEX_HI:DATA_INDEX_LO];
else if (CST_R[CST_FILL])
begin
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = HoldAddr_R[DATA_INDEX_HI:DATA_INDEX_LO];
dataAddrMux[BEAT_INDEX_HI:BEAT_INDEX_LO] = BurstOffset_R;
end
else
dataAddrMux = physAddr[DATA_INDEX_HI:DATA_INDEX_LO];

always @ (CST_R or IST_R or physAddr or HoldAddr_R or ValInitCtr_R or NEXTADDR or cacheReady or otherBusy)

if (cacheReady & ~otherBusy)
valAddrMux[VAL_INDEX_HI:VAL_INDEX_LO] = NEXTADDR[VAL_INDEX_HI:VAL_INDEX_LO];
else if (CST_R[CST_WB])
valAddrMux = physAddr[VAL_INDEX_HI:VAL_INDEX_LO];
else if (CST_R[CST_FILL])
valAddrMux = HoldAddr_R[VAL_INDEX_HI:VAL_INDEX_LO];
else if (~IST_R[IST_WRITE])
valAddrMux = physAddr[VAL_INDEX_HI:VAL_INDEX_LO];
else
begin
valAddrMux = 0;
valAddrMux[VAL_IINDEX_HI:VAL_IINDEX_LO] = ValInitCtr_R;
end





assign IW_VALINDEX = valAddrMux[VAL_RINDEX_HI:VAL_RINDEX_LO];
assign IW_DATAINDEX = dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO];












reg doCompare;

always @ (CST_R or RDOP_N or ValRd or myAddr or valBitDec or otherBusy or IsROM)
begin
doCompare = CST_R[CST_LOOKUP] & ~RDOP_N & ~otherBusy;
missO = doCompare & myAddr & ~|(ValRd & valBitDec) & ~IsROM;
end

assign IW_ACK = CST_R[CST_LOOKUP] & myAddr;

assign IW_DATAOE = CST_R[CST_LOOKUP] & ~otherIBusy & myAddr;











always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
CST_R <= CST_RESET_VECT;
else
CST_R <= CST_P;






  // synopsys translate_off
  // verilint translate off

always @ (posedge CLK)
if (`RESET_D2_R_N_ &&
(CST_R[CST_INIT]
+CST_R[CST_LOOKUP]
+CST_R[CST_WB]
+CST_R[CST_GNTRAM]
+CST_R[CST_FILL]) != 1)
begin
$display ("ERROR %t %m: CST_R reached invalid state %b", $time, CST_R);
$stop;
end

  // verilint translate on
  // synopsys translate_on


always @ (CST_R or IST_R or IST_R or RDOP_N or missO or IS_VAL or BurstCounter_R or otherBusy or WasWrite_R or InvalPending_R or EXT_IWREQRAM_R)
begin

CST_P = 0;

case (1'b1)








CST_R[CST_INIT]:
begin
CST_P[CST_INIT] = ~IST_R[IST_WAIT];
CST_P[CST_LOOKUP] = IST_R[IST_WAIT];
end




CST_R[CST_LOOKUP]:
begin
CST_P[CST_LOOKUP] = ~InvalPending_R & ~EXT_IWREQRAM_R & ((RDOP_N | (~RDOP_N & (~missO|WasWrite_R))) | otherBusy);
CST_P[CST_FILL] = ~InvalPending_R & missO & ~RDOP_N & ~otherBusy & ~WasWrite_R;
CST_P[CST_GNTRAM] = ~InvalPending_R & ~missO & EXT_IWREQRAM_R;
CST_P[CST_INIT] = InvalPending_R;
end




CST_R[CST_WB]:
begin
CST_P[CST_LOOKUP] = 1'b1;
end




CST_R[CST_FILL]:
begin
CST_P[CST_FILL] = ~IS_VAL | (BurstCounter_R != BEAT_INDEX_ONES);
CST_P[CST_WB] = IS_VAL & (BurstCounter_R == BEAT_INDEX_ONES);
end












CST_R[CST_GNTRAM]:
begin
CST_P[CST_WB] = ~EXT_IWREQRAM_R;
CST_P[CST_GNTRAM] = EXT_IWREQRAM_R;
end

endcase

end









always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
ValInitCtr_R <= 0;
else if (IST_R[IST_WRITE])


ValInitCtr_R <= ValInitCtr_R + 1;


else
ValInitCtr_R <= 0;

wire ValInitDone = ValInitCtr_R == VAL_IINDEX_ONES;



always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
IST_R <= IST_RESET_VECT;
else
IST_R <= IST_P;

always @ (IST_R or CST_R or IsROM or ValInitDone)
begin

IST_P = 0;

case (1'b1)

IST_R[IST_RESET]:
begin
IST_P[IST_WRITE] = ~IsROM;
IST_P[IST_WAIT] = IsROM;
end

IST_R[IST_WRITE]:
begin
IST_P[IST_WRITE] = ~ValInitDone;
IST_P[IST_WAIT] = ValInitDone;
end

IST_R[IST_WAIT]:
begin
IST_P[IST_IDLE] = 1'b1;
end

IST_R[IST_IDLE]:
begin
IST_P[IST_IDLE] = ~CST_R[CST_INIT];
IST_P[IST_WRITE] = CST_R[CST_INIT];
end

endcase

end


  // synopsys translate_off
  // verilint translate off


always @ (posedge CLK)
if (`RESET_D2_R_N_ === 1'b1 &&
(IST_P[IST_RESET]
+IST_P[IST_WRITE]
+IST_P[IST_WAIT]
+IST_P[IST_IDLE]) != 1)
begin
$display ("ERROR %t %m: IST_P reached invalid state %b", $time, IST_P);
$stop;
end

  // verilint translate on
  // synopsys translate_on


endmodule








