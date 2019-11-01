



















































































module core_lmi




















`include "../include/core_symbols.vh"
`include "../include/lxr_symbols.vh"

(
SYSCLK, TMODE, SEN, RESET_D1_R_N,

ISTALLIF,
X_HALT_R,

IC_MISS_S_R, IW_MISS_S_R, IR_MISS_S_R,
IC_VAL_S, IW_VAL_S, IR_VAL_S,

DC_MISS_W_R, DW_MISS_W_R, DR_MISS_W_R,
DC_VAL_W, DW_VAL_W, DR_VAL_W,


CLMI_JPTHOLD,

CLMI_DBUSDIS,

CLMI_DLOAD, CLMI_RHOLD, CLMI_RLSHOLD, CLMI_HLREGHOLD, CLMI_CE0HOLD, CLMI_CE1HOLD, CLMI_SEL_INSTSF_P
);

input SYSCLK;
input TMODE;
input SEN;
input RESET_D1_R_N;
input ISTALLIF;
input [`HALT_SIG_RANGE] X_HALT_R;

input IC_MISS_S_R;
input IW_MISS_S_R;
input IR_MISS_S_R;
input IC_VAL_S;
input IW_VAL_S;
input IR_VAL_S;

input DC_MISS_W_R;
input DW_MISS_W_R;
input DR_MISS_W_R;
input DC_VAL_W;
input DW_VAL_W;
input DR_VAL_W;


output CLMI_JPTHOLD;


output CLMI_DBUSDIS;

output CLMI_DLOAD;
output CLMI_RHOLD;
output CLMI_RLSHOLD;
output CLMI_HLREGHOLD;
output CLMI_CE0HOLD;
output CLMI_CE1HOLD;

output [`CLMI_SEL_INST_HI:0] CLMI_SEL_INSTSF_P;





parameter

ST_NIL_VECT = 3'b000,
ST_RESET_VECT = 3'b001,

ST_RESET = 0,
ST_LOAD = 1,
ST_WAIT = 2,

ST_HI = 2;


wire NC_FOO = SEN;




wire NC_FOO2 = TMODE;






reg CLMI_RHOLD;
reg CLMI_RLSHOLD;
reg CLMI_CE0HOLD;
reg CLMI_CE1HOLD;


reg CLMI_JPTHOLD;

reg [`CLMI_SEL_INST_HI:0] CLMI_SEL_INSTSF_P;



wire IMiss_S;
wire IVal_S;

wire DMiss_W;
wire DVal_W;

reg [ST_HI:0] Istate_R, Istate_P;
reg Imiss_S_D1_R;

reg [ST_HI:0] Dstate_R, Dstate_P;
reg DMiss_W_D1_R;



assign IVal_S = IC_VAL_S | IW_VAL_S | IR_VAL_S;
assign IMiss_S = IC_MISS_S_R | IW_MISS_S_R | IR_MISS_S_R;

assign DVal_W = DC_VAL_W | DW_VAL_W | DR_VAL_W;
assign DMiss_W = DC_MISS_W_R | DW_MISS_W_R | DR_MISS_W_R;

assign CLMI_DBUSDIS =
X_HALT_R[`DC_HALT_M_INDEX]
| X_HALT_R[`DC_HALT_W_INDEX]
| X_HALT_R[`DW_HALT_W_INDEX]
| X_HALT_R[`DT_HALT_W_INDEX];

assign CLMI_HLREGHOLD = CLMI_CE0HOLD;










always @(X_HALT_R)
begin
CLMI_RHOLD = | (X_HALT_R);
CLMI_RLSHOLD = | (X_HALT_R & ~`RALU_HALT_E_MASK);
CLMI_CE0HOLD = | (X_HALT_R & ~`HL_HALT_E_MASK & ~`MAC_HALT_E_MASK);
CLMI_CE1HOLD = | (X_HALT_R & ~`CE1_HALT_E_MASK);

CLMI_JPTHOLD = | (X_HALT_R & ~`JPT_HALT_M_MASK);

