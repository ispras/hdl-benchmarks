



















































































module lbc_cbus











(

LC_CGO, LC_GOTOGGLE_R, LC_CILOAD, LC_CDRLOAD, LC_CQSEL, LC_DVALID_R,
LC_EJDONE, CBUS_HALT_W_R, LC_DWEMPTY_P, LC_FCTLLOAD, LC_FCTLDOSHIFT,

CBUS_DREQ, CBUS_DRW, CBUS_DUC, CBUS_IREQ, EJ_DMAREQ, EJ_DMARW,
EJ_DONE, SYSCLK, RESET_DIS, RESET_D1_R_N, LD_MEJDEST, LDN_CGOACK_R,
LD_FCTLHIT, WBDISABLE, LBCSYNCMODE, LL_IDLE_LR
);

`include "lxr_symbols.vh"


input CBUS_DREQ;
input CBUS_DRW;
input CBUS_DUC;


input CBUS_IREQ;

input EJ_DMAREQ;
input EJ_DMARW;

input EJ_DONE;

input SYSCLK;
input RESET_DIS;

input RESET_D1_R_N;

input LD_MEJDEST;
input LDN_CGOACK_R;
input [`LBC_NWRITES:0] LD_FCTLHIT;

input WBDISABLE;
input LBCSYNCMODE;
input LL_IDLE_LR;


output LC_CGO;
output LC_GOTOGGLE_R;


output LC_CILOAD;
output LC_CDRLOAD;
output [`LBC_NSMUX:0] LC_CQSEL;
output LC_DVALID_R;
output LC_EJDONE;


output [`HALT_DRV_RANGE] CBUS_HALT_W_R;
output LC_DWEMPTY_P;
output [`LBC_NWRITES:0] LC_FCTLLOAD;
output LC_FCTLDOSHIFT;

reg LC_CILOAD;
reg LC_CDRLOAD;
reg LC_EJDONE;
reg [`HALT_DRV_RANGE] CBUS_HALT_W_R;



reg EValid_R, EValid_P;
reg IValid_R, IValid_P;
reg DrValid_R, DrValid_P;
reg DrUC_R, DrUC_P;
reg Go_R, Go_P;
reg Going_R, Going_P;
reg IDgo_R, IDgo_P;
reg EJgo_R, EJgo_P;
reg RWgo_R, RWgo_P;
reg [`LBC_NSMUX:0] Mux_R, Mux_P;
reg Bypass_R, Bypass_P;
reg Hit_R;
wire Hit_P;
reg EJ_DONE_R;
reg EJDone_R, EJDone_P;
reg CGoAck_R, CGoAck_P;
reg I2EJPend_R, I2EJPend_P;
wire CBUS_HALT_W_P;


wire dwvalid;
reg cdwshift;
reg cdwload;

reg LIdle_D1_R;
reg LIdle_D2_R;
reg FCTLLOAD0_D1_R;
reg FCTLLOAD0_D2_R;

reg done;
assign LC_CQSEL = Mux_P;

assign LC_DVALID_R = DrValid_R;
assign LC_GOTOGGLE_R = Go_R;



wire NC_RESET_DIS = RESET_DIS;









wire RESET_D2_R_N;


reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | RESET_DIS;











always @(Bypass_R or CBUS_DREQ or CBUS_DRW or CBUS_DUC
or CBUS_IREQ or CGoAck_R or DrUC_R or DrValid_R or EJDone_R
or EJ_DMAREQ or EJ_DMARW or EJ_DONE_R or EJgo_R or EValid_R
or Go_R or Going_R or Hit_R or I2EJPend_R or IDgo_R
or IValid_R or LDN_CGOACK_R or LD_MEJDEST or Mux_R or RWgo_R
or WBDISABLE or dwvalid)
begin

Go_P = Go_R;
Going_P = Going_R;
IDgo_P = IDgo_R;
EJgo_P = EJgo_R;
RWgo_P = RWgo_R;
Mux_P = Mux_R;
Bypass_P = Bypass_R;

cdwload = 0;
cdwshift = 0;
LC_CDRLOAD = 0;
LC_CILOAD = 0;


























if (!Going_R)
begin

if (IValid_R || DrValid_R || dwvalid || CBUS_IREQ || (CBUS_DREQ && CBUS_DRW) || EValid_R) begin
Go_P = ~Go_R;
Going_P = 1'b1;
EJgo_P = EValid_R;
IDgo_P = IValid_R | CBUS_IREQ;





Mux_P[0] = EValid_R;
Mux_P[1] = (IValid_R | CBUS_IREQ) &
~Mux_P[0];



Mux_P[2] = ((CBUS_DREQ & CBUS_DRW & ~dwvalid) |

(DrValid_R & ~((Hit_R | DrUC_R) & dwvalid) & ~(dwvalid & WBDISABLE))) &
~|Mux_P[1:0];

Mux_P[3] = (dwvalid) &
~|Mux_P[2:0];


RWgo_P = Mux_P[1] | Mux_P[2] | (Mux_P[0] & EJ_DMARW);

end

end













if (LD_MEJDEST) begin


LC_EJDONE = (EJ_DONE_R | EJDone_R) & (LDN_CGOACK_R | CGoAck_R);


I2EJPend_P = (EValid_R & IDgo_R & (LDN_CGOACK_R | CGoAck_R)) | I2EJPend_R;


done = LC_EJDONE | (I2EJPend_R & Going_R);

end

else begin


LC_EJDONE = I2EJPend_R & EJ_DONE_R;


done = LDN_CGOACK_R | LC_EJDONE;


I2EJPend_P = ~EJ_DONE_R & I2EJPend_R;
end

if (done) begin
Going_P = 0;
end




EJDone_P = (EJDone_R | EJ_DONE_R) & ~done;
CGoAck_P = (CGoAck_R | LDN_CGOACK_R) & ~done;


EValid_P = EJ_DMAREQ |
(EValid_R &
~(done & EJgo_R));


LC_CILOAD = CBUS_IREQ;
IValid_P = CBUS_IREQ |
(IValid_R &
~(done & IDgo_R & ~EJgo_R));



LC_CDRLOAD = CBUS_DREQ & CBUS_DRW;
DrValid_P = (CBUS_DREQ & CBUS_DRW) |
(DrValid_R &
~(done & RWgo_R
& ~IDgo_R & ~EJgo_R));


DrUC_P = CBUS_DREQ ? CBUS_DUC : DrUC_R;


cdwload = CBUS_DREQ & ~CBUS_DRW;
cdwshift = done & ~RWgo_R & ~IDgo_R & ~EJgo_R;

end


always @(posedge SYSCLK `negedge_RESET_D2_R_N_)
begin

