/////////////////////////////////////////////////////////////////
// Altera Corporation
// 
//
// File - nut_003.v
// 372 inputs 83 outputs
//
//
/////////////////////////////////////////////////////////////////
module nut_003 (
// inputs
 alpha, bravo, charlie, delta, echo, foxtrot,
      golf, hotel, india, juliet, sierra, tango,
      uniform, victor, babette, hanger, bolt, lumber,
      launcher, mortar, tank, cannon, mine, bullet,
      green, aphid, badger, bear, beetle, bison,
      bull, elephant, emu, fish, frog, goat,
      hippo, iguana, kangaroo, lion, lizard, popcorn_advil,
      gerard_kungfu, whale_malfoy, stoned_sake, tylenol_otter, yankee_hoser, bush_wiggles,
      west_eatem, kappa_zed, beast_uppers, blue_aphid, tasty_ebi, jonas_falafel,
      zulu_eel, wildboar_iron, madeye_mozart, obiwan_rabbi, tuna_minerva, parrot_doc,
      homerun_stix, edible_amex, ham_alpha, moody_noah, hagrid_neon, diagon_willy,
      uppers_speed, pentium_tin, oscar_parrot, spain_loser, elian_romeo, dingbat_palm,
      superman_ebi, grumby_lucent, flew_bison, troll_uppers, dingbat_tesla, homerun_echo,
      moulin_crank, otter_kedavra, kana_zi, saturn_simasu, ready_centaur, rojas_tobe,
      goofy_kappa, hoser_zen, marco_freaky, zebra_lad, yellow_wine, wine_sand,
      curly_fear, kmfdm_school, ocha_hercules, gin_ceres, tonic_dutch, midas_hippo,
      moody_zhuang, whiskey_alpha, howell_malfoy, sears_george, cybex_air, trevor_jiminy,
      dorkus_marge, moe_carolina, doc_bathroom, fury_saturn, hiway_jesus, bison_mexican,
      wanton_flew, killer_ready, stemcell_zed, valve_loud, viagra_filch, peaves_dutch,
      tabby_guy, bacon_gyro, ready_chips, copper_gerrit, water_foryou, show_mrbill,
      tin_lestrange, draco_october, clay_yohimbe, beef_covad, curious_moron, chief_bambi,
      rat_wakey, aspirin_ritsu, tonks_snake, what_husks, newt_sirius, crack_lamer,
      egg_homer, fear_star, rojas_kungfu, solder_issac, kabar_whiskey, eel_zinc,
      pluto_psycho, yak_brothers, moreand_willy, ajax_psycho, hp_eeevil, mushroom_dork,
      boots_yellow, oscar_bonker, bomb_yohimbe, sun_tesla, metal_dog, tabby_moses,
      kanji_uppers, nobody_zeus, tesla_scrooge, pdiddy_dirty, neville_beef, whacky_husks,
      shark_palm, loud_ariel, fortuyn_heidi, mushroom_zed, brian_zulu, priest_echo,
      dork_love_in, kang_tsmc, boots_cuckoo, cybex_saturn, skipper_happy, what_peta,
      midas_trevor, donkey_genji, starwars_gyro, century_biker, dow_rubeus, bush_gutter,
      sun_wannabe, guy_ykocens, sake_ocha, oscar_gin, nasdaq_iron, po_killme,
      zinc_bust, joker_gotone, rojas_norbert, iguana_buddha, otter_hotel, books_gojira,
      tiger_drugs, pdaddy_powder, beauty_coffee, tabasco_snape, quail_minnie, barney_cannon,
      ghost_asahi, pirate_mrbill, black_intuit, atomic_lad, shark_peace, suffering_gm,
      spyro_lima, lao_beef, todd_malfoy, hulk_booming, eunice_eunice, marco_thread,
      sanity_fallen, dopey_bomb, ebi_bubba, roid_kungfu, hans_ritsu, rewire_bubba,
      wildboar_mao, money_donut, freaky_amex, waffle_midas, wizard_norris, tango_would,
      black_kebab, show_bacon, coffee_wujing, master_elf, cartman_hurt, purple_maki,
      lala_agitator, baron_juliet, yoda_kangaroo, banshee_think, martin_bolt, bush_kbtoys,
      mideast_bolt, minnow_marco, hurt_rose, hours_green, venus_elian, pyro_zipporah,
      killer_marker, snake_marco, bubba_peta, honda_pdaddy, midas_macys, zed_orange,
      drevil_spirit, ulysses_nyc, mine_ostrich, art_zed, what_intel, gopher_minnow,
      neon_snape, rufus_advil, zedong_lucius, sake_bullet, foryou_rubik, chairman_bfs,
      sgates_thedon, hulk_atomic, peace_broom, boing_illegal, nobody_martin, kang_minnie,
      fortuyn_lamer, pacific_asahi, todd_pictures, thedon_potato, holland_haze, wujing_xray,
      dopey_sinew, advil_cow, platinum_haze, fire_waster, iterate_sugar, amex_potter,
      thor_cucumber, loud_chiptrip, south_toysrus, echo_eggsalad, cain_intel, homerun_deng,
      dragon_malfoy, india_squad, sanity_tarzan, concorde_show, covad_ocha, weevil_money,
      loser_echo, potter_thor, money_fortuyn, blue_carolina, hanger_lizard, gregg_a_lovey,
      gap_tamago, genji_stirfry, fish_waffle, daughter_sake, oscar_too_big, dork_rouge,
      jonas_rocks, husks_gotone, klaas_diagon, jcrew_cow, rarest_emails, kanji_clay,
      concorde_bart, master_bamboo, att_launcher, surfer_tuna, dig_shark, illegal_rod,
      vegas_peace, beef_shuda, soccer_speed, zhuang_drugie, falafel_sun, quebec_lovey,
      potato_rod, south_nasdaq, malfoy_boing, yankees_heidi, giraffe_huey, bono_homer,
      pig_fear, curly_baron, loser_curious, obiwan_quail, bravo_haze, rasp_bubba,
      dork_dingbat, drugie_pilot, tsmc_safada, ford_comtrex, snort_jinyong, bert_south,
      art_norbert, legos_tofu, ladder_pyro, hotdog_sgates, life_lao, palm_haze,
      boitano_brian, hippo_mozart, nest_crank, roid_odin, due_tango, goofy_bach,
      fufu_minnow, trevor_wanton, freaky_marco, lagoon_broom, tinker_sheep, lizard_kanji,
      foxtrot_sears, sheep_bart, air_monkey, chief_peta, west_powder, jacob_malfoy,
      dimetap_bagel, neville_po, trevor_thread, zen_tako, curie_macys, exodus_lima,
      joseph_husks, avon_oranges, bananarep_rum, atoms_art, lucius_drax, moderate_eel,
      kappa_rufus, safeway_nest, biker_bono, kilo_rojas, green_gm, often_master,
     

     // outputs
 george, rodriguez, norris, hotdog_priest, popcorn_whack, att_maryann,
      star_tylenol, muffin_joseph, goat_wujing, sinew_rodent, star_yoku, burning_tesla,
      bagel_rubik, rescue_george, killme_larry, air_gutter, rouge_plaster, ants_edible,
      bert_kaisha, sears_rerun, newt_cheese, draco_salmon, lion_grumby, oscar_cheez,
      hippo_lao, egg_abel, rat_solder, sun_mrbill, sinew_gulp, crab_popcorn,
      fufu_bono, fufu_vangoh, spock_webvan, mouse_ghost, midas_dirty, pdaddy_willy,
      macys_neptune, due_bolt, genji_fuji, achilles_dig, marker_tako, xuprocar_fuji,
      phoenix_ozzy, nation_potato, bambi_bubba, deuce_air, dog_vulture, platypus_Iwin,
      copper_rubeus, marker_potter, bracket_boing, george_roe, south_crank, freaky_winner,
      kdqcens_ritsu, sirius_zhuang, deng_gyro, advil_tango, knot_clay, mao_honey,
      wood_gokidsgo, boing_freaky, duey_superman, wine_edible, joseph_deuce, china_fitter,
      ebi_iwocensor, jesus_what, killer_curie, hp_richard, bubba_doc, vangoh_hinge,
      martin_safada, ready_xray, rerun_tapered, vadar_protest, picante_meth, south_ebi,
      nasdaq_doc, pork_balloon, drax_rat, peace_cannon, midas_killer,

     // tristate outputs
 boitano_bagel, deuce_bismuth, emu_skinner, blessyou_haze, lovey_ring, fang_honda,
      charlie_ariel,

     clock0, clock1, reset0, reset1
);
  input alpha;
  input bravo;
  input charlie;
  input delta;
  input echo;
  input foxtrot;
  input golf;
  input hotel;
  input india;
  input juliet;
  input sierra;
  input tango;
  input uniform;
  input victor;
  input babette;
  input hanger;
  input bolt;
  input lumber;
  input launcher;
  input mortar;
  input tank;
  input cannon;
  input mine;
  input bullet;
  input green;
  input aphid;
  input badger;
  input bear;
  input beetle;
  input bison;
  input bull;
  input elephant;
  input emu;
  input fish;
  input frog;
  input goat;
  input hippo;
  input iguana;
  input kangaroo;
  input lion;
  input lizard;
  input popcorn_advil;
  input gerard_kungfu;
  input whale_malfoy;
  input stoned_sake;
  input tylenol_otter;
  input yankee_hoser;
  input bush_wiggles;
  input west_eatem;
  input kappa_zed;
  input beast_uppers;
  input blue_aphid;
  input tasty_ebi;
  input jonas_falafel;
  input zulu_eel;
  input wildboar_iron;
  input madeye_mozart;
  input obiwan_rabbi;
  input tuna_minerva;
  input parrot_doc;
  input homerun_stix;
  input edible_amex;
  input ham_alpha;
  input moody_noah;
  input hagrid_neon;
  input diagon_willy;
  input uppers_speed;
  input pentium_tin;
  input oscar_parrot;
  input spain_loser;
  input elian_romeo;
  input dingbat_palm;
  input superman_ebi;
  input grumby_lucent;
  input flew_bison;
  input troll_uppers;
  input dingbat_tesla;
  input homerun_echo;
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
  input kmfdm_school;
  input ocha_hercules;
  input gin_ceres;
  input tonic_dutch;
  input midas_hippo;
  input moody_zhuang;
  input whiskey_alpha;
  input howell_malfoy;
  input sears_george;
  input cybex_air;
  input trevor_jiminy;
  input dorkus_marge;
  input moe_carolina;
  input doc_bathroom;
  input fury_saturn;
  input hiway_jesus;
  input bison_mexican;
  input wanton_flew;
  input killer_ready;
  input stemcell_zed;
  input valve_loud;
  input viagra_filch;
  input peaves_dutch;
  input tabby_guy;
  input bacon_gyro;
  input ready_chips;
  input copper_gerrit;
  input water_foryou;
  input show_mrbill;
  input tin_lestrange;
  input draco_october;
  input clay_yohimbe;
  input beef_covad;
  input curious_moron;
  input chief_bambi;
  input rat_wakey;
  input aspirin_ritsu;
  input tonks_snake;
  input what_husks;
  input newt_sirius;
  input crack_lamer;
  input egg_homer;
  input fear_star;
  input rojas_kungfu;
  input solder_issac;
  input kabar_whiskey;
  input eel_zinc;
  input pluto_psycho;
  input yak_brothers;
  input moreand_willy;
  input ajax_psycho;
  input hp_eeevil;
  input mushroom_dork;
  input boots_yellow;
  input oscar_bonker;
  input bomb_yohimbe;
  input sun_tesla;
  input metal_dog;
  input tabby_moses;
  input kanji_uppers;
  input nobody_zeus;
  input tesla_scrooge;
  input pdiddy_dirty;
  input neville_beef;
  input whacky_husks;
  input shark_palm;
  input loud_ariel;
  input fortuyn_heidi;
  input mushroom_zed;
  input brian_zulu;
  input priest_echo;
  input dork_love_in;
  input kang_tsmc;
  input boots_cuckoo;
  input cybex_saturn;
  input skipper_happy;
  input what_peta;
  input midas_trevor;
  input donkey_genji;
  input starwars_gyro;
  input century_biker;
  input dow_rubeus;
  input bush_gutter;
  input sun_wannabe;
  input guy_ykocens;
  input sake_ocha;
  input oscar_gin;
  input nasdaq_iron;
  input po_killme;
  input zinc_bust;
  input joker_gotone;
  input rojas_norbert;
  input iguana_buddha;
  input otter_hotel;
  input books_gojira;
  input tiger_drugs;
  input pdaddy_powder;
  input beauty_coffee;
  input tabasco_snape;
  input quail_minnie;
  input barney_cannon;
  input ghost_asahi;
  input pirate_mrbill;
  input black_intuit;
  input atomic_lad;
  input shark_peace;
  input suffering_gm;
  input spyro_lima;
  input lao_beef;
  input todd_malfoy;
  input hulk_booming;
  input eunice_eunice;
  input marco_thread;
  input sanity_fallen;
  input dopey_bomb;
  input ebi_bubba;
  input roid_kungfu;
  input hans_ritsu;
  input rewire_bubba;
  input wildboar_mao;
  input money_donut;
  input freaky_amex;
  input waffle_midas;
  input wizard_norris;
  input tango_would;
  input black_kebab;
  input show_bacon;
  input coffee_wujing;
  input master_elf;
  input cartman_hurt;
  input purple_maki;
  input lala_agitator;
  input baron_juliet;
  input yoda_kangaroo;
  input banshee_think;
  input martin_bolt;
  input bush_kbtoys;
  input mideast_bolt;
  input minnow_marco;
  input hurt_rose;
  input hours_green;
  input venus_elian;
  input pyro_zipporah;
  input killer_marker;
  input snake_marco;
  input bubba_peta;
  input honda_pdaddy;
  input midas_macys;
  input zed_orange;
  input drevil_spirit;
  input ulysses_nyc;
  input mine_ostrich;
  input art_zed;
  input what_intel;
  input gopher_minnow;
  input neon_snape;
  input rufus_advil;
  input zedong_lucius;
  input sake_bullet;
  input foryou_rubik;
  input chairman_bfs;
  input sgates_thedon;
  input hulk_atomic;
  input peace_broom;
  input boing_illegal;
  input nobody_martin;
  input kang_minnie;
  input fortuyn_lamer;
  input pacific_asahi;
  input todd_pictures;
  input thedon_potato;
  input holland_haze;
  input wujing_xray;
  input dopey_sinew;
  input advil_cow;
  input platinum_haze;
  input fire_waster;
  input iterate_sugar;
  input amex_potter;
  input thor_cucumber;
  input loud_chiptrip;
  input south_toysrus;
  input echo_eggsalad;
  input cain_intel;
  input homerun_deng;
  input dragon_malfoy;
  input india_squad;
  input sanity_tarzan;
  input concorde_show;
  input covad_ocha;
  input weevil_money;
  input loser_echo;
  input potter_thor;
  input money_fortuyn;
  input blue_carolina;
  input hanger_lizard;
  input gregg_a_lovey;
  input gap_tamago;
  input genji_stirfry;
  input fish_waffle;
  input daughter_sake;
  input oscar_too_big;
  input dork_rouge;
  input jonas_rocks;
  input husks_gotone;
  input klaas_diagon;
  input jcrew_cow;
  input rarest_emails;
  input kanji_clay;
  input concorde_bart;
  input master_bamboo;
  input att_launcher;
  input surfer_tuna;
  input dig_shark;
  input illegal_rod;
  input vegas_peace;
  input beef_shuda;
  input soccer_speed;
  input zhuang_drugie;
  input falafel_sun;
  input quebec_lovey;
  input potato_rod;
  input south_nasdaq;
  input malfoy_boing;
  input yankees_heidi;
  input giraffe_huey;
  input bono_homer;
  input pig_fear;
  input curly_baron;
  input loser_curious;
  input obiwan_quail;
  input bravo_haze;
  input rasp_bubba;
  input dork_dingbat;
  input drugie_pilot;
  input tsmc_safada;
  input ford_comtrex;
  input snort_jinyong;
  input bert_south;
  input art_norbert;
  input legos_tofu;
  input ladder_pyro;
  input hotdog_sgates;
  input life_lao;
  input palm_haze;
  input boitano_brian;
  input hippo_mozart;
  input nest_crank;
  input roid_odin;
  input due_tango;
  input goofy_bach;
  input fufu_minnow;
  input trevor_wanton;
  input freaky_marco;
  input lagoon_broom;
  input tinker_sheep;
  input lizard_kanji;
  input foxtrot_sears;
  input sheep_bart;
  input air_monkey;
  input chief_peta;
  input west_powder;
  input jacob_malfoy;
  input dimetap_bagel;
  input neville_po;
  input trevor_thread;
  input zen_tako;
  input curie_macys;
  input exodus_lima;
  input joseph_husks;
  input avon_oranges;
  input bananarep_rum;
  input atoms_art;
  input lucius_drax;
  input moderate_eel;
  input kappa_rufus;
  input safeway_nest;
  input biker_bono;
  input kilo_rojas;
  input green_gm;
  input often_master;
  input clock0, clock1, reset0, reset1;

  output george;
  output rodriguez;
  output norris;
  output hotdog_priest;
  output popcorn_whack;
  output att_maryann;
  output star_tylenol;
  output muffin_joseph;
  output goat_wujing;
  output sinew_rodent;
  output star_yoku;
  output burning_tesla;
  output bagel_rubik;
  output rescue_george;
  output killme_larry;
  output air_gutter;
  output rouge_plaster;
  output ants_edible;
  output bert_kaisha;
  output sears_rerun;
  output newt_cheese;
  output draco_salmon;
  output lion_grumby;
  output oscar_cheez;
  output hippo_lao;
  output egg_abel;
  output rat_solder;
  output sun_mrbill;
  output sinew_gulp;
  output crab_popcorn;
  output fufu_bono;
  output fufu_vangoh;
  output spock_webvan;
  output mouse_ghost;
  output midas_dirty;
  output pdaddy_willy;
  output macys_neptune;
  output due_bolt;
  output genji_fuji;
  output achilles_dig;
  output marker_tako;
  output xuprocar_fuji;
  output phoenix_ozzy;
  output nation_potato;
  output bambi_bubba;
  output deuce_air;
  output dog_vulture;
  output platypus_Iwin;
  output copper_rubeus;
  output marker_potter;
  output bracket_boing;
  output george_roe;
  output south_crank;
  output freaky_winner;
  output kdqcens_ritsu;
  output sirius_zhuang;
  output deng_gyro;
  output advil_tango;
  output knot_clay;
  output mao_honey;
  output wood_gokidsgo;
  output boing_freaky;
  output duey_superman;
  output wine_edible;
  output joseph_deuce;
  output china_fitter;
  output ebi_iwocensor;
  output jesus_what;
  output killer_curie;
  output hp_richard;
  output bubba_doc;
  output vangoh_hinge;
  output martin_safada;
  output ready_xray;
  output rerun_tapered;
  output vadar_protest;
  output picante_meth;
  output south_ebi;
  output nasdaq_doc;
  output pork_balloon;
  output drax_rat;
  output peace_cannon;
  output midas_killer;

//tristate outs
  output boitano_bagel;
  output deuce_bismuth;
  output emu_skinner;
  output blessyou_haze;
  output lovey_ring;
  output fang_honda;
  output charlie_ariel;


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



  reg kilo;
  reg lima;
  reg mike;
  reg november;
  reg oscar;
  reg papa;
  reg quebec;
  reg whiskey;
  reg xray;
  reg yankee;
  reg zulu;
  reg bomb_pop;
  reg for_gregg;
    parameter romeo_0 = 0,romeo_1 = 1,romeo_2 = 2,romeo_3 = 3,romeo_4 = 4;
    reg [3:0] romeo;

  reg adbcensor;
  reg richard;
  reg rubik;
  reg hinge;
  reg marker;
  reg red;
  reg blue;
  reg cassowary;
  reg cat;
  reg chicken;
  reg cow;
  reg dog;
  reg donkey;
  reg dragon;
  reg duck;
  reg eagle;
  reg jellyfish;
  reg llama;
  reg monkey;
  reg mouse;
  reg newt;
  reg ostrich;
  reg otter;
  reg penguin;
  reg pig;
  reg platypus;
  reg possum;
  reg quail;
  reg rat;
  reg tiger;
  reg unicorn;
  reg vulture;
  reg wolverine;
  reg xuprocar;
  reg yak;
  reg zebra;
  reg shuda;
  reg maklak;
  reg bcdcensor;
  reg safada;
  reg ceecensor;
  reg dfecensorc;
  reg saturn;
  reg neon;
  reg loser;
  reg turnip;
  reg potato;
  reg nuclear;
  reg insurance;
  reg bathroom;
  reg popcorn;
  reg jimmyjames;
  reg dr_zaius;
  reg amadeus;
  reg whack;
  reg jason;
  reg funkadelic;
  reg books;
  reg cluckU;
  reg togos;
  reg chiptrip;
  reg what;
  reg would;
  reg brian;
  reg boitano;
  reg due;
  reg genesis;
  reg deuteronomy;
  reg leviticus;
  reg xterm;
  reg numbers;
  reg bagel;
  reg english;
  reg muffin;
  reg ceres;
  reg moulin;
  reg rouge;
  reg cellphone;
  reg mortgate;
  reg stapler;
  reg holepunch;
  reg metal;
  reg dork;
  reg autotest;
  reg picture;
  reg sleepy;
  reg dopey;
  reg sneezy;
  reg happy;
  reg bashful;
  reg doc;
  reg donald;
  reg mickey;
  reg minnie;
  reg spock;
  reg goofy;
  reg gyro;
  reg scrooge;
  reg huey;
  reg duey;
    parameter grumpy_0 = 0,grumpy_1 = 1,grumpy_2 = 2,grumpy_3 = 3,grumpy_4 = 4,grumpy_5 = 5,grumpy_6 = 6,grumpy_7 = 7,grumpy_8 = 8;
    reg [3:0] grumpy;

  reg louie;
  reg cinderella;
  reg beauty;
  reg superman;
  reg batman;
  reg wonder;
  reg woman;
  reg hulk;
  reg lantern;
  reg riddler;
  reg joker;
  reg luthor;
  reg hercules;
  reg ajax;
  reg achilles;
  reg hector;
  reg agamemnon;
  reg aladdin;
  reg bambi;
  reg pocahontas;
  reg jesus;
  reg buddha;
  reg dali_llama;
  reg clinton;
  reg bush;
  reg washington;
  reg hamburger;
  reg hotdog;
  reg drdeath;
  reg klinton;
  reg kang;
  reg water;
  reg air;
  reg fire;
  reg magicwand;
  reg beavis;
  reg butthead;
  reg barty;
  reg cartman;
  reg sand;
  reg hours;
  reg lamer;
  reg hoser;
  reg dweebie;
  reg burnout;
  reg jacques;
  reg pdaddy;
  reg dorkus;
  reg master;
  reg flew;
  reg over;
  reg cuckoo;
  reg nest;
  reg starwars;
  reg yoda;
  reg obiwan;
  reg vadar;
  reg skywalker;
  reg north;
  reg southern;
  reg east;
  reg west;
  reg porfavor;
  reg cuanto;
  reg pantalones;
  reg rojas;
  reg popacap;
  reg pizza;
  reg mushroom;
  reg cheese;
  reg mcnugget;
  reg werewolf;
  reg spirit;
  reg vampire;
  reg pyro;
  reg criminal;
  reg orange;
  reg purple;
  reg yellow;
  reg clay;
  reg paper;
  reg crayons;
  reg kmfdm;
  reg pentium;
  reg bubba;
  reg ohno;
  reg fallen;
  reg comrade;
  reg biker;
  reg tattoo;
  reg kanji;
  reg knot;
  reg bellybutton;
  reg whammy;
  reg deathguild;
  reg maritime;
  reg surfer;
  reg moron;
  reg iterate;
  reg elkarchmero;
  reg elguapo;
  reg senorduck;
  reg firstpart;
  reg leidiot;
  reg kidnapper;
  reg ring;
  reg think;
  reg firewiggle;
  reg bracket;
  reg probably;
  reg shudamak;
  reg callme;
  reg wannabe;
  reg fuji;
  reg emails;
  reg dadada;
  reg conference;
  reg parrot;
  reg onthepc;
  reg facetious;
  reg rafting;
  reg freaky;
  reg davidlin;
  reg blueled;
  reg prison;
  reg marquis;
  reg desade;
  reg baron;
  reg vonmunchhausen;
  reg boots;
  reg narcotics;
  reg cocaine;
  reg contractor;
  reg doobie;
  reg float;
  reg budlite;
  reg morenames;
  reg mrbill;
  reg dutch;
  reg candle;
  reg spyro;
  reg kennyg;
  reg johndenver;
  reg jacklemon;
  reg theonion;
  reg chatanooga;
  reg kebab;
  reg kabar;
  reg fullmetal;
  reg aluminum;
  reg copper;
  reg zinc;
  reg platinum;
  reg tin;
  reg iron;
  reg fascist;
  reg anarchist;
    parameter speedyg_0 = 0,speedyg_1 = 1,speedyg_2 = 2,speedyg_3 = 3,speedyg_4 = 4,speedyg_5 = 5,speedyg_6 = 6,speedyg_7 = 7,speedyg_8 = 8,speedyg_9 = 9,speedyg_10 = 10;
    reg [3:0] speedyg;

  reg capitalist;
  reg moderate;
  reg drevil;
  reg fsncens;
  reg tinker;
  reg roosevelt;
  reg opus;
  reg milo;
  reg potatoskin;
  reg roastbeef;
  reg poppyseed;
  reg kungfu;
  reg testyour;
  reg excellent;
  reg danger;
  reg screaming;
  reg atilla;
  reg famulan;
  reg supurb;
  reg jayqueeze;
  reg waydeelect;
  reg iwocensor;
  reg incompetent;
  reg secondrate;
  reg inspection;
  reg thedon;
  reg marco;
  reg cocacola;
  reg ham;
  reg mandarin;
  reg ihilani;
  reg october;
  reg tracy;
  reg jjocen;
  reg meffert;
  reg bismuth;
  reg floride;
  reg oranges;
  reg pyromaniac;
  reg junkie;
  reg waster;
  reg burner;
  reg crackhead;
  reg stoner;
  reg drugie;
  reg chemical;
  reg brothers;
  reg tunafish;
  reg eggsalad;
  reg agitator;
  reg postulator;
  reg satanist;
  reg plagarist;
  reg whoiswho;
  reg money;
  reg morrison;
  reg firewalk;
  reg withme;
  reg palmer;
  reg banality;
  reg brutality;
  reg fury;
  reg hurt;
  reg yoku;
  reg simasu;
  reg geisha;
  reg pictures;
  reg star;
  reg show;
  reg ready;
  reg gokidsgo;
  reg lemon;
  reg winner;
  reg speeding;
  reg hiway;
  reg grams;
  reg kdqcens;
  reg bust;
  reg gotone;
  reg foryou;
  reg sogood;
  reg moreand;
  reg faster;
  reg elementary;
  reg sixyears;
  reg overeducated;
  reg nation;
  reg animal;
  reg vegetarian;
  reg liberation;
  reg psycho;
  reg fruitcake;
  reg zealot;
  reg chainsaw;
  reg rasp;
  reg square;
  reg romex;
  reg jxnbox;
  reg knockout;
  reg curie;
  reg gutter;
  reg plaster;
    parameter extremist_0 = 0,extremist_1 = 1,extremist_2 = 2,extremist_3 = 3,extremist_4 = 4,extremist_5 = 5;
    reg [3:0] extremist;

  reg wood;
  reg greenbay;
  reg raiders;
  reg giants;
  reg yankees;
  reg nyc;
  reg broadway;
  reg dirty;
  reg noyoudirty;
  reg muggers;
  reg whattime;
  reg sanity;
  reg michelle;
  reg rocks;
  reg legos;
  reg eatem;
  reg blanket;
  reg china;
  reg usa;
  reg holland;
  reg puertorico;
  reg mexico;
  reg spain;
  reg greenland;
  reg scotland;
  reg england;
  reg romulus;
  reg cain;
  reg abel;
  reg zipporah;
  reg issac;
  reg abraham;
  reg jacob;
  reg joseph;
  reg dreamcoat;
  reg ringlingbros;
  reg lxtcen;
  reg terrance;
  reg piggish;
  reg cryptic;
  reg crapeteria;
  reg mdtcensorc;
  reg nihlist;
  reg moses;
  reg burning;
  reg nhtcenso;
  reg oitcen;
  reg daughter;
  reg gin;
  reg tonic;
  reg rum;
  reg scotch;
  reg larry;
  reg curly;
  reg barnum;
  reg shemp;
  reg wiggum;
  reg bart;
  reg lisa;
  reg marge;
  reg homerun;
  reg barney;
  reg skinner;
  reg tarzan;
  reg moe;
  reg smithers;
  reg comicbook;
  reg worstdesignever;
  reg flanders;
  reg heidi;
  reg steaming;
    parameter krabapple_0 = 0,krabapple_1 = 1,krabapple_2 = 2,krabapple_3 = 3,krabapple_4 = 4,krabapple_5 = 5,krabapple_6 = 6,krabapple_7 = 7,krabapple_8 = 8,krabapple_9 = 9,krabapple_10 = 10;
    reg [3:0] krabapple;

  reg milhouse;
  reg todd;
  reg timmy;
  reg slobbering;
  reg psucensorc;
  reg deuce;
  reg eeevil;
  reg intuit;
  reg bert;
  reg ernie;
  reg life;
  reg snuffleupagus;
  reg peta;
  reg happyists;
  reg atomic;
  reg firemonkey;
  reg qfvcensorce;
  reg captain;
  reg rhvcens;
  reg roid;
  reg itchy;
  reg squad;
  reg joey;
  reg ramone;
  reg stoned;
  reg south;
  reg edible;
  reg srvcensorce;
  reg on_sale;
  reg dinoblaster;
  reg crunchyfrog;
  reg nobody;
  reg expects_the;
  reg spanish;
  reg chief;
  reg weapons;
  reg fear;
  reg efficiency;
  reg devotion;
  reg the_pope;
  reg love_in;
  reg my_tummy;
  reg po;
  reg lala;
  reg dipsy;
  reg touch;
  reg kissthesky;
  reg peopleeater;
  reg haze;
  reg timingmodel;
  reg odin;
  reg thor;
  reg jupiter;
  reg zeus;
  reg athena;
  reg minerva;
  reg mars;
  reg venus;
  reg pluto;
  reg neptune;
  reg ariel;
  reg sebastian;
  reg bach;
  reg mozart;
  reg goodmonkey;
  reg badmonkey;
  reg partners;
  reg cubish;
  reg valve;
  reg pilot;
  reg leaky;
  reg drax;
  reg killme;
  reg tyycensor;
  reg sortout;
  reg sgates;
  reg atoms;
  reg thankee;
  reg wakey;
  reg ants;
  reg ladder;
  reg wrecker;
  reg dumptruck;
  reg dumbarton;
  reg golden;
  reg egg;
  reg tofu;
  reg rodent;
  reg billnted;
  reg whiteboard;
  reg synthesis;
  reg fitter;
    parameter dig_0 = 0,dig_1 = 1,dig_2 = 2,dig_3 = 3,dig_4 = 4,dig_5 = 5,dig_6 = 6,dig_7 = 7;
    reg [3:0] dig;

  reg dingbat;
  reg wiggles;
  reg rewire;
  reg suffering;
  reg vegas;
  reg tuna;
  reg sake;
  reg ebi;
  reg rainbow;
  reg octapus;
  reg yellowtail;
  reg crab;
  reg nigiri;
  reg handroll;
  reg maki;
  reg roe;
  reg tobiko;
  reg kappa;
  reg cucumber;
  reg california;
  reg ebay;
  reg covad;
  reg exodus;
  reg abovenet;
  reg webvan;
  reg sears;
  reg lucent;
  reg ibm;
  reg intel;
  reg hp;
  reg gm;
  reg ford;
  reg chillis;
  reg macdonalds;
  reg lockheed;
  reg martin;
  reg marvin;
  reg martian;
  reg molokai;
  reg amex;
  reg nasdaq;
  reg dow;
  reg taoist;
  reg liberace;
  reg microsoft;
  reg sun;
  reg oracle;
  reg bfi;
  reg century;
  reg harrydavid;
  reg safeway;
  reg pepsi;
  reg pacbell;
  reg att;
  reg tsmc;
  reg bathbody;
  reg papyrus;
  reg macys;
  reg sharperimg;
  reg mitsubishi;
  reg honda;
  reg pimpernel;
  reg kbtoys;
  reg toysrus;
  reg gap;
  reg bananarep;
  reg oldnavy;
  reg clothing;
  reg starbucks;
  reg coffee;
  reg structure;
  reg jcrew;
  reg whatelse;
  reg blessyou;
  reg kerchoozle;
  reg siamese;
  reg tabby;
  reg notsure;
  reg monster;
  reg incagardens;
  reg genji;
  reg lafondue;
  reg subway;
  reg pasta;
  reg pomodoro;
  reg puttanesca;
  reg golfland;
  reg arcade;
    parameter atchoo_0 = 0,atchoo_1 = 1,atchoo_2 = 2,atchoo_3 = 3,atchoo_4 = 4,atchoo_5 = 5,atchoo_6 = 6,atchoo_7 = 7,atchoo_8 = 8,atchoo_9 = 9,atchoo_10 = 10;
    reg [3:0] atchoo;

  reg jacuzzi;
  reg bonker;
  reg bono;
  reg stemcell;
  reg shark;
  reg carolina;
  reg avon;
  reg bomb;
  reg school;
  reg cornell;
  reg soccer;
  reg softball;
  reg fieldhockey;
  reg nirish;
  reg peace;
  reg mideast;
  reg illegal;
  reg drugs;
  reg infesting;
  reg children;
  reg crank;
  reg marijuana;
  reg lsd;
  reg acid;
  reg crack;
  reg speed;
  reg meth;
  reg crystal;
  reg uppers;
  reg downers;
  reg viagra;
  reg yohimbe;
  reg decongestant;
  reg nyquil;
  reg dimetap;
  reg coughsyrup;
  reg vicks;
  reg comtrex;
  reg aspirin;
  reg advil;
  reg naproxen;
  reg tylenol;
  reg sinus;
  reg sinew;
  reg snort;
  reg pcp;
  reg phenyalanine;
  reg saccarine;
  reg nutrasweet;
  reg sugar;
  reg honey;
  reg rose;
  reg foliage;
  reg defoliant;
  reg curious;
  reg george;
  reg balloon;
  reg robust;
  reg enoch;
  reg bobblehead;
  reg cheez;
  reg zed;
  reg zen;
  reg falafel;
  reg rodriguez;
  reg dukdodger;
  reg ocha;
  reg kaisha;
  reg hellokitty;
  reg badtzmaru;
  reg sapporo;
  reg asahi;
  reg hummer;
  reg elian;
  reg condit;
  reg gopher;
  reg lotus;
  reg flyingmonkey;
  reg scotchtape;
  reg wicked;
  reg witch;
  reg ghost;
  reg elf;
  reg centaur;
  reg theseus;
  reg midas;
  reg icarus;
  reg pegasus;
  reg troll;
  reg warlock;
  reg chowmein;
  reg stirfry;
  reg tasty;
  reg pastrami;
  reg turkey;
  reg beast;
  reg bacon;
  reg salami;
  reg peaves;
  reg snape;
  reg hagrid;
  reg tonks;
  reg bumbledork;
  reg madeye;
  reg weasley;
  reg floo;
  reg powder;
  reg broom;
  reg stick;
  reg quidditch;
  reg phoenix;
  reg arizona;
  reg fang;
  reg scabbers;
    parameter moody_0 = 0,moody_1 = 1,moody_2 = 2,moody_3 = 3,moody_4 = 4,moody_5 = 5,moody_6 = 6,moody_7 = 7,moody_8 = 8,moody_9 = 9;
    reg [3:0] moody;

  reg umbridge;
  reg norris;
  reg sirius;
  reg lupin;
  reg severus;
  reg arthur;
  reg snake;
  reg mundungus;
  reg army;
  reg crookshanks;
  reg trevor;
  reg neville;
  reg longbottom;
  reg bellatrix;
  reg lestrange;
  reg malfoy;
  reg draco;
  reg lucius;
  reg narcissa;
  reg albus;
  reg mcgonagall;
  reg hogwarts;
  reg rubeus;
  reg drumstrang;
  reg norbert;
  reg wizard;
  reg diagon;
  reg fireplace;
  reg crucio;
  reg kedavra;
  reg mario_owes;
  reg gregg_a;
  reg burrito;
  reg correctness;
  reg cafe;
  reg synplicity_burrito;
  reg guacamole;
  reg sourcream;
  reg onion;
  reg jalapeno;
  reg beef;
  reg pork;
  reg blackbeans;
  reg refriedbeans;
  reg pintobeans;
  reg tortilla;
  reg salsa;
  reg picante;
  reg chips;
  reg tabasco;
  reg mexican;
  reg too_big;
  reg llamas_dont_eat_burrito;
  reg director_of_llamas;
  reg fufu;
  reg castaway;
  reg coconut;
  reg maryann;
  reg gilligan;
  reg skipper;
  reg professor;
  reg moviestar;
  reg ginger;
  reg jonas;
  reg minnow;
  reg lost;
  reg bfs;
  reg thurston;
  reg lovey;
  reg howell;
  reg hinkley;
  reg eunice;
  reg witchdoctor;
  reg voodoo;
  reg uncharted;
  reg reallyloud;
  reg hypnotized;
  reg ohthatcoconut;
  reg booming;
  reg rarest;
  reg butterfly;
  reg palm;
  reg seashell;
  reg ohisee;
  reg whacky;
  reg rerun;
  reg fronds;
  reg hut;
  reg rescue;
  reg hawaii;
  reg wallstreet;
  reg levelization;
  reg huhhuh;
  reg uomcensor;
  reg wildboar;
  reg husks;
  reg escape;
  reg foiled;
  reg bamboo;
  reg desert;
  reg isle;
  reg pacific;
  reg ocean;
  reg waterfall;
  reg tan_nodes;
  reg loud;
  reg millionaire;
  reg hiswife;
  reg smack;
  reg banshee;
  reg dillweed;
  reg vimcensorc;
  reg tesla;
  reg killer;
  reg wonton;
  reg pierre;
  reg armand;
  reg rufus;
  reg willy;
  reg gulp;
  reg bonafide;
  reg stroop;
  reg waffle;
  reg wheezer;
  reg ozzy;
  reg priest;
  reg rabbi;
  reg wancensorcens;
  reg xbncensorcens;
  reg spastic;
  reg lad;
  reg mao;
  reg zedong;
  reg deng;
  reg jinyong;
  reg zi;
  reg zhuang;
  reg wujing;
  reg wukong;
  reg helena;
  reg gerrit;
  reg willem;
  reg dirk;
  reg klaas;
  reg bep;
  reg hans;
  reg leeuwenhoek;
  reg microscope;
  reg deruyter;
  reg vangoh;
  reg oranje;
  reg schwinger;
  reg feynman;
  reg plague;
  reg automounter;
  reg boing;
  reg ykocens;
  reg pixie;
  reg stix;
  reg georgec;
  reg tango_loud;
  reg cluckU_fuji;
  reg criminal_newt;
  reg sun_milhouse;
  reg condit_yak;
  reg bomb_yak;
    parameter fortuyn_0 = 0,fortuyn_1 = 1,fortuyn_2 = 2,fortuyn_3 = 3,fortuyn_4 = 4,fortuyn_5 = 5,fortuyn_6 = 6,fortuyn_7 = 7;
    reg [3:0] fortuyn;

  reg romex_dingbat;
  reg nyc_rubeus;
  reg danger_star;
  reg peace_boots;
  reg tango_saturn;
  reg desade_touch;
  reg bust_doobie;
  reg salmon_mickey;
  reg atilla_sheep;
  reg gin_kdqcens;
  reg atchoo_deng;
  reg salsa_hulk;
  reg zulu_hagrid;
  reg winner_bambi;
  reg weevil_tako;
  reg elguapo_marco;
  reg china_ham;
  reg cheese_tobiko;
  reg weevil_prison;
  reg pork_eel;
  reg barnum_fufu;
  reg thedon_goofy;
  reg Iwin_odin;
  reg skinner_ohno;
  reg jiminy_fear;
  reg boots_sanity;
  reg jupiter_ceres;
  reg east_zealot;
  reg yankee_huey;
  reg stoner_zed;
  reg aphid_bullet;
  reg chuck_golf;
  reg hurt_saturn;
  reg foxtrot_ring;
  reg red_barty;
  reg pluto_exodus;
  reg shark_avon;
  reg marge_killme;
  reg ostrich_gap;
  reg helena_sinus;
  reg cluckU_klaas;
  reg pizza_popacap;
  reg odin_hotdog;
  reg goblin_romex;
  reg iguana_bullet;
  reg tofu_leidiot;
  reg turnip_doobie;
  reg ibm_chief;
  reg south_norbert;
  reg gerrit_gyro;
  reg hans_kungfu;
  reg floo_xray;
  reg solder_troll;
  reg pyro_kmfdm;
  reg copper_beef;
  reg stoner_saturn;
  reg maki_hp;
  reg spirit_shuda;
  reg ohisee_malfoy;
  reg moody_opus;
  reg army_cafe;
  reg whale_ocha;
  reg curie_yankee;
  reg chillis_avon;
  reg escape_fish;
  reg rojas_bull;
  reg sleeping_art;
  reg hoser_holland;
  reg leaky_sanity;
  reg ramone_black;
  reg intuit_voodoo;
  reg spain_stix;
  reg oscar_tobiko;
  reg deng_tinker;
  reg crack_donald;
  reg bathroom_elf;
  reg troll_lemon;
  reg goblin_bear;
  reg parrot_eeevil;
  reg quebec_webvan;
  reg lsd_turnip;
  reg bach_maryann;
  reg danger_pig;
  reg lotus_sgates;
  reg pimpernel_moe;
  reg dopey_tattoo;
  reg ready_tiger;
  reg rasp_stoned;
  reg weasley_valve;
  reg portnoy_stick;
  reg palmer_emails;
  reg weevil_solder;
  reg isle_fufu;
  reg ladder_barnum;
  reg guy_steaming;
  reg mike_mcnugget;
  reg kebab_nyquil;
  reg possum_yoda;
  reg sweetie_grams;
  reg avon_liberace;
  reg achilles_lala;
  reg ajax_too_big;
  reg chillis_willy;
  reg dow_amex;
  reg lion_popcorn;
  reg nasdaq_ebay;
  reg zulu_baron;
  reg fury_beast;
  reg peaves_squad;
  reg fury_grams;
  reg lotus_golf;
  reg rocks_ohisee;
  reg jonas_monster;
  reg ginger_tsmc;
  reg hotel_macys;
  reg roe_abraham;
  reg tinker_george;
  reg pig_budlite;
  reg monkey_whale;
  reg babette_crank;
  reg chillis_peace;
  reg lima_hummer;
  reg bolt_foliage;
  reg severus_valve;
  reg dweebie_bep;
  reg llama_palm;
  reg might_what;
  reg kilo_knot;
  reg emu_xiaoping;
  reg pastrami_bull;
  reg tiger_dimetap;
  reg water_century;
  reg ernie_woman;
  reg woman_tiger;
  reg baron_foliage;
  reg bust_zen;
  reg hinge_enoch;
  reg homer_goofy;
  reg theseus_maki;
  reg maklak_waffle;
  reg egg_starwars;
  reg drevil_sinus;
  reg north_fortuyn;
  reg ariel_wujing;
  tri boitano_bagel;
  reg ladder_lizard;
  tri deuce_bismuth;
  tri emu_skinner;
  tri blessyou_haze;
  reg knot_neville;
  reg pepsi_spanish;
  reg bolt_trevor;
  reg kungfu_surfer;
  reg pizza_green;
  reg gulp_mushroom;
  reg ihilani_bert;
  reg tattoo_east;
  reg rat_xterm;
  reg gonzo_eunice;
  reg often_onthepc;
  reg floo_saturn;
  reg greenbay_sake;
  reg llama_bismuth;
  reg baron_clay;
  reg southern_cow;
  reg marge_tofu;
  reg leaky_jinyong;
  reg vicks_skinner;
  reg mexico_sears;
  reg boing_jiminy;
  reg honda_elf;
  reg lsd_downers;
  reg chicken_romex;
  reg pdaddy_kappa;
  reg kabar_jacques;
  reg leidiot_duey;
  reg egg_might;
  reg tank_centaur;
  reg wonton_crack;
  reg advil_army;
  reg broom_eagle;
  reg clay_ritsu;
  reg lemon_joseph;
  reg dimetap_vegan;
  reg ocean_huhhuh;
  reg cybex_romex;
  reg english_pyro;
  reg lamer_webvan;
  reg papa_dadada;
  reg marker_bep;
  reg sgates_think;
  reg ceres_elian;
    parameter golden_sleepy_0 = 0,golden_sleepy_1 = 1,golden_sleepy_2 = 2,golden_sleepy_3 = 3,golden_sleepy_4 = 4,golden_sleepy_5 = 5,golden_sleepy_6 = 6;
    reg [3:0] golden_sleepy;

  reg tamago_opus;
  reg roid_crayons;
  reg floating_guy;
  reg hawaii_danger;
  reg life_atchoo;
  reg noah_mexican;
  reg daughter_lisa;
  reg bfs_star;
  reg oscar_nyquil;
  reg tako_fortuyn;
  reg zed_weevil;
  reg rescue_sun;
  reg haze_smithers;
  reg burner_mrbill;
  reg squad_wukong;
  reg malfoy_nyc;
  reg dork_porfavor;
  reg often_downers;
  reg sake_billnted;
  reg purple_rod;
  reg too_big_dirk;
  reg baron_nihlist;
  reg stroop_mexico;
  reg bust_fear;
  reg due_firewalk;
  reg zedong_nyc;
  reg emu_abraham;
  reg timmy_bracket;
  reg pilot_nasdaq;
  reg sand_badger;
  reg muffin_homer;
  reg due_happy;
  reg skipper_gonzo;
  reg metal_covad;
  reg klinton_macys;
  reg quebec_crank;
  reg nest_mcnugget;
  reg armand_lovey;
  reg priest_gopher;
  reg marvin_xterm;
  reg lsd_shuda;
  reg bambi_skipper;
  reg vegas_abraham;
  reg kanji_gyro;
  reg beauty_dog;
  reg emu_romex;
  reg onion_trevor;
  reg rubeus_egg;
  reg avon_giants;
  reg fatality_sun;
  reg rat_what;
  reg marquis_husks;
  reg neville_bravo;
  reg water_ykocens;
  reg hotdog_priest;
  reg thread_quail;
  reg grumby_haze;
  reg louie_heidi;
  reg snort_quebec;
  reg tiger_rubik;
  reg boing_kebab;
  reg speed_tuna;
  reg yankee_zi;
  reg ladder_loser;
  reg quail_fascist;
  reg sogood_brian;
  reg condit_pirate;
  reg pepsi_moe;
  reg albus_what;
  reg oscar_dimetap;
  reg tonks_jesus;
  reg oldnavy_romex;
  reg crab_tank;
  reg paper_english;
  reg hawaii_plague;
  reg po_yellowtail;
  reg tonic_whale;
  reg egg_plague;
  reg cocaine_bart;
  reg rose_hp;
  reg deuce_salsa;
  reg stix_mickey;
  reg eggsalad_dirk;
  reg ginger_hinge;
  reg curly_red;
  reg whacky_hinge;
  reg drax_intuit;
  reg issac_gonzo;
  reg green_sortout;
  reg avon_neon;
  reg snake_copper;
  reg crayons_fury;
  reg dig_uppers;
  reg liberace_lad;
  reg boitano_wine;
  reg goblin_cubish;
  reg west_sand;
  reg emails_lamer;
  reg lao_ritsu;
  reg malfoy_indigo;
  reg kungfu_duey;
  reg wine_monster;
  reg stick_roid;
  reg metal_heidi;
  reg grams_wakey;
  reg tiger_hiway;
  reg marco_chevys;
  reg romex_whiskey;
  reg tsmc_milhouse;
  reg tiger_skipper;
  reg willy_emails;
  reg bear_speedyg;
  reg yeanyow_atoms;
  reg cain_wiggles;
  reg zedong_coffee;
  reg illegal_duck;
  reg square_hagrid;
  reg vegan_floo;
  reg gm_lotus;
  reg chainsaw_clay;
  reg nyc_pizza;
  reg tabby_nuclear;
  reg ramone_amex;
  reg remus_vicks;
  reg penguin_cheez;
  reg turkey_tank;
  reg foxtrot_boots;
  reg palmer_dadada;
  reg gonzo_scrooge;
  reg stoner_candle;
  reg bravo_hours;
  reg george_lovey;
  reg sheep_gyro;
  reg jason_drunken;
  reg bach_rewire;
  reg beetle_genji;
  reg iron_gonzo;
  reg advil_iceland;
  reg smack_beavis;
  reg southern_bfi;
  reg cafe_concorde;
  reg west_stick;
  reg falafel_north;
  reg beetle_star;
  reg genji_dweebie;
  reg gulp_oitcen;
  reg lad_fascist;
  reg jacques_rum;
  reg escape_escape;
  reg rerun_husks;
  reg kabar_mortar;
  reg wine_eggsalad;
  reg frog_emails;
  reg kana_red;
  reg kebab_arizona;
  reg leidiot_ghost;
  reg dweebie_issac;
  reg bfi_obiwan;
  reg seashell_mars;
  reg fire_whack;
  reg lumber_kmfdm;
  reg rouge_alpha;
  reg pixie_spain;
  reg rouge_east;
  reg phoenix_ebay;
  reg zen_firstpart;
  reg rarest_tabby;
  reg viagra_plague;
  reg lupin_gotone;
  reg dig_obiwan;
  reg alpha_maryann;
  reg often_pdaddy;
  reg aphid_lantern;
  reg sugar_coconut;
  reg ernie_emu;
  reg burning_ohno;
  reg rod_sebastian;
  reg zeus_hinkley;
  reg shark_richard;
  reg avon_century;
  reg gyro_love_in;
  reg spyro_lotus;
  reg popcorn_whack;
  reg eagle_beef;
  reg riddler_hans;
  reg bear_morrison;
  reg dow_blue;
  reg protest_cow;
  reg george_hp;
  reg opus_riddler;
  reg pizza_rose;
  reg kilo_autotest;
  reg fitter_pilot;
  reg bravo_exodus;
  reg spastic_todd;
  reg golfland_roid;
  reg richard_lamer;
  reg beemer_floo;
  reg vicks_tracy;
  reg escape_jesus;
  reg dragon_broom;
  reg burner_bfi;
  reg egg_wonton;
  reg abraham_albus;
  reg curie_lost;
  reg wine_mine;
  reg monkey_barney;
  reg mrbill_mars;
  reg athena_barty;
  reg marge_dirty;
  reg salsa_master;
  reg sirius_tobiko;
  reg venus_martian;
  reg goat_romex;
  reg fang_atilla;
  reg egg_barney;
  reg eagle_centaur;
  reg ramone_palmer;
  reg schwinger_red;
  reg potato_bull;
  reg pixie_kungfu;
  reg pasta_shuda;
  reg lost_agitator;
  reg square_cubish;
  reg dig_fsncens;
  reg lao_shudamak;
  reg hawaii_marco;
  reg palmer_bust;
  reg rodriguez_guy;
  reg wonder_stroop;
  reg marco_orange;
  reg bep_defoliant;
  reg what_eel;
  reg happy_mortar;
  reg metal_romulus;
  reg bravo_arcade;
  reg chowmein_haze;
  reg ham_bacon;
  reg moron_gin;
  reg roe_kanji;
  reg nyc_candle;
  reg elf_killer;
  reg curie_plague;
  reg spyro_neon;
  reg ocha_meffert;
  reg kungfu_elian;
  reg gap_greenbay;
  reg gilligan_mine;
  reg hector_potato;
  reg tsmc_wildboar;
  reg moron_curious;
  reg jesus_rubik;
  reg what_doobie;
  reg rose_larry;
  reg oscar_tapered;
  reg spain_yellow;
  reg advil_yummy;
  reg foryou_subway;
  reg freaky_pdaddy;
  reg bonker_gonzo;
  reg bfs_mortar;
  reg hans_palmer;
  reg curie_sogood;
  reg fear_exodus;
  reg itchy_rose;
  reg parrot_dragon;
  reg yak_holepunch;
  reg indigo_buddha;
  reg wood_notalot;
  reg minerva_wakey;
  reg pirate_gutter;
  reg orange_cubish;
  reg nasdaq_shemp;
  reg opus_liberace;
  reg sanity_hp;
  reg stick_intuit;
  reg iron_cheese;
  reg hulk_kaisha;
  reg ready_spirit;
  reg show_theseus;
  reg molokai_rum;
  reg seashell_abel;
  reg maryann_yoku;
  reg lao_steaming;
  reg float_floo;
  reg beetle_whale;
  reg elf_east;
  reg boitano_boing;
  reg pcp_master;
  reg isle_mortgate;
  reg acid_gopher;
  reg norbert_goofy;
  reg yummy_pizza;
  reg deng_gerrit;
  reg echo_zealot;
  reg rerun_might;
  reg ebay_sogood;
  reg nigiri_chuck;
  reg nigiri_ford;
  reg lizard_peta;
  reg donald_rescue;
  reg jupiter_lsd;
  reg kennyg_barney;
  reg delta_desert;
  reg blanket_tonks;
  reg richard_lovey;
  reg pcp_aphid;
  reg obiwan_tonks;
  reg gin_golden;
  reg tobe_foiled;
  reg burner_often;
  reg dweebie_ring;
  reg babette_aphid;
  reg lockheed_fire;
  reg bagel_shuda;
  reg chainsaw_tofu;
  reg spirit_norris;
  reg touch_scotch;
  reg cheez_zedong;
  reg badger_donkey;
  reg lizard_donkey;
  reg jonas_bep;
  reg fire_boing;
  reg gap_india;
  reg my_tummy_zi;
  reg jonas_aspirin;
  reg timmy_snake;
  reg emu_zipporah;
  reg enoch_vangoh;
  reg dirty_cow;
  reg newt_clothing;
  reg mickey_willy;
  reg soccer_moe;
  reg weasley_hinge;
  reg bismuth_fire;
  reg sand_lotus;
  reg mexico_atoms;
  reg south_curie;
  reg att_maryann;
  reg whack_smack;
  reg hinge_questo;
  reg tsmc_snape;
  reg victor_cuanto;
  reg elephant_gm;
  reg blanket_pilot;
  reg ceres_intel;
  reg superman_todd;
  reg mike_lotus;
  reg cocacola_milo;
  reg parrot_hippo;
  reg nyc_rod;
  reg acid_tapered;
  reg pepsi_gerard;
  reg crack_kungfu;
    parameter baron_viagra_0 = 0,baron_viagra_1 = 1,baron_viagra_2 = 2,baron_viagra_3 = 3,baron_viagra_4 = 4;
    reg [3:0] baron_viagra;

  reg snape_neptune;
  reg star_ernie;
  reg hp_rampacker;
  reg jason_dirty;
  reg mexican_mike;
  reg papa_sun;
  reg zen_drugie;
  reg wizard_snape;
  reg tunafish_duey;
  reg whiskey_crank;
  reg bono_bonafide;
  reg sogood_drax;
  reg burner_hurt;
  reg fury_mozart;
  reg what_booming;
  reg sinew_intel;
  reg bacon_nest;
  reg killme_arcade;
  reg ariel_thedon;
  reg crank_mozart;
  reg diagon_zebra;
  reg sgates_juliet;
  reg itchy_oranje;
  reg platinum_frog;
  reg hulk_doobie;
  reg echo_testyour;
  reg ykocens_kana;
  reg golden_robust;
  reg oscar_jupiter;
  reg whiskey_bambi;
  reg ramone_romex;
  reg protest_mine;
  reg illegal_dow;
  reg kanji_bambi;
  reg furnace_kilo;
  reg ceres_bach;
  reg oranges_loud;
  reg curie_aspirin;
  reg fitter_honey;
  reg vangoh_dadada;
  reg vegan_lupin;
  reg chevys_mexico;
  reg bacon_drugs;
  reg bolt_kabar;
  reg boots_macys;
  reg roid_broom;
  reg turnip_deng;
  reg master_milo;
  reg raiders_louie;
  reg knot_picante;
  reg killer_hanger;
  reg china_whacky;
  reg kappa_drax;
  reg often_surfer;
  reg acid_muffin;
  reg elguapo_ghost;
  reg tattoo_bloom;
  reg salmon_badger;
  reg fire_hiswife;
  reg chips_jacuzzi;
  reg iceland_egg;
  reg would_husks;
  reg kbtoys_pepsi;
  reg jacob_ulysses;
  reg vicks_bach;
  reg uniform_crank;
  reg Iwin_neon;
  reg spirit_loser;
  reg roe_lad;
  reg george_soccer;
  reg tiger_eagle;
  reg zulu_satanist;
  reg huey_banality;
  reg saturn_iguana;
  reg yak_edible;
  reg ham_vadar;
  reg boitano_romeo;
  reg often_crack;
  reg star_tylenol;
  reg psycho_goofy;
  reg mushroom_east;
  reg howell_hans;
  reg Iwin_intuit;
  reg zen_loud;
  reg iron_wonton;
  reg pirate_flew;
  reg crab_iterate;
  reg hawaii_turnip;
  reg green_eeevil;
  reg rescue_hp;
  reg touch_neptune;
  reg foxtrot_honda;
  reg happy_bear;
  reg dutch_victor;
  reg loud_romulus;
  reg hurt_pluto;
  reg iterate_south;
  reg mouse_icarus;
  reg kaisha_yak;
  reg homer_donkey;
  reg ceres_whale;
  reg shrimp_eagle;
  reg jacques_bach;
  reg often_faster;
  reg palm_what;
  reg ladder_zinc;
  reg whiskey_egg;
  reg lion_sheep;
  reg cheese_ebi;
  reg muffin_joseph;
  reg balloon_yoku;
  reg tuna_bracket;
  reg mao_willem;
  reg arcade_chuck;
  reg malfoy_bull;
  reg dirk_charlie;
  reg prison_star;
  reg broom_kabar;
  reg dragon_golf;
  reg atilla_hans;
  reg golden_fallen;
  reg fufu_mandarin;
  reg ohno_minnow;
  reg happy_deuce;
  reg cybex_moe;
  reg peace_tin;
  reg lovey_guy;
  reg whammy_armand;
  reg sanity_beast;
  reg platinum_crab;
  reg goat_wujing;
  reg sand_wanton;
  reg athena_arthur;
  reg stix_marvin;
  reg neon_xuprocar;
  reg broom_oranje;
  reg maklak_gyro;
  reg schwinger_bfs;
  reg hiswife_zinc;
  reg lala_martian;
  reg oracle_pixie;
  reg stix_unicorn;
  reg ham_faster;
  reg marge_uppers;
  reg due_theonion;
  reg peta_willy;
  reg penguin_genji;
  reg sinew_rodent;
  reg tobe_davidlin;
  reg llama_tobiko;
  reg louie_mideast;
  reg zhuang_often;
  reg star_obiwan;
  reg star_yoku;
  reg jcrew_chips;
  reg fronds_pluto;
  reg burning_tesla;
  reg bear_golf;
  reg ozzy_doc;
  reg bagel_rubik;
  reg gm_school;
  reg rescue_george;
  reg plumber_fish;
  reg todd_beavis;
  reg stix_iterate;
  reg iron_lizard;
  reg tonks_england;
  reg drugs_ozzy;
  reg killme_larry;
  reg arcade_ritsu;
  reg waster_beetle;
  reg meth_dirk;
  reg kabar_tabby;
  reg raiders_bart;
  reg air_gutter;
  reg air_wildboar;
  reg sinew_ghost;
  reg remus_fallen;
  reg tango_ykocens;
  reg maki_unicorn;
  reg parrot_east;
  reg rouge_plaster;
  reg powder_ariel;
  reg ants_edible;
  reg bert_kaisha;
  reg dipsy_odin;
  reg rubeus_acid;
  reg nest_cow;
  reg sears_rerun;
  reg arthur_att;
  reg pirate_joseph;
  reg newt_cheese;
  reg green_bep;
  reg draco_salmon;
  reg lion_grumby;
  reg butthead_duey;
  reg mars_turkey;
  reg oscar_cheez;
  reg hippo_lao;
  reg bravo_sapporo;
  reg leaky_mortar;
  reg egg_abel;
  reg xterm_sierra;
  reg zebra_bubba;
  reg hans_voodoo;
  reg Iwin_ladder;
  reg rat_solder;
  reg escape_rojas;
  reg spyro_might;
  reg sun_mrbill;
  reg south_aspirin;
  reg papyrus_huey;
  reg sinew_gulp;
  reg turkey_sanity;
  tri lovey_ring;
  reg sun_larry;
  reg turtle_kilo;
  tri fang_honda;
  reg snort_nasdaq;
  tri charlie_ariel;
  reg mandarin_bfs;
  reg desert_albus;
  reg zeus_po;
  reg yellow_victor;
  reg crab_popcorn;
  reg fufu_bono;
  reg money_delta;
  reg doobie_macys;
  reg fufu_vangoh;
  reg lala_sanity;
  reg kilo_marge;
  reg sinew_wine;
  reg bagel_howell;
  reg meth_athena;
  reg spock_webvan;
  reg rat_fsncens;
  reg chillis_fish;
  reg coconut_witch;
  reg mouse_ghost;
  reg books_rodent;
  reg bush_uppers;
  reg midas_dirty;
  reg turtle_life;
  reg ibm_fsncens;
  reg black_yoku;
  reg hummer_potter;
  reg pdaddy_willy;
  reg tako_handroll;
  reg meth_platypus;
  reg sugar_newt;
  reg jacuzzi_tabby;
  reg joseph_hoser;
  reg macys_neptune;
  reg stroop_bart;
  reg maryann_hotel;
  reg tracy_gyro;
  reg due_bolt;
  reg kennyg_tracy;
  reg genji_fuji;
  reg pcp_waster;
  reg tako_remus;
  reg achilles_dig;
  reg marker_tako;
  reg xuprocar_fuji;
  reg phoenix_ozzy;
  reg nation_potato;
  reg bambi_bubba;
  reg martin_sirius;
  reg itchy_wukong;
  reg oranje_spyro;
  reg moe_pomodoro;
  reg deuce_air;
  reg hagrid_zeus;
  reg dog_vulture;
  reg platypus_Iwin;
  reg blaster_togos;
  reg copper_rubeus;
  reg riddler_stix;
  reg tasty_condit;
  reg marker_potter;
  reg bracket_boing;
  reg zi_zed;
  reg tank_eagle;
  reg george_roe;
  reg banality_tuna;
  reg south_crank;
  reg rubeus_att;
  reg freaky_winner;
  reg kdqcens_ritsu;
  reg sirius_zhuang;
  reg wukong_float;
  reg exodus_touch;
  reg fufu_eagle;
  reg beetle_wakey;
  reg dopey_pierre;
  reg deng_gyro;
  reg advil_tango;
  reg fronds_lxtcen;
  reg rubeus_mortar;
  reg knot_clay;
  reg mao_honey;
  reg surfer_fuji;
  reg tonks_fallen;
  reg cain_tuna;
  reg wood_gokidsgo;
  reg boing_freaky;
  reg animal_mickey;
  reg duey_superman;
  reg wine_edible;
  reg joseph_deuce;
  reg brian_advil;
  reg pixie_india;
  reg china_fitter;
  reg ebi_iwocensor;
  reg jesus_what;
  reg killer_curie;
  reg hp_richard;
  reg hotel_zed;
  reg bubba_doc;
  reg vangoh_hinge;
  reg lotus_salami;
  reg martin_safada;
  reg ready_xray;
  reg rerun_tapered;
  reg vadar_protest;
  reg picante_meth;
  reg south_ebi;
  reg lisa_yoku;
  reg nasdaq_doc;
  reg pork_balloon;
  reg moulin_Iwin;
  reg drax_rat;
  reg peace_cannon;
  reg midas_killer;


// 7 bit add sub
always @(gnd or alpha or bravo or charlie or delta or echo or foxtrot or golf or vcc or gnd or hotel or india or juliet or vcc)
  begin
    {kilo,lima,mike,november,oscar,papa,quebec} = 
		{gnd,alpha,bravo,charlie,delta,echo,foxtrot} + 
		{golf,vcc,gnd,hotel,india,juliet,vcc};
  end

// State Mek romeo Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      romeo <= romeo_0;
    else
      case (romeo)
        romeo_0: begin
          if ({sierra,tango,uniform,victor} == 6)
            romeo <= romeo_4;
          else if ({sierra,tango,uniform,victor} == 5)
            romeo <= romeo_3;
          else
            romeo <= romeo_0;
          end
        romeo_1: begin
          if ({sierra,tango,uniform,victor} == 6)
            romeo <= romeo_0;
          else if ({sierra,tango,uniform,victor} == 7)
            romeo <= romeo_2;
          else
            romeo <= romeo_1;
          end
        romeo_2: begin
          if ({sierra,tango,uniform,victor} == 13)
            romeo <= romeo_3;
          else if ({sierra,tango,uniform,victor} == 8)
            romeo <= romeo_4;
          else if ({sierra,tango,uniform,victor} == 14)
            romeo <= romeo_4;
          else
            romeo <= romeo_2;
          end
        romeo_3: begin
          if ({sierra,tango,uniform,victor} == 8)
            romeo <= romeo_1;
          else if ({sierra,tango,uniform,victor} == 12)
            romeo <= romeo_3;
          else if ({sierra,tango,uniform,victor} == 10)
            romeo <= romeo_3;
          else if ({sierra,tango,uniform,victor} == 4)
            romeo <= romeo_0;
          else
            romeo <= romeo_3;
          end
        romeo_4: begin
          if ({sierra,tango,uniform,victor} == 4)
            romeo <= romeo_4;
          else if ({sierra,tango,uniform,victor} == 15)
            romeo <= romeo_0;
          else
            romeo <= romeo_4;
          end
        default: romeo <= romeo_0;
      endcase
  end

// State Mek romeo Output logic
always @(romeo)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (romeo[3:1])
        romeo_0: begin
            whiskey = 0;
            xray = 0;
            yankee = 0;
            zulu = 0;
            bomb_pop = 0;
            for_gregg = 1;
          end
        romeo_1: begin
            whiskey = 1;
            xray = 0;
            yankee = 0;
            zulu = 0;
            bomb_pop = 0;
            for_gregg = 1;
          end
        default: begin
            whiskey = 1;
            xray = 0;
            yankee = 1;
            zulu = 1;
            bomb_pop = 1;
            for_gregg = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire gojira_out;
nut_003_lut #(3) nut_003_lut_inst_gojira (
  .din({kilo,november,vcc}),
  .mask(8'h84),
  .out(gojira_out)
);

always @(gojira_out)
begin
   adbcensor = gojira_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire yeanyow_out;
nut_003_lut #(1) nut_003_lut_inst_yeanyow (
  .din({whiskey}),
  .mask(2'b10),
  .out(yeanyow_out)
);

always @(yeanyow_out)
begin
   richard = yeanyow_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire cybex_out;
nut_003_lut #(5) nut_003_lut_inst_cybex (
  .din({for_gregg,gnd,yankee,quebec,vcc}),
  .mask(32'b00001010011101001100100110000000),
  .out(cybex_out)
);

always @(cybex_out)
begin
   rubik = cybex_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire nail_out;
nut_003_lut #(5) nut_003_lut_inst_nail (
  .din({adbcensor,richard,babette,hanger,gnd}),
  .mask(32'h0cd4ed2e),
  .out(nail_out)
);

always @(nail_out)
begin
   hinge = nail_out;
end


initial begin
    {marker,red,blue} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (lumber)
      {marker,red,blue} <= 0;
    else if (bolt)
      {marker,red,blue} <=
		  {bullet,vcc,gnd};
    else
      {marker,red,blue} <=
		 {launcher,mortar,tank} + 
		 {gnd,cannon,mine};
  end

// const - A
always @(green or aphid or gnd or badger or gnd or bear or beetle or bison or bull)
  begin
    {cassowary,cat,chicken,cow,dog,donkey,dragon,duck,eagle} = 233 - {green,aphid,gnd,badger,gnd,bear,beetle,bison,bull};
  end


// building a 8 to 1 MUX operator
reg [7:0] eel_mux_dat;
reg [2:0] eel_mux_sel;
always @(fish or vcc or frog or goat or vcc or hinge or hippo or iguana)
  begin
    eel_mux_dat = {fish,vcc,frog,goat,vcc,hinge,hippo,iguana};
  end

always @(gnd or elephant or emu)
  begin
    eel_mux_sel = {gnd,elephant,emu};
  end

always @(eel_mux_dat or eel_mux_sel)
  begin
    jellyfish = eel_mux_dat[eel_mux_sel];
  end


initial begin
    {llama,monkey} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({kangaroo,lion} < {lizard,gnd})
       {llama,monkey} <= {lizard,gnd};
    else
       {llama,monkey} <= {kangaroo,lion};
  end

always @(zulu)
  begin
      mouse = !zulu;
  end

always @(adbcensor)
  begin
      newt = !adbcensor;
  end

always @(gnd)
  begin
      ostrich = !gnd;
  end

always @(eagle)
  begin
      otter = !eagle;
  end

always @(donkey)
  begin
      penguin = !donkey;
  end

always @(cassowary)
  begin
      pig = !cassowary;
  end

reg feedback_pt_0;

always @(gnd or feedback_pt_0)
  begin
      platypus =  gnd & !feedback_pt_0;
  end

reg feedback_pt_1;

always @(rubik or feedback_pt_1)
  begin
      possum =  rubik &  feedback_pt_1;
  end

reg feedback_pt_2;

always @(vcc or feedback_pt_2)
  begin
      quail =  vcc |  feedback_pt_2;
  end

reg feedback_pt_3;

always @(oscar or feedback_pt_3)
  begin
      rat = !oscar |  feedback_pt_3;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_m178.v
///////////////////////////////////////////

wire [0:0] sheep_dout;
wire [2:0] sheep_din;
assign sheep_din[2:0] = {platypus,mouse,chicken};

nut_003_m178 nut_003_m178_inst_sheep (
  .ins(sheep_din),
  .clock(clock0),
  .reset(reset0),
  .outs(sheep_dout)
);

always @(sheep_dout)
begin
  {tiger} = sheep_dout[0:0];
end

wire unicorn_outwire, vulture_outwire;
carry_sum turtle (.sin(donkey),.cin(tiger),.sout(unicorn_outwire),.cout(vulture_outwire));

always @(unicorn_outwire or vulture_outwire)
begin
  unicorn = unicorn_outwire;
  vulture = vulture_outwire;
end

wire wolverine_outwire;
carry whale (kilo,wolverine_outwire);

always @(wolverine_outwire)
begin
  wolverine = wolverine_outwire;
end

wire xuprocar_outwire, yak_outwire;
carry_sum woodpecker (.sin(duck),.cin(donkey),.sout(xuprocar_outwire),.cout(yak_outwire));

always @(xuprocar_outwire or yak_outwire)
begin
  xuprocar = xuprocar_outwire;
  yak = yak_outwire;
end

reg feedback_pt_4;

always @(wolverine or feedback_pt_4)
  begin
      zebra = !wolverine &  feedback_pt_4;
  end

reg feedback_pt_5;

always @(ostrich or feedback_pt_5)
  begin
      shuda = !ostrich |  feedback_pt_5;
  end

reg feedback_pt_6;

always @(shuda or feedback_pt_6)
  begin
      maklak = !shuda &  feedback_pt_6;
  end

reg feedback_pt_7;

always @(cat or feedback_pt_7)
  begin
      bcdcensor = !cat &  feedback_pt_7;
  end

reg feedback_pt_8;

always @(platypus or feedback_pt_8)
  begin
      safada =  platypus |  feedback_pt_8;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ceecensor <= 1;
    else
      ceecensor <= jellyfish;
  end

always @(ceecensor)
  begin
      feedback_pt_0 = ceecensor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dfecensorc <= 0;
    else if (cat)
      dfecensorc <= newt;
  end

always @(dfecensorc)
  begin
      feedback_pt_1 = dfecensorc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      saturn <= 0;
    else if (red)
      saturn <= mike;
    else if (pig)
      saturn <= 0;
  end

always @(saturn)
  begin
      feedback_pt_2 = saturn;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      neon <= 0;
    else
      neon <= gnd;
  end

always @(neon)
  begin
      feedback_pt_3 = neon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      loser <= 0;
    else if (chicken)
      loser <= 0;
    else if (gnd)
      loser <= lima;
  end

always @(loser)
  begin
      feedback_pt_4 = loser;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      turnip <= 0;
    else if (loser)
      turnip <= ceecensor;
    else if (penguin)
      turnip <= 0;
  end

always @(turnip)
  begin
      feedback_pt_5 = turnip;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      potato <= 1;
    else
      potato <= penguin;
  end

always @(potato)
  begin
      feedback_pt_6 = potato;
  end

reg feedback_pt_9;

always @(chicken or feedback_pt_9)
  begin
      nuclear =  chicken ^  feedback_pt_9;
  end

reg feedback_pt_10;

always @(xuprocar or feedback_pt_10)
  begin
      insurance = !xuprocar ^  feedback_pt_10;
  end

reg feedback_pt_11;

always @(llama or feedback_pt_11)
  begin
      bathroom = !llama | !feedback_pt_11;
  end

reg feedback_pt_12;

always @(vcc or feedback_pt_12)
  begin
      popcorn = !vcc ^  feedback_pt_12;
  end

reg feedback_pt_13;

always @(zebra or feedback_pt_13)
  begin
      jimmyjames = !zebra & !feedback_pt_13;
  end

reg feedback_pt_14;

always @(safada or feedback_pt_14)
  begin
      dr_zaius = !safada & !feedback_pt_14;
  end

reg feedback_pt_15;

always @(possum or feedback_pt_15)
  begin
      amadeus =  possum | !feedback_pt_15;
  end

  always@(*)
  begin
    whack = ( ~( ( ~( ~( gnd ) ^ ~( vcc ) ) ) ^ ~( newt ) ) ^ ~( ~( ~( ( ~( gnd ^ vcc ) ) ) ) ) ) ? ~gnd : ~( ~( ~( vcc ) ) );
  end
// In range compare
always @(dfecensorc or mike or whack or vcc or vcc or jimmyjames or gnd or dog)
  begin
    if ({dfecensorc,mike,whack,vcc,vcc,jimmyjames,gnd,dog} > 132 &&
        {dfecensorc,mike,whack,vcc,vcc,jimmyjames,gnd,dog} < 53)
      jason = 1;
    else
      jason = 0;
  end

always @(papa or blue or maklak or gnd or dragon or 
   papa or blue or maklak or gnd or rubik or 
   bathroom
)
  begin
    if (bathroom)
    begin
      case ({{papa,blue,maklak,gnd},dragon})
        0: funkadelic=1;
        1: funkadelic=1;
        2: funkadelic=0;
        3: funkadelic=1;
        4: funkadelic=1;
        5: funkadelic=0;
        6: funkadelic=1;
        7: funkadelic=1;
        8: funkadelic=1;
        9: funkadelic=1;
        10: funkadelic=1;
        11: funkadelic=1;
        12: funkadelic=1;
        13: funkadelic=0;
        14: funkadelic=0;
        15: funkadelic=1;
        16: funkadelic=0;
        17: funkadelic=0;
        18: funkadelic=0;
        19: funkadelic=1;
        20: funkadelic=1;
        21: funkadelic=1;
        22: funkadelic=1;
        23: funkadelic=0;
        24: funkadelic=1;
        25: funkadelic=0;
        26: funkadelic=0;
        27: funkadelic=1;
        28: funkadelic=0;
        29: funkadelic=0;
        30: funkadelic=0;
        31: funkadelic=1;
      default: funkadelic=0;
      endcase
    end
    else
    begin
      case ({{papa,blue,maklak,gnd},rubik})
        0: funkadelic=1;
        1: funkadelic=0;
        2: funkadelic=0;
        3: funkadelic=0;
        4: funkadelic=1;
        5: funkadelic=1;
        6: funkadelic=1;
        7: funkadelic=1;
        8: funkadelic=1;
        9: funkadelic=1;
        10: funkadelic=0;
        11: funkadelic=0;
        12: funkadelic=1;
        13: funkadelic=1;
        14: funkadelic=1;
        15: funkadelic=0;
        16: funkadelic=1;
        17: funkadelic=1;
        18: funkadelic=0;
        19: funkadelic=1;
        20: funkadelic=0;
        21: funkadelic=1;
        22: funkadelic=1;
        23: funkadelic=0;
        24: funkadelic=1;
        25: funkadelic=1;
        26: funkadelic=1;
        27: funkadelic=0;
        28: funkadelic=0;
        29: funkadelic=0;
        30: funkadelic=0;
        31: funkadelic=1;
      default: funkadelic=0;
      endcase
    end
  end

// 9 bit priority MUX
always @(
        dr_zaius or gnd  or 
        bcdcensor or vcc  or 
        gnd or tiger  or 
        amadeus or vcc  or 
        xray or popcorn  or 
        mouse or rat  or 
        zebra or xray  or 
        shuda or vcc  or 
        amadeus or vcc 
)

  begin
    if (dr_zaius) books = gnd;
    else if (bcdcensor) books = vcc;
    else if (gnd) books = tiger;
    else if (amadeus) books = vcc;
    else if (xray) books = popcorn;
    else if (mouse) books = rat;
    else if (zebra) books = xray;
    else if (shuda) books = vcc;
    else if (amadeus) books = vcc;
    else books = 0;
  end

reg feedback_pt_16;

always @(llama or feedback_pt_16)
  begin
      cluckU =  llama | !feedback_pt_16;
  end

reg feedback_pt_17;

always @(llama or feedback_pt_17)
  begin
      togos = !llama | !feedback_pt_17;
  end

reg feedback_pt_18;

always @(dfecensorc or feedback_pt_18)
  begin
      chiptrip =  dfecensorc | !feedback_pt_18;
  end

reg feedback_pt_19;

always @(togos or feedback_pt_19)
  begin
      what = !togos | !feedback_pt_19;
  end

reg feedback_pt_20;

always @(cow or feedback_pt_20)
  begin
      would =  cow &  feedback_pt_20;
  end

reg feedback_pt_21;

always @(turnip or feedback_pt_21)
  begin
      brian = !turnip ^ !feedback_pt_21;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      boitano <= 0;
    else
      boitano <= zulu;
  end

always @(boitano)
  begin
      feedback_pt_7 = boitano;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      due <= 1;
    else
      due <= vcc;
  end

always @(due)
  begin
      feedback_pt_8 = due;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      genesis <= 0;
    else if (due)
      genesis <= rat;
  end

always @(genesis)
  begin
      feedback_pt_9 = genesis;
  end

always @(genesis)
  begin
      feedback_pt_10 = genesis;
  end

always @(genesis)
  begin
      feedback_pt_11 = genesis;
  end

always @(genesis)
  begin
      feedback_pt_12 = genesis;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deuteronomy <= 0;
    else if (kilo)
      deuteronomy <= penguin;
  end

always @(deuteronomy)
  begin
      feedback_pt_13 = deuteronomy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      leviticus <= 0;
    else if (zulu)
      leviticus <= 0;
    else if (bomb_pop)
      leviticus <= dragon;
  end

always @(leviticus)
  begin
      feedback_pt_14 = leviticus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      xterm <= 0;
    else if (genesis)
      xterm <= jimmyjames;
    else if (shuda)
      xterm <= 0;
  end

always @(xterm)
  begin
      feedback_pt_15 = xterm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      numbers <= 1;
    else
      numbers <= insurance;
  end

always @(numbers)
  begin
      feedback_pt_16 = numbers;
  end

wire noah_wire;

dffeas noah_ff (
  .clk(clock0),
  .d(gnd),
  .ena(safada),
  .sclr(would),
  .sload(newt),
  .asdata(xterm),
  .clrn(!reset0),
  .q(noah_wire)
);

always @(noah_wire) begin
   bagel = noah_wire;
end

always @(bagel)
  begin
      feedback_pt_17 = bagel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      english <= 0;
    else if (books)
      english <= 0;
    else if (dfecensorc)
      english <= bagel;
  end

always @(english)
  begin
      feedback_pt_18 = english;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      muffin <= 0;
    else if (brian)
      muffin <= 0;
    else if (gnd)
      muffin <= loser;
  end

always @(muffin)
  begin
      feedback_pt_19 = muffin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ceres <= 0;
    else if (boitano)
      ceres <= 0;
    else if (dfecensorc)
      ceres <= adbcensor;
  end

always @(ceres)
  begin
      feedback_pt_20 = ceres;
  end

reg feedback_pt_22;

always @(tiger or feedback_pt_22)
  begin
      moulin =  tiger ^  feedback_pt_22;
  end

reg feedback_pt_23;

always @(adbcensor or feedback_pt_23)
  begin
      rouge =  adbcensor ^ !feedback_pt_23;
  end

reg feedback_pt_24;

always @(otter or feedback_pt_24)
  begin
      cellphone =  otter ^  feedback_pt_24;
  end

reg feedback_pt_25;

always @(gnd or feedback_pt_25)
  begin
      mortgate =  gnd ^  feedback_pt_25;
  end

reg feedback_pt_26;

always @(quail or feedback_pt_26)
  begin
      stapler =  quail | !feedback_pt_26;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      holepunch <= 0;
    else if (otter)
      holepunch <= gnd;
    else if (leviticus)
      holepunch <= 0;
  end

always @(holepunch)
  begin
      feedback_pt_21 = holepunch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      metal <= 1;
    else
      metal <= newt;
  end

always @(metal)
  begin
      feedback_pt_22 = metal;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dork <= 0;
    else if (vcc)
      dork <= mortgate;
    else if (vcc)
      dork <= 0;
  end

always @(dork)
  begin
      feedback_pt_23 = dork;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      autotest <= 1;
    else
      autotest <= chiptrip;
  end

always @(autotest)
  begin
      feedback_pt_24 = autotest;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      picture <= 0;
    else if (bomb_pop)
      picture <= dfecensorc;
  end

always @(picture)
  begin
      feedback_pt_25 = picture;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sleepy <= 0;
    else if (vcc)
      sleepy <= what;
    else if (marker)
      sleepy <= 0;
  end

always @(sleepy)
  begin
      feedback_pt_26 = sleepy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dopey <= 0;
    else if (xterm)
      dopey <= saturn;
    else if (llama)
      dopey <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sneezy <= 0;
    else if (bomb_pop)
      sneezy <= deuteronomy;
  end

  always@(*)
  begin
    happy = ~rouge ? ~( ( ~( gnd | ~monkey | ~unicorn ) | ~( ~( ( ~( vcc ^ ~metal ) ) ) ) ) ) : ~( ( ~( sleepy | ~gnd ) & ~cellphone ) | ( ~donkey ^ ~vcc & ~gnd ^ vcc ) & ( ~( chiptrip ) & ~( ~picture ) ) );
  end
// State Mek grumpy Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      grumpy <= grumpy_0;
    else
      case (grumpy)
        grumpy_0: begin
          if ({gnd,genesis,penguin,dork} == 13)
            grumpy <= grumpy_5;
          else if ({gnd,genesis,penguin,dork} == 2)
            grumpy <= grumpy_1;
          else
            grumpy <= grumpy_0;
          end
        grumpy_1: begin
          if ({gnd,genesis,penguin,dork} == 11)
            grumpy <= grumpy_6;
          else if ({gnd,genesis,penguin,dork} == 3)
            grumpy <= grumpy_3;
          else if ({gnd,genesis,penguin,dork} == 7)
            grumpy <= grumpy_3;
          else
            grumpy <= grumpy_1;
          end
        grumpy_2: begin
          if ({gnd,genesis,penguin,dork} == 2)
            grumpy <= grumpy_7;
          else if ({gnd,genesis,penguin,dork} == 6)
            grumpy <= grumpy_8;
          else if ({gnd,genesis,penguin,dork} == 0)
            grumpy <= grumpy_8;
          else
            grumpy <= grumpy_2;
          end
        grumpy_3: begin
            grumpy <= grumpy_3;
          end
        grumpy_4: begin
          if ({gnd,genesis,penguin,dork} == 13)
            grumpy <= grumpy_7;
          else
            grumpy <= grumpy_4;
          end
        grumpy_5: begin
          if ({gnd,genesis,penguin,dork} == 13)
            grumpy <= grumpy_1;
          else if ({gnd,genesis,penguin,dork} == 4)
            grumpy <= grumpy_6;
          else
            grumpy <= grumpy_5;
          end
        grumpy_6: begin
          if ({gnd,genesis,penguin,dork} == 11)
            grumpy <= grumpy_0;
          else if ({gnd,genesis,penguin,dork} == 5)
            grumpy <= grumpy_7;
          else if ({gnd,genesis,penguin,dork} == 13)
            grumpy <= grumpy_8;
          else
            grumpy <= grumpy_6;
          end
        grumpy_7: begin
          if ({gnd,genesis,penguin,dork} == 0)
            grumpy <= grumpy_4;
          else if ({gnd,genesis,penguin,dork} == 11)
            grumpy <= grumpy_2;
          else if ({gnd,genesis,penguin,dork} == 1)
            grumpy <= grumpy_8;
          else if ({gnd,genesis,penguin,dork} == 8)
            grumpy <= grumpy_6;
          else if ({gnd,genesis,penguin,dork} == 7)
            grumpy <= grumpy_8;
          else if ({gnd,genesis,penguin,dork} == 5)
            grumpy <= grumpy_3;
          else if ({gnd,genesis,penguin,dork} == 13)
            grumpy <= grumpy_0;
          else
            grumpy <= grumpy_7;
          end
        grumpy_8: begin
          if ({gnd,genesis,penguin,dork} == 0)
            grumpy <= grumpy_2;
          else if ({gnd,genesis,penguin,dork} == 9)
            grumpy <= grumpy_5;
          else if ({gnd,genesis,penguin,dork} == 5)
            grumpy <= grumpy_1;
          else
            grumpy <= grumpy_8;
          end
        default: grumpy <= grumpy_0;
      endcase
  end

// State Mek grumpy Output logic
always @(grumpy)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (grumpy[3:1])
        grumpy_0: begin
            bashful = 1;
            doc = 0;
            donald = 1;
            mickey = 0;
            minnie = 0;
            spock = 1;
            goofy = 1;
            gyro = 1;
            scrooge = 0;
            huey = 0;
            duey = 1;
          end
        grumpy_1: begin
            bashful = 0;
            doc = 1;
            donald = 0;
            mickey = 0;
            minnie = 0;
            spock = 0;
            goofy = 0;
            gyro = 1;
            scrooge = 0;
            huey = 0;
            duey = 1;
          end
        grumpy_2: begin
            bashful = 0;
            doc = 1;
            donald = 0;
            mickey = 0;
            minnie = 0;
            spock = 0;
            goofy = 0;
            gyro = 1;
            scrooge = 0;
            huey = 0;
            duey = 0;
          end
        grumpy_3: begin
            bashful = 0;
            doc = 1;
            donald = 1;
            mickey = 1;
            minnie = 1;
            spock = 1;
            goofy = 1;
            gyro = 1;
            scrooge = 0;
            huey = 0;
            duey = 0;
          end
        default: begin
            bashful = 0;
            doc = 0;
            donald = 1;
            mickey = 0;
            minnie = 1;
            spock = 1;
            goofy = 0;
            gyro = 1;
            scrooge = 0;
            huey = 1;
            duey = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire jiminy_out;
nut_003_lut #(3) nut_003_lut_inst_jiminy (
  .din({vcc,autotest,potato}),
  .mask(8'b01100000),
  .out(jiminy_out)
);

always @(jiminy_out)
begin
   louie = jiminy_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire sleeping_out;
nut_003_lut #(6) nut_003_lut_inst_sleeping (
  .din({gnd,ceres,funkadelic,gnd,zulu,holepunch}),
  .mask(64'b0000001111010100001001000011010000000010100111000000000000001000),
  .out(sleeping_out)
);

always @(sleeping_out)
begin
   cinderella = sleeping_out;
end

// In range compare
always @(cinderella or vcc or gnd or monkey or gnd or gnd or vcc or marker)
  begin
    if ({cinderella,vcc,gnd,monkey,gnd,gnd,vcc,marker} > 176 &&
        {cinderella,vcc,gnd,monkey,gnd,gnd,vcc,marker} < 249)
      beauty = 1;
    else
      beauty = 0;
  end

reg feedback_pt_27;

always @(jason or feedback_pt_27)
  begin
      superman =  jason ^  feedback_pt_27;
  end

reg feedback_pt_28;

always @(dork or feedback_pt_28)
  begin
      batman =  dork &  feedback_pt_28;
  end

reg feedback_pt_29;

always @(vcc or feedback_pt_29)
  begin
      wonder =  vcc | !feedback_pt_29;
  end

reg feedback_pt_30;

always @(jimmyjames or feedback_pt_30)
  begin
      woman = !jimmyjames &  feedback_pt_30;
  end

reg feedback_pt_31;

always @(goofy or feedback_pt_31)
  begin
      hulk =  goofy | !feedback_pt_31;
  end

reg feedback_pt_32;

always @(vcc or feedback_pt_32)
  begin
      lantern = !vcc & !feedback_pt_32;
  end

reg feedback_pt_33;

always @(lantern or feedback_pt_33)
  begin
      riddler = !lantern & !feedback_pt_33;
  end

reg feedback_pt_34;

always @(nuclear or feedback_pt_34)
  begin
      joker = !nuclear & !feedback_pt_34;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      luthor <= 1;
    else
      luthor <= goofy;
  end

always @(luthor)
  begin
      feedback_pt_27 = luthor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hercules <= 0;
    else if (bagel)
      hercules <= 0;
    else if (sneezy)
      hercules <= gnd;
  end

always @(hercules)
  begin
      feedback_pt_28 = hercules;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ajax <= 0;
    else
      ajax <= gyro;
  end

always @(ajax)
  begin
      feedback_pt_29 = ajax;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      achilles <= 0;
    else if (dfecensorc)
      achilles <= gnd;
  end

always @(achilles)
  begin
      feedback_pt_30 = achilles;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hector <= 0;
    else
      hector <= donkey;
  end

always @(hector)
  begin
      feedback_pt_31 = hector;
  end

wire ulysses_wire;

dffeas ulysses_ff (
  .clk(clock0),
  .d(english),
  .ena(lantern),
  .sclr(numbers),
  .sload(scrooge),
  .asdata(books),
  .clrn(!reset0),
  .q(ulysses_wire)
);

always @(ulysses_wire) begin
   agamemnon = ulysses_wire;
end

always @(agamemnon)
  begin
      feedback_pt_32 = agamemnon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aladdin <= 1;
    else
      aladdin <= joker;
  end

always @(aladdin)
  begin
      feedback_pt_33 = aladdin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bambi <= 0;
    else
      bambi <= gnd;
  end

always @(bambi)
  begin
      feedback_pt_34 = bambi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pocahontas <= 0;
    else if (vcc)
      pocahontas <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jesus <= 0;
    else if (wonder)
      jesus <= jimmyjames;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      buddha <= 0;
    else if (muffin)
      buddha <= achilles;
    else if (pocahontas)
      buddha <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dali_llama <= 0;
    else if (stapler)
      dali_llama <= duey;
    else if (unicorn)
      dali_llama <= 0;
  end

reg feedback_pt_35;

always @(spock or feedback_pt_35)
  begin
      clinton = !spock ^ !feedback_pt_35;
  end

reg feedback_pt_36;

always @(vcc or feedback_pt_36)
  begin
      bush =  vcc ^ !feedback_pt_36;
  end

reg feedback_pt_37;

always @(lima or feedback_pt_37)
  begin
      washington =  lima &  feedback_pt_37;
  end

reg feedback_pt_38;

always @(bashful or feedback_pt_38)
  begin
      hamburger = !bashful ^  feedback_pt_38;
  end

reg feedback_pt_39;

always @(penguin or feedback_pt_39)
  begin
      hotdog = !penguin &  feedback_pt_39;
  end

reg feedback_pt_40;

always @(woman or feedback_pt_40)
  begin
      drdeath =  woman ^  feedback_pt_40;
  end

reg feedback_pt_41;

always @(scrooge or feedback_pt_41)
  begin
      klinton = !scrooge & !feedback_pt_41;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kang <= 0;
    else if (gnd)
      kang <= 0;
    else if (vcc)
      kang <= luthor;
  end

always @(kang)
  begin
      feedback_pt_35 = kang;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      water <= 1;
    else
      water <= beauty;
  end

always @(water)
  begin
      feedback_pt_36 = water;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      air <= 0;
    else if (adbcensor)
      air <= 0;
    else if (moulin)
      air <= gnd;
  end

always @(air)
  begin
      feedback_pt_37 = air;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fire <= 0;
    else if (kang)
      fire <= bambi;
  end

always @(fire)
  begin
      feedback_pt_38 = fire;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      magicwand <= 1;
    else
      magicwand <= dopey;
  end

always @(magicwand)
  begin
      feedback_pt_39 = magicwand;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beavis <= 0;
    else if (autotest)
      beavis <= hotdog;
  end

always @(beavis)
  begin
      feedback_pt_40 = beavis;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      butthead <= 1;
    else
      butthead <= gnd;
  end

always @(butthead)
  begin
      feedback_pt_41 = butthead;
  end

wire homer_wire;

dffeas homer_ff (
  .clk(clock0),
  .d(vcc),
  .ena(pig),
  .sclr(gnd),
  .sload(minnie),
  .asdata(scrooge),
  .clrn(!reset0),
  .q(homer_wire)
);

always @(homer_wire) begin
   barty = homer_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cartman <= 1;
    else
      cartman <= moulin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sand <= 0;
    else if (vcc)
      sand <= gnd;
    else if (muffin)
      sand <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hours <= 0;
    else
      hours <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lamer <= 0;
    else if (gnd)
      lamer <= cinderella;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hoser <= 0;
    else
      hoser <= potato;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dweebie <= 0;
    else
      dweebie <= whack;
  end

wire motorhead_wire;

dffeas motorhead_ff (
  .clk(clock0),
  .d(gnd),
  .ena(lamer),
  .sclr(chicken),
  .sload(vcc),
  .asdata(wonder),
  .clrn(!reset0),
  .q(motorhead_wire)
);

always @(motorhead_wire) begin
   burnout = motorhead_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacques <= 0;
    else if (huey)
      jacques <= 0;
    else if (water)
      jacques <= vcc;
  end

wire pdiddy_wire;

dffeas pdiddy_ff (
  .clk(clock0),
  .d(vcc),
  .ena(unicorn),
  .sclr(cinderella),
  .sload(amadeus),
  .asdata(mickey),
  .clrn(!reset0),
  .q(pdiddy_wire)
);

always @(pdiddy_wire) begin
   pdaddy = pdiddy_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dorkus <= 0;
    else if (jesus)
      dorkus <= metal;
  end

// data words for bus muxing
wire [15:0] drunken_word0_data;
wire [15:0] drunken_word1_data;
wire [15:0] drunken_word2_data;
wire [15:0] drunken_word3_data;
assign drunken_word0_data = {duey,agamemnon,whack,vcc,cluckU,gnd,vcc,donald,klinton,hamburger,buddha,vcc,potato,pdaddy,nuclear,barty};
assign drunken_word1_data = {washington,gnd,vcc,gnd,hector,jesus,saturn,llama,vcc,mickey,gnd,louie,dfecensorc,superman,gnd,hulk};
assign drunken_word2_data = {bush,for_gregg,sand,air,gnd,beavis,vcc,scrooge,stapler,hours,cow,gnd,dfecensorc,cinderella,goofy,gnd};
assign drunken_word3_data = {loser,gnd,gnd,hercules,huey,agamemnon,aladdin,moulin,burnout,batman,bomb_pop,vcc,xray,xray,hamburger,magicwand};

// select control for bus muxing
wire [16:0] drunken_select;
assign drunken_select = {jacques,hours,pdaddy,beauty,beauty,bambi,autotest,mickey,autotest,butthead,aladdin,cow,happy,goofy,clinton,beauty,klinton};


// Mux output word
reg [15:0] drunken_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    drunken_result = drunken_word0_data;
    if (drunken_select[0])
        drunken_result = drunken_word0_data;

    if (drunken_select[3])
        drunken_result = drunken_word0_data;

    if (drunken_select[15] && drunken_select[15])
        drunken_result = drunken_word1_data;

    if (drunken_select == 188)
        drunken_result = 234;

    if (drunken_select == 164)
        drunken_result = ~drunken_word1_data;

    if (drunken_select == 1)
        drunken_result = ~drunken_word1_data;

    if (drunken_select == 179)
        drunken_result = drunken_word2_data;

    if (drunken_select[15] && drunken_select[15])
        drunken_result = drunken_word1_data;

end


// Send the out bus back to the world
always @(drunken_result)
begin
    master = drunken_result[0];
    flew = drunken_result[1];
    over = drunken_result[2];
    cuckoo = drunken_result[3];
    nest = drunken_result[4];
    starwars = drunken_result[5];
    yoda = drunken_result[6];
    obiwan = drunken_result[7];
    vadar = drunken_result[8];
    skywalker = drunken_result[9];
    north = drunken_result[10];
    southern = drunken_result[11];
    east = drunken_result[12];
    west = drunken_result[13];
    porfavor = drunken_result[14];
    cuanto = drunken_result[15];
end

// RAM - Data is 7 bits. Depth is 16 words.
wire [6:0] questo_d;
wire [3:0] questo_raddr;
wire [3:0] questo_waddr;
wire questo_rclk, questo_wclk, questo_we;

assign questo_d = {cuanto,skywalker,obiwan,hamburger,xray,nest,porfavor};
assign questo_raddr = {spock,klinton,hercules,vcc};
assign questo_waddr = {cluckU,flew,magicwand,vadar};
assign questo_rclk = clock0;
assign questo_wclk = clock0;
assign questo_we = hamburger;

reg [6:0] questo_q;
reg [6:0] questo_ram [15:0];
reg [3:0] questo_raddr_reg;
reg [3:0] questo_waddr_reg;


// synthesis translate off
initial begin
    questo_waddr_reg = 0;
    questo_raddr_reg = 0;
    questo_ram[0] = 0;
    questo_ram[1] = 0;
    questo_ram[2] = 0;
    questo_ram[3] = 0;
    questo_ram[4] = 0;
    questo_ram[5] = 0;
    questo_ram[6] = 0;
    questo_ram[7] = 0;
    questo_ram[8] = 0;
    questo_ram[9] = 0;
    questo_ram[10] = 0;
    questo_ram[11] = 0;
    questo_ram[12] = 0;
    questo_ram[13] = 0;
    questo_ram[14] = 0;
    questo_ram[15] = 0;
    questo_q = 0;
end
// synthesis translate on
always @ (posedge questo_wclk)
begin
   questo_waddr_reg <= questo_waddr;
end

always @ (posedge questo_wclk)
begin
  if (questo_we) questo_ram[questo_waddr_reg] <= questo_d;
end

// don't register the read addr
//   to prevent collision behavior mismatch
always @ (questo_raddr)
begin
  questo_raddr_reg <= questo_raddr;
end

always @ (posedge questo_rclk)
begin
  questo_q <= questo_ram[questo_raddr_reg];
end

always @ (questo_q)
begin
   pantalones=questo_q[0];
   rojas=questo_q[1];
   popacap=questo_q[2];
   pizza=questo_q[3];
   mushroom=questo_q[4];
   cheese=questo_q[5];
   mcnugget=questo_q[6];
end

// NAND all of these bits together
always @(hoser or vcc or mcnugget or vcc or cartman)
  begin
      werewolf = ~& {hoser,vcc,mcnugget,vcc,cartman};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spirit <= 0;
    else
    case ({skywalker,north})
       0 : spirit <= agamemnon;
       1 : spirit <= vcc;
       2 : spirit <= yoda;
       3 : spirit <= saturn;
       default : spirit <= 0;
    endcase
  end

reg feedback_pt_42;

always @(dweebie or feedback_pt_42)
  begin
      vampire = !dweebie &  feedback_pt_42;
  end

reg feedback_pt_43;

always @(werewolf or feedback_pt_43)
  begin
      pyro =  werewolf ^  feedback_pt_43;
  end

reg feedback_pt_44;

always @(popacap or feedback_pt_44)
  begin
      criminal = !popacap &  feedback_pt_44;
  end

reg feedback_pt_45;

always @(cuckoo or feedback_pt_45)
  begin
      orange = !cuckoo | !feedback_pt_45;
  end

reg feedback_pt_46;

always @(mushroom or feedback_pt_46)
  begin
      purple =  mushroom ^ !feedback_pt_46;
  end

reg feedback_pt_47;

always @(pyro or feedback_pt_47)
  begin
      yellow =  pyro ^ !feedback_pt_47;
  end

reg feedback_pt_48;

always @(fire or feedback_pt_48)
  begin
      clay =  fire &  feedback_pt_48;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      paper <= 0;
    else if (vcc)
      paper <= 0;
    else if (pizza)
      paper <= gnd;
  end

always @(paper)
  begin
      feedback_pt_42 = paper;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crayons <= 1;
    else
      crayons <= spirit;
  end

always @(crayons)
  begin
      feedback_pt_43 = crayons;
  end

wire indigo_wire;

dffeas indigo_ff (
  .clk(clock0),
  .d(clay),
  .ena(werewolf),
  .sclr(donald),
  .sload(west),
  .asdata(master),
  .clrn(!reset0),
  .q(indigo_wire)
);

always @(indigo_wire) begin
   kmfdm = indigo_wire;
end

always @(kmfdm)
  begin
      feedback_pt_44 = kmfdm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pentium <= 0;
    else
      pentium <= cheese;
  end

always @(pentium)
  begin
      feedback_pt_45 = pentium;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bubba <= 0;
    else if (vcc)
      bubba <= 0;
    else if (cuanto)
      bubba <= clinton;
  end

always @(bubba)
  begin
      feedback_pt_46 = bubba;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ohno <= 0;
    else if (dweebie)
      ohno <= 0;
    else if (bubba)
      ohno <= gnd;
  end

always @(ohno)
  begin
      feedback_pt_47 = ohno;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fallen <= 0;
    else if (penguin)
      fallen <= southern;
  end

always @(fallen)
  begin
      feedback_pt_48 = fallen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      comrade <= 0;
    else if (over)
      comrade <= vcc;
  end

wire chairman_wire;

dffea chairman_ff (
  .clk(clock0),
  .d(vcc),
  .ena(gnd),
  .adata(orange),
  .clrn(!reset0),
  .q(chairman_wire)
);

always @(chairman_wire) begin
   biker = chairman_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tattoo <= 0;
    else if (dorkus)
      tattoo <= ohno;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kanji <= 1;
    else
      kanji <= pantalones;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      knot <= 1;
    else
      knot <= hercules;
  end

// Internal TRI bus MUX built out of tri buffers;
// Z and conflict not possible
  tri bellybutton_tri;
  wire [3:0] bellybutton_dat = {gnd,hamburger,klinton};
  wire [3:0] bellybutton_sel = {zebra,east,gnd};
  wire [3:0] bellybutton_ohsel;
  wire bellybutton_def;

  assign bellybutton_ohsel[0] = bellybutton_sel[0];
  assign bellybutton_ohsel[1] = bellybutton_sel[1] & !bellybutton_ohsel[0];
  assign bellybutton_ohsel[2] = bellybutton_sel[2] & !bellybutton_ohsel[1] & !bellybutton_ohsel[0];

  assign bellybutton_def = 
     !bellybutton_ohsel[0] & !bellybutton_ohsel[1] & !bellybutton_ohsel[2];

  // onehot tristate MUX
  bufif1 (bellybutton_tri,!bellybutton_dat[0], bellybutton_ohsel[0]);
  bufif0 (bellybutton_tri,!bellybutton_dat[1],!bellybutton_ohsel[1]);
  bufif1 (bellybutton_tri, bellybutton_dat[2], bellybutton_ohsel[2]);

  // default value for none-hot
  bufif1 (bellybutton_tri,vcc,bellybutton_def);
  always @(bellybutton_tri) begin
    bellybutton = bellybutton_tri;
  end

always @(kmfdm)
  begin
      whammy = !kmfdm;
  end

always @(bambi)
  begin
      deathguild = !bambi;
  end

always @(clay)
  begin
      maritime = !clay;
  end

always @(doc)
  begin
      surfer = !doc;
  end

always @(vcc)
  begin
      moron = !vcc;
  end

always @(bambi)
  begin
      iterate = !bambi;
  end

always @(moron)
  begin
      elkarchmero = !moron;
  end

always @(fallen)
  begin
      elguapo = !fallen;
  end

always @(surfer)
  begin
      senorduck = !surfer;
  end

always @(cuanto)
  begin
      firstpart = !cuanto;
  end

always @(senorduck)
  begin
      leidiot = !senorduck;
  end

always @(skywalker)
  begin
      kidnapper = !skywalker;
  end

always @(gnd)
  begin
      ring = !gnd;
  end

always @(deathguild)
  begin
      think = !deathguild;
  end

always @(autotest)
  begin
      firewiggle = !autotest;
  end

always @(yellow)
  begin
      bracket = !yellow;
  end

reg feedback_pt_49;

always @(dweebie or feedback_pt_49)
  begin
      probably =  dweebie | !feedback_pt_49;
  end

reg feedback_pt_50;

always @(maritime or feedback_pt_50)
  begin
      shudamak =  maritime & !feedback_pt_50;
  end

reg feedback_pt_51;

always @(firewiggle or feedback_pt_51)
  begin
      callme =  firewiggle | !feedback_pt_51;
  end

reg feedback_pt_52;

always @(elguapo or feedback_pt_52)
  begin
      wannabe =  elguapo & !feedback_pt_52;
  end

reg feedback_pt_53;

always @(moron or feedback_pt_53)
  begin
      fuji =  moron |  feedback_pt_53;
  end

reg feedback_pt_54;

always @(firstpart or feedback_pt_54)
  begin
      emails =  firstpart ^  feedback_pt_54;
  end

reg feedback_pt_55;

always @(probably or feedback_pt_55)
  begin
      dadada =  probably | !feedback_pt_55;
  end

reg feedback_pt_56;

always @(iterate or feedback_pt_56)
  begin
      conference = !iterate ^  feedback_pt_56;
  end

reg feedback_pt_57;

always @(dadada or feedback_pt_57)
  begin
      parrot =  dadada | !feedback_pt_57;
  end

wire workhere_wire;

dffea workhere_ff (
  .clk(clock0),
  .d(vcc),
  .ena(hamburger),
  .adata(bellybutton),
  .clrn(!reset0),
  .q(workhere_wire)
);

always @(workhere_wire) begin
   onthepc = workhere_wire;
end

always @(onthepc)
  begin
      feedback_pt_49 = onthepc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      facetious <= 1;
    else
      facetious <= moron;
  end

always @(facetious)
  begin
      feedback_pt_50 = facetious;
  end

wire mariollama_wire;

dffeas mariollama_ff (
  .clk(clock0),
  .d(gnd),
  .ena(hercules),
  .sclr(facetious),
  .sload(kmfdm),
  .asdata(ajax),
  .clrn(!reset0),
  .q(mariollama_wire)
);

always @(mariollama_wire) begin
   rafting = mariollama_wire;
end

always @(rafting)
  begin
      feedback_pt_51 = rafting;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      freaky <= 0;
    else
      freaky <= autotest;
  end

always @(freaky)
  begin
      feedback_pt_52 = freaky;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      davidlin <= 0;
    else
      davidlin <= porfavor;
  end

always @(davidlin)
  begin
      feedback_pt_53 = davidlin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blueled <= 0;
    else if (maritime)
      blueled <= comrade;
  end

always @(blueled)
  begin
      feedback_pt_54 = blueled;
  end

wire pirate_wire;

dffeas pirate_ff (
  .clk(clock0),
  .d(cow),
  .ena(starwars),
  .sclr(gnd),
  .sload(porfavor),
  .asdata(shudamak),
  .clrn(!reset0),
  .q(pirate_wire)
);

always @(pirate_wire) begin
   prison = pirate_wire;
end

always @(prison)
  begin
      feedback_pt_55 = prison;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marquis <= 1;
    else
      marquis <= blueled;
  end

always @(marquis)
  begin
      feedback_pt_56 = marquis;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      desade <= 0;
    else if (emails)
      desade <= vcc;
    else if (gnd)
      desade <= 0;
  end

always @(desade)
  begin
      feedback_pt_57 = desade;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      baron <= 0;
    else if (cow)
      baron <= vcc;
    else if (conference)
      baron <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vonmunchhausen <= 0;
    else if (gnd)
      vonmunchhausen <= 0;
    else if (vcc)
      vonmunchhausen <= prison;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      boots <= 0;
    else
      boots <= facetious;
  end

reg feedback_pt_58;

always @(vcc or feedback_pt_58)
  begin
      narcotics = !vcc | !feedback_pt_58;
  end

reg feedback_pt_59;

always @(baron or feedback_pt_59)
  begin
      cocaine = !baron | !feedback_pt_59;
  end

reg feedback_pt_60;

always @(criminal or feedback_pt_60)
  begin
      contractor = !criminal & !feedback_pt_60;
  end

reg feedback_pt_61;

always @(gnd or feedback_pt_61)
  begin
      doobie =  gnd | !feedback_pt_61;
  end

reg feedback_pt_62;

always @(hercules or feedback_pt_62)
  begin
      float =  hercules &  feedback_pt_62;
  end

reg feedback_pt_63;

always @(vcc or feedback_pt_63)
  begin
      budlite =  vcc & !feedback_pt_63;
  end

reg feedback_pt_64;

always @(leidiot or feedback_pt_64)
  begin
      morenames =  leidiot &  feedback_pt_64;
  end

reg feedback_pt_65;

always @(vcc or feedback_pt_65)
  begin
      mrbill =  vcc &  feedback_pt_65;
  end

reg feedback_pt_66;

always @(think or feedback_pt_66)
  begin
      dutch = !think | !feedback_pt_66;
  end

reg feedback_pt_67;

always @(contractor or feedback_pt_67)
  begin
      candle =  contractor ^  feedback_pt_67;
  end

  always@(*)
  begin
    spyro = ( ~( ( ~( ~( ( ( boots & rafting ) | elkarchmero ^ ~doobie ) ) | ( gnd | ~( ~gnd ) & ~( ( ~pentium ^ desade ) ) ) ) ) | ~( ~( ~candle ^ ~onthepc ) ^ ( ~( ~( ~hamburger ) ^ emails | ~onthepc ) ) ) ) ) ? ( ~( ~( ~( ( ~( whammy | ~kanji ) ) ) | ~( ( ~davidlin & ~drdeath ) ) ) | ~( ( ~paper | ~( ( ~( wannabe | ~tattoo ) ) ) ) ) ) ) : ~( ~( ~( ~( ~fire ^ marquis ) ) ) );
  end
// State Mek speedyg Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      speedyg <= speedyg_0;
    else
      case (speedyg)
        speedyg_0: begin
          if ({bracket,gnd,gnd,fire} == 8)
            speedyg <= speedyg_4;
          else if ({bracket,gnd,gnd,fire} == 11)
            speedyg <= speedyg_3;
          else if ({bracket,gnd,gnd,fire} == 9)
            speedyg <= speedyg_0;
          else
            speedyg <= speedyg_0;
          end
        speedyg_1: begin
          if ({bracket,gnd,gnd,fire} == 3)
            speedyg <= speedyg_10;
          else if ({bracket,gnd,gnd,fire} == 1)
            speedyg <= speedyg_7;
          else if ({bracket,gnd,gnd,fire} == 6)
            speedyg <= speedyg_5;
          else if ({bracket,gnd,gnd,fire} == 0)
            speedyg <= speedyg_3;
          else
            speedyg <= speedyg_1;
          end
        speedyg_2: begin
          if ({bracket,gnd,gnd,fire} == 0)
            speedyg <= speedyg_8;
          else
            speedyg <= speedyg_2;
          end
        speedyg_3: begin
          if ({bracket,gnd,gnd,fire} == 11)
            speedyg <= speedyg_7;
          else if ({bracket,gnd,gnd,fire} == 13)
            speedyg <= speedyg_4;
          else if ({bracket,gnd,gnd,fire} == 3)
            speedyg <= speedyg_0;
          else if ({bracket,gnd,gnd,fire} == 15)
            speedyg <= speedyg_9;
          else
            speedyg <= speedyg_3;
          end
        speedyg_4: begin
          if ({bracket,gnd,gnd,fire} == 14)
            speedyg <= speedyg_2;
          else if ({bracket,gnd,gnd,fire} == 8)
            speedyg <= speedyg_8;
          else if ({bracket,gnd,gnd,fire} == 5)
            speedyg <= speedyg_5;
          else if ({bracket,gnd,gnd,fire} == 13)
            speedyg <= speedyg_2;
          else if ({bracket,gnd,gnd,fire} == 10)
            speedyg <= speedyg_7;
          else if ({bracket,gnd,gnd,fire} == 9)
            speedyg <= speedyg_4;
          else
            speedyg <= speedyg_4;
          end
        speedyg_5: begin
            speedyg <= speedyg_5;
          end
        speedyg_6: begin
          if ({bracket,gnd,gnd,fire} == 7)
            speedyg <= speedyg_1;
          else if ({bracket,gnd,gnd,fire} == 14)
            speedyg <= speedyg_8;
          else
            speedyg <= speedyg_6;
          end
        speedyg_7: begin
          if ({bracket,gnd,gnd,fire} == 2)
            speedyg <= speedyg_2;
          else if ({bracket,gnd,gnd,fire} == 13)
            speedyg <= speedyg_10;
          else if ({bracket,gnd,gnd,fire} == 3)
            speedyg <= speedyg_5;
          else
            speedyg <= speedyg_7;
          end
        speedyg_8: begin
          if ({bracket,gnd,gnd,fire} == 2)
            speedyg <= speedyg_9;
          else if ({bracket,gnd,gnd,fire} == 5)
            speedyg <= speedyg_10;
          else
            speedyg <= speedyg_8;
          end
        speedyg_9: begin
          if ({bracket,gnd,gnd,fire} == 6)
            speedyg <= speedyg_6;
          else if ({bracket,gnd,gnd,fire} == 12)
            speedyg <= speedyg_10;
          else if ({bracket,gnd,gnd,fire} == 13)
            speedyg <= speedyg_8;
          else
            speedyg <= speedyg_9;
          end
        speedyg_10: begin
          if ({bracket,gnd,gnd,fire} == 8)
            speedyg <= speedyg_8;
          else
            speedyg <= speedyg_10;
          end
        default: speedyg <= speedyg_0;
      endcase
  end

// State Mek speedyg Output logic
always @(speedyg)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (speedyg[3:1])
        speedyg_0: begin
            kennyg = 1;
            johndenver = 1;
            jacklemon = 1;
            theonion = 1;
            chatanooga = 0;
            kebab = 0;
            kabar = 0;
            fullmetal = 1;
            aluminum = 0;
            copper = 0;
            zinc = 1;
            platinum = 0;
            tin = 0;
            iron = 0;
            fascist = 1;
            anarchist = 1;
          end
        speedyg_1: begin
            kennyg = 1;
            johndenver = 1;
            jacklemon = 0;
            theonion = 1;
            chatanooga = 0;
            kebab = 1;
            kabar = 1;
            fullmetal = 1;
            aluminum = 0;
            copper = 1;
            zinc = 1;
            platinum = 0;
            tin = 0;
            iron = 0;
            fascist = 0;
            anarchist = 1;
          end
        speedyg_2: begin
            kennyg = 0;
            johndenver = 0;
            jacklemon = 0;
            theonion = 1;
            chatanooga = 0;
            kebab = 1;
            kabar = 0;
            fullmetal = 0;
            aluminum = 1;
            copper = 1;
            zinc = 1;
            platinum = 0;
            tin = 1;
            iron = 0;
            fascist = 0;
            anarchist = 1;
          end
        speedyg_3: begin
            kennyg = 1;
            johndenver = 0;
            jacklemon = 0;
            theonion = 1;
            chatanooga = 0;
            kebab = 1;
            kabar = 1;
            fullmetal = 1;
            aluminum = 0;
            copper = 1;
            zinc = 0;
            platinum = 0;
            tin = 0;
            iron = 0;
            fascist = 1;
            anarchist = 1;
          end
        speedyg_4: begin
            kennyg = 0;
            johndenver = 1;
            jacklemon = 0;
            theonion = 0;
            chatanooga = 0;
            kebab = 0;
            kabar = 0;
            fullmetal = 1;
            aluminum = 0;
            copper = 1;
            zinc = 0;
            platinum = 1;
            tin = 1;
            iron = 1;
            fascist = 0;
            anarchist = 0;
          end
        default: begin
            kennyg = 0;
            johndenver = 1;
            jacklemon = 0;
            theonion = 0;
            chatanooga = 1;
            kebab = 1;
            kabar = 1;
            fullmetal = 0;
            aluminum = 1;
            copper = 1;
            zinc = 1;
            platinum = 0;
            tin = 1;
            iron = 0;
            fascist = 1;
            anarchist = 0;
          end
      endcase
  end

always @(kennyg)
  begin
      feedback_pt_58 = kennyg;
  end

always @(johndenver)
  begin
      feedback_pt_59 = johndenver;
  end

always @(jacklemon)
  begin
      feedback_pt_60 = jacklemon;
  end

always @(theonion)
  begin
      feedback_pt_61 = theonion;
  end

always @(chatanooga)
  begin
      feedback_pt_62 = chatanooga;
  end

always @(kebab)
  begin
      feedback_pt_63 = kebab;
  end

always @(kabar)
  begin
      feedback_pt_64 = kabar;
  end

always @(fullmetal)
  begin
      feedback_pt_65 = fullmetal;
  end

always @(aluminum)
  begin
      feedback_pt_66 = aluminum;
  end

always @(copper)
  begin
      feedback_pt_67 = copper;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire socialist_out;
nut_003_lut #(5) nut_003_lut_inst_socialist (
  .din({freaky,vcc,cheese,vcc,zebra}),
  .mask(32'h7e1c7588),
  .out(socialist_out)
);

always @(socialist_out)
begin
   capitalist = socialist_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire floating_out;
nut_003_lut #(3) nut_003_lut_inst_floating (
  .din({fallen,vcc,mrbill}),
  .mask(8'h84),
  .out(floating_out)
);

always @(floating_out)
begin
   moderate = floating_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire erncenso_out;
nut_003_lut #(2) nut_003_lut_inst_erncenso (
  .din({vcc,kidnapper}),
  .mask(4'b1000),
  .out(erncenso_out)
);

always @(erncenso_out)
begin
   drevil = erncenso_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire gtncensor_out;
nut_003_lut #(2) nut_003_lut_inst_gtncensor (
  .din({davidlin,mushroom}),
  .mask(4'h8),
  .out(gtncensor_out)
);

always @(gtncensor_out)
begin
   fsncens = gtncensor_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire lunchtime_out;
nut_003_lut #(1) nut_003_lut_inst_lunchtime (
  .din({gnd}),
  .mask(2'b11),
  .out(lunchtime_out)
);

always @(lunchtime_out)
begin
   tinker = lunchtime_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire hxncensorce_out;
nut_003_lut #(3) nut_003_lut_inst_hxncensorce (
  .din({capitalist,anarchist,jacklemon}),
  .mask(8'b00010001),
  .out(hxncensorce_out)
);

always @(hxncensorce_out)
begin
   roosevelt = hxncensorce_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire portnoy_out;
nut_003_lut #(2) nut_003_lut_inst_portnoy (
  .din({werewolf,theonion}),
  .mask(4'b1000),
  .out(portnoy_out)
);

always @(portnoy_out)
begin
   opus = portnoy_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire bloom_out;
nut_003_lut #(3) nut_003_lut_inst_bloom (
  .din({cuckoo,kabar,vampire}),
  .mask(8'b00000010),
  .out(bloom_out)
);

always @(bloom_out)
begin
   milo = bloom_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire hotpastrami_out;
nut_003_lut #(2) nut_003_lut_inst_hotpastrami (
  .din({vonmunchhausen,cocaine}),
  .mask(4'b0100),
  .out(hotpastrami_out)
);

always @(hotpastrami_out)
begin
   potatoskin = hotpastrami_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire donut_out;
nut_003_lut #(1) nut_003_lut_inst_donut (
  .din({moderate}),
  .mask(2'b00),
  .out(donut_out)
);

always @(donut_out)
begin
   roastbeef = donut_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire clubsandwich_out;
nut_003_lut #(1) nut_003_lut_inst_clubsandwich (
  .din({conference}),
  .mask(2'b00),
  .out(clubsandwich_out)
);

always @(clubsandwich_out)
begin
   poppyseed = clubsandwich_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire fatality_out;
nut_003_lut #(5) nut_003_lut_inst_fatality (
  .din({potatoskin,biker,vcc,prison,wannabe}),
  .mask(32'hf97e96ed),
  .out(fatality_out)
);

always @(fatality_out)
begin
   kungfu = fatality_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire might_out;
nut_003_lut #(2) nut_003_lut_inst_might (
  .din({fullmetal,dadada}),
  .mask(4'b1010),
  .out(might_out)
);

always @(might_out)
begin
   testyour = might_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire Iwin_out;
nut_003_lut #(6) nut_003_lut_inst_Iwin (
  .din({rojas,wannabe,gnd,wannabe,surfer,dadada}),
  .mask(64'b1001001001100000101001001001100100000010100001000000010000000000),
  .out(Iwin_out)
);

always @(Iwin_out)
begin
   excellent = Iwin_out;
end

// NOR all of these bits together
always @(johndenver or zinc or ring or gnd or roastbeef or tinker)
  begin
      danger = ~| {johndenver,zinc,ring,gnd,roastbeef,tinker};
  end

// AND all of these bits together
always @(platinum or float)
  begin
      screaming = & {platinum,float};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atilla <= 0;
    else
    case ({parrot,screaming})
       0 : atilla <= atilla;
       1 : atilla <= atilla;
       2 : atilla <= atilla;
       3 : atilla <= atilla;
       default : atilla <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      famulan <= 0;
    else
    case ({opus,copper})
       0 : famulan <= surfer;
       1 : famulan <= baron;
       2 : famulan <= famulan;
       3 : famulan <= kebab;
       default : famulan <= 0;
    endcase
  end

reg feedback_pt_68;

always @(aluminum or feedback_pt_68)
  begin
      supurb =  aluminum ^  feedback_pt_68;
  end

reg feedback_pt_69;

always @(vcc or feedback_pt_69)
  begin
      jayqueeze =  vcc | !feedback_pt_69;
  end

reg feedback_pt_70;

always @(gnd or feedback_pt_70)
  begin
      waydeelect =  gnd | !feedback_pt_70;
  end

reg feedback_pt_71;

always @(excellent or feedback_pt_71)
  begin
      iwocensor =  excellent ^ !feedback_pt_71;
  end

reg feedback_pt_72;

always @(milo or feedback_pt_72)
  begin
      incompetent = !milo ^ !feedback_pt_72;
  end

reg feedback_pt_73;

always @(tin or feedback_pt_73)
  begin
      secondrate = !tin | !feedback_pt_73;
  end

reg feedback_pt_74;

always @(iwocensor or feedback_pt_74)
  begin
      inspection = !iwocensor | !feedback_pt_74;
  end

reg feedback_pt_75;

always @(vcc or feedback_pt_75)
  begin
      thedon =  vcc & !feedback_pt_75;
  end

reg feedback_pt_76;

always @(roosevelt or feedback_pt_76)
  begin
      marco = !roosevelt ^  feedback_pt_76;
  end

reg feedback_pt_77;

always @(supurb or feedback_pt_77)
  begin
      cocacola = !supurb ^ !feedback_pt_77;
  end

reg feedback_pt_78;

always @(fullmetal or feedback_pt_78)
  begin
      ham =  fullmetal & !feedback_pt_78;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mandarin <= 0;
    else if (kennyg)
      mandarin <= fuji;
    else if (excellent)
      mandarin <= 0;
  end

always @(mandarin)
  begin
      feedback_pt_68 = mandarin;
  end

always @(mandarin)
  begin
      feedback_pt_69 = mandarin;
  end

always @(mandarin)
  begin
      feedback_pt_70 = mandarin;
  end

always @(mandarin)
  begin
      feedback_pt_71 = mandarin;
  end

always @(mandarin)
  begin
      feedback_pt_72 = mandarin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ihilani <= 0;
    else
      ihilani <= probably;
  end

always @(ihilani)
  begin
      feedback_pt_73 = ihilani;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      october <= 0;
    else if (gnd)
      october <= criminal;
    else if (starwars)
      october <= 0;
  end

always @(october)
  begin
      feedback_pt_74 = october;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tracy <= 0;
    else if (iron)
      tracy <= vcc;
    else if (wannabe)
      tracy <= 0;
  end

always @(tracy)
  begin
      feedback_pt_75 = tracy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jjocen <= 0;
    else if (waydeelect)
      jjocen <= incompetent;
    else if (fire)
      jjocen <= 0;
  end

always @(jjocen)
  begin
      feedback_pt_76 = jjocen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      meffert <= 1;
    else
      meffert <= gnd;
  end

always @(meffert)
  begin
      feedback_pt_77 = meffert;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bismuth <= 0;
    else
      bismuth <= vcc;
  end

always @(bismuth)
  begin
      feedback_pt_78 = bismuth;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floride <= 0;
    else if (vcc)
      floride <= 0;
    else if (candle)
      floride <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oranges <= 0;
    else
      oranges <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pyromaniac <= 0;
    else if (gnd)
      pyromaniac <= mrbill;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      junkie <= 0;
    else if (gnd)
      junkie <= anarchist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      waster <= 0;
    else if (zinc)
      waster <= parrot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burner <= 1;
    else
      burner <= secondrate;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crackhead <= 0;
    else if (kanji)
      crackhead <= west;
    else if (atilla)
      crackhead <= 0;
  end

// Triple add / sub bait
always @(floride or criminal or gnd or fuji or gnd or gnd or testyour or gnd or
         mandarin or chatanooga or vcc or hoser or aluminum or pyromaniac or gnd or gnd or
         spyro or probably or purple or vcc or gnd or vcc or famulan or october)
  begin
    {stoner,drugie,chemical,brothers,tunafish,eggsalad,agitator,postulator} = 
        {floride,criminal,gnd,fuji,gnd,gnd,testyour,gnd} -
        {mandarin,chatanooga,vcc,hoser,aluminum,pyromaniac,gnd,gnd} -
        {spyro,probably,purple,vcc,gnd,vcc,famulan,october};
  end

// 5 bit add sub
always @(waster or morenames or cocacola or gnd or platinum or october or eggsalad or vcc or kennyg or chatanooga)
  begin
    {satanist,plagarist,whoiswho,money,morrison} = 
		({waster,morenames,cocacola,gnd,platinum} ^ 227) + 
		({october,eggsalad,vcc,kennyg,chatanooga} ^ 227);
  end

// 7 bit add sub
always @(vcc or purple or capitalist or hoser or gnd or marco or parrot or money or crackhead or october or satanist or vcc or morrison or mrbill)
  begin
    {firewalk,withme,palmer,banality,brutality,fury,hurt} = 
		({vcc,purple,capitalist,hoser,gnd,marco,parrot} ^ 28) + 
		({money,crackhead,october,satanist,vcc,morrison,mrbill} ^ 232);
  end

// 6 to 5 bit A*Const mult
reg signed [5:0] tobe;
always @(gnd or plagarist or screaming or whoiswho or surfer or gnd) begin
  tobe = {gnd,plagarist,screaming,whoiswho,surfer,gnd};
end

always @(tobe)
  begin
      {yoku,simasu,geisha,pictures,star} = 
	  	  ~tobe * 
		  34;
  end

reg feedback_pt_79;

always @(vcc or feedback_pt_79)
  begin
      show = !vcc |  feedback_pt_79;
  end

reg feedback_pt_80;

always @(withme or feedback_pt_80)
  begin
      ready = !withme ^ !feedback_pt_80;
  end

reg feedback_pt_81;

always @(screaming or feedback_pt_81)
  begin
      gokidsgo = !screaming |  feedback_pt_81;
  end

reg feedback_pt_82;

always @(ready or feedback_pt_82)
  begin
      lemon = !ready ^  feedback_pt_82;
  end

reg feedback_pt_83;

always @(vcc or feedback_pt_83)
  begin
      winner =  vcc ^  feedback_pt_83;
  end

reg feedback_pt_84;

always @(gnd or feedback_pt_84)
  begin
      speeding =  gnd &  feedback_pt_84;
  end

reg feedback_pt_85;

always @(kungfu or feedback_pt_85)
  begin
      hiway = !kungfu |  feedback_pt_85;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      grams <= 0;
    else if (ohno)
      grams <= 0;
    else if (vcc)
      grams <= vcc;
  end

always @(grams)
  begin
      feedback_pt_79 = grams;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kdqcens <= 0;
    else if (agitator)
      kdqcens <= 0;
    else if (morrison)
      kdqcens <= vcc;
  end

always @(kdqcens)
  begin
      feedback_pt_80 = kdqcens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bust <= 1;
    else
      bust <= drugie;
  end

always @(bust)
  begin
      feedback_pt_81 = bust;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gotone <= 1;
    else
      gotone <= gnd;
  end

always @(gotone)
  begin
      feedback_pt_82 = gotone;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foryou <= 1;
    else
      foryou <= firewalk;
  end

always @(foryou)
  begin
      feedback_pt_83 = foryou;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sogood <= 0;
    else
      sogood <= hurt;
  end

always @(sogood)
  begin
      feedback_pt_84 = sogood;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moreand <= 0;
    else if (lemon)
      moreand <= potatoskin;
  end

always @(moreand)
  begin
      feedback_pt_85 = moreand;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      faster <= 0;
    else
      faster <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      elementary <= 1;
    else
      elementary <= drevil;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sixyears <= 0;
    else if (kdqcens)
      sixyears <= vcc;
    else if (gnd)
      sixyears <= 0;
  end

wire graduated_wire;

dffeas graduated_ff (
  .clk(clock0),
  .d(vcc),
  .ena(vcc),
  .sclr(faster),
  .sload(inspection),
  .asdata(jjocen),
  .clrn(!reset0),
  .q(graduated_wire)
);

always @(graduated_wire) begin
   overeducated = graduated_wire;
end

wire notalot_wire;

dffeas notalot_ff (
  .clk(clock0),
  .d(gnd),
  .ena(drugie),
  .sclr(gokidsgo),
  .sload(budlite),
  .asdata(vcc),
  .clrn(!reset0),
  .q(notalot_wire)
);

always @(notalot_wire) begin
   nation = notalot_wire;
end

wire protest_wire;

dffeas protest_ff (
  .clk(clock0),
  .d(gnd),
  .ena(tunafish),
  .sclr(famulan),
  .sload(geisha),
  .asdata(screaming),
  .clrn(!reset0),
  .q(protest_wire)
);

always @(protest_wire) begin
   animal = protest_wire;
end

wire vegan_wire;

dffeas vegan_ff (
  .clk(clock0),
  .d(waster),
  .ena(gnd),
  .sclr(hurt),
  .sload(vcc),
  .asdata(shudamak),
  .clrn(!reset0),
  .q(vegan_wire)
);

always @(vegan_wire) begin
   vegetarian = vegan_wire;
end

// Random combinatorial logic block
always@(*)
  begin
      liberation = ~( ( ~( floride | ~( ~( ~( yoku ) ) ) ) ) );
  end

  always@(*)
  begin
    psycho = ( ~( ~oranges ^ ( ~( ~( vcc ) & ( ~( ~( morenames ) ^ ~( meffert ) ) ) ) ) ) ) | ~( ~( ~( ~( ready ) ) ) ) ? ~( ( ~( ( ~( ~potatoskin | budlite ) & ( ~( ~( ~banality ) | ~ham ) ) ) | ~( ( ~( ~( elementary ) ^ ( gnd ^ ihilani ) ) ) ) ) ) ) : ~oranges;
  end
// State Mek extremist Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      extremist <= extremist_0;
    else
      case (extremist)
        extremist_0: begin
          if ({overeducated,vcc,winner,dutch} == 14)
            extremist <= extremist_5;
          else
            extremist <= extremist_0;
          end
        extremist_1: begin
          if ({overeducated,vcc,winner,dutch} == 11)
            extremist <= extremist_1;
          else if ({overeducated,vcc,winner,dutch} == 15)
            extremist <= extremist_3;
          else if ({overeducated,vcc,winner,dutch} == 10)
            extremist <= extremist_5;
          else
            extremist <= extremist_1;
          end
        extremist_2: begin
          if ({overeducated,vcc,winner,dutch} == 9)
            extremist <= extremist_1;
          else if ({overeducated,vcc,winner,dutch} == 5)
            extremist <= extremist_4;
          else if ({overeducated,vcc,winner,dutch} == 4)
            extremist <= extremist_3;
          else
            extremist <= extremist_2;
          end
        extremist_3: begin
          if ({overeducated,vcc,winner,dutch} == 2)
            extremist <= extremist_4;
          else if ({overeducated,vcc,winner,dutch} == 1)
            extremist <= extremist_1;
          else
            extremist <= extremist_3;
          end
        extremist_4: begin
          if ({overeducated,vcc,winner,dutch} == 11)
            extremist <= extremist_1;
          else if ({overeducated,vcc,winner,dutch} == 9)
            extremist <= extremist_2;
          else if ({overeducated,vcc,winner,dutch} == 4)
            extremist <= extremist_2;
          else if ({overeducated,vcc,winner,dutch} == 10)
            extremist <= extremist_2;
          else if ({overeducated,vcc,winner,dutch} == 6)
            extremist <= extremist_2;
          else
            extremist <= extremist_4;
          end
        extremist_5: begin
          if ({overeducated,vcc,winner,dutch} == 1)
            extremist <= extremist_5;
          else if ({overeducated,vcc,winner,dutch} == 9)
            extremist <= extremist_3;
          else
            extremist <= extremist_5;
          end
        default: extremist <= extremist_0;
      endcase
  end

// State Mek extremist Output logic
always @(extremist)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (extremist[3:1])
        extremist_0: begin
            fruitcake = 1;
            zealot = 0;
            chainsaw = 0;
            rasp = 0;
            square = 1;
            romex = 0;
            jxnbox = 1;
            knockout = 0;
            curie = 0;
            gutter = 1;
            plaster = 0;
          end
        extremist_1: begin
            fruitcake = 1;
            zealot = 0;
            chainsaw = 0;
            rasp = 0;
            square = 1;
            romex = 1;
            jxnbox = 1;
            knockout = 0;
            curie = 1;
            gutter = 0;
            plaster = 0;
          end
        extremist_2: begin
            fruitcake = 0;
            zealot = 1;
            chainsaw = 0;
            rasp = 1;
            square = 1;
            romex = 0;
            jxnbox = 1;
            knockout = 0;
            curie = 1;
            gutter = 1;
            plaster = 1;
          end
        default: begin
            fruitcake = 0;
            zealot = 1;
            chainsaw = 0;
            rasp = 0;
            square = 1;
            romex = 1;
            jxnbox = 1;
            knockout = 0;
            curie = 1;
            gutter = 1;
            plaster = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire rampacker_out;
nut_003_lut #(6) nut_003_lut_inst_rampacker (
  .din({vcc,animal,vcc,brothers,gnd,vcc}),
  .mask(64'b0010100101000001010000001011010001010001010001000000001000100100),
  .out(rampacker_out)
);

always @(rampacker_out)
begin
   wood = rampacker_out;
end

// NAND all of these bits together
always @(wood or jayqueeze or poppyseed or waster or tin or hiway or budlite or morenames or vcc)
  begin
      greenbay = ~& {wood,jayqueeze,poppyseed,waster,tin,hiway,budlite,morenames,vcc};
  end

// 5 input 5 output permutation
always @(bust or palmer or brutality or sixyears or grams)
  begin
    case ({bust,palmer,brutality,sixyears,grams})
      0: {raiders,giants,yankees,nyc,broadway}=20;
      1: {raiders,giants,yankees,nyc,broadway}=22;
      2: {raiders,giants,yankees,nyc,broadway}=0;
      3: {raiders,giants,yankees,nyc,broadway}=26;
      4: {raiders,giants,yankees,nyc,broadway}=6;
      5: {raiders,giants,yankees,nyc,broadway}=8;
      6: {raiders,giants,yankees,nyc,broadway}=25;
      7: {raiders,giants,yankees,nyc,broadway}=11;
      8: {raiders,giants,yankees,nyc,broadway}=31;
      9: {raiders,giants,yankees,nyc,broadway}=19;
      10: {raiders,giants,yankees,nyc,broadway}=14;
      11: {raiders,giants,yankees,nyc,broadway}=29;
      12: {raiders,giants,yankees,nyc,broadway}=1;
      13: {raiders,giants,yankees,nyc,broadway}=24;
      14: {raiders,giants,yankees,nyc,broadway}=21;
      15: {raiders,giants,yankees,nyc,broadway}=4;
      16: {raiders,giants,yankees,nyc,broadway}=17;
      17: {raiders,giants,yankees,nyc,broadway}=7;
      18: {raiders,giants,yankees,nyc,broadway}=28;
      19: {raiders,giants,yankees,nyc,broadway}=3;
      20: {raiders,giants,yankees,nyc,broadway}=13;
      21: {raiders,giants,yankees,nyc,broadway}=30;
      22: {raiders,giants,yankees,nyc,broadway}=9;
      23: {raiders,giants,yankees,nyc,broadway}=23;
      24: {raiders,giants,yankees,nyc,broadway}=18;
      25: {raiders,giants,yankees,nyc,broadway}=2;
      26: {raiders,giants,yankees,nyc,broadway}=15;
      27: {raiders,giants,yankees,nyc,broadway}=10;
      28: {raiders,giants,yankees,nyc,broadway}=16;
      29: {raiders,giants,yankees,nyc,broadway}=27;
      30: {raiders,giants,yankees,nyc,broadway}=5;
      31: {raiders,giants,yankees,nyc,broadway}=12;
      default: {raiders,giants,yankees,nyc,broadway}=0;
    endcase
  end

// XNOR all of these bits together
always @(star or gnd)
  begin
      dirty = ~^ {star,gnd};
  end

reg feedback_pt_86;

always @(stoner or feedback_pt_86)
  begin
      noyoudirty =  stoner & !feedback_pt_86;
  end

reg feedback_pt_87;

always @(vcc or feedback_pt_87)
  begin
      muggers = !vcc ^ !feedback_pt_87;
  end

reg feedback_pt_88;

always @(jacklemon or feedback_pt_88)
  begin
      whattime =  jacklemon | !feedback_pt_88;
  end

reg feedback_pt_89;

always @(gnd or feedback_pt_89)
  begin
      sanity =  gnd &  feedback_pt_89;
  end

reg feedback_pt_90;

always @(gnd or feedback_pt_90)
  begin
      michelle = !gnd ^ !feedback_pt_90;
  end

reg feedback_pt_91;

always @(greenbay or feedback_pt_91)
  begin
      rocks =  greenbay & !feedback_pt_91;
  end

reg feedback_pt_92;

always @(gnd or feedback_pt_92)
  begin
      legos =  gnd | !feedback_pt_92;
  end

reg feedback_pt_93;

always @(gnd or feedback_pt_93)
  begin
      eatem =  gnd ^ !feedback_pt_93;
  end

reg feedback_pt_94;

always @(vcc or feedback_pt_94)
  begin
      blanket =  vcc &  feedback_pt_94;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      china <= 0;
    else
      china <= ohno;
  end

always @(china)
  begin
      feedback_pt_86 = china;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      usa <= 0;
    else if (dirty)
      usa <= vcc;
    else if (vcc)
      usa <= 0;
  end

always @(usa)
  begin
      feedback_pt_87 = usa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      holland <= 0;
    else if (fruitcake)
      holland <= sixyears;
  end

always @(holland)
  begin
      feedback_pt_88 = holland;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      puertorico <= 0;
    else if (ohno)
      puertorico <= 0;
    else if (broadway)
      puertorico <= gnd;
  end

always @(puertorico)
  begin
      feedback_pt_89 = puertorico;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mexico <= 0;
    else
      mexico <= zealot;
  end

always @(mexico)
  begin
      feedback_pt_90 = mexico;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spain <= 0;
    else if (gnd)
      spain <= 0;
    else if (fury)
      spain <= vcc;
  end

always @(spain)
  begin
      feedback_pt_91 = spain;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      greenland <= 0;
    else
      greenland <= shudamak;
  end

always @(greenland)
  begin
      feedback_pt_92 = greenland;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scotland <= 0;
    else
      scotland <= puertorico;
  end

always @(scotland)
  begin
      feedback_pt_93 = scotland;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      england <= 0;
    else if (purple)
      england <= postulator;
  end

always @(england)
  begin
      feedback_pt_94 = england;
  end

wire iceland_wire;

dffeas iceland_ff (
  .clk(clock0),
  .d(geisha),
  .ena(gnd),
  .sclr(simasu),
  .sload(vcc),
  .asdata(zealot),
  .clrn(!reset0),
  .q(iceland_wire)
);

always @(iceland_wire) begin
   romulus = iceland_wire;
end

wire remus_wire;

dffeas remus_ff (
  .clk(clock0),
  .d(greenland),
  .ena(blanket),
  .sclr(rasp),
  .sload(scotland),
  .asdata(giants),
  .clrn(!reset0),
  .q(remus_wire)
);

always @(remus_wire) begin
   cain = remus_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      abel <= 0;
    else if (gnd)
      abel <= gnd;
    else if (chainsaw)
      abel <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zipporah <= 0;
    else if (square)
      zipporah <= cain;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      issac <= 1;
    else
      issac <= jacklemon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      abraham <= 1;
    else
      abraham <= poppyseed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacob <= 0;
    else if (michelle)
      jacob <= 0;
    else if (chemical)
      jacob <= vcc;
  end

reg feedback_pt_95;

always @(wood or feedback_pt_95)
  begin
      joseph = !wood |  feedback_pt_95;
  end

reg feedback_pt_96;

always @(muggers or feedback_pt_96)
  begin
      dreamcoat = !muggers &  feedback_pt_96;
  end

reg feedback_pt_97;

always @(bismuth or feedback_pt_97)
  begin
      ringlingbros =  bismuth |  feedback_pt_97;
  end

reg feedback_pt_98;

always @(michelle or feedback_pt_98)
  begin
      lxtcen =  michelle & !feedback_pt_98;
  end

reg feedback_pt_99;

always @(junkie or feedback_pt_99)
  begin
      terrance = !junkie | !feedback_pt_99;
  end

reg feedback_pt_100;

always @(knockout or feedback_pt_100)
  begin
      piggish =  knockout & !feedback_pt_100;
  end

reg feedback_pt_101;

always @(fuji or feedback_pt_101)
  begin
      cryptic =  fuji &  feedback_pt_101;
  end

reg feedback_pt_102;

always @(usa or feedback_pt_102)
  begin
      crapeteria = !usa ^  feedback_pt_102;
  end

reg feedback_pt_103;

always @(vcc or feedback_pt_103)
  begin
      mdtcensorc =  vcc | !feedback_pt_103;
  end

reg feedback_pt_104;

always @(knockout or feedback_pt_104)
  begin
      nihlist = !knockout &  feedback_pt_104;
  end

reg feedback_pt_105;

always @(gnd or feedback_pt_105)
  begin
      moses =  gnd & !feedback_pt_105;
  end

reg feedback_pt_106;

always @(greenland or feedback_pt_106)
  begin
      burning =  greenland &  feedback_pt_106;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nhtcenso <= 0;
    else if (poppyseed)
      nhtcenso <= 0;
    else if (legos)
      nhtcenso <= ringlingbros;
  end

always @(nhtcenso)
  begin
      feedback_pt_95 = nhtcenso;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oitcen <= 0;
    else if (criminal)
      oitcen <= 0;
    else if (moses)
      oitcen <= narcotics;
  end

always @(oitcen)
  begin
      feedback_pt_96 = oitcen;
  end

always @(oitcen)
  begin
      feedback_pt_97 = oitcen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      daughter <= 0;
    else if (gnd)
      daughter <= speeding;
  end

always @(daughter)
  begin
      feedback_pt_98 = daughter;
  end

wire wine_wire;

dffea wine_ff (
  .clk(clock0),
  .d(sanity),
  .ena(mexico),
  .adata(whattime),
  .clrn(!reset0),
  .q(wine_wire)
);

always @(wine_wire) begin
   gin = wine_wire;
end

always @(gin)
  begin
      feedback_pt_99 = gin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tonic <= 0;
    else
      tonic <= nihlist;
  end

always @(tonic)
  begin
      feedback_pt_100 = tonic;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rum <= 0;
    else if (michelle)
      rum <= 0;
    else if (whattime)
      rum <= gnd;
  end

always @(rum)
  begin
      feedback_pt_101 = rum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scotch <= 1;
    else
      scotch <= abel;
  end

always @(scotch)
  begin
      feedback_pt_102 = scotch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      larry <= 0;
    else if (scotch)
      larry <= joseph;
  end

always @(larry)
  begin
      feedback_pt_103 = larry;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      curly <= 0;
    else if (crapeteria)
      curly <= 0;
    else if (yoku)
      curly <= jacob;
  end

always @(curly)
  begin
      feedback_pt_104 = curly;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      barnum <= 0;
    else if (cryptic)
      barnum <= 0;
    else if (fury)
      barnum <= gnd;
  end

always @(barnum)
  begin
      feedback_pt_105 = barnum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shemp <= 1;
    else
      shemp <= curly;
  end

always @(shemp)
  begin
      feedback_pt_106 = shemp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wiggum <= 0;
    else if (nhtcenso)
      wiggum <= vcc;
    else if (dutch)
      wiggum <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bart <= 0;
    else if (england)
      bart <= 0;
    else if (cocacola)
      bart <= dreamcoat;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lisa <= 0;
    else if (ihilani)
      lisa <= 0;
    else if (lemon)
      lisa <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marge <= 1;
    else
      marge <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      homerun <= 0;
    else if (bart)
      homerun <= gnd;
    else if (barnum)
      homerun <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      barney <= 1;
    else
      barney <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skinner <= 0;
    else if (fruitcake)
      skinner <= 0;
    else if (gnd)
      skinner <= barnum;
  end

// State Mek krabapple Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      krabapple <= krabapple_0;
    else
      case (krabapple)
        krabapple_0: begin
          if ({dreamcoat,burner,burning,gin} == 6)
            krabapple <= krabapple_2;
          else if ({dreamcoat,burner,burning,gin} == 2)
            krabapple <= krabapple_0;
          else if ({dreamcoat,burner,burning,gin} == 5)
            krabapple <= krabapple_5;
          else
            krabapple <= krabapple_0;
          end
        krabapple_1: begin
          if ({dreamcoat,burner,burning,gin} == 4)
            krabapple <= krabapple_9;
          else if ({dreamcoat,burner,burning,gin} == 3)
            krabapple <= krabapple_10;
          else if ({dreamcoat,burner,burning,gin} == 2)
            krabapple <= krabapple_7;
          else
            krabapple <= krabapple_1;
          end
        krabapple_2: begin
          if ({dreamcoat,burner,burning,gin} == 0)
            krabapple <= krabapple_7;
          else if ({dreamcoat,burner,burning,gin} == 10)
            krabapple <= krabapple_3;
          else if ({dreamcoat,burner,burning,gin} == 13)
            krabapple <= krabapple_3;
          else
            krabapple <= krabapple_2;
          end
        krabapple_3: begin
            krabapple <= krabapple_3;
          end
        krabapple_4: begin
          if ({dreamcoat,burner,burning,gin} == 13)
            krabapple <= krabapple_4;
          else if ({dreamcoat,burner,burning,gin} == 15)
            krabapple <= krabapple_2;
          else if ({dreamcoat,burner,burning,gin} == 6)
            krabapple <= krabapple_6;
          else if ({dreamcoat,burner,burning,gin} == 10)
            krabapple <= krabapple_1;
          else if ({dreamcoat,burner,burning,gin} == 14)
            krabapple <= krabapple_3;
          else if ({dreamcoat,burner,burning,gin} == 0)
            krabapple <= krabapple_4;
          else
            krabapple <= krabapple_4;
          end
        krabapple_5: begin
          if ({dreamcoat,burner,burning,gin} == 7)
            krabapple <= krabapple_2;
          else if ({dreamcoat,burner,burning,gin} == 15)
            krabapple <= krabapple_4;
          else if ({dreamcoat,burner,burning,gin} == 4)
            krabapple <= krabapple_8;
          else if ({dreamcoat,burner,burning,gin} == 6)
            krabapple <= krabapple_9;
          else if ({dreamcoat,burner,burning,gin} == 1)
            krabapple <= krabapple_3;
          else
            krabapple <= krabapple_5;
          end
        krabapple_6: begin
          if ({dreamcoat,burner,burning,gin} == 13)
            krabapple <= krabapple_6;
          else if ({dreamcoat,burner,burning,gin} == 9)
            krabapple <= krabapple_6;
          else if ({dreamcoat,burner,burning,gin} == 8)
            krabapple <= krabapple_10;
          else if ({dreamcoat,burner,burning,gin} == 4)
            krabapple <= krabapple_9;
          else if ({dreamcoat,burner,burning,gin} == 12)
            krabapple <= krabapple_10;
          else if ({dreamcoat,burner,burning,gin} == 11)
            krabapple <= krabapple_0;
          else
            krabapple <= krabapple_6;
          end
        krabapple_7: begin
            krabapple <= krabapple_7;
          end
        krabapple_8: begin
          if ({dreamcoat,burner,burning,gin} == 0)
            krabapple <= krabapple_10;
          else
            krabapple <= krabapple_8;
          end
        krabapple_9: begin
          if ({dreamcoat,burner,burning,gin} == 7)
            krabapple <= krabapple_9;
          else
            krabapple <= krabapple_9;
          end
        krabapple_10: begin
          if ({dreamcoat,burner,burning,gin} == 6)
            krabapple <= krabapple_8;
          else
            krabapple <= krabapple_10;
          end
        default: krabapple <= krabapple_0;
      endcase
  end

// State Mek krabapple Output logic
always @(krabapple)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (krabapple[3:1])
        krabapple_0: begin
            tarzan = 1;
            moe = 0;
            smithers = 0;
            comicbook = 0;
            worstdesignever = 0;
            flanders = 0;
            heidi = 0;
            steaming = 0;
          end
        krabapple_1: begin
            tarzan = 0;
            moe = 1;
            smithers = 0;
            comicbook = 0;
            worstdesignever = 0;
            flanders = 0;
            heidi = 0;
            steaming = 0;
          end
        krabapple_2: begin
            tarzan = 0;
            moe = 1;
            smithers = 0;
            comicbook = 0;
            worstdesignever = 1;
            flanders = 1;
            heidi = 1;
            steaming = 0;
          end
        krabapple_3: begin
            tarzan = 1;
            moe = 1;
            smithers = 0;
            comicbook = 0;
            worstdesignever = 1;
            flanders = 0;
            heidi = 1;
            steaming = 1;
          end
        krabapple_4: begin
            tarzan = 0;
            moe = 0;
            smithers = 0;
            comicbook = 0;
            worstdesignever = 1;
            flanders = 0;
            heidi = 0;
            steaming = 0;
          end
        default: begin
            tarzan = 0;
            moe = 0;
            smithers = 1;
            comicbook = 1;
            worstdesignever = 1;
            flanders = 1;
            heidi = 0;
            steaming = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire rod_out;
nut_003_lut #(2) nut_003_lut_inst_rod (
  .din({gnd,raiders}),
  .mask(4'hb),
  .out(rod_out)
);

always @(rod_out)
begin
   milhouse = rod_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire chewbacca_out;
nut_003_lut #(2) nut_003_lut_inst_chewbacca (
  .din({comicbook,fury}),
  .mask(4'h9),
  .out(chewbacca_out)
);

always @(chewbacca_out)
begin
   todd = chewbacca_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire tukatuk_out;
nut_003_lut #(1) nut_003_lut_inst_tukatuk (
  .din({gnd}),
  .mask(2'b00),
  .out(tukatuk_out)
);

always @(tukatuk_out)
begin
   timmy = tukatuk_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire weevil_out;
nut_003_lut #(6) nut_003_lut_inst_weevil (
  .din({vcc,jxnbox,danger,vcc,gnd,vcc}),
  .mask(64'b1000001010000010000000110100000000100000111010000010000000010010),
  .out(weevil_out)
);

always @(weevil_out)
begin
   slobbering = weevil_out;
end


initial begin
    {psucensorc,deuce,eeevil,intuit,bert} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({vcc,gnd,vcc,gnd,marge} < {thedon,psycho,milhouse,nhtcenso,gnd})
       {psucensorc,deuce,eeevil,intuit,bert} <= {thedon,psycho,milhouse,nhtcenso,gnd};
    else
       {psucensorc,deuce,eeevil,intuit,bert} <= {vcc,gnd,vcc,gnd,marge};
  end

// 4 bit up counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {ernie,life,snuffleupagus,peta} <= 0;
    else
      {ernie,life,snuffleupagus,peta} <= {ernie,life,snuffleupagus,peta} + 1;
  end

// OR all of these bits together
always @(gnd or daughter or lxtcen or gnd or gutter)
  begin
      happyists = | {gnd,daughter,lxtcen,gnd,gutter};
  end

reg feedback_pt_107;

always @(issac or feedback_pt_107)
  begin
      atomic =  issac ^ !feedback_pt_107;
  end

reg feedback_pt_108;

always @(fire or feedback_pt_108)
  begin
      firemonkey =  fire | !feedback_pt_108;
  end

reg feedback_pt_109;

always @(gnd or feedback_pt_109)
  begin
      qfvcensorce =  gnd |  feedback_pt_109;
  end

reg feedback_pt_110;

always @(barney or feedback_pt_110)
  begin
      captain =  barney ^ !feedback_pt_110;
  end

reg feedback_pt_111;

always @(vcc or feedback_pt_111)
  begin
      rhvcens = !vcc |  feedback_pt_111;
  end

reg feedback_pt_112;

always @(lemon or feedback_pt_112)
  begin
      roid = !lemon | !feedback_pt_112;
  end

reg feedback_pt_113;

always @(tracy or feedback_pt_113)
  begin
      itchy = !tracy &  feedback_pt_113;
  end

reg feedback_pt_114;

always @(skinner or feedback_pt_114)
  begin
      squad =  skinner &  feedback_pt_114;
  end

reg feedback_pt_115;

always @(qfvcensorce or feedback_pt_115)
  begin
      joey = !qfvcensorce ^ !feedback_pt_115;
  end

reg feedback_pt_116;

always @(vcc or feedback_pt_116)
  begin
      ramone = !vcc ^ !feedback_pt_116;
  end

reg feedback_pt_117;

always @(daughter or feedback_pt_117)
  begin
      stoned = !daughter &  feedback_pt_117;
  end

wire often_wire;

dffea often_ff (
  .clk(clock0),
  .d(firemonkey),
  .ena(psucensorc),
  .adata(moe),
  .clrn(!reset0),
  .q(often_wire)
);

always @(often_wire) begin
   south = often_wire;
end

always @(south)
  begin
      feedback_pt_107 = south;
  end

always @(south)
  begin
      feedback_pt_108 = south;
  end

always @(south)
  begin
      feedback_pt_109 = south;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      edible <= 1;
    else
      edible <= wiggum;
  end

always @(edible)
  begin
      feedback_pt_110 = edible;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      srvcensorce <= 0;
    else if (peta)
      srvcensorce <= vcc;
    else if (morrison)
      srvcensorce <= 0;
  end

always @(srvcensorce)
  begin
      feedback_pt_111 = srvcensorce;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      on_sale <= 0;
    else if (lisa)
      on_sale <= 0;
    else if (todd)
      on_sale <= eeevil;
  end

always @(on_sale)
  begin
      feedback_pt_112 = on_sale;
  end

wire aisle_two_wire;

dffeas aisle_two_ff (
  .clk(clock0),
  .d(edible),
  .ena(fury),
  .sclr(tarzan),
  .sload(vcc),
  .asdata(vcc),
  .clrn(!reset0),
  .q(aisle_two_wire)
);

always @(aisle_two_wire) begin
   dinoblaster = aisle_two_wire;
end

always @(dinoblaster)
  begin
      feedback_pt_113 = dinoblaster;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crunchyfrog <= 1;
    else
      crunchyfrog <= vcc;
  end

always @(crunchyfrog)
  begin
      feedback_pt_114 = crunchyfrog;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nobody <= 1;
    else
      nobody <= qfvcensorce;
  end

always @(nobody)
  begin
      feedback_pt_115 = nobody;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      expects_the <= 0;
    else if (vcc)
      expects_the <= china;
  end

always @(expects_the)
  begin
      feedback_pt_116 = expects_the;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spanish <= 0;
    else if (fire)
      spanish <= star;
  end

always @(spanish)
  begin
      feedback_pt_117 = spanish;
  end

wire inquisition_wire;

dffeas inquisition_ff (
  .clk(clock0),
  .d(gnd),
  .ena(vcc),
  .sclr(mrbill),
  .sload(romulus),
  .asdata(vcc),
  .clrn(!reset0),
  .q(inquisition_wire)
);

always @(inquisition_wire) begin
   chief = inquisition_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weapons <= 0;
    else if (knot)
      weapons <= bart;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fear <= 0;
    else if (steaming)
      fear <= 0;
    else if (snuffleupagus)
      fear <= geisha;
  end

wire surprise_wire;

dffea surprise_ff (
  .clk(clock0),
  .d(daughter),
  .ena(show),
  .adata(fear),
  .clrn(!reset0),
  .q(surprise_wire)
);

always @(surprise_wire) begin
   efficiency = surprise_wire;
end

wire fanatical_wire;

dffea fanatical_ff (
  .clk(clock0),
  .d(stoned),
  .ena(holland),
  .adata(gnd),
  .clrn(!reset0),
  .q(fanatical_wire)
);

always @(fanatical_wire) begin
   devotion = fanatical_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      the_pope <= 1;
    else
      the_pope <= gnd;
  end

wire yummy_wire;

dffeas yummy_ff (
  .clk(clock0),
  .d(gnd),
  .ena(snuffleupagus),
  .sclr(joseph),
  .sload(gnd),
  .asdata(heidi),
  .clrn(!reset0),
  .q(yummy_wire)
);

always @(yummy_wire) begin
   love_in = yummy_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      my_tummy <= 0;
    else
      my_tummy <= ramone;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      po <= 1;
    else
      po <= foryou;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lala <= 0;
    else if (the_pope)
      lala <= deuce;
    else if (vcc)
      lala <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dipsy <= 0;
    else
      dipsy <= gotone;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      touch <= 0;
    else if (comicbook)
      touch <= oitcen;
    else if (roid)
      touch <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kissthesky <= 1;
    else
      kissthesky <= joey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peopleeater <= 0;
    else if (whattime)
      peopleeater <= devotion;
    else if (homerun)
      peopleeater <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      haze <= 0;
    else
      haze <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      timingmodel <= 1;
    else
      timingmodel <= gnd;
  end

wire plumber_wire;

dffeas plumber_ff (
  .clk(clock0),
  .d(famulan),
  .ena(raiders),
  .sclr(curly),
  .sload(nation),
  .asdata(gnd),
  .clrn(!reset0),
  .q(plumber_wire)
);

always @(plumber_wire) begin
   odin = plumber_wire;
end

reg feedback_pt_118;

always @(romex or feedback_pt_118)
  begin
      thor =  romex ^  feedback_pt_118;
  end

reg feedback_pt_119;

always @(spain or feedback_pt_119)
  begin
      jupiter =  spain & !feedback_pt_119;
  end

reg feedback_pt_120;

always @(my_tummy or feedback_pt_120)
  begin
      zeus =  my_tummy ^ !feedback_pt_120;
  end

reg feedback_pt_121;

always @(flanders or feedback_pt_121)
  begin
      athena =  flanders & !feedback_pt_121;
  end

reg feedback_pt_122;

always @(ernie or feedback_pt_122)
  begin
      minerva =  ernie &  feedback_pt_122;
  end

reg feedback_pt_123;

always @(eeevil or feedback_pt_123)
  begin
      mars =  eeevil | !feedback_pt_123;
  end

reg feedback_pt_124;

always @(jupiter or feedback_pt_124)
  begin
      venus = !jupiter & !feedback_pt_124;
  end

reg feedback_pt_125;

always @(shemp or feedback_pt_125)
  begin
      pluto =  shemp |  feedback_pt_125;
  end

reg feedback_pt_126;

always @(vcc or feedback_pt_126)
  begin
      neptune =  vcc &  feedback_pt_126;
  end

reg feedback_pt_127;

always @(kissthesky or feedback_pt_127)
  begin
      ariel = !kissthesky ^ !feedback_pt_127;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sebastian <= 0;
    else if (expects_the)
      sebastian <= 0;
    else if (gnd)
      sebastian <= stoned;
  end

always @(sebastian)
  begin
      feedback_pt_118 = sebastian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bach <= 0;
    else if (vcc)
      bach <= 0;
    else if (gnd)
      bach <= hoser;
  end

always @(bach)
  begin
      feedback_pt_119 = bach;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mozart <= 1;
    else
      mozart <= intuit;
  end

always @(mozart)
  begin
      feedback_pt_120 = mozart;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goodmonkey <= 1;
    else
      goodmonkey <= lisa;
  end

always @(goodmonkey)
  begin
      feedback_pt_121 = goodmonkey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      badmonkey <= 0;
    else if (south)
      badmonkey <= vcc;
    else if (love_in)
      badmonkey <= 0;
  end

always @(badmonkey)
  begin
      feedback_pt_122 = badmonkey;
  end

wire guy_wire;

dffeas guy_ff (
  .clk(clock0),
  .d(gnd),
  .ena(larry),
  .sclr(gnd),
  .sload(vcc),
  .asdata(dinoblaster),
  .clrn(!reset0),
  .q(guy_wire)
);

always @(guy_wire) begin
   partners = guy_wire;
end

always @(partners)
  begin
      feedback_pt_123 = partners;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cubish <= 1;
    else
      cubish <= gnd;
  end

always @(cubish)
  begin
      feedback_pt_124 = cubish;
  end

wire solder_wire;

dffea solder_ff (
  .clk(clock0),
  .d(psycho),
  .ena(vcc),
  .adata(pig),
  .clrn(!reset0),
  .q(solder_wire)
);

always @(solder_wire) begin
   valve = solder_wire;
end

always @(valve)
  begin
      feedback_pt_125 = valve;
  end

wire furnace_wire;

dffeas furnace_ff (
  .clk(clock0),
  .d(edible),
  .ena(po),
  .sclr(barney),
  .sload(mrbill),
  .asdata(gnd),
  .clrn(!reset0),
  .q(furnace_wire)
);

always @(furnace_wire) begin
   pilot = furnace_wire;
end

always @(pilot)
  begin
      feedback_pt_126 = pilot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      leaky <= 0;
    else
      leaky <= vcc;
  end

always @(leaky)
  begin
      feedback_pt_127 = leaky;
  end

wire potter_wire;

dffea potter_ff (
  .clk(clock0),
  .d(on_sale),
  .ena(vcc),
  .adata(gnd),
  .clrn(!reset0),
  .q(potter_wire)
);

always @(potter_wire) begin
   drax = potter_wire;
end

wire moonraker_wire;

dffea moonraker_ff (
  .clk(clock0),
  .d(zeus),
  .ena(spanish),
  .adata(valve),
  .clrn(!reset0),
  .q(moonraker_wire)
);

always @(moonraker_wire) begin
   killme = moonraker_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tyycensor <= 0;
    else if (vcc)
      tyycensor <= heidi;
    else if (thor)
      tyycensor <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sortout <= 0;
    else if (vcc)
      sortout <= 0;
    else if (jupiter)
      sortout <= timmy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sgates <= 0;
    else if (gnd)
      sgates <= 0;
    else if (sebastian)
      sgates <= crunchyfrog;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atoms <= 0;
    else if (ariel)
      atoms <= 0;
    else if (moe)
      atoms <= edible;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      thankee <= 0;
    else
      thankee <= lala;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wakey <= 0;
    else
      wakey <= lala;
  end

// Random combinatorial logic block
always@(*)
  begin
      ants = ( ~( ~( ~( ( ~( ~touch | firemonkey ) ) ) & ( ~( ( ~( ~timingmodel | vcc ) ) | ~( ~tracy ) ) ) ) & ~( ( ~( ~( ( ihilani ^ my_tummy ) ) ^ ~( ~gnd ) & ~( captain ) ) ) ) ) );
  end

// State Mek dig Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dig <= dig_0;
    else
      case (dig)
        dig_0: begin
          if ({srvcensorce,valve,heidi,fruitcake} == 5)
            dig <= dig_2;
          else if ({srvcensorce,valve,heidi,fruitcake} == 1)
            dig <= dig_5;
          else if ({srvcensorce,valve,heidi,fruitcake} == 3)
            dig <= dig_7;
          else
            dig <= dig_0;
          end
        dig_1: begin
            dig <= dig_1;
          end
        dig_2: begin
          if ({srvcensorce,valve,heidi,fruitcake} == 15)
            dig <= dig_0;
          else
            dig <= dig_2;
          end
        dig_3: begin
          if ({srvcensorce,valve,heidi,fruitcake} == 1)
            dig <= dig_7;
          else if ({srvcensorce,valve,heidi,fruitcake} == 14)
            dig <= dig_0;
          else if ({srvcensorce,valve,heidi,fruitcake} == 5)
            dig <= dig_3;
          else
            dig <= dig_3;
          end
        dig_4: begin
          if ({srvcensorce,valve,heidi,fruitcake} == 10)
            dig <= dig_2;
          else if ({srvcensorce,valve,heidi,fruitcake} == 9)
            dig <= dig_6;
          else if ({srvcensorce,valve,heidi,fruitcake} == 1)
            dig <= dig_0;
          else if ({srvcensorce,valve,heidi,fruitcake} == 5)
            dig <= dig_7;
          else
            dig <= dig_4;
          end
        dig_5: begin
          if ({srvcensorce,valve,heidi,fruitcake} == 15)
            dig <= dig_4;
          else if ({srvcensorce,valve,heidi,fruitcake} == 4)
            dig <= dig_1;
          else if ({srvcensorce,valve,heidi,fruitcake} == 11)
            dig <= dig_5;
          else if ({srvcensorce,valve,heidi,fruitcake} == 6)
            dig <= dig_0;
          else
            dig <= dig_5;
          end
        dig_6: begin
          if ({srvcensorce,valve,heidi,fruitcake} == 11)
            dig <= dig_6;
          else if ({srvcensorce,valve,heidi,fruitcake} == 13)
            dig <= dig_0;
          else if ({srvcensorce,valve,heidi,fruitcake} == 10)
            dig <= dig_3;
          else
            dig <= dig_6;
          end
        dig_7: begin
          if ({srvcensorce,valve,heidi,fruitcake} == 13)
            dig <= dig_2;
          else if ({srvcensorce,valve,heidi,fruitcake} == 3)
            dig <= dig_2;
          else if ({srvcensorce,valve,heidi,fruitcake} == 10)
            dig <= dig_0;
          else
            dig <= dig_7;
          end
        default: dig <= dig_0;
      endcase
  end

// State Mek dig Output logic
always @(dig)
  begin
    // consider all state regs when doing outputs
    case (dig)
        dig_0: begin
            ladder = 1;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
            golden = 1;
            egg = 0;
            tofu = 0;
            rodent = 0;
            billnted = 1;
            whiteboard = 1;
            synthesis = 0;
            fitter = 0;
          end
        dig_1: begin
            ladder = 1;
            wrecker = 0;
            dumptruck = 1;
            dumbarton = 0;
            golden = 1;
            egg = 1;
            tofu = 0;
            rodent = 1;
            billnted = 1;
            whiteboard = 1;
            synthesis = 1;
            fitter = 0;
          end
        dig_2: begin
            ladder = 1;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
            golden = 0;
            egg = 1;
            tofu = 0;
            rodent = 1;
            billnted = 1;
            whiteboard = 0;
            synthesis = 1;
            fitter = 0;
          end
        dig_3: begin
            ladder = 0;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
            golden = 1;
            egg = 0;
            tofu = 0;
            rodent = 1;
            billnted = 0;
            whiteboard = 0;
            synthesis = 0;
            fitter = 0;
          end
        dig_4: begin
            ladder = 0;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
            golden = 0;
            egg = 0;
            tofu = 0;
            rodent = 0;
            billnted = 0;
            whiteboard = 0;
            synthesis = 0;
            fitter = 0;
          end
        dig_5: begin
            ladder = 0;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
            golden = 0;
            egg = 0;
            tofu = 0;
            rodent = 0;
            billnted = 0;
            whiteboard = 1;
            synthesis = 1;
            fitter = 1;
          end
        dig_6: begin
            ladder = 0;
            wrecker = 0;
            dumptruck = 1;
            dumbarton = 0;
            golden = 1;
            egg = 0;
            tofu = 1;
            rodent = 1;
            billnted = 1;
            whiteboard = 0;
            synthesis = 0;
            fitter = 0;
          end
        dig_7: begin
            ladder = 0;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
            golden = 1;
            egg = 1;
            tofu = 1;
            rodent = 0;
            billnted = 1;
            whiteboard = 1;
            synthesis = 0;
            fitter = 1;
          end
        default: begin
            ladder = 0;
            wrecker = 1;
            dumptruck = 1;
            dumbarton = 0;
            golden = 0;
            egg = 0;
            tofu = 0;
            rodent = 0;
            billnted = 0;
            whiteboard = 1;
            synthesis = 1;
            fitter = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire sweetie_out;
nut_003_lut #(2) nut_003_lut_inst_sweetie (
  .din({partners,probably}),
  .mask(4'b0000),
  .out(sweetie_out)
);

always @(sweetie_out)
begin
   dingbat = sweetie_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire wanton_out;
nut_003_lut #(1) nut_003_lut_inst_wanton (
  .din({abel}),
  .mask(2'b01),
  .out(wanton_out)
);

always @(wanton_out)
begin
   wiggles = wanton_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire thread_out;
nut_003_lut #(6) nut_003_lut_inst_thread (
  .din({scotch,gnd,dumbarton,killme,south,itchy}),
  .mask(64'h1b8329162db5a387),
  .out(thread_out)
);

always @(thread_out)
begin
   rewire = thread_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire art_out;
nut_003_lut #(3) nut_003_lut_inst_art (
  .din({tofu,wakey,happyists}),
  .mask(8'b00010100),
  .out(art_out)
);

always @(art_out)
begin
   suffering = art_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire tamago_out;
nut_003_lut #(5) nut_003_lut_inst_tamago (
  .din({mrbill,killme,vcc,gnd,mrbill}),
  .mask(32'hb7c28383),
  .out(tamago_out)
);

always @(tamago_out)
begin
   vegas = tamago_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire salmon_out;
nut_003_lut #(2) nut_003_lut_inst_salmon (
  .din({abel,rewire}),
  .mask(4'h4),
  .out(salmon_out)
);

always @(salmon_out)
begin
   tuna = salmon_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire ritsu_out;
nut_003_lut #(4) nut_003_lut_inst_ritsu (
  .din({vcc,leaky,dingbat,gnd}),
  .mask(16'b0100101001100000),
  .out(ritsu_out)
);

always @(ritsu_out)
begin
   sake = ritsu_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire shrimp_out;
nut_003_lut #(2) nut_003_lut_inst_shrimp (
  .din({vcc,probably}),
  .mask(4'b0010),
  .out(shrimp_out)
);

always @(shrimp_out)
begin
   ebi = shrimp_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire tako_out;
nut_003_lut #(4) nut_003_lut_inst_tako (
  .din({puertorico,vcc,athena,pictures}),
  .mask(16'b0010010000000001),
  .out(tako_out)
);

always @(tako_out)
begin
   rainbow = tako_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire hamachi_out;
nut_003_lut #(1) nut_003_lut_inst_hamachi (
  .din({neptune}),
  .mask(2'b00),
  .out(hamachi_out)
);

always @(hamachi_out)
begin
   octapus = hamachi_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire kana_out;
nut_003_lut #(5) nut_003_lut_inst_kana (
  .din({venus,todd,probably,vcc,atomic}),
  .mask(32'hc4d703b5),
  .out(kana_out)
);

always @(kana_out)
begin
   yellowtail = kana_out;
end

// Greater Equal Less compare
always @(wakey or suffering or vcc or gnd or danger or yellowtail or minerva or peopleeater or life or vcc)
  begin
    if ({wakey,suffering,vcc,gnd,danger} > {yellowtail,minerva,peopleeater,life,vcc})
       {crab,nigiri,handroll} = 3'b100;
    else if ({wakey,suffering,vcc,gnd,danger} < {yellowtail,minerva,peopleeater,life,vcc})
       {crab,nigiri,handroll} = 3'b010;
    else
       {crab,nigiri,handroll} = 3'b001;
  end

// AND all of these bits together
always @(dipsy or eeevil or liberation or vcc or ants or octapus or sake or chief or synthesis or slobbering or fear)
  begin
      maki = & {dipsy,eeevil,liberation,vcc,ants,octapus,sake,chief,synthesis,slobbering,fear};
  end

reg feedback_pt_128;

always @(happyists or feedback_pt_128)
  begin
      roe = !happyists &  feedback_pt_128;
  end

reg feedback_pt_129;

always @(killme or feedback_pt_129)
  begin
      tobiko =  killme ^  feedback_pt_129;
  end

reg feedback_pt_130;

always @(gnd or feedback_pt_130)
  begin
      kappa = !gnd &  feedback_pt_130;
  end

reg feedback_pt_131;

always @(goodmonkey or feedback_pt_131)
  begin
      cucumber = !goodmonkey &  feedback_pt_131;
  end

reg feedback_pt_132;

always @(ariel or feedback_pt_132)
  begin
      california = !ariel |  feedback_pt_132;
  end

reg feedback_pt_133;

always @(vcc or feedback_pt_133)
  begin
      ebay = !vcc &  feedback_pt_133;
  end

reg feedback_pt_134;

always @(steaming or feedback_pt_134)
  begin
      covad = !steaming & !feedback_pt_134;
  end

reg feedback_pt_135;

always @(love_in or feedback_pt_135)
  begin
      exodus =  love_in & !feedback_pt_135;
  end

reg feedback_pt_136;

always @(mozart or feedback_pt_136)
  begin
      abovenet =  mozart &  feedback_pt_136;
  end

reg feedback_pt_137;

always @(on_sale or feedback_pt_137)
  begin
      webvan = !on_sale |  feedback_pt_137;
  end

reg feedback_pt_138;

always @(california or feedback_pt_138)
  begin
      sears =  california &  feedback_pt_138;
  end

reg feedback_pt_139;

always @(ladder or feedback_pt_139)
  begin
      lucent =  ladder & !feedback_pt_139;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ibm <= 0;
    else if (gnd)
      ibm <= moses;
  end

always @(ibm)
  begin
      feedback_pt_128 = ibm;
  end

always @(ibm)
  begin
      feedback_pt_129 = ibm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      intel <= 1;
    else
      intel <= ibm;
  end

always @(intel)
  begin
      feedback_pt_130 = intel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hp <= 0;
    else if (moe)
      hp <= eatem;
    else if (zipporah)
      hp <= 0;
  end

always @(hp)
  begin
      feedback_pt_131 = hp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gm <= 0;
    else
      gm <= rodent;
  end

always @(gm)
  begin
      feedback_pt_132 = gm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ford <= 0;
    else if (joseph)
      ford <= rainbow;
  end

always @(ford)
  begin
      feedback_pt_133 = ford;
  end

wire chevys_wire;

dffea chevys_ff (
  .clk(clock0),
  .d(tobiko),
  .ena(ford),
  .adata(egg),
  .clrn(!reset0),
  .q(chevys_wire)
);

always @(chevys_wire) begin
   chillis = chevys_wire;
end

always @(chillis)
  begin
      feedback_pt_134 = chillis;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      macdonalds <= 0;
    else if (gnd)
      macdonalds <= dipsy;
  end

always @(macdonalds)
  begin
      feedback_pt_135 = macdonalds;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lockheed <= 0;
    else if (vcc)
      lockheed <= 0;
    else if (efficiency)
      lockheed <= squad;
  end

always @(lockheed)
  begin
      feedback_pt_136 = lockheed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      martin <= 0;
    else
      martin <= dipsy;
  end

always @(martin)
  begin
      feedback_pt_137 = martin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marvin <= 0;
    else if (vcc)
      marvin <= roe;
  end

always @(marvin)
  begin
      feedback_pt_138 = marvin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      martian <= 1;
    else
      martian <= vcc;
  end

always @(martian)
  begin
      feedback_pt_139 = martian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      molokai <= 1;
    else
      molokai <= dumbarton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      amex <= 0;
    else if (pilot)
      amex <= 0;
    else if (ladder)
      amex <= neptune;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nasdaq <= 0;
    else if (eeevil)
      nasdaq <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dow <= 0;
    else if (kappa)
      dow <= 0;
    else if (vcc)
      dow <= rocks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      taoist <= 0;
    else if (martin)
      taoist <= 0;
    else if (molokai)
      taoist <= exodus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      liberace <= 1;
    else
      liberace <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      microsoft <= 0;
    else
      microsoft <= intel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sun <= 1;
    else
      sun <= cucumber;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oracle <= 0;
    else if (tonic)
      oracle <= nation;
  end

reg feedback_pt_140;

always @(ford or feedback_pt_140)
  begin
      bfi =  ford | !feedback_pt_140;
  end

reg feedback_pt_141;

always @(intel or feedback_pt_141)
  begin
      century = !intel & !feedback_pt_141;
  end

reg feedback_pt_142;

always @(todd or feedback_pt_142)
  begin
      harrydavid =  todd ^ !feedback_pt_142;
  end

reg feedback_pt_143;

always @(larry or feedback_pt_143)
  begin
      safeway =  larry | !feedback_pt_143;
  end

reg feedback_pt_144;

always @(macdonalds or feedback_pt_144)
  begin
      pepsi = !macdonalds ^  feedback_pt_144;
  end

reg feedback_pt_145;

always @(taoist or feedback_pt_145)
  begin
      pacbell =  taoist &  feedback_pt_145;
  end

reg feedback_pt_146;

always @(gnd or feedback_pt_146)
  begin
      att = !gnd ^ !feedback_pt_146;
  end

reg feedback_pt_147;

always @(pacbell or feedback_pt_147)
  begin
      tsmc = !pacbell & !feedback_pt_147;
  end

reg feedback_pt_148;

always @(eatem or feedback_pt_148)
  begin
      bathbody = !eatem |  feedback_pt_148;
  end

reg feedback_pt_149;

always @(vegas or feedback_pt_149)
  begin
      papyrus = !vegas | !feedback_pt_149;
  end

reg feedback_pt_150;

always @(nasdaq or feedback_pt_150)
  begin
      macys =  nasdaq &  feedback_pt_150;
  end

reg feedback_pt_151;

always @(gnd or feedback_pt_151)
  begin
      sharperimg = !gnd ^  feedback_pt_151;
  end

reg feedback_pt_152;

always @(vcc or feedback_pt_152)
  begin
      mitsubishi = !vcc | !feedback_pt_152;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      honda <= 1;
    else
      honda <= microsoft;
  end

always @(honda)
  begin
      feedback_pt_140 = honda;
  end

always @(honda)
  begin
      feedback_pt_141 = honda;
  end

always @(honda)
  begin
      feedback_pt_142 = honda;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pimpernel <= 0;
    else
      pimpernel <= vcc;
  end

always @(pimpernel)
  begin
      feedback_pt_143 = pimpernel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kbtoys <= 0;
    else if (handroll)
      kbtoys <= 0;
    else if (fitter)
      kbtoys <= gnd;
  end

always @(kbtoys)
  begin
      feedback_pt_144 = kbtoys;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      toysrus <= 0;
    else if (harrydavid)
      toysrus <= bathbody;
  end

always @(toysrus)
  begin
      feedback_pt_145 = toysrus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gap <= 0;
    else if (kbtoys)
      gap <= 0;
    else if (vcc)
      gap <= bach;
  end

always @(gap)
  begin
      feedback_pt_146 = gap;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bananarep <= 1;
    else
      bananarep <= scotch;
  end

always @(bananarep)
  begin
      feedback_pt_147 = bananarep;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oldnavy <= 0;
    else if (martin)
      oldnavy <= vcc;
  end

always @(oldnavy)
  begin
      feedback_pt_148 = oldnavy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      clothing <= 0;
    else
      clothing <= vcc;
  end

always @(clothing)
  begin
      feedback_pt_149 = clothing;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      starbucks <= 0;
    else if (geisha)
      starbucks <= 0;
    else if (po)
      starbucks <= att;
  end

always @(starbucks)
  begin
      feedback_pt_150 = starbucks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      coffee <= 0;
    else if (microsoft)
      coffee <= gnd;
  end

always @(coffee)
  begin
      feedback_pt_151 = coffee;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      structure <= 1;
    else
      structure <= rhvcens;
  end

always @(structure)
  begin
      feedback_pt_152 = structure;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jcrew <= 0;
    else if (dumptruck)
      jcrew <= gnd;
    else if (martin)
      jcrew <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      whatelse <= 0;
    else
      whatelse <= toysrus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blessyou <= 0;
    else
      blessyou <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kerchoozle <= 0;
    else
      kerchoozle <= martian;
  end

// State Mek atchoo Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atchoo <= atchoo_0;
    else
      case (atchoo)
        atchoo_0: begin
          if ({gnd,rhvcens,amex,cucumber} == 11)
            atchoo <= atchoo_3;
          else if ({gnd,rhvcens,amex,cucumber} == 13)
            atchoo <= atchoo_5;
          else
            atchoo <= atchoo_0;
          end
        atchoo_1: begin
          if ({gnd,rhvcens,amex,cucumber} == 6)
            atchoo <= atchoo_2;
          else if ({gnd,rhvcens,amex,cucumber} == 13)
            atchoo <= atchoo_8;
          else if ({gnd,rhvcens,amex,cucumber} == 12)
            atchoo <= atchoo_7;
          else if ({gnd,rhvcens,amex,cucumber} == 8)
            atchoo <= atchoo_5;
          else
            atchoo <= atchoo_1;
          end
        atchoo_2: begin
          if ({gnd,rhvcens,amex,cucumber} == 13)
            atchoo <= atchoo_8;
          else if ({gnd,rhvcens,amex,cucumber} == 11)
            atchoo <= atchoo_10;
          else if ({gnd,rhvcens,amex,cucumber} == 2)
            atchoo <= atchoo_10;
          else if ({gnd,rhvcens,amex,cucumber} == 15)
            atchoo <= atchoo_2;
          else
            atchoo <= atchoo_2;
          end
        atchoo_3: begin
          if ({gnd,rhvcens,amex,cucumber} == 2)
            atchoo <= atchoo_2;
          else if ({gnd,rhvcens,amex,cucumber} == 7)
            atchoo <= atchoo_8;
          else
            atchoo <= atchoo_3;
          end
        atchoo_4: begin
            atchoo <= atchoo_4;
          end
        atchoo_5: begin
          if ({gnd,rhvcens,amex,cucumber} == 6)
            atchoo <= atchoo_3;
          else
            atchoo <= atchoo_5;
          end
        atchoo_6: begin
          if ({gnd,rhvcens,amex,cucumber} == 12)
            atchoo <= atchoo_9;
          else if ({gnd,rhvcens,amex,cucumber} == 13)
            atchoo <= atchoo_5;
          else if ({gnd,rhvcens,amex,cucumber} == 0)
            atchoo <= atchoo_6;
          else
            atchoo <= atchoo_6;
          end
        atchoo_7: begin
          if ({gnd,rhvcens,amex,cucumber} == 11)
            atchoo <= atchoo_8;
          else if ({gnd,rhvcens,amex,cucumber} == 2)
            atchoo <= atchoo_0;
          else
            atchoo <= atchoo_7;
          end
        atchoo_8: begin
          if ({gnd,rhvcens,amex,cucumber} == 13)
            atchoo <= atchoo_10;
          else if ({gnd,rhvcens,amex,cucumber} == 0)
            atchoo <= atchoo_7;
          else if ({gnd,rhvcens,amex,cucumber} == 3)
            atchoo <= atchoo_8;
          else if ({gnd,rhvcens,amex,cucumber} == 4)
            atchoo <= atchoo_9;
          else if ({gnd,rhvcens,amex,cucumber} == 6)
            atchoo <= atchoo_4;
          else
            atchoo <= atchoo_8;
          end
        atchoo_9: begin
          if ({gnd,rhvcens,amex,cucumber} == 13)
            atchoo <= atchoo_5;
          else if ({gnd,rhvcens,amex,cucumber} == 9)
            atchoo <= atchoo_8;
          else if ({gnd,rhvcens,amex,cucumber} == 10)
            atchoo <= atchoo_8;
          else if ({gnd,rhvcens,amex,cucumber} == 4)
            atchoo <= atchoo_6;
          else
            atchoo <= atchoo_9;
          end
        atchoo_10: begin
          if ({gnd,rhvcens,amex,cucumber} == 11)
            atchoo <= atchoo_1;
          else if ({gnd,rhvcens,amex,cucumber} == 15)
            atchoo <= atchoo_4;
          else
            atchoo <= atchoo_10;
          end
        default: atchoo <= atchoo_0;
      endcase
  end

// State Mek atchoo Output logic
always @(atchoo)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (atchoo[3:1])
        atchoo_0: begin
            siamese = 0;
            tabby = 0;
            notsure = 0;
            monster = 0;
            incagardens = 0;
            genji = 1;
            lafondue = 0;
            subway = 0;
            pasta = 0;
            pomodoro = 0;
            puttanesca = 0;
            golfland = 1;
            arcade = 0;
          end
        atchoo_1: begin
            siamese = 0;
            tabby = 1;
            notsure = 0;
            monster = 0;
            incagardens = 0;
            genji = 0;
            lafondue = 0;
            subway = 0;
            pasta = 0;
            pomodoro = 0;
            puttanesca = 0;
            golfland = 0;
            arcade = 0;
          end
        atchoo_2: begin
            siamese = 0;
            tabby = 1;
            notsure = 0;
            monster = 0;
            incagardens = 0;
            genji = 0;
            lafondue = 0;
            subway = 0;
            pasta = 1;
            pomodoro = 1;
            puttanesca = 1;
            golfland = 1;
            arcade = 0;
          end
        atchoo_3: begin
            siamese = 1;
            tabby = 1;
            notsure = 0;
            monster = 0;
            incagardens = 0;
            genji = 1;
            lafondue = 1;
            subway = 1;
            pasta = 0;
            pomodoro = 0;
            puttanesca = 1;
            golfland = 0;
            arcade = 1;
          end
        atchoo_4: begin
            siamese = 0;
            tabby = 0;
            notsure = 0;
            monster = 0;
            incagardens = 1;
            genji = 0;
            lafondue = 0;
            subway = 0;
            pasta = 0;
            pomodoro = 0;
            puttanesca = 0;
            golfland = 0;
            arcade = 1;
          end
        default: begin
            siamese = 1;
            tabby = 1;
            notsure = 0;
            monster = 1;
            incagardens = 0;
            genji = 1;
            lafondue = 1;
            subway = 1;
            pasta = 1;
            pomodoro = 1;
            puttanesca = 1;
            golfland = 1;
            arcade = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire blaster_out;
nut_003_lut #(3) nut_003_lut_inst_blaster (
  .din({piggish,vcc,vcc}),
  .mask(8'b11001011),
  .out(blaster_out)
);

always @(blaster_out)
begin
   jacuzzi = blaster_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire beemer_out;
nut_003_lut #(4) nut_003_lut_inst_beemer (
  .din({honda,martin,gnd,lucent}),
  .mask(16'b0000010100000011),
  .out(beemer_out)
);

always @(beemer_out)
begin
   bonker = beemer_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire concorde_out;
nut_003_lut #(4) nut_003_lut_inst_concorde (
  .din({marvin,amex,lucent,golfland}),
  .mask(16'h4dc8),
  .out(concorde_out)
);

always @(concorde_out)
begin
   bono = concorde_out;
end

// Greater Equal Less compare
always @(kerchoozle or toysrus or vcc or vcc or atoms or martian or jcrew or lisa)
  begin
    if ({kerchoozle,toysrus,vcc,vcc} > {atoms,martian,jcrew,lisa})
       {stemcell,shark,carolina} = 3'b100;
    else if ({kerchoozle,toysrus,vcc,vcc} < {atoms,martian,jcrew,lisa})
       {stemcell,shark,carolina} = 3'b010;
    else
       {stemcell,shark,carolina} = 3'b001;
  end

// Triple add / sub bait
always @(incagardens or pimpernel or vcc or gnd or vcc or nobody or gnd or blessyou or chillis or gnd or ford or
         badmonkey or dow or gm or vcc or maki or genji or nigiri or ihilani or ebay or blessyou or puttanesca or
         ebi or coffee or gnd or sgates or gnd or vcc or crab or dinoblaster or pig or tsmc or amex)
  begin
    {avon,bomb,school,cornell,soccer,softball,fieldhockey,nirish,peace,mideast,illegal} = 
        {incagardens,pimpernel,vcc,gnd,vcc,nobody,gnd,blessyou,chillis,gnd,ford} -
        {badmonkey,dow,gm,vcc,maki,genji,nigiri,ihilani,ebay,blessyou,puttanesca} -
        {ebi,coffee,gnd,sgates,gnd,vcc,crab,dinoblaster,pig,tsmc,amex};
  end

// NAND all of these bits together
always @(bananarep or avon or crab or thankee or billnted or yoku or barney or fitter or arcade or california or wrecker or clothing)
  begin
      drugs = ~& {bananarep,avon,crab,thankee,billnted,yoku,barney,fitter,arcade,california,wrecker,clothing};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      infesting <= 0;
    else
    case ({gnd,vcc})
       0 : infesting <= vegas;
       1 : infesting <= infesting;
       2 : infesting <= arcade;
       3 : infesting <= athena;
       default : infesting <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      children <= 0;
    else
    case ({bfi,macdonalds})
       0 : children <= children;
       1 : children <= children;
       2 : children <= vcc;
       3 : children <= love_in;
       default : children <= 0;
    endcase
  end

reg feedback_pt_153;

always @(soccer or feedback_pt_153)
  begin
      crank = !soccer |  feedback_pt_153;
  end

reg feedback_pt_154;

always @(hp or feedback_pt_154)
  begin
      marijuana = !hp &  feedback_pt_154;
  end

reg feedback_pt_155;

always @(notsure or feedback_pt_155)
  begin
      lsd =  notsure |  feedback_pt_155;
  end

reg feedback_pt_156;

always @(gnd or feedback_pt_156)
  begin
      acid = !gnd & !feedback_pt_156;
  end

reg feedback_pt_157;

always @(bonker or feedback_pt_157)
  begin
      crack =  bonker |  feedback_pt_157;
  end

reg feedback_pt_158;

always @(vcc or feedback_pt_158)
  begin
      speed = !vcc | !feedback_pt_158;
  end

reg feedback_pt_159;

always @(oracle or feedback_pt_159)
  begin
      meth =  oracle &  feedback_pt_159;
  end

reg feedback_pt_160;

always @(liberace or feedback_pt_160)
  begin
      crystal =  liberace | !feedback_pt_160;
  end

reg feedback_pt_161;

always @(gnd or feedback_pt_161)
  begin
      uppers =  gnd | !feedback_pt_161;
  end

reg feedback_pt_162;

always @(gnd or feedback_pt_162)
  begin
      downers =  gnd ^  feedback_pt_162;
  end

reg feedback_pt_163;

always @(cubish or feedback_pt_163)
  begin
      viagra = !cubish | !feedback_pt_163;
  end

reg feedback_pt_164;

always @(bathbody or feedback_pt_164)
  begin
      yohimbe = !bathbody | !feedback_pt_164;
  end

reg feedback_pt_165;

always @(sogood or feedback_pt_165)
  begin
      decongestant = !sogood ^ !feedback_pt_165;
  end

reg feedback_pt_166;

always @(drugs or feedback_pt_166)
  begin
      nyquil =  drugs |  feedback_pt_166;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dimetap <= 0;
    else if (captain)
      dimetap <= vcc;
    else if (lockheed)
      dimetap <= 0;
  end

always @(dimetap)
  begin
      feedback_pt_153 = dimetap;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      coughsyrup <= 1;
    else
      coughsyrup <= nyquil;
  end

always @(coughsyrup)
  begin
      feedback_pt_154 = coughsyrup;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vicks <= 0;
    else if (notsure)
      vicks <= ariel;
    else if (jcrew)
      vicks <= 0;
  end

always @(vicks)
  begin
      feedback_pt_155 = vicks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      comtrex <= 0;
    else if (gnd)
      comtrex <= plaster;
    else if (gnd)
      comtrex <= 0;
  end

always @(comtrex)
  begin
      feedback_pt_156 = comtrex;
  end

always @(comtrex)
  begin
      feedback_pt_157 = comtrex;
  end

always @(comtrex)
  begin
      feedback_pt_158 = comtrex;
  end

always @(comtrex)
  begin
      feedback_pt_159 = comtrex;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aspirin <= 1;
    else
      aspirin <= abovenet;
  end

always @(aspirin)
  begin
      feedback_pt_160 = aspirin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      advil <= 1;
    else
      advil <= softball;
  end

always @(advil)
  begin
      feedback_pt_161 = advil;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      naproxen <= 0;
    else if (bach)
      naproxen <= vicks;
    else if (coffee)
      naproxen <= 0;
  end

always @(naproxen)
  begin
      feedback_pt_162 = naproxen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tylenol <= 0;
    else
      tylenol <= vcc;
  end

always @(tylenol)
  begin
      feedback_pt_163 = tylenol;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sinus <= 0;
    else if (bfi)
      sinus <= crack;
  end

always @(sinus)
  begin
      feedback_pt_164 = sinus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sinew <= 0;
    else
      sinew <= cornell;
  end

always @(sinew)
  begin
      feedback_pt_165 = sinew;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      snort <= 0;
    else
      snort <= vcc;
  end

always @(snort)
  begin
      feedback_pt_166 = snort;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pcp <= 0;
    else if (macys)
      pcp <= ebi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      phenyalanine <= 0;
    else if (whatelse)
      phenyalanine <= 0;
    else if (neptune)
      phenyalanine <= jcrew;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      saccarine <= 1;
    else
      saccarine <= plaster;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nutrasweet <= 0;
    else if (vcc)
      nutrasweet <= oldnavy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sugar <= 1;
    else
      sugar <= neptune;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      honey <= 0;
    else if (gnd)
      honey <= 0;
    else if (gnd)
      honey <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rose <= 0;
    else
      rose <= comtrex;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foliage <= 0;
    else if (bono)
      foliage <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      defoliant <= 1;
    else
      defoliant <= pcp;
  end

wire exfoliant_wire;

dffeas exfoliant_ff (
  .clk(clock0),
  .d(dinoblaster),
  .ena(crank),
  .sclr(gnd),
  .sload(sharperimg),
  .asdata(odin),
  .clrn(!reset0),
  .q(exfoliant_wire)
);

always @(exfoliant_wire) begin
   curious = exfoliant_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      george <= 0;
    else
      george <= bono;
  end

reg feedback_pt_167;

always @(att or feedback_pt_167)
  begin
      balloon =  att &  feedback_pt_167;
  end

reg feedback_pt_168;

always @(rodent or feedback_pt_168)
  begin
      robust =  rodent &  feedback_pt_168;
  end

reg feedback_pt_169;

always @(captain or feedback_pt_169)
  begin
      enoch = !captain &  feedback_pt_169;
  end

reg feedback_pt_170;

always @(sinew or feedback_pt_170)
  begin
      bobblehead = !sinew ^ !feedback_pt_170;
  end

reg feedback_pt_171;

always @(enoch or feedback_pt_171)
  begin
      cheez = !enoch | !feedback_pt_171;
  end

reg feedback_pt_172;

always @(robust or feedback_pt_172)
  begin
      zed = !robust | !feedback_pt_172;
  end

reg feedback_pt_173;

always @(robust or feedback_pt_173)
  begin
      zen = !robust | !feedback_pt_173;
  end

reg feedback_pt_174;

always @(pepsi or feedback_pt_174)
  begin
      falafel =  pepsi & !feedback_pt_174;
  end

reg feedback_pt_175;

always @(synthesis or feedback_pt_175)
  begin
      rodriguez =  synthesis &  feedback_pt_175;
  end

reg feedback_pt_176;

always @(bathbody or feedback_pt_176)
  begin
      dukdodger =  bathbody & !feedback_pt_176;
  end

reg feedback_pt_177;

always @(lsd or feedback_pt_177)
  begin
      ocha = !lsd ^  feedback_pt_177;
  end

reg feedback_pt_178;

always @(ants or feedback_pt_178)
  begin
      kaisha =  ants | !feedback_pt_178;
  end

reg feedback_pt_179;

always @(vcc or feedback_pt_179)
  begin
      hellokitty =  vcc ^  feedback_pt_179;
  end

reg feedback_pt_180;

always @(stemcell or feedback_pt_180)
  begin
      badtzmaru = !stemcell & !feedback_pt_180;
  end

reg feedback_pt_181;

always @(children or feedback_pt_181)
  begin
      sapporo = !children ^  feedback_pt_181;
  end

reg feedback_pt_182;

always @(att or feedback_pt_182)
  begin
      asahi = !att ^ !feedback_pt_182;
  end

reg feedback_pt_183;

always @(vcc or feedback_pt_183)
  begin
      hummer = !vcc &  feedback_pt_183;
  end

reg feedback_pt_184;

always @(vcc or feedback_pt_184)
  begin
      elian =  vcc &  feedback_pt_184;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      condit <= 0;
    else if (century)
      condit <= gnd;
    else if (vcc)
      condit <= 0;
  end

always @(condit)
  begin
      feedback_pt_167 = condit;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gopher <= 1;
    else
      gopher <= worstdesignever;
  end

always @(gopher)
  begin
      feedback_pt_168 = gopher;
  end

always @(gopher)
  begin
      feedback_pt_169 = gopher;
  end

always @(gopher)
  begin
      feedback_pt_170 = gopher;
  end

wire giraffe_wire;

dffeas giraffe_ff (
  .clk(clock0),
  .d(wrecker),
  .ena(covad),
  .sclr(sgates),
  .sload(bomb),
  .asdata(speed),
  .clrn(!reset0),
  .q(giraffe_wire)
);

always @(giraffe_wire) begin
   lotus = giraffe_wire;
end

always @(lotus)
  begin
      feedback_pt_171 = lotus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flyingmonkey <= 0;
    else if (defoliant)
      flyingmonkey <= decongestant;
    else if (gnd)
      flyingmonkey <= 0;
  end

always @(flyingmonkey)
  begin
      feedback_pt_172 = flyingmonkey;
  end

always @(flyingmonkey)
  begin
      feedback_pt_173 = flyingmonkey;
  end

always @(flyingmonkey)
  begin
      feedback_pt_174 = flyingmonkey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scotchtape <= 0;
    else
      scotchtape <= viagra;
  end

always @(scotchtape)
  begin
      feedback_pt_175 = scotchtape;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wicked <= 0;
    else
      wicked <= phenyalanine;
  end

always @(wicked)
  begin
      feedback_pt_176 = wicked;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      witch <= 0;
    else if (gnd)
      witch <= nutrasweet;
  end

always @(witch)
  begin
      feedback_pt_177 = witch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ghost <= 0;
    else if (chillis)
      ghost <= dimetap;
    else if (vcc)
      ghost <= 0;
  end

always @(ghost)
  begin
      feedback_pt_178 = ghost;
  end

wire goblin_wire;

dffea goblin_ff (
  .clk(clock0),
  .d(whiteboard),
  .ena(softball),
  .adata(vcc),
  .clrn(!reset0),
  .q(goblin_wire)
);

always @(goblin_wire) begin
   elf = goblin_wire;
end

always @(elf)
  begin
      feedback_pt_179 = elf;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      centaur <= 0;
    else if (falafel)
      centaur <= 0;
    else if (carolina)
      centaur <= gnd;
  end

always @(centaur)
  begin
      feedback_pt_180 = centaur;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      theseus <= 1;
    else
      theseus <= papyrus;
  end

always @(theseus)
  begin
      feedback_pt_181 = theseus;
  end

wire minotaur_wire;

dffeas minotaur_ff (
  .clk(clock0),
  .d(sortout),
  .ena(gnd),
  .sclr(hellokitty),
  .sload(arcade),
  .asdata(nutrasweet),
  .clrn(!reset0),
  .q(minotaur_wire)
);

always @(minotaur_wire) begin
   midas = minotaur_wire;
end

always @(midas)
  begin
      feedback_pt_182 = midas;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      icarus <= 0;
    else if (meth)
      icarus <= gnd;
  end

always @(icarus)
  begin
      feedback_pt_183 = icarus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pegasus <= 0;
    else if (liberace)
      pegasus <= vcc;
    else if (puttanesca)
      pegasus <= 0;
  end

always @(pegasus)
  begin
      feedback_pt_184 = pegasus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      troll <= 1;
    else
      troll <= viagra;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      warlock <= 0;
    else
      warlock <= oldnavy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chowmein <= 0;
    else
      chowmein <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stirfry <= 0;
    else
      stirfry <= ocha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tasty <= 1;
    else
      tasty <= starbucks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pastrami <= 0;
    else if (cheez)
      pastrami <= hellokitty;
    else if (meth)
      pastrami <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      turkey <= 0;
    else if (chillis)
      turkey <= 0;
    else if (ghost)
      turkey <= icarus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beast <= 0;
    else
      beast <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bacon <= 0;
    else if (nyquil)
      bacon <= speed;
    else if (abovenet)
      bacon <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salami <= 1;
    else
      salami <= pig;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peaves <= 0;
    else
      peaves <= tylenol;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      snape <= 0;
    else
      snape <= kaisha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hagrid <= 1;
    else
      hagrid <= lsd;
  end

// Random combinatorial logic block
always@(*)
  begin
      tonks = ( ~( ~( synthesis ) | ~( ( ~( ~( ( ~( ~school ^ beast ) ) ) | peaves ) ) ) ) );
  end

  always@(*)
  begin
    bumbledork = ~( ~( ~( ~( snape ) ) | ( ~( ~( ~lotus ) ^ ( ~balloon | theseus ) ) ) ) ) ? ~( ( ~( ~( nigiri ) ) ^ condit & wiggles ^ ~( gnd ) ) ) ^ ~( ~( ~( ~( meth ) ) ) ) : ( ~haze | ~( ~( ( ~( ~vcc ) & ( ~( ~structure ^ pomodoro ) ) ) ) ) );
  end
// State Mek moody Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moody <= moody_0;
    else
      case (moody)
        moody_0: begin
          if ({mars,tonks,arcade,midas} == 12)
            moody <= moody_2;
          else if ({mars,tonks,arcade,midas} == 6)
            moody <= moody_0;
          else if ({mars,tonks,arcade,midas} == 7)
            moody <= moody_9;
          else if ({mars,tonks,arcade,midas} == 2)
            moody <= moody_7;
          else
            moody <= moody_0;
          end
        moody_1: begin
          if ({mars,tonks,arcade,midas} == 5)
            moody <= moody_9;
          else if ({mars,tonks,arcade,midas} == 2)
            moody <= moody_3;
          else
            moody <= moody_1;
          end
        moody_2: begin
          if ({mars,tonks,arcade,midas} == 0)
            moody <= moody_9;
          else if ({mars,tonks,arcade,midas} == 2)
            moody <= moody_4;
          else if ({mars,tonks,arcade,midas} == 8)
            moody <= moody_4;
          else
            moody <= moody_2;
          end
        moody_3: begin
          if ({mars,tonks,arcade,midas} == 5)
            moody <= moody_9;
          else if ({mars,tonks,arcade,midas} == 1)
            moody <= moody_3;
          else
            moody <= moody_3;
          end
        moody_4: begin
          if ({mars,tonks,arcade,midas} == 5)
            moody <= moody_3;
          else if ({mars,tonks,arcade,midas} == 10)
            moody <= moody_8;
          else if ({mars,tonks,arcade,midas} == 12)
            moody <= moody_1;
          else if ({mars,tonks,arcade,midas} == 8)
            moody <= moody_5;
          else
            moody <= moody_4;
          end
        moody_5: begin
          if ({mars,tonks,arcade,midas} == 8)
            moody <= moody_0;
          else if ({mars,tonks,arcade,midas} == 9)
            moody <= moody_0;
          else
            moody <= moody_5;
          end
        moody_6: begin
            moody <= moody_6;
          end
        moody_7: begin
          if ({mars,tonks,arcade,midas} == 1)
            moody <= moody_4;
          else if ({mars,tonks,arcade,midas} == 7)
            moody <= moody_6;
          else if ({mars,tonks,arcade,midas} == 0)
            moody <= moody_7;
          else
            moody <= moody_7;
          end
        moody_8: begin
          if ({mars,tonks,arcade,midas} == 3)
            moody <= moody_5;
          else
            moody <= moody_8;
          end
        moody_9: begin
          if ({mars,tonks,arcade,midas} == 2)
            moody <= moody_1;
          else if ({mars,tonks,arcade,midas} == 12)
            moody <= moody_8;
          else if ({mars,tonks,arcade,midas} == 5)
            moody <= moody_9;
          else if ({mars,tonks,arcade,midas} == 0)
            moody <= moody_4;
          else if ({mars,tonks,arcade,midas} == 1)
            moody <= moody_0;
          else
            moody <= moody_9;
          end
        default: moody <= moody_0;
      endcase
  end

// State Mek moody Output logic
always @(moody)
  begin
    // consider all state regs when doing outputs
    case (moody)
        moody_0: begin
            madeye = 1;
            weasley = 1;
            floo = 1;
            powder = 1;
            broom = 0;
            stick = 0;
            quidditch = 0;
            phoenix = 1;
            arizona = 0;
            fang = 1;
            scabbers = 0;
          end
        moody_1: begin
            madeye = 0;
            weasley = 0;
            floo = 0;
            powder = 0;
            broom = 0;
            stick = 1;
            quidditch = 1;
            phoenix = 0;
            arizona = 0;
            fang = 0;
            scabbers = 1;
          end
        moody_2: begin
            madeye = 0;
            weasley = 0;
            floo = 1;
            powder = 0;
            broom = 0;
            stick = 0;
            quidditch = 1;
            phoenix = 0;
            arizona = 1;
            fang = 1;
            scabbers = 0;
          end
        moody_3: begin
            madeye = 1;
            weasley = 1;
            floo = 1;
            powder = 0;
            broom = 1;
            stick = 1;
            quidditch = 0;
            phoenix = 0;
            arizona = 1;
            fang = 0;
            scabbers = 0;
          end
        moody_4: begin
            madeye = 1;
            weasley = 0;
            floo = 1;
            powder = 1;
            broom = 1;
            stick = 1;
            quidditch = 0;
            phoenix = 1;
            arizona = 1;
            fang = 1;
            scabbers = 0;
          end
        moody_5: begin
            madeye = 1;
            weasley = 0;
            floo = 0;
            powder = 1;
            broom = 0;
            stick = 1;
            quidditch = 1;
            phoenix = 0;
            arizona = 1;
            fang = 0;
            scabbers = 1;
          end
        moody_6: begin
            madeye = 1;
            weasley = 1;
            floo = 0;
            powder = 0;
            broom = 0;
            stick = 1;
            quidditch = 1;
            phoenix = 1;
            arizona = 1;
            fang = 0;
            scabbers = 1;
          end
        moody_7: begin
            madeye = 1;
            weasley = 1;
            floo = 0;
            powder = 0;
            broom = 1;
            stick = 0;
            quidditch = 0;
            phoenix = 0;
            arizona = 0;
            fang = 0;
            scabbers = 0;
          end
        moody_8: begin
            madeye = 1;
            weasley = 1;
            floo = 0;
            powder = 1;
            broom = 1;
            stick = 0;
            quidditch = 0;
            phoenix = 0;
            arizona = 1;
            fang = 0;
            scabbers = 1;
          end
        moody_9: begin
            madeye = 0;
            weasley = 0;
            floo = 0;
            powder = 1;
            broom = 1;
            stick = 0;
            quidditch = 1;
            phoenix = 0;
            arizona = 1;
            fang = 1;
            scabbers = 1;
          end
        default: begin
            madeye = 0;
            weasley = 1;
            floo = 1;
            powder = 1;
            broom = 1;
            stick = 0;
            quidditch = 1;
            phoenix = 1;
            arizona = 0;
            fang = 1;
            scabbers = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire filch_out;
nut_003_lut #(3) nut_003_lut_inst_filch (
  .din({broom,asahi,dukdodger}),
  .mask(8'h92),
  .out(filch_out)
);

always @(filch_out)
begin
   umbridge = filch_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire chuck_out;
nut_003_lut #(1) nut_003_lut_inst_chuck (
  .din({phoenix}),
  .mask(2'b00),
  .out(chuck_out)
);

always @(chuck_out)
begin
   norris = chuck_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire black_out;
nut_003_lut #(6) nut_003_lut_inst_black (
  .din({jacuzzi,troll,vcc,vcc,rose,vcc}),
  .mask(64'h55e45d5ff5ce39f5),
  .out(black_out)
);

always @(black_out)
begin
   sirius = black_out;
end

// 4 bit modulus
always @(gnd or snort or vcc or gnd or salami or elian or marijuana or monster)
  begin
    if ({salami,elian,marijuana,monster} == 0)
       {lupin,severus,arthur,snake} = 0;
    else 
      {lupin,severus,arthur,snake} = 
	  	  {gnd,snort,vcc,gnd} % 
		  {salami,elian,marijuana,monster};
  end

// A + const
always @(vcc or bomb or downers or gnd or gnd or phenyalanine or marijuana or norris)
  begin
    {mundungus,army,crookshanks,trevor,neville,longbottom,bellatrix,lestrange,malfoy,draco} = {vcc,bomb,downers,gnd,gnd,phenyalanine,marijuana,norris} + 158;
  end

// AND all of these bits together
always @(handroll or vcc or meth or nirish or snape or snake or hellokitty or warlock)
  begin
      lucius = & {handroll,vcc,meth,nirish,snape,snake,hellokitty,warlock};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      narcissa <= 0;
    else
    case ({rodent,vcc})
       0 : narcissa <= witch;
       1 : narcissa <= narcissa;
       2 : narcissa <= avon;
       3 : narcissa <= longbottom;
       default : narcissa <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      albus <= 0;
    else
    case ({snake,crystal})
       0 : albus <= albus;
       1 : albus <= structure;
       2 : albus <= albus;
       3 : albus <= foliage;
       default : albus <= 0;
    endcase
  end

reg feedback_pt_185;

always @(gnd or feedback_pt_185)
  begin
      mcgonagall = !gnd |  feedback_pt_185;
  end

reg feedback_pt_186;

always @(gnd or feedback_pt_186)
  begin
      hogwarts =  gnd &  feedback_pt_186;
  end

reg feedback_pt_187;

always @(madeye or feedback_pt_187)
  begin
      rubeus = !madeye |  feedback_pt_187;
  end

reg feedback_pt_188;

always @(pegasus or feedback_pt_188)
  begin
      drumstrang =  pegasus & !feedback_pt_188;
  end

reg feedback_pt_189;

always @(umbridge or feedback_pt_189)
  begin
      norbert = !umbridge |  feedback_pt_189;
  end

reg feedback_pt_190;

always @(sirius or feedback_pt_190)
  begin
      wizard =  sirius &  feedback_pt_190;
  end

reg feedback_pt_191;

always @(wizard or feedback_pt_191)
  begin
      diagon = !wizard &  feedback_pt_191;
  end

reg feedback_pt_192;

always @(bono or feedback_pt_192)
  begin
      fireplace =  bono | !feedback_pt_192;
  end

reg feedback_pt_193;

always @(bobblehead or feedback_pt_193)
  begin
      crucio = !bobblehead |  feedback_pt_193;
  end

reg feedback_pt_194;

always @(narcissa or feedback_pt_194)
  begin
      kedavra =  narcissa ^  feedback_pt_194;
  end

reg feedback_pt_195;

always @(hummer or feedback_pt_195)
  begin
      mario_owes = !hummer |  feedback_pt_195;
  end

reg feedback_pt_196;

always @(stick or feedback_pt_196)
  begin
      gregg_a =  stick ^ !feedback_pt_196;
  end

reg feedback_pt_197;

always @(odin or feedback_pt_197)
  begin
      burrito = !odin & !feedback_pt_197;
  end

reg feedback_pt_198;

always @(peace or feedback_pt_198)
  begin
      correctness =  peace ^ !feedback_pt_198;
  end

reg feedback_pt_199;

always @(norbert or feedback_pt_199)
  begin
      cafe =  norbert | !feedback_pt_199;
  end

reg feedback_pt_200;

always @(quidditch or feedback_pt_200)
  begin
      synplicity_burrito = !quidditch |  feedback_pt_200;
  end

reg feedback_pt_201;

always @(bacon or feedback_pt_201)
  begin
      guacamole =  bacon ^ !feedback_pt_201;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sourcream <= 0;
    else
      sourcream <= fang;
  end

always @(sourcream)
  begin
      feedback_pt_185 = sourcream;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      onion <= 0;
    else if (marijuana)
      onion <= mideast;
    else if (vcc)
      onion <= 0;
  end

always @(onion)
  begin
      feedback_pt_186 = onion;
  end

always @(onion)
  begin
      feedback_pt_187 = onion;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jalapeno <= 0;
    else if (flyingmonkey)
      jalapeno <= 0;
    else if (mario_owes)
      jalapeno <= tyycensor;
  end

always @(jalapeno)
  begin
      feedback_pt_188 = jalapeno;
  end

always @(jalapeno)
  begin
      feedback_pt_189 = jalapeno;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beef <= 1;
    else
      beef <= vcc;
  end

always @(beef)
  begin
      feedback_pt_190 = beef;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pork <= 0;
    else
      pork <= trevor;
  end

always @(pork)
  begin
      feedback_pt_191 = pork;
  end

always @(pork)
  begin
      feedback_pt_192 = pork;
  end

always @(pork)
  begin
      feedback_pt_193 = pork;
  end

always @(pork)
  begin
      feedback_pt_194 = pork;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blackbeans <= 0;
    else
      blackbeans <= floo;
  end

always @(blackbeans)
  begin
      feedback_pt_195 = blackbeans;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      refriedbeans <= 1;
    else
      refriedbeans <= foliage;
  end

always @(refriedbeans)
  begin
      feedback_pt_196 = refriedbeans;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pintobeans <= 0;
    else
      pintobeans <= bumbledork;
  end

always @(pintobeans)
  begin
      feedback_pt_197 = pintobeans;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tortilla <= 0;
    else if (gnd)
      tortilla <= avon;
    else if (mundungus)
      tortilla <= 0;
  end

always @(tortilla)
  begin
      feedback_pt_198 = tortilla;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salsa <= 1;
    else
      salsa <= midas;
  end

always @(salsa)
  begin
      feedback_pt_199 = salsa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      picante <= 0;
    else if (saccarine)
      picante <= enoch;
    else if (vcc)
      picante <= 0;
  end

always @(picante)
  begin
      feedback_pt_200 = picante;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chips <= 0;
    else if (vcc)
      chips <= siamese;
    else if (tasty)
      chips <= 0;
  end

always @(chips)
  begin
      feedback_pt_201 = chips;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tabasco <= 1;
    else
      tabasco <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mexican <= 0;
    else if (lucius)
      mexican <= 0;
    else if (gap)
      mexican <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      too_big <= 0;
    else if (vcc)
      too_big <= rubeus;
    else if (chowmein)
      too_big <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      llamas_dont_eat_burrito <= 0;
    else if (nutrasweet)
      llamas_dont_eat_burrito <= pepsi;
    else if (foliage)
      llamas_dont_eat_burrito <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      director_of_llamas <= 1;
    else
      director_of_llamas <= fireplace;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fufu <= 1;
    else
      fufu <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      castaway <= 0;
    else if (infesting)
      castaway <= wiggles;
    else if (hogwarts)
      castaway <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      coconut <= 0;
    else if (army)
      coconut <= malfoy;
    else if (bellatrix)
      coconut <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      maryann <= 0;
    else if (salsa)
      maryann <= gnd;
    else if (tabasco)
      maryann <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gilligan <= 0;
    else if (marijuana)
      gilligan <= onion;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skipper <= 1;
    else
      skipper <= refriedbeans;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      professor <= 0;
    else if (gnd)
      professor <= 0;
    else if (sapporo)
      professor <= sgates;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moviestar <= 0;
    else
      moviestar <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ginger <= 0;
    else if (badtzmaru)
      ginger <= gopher;
    else if (honey)
      ginger <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jonas <= 0;
    else if (elf)
      jonas <= balloon;
  end

wire grumby_wire;

dffea grumby_ff (
  .clk(clock0),
  .d(tracy),
  .ena(vcc),
  .adata(hp),
  .clrn(!reset0),
  .q(grumby_wire)
);

always @(grumby_wire) begin
   minnow = grumby_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lost <= 0;
    else if (tyycensor)
      lost <= shark;
  end

// Triple add / sub bait
always @(tuna or nyquil or lafondue or lost or crucio or vcc or correctness or advil or uppers or curious or scabbers or fufu or mrbill or
         steaming or ford or aspirin or mexican or gregg_a or centaur or lafondue or weasley or subway or fieldhockey or microsoft or coughsyrup or vcc or
         fieldhockey or gnd or gnd or albus or vcc or mcgonagall or gnd or vcc or cafe or madeye or gnd or curious or vcc)
  begin
    {bfs,thurston,lovey,howell,hinkley,eunice,witchdoctor,voodoo,uncharted,reallyloud,hypnotized,ohthatcoconut,booming} = 
        {tuna,nyquil,lafondue,lost,crucio,vcc,correctness,advil,uppers,curious,scabbers,fufu,mrbill} -
        {steaming,ford,aspirin,mexican,gregg_a,centaur,lafondue,weasley,subway,fieldhockey,microsoft,coughsyrup,vcc} +
        {fieldhockey,gnd,gnd,albus,vcc,mcgonagall,gnd,vcc,cafe,madeye,gnd,curious,vcc};
  end

// 7 bit add sub
always @(vcc or gnd or gnd or witchdoctor or howell or gnd or hagrid or bellatrix or steaming or gilligan or vcc or vcc or gnd or children)
  begin
    {rarest,butterfly,palm,seashell,ohisee,whacky,rerun} = 
		{vcc,gnd,gnd,witchdoctor,howell,gnd,hagrid} - 
		{bellatrix,steaming,gilligan,vcc,vcc,gnd,children};
  end

// 2s comp negate A
always @(maki or jonas or cheez or george or thurston or vcc or gnd or gnd or beef or vcc)
  begin
    {fronds,hut,rescue,hawaii,wallstreet,levelization,huhhuh,uomcensor,wildboar} = - {maki,jonas,cheez,george,thurston,vcc,gnd,gnd,beef,vcc};
  end

// Bus inputs for MACing
reg  [19:0] lagoon_a;
reg signed [13:0] lagoon_b;
reg signed [19:0] lagoon_c;
reg signed [13:0] lagoon_d;
initial lagoon_a <= 0;
always @(posedge clock0) begin
  lagoon_a <= {vcc,beef,condit,ohthatcoconut,condit,director_of_llamas,tortilla,refriedbeans,elf,picante,vcc,vcc,guacamole,gnd,bobblehead,gnd,uomcensor,bono,sourcream,too_big};
end
initial lagoon_b <= 0;
always @(posedge clock0) begin
  lagoon_b <= {coconut,skipper,gilligan,acid,gnd,tabasco,gnd,robust,gnd,gnd,vcc,vcc,huhhuh,gnd};
end
initial lagoon_c <= 0;
always @(posedge clock0) begin
  lagoon_c <= {bellatrix,burrito,maki,hawaii,bellatrix,tracy,aspirin,pork,too_big,fieldhockey,vcc,jonas,director_of_llamas,llamas_dont_eat_burrito,lupin,ohisee,safeway,hypnotized,bfs,wildboar};
end
initial lagoon_d <= 0;
always @(posedge clock0) begin
  lagoon_d <= {arcade,reallyloud,kaisha,blackbeans,palm,arthur,hinkley,pomodoro,shark,minerva,vcc,vcc,monster,vcc};
end

// MAC inference bait
always @(lagoon_a or lagoon_b or lagoon_c or lagoon_d)
  begin
    {husks,escape,foiled,bamboo,desert,isle,pacific,ocean,waterfall,tan_nodes,loud,millionaire} = 
        (-lagoon_a *
        lagoon_b) +
        (~lagoon_c *
        -lagoon_d);
  end

reg feedback_pt_202;

always @(moviestar or feedback_pt_202)
  begin
      hiswife =  moviestar & !feedback_pt_202;
  end

reg feedback_pt_203;

always @(sears or feedback_pt_203)
  begin
      smack =  sears ^  feedback_pt_203;
  end

reg feedback_pt_204;

always @(turkey or feedback_pt_204)
  begin
      banshee = !turkey ^  feedback_pt_204;
  end

reg feedback_pt_205;

always @(army or feedback_pt_205)
  begin
      dillweed = !army ^ !feedback_pt_205;
  end

reg feedback_pt_206;

always @(castaway or feedback_pt_206)
  begin
      vimcensorc = !castaway &  feedback_pt_206;
  end

reg feedback_pt_207;

always @(tan_nodes or feedback_pt_207)
  begin
      tesla = !tan_nodes ^ !feedback_pt_207;
  end

reg feedback_pt_208;

always @(vcc or feedback_pt_208)
  begin
      killer = !vcc | !feedback_pt_208;
  end

reg feedback_pt_209;

always @(uncharted or feedback_pt_209)
  begin
      wonton =  uncharted &  feedback_pt_209;
  end

reg feedback_pt_210;

always @(foliage or feedback_pt_210)
  begin
      pierre =  foliage |  feedback_pt_210;
  end

reg feedback_pt_211;

always @(mitsubishi or feedback_pt_211)
  begin
      armand =  mitsubishi & !feedback_pt_211;
  end

reg feedback_pt_212;

always @(desert or feedback_pt_212)
  begin
      rufus = !desert &  feedback_pt_212;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      willy <= 0;
    else
      willy <= gnd;
  end

always @(willy)
  begin
      feedback_pt_202 = willy;
  end

wire gonzo_wire;

dffeas gonzo_ff (
  .clk(clock0),
  .d(army),
  .ena(vcc),
  .sclr(gnd),
  .sload(gnd),
  .asdata(naproxen),
  .clrn(!reset0),
  .q(gonzo_wire)
);

always @(gonzo_wire) begin
   gulp = gonzo_wire;
end

always @(gulp)
  begin
      feedback_pt_203 = gulp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bonafide <= 1;
    else
      bonafide <= fang;
  end

always @(bonafide)
  begin
      feedback_pt_204 = bonafide;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stroop <= 0;
    else
      stroop <= kedavra;
  end

always @(stroop)
  begin
      feedback_pt_205 = stroop;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      waffle <= 0;
    else if (tesla)
      waffle <= 0;
    else if (maryann)
      waffle <= pastrami;
  end

always @(waffle)
  begin
      feedback_pt_206 = waffle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wheezer <= 0;
    else if (vcc)
      wheezer <= 0;
    else if (eunice)
      wheezer <= vcc;
  end

always @(wheezer)
  begin
      feedback_pt_207 = wheezer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ozzy <= 0;
    else
      ozzy <= stick;
  end

always @(ozzy)
  begin
      feedback_pt_208 = ozzy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      priest <= 1;
    else
      priest <= jonas;
  end

always @(priest)
  begin
      feedback_pt_209 = priest;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rabbi <= 0;
    else if (ozzy)
      rabbi <= 0;
    else if (wiggles)
      rabbi <= ozzy;
  end

always @(rabbi)
  begin
      feedback_pt_210 = rabbi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wancensorcens <= 0;
    else if (gnd)
      wancensorcens <= yohimbe;
  end

always @(wancensorcens)
  begin
      feedback_pt_211 = wancensorcens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      xbncensorcens <= 0;
    else
      xbncensorcens <= rarest;
  end

always @(xbncensorcens)
  begin
      feedback_pt_212 = xbncensorcens;
  end

wire tapered_wire;

dffeas tapered_ff (
  .clk(clock0),
  .d(stirfry),
  .ena(vcc),
  .sclr(vcc),
  .sload(gnd),
  .asdata(draco),
  .clrn(!reset0),
  .q(tapered_wire)
);

always @(tapered_wire) begin
   spastic = tapered_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lad <= 1;
    else
      lad <= wancensorcens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mao <= 0;
    else if (chips)
      mao <= kaisha;
    else if (bono)
      mao <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zedong <= 1;
    else
      zedong <= millionaire;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deng <= 0;
    else
      deng <= avon;
  end

wire xiaoping_wire;

dffea xiaoping_ff (
  .clk(clock0),
  .d(liberation),
  .ena(puttanesca),
  .adata(husks),
  .clrn(!reset0),
  .q(xiaoping_wire)
);

always @(xiaoping_wire) begin
   jinyong = xiaoping_wire;
end

wire lao_wire;

dffeas lao_ff (
  .clk(clock0),
  .d(vcc),
  .ena(lafondue),
  .sclr(golden),
  .sload(bonafide),
  .asdata(loud),
  .clrn(!reset0),
  .q(lao_wire)
);

always @(lao_wire) begin
   zi = lao_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zhuang <= 0;
    else if (rerun)
      zhuang <= llamas_dont_eat_burrito;
    else if (vcc)
      zhuang <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wujing <= 0;
    else
      wujing <= gulp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wukong <= 0;
    else if (gnd)
      wukong <= arizona;
    else if (gnd)
      wukong <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      helena <= 1;
    else
      helena <= synplicity_burrito;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gerrit <= 0;
    else
      gerrit <= isle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      willem <= 1;
    else
      willem <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dirk <= 0;
    else if (waterfall)
      dirk <= wukong;
    else if (rescue)
      dirk <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      klaas <= 0;
    else if (voodoo)
      klaas <= 0;
    else if (marijuana)
      klaas <= neville;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bep <= 0;
    else
      bep <= wicked;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hans <= 0;
    else
      hans <= loud;
  end

wire gerard_wire;

dffea gerard_ff (
  .clk(clock0),
  .d(bonafide),
  .ena(narcissa),
  .adata(gnd),
  .clrn(!reset0),
  .q(gerard_wire)
);

always @(gerard_wire) begin
   leeuwenhoek = gerard_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      microscope <= 0;
    else
      microscope <= vcc;
  end

wire erasmus_wire;

dffeas erasmus_ff (
  .clk(clock0),
  .d(pintobeans),
  .ena(gnd),
  .sclr(liberation),
  .sload(moviestar),
  .asdata(hagrid),
  .clrn(!reset0),
  .q(erasmus_wire)
);

always @(erasmus_wire) begin
   deruyter = erasmus_wire;
end

  always@(*)
  begin
    vangoh = ~( ~( ~( ( ~( neville | powder ) ) & ~( helena ) ) ) ) ? ~( ~( ( ~( ~voodoo | ~( ~dirk | ~ford ) ) ) ) ) : ~( ~( ~( ~( ( ~( ~vcc ^ seashell ) ) ) ) ) );
  end
// State Mek fortuyn Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fortuyn <= fortuyn_0;
    else
      case (fortuyn)
        fortuyn_0: begin
          if ({willy,gnd,gnd,vcc} == 3)
            fortuyn <= fortuyn_0;
          else if ({willy,gnd,gnd,vcc} == 12)
            fortuyn <= fortuyn_4;
          else
            fortuyn <= fortuyn_0;
          end
        fortuyn_1: begin
          if ({willy,gnd,gnd,vcc} == 9)
            fortuyn <= fortuyn_4;
          else if ({willy,gnd,gnd,vcc} == 8)
            fortuyn <= fortuyn_5;
          else if ({willy,gnd,gnd,vcc} == 4)
            fortuyn <= fortuyn_0;
          else
            fortuyn <= fortuyn_1;
          end
        fortuyn_2: begin
          if ({willy,gnd,gnd,vcc} == 4)
            fortuyn <= fortuyn_5;
          else if ({willy,gnd,gnd,vcc} == 13)
            fortuyn <= fortuyn_6;
          else if ({willy,gnd,gnd,vcc} == 10)
            fortuyn <= fortuyn_5;
          else if ({willy,gnd,gnd,vcc} == 15)
            fortuyn <= fortuyn_2;
          else
            fortuyn <= fortuyn_2;
          end
        fortuyn_3: begin
          if ({willy,gnd,gnd,vcc} == 2)
            fortuyn <= fortuyn_5;
          else
            fortuyn <= fortuyn_3;
          end
        fortuyn_4: begin
          if ({willy,gnd,gnd,vcc} == 9)
            fortuyn <= fortuyn_6;
          else if ({willy,gnd,gnd,vcc} == 14)
            fortuyn <= fortuyn_7;
          else if ({willy,gnd,gnd,vcc} == 2)
            fortuyn <= fortuyn_6;
          else
            fortuyn <= fortuyn_4;
          end
        fortuyn_5: begin
          if ({willy,gnd,gnd,vcc} == 13)
            fortuyn <= fortuyn_5;
          else
            fortuyn <= fortuyn_5;
          end
        fortuyn_6: begin
          if ({willy,gnd,gnd,vcc} == 1)
            fortuyn <= fortuyn_6;
          else if ({willy,gnd,gnd,vcc} == 9)
            fortuyn <= fortuyn_2;
          else if ({willy,gnd,gnd,vcc} == 12)
            fortuyn <= fortuyn_5;
          else if ({willy,gnd,gnd,vcc} == 5)
            fortuyn <= fortuyn_1;
          else if ({willy,gnd,gnd,vcc} == 15)
            fortuyn <= fortuyn_5;
          else if ({willy,gnd,gnd,vcc} == 14)
            fortuyn <= fortuyn_3;
          else
            fortuyn <= fortuyn_6;
          end
        fortuyn_7: begin
          if ({willy,gnd,gnd,vcc} == 9)
            fortuyn <= fortuyn_3;
          else
            fortuyn <= fortuyn_7;
          end
        default: fortuyn <= fortuyn_0;
      endcase
  end

// State Mek fortuyn Output logic
always @(fortuyn)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (fortuyn[3:1])
        fortuyn_0: begin
            oranje = 0;
            schwinger = 0;
            feynman = 0;
            plague = 0;
            automounter = 0;
            boing = 1;
            ykocens = 1;
            pixie = 1;
            stix = 0;
            georgec = 0;
            tango_loud = 0;
            cluckU_fuji = 0;
            criminal_newt = 0;
            sun_milhouse = 1;
            condit_yak = 0;
            bomb_yak = 0;
          end
        fortuyn_1: begin
            oranje = 1;
            schwinger = 0;
            feynman = 0;
            plague = 0;
            automounter = 1;
            boing = 0;
            ykocens = 0;
            pixie = 0;
            stix = 0;
            georgec = 1;
            tango_loud = 0;
            cluckU_fuji = 1;
            criminal_newt = 1;
            sun_milhouse = 0;
            condit_yak = 1;
            bomb_yak = 0;
          end
        fortuyn_2: begin
            oranje = 0;
            schwinger = 1;
            feynman = 0;
            plague = 0;
            automounter = 0;
            boing = 0;
            ykocens = 0;
            pixie = 1;
            stix = 0;
            georgec = 1;
            tango_loud = 1;
            cluckU_fuji = 0;
            criminal_newt = 1;
            sun_milhouse = 0;
            condit_yak = 1;
            bomb_yak = 0;
          end
        fortuyn_3: begin
            oranje = 0;
            schwinger = 0;
            feynman = 0;
            plague = 1;
            automounter = 0;
            boing = 0;
            ykocens = 0;
            pixie = 0;
            stix = 0;
            georgec = 0;
            tango_loud = 0;
            cluckU_fuji = 1;
            criminal_newt = 1;
            sun_milhouse = 0;
            condit_yak = 1;
            bomb_yak = 1;
          end
        default: begin
            oranje = 0;
            schwinger = 1;
            feynman = 1;
            plague = 0;
            automounter = 1;
            boing = 0;
            ykocens = 1;
            pixie = 0;
            stix = 1;
            georgec = 1;
            tango_loud = 1;
            cluckU_fuji = 1;
            criminal_newt = 1;
            sun_milhouse = 0;
            condit_yak = 1;
            bomb_yak = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire sand_baron_out;
nut_003_lut #(6) nut_003_lut_inst_sand_baron (
  .din({feynman,vcc,vcc,klaas,whacky,gnd}),
  .mask(64'b0110010000110010000010001001010001100100101000000000001001000011),
  .out(sand_baron_out)
);

always @(sand_baron_out)
begin
   romex_dingbat = sand_baron_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire protest_bfs_out;
nut_003_lut #(3) nut_003_lut_inst_protest_bfs (
  .din({vcc,mitsubishi,gnd}),
  .mask(8'h5e),
  .out(protest_bfs_out)
);

always @(protest_bfs_out)
begin
   nyc_rubeus = protest_bfs_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire cain_jupiter_out;
nut_003_lut #(3) nut_003_lut_inst_cain_jupiter (
  .din({bomb_yak,vcc,tabasco}),
  .mask(8'b10100010),
  .out(cain_jupiter_out)
);

always @(cain_jupiter_out)
begin
   danger_star = cain_jupiter_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire kang_usa_out;
nut_003_lut #(5) nut_003_lut_inst_kang_usa (
  .din({foiled,foliage,gnd,microscope,wicked}),
  .mask(32'b00000000000000000001000000000000),
  .out(kang_usa_out)
);

always @(kang_usa_out)
begin
   peace_boots = kang_usa_out;
end


initial begin
    {tango_saturn,desade_touch} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({blackbeans,drumstrang} < {gnd,avon})
       {tango_saturn,desade_touch} <= {gnd,avon};
    else
       {tango_saturn,desade_touch} <= {blackbeans,drumstrang};
  end

// 4 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {bust_doobie,salmon_mickey,atilla_sheep,gin_kdqcens} <= 0;
    else if (jinyong)
      {bust_doobie,salmon_mickey,atilla_sheep,gin_kdqcens} <= {bust_doobie,salmon_mickey,atilla_sheep,gin_kdqcens} + 1;
    else
      {bust_doobie,salmon_mickey,atilla_sheep,gin_kdqcens} <= {bust_doobie,salmon_mickey,atilla_sheep,gin_kdqcens} - 1;
  end

// XOR all of these bits together
always @(schwinger or seashell or banshee or vcc)
  begin
      atchoo_deng = ^ {schwinger,seashell,banshee,vcc};
  end

always @(gnd or romex_dingbat or children or microscope or gnd or 
   gnd or romex_dingbat or children or microscope or scotchtape or 
   bomb_yak
)
  begin
    if (bomb_yak)
    begin
      case ({{gnd,romex_dingbat,children,microscope},gnd})
        0: salsa_hulk=0;
        1: salsa_hulk=1;
        2: salsa_hulk=0;
        3: salsa_hulk=0;
        4: salsa_hulk=0;
        5: salsa_hulk=1;
        6: salsa_hulk=0;
        7: salsa_hulk=0;
        8: salsa_hulk=1;
        9: salsa_hulk=1;
        10: salsa_hulk=1;
        11: salsa_hulk=0;
        12: salsa_hulk=0;
        13: salsa_hulk=1;
        14: salsa_hulk=0;
        15: salsa_hulk=0;
        16: salsa_hulk=1;
        17: salsa_hulk=1;
        18: salsa_hulk=1;
        19: salsa_hulk=0;
        20: salsa_hulk=0;
        21: salsa_hulk=1;
        22: salsa_hulk=1;
        23: salsa_hulk=0;
        24: salsa_hulk=1;
        25: salsa_hulk=0;
        26: salsa_hulk=1;
        27: salsa_hulk=1;
        28: salsa_hulk=0;
        29: salsa_hulk=1;
        30: salsa_hulk=0;
        31: salsa_hulk=0;
      default: salsa_hulk=0;
      endcase
    end
    else
    begin
      case ({{gnd,romex_dingbat,children,microscope},scotchtape})
        0: salsa_hulk=1;
        1: salsa_hulk=0;
        2: salsa_hulk=0;
        3: salsa_hulk=1;
        4: salsa_hulk=1;
        5: salsa_hulk=0;
        6: salsa_hulk=0;
        7: salsa_hulk=0;
        8: salsa_hulk=1;
        9: salsa_hulk=1;
        10: salsa_hulk=1;
        11: salsa_hulk=1;
        12: salsa_hulk=1;
        13: salsa_hulk=1;
        14: salsa_hulk=0;
        15: salsa_hulk=1;
        16: salsa_hulk=1;
        17: salsa_hulk=0;
        18: salsa_hulk=0;
        19: salsa_hulk=0;
        20: salsa_hulk=1;
        21: salsa_hulk=1;
        22: salsa_hulk=0;
        23: salsa_hulk=1;
        24: salsa_hulk=1;
        25: salsa_hulk=1;
        26: salsa_hulk=0;
        27: salsa_hulk=1;
        28: salsa_hulk=0;
        29: salsa_hulk=0;
        30: salsa_hulk=1;
        31: salsa_hulk=1;
      default: salsa_hulk=0;
      endcase
    end
  end

// OR all of these bits together
always @(gnd or zi or director_of_llamas or tasty)
  begin
      zulu_hagrid = | {gnd,zi,director_of_llamas,tasty};
  end

reg feedback_pt_213;

always @(wonton or feedback_pt_213)
  begin
      winner_bambi = !wonton |  feedback_pt_213;
  end

reg feedback_pt_214;

always @(pierre or feedback_pt_214)
  begin
      weevil_tako =  pierre |  feedback_pt_214;
  end

reg feedback_pt_215;

always @(hut or feedback_pt_215)
  begin
      elguapo_marco =  hut ^ !feedback_pt_215;
  end

reg feedback_pt_216;

always @(mundungus or feedback_pt_216)
  begin
      china_ham =  mundungus ^  feedback_pt_216;
  end

reg feedback_pt_217;

always @(plague or feedback_pt_217)
  begin
      cheese_tobiko =  plague ^  feedback_pt_217;
  end

reg feedback_pt_218;

always @(vcc or feedback_pt_218)
  begin
      weevil_prison =  vcc ^ !feedback_pt_218;
  end

reg feedback_pt_219;

always @(liberation or feedback_pt_219)
  begin
      pork_eel =  liberation | !feedback_pt_219;
  end

reg feedback_pt_220;

always @(wancensorcens or feedback_pt_220)
  begin
      barnum_fufu =  wancensorcens ^  feedback_pt_220;
  end

reg feedback_pt_221;

always @(winner_bambi or feedback_pt_221)
  begin
      thedon_goofy = !winner_bambi ^ !feedback_pt_221;
  end

reg feedback_pt_222;

always @(golden or feedback_pt_222)
  begin
      Iwin_odin = !golden & !feedback_pt_222;
  end

reg feedback_pt_223;

always @(priest or feedback_pt_223)
  begin
      skinner_ohno = !priest |  feedback_pt_223;
  end

reg feedback_pt_224;

always @(xbncensorcens or feedback_pt_224)
  begin
      jiminy_fear = !xbncensorcens ^ !feedback_pt_224;
  end

reg feedback_pt_225;

always @(danger_star or feedback_pt_225)
  begin
      boots_sanity = !danger_star |  feedback_pt_225;
  end

reg feedback_pt_226;

always @(pastrami or feedback_pt_226)
  begin
      jupiter_ceres =  pastrami | !feedback_pt_226;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      east_zealot <= 0;
    else if (levelization)
      east_zealot <= gnd;
  end

always @(east_zealot)
  begin
      feedback_pt_213 = east_zealot;
  end

always @(east_zealot)
  begin
      feedback_pt_214 = east_zealot;
  end

always @(east_zealot)
  begin
      feedback_pt_215 = east_zealot;
  end

always @(east_zealot)
  begin
      feedback_pt_216 = east_zealot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yankee_huey <= 0;
    else if (hans)
      yankee_huey <= 0;
    else if (levelization)
      yankee_huey <= gnd;
  end

always @(yankee_huey)
  begin
      feedback_pt_217 = yankee_huey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stoner_zed <= 0;
    else
      stoner_zed <= gnd;
  end

always @(stoner_zed)
  begin
      feedback_pt_218 = stoner_zed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aphid_bullet <= 0;
    else
      aphid_bullet <= hiswife;
  end

always @(aphid_bullet)
  begin
      feedback_pt_219 = aphid_bullet;
  end

wire bach_onion_wire;

dffeas bach_onion_ff (
  .clk(clock0),
  .d(vcc),
  .ena(pacific),
  .sclr(professor),
  .sload(husks),
  .asdata(jupiter_ceres),
  .clrn(!reset0),
  .q(bach_onion_wire)
);

always @(bach_onion_wire) begin
   chuck_golf = bach_onion_wire;
end

always @(chuck_golf)
  begin
      feedback_pt_220 = chuck_golf;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hurt_saturn <= 0;
    else if (gnd)
      hurt_saturn <= butterfly;
    else if (bep)
      hurt_saturn <= 0;
  end

always @(hurt_saturn)
  begin
      feedback_pt_221 = hurt_saturn;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foxtrot_ring <= 0;
    else if (gnd)
      foxtrot_ring <= 0;
    else if (vcc)
      foxtrot_ring <= gnd;
  end

always @(foxtrot_ring)
  begin
      feedback_pt_222 = foxtrot_ring;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      red_barty <= 0;
    else if (smack)
      red_barty <= condit_yak;
    else if (east_zealot)
      red_barty <= 0;
  end

always @(red_barty)
  begin
      feedback_pt_223 = red_barty;
  end

wire nyc_foliage_wire;

dffeas nyc_foliage_ff (
  .clk(clock0),
  .d(rufus),
  .ena(killer),
  .sclr(crookshanks),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset0),
  .q(nyc_foliage_wire)
);

always @(nyc_foliage_wire) begin
   pluto_exodus = nyc_foliage_wire;
end

always @(pluto_exodus)
  begin
      feedback_pt_224 = pluto_exodus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shark_avon <= 0;
    else if (china_ham)
      shark_avon <= vcc;
    else if (willy)
      shark_avon <= 0;
  end

always @(shark_avon)
  begin
      feedback_pt_225 = shark_avon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marge_killme <= 0;
    else if (tesla)
      marge_killme <= barnum_fufu;
    else if (hypnotized)
      marge_killme <= 0;
  end

always @(marge_killme)
  begin
      feedback_pt_226 = marge_killme;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ostrich_gap <= 0;
    else if (wheezer)
      ostrich_gap <= 0;
    else if (wheezer)
      ostrich_gap <= jalapeno;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      helena_sinus <= 0;
    else if (atilla_sheep)
      helena_sinus <= 0;
    else if (weevil_tako)
      helena_sinus <= xbncensorcens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cluckU_klaas <= 0;
    else if (gnd)
      cluckU_klaas <= bust_doobie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pizza_popacap <= 0;
    else if (peace_boots)
      pizza_popacap <= 0;
    else if (red_barty)
      pizza_popacap <= jiminy_fear;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      odin_hotdog <= 0;
    else if (wiggles)
      odin_hotdog <= bamboo;
    else if (dillweed)
      odin_hotdog <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goblin_romex <= 0;
    else if (deng)
      goblin_romex <= 0;
    else if (jupiter_ceres)
      goblin_romex <= atchoo_deng;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iguana_bullet <= 0;
    else if (vcc)
      iguana_bullet <= 0;
    else if (aphid_bullet)
      iguana_bullet <= boing;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tofu_leidiot <= 0;
    else if (hurt_saturn)
      tofu_leidiot <= 0;
    else if (tango_loud)
      tofu_leidiot <= ohisee;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      turnip_doobie <= 1;
    else
      turnip_doobie <= amex;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ibm_chief <= 0;
    else if (gnd)
      ibm_chief <= 0;
    else if (atilla_sheep)
      ibm_chief <= millionaire;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      south_norbert <= 0;
    else if (vcc)
      south_norbert <= 0;
    else if (crookshanks)
      south_norbert <= desade_touch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gerrit_gyro <= 0;
    else
      gerrit_gyro <= danger_star;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hans_kungfu <= 0;
    else if (willem)
      hans_kungfu <= bomb;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floo_xray <= 0;
    else if (vcc)
      floo_xray <= gnd;
    else if (atilla_sheep)
      floo_xray <= 0;
  end

// AND all of these bits together
always @(stix or millionaire or bomb)
  begin
      solder_troll = & {stix,millionaire,bomb};
  end

// 5 bit SOP selector
always @(
        zulu_hagrid or zedong  or 
        nyc_rubeus or millionaire  or 
        vcc or pizza_popacap  or 
        helena_sinus or vcc  or 
        pacific or stoner_zed 
)

begin
    pyro_kmfdm = 
      zulu_hagrid & zedong |
      nyc_rubeus & millionaire |
      vcc & pizza_popacap |
      helena_sinus & vcc |
      pacific & stoner_zed;
end

// 5 bit SOP selector
always @(
        gnd or hans_kungfu  or 
        vcc or mao  or 
        vcc or vcc  or 
        malfoy or gin_kdqcens  or 
        puttanesca or leeuwenhoek 
)

begin
    copper_beef = 
      gnd & hans_kungfu |
      vcc & mao |
      vcc & vcc |
      malfoy & gin_kdqcens |
      puttanesca & leeuwenhoek;
end

// 5 bit SOP selector
always @(
        liberation or cheese_tobiko  or 
        pyro_kmfdm or turnip_doobie  or 
        waffle or ostrich_gap  or 
        tofu_leidiot or ykocens  or 
        pixie or deruyter 
)

begin
    stoner_saturn = 
      liberation & cheese_tobiko |
      pyro_kmfdm & turnip_doobie |
      waffle & ostrich_gap |
      tofu_leidiot & ykocens |
      pixie & deruyter;
end

// NAND all of these bits together
always @(sun_milhouse or salsa_hulk or Iwin_odin or cluckU_klaas or chuck_golf or vcc)
  begin
      maki_hp = ~& {sun_milhouse,salsa_hulk,Iwin_odin,cluckU_klaas,chuck_golf,vcc};
  end


// building a 128 to 1 MUX operator
reg [127:0] advil_rose_mux_dat;
reg [6:0] advil_rose_mux_sel;
always @(peace_boots or waffle or pyro_kmfdm or solder_troll or ostrich_gap or south_norbert or stoner_saturn or wukong or gerrit_gyro or lupin or vcc or vcc or vangoh or vcc or escape or illegal or gnd or odin_hotdog or vcc or escape or lupin or georgec or foxtrot_ring or china_ham or waffle or cheese_tobiko or gnd or weevil_prison or cluckU_klaas or wujing or floo_xray or stroop or booming or yankee_huey or criminal_newt or vcc or diagon or hiswife or millionaire or booming or gnd or ykocens or vcc or synplicity_burrito or albus or hans or gnd or oranje or vcc or cluckU_fuji or albus or pyro_kmfdm or vimcensorc or vcc or goblin_romex or automounter or spastic or minnow or booming or children or solder_troll or fronds or illegal or marge_killme or criminal_newt or vimcensorc or yohimbe or gnd or zedong or gnd or vcc or scotchtape or director_of_llamas or Iwin_odin or elguapo_marco or lovey or salmon_mickey or atilla_sheep or odin_hotdog or illegal or goblin_romex or vcc or desert or gnd or willem or vcc or condit_yak or gnd or gnd or pastrami or skinner_ohno or pizza_popacap or rabbi or ibm_chief or salmon_mickey or zulu_hagrid or booming or butterfly or jupiter_ceres or scotchtape or thedon_goofy or gerrit or gnd or Iwin_odin or gnd or puttanesca or vcc or bamboo or minnow or zulu_hagrid or weevil_prison or pintobeans or maki_hp or butterfly or china_ham or jupiter_ceres or tesla or pluto_exodus or vcc or killer or vcc or ginger or gap or vcc or iguana_bullet or gerrit or illegal or microscope)
  begin
    advil_rose_mux_dat = {peace_boots,waffle,pyro_kmfdm,solder_troll,ostrich_gap,south_norbert,stoner_saturn,wukong,gerrit_gyro,lupin,vcc,vcc,vangoh,vcc,escape,illegal,gnd,odin_hotdog,vcc,escape,lupin,georgec,foxtrot_ring,china_ham,waffle,cheese_tobiko,gnd,weevil_prison,cluckU_klaas,wujing,floo_xray,stroop,booming,yankee_huey,criminal_newt,vcc,diagon,hiswife,millionaire,booming,gnd,ykocens,vcc,synplicity_burrito,albus,hans,gnd,oranje,vcc,cluckU_fuji,albus,pyro_kmfdm,vimcensorc,vcc,goblin_romex,automounter,spastic,minnow,booming,children,solder_troll,fronds,illegal,marge_killme,criminal_newt,vimcensorc,yohimbe,gnd,zedong,gnd,vcc,scotchtape,director_of_llamas,Iwin_odin,elguapo_marco,lovey,salmon_mickey,atilla_sheep,odin_hotdog,illegal,goblin_romex,vcc,desert,gnd,willem,vcc,condit_yak,gnd,gnd,pastrami,skinner_ohno,pizza_popacap,rabbi,ibm_chief,salmon_mickey,zulu_hagrid,booming,butterfly,jupiter_ceres,scotchtape,thedon_goofy,gerrit,gnd,Iwin_odin,gnd,puttanesca,vcc,bamboo,minnow,zulu_hagrid,weevil_prison,pintobeans,maki_hp,butterfly,china_ham,jupiter_ceres,tesla,pluto_exodus,vcc,killer,vcc,ginger,gap,vcc,iguana_bullet,gerrit,illegal,microscope};
  end

always @(iguana_bullet or gnd or tango_saturn or ykocens or boots_sanity or lad or vcc)
  begin
    advil_rose_mux_sel = {iguana_bullet,gnd,tango_saturn,ykocens,boots_sanity,lad,vcc};
  end

always @(advil_rose_mux_dat or advil_rose_mux_sel)
  begin
    spirit_shuda = advil_rose_mux_dat[advil_rose_mux_sel];
  end

reg feedback_pt_227;

always @(thedon_goofy or feedback_pt_227)
  begin
      ohisee_malfoy =  thedon_goofy ^  feedback_pt_227;
  end

reg feedback_pt_228;

always @(pastrami or feedback_pt_228)
  begin
      moody_opus =  pastrami ^ !feedback_pt_228;
  end

reg feedback_pt_229;

always @(vcc or feedback_pt_229)
  begin
      army_cafe = !vcc &  feedback_pt_229;
  end

reg feedback_pt_230;

always @(diagon or feedback_pt_230)
  begin
      whale_ocha = !diagon & !feedback_pt_230;
  end

reg feedback_pt_231;

always @(moody_opus or feedback_pt_231)
  begin
      curie_yankee =  moody_opus ^  feedback_pt_231;
  end

reg feedback_pt_232;

always @(vcc or feedback_pt_232)
  begin
      chillis_avon = !vcc &  feedback_pt_232;
  end

reg feedback_pt_233;

always @(vcc or feedback_pt_233)
  begin
      escape_fish =  vcc ^  feedback_pt_233;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rojas_bull <= 0;
    else if (moody_opus)
      rojas_bull <= helena_sinus;
    else if (jupiter_ceres)
      rojas_bull <= 0;
  end

always @(rojas_bull)
  begin
      feedback_pt_227 = rojas_bull;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sleeping_art <= 1;
    else
      sleeping_art <= whale_ocha;
  end

always @(sleeping_art)
  begin
      feedback_pt_228 = sleeping_art;
  end

wire wonton_tonic_wire;

dffeas wonton_tonic_ff (
  .clk(clock0),
  .d(jonas),
  .ena(gap),
  .sclr(gnd),
  .sload(vcc),
  .asdata(army_cafe),
  .clrn(!reset0),
  .q(wonton_tonic_wire)
);

always @(wonton_tonic_wire) begin
   hoser_holland = wonton_tonic_wire;
end

always @(hoser_holland)
  begin
      feedback_pt_229 = hoser_holland;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      leaky_sanity <= 0;
    else if (diagon)
      leaky_sanity <= yankee_huey;
  end

always @(leaky_sanity)
  begin
      feedback_pt_230 = leaky_sanity;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ramone_black <= 0;
    else
      ramone_black <= escape_fish;
  end

always @(ramone_black)
  begin
      feedback_pt_231 = ramone_black;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      intuit_voodoo <= 1;
    else
      intuit_voodoo <= fronds;
  end

always @(intuit_voodoo)
  begin
      feedback_pt_232 = intuit_voodoo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spain_stix <= 0;
    else if (ohisee_malfoy)
      spain_stix <= pork_eel;
  end

always @(spain_stix)
  begin
      feedback_pt_233 = spain_stix;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oscar_tobiko <= 0;
    else
      oscar_tobiko <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deng_tinker <= 0;
    else if (oscar_tobiko)
      deng_tinker <= butterfly;
  end

wire shemp_floride_wire;

dffeas shemp_floride_ff (
  .clk(clock0),
  .d(zulu_hagrid),
  .ena(gnd),
  .sclr(tesla),
  .sload(ginger),
  .asdata(rufus),
  .clrn(!reset0),
  .q(shemp_floride_wire)
);

always @(shemp_floride_wire) begin
   crack_donald = shemp_floride_wire;
end

// Random combinatorial logic block
always@(*)
  begin
      bathroom_elf = ( ~( ~( ~escape_fish ) & ~( ( ~( ramone_black | ~danger_star ) ) & ~( hans_kungfu ) ) | ~( zulu_hagrid | ~( curie_yankee ) ) ) );
  end

  always@(*)
  begin
    troll_lemon = ( moody_opus | ~( ~( ~( ( ~( microscope & oranje ) ) ) ) ) ) ? ~( ~( army_cafe | illegal ) ^ ~( oranje ) ) ^ ~illegal | ~( ~army_cafe | crack_donald ) & ~( ~diagon | ~moody_opus ) | ~( ~microscope ) : ( ( ~( ( ~( diagon ^ ~vcc ) ) & ( ~( vcc & spirit_shuda ) ) ) ) | ~pork_eel | helena_sinus | ( ~( puttanesca ^ ~gnd ) ) ^ ~( ~( ~vcc | weevil_prison ) ) ) & ~( ~( ~yankee_huey ^ curie_yankee ) ) | ( ( ~( vcc & ( ~fronds ^ ~albus ) ) ) | ( ~( ~( ~pork_eel ) ^ intuit_voodoo & chillis_avon ) ) );
  end
// Triple add / sub bait
always @(copper_beef or killer or pastrami or leaky_sanity or spirit_shuda or gnd or wukong or gnd or butterfly or gnd or maki_hp or
         spirit_shuda or copper_beef or ginger or wukong or fronds or bamboo or bamboo or gnd or killer or chillis_avon or vcc or
         escape_fish or puttanesca or vcc or diagon or copper_beef or pork_eel or vcc or spain_stix or gnd or pork_eel or vcc)
  begin
    {goblin_bear,parrot_eeevil,quebec_webvan,lsd_turnip,bach_maryann,danger_pig,lotus_sgates,pimpernel_moe,dopey_tattoo,ready_tiger,rasp_stoned} = 
        {copper_beef,killer,pastrami,leaky_sanity,spirit_shuda,gnd,wukong,gnd,butterfly,gnd,maki_hp} +
        {spirit_shuda,copper_beef,ginger,wukong,fronds,bamboo,bamboo,gnd,killer,chillis_avon,vcc} +
        {escape_fish,puttanesca,vcc,diagon,copper_beef,pork_eel,vcc,spain_stix,gnd,pork_eel,vcc};
  end

// XNOR all of these bits together
always @(deng_tinker or troll_lemon or lsd_turnip or spirit_shuda or gnd or condit_yak or spirit_shuda or spirit_shuda or gnd or vcc or pork_eel or vcc)
  begin
      weasley_valve = ~^ {deng_tinker,troll_lemon,lsd_turnip,spirit_shuda,gnd,condit_yak,spirit_shuda,spirit_shuda,gnd,vcc,pork_eel,vcc};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      portnoy_stick <= 0;
    else
    case ({copper_beef,gnd})
       0 : portnoy_stick <= portnoy_stick;
       1 : portnoy_stick <= rojas_bull;
       2 : portnoy_stick <= copper_beef;
       3 : portnoy_stick <= sleeping_art;
       default : portnoy_stick <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      palmer_emails <= 0;
    else
    case ({bathroom_elf,intuit_voodoo})
       0 : palmer_emails <= palmer_emails;
       1 : palmer_emails <= escape_fish;
       2 : palmer_emails <= palmer_emails;
       3 : palmer_emails <= palmer_emails;
       default : palmer_emails <= 0;
    endcase
  end

reg feedback_pt_234;

always @(palmer_emails or feedback_pt_234)
  begin
      weevil_solder =  palmer_emails | !feedback_pt_234;
  end

reg feedback_pt_235;

always @(portnoy_stick or feedback_pt_235)
  begin
      isle_fufu = !portnoy_stick ^ !feedback_pt_235;
  end

reg feedback_pt_236;

always @(vcc or feedback_pt_236)
  begin
      ladder_barnum = !vcc | !feedback_pt_236;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      guy_steaming <= 0;
    else if (vcc)
      guy_steaming <= vcc;
  end

always @(guy_steaming)
  begin
      feedback_pt_234 = guy_steaming;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mike_mcnugget <= 1;
    else
      mike_mcnugget <= quebec_webvan;
  end

always @(mike_mcnugget)
  begin
      feedback_pt_235 = mike_mcnugget;
  end

reg feedback_pt_237;

always @(ladder_barnum or feedback_pt_237)
  begin
      kebab_nyquil =  ladder_barnum &  feedback_pt_237;
  end

reg feedback_pt_238;

always @(mike_mcnugget or feedback_pt_238)
  begin
      possum_yoda = !mike_mcnugget &  feedback_pt_238;
  end

reg feedback_pt_239;

always @(vcc or feedback_pt_239)
  begin
      sweetie_grams = !vcc ^ !feedback_pt_239;
  end

reg feedback_pt_240;

always @(isle_fufu or feedback_pt_240)
  begin
      avon_liberace = !isle_fufu ^  feedback_pt_240;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      achilles_lala <= 1;
    else
      achilles_lala <= deng_tinker;
  end

always @(achilles_lala)
  begin
      feedback_pt_236 = achilles_lala;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ajax_too_big <= 0;
    else if (goblin_bear)
      ajax_too_big <= 0;
    else if (gnd)
      ajax_too_big <= rasp_stoned;
  end

always @(ajax_too_big)
  begin
      feedback_pt_237 = ajax_too_big;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chillis_willy <= 1;
    else
      chillis_willy <= parrot_eeevil;
  end

always @(chillis_willy)
  begin
      feedback_pt_238 = chillis_willy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dow_amex <= 0;
    else if (achilles_lala)
      dow_amex <= 0;
    else if (zulu_hagrid)
      dow_amex <= gnd;
  end

always @(dow_amex)
  begin
      feedback_pt_239 = dow_amex;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lion_popcorn <= 0;
    else if (spirit_shuda)
      lion_popcorn <= kebab_nyquil;
    else if (weevil_solder)
      lion_popcorn <= 0;
  end

always @(lion_popcorn)
  begin
      feedback_pt_240 = lion_popcorn;
  end

// data words for bus muxing
wire [22:0] kang_bacon_word0_data;
wire [22:0] kang_bacon_word1_data;
wire [22:0] kang_bacon_word2_data;
wire [22:0] kang_bacon_word3_data;
wire [22:0] kang_bacon_word4_data;
wire [22:0] kang_bacon_word5_data;
wire [22:0] kang_bacon_word6_data;
wire [22:0] kang_bacon_word7_data;
wire [22:0] kang_bacon_word8_data;
wire [22:0] kang_bacon_word9_data;
wire [22:0] kang_bacon_word10_data;
wire [22:0] kang_bacon_word11_data;
wire [22:0] kang_bacon_word12_data;
wire [22:0] kang_bacon_word13_data;
wire [22:0] kang_bacon_word14_data;
wire [22:0] kang_bacon_word15_data;
wire [22:0] kang_bacon_word16_data;
wire [22:0] kang_bacon_word17_data;
wire [22:0] kang_bacon_word18_data;
wire [22:0] kang_bacon_word19_data;
assign kang_bacon_word0_data = {danger_pig,gnd,gnd,danger_pig,lion_popcorn,rasp_stoned,vcc,spain_stix,parrot_eeevil,ready_tiger,lotus_sgates,vcc,vcc,ramone_black,vcc,achilles_lala,bach_maryann,intuit_voodoo,dopey_tattoo,gnd,rasp_stoned,gnd,avon_liberace};
assign kang_bacon_word1_data = {dow_amex,vcc,vcc,guy_steaming,dow_amex,intuit_voodoo,avon_liberace,lotus_sgates,zulu_hagrid,hoser_holland,ajax_too_big,sweetie_grams,achilles_lala,vcc,lotus_sgates,possum_yoda,vcc,chillis_willy,gnd,weevil_solder,pimpernel_moe,possum_yoda,pimpernel_moe};
assign kang_bacon_word2_data = {chillis_willy,ajax_too_big,oranje,mike_mcnugget,avon_liberace,spirit_shuda,intuit_voodoo,weasley_valve,ramone_black,spirit_shuda,avon_liberace,vcc,popcorn_advil,gerard_kungfu,gnd,vcc,whale_malfoy,stoned_sake,tylenol_otter,vcc,yankee_hoser,bush_wiggles,west_eatem};
assign kang_bacon_word3_data = {vcc,kappa_zed,beast_uppers,blue_aphid,tasty_ebi,jonas_falafel,zulu_eel,wildboar_iron,madeye_mozart,obiwan_rabbi,tuna_minerva,parrot_doc,homerun_stix,edible_amex,ham_alpha,moody_noah,gnd,gnd,hagrid_neon,diagon_willy,uppers_speed,pentium_tin,gnd};
assign kang_bacon_word4_data = {oscar_parrot,spain_loser,elian_romeo,vcc,dingbat_palm,superman_ebi,grumby_lucent,flew_bison,gnd,troll_uppers,dingbat_tesla,homerun_echo,gnd,moulin_crank,otter_kedavra,kana_zi,saturn_simasu,ready_centaur,rojas_tobe,goofy_kappa,hoser_zen,marco_freaky,zebra_lad};
assign kang_bacon_word5_data = {yellow_wine,vcc,wine_sand,curly_fear,vcc,kmfdm_school,gnd,ocha_hercules,gin_ceres,tonic_dutch,midas_hippo,moody_zhuang,vcc,whiskey_alpha,howell_malfoy,gnd,sears_george,cybex_air,trevor_jiminy,dorkus_marge,gnd,moe_carolina,doc_bathroom};
assign kang_bacon_word6_data = {fury_saturn,hiway_jesus,gnd,bison_mexican,wanton_flew,killer_ready,stemcell_zed,valve_loud,viagra_filch,vcc,peaves_dutch,tabby_guy,bacon_gyro,vcc,ready_chips,copper_gerrit,water_foryou,show_mrbill,tin_lestrange,draco_october,clay_yohimbe,beef_covad,curious_moron};
assign kang_bacon_word7_data = {chief_bambi,rat_wakey,aspirin_ritsu,tonks_snake,what_husks,gnd,newt_sirius,crack_lamer,egg_homer,fear_star,gnd,rojas_kungfu,solder_issac,kabar_whiskey,eel_zinc,pluto_psycho,yak_brothers,moreand_willy,ajax_psycho,hp_eeevil,mushroom_dork,boots_yellow,oscar_bonker};
assign kang_bacon_word8_data = {bomb_yohimbe,gnd,sun_tesla,vcc,metal_dog,tabby_moses,kanji_uppers,nobody_zeus,tesla_scrooge,pdiddy_dirty,neville_beef,gnd,vcc,vcc,whacky_husks,shark_palm,loud_ariel,fortuyn_heidi,vcc,mushroom_zed,brian_zulu,priest_echo,vcc};
assign kang_bacon_word9_data = {dork_love_in,kang_tsmc,boots_cuckoo,cybex_saturn,skipper_happy,what_peta,midas_trevor,donkey_genji,starwars_gyro,century_biker,vcc,dow_rubeus,bush_gutter,sun_wannabe,vcc,guy_ykocens,sake_ocha,oscar_gin,nasdaq_iron,po_killme,zinc_bust,joker_gotone,rojas_norbert};
assign kang_bacon_word10_data = {gnd,vcc,gnd,iguana_buddha,otter_hotel,books_gojira,tiger_drugs,pdaddy_powder,beauty_coffee,tabasco_snape,quail_minnie,barney_cannon,ghost_asahi,pirate_mrbill,black_intuit,atomic_lad,shark_peace,suffering_gm,spyro_lima,lao_beef,todd_malfoy,hulk_booming,eunice_eunice};
assign kang_bacon_word11_data = {vcc,gnd,marco_thread,vcc,sanity_fallen,dopey_bomb,vcc,ebi_bubba,roid_kungfu,hans_ritsu,rewire_bubba,wildboar_mao,money_donut,freaky_amex,waffle_midas,gnd,vcc,wizard_norris,tango_would,black_kebab,show_bacon,gnd,gnd};
assign kang_bacon_word12_data = {coffee_wujing,gnd,vcc,master_elf,cartman_hurt,purple_maki,lala_agitator,baron_juliet,yoda_kangaroo,banshee_think,martin_bolt,gnd,vcc,bush_kbtoys,mideast_bolt,minnow_marco,hurt_rose,hours_green,venus_elian,pyro_zipporah,gnd,gnd,killer_marker};
assign kang_bacon_word13_data = {snake_marco,vcc,bubba_peta,honda_pdaddy,gnd,midas_macys,zed_orange,drevil_spirit,gnd,ulysses_nyc,gnd,mine_ostrich,art_zed,what_intel,gopher_minnow,neon_snape,rufus_advil,gnd,zedong_lucius,sake_bullet,foryou_rubik,chairman_bfs,sgates_thedon};
assign kang_bacon_word14_data = {gnd,hulk_atomic,gnd,peace_broom,boing_illegal,nobody_martin,kang_minnie,vcc,fortuyn_lamer,pacific_asahi,vcc,vcc,todd_pictures,thedon_potato,vcc,holland_haze,wujing_xray,gnd,dopey_sinew,advil_cow,platinum_haze,vcc,fire_waster};
assign kang_bacon_word15_data = {iterate_sugar,amex_potter,thor_cucumber,loud_chiptrip,gnd,south_toysrus,echo_eggsalad,gnd,cain_intel,homerun_deng,vcc,dragon_malfoy,india_squad,sanity_tarzan,concorde_show,covad_ocha,vcc,weevil_money,gnd,gnd,vcc,loser_echo,potter_thor};
assign kang_bacon_word16_data = {money_fortuyn,blue_carolina,hanger_lizard,vcc,vcc,gnd,gnd,vcc,gregg_a_lovey,gnd,gap_tamago,genji_stirfry,fish_waffle,vcc,daughter_sake,oscar_too_big,gnd,dork_rouge,jonas_rocks,husks_gotone,gnd,klaas_diagon,jcrew_cow};
assign kang_bacon_word17_data = {rarest_emails,kanji_clay,concorde_bart,master_bamboo,att_launcher,surfer_tuna,gnd,dig_shark,illegal_rod,vegas_peace,vcc,beef_shuda,soccer_speed,zhuang_drugie,gnd,falafel_sun,quebec_lovey,potato_rod,south_nasdaq,malfoy_boing,yankees_heidi,gnd,gnd};
assign kang_bacon_word18_data = {giraffe_huey,bono_homer,pig_fear,curly_baron,vcc,vcc,loser_curious,vcc,gnd,obiwan_quail,vcc,bravo_haze,rasp_bubba,dork_dingbat,drugie_pilot,tsmc_safada,ford_comtrex,snort_jinyong,bert_south,art_norbert,legos_tofu,gnd,ladder_pyro};
assign kang_bacon_word19_data = {hotdog_sgates,life_lao,palm_haze,boitano_brian,hippo_mozart,nest_crank,roid_odin,due_tango,gnd,goofy_bach,vcc,gnd,fufu_minnow,trevor_wanton,freaky_marco,lagoon_broom,tinker_sheep,gnd,lizard_kanji,vcc,foxtrot_sears,sheep_bart,air_monkey};

// select control for bus muxing
wire [10:0] kang_bacon_select;
assign kang_bacon_select = {chief_peta,gnd,west_powder,jacob_malfoy,dimetap_bagel,neville_po,trevor_thread,zen_tako,curie_macys,gnd,exodus_lima};


// Mux output word
reg [22:0] kang_bacon_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    kang_bacon_result = kang_bacon_word0_data;
    if (kang_bacon_select == 224)
        kang_bacon_result = 0;

    if (kang_bacon_select[5])
        kang_bacon_result = kang_bacon_word18_data;

    if (kang_bacon_select == 236)
        kang_bacon_result = ~kang_bacon_word6_data;

    if (kang_bacon_select == 157)
        kang_bacon_result = kang_bacon_word10_data;

    if (kang_bacon_select[0])
        kang_bacon_result = kang_bacon_word7_data;

    if (kang_bacon_select == 183)
        kang_bacon_result = kang_bacon_word5_data;

    if (kang_bacon_select[2] && kang_bacon_select[2])
        kang_bacon_result = kang_bacon_word19_data;

    if (kang_bacon_select == 108)
        kang_bacon_result = ~kang_bacon_word6_data;

end


// Send the out bus back to the world
always @(kang_bacon_result)
begin
    nasdaq_ebay = kang_bacon_result[0];
    zulu_baron = kang_bacon_result[1];
    fury_beast = kang_bacon_result[2];
    peaves_squad = kang_bacon_result[3];
    fury_grams = kang_bacon_result[4];
    lotus_golf = kang_bacon_result[5];
    rocks_ohisee = kang_bacon_result[6];
    jonas_monster = kang_bacon_result[7];
    ginger_tsmc = kang_bacon_result[8];
    hotel_macys = kang_bacon_result[9];
    roe_abraham = kang_bacon_result[10];
    tinker_george = kang_bacon_result[11];
    pig_budlite = kang_bacon_result[12];
    monkey_whale = kang_bacon_result[13];
    babette_crank = kang_bacon_result[14];
    chillis_peace = kang_bacon_result[15];
    lima_hummer = kang_bacon_result[16];
    bolt_foliage = kang_bacon_result[17];
    severus_valve = kang_bacon_result[18];
    dweebie_bep = kang_bacon_result[19];
    llama_palm = kang_bacon_result[20];
    might_what = kang_bacon_result[21];
    kilo_knot = kang_bacon_result[22];
end

reg feedback_pt_241;

always @(vcc or feedback_pt_241)
  begin
      emu_xiaoping =  vcc | !feedback_pt_241;
  end

reg feedback_pt_242;

always @(emu_xiaoping or feedback_pt_242)
  begin
      pastrami_bull =  emu_xiaoping ^ !feedback_pt_242;
  end

reg feedback_pt_243;

always @(lotus_golf or feedback_pt_243)
  begin
      tiger_dimetap = !lotus_golf ^ !feedback_pt_243;
  end

reg feedback_pt_244;

always @(weasley_valve or feedback_pt_244)
  begin
      water_century = !weasley_valve |  feedback_pt_244;
  end

reg feedback_pt_245;

always @(weasley_valve or feedback_pt_245)
  begin
      ernie_woman =  weasley_valve ^ !feedback_pt_245;
  end

reg feedback_pt_246;

always @(tinker_george or feedback_pt_246)
  begin
      woman_tiger = !tinker_george | !feedback_pt_246;
  end

reg feedback_pt_247;

always @(woman_tiger or feedback_pt_247)
  begin
      baron_foliage =  woman_tiger ^ !feedback_pt_247;
  end

reg feedback_pt_248;

always @(ernie_woman or feedback_pt_248)
  begin
      bust_zen =  ernie_woman ^  feedback_pt_248;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hinge_enoch <= 0;
    else
      hinge_enoch <= vcc;
  end

always @(hinge_enoch)
  begin
      feedback_pt_241 = hinge_enoch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      homer_goofy <= 1;
    else
      homer_goofy <= tiger_dimetap;
  end

always @(homer_goofy)
  begin
      feedback_pt_242 = homer_goofy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      theseus_maki <= 0;
    else
      theseus_maki <= rasp_stoned;
  end

always @(theseus_maki)
  begin
      feedback_pt_243 = theseus_maki;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      maklak_waffle <= 0;
    else if (zulu_baron)
      maklak_waffle <= 0;
    else if (bolt_foliage)
      maklak_waffle <= fury_grams;
  end

always @(maklak_waffle)
  begin
      feedback_pt_244 = maklak_waffle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      egg_starwars <= 0;
    else if (pastrami_bull)
      egg_starwars <= 0;
    else if (rocks_ohisee)
      egg_starwars <= chillis_peace;
  end

always @(egg_starwars)
  begin
      feedback_pt_245 = egg_starwars;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drevil_sinus <= 0;
    else if (intuit_voodoo)
      drevil_sinus <= chillis_peace;
    else if (severus_valve)
      drevil_sinus <= 0;
  end

always @(drevil_sinus)
  begin
      feedback_pt_246 = drevil_sinus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      north_fortuyn <= 1;
    else
      north_fortuyn <= drevil_sinus;
  end

always @(north_fortuyn)
  begin
      feedback_pt_247 = north_fortuyn;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ariel_wujing <= 0;
    else if (nasdaq_ebay)
      ariel_wujing <= egg_starwars;
  end

always @(ariel_wujing)
  begin
      feedback_pt_248 = ariel_wujing;
  end

// Tristate output pin with reg feedback
  bufif0 (boitano_bagel, vcc,!nasdaq_ebay);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(nasdaq_ebay or boitano_bagel) begin
    if ( nasdaq_ebay) ladder_lizard =  boitano_bagel;
    else ladder_lizard = vcc;
end

// Vanilla tristate output pin
  bufif1 (deuce_bismuth, severus_valve,!deng_tinker);  // output,dat,oe

// Vanilla tristate output pin
  bufif1 (emu_skinner, lima_hummer,!might_what);  // output,dat,oe

// Vanilla tristate output pin
  bufif0 (blessyou_haze,!vcc,!baron_foliage);  // output,dat,oe

reg feedback_pt_249;

always @(ginger_tsmc or feedback_pt_249)
  begin
      knot_neville =  ginger_tsmc ^ !feedback_pt_249;
  end

reg feedback_pt_250;

always @(severus_valve or feedback_pt_250)
  begin
      pepsi_spanish = !severus_valve &  feedback_pt_250;
  end

reg feedback_pt_251;

always @(homer_goofy or feedback_pt_251)
  begin
      bolt_trevor =  homer_goofy &  feedback_pt_251;
  end

reg feedback_pt_252;

always @(water_century or feedback_pt_252)
  begin
      kungfu_surfer =  water_century & !feedback_pt_252;
  end

reg feedback_pt_253;

always @(north_fortuyn or feedback_pt_253)
  begin
      pizza_green =  north_fortuyn &  feedback_pt_253;
  end

reg feedback_pt_254;

always @(vcc or feedback_pt_254)
  begin
      gulp_mushroom =  vcc ^ !feedback_pt_254;
  end

reg feedback_pt_255;

always @(intuit_voodoo or feedback_pt_255)
  begin
      ihilani_bert = !intuit_voodoo ^  feedback_pt_255;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tattoo_east <= 1;
    else
      tattoo_east <= gnd;
  end

always @(tattoo_east)
  begin
      feedback_pt_249 = tattoo_east;
  end

wire ghost_zinc_wire;

dffea ghost_zinc_ff (
  .clk(clock0),
  .d(rocks_ohisee),
  .ena(chillis_peace),
  .adata(knot_neville),
  .clrn(!reset0),
  .q(ghost_zinc_wire)
);

always @(ghost_zinc_wire) begin
   rat_xterm = ghost_zinc_wire;
end

always @(rat_xterm)
  begin
      feedback_pt_250 = rat_xterm;
  end

wire master_bart_wire;

dffea master_bart_ff (
  .clk(clock0),
  .d(gnd),
  .ena(kungfu_surfer),
  .adata(hotel_macys),
  .clrn(!reset0),
  .q(master_bart_wire)
);

always @(master_bart_wire) begin
   gonzo_eunice = master_bart_wire;
end

always @(gonzo_eunice)
  begin
      feedback_pt_251 = gonzo_eunice;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      often_onthepc <= 0;
    else
      often_onthepc <= vcc;
  end

always @(often_onthepc)
  begin
      feedback_pt_252 = often_onthepc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floo_saturn <= 0;
    else if (lotus_sgates)
      floo_saturn <= tattoo_east;
    else if (often_onthepc)
      floo_saturn <= 0;
  end

always @(floo_saturn)
  begin
      feedback_pt_253 = floo_saturn;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      greenbay_sake <= 0;
    else if (tinker_george)
      greenbay_sake <= ernie_woman;
    else if (fury_grams)
      greenbay_sake <= 0;
  end

always @(greenbay_sake)
  begin
      feedback_pt_254 = greenbay_sake;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      llama_bismuth <= 0;
    else if (hoser_holland)
      llama_bismuth <= lotus_golf;
  end

always @(llama_bismuth)
  begin
      feedback_pt_255 = llama_bismuth;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      baron_clay <= 0;
    else if (gnd)
      baron_clay <= vcc;
    else if (vcc)
      baron_clay <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      southern_cow <= 0;
    else if (fury_beast)
      southern_cow <= 0;
    else if (kebab_nyquil)
      southern_cow <= gnd;
  end

wire gotone_marvin_wire;

dffea gotone_marvin_ff (
  .clk(clock0),
  .d(jonas_monster),
  .ena(dopey_tattoo),
  .adata(lotus_golf),
  .clrn(!reset0),
  .q(gotone_marvin_wire)
);

always @(gotone_marvin_wire) begin
   marge_tofu = gotone_marvin_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      leaky_jinyong <= 0;
    else if (gnd)
      leaky_jinyong <= gonzo_eunice;
    else if (gnd)
      leaky_jinyong <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vicks_skinner <= 0;
    else if (marge_tofu)
      vicks_skinner <= 0;
    else if (pizza_green)
      vicks_skinner <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mexico_sears <= 0;
    else if (llama_palm)
      mexico_sears <= baron_clay;
    else if (vcc)
      mexico_sears <= 0;
  end

wire spyro_nirish_wire;

dffeas spyro_nirish_ff (
  .clk(clock0),
  .d(baron_foliage),
  .ena(floo_saturn),
  .sclr(gnd),
  .sload(gnd),
  .asdata(rat_xterm),
  .clrn(!reset0),
  .q(spyro_nirish_wire)
);

always @(spyro_nirish_wire) begin
   boing_jiminy = spyro_nirish_wire;
end

wire skipper_would_wire;

dffeas skipper_would_ff (
  .clk(clock0),
  .d(theseus_maki),
  .ena(pastrami_bull),
  .sclr(vcc),
  .sload(gnd),
  .asdata(gulp_mushroom),
  .clrn(!reset0),
  .q(skipper_would_wire)
);

always @(skipper_would_wire) begin
   honda_elf = skipper_would_wire;
end

reg feedback_pt_256;

always @(maklak_waffle or feedback_pt_256)
  begin
      lsd_downers = !maklak_waffle | !feedback_pt_256;
  end

reg feedback_pt_257;

always @(egg_starwars or feedback_pt_257)
  begin
      chicken_romex =  egg_starwars |  feedback_pt_257;
  end

reg feedback_pt_258;

always @(nasdaq_ebay or feedback_pt_258)
  begin
      pdaddy_kappa = !nasdaq_ebay |  feedback_pt_258;
  end

reg feedback_pt_259;

always @(bolt_trevor or feedback_pt_259)
  begin
      kabar_jacques =  bolt_trevor &  feedback_pt_259;
  end

reg feedback_pt_260;

always @(homer_goofy or feedback_pt_260)
  begin
      leidiot_duey = !homer_goofy & !feedback_pt_260;
  end

reg feedback_pt_261;

always @(vcc or feedback_pt_261)
  begin
      egg_might = !vcc &  feedback_pt_261;
  end

// State Mek golden_sleepy Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golden_sleepy <= golden_sleepy_0;
    else
      case (golden_sleepy)
        golden_sleepy_0: begin
          if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 15)
            golden_sleepy <= golden_sleepy_3;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 7)
            golden_sleepy <= golden_sleepy_6;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 3)
            golden_sleepy <= golden_sleepy_1;
          else
            golden_sleepy <= golden_sleepy_0;
          end
        golden_sleepy_1: begin
          if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 10)
            golden_sleepy <= golden_sleepy_4;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 11)
            golden_sleepy <= golden_sleepy_6;
          else
            golden_sleepy <= golden_sleepy_1;
          end
        golden_sleepy_2: begin
          if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 6)
            golden_sleepy <= golden_sleepy_4;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 15)
            golden_sleepy <= golden_sleepy_6;
          else
            golden_sleepy <= golden_sleepy_2;
          end
        golden_sleepy_3: begin
          if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 15)
            golden_sleepy <= golden_sleepy_4;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 2)
            golden_sleepy <= golden_sleepy_5;
          else
            golden_sleepy <= golden_sleepy_3;
          end
        golden_sleepy_4: begin
          if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 5)
            golden_sleepy <= golden_sleepy_0;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 6)
            golden_sleepy <= golden_sleepy_1;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 9)
            golden_sleepy <= golden_sleepy_0;
          else
            golden_sleepy <= golden_sleepy_4;
          end
        golden_sleepy_5: begin
          if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 5)
            golden_sleepy <= golden_sleepy_1;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 11)
            golden_sleepy <= golden_sleepy_4;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 2)
            golden_sleepy <= golden_sleepy_2;
          else
            golden_sleepy <= golden_sleepy_5;
          end
        golden_sleepy_6: begin
          if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 10)
            golden_sleepy <= golden_sleepy_5;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 12)
            golden_sleepy <= golden_sleepy_4;
          else if ({vcc,joseph_husks,avon_oranges,bananarep_rum} == 8)
            golden_sleepy <= golden_sleepy_6;
          else
            golden_sleepy <= golden_sleepy_6;
          end
        default: golden_sleepy <= golden_sleepy_0;
      endcase
  end

// State Mek golden_sleepy Output logic
always @(golden_sleepy)
  begin
    // consider all state regs when doing outputs
    case (golden_sleepy)
        golden_sleepy_0: begin
            tank_centaur = 1;
            wonton_crack = 1;
            advil_army = 0;
            broom_eagle = 0;
            clay_ritsu = 1;
            lemon_joseph = 1;
            dimetap_vegan = 1;
            ocean_huhhuh = 1;
            cybex_romex = 1;
            english_pyro = 1;
            lamer_webvan = 1;
            papa_dadada = 1;
            marker_bep = 1;
            sgates_think = 0;
            ceres_elian = 0;
          end
        golden_sleepy_1: begin
            tank_centaur = 1;
            wonton_crack = 1;
            advil_army = 0;
            broom_eagle = 0;
            clay_ritsu = 0;
            lemon_joseph = 1;
            dimetap_vegan = 1;
            ocean_huhhuh = 0;
            cybex_romex = 0;
            english_pyro = 1;
            lamer_webvan = 0;
            papa_dadada = 1;
            marker_bep = 1;
            sgates_think = 1;
            ceres_elian = 1;
          end
        golden_sleepy_2: begin
            tank_centaur = 1;
            wonton_crack = 1;
            advil_army = 1;
            broom_eagle = 0;
            clay_ritsu = 1;
            lemon_joseph = 0;
            dimetap_vegan = 1;
            ocean_huhhuh = 1;
            cybex_romex = 1;
            english_pyro = 1;
            lamer_webvan = 1;
            papa_dadada = 1;
            marker_bep = 0;
            sgates_think = 0;
            ceres_elian = 0;
          end
        golden_sleepy_3: begin
            tank_centaur = 1;
            wonton_crack = 0;
            advil_army = 1;
            broom_eagle = 1;
            clay_ritsu = 0;
            lemon_joseph = 0;
            dimetap_vegan = 0;
            ocean_huhhuh = 1;
            cybex_romex = 1;
            english_pyro = 1;
            lamer_webvan = 1;
            papa_dadada = 1;
            marker_bep = 1;
            sgates_think = 0;
            ceres_elian = 0;
          end
        golden_sleepy_4: begin
            tank_centaur = 0;
            wonton_crack = 0;
            advil_army = 1;
            broom_eagle = 0;
            clay_ritsu = 1;
            lemon_joseph = 1;
            dimetap_vegan = 1;
            ocean_huhhuh = 1;
            cybex_romex = 0;
            english_pyro = 1;
            lamer_webvan = 1;
            papa_dadada = 0;
            marker_bep = 0;
            sgates_think = 0;
            ceres_elian = 0;
          end
        golden_sleepy_5: begin
            tank_centaur = 0;
            wonton_crack = 1;
            advil_army = 1;
            broom_eagle = 0;
            clay_ritsu = 0;
            lemon_joseph = 0;
            dimetap_vegan = 0;
            ocean_huhhuh = 0;
            cybex_romex = 1;
            english_pyro = 1;
            lamer_webvan = 1;
            papa_dadada = 0;
            marker_bep = 0;
            sgates_think = 0;
            ceres_elian = 0;
          end
        golden_sleepy_6: begin
            tank_centaur = 0;
            wonton_crack = 1;
            advil_army = 1;
            broom_eagle = 1;
            clay_ritsu = 0;
            lemon_joseph = 1;
            dimetap_vegan = 1;
            ocean_huhhuh = 0;
            cybex_romex = 0;
            english_pyro = 1;
            lamer_webvan = 1;
            papa_dadada = 1;
            marker_bep = 1;
            sgates_think = 1;
            ceres_elian = 0;
          end
        default: begin
            tank_centaur = 0;
            wonton_crack = 1;
            advil_army = 0;
            broom_eagle = 1;
            clay_ritsu = 0;
            lemon_joseph = 0;
            dimetap_vegan = 0;
            ocean_huhhuh = 0;
            cybex_romex = 0;
            english_pyro = 0;
            lamer_webvan = 0;
            papa_dadada = 1;
            marker_bep = 1;
            sgates_think = 0;
            ceres_elian = 1;
          end
      endcase
  end

always @(tank_centaur)
  begin
      feedback_pt_256 = tank_centaur;
  end

always @(wonton_crack)
  begin
      feedback_pt_257 = wonton_crack;
  end

always @(advil_army)
  begin
      feedback_pt_258 = advil_army;
  end

always @(broom_eagle)
  begin
      feedback_pt_259 = broom_eagle;
  end

always @(clay_ritsu)
  begin
      feedback_pt_260 = clay_ritsu;
  end

always @(lemon_joseph)
  begin
      feedback_pt_261 = lemon_joseph;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire mine_nasdaq_out;
nut_003_lut #(3) nut_003_lut_inst_mine_nasdaq (
  .din({kabar_jacques,lotus_sgates,tattoo_east}),
  .mask(8'h05),
  .out(mine_nasdaq_out)
);

always @(mine_nasdaq_out)
begin
   tamago_opus = mine_nasdaq_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire chief_timmy_out;
nut_003_lut #(6) nut_003_lut_inst_chief_timmy (
  .din({bolt_foliage,vcc,pig_budlite,knot_neville,sgates_think,dopey_tattoo}),
  .mask(64'h39db4087b88a3ed1),
  .out(chief_timmy_out)
);

always @(chief_timmy_out)
begin
   roid_crayons = chief_timmy_out;
end


initial begin
    {floating_guy,hawaii_danger,life_atchoo,noah_mexican,daughter_lisa,bfs_star,oscar_nyquil,tako_fortuyn} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({atoms_art,lucius_drax,greenbay_sake,moderate_eel,southern_cow,vcc,kappa_rufus,gnd} < {honda_elf,gnd,safeway_nest,biker_bono,kilo_rojas,green_gm,vcc,often_master})
       {floating_guy,hawaii_danger,life_atchoo,noah_mexican,daughter_lisa,bfs_star,oscar_nyquil,tako_fortuyn} <= {honda_elf,gnd,safeway_nest,biker_bono,kilo_rojas,green_gm,vcc,often_master};
    else
       {floating_guy,hawaii_danger,life_atchoo,noah_mexican,daughter_lisa,bfs_star,oscar_nyquil,tako_fortuyn} <= {atoms_art,lucius_drax,greenbay_sake,moderate_eel,southern_cow,vcc,kappa_rufus,gnd};
  end

// 69 bit shift register
reg [68:0] atoms_filch;

initial begin
    atoms_filch = 0;
end

always @(posedge clock1)
begin
    atoms_filch <= (atoms_filch << 1) | gnd;
end

// shift taps every 3 bits
always @(atoms_filch)
begin
    zed_weevil = atoms_filch[68];
    rescue_sun = atoms_filch[65];
    haze_smithers = atoms_filch[62];
    burner_mrbill = atoms_filch[59];
    squad_wukong = atoms_filch[56];
    malfoy_nyc = atoms_filch[53];
    dork_porfavor = atoms_filch[50];
    often_downers = atoms_filch[47];
    sake_billnted = atoms_filch[44];
    purple_rod = atoms_filch[41];
    too_big_dirk = atoms_filch[38];
    baron_nihlist = atoms_filch[35];
    stroop_mexico = atoms_filch[32];
    bust_fear = atoms_filch[29];
    due_firewalk = atoms_filch[26];
    zedong_nyc = atoms_filch[23];
    emu_abraham = atoms_filch[20];
    timmy_bracket = atoms_filch[17];
    pilot_nasdaq = atoms_filch[14];
    sand_badger = atoms_filch[11];
    muffin_homer = atoms_filch[8];
    due_happy = atoms_filch[5];
    skipper_gonzo = atoms_filch[2];
end

always @(cybex_romex)
  begin
      metal_covad = !cybex_romex;
  end

always @(gnd)
  begin
      klinton_macys = !gnd;
  end

always @(vcc)
  begin
      quebec_crank = !vcc;
  end

always @(leidiot_duey)
  begin
      nest_mcnugget = !leidiot_duey;
  end

always @(ceres_elian)
  begin
      armand_lovey = !ceres_elian;
  end

always @(quebec_crank)
  begin
      priest_gopher = !quebec_crank;
  end

always @(rescue_sun)
  begin
      marvin_xterm = !rescue_sun;
  end

always @(ladder_lizard)
  begin
      lsd_shuda = !ladder_lizard;
  end

always @(floo_saturn)
  begin
      bambi_skipper = !floo_saturn;
  end

always @(gnd)
  begin
      vegas_abraham = !gnd;
  end

always @(vicks_skinner)
  begin
      kanji_gyro = !vicks_skinner;
  end

always @(nest_mcnugget)
  begin
      beauty_dog = !nest_mcnugget;
  end

always @(squad_wukong)
  begin
      emu_romex = !squad_wukong;
  end

always @(english_pyro)
  begin
      onion_trevor = !english_pyro;
  end

always @(gnd)
  begin
      rubeus_egg = !gnd;
  end

always @(chicken_romex)
  begin
      avon_giants = !chicken_romex;
  end

always @(gnd)
  begin
      fatality_sun = !gnd;
  end

always @(gnd)
  begin
      rat_what = !gnd;
  end

always @(vcc)
  begin
      marquis_husks = !vcc;
  end

always @(roid_crayons)
  begin
      neville_bravo = !roid_crayons;
  end

always @(marker_bep)
  begin
      water_ykocens = !marker_bep;
  end

always @(marvin_xterm)
  begin
      hotdog_priest = !marvin_xterm;
  end

always @(hinge_enoch)
  begin
      thread_quail = !hinge_enoch;
  end

always @(marker_bep)
  begin
      grumby_haze = !marker_bep;
  end

always @(avon_giants)
  begin
      louie_heidi = !avon_giants;
  end

always @(daughter_lisa)
  begin
      snort_quebec = !daughter_lisa;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_spastic_pilot.v
///////////////////////////////////////////

wire  nut_003_spastic_pilot_inst0_eel_psycho, nut_003_spastic_pilot_inst0_rarest_chevys, nut_003_spastic_pilot_inst0_plaster_yummy,
     nut_003_spastic_pilot_inst0_stix_broom, nut_003_spastic_pilot_inst0_kbtoys_tofu, nut_003_spastic_pilot_inst0_theseus_rojas, nut_003_spastic_pilot_inst0_leaky_snort,
     nut_003_spastic_pilot_inst0_kilo_tylenol;

nut_003_spastic_pilot nut_003_spastic_pilot_inst0 (

    //inputs
     .goat_mouse(marker_bep), .mike_stirfry(gnd), .hagrid_indigo(pdaddy_kappa), .crayons_ibm(vcc),
     .hut_burnout(pimpernel_moe), .oranje_zen(homer_goofy), .covad_pdiddy(homer_goofy), .stroop_doc(sand_badger),

    //outputs
     .eel_psycho(nut_003_spastic_pilot_inst0_eel_psycho), .rarest_chevys(nut_003_spastic_pilot_inst0_rarest_chevys),
     .plaster_yummy(nut_003_spastic_pilot_inst0_plaster_yummy), .stix_broom(nut_003_spastic_pilot_inst0_stix_broom), .kbtoys_tofu(nut_003_spastic_pilot_inst0_kbtoys_tofu),
     .theseus_rojas(nut_003_spastic_pilot_inst0_theseus_rojas), .leaky_snort(nut_003_spastic_pilot_inst0_leaky_snort), .kilo_tylenol(nut_003_spastic_pilot_inst0_kilo_tylenol),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   tiger_rubik = nut_003_spastic_pilot_inst0_eel_psycho;
   boing_kebab = nut_003_spastic_pilot_inst0_rarest_chevys;
   speed_tuna = nut_003_spastic_pilot_inst0_plaster_yummy;
   yankee_zi = nut_003_spastic_pilot_inst0_stix_broom;
   ladder_loser = nut_003_spastic_pilot_inst0_kbtoys_tofu;
   quail_fascist = nut_003_spastic_pilot_inst0_theseus_rojas;
   sogood_brian = nut_003_spastic_pilot_inst0_leaky_snort;
   condit_pirate = nut_003_spastic_pilot_inst0_kilo_tylenol;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_spastic_pilot.v
///////////////////////////////////////////

wire  nut_003_spastic_pilot_inst1_eel_psycho, nut_003_spastic_pilot_inst1_rarest_chevys, nut_003_spastic_pilot_inst1_plaster_yummy,
     nut_003_spastic_pilot_inst1_stix_broom, nut_003_spastic_pilot_inst1_kbtoys_tofu, nut_003_spastic_pilot_inst1_theseus_rojas, nut_003_spastic_pilot_inst1_leaky_snort,
     nut_003_spastic_pilot_inst1_kilo_tylenol;

nut_003_spastic_pilot nut_003_spastic_pilot_inst1 (

    //inputs
     .goat_mouse(emu_romex), .mike_stirfry(clay_ritsu), .hagrid_indigo(vcc), .crayons_ibm(water_ykocens),
     .hut_burnout(broom_eagle), .oranje_zen(tank_centaur), .covad_pdiddy(gnd), .stroop_doc(squad_wukong),

    //outputs
     .eel_psycho(nut_003_spastic_pilot_inst1_eel_psycho), .rarest_chevys(nut_003_spastic_pilot_inst1_rarest_chevys),
     .plaster_yummy(nut_003_spastic_pilot_inst1_plaster_yummy), .stix_broom(nut_003_spastic_pilot_inst1_stix_broom), .kbtoys_tofu(nut_003_spastic_pilot_inst1_kbtoys_tofu),
     .theseus_rojas(nut_003_spastic_pilot_inst1_theseus_rojas), .leaky_snort(nut_003_spastic_pilot_inst1_leaky_snort), .kilo_tylenol(nut_003_spastic_pilot_inst1_kilo_tylenol),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   pepsi_moe = nut_003_spastic_pilot_inst1_eel_psycho;
   albus_what = nut_003_spastic_pilot_inst1_rarest_chevys;
   oscar_dimetap = nut_003_spastic_pilot_inst1_plaster_yummy;
   tonks_jesus = nut_003_spastic_pilot_inst1_stix_broom;
   oldnavy_romex = nut_003_spastic_pilot_inst1_kbtoys_tofu;
   crab_tank = nut_003_spastic_pilot_inst1_theseus_rojas;
   paper_english = nut_003_spastic_pilot_inst1_leaky_snort;
   hawaii_plague = nut_003_spastic_pilot_inst1_kilo_tylenol;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_spastic_pilot.v
///////////////////////////////////////////

wire  nut_003_spastic_pilot_inst2_eel_psycho, nut_003_spastic_pilot_inst2_rarest_chevys, nut_003_spastic_pilot_inst2_plaster_yummy,
     nut_003_spastic_pilot_inst2_stix_broom, nut_003_spastic_pilot_inst2_kbtoys_tofu, nut_003_spastic_pilot_inst2_theseus_rojas, nut_003_spastic_pilot_inst2_leaky_snort,
     nut_003_spastic_pilot_inst2_kilo_tylenol;

nut_003_spastic_pilot nut_003_spastic_pilot_inst2 (

    //inputs
     .goat_mouse(gnd), .mike_stirfry(vcc), .hagrid_indigo(priest_gopher), .crayons_ibm(dork_porfavor),
     .hut_burnout(vegas_abraham), .oranje_zen(pdaddy_kappa), .covad_pdiddy(onion_trevor), .stroop_doc(ariel_wujing),

    //outputs
     .eel_psycho(nut_003_spastic_pilot_inst2_eel_psycho), .rarest_chevys(nut_003_spastic_pilot_inst2_rarest_chevys),
     .plaster_yummy(nut_003_spastic_pilot_inst2_plaster_yummy), .stix_broom(nut_003_spastic_pilot_inst2_stix_broom), .kbtoys_tofu(nut_003_spastic_pilot_inst2_kbtoys_tofu),
     .theseus_rojas(nut_003_spastic_pilot_inst2_theseus_rojas), .leaky_snort(nut_003_spastic_pilot_inst2_leaky_snort), .kilo_tylenol(nut_003_spastic_pilot_inst2_kilo_tylenol),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   po_yellowtail = nut_003_spastic_pilot_inst2_eel_psycho;
   tonic_whale = nut_003_spastic_pilot_inst2_rarest_chevys;
   egg_plague = nut_003_spastic_pilot_inst2_plaster_yummy;
   cocaine_bart = nut_003_spastic_pilot_inst2_stix_broom;
   rose_hp = nut_003_spastic_pilot_inst2_kbtoys_tofu;
   deuce_salsa = nut_003_spastic_pilot_inst2_theseus_rojas;
   stix_mickey = nut_003_spastic_pilot_inst2_leaky_snort;
   eggsalad_dirk = nut_003_spastic_pilot_inst2_kilo_tylenol;
end

wire ginger_hinge_outwire, curly_red_outwire;
carry_sum animal_faster (.sin(snort_quebec),.cin(skipper_gonzo),.sout(ginger_hinge_outwire),.cout(curly_red_outwire));

always @(ginger_hinge_outwire or curly_red_outwire)
begin
  ginger_hinge = ginger_hinge_outwire;
  curly_red = curly_red_outwire;
end

wire whacky_hinge_outwire, drax_intuit_outwire;
carry_sum lad_zebra (.sin(ocean_huhhuh),.cin(tiger_rubik),.sout(whacky_hinge_outwire),.cout(drax_intuit_outwire));

always @(whacky_hinge_outwire or drax_intuit_outwire)
begin
  whacky_hinge = whacky_hinge_outwire;
  drax_intuit = drax_intuit_outwire;
end

wire issac_gonzo_outwire, green_sortout_outwire;
carry_sum neville_over (.sin(vcc),.cin(skipper_gonzo),.sout(issac_gonzo_outwire),.cout(green_sortout_outwire));

always @(issac_gonzo_outwire or green_sortout_outwire)
begin
  issac_gonzo = issac_gonzo_outwire;
  green_sortout = green_sortout_outwire;
end

wire avon_neon_outwire, snake_copper_outwire;
carry_sum mine_chief (.sin(emu_abraham),.cin(squad_wukong),.sout(avon_neon_outwire),.cout(snake_copper_outwire));

always @(avon_neon_outwire or snake_copper_outwire)
begin
  avon_neon = avon_neon_outwire;
  snake_copper = snake_copper_outwire;
end

wire crayons_fury_outwire;
cascade kmfdm_marvin (timmy_bracket,crayons_fury_outwire);

always @(crayons_fury_outwire)
begin
  crayons_fury = crayons_fury_outwire;
end

wire dig_uppers_outwire, liberace_lad_outwire;
carry_sum cubish_issac (.sin(cybex_romex),.cin(vcc),.sout(dig_uppers_outwire),.cout(liberace_lad_outwire));

always @(dig_uppers_outwire or liberace_lad_outwire)
begin
  dig_uppers = dig_uppers_outwire;
  liberace_lad = liberace_lad_outwire;
end

reg feedback_pt_262;

always @(hawaii_danger or feedback_pt_262)
  begin
      boitano_wine = !hawaii_danger &  feedback_pt_262;
  end

reg feedback_pt_263;

always @(rat_xterm or feedback_pt_263)
  begin
      goblin_cubish =  rat_xterm & !feedback_pt_263;
  end

reg feedback_pt_264;

always @(louie_heidi or feedback_pt_264)
  begin
      west_sand = !louie_heidi |  feedback_pt_264;
  end

reg feedback_pt_265;

always @(papa_dadada or feedback_pt_265)
  begin
      emails_lamer =  papa_dadada ^ !feedback_pt_265;
  end

reg feedback_pt_266;

always @(paper_english or feedback_pt_266)
  begin
      lao_ritsu = !paper_english |  feedback_pt_266;
  end

reg feedback_pt_267;

always @(pizza_green or feedback_pt_267)
  begin
      malfoy_indigo = !pizza_green &  feedback_pt_267;
  end

reg feedback_pt_268;

always @(dork_porfavor or feedback_pt_268)
  begin
      kungfu_duey = !dork_porfavor | !feedback_pt_268;
  end

reg feedback_pt_269;

always @(ginger_tsmc or feedback_pt_269)
  begin
      wine_monster = !ginger_tsmc | !feedback_pt_269;
  end

reg feedback_pt_270;

always @(kungfu_duey or feedback_pt_270)
  begin
      stick_roid =  kungfu_duey ^ !feedback_pt_270;
  end

reg feedback_pt_271;

always @(daughter_lisa or feedback_pt_271)
  begin
      metal_heidi = !daughter_lisa & !feedback_pt_271;
  end

reg feedback_pt_272;

always @(neville_bravo or feedback_pt_272)
  begin
      grams_wakey =  neville_bravo & !feedback_pt_272;
  end

reg feedback_pt_273;

always @(wonton_crack or feedback_pt_273)
  begin
      tiger_hiway = !wonton_crack | !feedback_pt_273;
  end

reg feedback_pt_274;

always @(gnd or feedback_pt_274)
  begin
      marco_chevys = !gnd &  feedback_pt_274;
  end

reg feedback_pt_275;

always @(due_firewalk or feedback_pt_275)
  begin
      romex_whiskey =  due_firewalk |  feedback_pt_275;
  end

reg feedback_pt_276;

always @(vcc or feedback_pt_276)
  begin
      tsmc_milhouse =  vcc ^  feedback_pt_276;
  end

reg feedback_pt_277;

always @(vcc or feedback_pt_277)
  begin
      tiger_skipper = !vcc &  feedback_pt_277;
  end

reg feedback_pt_278;

always @(sogood_brian or feedback_pt_278)
  begin
      willy_emails = !sogood_brian |  feedback_pt_278;
  end

reg feedback_pt_279;

always @(rose_hp or feedback_pt_279)
  begin
      bear_speedyg = !rose_hp &  feedback_pt_279;
  end

reg feedback_pt_280;

always @(ihilani_bert or feedback_pt_280)
  begin
      yeanyow_atoms = !ihilani_bert |  feedback_pt_280;
  end

reg feedback_pt_281;

always @(curly_red or feedback_pt_281)
  begin
      cain_wiggles =  curly_red | !feedback_pt_281;
  end

reg feedback_pt_282;

always @(quail_fascist or feedback_pt_282)
  begin
      zedong_coffee = !quail_fascist | !feedback_pt_282;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      illegal_duck <= 0;
    else if (rat_what)
      illegal_duck <= po_yellowtail;
    else if (vcc)
      illegal_duck <= 0;
  end

always @(illegal_duck)
  begin
      feedback_pt_262 = illegal_duck;
  end

always @(illegal_duck)
  begin
      feedback_pt_263 = illegal_duck;
  end

always @(illegal_duck)
  begin
      feedback_pt_264 = illegal_duck;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      square_hagrid <= 0;
    else if (tamago_opus)
      square_hagrid <= boing_jiminy;
    else if (oldnavy_romex)
      square_hagrid <= 0;
  end

always @(square_hagrid)
  begin
      feedback_pt_265 = square_hagrid;
  end

always @(square_hagrid)
  begin
      feedback_pt_266 = square_hagrid;
  end

always @(square_hagrid)
  begin
      feedback_pt_267 = square_hagrid;
  end

always @(square_hagrid)
  begin
      feedback_pt_268 = square_hagrid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegan_floo <= 0;
    else
      vegan_floo <= rocks_ohisee;
  end

always @(vegan_floo)
  begin
      feedback_pt_269 = vegan_floo;
  end

always @(vegan_floo)
  begin
      feedback_pt_270 = vegan_floo;
  end

always @(vegan_floo)
  begin
      feedback_pt_271 = vegan_floo;
  end

always @(vegan_floo)
  begin
      feedback_pt_272 = vegan_floo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_lotus <= 0;
    else if (gnd)
      gm_lotus <= vcc;
  end

always @(gm_lotus)
  begin
      feedback_pt_273 = gm_lotus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chainsaw_clay <= 1;
    else
      chainsaw_clay <= vcc;
  end

always @(chainsaw_clay)
  begin
      feedback_pt_274 = chainsaw_clay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nyc_pizza <= 0;
    else
      nyc_pizza <= vcc;
  end

always @(nyc_pizza)
  begin
      feedback_pt_275 = nyc_pizza;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tabby_nuclear <= 0;
    else
      tabby_nuclear <= bambi_skipper;
  end

always @(tabby_nuclear)
  begin
      feedback_pt_276 = tabby_nuclear;
  end

wire mars_monkey_wire;

dffeas mars_monkey_ff (
  .clk(clock1),
  .d(marquis_husks),
  .ena(baron_nihlist),
  .sclr(floating_guy),
  .sload(grams_wakey),
  .asdata(green_sortout),
  .clrn(!reset1),
  .q(mars_monkey_wire)
);

always @(mars_monkey_wire) begin
   ramone_amex = mars_monkey_wire;
end

always @(ramone_amex)
  begin
      feedback_pt_277 = ramone_amex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      remus_vicks <= 0;
    else
      remus_vicks <= emu_abraham;
  end

always @(remus_vicks)
  begin
      feedback_pt_278 = remus_vicks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      penguin_cheez <= 0;
    else if (gnd)
      penguin_cheez <= egg_plague;
  end

always @(penguin_cheez)
  begin
      feedback_pt_279 = penguin_cheez;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turkey_tank <= 1;
    else
      turkey_tank <= vcc;
  end

always @(turkey_tank)
  begin
      feedback_pt_280 = turkey_tank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foxtrot_boots <= 1;
    else
      foxtrot_boots <= vcc;
  end

always @(foxtrot_boots)
  begin
      feedback_pt_281 = foxtrot_boots;
  end

wire porfavor_ebi_wire;

dffeas porfavor_ebi_ff (
  .clk(clock1),
  .d(homer_goofy),
  .ena(vcc),
  .sclr(crab_tank),
  .sload(burner_mrbill),
  .asdata(bust_fear),
  .clrn(!reset1),
  .q(porfavor_ebi_wire)
);

always @(porfavor_ebi_wire) begin
   palmer_dadada = porfavor_ebi_wire;
end

always @(palmer_dadada)
  begin
      feedback_pt_282 = palmer_dadada;
  end

wire dragon_paper_wire;

dffea dragon_paper_ff (
  .clk(clock1),
  .d(peaves_squad),
  .ena(klinton_macys),
  .adata(armand_lovey),
  .clrn(!reset1),
  .q(dragon_paper_wire)
);

always @(dragon_paper_wire) begin
   gonzo_scrooge = dragon_paper_wire;
end

wire po_mario_owes_wire;

dffeas po_mario_owes_ff (
  .clk(clock1),
  .d(vcc),
  .ena(burner_mrbill),
  .sclr(goblin_cubish),
  .sload(dig_uppers),
  .asdata(knot_neville),
  .clrn(!reset1),
  .q(po_mario_owes_wire)
);

always @(po_mario_owes_wire) begin
   stoner_candle = po_mario_owes_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bravo_hours <= 0;
    else if (gnd)
      bravo_hours <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      george_lovey <= 0;
    else if (boing_kebab)
      george_lovey <= malfoy_nyc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sheep_gyro <= 0;
    else if (remus_vicks)
      sheep_gyro <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jason_drunken <= 1;
    else
      jason_drunken <= beauty_dog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bach_rewire <= 0;
    else
      bach_rewire <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beetle_genji <= 0;
    else if (nasdaq_ebay)
      beetle_genji <= 0;
    else if (metal_covad)
      beetle_genji <= vcc;
  end

wire cybex_hawaii_wire;

dffeas cybex_hawaii_ff (
  .clk(clock1),
  .d(gnd),
  .ena(boing_jiminy),
  .sclr(gnd),
  .sload(willy_emails),
  .asdata(baron_nihlist),
  .clrn(!reset1),
  .q(cybex_hawaii_wire)
);

always @(cybex_hawaii_wire) begin
   iron_gonzo = cybex_hawaii_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_iceland <= 0;
    else if (vcc)
      advil_iceland <= square_hagrid;
    else if (george_lovey)
      advil_iceland <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      smack_beavis <= 1;
    else
      smack_beavis <= tiger_hiway;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      southern_bfi <= 0;
    else if (ginger_hinge)
      southern_bfi <= tiger_rubik;
    else if (nasdaq_ebay)
      southern_bfi <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cafe_concorde <= 1;
    else
      cafe_concorde <= babette_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_stick <= 0;
    else if (drax_intuit)
      west_stick <= ariel_wujing;
    else if (yankee_zi)
      west_stick <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      falafel_north <= 0;
    else if (due_happy)
      falafel_north <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beetle_star <= 0;
    else if (fury_beast)
      beetle_star <= malfoy_indigo;
    else if (iron_gonzo)
      beetle_star <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genji_dweebie <= 0;
    else
      genji_dweebie <= zed_weevil;
  end

wire rum_tukatuk_wire;

dffeas rum_tukatuk_ff (
  .clk(clock1),
  .d(snake_copper),
  .ena(lamer_webvan),
  .sclr(gnd),
  .sload(kebab_nyquil),
  .asdata(kilo_knot),
  .clrn(!reset1),
  .q(rum_tukatuk_wire)
);

always @(rum_tukatuk_wire) begin
   gulp_oitcen = rum_tukatuk_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lad_fascist <= 0;
    else
      lad_fascist <= emails_lamer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacques_rum <= 0;
    else
      jacques_rum <= haze_smithers;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_escape <= 0;
    else if (gnd)
      escape_escape <= gonzo_scrooge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_husks <= 0;
    else if (vcc)
      rerun_husks <= yeanyow_atoms;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kabar_mortar <= 0;
    else if (kanji_gyro)
      kabar_mortar <= 0;
    else if (foxtrot_boots)
      kabar_mortar <= vcc;
  end

reg feedback_pt_283;

always @(gnd or feedback_pt_283)
  begin
      wine_eggsalad =  gnd ^  feedback_pt_283;
  end

reg feedback_pt_284;

always @(mexico_sears or feedback_pt_284)
  begin
      frog_emails =  mexico_sears & !feedback_pt_284;
  end

reg feedback_pt_285;

always @(pepsi_moe or feedback_pt_285)
  begin
      kana_red =  pepsi_moe &  feedback_pt_285;
  end

reg feedback_pt_286;

always @(avon_neon or feedback_pt_286)
  begin
      kebab_arizona =  avon_neon ^ !feedback_pt_286;
  end

reg feedback_pt_287;

always @(vcc or feedback_pt_287)
  begin
      leidiot_ghost = !vcc |  feedback_pt_287;
  end

reg feedback_pt_288;

always @(wine_eggsalad or feedback_pt_288)
  begin
      dweebie_issac =  wine_eggsalad & !feedback_pt_288;
  end

reg feedback_pt_289;

always @(honda_elf or feedback_pt_289)
  begin
      bfi_obiwan = !honda_elf |  feedback_pt_289;
  end

reg feedback_pt_290;

always @(lao_ritsu or feedback_pt_290)
  begin
      seashell_mars = !lao_ritsu ^ !feedback_pt_290;
  end

reg feedback_pt_291;

always @(too_big_dirk or feedback_pt_291)
  begin
      fire_whack =  too_big_dirk ^ !feedback_pt_291;
  end

reg feedback_pt_292;

always @(life_atchoo or feedback_pt_292)
  begin
      lumber_kmfdm = !life_atchoo & !feedback_pt_292;
  end

reg feedback_pt_293;

always @(hawaii_danger or feedback_pt_293)
  begin
      rouge_alpha =  hawaii_danger |  feedback_pt_293;
  end

reg feedback_pt_294;

always @(cafe_concorde or feedback_pt_294)
  begin
      pixie_spain =  cafe_concorde ^ !feedback_pt_294;
  end

reg feedback_pt_295;

always @(speed_tuna or feedback_pt_295)
  begin
      rouge_east = !speed_tuna ^  feedback_pt_295;
  end

reg feedback_pt_296;

always @(vcc or feedback_pt_296)
  begin
      phoenix_ebay =  vcc ^  feedback_pt_296;
  end

reg feedback_pt_297;

always @(oscar_dimetap or feedback_pt_297)
  begin
      zen_firstpart = !oscar_dimetap |  feedback_pt_297;
  end

reg feedback_pt_298;

always @(homer_goofy or feedback_pt_298)
  begin
      rarest_tabby =  homer_goofy ^  feedback_pt_298;
  end

reg feedback_pt_299;

always @(jacques_rum or feedback_pt_299)
  begin
      viagra_plague =  jacques_rum &  feedback_pt_299;
  end

reg feedback_pt_300;

always @(west_stick or feedback_pt_300)
  begin
      lupin_gotone = !west_stick ^ !feedback_pt_300;
  end

reg feedback_pt_301;

always @(gm_lotus or feedback_pt_301)
  begin
      dig_obiwan =  gm_lotus & !feedback_pt_301;
  end

reg feedback_pt_302;

always @(vcc or feedback_pt_302)
  begin
      alpha_maryann =  vcc | !feedback_pt_302;
  end

reg feedback_pt_303;

always @(crayons_fury or feedback_pt_303)
  begin
      often_pdaddy = !crayons_fury & !feedback_pt_303;
  end

reg feedback_pt_304;

always @(vcc or feedback_pt_304)
  begin
      aphid_lantern = !vcc |  feedback_pt_304;
  end

reg feedback_pt_305;

always @(kabar_mortar or feedback_pt_305)
  begin
      sugar_coconut = !kabar_mortar ^ !feedback_pt_305;
  end

reg feedback_pt_306;

always @(genji_dweebie or feedback_pt_306)
  begin
      ernie_emu =  genji_dweebie ^  feedback_pt_306;
  end

reg feedback_pt_307;

always @(onion_trevor or feedback_pt_307)
  begin
      burning_ohno =  onion_trevor &  feedback_pt_307;
  end

reg feedback_pt_308;

always @(vcc or feedback_pt_308)
  begin
      rod_sebastian =  vcc |  feedback_pt_308;
  end

reg feedback_pt_309;

always @(burning_ohno or feedback_pt_309)
  begin
      zeus_hinkley =  burning_ohno |  feedback_pt_309;
  end

reg feedback_pt_310;

always @(whacky_hinge or feedback_pt_310)
  begin
      shark_richard = !whacky_hinge |  feedback_pt_310;
  end

reg feedback_pt_311;

always @(beetle_genji or feedback_pt_311)
  begin
      avon_century =  beetle_genji ^ !feedback_pt_311;
  end

reg feedback_pt_312;

always @(muffin_homer or feedback_pt_312)
  begin
      gyro_love_in =  muffin_homer | !feedback_pt_312;
  end

reg feedback_pt_313;

always @(maklak_waffle or feedback_pt_313)
  begin
      spyro_lotus =  maklak_waffle |  feedback_pt_313;
  end

reg feedback_pt_314;

always @(avon_century or feedback_pt_314)
  begin
      popcorn_whack = !avon_century ^  feedback_pt_314;
  end

reg feedback_pt_315;

always @(water_ykocens or feedback_pt_315)
  begin
      eagle_beef = !water_ykocens | !feedback_pt_315;
  end

reg feedback_pt_316;

always @(crab_tank or feedback_pt_316)
  begin
      riddler_hans =  crab_tank ^  feedback_pt_316;
  end

reg feedback_pt_317;

always @(ramone_amex or feedback_pt_317)
  begin
      bear_morrison =  ramone_amex & !feedback_pt_317;
  end

reg feedback_pt_318;

always @(vcc or feedback_pt_318)
  begin
      dow_blue =  vcc ^ !feedback_pt_318;
  end

reg feedback_pt_319;

always @(vegan_floo or feedback_pt_319)
  begin
      protest_cow =  vegan_floo | !feedback_pt_319;
  end

reg feedback_pt_320;

always @(zedong_nyc or feedback_pt_320)
  begin
      george_hp =  zedong_nyc ^  feedback_pt_320;
  end

reg feedback_pt_321;

always @(leidiot_ghost or feedback_pt_321)
  begin
      opus_riddler =  leidiot_ghost |  feedback_pt_321;
  end

reg feedback_pt_322;

always @(riddler_hans or feedback_pt_322)
  begin
      pizza_rose = !riddler_hans &  feedback_pt_322;
  end

reg feedback_pt_323;

always @(chainsaw_clay or feedback_pt_323)
  begin
      kilo_autotest = !chainsaw_clay |  feedback_pt_323;
  end

reg feedback_pt_324;

always @(vcc or feedback_pt_324)
  begin
      fitter_pilot = !vcc &  feedback_pt_324;
  end

reg feedback_pt_325;

always @(egg_plague or feedback_pt_325)
  begin
      bravo_exodus =  egg_plague & !feedback_pt_325;
  end

reg feedback_pt_326;

always @(tsmc_milhouse or feedback_pt_326)
  begin
      spastic_todd = !tsmc_milhouse ^ !feedback_pt_326;
  end

reg feedback_pt_327;

always @(oscar_nyquil or feedback_pt_327)
  begin
      golfland_roid = !oscar_nyquil &  feedback_pt_327;
  end

reg feedback_pt_328;

always @(guy_steaming or feedback_pt_328)
  begin
      richard_lamer = !guy_steaming & !feedback_pt_328;
  end

reg feedback_pt_329;

always @(lsd_shuda or feedback_pt_329)
  begin
      beemer_floo = !lsd_shuda ^ !feedback_pt_329;
  end

reg feedback_pt_330;

always @(advil_army or feedback_pt_330)
  begin
      vicks_tracy =  advil_army |  feedback_pt_330;
  end

reg feedback_pt_331;

always @(gnd or feedback_pt_331)
  begin
      escape_jesus = !gnd &  feedback_pt_331;
  end

  always@(*)
  begin
    dragon_broom = ~( ~( ( ( ~( dow_blue | ~vcc ) ) | ~gnd | ~vcc | ~pilot_nasdaq ) ) ) ? ( ( ~( ~( ~dow_blue ) ^ ~condit_pirate & smack_beavis ) ) | ( ~vcc & advil_iceland ) | ~( ~vegas_abraham ) | ( ~( ~( ~dweebie_issac ) ) | ~lupin_gotone ) ) | ~( ( ~maklak_waffle ^ ( ( ~( spastic_todd & ~gnd ) ) | ~( ~zed_weevil ) ) ) ) : deuce_salsa;
  end

initial begin
    {burner_bfi,egg_wonton,abraham_albus,curie_lost,wine_mine,monkey_barney} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({gyro_love_in,vcc,rouge_alpha,klinton_macys,stix_mickey,malfoy_indigo} < {gnd,beetle_star,gnd,north_fortuyn,beemer_floo,lemon_joseph})
       {burner_bfi,egg_wonton,abraham_albus,curie_lost,wine_mine,monkey_barney} <= {gnd,beetle_star,gnd,north_fortuyn,beemer_floo,lemon_joseph};
    else
       {burner_bfi,egg_wonton,abraham_albus,curie_lost,wine_mine,monkey_barney} <= {gyro_love_in,vcc,rouge_alpha,klinton_macys,stix_mickey,malfoy_indigo};
  end

// 5 bit add sub
always @(gnd or gnd or richard_lamer or gnd or quebec_crank or southern_bfi or dimetap_vegan or boitano_wine or gnd or rod_sebastian)
  begin
    {mrbill_mars,athena_barty,marge_dirty,salsa_master,sirius_tobiko} = 
		{gnd,gnd,richard_lamer,gnd,quebec_crank} - 
		{southern_bfi,dimetap_vegan,boitano_wine,gnd,rod_sebastian};
  end

// OR all of these bits together
always @(kana_red or vcc or tiger_skipper or gnd or speed_tuna or jason_drunken)
  begin
      venus_martian = | {kana_red,vcc,tiger_skipper,gnd,speed_tuna,jason_drunken};
  end

reg feedback_pt_332;

always @(bravo_exodus or feedback_pt_332)
  begin
      goat_romex = !bravo_exodus ^  feedback_pt_332;
  end

reg feedback_pt_333;

always @(egg_might or feedback_pt_333)
  begin
      fang_atilla =  egg_might &  feedback_pt_333;
  end

reg feedback_pt_334;

always @(stix_mickey or feedback_pt_334)
  begin
      egg_barney = !stix_mickey & !feedback_pt_334;
  end

reg feedback_pt_335;

always @(gnd or feedback_pt_335)
  begin
      eagle_centaur = !gnd ^  feedback_pt_335;
  end

reg feedback_pt_336;

always @(bust_zen or feedback_pt_336)
  begin
      ramone_palmer =  bust_zen ^ !feedback_pt_336;
  end

reg feedback_pt_337;

always @(bear_morrison or feedback_pt_337)
  begin
      schwinger_red = !bear_morrison & !feedback_pt_337;
  end

reg feedback_pt_338;

always @(vcc or feedback_pt_338)
  begin
      potato_bull = !vcc ^  feedback_pt_338;
  end

reg feedback_pt_339;

always @(southern_bfi or feedback_pt_339)
  begin
      pixie_kungfu =  southern_bfi | !feedback_pt_339;
  end

reg feedback_pt_340;

always @(rose_hp or feedback_pt_340)
  begin
      pasta_shuda = !rose_hp | !feedback_pt_340;
  end

reg feedback_pt_341;

always @(stick_roid or feedback_pt_341)
  begin
      lost_agitator =  stick_roid & !feedback_pt_341;
  end

reg feedback_pt_342;

always @(zedong_coffee or feedback_pt_342)
  begin
      square_cubish = !zedong_coffee ^ !feedback_pt_342;
  end

reg feedback_pt_343;

always @(lsd_shuda or feedback_pt_343)
  begin
      dig_fsncens = !lsd_shuda &  feedback_pt_343;
  end

reg feedback_pt_344;

always @(opus_riddler or feedback_pt_344)
  begin
      lao_shudamak =  opus_riddler ^ !feedback_pt_344;
  end

reg feedback_pt_345;

always @(too_big_dirk or feedback_pt_345)
  begin
      hawaii_marco =  too_big_dirk | !feedback_pt_345;
  end

reg feedback_pt_346;

always @(bfi_obiwan or feedback_pt_346)
  begin
      palmer_bust = !bfi_obiwan | !feedback_pt_346;
  end

reg feedback_pt_347;

always @(vcc or feedback_pt_347)
  begin
      rodriguez_guy = !vcc & !feedback_pt_347;
  end

reg feedback_pt_348;

always @(vicks_tracy or feedback_pt_348)
  begin
      wonder_stroop =  vicks_tracy ^  feedback_pt_348;
  end

reg feedback_pt_349;

always @(illegal_duck or feedback_pt_349)
  begin
      marco_orange =  illegal_duck ^ !feedback_pt_349;
  end

reg feedback_pt_350;

always @(spyro_lotus or feedback_pt_350)
  begin
      bep_defoliant = !spyro_lotus | !feedback_pt_350;
  end

reg feedback_pt_351;

always @(spastic_todd or feedback_pt_351)
  begin
      what_eel = !spastic_todd ^  feedback_pt_351;
  end

reg feedback_pt_352;

always @(athena_barty or feedback_pt_352)
  begin
      happy_mortar = !athena_barty | !feedback_pt_352;
  end

reg feedback_pt_353;

always @(tsmc_milhouse or feedback_pt_353)
  begin
      metal_romulus = !tsmc_milhouse | !feedback_pt_353;
  end

reg feedback_pt_354;

always @(wine_eggsalad or feedback_pt_354)
  begin
      bravo_arcade = !wine_eggsalad & !feedback_pt_354;
  end

reg feedback_pt_355;

always @(cafe_concorde or feedback_pt_355)
  begin
      chowmein_haze =  cafe_concorde &  feedback_pt_355;
  end

reg feedback_pt_356;

always @(sirius_tobiko or feedback_pt_356)
  begin
      ham_bacon =  sirius_tobiko | !feedback_pt_356;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_gin <= 1;
    else
      moron_gin <= gnd;
  end

always @(moron_gin)
  begin
      feedback_pt_283 = moron_gin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roe_kanji <= 0;
    else if (lao_ritsu)
      roe_kanji <= penguin_cheez;
    else if (eggsalad_dirk)
      roe_kanji <= 0;
  end

always @(roe_kanji)
  begin
      feedback_pt_284 = roe_kanji;
  end

always @(roe_kanji)
  begin
      feedback_pt_285 = roe_kanji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nyc_candle <= 0;
    else if (vcc)
      nyc_candle <= klinton_macys;
    else if (vcc)
      nyc_candle <= 0;
  end

always @(nyc_candle)
  begin
      feedback_pt_286 = nyc_candle;
  end

always @(nyc_candle)
  begin
      feedback_pt_287 = nyc_candle;
  end

always @(nyc_candle)
  begin
      feedback_pt_288 = nyc_candle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elf_killer <= 1;
    else
      elf_killer <= nyc_pizza;
  end

always @(elf_killer)
  begin
      feedback_pt_289 = elf_killer;
  end

always @(elf_killer)
  begin
      feedback_pt_290 = elf_killer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_plague <= 1;
    else
      curie_plague <= george_hp;
  end

always @(curie_plague)
  begin
      feedback_pt_291 = curie_plague;
  end

always @(curie_plague)
  begin
      feedback_pt_292 = curie_plague;
  end

always @(curie_plague)
  begin
      feedback_pt_293 = curie_plague;
  end

always @(curie_plague)
  begin
      feedback_pt_294 = curie_plague;
  end

always @(curie_plague)
  begin
      feedback_pt_295 = curie_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spyro_neon <= 0;
    else if (gm_lotus)
      spyro_neon <= 0;
    else if (vcc)
      spyro_neon <= eggsalad_dirk;
  end

always @(spyro_neon)
  begin
      feedback_pt_296 = spyro_neon;
  end

always @(spyro_neon)
  begin
      feedback_pt_297 = spyro_neon;
  end

always @(spyro_neon)
  begin
      feedback_pt_298 = spyro_neon;
  end

always @(spyro_neon)
  begin
      feedback_pt_299 = spyro_neon;
  end

always @(spyro_neon)
  begin
      feedback_pt_300 = spyro_neon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ocha_meffert <= 1;
    else
      ocha_meffert <= sake_billnted;
  end

always @(ocha_meffert)
  begin
      feedback_pt_301 = ocha_meffert;
  end

always @(ocha_meffert)
  begin
      feedback_pt_302 = ocha_meffert;
  end

always @(ocha_meffert)
  begin
      feedback_pt_303 = ocha_meffert;
  end

always @(ocha_meffert)
  begin
      feedback_pt_304 = ocha_meffert;
  end

always @(ocha_meffert)
  begin
      feedback_pt_305 = ocha_meffert;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kungfu_elian <= 0;
    else if (issac_gonzo)
      kungfu_elian <= sheep_gyro;
  end

always @(kungfu_elian)
  begin
      feedback_pt_306 = kungfu_elian;
  end

always @(kungfu_elian)
  begin
      feedback_pt_307 = kungfu_elian;
  end

always @(kungfu_elian)
  begin
      feedback_pt_308 = kungfu_elian;
  end

always @(kungfu_elian)
  begin
      feedback_pt_309 = kungfu_elian;
  end

always @(kungfu_elian)
  begin
      feedback_pt_310 = kungfu_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gap_greenbay <= 0;
    else if (gnd)
      gap_greenbay <= liberace_lad;
  end

always @(gap_greenbay)
  begin
      feedback_pt_311 = gap_greenbay;
  end

always @(gap_greenbay)
  begin
      feedback_pt_312 = gap_greenbay;
  end

always @(gap_greenbay)
  begin
      feedback_pt_313 = gap_greenbay;
  end

always @(gap_greenbay)
  begin
      feedback_pt_314 = gap_greenbay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gilligan_mine <= 0;
    else
      gilligan_mine <= vcc;
  end

always @(gilligan_mine)
  begin
      feedback_pt_315 = gilligan_mine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hector_potato <= 0;
    else if (beetle_star)
      hector_potato <= north_fortuyn;
  end

always @(hector_potato)
  begin
      feedback_pt_316 = hector_potato;
  end

always @(hector_potato)
  begin
      feedback_pt_317 = hector_potato;
  end

always @(hector_potato)
  begin
      feedback_pt_318 = hector_potato;
  end

always @(hector_potato)
  begin
      feedback_pt_319 = hector_potato;
  end

always @(hector_potato)
  begin
      feedback_pt_320 = hector_potato;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tsmc_wildboar <= 0;
    else if (nyc_pizza)
      tsmc_wildboar <= 0;
    else if (gnd)
      tsmc_wildboar <= hinge_enoch;
  end

always @(tsmc_wildboar)
  begin
      feedback_pt_321 = tsmc_wildboar;
  end

always @(tsmc_wildboar)
  begin
      feedback_pt_322 = tsmc_wildboar;
  end

always @(tsmc_wildboar)
  begin
      feedback_pt_323 = tsmc_wildboar;
  end

always @(tsmc_wildboar)
  begin
      feedback_pt_324 = tsmc_wildboar;
  end

always @(tsmc_wildboar)
  begin
      feedback_pt_325 = tsmc_wildboar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_curious <= 1;
    else
      moron_curious <= kilo_autotest;
  end

always @(moron_curious)
  begin
      feedback_pt_326 = moron_curious;
  end

always @(moron_curious)
  begin
      feedback_pt_327 = moron_curious;
  end

always @(moron_curious)
  begin
      feedback_pt_328 = moron_curious;
  end

always @(moron_curious)
  begin
      feedback_pt_329 = moron_curious;
  end

always @(moron_curious)
  begin
      feedback_pt_330 = moron_curious;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jesus_rubik <= 0;
    else
      jesus_rubik <= beemer_floo;
  end

always @(jesus_rubik)
  begin
      feedback_pt_331 = jesus_rubik;
  end

always @(jesus_rubik)
  begin
      feedback_pt_332 = jesus_rubik;
  end

always @(jesus_rubik)
  begin
      feedback_pt_333 = jesus_rubik;
  end

always @(jesus_rubik)
  begin
      feedback_pt_334 = jesus_rubik;
  end

always @(jesus_rubik)
  begin
      feedback_pt_335 = jesus_rubik;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      what_doobie <= 1;
    else
      what_doobie <= palmer_bust;
  end

always @(what_doobie)
  begin
      feedback_pt_336 = what_doobie;
  end

always @(what_doobie)
  begin
      feedback_pt_337 = what_doobie;
  end

always @(what_doobie)
  begin
      feedback_pt_338 = what_doobie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_larry <= 1;
    else
      rose_larry <= roe_abraham;
  end

always @(rose_larry)
  begin
      feedback_pt_339 = rose_larry;
  end

always @(rose_larry)
  begin
      feedback_pt_340 = rose_larry;
  end

always @(rose_larry)
  begin
      feedback_pt_341 = rose_larry;
  end

always @(rose_larry)
  begin
      feedback_pt_342 = rose_larry;
  end

always @(rose_larry)
  begin
      feedback_pt_343 = rose_larry;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_tapered <= 0;
    else if (sugar_coconut)
      oscar_tapered <= vcc;
  end

always @(oscar_tapered)
  begin
      feedback_pt_344 = oscar_tapered;
  end

always @(oscar_tapered)
  begin
      feedback_pt_345 = oscar_tapered;
  end

always @(oscar_tapered)
  begin
      feedback_pt_346 = oscar_tapered;
  end

wire chillis_cybex_wire;

dffeas chillis_cybex_ff (
  .clk(clock1),
  .d(spyro_neon),
  .ena(gnd),
  .sclr(tonks_jesus),
  .sload(gilligan_mine),
  .asdata(stroop_mexico),
  .clrn(!reset1),
  .q(chillis_cybex_wire)
);

always @(chillis_cybex_wire) begin
   spain_yellow = chillis_cybex_wire;
end

always @(spain_yellow)
  begin
      feedback_pt_347 = spain_yellow;
  end

wire homerun_meth_wire;

dffeas homerun_meth_ff (
  .clk(clock1),
  .d(gnd),
  .ena(vcc),
  .sclr(hector_potato),
  .sload(llama_palm),
  .asdata(sand_badger),
  .clrn(!reset1),
  .q(homerun_meth_wire)
);

always @(homerun_meth_wire) begin
   advil_yummy = homerun_meth_wire;
end

always @(advil_yummy)
  begin
      feedback_pt_348 = advil_yummy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foryou_subway <= 0;
    else if (fang_atilla)
      foryou_subway <= egg_barney;
    else if (curie_lost)
      foryou_subway <= 0;
  end

always @(foryou_subway)
  begin
      feedback_pt_349 = foryou_subway;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      freaky_pdaddy <= 0;
    else if (vcc)
      freaky_pdaddy <= vcc;
    else if (vcc)
      freaky_pdaddy <= 0;
  end

always @(freaky_pdaddy)
  begin
      feedback_pt_350 = freaky_pdaddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bonker_gonzo <= 0;
    else if (vcc)
      bonker_gonzo <= gnd;
  end

always @(bonker_gonzo)
  begin
      feedback_pt_351 = bonker_gonzo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bfs_mortar <= 0;
    else if (protest_cow)
      bfs_mortar <= roe_kanji;
    else if (gnd)
      bfs_mortar <= 0;
  end

always @(bfs_mortar)
  begin
      feedback_pt_352 = bfs_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hans_palmer <= 0;
    else
      hans_palmer <= salsa_master;
  end

always @(hans_palmer)
  begin
      feedback_pt_353 = hans_palmer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_sogood <= 0;
    else
      curie_sogood <= onion_trevor;
  end

always @(curie_sogood)
  begin
      feedback_pt_354 = curie_sogood;
  end

wire life_rabbi_wire;

dffeas life_rabbi_ff (
  .clk(clock1),
  .d(kabar_mortar),
  .ena(pepsi_spanish),
  .sclr(gnd),
  .sload(hans_palmer),
  .asdata(foryou_subway),
  .clrn(!reset1),
  .q(life_rabbi_wire)
);

always @(life_rabbi_wire) begin
   fear_exodus = life_rabbi_wire;
end

always @(fear_exodus)
  begin
      feedback_pt_355 = fear_exodus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_rose <= 0;
    else if (vcc)
      itchy_rose <= gnd;
  end

always @(itchy_rose)
  begin
      feedback_pt_356 = itchy_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      parrot_dragon <= 1;
    else
      parrot_dragon <= nyc_candle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yak_holepunch <= 0;
    else if (purple_rod)
      yak_holepunch <= 0;
    else if (hinge_enoch)
      yak_holepunch <= escape_escape;
  end

wire ajax_spyro_wire;

dffeas ajax_spyro_ff (
  .clk(clock1),
  .d(itchy_rose),
  .ena(marco_orange),
  .sclr(elf_killer),
  .sload(beemer_floo),
  .asdata(ladder_loser),
  .clrn(!reset1),
  .q(ajax_spyro_wire)
);

always @(ajax_spyro_wire) begin
   indigo_buddha = ajax_spyro_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wood_notalot <= 1;
    else
      wood_notalot <= gap_greenbay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minerva_wakey <= 0;
    else
      minerva_wakey <= curie_sogood;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_gutter <= 0;
    else if (what_doobie)
      pirate_gutter <= fire_whack;
    else if (dragon_broom)
      pirate_gutter <= 0;
  end

wire wonder_fronds_wire;

dffeas wonder_fronds_ff (
  .clk(clock1),
  .d(rod_sebastian),
  .ena(rodriguez_guy),
  .sclr(gyro_love_in),
  .sload(bravo_arcade),
  .asdata(foryou_subway),
  .clrn(!reset1),
  .q(wonder_fronds_wire)
);

always @(wonder_fronds_wire) begin
   orange_cubish = wonder_fronds_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nasdaq_shemp <= 0;
    else if (rarest_tabby)
      nasdaq_shemp <= curie_plague;
    else if (moron_curious)
      nasdaq_shemp <= 0;
  end

wire whattime_bert_wire;

dffea whattime_bert_ff (
  .clk(clock1),
  .d(west_stick),
  .ena(goblin_cubish),
  .adata(fang_atilla),
  .clrn(!reset1),
  .q(whattime_bert_wire)
);

always @(whattime_bert_wire) begin
   opus_liberace = whattime_bert_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sanity_hp <= 1;
    else
      sanity_hp <= fitter_pilot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stick_intuit <= 0;
    else if (ocha_meffert)
      stick_intuit <= lumber_kmfdm;
    else if (wine_mine)
      stick_intuit <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iron_cheese <= 0;
    else if (bear_speedyg)
      iron_cheese <= 0;
    else if (tabby_nuclear)
      iron_cheese <= ariel_wujing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hulk_kaisha <= 0;
    else if (vcc)
      hulk_kaisha <= fatality_sun;
    else if (pirate_gutter)
      hulk_kaisha <= 0;
  end

reg feedback_pt_357;

always @(vcc or feedback_pt_357)
  begin
      ready_spirit =  vcc & !feedback_pt_357;
  end

reg feedback_pt_358;

always @(liberace_lad or feedback_pt_358)
  begin
      show_theseus =  liberace_lad |  feedback_pt_358;
  end

reg feedback_pt_359;

always @(gnd or feedback_pt_359)
  begin
      molokai_rum = !gnd |  feedback_pt_359;
  end

reg feedback_pt_360;

always @(gnd or feedback_pt_360)
  begin
      seashell_abel = !gnd &  feedback_pt_360;
  end

reg feedback_pt_361;

always @(ginger_tsmc or feedback_pt_361)
  begin
      maryann_yoku = !ginger_tsmc ^ !feedback_pt_361;
  end

reg feedback_pt_362;

always @(guy_steaming or feedback_pt_362)
  begin
      lao_steaming = !guy_steaming ^ !feedback_pt_362;
  end

reg feedback_pt_363;

always @(happy_mortar or feedback_pt_363)
  begin
      float_floo = !happy_mortar ^ !feedback_pt_363;
  end

reg feedback_pt_364;

always @(molokai_rum or feedback_pt_364)
  begin
      beetle_whale = !molokai_rum | !feedback_pt_364;
  end

reg feedback_pt_365;

always @(chowmein_haze or feedback_pt_365)
  begin
      elf_east = !chowmein_haze ^ !feedback_pt_365;
  end

reg feedback_pt_366;

always @(vcc or feedback_pt_366)
  begin
      boitano_boing =  vcc ^  feedback_pt_366;
  end

reg feedback_pt_367;

always @(zed_weevil or feedback_pt_367)
  begin
      pcp_master =  zed_weevil &  feedback_pt_367;
  end

reg feedback_pt_368;

always @(rose_hp or feedback_pt_368)
  begin
      isle_mortgate = !rose_hp &  feedback_pt_368;
  end

reg feedback_pt_369;

always @(vcc or feedback_pt_369)
  begin
      acid_gopher =  vcc ^ !feedback_pt_369;
  end

reg feedback_pt_370;

always @(ladder_loser or feedback_pt_370)
  begin
      norbert_goofy = !ladder_loser |  feedback_pt_370;
  end

reg feedback_pt_371;

always @(rouge_east or feedback_pt_371)
  begin
      yummy_pizza =  rouge_east ^  feedback_pt_371;
  end

reg feedback_pt_372;

always @(gnd or feedback_pt_372)
  begin
      deng_gerrit = !gnd &  feedback_pt_372;
  end

reg feedback_pt_373;

always @(zed_weevil or feedback_pt_373)
  begin
      echo_zealot =  zed_weevil |  feedback_pt_373;
  end

reg feedback_pt_374;

always @(gnd or feedback_pt_374)
  begin
      rerun_might = !gnd | !feedback_pt_374;
  end

reg feedback_pt_375;

always @(kebab_arizona or feedback_pt_375)
  begin
      ebay_sogood =  kebab_arizona & !feedback_pt_375;
  end

reg feedback_pt_376;

always @(thread_quail or feedback_pt_376)
  begin
      nigiri_chuck =  thread_quail &  feedback_pt_376;
  end

reg feedback_pt_377;

always @(emu_abraham or feedback_pt_377)
  begin
      nigiri_ford = !emu_abraham & !feedback_pt_377;
  end

reg feedback_pt_378;

always @(gnd or feedback_pt_378)
  begin
      lizard_peta = !gnd &  feedback_pt_378;
  end

reg feedback_pt_379;

always @(lao_shudamak or feedback_pt_379)
  begin
      donald_rescue = !lao_shudamak |  feedback_pt_379;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jupiter_lsd <= 1;
    else
      jupiter_lsd <= lsd_downers;
  end

always @(jupiter_lsd)
  begin
      feedback_pt_357 = jupiter_lsd;
  end

always @(jupiter_lsd)
  begin
      feedback_pt_358 = jupiter_lsd;
  end

always @(jupiter_lsd)
  begin
      feedback_pt_359 = jupiter_lsd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kennyg_barney <= 0;
    else if (kilo_autotest)
      kennyg_barney <= bear_speedyg;
    else if (gnd)
      kennyg_barney <= 0;
  end

always @(kennyg_barney)
  begin
      feedback_pt_360 = kennyg_barney;
  end

always @(kennyg_barney)
  begin
      feedback_pt_361 = kennyg_barney;
  end

always @(kennyg_barney)
  begin
      feedback_pt_362 = kennyg_barney;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      delta_desert <= 0;
    else if (grumby_haze)
      delta_desert <= gnd;
    else if (sand_badger)
      delta_desert <= 0;
  end

always @(delta_desert)
  begin
      feedback_pt_363 = delta_desert;
  end

always @(delta_desert)
  begin
      feedback_pt_364 = delta_desert;
  end

always @(delta_desert)
  begin
      feedback_pt_365 = delta_desert;
  end

wire lao_pegasus_wire;

dffeas lao_pegasus_ff (
  .clk(clock1),
  .d(molokai_rum),
  .ena(cocaine_bart),
  .sclr(north_fortuyn),
  .sload(gyro_love_in),
  .asdata(minerva_wakey),
  .clrn(!reset1),
  .q(lao_pegasus_wire)
);

always @(lao_pegasus_wire) begin
   blanket_tonks = lao_pegasus_wire;
end

always @(blanket_tonks)
  begin
      feedback_pt_366 = blanket_tonks;
  end

always @(blanket_tonks)
  begin
      feedback_pt_367 = blanket_tonks;
  end

always @(blanket_tonks)
  begin
      feedback_pt_368 = blanket_tonks;
  end

always @(blanket_tonks)
  begin
      feedback_pt_369 = blanket_tonks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_lovey <= 0;
    else if (acid_gopher)
      richard_lovey <= 0;
    else if (lao_ritsu)
      richard_lovey <= sand_badger;
  end

always @(richard_lovey)
  begin
      feedback_pt_370 = richard_lovey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_aphid <= 0;
    else
      pcp_aphid <= oldnavy_romex;
  end

always @(pcp_aphid)
  begin
      feedback_pt_371 = pcp_aphid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      obiwan_tonks <= 0;
    else if (what_eel)
      obiwan_tonks <= gnd;
    else if (zen_firstpart)
      obiwan_tonks <= 0;
  end

always @(obiwan_tonks)
  begin
      feedback_pt_372 = obiwan_tonks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gin_golden <= 0;
    else
      gin_golden <= wine_monster;
  end

always @(gin_golden)
  begin
      feedback_pt_373 = gin_golden;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_foiled <= 0;
    else if (advil_yummy)
      tobe_foiled <= seashell_abel;
  end

always @(tobe_foiled)
  begin
      feedback_pt_374 = tobe_foiled;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burner_often <= 0;
    else if (dig_fsncens)
      burner_often <= float_floo;
  end

always @(burner_often)
  begin
      feedback_pt_375 = burner_often;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dweebie_ring <= 1;
    else
      dweebie_ring <= popcorn_whack;
  end

always @(dweebie_ring)
  begin
      feedback_pt_376 = dweebie_ring;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      babette_aphid <= 0;
    else if (blanket_tonks)
      babette_aphid <= 0;
    else if (golfland_roid)
      babette_aphid <= metal_heidi;
  end

always @(babette_aphid)
  begin
      feedback_pt_377 = babette_aphid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lockheed_fire <= 0;
    else
      lockheed_fire <= gnd;
  end

always @(lockheed_fire)
  begin
      feedback_pt_378 = lockheed_fire;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_shuda <= 0;
    else if (bfs_mortar)
      bagel_shuda <= alpha_maryann;
  end

always @(bagel_shuda)
  begin
      feedback_pt_379 = bagel_shuda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chainsaw_tofu <= 0;
    else if (baron_clay)
      chainsaw_tofu <= gnd;
    else if (marge_dirty)
      chainsaw_tofu <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spirit_norris <= 1;
    else
      spirit_norris <= west_sand;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      touch_scotch <= 0;
    else if (lockheed_fire)
      touch_scotch <= romex_whiskey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheez_zedong <= 0;
    else if (wonder_stroop)
      cheez_zedong <= 0;
    else if (vcc)
      cheez_zedong <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      badger_donkey <= 0;
    else if (vcc)
      badger_donkey <= minerva_wakey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lizard_donkey <= 0;
    else if (gnd)
      lizard_donkey <= shark_richard;
  end

wire ihilani_vadar_wire;

dffeas ihilani_vadar_ff (
  .clk(clock1),
  .d(palmer_dadada),
  .ena(delta_desert),
  .sclr(athena_barty),
  .sload(dig_uppers),
  .asdata(vcc),
  .clrn(!reset1),
  .q(ihilani_vadar_wire)
);

always @(ihilani_vadar_wire) begin
   jonas_bep = ihilani_vadar_wire;
end

wire vangoh_ebay_wire;

dffeas vangoh_ebay_ff (
  .clk(clock1),
  .d(echo_zealot),
  .ena(gnd),
  .sclr(speed_tuna),
  .sload(beemer_floo),
  .asdata(orange_cubish),
  .clrn(!reset1),
  .q(vangoh_ebay_wire)
);

always @(vangoh_ebay_wire) begin
   fire_boing = vangoh_ebay_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gap_india <= 1;
    else
      gap_india <= stick_intuit;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      my_tummy_zi <= 0;
    else if (burner_often)
      my_tummy_zi <= spain_yellow;
    else if (gnd)
      my_tummy_zi <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jonas_aspirin <= 0;
    else if (ham_bacon)
      jonas_aspirin <= tsmc_wildboar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      timmy_snake <= 0;
    else if (pizza_rose)
      timmy_snake <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_zipporah <= 0;
    else if (gnd)
      emu_zipporah <= 0;
    else if (lizard_donkey)
      emu_zipporah <= genji_dweebie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      enoch_vangoh <= 0;
    else if (rouge_alpha)
      enoch_vangoh <= gnd;
    else if (kebab_nyquil)
      enoch_vangoh <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dirty_cow <= 0;
    else if (palmer_dadada)
      dirty_cow <= tsmc_wildboar;
    else if (athena_barty)
      dirty_cow <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_clothing <= 0;
    else if (rerun_might)
      newt_clothing <= lao_shudamak;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mickey_willy <= 0;
    else if (illegal_duck)
      mickey_willy <= nigiri_ford;
    else if (baron_foliage)
      mickey_willy <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      soccer_moe <= 0;
    else if (gnd)
      soccer_moe <= babette_aphid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      weasley_hinge <= 1;
    else
      weasley_hinge <= bonker_gonzo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bismuth_fire <= 0;
    else if (gnd)
      bismuth_fire <= 0;
    else if (badger_donkey)
      bismuth_fire <= sanity_hp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sand_lotus <= 0;
    else if (west_sand)
      sand_lotus <= cheez_zedong;
    else if (parrot_dragon)
      sand_lotus <= 0;
  end

wire yoku_tonic_wire;

dffeas yoku_tonic_ff (
  .clk(clock1),
  .d(vcc),
  .ena(grumby_haze),
  .sclr(zeus_hinkley),
  .sload(jupiter_lsd),
  .asdata(pixie_kungfu),
  .clrn(!reset1),
  .q(yoku_tonic_wire)
);

always @(yoku_tonic_wire) begin
   mexico_atoms = yoku_tonic_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_curie <= 0;
    else if (indigo_buddha)
      south_curie <= iron_cheese;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      att_maryann <= 0;
    else if (baron_foliage)
      att_maryann <= 0;
    else if (isle_mortgate)
      att_maryann <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whack_smack <= 0;
    else
      whack_smack <= eagle_beef;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_questo <= 0;
    else if (gin_golden)
      hinge_questo <= 0;
    else if (enoch_vangoh)
      hinge_questo <= wood_notalot;
  end

// Random combinatorial logic block
always@(*)
  begin
      tsmc_snape = ~( ~( ( ~( ~( ~lumber_kmfdm ) | ~( gnd ) ) ) ^ ~( ( ~( gnd | ~gnd ) ) ) ) );
  end

  always@(*)
  begin
    victor_cuanto = ~( ~( ( ~( ~hawaii_marco & ~nigiri_chuck ) & ( ( albus_what & ~oldnavy_romex ) ^ ( newt_clothing & vcc ) ) ) ) ) ? ~( ~( ~( ~( hans_palmer ) ) | ( ~( aphid_lantern ) | ( ~( kebab_nyquil | ~lumber_kmfdm ) ) ) ) ) : ~( ~( ~( ( ~soccer_moe | ~gnd ) ) ) ) | ~( ~( wine_eggsalad ) );
  end
// Note - state 3 is unreachable
// State Mek baron_viagra Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      baron_viagra <= baron_viagra_0;
    else
      case (baron_viagra)
        baron_viagra_0: begin
          if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 7)
            baron_viagra <= baron_viagra_4;
          else
            baron_viagra <= baron_viagra_0;
          end
        baron_viagra_1: begin
          if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 15)
            baron_viagra <= baron_viagra_0;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 9)
            baron_viagra <= baron_viagra_4;
          else
            baron_viagra <= baron_viagra_1;
          end
        baron_viagra_2: begin
          if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 11)
            baron_viagra <= baron_viagra_1;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 1)
            baron_viagra <= baron_viagra_2;
          else
            baron_viagra <= baron_viagra_2;
          end
        baron_viagra_3: begin
          if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 10)
            baron_viagra <= baron_viagra_1;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 9)
            baron_viagra <= baron_viagra_3;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 11)
            baron_viagra <= baron_viagra_2;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 6)
            baron_viagra <= baron_viagra_3;
          else
            baron_viagra <= baron_viagra_3;
          end
        baron_viagra_4: begin
          if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 11)
            baron_viagra <= baron_viagra_4;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 6)
            baron_viagra <= baron_viagra_2;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 5)
            baron_viagra <= baron_viagra_2;
          else if ({egg_wonton,nigiri_chuck,rocks_ohisee,gnd} == 3)
            baron_viagra <= baron_viagra_2;
          else
            baron_viagra <= baron_viagra_4;
          end
        default: baron_viagra <= baron_viagra_0;
      endcase
  end

// State Mek baron_viagra Output logic
always @(baron_viagra)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (baron_viagra[3:1])
        baron_viagra_0: begin
            elephant_gm = 0;
            blanket_pilot = 0;
            ceres_intel = 0;
            superman_todd = 0;
            mike_lotus = 1;
            cocacola_milo = 0;
            parrot_hippo = 0;
            nyc_rod = 0;
            acid_tapered = 1;
            pepsi_gerard = 0;
            crack_kungfu = 0;
          end
        baron_viagra_1: begin
            elephant_gm = 1;
            blanket_pilot = 0;
            ceres_intel = 0;
            superman_todd = 0;
            mike_lotus = 1;
            cocacola_milo = 0;
            parrot_hippo = 0;
            nyc_rod = 1;
            acid_tapered = 0;
            pepsi_gerard = 1;
            crack_kungfu = 1;
          end
        default: begin
            elephant_gm = 0;
            blanket_pilot = 1;
            ceres_intel = 0;
            superman_todd = 1;
            mike_lotus = 1;
            cocacola_milo = 0;
            parrot_hippo = 1;
            nyc_rod = 1;
            acid_tapered = 1;
            pepsi_gerard = 1;
            crack_kungfu = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire fish_itchy_out;
nut_003_lut #(1) nut_003_lut_inst_fish_itchy (
  .din({athena_barty}),
  .mask(2'b00),
  .out(fish_itchy_out)
);

always @(fish_itchy_out)
begin
   snape_neptune = fish_itchy_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire dog_charlie_out;
nut_003_lut #(3) nut_003_lut_inst_dog_charlie (
  .din({vcc,deng_gerrit,superman_todd}),
  .mask(8'b01000000),
  .out(dog_charlie_out)
);

always @(dog_charlie_out)
begin
   star_ernie = dog_charlie_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire turnip_foiled_out;
nut_003_lut #(1) nut_003_lut_inst_turnip_foiled (
  .din({seashell_abel}),
  .mask(2'b01),
  .out(turnip_foiled_out)
);

always @(turnip_foiled_out)
begin
   hp_rampacker = turnip_foiled_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_003_lut.v
///////////////////////////////////////////

wire moe_burning_out;
nut_003_lut #(1) nut_003_lut_inst_moe_burning (
  .din({tobe_foiled}),
  .mask(2'b10),
  .out(moe_burning_out)
);

always @(moe_burning_out)
begin
   jason_dirty = moe_burning_out;
end

// In range compare
always @(chainsaw_tofu or blanket_pilot)
  begin
    if ({chainsaw_tofu,blanket_pilot} > 79 &&
        {chainsaw_tofu,blanket_pilot} < 155)
      mexican_mike = 1;
    else
      mexican_mike = 0;
  end

// 4 bit up counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {papa_sun,zen_drugie,wizard_snape,tunafish_duey} <= 0;
    else
      {papa_sun,zen_drugie,wizard_snape,tunafish_duey} <= {papa_sun,zen_drugie,wizard_snape,tunafish_duey} + 1;
  end

always @(fear_exodus or elephant_gm or ariel_wujing or isle_mortgate or ready_spirit or 
   fear_exodus or elephant_gm or ariel_wujing or isle_mortgate or often_pdaddy or 
   deng_gerrit
)
  begin
    if (deng_gerrit)
    begin
      case ({{fear_exodus,elephant_gm,ariel_wujing,isle_mortgate},ready_spirit})
        0: whiskey_crank=0;
        1: whiskey_crank=0;
        2: whiskey_crank=1;
        3: whiskey_crank=0;
        4: whiskey_crank=0;
        5: whiskey_crank=0;
        6: whiskey_crank=0;
        7: whiskey_crank=0;
        8: whiskey_crank=0;
        9: whiskey_crank=0;
        10: whiskey_crank=1;
        11: whiskey_crank=1;
        12: whiskey_crank=1;
        13: whiskey_crank=0;
        14: whiskey_crank=0;
        15: whiskey_crank=1;
        16: whiskey_crank=1;
        17: whiskey_crank=1;
        18: whiskey_crank=1;
        19: whiskey_crank=1;
        20: whiskey_crank=0;
        21: whiskey_crank=0;
        22: whiskey_crank=1;
        23: whiskey_crank=1;
        24: whiskey_crank=1;
        25: whiskey_crank=0;
        26: whiskey_crank=0;
        27: whiskey_crank=0;
        28: whiskey_crank=1;
        29: whiskey_crank=0;
        30: whiskey_crank=1;
        31: whiskey_crank=1;
      default: whiskey_crank=0;
      endcase
    end
    else
    begin
      case ({{fear_exodus,elephant_gm,ariel_wujing,isle_mortgate},often_pdaddy})
        0: whiskey_crank=0;
        1: whiskey_crank=0;
        2: whiskey_crank=1;
        3: whiskey_crank=0;
        4: whiskey_crank=1;
        5: whiskey_crank=1;
        6: whiskey_crank=1;
        7: whiskey_crank=1;
        8: whiskey_crank=1;
        9: whiskey_crank=1;
        10: whiskey_crank=1;
        11: whiskey_crank=1;
        12: whiskey_crank=0;
        13: whiskey_crank=1;
        14: whiskey_crank=1;
        15: whiskey_crank=0;
        16: whiskey_crank=1;
        17: whiskey_crank=1;
        18: whiskey_crank=1;
        19: whiskey_crank=1;
        20: whiskey_crank=1;
        21: whiskey_crank=1;
        22: whiskey_crank=1;
        23: whiskey_crank=0;
        24: whiskey_crank=1;
        25: whiskey_crank=1;
        26: whiskey_crank=0;
        27: whiskey_crank=0;
        28: whiskey_crank=0;
        29: whiskey_crank=0;
        30: whiskey_crank=0;
        31: whiskey_crank=0;
      default: whiskey_crank=0;
      endcase
    end
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bono_bonafide <= 0;
    else
    case ({ebay_sogood,llama_bismuth})
       0 : bono_bonafide <= bono_bonafide;
       1 : bono_bonafide <= bono_bonafide;
       2 : bono_bonafide <= vcc;
       3 : bono_bonafide <= gnd;
       default : bono_bonafide <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_drax <= 0;
    else
    case ({gnd,mexican_mike})
       0 : sogood_drax <= gnd;
       1 : sogood_drax <= sogood_drax;
       2 : sogood_drax <= emu_zipporah;
       3 : sogood_drax <= sogood_drax;
       default : sogood_drax <= 0;
    endcase
  end

reg feedback_pt_380;

always @(vcc or feedback_pt_380)
  begin
      burner_hurt =  vcc |  feedback_pt_380;
  end

reg feedback_pt_381;

always @(vcc or feedback_pt_381)
  begin
      fury_mozart =  vcc &  feedback_pt_381;
  end

reg feedback_pt_382;

always @(freaky_pdaddy or feedback_pt_382)
  begin
      what_booming = !freaky_pdaddy ^ !feedback_pt_382;
  end

reg feedback_pt_383;

always @(advil_yummy or feedback_pt_383)
  begin
      sinew_intel =  advil_yummy ^ !feedback_pt_383;
  end

reg feedback_pt_384;

always @(lao_steaming or feedback_pt_384)
  begin
      bacon_nest = !lao_steaming |  feedback_pt_384;
  end

reg feedback_pt_385;

always @(gnd or feedback_pt_385)
  begin
      killme_arcade =  gnd &  feedback_pt_385;
  end

reg feedback_pt_386;

always @(maryann_yoku or feedback_pt_386)
  begin
      ariel_thedon = !maryann_yoku ^ !feedback_pt_386;
  end

reg feedback_pt_387;

always @(dweebie_issac or feedback_pt_387)
  begin
      crank_mozart = !dweebie_issac | !feedback_pt_387;
  end

reg feedback_pt_388;

always @(noah_mexican or feedback_pt_388)
  begin
      diagon_zebra = !noah_mexican &  feedback_pt_388;
  end

reg feedback_pt_389;

always @(ceres_intel or feedback_pt_389)
  begin
      sgates_juliet =  ceres_intel |  feedback_pt_389;
  end

reg feedback_pt_390;

always @(pirate_gutter or feedback_pt_390)
  begin
      itchy_oranje =  pirate_gutter &  feedback_pt_390;
  end

reg feedback_pt_391;

always @(zen_drugie or feedback_pt_391)
  begin
      platinum_frog = !zen_drugie |  feedback_pt_391;
  end

reg feedback_pt_392;

always @(ginger_hinge or feedback_pt_392)
  begin
      hulk_doobie = !ginger_hinge &  feedback_pt_392;
  end

reg feedback_pt_393;

always @(iron_cheese or feedback_pt_393)
  begin
      echo_testyour = !iron_cheese & !feedback_pt_393;
  end

reg feedback_pt_394;

always @(bono_bonafide or feedback_pt_394)
  begin
      ykocens_kana =  bono_bonafide ^  feedback_pt_394;
  end

reg feedback_pt_395;

always @(gnd or feedback_pt_395)
  begin
      golden_robust =  gnd ^  feedback_pt_395;
  end

reg feedback_pt_396;

always @(bagel_shuda or feedback_pt_396)
  begin
      oscar_jupiter =  bagel_shuda ^  feedback_pt_396;
  end

reg feedback_pt_397;

always @(gnd or feedback_pt_397)
  begin
      whiskey_bambi = !gnd & !feedback_pt_397;
  end

reg feedback_pt_398;

always @(advil_yummy or feedback_pt_398)
  begin
      ramone_romex =  advil_yummy ^  feedback_pt_398;
  end

reg feedback_pt_399;

always @(gnd or feedback_pt_399)
  begin
      protest_mine = !gnd ^ !feedback_pt_399;
  end

reg feedback_pt_400;

always @(pcp_master or feedback_pt_400)
  begin
      illegal_dow =  pcp_master |  feedback_pt_400;
  end

reg feedback_pt_401;

always @(rerun_husks or feedback_pt_401)
  begin
      kanji_bambi =  rerun_husks |  feedback_pt_401;
  end

reg feedback_pt_402;

always @(rerun_husks or feedback_pt_402)
  begin
      furnace_kilo =  rerun_husks & !feedback_pt_402;
  end

reg feedback_pt_403;

always @(vcc or feedback_pt_403)
  begin
      ceres_bach =  vcc ^  feedback_pt_403;
  end

reg feedback_pt_404;

always @(gnd or feedback_pt_404)
  begin
      oranges_loud = !gnd ^  feedback_pt_404;
  end

reg feedback_pt_405;

always @(dweebie_ring or feedback_pt_405)
  begin
      curie_aspirin =  dweebie_ring |  feedback_pt_405;
  end

reg feedback_pt_406;

always @(gnd or feedback_pt_406)
  begin
      fitter_honey =  gnd &  feedback_pt_406;
  end

reg feedback_pt_407;

always @(metal_romulus or feedback_pt_407)
  begin
      vangoh_dadada =  metal_romulus &  feedback_pt_407;
  end

reg feedback_pt_408;

always @(vcc or feedback_pt_408)
  begin
      vegan_lupin = !vcc | !feedback_pt_408;
  end

reg feedback_pt_409;

always @(bagel_shuda or feedback_pt_409)
  begin
      chevys_mexico = !bagel_shuda &  feedback_pt_409;
  end

reg feedback_pt_410;

always @(ernie_emu or feedback_pt_410)
  begin
      bacon_drugs = !ernie_emu | !feedback_pt_410;
  end

reg feedback_pt_411;

always @(maryann_yoku or feedback_pt_411)
  begin
      bolt_kabar = !maryann_yoku |  feedback_pt_411;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boots_macys <= 0;
    else if (echo_zealot)
      boots_macys <= 0;
    else if (eagle_beef)
      boots_macys <= dirty_cow;
  end

always @(boots_macys)
  begin
      feedback_pt_380 = boots_macys;
  end

always @(boots_macys)
  begin
      feedback_pt_381 = boots_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roid_broom <= 1;
    else
      roid_broom <= burner_hurt;
  end

always @(roid_broom)
  begin
      feedback_pt_382 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_383 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_384 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_385 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_386 = roid_broom;
  end

wire star_arthur_wire;

dffeas star_arthur_ff (
  .clk(clock1),
  .d(hp_rampacker),
  .ena(salsa_master),
  .sclr(gnd),
  .sload(square_cubish),
  .asdata(south_curie),
  .clrn(!reset1),
  .q(star_arthur_wire)
);

always @(star_arthur_wire) begin
   turnip_deng = star_arthur_wire;
end

always @(turnip_deng)
  begin
      feedback_pt_387 = turnip_deng;
  end

always @(turnip_deng)
  begin
      feedback_pt_388 = turnip_deng;
  end

always @(turnip_deng)
  begin
      feedback_pt_389 = turnip_deng;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      master_milo <= 1;
    else
      master_milo <= palmer_bust;
  end

always @(master_milo)
  begin
      feedback_pt_390 = master_milo;
  end

always @(master_milo)
  begin
      feedback_pt_391 = master_milo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      raiders_louie <= 0;
    else if (roid_broom)
      raiders_louie <= 0;
    else if (seashell_mars)
      raiders_louie <= vcc;
  end

always @(raiders_louie)
  begin
      feedback_pt_392 = raiders_louie;
  end

always @(raiders_louie)
  begin
      feedback_pt_393 = raiders_louie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_picante <= 0;
    else if (sogood_drax)
      knot_picante <= spirit_norris;
    else if (sgates_juliet)
      knot_picante <= 0;
  end

always @(knot_picante)
  begin
      feedback_pt_394 = knot_picante;
  end

always @(knot_picante)
  begin
      feedback_pt_395 = knot_picante;
  end

wire sirius_dopey_wire;

dffeas sirius_dopey_ff (
  .clk(clock1),
  .d(mexico_atoms),
  .ena(mike_lotus),
  .sclr(vcc),
  .sload(crank_mozart),
  .asdata(gnd),
  .clrn(!reset1),
  .q(sirius_dopey_wire)
);

always @(sirius_dopey_wire) begin
   killer_hanger = sirius_dopey_wire;
end

always @(killer_hanger)
  begin
      feedback_pt_396 = killer_hanger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      china_whacky <= 0;
    else if (boots_macys)
      china_whacky <= bear_speedyg;
  end

always @(china_whacky)
  begin
      feedback_pt_397 = china_whacky;
  end

always @(china_whacky)
  begin
      feedback_pt_398 = china_whacky;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kappa_drax <= 0;
    else if (itchy_oranje)
      kappa_drax <= hulk_doobie;
    else if (spyro_neon)
      kappa_drax <= 0;
  end

always @(kappa_drax)
  begin
      feedback_pt_399 = kappa_drax;
  end

always @(kappa_drax)
  begin
      feedback_pt_400 = kappa_drax;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_surfer <= 0;
    else
      often_surfer <= fire_boing;
  end

always @(often_surfer)
  begin
      feedback_pt_401 = often_surfer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      acid_muffin <= 0;
    else if (vcc)
      acid_muffin <= turkey_tank;
    else if (dweebie_ring)
      acid_muffin <= 0;
  end

always @(acid_muffin)
  begin
      feedback_pt_402 = acid_muffin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elguapo_ghost <= 0;
    else if (gnd)
      elguapo_ghost <= burning_ohno;
  end

always @(elguapo_ghost)
  begin
      feedback_pt_403 = elguapo_ghost;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tattoo_bloom <= 0;
    else if (elguapo_ghost)
      tattoo_bloom <= 0;
    else if (beetle_whale)
      tattoo_bloom <= gnd;
  end

always @(tattoo_bloom)
  begin
      feedback_pt_404 = tattoo_bloom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_badger <= 1;
    else
      salmon_badger <= egg_barney;
  end

always @(salmon_badger)
  begin
      feedback_pt_405 = salmon_badger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fire_hiswife <= 0;
    else
      fire_hiswife <= malfoy_indigo;
  end

always @(fire_hiswife)
  begin
      feedback_pt_406 = fire_hiswife;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chips_jacuzzi <= 0;
    else if (gnd)
      chips_jacuzzi <= 0;
    else if (opus_liberace)
      chips_jacuzzi <= zedong_coffee;
  end

always @(chips_jacuzzi)
  begin
      feedback_pt_407 = chips_jacuzzi;
  end

wire rodent_south_wire;

dffeas rodent_south_ff (
  .clk(clock1),
  .d(obiwan_tonks),
  .ena(gap_greenbay),
  .sclr(falafel_north),
  .sload(platinum_frog),
  .asdata(malfoy_indigo),
  .clrn(!reset1),
  .q(rodent_south_wire)
);

always @(rodent_south_wire) begin
   iceland_egg = rodent_south_wire;
end

always @(iceland_egg)
  begin
      feedback_pt_408 = iceland_egg;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      would_husks <= 0;
    else if (wine_eggsalad)
      would_husks <= vcc;
    else if (stick_intuit)
      would_husks <= 0;
  end

always @(would_husks)
  begin
      feedback_pt_409 = would_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kbtoys_pepsi <= 0;
    else if (molokai_rum)
      kbtoys_pepsi <= mickey_willy;
    else if (bfs_star)
      kbtoys_pepsi <= 0;
  end

always @(kbtoys_pepsi)
  begin
      feedback_pt_410 = kbtoys_pepsi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacob_ulysses <= 0;
    else if (gnd)
      jacob_ulysses <= whiskey_bambi;
    else if (burner_bfi)
      jacob_ulysses <= 0;
  end

always @(jacob_ulysses)
  begin
      feedback_pt_411 = jacob_ulysses;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vicks_bach <= 0;
    else if (china_whacky)
      vicks_bach <= boitano_boing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      uniform_crank <= 1;
    else
      uniform_crank <= ramone_palmer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      Iwin_neon <= 0;
    else if (ramone_romex)
      Iwin_neon <= moron_gin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spirit_loser <= 0;
    else if (rod_sebastian)
      spirit_loser <= golfland_roid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roe_lad <= 0;
    else if (soccer_moe)
      roe_lad <= monkey_barney;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      george_soccer <= 0;
    else
      george_soccer <= pasta_shuda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_eagle <= 0;
    else
      tiger_eagle <= golden_robust;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zulu_satanist <= 0;
    else if (fitter_honey)
      zulu_satanist <= zen_drugie;
    else if (vcc)
      zulu_satanist <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huey_banality <= 0;
    else if (kennyg_barney)
      huey_banality <= 0;
    else if (nasdaq_shemp)
      huey_banality <= lizard_donkey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      saturn_iguana <= 0;
    else
      saturn_iguana <= papa_sun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yak_edible <= 0;
    else if (gnd)
      yak_edible <= vcc;
    else if (bacon_drugs)
      yak_edible <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_vadar <= 1;
    else
      ham_vadar <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boitano_romeo <= 0;
    else if (tunafish_duey)
      boitano_romeo <= vicks_bach;
    else if (vcc)
      boitano_romeo <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_crack <= 1;
    else
      often_crack <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_tylenol <= 0;
    else if (klinton_macys)
      star_tylenol <= 0;
    else if (gnd)
      star_tylenol <= sand_lotus;
  end

wire dingbat_lad_wire;

dffeas dingbat_lad_ff (
  .clk(clock1),
  .d(gnd),
  .ena(diagon_zebra),
  .sclr(delta_desert),
  .sload(ariel_thedon),
  .asdata(nyc_rod),
  .clrn(!reset1),
  .q(dingbat_lad_wire)
);

always @(dingbat_lad_wire) begin
   psycho_goofy = dingbat_lad_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mushroom_east <= 0;
    else
      mushroom_east <= often_surfer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      howell_hans <= 0;
    else
      howell_hans <= hinge_questo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      Iwin_intuit <= 0;
    else if (chevys_mexico)
      Iwin_intuit <= 0;
    else if (bep_defoliant)
      Iwin_intuit <= roe_lad;
  end

// XNOR all of these bits together
always @(pixie_spain or eagle_beef or protest_mine or ariel_thedon or boitano_romeo or stick_intuit or gnd or pixie_spain)
  begin
      zen_loud = ~^ {pixie_spain,eagle_beef,protest_mine,ariel_thedon,boitano_romeo,stick_intuit,gnd,pixie_spain};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iron_wonton <= 0;
    else
    case ({zulu_satanist,jonas_aspirin})
       0 : iron_wonton <= iron_wonton;
       1 : iron_wonton <= iron_wonton;
       2 : iron_wonton <= iron_wonton;
       3 : iron_wonton <= iron_wonton;
       default : iron_wonton <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_flew <= 0;
    else
    case ({stroop_mexico,gap_india})
       0 : pirate_flew <= fire_boing;
       1 : pirate_flew <= pirate_flew;
       2 : pirate_flew <= vcc;
       3 : pirate_flew <= vcc;
       default : pirate_flew <= 0;
    endcase
  end

// 4 bit priority MUX
always @(
        tonks_jesus or mushroom_east  or 
        howell_hans or vcc  or 
        ernie_emu or jacob_ulysses  or 
        vcc or furnace_kilo 
)

  begin
    if (tonks_jesus) crab_iterate = mushroom_east;
    else if (howell_hans) crab_iterate = vcc;
    else if (ernie_emu) crab_iterate = jacob_ulysses;
    else if (vcc) crab_iterate = furnace_kilo;
    else crab_iterate = 0;
  end

// AND all of these bits together
always @(homer_goofy or knot_picante or spirit_norris or potato_bull or spirit_loser or gnd or gnd or roid_broom)
  begin
      hawaii_turnip = & {homer_goofy,knot_picante,spirit_norris,potato_bull,spirit_loser,gnd,gnd,roid_broom};
  end

// Random 3 input look up table
always @(parrot_hippo or iceland_egg or gnd)
  begin
    casex ({parrot_hippo,iceland_egg,gnd})
      0: green_eeevil=0;
      1: green_eeevil=0;
      2: green_eeevil=0;
      3: green_eeevil=0;
      4: green_eeevil=1;
      5: green_eeevil=1;
      6: green_eeevil=1;
      7: green_eeevil=1;
      default: green_eeevil=0;
    endcase
  end

// OR all of these bits together
always @(oscar_jupiter or potato_bull or killme_arcade or zen_loud or fitter_honey or goat_romex or vcc or victor_cuanto or vcc or gnd)
  begin
      rescue_hp = | {oscar_jupiter,potato_bull,killme_arcade,zen_loud,fitter_honey,goat_romex,vcc,victor_cuanto,vcc,gnd};
  end

// Greater Equal Less compare
always @(wizard_snape or illegal_dow or vcc or wonder_stroop or pizza_rose or chainsaw_tofu)
  begin
    if ({wizard_snape,illegal_dow,vcc} > {wonder_stroop,pizza_rose,chainsaw_tofu})
       {touch_neptune,foxtrot_honda,happy_bear} = 3'b100;
    else if ({wizard_snape,illegal_dow,vcc} < {wonder_stroop,pizza_rose,chainsaw_tofu})
       {touch_neptune,foxtrot_honda,happy_bear} = 3'b010;
    else
       {touch_neptune,foxtrot_honda,happy_bear} = 3'b001;
  end

// Greater Equal Less compare
always @(acid_tapered or vcc or jonas_bep or whiskey_crank)
  begin
    if ({acid_tapered,vcc} > {jonas_bep,whiskey_crank})
       {dutch_victor,loud_romulus,hurt_pluto} = 3'b100;
    else if ({acid_tapered,vcc} < {jonas_bep,whiskey_crank})
       {dutch_victor,loud_romulus,hurt_pluto} = 3'b010;
    else
       {dutch_victor,loud_romulus,hurt_pluto} = 3'b001;
  end

// XOR all of these bits together
always @(fire_hiswife or liberace_lad or oscar_jupiter or tunafish_duey)
  begin
      iterate_south = ^ {fire_hiswife,liberace_lad,oscar_jupiter,tunafish_duey};
  end

// Greater Equal Less compare
always @(gnd or vicks_bach or zulu_satanist or crab_iterate or happy_bear or vcc or vcc or uniform_crank or wonder_stroop or gnd or huey_banality or vcc)
  begin
    if ({gnd,vicks_bach,zulu_satanist,crab_iterate,happy_bear,vcc} > {vcc,uniform_crank,wonder_stroop,gnd,huey_banality,vcc})
       {mouse_icarus,kaisha_yak,homer_donkey} = 3'b100;
    else if ({gnd,vicks_bach,zulu_satanist,crab_iterate,happy_bear,vcc} < {vcc,uniform_crank,wonder_stroop,gnd,huey_banality,vcc})
       {mouse_icarus,kaisha_yak,homer_donkey} = 3'b010;
    else
       {mouse_icarus,kaisha_yak,homer_donkey} = 3'b001;
  end

// NOR all of these bits together
always @(elephant_gm or square_cubish or rodriguez_guy or gnd or bolt_kabar or gnd or yummy_pizza or gnd or bismuth_fire)
  begin
      ceres_whale = ~| {elephant_gm,square_cubish,rodriguez_guy,gnd,bolt_kabar,gnd,yummy_pizza,gnd,bismuth_fire};
  end

// 3 bit SOP selector
always @(
        norbert_goofy or kaisha_yak  or 
        gnd or gnd  or 
        foxtrot_honda or frog_emails 
)

begin
    shrimp_eagle = 
      norbert_goofy & kaisha_yak |
      gnd & gnd |
      foxtrot_honda & frog_emails;
end

// XOR all of these bits together
always @(iron_wonton or gnd)
  begin
      jacques_bach = ^ {iron_wonton,gnd};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_faster <= 0;
    else
    case ({egg_barney,kbtoys_pepsi})
       0 : often_faster <= protest_cow;
       1 : often_faster <= often_faster;
       2 : often_faster <= often_faster;
       3 : often_faster <= rescue_hp;
       default : often_faster <= 0;
    endcase
  end

// 7 bit priority MUX
always @(
        gnd or vcc  or 
        iterate_south or kungfu_elian  or 
        gnd or vcc  or 
        tunafish_duey or shrimp_eagle  or 
        egg_plague or star_ernie  or 
        seashell_mars or Iwin_neon  or 
        knot_picante or ceres_bach 
)

  begin
    if (gnd) palm_what = vcc;
    else if (iterate_south) palm_what = kungfu_elian;
    else if (gnd) palm_what = vcc;
    else if (tunafish_duey) palm_what = shrimp_eagle;
    else if (egg_plague) palm_what = star_ernie;
    else if (seashell_mars) palm_what = Iwin_neon;
    else if (knot_picante) palm_what = ceres_bach;
    else palm_what = 0;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_zinc <= 0;
    else
    case ({jesus_rubik,tonks_jesus})
       0 : ladder_zinc <= vcc;
       1 : ladder_zinc <= ladder_zinc;
       2 : ladder_zinc <= gnd;
       3 : ladder_zinc <= ladder_zinc;
       default : ladder_zinc <= 0;
    endcase
  end

// AND all of these bits together
always @(venus_martian or ykocens_kana or bravo_hours or speed_tuna or rouge_alpha or pirate_flew or eggsalad_dirk or kebab_nyquil or gnd or psycho_goofy)
  begin
      whiskey_egg = & {venus_martian,ykocens_kana,bravo_hours,speed_tuna,rouge_alpha,pirate_flew,eggsalad_dirk,kebab_nyquil,gnd,psycho_goofy};
  end


initial begin
    {lion_sheep,cheese_ebi,muffin_joseph,balloon_yoku,tuna_bracket} = 0;
end

// Registered 5 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (jonas_bep)
      {lion_sheep,cheese_ebi,muffin_joseph,balloon_yoku,tuna_bracket} <= 0;
    else if (vcc)
      {lion_sheep,cheese_ebi,muffin_joseph,balloon_yoku,tuna_bracket} <=
		  {donald_rescue,gnd,bono_bonafide,bacon_nest,orange_cubish};
    else
      {lion_sheep,cheese_ebi,muffin_joseph,balloon_yoku,tuna_bracket} <=
		 {square_cubish,pizza_rose,vcc,rocks_ohisee,gnd} + 
		 {oranges_loud,speed_tuna,gnd,kappa_drax,tattoo_bloom};
  end

// 7 bit priority MUX
always @(
        turnip_deng or palm_what  or 
        sinew_intel or green_eeevil  or 
        dutch_victor or gnd  or 
        gnd or iron_wonton  or 
        show_theseus or gnd  or 
        viagra_plague or tonic_whale  or 
        cain_wiggles or saturn_iguana 
)

  begin
    if (turnip_deng) mao_willem = palm_what;
    else if (sinew_intel) mao_willem = green_eeevil;
    else if (dutch_victor) mao_willem = gnd;
    else if (gnd) mao_willem = iron_wonton;
    else if (show_theseus) mao_willem = gnd;
    else if (viagra_plague) mao_willem = tonic_whale;
    else if (cain_wiggles) mao_willem = saturn_iguana;
    else mao_willem = 0;
  end

// OR all of these bits together
always @(crack_kungfu or mike_lotus or superman_todd or homer_donkey or abraham_albus or goblin_cubish or frog_emails or gnd or gnd or cocacola_milo or gnd)
  begin
      arcade_chuck = | {crack_kungfu,mike_lotus,superman_todd,homer_donkey,abraham_albus,goblin_cubish,frog_emails,gnd,gnd,cocacola_milo,gnd};
  end

// Random 9 input look up table
always @(vcc or ceres_whale or vcc or gnd or gnd or hp_rampacker or eggsalad_dirk or jason_drunken or vcc)
  begin
    casex ({vcc,ceres_whale,vcc,gnd,gnd,hp_rampacker,eggsalad_dirk,jason_drunken,vcc})
      0: malfoy_bull=0;
      1: malfoy_bull=1;
      2: malfoy_bull=1;
      3: malfoy_bull=0;
      4: malfoy_bull=0;
      5: malfoy_bull=0;
      6: malfoy_bull=0;
      7: malfoy_bull=0;
      8: malfoy_bull=1;
      9: malfoy_bull=0;
      10: malfoy_bull=1;
      11: malfoy_bull=1;
      12: malfoy_bull=1;
      13: malfoy_bull=0;
      14: malfoy_bull=1;
      15: malfoy_bull=0;
      16: malfoy_bull=1;
      17: malfoy_bull=0;
      18: malfoy_bull=1;
      19: malfoy_bull=0;
      20: malfoy_bull=1;
      21: malfoy_bull=1;
      22: malfoy_bull=1;
      23: malfoy_bull=0;
      24: malfoy_bull=1;
      25: malfoy_bull=0;
      26: malfoy_bull=1;
      27: malfoy_bull=0;
      28: malfoy_bull=1;
      29: malfoy_bull=1;
      30: malfoy_bull=0;
      31: malfoy_bull=0;
      32: malfoy_bull=1;
      33: malfoy_bull=0;
      34: malfoy_bull=0;
      35: malfoy_bull=0;
      36: malfoy_bull=1;
      37: malfoy_bull=1;
      38: malfoy_bull=0;
      39: malfoy_bull=1;
      40: malfoy_bull=1;
      41: malfoy_bull=1;
      42: malfoy_bull=1;
      43: malfoy_bull=1;
      44: malfoy_bull=0;
      45: malfoy_bull=0;
      46: malfoy_bull=1;
      47: malfoy_bull=1;
      48: malfoy_bull=0;
      49: malfoy_bull=1;
      50: malfoy_bull=1;
      51: malfoy_bull=1;
      52: malfoy_bull=0;
      53: malfoy_bull=1;
      54: malfoy_bull=0;
      55: malfoy_bull=1;
      56: malfoy_bull=1;
      57: malfoy_bull=1;
      58: malfoy_bull=0;
      59: malfoy_bull=0;
      60: malfoy_bull=1;
      61: malfoy_bull=0;
      62: malfoy_bull=0;
      63: malfoy_bull=1;
      64: malfoy_bull=0;
      65: malfoy_bull=1;
      66: malfoy_bull=1;
      67: malfoy_bull=0;
      68: malfoy_bull=1;
      69: malfoy_bull=0;
      70: malfoy_bull=1;
      71: malfoy_bull=1;
      72: malfoy_bull=1;
      73: malfoy_bull=1;
      74: malfoy_bull=0;
      75: malfoy_bull=0;
      76: malfoy_bull=0;
      77: malfoy_bull=0;
      78: malfoy_bull=0;
      79: malfoy_bull=1;
      80: malfoy_bull=0;
      81: malfoy_bull=1;
      82: malfoy_bull=1;
      83: malfoy_bull=0;
      84: malfoy_bull=1;
      85: malfoy_bull=0;
      86: malfoy_bull=0;
      87: malfoy_bull=0;
      88: malfoy_bull=1;
      89: malfoy_bull=0;
      90: malfoy_bull=0;
      91: malfoy_bull=0;
      92: malfoy_bull=0;
      93: malfoy_bull=0;
      94: malfoy_bull=1;
      95: malfoy_bull=1;
      96: malfoy_bull=1;
      97: malfoy_bull=1;
      98: malfoy_bull=0;
      99: malfoy_bull=1;
      100: malfoy_bull=1;
      101: malfoy_bull=1;
      102: malfoy_bull=1;
      103: malfoy_bull=0;
      104: malfoy_bull=0;
      105: malfoy_bull=0;
      106: malfoy_bull=0;
      107: malfoy_bull=1;
      108: malfoy_bull=0;
      109: malfoy_bull=1;
      110: malfoy_bull=0;
      111: malfoy_bull=1;
      112: malfoy_bull=0;
      113: malfoy_bull=0;
      114: malfoy_bull=1;
      115: malfoy_bull=0;
      116: malfoy_bull=0;
      117: malfoy_bull=0;
      118: malfoy_bull=0;
      119: malfoy_bull=0;
      120: malfoy_bull=0;
      121: malfoy_bull=0;
      122: malfoy_bull=0;
      123: malfoy_bull=0;
      124: malfoy_bull=1;
      125: malfoy_bull=1;
      126: malfoy_bull=1;
      127: malfoy_bull=0;
      128: malfoy_bull=0;
      129: malfoy_bull=1;
      130: malfoy_bull=0;
      131: malfoy_bull=0;
      132: malfoy_bull=1;
      133: malfoy_bull=1;
      134: malfoy_bull=1;
      135: malfoy_bull=1;
      136: malfoy_bull=0;
      137: malfoy_bull=1;
      138: malfoy_bull=0;
      139: malfoy_bull=1;
      140: malfoy_bull=1;
      141: malfoy_bull=0;
      142: malfoy_bull=1;
      143: malfoy_bull=1;
      144: malfoy_bull=0;
      145: malfoy_bull=0;
      146: malfoy_bull=1;
      147: malfoy_bull=1;
      148: malfoy_bull=0;
      149: malfoy_bull=0;
      150: malfoy_bull=1;
      151: malfoy_bull=1;
      152: malfoy_bull=0;
      153: malfoy_bull=1;
      154: malfoy_bull=0;
      155: malfoy_bull=1;
      156: malfoy_bull=1;
      157: malfoy_bull=0;
      158: malfoy_bull=1;
      159: malfoy_bull=0;
      160: malfoy_bull=0;
      161: malfoy_bull=1;
      162: malfoy_bull=1;
      163: malfoy_bull=0;
      164: malfoy_bull=0;
      165: malfoy_bull=0;
      166: malfoy_bull=1;
      167: malfoy_bull=1;
      168: malfoy_bull=1;
      169: malfoy_bull=1;
      170: malfoy_bull=0;
      171: malfoy_bull=1;
      172: malfoy_bull=1;
      173: malfoy_bull=0;
      174: malfoy_bull=1;
      175: malfoy_bull=1;
      176: malfoy_bull=0;
      177: malfoy_bull=1;
      178: malfoy_bull=0;
      179: malfoy_bull=0;
      180: malfoy_bull=0;
      181: malfoy_bull=1;
      182: malfoy_bull=1;
      183: malfoy_bull=0;
      184: malfoy_bull=0;
      185: malfoy_bull=1;
      186: malfoy_bull=1;
      187: malfoy_bull=0;
      188: malfoy_bull=1;
      189: malfoy_bull=1;
      190: malfoy_bull=0;
      191: malfoy_bull=0;
      192: malfoy_bull=1;
      193: malfoy_bull=0;
      194: malfoy_bull=1;
      195: malfoy_bull=1;
      196: malfoy_bull=1;
      197: malfoy_bull=1;
      198: malfoy_bull=1;
      199: malfoy_bull=0;
      200: malfoy_bull=1;
      201: malfoy_bull=0;
      202: malfoy_bull=1;
      203: malfoy_bull=0;
      204: malfoy_bull=1;
      205: malfoy_bull=0;
      206: malfoy_bull=0;
      207: malfoy_bull=0;
      208: malfoy_bull=1;
      209: malfoy_bull=0;
      210: malfoy_bull=0;
      211: malfoy_bull=0;
      212: malfoy_bull=1;
      213: malfoy_bull=1;
      214: malfoy_bull=0;
      215: malfoy_bull=0;
      216: malfoy_bull=0;
      217: malfoy_bull=0;
      218: malfoy_bull=0;
      219: malfoy_bull=0;
      220: malfoy_bull=0;
      221: malfoy_bull=0;
      222: malfoy_bull=0;
      223: malfoy_bull=0;
      224: malfoy_bull=0;
      225: malfoy_bull=0;
      226: malfoy_bull=1;
      227: malfoy_bull=1;
      228: malfoy_bull=1;
      229: malfoy_bull=1;
      230: malfoy_bull=1;
      231: malfoy_bull=1;
      232: malfoy_bull=0;
      233: malfoy_bull=1;
      234: malfoy_bull=0;
      235: malfoy_bull=1;
      236: malfoy_bull=0;
      237: malfoy_bull=1;
      238: malfoy_bull=1;
      239: malfoy_bull=0;
      240: malfoy_bull=0;
      241: malfoy_bull=1;
      242: malfoy_bull=0;
      243: malfoy_bull=1;
      244: malfoy_bull=1;
      245: malfoy_bull=1;
      246: malfoy_bull=0;
      247: malfoy_bull=1;
      248: malfoy_bull=1;
      249: malfoy_bull=0;
      250: malfoy_bull=0;
      251: malfoy_bull=1;
      252: malfoy_bull=0;
      253: malfoy_bull=0;
      254: malfoy_bull=0;
      255: malfoy_bull=0;
      256: malfoy_bull=1;
      257: malfoy_bull=1;
      258: malfoy_bull=1;
      259: malfoy_bull=0;
      260: malfoy_bull=1;
      261: malfoy_bull=0;
      262: malfoy_bull=0;
      263: malfoy_bull=0;
      264: malfoy_bull=1;
      265: malfoy_bull=1;
      266: malfoy_bull=0;
      267: malfoy_bull=1;
      268: malfoy_bull=0;
      269: malfoy_bull=0;
      270: malfoy_bull=0;
      271: malfoy_bull=0;
      272: malfoy_bull=0;
      273: malfoy_bull=1;
      274: malfoy_bull=0;
      275: malfoy_bull=0;
      276: malfoy_bull=1;
      277: malfoy_bull=1;
      278: malfoy_bull=1;
      279: malfoy_bull=0;
      280: malfoy_bull=0;
      281: malfoy_bull=1;
      282: malfoy_bull=0;
      283: malfoy_bull=0;
      284: malfoy_bull=0;
      285: malfoy_bull=1;
      286: malfoy_bull=1;
      287: malfoy_bull=1;
      288: malfoy_bull=0;
      289: malfoy_bull=1;
      290: malfoy_bull=0;
      291: malfoy_bull=0;
      292: malfoy_bull=0;
      293: malfoy_bull=0;
      294: malfoy_bull=1;
      295: malfoy_bull=1;
      296: malfoy_bull=1;
      297: malfoy_bull=1;
      298: malfoy_bull=0;
      299: malfoy_bull=1;
      300: malfoy_bull=0;
      301: malfoy_bull=0;
      302: malfoy_bull=0;
      303: malfoy_bull=0;
      304: malfoy_bull=1;
      305: malfoy_bull=0;
      306: malfoy_bull=1;
      307: malfoy_bull=1;
      308: malfoy_bull=1;
      309: malfoy_bull=1;
      310: malfoy_bull=1;
      311: malfoy_bull=1;
      312: malfoy_bull=1;
      313: malfoy_bull=1;
      314: malfoy_bull=0;
      315: malfoy_bull=1;
      316: malfoy_bull=0;
      317: malfoy_bull=0;
      318: malfoy_bull=0;
      319: malfoy_bull=1;
      320: malfoy_bull=0;
      321: malfoy_bull=0;
      322: malfoy_bull=1;
      323: malfoy_bull=1;
      324: malfoy_bull=0;
      325: malfoy_bull=1;
      326: malfoy_bull=0;
      327: malfoy_bull=1;
      328: malfoy_bull=1;
      329: malfoy_bull=0;
      330: malfoy_bull=0;
      331: malfoy_bull=1;
      332: malfoy_bull=1;
      333: malfoy_bull=0;
      334: malfoy_bull=1;
      335: malfoy_bull=1;
      336: malfoy_bull=1;
      337: malfoy_bull=0;
      338: malfoy_bull=0;
      339: malfoy_bull=0;
      340: malfoy_bull=0;
      341: malfoy_bull=1;
      342: malfoy_bull=1;
      343: malfoy_bull=0;
      344: malfoy_bull=1;
      345: malfoy_bull=0;
      346: malfoy_bull=0;
      347: malfoy_bull=1;
      348: malfoy_bull=0;
      349: malfoy_bull=0;
      350: malfoy_bull=1;
      351: malfoy_bull=1;
      352: malfoy_bull=0;
      353: malfoy_bull=1;
      354: malfoy_bull=0;
      355: malfoy_bull=1;
      356: malfoy_bull=0;
      357: malfoy_bull=1;
      358: malfoy_bull=1;
      359: malfoy_bull=1;
      360: malfoy_bull=1;
      361: malfoy_bull=0;
      362: malfoy_bull=0;
      363: malfoy_bull=1;
      364: malfoy_bull=1;
      365: malfoy_bull=1;
      366: malfoy_bull=1;
      367: malfoy_bull=0;
      368: malfoy_bull=0;
      369: malfoy_bull=1;
      370: malfoy_bull=0;
      371: malfoy_bull=0;
      372: malfoy_bull=0;
      373: malfoy_bull=1;
      374: malfoy_bull=1;
      375: malfoy_bull=1;
      376: malfoy_bull=1;
      377: malfoy_bull=0;
      378: malfoy_bull=1;
      379: malfoy_bull=1;
      380: malfoy_bull=1;
      381: malfoy_bull=1;
      382: malfoy_bull=1;
      383: malfoy_bull=1;
      384: malfoy_bull=0;
      385: malfoy_bull=0;
      386: malfoy_bull=1;
      387: malfoy_bull=0;
      388: malfoy_bull=1;
      389: malfoy_bull=0;
      390: malfoy_bull=1;
      391: malfoy_bull=1;
      392: malfoy_bull=1;
      393: malfoy_bull=1;
      394: malfoy_bull=0;
      395: malfoy_bull=0;
      396: malfoy_bull=1;
      397: malfoy_bull=1;
      398: malfoy_bull=1;
      399: malfoy_bull=0;
      400: malfoy_bull=1;
      401: malfoy_bull=0;
      402: malfoy_bull=1;
      403: malfoy_bull=0;
      404: malfoy_bull=1;
      405: malfoy_bull=0;
      406: malfoy_bull=0;
      407: malfoy_bull=1;
      408: malfoy_bull=1;
      409: malfoy_bull=0;
      410: malfoy_bull=0;
      411: malfoy_bull=1;
      412: malfoy_bull=1;
      413: malfoy_bull=0;
      414: malfoy_bull=1;
      415: malfoy_bull=0;
      416: malfoy_bull=1;
      417: malfoy_bull=1;
      418: malfoy_bull=1;
      419: malfoy_bull=1;
      420: malfoy_bull=0;
      421: malfoy_bull=0;
      422: malfoy_bull=1;
      423: malfoy_bull=0;
      424: malfoy_bull=1;
      425: malfoy_bull=0;
      426: malfoy_bull=0;
      427: malfoy_bull=1;
      428: malfoy_bull=0;
      429: malfoy_bull=1;
      430: malfoy_bull=0;
      431: malfoy_bull=0;
      432: malfoy_bull=0;
      433: malfoy_bull=1;
      434: malfoy_bull=0;
      435: malfoy_bull=1;
      436: malfoy_bull=1;
      437: malfoy_bull=0;
      438: malfoy_bull=0;
      439: malfoy_bull=0;
      440: malfoy_bull=1;
      441: malfoy_bull=0;
      442: malfoy_bull=1;
      443: malfoy_bull=1;
      444: malfoy_bull=0;
      445: malfoy_bull=0;
      446: malfoy_bull=0;
      447: malfoy_bull=0;
      448: malfoy_bull=0;
      449: malfoy_bull=1;
      450: malfoy_bull=1;
      451: malfoy_bull=1;
      452: malfoy_bull=1;
      453: malfoy_bull=0;
      454: malfoy_bull=0;
      455: malfoy_bull=0;
      456: malfoy_bull=1;
      457: malfoy_bull=0;
      458: malfoy_bull=0;
      459: malfoy_bull=0;
      460: malfoy_bull=1;
      461: malfoy_bull=0;
      462: malfoy_bull=0;
      463: malfoy_bull=1;
      464: malfoy_bull=1;
      465: malfoy_bull=1;
      466: malfoy_bull=0;
      467: malfoy_bull=1;
      468: malfoy_bull=0;
      469: malfoy_bull=1;
      470: malfoy_bull=1;
      471: malfoy_bull=0;
      472: malfoy_bull=0;
      473: malfoy_bull=1;
      474: malfoy_bull=0;
      475: malfoy_bull=1;
      476: malfoy_bull=0;
      477: malfoy_bull=0;
      478: malfoy_bull=0;
      479: malfoy_bull=1;
      480: malfoy_bull=0;
      481: malfoy_bull=0;
      482: malfoy_bull=0;
      483: malfoy_bull=0;
      484: malfoy_bull=1;
      485: malfoy_bull=0;
      486: malfoy_bull=0;
      487: malfoy_bull=0;
      488: malfoy_bull=1;
      489: malfoy_bull=1;
      490: malfoy_bull=1;
      491: malfoy_bull=0;
      492: malfoy_bull=1;
      493: malfoy_bull=0;
      494: malfoy_bull=1;
      495: malfoy_bull=0;
      496: malfoy_bull=0;
      497: malfoy_bull=0;
      498: malfoy_bull=1;
      499: malfoy_bull=0;
      500: malfoy_bull=0;
      501: malfoy_bull=1;
      502: malfoy_bull=0;
      503: malfoy_bull=1;
      504: malfoy_bull=1;
      505: malfoy_bull=0;
      506: malfoy_bull=1;
      507: malfoy_bull=1;
      508: malfoy_bull=0;
      509: malfoy_bull=0;
      510: malfoy_bull=1;
      511: malfoy_bull=1;
      default: malfoy_bull=0;
    endcase
  end

// NOR all of these bits together
always @(gnd or richard_lovey or vcc or huey_banality or kebab_nyquil or ebay_sogood or gnd or snape_neptune)
  begin
      dirk_charlie = ~| {gnd,richard_lovey,vcc,huey_banality,kebab_nyquil,ebay_sogood,gnd,snape_neptune};
  end


initial begin
    {prison_star,broom_kabar,dragon_golf,atilla_hans,golden_fallen} = 0;
end

// Registered 5 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (mike_lotus)
      {prison_star,broom_kabar,dragon_golf,atilla_hans,golden_fallen} <= 0;
    else if (abraham_albus)
      {prison_star,broom_kabar,dragon_golf,atilla_hans,golden_fallen} <=
		  {mao_willem,roe_lad,elephant_gm,malfoy_bull,vcc};
    else
      {prison_star,broom_kabar,dragon_golf,atilla_hans,golden_fallen} <=
		 {often_crack,protest_cow,vcc,dirk_charlie,rouge_alpha} + 
		 {gnd,loud_romulus,norbert_goofy,dutch_victor,vcc};
  end

// XNOR all of these bits together
always @(ariel_thedon or gnd or kebab_nyquil)
  begin
      fufu_mandarin = ~^ {ariel_thedon,gnd,kebab_nyquil};
  end

// Random 3 input look up table
always @(homer_goofy or elephant_gm or rubeus_egg)
  begin
    casex ({homer_goofy,elephant_gm,rubeus_egg})
      0: ohno_minnow=0;
      1: ohno_minnow=1;
      2: ohno_minnow=0;
      3: ohno_minnow=1;
      4: ohno_minnow=0;
      5: ohno_minnow=1;
      6: ohno_minnow=0;
      7: ohno_minnow=1;
      default: ohno_minnow=0;
    endcase
  end

// Random 2 input look up table
always @(salmon_badger or golden_robust)
  begin
    casex ({salmon_badger,golden_robust})
      0: happy_deuce=0;
      1: happy_deuce=0;
      2: happy_deuce=0;
      3: happy_deuce=0;
      default: happy_deuce=0;
    endcase
  end

// Greater Equal Less compare
always @(gnd or ariel_thedon or gnd or vcc)
  begin
    if ({gnd,ariel_thedon} > {gnd,vcc})
       {cybex_moe,peace_tin,lovey_guy} = 3'b100;
    else if ({gnd,ariel_thedon} < {gnd,vcc})
       {cybex_moe,peace_tin,lovey_guy} = 3'b010;
    else
       {cybex_moe,peace_tin,lovey_guy} = 3'b001;
  end

// XOR all of these bits together
always @(gnd or papa_sun or arcade_chuck or tuna_bracket or vcc or vcc or weasley_hinge)
  begin
      whammy_armand = ^ {gnd,papa_sun,arcade_chuck,tuna_bracket,vcc,vcc,weasley_hinge};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sanity_beast <= 0;
    else
    case ({vcc,zen_drugie})
       0 : sanity_beast <= ready_spirit;
       1 : sanity_beast <= shark_richard;
       2 : sanity_beast <= lovey_guy;
       3 : sanity_beast <= sanity_beast;
       default : sanity_beast <= 0;
    endcase
  end


// building a 64 to 1 MUX operator
reg [63:0] kungfu_itchy_mux_dat;
reg [5:0] kungfu_itchy_mux_sel;
always @(molokai_rum or jacques_bach or boitano_romeo or bach_rewire or shark_richard or eagle_centaur or gnd or cheese_ebi or sand_lotus or my_tummy_zi or Iwin_intuit or noah_mexican or happy_deuce or dragon_golf or albus_what or echo_testyour or peace_tin or vcc or vcc or pcp_aphid or vcc or tsmc_snape or gnd or vcc or gnd or foxtrot_honda or yak_holepunch or hawaii_turnip or whack_smack or skipper_gonzo or ernie_emu or vcc or whiskey_egg or baron_clay or cocacola_milo or lion_sheep or gnd or dutch_victor or atilla_hans or hurt_pluto or vcc or bravo_hours or square_cubish or mike_lotus or lion_sheep or vangoh_dadada or gnd or raiders_louie or att_maryann or broom_kabar or cybex_moe or schwinger_red or gnd or star_tylenol or ohno_minnow or roe_lad or bach_rewire or killer_hanger or what_booming or gnd or vcc or hotdog_priest or star_ernie or gnd)
  begin
    kungfu_itchy_mux_dat = {molokai_rum,jacques_bach,boitano_romeo,bach_rewire,shark_richard,eagle_centaur,gnd,cheese_ebi,sand_lotus,my_tummy_zi,Iwin_intuit,noah_mexican,happy_deuce,dragon_golf,albus_what,echo_testyour,peace_tin,vcc,vcc,pcp_aphid,vcc,tsmc_snape,gnd,vcc,gnd,foxtrot_honda,yak_holepunch,hawaii_turnip,whack_smack,skipper_gonzo,ernie_emu,vcc,whiskey_egg,baron_clay,cocacola_milo,lion_sheep,gnd,dutch_victor,atilla_hans,hurt_pluto,vcc,bravo_hours,square_cubish,mike_lotus,lion_sheep,vangoh_dadada,gnd,raiders_louie,att_maryann,broom_kabar,cybex_moe,schwinger_red,gnd,star_tylenol,ohno_minnow,roe_lad,bach_rewire,killer_hanger,what_booming,gnd,vcc,hotdog_priest,star_ernie,gnd};
  end

always @(master_milo or sanity_beast or gnd or gnd or zedong_coffee or whiskey_crank)
  begin
    kungfu_itchy_mux_sel = {master_milo,sanity_beast,gnd,gnd,zedong_coffee,whiskey_crank};
  end

always @(kungfu_itchy_mux_dat or kungfu_itchy_mux_sel)
  begin
    platinum_crab = kungfu_itchy_mux_dat[kungfu_itchy_mux_sel];
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goat_wujing <= 0;
    else
    case ({bach_rewire,jason_dirty})
       0 : goat_wujing <= goat_wujing;
       1 : goat_wujing <= donald_rescue;
       2 : goat_wujing <= goat_wujing;
       3 : goat_wujing <= goat_wujing;
       default : goat_wujing <= 0;
    endcase
  end

// XOR all of these bits together
always @(sand_lotus or dragon_golf or vcc or gnd or gnd or tsmc_snape or mouse_icarus)
  begin
      sand_wanton = ^ {sand_lotus,dragon_golf,vcc,gnd,gnd,tsmc_snape,mouse_icarus};
  end


initial begin
    {athena_arthur,stix_marvin,neon_xuprocar,broom_oranje,maklak_gyro,schwinger_bfs} = 0;
end

// Registered 6 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (star_ernie)
      {athena_arthur,stix_marvin,neon_xuprocar,broom_oranje,maklak_gyro,schwinger_bfs} <= 0;
    else if (ladder_zinc)
      {athena_arthur,stix_marvin,neon_xuprocar,broom_oranje,maklak_gyro,schwinger_bfs} <=
		  {zedong_coffee,viagra_plague,kanji_bambi,gnd,att_maryann,enoch_vangoh};
    else
      {athena_arthur,stix_marvin,neon_xuprocar,broom_oranje,maklak_gyro,schwinger_bfs} <=
		 {shrimp_eagle,yummy_pizza,arcade_chuck,bear_speedyg,noah_mexican,noah_mexican} + 
		 {jason_dirty,donald_rescue,kebab_nyquil,killer_hanger,gnd,weasley_hinge};
  end

// 5 bit priority MUX
always @(
        superman_todd or gnd  or 
        sanity_beast or boitano_romeo  or 
        prison_star or tiger_eagle  or 
        vcc or dragon_golf  or 
        stix_marvin or maklak_gyro 
)

  begin
    if (superman_todd) hiswife_zinc = gnd;
    else if (sanity_beast) hiswife_zinc = boitano_romeo;
    else if (prison_star) hiswife_zinc = tiger_eagle;
    else if (vcc) hiswife_zinc = dragon_golf;
    else if (stix_marvin) hiswife_zinc = maklak_gyro;
    else hiswife_zinc = 0;
  end

reg feedback_pt_412;

always @(vcc or feedback_pt_412)
  begin
      lala_martian = !vcc |  feedback_pt_412;
  end

reg feedback_pt_413;

always @(golden_fallen or feedback_pt_413)
  begin
      oracle_pixie = !golden_fallen | !feedback_pt_413;
  end

reg feedback_pt_414;

always @(mike_lotus or feedback_pt_414)
  begin
      stix_unicorn = !mike_lotus & !feedback_pt_414;
  end

reg feedback_pt_415;

always @(vcc or feedback_pt_415)
  begin
      ham_faster =  vcc ^  feedback_pt_415;
  end

reg feedback_pt_416;

always @(happy_deuce or feedback_pt_416)
  begin
      marge_uppers = !happy_deuce & !feedback_pt_416;
  end

reg feedback_pt_417;

always @(malfoy_bull or feedback_pt_417)
  begin
      due_theonion = !malfoy_bull | !feedback_pt_417;
  end

reg feedback_pt_418;

always @(iron_wonton or feedback_pt_418)
  begin
      peta_willy =  iron_wonton &  feedback_pt_418;
  end

reg feedback_pt_419;

always @(yummy_pizza or feedback_pt_419)
  begin
      penguin_genji =  yummy_pizza &  feedback_pt_419;
  end

reg feedback_pt_420;

always @(neon_xuprocar or feedback_pt_420)
  begin
      sinew_rodent =  neon_xuprocar | !feedback_pt_420;
  end

reg feedback_pt_421;

always @(mouse_icarus or feedback_pt_421)
  begin
      tobe_davidlin =  mouse_icarus & !feedback_pt_421;
  end

reg feedback_pt_422;

always @(stix_unicorn or feedback_pt_422)
  begin
      llama_tobiko =  stix_unicorn ^ !feedback_pt_422;
  end

reg feedback_pt_423;

always @(escape_jesus or feedback_pt_423)
  begin
      louie_mideast =  escape_jesus |  feedback_pt_423;
  end

wire warlock_rod_wire;

dffeas warlock_rod_ff (
  .clk(clock1),
  .d(george_soccer),
  .ena(llama_tobiko),
  .sclr(cain_wiggles),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset1),
  .q(warlock_rod_wire)
);

always @(warlock_rod_wire) begin
   zhuang_often = warlock_rod_wire;
end

always @(zhuang_often)
  begin
      feedback_pt_412 = zhuang_often;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_obiwan <= 0;
    else if (vcc)
      star_obiwan <= sinew_rodent;
  end

always @(star_obiwan)
  begin
      feedback_pt_413 = star_obiwan;
  end

always @(star_obiwan)
  begin
      feedback_pt_414 = star_obiwan;
  end

always @(star_obiwan)
  begin
      feedback_pt_415 = star_obiwan;
  end

always @(star_obiwan)
  begin
      feedback_pt_416 = star_obiwan;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_yoku <= 0;
    else if (shrimp_eagle)
      star_yoku <= 0;
    else if (louie_mideast)
      star_yoku <= lao_ritsu;
  end

always @(star_yoku)
  begin
      feedback_pt_417 = star_yoku;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jcrew_chips <= 0;
    else if (ladder_zinc)
      jcrew_chips <= vcc;
    else if (acid_muffin)
      jcrew_chips <= 0;
  end

always @(jcrew_chips)
  begin
      feedback_pt_418 = jcrew_chips;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_pluto <= 0;
    else
      fronds_pluto <= fury_mozart;
  end

always @(fronds_pluto)
  begin
      feedback_pt_419 = fronds_pluto;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burning_tesla <= 0;
    else if (sanity_beast)
      burning_tesla <= 0;
    else if (oracle_pixie)
      burning_tesla <= oracle_pixie;
  end

always @(burning_tesla)
  begin
      feedback_pt_420 = burning_tesla;
  end

wire gopher_thread_wire;

dffeas gopher_thread_ff (
  .clk(clock1),
  .d(hawaii_turnip),
  .ena(gnd),
  .sclr(chips_jacuzzi),
  .sload(boitano_romeo),
  .asdata(zhuang_often),
  .clrn(!reset1),
  .q(gopher_thread_wire)
);

always @(gopher_thread_wire) begin
   bear_golf = gopher_thread_wire;
end

always @(bear_golf)
  begin
      feedback_pt_421 = bear_golf;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ozzy_doc <= 0;
    else if (schwinger_bfs)
      ozzy_doc <= fronds_pluto;
  end

always @(ozzy_doc)
  begin
      feedback_pt_422 = ozzy_doc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_rubik <= 1;
    else
      bagel_rubik <= gnd;
  end

always @(bagel_rubik)
  begin
      feedback_pt_423 = bagel_rubik;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_school <= 0;
    else if (prison_star)
      gm_school <= 0;
    else if (hawaii_plague)
      gm_school <= bach_rewire;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rescue_george <= 1;
    else
      rescue_george <= prison_star;
  end

wire newt_devotion_wire;

dffea newt_devotion_ff (
  .clk(clock1),
  .d(burning_tesla),
  .ena(vcc),
  .adata(gm_school),
  .clrn(!reset1),
  .q(newt_devotion_wire)
);

always @(newt_devotion_wire) begin
   plumber_fish = newt_devotion_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      todd_beavis <= 0;
    else if (gnd)
      todd_beavis <= ozzy_doc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_iterate <= 0;
    else if (balloon_yoku)
      stix_iterate <= tobe_davidlin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iron_lizard <= 0;
    else if (gulp_oitcen)
      iron_lizard <= 0;
    else if (ham_vadar)
      iron_lizard <= bagel_rubik;
  end

// 4 bit priority MUX
always @(
        pepsi_gerard or touch_neptune  or 
        vcc or gnd  or 
        vcc or stix_iterate  or 
        ham_faster or gnd 
)

  begin
    if (pepsi_gerard) tonks_england = touch_neptune;
    else if (vcc) tonks_england = gnd;
    else if (vcc) tonks_england = stix_iterate;
    else if (ham_faster) tonks_england = gnd;
    else tonks_england = 0;
  end


initial begin
    {drugs_ozzy,killme_larry,arcade_ritsu} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (ceres_bach)
      {drugs_ozzy,killme_larry,arcade_ritsu} <= 0;
    else if (lovey_guy)
      {drugs_ozzy,killme_larry,arcade_ritsu} <=
		  {vcc,vcc,plumber_fish};
    else
      {drugs_ozzy,killme_larry,arcade_ritsu} <=
		 {rescue_george,gnd,zhuang_often} + 
		 {jcrew_chips,tsmc_snape,would_husks};
  end

// NAND all of these bits together
always @(acid_muffin or ham_faster or boitano_romeo or gnd or vcc or plumber_fish or popcorn_whack or speed_tuna or foxtrot_honda or pepsi_gerard or sanity_beast)
  begin
      waster_beetle = ~& {acid_muffin,ham_faster,boitano_romeo,gnd,vcc,plumber_fish,popcorn_whack,speed_tuna,foxtrot_honda,pepsi_gerard,sanity_beast};
  end

// 3 bit priority MUX
always @(
        vcc or star_obiwan  or 
        gnd or stix_marvin  or 
        gnd or sand_lotus 
)

  begin
    if (vcc) meth_dirk = star_obiwan;
    else if (gnd) meth_dirk = stix_marvin;
    else if (gnd) meth_dirk = sand_lotus;
    else meth_dirk = 0;
  end

// 6 bit priority MUX
always @(
        sand_wanton or gnd  or 
        burning_tesla or crab_iterate  or 
        arcade_chuck or rescue_george  or 
        jason_dirty or timmy_snake  or 
        arcade_ritsu or sanity_beast  or 
        vcc or bagel_rubik 
)

  begin
    if (sand_wanton) kabar_tabby = gnd;
    else if (burning_tesla) kabar_tabby = crab_iterate;
    else if (arcade_chuck) kabar_tabby = rescue_george;
    else if (jason_dirty) kabar_tabby = timmy_snake;
    else if (arcade_ritsu) kabar_tabby = sanity_beast;
    else if (vcc) kabar_tabby = bagel_rubik;
    else kabar_tabby = 0;
  end


// building a 32 to 1 MUX operator
reg [31:0] rod_wiggles_mux_dat;
reg [4:0] rod_wiggles_mux_sel;
always @(gnd or gnd or yak_edible or gnd or ozzy_doc or vcc or ohno_minnow or gnd or hawaii_turnip or kbtoys_pepsi or vcc or yak_edible or huey_banality or killer_hanger or mike_lotus or star_obiwan or vcc or tunafish_duey or bagel_rubik or hawaii_plague or schwinger_bfs or palm_what or platinum_crab or vcc or schwinger_bfs or gnd or hiswife_zinc or fufu_mandarin or sinew_rodent or neon_xuprocar or sanity_beast or hawaii_turnip)
  begin
    rod_wiggles_mux_dat = {gnd,gnd,yak_edible,gnd,ozzy_doc,vcc,ohno_minnow,gnd,hawaii_turnip,kbtoys_pepsi,vcc,yak_edible,huey_banality,killer_hanger,mike_lotus,star_obiwan,vcc,tunafish_duey,bagel_rubik,hawaii_plague,schwinger_bfs,palm_what,platinum_crab,vcc,schwinger_bfs,gnd,hiswife_zinc,fufu_mandarin,sinew_rodent,neon_xuprocar,sanity_beast,hawaii_turnip};
  end

always @(vcc or pepsi_gerard or gap_india or plumber_fish or burning_tesla)
  begin
    rod_wiggles_mux_sel = {vcc,pepsi_gerard,gap_india,plumber_fish,burning_tesla};
  end

always @(rod_wiggles_mux_dat or rod_wiggles_mux_sel)
  begin
    raiders_bart = rod_wiggles_mux_dat[rod_wiggles_mux_sel];
  end

// 5 bit priority MUX
always @(
        vcc or gap_india  or 
        waster_beetle or pepsi_gerard  or 
        whammy_armand or gnd  or 
        gnd or kabar_tabby  or 
        shrimp_eagle or jason_dirty 
)

  begin
    if (vcc) air_gutter = gap_india;
    else if (waster_beetle) air_gutter = pepsi_gerard;
    else if (whammy_armand) air_gutter = gnd;
    else if (gnd) air_gutter = kabar_tabby;
    else if (shrimp_eagle) air_gutter = jason_dirty;
    else air_gutter = 0;
  end

// Greater Equal Less compare
always @(gnd or cain_wiggles or crab_iterate or drugs_ozzy or vcc or athena_arthur or star_obiwan or vcc or wonder_stroop or hawaii_turnip)
  begin
    if ({gnd,cain_wiggles,crab_iterate,drugs_ozzy,vcc} > {athena_arthur,star_obiwan,vcc,wonder_stroop,hawaii_turnip})
       {air_wildboar,sinew_ghost,remus_fallen} = 3'b100;
    else if ({gnd,cain_wiggles,crab_iterate,drugs_ozzy,vcc} < {athena_arthur,star_obiwan,vcc,wonder_stroop,hawaii_turnip})
       {air_wildboar,sinew_ghost,remus_fallen} = 3'b010;
    else
       {air_wildboar,sinew_ghost,remus_fallen} = 3'b001;
  end

// Random 2 input look up table
always @(vcc or gnd)
  begin
    casex ({vcc,gnd})
      0: tango_ykocens=1;
      1: tango_ykocens=0;
      2: tango_ykocens=0;
      3: tango_ykocens=1;
      default: tango_ykocens=0;
    endcase
  end

// AND all of these bits together
always @(ham_faster or marge_uppers or gnd or air_wildboar or ariel_wujing or meth_dirk or gnd or noah_mexican or penguin_genji or gnd)
  begin
      maki_unicorn = & {ham_faster,marge_uppers,gnd,air_wildboar,ariel_wujing,meth_dirk,gnd,noah_mexican,penguin_genji,gnd};
  end

// 3 bit priority MUX
always @(
        happy_deuce or palm_what  or 
        speed_tuna or killme_larry  or 
        meth_dirk or tunafish_duey 
)

  begin
    if (happy_deuce) parrot_east = palm_what;
    else if (speed_tuna) parrot_east = killme_larry;
    else if (meth_dirk) parrot_east = tunafish_duey;
    else parrot_east = 0;
  end

reg feedback_pt_424;

always @(gnd or feedback_pt_424)
  begin
      rouge_plaster = !gnd & !feedback_pt_424;
  end

reg feedback_pt_425;

always @(meth_dirk or feedback_pt_425)
  begin
      powder_ariel = !meth_dirk ^ !feedback_pt_425;
  end

reg feedback_pt_426;

always @(raiders_bart or feedback_pt_426)
  begin
      ants_edible = !raiders_bart &  feedback_pt_426;
  end

reg feedback_pt_427;

always @(whammy_armand or feedback_pt_427)
  begin
      bert_kaisha =  whammy_armand & !feedback_pt_427;
  end

reg feedback_pt_428;

always @(ohno_minnow or feedback_pt_428)
  begin
      dipsy_odin =  ohno_minnow ^  feedback_pt_428;
  end

reg feedback_pt_429;

always @(athena_arthur or feedback_pt_429)
  begin
      rubeus_acid =  athena_arthur ^ !feedback_pt_429;
  end

reg feedback_pt_430;

always @(rubeus_acid or feedback_pt_430)
  begin
      nest_cow =  rubeus_acid & !feedback_pt_430;
  end

reg feedback_pt_431;

always @(pepsi_gerard or feedback_pt_431)
  begin
      sears_rerun = !pepsi_gerard | !feedback_pt_431;
  end

reg feedback_pt_432;

always @(vcc or feedback_pt_432)
  begin
      arthur_att =  vcc & !feedback_pt_432;
  end

reg feedback_pt_433;

always @(often_faster or feedback_pt_433)
  begin
      pirate_joseph =  often_faster |  feedback_pt_433;
  end

reg feedback_pt_434;

always @(todd_beavis or feedback_pt_434)
  begin
      newt_cheese =  todd_beavis ^  feedback_pt_434;
  end

reg feedback_pt_435;

always @(tonks_england or feedback_pt_435)
  begin
      green_bep = !tonks_england |  feedback_pt_435;
  end

reg feedback_pt_436;

always @(pirate_joseph or feedback_pt_436)
  begin
      draco_salmon = !pirate_joseph | !feedback_pt_436;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lion_grumby <= 0;
    else if (nest_cow)
      lion_grumby <= mike_lotus;
  end

always @(lion_grumby)
  begin
      feedback_pt_424 = lion_grumby;
  end

always @(lion_grumby)
  begin
      feedback_pt_425 = lion_grumby;
  end

always @(lion_grumby)
  begin
      feedback_pt_426 = lion_grumby;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      butthead_duey <= 0;
    else if (rescue_george)
      butthead_duey <= parrot_east;
  end

always @(butthead_duey)
  begin
      feedback_pt_427 = butthead_duey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mars_turkey <= 0;
    else if (gnd)
      mars_turkey <= ham_faster;
  end

always @(mars_turkey)
  begin
      feedback_pt_428 = mars_turkey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_cheez <= 0;
    else if (oracle_pixie)
      oscar_cheez <= butthead_duey;
  end

always @(oscar_cheez)
  begin
      feedback_pt_429 = oscar_cheez;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hippo_lao <= 0;
    else if (mars_turkey)
      hippo_lao <= 0;
    else if (waster_beetle)
      hippo_lao <= hawaii_turnip;
  end

always @(hippo_lao)
  begin
      feedback_pt_430 = hippo_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bravo_sapporo <= 0;
    else if (oscar_cheez)
      bravo_sapporo <= peta_willy;
  end

always @(bravo_sapporo)
  begin
      feedback_pt_431 = bravo_sapporo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      leaky_mortar <= 0;
    else if (gnd)
      leaky_mortar <= 0;
    else if (gnd)
      leaky_mortar <= lion_grumby;
  end

always @(leaky_mortar)
  begin
      feedback_pt_432 = leaky_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_abel <= 0;
    else
      egg_abel <= often_crack;
  end

always @(egg_abel)
  begin
      feedback_pt_433 = egg_abel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xterm_sierra <= 0;
    else if (tango_ykocens)
      xterm_sierra <= ham_vadar;
    else if (noah_mexican)
      xterm_sierra <= 0;
  end

always @(xterm_sierra)
  begin
      feedback_pt_434 = xterm_sierra;
  end

wire tobe_ants_wire;

dffea tobe_ants_ff (
  .clk(clock1),
  .d(air_gutter),
  .ena(often_crack),
  .adata(hotdog_priest),
  .clrn(!reset1),
  .q(tobe_ants_wire)
);

always @(tobe_ants_wire) begin
   zebra_bubba = tobe_ants_wire;
end

always @(zebra_bubba)
  begin
      feedback_pt_435 = zebra_bubba;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hans_voodoo <= 0;
    else
      hans_voodoo <= muffin_joseph;
  end

always @(hans_voodoo)
  begin
      feedback_pt_436 = hans_voodoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      Iwin_ladder <= 0;
    else if (often_faster)
      Iwin_ladder <= rescue_george;
    else if (arthur_att)
      Iwin_ladder <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rat_solder <= 0;
    else if (gnd)
      rat_solder <= 0;
    else if (iron_lizard)
      rat_solder <= waster_beetle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_rojas <= 0;
    else
      escape_rojas <= jcrew_chips;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spyro_might <= 0;
    else if (newt_cheese)
      spyro_might <= 0;
    else if (burning_tesla)
      spyro_might <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sun_mrbill <= 0;
    else
      sun_mrbill <= rescue_george;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_aspirin <= 1;
    else
      south_aspirin <= bert_kaisha;
  end

wire togos_haze_wire;

dffea togos_haze_ff (
  .clk(clock1),
  .d(kabar_tabby),
  .ena(ohno_minnow),
  .adata(vcc),
  .clrn(!reset1),
  .q(togos_haze_wire)
);

always @(togos_haze_wire) begin
   papyrus_huey = togos_haze_wire;
end

wire heidi_crank_wire;

dffeas heidi_crank_ff (
  .clk(clock1),
  .d(south_aspirin),
  .ena(bert_kaisha),
  .sclr(vcc),
  .sload(maki_unicorn),
  .asdata(vcc),
  .clrn(!reset1),
  .q(heidi_crank_wire)
);

always @(heidi_crank_wire) begin
   sinew_gulp = heidi_crank_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turkey_sanity <= 0;
    else if (gnd)
      turkey_sanity <= peace_tin;
  end

// Tristate output pin with reg feedback
  bufif0 (lovey_ring,!vcc,!gnd);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(gnd or lovey_ring) begin
    if ( gnd) sun_larry = !lovey_ring;
    else sun_larry = vcc;
end

// Internal TRI bus MUX built out of tri buffers;
// Z and conflict not possible
  tri turtle_kilo_tri;
  wire [3:0] turtle_kilo_dat = {bear_golf,ham_faster,killme_larry};
  wire [3:0] turtle_kilo_sel = {platinum_crab,papyrus_huey,schwinger_bfs};
  wire [3:0] turtle_kilo_ohsel;
  wire turtle_kilo_def;

  assign turtle_kilo_ohsel[0] = turtle_kilo_sel[0];
  assign turtle_kilo_ohsel[1] = turtle_kilo_sel[1] & !turtle_kilo_ohsel[0];
  assign turtle_kilo_ohsel[2] = turtle_kilo_sel[2] & !turtle_kilo_ohsel[1] & !turtle_kilo_ohsel[0];

  assign turtle_kilo_def = 
     !turtle_kilo_ohsel[0] & !turtle_kilo_ohsel[1] & !turtle_kilo_ohsel[2];

  // onehot tristate MUX
  bufif1 (turtle_kilo_tri,!turtle_kilo_dat[0], turtle_kilo_ohsel[0]);
  bufif0 (turtle_kilo_tri, turtle_kilo_dat[1],!turtle_kilo_ohsel[1]);
  bufif0 (turtle_kilo_tri, turtle_kilo_dat[2],!turtle_kilo_ohsel[2]);

  // default value for none-hot
  bufif1 (turtle_kilo_tri,vcc,turtle_kilo_def);
  always @(turtle_kilo_tri) begin
    turtle_kilo = turtle_kilo_tri;
  end

// Tristate output pin with reg feedback
  bufif0 (fang_honda, jason_dirty,!bear_golf);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(bear_golf or fang_honda) begin
    if ( bear_golf) snort_nasdaq =  fang_honda;
    else snort_nasdaq = gnd;
end

// Vanilla tristate output pin
  bufif0 (charlie_ariel,!mars_turkey,!att_maryann);  // output,dat,oe

reg feedback_pt_437;

always @(kabar_tabby or feedback_pt_437)
  begin
      mandarin_bfs =  kabar_tabby ^ !feedback_pt_437;
  end

reg feedback_pt_438;

always @(gnd or feedback_pt_438)
  begin
      desert_albus = !gnd ^  feedback_pt_438;
  end

reg feedback_pt_439;

always @(newt_cheese or feedback_pt_439)
  begin
      zeus_po = !newt_cheese | !feedback_pt_439;
  end

reg feedback_pt_440;

always @(zebra_bubba or feedback_pt_440)
  begin
      yellow_victor =  zebra_bubba |  feedback_pt_440;
  end

reg feedback_pt_441;

always @(hans_voodoo or feedback_pt_441)
  begin
      crab_popcorn =  hans_voodoo ^  feedback_pt_441;
  end

reg feedback_pt_442;

always @(hotdog_priest or feedback_pt_442)
  begin
      fufu_bono = !hotdog_priest |  feedback_pt_442;
  end

reg feedback_pt_443;

always @(tunafish_duey or feedback_pt_443)
  begin
      money_delta = !tunafish_duey ^ !feedback_pt_443;
  end

reg feedback_pt_444;

always @(green_bep or feedback_pt_444)
  begin
      doobie_macys =  green_bep ^ !feedback_pt_444;
  end

reg feedback_pt_445;

always @(sanity_beast or feedback_pt_445)
  begin
      fufu_vangoh =  sanity_beast &  feedback_pt_445;
  end

reg feedback_pt_446;

always @(jcrew_chips or feedback_pt_446)
  begin
      lala_sanity = !jcrew_chips & !feedback_pt_446;
  end

reg feedback_pt_447;

always @(maki_unicorn or feedback_pt_447)
  begin
      kilo_marge =  maki_unicorn |  feedback_pt_447;
  end

reg feedback_pt_448;

always @(gnd or feedback_pt_448)
  begin
      sinew_wine = !gnd | !feedback_pt_448;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_howell <= 0;
    else if (escape_rojas)
      bagel_howell <= 0;
    else if (maki_unicorn)
      bagel_howell <= palm_what;
  end

always @(bagel_howell)
  begin
      feedback_pt_437 = bagel_howell;
  end

always @(bagel_howell)
  begin
      feedback_pt_438 = bagel_howell;
  end

always @(bagel_howell)
  begin
      feedback_pt_439 = bagel_howell;
  end

always @(bagel_howell)
  begin
      feedback_pt_440 = bagel_howell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_athena <= 0;
    else if (desert_albus)
      meth_athena <= vcc;
  end

always @(meth_athena)
  begin
      feedback_pt_441 = meth_athena;
  end

wire hector_mao_wire;

dffea hector_mao_ff (
  .clk(clock1),
  .d(remus_fallen),
  .ena(butthead_duey),
  .adata(air_gutter),
  .clrn(!reset1),
  .q(hector_mao_wire)
);

always @(hector_mao_wire) begin
   spock_webvan = hector_mao_wire;
end

always @(spock_webvan)
  begin
      feedback_pt_442 = spock_webvan;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rat_fsncens <= 0;
    else
      rat_fsncens <= gnd;
  end

always @(rat_fsncens)
  begin
      feedback_pt_443 = rat_fsncens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chillis_fish <= 0;
    else if (crab_popcorn)
      chillis_fish <= vcc;
  end

always @(chillis_fish)
  begin
      feedback_pt_444 = chillis_fish;
  end

wire bart_speed_wire;

dffea bart_speed_ff (
  .clk(clock1),
  .d(sinew_gulp),
  .ena(vcc),
  .adata(draco_salmon),
  .clrn(!reset1),
  .q(bart_speed_wire)
);

always @(bart_speed_wire) begin
   coconut_witch = bart_speed_wire;
end

always @(coconut_witch)
  begin
      feedback_pt_445 = coconut_witch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mouse_ghost <= 1;
    else
      mouse_ghost <= gnd;
  end

always @(mouse_ghost)
  begin
      feedback_pt_446 = mouse_ghost;
  end

wire bagel_atomic_wire;

dffeas bagel_atomic_ff (
  .clk(clock1),
  .d(rat_fsncens),
  .ena(lala_martian),
  .sclr(mandarin_bfs),
  .sload(peace_tin),
  .asdata(kabar_tabby),
  .clrn(!reset1),
  .q(bagel_atomic_wire)
);

always @(bagel_atomic_wire) begin
   books_rodent = bagel_atomic_wire;
end

always @(books_rodent)
  begin
      feedback_pt_447 = books_rodent;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bush_uppers <= 0;
    else if (green_bep)
      bush_uppers <= turtle_kilo;
    else if (star_yoku)
      bush_uppers <= 0;
  end

always @(bush_uppers)
  begin
      feedback_pt_448 = bush_uppers;
  end

wire lamer_fear_wire;

dffeas lamer_fear_ff (
  .clk(clock1),
  .d(platinum_crab),
  .ena(gnd),
  .sclr(air_wildboar),
  .sload(draco_salmon),
  .asdata(lala_sanity),
  .clrn(!reset1),
  .q(lamer_fear_wire)
);

always @(lamer_fear_wire) begin
   midas_dirty = lamer_fear_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turtle_life <= 1;
    else
      turtle_life <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_fsncens <= 1;
    else
      ibm_fsncens <= books_rodent;
  end

wire north_pacbell_wire;

dffea north_pacbell_ff (
  .clk(clock1),
  .d(air_wildboar),
  .ena(money_delta),
  .adata(oscar_cheez),
  .clrn(!reset1),
  .q(north_pacbell_wire)
);

always @(north_pacbell_wire) begin
   black_yoku = north_pacbell_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hummer_potter <= 0;
    else if (mars_turkey)
      hummer_potter <= 0;
    else if (newt_cheese)
      hummer_potter <= att_maryann;
  end

wire nobody_ebi_wire;

dffeas nobody_ebi_ff (
  .clk(clock1),
  .d(gnd),
  .ena(gnd),
  .sclr(boitano_romeo),
  .sload(hummer_potter),
  .asdata(vcc),
  .clrn(!reset1),
  .q(nobody_ebi_wire)
);

always @(nobody_ebi_wire) begin
   pdaddy_willy = nobody_ebi_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tako_handroll <= 0;
    else
      tako_handroll <= lion_grumby;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_platypus <= 0;
    else if (lion_grumby)
      meth_platypus <= 0;
    else if (todd_beavis)
      meth_platypus <= lala_sanity;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sugar_newt <= 0;
    else if (hummer_potter)
      sugar_newt <= 0;
    else if (vcc)
      sugar_newt <= rubeus_acid;
  end

reg feedback_pt_449;

always @(bagel_howell or feedback_pt_449)
  begin
      jacuzzi_tabby = !bagel_howell | !feedback_pt_449;
  end

reg feedback_pt_450;

always @(gnd or feedback_pt_450)
  begin
      joseph_hoser =  gnd & !feedback_pt_450;
  end

reg feedback_pt_451;

always @(xterm_sierra or feedback_pt_451)
  begin
      macys_neptune = !xterm_sierra & !feedback_pt_451;
  end

reg feedback_pt_452;

always @(ibm_fsncens or feedback_pt_452)
  begin
      stroop_bart = !ibm_fsncens &  feedback_pt_452;
  end

reg feedback_pt_453;

always @(noah_mexican or feedback_pt_453)
  begin
      maryann_hotel = !noah_mexican & !feedback_pt_453;
  end

reg feedback_pt_454;

always @(mandarin_bfs or feedback_pt_454)
  begin
      tracy_gyro =  mandarin_bfs ^  feedback_pt_454;
  end

reg feedback_pt_455;

always @(vcc or feedback_pt_455)
  begin
      due_bolt = !vcc &  feedback_pt_455;
  end

reg feedback_pt_456;

always @(gnd or feedback_pt_456)
  begin
      kennyg_tracy = !gnd & !feedback_pt_456;
  end

reg feedback_pt_457;

always @(gnd or feedback_pt_457)
  begin
      genji_fuji =  gnd & !feedback_pt_457;
  end

reg feedback_pt_458;

always @(black_yoku or feedback_pt_458)
  begin
      pcp_waster = !black_yoku | !feedback_pt_458;
  end

reg feedback_pt_459;

always @(vcc or feedback_pt_459)
  begin
      tako_remus = !vcc & !feedback_pt_459;
  end

reg feedback_pt_460;

always @(bush_uppers or feedback_pt_460)
  begin
      achilles_dig = !bush_uppers ^  feedback_pt_460;
  end

reg feedback_pt_461;

always @(vcc or feedback_pt_461)
  begin
      marker_tako = !vcc ^  feedback_pt_461;
  end

reg feedback_pt_462;

always @(leaky_mortar or feedback_pt_462)
  begin
      xuprocar_fuji = !leaky_mortar |  feedback_pt_462;
  end

reg feedback_pt_463;

always @(todd_beavis or feedback_pt_463)
  begin
      phoenix_ozzy = !todd_beavis ^ !feedback_pt_463;
  end

always @(star_obiwan)
  begin
      nation_potato = !star_obiwan;
  end

always @(stroop_bart)
  begin
      bambi_bubba = !stroop_bart;
  end

always @(draco_salmon)
  begin
      martin_sirius = !draco_salmon;
  end

always @(vcc)
  begin
      itchy_wukong = !vcc;
  end

always @(tako_handroll)
  begin
      oranje_spyro = !tako_handroll;
  end

always @(cain_wiggles)
  begin
      moe_pomodoro = !cain_wiggles;
  end

always @(vcc)
  begin
      deuce_air = !vcc;
  end

always @(tracy_gyro)
  begin
      hagrid_zeus = !tracy_gyro;
  end

always @(rat_solder)
  begin
      dog_vulture = !rat_solder;
  end

always @(oranje_spyro)
  begin
      platypus_Iwin = !oranje_spyro;
  end

always @(powder_ariel)
  begin
      blaster_togos = !powder_ariel;
  end

always @(ibm_fsncens)
  begin
      copper_rubeus = !ibm_fsncens;
  end

always @(marge_uppers)
  begin
      riddler_stix = !marge_uppers;
  end

always @(powder_ariel)
  begin
      tasty_condit = !powder_ariel;
  end

always @(turtle_life)
  begin
      marker_potter = !turtle_life;
  end

always @(lion_grumby)
  begin
      bracket_boing = !lion_grumby;
  end

always @(vcc)
  begin
      zi_zed = !vcc;
  end

always @(coconut_witch)
  begin
      tank_eagle = !coconut_witch;
  end

always @(gap_india)
  begin
      george_roe = !gap_india;
  end

always @(due_theonion)
  begin
      banality_tuna = !due_theonion;
  end

always @(itchy_wukong)
  begin
      south_crank = !itchy_wukong;
  end

always @(vcc)
  begin
      rubeus_att = !vcc;
  end

always @(fufu_bono)
  begin
      freaky_winner = !fufu_bono;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kdqcens_ritsu <= 0;
    else
      kdqcens_ritsu <= kennyg_tracy;
  end

always @(kdqcens_ritsu)
  begin
      feedback_pt_449 = kdqcens_ritsu;
  end

always @(kdqcens_ritsu)
  begin
      feedback_pt_450 = kdqcens_ritsu;
  end

always @(kdqcens_ritsu)
  begin
      feedback_pt_451 = kdqcens_ritsu;
  end

always @(kdqcens_ritsu)
  begin
      feedback_pt_452 = kdqcens_ritsu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sirius_zhuang <= 0;
    else if (tasty_condit)
      sirius_zhuang <= george_roe;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_453 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_454 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_455 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_456 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_457 = sirius_zhuang;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wukong_float <= 0;
    else if (zeus_po)
      wukong_float <= dog_vulture;
    else if (martin_sirius)
      wukong_float <= 0;
  end

always @(wukong_float)
  begin
      feedback_pt_458 = wukong_float;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      exodus_touch <= 0;
    else if (rubeus_att)
      exodus_touch <= vcc;
  end

always @(exodus_touch)
  begin
      feedback_pt_459 = exodus_touch;
  end

wire tuna_baron_wire;

dffea tuna_baron_ff (
  .clk(clock1),
  .d(raiders_bart),
  .ena(vcc),
  .adata(lala_sanity),
  .clrn(!reset1),
  .q(tuna_baron_wire)
);

always @(tuna_baron_wire) begin
   fufu_eagle = tuna_baron_wire;
end

always @(fufu_eagle)
  begin
      feedback_pt_460 = fufu_eagle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beetle_wakey <= 0;
    else
      beetle_wakey <= lion_grumby;
  end

always @(beetle_wakey)
  begin
      feedback_pt_461 = beetle_wakey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dopey_pierre <= 0;
    else if (rouge_plaster)
      dopey_pierre <= fufu_eagle;
    else if (gnd)
      dopey_pierre <= 0;
  end

always @(dopey_pierre)
  begin
      feedback_pt_462 = dopey_pierre;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_gyro <= 0;
    else
      deng_gyro <= bravo_sapporo;
  end

always @(deng_gyro)
  begin
      feedback_pt_463 = deng_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_tango <= 0;
    else
      advil_tango <= often_crack;
  end

wire riddler_po_wire;

dffea riddler_po_ff (
  .clk(clock1),
  .d(gnd),
  .ena(zeus_po),
  .adata(vcc),
  .clrn(!reset1),
  .q(riddler_po_wire)
);

always @(riddler_po_wire) begin
   fronds_lxtcen = riddler_po_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubeus_mortar <= 0;
    else
      rubeus_mortar <= advil_tango;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_clay <= 0;
    else
      knot_clay <= bush_uppers;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_honey <= 0;
    else if (beetle_wakey)
      mao_honey <= rubeus_mortar;
    else if (egg_abel)
      mao_honey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      surfer_fuji <= 0;
    else if (gnd)
      surfer_fuji <= south_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonks_fallen <= 0;
    else if (chillis_fish)
      tonks_fallen <= 0;
    else if (vcc)
      tonks_fallen <= exodus_touch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_tuna <= 0;
    else if (muffin_joseph)
      cain_tuna <= 0;
    else if (deng_gyro)
      cain_tuna <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wood_gokidsgo <= 0;
    else if (ham_vadar)
      wood_gokidsgo <= 0;
    else if (meth_platypus)
      wood_gokidsgo <= burning_tesla;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_freaky <= 1;
    else
      boing_freaky <= moe_pomodoro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_mickey <= 0;
    else if (wukong_float)
      animal_mickey <= 0;
    else if (vcc)
      animal_mickey <= att_maryann;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      duey_superman <= 1;
    else
      duey_superman <= blaster_togos;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wine_edible <= 0;
    else if (tonks_fallen)
      wine_edible <= vcc;
    else if (spock_webvan)
      wine_edible <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joseph_deuce <= 0;
    else if (fufu_mandarin)
      joseph_deuce <= maki_unicorn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      brian_advil <= 0;
    else
      brian_advil <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_india <= 0;
    else if (vcc)
      pixie_india <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      china_fitter <= 0;
    else if (surfer_fuji)
      china_fitter <= broom_oranje;
    else if (pcp_waster)
      china_fitter <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ebi_iwocensor <= 1;
    else
      ebi_iwocensor <= spyro_might;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jesus_what <= 0;
    else
      jesus_what <= animal_mickey;
  end

wire elian_bamboo_wire;

dffeas elian_bamboo_ff (
  .clk(clock1),
  .d(genji_fuji),
  .ena(maryann_hotel),
  .sclr(gnd),
  .sload(cain_tuna),
  .asdata(vcc),
  .clrn(!reset1),
  .q(elian_bamboo_wire)
);

always @(elian_bamboo_wire) begin
   killer_curie = elian_bamboo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_richard <= 0;
    else
      hp_richard <= jcrew_chips;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotel_zed <= 0;
    else
      hotel_zed <= hotdog_priest;
  end

wire dingbat_snape_wire;

dffeas dingbat_snape_ff (
  .clk(clock1),
  .d(sinew_wine),
  .ena(zi_zed),
  .sclr(gnd),
  .sload(gnd),
  .asdata(brian_advil),
  .clrn(!reset1),
  .q(dingbat_snape_wire)
);

always @(dingbat_snape_wire) begin
   bubba_doc = dingbat_snape_wire;
end

wire pixie_hummer_wire;

dffeas pixie_hummer_ff (
  .clk(clock1),
  .d(fronds_lxtcen),
  .ena(kilo_marge),
  .sclr(sugar_newt),
  .sload(vcc),
  .asdata(vcc),
  .clrn(!reset1),
  .q(pixie_hummer_wire)
);

always @(pixie_hummer_wire) begin
   vangoh_hinge = pixie_hummer_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_salami <= 0;
    else if (fufu_bono)
      lotus_salami <= vcc;
    else if (vcc)
      lotus_salami <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      martin_safada <= 0;
    else if (jacuzzi_tabby)
      martin_safada <= dopey_pierre;
    else if (meth_platypus)
      martin_safada <= 0;
  end

wire peaves_hut_wire;

dffea peaves_hut_ff (
  .clk(clock1),
  .d(star_tylenol),
  .ena(vangoh_hinge),
  .adata(gnd),
  .clrn(!reset1),
  .q(peaves_hut_wire)
);

always @(peaves_hut_wire) begin
   ready_xray = peaves_hut_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_tapered <= 0;
    else if (vcc)
      rerun_tapered <= 0;
    else if (due_bolt)
      rerun_tapered <= boing_freaky;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vadar_protest <= 0;
    else if (vcc)
      vadar_protest <= 0;
    else if (gnd)
      vadar_protest <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      picante_meth <= 0;
    else if (kilo_marge)
      picante_meth <= rerun_tapered;
    else if (vcc)
      picante_meth <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_ebi <= 0;
    else
      south_ebi <= pixie_india;
  end

wire questo_tamago_wire;

dffea questo_tamago_ff (
  .clk(clock1),
  .d(star_obiwan),
  .ena(vcc),
  .adata(dipsy_odin),
  .clrn(!reset1),
  .q(questo_tamago_wire)
);

always @(questo_tamago_wire) begin
   lisa_yoku = questo_tamago_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nasdaq_doc <= 0;
    else
      nasdaq_doc <= south_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pork_balloon <= 0;
    else if (lotus_salami)
      pork_balloon <= fufu_bono;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moulin_Iwin <= 0;
    else
      moulin_Iwin <= sinew_rodent;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drax_rat <= 0;
    else if (moulin_Iwin)
      drax_rat <= hiswife_zinc;
    else if (mars_turkey)
      drax_rat <= 0;
  end

wire rabbi_waffle_wire;

dffeas rabbi_waffle_ff (
  .clk(clock1),
  .d(surfer_fuji),
  .ena(vcc),
  .sclr(kdqcens_ritsu),
  .sload(beetle_wakey),
  .asdata(lisa_yoku),
  .clrn(!reset1),
  .q(rabbi_waffle_wire)
);

always @(rabbi_waffle_wire) begin
   peace_cannon = rabbi_waffle_wire;
end

wire zed_erncenso_wire;

dffeas zed_erncenso_ff (
  .clk(clock1),
  .d(hp_richard),
  .ena(rat_solder),
  .sclr(riddler_stix),
  .sload(hotel_zed),
  .asdata(sirius_zhuang),
  .clrn(!reset1),
  .q(zed_erncenso_wire)
);

always @(zed_erncenso_wire) begin
   midas_killer = zed_erncenso_wire;
end


endmodule

