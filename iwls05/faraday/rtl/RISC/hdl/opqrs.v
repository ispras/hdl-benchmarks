module lmi_dcache






















(
CLK, TMODE, RESET_D1_R_N, DISABLEC, INVALIDATE,

MEMSEQUENTIAL, MEMZEROFIRST, MEMFULLWORD,

EXT_DCREQRAM_R, DC_GNTRAM_R,

DATAIN, DC_DATAOUT, DC_DATAOE, DC_LBCOE, DC_USEPROCIN,

NEXTADDR, NEXTRDOP, NEXTWROP, NEXTBE, NEXTSX, DWORD_E, DS_VAL, DC_VAL, LACK,

EXCP,

X_HALT_R,

DC_MISS_P, DC_MISS_R, DC_BAREMISS_R, DC_HALT_W_R, DC_HALT_M_R,

DC_RPQUIETIFNBA, DC_RPQUIETIFB, DC_RPALGNIFNBNA, DC_RPALGNIFB,



DC_TAGINDEX, DCR_TAGRD, DC_TAGWR, DCC_TAGMASK,
DC_TAGWE, DC_TAGWEN, DC_TAGRE, DC_TAGREN, DC_TAGCS, DC_TAGCSN,

DC_DATAINDEX, DCR_DATARD, DC_DATAWR,
DC_DATAWE, DC_DATAWEN, DC_DATARE, DC_DATAREN, DC_DATACS, DC_DATACSN,



DC_CSTWBUS

);

`include "lxr_symbols.vh"
`include "lmi_symbols.vh"






































