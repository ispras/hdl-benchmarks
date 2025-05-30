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

module s1196(blif_clk_net, blif_reset_net, G0, G1, G2, G3, G4,
     G5, G6, G7, G8, G9, G10, G11, G12, G13, G546, G539, G550, G551,
     G552, G547, G548, G549, G530, G45, G542, G532, G535, G537);
  input blif_clk_net, blif_reset_net, G0, G1, G2, G3, G4, G5, G6, G7,
       G8, G9, G10, G11, G12, G13;
  output G546, G539, G550, G551, G552, G547, G548, G549, G530, G45,
       G542, G532, G535, G537;
  wire blif_clk_net, blif_reset_net, G0, G1, G2, G3, G4, G5, G6, G7,
       G8, G9, G10, G11, G12, G13;
  wire G546, G539, G550, G551, G552, G547, G548, G549, G530, G45, G542,
       G532, G535, G537;
  wire G29, G30, G31, G32, G33, G34, G35, G36;
  wire G37, G38, G39, G40, G42, G43, G44, G46;
  wire n_9, n_18, n_21, n_32, n_39, n_44, n_48, n_52;
  wire n_54, n_55, n_59, n_61, n_64, n_65, n_66, n_68;
  wire n_74, n_75, n_77, n_78, n_80, n_89, n_90, n_91;
  wire n_95, n_98, n_99, n_104, n_106, n_107, n_108, n_109;
  wire n_110, n_113, n_116, n_119, n_127, n_131, n_138, n_140;
  wire n_142, n_143, n_146, n_154, n_158, n_160, n_161, n_162;
  wire n_163, n_164, n_165, n_166, n_167, n_168, n_170, n_173;
  wire n_180, n_182, n_183, n_186, n_187, n_188, n_189, n_190;
  wire n_191, n_192, n_193, n_194, n_196, n_197, n_198, n_203;
  wire n_205, n_206, n_208, n_209, n_212, n_213, n_217, n_218;
  wire n_220, n_221, n_224, n_225, n_226, n_227, n_228, n_229;
  wire n_230, n_235, n_236, n_239, n_240, n_242, n_243, n_244;
  wire n_247, n_248, n_252, n_253, n_255, n_257, n_258, n_259;
  wire n_260, n_261, n_262, n_263, n_264, n_265, n_266, n_267;
  wire n_269, n_272, n_274, n_276, n_277, n_278, n_279, n_280;
  wire n_282, n_283, n_284, n_285, n_286, n_287, n_290, n_291;
  wire n_292, n_294, n_295, n_296, n_298, n_299, n_300, n_301;
  wire n_303, n_304, n_305, n_306, n_307, n_308, n_309, n_311;
  wire n_312, n_313, n_314, n_315, n_316, n_319, n_320, n_321;
  wire n_322, n_326, n_329, n_332, n_333, n_334, n_335, n_336;
  wire n_337, n_338, n_339, n_340, n_341, n_343, n_344, n_345;
  wire n_346, n_349, n_350, n_352, n_353, n_354, n_356, n_358;
  wire n_359, n_360, n_361, n_362, n_363, n_364, n_367, n_368;
  wire n_369, n_370, n_371, n_372, n_373, n_374, n_375, n_376;
  wire n_377, n_378, n_379, n_380, n_381, n_383, n_384, n_386;
  wire n_388, n_393, n_395, n_396, n_399, n_400, n_401, n_402;
  wire n_403, n_404, n_405, n_406, n_408, n_409, n_412, n_413;
  wire n_414, n_416, n_418, n_419, n_420, n_422, n_425, n_434;
  wire n_436, n_440, n_441, n_442, n_443, n_445, n_446, n_447;
  wire n_448, n_450, n_452, n_453, n_454, n_455, n_457, n_460;
  wire n_461, n_463, n_464, n_465, n_467, n_469, n_470, n_471;
  wire n_473, n_474, n_475, n_476, n_478, n_479, n_480, n_481;
  wire n_483, n_484, n_485, n_488, n_489, n_491, n_492, n_493;
  wire n_494, n_496, n_497, n_499, n_500, n_503, n_504, n_506;
  wire n_507, n_509, n_510, n_512, n_513, n_515, n_516, n_518;
  wire n_521, n_522, n_525, n_526, n_528, n_529, n_530, n_533;
  wire n_535, n_538, n_549, n_552, n_554, n_564, n_570, n_571;
  wire n_574, n_575, n_576, n_579, n_580, n_585, n_588, n_607;
  wire n_624, n_625, n_650, n_653, n_654, n_655, n_656, n_657;
  wire n_658, n_659, n_664, n_666, n_667, n_668, n_672, n_674;
  wire n_678, n_684, n_733, n_737, n_738, n_739, n_740, n_742;
  wire n_749, n_750, n_754, n_755, n_756, n_757, n_758, n_759;
  wire n_760, n_761, n_762, n_763, n_779, n_780, n_781, n_782;
  wire n_783, n_784, n_785, n_786, n_788, n_789, n_790, n_791;
  wire n_792, n_793, n_794, n_795, n_796, n_797, n_798, n_800;
  wire n_801, n_802, n_803, n_806, n_809, n_812, n_813, n_814;
  wire n_821, n_822, n_823, n_837, n_838, n_839, n_841, n_844;
  wire n_850, n_859, n_865, n_869, n_870, n_871, n_872, n_873;
  wire n_874, n_875, n_876, n_877, n_878, n_879, n_880, n_882;
  wire n_883, n_884, n_885, n_886, n_887, n_888, n_889, n_890;
  wire n_895, n_896, n_897, n_898, n_899, n_900, n_901, n_902;
  wire n_903, n_906, n_907, n_908, n_909, n_910, n_912, n_914;
  wire n_915, n_918, n_945, n_946, n_980, n_983, n_985, n_986;
  wire n_999, n_1000, n_1001, n_1002, n_1019, n_1035, n_1036, n_1041;
  wire n_1042, n_1048, n_1050, n_1057, n_1066, n_1069, n_1071, n_1104;
  wire n_1105, n_1106, n_1107, n_1108, n_1109, n_1110, n_1111, n_1112;
  wire n_1113, n_1114, n_1115, n_1116, n_1117;
  NAND4X1 g1592(.A (n_457), .B (n_525), .C (n_552), .D (n_481), .Y
       (G550));
  INVX1 g1593(.A (n_554), .Y (G537));
  DFFSRX1 G41_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_579), .Q (), .QN (G546));
  OAI21X1 g1591(.A0 (n_549), .A1 (G12), .B0 (n_526), .Y (G532));
  AOI22X1 g1594(.A0 (n_903), .A1 (n_321), .B0 (n_386), .B1 (n_871), .Y
       (n_554));
  NAND4X1 g1598(.A (n_552), .B (n_535), .C (n_484), .D (n_465), .Y
       (G549));
  INVX1 g1600(.A (n_878), .Y (G535));
  AOI21X1 g1603(.A0 (n_489), .A1 (n_167), .B0 (n_529), .Y (n_549));
  NAND3X1 g1608(.A (n_737), .B (n_464), .C (n_738), .Y (G551));
  OAI21X1 g1609(.A0 (n_400), .A1 (n_450), .B0 (n_528), .Y (G552));
  NAND2X1 g1610(.A (n_497), .B (n_533), .Y (G530));
  NAND3X1 g1602(.A (G33), .B (n_9), .C (n_248), .Y (n_552));
  OAI21X1 g1621(.A0 (n_399), .A1 (n_538), .B0 (n_479), .Y (G547));
  OAI21X1 g1625(.A0 (G42), .A1 (n_538), .B0 (n_474), .Y (G548));
  NAND2X1 g1597(.A (n_521), .B (n_821), .Y (G542));
  NAND3X1 g1614(.A (n_378), .B (n_509), .C (n_104), .Y (n_535));
  NAND3X1 g1629(.A (n_409), .B (n_509), .C (n_188), .Y (n_738));
  NAND3X1 g1615(.A (n_321), .B (n_383), .C (n_509), .Y (n_533));
  DFFSRX1 G33_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_516), .Q (), .QN (G33));
  DFFSRX1 G45_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_522), .Q (G45), .QN ());
  NAND3X1 g1611(.A (n_506), .B (n_469), .C (n_515), .Y (n_529));
  AOI22X1 g1626(.A0 (n_403), .A1 (n_467), .B0 (G40), .B1 (n_509), .Y
       (n_528));
  NAND3X1 g1628(.A (n_404), .B (n_509), .C (G0), .Y (n_526));
  OR2X1 g1630(.A (n_422), .B (n_510), .Y (n_525));
  OR2X1 g1618(.A (n_870), .B (n_653), .Y (n_522));
  AOI21X1 g1607(.A0 (n_295), .A1 (G34), .B0 (n_507), .Y (n_521));
  INVX1 g1619(.A (n_512), .Y (G539));
  INVX1 g1645(.A (n_509), .Y (n_538));
  AND2X1 g1613(.A (n_446), .B (n_503), .Y (n_516));
  NAND3X1 g1632(.A (n_607), .B (n_363), .C (n_513), .Y (n_515));
  AOI21X1 g1620(.A0 (n_419), .A1 (n_455), .B0 (n_499), .Y (n_512));
  INVX2 g1643(.A (n_510), .Y (n_509));
  AOI21X1 g1624(.A0 (n_341), .A1 (n_138), .B0 (n_850), .Y (n_507));
  NAND2X1 g1633(.A (n_504), .B (n_284), .Y (n_518));
  NAND2X1 g1634(.A (n_494), .B (n_1113), .Y (n_506));
  OR2X1 g1635(.A (n_504), .B (n_733), .Y (n_653));
  NAND4X1 g1638(.A (n_493), .B (G0), .C (n_95), .D (n_1048), .Y
       (n_503));
  INVX1 g1647(.A (n_500), .Y (n_510));
  OAI22X1 g1637(.A0 (n_452), .A1 (n_763), .B0 (n_436), .B1 (n_496), .Y
       (n_499));
  NAND2X1 g1640(.A (n_761), .B (n_871), .Y (n_497));
  NOR2X1 g1648(.A (G13), .B (n_492), .Y (n_500));
  NOR2X1 g1641(.A (n_806), .B (n_496), .Y (n_504));
  NAND2X1 g1649(.A (n_488), .B (n_483), .Y (n_737));
  OAI21X1 g1651(.A0 (n_575), .A1 (n_74), .B0 (n_440), .Y (n_494));
  INVX1 g1652(.A (n_492), .Y (n_493));
  INVX1 g1658(.A (n_491), .Y (n_513));
  NAND2X1 g1653(.A (n_485), .B (n_21), .Y (n_492));
  AND2X1 g1659(.A (n_576), .B (n_896), .Y (n_491));
  AOI21X1 g1660(.A0 (n_229), .A1 (n_98), .B0 (n_575), .Y (n_489));
  OAI21X1 g1654(.A0 (n_358), .A1 (n_475), .B0 (n_480), .Y (n_488));
  NAND3X1 g1661(.A (n_1109), .B (G12), .C (n_9), .Y (n_496));
  INVX1 g1665(.A (n_1109), .Y (n_485));
  NAND2X1 g1667(.A (n_476), .B (n_483), .Y (n_484));
  NAND2X2 g1668(.A (n_763), .B (n_797), .Y (n_576));
  NAND3X1 g1663(.A (n_478), .B (n_483), .C (n_321), .Y (n_481));
  AOI21X1 g1670(.A0 (n_461), .A1 (n_262), .B0 (n_471), .Y (n_480));
  NAND3X1 g1650(.A (n_338), .B (G34), .C (n_290), .Y (n_479));
  OAI21X1 g1669(.A0 (n_470), .A1 (n_188), .B0 (n_460), .Y (n_478));
  AOI21X1 g1672(.A0 (n_306), .A1 (n_370), .B0 (n_475), .Y (n_476));
  NAND2X1 g1655(.A (n_376), .B (G34), .Y (n_474));
  NAND2X1 g1657(.A (G34), .B (n_1035), .Y (n_473));
  NOR2X1 g1674(.A (n_1001), .B (n_470), .Y (n_471));
  NAND3X1 g1676(.A (G43), .B (G13), .C (n_467), .Y (n_469));
  NAND3X1 g1699(.A (n_335), .B (n_243), .C (n_463), .Y (n_465));
  NAND3X1 g1701(.A (G39), .B (n_463), .C (n_75), .Y (n_464));
  DFFSRX1 G34_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_889), .Q (G34), .QN ());
  NOR2X1 g1675(.A (n_419), .B (n_454), .Y (n_733));
  NAND2X2 g1679(.A (n_467), .B (n_1048), .Y (n_475));
  NOR2X1 g1681(.A (n_448), .B (n_1048), .Y (n_461));
  NAND3X1 g1684(.A (n_467), .B (n_266), .C (n_188), .Y (n_460));
  NAND2X1 g1702(.A (n_260), .B (n_463), .Y (n_457));
  DFFSRX1 G40_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_443), .Q (), .QN (G40));
  DFFSRX1 G46_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_441), .Q (), .QN (G46));
  NAND2X1 g1680(.A (n_447), .B (n_104), .Y (n_470));
  INVX1 g1682(.A (n_454), .Y (n_455));
  NOR2X1 g1687(.A (n_440), .B (n_332), .Y (n_453));
  NAND2X1 g1710(.A (n_797), .B (n_901), .Y (n_452));
  INVX1 g1712(.A (n_463), .Y (n_450));
  NAND2X1 g1683(.A (n_442), .B (n_885), .Y (n_454));
  INVX1 g1688(.A (n_447), .Y (n_448));
  CLKBUFX3 g1689(.A (n_447), .Y (n_467));
  NOR2X1 g1713(.A (n_445), .B (G13), .Y (n_463));
  OR2X1 g1714(.A (n_445), .B (n_371), .Y (n_446));
  AND2X1 g1727(.A (n_274), .B (n_434), .Y (n_443));
  INVX1 g1690(.A (n_442), .Y (n_447));
  AOI21X1 g1692(.A0 (n_1069), .A1 (n_841), .B0 (n_425), .Y (n_441));
  INVX1 g1693(.A (n_897), .Y (n_440));
  INVX1 g1719(.A (n_806), .Y (n_436));
  AOI21X1 g1741(.A0 (n_413), .A1 (n_1035), .B0 (n_369), .Y (n_434));
  NAND2X1 g1691(.A (n_886), .B (n_882), .Y (n_442));
  NAND3X1 g1725(.A (n_882), .B (G32), .C (n_901), .Y (n_445));
  NAND4X1 g1739(.A (n_414), .B (n_373), .C (n_406), .D (n_110), .Y
       (n_654));
  NAND3X1 g1700(.A (n_412), .B (n_198), .C (n_319), .Y (n_425));
  DFFSRX1 G43_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_416), .Q (), .QN (G43));
  AOI22X1 g1731(.A0 (G29), .A1 (G0), .B0 (n_408), .B1 (n_248), .Y
       (n_422));
  INVX1 g1705(.A (n_420), .Y (n_419));
  NAND4X1 g1711(.A (n_405), .B (n_77), .C (n_187), .D (n_59), .Y
       (n_418));
  AOI21X1 g1742(.A0 (n_194), .A1 (n_248), .B0 (n_402), .Y (n_416));
  NAND2X1 g1790(.A (n_255), .B (n_414), .Y (n_413));
  AOI21X1 g1703(.A0 (n_244), .A1 (n_667), .B0 (n_388), .Y (n_412));
  NAND2X1 g1707(.A (n_570), .B (n_571), .Y (n_420));
  DFFSRX1 G44_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_381), .Q (G44), .QN ());
  DFFSRX1 G29_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_380), .Q (), .QN (G29));
  OR2X1 g1750(.A (n_379), .B (n_408), .Y (n_409));
  NOR2X1 g1724(.A (G35), .B (n_912), .Y (n_405));
  NAND2X1 g1735(.A (n_375), .B (n_168), .Y (n_404));
  DFFSRX1 G32_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_372), .Q (G32), .QN ());
  NOR2X1 g1751(.A (n_367), .B (n_65), .Y (n_403));
  NAND2X1 g1762(.A (n_368), .B (n_162), .Y (n_402));
  NAND2X1 g1764(.A (n_374), .B (n_116), .Y (n_401));
  AOI21X1 g1765(.A0 (n_354), .A1 (n_321), .B0 (n_221), .Y (n_400));
  AOI22X1 g1766(.A0 (n_353), .A1 (n_607), .B0 (n_313), .B1 (n_290), .Y
       (n_399));
  NAND2X1 g1786(.A (G38), .B (G37), .Y (n_396));
  AOI22X1 g1704(.A0 (n_915), .A1 (n_1057), .B0 (n_99), .B1 (n_104), .Y
       (n_395));
  NAND3X1 g1820(.A (n_667), .B (n_59), .C (n_580), .Y (n_393));
  OR2X1 g1823(.A (n_315), .B (n_668), .Y (n_414));
  NAND3X1 g1715(.A (n_1117), .B (G2), .C (n_77), .Y (n_570));
  AOI21X1 g1716(.A0 (n_364), .A1 (G0), .B0 (n_1048), .Y (n_388));
  DFFSRX1 G42_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_377), .Q (G42), .QN ());
  OR2X1 g1736(.A (n_361), .B (n_898), .Y (n_386));
  NAND3X1 g1738(.A (G36), .B (n_167), .C (n_588), .Y (n_384));
  MX2X1 g1745(.A (n_1048), .B (n_344), .S0 (G0), .Y (n_383));
  AOI21X1 g1760(.A0 (n_279), .A1 (n_225), .B0 (n_356), .Y (n_381));
  AOI21X1 g1799(.A0 (n_336), .A1 (n_321), .B0 (n_218), .Y (n_380));
  OAI22X1 g1800(.A0 (n_350), .A1 (n_248), .B0 (n_378), .B1 (n_104), .Y
       (n_379));
  DFFSRX1 G35_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_360), .Q (), .QN (G35));
  AOI22X1 g1740(.A0 (n_316), .A1 (n_59), .B0 (n_301), .B1 (n_659), .Y
       (n_377));
  OAI21X1 g1763(.A0 (n_337), .A1 (n_790), .B0 (n_343), .Y (n_376));
  AOI22X1 g1767(.A0 (n_308), .A1 (n_75), .B0 (n_322), .B1 (n_1048), .Y
       (n_375));
  NAND2X1 g1775(.A (n_294), .B (n_373), .Y (n_374));
  NAND2X1 g1780(.A (n_339), .B (n_371), .Y (n_372));
  AND2X1 g1785(.A (n_349), .B (n_371), .Y (n_370));
  NOR2X1 g1789(.A (n_247), .B (n_373), .Y (n_369));
  AOI22X1 g1797(.A0 (n_333), .A1 (n_264), .B0 (n_859), .B1 (n_1048), .Y
       (n_368));
  AOI22X1 g1798(.A0 (n_305), .A1 (n_607), .B0 (n_242), .B1 (n_217), .Y
       (n_367));
  DFFSRX1 G37_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_346), .Q (G37), .QN ());
  AOI21X1 g1744(.A0 (n_287), .A1 (n_332), .B0 (n_106), .Y (n_364));
  DFFSRX1 G36_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_320), .Q (G36), .QN ());
  OR2X1 g1753(.A (n_240), .B (n_362), .Y (n_363));
  OAI21X1 g1754(.A0 (n_280), .A1 (n_678), .B0 (n_314), .Y (n_361));
  INVX1 g1768(.A (n_345), .Y (n_360));
  NAND2X1 g1773(.A (G31), .B (n_1035), .Y (n_359));
  AND2X1 g1791(.A (n_311), .B (n_332), .Y (n_358));
  OAI21X1 g1795(.A0 (n_142), .A1 (n_678), .B0 (n_312), .Y (n_356));
  DFFSRX1 G39_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_334), .Q (G39), .QN ());
  OAI21X1 g1809(.A0 (n_253), .A1 (n_841), .B0 (n_258), .Y (n_354));
  OAI21X1 g1827(.A0 (n_292), .A1 (n_352), .B0 (n_269), .Y (n_353));
  DFFSRX1 G30_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_326), .Q (G30), .QN ());
  OAI21X1 g1868(.A0 (n_299), .A1 (n_75), .B0 (n_300), .Y (n_350));
  OR2X1 g1810(.A (n_276), .B (n_309), .Y (n_349));
  NAND3X1 g1752(.A (n_285), .B (n_217), .C (G2), .Y (n_571));
  OAI21X1 g1936(.A0 (n_146), .A1 (n_607), .B0 (n_180), .Y (n_346));
  AOI22X1 g1769(.A0 (n_224), .A1 (n_782), .B0 (n_624), .B1 (n_607), .Y
       (n_345));
  NAND3X1 g1781(.A (n_257), .B (n_265), .C (n_672), .Y (n_344));
  INVX1 g1802(.A (G31), .Y (n_373));
  NAND2X1 g1808(.A (n_303), .B (n_59), .Y (n_343));
  NOR2X1 g1811(.A (n_277), .B (n_340), .Y (n_341));
  AOI21X1 g1830(.A0 (n_243), .A1 (n_74), .B0 (n_163), .Y (n_339));
  OAI21X1 g1839(.A0 (n_298), .A1 (n_1071), .B0 (n_337), .Y (n_338));
  AOI21X1 g1866(.A0 (n_335), .A1 (n_252), .B0 (n_1048), .Y (n_336));
  NAND2X1 g1867(.A (n_259), .B (n_307), .Y (n_334));
  OAI21X1 g1872(.A0 (n_332), .A1 (n_841), .B0 (n_263), .Y (n_333));
  NAND4X1 g1755(.A (n_625), .B (n_228), .C (n_59), .D (n_167), .Y
       (n_329));
  OAI21X1 g1930(.A0 (n_290), .A1 (n_784), .B0 (n_291), .Y (n_326));
  NOR2X1 g1967(.A (n_248), .B (n_321), .Y (n_322));
  NOR2X1 g1771(.A (n_226), .B (n_188), .Y (n_320));
  NAND2X1 g1772(.A (n_230), .B (n_321), .Y (n_319));
  AND2X1 g1777(.A (n_624), .B (n_95), .Y (n_362));
  OAI22X1 g1801(.A0 (n_190), .A1 (n_290), .B0 (n_315), .B1 (n_814), .Y
       (n_316));
  DFFSRX1 G31_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_272), .Q (G31), .QN ());
  NAND2X1 g1815(.A (n_164), .B (n_313), .Y (n_314));
  NAND4X1 g1819(.A (n_278), .B (n_309), .C (n_146), .D (n_186), .Y
       (n_312));
  AOI21X1 g1824(.A0 (n_859), .A1 (n_309), .B0 (n_296), .Y (n_311));
  NAND3X1 g1829(.A (n_261), .B (n_307), .C (n_213), .Y (n_308));
  OAI21X1 g1843(.A0 (n_197), .A1 (n_188), .B0 (n_95), .Y (n_306));
  NAND2X1 g1860(.A (n_267), .B (n_304), .Y (n_305));
  OAI22X1 g1875(.A0 (n_352), .A1 (n_742), .B0 (n_659), .B1 (n_290), .Y
       (n_303));
  NOR2X1 g1879(.A (n_790), .B (n_841), .Y (n_301));
  NAND2X1 g1891(.A (n_299), .B (n_1050), .Y (n_300));
  NAND2X1 g1915(.A (n_298), .B (n_1071), .Y (n_337));
  NOR2X1 g1926(.A (n_294), .B (n_656), .Y (n_295));
  AOI21X1 g1928(.A0 (n_290), .A1 (n_1071), .B0 (n_298), .Y (n_340));
  AOI22X1 g1937(.A0 (n_291), .A1 (n_59), .B0 (n_54), .B1 (n_290), .Y
       (n_292));
  INVX1 g1782(.A (n_286), .Y (n_287));
  AND2X1 g1792(.A (n_196), .B (n_284), .Y (n_285));
  AOI21X1 g1796(.A0 (G38), .A1 (n_282), .B0 (n_657), .Y (n_283));
  AOI21X1 g1825(.A0 (n_279), .A1 (n_278), .B0 (n_143), .Y (n_280));
  AOI21X1 g1849(.A0 (n_189), .A1 (n_291), .B0 (n_290), .Y (n_277));
  AND2X1 g1852(.A (n_258), .B (n_1001), .Y (n_276));
  NAND3X1 g1863(.A (n_789), .B (n_291), .C (n_607), .Y (n_274));
  OAI22X1 g1873(.A0 (n_52), .A1 (n_291), .B0 (n_1071), .B1 (n_784), .Y
       (n_272));
  AOI22X1 g1874(.A0 (n_352), .A1 (n_742), .B0 (n_52), .B1 (n_1036), .Y
       (n_269));
  NAND2X1 g1892(.A (n_266), .B (n_321), .Y (n_267));
  NAND2X1 g1907(.A (n_264), .B (n_309), .Y (n_265));
  NAND2X1 g1908(.A (n_262), .B (n_841), .Y (n_263));
  NAND2X1 g1916(.A (n_66), .B (n_321), .Y (n_261));
  NOR2X1 g1918(.A (n_262), .B (n_304), .Y (n_260));
  NAND2X1 g1919(.A (n_304), .B (n_321), .Y (n_259));
  INVX1 g1921(.A (n_258), .Y (n_296));
  NOR2X1 g1923(.A (n_659), .B (n_607), .Y (n_313));
  NAND2X1 g1924(.A (n_203), .B (n_95), .Y (n_257));
  NAND3X1 g1933(.A (n_208), .B (n_1071), .C (n_784), .Y (n_255));
  AND2X1 g1935(.A (n_252), .B (n_332), .Y (n_253));
  NAND2X1 g1980(.A (n_248), .B (n_75), .Y (n_335));
  NAND2X1 g1987(.A (G0), .B (n_248), .Y (n_378));
  NAND2X1 g1998(.A (n_1035), .B (n_607), .Y (n_247));
  NOR2X1 g2017(.A (n_54), .B (n_607), .Y (n_244));
  INVX1 g2020(.A (n_242), .Y (n_243));
  NAND2X1 g1778(.A (n_240), .B (n_239), .Y (n_574));
  INVX1 g1783(.A (n_206), .Y (n_286));
  INVX1 g1787(.A (n_235), .Y (n_236));
  NOR2X1 g1806(.A (n_183), .B (n_674), .Y (n_230));
  NAND2X1 g1813(.A (n_228), .B (n_783), .Y (n_229));
  OR2X1 g1814(.A (n_170), .B (n_191), .Y (n_227));
  AOI21X1 g1826(.A0 (n_291), .A1 (n_158), .B0 (n_225), .Y (n_226));
  NAND2X2 g1828(.A (n_160), .B (n_78), .Y (n_625));
  NOR2X1 g2019(.A (n_1035), .B (n_607), .Y (n_224));
  AND2X1 g1856(.A (n_859), .B (n_332), .Y (n_221));
  NAND2X1 g1857(.A (n_782), .B (n_607), .Y (n_220));
  NOR2X1 g1927(.A (n_1001), .B (n_80), .Y (n_218));
  OR2X1 g1897(.A (n_1001), .B (n_309), .Y (n_307));
  NAND2X1 g1922(.A (n_167), .B (n_217), .Y (n_258));
  NAND2X1 g1925(.A (n_80), .B (n_321), .Y (n_371));
  NAND2X1 g2022(.A (n_188), .B (n_321), .Y (n_242));
  NAND2X1 g1988(.A (G0), .B (n_321), .Y (n_299));
  INVX1 g1993(.A (n_212), .Y (n_213));
  INVX1 g2012(.A (n_208), .Y (n_209));
  AOI21X1 g1784(.A0 (n_205), .A1 (G2), .B0 (n_113), .Y (n_206));
  NAND3X1 g1788(.A (n_131), .B (n_203), .C (n_44), .Y (n_235));
  NAND3X1 g1817(.A (n_672), .B (G0), .C (n_197), .Y (n_198));
  NAND2X1 g1818(.A (n_173), .B (n_165), .Y (n_196));
  INVX1 g1847(.A (n_193), .Y (n_194));
  INVX1 g1854(.A (n_191), .Y (n_192));
  AND2X1 g1861(.A (n_140), .B (n_189), .Y (n_190));
  NOR2X1 g1881(.A (n_98), .B (n_188), .Y (n_279));
  NOR2X1 g1979(.A (n_187), .B (n_809), .Y (n_262));
  NOR2X1 g1889(.A (n_678), .B (n_607), .Y (n_186));
  NOR2X1 g1914(.A (G0), .B (n_266), .Y (n_408));
  AOI21X1 g1932(.A0 (G0), .A1 (n_75), .B0 (n_182), .Y (n_183));
  NOR2X1 g2013(.A (n_146), .B (n_841), .Y (n_208));
  INVX1 g1956(.A (n_282), .Y (n_180));
  NAND2X1 g1958(.A (n_188), .B (n_95), .Y (n_252));
  NOR2X1 g1994(.A (n_188), .B (n_113), .Y (n_212));
  NOR2X1 g1807(.A (n_918), .B (n_173), .Y (n_240));
  INVX1 g2038(.A (n_167), .Y (n_248));
  DFFSRX1 G38_reg(.RN (n_530), .SN (1'b1), .CK (blif_clk_net), .D
       (n_166), .Q (G38), .QN ());
  INVX1 g1835(.A (n_165), .Y (n_225));
  NOR2X1 g1838(.A (n_332), .B (n_127), .Y (n_164));
  NOR2X1 g1840(.A (n_161), .B (n_1001), .Y (n_163));
  NAND2X1 g1842(.A (n_284), .B (n_119), .Y (n_162));
  OR2X1 g1848(.A (n_89), .B (n_161), .Y (n_193));
  NAND2X2 g1850(.A (n_782), .B (n_1035), .Y (n_160));
  NOR2X1 g1855(.A (n_782), .B (n_742), .Y (n_191));
  INVX1 g2051(.A (n_188), .Y (n_309));
  NOR2X1 g1877(.A (n_678), .B (n_59), .Y (n_158));
  NOR2X1 g1899(.A (n_838), .B (G7), .Y (n_154));
  NAND2X1 g1940(.A (n_1071), .B (n_1036), .Y (n_189));
  NOR2X1 g1957(.A (n_290), .B (n_839), .Y (n_282));
  INVX1 g1864(.A (n_142), .Y (n_143));
  OR2X1 g1878(.A (n_298), .B (n_841), .Y (n_140));
  INVX1 g1893(.A (n_1113), .Y (n_138));
  INVX2 g2039(.A (n_113), .Y (n_167));
  INVX1 g1836(.A (n_131), .Y (n_165));
  NAND2X2 g1871(.A (n_740), .B (n_564), .Y (n_205));
  OR2X1 g1898(.A (n_838), .B (n_68), .Y (n_116));
  NOR2X1 g1900(.A (n_90), .B (n_39), .Y (n_166));
  NAND2X1 g1912(.A (n_298), .B (n_18), .Y (n_110));
  NOR2X1 g1929(.A (n_352), .B (n_823), .Y (n_109));
  INVX1 g1845(.A (n_107), .Y (n_108));
  NOR2X1 g1934(.A (n_1001), .B (n_332), .Y (n_106));
  AOI21X1 g1931(.A0 (n_187), .A1 (n_585), .B0 (n_906), .Y (n_161));
  INVX1 g1971(.A (n_104), .Y (n_266));
  NAND3X1 g1865(.A (n_228), .B (n_52), .C (n_54), .Y (n_142));
  AND2X1 g1954(.A (n_839), .B (n_755), .Y (n_99));
  INVX1 g1996(.A (n_880), .Y (n_98));
  INVX2 g2052(.A (n_77), .Y (n_188));
  AND2X1 g1876(.A (n_264), .B (n_906), .Y (n_284));
  NOR2X1 g1953(.A (n_1057), .B (n_912), .Y (n_182));
  INVX1 g2152(.A (n_290), .Y (n_146));
  NAND3X1 g1858(.A (n_813), .B (n_684), .C (n_784), .Y (n_173));
  OR2X1 g1896(.A (n_90), .B (n_912), .Y (n_91));
  NAND2X1 g1938(.A (n_1042), .B (n_755), .Y (n_89));
  NOR2X1 g1895(.A (n_90), .B (n_784), .Y (n_650));
  NAND3X1 g1834(.A (n_68), .B (n_684), .C (n_59), .Y (n_655));
  AND2X1 g1837(.A (n_666), .B (n_789), .Y (n_131));
  NAND4X1 g1851(.A (n_1066), .B (n_18), .C (n_1036), .D (n_54), .Y
       (n_78));
  NAND3X1 g1862(.A (n_239), .B (n_77), .C (G11), .Y (n_170));
  INVX1 g2066(.A (n_75), .Y (n_95));
  INVX1 g2153(.A (n_68), .Y (n_290));
  INVX1 g1882(.A (n_239), .Y (n_74));
  INVX1 g1887(.A (n_789), .Y (n_127));
  NOR2X1 g1982(.A (n_68), .B (n_1036), .Y (n_294));
  INVX1 g2014(.A (n_264), .Y (n_66));
  INVX1 g1961(.A (n_65), .Y (n_483));
  NOR2X1 g1984(.A (n_54), .B (n_1071), .Y (n_64));
  NOR2X1 g1972(.A (n_1042), .B (n_187), .Y (n_104));
  INVX1 g2001(.A (n_217), .Y (n_119));
  NOR2X1 g1973(.A (n_1071), .B (n_59), .Y (n_61));
  NAND2X1 g1911(.A (n_55), .B (n_187), .Y (n_168));
  INVX1 g1950(.A (n_332), .Y (n_80));
  OR2X1 g1846(.A (n_48), .B (G1), .Y (n_107));
  CLKBUFX1 g2015(.A (n_55), .Y (n_264));
  NOR2X1 g2023(.A (n_54), .B (G11), .Y (n_278));
  NAND2X2 g1906(.A (n_32), .B (G4), .Y (n_740));
  INVX1 g1962(.A (n_885), .Y (n_65));
  INVX1 g2161(.A (n_54), .Y (n_291));
  INVX1 g1884(.A (n_48), .Y (n_239));
  CLKBUFX1 g1951(.A (n_1104), .Y (n_332));
  NOR2X1 g1880(.A (n_918), .B (n_910), .Y (n_228));
  CLKBUFX1 g2002(.A (n_44), .Y (n_217));
  INVX2 g2042(.A (n_912), .Y (n_113));
  INVX1 g2067(.A (n_187), .Y (n_75));
  NAND2X2 g1939(.A (n_1114), .B (n_1035), .Y (n_352));
  INVX1 g1965(.A (n_786), .Y (n_39));
  INVX1 g1990(.A (n_203), .Y (n_304));
  NOR2X1 g2011(.A (n_837), .B (n_1066), .Y (n_666));
  INVX2 g2076(.A (n_784), .Y (n_59));
  NAND2X1 g1955(.A (G7), .B (n_839), .Y (n_315));
  NAND2X1 g1960(.A (n_1041), .B (G5), .Y (n_564));
  INVX1 g1991(.A (n_32), .Y (n_203));
  AND2X1 g1941(.A (n_1002), .B (G2), .Y (n_197));
  INVX2 g2068(.A (G4), .Y (n_187));
  CLKBUFX3 g2055(.A (n_918), .Y (n_77));
  NOR2X1 g1983(.A (n_1036), .B (n_784), .Y (n_406));
  NOR2X1 g1986(.A (G8), .B (G7), .Y (n_684));
  INVX1 g1977(.A (n_790), .Y (n_52));
  INVX1 g2003(.A (n_910), .Y (n_44));
  NOR2X1 g2016(.A (n_1041), .B (n_1002), .Y (n_55));
  NAND3X1 g1885(.A (G3), .B (G4), .C (G6), .Y (n_48));
  INVX1 g2156(.A (n_68), .Y (n_18));
  INVX1 g2025(.A (n_901), .Y (n_21));
  NAND2X1 g1981(.A (G10), .B (G8), .Y (n_298));
  OR2X1 g2018(.A (G0), .B (G4), .Y (n_90));
  INVX2 g2163(.A (n_837), .Y (n_54));
  NAND2X1 g1992(.A (G3), .B (G5), .Y (n_32));
  INVX1 g2094(.A (blif_reset_net), .Y (n_530));
  INVX1 g2093(.A (G13), .Y (n_9));
  CLKBUFX1 g2184(.A (n_576), .Y (n_575));
  INVX2 g2186(.A (n_822), .Y (n_579));
  INVX1 g2187(.A (n_879), .Y (n_580));
  INVX1 g2191(.A (n_588), .Y (n_585));
  CLKBUFX1 g2194(.A (n_839), .Y (n_588));
  INVX2 g2209(.A (n_841), .Y (n_607));
  CLKBUFX1 g2226(.A (n_625), .Y (n_624));
  INVX1 g2248(.A (n_657), .Y (n_656));
  CLKBUFX1 g2249(.A (n_658), .Y (n_657));
  CLKBUFX1 g2250(.A (n_664), .Y (n_658));
  INVX1 g2251(.A (n_664), .Y (n_659));
  CLKBUFX1 g2257(.A (n_666), .Y (n_664));
  CLKBUFX1 g2258(.A (n_668), .Y (n_667));
  INVX1 g2259(.A (G30), .Y (n_668));
  INVX1 g2263(.A (n_674), .Y (n_672));
  CLKBUFX1 g2265(.A (n_205), .Y (n_674));
  INVX1 g2268(.A (n_684), .Y (n_678));
  INVX1 g2318(.A (n_740), .Y (n_739));
  CLKBUFX1 g2320(.A (n_814), .Y (n_742));
  INVX1 g34(.A (n_749), .Y (n_750));
  NAND4X1 g35(.A (n_414), .B (n_359), .C (n_68), .D (n_278), .Y
       (n_749));
  NAND2X2 g38(.A (n_760), .B (n_762), .Y (n_763));
  AOI21X1 g39(.A0 (n_755), .A1 (n_756), .B0 (n_759), .Y (n_760));
  INVX1 g49(.A (n_754), .Y (n_755));
  INVX2 g50(.A (G2), .Y (n_754));
  NAND3X1 g40(.A (n_574), .B (n_418), .C (n_235), .Y (n_756));
  NOR2X1 g41(.A (n_757), .B (n_758), .Y (n_759));
  NOR2X1 g46(.A (n_109), .B (n_625), .Y (n_757));
  OR2X1 g45(.A (G2), .B (n_170), .Y (n_758));
  NAND2X1 g42(.A (n_761), .B (n_754), .Y (n_762));
  NAND2X1 g44(.A (n_329), .B (n_384), .Y (n_761));
  AND2X1 g18(.A (n_782), .B (G11), .Y (n_783));
  INVX2 g19(.A (n_781), .Y (n_782));
  NAND3X1 g20(.A (G7), .B (n_779), .C (n_780), .Y (n_781));
  INVX2 g29(.A (G10), .Y (n_779));
  INVX1 g22(.A (G9), .Y (n_780));
  INVX2 g27(.A (G11), .Y (n_784));
  NOR2X1 g21(.A (n_785), .B (n_1114), .Y (n_786));
  INVX1 g28(.A (n_779), .Y (n_785));
  INVX2 g23(.A (G9), .Y (n_68));
  INVX2 g9(.A (n_788), .Y (n_789));
  NAND3X1 g10(.A (G9), .B (G11), .C (G8), .Y (n_788));
  NAND2X1 g11(.A (G11), .B (G9), .Y (n_790));
  NAND2X1 g2330(.A (n_795), .B (n_796), .Y (n_797));
  NAND3X1 g26(.A (n_791), .B (n_793), .C (n_794), .Y (n_795));
  NAND2X1 g2331(.A (G7), .B (n_814), .Y (n_791));
  NOR2X1 g2332(.A (G13), .B (n_792), .Y (n_793));
  NOR2X1 g31(.A (n_667), .B (n_352), .Y (n_792));
  NAND2X1 g2333(.A (n_664), .B (n_127), .Y (n_794));
  OR2X1 g2334(.A (G13), .B (G32), .Y (n_796));
  INVX1 g30(.A (n_792), .Y (n_798));
  NAND3X1 g2336(.A (n_803), .B (n_1048), .C (n_321), .Y (n_806));
  NAND3X1 g2337(.A (n_800), .B (n_801), .C (n_802), .Y (n_803));
  NAND4X1 g47(.A (n_212), .B (n_154), .C (n_282), .D (n_650), .Y
       (n_800));
  NAND2X1 g48(.A (n_236), .B (G0), .Y (n_801));
  NAND4X1 g2338(.A (n_166), .B (n_406), .C (n_203), .D (G37), .Y
       (n_802));
  CLKBUFX1 g1(.A (G2), .Y (n_321));
  INVX1 g55(.A (n_321), .Y (n_809));
  NAND3X1 g2340(.A (n_945), .B (n_946), .C (n_821), .Y (n_822));
  NAND2X1 g2341(.A (n_340), .B (G34), .Y (n_946));
  NAND3X1 g2342(.A (n_500), .B (n_209), .C (n_658), .Y (n_945));
  NAND3X1 g2343(.A (n_812), .B (n_814), .C (n_1071), .Y (n_821));
  NAND2X1 g2344(.A (n_473), .B (n_850), .Y (n_812));
  CLKBUFX2 g2345(.A (n_813), .Y (n_814));
  AND2X1 g2346(.A (n_779), .B (G9), .Y (n_813));
  INVX1 g2352(.A (n_814), .Y (n_823));
  OR2X1 g2366(.A (G8), .B (n_837), .Y (n_838));
  INVX2 g2367(.A (G10), .Y (n_837));
  OR2X1 g2368(.A (n_844), .B (n_1109), .Y (n_850));
  NAND3X1 g2369(.A (n_607), .B (n_9), .C (G12), .Y (n_844));
  CLKBUFX1 g2371(.A (n_839), .Y (n_841));
  INVX2 g2373(.A (G6), .Y (n_839));
  NOR2X1 g2389(.A (n_839), .B (n_1000), .Y (n_859));
  INVX1 g2394(.A (n_1104), .Y (n_865));
  NOR2X1 g2396(.A (n_873), .B (n_877), .Y (n_878));
  OAI21X1 g2397(.A0 (n_518), .A1 (n_396), .B0 (n_872), .Y (n_873));
  NAND2X1 g2398(.A (n_869), .B (n_871), .Y (n_872));
  OAI21X1 g2399(.A0 (n_248), .A1 (G44), .B0 (n_227), .Y (n_869));
  CLKBUFX1 g2400(.A (n_870), .Y (n_871));
  NOR2X1 g2401(.A (n_576), .B (G12), .Y (n_870));
  NOR2X1 g2402(.A (n_874), .B (n_876), .Y (n_877));
  NAND2X1 g2403(.A (n_607), .B (n_901), .Y (n_874));
  AOI21X1 g2404(.A0 (n_453), .A1 (n_192), .B0 (n_875), .Y (n_876));
  AND2X1 g2405(.A (n_513), .B (n_362), .Y (n_875));
  NOR2X1 g8(.A (G4), .B (n_879), .Y (n_880));
  CLKBUFX1 g2406(.A (G6), .Y (n_879));
  NOR2X1 g2408(.A (n_883), .B (n_888), .Y (n_889));
  INVX1 g37(.A (n_882), .Y (n_883));
  NAND3X1 g2409(.A (n_798), .B (n_791), .C (n_794), .Y (n_882));
  AOI21X1 g36(.A0 (n_884), .A1 (G32), .B0 (n_887), .Y (n_888));
  NOR2X1 g2410(.A (G12), .B (G13), .Y (n_884));
  AND2X1 g2411(.A (n_885), .B (n_886), .Y (n_887));
  NOR2X1 g2412(.A (G12), .B (n_9), .Y (n_885));
  NAND2X1 g2413(.A (n_395), .B (n_193), .Y (n_886));
  OAI21X1 g2414(.A0 (n_518), .A1 (n_283), .B0 (n_902), .Y (n_903));
  NAND2X1 g2415(.A (n_900), .B (n_901), .Y (n_902));
  OAI21X1 g2416(.A0 (n_491), .A1 (n_895), .B0 (n_899), .Y (n_900));
  NAND2X1 g2417(.A (n_890), .B (n_1035), .Y (n_895));
  NAND2X1 g2418(.A (n_220), .B (n_304), .Y (n_890));
  NAND2X1 g2419(.A (n_897), .B (n_898), .Y (n_899));
  INVX1 g2420(.A (n_896), .Y (n_897));
  NAND2X1 g2421(.A (n_420), .B (G13), .Y (n_896));
  AND2X1 g2422(.A (n_624), .B (n_239), .Y (n_898));
  INVX1 g2423(.A (G12), .Y (n_901));
  NAND4X1 g2424(.A (n_907), .B (n_908), .C (n_909), .D (n_914), .Y
       (n_915));
  AOI21X1 g2425(.A0 (n_880), .A1 (n_906), .B0 (n_859), .Y (n_907));
  CLKBUFX1 g2426(.A (G5), .Y (n_906));
  NAND2X1 g2428(.A (n_912), .B (n_865), .Y (n_908));
  OAI21X1 g2429(.A0 (n_739), .A1 (n_197), .B0 (n_879), .Y (n_909));
  NAND3X1 g2430(.A (n_910), .B (n_906), .C (n_113), .Y (n_914));
  NAND2X1 g2431(.A (G6), .B (G4), .Y (n_910));
  CLKBUFX3 g2432(.A (n_1002), .Y (n_912));
  INVX1 g58(.A (G5), .Y (n_918));
  CLKBUFX1 g2488(.A (G4), .Y (n_980));
  NAND2X1 g2490(.A (n_655), .B (n_393), .Y (n_983));
  NAND2X1 g2492(.A (n_654), .B (n_985), .Y (n_986));
  INVX1 g2493(.A (G46), .Y (n_985));
  CLKBUFX1 g3(.A (n_1000), .Y (n_1001));
  NAND2X1 g2501(.A (n_754), .B (n_999), .Y (n_1000));
  CLKBUFX1 g12(.A (G3), .Y (n_999));
  INVX2 g13(.A (G3), .Y (n_1002));
  OAI21X1 g2381_dup(.A0 (n_168), .A1 (n_588), .B0 (n_107), .Y (n_1019));
  INVX4 g2531(.A (n_1036), .Y (n_1035));
  INVX4 g2533(.A (G8), .Y (n_1036));
  INVX1 g2535(.A (G1), .Y (n_1041));
  INVX1 g2536(.A (n_1057), .Y (n_1042));
  INVX1 g2544(.A (n_1048), .Y (n_1050));
  CLKBUFX1 g2547(.A (n_1057), .Y (n_1048));
  CLKBUFX1 g2552(.A (G1), .Y (n_1057));
  INVX1 g2558(.A (G7), .Y (n_1066));
  INVX1 g2561(.A (n_1071), .Y (n_1069));
  CLKBUFX3 g2568(.A (G7), .Y (n_1071));
  NAND3X1 g2591(.A (n_1106), .B (n_1107), .C (n_1108), .Y (n_1109));
  NAND2X1 g2592(.A (n_1104), .B (n_1105), .Y (n_1106));
  NAND2X2 g2593(.A (n_918), .B (n_980), .Y (n_1104));
  OAI21X1 g2594(.A0 (n_286), .A1 (n_188), .B0 (n_91), .Y (n_1105));
  AOI21X1 g2595(.A0 (n_401), .A1 (n_61), .B0 (n_986), .Y (n_1107));
  NOR2X1 g2596(.A (n_983), .B (n_750), .Y (n_1108));
  NAND4X1 g2597(.A (n_1110), .B (n_1111), .C (n_1115), .D (n_1116), .Y
       (n_1117));
  NAND3X1 g59(.A (n_1019), .B (n_783), .C (n_1035), .Y (n_1110));
  NAND4X1 g56(.A (n_783), .B (n_182), .C (n_880), .D (n_1036), .Y
       (n_1111));
  NAND3X1 g57(.A (n_1112), .B (n_1113), .C (n_1114), .Y (n_1115));
  OAI21X1 g2598(.A0 (n_588), .A1 (n_168), .B0 (n_107), .Y (n_1112));
  NOR2X1 g61(.A (n_790), .B (n_838), .Y (n_1113));
  INVX1 g64(.A (G7), .Y (n_1114));
  NAND3X1 g2599(.A (n_108), .B (n_64), .C (n_789), .Y (n_1116));
endmodule

