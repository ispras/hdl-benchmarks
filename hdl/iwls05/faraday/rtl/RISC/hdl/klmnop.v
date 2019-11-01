module regfile







/**************************************************************************/
/**************************************************************************/




/**************************************************************************/
/**************************************************************************/
















/**************************************************************************/
/**************************************************************************/



(
TMODE,

SEN,

SYSCLK, RESET_D1_R_N,

READA_S, READB_S,

WRITEC_W_R,
REGC_W_R,
REGA_S, REGB_S
);


input SYSCLK;
input RESET_D1_R_N;

input [9:0] READA_S;
input [9:0] READB_S;

input [31:1] WRITEC_W_R;

input [31:0] REGC_W_R;

output [31:0] REGA_S;
output [31:0] REGB_S;

input TMODE;
input SEN;

`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"


/* regs and wires */



reg [31:0] REGA_S;
reg [31:0] REGB_S;



reg [31:0] Rfile_321p[0:31];

`ifdef VPP_LOCAL_RESET
wire RESET_D2_R_N;
`endif



wire NC_FOO = TMODE;
wire NC_FOO2 = SEN;



/*******************************************************************/
/*******************************************************************/




/**********************************************************************/
/**********************************************************************/





















always @(READA_S or READB_S or WRITEC_W_R or REGC_W_R ) begin





if (!READA_S[9]) begin
if (!READA_S[8]) begin
casex (1'b1)
READA_S[0]: REGA_S = 32'h0000_0000;
READA_S[1]: REGA_S = Rfile_321p[1];
READA_S[2]: REGA_S = Rfile_321p[2];
READA_S[3]: REGA_S = Rfile_321p[3];
READA_S[4]: REGA_S = Rfile_321p[4];
READA_S[5]: REGA_S = Rfile_321p[5];
READA_S[6]: REGA_S = Rfile_321p[6];
READA_S[7]: REGA_S = Rfile_321p[7];
endcase
end
else begin
casex (1'b1)
READA_S[0]: REGA_S = Rfile_321p[8];
READA_S[1]: REGA_S = Rfile_321p[9];
READA_S[2]: REGA_S = Rfile_321p[10];
READA_S[3]: REGA_S = Rfile_321p[11];
READA_S[4]: REGA_S = Rfile_321p[12];
READA_S[5]: REGA_S = Rfile_321p[13];
READA_S[6]: REGA_S = Rfile_321p[14];
READA_S[7]: REGA_S = Rfile_321p[15];
endcase
end
end
else begin
if (!READA_S[8]) begin
casex (1'b1)
READA_S[0]: REGA_S = Rfile_321p[16];
READA_S[1]: REGA_S = Rfile_321p[17];
READA_S[2]: REGA_S = Rfile_321p[18];
READA_S[3]: REGA_S = Rfile_321p[19];
READA_S[4]: REGA_S = Rfile_321p[20];
READA_S[5]: REGA_S = Rfile_321p[21];
READA_S[6]: REGA_S = Rfile_321p[22];
READA_S[7]: REGA_S = Rfile_321p[23];
endcase
end
else begin
casex (1'b1)
READA_S[0]: REGA_S = Rfile_321p[24];
READA_S[1]: REGA_S = Rfile_321p[25];
READA_S[2]: REGA_S = Rfile_321p[26];
READA_S[3]: REGA_S = Rfile_321p[27];
READA_S[4]: REGA_S = Rfile_321p[28];
READA_S[5]: REGA_S = Rfile_321p[29];
READA_S[6]: REGA_S = Rfile_321p[30];
READA_S[7]: REGA_S = Rfile_321p[31];
endcase
end
end



if (!READB_S[9]) begin
if (!READB_S[8]) begin
casex (1'b1)
READB_S[0]: REGB_S = 32'h0000_0000;
READB_S[1]: REGB_S = Rfile_321p[1];
READB_S[2]: REGB_S = Rfile_321p[2];
READB_S[3]: REGB_S = Rfile_321p[3];
READB_S[4]: REGB_S = Rfile_321p[4];
READB_S[5]: REGB_S = Rfile_321p[5];
READB_S[6]: REGB_S = Rfile_321p[6];
READB_S[7]: REGB_S = Rfile_321p[7];
endcase
end
else begin
casex (1'b1)
READB_S[0]: REGB_S = Rfile_321p[8];
READB_S[1]: REGB_S = Rfile_321p[9];
READB_S[2]: REGB_S = Rfile_321p[10];
READB_S[3]: REGB_S = Rfile_321p[11];
READB_S[4]: REGB_S = Rfile_321p[12];
READB_S[5]: REGB_S = Rfile_321p[13];
READB_S[6]: REGB_S = Rfile_321p[14];
READB_S[7]: REGB_S = Rfile_321p[15];
endcase
end
end
else begin
if (!READB_S[8]) begin
casex (1'b1)
READB_S[0]: REGB_S = Rfile_321p[16];
READB_S[1]: REGB_S = Rfile_321p[17];
READB_S[2]: REGB_S = Rfile_321p[18];
READB_S[3]: REGB_S = Rfile_321p[19];
READB_S[4]: REGB_S = Rfile_321p[20];
READB_S[5]: REGB_S = Rfile_321p[21];
READB_S[6]: REGB_S = Rfile_321p[22];
READB_S[7]: REGB_S = Rfile_321p[23];
endcase
end
else begin
casex (1'b1)
READB_S[0]: REGB_S = Rfile_321p[24];
READB_S[1]: REGB_S = Rfile_321p[25];
READB_S[2]: REGB_S = Rfile_321p[26];
READB_S[3]: REGB_S = Rfile_321p[27];
READB_S[4]: REGB_S = Rfile_321p[28];
READB_S[5]: REGB_S = Rfile_321p[29];
READB_S[6]: REGB_S = Rfile_321p[30];
READB_S[7]: REGB_S = Rfile_321p[31];
endcase
end
end
end




  // synopsys translate_off
  // verilint translate off


always @(posedge SYSCLK) begin

if (`RESET_D2_R_N_ && !(READA_S)) begin
$display("ERROR %t %m: Illegal Null A-Port Read OP", $time);
$stop;
end

