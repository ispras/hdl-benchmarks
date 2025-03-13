`include "efg.v"
module macu
(

MPPA_R, Result,

CLK, RESET_D2_R_N, MMHold_E, MultIsU, Mand32, Mand16H, MultCycNth,
M0CMult_M1, M1CMult_M1, SrcA, SrcB, CEI_AOPandV_E, CEI_BOPandV_E,
CEopMSUBGo_E, M2Sat_A_R, Frac_E_R, Frac_M_R, SatMode, TruncMode,
MTG_A_P, MAND2PPA_A_P, M2PPA_A_P, Mult_M2_P, Mult_M3_P
);



`include "lxr_symbols.vh"
`include "core_symbols.vh"



input CLK;
input RESET_D2_R_N;

input MMHold_E;
input MultIsU;

input Mand32;
input Mand16H;

input MultCycNth;
input M0CMult_M1;
input M1CMult_M1;

input [39:0] SrcA;
input [39:0] SrcB;

input [31:0] CEI_AOPandV_E;
input [31:0] CEI_BOPandV_E;

input CEopMSUBGo_E;
input M2Sat_A_R;
input Frac_E_R;
input Frac_M_R;
input SatMode;
input TruncMode;

input MTG_A_P;
input MAND2PPA_A_P;
input M2PPA_A_P;
input Mult_M2_P;
input Mult_M3_P;



output [39:0] MPPA_R;
output [71:0] Result;



reg MMHold_C_R;
wire SXPartial_P;
reg CarryPartial_R;
wire CarryPartial_P;


wire [16:0] MAND_R;
assign MAND_R = {1'b0, 16'h0000};

reg [31:0] MIER_R;

reg [23:0] MHOLD_R;

reg [32:0] MANDX1_R;
reg [32:0] MANDTC_R;
reg [34:0] MANDX3_R;

reg [23:0] MBOOTH_R;

reg [49:0] MPPS_A_R;
reg [48:0] MPPC_A_R;





wire [39:0] MPPA_R;

reg [55:0] MPPA_A_R;

assign MPPA_R = MPPA_A_R[55:16];







reg [16:0] MAND_P;


reg [31:0] MIER_P;

wire [23:0] MHOLDNeg;
wire [23:0] MHOLDorNeg;
wire [23:0] MHOLD_P;

reg [32:0] MANDX1_P;
reg [32:0] MANDTC_P;

reg [15:0] MANDX3_1500;
reg MANDX3_15C;
reg [18:0] MANDX3_3416IfNot;
reg [18:0] MANDX3_3416IfCry;

reg [34:0] MANDX3_P;

reg [18:0] MIERHW_P;
reg [23:0] MBOOTH_P;


reg [49:0] MPPC_P;

reg [49:0] MPPS_P;

reg [3:0] MTEMP;
reg [3:0] MTEMP1;
reg [3:0] MTEMP2;

reg [5:0] MBTHPOS4;
reg [5:0] MBTHPOS3;
reg [5:0] MBTHPOS2;
reg [5:0] MBTHPOS1;
reg [5:0] MBTHNEG4;
reg [5:0] MBTHNEG3;
reg [5:0] MBTHNEG2;
reg [5:0] MBTHNEG1;

reg [5:0] MBTHPOS421;
reg [5:0] MBTHNEG421;



reg MBooth5IsPM3PM4;




reg [49:0] MCST0;
reg [49:0] MCST1;
reg [49:0] MCST2;
reg [49:0] MCST3;
reg [49:0] MCST4;
reg [49:0] MCST5;
wire [49:0] MCSTS;
wire [49:0] MCSTC;

reg [55:0] MPPA_P;
wire [49:0] MPCS1;
wire [49:0] MPCS0;

wire [49:0] MPCSS;
wire [48:0] MPCSC;

reg [55:0] MCLA;


reg [15:0] MCLA1500;
reg MCLA15Cry;

reg [15:0] MCLA3116IfCry;
reg [15:0] MCLA3116IfNot;
reg MCLA31CryIfCry;
reg MCLA31CryIfNot;
reg [15:0] MCLA3116;
reg MCLA31Cry;

reg [14:0] MCLA4632IfNot;
reg [14:0] MCLA4632IfCry;
reg [14:0] MCLA4632If2;
reg [14:0] MCLA4632;
reg MCLA46CryIfNot;
reg MCLA46CryIfCry;
reg MCLA46CryIf2;
reg MCLA46Cry;

reg [2:0] MPPIfNot;
reg [2:0] MPPIfCry;

reg [9:0] MCLA5647IfCry;
reg [9:0] MCLA5647IfNot;


reg [9:0] MCLA5647;











wire Mand16H;


wire MandIsS;

wire MierFrac;

wire MierIsS;

wire MierH;

wire MierCarryLo;


integer i ;
integer j ;
integer k ;

























always @(CEI_AOPandV_E or CEI_BOPandV_E or MIER_R
or MMHold_C_R or Mand16H) begin




MAND_P = Mand16H
? {CEI_AOPandV_E[15], CEI_AOPandV_E[15:00]}
: {CEI_AOPandV_E[31], CEI_AOPandV_E[31:16]};
MIER_P = MMHold_C_R ? MIER_R : CEI_BOPandV_E;

end





























































































































































































assign MandIsS = ~MultIsU;

assign MierFrac = MMHold_C_R ? Frac_M_R : Frac_E_R;
assign MierIsS = ~MultIsU;
assign MierH = MultCycNth;
assign MierCarryLo = MMHold_C_R & ~(M0CMult_M1 | M1CMult_M1);

always @(CEI_AOPandV_E or MANDX1_R or MAND_R or Mand16H
or Mand32 or MandIsS or MultCycNth) begin

casex ({MultCycNth, MandIsS, Mand32, Mand16H} )
4'b0000: MANDX1_P = { 1'b0 , CEI_AOPandV_E[15:00], 16'h0000 };
4'b0001: MANDX1_P = { 1'b0 , CEI_AOPandV_E[31:16], 16'h0000 };
4'b001x: MANDX1_P = { 1'b0 , CEI_AOPandV_E[31:16], CEI_AOPandV_E[15:00]};
4'b0100: MANDX1_P = { CEI_AOPandV_E[15], CEI_AOPandV_E[15:00], 16'h0000 };
4'b0101: MANDX1_P = { CEI_AOPandV_E[31], CEI_AOPandV_E[31:16], 16'h0000 };
4'b011x: MANDX1_P = { CEI_AOPandV_E[31], CEI_AOPandV_E[31:16], CEI_AOPandV_E[15:00]};
4'b1x0x: MANDX1_P = { MAND_R[16:00], 16'h0000 } ;
4'b1x1x: MANDX1_P = MANDX1_R[32:00];






endcase
end

always @(CEI_BOPandV_E or MIER_R or MierCarryLo
or MierFrac or MierH or MierIsS or MultCycNth) begin
casex ({MultCycNth, MierFrac, MierIsS, MierH, MierCarryLo} )
5'b0000x: MIERHW_P = { 2'b00 , CEI_BOPandV_E[15:00], 1'b0 };
5'b0001x: MIERHW_P = { 2'b00 , CEI_BOPandV_E[31:16], 1'b0 };
5'b0010x: MIERHW_P = { {2{CEI_BOPandV_E[15]}}, CEI_BOPandV_E[15:00], 1'b0 };
5'b0011x: MIERHW_P = { {2{CEI_BOPandV_E[31]}}, CEI_BOPandV_E[31:16], 1'b0 };

5'b0100x: MIERHW_P = { 1'b0 , CEI_BOPandV_E[15:00], 2'b00 };
5'b0101x: MIERHW_P = { 1'b0 , CEI_BOPandV_E[31:16], 2'b00 };
5'b0110x: MIERHW_P = { {2{CEI_BOPandV_E[15]}}, CEI_BOPandV_E[14:00], 2'b00 };
5'b0111x: MIERHW_P = { {2{CEI_BOPandV_E[31]}}, CEI_BOPandV_E[30:16], 2'b00 };

5'b100xx: MIERHW_P = { 2'b00 , MIER_R [31:16], 1'b0 };
5'b101x0: MIERHW_P = { {2{MIER_R [31]}}, MIER_R [31:16], 1'b0 };
5'b101x1: MIERHW_P = { {2{MIER_R [31]}}, MIER_R [31:16], MIER_R[15] };

5'b110xx: MIERHW_P = { 1'b0 , MIER_R [31:16], 2'b00 };
5'b111x0: MIERHW_P = { {2{MIER_R [31]}}, MIER_R [31:16], 1'b0 };
5'b111x1: MIERHW_P = { {2{MIER_R [31]}}, MIER_R [30:16], {2{MIER_R[15]}} };







endcase


end



always @(CEopMSUBGo_E or MIERHW_P) begin


for (i=0; i<=5; i=i+1) begin


MTEMP1[3:0] = {MIERHW_P[i*3+3],
MIERHW_P[i*3+2],
MIERHW_P[i*3+1],
MIERHW_P[i*3+0]};

casex (MTEMP1)

4'b0000: MTEMP2 = 4'b0101;
4'b0001: MTEMP2 = 4'b0001;
4'b0010: MTEMP2 = 4'b0001;
4'b0011: MTEMP2 = 4'b0010;
4'b0100: MTEMP2 = 4'b0010;
4'b0101: MTEMP2 = 4'b0100;
4'b0110: MTEMP2 = 4'b0100;
4'b0111: MTEMP2 = 4'b1000;
4'b1000: MTEMP2 = 4'b0111;
4'b1001: MTEMP2 = 4'b1011;
4'b1010: MTEMP2 = 4'b1011;
4'b1011: MTEMP2 = 4'b1101;
4'b1100: MTEMP2 = 4'b1101;
4'b1101: MTEMP2 = 4'b1110;
4'b1110: MTEMP2 = 4'b1110;
4'b1111: MTEMP2 = 4'b1010;

endcase


{MBOOTH_P[i*4+3],
MBOOTH_P[i*4+2],
MBOOTH_P[i*4+1],
MBOOTH_P[i*4+0]} = MTEMP2[3:0] ^ {4{CEopMSUBGo_E}};

end

end
always @(MANDX1_P) begin










{MANDX3_15C, MANDX3_1500} = {MANDX1_P[14:0],1'b0} + MANDX1_P[15:0];

MANDX3_3416IfNot = {MANDX1_P[32],MANDX1_P[32:15]} + {{2{MANDX1_P[32]}},MANDX1_P[32:16]};
MANDX3_3416IfCry = {MANDX1_P[32],MANDX1_P[32:15]} + {{2{MANDX1_P[32]}},MANDX1_P[32:16]}
+ {3'b000, 16'h0001};

MANDX3_P = {MANDX3_15C ? MANDX3_3416IfCry : MANDX3_3416IfNot,
MANDX3_1500};



MANDTC_P = ~MANDX1_P + {32'h0000_0000,1'b1};



end
always @(MBOOTH_R) begin


for (j=0; j<=5; j=j+1) begin

MTEMP[3:0] = {MBOOTH_R[j*4+3],
MBOOTH_R[j*4+2],
MBOOTH_R[j*4+1],
MBOOTH_R[j*4+0]};

MBTHPOS4[j] = ~MTEMP[2] & ~MTEMP[1] & ~MTEMP[0];
MBTHPOS3[j] = ~MTEMP[3] & ~MTEMP[1] & ~MTEMP[0];
MBTHPOS2[j] = ~MTEMP[3] & ~MTEMP[2] & ~MTEMP[0];
MBTHPOS1[j] = ~MTEMP[3] & ~MTEMP[2] & ~MTEMP[1] ;
MBTHNEG4[j] = MTEMP[2] & MTEMP[1] & MTEMP[0];
MBTHNEG3[j] = MTEMP[3] & MTEMP[1] & MTEMP[0];
MBTHNEG2[j] = MTEMP[3] & MTEMP[2] & MTEMP[0];
MBTHNEG1[j] = MTEMP[3] & MTEMP[2] & MTEMP[1] ;

end

end
always @(MBTHNEG1 or MBTHNEG2 or MBTHNEG4 or MBTHPOS1
or MBTHPOS2 or MBTHPOS4) begin

for (k=0; k<=5; k=k+1) begin

MBTHPOS421[k] = MBTHPOS4[k] | MBTHPOS2[k] | MBTHPOS1[k] ;
MBTHNEG421[k] = MBTHNEG4[k] | MBTHNEG2[k] | MBTHNEG1[k] ;

end

end
always @(MANDTC_R or MANDX1_R or MANDX3_R or MBTHNEG1
or MBTHNEG2 or MBTHNEG3 or MBTHNEG4 or MBTHNEG421
or MBTHPOS1 or MBTHPOS2 or MBTHPOS3 or MBTHPOS4
or MBTHPOS421) begin

























MCST0[49:0] = {2'b00,48'h0000_0000_0000};
MCST1[49:0] = {2'b00,48'h0000_0000_0000};
MCST2[49:0] = {2'b00,48'h0000_0000_0000};
MCST3[49:0] = {2'b00,48'h0000_0000_0000};
MCST4[49:0] = {2'b00,48'h0000_0000_0000};
MCST5[49:0] = {2'b00,48'h0000_0000_0000};


MCST0[49:35] = {15{( MANDX1_R [32] & MBTHPOS421[0] |
MANDTC_R[32] & MBTHNEG421[0] |
MANDX3_R[34] & MBTHPOS3 [0] |
~MANDX3_R[34] & MBTHNEG3 [0])}};

MCST1[49:38] = {12{( MANDX1_R [32] & MBTHPOS421[1] |
MANDTC_R[32] & MBTHNEG421[1] |
MANDX3_R[34] & MBTHPOS3 [1] |
~MANDX3_R[34] & MBTHNEG3 [1])}};

MCST2[49:41] = { 9{( MANDX1_R [32] & MBTHPOS421[2] |
MANDTC_R[32] & MBTHNEG421[2] |
MANDX3_R[34] & MBTHPOS3 [2] |
~MANDX3_R[34] & MBTHNEG3 [2])}};

MCST3[49:44] = { 6{( MANDX1_R [32] & MBTHPOS421[3] |
MANDTC_R[32] & MBTHNEG421[3] |
MANDX3_R[34] & MBTHPOS3 [3] |
~MANDX3_R[34] & MBTHNEG3 [3])}};

MCST4[49:47] = { 3{( MANDX1_R [32] & MBTHPOS421[4] |
MANDTC_R[32] & MBTHNEG421[4] |
MANDX3_R[34] & MBTHPOS3 [4] |
~MANDX3_R[34] & MBTHNEG3 [4])}};

MCST5[49 ] = { ( MANDX1_R [32] & MBTHPOS421[5] |
MANDTC_R[32] & MBTHNEG421[5]) };


MCST1[ 0] = MBTHNEG3[0];
MCST2[ 3] = MBTHNEG3[1];
MCST3[ 6] = MBTHNEG3[2];
MCST4[ 9] = MBTHNEG3[3];
MCST5[12] = MBTHNEG3[4];




MCST0[34:00] = ({{2{ MANDX1_R[32]}}, MANDX1_R[32:0] } & {35{MBTHPOS1[0]}}) |
({ MANDX1_R[32] , MANDX1_R[32:0],1'b0 } & {35{MBTHPOS2[0]}}) |
({ MANDX1_R[32:0],2'b00} & {35{MBTHPOS4[0]}}) |
({{2{ MANDTC_R[32]}}, MANDTC_R[32:0] } & {35{MBTHNEG1[0]}}) |
({ MANDTC_R[32] , MANDTC_R[32:0],1'b0 } & {35{MBTHNEG2[0]}}) |
({ MANDTC_R[32:0],2'b00} & {35{MBTHNEG4[0]}}) |
({ MANDX3_R[34] , MANDX3_R[33:0] } & {35{MBTHPOS3[0]}}) |
({ ~MANDX3_R[34] ,~MANDX3_R[33:0] } & {35{MBTHNEG3[0]}}) ;

MCST1[37:03] = ({{2{ MANDX1_R[32]}}, MANDX1_R[32:0] } & {35{MBTHPOS1[1]}}) |
({ MANDX1_R[32] , MANDX1_R[32:0],1'b0 } & {35{MBTHPOS2[1]}}) |
({ MANDX1_R[32:0],2'b00} & {35{MBTHPOS4[1]}}) |
({{2{ MANDTC_R[32]}}, MANDTC_R[32:0] } & {35{MBTHNEG1[1]}}) |
({ MANDTC_R[32] , MANDTC_R[32:0],1'b0 } & {35{MBTHNEG2[1]}}) |
({ MANDTC_R[32:0],2'b00} & {35{MBTHNEG4[1]}}) |
({ MANDX3_R[34] , MANDX3_R[33:0] } & {35{MBTHPOS3[1]}}) |
({ ~MANDX3_R[34] ,~MANDX3_R[33:0] } & {35{MBTHNEG3[1]}}) ;

MCST2[40:06] = ({{2{ MANDX1_R[32]}}, MANDX1_R[32:0] } & {35{MBTHPOS1[2]}}) |
({ MANDX1_R[32] , MANDX1_R[32:0],1'b0 } & {35{MBTHPOS2[2]}}) |
({ MANDX1_R[32:0],2'b00} & {35{MBTHPOS4[2]}}) |
({{2{ MANDTC_R[32]}}, MANDTC_R[32:0] } & {35{MBTHNEG1[2]}}) |
({ MANDTC_R[32] , MANDTC_R[32:0],1'b0 } & {35{MBTHNEG2[2]}}) |
({ MANDTC_R[32:0],2'b00} & {35{MBTHNEG4[2]}}) |
({ MANDX3_R[34] , MANDX3_R[33:0] } & {35{MBTHPOS3[2]}}) |
({ ~MANDX3_R[34] ,~MANDX3_R[33:0] } & {35{MBTHNEG3[2]}}) ;

MCST3[43:09] = ({{2{ MANDX1_R[32]}}, MANDX1_R[32:0] } & {35{MBTHPOS1[3]}}) |
({ MANDX1_R[32] , MANDX1_R[32:0],1'b0 } & {35{MBTHPOS2[3]}}) |
({ MANDX1_R[32:0],2'b00} & {35{MBTHPOS4[3]}}) |
({{2{ MANDTC_R[32]}}, MANDTC_R[32:0] } & {35{MBTHNEG1[3]}}) |
({ MANDTC_R[32] , MANDTC_R[32:0],1'b0 } & {35{MBTHNEG2[3]}}) |
({ MANDTC_R[32:0],2'b00} & {35{MBTHNEG4[3]}}) |
({ MANDX3_R[34] , MANDX3_R[33:0] } & {35{MBTHPOS3[3]}}) |
({ ~MANDX3_R[34] ,~MANDX3_R[33:0] } & {35{MBTHNEG3[3]}}) ;

MCST4[46:12] = ({{2{ MANDX1_R[32]}}, MANDX1_R[32:0] } & {35{MBTHPOS1[4]}}) |
({ MANDX1_R[32] , MANDX1_R[32:0],1'b0 } & {35{MBTHPOS2[4]}}) |
({ MANDX1_R[32:0],2'b00} & {35{MBTHPOS4[4]}}) |
({{2{ MANDTC_R[32]}}, MANDTC_R[32:0] } & {35{MBTHNEG1[4]}}) |
({ MANDTC_R[32] , MANDTC_R[32:0],1'b0 } & {35{MBTHNEG2[4]}}) |
({ MANDTC_R[32:0],2'b00} & {35{MBTHNEG4[4]}}) |
({ MANDX3_R[34] , MANDX3_R[33:0] } & {35{MBTHPOS3[4]}}) |
({ ~MANDX3_R[34] ,~MANDX3_R[33:0] } & {35{MBTHNEG3[4]}}) ;

MCST5[48:15] = ({ MANDX1_R[32] , MANDX1_R[32:0] } & {34{MBTHPOS1[5]}}) |
({ MANDX1_R[32:0],1'b0 } & {34{MBTHPOS2[5]}}) |
({ MANDTC_R[32] , MANDTC_R[32:0] } & {34{MBTHNEG1[5]}}) |
({ MANDTC_R[32:0],1'b0 } & {34{MBTHNEG2[5]}}) ;




MBooth5IsPM3PM4 = MBTHPOS3[5] | MBTHNEG3[5] | MBTHPOS4[5] | MBTHNEG4[5];



end



mcst50 mcst50 (
.A5 (MCST5),
.A4 (MCST4),
.A3 (MCST3),
.A2 (MCST2),
.A1 (MCST1),
.A0 (MCST0),
.S (MCSTS),
.C (MCSTC)
);






always @(MCSTC or MCSTS) begin


MPPS_P =




MCSTS;
MPPC_P =

MCSTC;

end

always @(M2PPA_A_P or MAND2PPA_A_P or MANDX1_R
or MHOLDorNeg or MTG_A_P or Mult_M2_P or Mult_M3_P or SrcA
or SrcB) begin

case (1'b1)
MTG_A_P: MPPA_P = { MANDX1_R[31:24] , SrcA [31:0] , 16'h0000 };
MAND2PPA_A_P: MPPA_P = {{8{MANDX1_R[31 ]}}, MANDX1_R[31:0], 16'h0000 };
M2PPA_A_P: MPPA_P = { SrcA [39:0] , 16'h0000 };
Mult_M2_P: MPPA_P = { 8'h00 , SrcA [15:0] , SrcB[31:0] };
Mult_M3_P: MPPA_P = { MHOLDorNeg[23:0 ] , SrcB[31:0] };
default : MPPA_P = { 56'h00_0000_0000_0000 };
endcase
end



assign MPCS0 = {MPPS_A_R};
assign MPCS1 = { MPPC_A_R[48:0], 1'b0};


mpcs50 mpcs50 (
.A2 ({3'd0,MPPA_A_R[46:0]}),
.A1 (MPCS1),
.A0 (MPCS0),
.S (MPCSS),
.C (MPCSC)
);

always @(CarryPartial_R or MPCSC or MPCSS or MPPA_A_R) begin

{MCLA15Cry, MCLA1500} = MPCSS[15:00] + {MPCSC[14:00], 1'b0};

{MCLA31CryIfCry,MCLA3116IfCry} = MPCSS[31:16] + MPCSC[30:15] + {16'h0001};
{MCLA31CryIfNot,MCLA3116IfNot} = MPCSS[31:16] + MPCSC[30:15];

{MCLA46CryIfNot, MCLA4632IfNot} = MPCSS[46:32] + MPCSC[45:31];
{MCLA46CryIfCry, MCLA4632IfCry} = MPCSS[46:32] + MPCSC[45:31] + {3'b000, 12'h001};
{MCLA46CryIf2 , MCLA4632If2 } = MPCSS[46:32] + MPCSC[45:31] + {3'b000, 12'h002};


MPPIfNot = MPCSS[49:47] + MPCSC[48:46];
MPPIfCry = MPCSS[49:47] + MPCSC[48:46] + 3'd1;

{MCLA5647IfCry} = {MPPA_A_R[55],MPPA_A_R[55:47]} + {{7{MPPIfCry[2]}},MPPIfCry};
{MCLA5647IfNot} = {MPPA_A_R[55],MPPA_A_R[55:47]} + {{7{MPPIfNot[2]}},MPPIfNot};


MCLA3116 = MCLA15Cry ? MCLA3116IfCry : MCLA3116IfNot;
MCLA31Cry = MCLA15Cry ? MCLA31CryIfCry : MCLA31CryIfNot;

MCLA4632 = ( MCLA31Cry & CarryPartial_R) ? MCLA4632If2 :
( MCLA31Cry & ~CarryPartial_R) |
CarryPartial_R ? MCLA4632IfCry
: MCLA4632IfNot ;

MCLA46Cry =( MCLA31Cry & CarryPartial_R) ? MCLA46CryIf2 :
( MCLA31Cry & ~CarryPartial_R) |
CarryPartial_R ? MCLA46CryIfCry
: MCLA46CryIfNot ;

MCLA5647 = MCLA46Cry ? MCLA5647IfCry : MCLA5647IfNot;

MCLA = {MCLA5647[8:0], MCLA4632, MCLA3116, MCLA1500};

end


assign SXPartial_P = Mult_M3_P & MCLA[48] & MCLA[49];
assign CarryPartial_P = Mult_M3_P & MCLA[48] & ~MCLA[49];

























































assign MHOLDNeg = MHOLD_R - {24'd1};

assign MHOLDorNeg = SXPartial_P ? MHOLDNeg : MHOLD_R;

assign MHOLD_P = Mult_M2_P ? SrcA[39:16] :
{7'd0, MCLA[16:0]};

assign Result = {MCLA[55:0] , MHOLD_R[15:0]};









always @(posedge CLK `negedge_RESET_D2_XR_N_) begin

