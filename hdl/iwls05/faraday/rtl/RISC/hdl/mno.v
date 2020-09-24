




















































































module lmi_icache_sm









(
nxtCST,
CST,
IST,
RD_OP_N,
missAll,
IS_VAL,
BurstCounter,
otherBusy,
anyAck,
WasWrite,
Kseg1,
EXT_ICREQRAM_R,
InvalPending
);

`include "lxr_symbols.vh"
`include "lmi_symbols.vh"

output [`IC_CST_LAST:0] nxtCST;
reg [`IC_CST_LAST:0] nxtCST;
input [`IC_CST_LAST:0] CST;
input [`IC_IST_LAST:0] IST;
input RD_OP_N;
input missAll;
input IS_VAL;
input [`LINE_ADDR_HI:2] BurstCounter;
input otherBusy;
input anyAck;
input WasWrite;
input Kseg1;
input EXT_ICREQRAM_R;
input InvalPending;

always @ (CST or RD_OP_N or missAll or IS_VAL or BurstCounter or otherBusy or anyAck or WasWrite or Kseg1 or InvalPending or IST or EXT_ICREQRAM_R)
begin

nxtCST = 0;

case (1'b1)








CST[`IC_CST_INIT]:
begin
nxtCST[`IC_CST_INIT] = ~IST[`IC_IST_WAIT];
nxtCST[`IC_CST_LOOKUP] = IST[`IC_IST_WAIT];
end






































CST[`IC_CST_LOOKUP]:
begin
nxtCST[`IC_CST_LOOKUP] = ~InvalPending & ~EXT_ICREQRAM_R & ((RD_OP_N | (~RD_OP_N & (~(missAll)|WasWrite)) | anyAck) | otherBusy);
nxtCST[`IC_CST_FILL] = ~InvalPending & missAll & ~RD_OP_N & ~otherBusy & ~anyAck & ~WasWrite & ~Kseg1;
nxtCST[`IC_CST_UCWAIT] = ~InvalPending & ~RD_OP_N & ~otherBusy & ~anyAck & ~WasWrite & Kseg1;
nxtCST[`IC_CST_GNTRAM] = ~InvalPending & EXT_ICREQRAM_R & ~missAll;
nxtCST[`IC_CST_INIT] = InvalPending;
end







CST[`IC_CST_WB]:
begin
nxtCST[`IC_CST_LOOKUP] = 1'b1;
end











CST[`IC_CST_FILL]:
begin
nxtCST[`IC_CST_FILL] = ~IS_VAL | (BurstCounter != `LINE_CTR_LAST);
nxtCST[`IC_CST_WB] = IS_VAL & (BurstCounter == `LINE_CTR_LAST);
end








CST[`IC_CST_UCWAIT]:
begin
nxtCST[`IC_CST_UCWAIT] = ~IS_VAL;
nxtCST[`IC_CST_WB] = IS_VAL;
end












CST[`IC_CST_GNTRAM]:
begin
nxtCST[`IC_CST_WB] = ~EXT_ICREQRAM_R;
nxtCST[`IC_CST_GNTRAM] = EXT_ICREQRAM_R;
end

endcase

end


endmodule

