



















































































module mdiv





















(

DDATAHI, DDATALO,

CLK, RESET_D2_R_N, LO_R, CEI_AOPandV_E, CEI_BOPandV_E,
DivDCycLast_P, DivDCyc0_R, DivDCyc0Go, DivDCycFirst_R,
DivDCycLast_R, DivDCycZF_R_N, DivDCycFL_R_N, DIVxInProg, DivIsU_R
);

`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"



input CLK;
input RESET_D2_R_N;
input [31:0] LO_R;
input [31:0] CEI_AOPandV_E;
input [31:0] CEI_BOPandV_E;

input DivDCycLast_P;

input DivDCyc0_R;
input DivDCyc0Go;
input DivDCycFirst_R;
input DivDCycLast_R;
input DivDCycZF_R_N;
input DivDCycFL_R_N;

input DIVxInProg;

input DivIsU_R;

output [39:0] DDATAHI;
output [39:0] DDATALO;

reg [31:0] DEND_R;
reg [33:0] DVSR_R;

reg UsePlus_R;
reg UsePlus_R_C1;
reg DENDNEG_R;
reg IncLo_R;
reg [1:0] NEWDPRM_R;




wire [39:0] DDATALO_C0;
wire UsePlus_P;
wire DENDNEG_P;

wire IncLo_P;

wire [31:0] Lo_inc;

wire [31:0] DEND_NEG;



reg [31:0] DEND_P;

reg [31:0] DVSR_P;
wire DVSREXT_P;
wire [33:0] FDPRMShLt;
wire DENDNEG;
wire DVSRNEG;

wire CI1;
wire [33:0] FDSUBA1;
wire [33:0] FDSUBA2;
wire [33:0] FDSUBA2_2;

wire [33:0] PPS3;
wire [33:0] PPC3;
wire [33:0] PPA3;

wire [33:0] SubSum_3;

wire [33:0] SubCarry_3;



wire [33:0] Res_1;
wire [15:0] Res_1_1500;
wire Res_1_15C;
wire [17:0] Res_1_3316IfNot;
wire [17:0] Res_1_3316IfCry;

wire [33:0] Res_2;
wire [15:0] Res_2_1500;
wire Res_2_15C;
wire [17:0] Res_2_3316IfNot;
wire [17:0] Res_2_3316IfCry;


wire [33:0] Res_3;

wire [16:1] Res_3_1601;
wire Res_3_carry;
wire [33:17] Res_3_3317IfC;
wire [33:17] Res_3_3317IfNoC;
wire [33:17] Res_3_3317;
wire Res_3_00;

wire [39:0] DDATAHI;

reg [31:0] DPRM;
reg [31:0] DEND_ZF;

wire Neg1;
wire Neg2;
wire Neg3;

reg [1:0] FQbit10;

wire InvQuot;
wire [1:0] FNewQuot10;

wire DENDDVSRHold;







assign DENDDVSRHold = DIVxInProg & ~DivDCycLast_R;

always @(CEI_AOPandV_E or CEI_BOPandV_E or DENDDVSRHold
or DIVxInProg or DPRM or DVSR_R) begin

DEND_P =
DIVxInProg ? DPRM
: CEI_AOPandV_E;

DVSR_P = DENDDVSRHold ? DVSR_R[31:0]
: CEI_BOPandV_E;
end

assign DVSREXT_P = ~DivIsU_R & DVSR_R[31];


assign DEND_NEG = ~DEND_R + {32'h0000_0001};





assign FDPRMShLt = {DEND_R, NEWDPRM_R};

assign FDSUBA1 = FDPRMShLt ;





assign InvQuot = DENDNEG_R ^ DVSRNEG;
assign IncLo_P = DivDCyc0Go ?
(DENDNEG ^ DVSRNEG) || ((DEND_R == 32'd0)&&(DVSR_R[31:0] == 32'd0)) :
IncLo_R;
assign UsePlus_P = DivDCycFirst_R ? DVSRNEG :
DivDCycLast_P ? 1'b0
: UsePlus_R;

assign DENDNEG_P = DivDCyc0Go ? DENDNEG : DENDNEG_R ;

assign FDSUBA2 = UsePlus_R ? DVSR_R : ~DVSR_R;
assign FDSUBA2_2 = UsePlus_R_C1 ? {DVSR_R[32:0], 1'b0} : {~DVSR_R[32:0], 1'b1};

assign PPS3 = FDSUBA1;
assign PPC3 = FDSUBA2;
assign PPA3 = FDSUBA2_2;

assign SubSum_3 = PPS3 ^ PPC3 ^ PPA3 ;
assign SubCarry_3 = (~PPS3 & PPC3 & PPA3) |
(PPS3 & (PPC3 | PPA3));

assign CI1 = DivDCyc0_R ? 1'b1 : ~UsePlus_R;



assign {Res_1_15C, Res_1_1500} = FDSUBA1[15:00] + FDSUBA2[15:00] + {3'b000, 12'h000, CI1};

assign Res_1_3316IfNot = FDSUBA1[33:16] + FDSUBA2[33:16];
assign Res_1_3316IfCry = FDSUBA1[33:16] + FDSUBA2[33:16] + {2'b00, 16'h0001};

assign Res_1 = {Res_1_15C ? Res_1_3316IfCry : Res_1_3316IfNot,
Res_1_1500};



assign {Res_2_15C, Res_2_1500} = FDSUBA1[15:00] + FDSUBA2_2[15:00] + {3'b000, 12'h000, ~UsePlus_R};

assign Res_2_3316IfNot = FDSUBA1[33:16] + FDSUBA2_2[33:16];
assign Res_2_3316IfCry = FDSUBA1[33:16] + FDSUBA2_2[33:16] + {2'b00, 16'h0001};

assign Res_2 = {Res_2_15C ? Res_2_3316IfCry : Res_2_3316IfNot,
Res_2_1500};


assign Res_3_00 = SubSum_3[0];
assign {Res_3_carry, Res_3_1601} = SubSum_3[16:1] +
(SubCarry_3[15:0]) +
{3'b000, 12'h000, ~UsePlus_R};
assign Res_3_3317IfC = SubSum_3[33:17] +
SubCarry_3[32:16] + {1'b0, 16'h0001};
assign Res_3_3317IfNoC = SubSum_3[33:17] +
SubCarry_3[32:16];
assign Res_3_3317 = Res_3_carry ? Res_3_3317IfC : Res_3_3317IfNoC;
assign Res_3 = {Res_3_3317, Res_3_1601, Res_3_00};



assign Neg1 = Res_1[33] || (Res_1[32]&&DivIsU_R);
assign Neg2 = Res_2[33] || (Res_2[32]&&DivIsU_R);
assign Neg3 = Res_3[33] || (Res_3[32]&&DivIsU_R);

always @(Neg1 or Neg2 or Neg3) begin

casex ({Neg1, Neg2, Neg3})
3'b111: FQbit10 = 2'b00;
3'b011: FQbit10 = 2'b01;
3'bx01: FQbit10 = 2'b10;
3'bxx0: FQbit10 = 2'b11;
endcase

end

assign FNewQuot10 = FQbit10 ^ {2{InvQuot}};

assign DDATAHI[31:0] = DENDNEG_R ? DEND_NEG : DEND_R;
assign DDATAHI[39:32] = DivIsU_R ? 8'h00 : {8{DDATAHI[31]}};

always @(DENDNEG or DEND_R or DivDCyc0_R or DEND_NEG) begin

casex ( {DivDCyc0_R, DENDNEG} )

2'b10: DEND_ZF = DEND_R;
2'b11: DEND_ZF = DEND_NEG;
2'b0x: DEND_ZF = 32'd0;
endcase

end
always @(DEND_ZF or DivDCycZF_R_N or FDPRMShLt or Neg1
or Neg2 or Neg3 or Res_1 or Res_2 or Res_3) begin
casex ( {DivDCycZF_R_N, Neg1, Neg2, Neg3} )
4'b0xxx: DPRM = DEND_ZF;





4'b1xx0: DPRM = Res_3[31:0];
4'b1x01: DPRM = Res_2[31:0];
4'b1011: DPRM = Res_1[31:0];
4'b1111: DPRM = FDPRMShLt[31:0];
endcase
end


assign Lo_inc = LO_R + {32'h0000_0001};


assign DDATALO_C0[31:0] =
({32{DivDCycFirst_R}} & DEND_R) |
({32{DivDCycFL_R_N}} & ({LO_R[29:0], FNewQuot10})) |
({32{DivDCycLast_R& IncLo_R}} & (Lo_inc)) |
({32{DivDCycLast_R&~IncLo_R}} & (LO_R )) ;
assign DDATALO_C0[39:32] = DivIsU_R ? 8'h00 : {8{DDATALO_C0[31]}};
assign DDATALO = DDATALO_C0;






assign DENDNEG = ~DivIsU_R & DEND_R[31];
assign DVSRNEG = ~DivIsU_R & DVSR_R[31];






always @(posedge CLK `negedge_RESET_D2_XR_N_) begin

if (~RESET_D2_R_N) begin

DEND_R <= 32'h00000000;
DVSR_R <= {2'b00, 32'h00000000};

IncLo_R <= 1'b0;
UsePlus_R <= 1'b0;
UsePlus_R_C1 <= 1'b0;
DENDNEG_R <= 1'b0;
NEWDPRM_R <= 2'b00;
end

else begin

DEND_R <= DEND_P;
DVSR_R <= {DVSREXT_P, DVSREXT_P, DVSR_P};

IncLo_R <= IncLo_P;
UsePlus_R <= UsePlus_P;
UsePlus_R_C1 <= UsePlus_P;
DENDNEG_R <= DENDNEG_P;
NEWDPRM_R <= DDATALO_C0[31:30];
end
end






endmodule