if (!`RESET_D2_R_N_)
begin
Go_R <= 0;
Going_R <= 0;
IValid_R <= 0;
EValid_R <= 0;
DrValid_R <= 0;
DrUC_R <= 0;
Bypass_R <= 0;
Mux_R <= 0;
IDgo_R <= 0;
EJgo_R <= 0;
RWgo_R <= 0;
Hit_R <= 0;
EJ_DONE_R <= 0;
EJDone_R <= 1'b0;
CGoAck_R <= 1'b0;
I2EJPend_R <= 1'b0;
LIdle_D1_R <= 0;
LIdle_D2_R <= 0;
FCTLLOAD0_D1_R <= 0;
FCTLLOAD0_D2_R <= 0;
CBUS_HALT_W_R <= { `HALT_DRV_COUNT { 1'b0} };
end
else
begin
Go_R <= Go_P;
Going_R <= Going_P;
IValid_R <= IValid_P;
EValid_R <= EValid_P;
DrValid_R <= DrValid_P;
DrUC_R <= DrUC_P;
Bypass_R <= Bypass_P;
Mux_R <= Mux_P;
IDgo_R <= IDgo_P;
EJgo_R <= EJgo_P;
RWgo_R <= RWgo_P;
Hit_R <= Hit_P;
EJ_DONE_R <= EJ_DONE;
EJDone_R <= EJDone_P;
CGoAck_R <= CGoAck_P;
I2EJPend_R <= I2EJPend_P;
LIdle_D1_R <= LL_IDLE_LR;
LIdle_D2_R <= LIdle_D1_R;
FCTLLOAD0_D1_R <= LC_FCTLLOAD[0];
FCTLLOAD0_D2_R <= FCTLLOAD0_D1_R;
CBUS_HALT_W_R <= { `HALT_DRV_COUNT { CBUS_HALT_W_P } };
end
end


wire unused;

assign LC_FCTLDOSHIFT = cdwshift;
fifo_ctl #(`LBC_WRITES) write_ctl
(
.CTLHITI (LD_FCTLHIT),
.SHIFTI (cdwshift),
.LOADI (cdwload),
.CLOCKI (SYSCLK),

.RESETI_N (`RESET_D2_R_N_),

.CTLLOADO (LC_FCTLLOAD),
.HITO (Hit_P),
.FULLO_P (CBUS_HALT_W_P),
.OUTO (dwvalid),
.NEWO (unused)
);

assign LC_DWEMPTY_P = ~(LC_FCTLLOAD[0] | FCTLLOAD0_D1_R | FCTLLOAD0_D2_R) & LIdle_D2_R;

lbc_mux go_mux
(
.OUT (LC_CGO),
.SEL (LBCSYNCMODE),
.LEG0 (Go_P),
.LEG1 (Going_R)
);

endmodule





module lbc_mux
(

OUT,

SEL, LEG0, LEG1
);
input SEL;
input LEG0;
input LEG1;

output OUT;

assign OUT = SEL ? LEG1 : LEG0;
endmodule

