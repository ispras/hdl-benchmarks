



















































































`include "../include/lxr_symbols.vh"
`include "../include/lmi_symbols.vh"

module lmi_icache
















(
CLK, TMODE, RESET_D1_R_N, DISABLEC, INVALIDATE,

MEMSEQUENTIAL, MEMZEROFIRST,

EXT_ICREQRAM_R, IC_GNTRAM_R,

IC_DATAOE, IC_LBCOE,

NEXTADDR, RDOP_N, IS_VAL, IC_VAL, LACK,

X_HALT_R,

IC_MISS_P, IC_MISS_R, IC_HALT_S_R,

IC_TAGINDEX, ICR_TAGRD0, IC_TAGWR0,

IC_TAG0WE, IC_TAG0WEN, IC_TAG0RE, IC_TAG0REN, IC_TAG0CS, IC_TAG0CSN,

IC_DATAINDEX,

IC_DATA0WE, IC_DATA0WEN, IC_DATA0RE, IC_DATA0REN, IC_DATA0CS, IC_DATA0CSN,

ICC_TAGMASK,



IC_TAG0COMPARE

);
















































parameter TAG_INDEX_HI = `IC_ADDR_HI;
parameter TAG_INDEX_LO = `LINE_ADDR_HI+1;
parameter TAG_INDEX_ONES = {(`IC_ADDR_HI-`LINE_ADDR_HI){1'b1}};
parameter BEAT_INDEX_HI = `LINE_ADDR_HI;
parameter BEAT_INDEX_LO = 2;
parameter DATA_INDEX_HI = `IC_ADDR_HI;
parameter DATA_INDEX_LO = 2;
parameter TAG_HI = 31;
parameter TAG_LO = `IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE;
parameter TAG_STATE_HI = 32;
parameter TAG_STATE_LO = `IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE;
parameter TAG_VALID = 32;
parameter TAG_MASK_HI = `IC_ADDR_HI;
parameter TAG_MASK_LO = `IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE;










input CLK;
input TMODE;
input RESET_D1_R_N;
input DISABLEC;
input INVALIDATE;

input MEMSEQUENTIAL;
input MEMZEROFIRST;

input EXT_ICREQRAM_R;
output IC_GNTRAM_R;
reg IC_GNTRAM_R;

output IC_DATAOE;
output IC_LBCOE;

input [31:0] NEXTADDR;
input RDOP_N;
input IS_VAL;
output IC_VAL;
reg IC_VAL;
input [1:0] LACK;

output IC_MISS_P;
output IC_MISS_R;

output [`HALT_DRV_RANGE] IC_HALT_S_R;
reg [`HALT_DRV_RANGE] IC_HALT_S_R;

input [`HALT_SIG_RANGE] X_HALT_R;



output [TAG_INDEX_HI:TAG_INDEX_LO] IC_TAGINDEX;

input [TAG_STATE_HI:TAG_STATE_LO] ICR_TAGRD0;

output [TAG_STATE_HI:TAG_STATE_LO] IC_TAGWR0;
reg [TAG_STATE_HI:TAG_STATE_LO] IC_TAGWR0;


output IC_TAG0WE;
output IC_TAG0WEN;
output IC_TAG0RE;
output IC_TAG0REN;
output IC_TAG0CS;
output IC_TAG0CSN;

output [DATA_INDEX_HI:DATA_INDEX_LO] IC_DATAINDEX;
output IC_DATA0WE;
output IC_DATA0WEN;
output IC_DATA0RE;
output IC_DATA0REN;
output IC_DATA0CS;
output IC_DATA0CSN;

input [TAG_MASK_HI:TAG_MASK_LO] ICC_TAGMASK;

output IC_TAG0COMPARE;






wire NC_FOO = TMODE;






reg RESET_X_R_N;


always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;


wire RESET_D2_R_N = RESET_X_R_N | TMODE;









reg WasWrite_R;
reg miss0;
wire missAll;



assign missAll = miss0;



assign IC_MISS_P = missAll & ~RDOP_N;

reg IC_MISS_R;
always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
IC_MISS_R <= 1'b0;
else
IC_MISS_R <= IC_MISS_P;






reg MyBusy_R;

reg [TAG_INDEX_HI:TAG_INDEX_LO] tagAddrMux;

reg [DATA_INDEX_HI:DATA_INDEX_LO] dataAddrMux;

reg [TAG_INDEX_HI:TAG_INDEX_LO] TagInitCtr_R;





wire CacheOff = DISABLEC;








wire [TAG_MASK_HI:TAG_MASK_LO] TagMask = ICC_TAGMASK;




wire ZeroFirst = MEMZEROFIRST;




wire InterLv = ~MEMSEQUENTIAL;



















reg [`IC_CST_LAST:0] CST_R;
wire [`IC_CST_LAST:0] CST_P;



reg [`IC_IST_LAST:0] IST_R;
reg [`IC_IST_LAST:0] IST_P;












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

wire InvalPending_P = ~CST_R[`IC_CST_INIT] & (~Inval2_R & Inval1_R | InvalPending_R) & ~CacheOff;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
InvalPending_R <= 1'b0;
else
InvalPending_R <= InvalPending_P;




wire otherBusy = | (X_HALT_R & ~`IC_HALT_S_MASK);






wire anyBusy = otherBusy | MyBusy_R;

wire anyAck = |LACK;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
WasWrite_R <= 1'b0;
else

WasWrite_R <= IC_DATA0WE;





wire IC_HALT_S_P = ~CST_P[`IC_CST_LOOKUP] | CST_P[`IC_CST_LOOKUP] & InvalPending_P;
wire IW_GNTRAM_P = EXT_ICREQRAM_R & CST_R[`IC_CST_GNTRAM];

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
IC_HALT_S_R <= { `HALT_DRV_COUNT { 1'b1 } };
MyBusy_R <= 1'b1;
IC_GNTRAM_R <= 1'b0;
end
else
begin
IC_HALT_S_R <= { `HALT_DRV_COUNT { IC_HALT_S_P } };
MyBusy_R <= IC_HALT_S_P;
IC_GNTRAM_R <= IW_GNTRAM_P;
end



reg [31:0] LogAddr_R;




reg Kseg1_R;
reg INIT_D1_R;
reg INIT_D2_R;
reg INIT_D3_R;




always @ (posedge CLK `negedge_RESET_D2_R_N_)
if ( ~`RESET_D2_R_N_)
begin
LogAddr_R <= 32'h0000_0000;
Kseg1_R <= 1'b1;
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

always @ (LogAddr_R) begin

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












reg [31:0] HoldAddr_R;



always @ (posedge CLK `negedge_RESET_D2_R_N_)

if (~`RESET_D2_R_N_)


begin

HoldAddr_R <= 32'd0;

end

else if (CST_R[`IC_CST_LOOKUP] | CST_R[`IC_CST_INIT])

begin

HoldAddr_R <= physAddr;

end













assign IC_TAG0WE = CST_R[`IC_CST_FILL] || IST_R[`IC_IST_WRITE];
assign IC_TAG0WEN = ~CST_R[`IC_CST_FILL] && ~IST_R[`IC_IST_WRITE];

assign IC_TAG0RE = ~CST_R[`IC_CST_FILL] && ~IST_R[`IC_IST_WRITE];
assign IC_TAG0REN = CST_R[`IC_CST_FILL] || IST_R[`IC_IST_WRITE];

assign IC_TAG0CS = 1'b1;
assign IC_TAG0CSN = 1'b0;











assign IC_DATA0WE = CST_R[`IC_CST_FILL];
assign IC_DATA0WEN = ~CST_R[`IC_CST_FILL];

assign IC_DATA0RE = ~CST_R[`IC_CST_FILL];
assign IC_DATA0REN = CST_R[`IC_CST_FILL];

assign IC_DATA0CS = 1'b1;
assign IC_DATA0CSN = 1'b0;



wire [31:0] tagWrMux = IST_R[`IC_IST_WRITE] ? 32'd0 : HoldAddr_R;






always @(tagWrMux or IST_R) begin
IC_TAGWR0[TAG_HI:TAG_LO] = tagWrMux[TAG_HI:TAG_LO];
IC_TAGWR0[TAG_VALID] = ~IST_R[`IC_IST_WRITE];
end
















assign IC_DATAOE = CST_R[`IC_CST_LOOKUP] & ~InvalPending_R;

assign IC_LBCOE = CST_R[`IC_CST_WB] | CST_R[`IC_CST_FILL] | CST_R[`IC_CST_UCWAIT] | CST_R[`IC_CST_INIT];







reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstCounter_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] FirstOffset_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstOffset_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstCounter_P;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] FirstOffset_P;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstOffset_P;

always @(CST_R or physAddr or IS_VAL or BurstCounter_R or FirstOffset_R or BurstOffset_R or ZeroFirst or InterLv) begin
BurstCounter_P = BurstCounter_R;
FirstOffset_P = FirstOffset_R;
BurstOffset_P = BurstOffset_R;
if (CST_R[`IC_CST_LOOKUP]) begin
BurstCounter_P = `LINE_CTR_FIRST;
if (ZeroFirst) begin
FirstOffset_P = `LINE_CTR_FIRST;
BurstOffset_P = `LINE_CTR_FIRST;
end
else begin
FirstOffset_P = physAddr[BEAT_INDEX_HI:BEAT_INDEX_LO];
BurstOffset_P = physAddr[BEAT_INDEX_HI:BEAT_INDEX_LO];
end
end
else if ((CST_R[`IC_CST_FILL] || CST_R[`IC_CST_UCWAIT]) && IS_VAL) begin

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








reg foundDesiredBeat;

always @(HoldAddr_R or BurstOffset_R or IS_VAL or CST_R) begin
foundDesiredBeat = BurstOffset_R == HoldAddr_R[BEAT_INDEX_HI:BEAT_INDEX_LO];
IC_VAL = CST_R[`IC_CST_FILL] & IS_VAL & foundDesiredBeat | CST_R[`IC_CST_UCWAIT] & IS_VAL;
end















wire cacheReady = CST_R[`IC_CST_LOOKUP];

