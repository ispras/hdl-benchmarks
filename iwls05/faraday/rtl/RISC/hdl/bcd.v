



















































































`include "lxr_symbols.vh"
module fifo_ctl










(

CTLLOADO, HITO, FULLO_P, OUTO, NEWO,

CTLHITI, SHIFTI, LOADI, CLOCKI, RESETI_N
);


parameter
DEPTH=4,
FULL=DEPTH-2,
WIDTH=32,
NDEPTH=DEPTH-1,

NWIDTH=WIDTH-1;


input [NDEPTH:0] CTLHITI;
input SHIFTI;
input LOADI;
input CLOCKI;
input RESETI_N;

output [NDEPTH:0] CTLLOADO;
output HITO;
output FULLO_P;
output OUTO;
output NEWO;



reg HITO;



reg [NDEPTH:0] iFifoValid, FifoValid;
reg New, iNew;

assign FULLO_P = iFifoValid [FULL];
assign OUTO = FifoValid [0];
assign NEWO = New;
assign CTLLOADO = FifoValid;



reg Full_D1_R;
reg Full_D2_R;

always @(posedge CLOCKI `negedge_RESETI_N_)
begin
if (!RESETI_N) begin
Full_D1_R <= 1'b0;
Full_D2_R <= 1'b0;
end
else begin
Full_D1_R <= FULLO_P;
Full_D2_R <= Full_D1_R;




end
end




always @(FifoValid or LOADI or New or SHIFTI)
begin

iNew = New;






if (SHIFTI && !LOADI) begin
iFifoValid = {1'b0, FifoValid [NDEPTH:1]};
end


else if (LOADI && !SHIFTI) begin
iFifoValid = {FifoValid [NDEPTH-1:0], 1'b1};
end

else begin
iFifoValid = FifoValid;
end


if (SHIFTI)
begin
if (iFifoValid [0])
iNew = ~New;
end
else
if (LOADI)
begin
if (!iFifoValid[1])
iNew = ~New;
end
end

always @(CTLHITI or FifoValid)
begin
HITO = |(CTLHITI & FifoValid);
end

always @(posedge CLOCKI `negedge_RESETI_N_)
begin
if (!RESETI_N)
begin
FifoValid <= 0;
New <= 0;
end
else
begin
FifoValid <= iFifoValid;
New <= iNew;
end
end

endmodule


