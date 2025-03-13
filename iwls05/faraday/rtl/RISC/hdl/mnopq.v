module lmi_dcache_sm

(
CLK,
nxtBusyState,
nxtCST,
CST,
IST,
RESET_N,
RD_OP,
WR_OP,
miss_o_N,
DS_VAL,
BurstCounter,
otherBusy,
anyAck,
wrPartial,
wrWord,
HoldWrPartial_R,
rdWordReq,
RdPartialReq,
WasWrite,
myBusyRAW,
Uncached_M,
CacheOff,
InvalPending,
MemPartial,
Partial,
EXT_DCREQRAM_R,
EXCP
);

`include "lxr_symbols.vh"
`include "lmi_symbols.vh"

input CLK;
output nxtBusyState;
reg nxtBusyState;
output [`DC_CST_LAST:0] nxtCST;
reg [`DC_CST_LAST:0] nxtCST;
input [`DC_CST_LAST:0] CST;
input [`DC_IST_LAST:0] IST;
input RESET_N;
input RD_OP;
input WR_OP;
input miss_o_N;
input DS_VAL;
input [`LINE_ADDR_HI:2] BurstCounter;
input otherBusy;
input anyAck;
input wrPartial;
input wrWord;
input HoldWrPartial_R;
input rdWordReq;
input RdPartialReq;
input WasWrite;
input myBusyRAW;
input Uncached_M;
input CacheOff;
input InvalPending;
input MemPartial;
input Partial;
input EXT_DCREQRAM_R;
input EXCP;





wire JustWait_P;
reg JustWait_R;

reg missO_R_N;

assign JustWait_P = ~Uncached_M & ~CacheOff & ~EXCP & (wrPartial & CST[`DC_CST_LOOKUP] & ~anyAck & ~otherBusy & (WasWrite | MemPartial) & ~myBusyRAW);