always @ (CST_R or physAddr or HoldAddr_R or BurstOffset_R or NEXTADDR or cacheReady or otherBusy)

if (cacheReady & ~otherBusy)
dataAddrMux = NEXTADDR[DATA_INDEX_HI:DATA_INDEX_LO];
else if (CST_R[`IC_CST_FILL])
begin
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = HoldAddr_R[DATA_INDEX_HI:DATA_INDEX_LO];
dataAddrMux[BEAT_INDEX_HI:BEAT_INDEX_LO] = BurstOffset_R;
end
else
dataAddrMux = physAddr[DATA_INDEX_HI:DATA_INDEX_LO];

always @ (CST_R or IST_R or physAddr or HoldAddr_R or TagInitCtr_R or NEXTADDR or cacheReady or otherBusy)

if (cacheReady & ~otherBusy)
tagAddrMux = NEXTADDR[TAG_INDEX_HI:TAG_INDEX_LO];
else if (CST_R[`IC_CST_WB])
tagAddrMux = physAddr[TAG_INDEX_HI:TAG_INDEX_LO];
else if (CST_R[`IC_CST_FILL])
tagAddrMux = HoldAddr_R[TAG_INDEX_HI:TAG_INDEX_LO];
else if (~IST_R[`IC_IST_WRITE])
tagAddrMux = physAddr[TAG_INDEX_HI:TAG_INDEX_LO];
else
tagAddrMux = TagInitCtr_R[TAG_INDEX_HI:TAG_INDEX_LO];