if (~RESET_D2_R_N) begin



MIER_R <= 32'h0000_0000;

MANDX1_R <= { 1'b0, 32'h0000_0000};
MANDTC_R <= { 1'b0, 32'h0000_0000};
MANDX3_R <= {3'b000,32'h0000_0000};
MBOOTH_R <= 24'h00_0000;

MHOLD_R <= 24'h00_0000;

MPPC_A_R <= {1'b0 ,16'h0000,32'h0000_0000};
MPPS_A_R <= {2'b00,16'h0000,32'h0000_0000};

MPPA_A_R <= {8'h00,16'h0000,32'h0000_0000};

MMHold_C_R <= 1'b0;

CarryPartial_R <= 1'b0;
end

else begin



MIER_R <= MIER_P;

MANDX1_R <= MANDX1_P;
MANDTC_R <= MANDTC_P;
MANDX3_R <= MANDX3_P;
MBOOTH_R <= MBOOTH_P;

MHOLD_R <= MHOLD_P;

MPPC_A_R <= MPPC_P[48:0];
MPPS_A_R <= MPPS_P;

MPPA_A_R <= MPPA_P;

MMHold_C_R <= MMHold_E;

CarryPartial_R <= CarryPartial_P;

end
end










wire [33:0] MPPTotal;
assign MPPTotal = {MPPC_A_R[32:0], 1'b0} + MPPS_A_R;

wire [48:0] ArithMPSUM;
wire [55:0] ArithMPSUMSX;
wire [55:0] ArithMCLA;
reg [55:0] ArithMPPA_A_R;
reg [55:0] ArithMPPA_P;
reg ArithSXPartial_R;

always @(M2PPA_A_P or MAND2PPA_A_P or MANDX1_R
or MHOLD_R or MTG_A_P or Mult_M2_P or Mult_M3_P or SrcA
or SrcB) begin

case (1'b1)
MTG_A_P: ArithMPPA_P = { MANDX1_R[31:24] , SrcA [31:0], 16'h0000 };
MAND2PPA_A_P: ArithMPPA_P = {{8{MANDX1_R[31 ]}}, MANDX1_R[31:0], 16'h0000 };
M2PPA_A_P: ArithMPPA_P = { SrcA [39:0], 16'h0000 };
Mult_M2_P: ArithMPPA_P = { 8'h00 , SrcA [15:0], SrcB[31:0] };
Mult_M3_P: ArithMPPA_P = { MHOLD_R[23:0 ] , SrcB [31:0] };
default : ArithMPPA_P = { 56'h00_0000_0000_0000 };
endcase
end

always @(posedge CLK `negedge_RESET_D2_XR_N_) begin

if (~RESET_D2_R_N) begin
ArithMPPA_A_R <= 1'b0;
ArithSXPartial_R <= 1'b0;
end
else begin
ArithMPPA_A_R <= ArithMPPA_P;
ArithSXPartial_R <= SXPartial_P;
end
end

assign ArithMPSUM = MPPS_A_R + {MPPC_A_R[48:0], 1'b0}
- {3'b000, 12'h000, ArithSXPartial_R , 32'h0000_0000}
+ {3'b000, 12'h000, CarryPartial_R, 32'h0000_0000};

assign ArithMPSUMSX = {{7{ArithMPSUM[48]}}, ArithMPSUM[48:0]};

assign ArithMCLA = ArithMPSUMSX + ArithMPPA_A_R;

  // synopsys translate_off
  // verilint translate off
always @(posedge CLK) begin
if (RESET_D2_R_N) begin
if (ArithMCLA != MCLA) begin
$display ("ERROR %t %m: Computed MCLA 0 does not match verilog 0", $time, ArithMCLA, MCLA);
$stop;
end
end
end







  // verilint translate on
  // synopsys translate_on
























endmodule