end




reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
wire RESET_D2_R_N = RESET_X_R_N | TMODE;








always @(Istate_R or ISTALLIF or
Imiss_S_D1_R or IVal_S or
CLMI_RHOLD)

begin

Istate_P = ST_NIL_VECT;
CLMI_SEL_INSTSF_P = `CLMI_SEL_INST_NIL_VECT;

if (Istate_R[ST_RESET])

begin

Istate_P[ST_LOAD] = 1'b1;

CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_HOLD_POS] = CLMI_RHOLD;
CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_ZERO_POS] = ~CLMI_RHOLD;
CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_LOAD_POS] = 1'b0;

end

if (Istate_R[ST_LOAD])

begin


Istate_P[ST_WAIT] = Imiss_S_D1_R;
Istate_P[ST_LOAD] = ~Imiss_S_D1_R;

CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_HOLD_POS] = CLMI_RHOLD;
CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_ZERO_POS] = ~CLMI_RHOLD & ISTALLIF;
CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_LOAD_POS] = ~CLMI_RHOLD & ~ISTALLIF;


end


if (Istate_R[ST_WAIT])

begin

Istate_P[ST_WAIT] = ~IVal_S;
Istate_P[ST_LOAD] = IVal_S;

CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_LOAD_POS] = IVal_S;
CLMI_SEL_INSTSF_P[`CLMI_SEL_INST_HOLD_POS] = ~IVal_S;

end

end



  // synopsys translate_off
  // verilint translate off



integer ix;
integer is;

always @ (posedge SYSCLK)
if (`RESET_D2_R_N_)
begin
is = 0;
for (ix=0; ix<= ST_HI; ix=ix+1)
is = is + Istate_P[ix];
if (is != 1)
begin
$display ("ERROR %t %m: failed to determine Istate_P (%b)", $time, Istate_P);
$stop;
end
end

  // verilint translate on
  // synopsys translate_on





always @( Dstate_R or DMiss_W_D1_R or DVal_W)

begin

Dstate_P = ST_NIL_VECT;

if (Dstate_R[ST_RESET])

begin

Dstate_P[ST_LOAD] = 1'b1;

end


if (Dstate_R[ST_LOAD])

begin

Dstate_P[ST_LOAD] = ~DMiss_W_D1_R;
Dstate_P[ST_WAIT] = DMiss_W_D1_R;

end


if (Dstate_R[ST_WAIT])

begin

Dstate_P[ST_WAIT] = ~DVal_W;
Dstate_P[ST_LOAD] = DVal_W;

end

end


assign CLMI_DLOAD = Dstate_R[ST_WAIT];


  // synopsys translate_off
  // verilint translate off




integer dx;
integer ds;

always @ (posedge SYSCLK)
if (`RESET_D2_R_N_)
begin
ds = 0;
for (dx=0; dx<= ST_HI; dx=dx+1)
ds = ds + Dstate_P[dx];
if (ds != 1)
begin
$display ("ERROR %t %m: failed to determine Dstate_P (%b)", $time, Dstate_P);
$stop;
end
end

always @ (posedge SYSCLK)
if (`RESET_D2_R_N_ && (^X_HALT_R === 1'bx))
begin
$display ("ERROR %t %m: X_HALT_R reached indeterminate state (%b)", $time, X_HALT_R);
$stop;
end




  // verilint translate on
  // synopsys translate_on




always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if (~`RESET_D2_R_N_)
begin
Istate_R <= ST_RESET_VECT;
Imiss_S_D1_R <= 1'b0;
Dstate_R <= ST_RESET_VECT;
DMiss_W_D1_R <= 1'b0;
end
else
begin
Istate_R <= Istate_P;
Imiss_S_D1_R <= IMiss_S;
Dstate_R <= Dstate_P;
DMiss_W_D1_R <= DMiss_W;
end






endmodule


