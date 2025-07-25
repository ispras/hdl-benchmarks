`include "x_def.v"
module EC_CUN(/*--------------------- Input ---------------------*/
 DSPCLK, GO_E, GO_C, EX_en, T_RST, DMDin,
`ifdef FD_DFT
SCAN_TEST,
`endif
 updateALU, updateDIV, ABS, AZin,
ANin, AVin, ACin, ASin, AQin,
MTASTAT_E,
 updateSS, SSin,
 updateMV, MVin,
 COND_R, TERM_R,
 pop_ASTAT, pop_DATA, CE, MSTAT2,
 RSTtext_h,


 CONDok_C, TERMok_C,
 ASTAT);


input DSPCLK, GO_E, GO_C, EX_en, T_RST;
input [7:0] DMDin;
input updateALU, updateDIV, ABS, AZin;
input ANin, AVin, ACin, ASin, AQin;
input MTASTAT_E, updateSS, SSin;
input updateMV, MVin;
input [3:0] COND_R, TERM_R;
input pop_ASTAT, CE;
input MSTAT2;
input [7:0] pop_DATA;
input RSTtext_h;
`ifdef FD_DFT
input SCAN_TEST;
`endif

output CONDok_C;
output TERMok_C;
output [7:0] ASTAT;

`ifdef FD_DFT
wire T_RSTi_h = T_RST | RSTtext_h;
wire T_RSTi = SCAN_TEST ? T_RST : T_RSTi_h;
`else
wire T_RSTi = T_RST | RSTtext_h;
`endif

reg [3:0] COND_E, TERM_E;

always @(posedge DSPCLK) begin
if (T_RSTi) begin
COND_E[3:0] <= #`da 4'b0;
TERM_E[3:0] <= #`da 4'b0;
end
else
if (GO_E) begin
COND_E[3:0] <= #`da COND_R[3:0];
TERM_E[3:0] <= #`da TERM_R[3:0];
end
end



wire update_AZ, update_AN, update_AV;
wire update_AC, update_AS, update_AQ;
wire update_MV, update_SS;
wire AZi, ANi, AVi, ACi, ASi, AQi, MVi, SSi;
reg AZ, AN, AV, AC, AS, AQ, MV, SS;