assign IC_TAGINDEX = tagAddrMux;
assign IC_DATAINDEX = dataAddrMux;










reg [TAG_HI:TAG_LO] compAddr;

always @ (physAddr or TagMask) begin
compAddr[TAG_HI:TAG_LO] = physAddr[TAG_HI:TAG_LO];
compAddr[TAG_MASK_HI:TAG_MASK_LO] = physAddr[TAG_MASK_HI:TAG_MASK_LO] | TagMask;
end

reg doCompare;










lmi_icache_tag ICACHE_TAG0
(
.CMP ( IC_TAG0COMPARE ),


.TAG ( { ICR_TAGRD0[TAG_VALID], ICR_TAGRD0[TAG_HI:TAG_LO] } ),
.ADDR ( { 1'b1, compAddr[TAG_HI:TAG_LO] } )
);



always @ (CST_R or physAddr or RDOP_N or Uncached_M or CacheOff or anyAck or otherBusy or IC_TAG0COMPARE

) begin

doCompare = CST_R[`IC_CST_LOOKUP] & ~RDOP_N & ~anyAck & ~otherBusy;

miss0 = doCompare & (IC_TAG0COMPARE | Uncached_M | CacheOff);


end











always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
CST_R <= `IC_CST_RESET_VECT;
else
CST_R <= CST_P;






  // synopsys translate_off
  // verilint translate off

always @ (posedge CLK)

if (`RESET_D2_R_N_ &&
(CST_R[`IC_CST_INIT]
+CST_R[`IC_CST_GNTRAM]
+CST_R[`IC_CST_LOOKUP]
+CST_R[`IC_CST_WB]
+CST_R[`IC_CST_FILL]
+CST_R[`IC_CST_UCWAIT]) != 1) begin
$display ("ERROR %t %m: CST_R reached invalid state %b", $time, CST_R);
$stop;
end


  // verilint translate on
  // synopsys translate_on

lmi_icache_sm SM
(
.nxtCST ( CST_P ),
.CST ( CST_R ),
.IST ( IST_R ),
.RD_OP_N ( RDOP_N ),
.missAll ( missAll ),
.IS_VAL ( IS_VAL ),
.BurstCounter ( BurstCounter_R ),
.otherBusy ( otherBusy ),
.anyAck ( anyAck ),
.WasWrite ( WasWrite_R ),
.Kseg1 ( Uncached_M | CacheOff ),
.EXT_ICREQRAM_R(EXT_ICREQRAM_R ),
.InvalPending ( InvalPending_R )
);










always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
TagInitCtr_R <= 0;
else if (IST_R[`IC_IST_WRITE])

TagInitCtr_R <= TagInitCtr_R + 1;

else
TagInitCtr_R <= 0;



always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
IST_R <= `IC_IST_RESET_VECT;
else
IST_R <= IST_P;

always @ (IST_R or TagInitCtr_R or CST_R) begin

IST_P = 0;

case (1'b1)

IST_R[`IC_IST_RESET]:
begin
IST_P[`IC_IST_WRITE] = 1'b1;
end

IST_R[`IC_IST_WRITE]:
begin
IST_P[`IC_IST_WRITE] = TagInitCtr_R != TAG_INDEX_ONES;
IST_P[`IC_IST_WAIT] = TagInitCtr_R == TAG_INDEX_ONES;
end

IST_R[`IC_IST_WAIT]:
begin
IST_P[`IC_IST_IDLE] = 1'b1;
end

IST_R[`IC_IST_IDLE]:
begin
IST_P[`IC_IST_IDLE] = ~CST_R[`IC_CST_INIT];
IST_P[`IC_IST_WRITE] = CST_R[`IC_CST_INIT];
end

endcase

end


  // synopsys translate_off
  // verilint translate off

always @ (posedge CLK)

if (`RESET_D2_R_N_ &&
(IST_R[`IC_IST_RESET]
+IST_R[`IC_IST_WRITE]
+IST_R[`IC_IST_WAIT]
+IST_R[`IC_IST_IDLE]) != 1) begin
$display ("ERROR %t %m: IST_R reached invalid state %b", $time, IST_R);
$stop;
end
  // verilint translate on
  // synopsys translate_on



endmodule










