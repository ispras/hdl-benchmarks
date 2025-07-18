



















































































module lbc_lbus

























(

LL_IRDY_LR, LL_FRAME_LR, LL_CDATAEN, LL_CACK, LL_CHOLD, LL_REQ,
LL_COE_LR, LL_XOE_LR, LL_TOE_LR, LL_DOE_LR, LL_FCTLRLOAD,
LL_FCTLRDOSHIFT, LL_IDLE_LR,

BUSCLK, LBUS_TRDY, LBUS_SEL, LBUS_ABORT, LBUS_GNT, LBUS_FRAME,
LBUS_IRDY, LD_MEJDEST, LDN_CGO_LR, LD_LRW, LD_LLINE_LR, LD_LEJ_LR,
LUP_CDATAACK_LR, LBCSYNCMODE, RESET_D1_LR_N, RESET_DIS
);



`include "lxr_symbols.vh"




parameter LINESIZE = `LINE_SIZE-`LINE_CTR_ONE-`LINE_CTR_ONE;





parameter STATE = 7;
parameter IDLE_CASE = 7'b0000001;
parameter IDLE = 7'b0000001;
parameter START_READ_CASE = 7'b000001x;
parameter START_READ = 7'b0000010;
parameter START_WRITE_CASE = 7'b00001xx;
parameter START_WRITE = 7'b0000100;
parameter READ_MULTI_CASE = 7'b0001xxx;
parameter READ_MULTI = 7'b0001000;
parameter READ_LAST_CASE = 7'b001xxxx;
parameter READ_LAST = 7'b0010000;
parameter WRITE_ACK_CASE = 7'b01xxxxx;
parameter WRITE_ACK = 7'b0100000;
parameter EJTAG_ACK_CASE = 7'b1xxxxxx;
parameter EJTAG_ACK = 7'b1000000;

input BUSCLK;

input LBUS_TRDY;
input LBUS_SEL;
input LBUS_ABORT;
input LBUS_GNT;

input LBUS_FRAME;
input LBUS_IRDY;

input LD_MEJDEST;

input LDN_CGO_LR;
input LD_LRW;
input LD_LLINE_LR;
input LD_LEJ_LR;
input LUP_CDATAACK_LR;

input LBCSYNCMODE;
input RESET_D1_LR_N;

input RESET_DIS;

output LL_IRDY_LR;
output LL_FRAME_LR;
output LL_CDATAEN;
output LL_CACK;
output LL_CHOLD;

output LL_REQ;

output [`LBC_COE-1:0] LL_COE_LR;
output [`LBC_XOE-1:0] LL_XOE_LR;
output [`LBC_TOE-1:0] LL_TOE_LR;
output [`LBC_DOE-1:0] LL_DOE_LR;

output [`LBC_NREADS:0] LL_FCTLRLOAD;
output LL_FCTLRDOSHIFT;
output LL_IDLE_LR;
reg LL_IDLE_LR;


reg [STATE:1] State_LR, State_P;
reg [`LINE_ADDR_HI:2] LineReg_LR, LineReg_P;
reg Cack;
reg CHold;
reg [`LBC_TOE-1:0] Oet_LR;
reg [`LBC_XOE-1:0] Oex_LR;
reg [`LBC_COE-1:0] Oec_LR;
reg [`LBC_DOE-1:0] Oed_LR;
reg Oex_P, Oec_P, Oed_P;
reg Xoe_LR;
reg Frame_LR, Frame_P;
reg Irdy_LR, Irdy_P;
reg ReqInh_LR, ReqInh_P;
reg Load_LR, Load_P;
reg Req_LR;
wire Req_P;
reg ReadFull_LR;
wire ReadFull_P;


reg shift;
wire cdataSync;
wire cdataAsync;

wire frame_in;
wire irdy_in;
wire trdy_in;

assign Req_P = LDN_CGO_LR & ~ReqInh_LR;
assign LL_CACK = Cack;
assign LL_CHOLD = CHold;
assign LL_COE_LR = Oec_LR;
assign LL_TOE_LR = Oet_LR;
assign LL_XOE_LR = Oex_LR;
assign LL_DOE_LR = Oed_LR;
assign LL_FRAME_LR = Frame_LR;
assign LL_IRDY_LR = Irdy_LR;
assign LL_CDATAEN = (LBCSYNCMODE ? cdataSync : cdataAsync);

assign frame_in = LBUS_FRAME;
assign irdy_in = LBUS_IRDY;
assign trdy_in = LBUS_TRDY;

wire qualifiedWrite;
wire qualifiedSquash;
lbc_and qwrite (.OUT (qualifiedWrite), .IN1 (LDN_CGO_LR), .IN2 (~LD_LRW));
lbc_and qsquash (.OUT (qualifiedSquash), .IN1 (LDN_CGO_LR), .IN2 (LD_MEJDEST));



always @(ReadFull_P or State_P)



begin
Frame_P = (State_P == START_READ ||
State_P == START_WRITE ||
State_P == READ_MULTI ||
(State_P == READ_LAST && ReadFull_P));

Irdy_P = ((State_P == START_READ ||
State_P == READ_MULTI ||
State_P == READ_LAST) & ~ReadFull_P) ||
State_P == START_WRITE ||
State_P == WRITE_ACK;

ReqInh_P = (State_P == START_READ ||
State_P == START_WRITE);


Oec_P = (State_P == START_READ ||
State_P == START_WRITE);


Oex_P = (State_P != IDLE &&
State_P != EJTAG_ACK);