assign update_AZ = (updateALU | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;
assign update_AN = (updateALU | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;
assign update_AV = (updateALU | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;
assign update_AC = (updateALU | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;
assign update_AS = ((ABS & updateALU) | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;
assign update_AQ = (updateDIV | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;
assign update_MV = (updateMV | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;
assign update_SS = (updateSS | (MTASTAT_E & EX_en) | pop_ASTAT) & GO_C;

assign AZi = (updateALU & AZin) | (MTASTAT_E & DMDin[0]) | (pop_ASTAT & pop_DATA[0]);
assign ANi = (updateALU & ANin) | (MTASTAT_E & DMDin[1]) | (pop_ASTAT & pop_DATA[1]);
assign AVi = (updateALU & (AVin | AV & MSTAT2)) | (MTASTAT_E & DMDin[2]) | (pop_ASTAT & pop_DATA[2]);
assign ACi = (updateALU & ACin) | (MTASTAT_E & DMDin[3]) | (pop_ASTAT & pop_DATA[3]);
assign ASi = (updateALU & ABS & ASin) | (MTASTAT_E & DMDin[4]) | (pop_ASTAT & pop_DATA[4]);
assign AQi = (updateDIV & AQin) | (MTASTAT_E & DMDin[5]) | (pop_ASTAT & pop_DATA[5]);
assign MVi = (updateMV & MVin) | (MTASTAT_E & DMDin[6]) | (pop_ASTAT & pop_DATA[6]);
assign SSi = (updateSS & SSin) | (MTASTAT_E & DMDin[7]) | (pop_ASTAT & pop_DATA[7]);

always @(posedge DSPCLK) begin
if (T_RSTi) AZ <= #`da 1'b0;
else
if (update_AZ) AZ <= #`da AZi;
end

always @(posedge DSPCLK) begin
if (T_RSTi) AN <= #`da 1'b0;
else
if (update_AN) AN <= #`da ANi;
end

always @(posedge DSPCLK) begin
if (T_RSTi) AV <= #`da 1'b0;
else
if (update_AV) AV <= #`da AVi;
end

always @(posedge DSPCLK) begin
if (T_RSTi) AC <= #`da 1'b0;
else
if (update_AC) AC <= #`da ACi;
end

always @(posedge DSPCLK) begin
if (T_RSTi) AS <= #`da 1'b0;
else
if (update_AS) AS <= #`da ASi;
end

always @(posedge DSPCLK) begin
if (T_RSTi) AQ <= #`da 1'b0;
else
if (update_AQ) AQ <= #`da AQi;
end

always @(posedge DSPCLK) begin
if (T_RSTi) SS <= #`da 1'b0;
else
if (update_SS) SS <= #`da SSi;
end


reg updateMV_C;
reg MVi_pre_C;
wire MVi_C;
wire update_MV_C;

always @(posedge DSPCLK)
if (GO_C) updateMV_C <= #`da updateMV ;

always @(posedge DSPCLK)
if (GO_C) MVi_pre_C <= #`da (MTASTAT_E & DMDin[6]) | (pop_ASTAT & pop_DATA[6]);

assign MVi_C = MVi_pre_C | updateMV_C & MVin;

HALFP mven(T_RST,
DSPCLK,
update_MV,
`ifdef FD_DFT
SCAN_TEST,
`endif
update_MV_C);

always @(update_MV_C or T_RSTi or MVi_C) begin
if(T_RSTi) MV <= #`da 1'b0;
else
if (update_MV_C) MV <= #`da MVi_C;
end

assign ASTAT[7:0] = {SS, MV, AQ, AS, AC, AV, AN, AZ};



wire pre_condOK_E1;
wire pre_condOK_E2;
wire pre_condOK_E3;
wire pre_condOK_E;
wire condOK_E1;
wire condOK_E2;
wire condOK_E;

assign #`da pre_condOK_E1 = (COND_R[3:0] == 4'h4) & (ANi != AVi)
| (COND_R[3:0] == 4'h5) & !(ANi != AVi)
| (COND_R[3:0] == 4'h6) & AVi
| (COND_R[3:0] == 4'h7) & !AVi
| (COND_R[3:0] == 4'h8) & ACi
| (COND_R[3:0] == 4'h9) & !ACi;


assign #`da pre_condOK_E2 = (COND_R[3:0] == 4'ha) & ASi
| (COND_R[3:0] == 4'hb) & !ASi;

assign #`da pre_condOK_E3 = (COND_R[3:0] == 4'hf);

assign #`da pre_condOK_E = (pre_condOK_E1 & update_AZ)
| (pre_condOK_E2 & update_AS)
| pre_condOK_E3
| condOK_E;

assign #`da condOK_E1 = (COND_R[3:0] == 4'h4) & (AN != AV)
| (COND_R[3:0] == 4'h5) & !(AN != AV)
| (COND_R[3:0] == 4'h6) & AV
| (COND_R[3:0] == 4'h7) & !AV
| (COND_R[3:0] == 4'h8) & AC
| (COND_R[3:0] == 4'h9) & !AC;

assign #`da condOK_E2 = (COND_R[3:0] == 4'ha) & AS
| (COND_R[3:0] == 4'hb) & !AS;

assign #`da condOK_E = (condOK_E1 & ~update_AZ)
| (condOK_E2 & ~update_AS)
| pre_condOK_E3;

reg condOK_CE;
always @(posedge DSPCLK) begin
if (T_RST) condOK_CE <= #`da 1'b0;
else if (GO_E)
condOK_CE <= #`da pre_condOK_E;
end






`ifdef FD_RTL_SIM
wire condOK_C;
assign #`da condOK_C = condOK_CE
| (COND_E[3:0] == 4'h0) & AZ
| (COND_E[3:0] == 4'h1) & !AZ
| (COND_E[3:0] == 4'h2) & !((AN != AV) | AZ)
| (COND_E[3:0] == 4'h3) & ((AN != AV) | AZ)
| (COND_E[3:0] == 4'hc) & MV
| (COND_E[3:0] == 4'hd) & !MV
| (COND_E[3:0] == 4'he) & !CE;

assign CONDok_C = condOK_C;

`else

wire condOK_C_MV0;
wire condOK_C_MV1;
wire condOK_CB;

assign #`da condOK_C_MV0 = condOK_CE
| (COND_E[3:0] == 4'h0) & AZ
| (COND_E[3:0] == 4'h1) & !AZ
| (COND_E[3:0] == 4'h2) & !((AN != AV) | AZ)
| (COND_E[3:0] == 4'h3) & ((AN != AV) | AZ)
| (COND_E[3:0] == 4'hd)
| (COND_E[3:0] == 4'he) & !CE;

assign #`da condOK_C_MV1 = condOK_CE
| (COND_E[3:0] == 4'h0) & AZ
| (COND_E[3:0] == 4'h1) & !AZ
| (COND_E[3:0] == 4'h2) & !((AN != AV) | AZ)
| (COND_E[3:0] == 4'h3) & ((AN != AV) | AZ)
| (COND_E[3:0] == 4'hc)
| (COND_E[3:0] == 4'he) & !CE;



GTECH_MUXI2 cell3(.A(condOK_C_MV0), .B(condOK_C_MV1), .S(MV), .Z(condOK_CB));
GTECH_NOT cell4(.A(condOK_CB), .Z(CONDok_C));

`endif

/*------------------------------------------------------*/


wire pre_termOK_E1;
wire pre_termOK_E2;
wire pre_termOK_E;

wire termOK_E1;
wire termOK_E2;
wire termOK_E;

assign #`da pre_termOK_E1 = (TERM_R[3:0] == 4'h4) & !(ANi != AVi)
| (TERM_R[3:0] == 4'h5) & (ANi != AVi)
| (TERM_R[3:0] == 4'h6) & !AVi
| (TERM_R[3:0] == 4'h7) & AVi
| (TERM_R[3:0] == 4'h8) & !ACi
| (TERM_R[3:0] == 4'h9) & ACi;

assign #`da pre_termOK_E2 = (TERM_R[3:0] == 4'ha) & !ASi
| (TERM_R[3:0] == 4'hb) & ASi;

assign #`da pre_termOK_E = (pre_termOK_E1 & update_AZ)
| (pre_termOK_E2 & update_AS)
| termOK_E;

assign #`da termOK_E1 = (TERM_R[3:0] == 4'h4) & !(AN != AV)
| (TERM_R[3:0] == 4'h5) & (AN != AV)
| (TERM_R[3:0] == 4'h6) & !AV
| (TERM_R[3:0] == 4'h7) & AV
| (TERM_R[3:0] == 4'h8) & !AC
| (TERM_R[3:0] == 4'h9) & AC;

assign #`da termOK_E2 = (TERM_R[3:0] == 4'ha) & !AS
| (TERM_R[3:0] == 4'hb) & AS;

assign #`da termOK_E = (termOK_E1 & ~update_AZ)
| (termOK_E2 & ~update_AS);

reg termOK_CE;
always @(posedge DSPCLK) begin
if (T_RST) termOK_CE <= #`da 1'b0;
else if (GO_E)
termOK_CE <= #`da pre_termOK_E;
end







`ifdef FD_RTL_SIM
wire termOK_C;
assign #`da termOK_C = termOK_CE
| (TERM_E[3:0] == 4'h0) & !AZ
| (TERM_E[3:0] == 4'h1) & AZ
| (TERM_E[3:0] == 4'h2) & ((AN != AV) | AZ)
| (TERM_E[3:0] == 4'h3) & !((AN != AV) | AZ)
| (TERM_E[3:0] == 4'hc) & !MV
| (TERM_E[3:0] == 4'hd) & MV
| (TERM_E[3:0] == 4'he) & CE;

assign TERMok_C = termOK_C;

`else
wire termOK_C_MV0;
wire termOK_C_MV1;
wire termOK_CB;

assign #`da termOK_C_MV0 = termOK_CE
| (TERM_E[3:0] == 4'h0) & !AZ
| (TERM_E[3:0] == 4'h1) & AZ
| (TERM_E[3:0] == 4'h2) & ((AN != AV) | AZ)
| (TERM_E[3:0] == 4'h3) & !((AN != AV) | AZ)
| (TERM_E[3:0] == 4'hc)
| (TERM_E[3:0] == 4'he) & CE;

assign #`da termOK_C_MV1 = termOK_CE
| (TERM_E[3:0] == 4'h0) & !AZ
| (TERM_E[3:0] == 4'h1) & AZ
| (TERM_E[3:0] == 4'h2) & ((AN != AV) | AZ)
| (TERM_E[3:0] == 4'h3) & !((AN != AV) | AZ)
| (TERM_E[3:0] == 4'hd)
| (TERM_E[3:0] == 4'he) & CE;



GTECH_MUXI2 cell1(.A(termOK_C_MV0), .B(termOK_C_MV1), .S(MV), .Z(termOK_CB));
GTECH_NOT cell2(.A(termOK_CB), .Z(TERMok_C));

`endif

endmodule

