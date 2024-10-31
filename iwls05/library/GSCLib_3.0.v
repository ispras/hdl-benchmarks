/*
 * 180 nm Generic Library
 * Download from http://crete.cadence.com
 *
 * Export of the technology contained therein is governed by US Export
 * Regulations. Diversion contrary to U.S. law is prohibited. Permission to make
 * copies, either paper or electronic, of this work for personal or classroom use
 * is granted without fee provided that the copies are not made or distributed for
 * profit or commercial advantage. Users are free to use or modify content as
 * appropriate as long as this notice appears in it. Information is provided 'as
 * is' without warranty of any kind. No statement is made and no attempt has been
 * made to examine the information, either with respect to operability, origin,
 * authorship, or otherwise. Please use this information at your own risk. We
 * recommend using it on a copy of your data to be sure you understand what it
 * does under your conditions. Keep your master intact until you are satisfied
 * with the use of this information within your environment. Please report any
 * problems or enhancement requests to crete@cadence.com.
 * 
 * Copyright 2003, Cadence Design Systems - All Rights Reserved
 * 
 */
`timescale 1ns/10ps
`celldefine
module ADDHX1 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.073:0.079:0.086,
       tplhl$A$S = 0.028:0.041:0.054,
       tpllh$A$CO = 0.054:0.054:0.054,
       tphhl$A$CO = 0.069:0.069:0.069,
       tpllh$B$S = 0.039:0.05:0.061,
       tplhl$B$S = 0.023:0.036:0.049,
       tpllh$B$CO = 0.051:0.051:0.051,
       tphhl$B$CO = 0.058:0.058:0.058;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (A *> S) = (tpllh$A$S, tplhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (B *> S) = (tpllh$B$S, tplhl$B$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module ADDFX1 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

   specify
     // delay parameters
     specparam
       tpllh$A$S = 0.073:0.13:0.19,
       tplhl$A$S = 0.1:0.14:0.18,
       tpllh$A$CO = 0.083:0.094:0.11,
       tphhl$A$CO = 0.11:0.11:0.11,
       tpllh$B$S = 0.094:0.15:0.2,
       tplhl$B$S = 0.1:0.14:0.17,
       tpllh$B$CO = 0.098:0.099:0.1,
       tphhl$B$CO = 0.11:0.11:0.11,
       tpllh$CI$S = 0.11:0.14:0.18,
       tplhl$CI$S = 0.12:0.14:0.16,
       tpllh$CI$CO = 0.083:0.09:0.096,
       tphhl$CI$CO = 0.099:0.1:0.1;

     // path delays
     (A *> CO) = (tpllh$A$CO, tphhl$A$CO);
     (A *> S) = (tpllh$A$S, tplhl$A$S);
     (B *> CO) = (tpllh$B$CO, tphhl$B$CO);
     (B *> S) = (tpllh$B$S, tplhl$B$S);
     (CI *> CO) = (tpllh$CI$CO, tphhl$CI$CO);
     (CI *> S) = (tpllh$CI$S, tplhl$CI$S);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.055:0.055:0.055,
       tphhl$A$Y = 0.046:0.046:0.046,
       tpllh$B$Y = 0.057:0.057:0.057,
       tphhl$B$Y = 0.051:0.051:0.051;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   and (I0_out, A0, A1);
   or  (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.051:0.051:0.051,
       tphlh$A0$Y = 0.04:0.04:0.04,
       tplhl$A1$Y = 0.054:0.054:0.054,
       tphlh$A1$Y = 0.047:0.047:0.047,
       tplhl$B0$Y = 0.024:0.025:0.026,
       tphlh$B0$Y = 0.024:0.029:0.034;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   and (I0_out, B0, B1);
   and (I1_out, A0, A1);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.041:0.042:0.043,
       tphlh$A0$Y = 0.026:0.031:0.036,
       tplhl$A1$Y = 0.043:0.044:0.046,
       tphlh$A1$Y = 0.03:0.035:0.041,
       tplhl$B0$Y = 0.069:0.076:0.083,
       tphlh$B0$Y = 0.04:0.047:0.053,
       tplhl$B1$Y = 0.072:0.078:0.085,
       tphlh$B1$Y = 0.045:0.052:0.059;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.044:0.044:0.044,
       tphhl$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.052:0.052:0.052,
       tphhl$A$Y = 0.056:0.056:0.056;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.04:0.04:0.04,
       tphhl$A$Y = 0.043:0.043:0.043;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.039:0.039:0.039,
       tphhl$A$Y = 0.042:0.042:0.042;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUFX3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.041:0.041:0.041,
       tphhl$A$Y = 0.044:0.044:0.044;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSRX1 (CK, D, RN, SN, Q, QN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (NET0131_, D_, CK, I0_SET, I0_CLEAR, NOTIFIER);
   udp_dff (P0001_, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (D_, D);
   not (NET0131, NET0131_);
   not (P0001, P0001_);
   buf (Q, NET0131);
   buf (QN, P0001);
   not (I12_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I12_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.079:0.079:0.079,
       tplhl$CK$Q = 0.085:0.085:0.085,
       tpllh$CK$QN = 0.14:0.14:0.14,
       tplhl$CK$QN = 0.12:0.12:0.12,
       tpllh$RN$Q = 0.12:0.12:0.12,
       tphhl$RN$Q = 0.091:0.093:0.094,
       tphlh$RN$QN = 0.15:0.15:0.15,
       tpllh$SN$QN = 0.071:0.071:0.071,
       tphhl$SN$QN = 0.06:0.06:0.061,
       tphlh$SN$Q = 0.16:0.18:0.2,
       tminpwh$CK = 0.079:0.11:0.14,
       tminpwl$CK = 0.07:0.085:0.1,
       tminpwl$RN = 0.032:0.092:0.15,
       tminpwl$SN = 0.025:0.11:0.2,
       tsetup_negedge$D$CK = 0.062:0.062:0.062,
       thold_negedge$D$CK = 0:0:0,
       tsetup_posedge$D$CK = 0.12:0.12:0.12,
       thold_posedge$D$CK = 0:0:0,
       trec$RN$CK = 0.12:0.12:0.12,
       trem$RN$CK = 0:0:0,
       trec$RN$SN = 0:0.031:0.063,
       trec$SN$CK = 0:0:0,
       trem$SN$CK = 0.063:0.063:0.063,
       trec$SN$RN = 0.063:0.063:0.063;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     (RN *> Q) = (tpllh$RN$Q, tphhl$RN$Q);
     (RN *> QN) = (tphlh$RN$QN, 0);
     (SN *> Q) = (tphlh$SN$Q, 0);
     (SN *> QN) = (tpllh$SN$QN, tphhl$SN$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $recovery(posedge SN, posedge RN, trec$SN$RN, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFX1 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (P0001, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, P0001);
   not (Q, P0000);
   buf (QN, P0000);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tpllh$CK$QN = 0.15:0.15:0.15,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.056:0.1:0.15,
       tminpwl$CK = 0.063:0.082:0.1,
       tsetup_negedge$D$CK = 0.12:0.12:0.12,
       thold_negedge$D$CK = 0:0:0,
       tsetup_posedge$D$CK = 0.12:0.12:0.12,
       thold_posedge$D$CK = 0:0:0;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.021:0.021:0.021,
       tphlh$A$Y = 0.021:0.021:0.021;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.017:0.017:0.017,
       tphlh$A$Y = 0.017:0.017:0.017;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.015:0.015:0.015,
       tphlh$A$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.015:0.015:0.015,
       tphlh$A$Y = 0.015:0.015:0.015;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MX2X1 (A, B, S0, Y);
input  A ;
input  B ;
input  S0 ;
output Y ;

   udp_mux2 (Y, A, B, S0);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.072:0.072:0.072,
       tphhl$A$Y = 0.071:0.071:0.071,
       tpllh$B$Y = 0.072:0.072:0.072,
       tphhl$B$Y = 0.072:0.072:0.072,
       tpllh$S0$Y = 0.053:0.06:0.067,
       tplhl$S0$Y = 0.059:0.063:0.067;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (S0 *> Y) = (tpllh$S0$Y, tplhl$S0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.031:0.031:0.031,
       tphlh$A$Y = 0.024:0.024:0.024,
       tplhl$B$Y = 0.034:0.034:0.034,
       tphlh$B$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.027:0.027:0.027,
       tphlh$A$Y = 0.02:0.02:0.02,
       tplhl$B$Y = 0.029:0.029:0.029,
       tphlh$B$Y = 0.024:0.024:0.024;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.026:0.026:0.026,
       tphlh$A$Y = 0.03:0.03:0.03,
       tplhl$B$Y = 0.031:0.031:0.031,
       tphlh$B$Y = 0.038:0.038:0.038,
       tplhl$C$Y = 0.035:0.035:0.035,
       tphlh$C$Y = 0.045:0.045:0.045;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.029:0.029:0.029,
       tphlh$A$Y = 0.034:0.034:0.034,
       tplhl$B$Y = 0.037:0.037:0.037,
       tphlh$B$Y = 0.044:0.044:0.044,
       tplhl$C$Y = 0.043:0.043:0.043,
       tphlh$C$Y = 0.053:0.053:0.053,
       tplhl$D$Y = 0.047:0.047:0.047,
       tphlh$D$Y = 0.06:0.06:0.06;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.036:0.036:0.036,
       tphlh$A$Y = 0.036:0.036:0.036,
       tplhl$B$Y = 0.025:0.025:0.025,
       tphlh$B$Y = 0.028:0.028:0.028;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.077:0.077:0.077,
       tphlh$A$Y = 0.053:0.053:0.053,
       tplhl$B$Y = 0.062:0.062:0.062,
       tphlh$B$Y = 0.043:0.043:0.043,
       tplhl$C$Y = 0.036:0.036:0.036,
       tphlh$C$Y = 0.024:0.024:0.024;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I2_out, A, B, C, D);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.14:0.14:0.14,
       tphlh$A$Y = 0.15:0.15:0.15,
       tplhl$B$Y = 0.13:0.13:0.13,
       tphlh$B$Y = 0.14:0.14:0.14,
       tplhl$C$Y = 0.11:0.11:0.11,
       tphlh$C$Y = 0.11:0.11:0.11,
       tplhl$D$Y = 0.082:0.082:0.082,
       tphlh$D$Y = 0.084:0.084:0.084;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X1 (A0, A1, B0, Y);
input  A0 ;
input  A1 ;
input  B0 ;
output Y ;

   or  (I0_out, A0, A1);
   and (I1_out, I0_out, B0);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.043:0.043:0.043,
       tphlh$A0$Y = 0.036:0.036:0.036,
       tplhl$A1$Y = 0.061:0.061:0.061,
       tphlh$A1$Y = 0.045:0.045:0.045,
       tplhl$B0$Y = 0.032:0.045:0.058,
       tphlh$B0$Y = 0.02:0.021:0.021;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X1 (A0, A1, B0, B1, Y);
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
output Y ;

   or  (I0_out, B0, B1);
   or  (I1_out, A0, A1);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.077:0.088:0.1,
       tphlh$A0$Y = 0.091:0.097:0.1,
       tplhl$A1$Y = 0.088:0.1:0.12,
       tphlh$A1$Y = 0.1:0.1:0.11,
       tplhl$B0$Y = 0.083:0.095:0.11,
       tphlh$B0$Y = 0.11:0.11:0.12,
       tplhl$B1$Y = 0.094:0.11:0.12,
       tphlh$B1$Y = 0.12:0.12:0.13;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI33X1 (A0, A1, A2, B0, B1, B2, Y);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Y ;

   or  (I1_out, B0, B1, B2);
   or  (I3_out, A0, A1, A2);
   and (I4_out, I1_out, I3_out);
   not (Y, I4_out);

   specify
     // delay parameters
     specparam
       tplhl$A0$Y = 0.082:0.11:0.13,
       tphlh$A0$Y = 0.1:0.11:0.12,
       tplhl$A1$Y = 0.099:0.13:0.16,
       tphlh$A1$Y = 0.12:0.13:0.14,
       tplhl$A2$Y = 0.11:0.14:0.18,
       tphlh$A2$Y = 0.13:0.14:0.15,
       tplhl$B0$Y = 0.093:0.12:0.14,
       tphlh$B0$Y = 0.12:0.13:0.14,
       tplhl$B1$Y = 0.11:0.14:0.17,
       tphlh$B1$Y = 0.14:0.15:0.16,
       tplhl$B2$Y = 0.12:0.15:0.19,
       tphlh$B2$Y = 0.15:0.16:0.17;

     // path delays
     (A0 *> Y) = (tphlh$A0$Y, tplhl$A0$Y);
     (A1 *> Y) = (tphlh$A1$Y, tplhl$A1$Y);
     (A2 *> Y) = (tphlh$A2$Y, tplhl$A2$Y);
     (B0 *> Y) = (tphlh$B0$Y, tplhl$B0$Y);
     (B1 *> Y) = (tphlh$B1$Y, tplhl$B1$Y);
     (B2 *> Y) = (tphlh$B2$Y, tplhl$B2$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.051:0.051:0.051,
       tphhl$A$Y = 0.068:0.068:0.068,
       tpllh$B$Y = 0.042:0.042:0.042,
       tphhl$B$Y = 0.06:0.06:0.06;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR4X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (Y, A, B, C, D);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.096:0.096:0.096,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$C$Y = 0.081:0.081:0.081,
       tphhl$C$Y = 0.09:0.09:0.09,
       tpllh$D$Y = 0.057:0.057:0.057,
       tphhl$D$Y = 0.06:0.06:0.06;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);
     (C *> Y) = (tpllh$C$Y, tphhl$C$Y);
     (D *> Y) = (tpllh$D$Y, tphhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module SDFFSRX1 (CK, D, RN, SE, SI, SN, Q, QN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (P0002, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (P0000, P0002);
   not (Q, P0000);
   buf (QN, P0000);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.21:0.21:0.21,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.26:0.26:0.26,
       tphhl$RN$Q = 0.14:0.14:0.14,
       tphlh$RN$QN = 0.11:0.11:0.11,
       tplhl$SN$Q = 0.12:0.12:0.12,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tpllh$SN$QN = 0.092:0.092:0.092,
       tphhl$SN$QN = 0.092:0.094:0.097,
       tminpwh$CK = 0.082:0.19:0.29,
       tminpwl$CK = 0.073:0.15:0.22,
       tminpwl$RN = 0.062:0.11:0.17,
       tminpwl$SN = 0.054:0.089:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.12:-0.12:-0.12,
       tsetup_negedge$SE$CK = 0.12:0.16:0.19,
       thold_negedge$SE$CK = -0.12:-0.094:-0.062,
       tsetup_negedge$SI$CK = 0.25:0.25:0.25,
       thold_negedge$SI$CK = -0.12:-0.12:-0.12,
       tsetup_posedge$D$CK = 0.062:0.062:0.062,
       thold_posedge$D$CK = 0:0:0,
       tsetup_posedge$SE$CK = 0.12:0.19:0.25,
       thold_posedge$SE$CK = -0.12:-0.062:0,
       tsetup_posedge$SI$CK = 0.12:0.12:0.12,
       thold_posedge$SI$CK = 0:0:0,
       trec$RN$CK = 0.062:0.062:0.062,
       trem$RN$CK = 0:0:0,
       trec$RN$SN = 0.063:0.094:0.12,
       trec$SN$CK = 0.062:0.062:0.062,
       trem$SN$CK = 0.063:0.063:0.063;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     (RN *> Q) = (0, tphhl$RN$Q);
     (RN *> QN) = (tphlh$RN$QN, 0);
     (SN *> Q) = (tphlh$SN$Q, tplhl$SN$Q);
     (SN *> QN) = (tpllh$SN$QN, tphhl$SN$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX1 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.059:0.059:0.059,
       tphhl$A$Y = 0.056:0.056:0.056,
       tpzh$OE$Y = 0.062:0.062:0.062,
       tpzl$OE$Y = 0.024:0.024:0.024,
       tplz$OE$Y = 0.041:0.041:0.041,
       tphz$OE$Y = 0.053:0.053:0.053;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX2 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.072:0.072:0.072,
       tphhl$A$Y = 0.064:0.064:0.064,
       tpzh$OE$Y = 0.075:0.075:0.075,
       tpzl$OE$Y = 0.019:0.019:0.019,
       tplz$OE$Y = 0.041:0.041:0.041,
       tphz$OE$Y = 0.072:0.072:0.072;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX4 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.072:0.072:0.072,
       tphhl$A$Y = 0.064:0.064:0.064,
       tpzh$OE$Y = 0.074:0.074:0.074,
       tpzl$OE$Y = 0.02:0.02:0.02,
       tplz$OE$Y = 0.041:0.041:0.041,
       tphz$OE$Y = 0.071:0.071:0.071;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX8 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   bufif1 (Y, A, OE);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.071:0.071:0.071,
       tphhl$A$Y = 0.062:0.062:0.062,
       tpzh$OE$Y = 0.088:0.088:0.088,
       tpzl$OE$Y = 0.029:0.029:0.029,
       tplz$OE$Y = 0.045:0.045:0.045,
       tphz$OE$Y = 0.062:0.062:0.062;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TINVX1 (A, OE, Y);
input  A ;
input  OE ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, OE);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.034:0.034:0.034,
       tphlh$A$Y = 0.044:0.044:0.044,
       tpzh$OE$Y = 0.049:0.049:0.049,
       tpzl$OE$Y = 0.015:0.015:0.015,
       tplz$OE$Y = 0.041:0.041:0.041,
       tphz$OE$Y = 0.066:0.066:0.066;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (OE *> Y) = (0, 0, tplz$OE$Y, tpzh$OE$Y, tphz$OE$Y, tpzl$OE$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATSRX1 (D, G, RN, SN, Q, QN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_tlat (P0001, D, G, I0_CLEAR, I0_SET, NOTIFIER);
   not (P0000, P0001);
   not (Q, P0000);
   buf (QN, P0000);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.13:0.13:0.13,
       tphhl$D$Q = 0.16:0.16:0.16,
       tplhl$D$QN = 0.2:0.2:0.2,
       tphlh$D$QN = 0.21:0.21:0.21,
       tpllh$G$Q = 0.18:0.18:0.18,
       tplhl$G$Q = 0.14:0.14:0.14,
       tpllh$G$QN = 0.19:0.19:0.19,
       tplhl$G$QN = 0.24:0.24:0.24,
       tpllh$RN$Q = 0.13:0.13:0.13,
       tphhl$RN$Q = 0.12:0.12:0.12,
       tplhl$RN$QN = 0.2:0.2:0.2,
       tphlh$RN$QN = 0.17:0.17:0.17,
       tplhl$SN$Q = 0.15:0.15:0.15,
       tphlh$SN$Q = 0.19:0.19:0.19,
       tpllh$SN$QN = 0.2:0.2:0.2,
       tphhl$SN$QN = 0.24:0.24:0.24,
       tminpwh$G = 0.11:0.17:0.24,
       tminpwl$RN = 0.085:0.13:0.17,
       tminpwl$SN = 0.15:0.2:0.24,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.062:-0.062:-0.062,
       tsetup_posedge$D$G = 0.12:0.12:0.12,
       thold_posedge$D$G = 0:0:0,
       trec$RN$G = 0.12:0.12:0.12,
       trem$RN$G = 0:0:0,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$G = 0.19:0.19:0.19,
       trem$SN$G = -0.12:-0.12:-0.12;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     if (G == 1'b1)
       (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     if (G == 1'b1)
       (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (RN *> Q) = (tpllh$RN$Q, tphhl$RN$Q);
     (RN *> QN) = (tphlh$RN$QN, tplhl$RN$QN);
     (SN *> Q) = (tphlh$SN$Q, tplhl$SN$Q);
     (SN *> QN) = (tpllh$SN$QN, tphhl$SN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $recovery(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$G, NOTIFIER);
     $removal (posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$G, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TLATX1 (C, D, Q, QN);
input  C ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (P0000, D, C, 1'B0, 1'B0, NOTIFIER);
   not (NET166, P0000);
   buf (Q, P0000);
   not (QN, P0000);

   specify
     // delay parameters
     specparam
       tpllh$C$Q = 0.13:0.13:0.13,
       tplhl$C$Q = 0.12:0.12:0.12,
       tpllh$C$QN = 0.16:0.16:0.16,
       tplhl$C$QN = 0.16:0.16:0.16,
       tpllh$D$Q = 0.087:0.087:0.087,
       tphhl$D$Q = 0.11:0.11:0.11,
       tplhl$D$QN = 0.12:0.12:0.12,
       tphlh$D$QN = 0.15:0.15:0.15,
       tminpwh$C = 0.088:0.12:0.16,
       tsetup_negedge$D$C = 0.12:0.12:0.12,
       thold_negedge$D$C = -0.062:-0.062:-0.062,
       tsetup_posedge$D$C = 0.062:0.062:0.062,
       thold_posedge$D$C = 0:0:0;

     // path delays
     if (C == 1'b1)
       (C *> Q) = (tpllh$C$Q, tplhl$C$Q);
     if (C == 1'b1)
       (C *> QN) = (tpllh$C$QN, tplhl$C$QN);
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     $setup(negedge D, negedge C, tsetup_negedge$D$C, NOTIFIER);
     $hold (negedge C, negedge D, thold_negedge$D$C,  NOTIFIER);
     $setup(posedge D, negedge C, tsetup_posedge$D$C, NOTIFIER);
     $hold (negedge C, posedge D, thold_posedge$D$C,  NOTIFIER);
     $width(posedge C, tminpwh$C, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.031:0.06:0.089,
       tplhl$A$Y = 0.042:0.072:0.1,
       tpllh$B$Y = 0.036:0.053:0.07,
       tplhl$B$Y = 0.044:0.067:0.091;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff

primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_rslat (out, clr, set, NOTIFIER);

   output out;
   input  clr, set, NOTIFIER;
   reg    out;

   table

// clr   set  NOT  : Qt : Qt+1
//
   ?   1   ?   : ?  :  1  ; // set output
   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1   0   ?   : ?  :  0  ; // reset output
   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_mux2 (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table

// in0 in1 sel :  out
//
    1  ?  0 :  1 ;
    0  ?  0 :  0 ;
    ?  1  1 :  1 ;
    ?  0  1 :  0 ;
    0  0  x :  0 ;
    1  1  x :  1 ;

   endtable
endprimitive // udp_mux2