always @ (posedge CLK `negedge_RESET_N_)
if (~RESET_N)
begin
JustWait_R <= 1'b0;
missO_R_N <= 1'b1;
end
else
begin
JustWait_R <= JustWait_P;
missO_R_N <= miss_o_N;
end




always @ (CST or IST or RD_OP or WR_OP or miss_o_N or DS_VAL or BurstCounter or otherBusy or anyAck or wrPartial or wrWord or HoldWrPartial_R or rdWordReq or RdPartialReq or WasWrite or myBusyRAW or Uncached_M or CacheOff or InvalPending or MemPartial or Partial or EXCP or JustWait_R or missO_R_N or EXT_DCREQRAM_R)



begin

nxtCST = `DC_CST_CLEAR_VECT;

case (1'b1)








CST[`DC_CST_INIT]:
begin
nxtCST[`DC_CST_INIT] = ~IST[`DC_IST_WAIT];
nxtCST[`DC_CST_WAIT] = IST[`DC_IST_WAIT];
end




















































CST[`DC_CST_LOOKUP]:
begin

if (miss_o_N)
nxtCST[`DC_CST_LOOKUP] =
~Uncached_M & ~CacheOff & (RD_OP & ~Partial | WR_OP)
| ~InvalPending & ~RD_OP & ~WR_OP & ~EXT_DCREQRAM_R
| anyAck & ~RdPartialReq
| WR_OP & (Uncached_M | CacheOff)
| myBusyRAW
| wrWord
| otherBusy
| EXCP;
else
nxtCST[`DC_CST_LOOKUP] =
~InvalPending & ~RD_OP & ~WR_OP & ~EXT_DCREQRAM_R
| anyAck & ~RdPartialReq
| WR_OP & (Uncached_M | CacheOff)
| myBusyRAW
| wrWord
| otherBusy
| EXCP;

nxtCST[`DC_CST_RPALGN] = RdPartialReq & ~otherBusy & ~anyAck & ~WasWrite & ~EXCP;

nxtCST[`DC_CST_QUIET] = RdPartialReq & ~otherBusy & anyAck & ~WasWrite & ~EXCP;

nxtCST[`DC_CST_MISS] = ~miss_o_N & ~anyAck & ~otherBusy & ~Uncached_M & ~CacheOff & ~EXCP &
( (~WasWrite & (wrPartial & ~MemPartial | rdWordReq))
| ((WasWrite | MemPartial) & wrPartial & ~myBusyRAW)
);

nxtCST[`DC_CST_UCPROBE] = rdWordReq & ~otherBusy & ~anyAck & ~WasWrite & (Uncached_M | CacheOff) & ~EXCP;

nxtCST[`DC_CST_INIT] = InvalPending & ~RD_OP & ~WR_OP & ~otherBusy & ~EXCP;

nxtCST[`DC_CST_GNTRAM] = EXT_DCREQRAM_R & ~RD_OP & ~WR_OP & ~myBusyRAW & ~otherBusy & ~EXCP & ~InvalPending;

end








CST[`DC_CST_MISS]:
begin
nxtCST[`DC_CST_LOOKUP] = JustWait_R;
nxtCST[`DC_CST_FILL] = ~JustWait_R & ~HoldWrPartial_R;
nxtCST[`DC_CST_WPFILL] = ~JustWait_R & HoldWrPartial_R;
end











CST[`DC_CST_FILL]:
begin
nxtCST[`DC_CST_FILL] = ~DS_VAL | (BurstCounter != `LINE_CTR_LAST);
nxtCST[`DC_CST_WAIT] = DS_VAL & (BurstCounter == `LINE_CTR_LAST);
end













CST[`DC_CST_WPFILL]:
begin
nxtCST[`DC_CST_WPFILL] = ~DS_VAL | (BurstCounter != `LINE_CTR_LAST);
nxtCST[`DC_CST_WPWB] = DS_VAL & (BurstCounter == `LINE_CTR_LAST);
end









CST[`DC_CST_WPWB]:
begin
nxtCST[`DC_CST_WPDATA] = 1'b1;
end









CST[`DC_CST_WPDATA]:
begin
nxtCST[`DC_CST_LOOKUP] = 1'b1;
end














CST[`DC_CST_RPFILL]:
begin
nxtCST[`DC_CST_RPFILL] = ~DS_VAL | (BurstCounter != `LINE_CTR_LAST);
nxtCST[`DC_CST_RPWB] = DS_VAL & (BurstCounter == `LINE_CTR_LAST);
end





















CST[`DC_CST_RPALGN]:
begin
nxtCST[`DC_CST_RPALGN] = otherBusy;
nxtCST[`DC_CST_UCPROBE] = ~otherBusy & (CacheOff | Uncached_M);
nxtCST[`DC_CST_LOOKUP] = ~otherBusy & ~(CacheOff | Uncached_M) & missO_R_N;
nxtCST[`DC_CST_RPFILL] = ~otherBusy & ~(CacheOff | Uncached_M) & ~missO_R_N;
end









CST[`DC_CST_RPWB]:
begin
nxtCST[`DC_CST_RPDATA] = 1'b1;
end









CST[`DC_CST_RPDATA]:
begin
nxtCST[`DC_CST_RPDVAL] = 1'b1;
end





CST[`DC_CST_RPDVAL]:
begin
nxtCST[`DC_CST_LOOKUP] = 1'b1;
end









CST[`DC_CST_UCPROBE]:
begin
nxtCST[`DC_CST_UCWAIT] = 1'b1;
end









CST[`DC_CST_UCWAIT]:
begin
nxtCST[`DC_CST_UCWAIT] = ~DS_VAL;
nxtCST[`DC_CST_LOOKUP] = DS_VAL;
end










CST[`DC_CST_QUIET]:
begin
nxtCST[`DC_CST_QUIET] = otherBusy;
nxtCST[`DC_CST_LOOKUP] = ~otherBusy;
end







CST[`DC_CST_WAIT]:
nxtCST[`DC_CST_LOOKUP] = 1'b1;












CST[`DC_CST_GNTRAM]:
begin
nxtCST[`DC_CST_WAIT] = ~EXT_DCREQRAM_R;
nxtCST[`DC_CST_GNTRAM] = EXT_DCREQRAM_R;
end

endcase



nxtBusyState =
~ ( nxtCST[`DC_CST_LOOKUP]
| nxtCST[`DC_CST_RPALGN]
| nxtCST[`DC_CST_QUIET]
);

end


endmodule