parameter TAG_INDEX_HI = `DC_ADDR_HI;
parameter TAG_INDEX_LO = `LINE_ADDR_HI+1;
parameter TAG_INDEX_ONES = {(`DC_ADDR_HI-`LINE_ADDR_HI){1'b1}};
parameter BEAT_INDEX_HI = `LINE_ADDR_HI;
parameter BEAT_INDEX_LO = 2;
parameter DATA_INDEX_HI = `DC_ADDR_HI;
parameter DATA_INDEX_LO = 2;
parameter TAG_HI = 31;
parameter TAG_LO = `DC_ADDR_HI+1-`DC_TAG_EXTRA_SIZE;
parameter TAG_STATE_HI = 32;
parameter TAG_STATE_LO = `DC_ADDR_HI+1-`DC_TAG_EXTRA_SIZE;
parameter TAG_VALID = 32;
parameter TAG_MASK_HI = `DC_ADDR_HI;
parameter TAG_MASK_LO = `DC_ADDR_HI+1-`DC_TAG_EXTRA_SIZE;





















input CLK;
input TMODE;
input RESET_D1_R_N;
input DISABLEC;
input INVALIDATE;
input MEMSEQUENTIAL;
input MEMZEROFIRST;
input MEMFULLWORD;

input EXT_DCREQRAM_R;
output DC_GNTRAM_R;
reg DC_GNTRAM_R;

input [31:0] DATAIN;
output [31:0] DC_DATAOUT;
output DC_DATAOE;
output DC_LBCOE;
output DC_USEPROCIN;

input [31:0] NEXTADDR;
input NEXTRDOP;
input NEXTWROP;
input [3:0] NEXTBE;
input NEXTSX;
input DWORD_E;
input EXCP;
input DS_VAL;
output DC_VAL;
reg DC_VAL;
input [1:0] LACK;

output DC_MISS_P;
output DC_MISS_R;
output DC_BAREMISS_R;
output [`HALT_DRV_RANGE] DC_HALT_W_R;
reg [`HALT_DRV_RANGE] DC_HALT_W_R;
output [`HALT_DRV_RANGE] DC_HALT_M_R;
reg [`HALT_DRV_RANGE] DC_HALT_M_R;

input [`HALT_SIG_RANGE] X_HALT_R;

output DC_CSTWBUS;
output DC_RPQUIETIFNBA;
output DC_RPQUIETIFB;
output DC_RPALGNIFNBNA;
output DC_RPALGNIFB;






output [TAG_INDEX_HI:TAG_INDEX_LO] DC_TAGINDEX;
input [TAG_STATE_HI:TAG_STATE_LO] DCR_TAGRD;






output [TAG_STATE_HI:TAG_STATE_LO] DC_TAGWR;
reg [TAG_STATE_HI:TAG_STATE_LO] DC_TAGWR;
output DC_TAGWE;
output DC_TAGWEN;
output DC_TAGRE;
output DC_TAGREN;
output DC_TAGCS;
output DC_TAGCSN;
input [TAG_MASK_HI:TAG_MASK_LO] DCC_TAGMASK;


output [DATA_INDEX_HI:DATA_INDEX_LO] DC_DATAINDEX;
input [31:0] DCR_DATARD;
output [31:0] DC_DATAWR;
output DC_DATAWE;
output DC_DATAWEN;
output DC_DATARE;
output DC_DATAREN;
output DC_DATACS;
output DC_DATACSN;





reg RESET_X_R_N;


always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;


wire RESET_D2_R_N = RESET_X_R_N | TMODE;





wire NC_FOO = TMODE;

























































































reg [31:0] tagAddrMux;

reg [DATA_INDEX_HI:DATA_INDEX_LO] dataAddrMux;

reg [TAG_INDEX_HI:TAG_INDEX_LO] TagInitCtr_R;



reg [31:0] Addr_W_R;
reg [3:0] BE_R;
reg DWORD_M_R;
reg RDOP_R;
reg WROP_R;
reg SX_R;

reg MyBusy_R;
reg BusyRAW_R;

reg Partial_R;

reg WasWrite_P;
reg WasWrite_R;




wire missO;
wire miss_W_P_N;
reg miss_W_R_N;

assign DC_MISS_P = missO & (~WROP_R & ~(RDOP_R & WasWrite_R) & ~EXCP);

reg DC_MISS_R;
always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
DC_MISS_R <= 1'b0;
else
DC_MISS_R <= DC_MISS_P;

reg DC_BAREMISS_R;
always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
DC_BAREMISS_R <= 1'b0;
else
DC_BAREMISS_R <= missO;











wire CacheOff = DISABLEC;




wire ZeroFirst = MEMZEROFIRST;




wire InterLv = ~MEMSEQUENTIAL;






wire MemPartial = ~MEMFULLWORD;









wire [TAG_MASK_HI:TAG_MASK_LO] TagMask;

assign TagMask = DCC_TAGMASK;



















reg [`DC_CST_LAST:0] CST_R;
wire [`DC_CST_LAST:0] CST_P;


reg [`DC_IST_LAST:0] IST_R;
reg [`DC_IST_LAST:0] IST_P;





wire WIP_P;
reg WIP_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
WIP_R <= 1'b0;
else
WIP_R <= WIP_P;







wire cacheReady = (CST_R[`DC_CST_LOOKUP]|CST_R[`DC_CST_RPALGN]|CST_R[`DC_CST_RPDVAL]|CST_R[`DC_CST_QUIET]|CST_R[`DC_CST_UCWAIT]);










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

wire InvalPending_P = ~CST_R[`DC_CST_INIT] & (~Inval2_R & Inval1_R | InvalPending_R) & ~CacheOff;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
InvalPending_R <= 1'b0;
else
InvalPending_R <= InvalPending_P;




wire otherBusy = | (X_HALT_R & ~`DC_HALT_M_MASK & ~`DC_HALT_W_MASK & ~`RALU_HALT_E_MASK);






wire anyBusy = otherBusy | MyBusy_R;



wire anyAck = |LACK;







reg WrPartialReq_P;
reg RdPartialReq_P;
reg WrPartialReq_R;
reg WrWordReq_R;
reg RdPartialReq_R;





wire wrOp = CST_R[`DC_CST_LOOKUP] & WROP_R & ~otherBusy & ~anyAck;

wire wrPartial = wrOp & ~DWORD_M_R;
wire wrWord = wrOp & DWORD_M_R;

wire wrPartialHit;
wire wrWordHit;

wire wrPartialReq = WROP_R & ~DWORD_M_R;
wire rdWordReq = RDOP_R & DWORD_M_R;



wire dataRamWEHit;
wire dataRamWE;
wire dataRamRE;

always @ (dataRamWE or WrWordReq_R or anyAck)
WasWrite_P = dataRamWE | WrWordReq_R & ~anyAck;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
WasWrite_R <= 1'b0;
else
WasWrite_R <= WasWrite_P;



wire UCInval = CST_R[`DC_CST_UCPROBE] & miss_W_R_N;





wire tagRamWE = CST_R[`DC_CST_FILL] & DS_VAL | CST_R[`DC_CST_RPFILL] & DS_VAL | CST_R[`DC_CST_WPFILL] & DS_VAL | IST_R[`DC_IST_WRITE] | UCInval;

assign DC_TAGWE = tagRamWE;
assign DC_TAGWEN = ~tagRamWE;

wire tagRamRE = CST_R[`DC_CST_LOOKUP] & NEXTRDOP
| CST_R[`DC_CST_LOOKUP] & NEXTWROP
| CST_R[`DC_CST_LOOKUP] & RDOP_R
| CST_R[`DC_CST_LOOKUP] & WROP_R
| CST_R[`DC_CST_WPWB]
| CST_R[`DC_CST_WPDATA]
| CST_R[`DC_CST_UCWAIT]
| CST_R[`DC_CST_WAIT]
| CST_R[`DC_CST_MISS]
| CST_R[`DC_CST_RPDVAL]
| CST_R[`DC_CST_RPALGN]
| CST_R[`DC_CST_QUIET]
| BusyRAW_R;

assign DC_TAGRE = tagRamRE;
assign DC_TAGREN = ~tagRamRE;

assign DC_TAGCS = tagRamWE | tagRamRE;
assign DC_TAGCSN = ~tagRamWE & ~tagRamRE;






always @ (tagAddrMux or IST_R or UCInval)
begin
DC_TAGWR[TAG_HI:TAG_LO] = tagAddrMux[TAG_HI:TAG_LO];
DC_TAGWR[TAG_VALID] = ~(IST_R[`DC_IST_WRITE] | UCInval);
end



assign dataRamWEHit = wrWordHit & ~EXCP | wrPartialHit & ~WasWrite_R & ~EXCP;
assign dataRamWE = (CST_R[`DC_CST_FILL] | CST_R[`DC_CST_RPFILL] | CST_R[`DC_CST_WPFILL]) & DS_VAL
| dataRamWEHit;

assign DC_DATAWE = dataRamWE;
assign DC_DATAWEN = ~dataRamWE;

assign dataRamRE = CST_R[`DC_CST_LOOKUP] & (NEXTRDOP | NEXTWROP | RDOP_R | WROP_R) & ~dataRamWEHit
| CST_R[`DC_CST_WPWB]
| CST_R[`DC_CST_RPWB]
| CST_R[`DC_CST_WPDATA]
| CST_R[`DC_CST_UCPROBE]
| CST_R[`DC_CST_UCWAIT]
| CST_R[`DC_CST_WAIT]
| CST_R[`DC_CST_MISS]
| CST_R[`DC_CST_RPDVAL]
| CST_R[`DC_CST_RPALGN]
| CST_R[`DC_CST_QUIET]
| BusyRAW_R & ~dataRamWEHit;

assign DC_DATARE = dataRamRE;
assign DC_DATAREN = ~dataRamRE;

assign DC_DATACS = dataRamRE | dataRamWE;
assign DC_DATACSN = ~dataRamRE & ~dataRamWE;



  // synopsys translate_off
  // verilint translate off


always @ (posedge CLK `negedge_RESET_D2_R_N_)
if ( dataRamWE && EXCP && CST_R[`DC_CST_LOOKUP] && `RESET_D2_R_N_)
begin
$display ("ERROR %t %m: wrote data cache data store during exception", $time);
$stop;
end









  // verilint translate on
  // synopsys translate_on





reg WrPartialHit_W_P;
reg PartialHit_W_R;

wire myBusyRAW = (RDOP_R | WROP_R & ~DWORD_M_R) & WasWrite_R & CST_R[`DC_CST_LOOKUP];



reg WROP_P;
reg RDOP_P;
reg DWORD_M_P;

reg Kseg1_R;

reg Kseg1_P;

reg Kseg2UC;

wire Uncached_M = Kseg1_R | Kseg2UC;

wire BusyState_P;

reg BusyRAW_P;

reg DC_HALT_W_P;
reg DC_HALT_M_P;

reg [31:0] dataWr;

wire wrMerge;

wire wrMergeHit;




always @ (RDOP_P or WrPartialReq_P or CST_P or WIP_P or WrPartialHit_W_P or MemPartial or WasWrite_P or cacheReady)
if (CST_P[`DC_CST_LOOKUP]&WIP_P)
BusyRAW_P = (RDOP_P|WrPartialReq_P|WrPartialHit_W_P&~MemPartial) & WasWrite_P & cacheReady;
else
BusyRAW_P = (RDOP_P|WrPartialReq_P) & WasWrite_P & cacheReady;

always @ (CST_P or WIP_P or RdPartialReq_P or BusyState_P or BusyRAW_P or CST_P or WIP_P or EXCP or otherBusy or WROP_P or RDOP_P or InvalPending_P)

begin
DC_HALT_M_P = BusyRAW_P | CST_P[`DC_CST_LOOKUP] & ~WIP_P & RdPartialReq_P;
DC_HALT_W_P = BusyState_P | CST_P[`DC_CST_LOOKUP] & InvalPending_P & ~RDOP_P & ~WROP_P & ~EXCP & ~otherBusy;
end


always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
MyBusy_R <= 1'b0;
DC_HALT_M_R <= { `HALT_DRV_COUNT { 1'b0} };
DC_HALT_W_R <= { `HALT_DRV_COUNT { 1'b0} };
BusyRAW_R <= 1'b0;
end
else
begin
MyBusy_R <= DC_HALT_M_P | DC_HALT_W_P;
DC_HALT_M_R <= { `HALT_DRV_COUNT { DC_HALT_M_P } };
DC_HALT_W_R <= { `HALT_DRV_COUNT { DC_HALT_W_P } };
BusyRAW_R <= BusyRAW_P;
end

reg [31:0] LogAddr_P;
reg [31:0] LogAddr_R;
reg [3:0] BE_P;
reg SX_P;
reg Partial_P;
reg WrWordReq_P;




always @ (anyBusy or LogAddr_R or NEXTADDR or BE_R or NEXTBE or RDOP_R or NEXTRDOP or WROP_R or NEXTWROP or SX_R or NEXTSX or Partial_R or Kseg1_R or NEXTADDR or WrWordReq_R or WrPartialReq_R or RdPartialReq_R or EXCP or DWORD_M_R or DWORD_E)
if (anyBusy)
begin
LogAddr_P = LogAddr_R;
BE_P = BE_R;
DWORD_M_P = DWORD_M_R;
RDOP_P = RDOP_R & ~EXCP;
WROP_P = WROP_R & ~EXCP;
SX_P = SX_R;
Partial_P = Partial_R;
Kseg1_P = Kseg1_R;
WrWordReq_P = WrWordReq_R;
WrPartialReq_P = WrPartialReq_R & ~EXCP;
RdPartialReq_P = RdPartialReq_R & ~EXCP;
end
else
begin
LogAddr_P = NEXTADDR;
BE_P = NEXTBE;
DWORD_M_P = DWORD_E;
RDOP_P = NEXTRDOP & ~EXCP;
WROP_P = NEXTWROP & ~EXCP;
SX_P = NEXTSX;
Partial_P = ~DWORD_E;
Kseg1_P = NEXTADDR[31] & ~NEXTADDR[30] & NEXTADDR[29];
WrWordReq_P = NEXTWROP & DWORD_E & ~EXCP;
WrPartialReq_P = NEXTWROP & ~DWORD_E & ~EXCP;
RdPartialReq_P = NEXTRDOP & ~DWORD_E & ~EXCP;
end

wire DC_GNTRAM_P = EXT_DCREQRAM_R & CST_R[`DC_CST_GNTRAM];

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
LogAddr_R <= 32'd0;
BE_R <= 4'b1111;
DWORD_M_R <= 1'b0;
RDOP_R <= 1'b0;
WROP_R <= 1'b0;
SX_R <= 1'b0;
Partial_R <= 1'b0;
Kseg1_R <= 1'b0;
WrWordReq_R <= 1'b0;
WrPartialReq_R <= 1'b0;
RdPartialReq_R <= 1'b0;
DC_GNTRAM_R <= 1'b0;
end
else
begin
LogAddr_R <= LogAddr_P;
BE_R <= BE_P;
DWORD_M_R <= DWORD_M_P;
RDOP_R <= RDOP_P;
WROP_R <= WROP_P;
SX_R <= SX_P;
Partial_R <= Partial_P;
Kseg1_R <= Kseg1_P;
WrWordReq_R <= WrWordReq_P;
WrPartialReq_R <= WrPartialReq_P;
RdPartialReq_R <= RdPartialReq_P;
DC_GNTRAM_R <= DC_GNTRAM_P;
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

Kseg2UC = LogAddr_R[`KSEG2_UC_BITS] == `KSEG2_UC_VALUE;

end












reg [3:0] BE_W_R;
reg SX_W_R;
reg [31:0] DataIn_W_R;
reg Miss_W_R;
reg WrPartial_W_R;








reg [31:0] DataRd_R;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
DataRd_R <= 32'd0;
else
DataRd_R <= wrMerge ? dataWr : DCR_DATARD;



always @ (posedge CLK `negedge_RESET_D2_R_N_)

if (~`RESET_D2_R_N_)
begin
Addr_W_R <= 32'd0;
BE_W_R <= 4'b1111;
SX_W_R <= 1'b0;
Miss_W_R <= 1'b0;
WrPartial_W_R <= 1'b0;
end

else if (CST_R[`DC_CST_LOOKUP]&&~WIP_R||CST_R[`DC_CST_INIT])



begin
Addr_W_R <= physAddr;
BE_W_R <= BE_R;
SX_W_R <= SX_R;
Miss_W_R <= missO;
WrPartial_W_R <= wrPartial;
end


always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
DataIn_W_R <= 32'h00000000;
else if (CST_R[`DC_CST_LOOKUP]&&~WIP_R||CST_R[`DC_CST_INIT])
DataIn_W_R <= DATAIN;

always @ (CST_R or wrPartial or missO or WrPartial_W_R or Miss_W_R)
if (missO)
WrPartialHit_W_P = ~(CST_R[`DC_CST_LOOKUP]|CST_R[`DC_CST_INIT]) & WrPartial_W_R & ~Miss_W_R;
else
WrPartialHit_W_P = ~(CST_R[`DC_CST_LOOKUP]|CST_R[`DC_CST_INIT]) & WrPartial_W_R & ~Miss_W_R
| (CST_R[`DC_CST_LOOKUP]|CST_R[`DC_CST_INIT]) & wrPartial;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
PartialHit_W_R <= 1'b0;
else
PartialHit_W_R <= WrPartialHit_W_P;





assign wrMerge = CST_R[`DC_CST_LOOKUP] & ~WIP_R & wrPartialReq;



assign wrMergeHit = PartialHit_W_R & CST_R[`DC_CST_LOOKUP] & WIP_R & ~MemPartial;
















assign DC_DATAOE = ((CST_R[`DC_CST_LOOKUP] & ~WIP_R & RDOP_R) | wrMergeHit | CST_R[`DC_CST_RPDATA] | CST_R[`DC_CST_WPDATA] | CST_R[`DC_CST_RPALGN] | CST_R[`DC_CST_RPDVAL]);

assign DC_LBCOE =
CST_R[`DC_CST_INIT]
| CST_R[`DC_CST_FILL]
| CST_R[`DC_CST_WPFILL]
| CST_R[`DC_CST_WPWB]
| CST_R[`DC_CST_RPFILL]
| CST_R[`DC_CST_RPWB]
| CST_R[`DC_CST_UCPROBE]
| CST_R[`DC_CST_UCWAIT];





assign DC_CSTWBUS = wrMergeHit | WrPartial_W_R & CST_R[`DC_CST_WPDATA];







assign DC_USEPROCIN = CST_R[`DC_CST_LOOKUP] | CST_R[`DC_CST_WPWB] | CST_R[`DC_CST_RPWB];









wire [31:0] alignOut;

lmi_align LMI_ALIGN1 (.SX(SX_W_R), .BE(BE_W_R), .DI(DataRd_R), .DO(alignOut));



wire [31:0] dataRdMergeAlign = (wrMergeHit ? DataRd_R : alignOut);



assign DC_DATAOUT = (~CST_R[`DC_CST_RPALGN]&~CST_R[`DC_CST_RPDVAL]&~wrMergeHit) ? DCR_DATARD : dataRdMergeAlign;









reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstCounter_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] FirstOffset_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstOffset_R;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstCounter_P;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] FirstOffset_P;
reg [BEAT_INDEX_HI:BEAT_INDEX_LO] BurstOffset_P;

always @ (CST_R or physAddr or DS_VAL or BurstCounter_R or FirstOffset_R or BurstOffset_R or Addr_W_R or InterLv or ZeroFirst or WIP_R)
begin
BurstCounter_P = BurstCounter_R;
FirstOffset_P = FirstOffset_R;
BurstOffset_P = BurstOffset_R;
if (CST_R[`DC_CST_LOOKUP]&&~WIP_R)
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
else if ((CST_R[`DC_CST_FILL] | CST_R[`DC_CST_RPFILL] | CST_R[`DC_CST_WPFILL] | CST_R[`DC_CST_UCWAIT]) & DS_VAL)
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







reg foundDesiredBeat;

always @ (Addr_W_R or BurstOffset_R or DS_VAL or CST_R)
begin
foundDesiredBeat = (BurstOffset_R == Addr_W_R[BEAT_INDEX_HI:BEAT_INDEX_LO]);
DC_VAL = (foundDesiredBeat & DS_VAL & CST_R[`DC_CST_FILL]) | (DS_VAL & CST_R[`DC_CST_UCWAIT]) | CST_R[`DC_CST_RPDVAL] | CST_R[`DC_CST_WPDATA];
end















always @ (wrMerge or BE_W_R or DataIn_W_R or DataRd_R or CST_R or DATAIN or BE_R or DCR_DATARD or foundDesiredBeat)
begin




dataWr = DATAIN;





if (wrMerge & ~BE_R[3])
dataWr[31:24] = DCR_DATARD[31:24];



if (CST_R[`DC_CST_WPFILL] & BE_W_R[3] & foundDesiredBeat)
dataWr[31:24] = DataIn_W_R[31:24];





if (wrMerge & ~BE_R[2])
dataWr[23:16] = DCR_DATARD[23:16];



if (CST_R[`DC_CST_WPFILL] & BE_W_R[2] & foundDesiredBeat)
dataWr[23:16] = DataIn_W_R[23:16];





if (wrMerge & ~BE_R[1])
dataWr[15: 8] = DCR_DATARD[15: 8];



if (CST_R[`DC_CST_WPFILL] & BE_W_R[1] & foundDesiredBeat)
dataWr[15: 8] = DataIn_W_R[15: 8];





if (wrMerge & ~BE_R[0])
dataWr[ 7: 0] = DCR_DATARD[ 7: 0];



if (CST_R[`DC_CST_WPFILL] & BE_W_R[0] & foundDesiredBeat)
dataWr[ 7: 0] = DataIn_W_R[ 7: 0];

end

assign DC_DATAWR = dataWr;














always @ (CST_R or physAddr or Addr_W_R or BurstOffset_R or NEXTADDR or cacheReady or WROP_R or anyBusy or Uncached_M or CacheOff)

if (cacheReady & (~WROP_R | Uncached_M | CacheOff) & ~anyBusy)
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = NEXTADDR[DATA_INDEX_HI:DATA_INDEX_LO];
else if (CST_R[`DC_CST_WPWB]||CST_R[`DC_CST_RPWB]||CST_R[`DC_CST_RPDATA])
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = Addr_W_R[DATA_INDEX_HI:DATA_INDEX_LO];
else if (CST_R[`DC_CST_FILL]|CST_R[`DC_CST_RPFILL]|CST_R[`DC_CST_WPFILL]|CST_R[`DC_CST_RPWB])
begin
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = Addr_W_R[DATA_INDEX_HI:DATA_INDEX_LO];
dataAddrMux[BEAT_INDEX_HI:BEAT_INDEX_LO] = BurstOffset_R;
end
else
dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO] = physAddr[DATA_INDEX_HI:DATA_INDEX_LO];


































wire tamFirstCycle =

( CST_R[`DC_CST_LOOKUP] & ~WIP_R & ~RdPartialReq_R
| CST_R[`DC_CST_LOOKUP] & WIP_R & ~RDOP_R
| CST_R[`DC_CST_RPALGN]
| CST_R[`DC_CST_QUIET] )
& ~otherBusy
& ~BusyRAW_R
& ~IST_R[`DC_IST_WRITE];



wire tamMiddleCycle =
CST_R[`DC_CST_FILL]
| CST_R[`DC_CST_UCPROBE]
| CST_R[`DC_CST_WPFILL]
| CST_R[`DC_CST_WPWB]
| CST_R[`DC_CST_RPFILL]
| CST_R[`DC_CST_RPWB]
| CST_R[`DC_CST_RPDATA];







wire tamLastCycle =
( CST_R[`DC_CST_INIT]
| CST_R[`DC_CST_LOOKUP] & ~WIP_R & RdPartialReq_R
| CST_R[`DC_CST_LOOKUP] & WIP_R & RDOP_R
| CST_R[`DC_CST_LOOKUP] & otherBusy
| CST_R[`DC_CST_WPDATA]
| CST_R[`DC_CST_UCWAIT]
| CST_R[`DC_CST_WAIT]
| CST_R[`DC_CST_MISS]
| CST_R[`DC_CST_RPDVAL]
| BusyRAW_R )
& ~IST_R[`DC_IST_WRITE];


wire tamInitCycle = IST_R[`DC_IST_WRITE];













  // synopsys translate_off
  // verilint translate off



always @ (posedge CLK `negedge_RESET_D2_R_N_)
if ( `RESET_D2_R_N_
& (
(
(tamFirstCycle
+(tamMiddleCycle & ~BusyRAW_R & ~IST_R[`DC_IST_WRITE])
+tamLastCycle
+tamInitCycle
+CST_R[`DC_CST_GNTRAM]
)
| otherBusy
)
!=1
)
)
begin
$display ("ERROR %t %m: tag_addr_mux failed to select an address", $time);
$stop;
end

  // verilint translate on
  // synopsys translate_on





always @ (physAddr or Addr_W_R or TagInitCtr_R or NEXTADDR or tamFirstCycle or tamMiddleCycle or tamInitCycle)

begin
if (tamFirstCycle)
begin
tagAddrMux = 32'hxxxxxxxx;
tagAddrMux[TAG_INDEX_HI:TAG_INDEX_LO] = NEXTADDR[TAG_INDEX_HI:TAG_INDEX_LO];
end
else if (tamMiddleCycle)
tagAddrMux = Addr_W_R;
else if (tamInitCycle)
begin
tagAddrMux = 0;
tagAddrMux[TAG_INDEX_HI:TAG_INDEX_LO] = TagInitCtr_R;
end
else
tagAddrMux = physAddr;
end




assign DC_TAGINDEX = tagAddrMux[TAG_INDEX_HI:TAG_INDEX_LO];
assign DC_DATAINDEX = dataAddrMux[DATA_INDEX_HI:DATA_INDEX_LO];












wire doCompare = ( CST_R[`DC_CST_LOOKUP] & ~WIP_R & ~RdPartialReq_R
| CST_R[`DC_CST_LOOKUP] & WIP_R
| CST_R[`DC_CST_LOOKUP] & (Uncached_M | CacheOff) & ~RdPartialReq_R
| CST_R[`DC_CST_RPALGN]
)
& (RDOP_R | WROP_R)
& ~anyAck
& ~otherBusy;

always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
miss_W_R_N <= 1'b0;
else
miss_W_R_N <= miss_W_P_N;




reg [TAG_HI:TAG_LO] compAddr;

always @ (physAddr or TagMask)
begin
compAddr[TAG_HI:TAG_LO] = physAddr[TAG_HI:TAG_LO];
compAddr[TAG_MASK_HI:TAG_MASK_LO] = physAddr[TAG_MASK_HI:TAG_MASK_LO] | TagMask;
end

lmi_dcache_tag DCACHE_TAG
(
.EN ( doCompare ),
.KSEG1 ( Uncached_M | CacheOff ),
.VAL ( DCR_TAGRD[TAG_VALID] ),
.TAG ( DCR_TAGRD[TAG_HI:TAG_LO] ),
.ADDR ( compAddr[TAG_HI:TAG_LO] ),

.wrWord ( wrWord ),
.wrPartial ( wrPartial ),

.CMP ( missO ),
.RCMP_N ( miss_W_P_N ),

.wrPartialHit ( wrPartialHit ),
.wrWordHit ( wrWordHit )
);






assign WIP_P = ~missO & (CST_R[`DC_CST_LOOKUP] & wrOp & ~myBusyRAW & ~Uncached_M & ~CacheOff & ~EXCP)
| WIP_R & wrWordHit & ~EXCP;












always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
CST_R <= `DC_CST_RESET_VECT;
else
CST_R <= CST_P;





  // synopsys translate_off
  // verilint translate off



integer state_ix;

integer state_sum;

always @ (posedge CLK)

if (`RESET_D2_R_N_)
begin
state_sum = 0;
for (state_ix = 0; state_ix <= `DC_CST_LAST; state_ix = state_ix+1)
state_sum = state_sum + CST_R[state_ix];
if (state_sum != 1)
begin
$display ("ERROR %t %m: CST reached invalid state %b", $time, CST_R);
$stop;
end
end


  // verilint translate on
  // synopsys translate_on




assign DC_RPQUIETIFNBA = CST_R[`DC_CST_LOOKUP] & ~WIP_R & RdPartialReq_R & ~WasWrite_R;
assign DC_RPQUIETIFB = CST_R[`DC_CST_QUIET];
assign DC_RPALGNIFNBNA = CST_R[`DC_CST_LOOKUP] & ~WIP_R & RdPartialReq_R & ~WasWrite_R;
assign DC_RPALGNIFB = CST_R[`DC_CST_RPALGN];


lmi_dcache_sm SM
(
.CLK ( CLK ),
.nxtBusyState ( BusyState_P ),
.nxtCST ( CST_P ),
.CST ( CST_R ),
.IST ( IST_R ),
.RESET_N ( `RESET_D2_R_N_ ),
.RD_OP ( RDOP_R ),
.WR_OP ( WROP_R ),
.miss_o_N ( miss_W_P_N ),
.DS_VAL ( DS_VAL ),
.BurstCounter ( BurstCounter_R ),
.otherBusy ( otherBusy ),
.anyAck ( anyAck ),
.wrPartial ( WROP_R & ~DWORD_M_R ),
.wrWord ( wrWord ),
.HoldWrPartial_R ( WrPartial_W_R ),
.rdWordReq ( rdWordReq ),
.RdPartialReq ( RdPartialReq_R ),
.WasWrite ( WasWrite_R ),
.myBusyRAW ( myBusyRAW ),
.Uncached_M ( Uncached_M ),
.CacheOff ( CacheOff ),
.InvalPending ( InvalPending_R ),
.MemPartial ( MemPartial ),
.Partial ( Partial_R ),
.EXT_DCREQRAM_R( EXT_DCREQRAM_R ),
.EXCP ( EXCP )
);













always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
TagInitCtr_R <= 0;
else
if (IST_R[`DC_IST_WRITE])

TagInitCtr_R <= TagInitCtr_R + 1;

else
TagInitCtr_R <= 0;




wire InitCtrEqOnes;


assign InitCtrEqOnes = TagInitCtr_R == TAG_INDEX_ONES;




always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
IST_R <= `DC_IST_RESET_VECT;
else
IST_R <= IST_P;

always @ (IST_R or InitCtrEqOnes or CST_R)
begin

IST_P = `DC_IST_CLEAR_VECT;

case (1'b1)

IST_R[`DC_IST_RESET]:
begin
IST_P[`DC_IST_WRITE] = 1'b1;
end

IST_R[`DC_IST_WRITE]:
begin
IST_P[`DC_IST_WRITE] = ~InitCtrEqOnes;
IST_P[`DC_IST_WAIT] = InitCtrEqOnes;
end

IST_R[`DC_IST_WAIT]:
begin
IST_P[`DC_IST_IDLE] = 1'b1;
end

IST_R[`DC_IST_IDLE]:
begin
IST_P[`DC_IST_IDLE] = ~CST_R[`DC_CST_INIT];
IST_P[`DC_IST_WRITE] = CST_R[`DC_CST_INIT];
end

endcase

end


  // synopsys translate_off
  // verilint translate off

always @ (posedge CLK)
if (`RESET_D2_R_N_ &&
(IST_R[`DC_IST_RESET]
+IST_R[`DC_IST_WRITE]
+IST_R[`DC_IST_WAIT]
+IST_R[`DC_IST_IDLE]) != 1)
begin
$display ("ERROR %t %m: IST reached invalid state %b", $time, IST_R);
$stop;
end

  // verilint translate on
  // synopsys translate_on



endmodule










