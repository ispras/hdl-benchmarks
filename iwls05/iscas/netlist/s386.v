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

module s386(blif_clk_net, blif_reset_net, v6, v5, v4, v3, v2, v1,
     v0, v13_D_12, v13_D_11, v13_D_10, v13_D_9, v13_D_8, v13_D_7,
     v13_D_6);
  input blif_clk_net, blif_reset_net, v6, v5, v4, v3, v2, v1, v0;
  output v13_D_12, v13_D_11, v13_D_10, v13_D_9, v13_D_8, v13_D_7,
       v13_D_6;
  wire blif_clk_net, blif_reset_net, v6, v5, v4, v3, v2, v1, v0;
  wire v13_D_12, v13_D_11, v13_D_10, v13_D_9, v13_D_8, v13_D_7, v13_D_6;
  wire n_0, n_1, n_5, n_8, n_9, n_15, n_20, n_21;
  wire n_22, n_23, n_24, n_27, n_28, n_29, n_30, n_32;
  wire n_35, n_40, n_43, n_44, n_48, n_49, n_51, n_54;
  wire n_55, n_56, n_57, n_58, n_59, n_64, n_65, n_67;
  wire n_68, n_69, n_71, n_72, n_73, n_74, n_75, n_76;
  wire n_77, n_80, n_81, n_82, n_84, n_85, n_86, n_87;
  wire n_92, n_93, n_94, n_96, n_100, n_101, n_102, n_103;
  wire n_104, n_106, n_107, n_108, n_109, n_111, n_113, n_114;
  wire n_115, n_117, n_120, n_121, n_122, n_123, n_125, n_126;
  wire n_127, n_128, n_129, n_130, n_131, n_132, n_133, n_135;
  wire n_138, n_139, n_141, n_143, n_144, n_145, n_146, n_148;
  wire n_150, n_151, n_152, n_153, n_154, n_155, n_156, n_157;
  wire n_159, n_160, n_161, n_162, n_163, n_164, n_165, n_167;
  wire n_168, n_169, n_172, n_174, n_178, n_180, n_182, n_183;
  wire n_185, n_186, n_190, n_193, n_194, n_195, n_204, n_205;
  wire n_206, n_210, n_211, n_213, n_214, n_215, n_216, n_217;
  wire n_218, n_219, n_220, n_221, n_225, n_227, n_228, n_233;
  wire n_234, n_235, n_236, n_237, n_238, n_239, n_241, n_242;
  wire n_243, n_244, n_246, n_247, n_248, n_249, n_250, n_251;
  wire n_252, n_253, v7, v8, v9, v10, v11, v12;
  OAI21X1 g523(.A0 (n_186), .A1 (n_132), .B0 (n_161), .Y (v13_D_11));
  DFFSRX1 v8_reg(.RN (n_185), .SN (1'b1), .CK (blif_clk_net), .D
       (n_213), .Q (v8), .QN ());
  AOI21X1 g529(.A0 (n_138), .A1 (n_150), .B0 (n_183), .Y (n_186));
  DFFSRX1 v10_reg(.RN (n_185), .SN (1'b1), .CK (blif_clk_net), .D
       (n_182), .Q (v10), .QN ());
  DFFSRX1 v12_reg(.RN (n_185), .SN (1'b1), .CK (blif_clk_net), .D
       (n_180), .Q (v12), .QN ());
  NOR2X1 g533(.A (n_174), .B (n_164), .Y (n_183));
  DFFSRX1 v9_reg(.RN (n_185), .SN (1'b1), .CK (blif_clk_net), .D
       (n_172), .Q (v9), .QN ());
  NAND2X1 g534(.A (n_178), .B (n_115), .Y (n_182));
  DFFSRX1 v7_reg(.RN (n_185), .SN (1'b1), .CK (blif_clk_net), .D
       (n_168), .Q (v7), .QN ());
  DFFSRX1 v11_reg(.RN (n_185), .SN (1'b1), .CK (blif_clk_net), .D
       (n_253), .Q (v11), .QN ());
  AND2X1 g538(.A (n_169), .B (n_121), .Y (v13_D_9));
  AOI21X1 g535(.A0 (n_109), .A1 (n_159), .B0 (n_252), .Y (n_180));
  AOI21X1 g542(.A0 (n_106), .A1 (n_160), .B0 (n_163), .Y (n_178));
  NOR2X1 g540(.A (n_162), .B (n_133), .Y (v13_D_10));
  NOR2X1 g546(.A (n_157), .B (n_167), .Y (v13_D_7));
  AOI21X1 g536(.A0 (n_151), .A1 (n_135), .B0 (n_252), .Y (v13_D_6));
  AOI22X1 g543(.A0 (n_152), .A1 (n_127), .B0 (n_80), .B1 (v1), .Y
       (n_174));
  OR4X1 g528(.A (n_141), .B (n_92), .C (n_114), .D (n_146), .Y (n_172));
  NOR2X1 g561(.A (n_156), .B (n_117), .Y (v13_D_12));
  INVX1 g559(.A (n_165), .Y (v13_D_8));
  AOI21X1 g545(.A0 (n_148), .A1 (n_145), .B0 (n_96), .Y (n_169));
  NOR2X1 g537(.A (n_154), .B (n_167), .Y (n_168));
  NAND4X1 g560(.A (n_144), .B (v0), .C (n_8), .D (n_164), .Y (n_165));
  AOI21X1 g547(.A0 (n_73), .A1 (n_241), .B0 (n_205), .Y (n_163));
  NAND4X1 g548(.A (n_48), .B (n_129), .C (v1), .D (n_111), .Y (n_162));
  OAI21X1 g570(.A0 (n_131), .A1 (n_160), .B0 (n_103), .Y (n_161));
  INVX1 g549(.A (n_155), .Y (n_159));
  NAND2X1 g555(.A (n_143), .B (n_153), .Y (n_157));
  NAND2X1 g563(.A (n_123), .B (n_160), .Y (n_156));
  AOI21X1 g550(.A0 (n_93), .A1 (n_101), .B0 (n_228), .Y (n_155));
  OAI21X1 g551(.A0 (n_104), .A1 (n_221), .B0 (n_153), .Y (n_154));
  NOR2X1 g552(.A (n_126), .B (n_48), .Y (n_152));
  OR2X1 g554(.A (n_130), .B (n_122), .Y (n_151));
  NOR2X1 g590(.A (n_107), .B (n_64), .Y (n_150));
  NAND3X1 g599(.A (n_48), .B (v0), .C (n_35), .Y (n_148));
  AOI21X1 g544(.A0 (n_82), .A1 (n_86), .B0 (v0), .Y (n_146));
  NAND3X1 g565(.A (n_102), .B (n_75), .C (v4), .Y (n_145));
  NOR2X1 g566(.A (n_113), .B (v6), .Y (n_144));
  OR2X1 g568(.A (n_120), .B (n_139), .Y (n_143));
  AOI21X1 g557(.A0 (n_74), .A1 (n_15), .B0 (n_72), .Y (n_141));
  AND2X1 g589(.A (n_242), .B (n_128), .Y (n_138));
  NAND3X1 g569(.A (n_247), .B (n_125), .C (v5), .Y (n_135));
  NAND2X1 g621(.A (n_84), .B (n_132), .Y (n_133));
  NOR2X1 g640(.A (n_81), .B (n_132), .Y (n_131));
  AOI21X1 g573(.A0 (v4), .A1 (n_108), .B0 (n_76), .Y (n_130));
  AND2X1 g642(.A (n_128), .B (n_127), .Y (n_129));
  AOI21X1 g574(.A0 (n_108), .A1 (n_125), .B0 (n_58), .Y (n_126));
  NOR2X1 g580(.A (n_122), .B (v0), .Y (n_123));
  NOR2X1 g583(.A (n_122), .B (n_132), .Y (n_121));
  AND2X1 g585(.A (n_221), .B (n_108), .Y (n_120));
  NAND3X1 g586(.A (n_164), .B (n_132), .C (v5), .Y (n_117));
  INVX1 g597(.A (n_114), .Y (n_115));
  NAND2X1 g602(.A (n_160), .B (n_87), .Y (n_113));
  NAND2X1 g605(.A (n_43), .B (n_35), .Y (n_111));
  NAND3X1 g606(.A (n_94), .B (n_108), .C (n_64), .Y (n_109));
  NAND2X1 g608(.A (n_127), .B (v0), .Y (n_107));
  AOI22X1 g571(.A0 (n_9), .A1 (v0), .B0 (n_67), .B1 (n_35), .Y (n_106));
  NAND2X1 g572(.A (n_68), .B (n_77), .Y (n_104));
  NOR2X1 g639(.A (v0), .B (n_164), .Y (n_103));
  NOR2X1 g652(.A (v1), .B (n_35), .Y (n_102));
  NAND4X1 g576(.A (v2), .B (v3), .C (n_85), .D (n_100), .Y (n_101));
  INVX1 g674(.A (n_128), .Y (n_96));
  NAND2X1 g594(.A (n_217), .B (n_205), .Y (n_93));
  NOR2X1 g598(.A (n_57), .B (n_15), .Y (n_114));
  NOR2X1 g601(.A (n_44), .B (n_15), .Y (n_92));
  INVX1 g625(.A (n_87), .Y (n_122));
  NAND4X1 g575(.A (n_40), .B (n_85), .C (n_234), .D (n_132), .Y (n_86));
  INVX1 g655(.A (n_125), .Y (n_84));
  INVX1 g675(.A (n_108), .Y (n_128));
  OR2X1 g578(.A (n_15), .B (n_205), .Y (n_167));
  NAND2X1 g579(.A (n_51), .B (n_233), .Y (n_82));
  INVX1 g694(.A (n_127), .Y (n_81));
  OR2X1 g581(.A (n_160), .B (n_206), .Y (n_80));
  INVX1 g587(.A (n_77), .Y (n_139));
  NOR2X1 g591(.A (n_22), .B (n_75), .Y (n_76));
  NAND2X1 g592(.A (n_59), .B (v0), .Y (n_74));
  NAND2X1 g595(.A (n_54), .B (v1), .Y (n_73));
  NAND2X1 g600(.A (v1), .B (n_27), .Y (n_72));
  NAND2X1 g603(.A (n_30), .B (n_233), .Y (n_71));
  NAND2X1 g607(.A (n_29), .B (n_21), .Y (n_69));
  CLKBUFX1 g695(.A (n_206), .Y (n_127));
  NAND2X1 g623(.A (n_233), .B (n_55), .Y (n_68));
  INVX1 g626(.A (n_67), .Y (n_87));
  INVX1 g656(.A (n_65), .Y (n_125));
  INVX1 g704(.A (n_20), .Y (n_164));
  NOR2X1 g584(.A (n_24), .B (v3), .Y (n_58));
  NAND2X1 g588(.A (n_75), .B (n_23), .Y (n_77));
  NAND2X1 g651(.A (n_206), .B (n_5), .Y (n_57));
  INVX1 g658(.A (n_55), .Y (n_56));
  INVX1 g627(.A (n_85), .Y (n_67));
  AND2X1 g624(.A (n_239), .B (n_20), .Y (n_51));
  AND2X1 g609(.A (n_190), .B (n_205), .Y (n_49));
  INVX1 g667(.A (n_48), .Y (n_64));
  NOR2X1 g622(.A (n_205), .B (n_243), .Y (n_94));
  NAND2X1 g619(.A (v1), .B (n_206), .Y (n_44));
  NAND2X1 g641(.A (v0), .B (v5), .Y (n_43));
  CLKBUFX3 g631(.A (n_40), .Y (n_160));
  INVX1 g657(.A (n_55), .Y (n_65));
  INVX1 g677(.A (n_233), .Y (n_108));
  INVX2 g668(.A (n_100), .Y (n_48));
  INVX1 g632(.A (n_32), .Y (n_40));
  INVX1 g628(.A (n_28), .Y (n_85));
  INVX2 g659(.A (n_243), .Y (n_55));
  NAND2X1 g615(.A (n_225), .B (v2), .Y (n_30));
  NAND2X1 g617(.A (n_228), .B (n_235), .Y (n_29));
  INVX1 g629(.A (n_28), .Y (n_59));
  INVX1 g633(.A (n_32), .Y (n_27));
  INVX1 g643(.A (n_23), .Y (n_24));
  INVX1 g649(.A (n_15), .Y (n_54));
  INVX1 g637(.A (n_21), .Y (n_22));
  INVX1 g706(.A (n_20), .Y (n_35));
  AND2X1 g644(.A (n_1), .B (n_235), .Y (n_23));
  NAND2X2 g650(.A (n_20), .B (n_8), .Y (n_15));
  NAND2X2 g630(.A (n_204), .B (n_235), .Y (n_28));
  NAND2X1 g638(.A (n_0), .B (n_227), .Y (n_21));
  INVX1 g707(.A (v10), .Y (n_20));
  NAND2X1 g634(.A (n_227), .B (n_238), .Y (n_32));
  NAND2X1 g618(.A (v1), .B (n_8), .Y (n_9));
  INVX1 g654(.A (n_244), .Y (n_190));
  NOR2X1 g620(.A (v3), .B (n_238), .Y (n_75));
  INVX2 g669(.A (n_225), .Y (n_100));
  NOR2X1 g616(.A (v1), .B (n_5), .Y (n_153));
  INVX1 g714(.A (n_8), .Y (n_132));
  INVX1 g715(.A (v9), .Y (n_8));
  INVX1 g672(.A (v4), .Y (n_1));
  INVX1 g691(.A (v0), .Y (n_5));
  INVX1 g692(.A (blif_reset_net), .Y (n_185));
  INVX1 g653(.A (v2), .Y (n_0));
  OR2X1 g33(.A (n_94), .B (n_48), .Y (n_193));
  NAND2X1 g32(.A (n_194), .B (n_48), .Y (n_195));
  INVX1 g41(.A (n_49), .Y (n_194));
  AOI21X1 g722(.A0 (n_210), .A1 (n_211), .B0 (n_252), .Y (n_213));
  NAND2X1 g723(.A (n_206), .B (n_220), .Y (n_210));
  INVX4 g726(.A (n_205), .Y (n_206));
  INVX2 g727(.A (n_204), .Y (n_205));
  INVX1 g728(.A (v12), .Y (n_204));
  NAND3X1 g730(.A (n_193), .B (n_195), .C (n_233), .Y (n_211));
  NAND3X1 g732(.A (n_214), .B (n_215), .C (n_219), .Y (n_220));
  NAND3X1 g733(.A (n_71), .B (n_56), .C (v4), .Y (n_214));
  NAND3X1 g35(.A (n_69), .B (n_100), .C (v3), .Y (n_215));
  NAND2X2 g34(.A (n_217), .B (n_218), .Y (n_219));
  INVX2 g734(.A (n_216), .Y (n_217));
  NAND2X2 g735(.A (n_244), .B (n_238), .Y (n_216));
  NOR2X1 g736(.A (n_234), .B (n_227), .Y (n_218));
  CLKBUFX1 g1(.A (n_217), .Y (n_221));
  CLKBUFX2 g670_dup(.A (n_238), .Y (n_225));
  INVX2 g739(.A (n_227), .Y (n_228));
  INVX2 g740(.A (v7), .Y (n_227));
  INVX2 g743(.A (n_228), .Y (n_233));
  INVX1 g744(.A (v5), .Y (n_234));
  NAND4X1 g745(.A (n_237), .B (n_239), .C (n_234), .D (v1), .Y (n_241));
  NOR2X1 g746(.A (n_228), .B (n_236), .Y (n_237));
  NAND2X1 g747(.A (v10), .B (n_235), .Y (n_236));
  INVX2 g748(.A (v11), .Y (n_235));
  CLKBUFX1 g749(.A (n_238), .Y (n_239));
  INVX2 g42(.A (v8), .Y (n_238));
  INVX1 g751(.A (n_236), .Y (n_242));
  CLKBUFX2 g752(.A (n_235), .Y (n_243));
  INVX2 g753(.A (n_235), .Y (n_244));
  AOI21X1 g754(.A0 (n_250), .A1 (n_251), .B0 (n_252), .Y (n_253));
  AOI21X1 g40(.A0 (n_246), .A1 (n_247), .B0 (n_249), .Y (n_250));
  NOR2X1 g46(.A (v5), .B (n_65), .Y (n_246));
  NOR2X1 g44(.A (n_32), .B (n_206), .Y (n_247));
  INVX1 g755(.A (n_248), .Y (n_249));
  NAND3X1 g43(.A (n_59), .B (n_239), .C (v2), .Y (n_248));
  OAI21X1 g756(.A0 (n_139), .A1 (n_228), .B0 (n_206), .Y (n_251));
  NAND2X1 g45(.A (n_54), .B (n_153), .Y (n_252));
endmodule