if (`RESET_D2_R_N_ && !(READA_S)) begin
$display("ERROR %t %m: Illegal Null A-Port Read OP", $time);
$stop;
end

end

  // verilint translate on
  // synopsys translate_on











`ifdef VPP_LOCAL_RESET

`ifdef VPP_BUFFERED_RESET
assign RESET_D2_R_N = RESET_D1_R_N;
`else


reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;


`endif
`endif





always @(posedge SYSCLK `negedge_RESET_D2_R_N_)


if (!`RESET_D2_R_N_) begin

Rfile_321p[1] <= 32'hffff_ffff;
Rfile_321p[2] <= 32'hffff_ffff;
Rfile_321p[3] <= 32'hffff_ffff;
Rfile_321p[4] <= 32'hffff_ffff;
Rfile_321p[5] <= 32'hffff_ffff;
Rfile_321p[6] <= 32'hffff_ffff;
Rfile_321p[7] <= 32'hffff_ffff;
Rfile_321p[8] <= 32'hffff_ffff;
Rfile_321p[9] <= 32'hffff_ffff;
Rfile_321p[10] <= 32'hffff_ffff;
Rfile_321p[11] <= 32'hffff_ffff;
Rfile_321p[12] <= 32'hffff_ffff;
Rfile_321p[13] <= 32'hffff_ffff;
Rfile_321p[14] <= 32'hffff_ffff;
Rfile_321p[15] <= 32'hffff_ffff;
Rfile_321p[16] <= 32'hffff_ffff;
Rfile_321p[17] <= 32'hffff_ffff;
Rfile_321p[18] <= 32'hffff_ffff;
Rfile_321p[19] <= 32'hffff_ffff;
Rfile_321p[20] <= 32'hffff_ffff;
Rfile_321p[21] <= 32'hffff_ffff;
Rfile_321p[22] <= 32'hffff_ffff;
Rfile_321p[23] <= 32'hffff_ffff;
Rfile_321p[24] <= 32'hffff_ffff;
Rfile_321p[25] <= 32'hffff_ffff;
Rfile_321p[26] <= 32'hffff_ffff;
Rfile_321p[27] <= 32'hffff_ffff;
Rfile_321p[28] <= 32'hffff_ffff;
Rfile_321p[29] <= 32'hffff_ffff;
Rfile_321p[30] <= 32'hffff_ffff;
Rfile_321p[31] <= 32'hffff_ffff;

end

else begin

if (WRITEC_W_R[1]) Rfile_321p[1] <= REGC_W_R;
if (WRITEC_W_R[2]) Rfile_321p[2] <= REGC_W_R;
if (WRITEC_W_R[3]) Rfile_321p[3] <= REGC_W_R;
if (WRITEC_W_R[4]) Rfile_321p[4] <= REGC_W_R;

if (WRITEC_W_R[5]) Rfile_321p[5] <= REGC_W_R;
if (WRITEC_W_R[6]) Rfile_321p[6] <= REGC_W_R;
if (WRITEC_W_R[7]) Rfile_321p[7] <= REGC_W_R;
if (WRITEC_W_R[8]) Rfile_321p[8] <= REGC_W_R;

if (WRITEC_W_R[9]) Rfile_321p[9] <= REGC_W_R;
if (WRITEC_W_R[10]) Rfile_321p[10] <= REGC_W_R;
if (WRITEC_W_R[11]) Rfile_321p[11] <= REGC_W_R;
if (WRITEC_W_R[12]) Rfile_321p[12] <= REGC_W_R;

if (WRITEC_W_R[13]) Rfile_321p[13] <= REGC_W_R;
if (WRITEC_W_R[14]) Rfile_321p[14] <= REGC_W_R;
if (WRITEC_W_R[15]) Rfile_321p[15] <= REGC_W_R;
if (WRITEC_W_R[16]) Rfile_321p[16] <= REGC_W_R;

if (WRITEC_W_R[17]) Rfile_321p[17] <= REGC_W_R;
if (WRITEC_W_R[18]) Rfile_321p[18] <= REGC_W_R;
if (WRITEC_W_R[19]) Rfile_321p[19] <= REGC_W_R;
if (WRITEC_W_R[20]) Rfile_321p[20] <= REGC_W_R;

if (WRITEC_W_R[21]) Rfile_321p[21] <= REGC_W_R;
if (WRITEC_W_R[22]) Rfile_321p[22] <= REGC_W_R;
if (WRITEC_W_R[23]) Rfile_321p[23] <= REGC_W_R;
if (WRITEC_W_R[24]) Rfile_321p[24] <= REGC_W_R;

if (WRITEC_W_R[25]) Rfile_321p[25] <= REGC_W_R;
if (WRITEC_W_R[26]) Rfile_321p[26] <= REGC_W_R;
if (WRITEC_W_R[27]) Rfile_321p[27] <= REGC_W_R;
if (WRITEC_W_R[28]) Rfile_321p[28] <= REGC_W_R;

if (WRITEC_W_R[29]) Rfile_321p[29] <= REGC_W_R;
if (WRITEC_W_R[30]) Rfile_321p[30] <= REGC_W_R;
if (WRITEC_W_R[31]) Rfile_321p[31] <= REGC_W_R;

end











endmodule

