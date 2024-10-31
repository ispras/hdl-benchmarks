/////////////////////////////////////////////////////////////////
// Altera Corporation
//
// File - nut_002_hagrid_neon.v
// 16 inputs 22 outputs
//
//
/////////////////////////////////////////////////////////////////
module nut_002_hagrid_neon (
// inputs
 diagon_willy, uppers_speed, pentium_tin, moulin_crank, otter_kedavra, kana_zi,
      saturn_simasu, ready_centaur, rojas_tobe, goofy_kappa, hoser_zen, marco_freaky,
      zebra_lad, yellow_wine, wine_sand, curly_fear,

     // outputs
 oscar_parrot, spain_loser, elian_romeo, dingbat_palm, superman_ebi, grumby_lucent,
      flew_bison, troll_uppers, dingbat_tesla, homerun_echo, kmfdm_school, ocha_hercules,
      gin_ceres, tonic_dutch, midas_hippo, moody_zhuang, whiskey_alpha, howell_malfoy,
      sears_george, cybex_air, trevor_jiminy, dorkus_marge,

     // tristate outputs


     clock0, clock1, reset0, reset1
);
  input diagon_willy;
  input uppers_speed;
  input pentium_tin;
  input moulin_crank;
  input otter_kedavra;
  input kana_zi;
  input saturn_simasu;
  input ready_centaur;
  input rojas_tobe;
  input goofy_kappa;
  input hoser_zen;
  input marco_freaky;
  input zebra_lad;
  input yellow_wine;
  input wine_sand;
  input curly_fear;
  input clock0, clock1, reset0, reset1;

  output oscar_parrot;
  output spain_loser;
  output elian_romeo;
  output dingbat_palm;
  output superman_ebi;
  output grumby_lucent;
  output flew_bison;
  output troll_uppers;
  output dingbat_tesla;
  output homerun_echo;
  output kmfdm_school;
  output ocha_hercules;
  output gin_ceres;
  output tonic_dutch;
  output midas_hippo;
  output moody_zhuang;
  output whiskey_alpha;
  output howell_malfoy;
  output sears_george;
  output cybex_air;
  output trevor_jiminy;
  output dorkus_marge;

//tristate outs


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



  reg oscar_parrot;
  reg spain_loser;
  reg elian_romeo;
  reg dingbat_palm;
  reg superman_ebi;
  reg grumby_lucent;
  reg flew_bison;
  reg troll_uppers;
  reg dingbat_tesla;
  reg homerun_echo;
  reg kmfdm_school;
  reg ocha_hercules;
  reg gin_ceres;
  reg tonic_dutch;
  reg midas_hippo;
  reg moody_zhuang;
  reg whiskey_alpha;
  reg howell_malfoy;
  reg sears_george;
  reg cybex_air;
  reg trevor_jiminy;
  reg dorkus_marge;


// 2s comp negate A
always @(diagon_willy or vcc or uppers_speed or pentium_tin)
  begin
    {oscar_parrot,spain_loser,elian_romeo,dingbat_palm,superman_ebi,grumby_lucent,flew_bison,troll_uppers,dingbat_tesla,homerun_echo} = - {diagon_willy,vcc,uppers_speed,pentium_tin};
  end

// Ternary sign extend bait
always @(vcc or vcc or vcc or vcc or vcc or kana_zi or saturn_simasu or vcc or vcc or rojas_tobe or hoser_zen or yellow_wine or
         moulin_crank or moulin_crank or moulin_crank or moulin_crank or moulin_crank or moulin_crank or moulin_crank or ready_centaur or gnd or goofy_kappa or marco_freaky or wine_sand or
         otter_kedavra or otter_kedavra or otter_kedavra or otter_kedavra or otter_kedavra or otter_kedavra or otter_kedavra or otter_kedavra or otter_kedavra or otter_kedavra or zebra_lad or curly_fear)
  begin
    {kmfdm_school,ocha_hercules,gin_ceres,tonic_dutch,midas_hippo,moody_zhuang,whiskey_alpha,howell_malfoy,sears_george,cybex_air,trevor_jiminy,dorkus_marge} = 
        {vcc,vcc,vcc,vcc,vcc,kana_zi,saturn_simasu,vcc,vcc,rojas_tobe,hoser_zen,yellow_wine} +
        {moulin_crank,moulin_crank,moulin_crank,moulin_crank,moulin_crank,moulin_crank,moulin_crank,ready_centaur,gnd,goofy_kappa,marco_freaky,wine_sand} +
        {otter_kedavra,otter_kedavra,otter_kedavra,otter_kedavra,otter_kedavra,otter_kedavra,otter_kedavra,otter_kedavra,otter_kedavra,otter_kedavra,zebra_lad,curly_fear};
  end


endmodule

