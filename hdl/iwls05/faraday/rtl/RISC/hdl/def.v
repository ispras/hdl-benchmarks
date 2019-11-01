



















































































module lbc_async




















(

VALIDO, ACKO,

VALIDI, ACKI, CLOCKII, CLOCKOI, RESET_D1_IR_N, RESET_D1_OR_N,
LBC_SYNC_MODE
);

input VALIDI;
input ACKI;
input CLOCKII;
input CLOCKOI;
input RESET_D1_IR_N;
input RESET_D1_OR_N;
input LBC_SYNC_MODE;

output VALIDO;
output ACKO;





reg Ack0, iAck0;
reg Go1;
reg Go2;
reg Go3, iGo3;


reg Go0;

reg Ack1;
reg Ack2;
reg Ack3;



`include "../include/lxr_symbols.vh"









reg RESET_X_IR_N;
always @ (posedge CLOCKII)
RESET_X_IR_N <= RESET_D1_IR_N;
wire RESET_D2_IR_N = RESET_X_IR_N;







reg RESET_X_OR_N;
always @ (posedge CLOCKOI)
RESET_X_OR_N <= RESET_D1_OR_N;
wire RESET_D2_OR_N = RESET_X_OR_N;








always @(ACKI or Go2 or Go3)
begin
iGo3 = ACKI ? Go2 : Go3;
iAck0 = ACKI ? Go2 : Go3;
end

always @(posedge CLOCKII `negedge_RESET_D2_IR_N_)
begin

if (!`RESET_D2_IR_N_)
begin
Ack1 <= 0;
Ack2 <= 0;
Ack3 <= 0;
Go0 <= 0;
end
else
begin

Ack1 <= Ack0;
Ack3 <= Ack2;
Ack2 <= Ack1;
Go0 <= VALIDI;
end

end

always @(posedge CLOCKOI `negedge_RESET_D2_OR_N_)
begin

if (!`RESET_D2_OR_N_)
begin
Go3 <= 0;
Go2 <= 0;
Go1 <= 0;
Ack0 <= 0;
end
else
begin
Go3 <= iGo3;
Go2 <= Go1;

Go1 <= Go0;
Ack0 <= iAck0;
end

end

lbc_mux async_valid_mux
(
.OUT (VALIDO),
.SEL (LBC_SYNC_MODE),
.LEG1 (VALIDI),
.LEG0 (Go2 != Go3)
);

lbc_mux async_ack_mux
(
.OUT (ACKO),
.SEL (LBC_SYNC_MODE),
.LEG1 (ACKI),
.LEG0 (Ack2 != Ack3)
);



endmodule
