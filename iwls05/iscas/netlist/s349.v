//  
//  This design was downloaded from http://www.cbl.ncsu.edu.
//  (Currently available from: http://www.archive.org)
//  
//  Users may copy and distribute the benchmarks as long as they do not 
//  charge for these services.
//  All users of these benchmarks are request to refer to them in presentations 
//  and publications as named in the respective directories (e. g. ISCAS'95,
//  LayoutSynth92, etc.), while providing a pointer to the benchmark access by 
//  ftp from benchmarks@cbl.ncsu.edu.
//  
//  The design was synthesized with Cadence RTL Compiler in a quick 
//  synthesis run.
//  
//  
//  (c) Copyright 2005, Cadence Design Systems, Inc.  All rights reserved. 
//  
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, or sublicense, the Software, and to permit persons to whom
//  the Software is furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included
//  in all copies or substantial portions of the Software.
//  
//  All other requirements of any other incorporated license or permissions
//  statements shall apply.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  USE OF THE SOFTWARE IS AT YOUR SOLE RISK AND EXPENSE.  IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//  OTHER LIABILITY, OF ANY TYPE, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
//  THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
//  

// Generated by Cadence RTL Compiler (RC) v05.10-b006_1

`include "includes.v"

module s349(blif_clk_net, blif_reset_net, START, B0, B1, B2, B3,
     A0, A1, A2, A3, CNTVCO2, CNTVCON2, READY, P0, P1, P2, P3, P4, P5,
     P6, P7);
  input blif_clk_net, blif_reset_net, START, B0, B1, B2, B3, A0, A1,
       A2, A3;
  output CNTVCO2, CNTVCON2, READY, P0, P1, P2, P3, P4, P5, P6, P7;
  wire blif_clk_net, blif_reset_net, START, B0, B1, B2, B3, A0, A1, A2,
       A3;
  wire CNTVCO2, CNTVCON2, READY, P0, P1, P2, P3, P4, P5, P6, P7;
  wire ACVQN0, ACVQN1, ACVQN2, ACVQN3, AX1, AX2, AX3, CT0;
  wire CT1, CT2, MRVQN0, n_3, n_7, n_9, n_17, n_19;
  wire n_20, n_21, n_24, n_26, n_29, n_36, n_38, n_39;
  wire n_44, n_45, n_49, n_50, n_51, n_52, n_53, n_54;
  wire n_55, n_56, n_57, n_58, n_59, n_60, n_62, n_67;
  wire n_68, n_69, n_71, n_73, n_75, n_77, n_80, n_82;
  wire n_83, n_84, n_86, n_88, n_91, n_92, n_95, n_117;
  wire n_123, n_125, n_127, n_150, n_151, n_152, n_153, n_154;
  wire n_174, n_175, n_187, n_188, n_200, n_202, n_203, n_206;
  wire n_209, n_217, n_218, n_219, n_228, n_229, n_231, n_233;
  wire n_238, n_239, n_242, n_248, n_249, n_257, n_259, n_260;
  wire n_262, n_263, n_264, n_265, n_266, n_267, n_268, n_269;
  wire n_271, n_273, n_274, n_275, n_276, n_277, n_278, n_279;
  wire n_280, n_281, n_282, n_285, n_287, n_288, n_291, n_292;
  DFFSRX1 ACVQN2_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_203), .Q (ACVQN2), .QN ());
  DFFSRX1 ACVQN1_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_267), .Q (ACVQN1), .QN ());
  DFFSRX1 ACVQN3_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_231), .Q (ACVQN3), .QN ());
  DFFSRX1 ACVQN0_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_249), .Q (ACVQN0), .QN ());
  NAND2X1 g625(.A (n_92), .B (n_264), .Y (n_95));
  DFFSRX1 MRVQN3_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_83), .Q (), .QN (P3));
  DFFSRX1 MRVQN1_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_86), .Q (), .QN (P1));
  DFFSRX1 MRVQN2_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_91), .Q (), .QN (P2));
  DFFSRX1 MRVQN0_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_88), .Q (MRVQN0), .QN ());
  DFFSRX1 CT2_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_84), .Q (CT2), .QN ());
  DFFSRX1 CT1_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_80), .Q (CT1), .QN ());
  OAI21X1 g635(.A0 (n_123), .A1 (n_24), .B0 (n_219), .Y (n_92));
  OAI22X1 g636(.A0 (n_69), .A1 (n_233), .B0 (n_265), .B1 (P3), .Y
       (n_91));
  OAI22X1 g637(.A0 (n_68), .A1 (n_233), .B0 (n_265), .B1 (P1), .Y
       (n_88));
  DFFSRX1 CT0_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_77), .Q (CT0), .QN ());
  OAI22X1 g638(.A0 (n_71), .A1 (n_233), .B0 (n_265), .B1 (P2), .Y
       (n_86));
  AND2X1 g630(.A (n_75), .B (n_268), .Y (n_84));
  OAI22X1 g632(.A0 (n_73), .A1 (n_233), .B0 (n_50), .B1 (n_265), .Y
       (n_83));
  NOR2X1 g634(.A (n_218), .B (n_271), .Y (n_82));
  NOR2X1 g616(.A (n_67), .B (START), .Y (n_80));
  NOR2X1 g633(.A (n_62), .B (START), .Y (n_77));
  XOR2X1 g647(.A (n_26), .B (n_58), .Y (n_75));
  AOI21X1 g652(.A0 (n_3), .A1 (READY), .B0 (n_60), .Y (n_73));
  AOI21X1 g650(.A0 (n_9), .A1 (READY), .B0 (n_59), .Y (n_71));
  AOI21X1 g651(.A0 (n_7), .A1 (READY), .B0 (n_52), .Y (n_69));
  DFFSRX1 AX3_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_53), .Q (AX3), .QN ());
  DFFSRX1 AX0_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_57), .Q (n_276), .QN ());
  DFFSRX1 AX1_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_56), .Q (AX1), .QN ());
  DFFSRX1 AX2_reg(.RN (n_117), .SN (1'b1), .CK (blif_clk_net), .D
       (n_54), .Q (AX2), .QN ());
  AOI21X1 g653(.A0 (n_125), .A1 (READY), .B0 (n_51), .Y (n_68));
  XOR2X1 g629(.A (n_291), .B (n_45), .Y (n_67));
  XOR2X1 g654(.A (n_44), .B (READY), .Y (n_62));
  NOR2X1 g662(.A (B3), .B (READY), .Y (n_60));
  NOR2X1 g663(.A (B1), .B (READY), .Y (n_59));
  NOR2X1 g670(.A (READY), .B (n_29), .Y (n_58));
  MX2X1 g655(.A (n_275), .B (A0), .S0 (n_55), .Y (n_57));
  MX2X1 g656(.A (AX1), .B (A1), .S0 (n_55), .Y (n_56));
  MX2X1 g657(.A (AX2), .B (A2), .S0 (n_55), .Y (n_54));
  MX2X1 g658(.A (AX3), .B (A3), .S0 (n_55), .Y (n_53));
  NOR2X1 g660(.A (B2), .B (READY), .Y (n_52));
  NOR2X1 g661(.A (B0), .B (READY), .Y (n_51));
  AOI21X1 g671(.A0 (n_20), .A1 (n_285), .B0 (n_49), .Y (n_50));
  NAND2X1 g659(.A (n_38), .B (n_44), .Y (n_45));
  NOR2X1 g684(.A (n_21), .B (ACVQN1), .Y (n_39));
  INVX4 g685(.A (n_38), .Y (READY));
  CLKBUFX1 g672(.A (n_36), .Y (n_55));
  INVX1 g679(.A (n_150), .Y (n_49));
  INVX1 g688(.A (n_260), .Y (n_38));
  NOR2X1 g674(.A (n_262), .B (n_29), .Y (CNTVCO2));
  NAND2X1 g675(.A (n_19), .B (n_291), .Y (CNTVCON2));
  NOR2X1 g673(.A (n_17), .B (n_26), .Y (n_36));
  INVX1 g695(.A (n_21), .Y (n_24));
  NAND2X1 g697(.A (n_275), .B (P0), .Y (n_20));
  NAND2X1 g698(.A (n_44), .B (n_291), .Y (n_29));
  INVX1 g699(.A (n_259), .Y (n_19));
  NAND2X1 g696(.A (AX1), .B (n_151), .Y (n_21));
  NAND2X1 g701(.A (n_263), .B (n_292), .Y (n_17));
  INVX1 g722(.A (n_262), .Y (n_26));
  INVX1 g708(.A (n_263), .Y (n_44));
  INVX1 g714(.A (ACVQN2), .Y (P6));
  INVX1 g725(.A (P1), .Y (n_9));
  INVX1 g716(.A (P3), .Y (n_3));
  INVX1 g720(.A (ACVQN1), .Y (P5));
  INVX1 g717(.A (blif_reset_net), .Y (n_117));
  INVX1 g729(.A (P2), .Y (n_7));
  CLKBUFX1 g745(.A (n_187), .Y (n_123));
  INVX1 g746(.A (P0), .Y (n_125));
  CLKBUFX1 g747(.A (n_127), .Y (P0));
  CLKBUFX1 g748(.A (n_152), .Y (n_127));
  NAND3X1 g11(.A (P4), .B (n_151), .C (n_276), .Y (n_150));
  INVX1 g758(.A (n_153), .Y (n_154));
  AND2X1 g759(.A (n_152), .B (AX2), .Y (n_153));
  CLKBUFX2 g15(.A (n_151), .Y (n_152));
  INVX2 g16(.A (MRVQN0), .Y (n_151));
  INVX1 g769(.A (n_174), .Y (n_175));
  NAND2X1 g770(.A (n_280), .B (n_271), .Y (n_174));
  NAND2X1 g24(.A (n_150), .B (ACVQN1), .Y (n_187));
  OAI21X1 g23(.A0 (n_150), .A1 (ACVQN1), .B0 (n_21), .Y (n_188));
  NAND2X2 g20(.A (n_257), .B (n_202), .Y (n_203));
  AND2X1 g777(.A (n_200), .B (n_268), .Y (n_202));
  NAND2X1 g778(.A (n_265), .B (ACVQN2), .Y (n_200));
  NAND2X1 g784(.A (n_127), .B (AX3), .Y (n_206));
  INVX1 g785(.A (n_206), .Y (n_209));
  NAND2X2 g51(.A (P6), .B (n_153), .Y (n_282));
  INVX1 g48(.A (n_218), .Y (n_219));
  INVX1 g49(.A (n_217), .Y (n_218));
  NAND2X2 g50(.A (n_187), .B (n_188), .Y (n_217));
  NAND3X1 g31(.A (n_228), .B (n_229), .C (n_268), .Y (n_231));
  NAND3X1 g33(.A (n_273), .B (n_269), .C (n_233), .Y (n_228));
  NAND2X1 g32(.A (n_265), .B (ACVQN3), .Y (n_229));
  INVX2 g789(.A (n_265), .Y (n_233));
  INVX1 g790(.A (ACVQN3), .Y (P7));
  OAI21X1 g793(.A0 (n_219), .A1 (n_281), .B0 (n_264), .Y (n_238));
  NOR2X1 g794(.A (n_82), .B (n_175), .Y (n_239));
  OAI21X1 g795(.A0 (n_95), .A1 (n_242), .B0 (n_248), .Y (n_249));
  AND2X1 g796(.A (n_39), .B (n_49), .Y (n_242));
  AOI21X1 g797(.A0 (n_265), .A1 (n_285), .B0 (START), .Y (n_248));
  NAND3X1 g803(.A (n_277), .B (n_278), .C (n_233), .Y (n_257));
  OR2X1 g804(.A (n_269), .B (n_174), .Y (n_278));
  OAI21X1 g805(.A0 (n_175), .A1 (n_287), .B0 (n_274), .Y (n_277));
  NOR2X1 g12(.A (n_259), .B (n_291), .Y (n_260));
  NAND2X1 g13(.A (CT0), .B (CT2), .Y (n_259));
  INVX1 g809(.A (CT2), .Y (n_262));
  INVX1 g14(.A (CT0), .Y (n_263));
  OAI21X1 g810(.A0 (n_239), .A1 (n_238), .B0 (n_266), .Y (n_267));
  AOI21X1 g25(.A0 (n_265), .A1 (ACVQN1), .B0 (START), .Y (n_266));
  INVX4 g26(.A (n_264), .Y (n_265));
  NOR2X1 g27(.A (n_260), .B (n_36), .Y (n_264));
  INVX1 g28(.A (START), .Y (n_268));
  AND2X1 g22(.A (n_269), .B (n_273), .Y (n_274));
  NAND2X1 g811(.A (n_209), .B (P7), .Y (n_269));
  NAND3X1 g812(.A (n_279), .B (n_271), .C (n_288), .Y (n_273));
  NAND2X2 g814(.A (n_154), .B (ACVQN2), .Y (n_271));
  NAND2X1 g815(.A (n_206), .B (ACVQN3), .Y (n_288));
  CLKBUFX1 g816(.A (n_276), .Y (n_275));
  NAND2X1 g817(.A (n_282), .B (n_217), .Y (n_279));
  NAND2X1 g813_dup(.A (n_282), .B (n_217), .Y (n_280));
  CLKBUFX1 g818(.A (n_282), .Y (n_281));
  INVX1 g820(.A (P4), .Y (n_285));
  INVX1 g822(.A (ACVQN0), .Y (P4));
  CLKBUFX1 g823(.A (n_288), .Y (n_287));
  CLKBUFX3 g826(.A (CT1), .Y (n_291));
  INVX1 g827(.A (CT1), .Y (n_292));
endmodule