Oed_P = (State_P == START_WRITE ||
State_P == WRITE_ACK);



CHold = !(State_P == START_READ || State_P == START_WRITE);
end


always @(Irdy_LR or LBCSYNCMODE or LBUS_GNT
or LDN_CGO_LR or LD_LEJ_LR or LD_LLINE_LR
or LUP_CDATAACK_LR or LineReg_LR or ReadFull_LR or State_LR
or frame_in or irdy_in or qualifiedSquash or qualifiedWrite
or trdy_in)



begin
LineReg_P = LineReg_LR;
Cack = 0;


Load_P = 0;
shift = 0;
State_P = State_LR;


casex (State_LR)



IDLE_CASE:
begin
if (LDN_CGO_LR)
begin
if (qualifiedSquash)
begin
State_P = IDLE;
Cack = 1'b1;
end
else begin
if (LBUS_GNT && !frame_in && !irdy_in)
begin
if (qualifiedWrite)
begin
Cack = LBCSYNCMODE;
State_P = START_WRITE;
end
else
begin
Cack = LBCSYNCMODE;
State_P = START_READ;
end
end

else

State_P = IDLE;
end
end

else
State_P = IDLE;
end

START_READ_CASE:
begin

LineReg_P = LINESIZE;

Cack = ~LBCSYNCMODE;

if (LD_LLINE_LR)
State_P = READ_MULTI;
else
State_P = READ_LAST;

end

START_WRITE_CASE:
begin
State_P = WRITE_ACK;
Cack = ~LBCSYNCMODE;
end

WRITE_ACK_CASE:
begin
if (trdy_in) begin






if (LD_LEJ_LR) begin
if (ReadFull_LR) begin
State_P = EJTAG_ACK;
end
else begin
Load_P = 1'b1;
State_P = IDLE;
end
end

else begin

if (qualifiedWrite && LBUS_GNT)
begin
State_P = START_WRITE;
Cack = LBCSYNCMODE;

end
else
State_P = IDLE;
end
end

else
State_P = WRITE_ACK;

end

READ_MULTI_CASE:
begin


if (trdy_in & Irdy_LR)
begin
Load_P = 1;

LineReg_P = LineReg_LR - `LINE_CTR_ONE;


if (!(|LineReg_LR))
State_P = READ_LAST;
else
State_P = READ_MULTI;

end
else
State_P = READ_MULTI;

end

READ_LAST_CASE:
begin
if (trdy_in & Irdy_LR)
begin
Load_P = 1;
State_P = IDLE;
end

else
State_P = READ_LAST;

end

EJTAG_ACK_CASE:
begin
if (ReadFull_LR) begin
State_P = EJTAG_ACK;
end
else begin
Load_P = 1;
State_P = IDLE;
end
end

endcase


if (LUP_CDATAACK_LR)
shift = 1;

end





wire RESET_D2_LR_N;


reg RESET_X_LR_N;
always @(posedge BUSCLK)
RESET_X_LR_N <= RESET_D1_LR_N;
assign RESET_D2_LR_N = RESET_X_LR_N | RESET_DIS;





always @(posedge BUSCLK `negedge_RESET_D2_LR_N_)
begin
if (~`RESET_D2_LR_N_)
begin
State_LR <= IDLE;
Oec_LR <= {`LBC_COE {1'b0}};
Oet_LR <= {`LBC_TOE {1'b0}};
Oex_LR <= {`LBC_XOE {1'b0}};
Oed_LR <= {`LBC_DOE {1'b0}};
Xoe_LR <= 1'b0;
Load_LR <= 1'b0;
Req_LR <= 1'b0;
LineReg_LR <= `LINE_CTR_FIRST;
Frame_LR <= 1'b0;
Irdy_LR <= 1'b0;
ReqInh_LR <= 1'b0;
ReadFull_LR <= 1'b0;
LL_IDLE_LR <= 1'b0;
end
else
begin
State_LR <= State_P;
Oec_LR <= {`LBC_COE {Oec_P}};
Oet_LR <= {`LBC_TOE {Oex_P}};
Oex_LR <= {`LBC_XOE {Oex_P | Xoe_LR}};
Oed_LR <= {`LBC_DOE {Oed_P}};
Xoe_LR <= Oex_P;
Load_LR <= Load_P;
Req_LR <= Req_P;
LineReg_LR <= LineReg_P;
Frame_LR <= Frame_P;
Irdy_LR <= Irdy_P;
ReqInh_LR <= ReqInh_P;
ReadFull_LR <= ReadFull_P;
LL_IDLE_LR <= State_P[1];
end
end


wire hitdummy;


assign LL_FCTLRDOSHIFT = LBCSYNCMODE ? Load_LR : shift;
fifo_ctl #(`LBC_READS, `LBC_READS-1) read_ctl
(
.CTLHITI ({`LBC_READS {1'b0}}),
.SHIFTI (LBCSYNCMODE ? Load_LR : shift),
.LOADI (Load_P),
.CLOCKI (BUSCLK),

.RESETI_N (`RESET_D2_LR_N_),

.CTLLOADO (LL_FCTLRLOAD),
.HITO (hitdummy),
.FULLO_P (ReadFull_P),
.OUTO (cdataSync),
.NEWO (cdataAsync)
);



lbc_mux req_mux
(
.OUT (LL_REQ),
.SEL (LBCSYNCMODE),
.LEG1 (Req_LR),
.LEG0 (Req_P)
);

endmodule


module lbc_and (OUT, IN1, IN2);
output OUT;
input IN1, IN2;

assign OUT = IN1 & IN2;
endmodule

