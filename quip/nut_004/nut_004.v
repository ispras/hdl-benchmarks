/////////////////////////////////////////////////////////////////
// Altera Corporation
// File - nut_004.v
// 115 inputs 197 outputs
//
//
/////////////////////////////////////////////////////////////////
module nut_004 (
// inputs
 bravo, charlie, delta, oscar, papa, quebec,
      tango, yankee, zulu, bomb_pop, gojira, richard,
      cybex, mine, bullet, marker, red, blue,
      green, aphid, duck, eagle, eel, elephant,
      emu, fish, frog, goat, hippo, iguana,
      jellyfish, monkey, whacky, wildboar, lagoon, husks,
      escape, foiled, bamboo, desert, isle, pacific,
      ocean, waterfall, tan_nodes, loud, millionaire, chevys_pork,
      kanji_bubba, deng_pepsi, fufu_pilot, itchy_cubish, boing_guy, boots_theseus,
      pentium_meth, hotdog_armand, boitano_yak, ocean_barney, zed_zi, cheez_isle,
      roe_starwars, chuck_wizard, pepsi_valve, floo_shrimp, curie_xray, tiger_water,
      mars_handroll, buddha_subway, heidi_moreand, purple_macys, nigiri_nigiri, geisha_moe,
      nasdaq_fire, covad_lost, meth_yak, potter_covad, prison_icarus, spain_vegas,
      drax_the_pope, albus_china, tracy_think, bagel_fury, troll_green, lsd_huey,
      dorkus_fang, ozzy_ulysses, amex_richard, bfi_billnted, rubeus_goblin, ebay_kedavra,
      bomb_pop_pyro, ham_mickey, pierre_eagle, enoch_amex, yoda_kaisha, aladdin_curie,
      venus_homerun, fascist_bambi, zinc_blessyou, homer_abraham, togos_jonas, emu_isle,
      money_desert, bach_aladdin, vulture_east, drunken_clay, romex_weapons, draco_sortout,
      llama_cuanto, too_big_goofy, hours_acid, oitcen_wicked, desade_arthur, picante_pizza,
      mine_green,

     // outputs
 george, rodriguez, norris, fufu_jonas, larry_hagrid, oscar_famulan,
      show_peace, plague_buddha, tobe_vampire, arizona_pizza, intel_lumber, enoch_hans,
      minnie_beavis, comrade_sand, vegan_possum, hanger_tango, jxnbox_hp, bacon_kanji,
      wheezer_boots, rod_rewire, porfavor_fury, salsa_otter, hotdog_enoch, maki_ring,
      love_in_fish, malfoy_float, fufu_ebay, bravo_gopher, roid_handroll, hummer_wiggum,
      sanity_foiled, po_kidnapper, dirk_whiskey, iguana_east, raiders_ariel, noah_dingbat,
      zeus_protest, oranges_broom, sheep_chief, moulin_ceres, zulu_lumber, donkey_ford,
      stick_cheez, maklak_enoch, fish_beast, frog_klinton, foiled_hawaii, nirish_pirate,
      ocha_sneezy, rouge_dutch, hours_huhhuh, banshee_pasta, eggsalad_bolt, snape_subway,
      floo_nasdaq, iterate_rod, draco_ladder, honey_palm, donkey_gin, onthepc_meth,
      cuckoo_stix, surprise_yoda, fire_papyrus, lantern_pizza, sun_badmonkey, india_rarest,
      tabasco_eel, shuda_pixie, steaming_eel, speeding_bfi, kmfdm_shuda, oranges_ebi,
      lsd_potato, kappa_speedyg, zedong_tesla, nail_curly, bashful_curie, odin_stix,
      drevil_square, chillis_frog, goofy_kanji, pdiddy_eel, Iwin_heidi, fallen_whammy,
      peace_beemer, lucent_nigiri, ihilani_togos, hut_milo, waffle_shark, gerard_indigo,
      chips_jjocen, willy_chevys, iron_biker, bloom_onthepc, papa_pyro, dog_dig,
      graduated_red, octapus_golf, Iwin_wiggum, iron_monkey, iron_goblin, isle_smithers,
      zhuang_egg, troll_bismuth, cain_ford, att_bathroom, onion_fury, jason_rerun,
      loser_leaky, palm_gopher, what_goblin, broom_jacob, shrimp_albus, jcrew_oracle,
      pepsi_papa, wine_due, golden_arthur, surfer_mexico, dipsy_mine, drax_maryann,
      wicked_onion, subway_lost, biker_pirate, wanton_rocks, foryou_killme, zebra_south,
      peta_yellow, neon_ozzy, troll_hummer, tabasco_husks, jiminy_goblin, firewalk_tako,
      fuji_nihlist, marquis_sinew, pacbell_abel, downers_cafe, rhvcens_shark, ants_asahi,
      knot_yankee, papa_scotch, whale_oldnavy, questo_blue, tobe_cubish, llama_molokai,
      siamese_honda, drugs_otter, bono_knockout, ants_fitter, genji_stix, penguin_cafe,
      blue_kappa, nyquil_broom, spock_egg, zedong_romeo, pilot_china, monkey_crab,
      woman_giraffe, zebra_dimetap, blue_floo, zulu_barty, joey_wonder, lima_famulan,
      tin_atchoo, newt_sgates, dimetap_enoch, kebab_subway, salsa_norris, mine_nest,
      speed_brian, pdiddy_hawaii, helena_sleepy, hours_zealot, obiwan_foryou, wrecker_beef,
      newt_yankee, troll_stirfry, whatelse_lima, bacon_chuck, bfs_romeo, asahi_potter,
      pig_rainbow, neptune_ceres, moses_pork, ritsu_orange, moron_indigo, kdqcens_ring,
      fury_bismuth, witch_animal, fear_homer, tattoo_cubish, square_bison, china_ramone,
      donut_vadar, moe_eggsalad, lemon_nasdaq, beast_golden, crab_kbtoys,

     // tristate outputs
 crystal, uppers, downers, atilla_cuanto, tako_marco,

     clock0, clock1, reset0, reset1
);
  input bravo;
  input charlie;
  input delta;
  input oscar;
  input papa;
  input quebec;
  input tango;
  input yankee;
  input zulu;
  input bomb_pop;
  input gojira;
  input richard;
  input cybex;
  input mine;
  input bullet;
  input marker;
  input red;
  input blue;
  input green;
  input aphid;
  input duck;
  input eagle;
  input eel;
  input elephant;
  input emu;
  input fish;
  input frog;
  input goat;
  input hippo;
  input iguana;
  input jellyfish;
  input monkey;
  input whacky;
  input wildboar;
  input lagoon;
  input husks;
  input escape;
  input foiled;
  input bamboo;
  input desert;
  input isle;
  input pacific;
  input ocean;
  input waterfall;
  input tan_nodes;
  input loud;
  input millionaire;
  input chevys_pork;
  input kanji_bubba;
  input deng_pepsi;
  input fufu_pilot;
  input itchy_cubish;
  input boing_guy;
  input boots_theseus;
  input pentium_meth;
  input hotdog_armand;
  input boitano_yak;
  input ocean_barney;
  input zed_zi;
  input cheez_isle;
  input roe_starwars;
  input chuck_wizard;
  input pepsi_valve;
  input floo_shrimp;
  input curie_xray;
  input tiger_water;
  input mars_handroll;
  input buddha_subway;
  input heidi_moreand;
  input purple_macys;
  input nigiri_nigiri;
  input geisha_moe;
  input nasdaq_fire;
  input covad_lost;
  input meth_yak;
  input potter_covad;
  input prison_icarus;
  input spain_vegas;
  input drax_the_pope;
  input albus_china;
  input tracy_think;
  input bagel_fury;
  input troll_green;
  input lsd_huey;
  input dorkus_fang;
  input ozzy_ulysses;
  input amex_richard;
  input bfi_billnted;
  input rubeus_goblin;
  input ebay_kedavra;
  input bomb_pop_pyro;
  input ham_mickey;
  input pierre_eagle;
  input enoch_amex;
  input yoda_kaisha;
  input aladdin_curie;
  input venus_homerun;
  input fascist_bambi;
  input zinc_blessyou;
  input homer_abraham;
  input togos_jonas;
  input emu_isle;
  input money_desert;
  input bach_aladdin;
  input vulture_east;
  input drunken_clay;
  input romex_weapons;
  input draco_sortout;
  input llama_cuanto;
  input too_big_goofy;
  input hours_acid;
  input oitcen_wicked;
  input desade_arthur;
  input picante_pizza;
  input mine_green;
  input clock0, clock1, reset0, reset1;

  output george;
  output rodriguez;
  output norris;
  output fufu_jonas;
  output larry_hagrid;
  output oscar_famulan;
  output show_peace;
  output plague_buddha;
  output tobe_vampire;
  output arizona_pizza;
  output intel_lumber;
  output enoch_hans;
  output minnie_beavis;
  output comrade_sand;
  output vegan_possum;
  output hanger_tango;
  output jxnbox_hp;
  output bacon_kanji;
  output wheezer_boots;
  output rod_rewire;
  output porfavor_fury;
  output salsa_otter;
  output hotdog_enoch;
  output maki_ring;
  output love_in_fish;
  output malfoy_float;
  output fufu_ebay;
  output bravo_gopher;
  output roid_handroll;
  output hummer_wiggum;
  output sanity_foiled;
  output po_kidnapper;
  output dirk_whiskey;
  output iguana_east;
  output raiders_ariel;
  output noah_dingbat;
  output zeus_protest;
  output oranges_broom;
  output sheep_chief;
  output moulin_ceres;
  output zulu_lumber;
  output donkey_ford;
  output stick_cheez;
  output maklak_enoch;
  output fish_beast;
  output frog_klinton;
  output foiled_hawaii;
  output nirish_pirate;
  output ocha_sneezy;
  output rouge_dutch;
  output hours_huhhuh;
  output banshee_pasta;
  output eggsalad_bolt;
  output snape_subway;
  output floo_nasdaq;
  output iterate_rod;
  output draco_ladder;
  output honey_palm;
  output donkey_gin;
  output onthepc_meth;
  output cuckoo_stix;
  output surprise_yoda;
  output fire_papyrus;
  output lantern_pizza;
  output sun_badmonkey;
  output india_rarest;
  output tabasco_eel;
  output shuda_pixie;
  output steaming_eel;
  output speeding_bfi;
  output kmfdm_shuda;
  output oranges_ebi;
  output lsd_potato;
  output kappa_speedyg;
  output zedong_tesla;
  output nail_curly;
  output bashful_curie;
  output odin_stix;
  output drevil_square;
  output chillis_frog;
  output goofy_kanji;
  output pdiddy_eel;
  output Iwin_heidi;
  output fallen_whammy;
  output peace_beemer;
  output lucent_nigiri;
  output ihilani_togos;
  output hut_milo;
  output waffle_shark;
  output gerard_indigo;
  output chips_jjocen;
  output willy_chevys;
  output iron_biker;
  output bloom_onthepc;
  output papa_pyro;
  output dog_dig;
  output graduated_red;
  output octapus_golf;
  output Iwin_wiggum;
  output iron_monkey;
  output iron_goblin;
  output isle_smithers;
  output zhuang_egg;
  output troll_bismuth;
  output cain_ford;
  output att_bathroom;
  output onion_fury;
  output jason_rerun;
  output loser_leaky;
  output palm_gopher;
  output what_goblin;
  output broom_jacob;
  output shrimp_albus;
  output jcrew_oracle;
  output pepsi_papa;
  output wine_due;
  output golden_arthur;
  output surfer_mexico;
  output dipsy_mine;
  output drax_maryann;
  output wicked_onion;
  output subway_lost;
  output biker_pirate;
  output wanton_rocks;
  output foryou_killme;
  output zebra_south;
  output peta_yellow;
  output neon_ozzy;
  output troll_hummer;
  output tabasco_husks;
  output jiminy_goblin;
  output firewalk_tako;
  output fuji_nihlist;
  output marquis_sinew;
  output pacbell_abel;
  output downers_cafe;
  output rhvcens_shark;
  output ants_asahi;
  output knot_yankee;
  output papa_scotch;
  output whale_oldnavy;
  output questo_blue;
  output tobe_cubish;
  output llama_molokai;
  output siamese_honda;
  output drugs_otter;
  output bono_knockout;
  output ants_fitter;
  output genji_stix;
  output penguin_cafe;
  output blue_kappa;
  output nyquil_broom;
  output spock_egg;
  output zedong_romeo;
  output pilot_china;
  output monkey_crab;
  output woman_giraffe;
  output zebra_dimetap;
  output blue_floo;
  output zulu_barty;
  output joey_wonder;
  output lima_famulan;
  output tin_atchoo;
  output newt_sgates;
  output dimetap_enoch;
  output kebab_subway;
  output salsa_norris;
  output mine_nest;
  output speed_brian;
  output pdiddy_hawaii;
  output helena_sleepy;
  output hours_zealot;
  output obiwan_foryou;
  output wrecker_beef;
  output newt_yankee;
  output troll_stirfry;
  output whatelse_lima;
  output bacon_chuck;
  output bfs_romeo;
  output asahi_potter;
  output pig_rainbow;
  output neptune_ceres;
  output moses_pork;
  output ritsu_orange;
  output moron_indigo;
  output kdqcens_ring;
  output fury_bismuth;
  output witch_animal;
  output fear_homer;
  output tattoo_cubish;
  output square_bison;
  output china_ramone;
  output donut_vadar;
  output moe_eggsalad;
  output lemon_nasdaq;
  output beast_golden;
  output crab_kbtoys;

//tristate outs
  output crystal;
  output uppers;
  output downers;
  output atilla_cuanto;
  output tako_marco;


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



  reg echo;
  reg foxtrot;
  reg golf;
  reg hotel;
  reg india;
  reg juliet;
  reg kilo;
  reg lima;
  reg mike;
  reg november;
    parameter alpha_0 = 0,alpha_1 = 1,alpha_2 = 2,alpha_3 = 3,alpha_4 = 4,alpha_5 = 5,alpha_6 = 6,alpha_7 = 7;
    reg [3:0] alpha;

  reg romeo;
  reg uniform;
  reg whiskey;
  reg for_gregg;
  reg yeanyow;
  reg babette;
  reg hinge;
  reg bolt;
  reg launcher;
  reg tank;
  reg badger;
  reg bear;
  reg beetle;
  reg bison;
  reg bull;
  reg cassowary;
  reg cat;
  reg chicken;
  reg cow;
  reg dog;
  reg donkey;
  reg dragon;
  reg kangaroo;
  reg lion;
  reg lizard;
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
  reg sheep;
  reg tiger;
  reg turtle;
  reg unicorn;
  reg vulture;
  reg whale;
  reg wolverine;
  reg woodpecker;
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
  reg xterm;
  reg noah;
  reg english;
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
  reg grumpy;
  reg bashful;
  reg donald;
  reg mickey;
  reg minnie;
  reg spock;
  reg goofy;
  reg gyro;
  reg scrooge;
  reg huey;
  reg duey;
  reg louie;
  reg jiminy;
  reg cinderella;
  reg sleeping;
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
  reg ulysses;
  reg agamemnon;
  reg aladdin;
  reg bambi;
  reg pocahontas;
  reg buddha;
  reg clinton;
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
    parameter bush_0 = 0,bush_1 = 1,bush_2 = 2,bush_3 = 3;
    reg [3:0] bush;

  reg homer;
  reg barty;
  reg cartman;
  reg sand;
  reg hours;
  reg lamer;
  reg hoser;
  reg dweebie;
  reg motorhead;
  reg burnout;
  reg jacques;
  reg pdiddy;
  reg pdaddy;
  reg dorkus;
  reg drunken;
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
  reg questo;
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
  reg crayons;
  reg kmfdm;
  reg pentium;
  reg bubba;
  reg ohno;
  reg fallen;
  reg comrade;
  reg chairman;
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
  reg workhere;
  reg onthepc;
  reg facetious;
  reg mariollama;
  reg rafting;
  reg freaky;
  reg davidlin;
  reg blueled;
  reg pirate;
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
  reg budlite;
  reg morenames;
  reg mrbill;
  reg candle;
  reg spyro;
  reg speedyg;
  reg kennyg;
  reg johndenver;
  reg jacklemon;
  reg theonion;
  reg chatanooga;
  reg kebab;
  reg kabar;
  reg fullmetal;
  reg aluminum;
  reg zinc;
  reg tin;
  reg iron;
  reg fascist;
  reg anarchist;
  reg socialist;
  reg moderate;
  reg floating;
  reg drevil;
  reg erncenso;
  reg fsncens;
  reg gtncensor;
  reg tinker;
  reg lunchtime;
  reg roosevelt;
  reg hxncensorce;
  reg opus;
  reg portnoy;
  reg milo;
  reg bloom;
    parameter capitalist_0 = 0,capitalist_1 = 1,capitalist_2 = 2,capitalist_3 = 3,capitalist_4 = 4,capitalist_5 = 5,capitalist_6 = 6,capitalist_7 = 7,capitalist_8 = 8,capitalist_9 = 9;
    reg [3:0] capitalist;

  reg potatoskin;
  reg roastbeef;
  reg poppyseed;
  reg clubsandwich;
  reg kungfu;
  reg fatality;
  reg testyour;
  reg might;
  reg excellent;
  reg Iwin;
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
  reg meffert;
  reg bismuth;
  reg floride;
  reg oranges;
  reg pyromaniac;
  reg junkie;
  reg waster;
  reg burner;
  reg crackhead;
  reg drugie;
  reg chemical;
  reg brothers;
  reg tunafish;
  reg eggsalad;
  reg postulator;
  reg satanist;
  reg plagarist;
  reg money;
  reg morrison;
  reg firewalk;
  reg withme;
  reg palmer;
  reg banality;
  reg brutality;
  reg fury;
  reg hurt;
  reg tobe;
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
  reg graduated;
  reg notalot;
  reg nation;
  reg protest;
  reg animal;
  reg vegan;
  reg vegetarian;
  reg psycho;
  reg extremist;
  reg fruitcake;
  reg zealot;
  reg chainsaw;
  reg rasp;
  reg square;
  reg romex;
  reg jxnbox;
  reg knockout;
  reg gutter;
  reg plaster;
  reg wood;
  reg rampacker;
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
  reg michelle;
  reg rocks;
  reg legos;
  reg eatem;
  reg blanket;
  reg china;
  reg usa;
  reg holland;
  reg mexico;
  reg spain;
  reg greenland;
  reg scotland;
  reg england;
  reg iceland;
  reg romulus;
  reg remus;
  reg cain;
  reg abel;
  reg zipporah;
  reg issac;
  reg abraham;
  reg jacob;
  reg joseph;
  reg dreamcoat;
    parameter puertorico_0 = 0,puertorico_1 = 1,puertorico_2 = 2,puertorico_3 = 3,puertorico_4 = 4,puertorico_5 = 5,puertorico_6 = 6;
    reg [3:0] puertorico;

  reg ringlingbros;
  reg terrance;
  reg cryptic;
  reg mdtcensorc;
  reg moses;
  reg nhtcenso;
  reg daughter;
  reg gin;
  reg rum;
  reg larry;
  reg barnum;
  reg shemp;
  reg wiggum;
  reg bart;
  reg lisa;
  reg marge;
  reg homerun;
  reg barney;
  reg skinner;
  reg krabapple;
  reg tarzan;
  reg moe;
  reg smithers;
  reg comicbook;
  reg worstdesignever;
  reg flanders;
  reg heidi;
  reg steaming;
  reg milhouse;
  reg rod;
  reg todd;
  reg chewbacca;
  reg timmy;
  reg tukatuk;
  reg slobbering;
  reg weevil;
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
  reg ramone;
  reg often;
  reg south;
  reg edible;
  reg srvcensorce;
  reg on_sale;
  reg dinoblaster;
  reg crunchyfrog;
  reg expects_the;
  reg inquisition;
  reg chief;
  reg weapons;
  reg fear;
  reg surprise;
  reg efficiency;
  reg fanatical;
  reg devotion;
  reg yummy;
  reg love_in;
  reg po;
  reg dipsy;
  reg touch;
  reg peopleeater;
  reg haze;
  reg timingmodel;
  reg plumber;
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
  reg badmonkey;
  reg guy;
  reg partners;
  reg cubish;
  reg solder;
  reg valve;
  reg furnace;
  reg pilot;
  reg leaky;
    parameter goodmonkey_0 = 0,goodmonkey_1 = 1,goodmonkey_2 = 2,goodmonkey_3 = 3,goodmonkey_4 = 4,goodmonkey_5 = 5,goodmonkey_6 = 6,goodmonkey_7 = 7,goodmonkey_8 = 8,goodmonkey_9 = 9,goodmonkey_10 = 10,goodmonkey_11 = 11;
    reg [3:0] goodmonkey;

  reg potter;
  reg killme;
  reg tyycensor;
  reg sortout;
  reg sgates;
  reg atoms;
  reg thankee;
  reg wakey;
  reg ants;
  reg dig;
  reg ladder;
  reg wrecker;
  reg dumptruck;
  reg dumbarton;
    parameter moonraker_0 = 0,moonraker_1 = 1,moonraker_2 = 2,moonraker_3 = 3,moonraker_4 = 4,moonraker_5 = 5,moonraker_6 = 6,moonraker_7 = 7,moonraker_8 = 8,moonraker_9 = 9;
    reg [3:0] moonraker;

  reg golden;
  reg tofu;
  reg billnted;
  reg synthesis;
  reg dingbat;
  reg sweetie;
  reg wiggles;
  reg wanton;
  reg rewire;
  reg thread;
  reg suffering;
  reg art;
  reg vegas;
  reg tamago;
  reg tuna;
  reg salmon;
  reg sake;
  reg ritsu;
  reg ebi;
  reg shrimp;
  reg rainbow;
  reg tako;
  reg octapus;
  reg hamachi;
  reg yellowtail;
  reg kana;
  reg crab;
  reg nigiri;
  reg handroll;
  reg maki;
  reg tobiko;
  reg kappa;
  reg cucumber;
  reg california;
  reg ebay;
  reg covad;
  reg exodus;
  reg abovenet;
  reg webvan;
  reg lucent;
  reg ibm;
  reg intel;
  reg hp;
  reg gm;
  reg ford;
  reg chevys;
  reg chillis;
  reg lockheed;
  reg martin;
  reg martian;
  reg molokai;
  reg amex;
  reg nasdaq;
  reg dow;
  reg taoist;
  reg microsoft;
  reg sun;
  reg oracle;
  reg century;
  reg harrydavid;
  reg safeway;
  reg pepsi;
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
  reg atchoo;
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
  reg jacuzzi;
  reg blaster;
  reg bonker;
  reg beemer;
  reg bono;
  reg concorde;
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
  reg drugs;
  reg children;
  reg crank;
  reg marijuana;
  reg lsd;
  reg crack;
  reg speed;
  reg meth;
  tri crystal;
  tri uppers;
  tri downers;
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
  reg exfoliant;
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
  reg giraffe;
  reg lotus;
  reg flyingmonkey;
  reg scotchtape;
  reg wicked;
  reg witch;
  reg ghost;
  reg elf;
  reg centaur;
  reg minotaur;
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
  reg moody;
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
  reg umbridge;
  reg filch;
  reg norris;
  reg chuck;
  reg sirius;
  reg black;
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
  reg pintobeans;
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
  reg maryann;
  reg gilligan;
  reg skipper;
  reg professor;
  reg moviestar;
  reg ginger;
  reg jonas;
  reg grumby;
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
  reg rerun;
  reg fronds;
  reg hut;
  reg rescue;
  reg hawaii;
  reg wallstreet;
  reg levelization;
  reg huhhuh;
  reg uomcensor;
  reg hiswife;
  reg smack;
  reg banshee;
  reg vimcensorc;
  reg tesla;
  reg killer;
  reg wonton;
  reg pierre;
  reg armand;
  reg rufus;
  reg willy;
  reg gonzo;
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
  reg tapered;
  reg spastic;
  reg lad;
  reg mao;
  reg zedong;
  reg deng;
  reg xiaoping;
  reg jinyong;
  reg lao;
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
  reg gerard;
  reg leeuwenhoek;
  reg microscope;
  reg erasmus;
  reg deruyter;
  reg vangoh;
  reg fortuyn;
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
  reg romex_dingbat;
  reg nyc_rubeus;
  reg danger_star;
  reg peace_boots;
  reg tango_saturn;
  reg desade_touch;
  reg salmon_mickey;
  reg gin_kdqcens;
  reg atchoo_deng;
  reg zulu_hagrid;
  reg weevil_tako;
  reg china_ham;
  reg cheese_tobiko;
  reg pork_eel;
  reg thedon_goofy;
  reg skinner_ohno;
  reg boots_sanity;
  reg jupiter_ceres;
  reg east_zealot;
  reg yankee_huey;
  reg stoner_zed;
  reg aphid_bullet;
  reg bach_onion;
  reg chuck_golf;
  reg hurt_saturn;
  reg foxtrot_ring;
  reg red_barty;
  reg nyc_foliage;
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
  reg advil_rose;
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
  reg wonton_tonic;
  reg leaky_sanity;
  reg ramone_black;
  reg intuit_voodoo;
  reg spain_stix;
  reg oscar_tobiko;
  reg deng_tinker;
  reg crack_donald;
  reg troll_lemon;
  reg parrot_eeevil;
  reg lsd_turnip;
  reg bach_maryann;
  reg danger_pig;
  reg lotus_sgates;
  reg dopey_tattoo;
  reg ready_tiger;
  reg rasp_stoned;
  reg weasley_valve;
  reg portnoy_stick;
  reg weevil_solder;
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
  reg kang_bacon;
  reg popcorn_advil;
  reg gerard_kungfu;
  reg whale_malfoy;
  reg tylenol_otter;
  reg yankee_hoser;
  reg bush_wiggles;
  reg west_eatem;
  reg kappa_zed;
  reg beast_uppers;
  reg blue_aphid;
  reg jonas_falafel;
  reg zulu_eel;
  reg wildboar_iron;
  reg madeye_mozart;
  reg obiwan_rabbi;
  reg tuna_minerva;
  reg parrot_doc;
  reg homerun_stix;
  reg edible_amex;
  reg ham_alpha;
  reg moody_noah;
  reg hagrid_neon;
  reg diagon_willy;
  reg uppers_speed;
  reg pentium_tin;
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
  reg moulin_crank;
  reg otter_kedavra;
  reg kana_zi;
  reg saturn_simasu;
  reg ready_centaur;
  reg rojas_tobe;
  reg goofy_kappa;
  reg hoser_zen;
  reg marco_freaky;
  reg zebra_lad;
  reg yellow_wine;
  reg wine_sand;
  reg curly_fear;
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
  reg moe_carolina;
  reg doc_bathroom;
  reg fury_saturn;
  reg hiway_jesus;
  reg bison_mexican;
  reg wanton_flew;
  reg killer_ready;
  reg stemcell_zed;
  reg valve_loud;
  reg viagra_filch;
  reg peaves_dutch;
  reg tabby_guy;
  reg bacon_gyro;
  reg ready_chips;
  reg copper_gerrit;
  reg water_foryou;
  reg show_mrbill;
  reg tin_lestrange;
  reg draco_october;
  reg clay_yohimbe;
  reg beef_covad;
  reg curious_moron;
  reg chief_bambi;
  reg rat_wakey;
  reg aspirin_ritsu;
  reg tonks_snake;
  reg what_husks;
  reg newt_sirius;
  reg crack_lamer;
  reg egg_homer;
  reg fear_star;
  reg rojas_kungfu;
  reg solder_issac;
  reg kabar_whiskey;
  reg eel_zinc;
  reg pluto_psycho;
  reg yak_brothers;
  reg moreand_willy;
  reg ajax_psycho;
  reg mushroom_dork;
  reg boots_yellow;
  reg oscar_bonker;
  reg bomb_yohimbe;
  reg sun_tesla;
  reg metal_dog;
  reg tabby_moses;
  reg kanji_uppers;
  reg [7:0] hp_eeevil_reg, hp_eeevil_next;
  reg hp_eeevil_b0, hp_eeevil_fbk;
  parameter hp_eeevil_taps = 8'b10001110;
  integer hp_eeevil_n;
  reg nobody_zeus;
  reg tesla_scrooge;
  reg pdiddy_dirty;
  reg neville_beef;
  reg whacky_husks;
  reg shark_palm;
  reg loud_ariel;
  reg fortuyn_heidi;
  reg mushroom_zed;
  reg brian_zulu;
  reg priest_echo;
  reg dork_love_in;
  reg kang_tsmc;
  reg boots_cuckoo;
  reg cybex_saturn;
  reg skipper_happy;
  reg what_peta;
  reg midas_trevor;
  reg donkey_genji;
  reg starwars_gyro;
  reg century_biker;
  reg dow_rubeus;
  reg bush_gutter;
  reg sun_wannabe;
  reg guy_ykocens;
  reg sake_ocha;
  reg oscar_gin;
  reg nasdaq_iron;
  reg po_killme;
  reg zinc_bust;
  reg joker_gotone;
  reg rojas_norbert;
  reg iguana_buddha;
  reg otter_hotel;
  reg books_gojira;
  reg tiger_drugs;
  reg pdaddy_powder;
  reg beauty_coffee;
  reg tabasco_snape;
  reg quail_minnie;
  reg barney_cannon;
  reg ghost_asahi;
  reg pirate_mrbill;
  reg black_intuit;
  reg atomic_lad;
  reg shark_peace;
  reg suffering_gm;
  reg spyro_lima;
  reg lao_beef;
  reg hulk_booming;
  reg marco_thread;
  reg sanity_fallen;
  reg dopey_bomb;
  reg roid_kungfu;
  reg rewire_bubba;
  reg wildboar_mao;
  reg money_donut;
  reg waffle_midas;
  reg wizard_norris;
  reg black_kebab;
  reg show_bacon;
  reg master_elf;
  reg purple_maki;
  reg baron_juliet;
  reg yoda_kangaroo;
  reg banshee_think;
  reg martin_bolt;
  reg bush_kbtoys;
  reg mideast_bolt;
  reg minnow_marco;
  reg hurt_rose;
  reg hours_green;
  reg venus_elian;
  reg pyro_zipporah;
  reg killer_marker;
  reg snake_marco;
  reg bubba_peta;
  reg honda_pdaddy;
  reg zed_orange;
  reg ulysses_nyc;
  reg art_zed;
  reg what_intel;
  reg gopher_minnow;
  reg neon_snape;
  reg zedong_lucius;
  reg foryou_rubik;
  reg chairman_bfs;
  reg sgates_thedon;
  reg hulk_atomic;
  reg peace_broom;
  reg boing_illegal;
  reg kang_minnie;
  reg fortuyn_lamer;
  reg pacific_asahi;
  reg todd_pictures;
  reg holland_haze;
  reg wujing_xray;
  reg dopey_sinew;
  reg advil_cow;
  reg platinum_haze;
  reg fire_waster;
  reg iterate_sugar;
  reg amex_potter;
  reg loud_chiptrip;
  reg south_toysrus;
  reg echo_eggsalad;
  reg cain_intel;
  reg homerun_deng;
  reg india_squad;
  reg sanity_tarzan;
  reg concorde_show;
  reg covad_ocha;
  reg weevil_money;
  reg loser_echo;
  reg potter_thor;
  reg money_fortuyn;
  reg blue_carolina;
  reg hanger_lizard;
  reg gregg_a_lovey;
  reg gap_tamago;
  reg genji_stirfry;
  reg fish_waffle;
  reg daughter_sake;
  reg oscar_too_big;
  reg dork_rouge;
  reg jonas_rocks;
  reg husks_gotone;
  reg klaas_diagon;
  reg jcrew_cow;
  reg rarest_emails;
  reg kanji_clay;
  reg concorde_bart;
  reg master_bamboo;
  reg att_launcher;
  reg surfer_tuna;
  reg dig_shark;
  reg illegal_rod;
  reg vegas_peace;
  reg beef_shuda;
  reg soccer_speed;
  reg zhuang_drugie;
  reg falafel_sun;
  reg quebec_lovey;
  reg potato_rod;
  reg south_nasdaq;
  reg malfoy_boing;
  reg yankees_heidi;
  reg giraffe_huey;
  reg bono_homer;
  reg pig_fear;
  reg curly_baron;
  reg loser_curious;
  reg obiwan_quail;
  reg bravo_haze;
  reg rasp_bubba;
  reg drugie_pilot;
  reg tsmc_safada;
  reg ford_comtrex;
  reg snort_jinyong;
  reg bert_south;
  reg art_norbert;
  reg legos_tofu;
  reg ladder_pyro;
  reg hotdog_sgates;
  reg palm_haze;
  reg boitano_brian;
  reg hippo_mozart;
  reg nest_crank;
  reg roid_odin;
  reg due_tango;
  reg goofy_bach;
  reg fufu_minnow;
  reg trevor_wanton;
  reg freaky_marco;
  reg lagoon_broom;
  reg tinker_sheep;
  reg lizard_kanji;
  reg foxtrot_sears;
  reg sheep_bart;
  reg chief_peta;
  reg west_powder;
  reg dimetap_bagel;
  reg trevor_thread;
  reg zen_tako;
  reg curie_macys;
  reg exodus_lima;
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
  reg babette_crank;
  reg chillis_peace;
  reg lima_hummer;
  reg bolt_foliage;
  reg dweebie_bep;
  reg llama_palm;
  reg kilo_knot;
  reg emu_xiaoping;
  reg tiger_dimetap;
  reg water_century;
  reg ernie_woman;
  reg woman_tiger;
  reg bust_zen;
  reg hinge_enoch;
  reg homer_goofy;
  reg maklak_waffle;
  reg egg_starwars;
  reg north_fortuyn;
  reg ariel_wujing;
  reg boitano_bagel;
  reg deuce_bismuth;
  reg emu_skinner;
  reg blessyou_haze;
  reg knot_neville;
  reg pepsi_spanish;
  reg bolt_trevor;
    parameter ladder_lizard_0 = 0,ladder_lizard_1 = 1,ladder_lizard_2 = 2,ladder_lizard_3 = 3,ladder_lizard_4 = 4,ladder_lizard_5 = 5,ladder_lizard_6 = 6,ladder_lizard_7 = 7,ladder_lizard_8 = 8;
    reg [3:0] ladder_lizard;

  reg kungfu_surfer;
  reg gulp_mushroom;
  reg ihilani_bert;
  reg tattoo_east;
  reg ghost_zinc;
  reg rat_xterm;
  reg master_bart;
  reg gonzo_eunice;
  reg often_onthepc;
  reg floo_saturn;
  reg greenbay_sake;
  reg llama_bismuth;
  reg baron_clay;
  reg southern_cow;
  reg gotone_marvin;
  reg marge_tofu;
  reg leaky_jinyong;
  reg vicks_skinner;
  reg mexico_sears;
  reg spyro_nirish;
  reg boing_jiminy;
  reg skipper_would;
  reg honda_elf;
  reg lsd_downers;
  reg chicken_romex;
  reg pdaddy_kappa;
  reg kabar_jacques;
  reg leidiot_duey;
  reg egg_might;
  reg golden_sleepy;
  reg joseph_husks;
  reg avon_oranges;
  reg bananarep_rum;
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
  reg tamago_opus;
  reg mine_nasdaq;
  reg roid_crayons;
  reg chief_timmy;
  reg atoms_art;
  reg moderate_eel;
  reg kappa_rufus;
  reg safeway_nest;
  reg biker_bono;
  reg kilo_rojas;
  reg often_master;
  reg floating_guy;
  reg hawaii_danger;
  reg life_atchoo;
  reg daughter_lisa;
  reg bfs_star;
  reg oscar_nyquil;
  reg tako_fortuyn;
  reg atoms_filch;
  reg zed_weevil;
  reg haze_smithers;
  reg burner_mrbill;
  reg squad_wukong;
  reg dork_porfavor;
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
  reg metal_covad;
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
  reg spastic_pilot;
  reg goat_mouse;
  reg mike_stirfry;
  reg hagrid_indigo;
  reg crayons_ibm;
  reg hut_burnout;
  reg oranje_zen;
  reg covad_pdiddy;
  reg eel_psycho;
  reg rarest_chevys;
  reg plaster_yummy;
  reg stix_broom;
  reg kbtoys_tofu;
  reg theseus_rojas;
  reg stroop_doc;
  reg leaky_snort;
  reg kilo_tylenol;
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
  reg animal_faster;
  reg ginger_hinge;
  reg curly_red;
  reg lad_zebra;
  reg whacky_hinge;
  reg neville_over;
  reg green_sortout;
  reg mine_chief;
  reg avon_neon;
  reg snake_copper;
  reg kmfdm_marvin;
  reg cubish_issac;
  reg dig_uppers;
  reg liberace_lad;
  reg goblin_cubish;
  reg west_sand;
  reg emails_lamer;
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
  reg nyc_pizza;
  reg tabby_nuclear;
  reg mars_monkey;
  reg ramone_amex;
  reg remus_vicks;
  reg penguin_cheez;
  reg turkey_tank;
  reg foxtrot_boots;
  reg porfavor_ebi;
  reg palmer_dadada;
  reg dragon_paper;
  reg po_mario_owes;
  reg stoner_candle;
  reg bravo_hours;
  reg george_lovey;
  reg sheep_gyro;
  reg jason_drunken;
  reg bach_rewire;
  reg beetle_genji;
  reg cybex_hawaii;
  reg iron_gonzo;
  reg advil_iceland;
  reg smack_beavis;
  reg southern_bfi;
  reg cafe_concorde;
  reg west_stick;
  reg falafel_north;
  reg beetle_star;
  reg genji_dweebie;
  reg rum_tukatuk;
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
  reg opus_riddler;
  reg pizza_rose;
  reg kilo_autotest;
  reg fitter_pilot;
  reg spastic_todd;
  reg golfland_roid;
  reg richard_lamer;
  reg beemer_floo;
  reg escape_jesus;
  reg dragon_broom;
  reg burner_bfi;
  reg egg_wonton;
  reg curie_lost;
  reg wine_mine;
  reg mrbill_mars;
  reg athena_barty;
  reg marge_dirty;
  reg salsa_master;
  reg sirius_tobiko;
  reg venus_martian;
  reg goat_romex;
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
  reg moron_gin;
  reg roe_kanji;
  reg nyc_candle;
  reg elf_killer;
  reg curie_plague;
  reg spyro_neon;
  reg kungfu_elian;
  reg gap_greenbay;
  reg gilligan_mine;
  reg hector_potato;
  reg moron_curious;
  reg what_doobie;
  reg rose_larry;
  reg chillis_cybex;
  reg spain_yellow;
  reg advil_yummy;
  reg foryou_subway;
  reg freaky_pdaddy;
  reg bonker_gonzo;
  reg bfs_mortar;
  reg hans_palmer;
  reg curie_sogood;
  reg life_rabbi;
  reg fear_exodus;
  reg itchy_rose;
  reg parrot_dragon;
  reg yak_holepunch;
  reg ajax_spyro;
    parameter homerun_meth_0 = 0,homerun_meth_1 = 1,homerun_meth_2 = 2,homerun_meth_3 = 3,homerun_meth_4 = 4,homerun_meth_5 = 5;
    reg [3:0] homerun_meth;

  reg indigo_buddha;
  reg minerva_wakey;
  reg wonder_fronds;
  reg nasdaq_shemp;
  reg opus_liberace;
  reg stick_intuit;
  reg hulk_kaisha;
  reg show_theseus;
  reg seashell_abel;
  reg lao_steaming;
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
    parameter beetle_whale_0 = 0,beetle_whale_1 = 1,beetle_whale_2 = 2,beetle_whale_3 = 3;
    reg [3:0] beetle_whale;

  reg nigiri_chuck;
  reg lizard_peta;
  reg donald_rescue;
  reg jupiter_lsd;
  reg kennyg_barney;
  reg delta_desert;
  reg lao_pegasus;
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
  reg vangoh_ebay;
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
  reg weasley_hinge;
  reg bismuth_fire;
  reg sand_lotus;
  reg yoku_tonic;
  reg south_curie;
  reg att_maryann;
  reg whack_smack;
  reg hinge_questo;
  reg tsmc_snape;
  reg victor_cuanto;
  reg baron_viagra;
  reg elephant_gm;
  reg blanket_pilot;
  reg ceres_intel;
  reg superman_todd;
  reg mike_lotus;
  reg parrot_hippo;
  reg acid_tapered;
  reg pepsi_gerard;
  reg crack_kungfu;
  reg snape_neptune;
  reg fish_itchy;
  reg star_ernie;
  reg hp_rampacker;
  reg turnip_foiled;
  reg jason_dirty;
  reg moe_burning;
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
  reg illegal_dow;
  reg furnace_kilo;
  reg ceres_bach;
  reg oranges_loud;
  reg curie_aspirin;
  reg vangoh_dadada;
  reg vegan_lupin;
  reg chevys_mexico;
  reg bacon_drugs;
  reg bolt_kabar;
  reg boots_macys;
  reg roid_broom;
  reg star_arthur;
  reg turnip_deng;
  reg master_milo;
  reg raiders_louie;
  reg knot_picante;
  reg sirius_dopey;
  reg killer_hanger;
  reg china_whacky;
    parameter fitter_honey_0 = 0,fitter_honey_1 = 1,fitter_honey_2 = 2,fitter_honey_3 = 3,fitter_honey_4 = 4;
    reg [3:0] fitter_honey;

  reg kappa_drax;
  reg acid_muffin;
  reg tattoo_bloom;
  reg salmon_badger;
  reg fire_hiswife;
  reg chips_jacuzzi;
  reg rodent_south;
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
  reg dingbat_lad;
  reg psycho_goofy;
  reg mushroom_east;
  reg howell_hans;
  reg Iwin_intuit;
  reg zen_loud;
  reg iron_wonton;
  reg pirate_flew;
  reg crab_iterate;
  reg green_eeevil;
  reg rescue_hp;
  reg touch_neptune;
  reg foxtrot_honda;
  reg happy_bear;
  reg loud_romulus;
  reg hurt_pluto;
  reg iterate_south;
  reg mouse_icarus;
  reg kaisha_yak;
  reg homer_donkey;
  reg ceres_whale;
  reg shrimp_eagle;
  reg often_faster;
  reg palm_what;
  reg ladder_zinc;
  reg lion_sheep;
  reg muffin_joseph;
  reg balloon_yoku;
  reg tuna_bracket;
  reg mao_willem;
  reg arcade_chuck;
  reg malfoy_bull;
  reg prison_star;
  reg dragon_golf;
  reg atilla_hans;
  reg golden_fallen;
  reg fufu_mandarin;
  reg ohno_minnow;
  reg happy_deuce;
  reg cybex_moe;
  reg peace_tin;
  reg lovey_guy;
  reg sanity_beast;
  reg platinum_crab;
  reg goat_wujing;
  reg sand_wanton;
  reg athena_arthur;
  reg neon_xuprocar;
  reg broom_oranje;
  reg maklak_gyro;
  reg schwinger_bfs;
  reg hiswife_zinc;
  reg lala_martian;
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
  reg warlock_rod;
  reg zhuang_often;
  reg star_obiwan;
  reg star_yoku;
  reg jcrew_chips;
  reg burning_tesla;
  reg gopher_thread;
  reg bear_golf;
  reg bagel_rubik;
  reg gm_school;
  reg newt_devotion;
  reg plumber_fish;
  reg stix_iterate;
  reg tonks_england;
  reg killme_larry;
  reg arcade_ritsu;
  reg waster_beetle;
  reg meth_dirk;
  reg rod_wiggles;
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
  reg tobe_ants;
  reg zebra_bubba;
  reg hans_voodoo;
  reg Iwin_ladder;
  reg rat_solder;
  reg escape_rojas;
  reg spyro_might;
  reg sun_mrbill;
  reg south_aspirin;
  reg togos_haze;
  reg papyrus_huey;
  reg heidi_crank;
  reg sinew_gulp;
  reg turkey_sanity;
  reg lovey_ring;
  reg sun_larry;
  reg turtle_kilo;
  reg fang_honda;
  reg snort_nasdaq;
  reg charlie_ariel;
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
  reg hector_mao;
  reg spock_webvan;
  reg rat_fsncens;
  reg chillis_fish;
  reg bart_speed;
  reg coconut_witch;
  reg mouse_ghost;
  reg bagel_atomic;
  reg books_rodent;
  reg bush_uppers;
  reg lamer_fear;
  reg midas_dirty;
  reg turtle_life;
  reg ibm_fsncens;
  reg north_pacbell;
  reg black_yoku;
  reg hummer_potter;
  reg nobody_ebi;
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
  reg freaky_winner;
  reg sirius_zhuang;
  reg wukong_float;
  reg exodus_touch;
  reg tuna_baron;
  reg fufu_eagle;
  reg dopey_pierre;
  reg deng_gyro;
  reg advil_tango;
  reg riddler_po;
  reg fronds_lxtcen;
  reg rubeus_mortar;
  reg knot_clay;
  reg mao_honey;
  reg tonks_fallen;
  reg wood_gokidsgo;
  reg boing_freaky;
  reg animal_mickey;
  reg wine_edible;
  reg joseph_deuce;
  reg brian_advil;
  reg china_fitter;
  reg ebi_iwocensor;
  reg jesus_what;
  reg elian_bamboo;
  reg killer_curie;
  reg hp_richard;
  reg hotel_zed;
  reg dingbat_snape;
    parameter pixie_india_0 = 0,pixie_india_1 = 1,pixie_india_2 = 2,pixie_india_3 = 3,pixie_india_4 = 4,pixie_india_5 = 5,pixie_india_6 = 6,pixie_india_7 = 7,pixie_india_8 = 8;
    reg [3:0] pixie_india;

  reg bubba_doc;
  reg vangoh_hinge;
  reg martin_safada;
  reg peaves_hut;
  reg ready_xray;
  reg rerun_tapered;
  reg vadar_protest;
  reg picante_meth;
  reg south_ebi;
  reg questo_tamago;
  reg lisa_yoku;
  reg nasdaq_doc;
  reg pork_balloon;
  reg moulin_Iwin;
  reg drax_rat;
  reg rabbi_waffle;
  reg peace_cannon;
  reg zed_erncenso;
  reg midas_killer;
  reg square_cheese;
  reg jacuzzi_meth;
  reg dopey_master;
  reg moe_maritime;
  reg heidi_school;
  reg falafel_duey;
  reg deng_junkie;
  reg dadada_rescue;
  reg love_in_zulu;
  reg cow_tabasco;
  reg drugie_maki;
  reg wonder_bart;
  reg tasty_floo;
  reg tapered_xray;
  reg dork_valve;
  reg tobe_viagra;
  reg genesis_ozzy;
  reg mao_pacbell;
  reg dadada_rubik;
  reg hp_asahi;
  reg mortar_school;
  reg peace_willem;
  reg lagoon_rodent;
  reg fallen_pdaddy;
  reg clay_marco;
  reg kanji_mars;
  reg escape_star;
  reg kilo_pixie;
  reg odin_hamachi;
  reg vegas_clay;
  reg jcrew_siamese;
  reg bert_burning;
  reg bracket_barty;
  reg venus_georgec;
  reg witch_drugs;
  reg fatality_noah;
  reg howell_eatem;
  reg golf_onion;
  reg rose_vangoh;
  reg ham_donut;
  reg would_chips;
  reg marco_icarus;
  reg rodent_badger;
  reg deng_atoms;
  reg onion_moses;
  reg callme_stoned;
  reg advil_bep;
  reg mexico_pork;
  reg kanji_todd;
  reg rarest_yummy;
  reg crank_star;
  reg thread_plague;
  reg itchy_fallen;
  reg water_yummy;
  reg lagoon_ebay;
  reg rubik_whack;
  reg beavis_kbtoys;
  reg psycho_eagle;
  reg bambi_lao;
  reg webvan_books;
  reg spain_nail;
  reg larry_alpha;
  reg bep_pirate;
  reg onthepc_moe;
  reg tukatuk_mike;
  reg po_wizard;
  reg atomic_joker;
  reg tesla_icarus;
  reg meth_holland;
  reg ajax_shuda;
  reg desade_cuckoo;
  reg yak_on_sale;
  reg whacky_exodus;
  reg drdeath_gulp;
  reg pluto_armand;
  reg vegan_isle;
  reg newt_bear;
  reg bison_midas;
  reg faster_rocks;
  reg speed_george;
  reg macys_draco;
  reg advil_cocaine;
  reg oldnavy_tin;
  reg pizza_tobiko;
  reg cheese_jonas;
  reg mortar_rouge;
  reg wonder_luthor;
  reg senorduck_pig;
  reg bison_donut;
  reg art_jupiter;
  reg lotus_kungfu;
  reg rum_thankee;
  reg icarus_dig;
  reg remus_peta;
  reg oitcen_fuji;
  reg often_safeway;
  reg advil_picture;
  reg eatem_pixie;
  reg nyc_witch;
  reg rouge_burner;
  reg pasta_jupiter;
  reg kbtoys_often;
  reg cocaine_bush;
  reg spirit_bust;
  reg hut_athena;
  reg doc_copper;
  reg hours_would;
  reg pasta_buddha;
  reg nyquil_desert;
  reg onthepc_guy;
  reg kangaroo_Iwin;
  reg illegal_loser;
  reg arthur_ring;
  reg smack_thread;
  reg rubik_palmer;
  reg mortar_alpha;
  reg shemp_rufus;
  reg burnout_louie;
  reg winner_cubish;
  reg vegas_emails;
  reg broadway_duck;
  reg jacuzzi_lotus;
  reg usa_salmon;
  reg loud_art;
  reg golfland_rose;
  reg zinc_zealot;
  reg tango_lala;
  reg dipsy_ants;
  reg platypus_mars;
  reg lala_rojas;
  reg drax_timmy;
  reg badger_hotel;
  reg biker_snake;
  reg llama_eunice;
  reg po_yeanyow;
  reg huhhuh_smack;
  reg bfi_curious;
  reg vicks_monster;
  reg boing_comtrex;
  reg curie_vicks;
  reg freaky_tasty;
  reg jacques_macys;
  reg togos_monster;
  reg heidi_joker;
  reg bison_mickey;
  reg onion_shemp;
  reg kappa_bismuth;
  reg neville_xterm;
  reg xterm_wakey;
  reg potter_zealot;
  reg huhhuh_dow;
  reg honda_goofy;
  reg tofu_bonker;
  reg copper_due;
  reg webvan_bubba;
  reg platinum_clay;
  reg homer_egg;
  reg chuck_tattoo;
  reg larry_advil;
  reg sugar_donut;
  reg ready_lovey;
  reg wonder_wood;
  reg square_hanger;
  reg lima_pictures;
  reg north_wonton;
  reg oranje_beef;
  reg egg_hinge;
  reg whack_woman;
  reg lad_spirit;
  reg hp_zeus;
  reg neville_xray;
  reg draco_rabbi;
  reg mickey_fish;
  reg suffering_pig;
  reg november_ebay;
  reg rufus_black;
  reg papyrus_lisa;
  reg abraham_yoda;
  reg turkey_ohno;
  reg duck_wood;
  reg ibm_ykocens;
  reg dipsy_spanish;
  reg rescue_wakey;
  reg kilo_star;
    parameter clay_shark_0 = 0,clay_shark_1 = 1,clay_shark_2 = 2,clay_shark_3 = 3,clay_shark_4 = 4,clay_shark_5 = 5,clay_shark_6 = 6,clay_shark_7 = 7;
    reg [3:0] clay_shark;

  reg zedong_eunice;
  reg escape_acid;
  reg moe_stroop;
  reg doc_pictures;
  reg kmfdm_bismuth;
  reg richard_ariel;
  reg eatem_lotus;
  reg thankee_homer;
  reg ghost_school;
  reg ceres_bep;
  reg lumber_crucio;
  reg ramone_jcrew;
  reg biker_homer;
  reg psycho_danger;
  reg tasty_jjocen;
  reg deuce_juliet;
  reg egg_cafe;
  reg golf_xiaoping;
  reg chowmein_guy;
  reg ostrich_zi;
  reg crab_crayons;
  reg raiders_loser;
  reg bach_thankee;
  reg luthor_turtle;
  reg arizona_water;
  reg sneezy_junkie;
  reg lion_would;
  reg tapered_dig;
  reg think_would;
  reg wine_athena;
  reg dig_bambi;
  reg tinker_sierra;
  reg cannon_hanger;
  reg sneezy_zealot;
  reg asahi_bloom;
  reg rasp_green;
  reg jason_emu;
  reg webvan_doc;
  reg boing_gutter;
  reg art_smack;
  reg blue_tracy;
  reg lemon_tapered;
  reg pcp_valve;
  reg aphid_diagon;
  reg snake_often;
  reg madeye_badger;
  reg joey_golden;
  reg bubba_plague;
  reg armand_tesla;
  reg arizona_newt;
  reg rum_partners;
  reg bloom_batman;
  reg waster_minnie;
  reg bear_candle;
  reg sanity_minnie;
  reg sheep_grams;
  reg art_potato;
  reg hinge_vegan;
  reg deng_love_in;
  reg wine_amadeus;
  reg monster_isle;
  reg moe_ihilani;
  reg smack_ohno;
  reg crab_golf;
  reg draco_moulin;
  reg ernie_spyro;
  reg siamese_rojas;
  reg homer_pirate;
  reg whammy_kabar;
  reg remus_bagel;
  reg purple_vegan;
  reg exodus_grumpy;
  reg ibm_rocks;
  reg aspirin_papa;
  reg zi_chowmein;
  reg zi_bloom;
  reg helena_rubik;
  reg bison_gotone;
  reg pork_mine;
  reg fallen_pyro;
  reg cuckoo_cuckoo;
  reg nigiri_donut;
  reg paper_yoku;
  reg zinc_foxtrot;
  reg money_picture;
  reg whale_mexico;
  reg ebay_ihilani;
  reg sleepy_gin;
  reg asahi_too_big;
  reg hulk_feynman;
  reg kilo_india;
  reg klaas_oitcen;
  reg touch_homerun;
  reg sapporo_chuck;
  reg gin_zhuang;
  reg animal_danger;
  reg flew_valve;
  reg romex_pyro;
  reg otter_warlock;
  reg escape_questo;
  reg peta_zinc;
  reg golden_candle;
  reg loud_brian;
  reg wujing_rubik;
  reg protest_goofy;
  reg rerun_marker;
  reg bep_rafting;
  reg cain_floride;
  reg tank_nhtcenso;
  reg donald_dig;
  reg whammy_green;
  reg nail_north;
  reg curie_cheez;
  reg east_boots;
  reg romex_ginger;
  reg hinge_nirish;
  reg pdiddy_tracy;
  reg att_hinge;
  reg ocean_think;
  reg burrito_venus;
  reg ceres_mars;
  reg dweebie_elian;
  reg rodent_ford;
  reg yoku_zed;
  reg wakey_zebra;
  reg bfi_quebec;
  reg england_red;
  reg giraffe_hp;
  reg blue_popcorn;
  reg bull_rufus;
  reg subway_speed;
  reg rose_roe;
  reg rarest_newt;
  reg lion_hotdog;
  reg pizza_tapered;
  reg testyour_duey;
  reg gyro_copper;
  reg pcp_moonraker;
  reg fronds_shuda;
  reg soccer_viagra;
  reg wicked_gonzo;
  reg emu_ebay;
  reg victor_copper;
  reg blessyou_palm;
  reg webvan_thor;
  reg portnoy_lost;
  reg vangoh_lovey;
  reg popacap_goofy;
  reg brian_cuanto;
  reg xray_arcade;
  reg willy_lxtcen;
  reg fsncens_draco;
  reg intuit_nyquil;
  reg pyro_yummy;
  reg wicked_desade;
  reg scotland_over;
  reg century_delta;
  reg naproxen_loud;
  reg rose_narcissa;
  reg erncenso_mine;
  reg hercules_opus;
  reg crack_sortout;
  reg meth_ykocens;
  reg salmon_wood;
  reg life_comrade;
  reg babette_chuck;
  reg sogood_ceres;
  reg often_tylenol;
  reg shark_pork;
  reg quail_shemp;
  reg tortilla_red;
  reg alpha_black;
  reg ebi_bert;
  reg amadeus_stick;
  reg elian_heidi;
  reg whale_elguapo;
  reg moses_dig;
  reg rose_marvin;
  reg drugie_diagon;
  reg pixie_rufus;
  reg century_vegas;
  reg taoist_dipsy;
  reg barty_maryann;
  reg lala_cannon;
  reg naproxen_blue;
  reg pyro_booming;
  reg ebi_madeye;
  reg doc_whoiswho;
  reg siamese_pyro;
  reg drugs_chief;
  reg holland_zeus;
  reg curious_vicks;
  reg condit_bambi;
  reg devotion_mao;
  reg over_athena;
  reg minnow_potter;
  reg grumpy_hotel;
  reg sinew_willem;
  reg golf_pizza;
  reg kebab_books;
  reg dig_molokai;
  reg whatelse_bull;
  reg lala_drugs;
  reg nuclear_jonas;
  reg rocks_lumber;
  reg sheep_octapus;
  reg midas_balloon;
  reg filch_rojas;
  reg husks_minnow;
  reg due_valve;
  reg alpha_zeus;
  reg extremist_due;
  reg sneezy_zulu;
  reg workhere_mao;
  reg castaway_bull;
  reg intel_warlock;
  reg gutter_giants;
  reg shrimp_sogood;
  reg crank_comtrex;
  reg rose_martian;
  reg water_crystal;
  reg money_wiggles;
  reg bloom_larry;
  reg goblin_buddha;
  reg drugs_drunken;
  reg air_goat;
  reg biker_school;
  reg stapler_hulk;
  reg hours_floride;
  reg vadar_yoku;
  reg pcp_tattoo;
  reg golden_boots;
    parameter captain_milo_0 = 0,captain_milo_1 = 1,captain_milo_2 = 2,captain_milo_3 = 3,captain_milo_4 = 4,captain_milo_5 = 5,captain_milo_6 = 6,captain_milo_7 = 7,captain_milo_8 = 8,captain_milo_9 = 9,captain_milo_10 = 10,captain_milo_11 = 11;
    reg [3:0] captain_milo;

  reg bravo_foliage;
  reg onion_egg;
  reg drunken_paper;
  reg loud_bullet;
  reg lupin_bullet;
  reg cow_alpha;
  reg kilo_jxnbox;
  reg rocks_killme;
  reg safeway_egg;
  reg dutch_zebra;
  reg tobe_crystal;
  reg warlock_remus;
  reg gutter_jcrew;
  reg jiminy_draco;
  reg wine_money;
  reg tonks_marquis;
  reg wonton_guy;
  reg spock_cain;
  reg potato_bert;
  reg dragon_zen;
  reg float_severus;
  reg troll_water;
  reg pierre_tasty;
  reg heidi_neville;
  reg timmy_scotch;
  reg heidi_deuce;
  reg stroop_prison;
  reg jinyong_eagle;
  reg moulin_lizard;
  reg kilo_waffle;
  reg newt_bach;
  reg starwars_rum;
  reg spastic_haze;
  reg ulysses_kappa;
  reg curly_frog;
  reg money_nirish;
  reg eel_iceland;
  reg salmon_think;
  reg plaster_isle;
  reg woman_elian;
  reg howell_dopey;
  reg pcp_nyc;
  reg trevor_beavis;
  reg stick_budlite;
  reg mortar_po;
  reg oldnavy_bacon;
  reg zealot_tesla;
  reg advil_gin;
  reg vicks_troll;
  reg usa_lizard;
  reg desade_vegas;
  reg pasta_wukong;
  reg kana_rerun;
  reg cain_wizard;
  reg goblin_drevil;
  reg gonzo_kmfdm;
  reg uppers_bull;
  reg goat_ulysses;
  reg blue_gonzo;
  reg art_curly;
  reg albus_zen;
  reg fang_cuckoo;
  reg minerva_pcp;
  reg rerun_desert;
  reg goblin_bison;
  reg baron_coconut;
  reg genji_att;
  reg often_foryou;
  reg icarus_cow;
  reg venus_madeye;
  reg giants_romex;
  reg cheese_gap;
  reg maki_maryann;
  reg quail_lao;
  reg lala_athena;
  reg jacuzzi_cow;
  reg red_gilligan;
  reg sgates_lupin;
  reg ants_gap;
  reg roid_att;
  reg athena_onion;
  reg ginger_supurb;
  reg star_meffert;
  reg yoku_bono;
  reg red_issac;
  reg legos_cow;
  reg valve_salami;
  reg uppers_att;
  reg lucent_animal;
  reg illegal_vadar;
  reg flew_coffee;
  reg zealot_elian;
  reg lupin_moreand;
  reg bush_isle;
  reg ring_meth;
  reg ants_Iwin;
  reg mickey_hummer;
  reg ceecensor_gap;
  reg peace_solder;
  reg wakey_ham;
  reg centaur_black;
  reg junkie_duck;
  reg gojira_huhhuh;
  reg marvin_hours;
  reg mao_jason;
  reg nobody_east;
  reg floo_voodoo;
  reg foxtrot_gonzo;
  reg drugs_bullet;
  reg rocks_batman;
  reg newt_gin;
  reg shrimp_priest;
  reg opus_geisha;
  reg advil_clay;
  reg louie_fsncens;
  reg gokidsgo_zeus;
  reg kbtoys_danger;
  reg yellow_marco;
  reg troll_coffee;
  reg abel_dingbat;
  reg frog_palm;
  reg moron_ham;
  reg elf_stirfry;
  reg tobe_priest;
  reg lucent_grumpy;
  reg curie_haze;
  reg peta_mickey;
  reg mao_att;
  reg vadar_army;
  reg goblin_snape;
  reg tracy_numbers;
  reg madeye_maki;
  reg ceres_crab;
  reg noah_yellow;
  reg gopher_cheez;
  reg huhhuh_wujing;
  reg stix_comrade;
  reg might_popacap;
  reg juliet_west;
  reg peaves_pilot;
  reg west_beast;
  reg tesla_think;
  reg elf_stroop;
  reg whammy_supurb;
  reg partners_ring;
  reg avon_todd;
  reg xterm_ginger;
  reg broom_meth;
  reg enoch_pork;
  reg smack_mozart;
  reg cuckoo_quail;
  reg zen_potato;
  reg romeo_tin;
  reg pixie_sortout;
  reg holland_romeo;
  reg ocean_green;
  reg nail_scotch;
  reg ford_flew;
  reg metal_drugie;
  reg grams_valve;
  reg oldnavy_rasp;
  reg dutch_ariel;
  reg tobiko_tabby;
  reg life_wine;
  reg stroop_vadar;
  reg brian_deuce;
  reg hinge_kmfdm;
  reg wonton_psycho;
  reg helena_goat;
  reg wiggum_avon;
  reg surfer_knot;
  reg kana_dorkus;
  reg eatem_spanish;
  reg candle_army;
  reg wakey_tesla;
  reg lxtcen_wonton;
  reg sogood_bonker;
  reg speedyg_abel;
  reg popacap_bull;
  reg knockout_dow;
  reg wine_ham;
  reg wood_dragon;
  reg wiggum_wanton;
  reg kabar_floo;
  reg whack_mouse;
  reg drevil_air;
  reg safeway_tonic;
  reg pork_george;
  reg isle_husks;
  reg deng_gregg_a;
  reg moses_bull;
  reg zen_hp;
  reg pirate_sheep;
  reg pcp_bfs;
  reg yummy_wine;
  reg juliet_hummer;
  reg winner_howell;
  reg huey_golfland;
  reg emu_cornell;
  reg ready_star;
  reg yoku_weasley;
  reg icarus_sun;
  reg eel_cuanto;
  reg sun_cassowary;
  reg solder_kbtoys;
  reg devotion_red;
  reg lxtcen_copper;
  reg shuda_togos;
  reg arcade_sogood;
  reg giants_beavis;
  reg ibm_banality;
  reg willem_indigo;
  reg sleepy_boots;
  reg ulysses_legos;
  reg cuanto_float;
  reg guy_rhvcens;
  reg chips_deng;
  reg speeding_fuji;
  reg att_buddha;
  reg knot_foryou;
  reg pizza_salami;
  reg jiminy_ariel;
  reg vegan_guy;
  reg ohno_sixyears;
  reg bolt_dragon;
  reg viagra_red;
  reg nigiri_wonder;
  reg doobie_Iwin;
  reg tasty_meffert;
  reg tango_whiskey;
  reg english_kilo;
  reg candle_pig;
  reg honey_beavis;
  reg lsd_tobiko;
  reg solder_obiwan;
  reg kaisha_jonas;
  reg life_lima;
  reg cain_parrot;
  reg doc_senorduck;
  reg dr_zaius_bep;
  reg supurb_barnum;
  reg shrimp_peta;
  reg pirate_icarus;
  reg south_ham;
  reg shrimp_cubish;
  reg goat_ham;
  reg norbert_eel;
  reg frog_stroop;
  reg south_noah;
  reg rewire_frog;
  reg crack_foxtrot;
  reg cheez_voodoo;
  reg xterm_simasu;
  reg beast_kdqcens;
  reg master_giants;
  reg bart_joey;
  reg guy_powder;
  reg danger_zinc;
  reg peta_cryptic;
  reg jacob_bolt;
  reg jason_numbers;
  reg vampire_gyro;
  reg toysrus_roe;
  reg chiptrip_pig;
  reg bert_life;
  reg tesla_whale;
  reg waffle_hummer;
  reg mouse_tiger;
  reg sneezy_stoned;
  reg solder_tank;
  reg ozzy_southern;
  reg dipsy_ginger;
  reg fuji_condit;
  reg quail_lumber;
  tri atilla_cuanto;
  reg spock_tango;
  reg advil_nobody;
  reg tiger_dorkus;
  reg pegasus_meth;
  reg coffee_fang;
  reg turnip_hinge;
  reg ihilani_army;
  reg cryptic_chief;
  reg salami_ibm;
  reg emu_pixie;
  reg psycho_fang;
  reg blueled_army;
  reg north_roe;
  reg waffle_meth;
  reg genesis_black;
  reg wakey_neon;
  reg popcorn_tuna;
  reg rufus_pdaddy;
  reg pirate_pluto;
  reg metal_willem;
  reg gulp_ready;
  reg hotel_quail;
  reg iceland_advil;
  reg cafe_kang;
  reg honey_huey;
  reg killme_pyro;
  reg moe_nation;
  reg kilo_gutter;
  reg arcade_uppers;
  reg school_cheez;
  reg bert_foiled;
  reg naproxen_dig;
  reg tasty_pdaddy;
  reg lotus_jacuzzi;
  reg tofu_squad;
  reg tinker_pasta;
  reg klaas_touch;
  reg whatelse_odin;
  reg heidi_eeevil;
  reg badger_baron;
  reg school_kmfdm;
  reg richard_thor;
  reg rewire_bison;
  reg greenland_doc;
  reg bison_exodus;
  reg abel_picante;
  reg jiminy_palm;
  reg plaster_echo;
  reg remus_blaster;
  reg draco_waffle;
  reg boing_diagon;
  reg broom_school;
  reg ibm_kidnapper;
  reg yummy_over;
  reg malfoy_jcrew;
  reg master_lao;
  reg lala_davidlin;
  reg floating_todd;
  reg cheese_bull;
  reg iguana_fire;
  reg xray_potter;
  reg knot_rod;
  reg wiggum_doobie;
  reg vicks_raiders;
  reg salmon_armand;
  reg pixie_athena;
  reg master_crab;
  reg spock_south;
  reg moulin_willy;
  reg chicken_louie;
  reg show_fang;
  reg master_sugar;
  reg salmon_todd;
  reg desade_india;
  reg scotch_beast;
  reg guy_neptune;
  reg stroop_coffee;
  reg fufu_jonas;
  reg juliet_hotel;
  reg dog_webvan;
  reg leidiot_rat;
  reg knot_questo;
  reg unicorn_llama;
    parameter hp_elephant_0 = 0,hp_elephant_1 = 1,hp_elephant_2 = 2,hp_elephant_3 = 3,hp_elephant_4 = 4,hp_elephant_5 = 5,hp_elephant_6 = 6,hp_elephant_7 = 7,hp_elephant_8 = 8,hp_elephant_9 = 9,hp_elephant_10 = 10;
    reg [3:0] hp_elephant;

  reg xray_nest;
  reg bull_would;
  reg biker_jesus;
  reg southern_cafe;
  reg dadada_ramone;
  reg minnie_floo;
  reg oscar_peace;
  reg tobe_boitano;
  reg neptune_willy;
  reg muffin_robust;
  reg icarus_pluto;
  reg rerun_hinge;
  reg opus_hp;
  reg saturn_would;
  reg air_minnie;
  reg oranje_bomb;
  reg oranges_draco;
  reg balloon_what;
  reg saturn_bull;
  reg safeway_willy;
  reg todd_green;
  reg kana_helena;
  reg aladdin_roid;
  reg desert_sierra;
  reg delta_yohimbe;
  reg pepsi_foiled;
  reg loser_lad;
  reg geisha_dorkus;
  reg webvan_peta;
  reg dirty_xterm;
  reg huey_comtrex;
  reg vadar_wonder;
  reg donkey_lad;
  reg withme_fang;
  reg tiger_phoenix;
  reg atoms_whacky;
  reg plumber_papa;
  reg devotion_knot;
  reg broom_riddler;
  reg tin_think;
  reg guy_tuna;
  reg davidlin_fuji;
  reg tiger_hurt;
  reg blueled_kilo;
  reg issac_ihilani;
  reg duey_speedyg;
  reg hurt_genesis;
  reg southern_papa;
  reg ariel_century;
  reg grumby_deng;
  reg palmer_mrbill;
  reg oscar_comrade;
  reg piggish_might;
  reg dorkus_sand;
  reg robust_xterm;
  reg zhuang_goat;
    parameter nation_soccer_0 = 0,nation_soccer_1 = 1,nation_soccer_2 = 2,nation_soccer_3 = 3,nation_soccer_4 = 4,nation_soccer_5 = 5,nation_soccer_6 = 6,nation_soccer_7 = 7,nation_soccer_8 = 8,nation_soccer_9 = 9;
    reg [3:0] nation_soccer;

  reg hinge_sears;
  reg joker_lucius;
  reg athena_sierra;
  reg wujing_golf;
  reg alpha_badger;
  reg the_pope_palm;
  reg iceland_moses;
  reg withme_yummy;
  reg sinus_goofy;
  reg pluto_sgates;
  reg drdeath_chuck;
  reg pluto_quebec;
  reg indigo_hurt;
  reg juliet_doobie;
  reg acid_wheezer;
  reg larry_hagrid;
  reg popcorn_air;
  reg odin_brothers;
  reg deuce_crack;
    parameter gulp_sapporo_0 = 0,gulp_sapporo_1 = 1,gulp_sapporo_2 = 2,gulp_sapporo_3 = 3,gulp_sapporo_4 = 4,gulp_sapporo_5 = 5,gulp_sapporo_6 = 6,gulp_sapporo_7 = 7,gulp_sapporo_8 = 8,gulp_sapporo_9 = 9,gulp_sapporo_10 = 10;
    reg [3:0] gulp_sapporo;

  reg devotion_ants;
  reg haze_children;
  reg cuckoo_haze;
  reg touch_gm;
  reg moron_ramone;
  reg neon_sortout;
  reg dragon_bonker;
  reg dopey_bacon;
  reg gm_grams;
  reg wiggum_curie;
  reg moulin_deuce;
  reg bfs_monster;
  reg cheese_sheep;
  reg sinew_gonzo;
  reg beef_crank;
  reg dadada_eel;
  reg kangaroo_bolt;
  reg rubik_centaur;
  reg usa_chillis;
  reg yak_stemcell;
  reg fallen_ohno;
  reg parrot_tinker;
  reg heidi_might;
  reg gerrit_remus;
  reg cuckoo_clay;
  reg juliet_rod;
  reg lxtcen_alpha;
  reg monster_golf;
  reg holland_honda;
  reg deng_questo;
  reg chicken_nail;
  reg midas_thankee;
  reg alpha_clay;
  reg honda_kang;
  reg stick_foryou;
  reg yummy_newt;
  reg freaky_condit;
  reg donut_zhuang;
  reg xray_junkie;
  reg hippo_buddha;
  reg sand_ready;
  reg bull_onion;
  reg rum_waster;
  reg rojas_tango;
  reg spain_stick;
    parameter usa_stoner_0 = 0,usa_stoner_1 = 1,usa_stoner_2 = 2,usa_stoner_3 = 3;
    reg [3:0] usa_stoner;

  reg fsncens_spyro;
  reg weevil_papa;
  reg spyro_kmfdm;
  reg squad_genji;
  reg elephant_mine;
  reg art_anarchist;
  reg carolina_acid;
  reg lucent_cain;
  reg larry_shuda;
  reg bep_chairman;
  reg tobe_roid;
  reg usa_huey;
  reg palm_wukong;
  reg ring_abel;
  reg questo_rojas;
  reg moron_palmer;
  reg intel_aspirin;
  reg kungfu_sheep;
  reg beemer_xterm;
  reg speed_coffee;
  reg lucius_iguana;
  reg stix_animal;
  reg rerun_wujing;
  reg bamboo_yellow;
  reg sierra_pdiddy;
  reg taoist_klaas;
  reg maki_joseph;
  reg gin_gulp;
  reg knot_yellow;
  reg webvan_pasta;
  reg potato_larry;
  reg att_leviticus;
  reg foryou_jxnbox;
  reg richard_moe;
  reg smack_wonder;
  reg sake_rerun;
  reg elguapo_yoda;
  reg mine_brothers;
  reg onion_peta;
  reg dork_knot;
  reg knot_muffin;
  reg ebay_ohisee;
  reg ariel_callme;
  reg blessyou_dow;
  reg beef_hawaii;
  reg bush_zhuang;
  reg fury_bloom;
  reg rerun_filch;
  reg whoiswho_pig;
  reg tonks_uniform;
  reg pomodoro_hulk;
  reg donkey_pig;
  reg kebab_sake;
  reg witch_joseph;
  reg unicorn_alpha;
  reg sogood_india;
  reg pierre_taoist;
  reg sogood_junkie;
  reg happy_legos;
  reg solder_haze;
  reg eagle_red;
  reg questo_show;
  reg krabapple_emu;
  reg fufu_ulysses;
  reg iron_zebra;
  reg scotland_bush;
  reg fascist_donut;
  reg gm_jacuzzi;
  reg nation_rod;
  reg bullet_wonton;
  reg troll_hans;
  reg crab_hp;
  reg yoku_ebi;
  reg beef_bismuth;
  reg hanger_cheese;
  reg faster_snort;
  reg minnow_sand;
  reg lagoon_dork;
  reg george_bullet;
  reg ants_cuckoo;
  reg stoned_pasta;
  reg marquis_bolt;
  reg burnout_tuna;
  reg danger_jxnbox;
  reg touch_legos;
  reg sun_eatem;
  reg oscar_famulan;
  reg burning_bono;
  reg ebay_speeding;
  reg biker_thor;
  reg isle_foliage;
  reg bono_minerva;
  reg pixie_asahi;
  reg testyour_duck;
  reg prison_moron;
  reg ohno_grams;
  reg kana_tapered;
  reg satanist_zed;
  reg milo_deng;
  reg jacques_tank;
  reg bcdcensor_dig;
  reg intel_itchy;
  reg clay_cuckoo;
  reg huey_drevil;
  reg troll_hut;
  reg speedyg_sand;
  reg show_peace;
  reg safeway_kappa;
  reg chief_tobe;
  reg obiwan_monkey;
  reg martin_emu;
  reg jonas_nigiri;
  reg moses_marge;
  reg pacbell_curie;
  reg meth_burner;
  reg gap_foiled;
  reg madeye_rescue;
  reg moreand_enoch;
  reg plague_buddha;
  reg jcrew_eel;
  reg oscar_illegal;
  reg romex_india;
  reg picture_att;
  reg tobe_vampire;
  reg sake_blue;
  reg sun_jacuzzi;
  reg ariel_giants;
  reg crank_juliet;
  reg beef_rufus;
  reg rod_maryann;
  reg bull_pacific;
  reg bep_vulture;
  reg peace_october;
  reg salami_howell;
  reg faster_bacon;
  reg arizona_pizza;
  reg jxnbox_bacon;
  reg crack_arthur;
  reg pepsi_nihlist;
  reg jacob_chillis;
  reg ring_tapered;
  reg cocaine_bfs;
  reg norbert_ring;
  reg lupin_duck;
  reg rouge_bubba;
  reg rojas_luthor;
  reg stirfry_bono;
  reg intel_lumber;
  reg cow_cow;
  reg helena_ladder;
  reg thread_filch;
  reg drugs_boots;
  reg sears_jxnbox;
  reg enoch_hans;
  reg pictures_sun;
  reg kungfu_lucent;
  reg maryann_rocks;
  reg agitator_wine;
  reg fortuyn_deng;
  reg midas_diagon;
  reg ham_heidi;
  reg macys_lion;
  reg moe_brian;
  reg fufu_atomic;
  reg eel_huey;
  tri tako_marco;
  reg feynman_xray;
  reg minnie_beavis;
  reg comrade_sand;
  reg vegan_possum;
  reg hanger_tango;
  reg jxnbox_hp;
  reg bacon_kanji;
  reg wheezer_boots;
  reg rod_rewire;
  reg porfavor_fury;
  reg doc_leidiot;
  reg salsa_otter;
  reg hotdog_enoch;
  reg maki_ring;
  reg love_in_fish;
  reg donut_hoser;
  reg malfoy_float;
  reg fufu_ebay;
  reg tobe_goofy;
  reg bravo_gopher;
  reg roid_handroll;
  reg weasley_goat;
  reg hummer_wiggum;
  reg sanity_foiled;
  reg po_kidnapper;
  reg dirk_whiskey;
  reg monkey_solder;
  reg iguana_east;
  reg haze_plumber;
  reg raiders_ariel;
  reg ulysses_zulu;
  reg duck_itchy;
  reg noah_dingbat;
  reg zeus_protest;
  reg oranges_broom;
  reg sinus_ernie;
  reg sheep_chief;
  reg moulin_ceres;
  reg zulu_lumber;
  reg mao_kbtoys;
  reg donkey_ford;
  reg stick_cheez;
  reg danger_beemer;
  reg wrecker_otter;
  reg maklak_enoch;
  reg fish_beast;
  reg frog_klinton;
  reg hoser_husks;
  reg hp_drugs;
  reg nyquil_husks;
  reg foiled_hawaii;
  reg nirish_pirate;
  reg ocha_sneezy;
  reg rouge_dutch;
  reg hours_huhhuh;
  reg banshee_pasta;
  reg eggsalad_bolt;
  reg snape_subway;
  reg floo_nasdaq;
  reg iterate_rod;
  reg draco_ladder;
  reg honey_palm;
  reg donkey_gin;
  reg elf_chicken;
  reg onthepc_meth;
  reg escape_gap;
  reg eel_speedyg;
  reg cuckoo_stix;
  reg surprise_yoda;
  reg fire_papyrus;
  reg tobe_sierra;
  reg lantern_pizza;
  reg sun_badmonkey;
  reg india_rarest;
  reg honey_jacques;
  reg tabasco_eel;
  reg shuda_pixie;
  reg gilligan_kana;
  reg steaming_eel;
  reg speeding_bfi;
  reg kmfdm_shuda;
  reg oranges_ebi;
  reg lsd_potato;
  reg kappa_speedyg;
  reg zedong_tesla;
  reg nail_curly;
  reg xray_criminal;
  reg drugie_otter;
  reg bashful_curie;
  reg psycho_beavis;
  reg odin_stix;
  reg drevil_square;
  reg chillis_frog;
  reg nihlist_bart;
  reg wukong_po;
  reg goofy_kanji;
  reg pdiddy_eel;
  reg Iwin_heidi;
  reg guy_portnoy;
  reg fallen_whammy;
  reg peace_beemer;
  reg lucent_nigiri;
  reg ihilani_togos;
  reg dopey_boots;
  reg blue_llama;
  reg hut_milo;
  reg waffle_shark;
  reg gerard_indigo;
  reg chips_jjocen;
  reg willy_chevys;
  reg iron_biker;
  reg waffle_pizza;
  reg bloom_onthepc;
  reg papa_pyro;
  reg dog_dig;
  reg isle_clothing;
  reg graduated_red;
  reg barnum_mars;
  reg octapus_golf;
  reg Iwin_wiggum;
  reg pluto_ariel;
  reg iron_monkey;
  reg iron_goblin;
  reg isle_smithers;
  reg zhuang_egg;
  reg troll_bismuth;
  reg hurt_hinge;
  reg cain_ford;
  reg att_bathroom;
  reg onion_fury;
  reg barty_burnout;
  reg jason_rerun;
  reg atilla_bonker;
  reg thor_geisha;
  reg ibm_ceres;
  reg loser_leaky;
  reg palm_gopher;
  reg duck_speed;
  reg what_goblin;
  reg curie_moody;
  reg lotus_potter;
  reg larry_hut;
  reg broom_jacob;
  reg shrimp_albus;
  reg scabbers_guy;
  reg jcrew_oracle;
  reg pepsi_papa;
  reg sapporo_fang;
  reg wine_due;
  reg golden_arthur;
  reg surfer_mexico;
  reg dipsy_mine;
  reg drax_maryann;
  reg beauty_heidi;
  reg wicked_onion;
  reg subway_lost;
  reg biker_pirate;
  reg fallen_plague;
  reg wanton_rocks;
  reg hours_captain;
  reg foryou_killme;
  reg zebra_south;
  reg haze_venus;
  reg peta_yellow;
  reg bust_north;
  reg neon_ozzy;
  reg troll_hummer;
  reg tabasco_husks;
  reg jiminy_goblin;
  reg firewalk_tako;
  reg fuji_nihlist;
  reg barty_loser;
  reg marquis_sinew;
  reg pacbell_abel;
  reg kedavra_albus;
  reg downers_cafe;
  reg rhvcens_shark;
  reg ants_asahi;
  reg knot_yankee;
  reg bear_erncenso;
  reg papa_scotch;
  reg whale_oldnavy;
  reg wildboar_west;
  reg questo_blue;
  reg tobe_cubish;
  reg tesla_cafe;
  reg llama_molokai;
  reg marker_yankee;
  reg luthor_vadar;
  reg siamese_honda;
  reg rasp_joey;
  reg drugs_otter;
  reg bono_knockout;
  reg ants_fitter;
  reg genji_stix;
  reg penguin_cafe;
  reg blue_kappa;
  reg nyquil_broom;
  reg spock_egg;
  reg hotel_faster;
  reg zedong_romeo;
  reg pilot_china;
  reg monkey_crab;
  reg woman_giraffe;
  reg zebra_dimetap;
  reg blue_floo;
  reg zulu_barty;
  reg joey_wonder;
  reg lima_famulan;
  reg dork_tukatuk;
  reg tin_atchoo;
  reg newt_sgates;
  reg dimetap_enoch;
  reg richard_lion;
  reg kebab_subway;
  reg ohno_bomb_pop;
  reg salsa_norris;
  reg mine_nest;
  reg speed_brian;
  reg pdiddy_hawaii;
  reg helena_sleepy;
  reg hours_zealot;
  reg obiwan_foryou;
  reg wrecker_beef;
  reg newt_yankee;
  reg troll_stirfry;
  reg art_squad;
  reg whatelse_lima;
  reg bacon_chuck;
  reg bfs_romeo;
  reg asahi_potter;
  reg pig_rainbow;
  reg neptune_ceres;
  reg moses_pork;
  reg ritsu_orange;
  reg moron_indigo;
  reg kdqcens_ring;
  reg fury_bismuth;
  reg witch_animal;
  reg fear_homer;
  reg tattoo_cubish;
  reg square_bison;
  reg china_ramone;
  reg donut_vadar;
  reg moe_eggsalad;
  reg lemon_nasdaq;
  reg beast_golden;
  reg crab_kbtoys;


// State Mek alpha Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      alpha <= alpha_0;
    else
      case (alpha)
        alpha_0: begin
          if ({bravo,gnd,charlie,delta} == 15)
            alpha <= alpha_2;
          else if ({bravo,gnd,charlie,delta} == 8)
            alpha <= alpha_4;
          else
            alpha <= alpha_0;
          end
        alpha_1: begin
          if ({bravo,gnd,charlie,delta} == 14)
            alpha <= alpha_2;
          else if ({bravo,gnd,charlie,delta} == 5)
            alpha <= alpha_0;
          else
            alpha <= alpha_1;
          end
        alpha_2: begin
          if ({bravo,gnd,charlie,delta} == 6)
            alpha <= alpha_5;
          else if ({bravo,gnd,charlie,delta} == 15)
            alpha <= alpha_3;
          else if ({bravo,gnd,charlie,delta} == 11)
            alpha <= alpha_4;
          else if ({bravo,gnd,charlie,delta} == 10)
            alpha <= alpha_3;
          else if ({bravo,gnd,charlie,delta} == 2)
            alpha <= alpha_4;
          else
            alpha <= alpha_2;
          end
        alpha_3: begin
          if ({bravo,gnd,charlie,delta} == 15)
            alpha <= alpha_1;
          else if ({bravo,gnd,charlie,delta} == 2)
            alpha <= alpha_2;
          else if ({bravo,gnd,charlie,delta} == 9)
            alpha <= alpha_6;
          else if ({bravo,gnd,charlie,delta} == 13)
            alpha <= alpha_3;
          else
            alpha <= alpha_3;
          end
        alpha_4: begin
          if ({bravo,gnd,charlie,delta} == 12)
            alpha <= alpha_4;
          else if ({bravo,gnd,charlie,delta} == 6)
            alpha <= alpha_1;
          else if ({bravo,gnd,charlie,delta} == 8)
            alpha <= alpha_5;
          else
            alpha <= alpha_4;
          end
        alpha_5: begin
          if ({bravo,gnd,charlie,delta} == 9)
            alpha <= alpha_7;
          else if ({bravo,gnd,charlie,delta} == 0)
            alpha <= alpha_7;
          else
            alpha <= alpha_5;
          end
        alpha_6: begin
          if ({bravo,gnd,charlie,delta} == 0)
            alpha <= alpha_5;
          else if ({bravo,gnd,charlie,delta} == 6)
            alpha <= alpha_7;
          else
            alpha <= alpha_6;
          end
        alpha_7: begin
          if ({bravo,gnd,charlie,delta} == 15)
            alpha <= alpha_4;
          else
            alpha <= alpha_7;
          end
        default: alpha <= alpha_0;
      endcase
  end

// State Mek alpha Output logic
always @(alpha)
  begin
    // consider all state regs when doing outputs
    case (alpha)
        alpha_0: begin
            echo = 1;
            foxtrot = 1;
            golf = 0;
            hotel = 1;
            india = 1;
            juliet = 0;
            kilo = 0;
            lima = 0;
            mike = 1;
            november = 1;
          end
        alpha_1: begin
            echo = 0;
            foxtrot = 1;
            golf = 1;
            hotel = 1;
            india = 0;
            juliet = 0;
            kilo = 0;
            lima = 1;
            mike = 1;
            november = 1;
          end
        alpha_2: begin
            echo = 0;
            foxtrot = 0;
            golf = 1;
            hotel = 0;
            india = 0;
            juliet = 1;
            kilo = 0;
            lima = 1;
            mike = 1;
            november = 1;
          end
        alpha_3: begin
            echo = 0;
            foxtrot = 0;
            golf = 1;
            hotel = 0;
            india = 0;
            juliet = 0;
            kilo = 1;
            lima = 1;
            mike = 1;
            november = 0;
          end
        alpha_4: begin
            echo = 0;
            foxtrot = 0;
            golf = 0;
            hotel = 1;
            india = 0;
            juliet = 1;
            kilo = 1;
            lima = 0;
            mike = 1;
            november = 1;
          end
        alpha_5: begin
            echo = 1;
            foxtrot = 0;
            golf = 1;
            hotel = 1;
            india = 0;
            juliet = 1;
            kilo = 0;
            lima = 1;
            mike = 1;
            november = 0;
          end
        alpha_6: begin
            echo = 1;
            foxtrot = 1;
            golf = 0;
            hotel = 0;
            india = 0;
            juliet = 1;
            kilo = 0;
            lima = 1;
            mike = 0;
            november = 1;
          end
        alpha_7: begin
            echo = 0;
            foxtrot = 0;
            golf = 1;
            hotel = 1;
            india = 0;
            juliet = 1;
            kilo = 0;
            lima = 0;
            mike = 1;
            november = 0;
          end
        default: begin
            echo = 1;
            foxtrot = 1;
            golf = 0;
            hotel = 1;
            india = 1;
            juliet = 0;
            kilo = 1;
            lima = 0;
            mike = 0;
            november = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire sierra_out;
nut_004_lut #(5) nut_004_lut_inst_sierra (
  .din({vcc,oscar,papa,quebec,gnd}),
  .mask(32'b00000010001000000100001100000011),
  .out(sierra_out)
);

always @(sierra_out)
begin
   romeo = sierra_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire victor_out;
nut_004_lut #(4) nut_004_lut_inst_victor (
  .din({vcc,gnd,tango,gnd}),
  .mask(16'b0000011011000000),
  .out(victor_out)
);

always @(victor_out)
begin
   uniform = victor_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire xray_out;
nut_004_lut #(1) nut_004_lut_inst_xray (
  .din({lima}),
  .mask(2'b00),
  .out(xray_out)
);

always @(xray_out)
begin
   whiskey = xray_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire adbcensor_out;
nut_004_lut #(5) nut_004_lut_inst_adbcensor (
  .din({echo,yankee,gnd,zulu,bomb_pop}),
  .mask(32'b01001000010000101111000000100000),
  .out(adbcensor_out)
);

always @(adbcensor_out)
begin
   for_gregg = adbcensor_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire rubik_out;
nut_004_lut #(3) nut_004_lut_inst_rubik (
  .din({kilo,gojira,richard}),
  .mask(8'b00000100),
  .out(rubik_out)
);

always @(rubik_out)
begin
   yeanyow = rubik_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire hanger_out;
nut_004_lut #(3) nut_004_lut_inst_hanger (
  .din({for_gregg,vcc,cybex}),
  .mask(8'b00100001),
  .out(hanger_out)
);

always @(hanger_out)
begin
   babette = hanger_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire nail_out;
nut_004_lut #(2) nut_004_lut_inst_nail (
  .din({november,golf}),
  .mask(4'hc),
  .out(nail_out)
);

always @(nail_out)
begin
   hinge = nail_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire lumber_out;
nut_004_lut #(3) nut_004_lut_inst_lumber (
  .din({gnd,gnd,hotel}),
  .mask(8'h3e),
  .out(lumber_out)
);

always @(lumber_out)
begin
   bolt = lumber_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire mortar_out;
nut_004_lut #(2) nut_004_lut_inst_mortar (
  .din({hinge,bolt}),
  .mask(4'hd),
  .out(mortar_out)
);

always @(mortar_out)
begin
   launcher = mortar_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire cannon_out;
nut_004_lut #(4) nut_004_lut_inst_cannon (
  .din({gnd,gnd,india,babette}),
  .mask(16'h9644),
  .out(cannon_out)
);

always @(cannon_out)
begin
   tank = cannon_out;
end

// Ternary sign extend bait
always @(mine or mine or mine or mine or mine or mine or mine or mine or marker or vcc or red or gnd or
         bullet or bullet or bullet or bullet or bullet or bullet or bullet or gnd or vcc or vcc or blue or green or
         vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or aphid)
  begin
    {badger,bear,beetle,bison,bull,cassowary,cat,chicken,cow,dog,donkey,dragon} = 
        {mine,mine,mine,mine,mine,mine,mine,mine,marker,vcc,red,gnd} +
        {bullet,bullet,bullet,bullet,bullet,bullet,bullet,gnd,vcc,vcc,blue,green} +
        {vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,aphid};
  end

// Greater Equal Less compare
always @(vcc or duck or vcc or eagle or eel or elephant or gnd or emu or fish or frog or goat or hippo or iguana or gnd or jellyfish or vcc)
  begin
    if ({vcc,duck,vcc,eagle,eel,elephant,gnd,emu} > {fish,frog,goat,hippo,iguana,gnd,jellyfish,vcc})
       {kangaroo,lion,lizard} = 3'b100;
    else if ({vcc,duck,vcc,eagle,eel,elephant,gnd,emu} < {fish,frog,goat,hippo,iguana,gnd,jellyfish,vcc})
       {kangaroo,lion,lizard} = 3'b010;
    else
       {kangaroo,lion,lizard} = 3'b001;
  end

// 78 bit shift register
reg [77:0] llama;

initial begin
    llama = 0;
end

always @(posedge clock0)
begin
    llama <= (llama << 1) | monkey;
end

// shift taps every 3 bits
always @(llama)
begin
    mouse = llama[77];
    newt = llama[74];
    ostrich = llama[71];
    otter = llama[68];
    penguin = llama[65];
    pig = llama[62];
    platypus = llama[59];
    possum = llama[56];
    quail = llama[53];
    rat = llama[50];
    sheep = llama[47];
    tiger = llama[44];
    turtle = llama[41];
    unicorn = llama[38];
    vulture = llama[35];
    whale = llama[32];
    wolverine = llama[29];
    woodpecker = llama[26];
    xuprocar = llama[23];
    yak = llama[20];
    zebra = llama[17];
    shuda = llama[14];
    maklak = llama[11];
    bcdcensor = llama[8];
    safada = llama[5];
    ceecensor = llama[2];
end

always @(platypus)
  begin
      dfecensorc = !platypus;
  end

always @(yak)
  begin
      saturn = !yak;
  end

always @(dragon)
  begin
      neon = !dragon;
  end

always @(whiskey)
  begin
      loser = !whiskey;
  end

always @(safada)
  begin
      turnip = !safada;
  end

always @(gnd)
  begin
      potato = !gnd;
  end

always @(hinge)
  begin
      nuclear = !hinge;
  end

always @(vcc)
  begin
      insurance = !vcc;
  end

always @(uniform)
  begin
      bathroom = !uniform;
  end

always @(gnd)
  begin
      popcorn = !gnd;
  end

always @(turnip)
  begin
      jimmyjames = !turnip;
  end

always @(vcc)
  begin
      dr_zaius = !vcc;
  end

always @(penguin)
  begin
      amadeus = !penguin;
  end

always @(tiger)
  begin
      whack = !tiger;
  end

always @(gnd)
  begin
      jason = !gnd;
  end

reg feedback_pt_0;

always @(jimmyjames or feedback_pt_0)
  begin
      funkadelic = !jimmyjames | !feedback_pt_0;
  end

reg feedback_pt_1;

always @(bathroom or feedback_pt_1)
  begin
      books = !bathroom ^  feedback_pt_1;
  end

reg feedback_pt_2;

always @(gnd or feedback_pt_2)
  begin
      cluckU =  gnd ^ !feedback_pt_2;
  end

reg feedback_pt_3;

always @(bison or feedback_pt_3)
  begin
      togos = !bison ^ !feedback_pt_3;
  end

reg feedback_pt_4;

always @(xuprocar or feedback_pt_4)
  begin
      chiptrip = !xuprocar &  feedback_pt_4;
  end

reg feedback_pt_5;

always @(foxtrot or feedback_pt_5)
  begin
      what =  foxtrot ^ !feedback_pt_5;
  end

reg feedback_pt_6;

always @(ostrich or feedback_pt_6)
  begin
      would = !ostrich ^ !feedback_pt_6;
  end

reg feedback_pt_7;

always @(zebra or feedback_pt_7)
  begin
      brian = !zebra ^ !feedback_pt_7;
  end

reg feedback_pt_8;

always @(bcdcensor or feedback_pt_8)
  begin
      boitano = !bcdcensor ^ !feedback_pt_8;
  end

reg feedback_pt_9;

always @(juliet or feedback_pt_9)
  begin
      due = !juliet & !feedback_pt_9;
  end

reg feedback_pt_10;

always @(possum or feedback_pt_10)
  begin
      genesis =  possum ^ !feedback_pt_10;
  end

reg feedback_pt_11;

always @(vcc or feedback_pt_11)
  begin
      deuteronomy = !vcc &  feedback_pt_11;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_m149.v
///////////////////////////////////////////

wire [0:0] leviticus_dout;
wire [1:0] leviticus_din;
assign leviticus_din[1:0] = {boitano,bull};

nut_004_m149 nut_004_m149_inst_leviticus (
  .ins(leviticus_din),
  .clock(clock0),
  .reset(reset0),
  .outs(leviticus_dout)
);

always @(leviticus_dout)
begin
  {xterm} = leviticus_dout[0:0];
end

wire noah_outwire;
cascade numbers (mouse,noah_outwire);

always @(noah_outwire)
begin
  noah = noah_outwire;
end

wire english_outwire;
exp bagel (vcc,english_outwire);

always @(english_outwire)
begin
  english = english_outwire;
end

wire ceres_outwire, moulin_outwire;
carry_sum muffin (.sin(gnd),.cin(gnd),.sout(ceres_outwire),.cout(moulin_outwire));

always @(ceres_outwire or moulin_outwire)
begin
  ceres = ceres_outwire;
  moulin = moulin_outwire;
end

reg feedback_pt_12;

always @(vcc or feedback_pt_12)
  begin
      rouge = !vcc ^  feedback_pt_12;
  end

reg feedback_pt_13;

always @(cat or feedback_pt_13)
  begin
      cellphone = !cat | !feedback_pt_13;
  end

reg feedback_pt_14;

always @(romeo or feedback_pt_14)
  begin
      mortgate = !romeo &  feedback_pt_14;
  end

reg feedback_pt_15;

always @(vcc or feedback_pt_15)
  begin
      stapler =  vcc & !feedback_pt_15;
  end

reg feedback_pt_16;

always @(vcc or feedback_pt_16)
  begin
      holepunch = !vcc | !feedback_pt_16;
  end

reg feedback_pt_17;

always @(badger or feedback_pt_17)
  begin
      metal = !badger | !feedback_pt_17;
  end

reg feedback_pt_18;

always @(potato or feedback_pt_18)
  begin
      dork =  potato | !feedback_pt_18;
  end

reg feedback_pt_19;

always @(gnd or feedback_pt_19)
  begin
      autotest =  gnd | !feedback_pt_19;
  end

reg feedback_pt_20;

always @(gnd or feedback_pt_20)
  begin
      picture =  gnd &  feedback_pt_20;
  end

reg feedback_pt_21;

always @(chicken or feedback_pt_21)
  begin
      sleepy = !chicken ^ !feedback_pt_21;
  end

reg feedback_pt_22;

always @(metal or feedback_pt_22)
  begin
      dopey = !metal & !feedback_pt_22;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sneezy <= 1;
    else
      sneezy <= vcc;
  end

always @(sneezy)
  begin
      feedback_pt_0 = sneezy;
  end

always @(sneezy)
  begin
      feedback_pt_1 = sneezy;
  end

always @(sneezy)
  begin
      feedback_pt_2 = sneezy;
  end

always @(sneezy)
  begin
      feedback_pt_3 = sneezy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      happy <= 1;
    else
      happy <= kangaroo;
  end

always @(happy)
  begin
      feedback_pt_4 = happy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      grumpy <= 0;
    else if (stapler)
      grumpy <= gnd;
    else if (books)
      grumpy <= 0;
  end

always @(grumpy)
  begin
      feedback_pt_5 = grumpy;
  end

always @(grumpy)
  begin
      feedback_pt_6 = grumpy;
  end

always @(grumpy)
  begin
      feedback_pt_7 = grumpy;
  end

always @(grumpy)
  begin
      feedback_pt_8 = grumpy;
  end

always @(grumpy)
  begin
      feedback_pt_9 = grumpy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bashful <= 0;
    else if (lion)
      bashful <= gnd;
  end

always @(bashful)
  begin
      feedback_pt_10 = bashful;
  end

wire doc_wire;

dffeas doc_ff (
  .clk(clock0),
  .d(vulture),
  .ena(dopey),
  .sclr(cow),
  .sload(vcc),
  .asdata(vcc),
  .clrn(!reset0),
  .q(doc_wire)
);

always @(doc_wire) begin
   donald = doc_wire;
end

always @(donald)
  begin
      feedback_pt_11 = donald;
  end

always @(donald)
  begin
      feedback_pt_12 = donald;
  end

always @(donald)
  begin
      feedback_pt_13 = donald;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mickey <= 0;
    else
      mickey <= launcher;
  end

always @(mickey)
  begin
      feedback_pt_14 = mickey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      minnie <= 0;
    else if (gnd)
      minnie <= 0;
    else if (autotest)
      minnie <= gnd;
  end

always @(minnie)
  begin
      feedback_pt_15 = minnie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spock <= 0;
    else if (tank)
      spock <= 0;
    else if (gnd)
      spock <= gnd;
  end

always @(spock)
  begin
      feedback_pt_16 = spock;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goofy <= 0;
    else if (chiptrip)
      goofy <= vcc;
  end

always @(goofy)
  begin
      feedback_pt_17 = goofy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gyro <= 0;
    else if (what)
      gyro <= whale;
    else if (ostrich)
      gyro <= 0;
  end

always @(gyro)
  begin
      feedback_pt_18 = gyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scrooge <= 0;
    else if (vulture)
      scrooge <= dork;
  end

always @(scrooge)
  begin
      feedback_pt_19 = scrooge;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      huey <= 0;
    else if (vcc)
      huey <= amadeus;
    else if (moulin)
      huey <= 0;
  end

always @(huey)
  begin
      feedback_pt_20 = huey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      duey <= 0;
    else if (dr_zaius)
      duey <= 0;
    else if (ceres)
      duey <= amadeus;
  end

always @(duey)
  begin
      feedback_pt_21 = duey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      louie <= 0;
    else if (gnd)
      louie <= newt;
    else if (lizard)
      louie <= 0;
  end

always @(louie)
  begin
      feedback_pt_22 = louie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jiminy <= 0;
    else if (vcc)
      jiminy <= 0;
    else if (spock)
      jiminy <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cinderella <= 1;
    else
      cinderella <= togos;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sleeping <= 1;
    else
      sleeping <= mortgate;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beauty <= 0;
    else
      beauty <= happy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      superman <= 0;
    else if (vcc)
      superman <= mortgate;
    else if (beetle)
      superman <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      batman <= 0;
    else
      batman <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wonder <= 0;
    else if (vcc)
      wonder <= sleepy;
  end

reg feedback_pt_23;

always @(huey or feedback_pt_23)
  begin
      woman =  huey |  feedback_pt_23;
  end

reg feedback_pt_24;

always @(november or feedback_pt_24)
  begin
      hulk =  november |  feedback_pt_24;
  end

reg feedback_pt_25;

always @(picture or feedback_pt_25)
  begin
      lantern =  picture | !feedback_pt_25;
  end

reg feedback_pt_26;

always @(juliet or feedback_pt_26)
  begin
      riddler =  juliet ^ !feedback_pt_26;
  end

reg feedback_pt_27;

always @(possum or feedback_pt_27)
  begin
      joker =  possum | !feedback_pt_27;
  end

reg feedback_pt_28;

always @(whack or feedback_pt_28)
  begin
      luthor = !whack ^  feedback_pt_28;
  end

reg feedback_pt_29;

always @(ceecensor or feedback_pt_29)
  begin
      hercules = !ceecensor | !feedback_pt_29;
  end

reg feedback_pt_30;

always @(moulin or feedback_pt_30)
  begin
      ajax =  moulin | !feedback_pt_30;
  end

reg feedback_pt_31;

always @(cinderella or feedback_pt_31)
  begin
      achilles =  cinderella & !feedback_pt_31;
  end

reg feedback_pt_32;

always @(sleepy or feedback_pt_32)
  begin
      hector = !sleepy &  feedback_pt_32;
  end

reg feedback_pt_33;

always @(gnd or feedback_pt_33)
  begin
      ulysses = !gnd | !feedback_pt_33;
  end

reg feedback_pt_34;

always @(funkadelic or feedback_pt_34)
  begin
      agamemnon = !funkadelic &  feedback_pt_34;
  end

reg feedback_pt_35;

always @(bashful or feedback_pt_35)
  begin
      aladdin =  bashful &  feedback_pt_35;
  end

reg feedback_pt_36;

always @(english or feedback_pt_36)
  begin
      bambi = !english ^  feedback_pt_36;
  end

reg feedback_pt_37;

always @(spock or feedback_pt_37)
  begin
      pocahontas = !spock & !feedback_pt_37;
  end

///////////////////////////////////////////
// Verilog ROM subdesign in nut_004_rom_jesus.v
///////////////////////////////////////////

wire [1-1:0] dali_llama_out;
nut_004_rom_jesus dali_llama (
  .clock(clock0),
  .read_addr({vcc,cassowary,gnd,woodpecker,amadeus,noah,maklak,scrooge,joker,gnd,gnd,gnd}),
  .q(dali_llama_out)
);

//defparam dali_llama.MIF_NAME="nut_004_jesus.mif";
defparam dali_llama.DATA_WIDTH=1;
defparam dali_llama.ADDR_WIDTH=12;

always @(dali_llama_out)
begin
   {buddha} = dali_llama_out;
end

// Random combinatorial logic block
always@(*)
  begin
      clinton = ( ~( ~( gnd ) ) ^ ~( donald ) );
  end

// State Mek bush Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bush <= bush_0;
    else
      case (bush)
        bush_0: begin
          if ({platypus,rat,minnie,penguin} == 5)
            bush <= bush_3;
          else if ({platypus,rat,minnie,penguin} == 12)
            bush <= bush_2;
          else if ({platypus,rat,minnie,penguin} == 0)
            bush <= bush_3;
          else
            bush <= bush_0;
          end
        bush_1: begin
          if ({platypus,rat,minnie,penguin} == 6)
            bush <= bush_1;
          else if ({platypus,rat,minnie,penguin} == 5)
            bush <= bush_0;
          else
            bush <= bush_1;
          end
        bush_2: begin
          if ({platypus,rat,minnie,penguin} == 11)
            bush <= bush_1;
          else if ({platypus,rat,minnie,penguin} == 14)
            bush <= bush_2;
          else
            bush <= bush_2;
          end
        bush_3: begin
          if ({platypus,rat,minnie,penguin} == 0)
            bush <= bush_3;
          else if ({platypus,rat,minnie,penguin} == 9)
            bush <= bush_3;
          else if ({platypus,rat,minnie,penguin} == 1)
            bush <= bush_2;
          else
            bush <= bush_3;
          end
        default: bush <= bush_0;
      endcase
  end

// State Mek bush Output logic
always @(bush)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (bush[3:1])
        bush_0: begin
            washington = 0;
            hamburger = 0;
            hotdog = 0;
            drdeath = 0;
            klinton = 0;
            kang = 1;
            water = 1;
            air = 1;
            fire = 0;
            magicwand = 1;
            beavis = 1;
            butthead = 1;
          end
        bush_1: begin
            washington = 0;
            hamburger = 1;
            hotdog = 0;
            drdeath = 0;
            klinton = 1;
            kang = 1;
            water = 1;
            air = 1;
            fire = 0;
            magicwand = 0;
            beavis = 0;
            butthead = 1;
          end
        default: begin
            washington = 1;
            hamburger = 0;
            hotdog = 1;
            drdeath = 1;
            klinton = 1;
            kang = 1;
            water = 0;
            air = 1;
            fire = 0;
            magicwand = 0;
            beavis = 0;
            butthead = 0;
          end
      endcase
  end

always @(washington)
  begin
      feedback_pt_23 = washington;
  end

always @(hamburger)
  begin
      feedback_pt_24 = hamburger;
  end

always @(hamburger)
  begin
      feedback_pt_25 = hamburger;
  end

always @(hotdog)
  begin
      feedback_pt_26 = hotdog;
  end

always @(drdeath)
  begin
      feedback_pt_27 = drdeath;
  end

always @(drdeath)
  begin
      feedback_pt_28 = drdeath;
  end

always @(drdeath)
  begin
      feedback_pt_29 = drdeath;
  end

always @(drdeath)
  begin
      feedback_pt_30 = drdeath;
  end

always @(drdeath)
  begin
      feedback_pt_31 = drdeath;
  end

always @(klinton)
  begin
      feedback_pt_32 = klinton;
  end

always @(kang)
  begin
      feedback_pt_33 = kang;
  end

always @(water)
  begin
      feedback_pt_34 = water;
  end

always @(air)
  begin
      feedback_pt_35 = air;
  end

always @(fire)
  begin
      feedback_pt_36 = fire;
  end

always @(magicwand)
  begin
      feedback_pt_37 = magicwand;
  end

// 8 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {homer,barty,cartman,sand,hours,lamer,hoser,dweebie} <= 0;
    else if (sheep)
      {homer,barty,cartman,sand,hours,lamer,hoser,dweebie} <= {homer,barty,cartman,sand,hours,lamer,hoser,dweebie} + 142;
    else
      {homer,barty,cartman,sand,hours,lamer,hoser,dweebie} <= {homer,barty,cartman,sand,hours,lamer,hoser,dweebie} - 233;
  end

// XOR all of these bits together
always @(ajax or gnd or vcc or whiskey or pig or mickey or luthor or ajax or popcorn or louie or grumpy or gnd)
  begin
      motorhead = ^ {ajax,gnd,vcc,whiskey,pig,mickey,luthor,ajax,popcorn,louie,grumpy,gnd};
  end

always @(drdeath or hulk or dweebie or fire or water or 
   drdeath or hulk or dweebie or fire or deuteronomy or 
   bambi
)
  begin
    if (bambi)
    begin
      case ({{drdeath,hulk,dweebie,fire},water})
        0: burnout=1;
        1: burnout=1;
        2: burnout=1;
        3: burnout=0;
        4: burnout=0;
        5: burnout=1;
        6: burnout=0;
        7: burnout=0;
        8: burnout=1;
        9: burnout=0;
        10: burnout=1;
        11: burnout=0;
        12: burnout=0;
        13: burnout=1;
        14: burnout=0;
        15: burnout=0;
        16: burnout=0;
        17: burnout=0;
        18: burnout=0;
        19: burnout=0;
        20: burnout=0;
        21: burnout=1;
        22: burnout=0;
        23: burnout=0;
        24: burnout=0;
        25: burnout=0;
        26: burnout=0;
        27: burnout=1;
        28: burnout=0;
        29: burnout=1;
        30: burnout=0;
        31: burnout=0;
      default: burnout=0;
      endcase
    end
    else
    begin
      case ({{drdeath,hulk,dweebie,fire},deuteronomy})
        0: burnout=1;
        1: burnout=1;
        2: burnout=0;
        3: burnout=0;
        4: burnout=0;
        5: burnout=0;
        6: burnout=0;
        7: burnout=0;
        8: burnout=1;
        9: burnout=0;
        10: burnout=0;
        11: burnout=0;
        12: burnout=1;
        13: burnout=0;
        14: burnout=0;
        15: burnout=1;
        16: burnout=1;
        17: burnout=0;
        18: burnout=1;
        19: burnout=1;
        20: burnout=0;
        21: burnout=1;
        22: burnout=1;
        23: burnout=0;
        24: burnout=0;
        25: burnout=1;
        26: burnout=1;
        27: burnout=0;
        28: burnout=1;
        29: burnout=1;
        30: burnout=0;
        31: burnout=0;
      default: burnout=0;
      endcase
    end
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacques <= 0;
    else
    case ({sneezy,unicorn})
       0 : jacques <= jacques;
       1 : jacques <= jacques;
       2 : jacques <= jacques;
       3 : jacques <= jacques;
       default : jacques <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pdiddy <= 0;
    else
    case ({cellphone,pocahontas})
       0 : pdiddy <= unicorn;
       1 : pdiddy <= xterm;
       2 : pdiddy <= pdiddy;
       3 : pdiddy <= pdiddy;
       default : pdiddy <= 0;
    endcase
  end

reg feedback_pt_38;

always @(shuda or feedback_pt_38)
  begin
      pdaddy =  shuda ^  feedback_pt_38;
  end

reg feedback_pt_39;

always @(vcc or feedback_pt_39)
  begin
      dorkus =  vcc |  feedback_pt_39;
  end

reg feedback_pt_40;

always @(beetle or feedback_pt_40)
  begin
      drunken =  beetle &  feedback_pt_40;
  end

reg feedback_pt_41;

always @(otter or feedback_pt_41)
  begin
      master = !otter ^  feedback_pt_41;
  end

reg feedback_pt_42;

always @(happy or feedback_pt_42)
  begin
      flew =  happy | !feedback_pt_42;
  end

reg feedback_pt_43;

always @(loser or feedback_pt_43)
  begin
      over =  loser ^ !feedback_pt_43;
  end

reg feedback_pt_44;

always @(gnd or feedback_pt_44)
  begin
      cuckoo =  gnd |  feedback_pt_44;
  end

reg feedback_pt_45;

always @(vcc or feedback_pt_45)
  begin
      nest =  vcc & !feedback_pt_45;
  end

reg feedback_pt_46;

always @(hamburger or feedback_pt_46)
  begin
      starwars =  hamburger ^ !feedback_pt_46;
  end

reg feedback_pt_47;

always @(dfecensorc or feedback_pt_47)
  begin
      yoda =  dfecensorc ^ !feedback_pt_47;
  end

reg feedback_pt_48;

always @(homer or feedback_pt_48)
  begin
      obiwan = !homer |  feedback_pt_48;
  end

reg feedback_pt_49;

always @(pdaddy or feedback_pt_49)
  begin
      vadar = !pdaddy |  feedback_pt_49;
  end

reg feedback_pt_50;

always @(wolverine or feedback_pt_50)
  begin
      skywalker = !wolverine &  feedback_pt_50;
  end

reg feedback_pt_51;

always @(rat or feedback_pt_51)
  begin
      north = !rat |  feedback_pt_51;
  end

reg feedback_pt_52;

always @(clinton or feedback_pt_52)
  begin
      southern = !clinton ^  feedback_pt_52;
  end

reg feedback_pt_53;

always @(ceecensor or feedback_pt_53)
  begin
      east =  ceecensor & !feedback_pt_53;
  end

reg feedback_pt_54;

always @(motorhead or feedback_pt_54)
  begin
      west =  motorhead |  feedback_pt_54;
  end

reg feedback_pt_55;

always @(gyro or feedback_pt_55)
  begin
      porfavor = !gyro | !feedback_pt_55;
  end

reg feedback_pt_56;

always @(kangaroo or feedback_pt_56)
  begin
      cuanto =  kangaroo &  feedback_pt_56;
  end

reg feedback_pt_57;

always @(agamemnon or feedback_pt_57)
  begin
      questo = !agamemnon ^ !feedback_pt_57;
  end

wire pantalones_wire;

dffeas pantalones_ff (
  .clk(clock0),
  .d(mickey),
  .ena(jiminy),
  .sclr(goofy),
  .sload(over),
  .asdata(sleeping),
  .clrn(!reset0),
  .q(pantalones_wire)
);

always @(pantalones_wire) begin
   rojas = pantalones_wire;
end

always @(rojas)
  begin
      feedback_pt_38 = rojas;
  end

always @(rojas)
  begin
      feedback_pt_39 = rojas;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      popacap <= 0;
    else if (gnd)
      popacap <= turtle;
    else if (washington)
      popacap <= 0;
  end

always @(popacap)
  begin
      feedback_pt_40 = popacap;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pizza <= 0;
    else if (deuteronomy)
      pizza <= 0;
    else if (gnd)
      pizza <= maklak;
  end

always @(pizza)
  begin
      feedback_pt_41 = pizza;
  end

always @(pizza)
  begin
      feedback_pt_42 = pizza;
  end

always @(pizza)
  begin
      feedback_pt_43 = pizza;
  end

always @(pizza)
  begin
      feedback_pt_44 = pizza;
  end

always @(pizza)
  begin
      feedback_pt_45 = pizza;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mushroom <= 0;
    else if (vcc)
      mushroom <= west;
  end

always @(mushroom)
  begin
      feedback_pt_46 = mushroom;
  end

always @(mushroom)
  begin
      feedback_pt_47 = mushroom;
  end

always @(mushroom)
  begin
      feedback_pt_48 = mushroom;
  end

always @(mushroom)
  begin
      feedback_pt_49 = mushroom;
  end

always @(mushroom)
  begin
      feedback_pt_50 = mushroom;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cheese <= 0;
    else
      cheese <= vcc;
  end

always @(cheese)
  begin
      feedback_pt_51 = cheese;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mcnugget <= 1;
    else
      mcnugget <= sand;
  end

always @(mcnugget)
  begin
      feedback_pt_52 = mcnugget;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      werewolf <= 0;
    else if (vcc)
      werewolf <= superman;
  end

always @(werewolf)
  begin
      feedback_pt_53 = werewolf;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spirit <= 0;
    else if (vcc)
      spirit <= saturn;
  end

always @(spirit)
  begin
      feedback_pt_54 = spirit;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vampire <= 0;
    else if (dorkus)
      vampire <= 0;
    else if (east)
      vampire <= gnd;
  end

always @(vampire)
  begin
      feedback_pt_55 = vampire;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pyro <= 0;
    else if (english)
      pyro <= 0;
    else if (ulysses)
      pyro <= nest;
  end

always @(pyro)
  begin
      feedback_pt_56 = pyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      criminal <= 0;
    else if (pdiddy)
      criminal <= 0;
    else if (due)
      criminal <= skywalker;
  end

always @(criminal)
  begin
      feedback_pt_57 = criminal;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      orange <= 0;
    else if (dork)
      orange <= 0;
    else if (woman)
      orange <= sand;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      purple <= 0;
    else if (noah)
      purple <= 0;
    else if (drunken)
      purple <= jacques;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yellow <= 0;
    else if (vcc)
      yellow <= mortgate;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      clay <= 1;
    else
      clay <= mushroom;
  end

wire paper_wire;

dffea paper_ff (
  .clk(clock0),
  .d(clay),
  .ena(gnd),
  .adata(cartman),
  .clrn(!reset0),
  .q(paper_wire)
);

always @(paper_wire) begin
   crayons = paper_wire;
end

wire indigo_wire;

dffeas indigo_ff (
  .clk(clock0),
  .d(gnd),
  .ena(vcc),
  .sclr(achilles),
  .sload(brian),
  .asdata(aladdin),
  .clrn(!reset0),
  .q(indigo_wire)
);

always @(indigo_wire) begin
   kmfdm = indigo_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pentium <= 0;
    else if (yellow)
      pentium <= hector;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bubba <= 1;
    else
      bubba <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ohno <= 0;
    else if (lamer)
      ohno <= spirit;
    else if (magicwand)
      ohno <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fallen <= 0;
    else if (wonder)
      fallen <= barty;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      comrade <= 0;
    else if (werewolf)
      comrade <= popacap;
    else if (funkadelic)
      comrade <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chairman <= 0;
    else
      chairman <= cuckoo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      biker <= 0;
    else if (platypus)
      biker <= moulin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tattoo <= 1;
    else
      tattoo <= duey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kanji <= 0;
    else if (vampire)
      kanji <= yeanyow;
  end

// 7 bit add sub
always @(criminal or vcc or minnie or wonder or gnd or magicwand or vadar or gnd or gnd or rouge or flew or biker or vcc or southern)
  begin
    {knot,bellybutton,whammy,deathguild,maritime,surfer,moron} = 
		{criminal,vcc,minnie,wonder,gnd,magicwand,vadar} + 
		{gnd,gnd,rouge,flew,biker,vcc,southern};
  end

// 6 bit add sub
always @(minnie or vcc or vcc or air or shuda or obiwan or spirit or crayons or mickey or gnd or batman or otter)
  begin
    {iterate,elkarchmero,elguapo,senorduck,firstpart,leidiot} = 
		({minnie,vcc,vcc,air,shuda,obiwan} ^ 38) - 
		({spirit,crayons,mickey,gnd,batman,otter} ^ 22);
  end

// 2s comp negate A
always @(cheese or deathguild or klinton or fallen or mickey or vcc or nuclear)
  begin
    {kidnapper,ring,think,firewiggle,bracket,probably,shudamak} = - {cheese,deathguild,klinton,fallen,mickey,vcc,nuclear};
  end

// 4 bit divide
always @(mcnugget or kmfdm or quail or questo or cuckoo or kanji or loser or yeanyow)
  begin
    if ({cuckoo,kanji,loser,yeanyow} == 0)
       {callme,wannabe,fuji,emails} = 0;
    else 
      {callme,wannabe,fuji,emails} = 
	  	  {mcnugget,kmfdm,quail,questo} / 
		  {cuckoo,kanji,loser,yeanyow};
  end

reg feedback_pt_58;

always @(bracket or feedback_pt_58)
  begin
      dadada =  bracket ^  feedback_pt_58;
  end

reg feedback_pt_59;

always @(nuclear or feedback_pt_59)
  begin
      conference = !nuclear | !feedback_pt_59;
  end

reg feedback_pt_60;

always @(neon or feedback_pt_60)
  begin
      parrot =  neon & !feedback_pt_60;
  end

reg feedback_pt_61;

always @(cheese or feedback_pt_61)
  begin
      workhere =  cheese ^ !feedback_pt_61;
  end

reg feedback_pt_62;

always @(ohno or feedback_pt_62)
  begin
      onthepc = !ohno |  feedback_pt_62;
  end

reg feedback_pt_63;

always @(kang or feedback_pt_63)
  begin
      facetious =  kang | !feedback_pt_63;
  end

reg feedback_pt_64;

always @(butthead or feedback_pt_64)
  begin
      mariollama = !butthead ^  feedback_pt_64;
  end

reg feedback_pt_65;

always @(clay or feedback_pt_65)
  begin
      rafting =  clay ^ !feedback_pt_65;
  end

reg feedback_pt_66;

always @(vcc or feedback_pt_66)
  begin
      freaky = !vcc & !feedback_pt_66;
  end

reg feedback_pt_67;

always @(mariollama or feedback_pt_67)
  begin
      davidlin =  mariollama ^ !feedback_pt_67;
  end

reg feedback_pt_68;

always @(buddha or feedback_pt_68)
  begin
      blueled =  buddha & !feedback_pt_68;
  end

reg feedback_pt_69;

always @(master or feedback_pt_69)
  begin
      pirate = !master | !feedback_pt_69;
  end

reg feedback_pt_70;

always @(gnd or feedback_pt_70)
  begin
      prison = !gnd ^ !feedback_pt_70;
  end

reg feedback_pt_71;

always @(vcc or feedback_pt_71)
  begin
      marquis = !vcc &  feedback_pt_71;
  end

reg feedback_pt_72;

always @(firewiggle or feedback_pt_72)
  begin
      desade =  firewiggle &  feedback_pt_72;
  end

reg feedback_pt_73;

always @(bellybutton or feedback_pt_73)
  begin
      baron = !bellybutton ^  feedback_pt_73;
  end

reg feedback_pt_74;

always @(whack or feedback_pt_74)
  begin
      vonmunchhausen = !whack &  feedback_pt_74;
  end

reg feedback_pt_75;

always @(ring or feedback_pt_75)
  begin
      boots = !ring | !feedback_pt_75;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      narcotics <= 0;
    else if (vcc)
      narcotics <= 0;
    else if (emails)
      narcotics <= vcc;
  end

always @(narcotics)
  begin
      feedback_pt_58 = narcotics;
  end

always @(narcotics)
  begin
      feedback_pt_59 = narcotics;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cocaine <= 1;
    else
      cocaine <= iterate;
  end

always @(cocaine)
  begin
      feedback_pt_60 = cocaine;
  end

always @(cocaine)
  begin
      feedback_pt_61 = cocaine;
  end

always @(cocaine)
  begin
      feedback_pt_62 = cocaine;
  end

always @(cocaine)
  begin
      feedback_pt_63 = cocaine;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      contractor <= 0;
    else
      contractor <= vcc;
  end

always @(contractor)
  begin
      feedback_pt_64 = contractor;
  end

always @(contractor)
  begin
      feedback_pt_65 = contractor;
  end

always @(contractor)
  begin
      feedback_pt_66 = contractor;
  end

always @(contractor)
  begin
      feedback_pt_67 = contractor;
  end

always @(contractor)
  begin
      feedback_pt_68 = contractor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      doobie <= 0;
    else if (cartman)
      doobie <= cluckU;
  end

always @(doobie)
  begin
      feedback_pt_69 = doobie;
  end

wire float_wire;

dffeas float_ff (
  .clk(clock0),
  .d(firewiggle),
  .ena(batman),
  .sclr(lion),
  .sload(pirate),
  .asdata(tattoo),
  .clrn(!reset0),
  .q(float_wire)
);

always @(float_wire) begin
   budlite = float_wire;
end

always @(budlite)
  begin
      feedback_pt_70 = budlite;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      morenames <= 0;
    else if (whammy)
      morenames <= 0;
    else if (whack)
      morenames <= prison;
  end

always @(morenames)
  begin
      feedback_pt_71 = morenames;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mrbill <= 0;
    else
      mrbill <= doobie;
  end

always @(mrbill)
  begin
      feedback_pt_72 = mrbill;
  end

wire dutch_wire;

dffeas dutch_ff (
  .clk(clock0),
  .d(vcc),
  .ena(jiminy),
  .sclr(gnd),
  .sload(vcc),
  .asdata(moron),
  .clrn(!reset0),
  .q(dutch_wire)
);

always @(dutch_wire) begin
   candle = dutch_wire;
end

always @(candle)
  begin
      feedback_pt_73 = candle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spyro <= 0;
    else if (conference)
      spyro <= 0;
    else if (rojas)
      spyro <= maritime;
  end

always @(spyro)
  begin
      feedback_pt_74 = spyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      speedyg <= 0;
    else
      speedyg <= vcc;
  end

always @(speedyg)
  begin
      feedback_pt_75 = speedyg;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kennyg <= 0;
    else if (yeanyow)
      kennyg <= boots;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      johndenver <= 0;
    else
      johndenver <= think;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacklemon <= 0;
    else if (shudamak)
      jacklemon <= dweebie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      theonion <= 0;
    else if (callme)
      theonion <= desade;
    else if (vonmunchhausen)
      theonion <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chatanooga <= 1;
    else
      chatanooga <= deathguild;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kebab <= 1;
    else
      kebab <= leidiot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kabar <= 1;
    else
      kabar <= criminal;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fullmetal <= 1;
    else
      fullmetal <= elkarchmero;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aluminum <= 0;
    else if (wannabe)
      aluminum <= mrbill;
  end

wire copper_wire;

dffeas copper_ff (
  .clk(clock0),
  .d(west),
  .ena(vcc),
  .sclr(kennyg),
  .sload(bubba),
  .asdata(jiminy),
  .clrn(!reset0),
  .q(copper_wire)
);

always @(copper_wire) begin
   zinc = copper_wire;
end

wire platinum_wire;

dffeas platinum_ff (
  .clk(clock0),
  .d(cuanto),
  .ena(vcc),
  .sclr(starwars),
  .sload(vampire),
  .asdata(kabar),
  .clrn(!reset0),
  .q(platinum_wire)
);

always @(platinum_wire) begin
   tin = platinum_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iron <= 0;
    else
      iron <= riddler;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fascist <= 0;
    else if (hercules)
      fascist <= 0;
    else if (marquis)
      fascist <= fuji;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      anarchist <= 1;
    else
      anarchist <= purple;
  end

// State Mek capitalist Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      capitalist <= capitalist_0;
    else
      case (capitalist)
        capitalist_0: begin
          if ({cocaine,vcc,gnd,candle} == 6)
            capitalist <= capitalist_0;
          else if ({cocaine,vcc,gnd,candle} == 9)
            capitalist <= capitalist_6;
          else
            capitalist <= capitalist_0;
          end
        capitalist_1: begin
          if ({cocaine,vcc,gnd,candle} == 13)
            capitalist <= capitalist_2;
          else if ({cocaine,vcc,gnd,candle} == 7)
            capitalist <= capitalist_4;
          else if ({cocaine,vcc,gnd,candle} == 0)
            capitalist <= capitalist_0;
          else if ({cocaine,vcc,gnd,candle} == 5)
            capitalist <= capitalist_3;
          else
            capitalist <= capitalist_1;
          end
        capitalist_2: begin
          if ({cocaine,vcc,gnd,candle} == 1)
            capitalist <= capitalist_0;
          else
            capitalist <= capitalist_2;
          end
        capitalist_3: begin
          if ({cocaine,vcc,gnd,candle} == 1)
            capitalist <= capitalist_8;
          else
            capitalist <= capitalist_3;
          end
        capitalist_4: begin
          if ({cocaine,vcc,gnd,candle} == 15)
            capitalist <= capitalist_4;
          else if ({cocaine,vcc,gnd,candle} == 6)
            capitalist <= capitalist_9;
          else if ({cocaine,vcc,gnd,candle} == 3)
            capitalist <= capitalist_7;
          else if ({cocaine,vcc,gnd,candle} == 2)
            capitalist <= capitalist_5;
          else
            capitalist <= capitalist_4;
          end
        capitalist_5: begin
          if ({cocaine,vcc,gnd,candle} == 6)
            capitalist <= capitalist_3;
          else if ({cocaine,vcc,gnd,candle} == 5)
            capitalist <= capitalist_6;
          else if ({cocaine,vcc,gnd,candle} == 4)
            capitalist <= capitalist_0;
          else if ({cocaine,vcc,gnd,candle} == 8)
            capitalist <= capitalist_6;
          else
            capitalist <= capitalist_5;
          end
        capitalist_6: begin
          if ({cocaine,vcc,gnd,candle} == 15)
            capitalist <= capitalist_5;
          else if ({cocaine,vcc,gnd,candle} == 8)
            capitalist <= capitalist_0;
          else
            capitalist <= capitalist_6;
          end
        capitalist_7: begin
          if ({cocaine,vcc,gnd,candle} == 9)
            capitalist <= capitalist_8;
          else if ({cocaine,vcc,gnd,candle} == 14)
            capitalist <= capitalist_3;
          else if ({cocaine,vcc,gnd,candle} == 3)
            capitalist <= capitalist_2;
          else
            capitalist <= capitalist_7;
          end
        capitalist_8: begin
          if ({cocaine,vcc,gnd,candle} == 13)
            capitalist <= capitalist_7;
          else if ({cocaine,vcc,gnd,candle} == 6)
            capitalist <= capitalist_1;
          else if ({cocaine,vcc,gnd,candle} == 7)
            capitalist <= capitalist_1;
          else
            capitalist <= capitalist_8;
          end
        capitalist_9: begin
          if ({cocaine,vcc,gnd,candle} == 9)
            capitalist <= capitalist_4;
          else if ({cocaine,vcc,gnd,candle} == 0)
            capitalist <= capitalist_4;
          else
            capitalist <= capitalist_9;
          end
        default: capitalist <= capitalist_0;
      endcase
  end

// State Mek capitalist Output logic
always @(capitalist)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (capitalist[3:1])
        capitalist_0: begin
            socialist = 1;
            moderate = 0;
            floating = 1;
            drevil = 1;
            erncenso = 1;
            fsncens = 0;
            gtncensor = 1;
            tinker = 0;
            lunchtime = 0;
            roosevelt = 0;
            hxncensorce = 0;
            opus = 1;
            portnoy = 1;
            milo = 0;
            bloom = 0;
          end
        capitalist_1: begin
            socialist = 1;
            moderate = 0;
            floating = 0;
            drevil = 1;
            erncenso = 1;
            fsncens = 1;
            gtncensor = 0;
            tinker = 0;
            lunchtime = 1;
            roosevelt = 1;
            hxncensorce = 0;
            opus = 1;
            portnoy = 0;
            milo = 0;
            bloom = 1;
          end
        capitalist_2: begin
            socialist = 1;
            moderate = 1;
            floating = 0;
            drevil = 1;
            erncenso = 1;
            fsncens = 0;
            gtncensor = 0;
            tinker = 0;
            lunchtime = 1;
            roosevelt = 0;
            hxncensorce = 1;
            opus = 0;
            portnoy = 0;
            milo = 0;
            bloom = 0;
          end
        capitalist_3: begin
            socialist = 0;
            moderate = 0;
            floating = 0;
            drevil = 1;
            erncenso = 1;
            fsncens = 1;
            gtncensor = 0;
            tinker = 1;
            lunchtime = 0;
            roosevelt = 0;
            hxncensorce = 1;
            opus = 0;
            portnoy = 1;
            milo = 0;
            bloom = 1;
          end
        capitalist_4: begin
            socialist = 0;
            moderate = 0;
            floating = 0;
            drevil = 0;
            erncenso = 0;
            fsncens = 0;
            gtncensor = 0;
            tinker = 0;
            lunchtime = 1;
            roosevelt = 0;
            hxncensorce = 0;
            opus = 1;
            portnoy = 1;
            milo = 0;
            bloom = 1;
          end
        default: begin
            socialist = 1;
            moderate = 1;
            floating = 1;
            drevil = 1;
            erncenso = 1;
            fsncens = 1;
            gtncensor = 0;
            tinker = 0;
            lunchtime = 0;
            roosevelt = 0;
            hxncensorce = 0;
            opus = 1;
            portnoy = 1;
            milo = 1;
            bloom = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire hotpastrami_out;
nut_004_lut #(6) nut_004_lut_inst_hotpastrami (
  .din({vampire,fullmetal,iron,minnie,chatanooga,hotdog}),
  .mask(64'he592686d6de8e1f9),
  .out(hotpastrami_out)
);

always @(hotpastrami_out)
begin
   potatoskin = hotpastrami_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire donut_out;
nut_004_lut #(6) nut_004_lut_inst_donut (
  .din({tattoo,ceecensor,batman,gyro,vcc,burnout}),
  .mask(64'b0000000000000100101100010000110000011010000000010101100000100001),
  .out(donut_out)
);

always @(donut_out)
begin
   roastbeef = donut_out;
end

// 2s comp negate A
always @(gnd or chairman or tinker or drevil or hours)
  begin
    {poppyseed,clubsandwich,kungfu,fatality} = - {gnd,chairman,tinker,drevil,hours};
  end

reg feedback_pt_76;

always @(chairman or feedback_pt_76)
  begin
      testyour = !chairman | !feedback_pt_76;
  end

reg feedback_pt_77;

always @(hotdog or feedback_pt_77)
  begin
      might = !hotdog ^ !feedback_pt_77;
  end

reg feedback_pt_78;

always @(fuji or feedback_pt_78)
  begin
      excellent = !fuji & !feedback_pt_78;
  end

reg feedback_pt_79;

always @(gyro or feedback_pt_79)
  begin
      Iwin =  gyro &  feedback_pt_79;
  end

reg feedback_pt_80;

always @(gnd or feedback_pt_80)
  begin
      danger = !gnd | !feedback_pt_80;
  end

reg feedback_pt_81;

always @(probably or feedback_pt_81)
  begin
      screaming =  probably & !feedback_pt_81;
  end

reg feedback_pt_82;

always @(holepunch or feedback_pt_82)
  begin
      atilla =  holepunch | !feedback_pt_82;
  end

reg feedback_pt_83;

always @(vcc or feedback_pt_83)
  begin
      famulan =  vcc & !feedback_pt_83;
  end

reg feedback_pt_84;

always @(cuanto or feedback_pt_84)
  begin
      supurb =  cuanto &  feedback_pt_84;
  end

reg feedback_pt_85;

always @(vcc or feedback_pt_85)
  begin
      jayqueeze = !vcc |  feedback_pt_85;
  end

reg feedback_pt_86;

always @(dweebie or feedback_pt_86)
  begin
      waydeelect =  dweebie | !feedback_pt_86;
  end

reg feedback_pt_87;

always @(gnd or feedback_pt_87)
  begin
      iwocensor =  gnd &  feedback_pt_87;
  end

reg feedback_pt_88;

always @(gnd or feedback_pt_88)
  begin
      incompetent =  gnd |  feedback_pt_88;
  end

reg feedback_pt_89;

always @(johndenver or feedback_pt_89)
  begin
      secondrate =  johndenver & !feedback_pt_89;
  end

reg feedback_pt_90;

always @(gnd or feedback_pt_90)
  begin
      inspection =  gnd & !feedback_pt_90;
  end

reg feedback_pt_91;

always @(beauty or feedback_pt_91)
  begin
      thedon = !beauty &  feedback_pt_91;
  end

reg feedback_pt_92;

always @(vcc or feedback_pt_92)
  begin
      marco =  vcc |  feedback_pt_92;
  end

reg feedback_pt_93;

always @(Iwin or feedback_pt_93)
  begin
      cocacola = !Iwin |  feedback_pt_93;
  end

reg feedback_pt_94;

always @(erncenso or feedback_pt_94)
  begin
      ham =  erncenso | !feedback_pt_94;
  end

reg feedback_pt_95;

always @(vcc or feedback_pt_95)
  begin
      mandarin =  vcc &  feedback_pt_95;
  end

reg feedback_pt_96;

always @(aluminum or feedback_pt_96)
  begin
      ihilani =  aluminum | !feedback_pt_96;
  end

reg feedback_pt_97;

always @(gnd or feedback_pt_97)
  begin
      october = !gnd &  feedback_pt_97;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tracy <= 0;
    else if (waydeelect)
      tracy <= hxncensorce;
    else if (boots)
      tracy <= 0;
  end

always @(tracy)
  begin
      feedback_pt_76 = tracy;
  end

always @(tracy)
  begin
      feedback_pt_77 = tracy;
  end

wire jjocen_wire;

dffeas jjocen_ff (
  .clk(clock0),
  .d(danger),
  .ena(facetious),
  .sclr(gnd),
  .sload(comrade),
  .asdata(kang),
  .clrn(!reset0),
  .q(jjocen_wire)
);

always @(jjocen_wire) begin
   meffert = jjocen_wire;
end

always @(meffert)
  begin
      feedback_pt_78 = meffert;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bismuth <= 0;
    else if (chairman)
      bismuth <= zinc;
    else if (iwocensor)
      bismuth <= 0;
  end

always @(bismuth)
  begin
      feedback_pt_79 = bismuth;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floride <= 0;
    else if (lantern)
      floride <= 0;
    else if (kidnapper)
      floride <= jayqueeze;
  end

always @(floride)
  begin
      feedback_pt_80 = floride;
  end

always @(floride)
  begin
      feedback_pt_81 = floride;
  end

always @(floride)
  begin
      feedback_pt_82 = floride;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oranges <= 0;
    else if (east)
      oranges <= vcc;
    else if (pdaddy)
      oranges <= 0;
  end

always @(oranges)
  begin
      feedback_pt_83 = oranges;
  end

always @(oranges)
  begin
      feedback_pt_84 = oranges;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pyromaniac <= 0;
    else
      pyromaniac <= tin;
  end

always @(pyromaniac)
  begin
      feedback_pt_85 = pyromaniac;
  end

always @(pyromaniac)
  begin
      feedback_pt_86 = pyromaniac;
  end

always @(pyromaniac)
  begin
      feedback_pt_87 = pyromaniac;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      junkie <= 0;
    else
      junkie <= bracket;
  end

always @(junkie)
  begin
      feedback_pt_88 = junkie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      waster <= 1;
    else
      waster <= fascist;
  end

always @(waster)
  begin
      feedback_pt_89 = waster;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burner <= 1;
    else
      burner <= speedyg;
  end

always @(burner)
  begin
      feedback_pt_90 = burner;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crackhead <= 0;
    else if (gtncensor)
      crackhead <= 0;
    else if (poppyseed)
      crackhead <= kebab;
  end

always @(crackhead)
  begin
      feedback_pt_91 = crackhead;
  end

wire stoner_wire;

dffeas stoner_ff (
  .clk(clock0),
  .d(cocaine),
  .ena(vcc),
  .sclr(pizza),
  .sload(floride),
  .asdata(gnd),
  .clrn(!reset0),
  .q(stoner_wire)
);

always @(stoner_wire) begin
   drugie = stoner_wire;
end

always @(drugie)
  begin
      feedback_pt_92 = drugie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chemical <= 0;
    else if (portnoy)
      chemical <= 0;
    else if (baron)
      chemical <= tin;
  end

always @(chemical)
  begin
      feedback_pt_93 = chemical;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      brothers <= 0;
    else
      brothers <= parrot;
  end

always @(brothers)
  begin
      feedback_pt_94 = brothers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tunafish <= 0;
    else if (pdaddy)
      tunafish <= atilla;
    else if (gnd)
      tunafish <= 0;
  end

always @(tunafish)
  begin
      feedback_pt_95 = tunafish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eggsalad <= 0;
    else
      eggsalad <= narcotics;
  end

always @(eggsalad)
  begin
      feedback_pt_96 = eggsalad;
  end

wire agitator_wire;

dffea agitator_ff (
  .clk(clock0),
  .d(popacap),
  .ena(bubba),
  .adata(jacklemon),
  .clrn(!reset0),
  .q(agitator_wire)
);

always @(agitator_wire) begin
   postulator = agitator_wire;
end

always @(postulator)
  begin
      feedback_pt_97 = postulator;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      satanist <= 0;
    else if (gnd)
      satanist <= 0;
    else if (floating)
      satanist <= workhere;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      plagarist <= 0;
    else if (kungfu)
      plagarist <= 0;
    else if (theonion)
      plagarist <= vcc;
  end

wire whoiswho_wire;

dffeas whoiswho_ff (
  .clk(clock0),
  .d(vcc),
  .ena(batman),
  .sclr(testyour),
  .sload(kabar),
  .asdata(thedon),
  .clrn(!reset0),
  .q(whoiswho_wire)
);

always @(whoiswho_wire) begin
   money = whoiswho_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      morrison <= 0;
    else
      morrison <= west;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      firewalk <= 0;
    else if (porfavor)
      firewalk <= aluminum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      withme <= 0;
    else
      withme <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      palmer <= 1;
    else
      palmer <= beavis;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      banality <= 0;
    else if (vcc)
      banality <= 0;
    else if (junkie)
      banality <= meffert;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      brutality <= 0;
    else
      brutality <= money;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fury <= 0;
    else if (might)
      fury <= mariollama;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hurt <= 1;
    else
      hurt <= dadada;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tobe <= 0;
    else
      tobe <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yoku <= 0;
    else if (gnd)
      yoku <= 0;
    else if (morenames)
      yoku <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      simasu <= 1;
    else
      simasu <= blueled;
  end

reg feedback_pt_98;

always @(firewalk or feedback_pt_98)
  begin
      geisha =  firewalk & !feedback_pt_98;
  end

reg feedback_pt_99;

always @(gnd or feedback_pt_99)
  begin
      pictures =  gnd &  feedback_pt_99;
  end

reg feedback_pt_100;

always @(tunafish or feedback_pt_100)
  begin
      star =  tunafish ^  feedback_pt_100;
  end

reg feedback_pt_101;

always @(eggsalad or feedback_pt_101)
  begin
      show = !eggsalad | !feedback_pt_101;
  end

reg feedback_pt_102;

always @(gnd or feedback_pt_102)
  begin
      ready =  gnd | !feedback_pt_102;
  end

reg feedback_pt_103;

always @(roosevelt or feedback_pt_103)
  begin
      gokidsgo = !roosevelt | !feedback_pt_103;
  end

reg feedback_pt_104;

always @(crackhead or feedback_pt_104)
  begin
      lemon = !crackhead ^  feedback_pt_104;
  end

reg feedback_pt_105;

always @(withme or feedback_pt_105)
  begin
      winner =  withme | !feedback_pt_105;
  end

reg feedback_pt_106;

always @(spyro or feedback_pt_106)
  begin
      speeding = !spyro & !feedback_pt_106;
  end

reg feedback_pt_107;

always @(vcc or feedback_pt_107)
  begin
      hiway = !vcc & !feedback_pt_107;
  end

reg feedback_pt_108;

always @(fatality or feedback_pt_108)
  begin
      grams = !fatality & !feedback_pt_108;
  end

reg feedback_pt_109;

always @(west or feedback_pt_109)
  begin
      kdqcens = !west &  feedback_pt_109;
  end

reg feedback_pt_110;

always @(yoku or feedback_pt_110)
  begin
      bust = !yoku & !feedback_pt_110;
  end

reg feedback_pt_111;

always @(bismuth or feedback_pt_111)
  begin
      gotone = !bismuth | !feedback_pt_111;
  end

reg feedback_pt_112;

always @(bracket or feedback_pt_112)
  begin
      foryou = !bracket ^ !feedback_pt_112;
  end

reg feedback_pt_113;

always @(drugie or feedback_pt_113)
  begin
      sogood = !drugie ^ !feedback_pt_113;
  end

reg feedback_pt_114;

always @(donkey or feedback_pt_114)
  begin
      moreand = !donkey & !feedback_pt_114;
  end

reg feedback_pt_115;

always @(gnd or feedback_pt_115)
  begin
      faster = !gnd ^ !feedback_pt_115;
  end

reg feedback_pt_116;

always @(gnd or feedback_pt_116)
  begin
      elementary =  gnd | !feedback_pt_116;
  end

reg feedback_pt_117;

always @(simasu or feedback_pt_117)
  begin
      sixyears = !simasu &  feedback_pt_117;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      graduated <= 1;
    else
      graduated <= gokidsgo;
  end

always @(graduated)
  begin
      feedback_pt_98 = graduated;
  end

always @(graduated)
  begin
      feedback_pt_99 = graduated;
  end

always @(graduated)
  begin
      feedback_pt_100 = graduated;
  end

always @(graduated)
  begin
      feedback_pt_101 = graduated;
  end

always @(graduated)
  begin
      feedback_pt_102 = graduated;
  end

wire overeducated_wire;

dffeas overeducated_ff (
  .clk(clock0),
  .d(donkey),
  .ena(poppyseed),
  .sclr(milo),
  .sload(clubsandwich),
  .asdata(fury),
  .clrn(!reset0),
  .q(overeducated_wire)
);

always @(overeducated_wire) begin
   notalot = overeducated_wire;
end

always @(notalot)
  begin
      feedback_pt_103 = notalot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nation <= 0;
    else
      nation <= brutality;
  end

always @(nation)
  begin
      feedback_pt_104 = nation;
  end

always @(nation)
  begin
      feedback_pt_105 = nation;
  end

always @(nation)
  begin
      feedback_pt_106 = nation;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      protest <= 0;
    else if (jayqueeze)
      protest <= 0;
    else if (plagarist)
      protest <= lamer;
  end

always @(protest)
  begin
      feedback_pt_107 = protest;
  end

always @(protest)
  begin
      feedback_pt_108 = protest;
  end

always @(protest)
  begin
      feedback_pt_109 = protest;
  end

always @(protest)
  begin
      feedback_pt_110 = protest;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      animal <= 1;
    else
      animal <= kanji;
  end

always @(animal)
  begin
      feedback_pt_111 = animal;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vegan <= 1;
    else
      vegan <= protest;
  end

always @(vegan)
  begin
      feedback_pt_112 = vegan;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vegetarian <= 0;
    else if (tobe)
      vegetarian <= gnd;
    else if (iron)
      vegetarian <= 0;
  end

always @(vegetarian)
  begin
      feedback_pt_113 = vegetarian;
  end

wire liberation_wire;

dffeas liberation_ff (
  .clk(clock0),
  .d(juliet),
  .ena(screaming),
  .sclr(show),
  .sload(orange),
  .asdata(morenames),
  .clrn(!reset0),
  .q(liberation_wire)
);

always @(liberation_wire) begin
   psycho = liberation_wire;
end

always @(psycho)
  begin
      feedback_pt_114 = psycho;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      extremist <= 0;
    else if (pictures)
      extremist <= ready;
  end

always @(extremist)
  begin
      feedback_pt_115 = extremist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fruitcake <= 0;
    else if (atilla)
      fruitcake <= gnd;
  end

always @(fruitcake)
  begin
      feedback_pt_116 = fruitcake;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zealot <= 0;
    else
      zealot <= hurt;
  end

always @(zealot)
  begin
      feedback_pt_117 = zealot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chainsaw <= 0;
    else if (milo)
      chainsaw <= east;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rasp <= 0;
    else if (gnd)
      rasp <= faster;
    else if (notalot)
      rasp <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      square <= 1;
    else
      square <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      romex <= 0;
    else if (chemical)
      romex <= junkie;
    else if (moderate)
      romex <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jxnbox <= 1;
    else
      jxnbox <= comrade;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      knockout <= 0;
    else
      knockout <= satanist;
  end

wire curie_wire;

dffeas curie_ff (
  .clk(clock0),
  .d(boots),
  .ena(gnd),
  .sclr(potatoskin),
  .sload(marco),
  .asdata(bubba),
  .clrn(!reset0),
  .q(curie_wire)
);

always @(curie_wire) begin
   gutter = curie_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      plaster <= 1;
    else
      plaster <= square;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wood <= 0;
    else if (sixyears)
      wood <= 0;
    else if (tobe)
      wood <= vegetarian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rampacker <= 0;
    else
      rampacker <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      greenbay <= 0;
    else
      greenbay <= juliet;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      raiders <= 0;
    else if (yoda)
      raiders <= junkie;
    else if (ohno)
      raiders <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      giants <= 1;
    else
      giants <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yankees <= 0;
    else if (vcc)
      yankees <= davidlin;
    else if (ihilani)
      yankees <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nyc <= 0;
    else if (vcc)
      nyc <= hotel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      broadway <= 0;
    else if (vcc)
      broadway <= sheep;
    else if (excellent)
      broadway <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dirty <= 0;
    else if (gnd)
      dirty <= 0;
    else if (vcc)
      dirty <= chemical;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      noyoudirty <= 0;
    else if (socialist)
      noyoudirty <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      muggers <= 0;
    else if (roastbeef)
      muggers <= leidiot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      whattime <= 0;
    else if (gnd)
      whattime <= hours;
    else if (sleepy)
      whattime <= 0;
  end

wire sanity_wire;

dffeas sanity_ff (
  .clk(clock0),
  .d(pdaddy),
  .ena(animal),
  .sclr(dweebie),
  .sload(vcc),
  .asdata(master),
  .clrn(!reset0),
  .q(sanity_wire)
);

always @(sanity_wire) begin
   michelle = sanity_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rocks <= 1;
    else
      rocks <= bloom;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      legos <= 0;
    else if (anarchist)
      legos <= 0;
    else if (gnd)
      legos <= romex;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eatem <= 1;
    else
      eatem <= muggers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blanket <= 0;
    else if (ohno)
      blanket <= extremist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      china <= 0;
    else if (grams)
      china <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      usa <= 0;
    else if (blueled)
      usa <= palmer;
  end

// Random combinatorial logic block
always@(*)
  begin
      holland = ( ~( ~( ~( ~vcc & gnd ) ) ) & vegan );
  end

// State Mek puertorico Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      puertorico <= puertorico_0;
    else
      case (puertorico)
        puertorico_0: begin
          if ({batman,withme,gnd,ham} == 10)
            puertorico <= puertorico_3;
          else
            puertorico <= puertorico_0;
          end
        puertorico_1: begin
          if ({batman,withme,gnd,ham} == 4)
            puertorico <= puertorico_6;
          else if ({batman,withme,gnd,ham} == 14)
            puertorico <= puertorico_4;
          else if ({batman,withme,gnd,ham} == 6)
            puertorico <= puertorico_4;
          else
            puertorico <= puertorico_1;
          end
        puertorico_2: begin
          if ({batman,withme,gnd,ham} == 15)
            puertorico <= puertorico_4;
          else if ({batman,withme,gnd,ham} == 14)
            puertorico <= puertorico_1;
          else if ({batman,withme,gnd,ham} == 5)
            puertorico <= puertorico_1;
          else if ({batman,withme,gnd,ham} == 1)
            puertorico <= puertorico_3;
          else
            puertorico <= puertorico_2;
          end
        puertorico_3: begin
          if ({batman,withme,gnd,ham} == 9)
            puertorico <= puertorico_2;
          else if ({batman,withme,gnd,ham} == 14)
            puertorico <= puertorico_1;
          else if ({batman,withme,gnd,ham} == 7)
            puertorico <= puertorico_4;
          else if ({batman,withme,gnd,ham} == 5)
            puertorico <= puertorico_1;
          else if ({batman,withme,gnd,ham} == 0)
            puertorico <= puertorico_4;
          else
            puertorico <= puertorico_3;
          end
        puertorico_4: begin
          if ({batman,withme,gnd,ham} == 9)
            puertorico <= puertorico_4;
          else if ({batman,withme,gnd,ham} == 0)
            puertorico <= puertorico_1;
          else
            puertorico <= puertorico_4;
          end
        puertorico_5: begin
          if ({batman,withme,gnd,ham} == 6)
            puertorico <= puertorico_0;
          else if ({batman,withme,gnd,ham} == 14)
            puertorico <= puertorico_6;
          else
            puertorico <= puertorico_5;
          end
        puertorico_6: begin
          if ({batman,withme,gnd,ham} == 14)
            puertorico <= puertorico_5;
          else
            puertorico <= puertorico_6;
          end
        default: puertorico <= puertorico_0;
      endcase
  end

// State Mek puertorico Output logic
always @(puertorico)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (puertorico)
        puertorico_0: begin
            mexico = 0;
            spain = 0;
            greenland = 0;
            scotland = 0;
            england = 0;
            iceland = 1;
            romulus = 0;
            remus = 1;
            cain = 1;
            abel = 0;
            zipporah = 1;
            issac = 1;
            abraham = 0;
            jacob = 1;
            joseph = 1;
            dreamcoat = 0;
          end
        puertorico_1: begin
            mexico = 0;
            spain = 1;
            greenland = 0;
            scotland = 0;
            england = 0;
            iceland = 0;
            romulus = 0;
            remus = 1;
            cain = 0;
            abel = 0;
            zipporah = 0;
            issac = 1;
            abraham = 1;
            jacob = 0;
            joseph = 1;
            dreamcoat = 0;
          end
        puertorico_2: begin
            mexico = 0;
            spain = 0;
            greenland = 1;
            scotland = 0;
            england = 0;
            iceland = 0;
            romulus = 0;
            remus = 1;
            cain = 1;
            abel = 1;
            zipporah = 0;
            issac = 0;
            abraham = 1;
            jacob = 1;
            joseph = 0;
            dreamcoat = 0;
          end
        puertorico_3: begin
            mexico = 1;
            spain = 1;
            greenland = 0;
            scotland = 0;
            england = 1;
            iceland = 1;
            romulus = 1;
            remus = 0;
            cain = 1;
            abel = 1;
            zipporah = 0;
            issac = 0;
            abraham = 1;
            jacob = 1;
            joseph = 1;
            dreamcoat = 0;
          end
        puertorico_4: begin
            mexico = 0;
            spain = 0;
            greenland = 1;
            scotland = 0;
            england = 0;
            iceland = 1;
            romulus = 1;
            remus = 1;
            cain = 1;
            abel = 0;
            zipporah = 1;
            issac = 1;
            abraham = 1;
            jacob = 0;
            joseph = 1;
            dreamcoat = 1;
          end
        puertorico_5: begin
            mexico = 1;
            spain = 0;
            greenland = 1;
            scotland = 0;
            england = 0;
            iceland = 0;
            romulus = 1;
            remus = 0;
            cain = 0;
            abel = 1;
            zipporah = 0;
            issac = 0;
            abraham = 1;
            jacob = 0;
            joseph = 1;
            dreamcoat = 1;
          end
        puertorico_6: begin
            mexico = 0;
            spain = 1;
            greenland = 1;
            scotland = 0;
            england = 1;
            iceland = 1;
            romulus = 1;
            remus = 1;
            cain = 0;
            abel = 1;
            zipporah = 1;
            issac = 1;
            abraham = 0;
            jacob = 0;
            joseph = 1;
            dreamcoat = 1;
          end
        default: begin
            mexico = 1;
            spain = 1;
            greenland = 1;
            scotland = 1;
            england = 0;
            iceland = 0;
            romulus = 0;
            remus = 0;
            cain = 0;
            abel = 0;
            zipporah = 0;
            issac = 1;
            abraham = 0;
            jacob = 0;
            joseph = 0;
            dreamcoat = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire lxtcen_out;
nut_004_lut #(3) nut_004_lut_inst_lxtcen (
  .din({gnd,jacob,gnd}),
  .mask(8'b00000100),
  .out(lxtcen_out)
);

always @(lxtcen_out)
begin
   ringlingbros = lxtcen_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire piggish_out;
nut_004_lut #(5) nut_004_lut_inst_piggish (
  .din({hiway,gnd,graduated,eatem,hotel}),
  .mask(32'h1584f93d),
  .out(piggish_out)
);

always @(piggish_out)
begin
   terrance = piggish_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire crapeteria_out;
nut_004_lut #(2) nut_004_lut_inst_crapeteria (
  .din({gnd,star}),
  .mask(4'b0000),
  .out(crapeteria_out)
);

always @(crapeteria_out)
begin
   cryptic = crapeteria_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire nihlist_out;
nut_004_lut #(1) nut_004_lut_inst_nihlist (
  .din({testyour}),
  .mask(2'b10),
  .out(nihlist_out)
);

always @(nihlist_out)
begin
   mdtcensorc = nihlist_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire burning_out;
nut_004_lut #(4) nut_004_lut_inst_burning (
  .din({sleepy,plaster,cain,winner}),
  .mask(16'hd9d4),
  .out(burning_out)
);

always @(burning_out)
begin
   moses = burning_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire oitcen_out;
nut_004_lut #(2) nut_004_lut_inst_oitcen (
  .din({moderate,kanji}),
  .mask(4'hf),
  .out(oitcen_out)
);

always @(oitcen_out)
begin
   nhtcenso = oitcen_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire wine_out;
nut_004_lut #(5) nut_004_lut_inst_wine (
  .din({gnd,moderate,vcc,drdeath,vcc}),
  .mask(32'b00000100000100000100111000100000),
  .out(wine_out)
);

always @(wine_out)
begin
   daughter = wine_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire tonic_out;
nut_004_lut #(3) nut_004_lut_inst_tonic (
  .din({thedon,nhtcenso,vcc}),
  .mask(8'b01000001),
  .out(tonic_out)
);

always @(tonic_out)
begin
   gin = tonic_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire scotch_out;
nut_004_lut #(2) nut_004_lut_inst_scotch (
  .din({usa,muggers}),
  .mask(4'b0000),
  .out(scotch_out)
);

always @(scotch_out)
begin
   rum = scotch_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire curly_out;
nut_004_lut #(5) nut_004_lut_inst_curly (
  .din({holland,gnd,giants,rocks,chainsaw}),
  .mask(32'h663f2c17),
  .out(curly_out)
);

always @(curly_out)
begin
   larry = curly_out;
end

// 10 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {barnum,shemp,wiggum,bart,lisa,marge,homerun,barney,skinner,krabapple} <= 0;
    else if (vcc)
      {barnum,shemp,wiggum,bart,lisa,marge,homerun,barney,skinner,krabapple} <= {barnum,shemp,wiggum,bart,lisa,marge,homerun,barney,skinner,krabapple} + 1;
    else
      {barnum,shemp,wiggum,bart,lisa,marge,homerun,barney,skinner,krabapple} <= {barnum,shemp,wiggum,bart,lisa,marge,homerun,barney,skinner,krabapple} - 1;
  end

// Random 3 in 3 out table
always @(romex or iceland or waydeelect)
  begin
    casex ({romex,iceland,waydeelect})
      0: {tarzan,moe,smithers}=3;
      1: {tarzan,moe,smithers}=2;
      2: {tarzan,moe,smithers}=4;
      3: {tarzan,moe,smithers}=4;
      4: {tarzan,moe,smithers}=2;
      5: {tarzan,moe,smithers}=3;
      6: {tarzan,moe,smithers}=2;
      7: {tarzan,moe,smithers}=7;
      default: {tarzan,moe,smithers}=0;
    endcase
  end

// XOR all of these bits together
always @(secondrate or rocks or nation or romulus or eatem or jayqueeze)
  begin
      comicbook = ^ {secondrate,rocks,nation,romulus,eatem,jayqueeze};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      worstdesignever <= 0;
    else
    case ({burner,gnd})
       0 : worstdesignever <= gnd;
       1 : worstdesignever <= gnd;
       2 : worstdesignever <= moses;
       3 : worstdesignever <= elementary;
       default : worstdesignever <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flanders <= 0;
    else
    case ({vcc,gnd})
       0 : flanders <= flanders;
       1 : flanders <= danger;
       2 : flanders <= flanders;
       3 : flanders <= flanders;
       default : flanders <= 0;
    endcase
  end

reg feedback_pt_118;

always @(whattime or feedback_pt_118)
  begin
      heidi =  whattime &  feedback_pt_118;
  end

reg feedback_pt_119;

always @(iwocensor or feedback_pt_119)
  begin
      steaming = !iwocensor |  feedback_pt_119;
  end

reg feedback_pt_120;

always @(waydeelect or feedback_pt_120)
  begin
      milhouse =  waydeelect |  feedback_pt_120;
  end

reg feedback_pt_121;

always @(surfer or feedback_pt_121)
  begin
      rod =  surfer &  feedback_pt_121;
  end

reg feedback_pt_122;

always @(leidiot or feedback_pt_122)
  begin
      todd = !leidiot & !feedback_pt_122;
  end

reg feedback_pt_123;

always @(budlite or feedback_pt_123)
  begin
      chewbacca = !budlite & !feedback_pt_123;
  end

reg feedback_pt_124;

always @(firstpart or feedback_pt_124)
  begin
      timmy =  firstpart |  feedback_pt_124;
  end

reg feedback_pt_125;

always @(vcc or feedback_pt_125)
  begin
      tukatuk =  vcc |  feedback_pt_125;
  end

reg feedback_pt_126;

always @(potatoskin or feedback_pt_126)
  begin
      slobbering = !potatoskin & !feedback_pt_126;
  end

reg feedback_pt_127;

always @(vcc or feedback_pt_127)
  begin
      weevil = !vcc ^  feedback_pt_127;
  end

reg feedback_pt_128;

always @(gnd or feedback_pt_128)
  begin
      psucensorc = !gnd ^  feedback_pt_128;
  end

reg feedback_pt_129;

always @(gnd or feedback_pt_129)
  begin
      deuce = !gnd | !feedback_pt_129;
  end

reg feedback_pt_130;

always @(gnd or feedback_pt_130)
  begin
      eeevil =  gnd &  feedback_pt_130;
  end

reg feedback_pt_131;

always @(vcc or feedback_pt_131)
  begin
      intuit =  vcc ^ !feedback_pt_131;
  end

reg feedback_pt_132;

always @(vcc or feedback_pt_132)
  begin
      bert = !vcc | !feedback_pt_132;
  end

reg feedback_pt_133;

always @(davidlin or feedback_pt_133)
  begin
      ernie = !davidlin ^ !feedback_pt_133;
  end

reg feedback_pt_134;

always @(moreand or feedback_pt_134)
  begin
      life = !moreand &  feedback_pt_134;
  end

reg feedback_pt_135;

always @(gnd or feedback_pt_135)
  begin
      snuffleupagus =  gnd &  feedback_pt_135;
  end

reg feedback_pt_136;

always @(yankees or feedback_pt_136)
  begin
      peta = !yankees &  feedback_pt_136;
  end

reg feedback_pt_137;

always @(gin or feedback_pt_137)
  begin
      happyists = !gin &  feedback_pt_137;
  end

reg feedback_pt_138;

always @(faster or feedback_pt_138)
  begin
      atomic = !faster |  feedback_pt_138;
  end

reg feedback_pt_139;

always @(michelle or feedback_pt_139)
  begin
      firemonkey =  michelle |  feedback_pt_139;
  end

reg feedback_pt_140;

always @(gnd or feedback_pt_140)
  begin
      qfvcensorce = !gnd &  feedback_pt_140;
  end

reg feedback_pt_141;

always @(peta or feedback_pt_141)
  begin
      captain =  peta &  feedback_pt_141;
  end

reg feedback_pt_142;

always @(scotland or feedback_pt_142)
  begin
      rhvcens = !scotland ^  feedback_pt_142;
  end

reg feedback_pt_143;

always @(gnd or feedback_pt_143)
  begin
      roid =  gnd & !feedback_pt_143;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      itchy <= 1;
    else
      itchy <= gnd;
  end

always @(itchy)
  begin
      feedback_pt_118 = itchy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      squad <= 0;
    else if (abraham)
      squad <= barney;
  end

always @(squad)
  begin
      feedback_pt_119 = squad;
  end

wire joey_wire;

dffea joey_ff (
  .clk(clock0),
  .d(postulator),
  .ena(gotone),
  .adata(gnd),
  .clrn(!reset0),
  .q(joey_wire)
);

always @(joey_wire) begin
   ramone = joey_wire;
end

always @(ramone)
  begin
      feedback_pt_120 = ramone;
  end

always @(ramone)
  begin
      feedback_pt_121 = ramone;
  end

always @(ramone)
  begin
      feedback_pt_122 = ramone;
  end

always @(ramone)
  begin
      feedback_pt_123 = ramone;
  end

always @(ramone)
  begin
      feedback_pt_124 = ramone;
  end

wire stoned_wire;

dffeas stoned_ff (
  .clk(clock0),
  .d(vcc),
  .ena(gnd),
  .sclr(life),
  .sload(mandarin),
  .asdata(dreamcoat),
  .clrn(!reset0),
  .q(stoned_wire)
);

always @(stoned_wire) begin
   often = stoned_wire;
end

always @(often)
  begin
      feedback_pt_125 = often;
  end

always @(often)
  begin
      feedback_pt_126 = often;
  end

always @(often)
  begin
      feedback_pt_127 = often;
  end

always @(often)
  begin
      feedback_pt_128 = often;
  end

always @(often)
  begin
      feedback_pt_129 = often;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      south <= 1;
    else
      south <= ready;
  end

always @(south)
  begin
      feedback_pt_130 = south;
  end

always @(south)
  begin
      feedback_pt_131 = south;
  end

always @(south)
  begin
      feedback_pt_132 = south;
  end

always @(south)
  begin
      feedback_pt_133 = south;
  end

always @(south)
  begin
      feedback_pt_134 = south;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      edible <= 0;
    else
      edible <= smithers;
  end

always @(edible)
  begin
      feedback_pt_135 = edible;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      srvcensorce <= 0;
    else if (skinner)
      srvcensorce <= tukatuk;
  end

always @(srvcensorce)
  begin
      feedback_pt_136 = srvcensorce;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      on_sale <= 0;
    else if (tarzan)
      on_sale <= vcc;
    else if (gnd)
      on_sale <= 0;
  end

always @(on_sale)
  begin
      feedback_pt_137 = on_sale;
  end

wire aisle_two_wire;

dffea aisle_two_ff (
  .clk(clock0),
  .d(gnd),
  .ena(tinker),
  .adata(hotel),
  .clrn(!reset0),
  .q(aisle_two_wire)
);

always @(aisle_two_wire) begin
   dinoblaster = aisle_two_wire;
end

always @(dinoblaster)
  begin
      feedback_pt_138 = dinoblaster;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crunchyfrog <= 0;
    else if (marge)
      crunchyfrog <= spain;
    else if (might)
      crunchyfrog <= 0;
  end

always @(crunchyfrog)
  begin
      feedback_pt_139 = crunchyfrog;
  end

wire nobody_wire;

dffeas nobody_ff (
  .clk(clock0),
  .d(milhouse),
  .ena(muggers),
  .sclr(eggsalad),
  .sload(morrison),
  .asdata(gnd),
  .clrn(!reset0),
  .q(nobody_wire)
);

always @(nobody_wire) begin
   expects_the = nobody_wire;
end

always @(expects_the)
  begin
      feedback_pt_140 = expects_the;
  end

wire spanish_wire;

dffeas spanish_ff (
  .clk(clock0),
  .d(timmy),
  .ena(dinoblaster),
  .sclr(bart),
  .sload(itchy),
  .asdata(vcc),
  .clrn(!reset0),
  .q(spanish_wire)
);

always @(spanish_wire) begin
   inquisition = spanish_wire;
end

always @(inquisition)
  begin
      feedback_pt_141 = inquisition;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chief <= 0;
    else if (vcc)
      chief <= michelle;
    else if (rampacker)
      chief <= 0;
  end

always @(chief)
  begin
      feedback_pt_142 = chief;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weapons <= 1;
    else
      weapons <= vcc;
  end

always @(weapons)
  begin
      feedback_pt_143 = weapons;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fear <= 0;
    else if (dirty)
      fear <= surfer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      surprise <= 0;
    else if (issac)
      surprise <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      efficiency <= 0;
    else if (srvcensorce)
      efficiency <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fanatical <= 0;
    else if (blueled)
      fanatical <= speeding;
    else if (worstdesignever)
      fanatical <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      devotion <= 0;
    else if (mexico)
      devotion <= ernie;
  end

wire the_pope_wire;

dffea the_pope_ff (
  .clk(clock0),
  .d(vcc),
  .ena(bracket),
  .adata(vcc),
  .clrn(!reset0),
  .q(the_pope_wire)
);

always @(the_pope_wire) begin
   yummy = the_pope_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      love_in <= 0;
    else if (mdtcensorc)
      love_in <= show;
  end

wire my_tummy_wire;

dffea my_tummy_ff (
  .clk(clock0),
  .d(incompetent),
  .ena(chairman),
  .adata(surprise),
  .clrn(!reset0),
  .q(my_tummy_wire)
);

always @(my_tummy_wire) begin
   po = my_tummy_wire;
end

wire lala_wire;

dffeas lala_ff (
  .clk(clock0),
  .d(atomic),
  .ena(nation),
  .sclr(chief),
  .sload(waster),
  .asdata(legos),
  .clrn(!reset0),
  .q(lala_wire)
);

always @(lala_wire) begin
   dipsy = lala_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      touch <= 0;
    else if (pyromaniac)
      touch <= 0;
    else if (fear)
      touch <= rum;
  end

wire kissthesky_wire;

dffeas kissthesky_ff (
  .clk(clock0),
  .d(captain),
  .ena(moreand),
  .sclr(vcc),
  .sload(gnd),
  .asdata(rod),
  .clrn(!reset0),
  .q(kissthesky_wire)
);

always @(kissthesky_wire) begin
   peopleeater = kissthesky_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      haze <= 0;
    else if (rhvcens)
      haze <= wiggum;
    else if (greenland)
      haze <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      timingmodel <= 0;
    else if (inspection)
      timingmodel <= gnd;
    else if (intuit)
      timingmodel <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      plumber <= 0;
    else if (tracy)
      plumber <= 0;
    else if (squad)
      plumber <= flanders;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      odin <= 0;
    else if (barnum)
      odin <= pentium;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      thor <= 0;
    else if (daughter)
      thor <= terrance;
    else if (rocks)
      thor <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jupiter <= 0;
    else if (kdqcens)
      jupiter <= poppyseed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zeus <= 0;
    else if (gnd)
      zeus <= zealot;
    else if (vcc)
      zeus <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      athena <= 0;
    else if (south)
      athena <= 0;
    else if (gnd)
      athena <= often;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      minerva <= 0;
    else if (genesis)
      minerva <= 0;
    else if (athena)
      minerva <= cocacola;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mars <= 0;
    else
      mars <= haze;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      venus <= 0;
    else if (elguapo)
      venus <= 0;
    else if (lamer)
      venus <= yummy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pluto <= 0;
    else if (moreand)
      pluto <= gnd;
    else if (eggsalad)
      pluto <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      neptune <= 0;
    else if (minerva)
      neptune <= 0;
    else if (poppyseed)
      neptune <= ringlingbros;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ariel <= 0;
    else if (cocacola)
      ariel <= 0;
    else if (vcc)
      ariel <= nation;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sebastian <= 0;
    else if (giants)
      sebastian <= gnd;
    else if (moe)
      sebastian <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bach <= 0;
    else if (gnd)
      bach <= comicbook;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mozart <= 0;
    else if (senorduck)
      mozart <= vcc;
    else if (wood)
      mozart <= 0;
  end

// Note - state 1 is unreachable
// Note - state 6 is unreachable
// Note - state 7 is unreachable
// Note - state 8 is unreachable
// State Mek goodmonkey Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goodmonkey <= goodmonkey_0;
    else
      case (goodmonkey)
        goodmonkey_0: begin
          if ({gnd,vcc,vcc,vcc} == 0)
            goodmonkey <= goodmonkey_2;
          else if ({gnd,vcc,vcc,vcc} == 11)
            goodmonkey <= goodmonkey_3;
          else if ({gnd,vcc,vcc,vcc} == 12)
            goodmonkey <= goodmonkey_5;
          else
            goodmonkey <= goodmonkey_0;
          end
        goodmonkey_1: begin
          if ({gnd,vcc,vcc,vcc} == 3)
            goodmonkey <= goodmonkey_11;
          else if ({gnd,vcc,vcc,vcc} == 5)
            goodmonkey <= goodmonkey_5;
          else if ({gnd,vcc,vcc,vcc} == 6)
            goodmonkey <= goodmonkey_8;
          else if ({gnd,vcc,vcc,vcc} == 1)
            goodmonkey <= goodmonkey_10;
          else if ({gnd,vcc,vcc,vcc} == 10)
            goodmonkey <= goodmonkey_5;
          else
            goodmonkey <= goodmonkey_1;
          end
        goodmonkey_2: begin
          if ({gnd,vcc,vcc,vcc} == 9)
            goodmonkey <= goodmonkey_3;
          else if ({gnd,vcc,vcc,vcc} == 10)
            goodmonkey <= goodmonkey_9;
          else if ({gnd,vcc,vcc,vcc} == 5)
            goodmonkey <= goodmonkey_9;
          else
            goodmonkey <= goodmonkey_2;
          end
        goodmonkey_3: begin
          if ({gnd,vcc,vcc,vcc} == 7)
            goodmonkey <= goodmonkey_10;
          else if ({gnd,vcc,vcc,vcc} == 3)
            goodmonkey <= goodmonkey_9;
          else if ({gnd,vcc,vcc,vcc} == 4)
            goodmonkey <= goodmonkey_4;
          else if ({gnd,vcc,vcc,vcc} == 2)
            goodmonkey <= goodmonkey_11;
          else
            goodmonkey <= goodmonkey_3;
          end
        goodmonkey_4: begin
          if ({gnd,vcc,vcc,vcc} == 8)
            goodmonkey <= goodmonkey_10;
          else
            goodmonkey <= goodmonkey_4;
          end
        goodmonkey_5: begin
          if ({gnd,vcc,vcc,vcc} == 6)
            goodmonkey <= goodmonkey_10;
          else if ({gnd,vcc,vcc,vcc} == 14)
            goodmonkey <= goodmonkey_10;
          else
            goodmonkey <= goodmonkey_5;
          end
        goodmonkey_6: begin
          if ({gnd,vcc,vcc,vcc} == 14)
            goodmonkey <= goodmonkey_1;
          else if ({gnd,vcc,vcc,vcc} == 10)
            goodmonkey <= goodmonkey_1;
          else if ({gnd,vcc,vcc,vcc} == 15)
            goodmonkey <= goodmonkey_7;
          else if ({gnd,vcc,vcc,vcc} == 11)
            goodmonkey <= goodmonkey_10;
          else if ({gnd,vcc,vcc,vcc} == 1)
            goodmonkey <= goodmonkey_5;
          else
            goodmonkey <= goodmonkey_6;
          end
        goodmonkey_7: begin
          if ({gnd,vcc,vcc,vcc} == 11)
            goodmonkey <= goodmonkey_4;
          else if ({gnd,vcc,vcc,vcc} == 1)
            goodmonkey <= goodmonkey_9;
          else if ({gnd,vcc,vcc,vcc} == 9)
            goodmonkey <= goodmonkey_5;
          else if ({gnd,vcc,vcc,vcc} == 0)
            goodmonkey <= goodmonkey_11;
          else
            goodmonkey <= goodmonkey_7;
          end
        goodmonkey_8: begin
          if ({gnd,vcc,vcc,vcc} == 2)
            goodmonkey <= goodmonkey_7;
          else
            goodmonkey <= goodmonkey_8;
          end
        goodmonkey_9: begin
          if ({gnd,vcc,vcc,vcc} == 15)
            goodmonkey <= goodmonkey_5;
          else
            goodmonkey <= goodmonkey_9;
          end
        goodmonkey_10: begin
            goodmonkey <= goodmonkey_10;
          end
        goodmonkey_11: begin
          if ({gnd,vcc,vcc,vcc} == 15)
            goodmonkey <= goodmonkey_0;
          else if ({gnd,vcc,vcc,vcc} == 2)
            goodmonkey <= goodmonkey_4;
          else if ({gnd,vcc,vcc,vcc} == 4)
            goodmonkey <= goodmonkey_4;
          else
            goodmonkey <= goodmonkey_11;
          end
        default: goodmonkey <= goodmonkey_0;
      endcase
  end

// State Mek goodmonkey Output logic
always @(goodmonkey)
  begin
    // consider all state regs when doing outputs
    case (goodmonkey)
        goodmonkey_0: begin
            badmonkey = 0;
            guy = 1;
            partners = 1;
            cubish = 0;
            solder = 0;
            valve = 0;
            furnace = 1;
            pilot = 1;
            leaky = 1;
          end
        goodmonkey_1: begin
            badmonkey = 0;
            guy = 0;
            partners = 0;
            cubish = 1;
            solder = 0;
            valve = 1;
            furnace = 1;
            pilot = 0;
            leaky = 0;
          end
        goodmonkey_2: begin
            badmonkey = 0;
            guy = 0;
            partners = 1;
            cubish = 1;
            solder = 1;
            valve = 1;
            furnace = 0;
            pilot = 0;
            leaky = 0;
          end
        goodmonkey_3: begin
            badmonkey = 0;
            guy = 1;
            partners = 1;
            cubish = 1;
            solder = 0;
            valve = 0;
            furnace = 1;
            pilot = 0;
            leaky = 0;
          end
        goodmonkey_4: begin
            badmonkey = 1;
            guy = 0;
            partners = 0;
            cubish = 0;
            solder = 1;
            valve = 0;
            furnace = 0;
            pilot = 1;
            leaky = 1;
          end
        goodmonkey_5: begin
            badmonkey = 1;
            guy = 0;
            partners = 0;
            cubish = 0;
            solder = 1;
            valve = 0;
            furnace = 1;
            pilot = 0;
            leaky = 1;
          end
        goodmonkey_6: begin
            badmonkey = 1;
            guy = 1;
            partners = 0;
            cubish = 0;
            solder = 1;
            valve = 1;
            furnace = 1;
            pilot = 0;
            leaky = 1;
          end
        goodmonkey_7: begin
            badmonkey = 0;
            guy = 1;
            partners = 0;
            cubish = 1;
            solder = 0;
            valve = 0;
            furnace = 1;
            pilot = 1;
            leaky = 0;
          end
        goodmonkey_8: begin
            badmonkey = 1;
            guy = 0;
            partners = 1;
            cubish = 1;
            solder = 0;
            valve = 1;
            furnace = 1;
            pilot = 1;
            leaky = 0;
          end
        goodmonkey_9: begin
            badmonkey = 1;
            guy = 0;
            partners = 1;
            cubish = 0;
            solder = 0;
            valve = 0;
            furnace = 0;
            pilot = 1;
            leaky = 1;
          end
        goodmonkey_10: begin
            badmonkey = 0;
            guy = 0;
            partners = 1;
            cubish = 0;
            solder = 0;
            valve = 0;
            furnace = 1;
            pilot = 1;
            leaky = 0;
          end
        goodmonkey_11: begin
            badmonkey = 1;
            guy = 0;
            partners = 1;
            cubish = 1;
            solder = 1;
            valve = 0;
            furnace = 0;
            pilot = 0;
            leaky = 0;
          end
        default: begin
            badmonkey = 0;
            guy = 1;
            partners = 0;
            cubish = 0;
            solder = 0;
            valve = 0;
            furnace = 1;
            pilot = 0;
            leaky = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire drax_out;
nut_004_lut #(3) nut_004_lut_inst_drax (
  .din({gnd,morrison,contractor}),
  .mask(8'h4b),
  .out(drax_out)
);

always @(drax_out)
begin
   potter = drax_out;
end

// Note - state 8 is unreachable
// State Mek moonraker Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moonraker <= moonraker_0;
    else
      case (moonraker)
        moonraker_0: begin
          if ({morrison,shemp,furnace,gnd} == 4)
            moonraker <= moonraker_1;
          else
            moonraker <= moonraker_0;
          end
        moonraker_1: begin
          if ({morrison,shemp,furnace,gnd} == 3)
            moonraker <= moonraker_0;
          else if ({morrison,shemp,furnace,gnd} == 1)
            moonraker <= moonraker_9;
          else if ({morrison,shemp,furnace,gnd} == 8)
            moonraker <= moonraker_5;
          else if ({morrison,shemp,furnace,gnd} == 11)
            moonraker <= moonraker_6;
          else
            moonraker <= moonraker_1;
          end
        moonraker_2: begin
            moonraker <= moonraker_2;
          end
        moonraker_3: begin
          if ({morrison,shemp,furnace,gnd} == 9)
            moonraker <= moonraker_1;
          else if ({morrison,shemp,furnace,gnd} == 13)
            moonraker <= moonraker_9;
          else if ({morrison,shemp,furnace,gnd} == 12)
            moonraker <= moonraker_4;
          else if ({morrison,shemp,furnace,gnd} == 10)
            moonraker <= moonraker_5;
          else if ({morrison,shemp,furnace,gnd} == 0)
            moonraker <= moonraker_0;
          else
            moonraker <= moonraker_3;
          end
        moonraker_4: begin
          if ({morrison,shemp,furnace,gnd} == 4)
            moonraker <= moonraker_0;
          else if ({morrison,shemp,furnace,gnd} == 2)
            moonraker <= moonraker_9;
          else
            moonraker <= moonraker_4;
          end
        moonraker_5: begin
          if ({morrison,shemp,furnace,gnd} == 1)
            moonraker <= moonraker_3;
          else if ({morrison,shemp,furnace,gnd} == 7)
            moonraker <= moonraker_7;
          else if ({morrison,shemp,furnace,gnd} == 0)
            moonraker <= moonraker_0;
          else if ({morrison,shemp,furnace,gnd} == 15)
            moonraker <= moonraker_3;
          else
            moonraker <= moonraker_5;
          end
        moonraker_6: begin
          if ({morrison,shemp,furnace,gnd} == 0)
            moonraker <= moonraker_7;
          else
            moonraker <= moonraker_6;
          end
        moonraker_7: begin
          if ({morrison,shemp,furnace,gnd} == 9)
            moonraker <= moonraker_6;
          else if ({morrison,shemp,furnace,gnd} == 12)
            moonraker <= moonraker_3;
          else if ({morrison,shemp,furnace,gnd} == 8)
            moonraker <= moonraker_3;
          else if ({morrison,shemp,furnace,gnd} == 5)
            moonraker <= moonraker_0;
          else if ({morrison,shemp,furnace,gnd} == 6)
            moonraker <= moonraker_0;
          else if ({morrison,shemp,furnace,gnd} == 13)
            moonraker <= moonraker_4;
          else
            moonraker <= moonraker_7;
          end
        moonraker_8: begin
          if ({morrison,shemp,furnace,gnd} == 10)
            moonraker <= moonraker_5;
          else
            moonraker <= moonraker_8;
          end
        moonraker_9: begin
          if ({morrison,shemp,furnace,gnd} == 14)
            moonraker <= moonraker_2;
          else if ({morrison,shemp,furnace,gnd} == 4)
            moonraker <= moonraker_5;
          else
            moonraker <= moonraker_9;
          end
        default: moonraker <= moonraker_0;
      endcase
  end

// State Mek moonraker Output logic
always @(moonraker)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (moonraker)
        moonraker_0: begin
            killme = 1;
            tyycensor = 0;
            sortout = 0;
            sgates = 0;
            atoms = 0;
            thankee = 0;
            wakey = 0;
            ants = 0;
            dig = 0;
            ladder = 0;
            wrecker = 1;
            dumptruck = 0;
            dumbarton = 0;
          end
        moonraker_1: begin
            killme = 0;
            tyycensor = 1;
            sortout = 0;
            sgates = 0;
            atoms = 0;
            thankee = 0;
            wakey = 0;
            ants = 0;
            dig = 0;
            ladder = 0;
            wrecker = 0;
            dumptruck = 1;
            dumbarton = 0;
          end
        moonraker_2: begin
            killme = 0;
            tyycensor = 0;
            sortout = 1;
            sgates = 0;
            atoms = 0;
            thankee = 0;
            wakey = 0;
            ants = 0;
            dig = 0;
            ladder = 0;
            wrecker = 1;
            dumptruck = 1;
            dumbarton = 0;
          end
        moonraker_3: begin
            killme = 1;
            tyycensor = 1;
            sortout = 0;
            sgates = 0;
            atoms = 0;
            thankee = 1;
            wakey = 1;
            ants = 1;
            dig = 1;
            ladder = 0;
            wrecker = 1;
            dumptruck = 1;
            dumbarton = 0;
          end
        moonraker_4: begin
            killme = 0;
            tyycensor = 0;
            sortout = 0;
            sgates = 0;
            atoms = 1;
            thankee = 0;
            wakey = 0;
            ants = 0;
            dig = 0;
            ladder = 0;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
          end
        moonraker_5: begin
            killme = 0;
            tyycensor = 0;
            sortout = 0;
            sgates = 0;
            atoms = 0;
            thankee = 1;
            wakey = 0;
            ants = 0;
            dig = 0;
            ladder = 0;
            wrecker = 0;
            dumptruck = 1;
            dumbarton = 1;
          end
        moonraker_6: begin
            killme = 0;
            tyycensor = 0;
            sortout = 0;
            sgates = 0;
            atoms = 0;
            thankee = 0;
            wakey = 1;
            ants = 0;
            dig = 0;
            ladder = 0;
            wrecker = 1;
            dumptruck = 0;
            dumbarton = 1;
          end
        moonraker_7: begin
            killme = 0;
            tyycensor = 0;
            sortout = 0;
            sgates = 0;
            atoms = 0;
            thankee = 0;
            wakey = 0;
            ants = 1;
            dig = 0;
            ladder = 0;
            wrecker = 1;
            dumptruck = 1;
            dumbarton = 1;
          end
        moonraker_8: begin
            killme = 0;
            tyycensor = 0;
            sortout = 0;
            sgates = 1;
            atoms = 0;
            thankee = 1;
            wakey = 1;
            ants = 0;
            dig = 1;
            ladder = 0;
            wrecker = 1;
            dumptruck = 1;
            dumbarton = 0;
          end
        moonraker_9: begin
            killme = 0;
            tyycensor = 0;
            sortout = 0;
            sgates = 0;
            atoms = 0;
            thankee = 0;
            wakey = 0;
            ants = 0;
            dig = 0;
            ladder = 1;
            wrecker = 1;
            dumptruck = 1;
            dumbarton = 1;
          end
        default: begin
            killme = 1;
            tyycensor = 1;
            sortout = 1;
            sgates = 1;
            atoms = 0;
            thankee = 0;
            wakey = 0;
            ants = 0;
            dig = 0;
            ladder = 0;
            wrecker = 0;
            dumptruck = 0;
            dumbarton = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire egg_out;
nut_004_lut #(3) nut_004_lut_inst_egg (
  .din({ants,happy,gnd}),
  .mask(8'b10001000),
  .out(egg_out)
);

always @(egg_out)
begin
   golden = egg_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire rodent_out;
nut_004_lut #(6) nut_004_lut_inst_rodent (
  .din({winner,steaming,hotel,deuce,gnd,iwocensor}),
  .mask(64'h81f2e6ca0e33ae1e),
  .out(rodent_out)
);

always @(rodent_out)
begin
   tofu = rodent_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire whiteboard_out;
nut_004_lut #(6) nut_004_lut_inst_whiteboard (
  .din({square,dig,crunchyfrog,eeevil,timingmodel,leaky}),
  .mask(64'h84e9eb54fe97b692),
  .out(whiteboard_out)
);

always @(whiteboard_out)
begin
   billnted = whiteboard_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire fitter_out;
nut_004_lut #(3) nut_004_lut_inst_fitter (
  .din({brothers,gnd,south}),
  .mask(8'hcc),
  .out(fitter_out)
);

always @(fitter_out)
begin
   synthesis = fitter_out;
end

reg feedback_pt_144;

always @(weevil or feedback_pt_144)
  begin
      dingbat = !weevil &  feedback_pt_144;
  end

reg feedback_pt_145;

always @(vcc or feedback_pt_145)
  begin
      sweetie = !vcc | !feedback_pt_145;
  end

reg feedback_pt_146;

always @(hiway or feedback_pt_146)
  begin
      wiggles =  hiway | !feedback_pt_146;
  end

reg feedback_pt_147;

always @(speeding or feedback_pt_147)
  begin
      wanton =  speeding ^  feedback_pt_147;
  end

reg feedback_pt_148;

always @(gnd or feedback_pt_148)
  begin
      rewire = !gnd |  feedback_pt_148;
  end

reg feedback_pt_149;

always @(psucensorc or feedback_pt_149)
  begin
      thread = !psucensorc ^  feedback_pt_149;
  end

reg feedback_pt_150;

always @(bloom or feedback_pt_150)
  begin
      suffering =  bloom ^  feedback_pt_150;
  end

reg feedback_pt_151;

always @(peopleeater or feedback_pt_151)
  begin
      art = !peopleeater ^  feedback_pt_151;
  end

reg feedback_pt_152;

always @(ramone or feedback_pt_152)
  begin
      vegas =  ramone |  feedback_pt_152;
  end

reg feedback_pt_153;

always @(efficiency or feedback_pt_153)
  begin
      tamago = !efficiency ^  feedback_pt_153;
  end

reg feedback_pt_154;

always @(synthesis or feedback_pt_154)
  begin
      tuna =  synthesis ^ !feedback_pt_154;
  end

reg feedback_pt_155;

always @(marge or feedback_pt_155)
  begin
      salmon = !marge | !feedback_pt_155;
  end

reg feedback_pt_156;

always @(vcc or feedback_pt_156)
  begin
      sake = !vcc ^  feedback_pt_156;
  end

reg feedback_pt_157;

always @(thor or feedback_pt_157)
  begin
      ritsu =  thor &  feedback_pt_157;
  end

reg feedback_pt_158;

always @(vcc or feedback_pt_158)
  begin
      ebi = !vcc & !feedback_pt_158;
  end

reg feedback_pt_159;

always @(happyists or feedback_pt_159)
  begin
      shrimp = !happyists ^ !feedback_pt_159;
  end

reg feedback_pt_160;

always @(yummy or feedback_pt_160)
  begin
      rainbow =  yummy ^ !feedback_pt_160;
  end

reg feedback_pt_161;

always @(solder or feedback_pt_161)
  begin
      tako =  solder ^  feedback_pt_161;
  end

reg feedback_pt_162;

always @(gnd or feedback_pt_162)
  begin
      octapus = !gnd ^  feedback_pt_162;
  end

reg feedback_pt_163;

always @(blanket or feedback_pt_163)
  begin
      hamachi = !blanket ^ !feedback_pt_163;
  end

reg feedback_pt_164;

always @(ritsu or feedback_pt_164)
  begin
      yellowtail =  ritsu | !feedback_pt_164;
  end

reg feedback_pt_165;

always @(salmon or feedback_pt_165)
  begin
      kana = !salmon & !feedback_pt_165;
  end

reg feedback_pt_166;

always @(testyour or feedback_pt_166)
  begin
      crab =  testyour &  feedback_pt_166;
  end

reg feedback_pt_167;

always @(gnd or feedback_pt_167)
  begin
      nigiri =  gnd |  feedback_pt_167;
  end

reg feedback_pt_168;

always @(peopleeater or feedback_pt_168)
  begin
      handroll = !peopleeater |  feedback_pt_168;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      maki <= 0;
    else if (smithers)
      maki <= octapus;
    else if (thread)
      maki <= 0;
  end

always @(maki)
  begin
      feedback_pt_144 = maki;
  end

always @(maki)
  begin
      feedback_pt_145 = maki;
  end

always @(maki)
  begin
      feedback_pt_146 = maki;
  end

always @(maki)
  begin
      feedback_pt_147 = maki;
  end

always @(maki)
  begin
      feedback_pt_148 = maki;
  end

wire roe_wire;

dffea roe_ff (
  .clk(clock0),
  .d(crab),
  .ena(tako),
  .adata(thread),
  .clrn(!reset0),
  .q(roe_wire)
);

always @(roe_wire) begin
   tobiko = roe_wire;
end

always @(tobiko)
  begin
      feedback_pt_149 = tobiko;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kappa <= 1;
    else
      kappa <= vcc;
  end

always @(kappa)
  begin
      feedback_pt_150 = kappa;
  end

always @(kappa)
  begin
      feedback_pt_151 = kappa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cucumber <= 0;
    else if (bach)
      cucumber <= goofy;
    else if (chainsaw)
      cucumber <= 0;
  end

always @(cucumber)
  begin
      feedback_pt_152 = cucumber;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      california <= 0;
    else if (vegas)
      california <= odin;
  end

always @(california)
  begin
      feedback_pt_153 = california;
  end

always @(california)
  begin
      feedback_pt_154 = california;
  end

always @(california)
  begin
      feedback_pt_155 = california;
  end

always @(california)
  begin
      feedback_pt_156 = california;
  end

always @(california)
  begin
      feedback_pt_157 = california;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ebay <= 0;
    else if (chewbacca)
      ebay <= 0;
    else if (vcc)
      ebay <= vcc;
  end

always @(ebay)
  begin
      feedback_pt_158 = ebay;
  end

always @(ebay)
  begin
      feedback_pt_159 = ebay;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      covad <= 0;
    else if (gnd)
      covad <= notalot;
  end

always @(covad)
  begin
      feedback_pt_160 = covad;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      exodus <= 0;
    else if (gnd)
      exodus <= 0;
    else if (senorduck)
      exodus <= octapus;
  end

always @(exodus)
  begin
      feedback_pt_161 = exodus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      abovenet <= 1;
    else
      abovenet <= heidi;
  end

always @(abovenet)
  begin
      feedback_pt_162 = abovenet;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      webvan <= 0;
    else if (rasp)
      webvan <= raiders;
    else if (joseph)
      webvan <= 0;
  end

always @(webvan)
  begin
      feedback_pt_163 = webvan;
  end

wire sears_wire;

dffeas sears_ff (
  .clk(clock0),
  .d(fanatical),
  .ena(tyycensor),
  .sclr(tunafish),
  .sload(bloom),
  .asdata(peopleeater),
  .clrn(!reset0),
  .q(sears_wire)
);

always @(sears_wire) begin
   lucent = sears_wire;
end

always @(lucent)
  begin
      feedback_pt_164 = lucent;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ibm <= 0;
    else if (cryptic)
      ibm <= ohno;
    else if (timmy)
      ibm <= 0;
  end

always @(ibm)
  begin
      feedback_pt_165 = ibm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      intel <= 0;
    else if (vcc)
      intel <= expects_the;
  end

always @(intel)
  begin
      feedback_pt_166 = intel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hp <= 0;
    else
      hp <= wiggles;
  end

always @(hp)
  begin
      feedback_pt_167 = hp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gm <= 0;
    else if (dumbarton)
      gm <= vcc;
  end

always @(gm)
  begin
      feedback_pt_168 = gm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ford <= 0;
    else if (homerun)
      ford <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chevys <= 0;
    else if (tofu)
      chevys <= atoms;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chillis <= 0;
    else if (gnd)
      chillis <= gnd;
  end

wire macdonalds_wire;

dffeas macdonalds_ff (
  .clk(clock0),
  .d(excellent),
  .ena(vcc),
  .sclr(sweetie),
  .sload(vcc),
  .asdata(cocacola),
  .clrn(!reset0),
  .q(macdonalds_wire)
);

always @(macdonalds_wire) begin
   lockheed = macdonalds_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      martin <= 0;
    else if (zeus)
      martin <= cucumber;
  end

wire marvin_wire;

dffeas marvin_ff (
  .clk(clock0),
  .d(gnd),
  .ena(webvan),
  .sclr(suffering),
  .sload(partners),
  .asdata(vcc),
  .clrn(!reset0),
  .q(marvin_wire)
);

always @(marvin_wire) begin
   martian = marvin_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      molokai <= 0;
    else
      molokai <= oranges;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      amex <= 0;
    else
      amex <= lamer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nasdaq <= 0;
    else if (hp)
      nasdaq <= gnd;
    else if (golden)
      nasdaq <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dow <= 0;
    else
      dow <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      taoist <= 1;
    else
      taoist <= snuffleupagus;
  end

wire liberace_wire;

dffeas liberace_ff (
  .clk(clock0),
  .d(hp),
  .ena(noyoudirty),
  .sclr(chairman),
  .sload(gnd),
  .asdata(kappa),
  .clrn(!reset0),
  .q(liberace_wire)
);

always @(liberace_wire) begin
   microsoft = liberace_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sun <= 0;
    else if (sake)
      sun <= 0;
    else if (jason)
      sun <= jxnbox;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oracle <= 0;
    else if (geisha)
      oracle <= vcc;
    else if (guy)
      oracle <= 0;
  end

wire bfi_wire;

dffeas bfi_ff (
  .clk(clock0),
  .d(speeding),
  .ena(sortout),
  .sclr(vcc),
  .sload(greenbay),
  .asdata(po),
  .clrn(!reset0),
  .q(bfi_wire)
);

always @(bfi_wire) begin
   century = bfi_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      harrydavid <= 0;
    else if (gnd)
      harrydavid <= 0;
    else if (suffering)
      harrydavid <= tofu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      safeway <= 0;
    else if (ariel)
      safeway <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pepsi <= 0;
    else
      pepsi <= weapons;
  end

wire pacbell_wire;

dffeas pacbell_ff (
  .clk(clock0),
  .d(love_in),
  .ena(england),
  .sclr(amex),
  .sload(thankee),
  .asdata(vcc),
  .clrn(!reset0),
  .q(pacbell_wire)
);

always @(pacbell_wire) begin
   att = pacbell_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tsmc <= 0;
    else if (bert)
      tsmc <= on_sale;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bathbody <= 0;
    else if (gnd)
      bathbody <= on_sale;
    else if (mexico)
      bathbody <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      papyrus <= 0;
    else if (dow)
      papyrus <= 0;
    else if (nhtcenso)
      papyrus <= todd;
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      macys <= 0;
    else
    case ({jupiter,qfvcensorce})
       0 : macys <= snuffleupagus;
       1 : macys <= macys;
       2 : macys <= macys;
       3 : macys <= macys;
       default : macys <= 0;
    endcase
  end

// NAND all of these bits together
always @(greenland or inspection or nigiri or furnace or plumber or vcc)
  begin
      sharperimg = ~& {greenland,inspection,nigiri,furnace,plumber,vcc};
  end

// 9 bit priority MUX
always @(
        chairman or martian  or 
        moreand or shrimp  or 
        nation or krabapple  or 
        papyrus or sharperimg  or 
        martian or genesis  or 
        surfer or ebay  or 
        gotone or covad  or 
        vcc or art  or 
        sun or issac 
)

  begin
    if (chairman) mitsubishi = martian;
    else if (moreand) mitsubishi = shrimp;
    else if (nation) mitsubishi = krabapple;
    else if (papyrus) mitsubishi = sharperimg;
    else if (martian) mitsubishi = genesis;
    else if (surfer) mitsubishi = ebay;
    else if (gotone) mitsubishi = covad;
    else if (vcc) mitsubishi = art;
    else if (sun) mitsubishi = issac;
    else mitsubishi = 0;
  end

// NOR all of these bits together
always @(hamachi or hoser or gnd or kappa or vcc or vegan or ring or vcc or att or dingbat)
  begin
      honda = ~| {hamachi,hoser,gnd,kappa,vcc,vegan,ring,vcc,att,dingbat};
  end

// 8 bit priority MUX
always @(
        crunchyfrog or clubsandwich  or 
        marge or elguapo  or 
        safeway or davidlin  or 
        larry or sweetie  or 
        terrance or ibm  or 
        gnd or kdqcens  or 
        hp or china  or 
        gnd or wakey 
)

  begin
    if (crunchyfrog) pimpernel = clubsandwich;
    else if (marge) pimpernel = elguapo;
    else if (safeway) pimpernel = davidlin;
    else if (larry) pimpernel = sweetie;
    else if (terrance) pimpernel = ibm;
    else if (gnd) pimpernel = kdqcens;
    else if (hp) pimpernel = china;
    else if (gnd) pimpernel = wakey;
    else pimpernel = 0;
  end

// AND all of these bits together
always @(tobiko or vcc or vcc or martin or ebi or elementary or yellowtail or vcc)
  begin
      kbtoys = & {tobiko,vcc,vcc,martin,ebi,elementary,yellowtail,vcc};
  end

// 2 bit SOP selector
always @(
        marco or fruitcake  or 
        pimpernel or maki 
)

begin
    toysrus = 
      marco & fruitcake |
      pimpernel & maki;
end

// 5 bit SOP selector
always @(
        valve or issac  or 
        cubish or lucent  or 
        inspection or oranges  or 
        pepsi or gnd  or 
        toysrus or handroll 
)

begin
    gap = 
      valve & issac |
      cubish & lucent |
      inspection & oranges |
      pepsi & gnd |
      toysrus & handroll;
end

// XNOR all of these bits together
always @(inquisition or waster or legos or gnd or art or kbtoys or safeway or venus)
  begin
      bananarep = ~^ {inquisition,waster,legos,gnd,art,kbtoys,safeway,venus};
  end

// Greater Equal Less compare
always @(opus or macys or winner or vcc or barney or gnd or gnd or dreamcoat or elementary or inquisition or abovenet or killme or larry or gnd or vcc or pyromaniac)
  begin
    if ({opus,macys,winner,vcc,barney,gnd,gnd,dreamcoat} > {elementary,inquisition,abovenet,killme,larry,gnd,vcc,pyromaniac})
       {oldnavy,clothing,starbucks} = 3'b100;
    else if ({opus,macys,winner,vcc,barney,gnd,gnd,dreamcoat} < {elementary,inquisition,abovenet,killme,larry,gnd,vcc,pyromaniac})
       {oldnavy,clothing,starbucks} = 3'b010;
    else
       {oldnavy,clothing,starbucks} = 3'b001;
  end


initial begin
    {coffee,structure,jcrew,whatelse,blessyou} = 0;
end

// Registered 5 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (cubish)
      {coffee,structure,jcrew,whatelse,blessyou} <= 0;
    else if (excellent)
      {coffee,structure,jcrew,whatelse,blessyou} <=
		  {oracle,joseph,intel,crunchyfrog,floride};
    else
      {coffee,structure,jcrew,whatelse,blessyou} <=
		 {elkarchmero,gnd,gnd,gnd,north} + 
		 {rainbow,gnd,cubish,vcc,wanton};
  end

// NAND all of these bits together
always @(vcc or vcc or vcc or tako or floride)
  begin
      kerchoozle = ~& {vcc,vcc,vcc,tako,floride};
  end

// 7 bit priority MUX
always @(
        century or gnd  or 
        clubsandwich or nasdaq  or 
        hercules or marge  or 
        oldnavy or vcc  or 
        gnd or floride  or 
        floride or molokai  or 
        chillis or lockheed 
)

  begin
    if (century) atchoo = gnd;
    else if (clubsandwich) atchoo = nasdaq;
    else if (hercules) atchoo = marge;
    else if (oldnavy) atchoo = vcc;
    else if (gnd) atchoo = floride;
    else if (floride) atchoo = molokai;
    else if (chillis) atchoo = lockheed;
    else atchoo = 0;
  end


// building a 64 to 1 MUX operator
reg [63:0] siamese_mux_dat;
reg [5:0] siamese_mux_sel;
always @(gnd or gnd or vcc or marge or vcc or mozart or mars or exodus or oldnavy or gnd or faster or terrance or zeus or gm or atchoo or skinner or gnd or vcc or tobiko or yummy or whatelse or starbucks or structure or zipporah or gnd or legos or vcc or gnd or cubish or roid or octapus or wrecker or vcc or elguapo or remus or taoist or devotion or dinoblaster or pluto or gnd or abovenet or chevys or hamachi or vcc or vcc or vcc or vcc or tsmc or lockheed or billnted or hp or roid or callme or tsmc or mozart or vcc or vcc or yoku or nyc or coffee or rewire or gnd or opus or salmon)
  begin
    siamese_mux_dat = {gnd,gnd,vcc,marge,vcc,mozart,mars,exodus,oldnavy,gnd,faster,terrance,zeus,gm,atchoo,skinner,gnd,vcc,tobiko,yummy,whatelse,starbucks,structure,zipporah,gnd,legos,vcc,gnd,cubish,roid,octapus,wrecker,vcc,elguapo,remus,taoist,devotion,dinoblaster,pluto,gnd,abovenet,chevys,hamachi,vcc,vcc,vcc,vcc,tsmc,lockheed,billnted,hp,roid,callme,tsmc,mozart,vcc,vcc,yoku,nyc,coffee,rewire,gnd,opus,salmon};
  end

always @(jcrew or badmonkey or vcc or gnd or webvan or vcc)
  begin
    siamese_mux_sel = {jcrew,badmonkey,vcc,gnd,webvan,vcc};
  end

always @(siamese_mux_dat or siamese_mux_sel)
  begin
    tabby = siamese_mux_dat[siamese_mux_sel];
  end

// Random 6 input look up table
always @(macys or batman or bathbody or incompetent or speeding or bananarep)
  begin
    casex ({macys,batman,bathbody,incompetent,speeding,bananarep})
      0: notsure=0;
      1: notsure=1;
      2: notsure=1;
      3: notsure=1;
      4: notsure=1;
      5: notsure=1;
      6: notsure=1;
      7: notsure=0;
      8: notsure=0;
      9: notsure=0;
      10: notsure=0;
      11: notsure=1;
      12: notsure=1;
      13: notsure=0;
      14: notsure=1;
      15: notsure=0;
      16: notsure=0;
      17: notsure=1;
      18: notsure=0;
      19: notsure=0;
      20: notsure=1;
      21: notsure=1;
      22: notsure=1;
      23: notsure=0;
      24: notsure=1;
      25: notsure=1;
      26: notsure=1;
      27: notsure=0;
      28: notsure=0;
      29: notsure=0;
      30: notsure=1;
      31: notsure=0;
      32: notsure=1;
      33: notsure=1;
      34: notsure=0;
      35: notsure=1;
      36: notsure=0;
      37: notsure=0;
      38: notsure=0;
      39: notsure=0;
      40: notsure=1;
      41: notsure=0;
      42: notsure=1;
      43: notsure=0;
      44: notsure=1;
      45: notsure=1;
      46: notsure=1;
      47: notsure=0;
      48: notsure=0;
      49: notsure=0;
      50: notsure=1;
      51: notsure=1;
      52: notsure=1;
      53: notsure=1;
      54: notsure=1;
      55: notsure=0;
      56: notsure=1;
      57: notsure=0;
      58: notsure=0;
      59: notsure=0;
      60: notsure=0;
      61: notsure=1;
      62: notsure=1;
      63: notsure=1;
      default: notsure=0;
    endcase
  end

// NAND all of these bits together
always @(gnd or gnd or knockout or vcc or yummy or weapons or rewire or vcc or ford)
  begin
      monster = ~& {gnd,gnd,knockout,vcc,yummy,weapons,rewire,vcc,ford};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      incagardens <= 0;
    else
    case ({hp,gnd})
       0 : incagardens <= legos;
       1 : incagardens <= vcc;
       2 : incagardens <= incagardens;
       3 : incagardens <= killme;
       default : incagardens <= 0;
    endcase
  end


initial begin
    {genji,lafondue,subway,pasta} = 0;
end

// Registered 4 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (senorduck)
      {genji,lafondue,subway,pasta} <= 0;
    else if (notsure)
      {genji,lafondue,subway,pasta} <=
		  {gnd,pilot,yellowtail,gm};
    else
      {genji,lafondue,subway,pasta} <=
		 {vcc,greenland,greenland,dinoblaster} + 
		 {martian,vcc,harrydavid,hercules};
  end

reg feedback_pt_169;

always @(faster or feedback_pt_169)
  begin
      pomodoro =  faster ^  feedback_pt_169;
  end

reg feedback_pt_170;

always @(clothing or feedback_pt_170)
  begin
      puttanesca = !clothing ^  feedback_pt_170;
  end

reg feedback_pt_171;

always @(vcc or feedback_pt_171)
  begin
      golfland = !vcc & !feedback_pt_171;
  end

reg feedback_pt_172;

always @(vcc or feedback_pt_172)
  begin
      arcade =  vcc ^ !feedback_pt_172;
  end

reg feedback_pt_173;

always @(pomodoro or feedback_pt_173)
  begin
      jacuzzi =  pomodoro & !feedback_pt_173;
  end

reg feedback_pt_174;

always @(zealot or feedback_pt_174)
  begin
      blaster = !zealot |  feedback_pt_174;
  end

reg feedback_pt_175;

always @(vcc or feedback_pt_175)
  begin
      bonker = !vcc &  feedback_pt_175;
  end

reg feedback_pt_176;

always @(atchoo or feedback_pt_176)
  begin
      beemer =  atchoo ^  feedback_pt_176;
  end

reg feedback_pt_177;

always @(oranges or feedback_pt_177)
  begin
      bono = !oranges |  feedback_pt_177;
  end

reg feedback_pt_178;

always @(vcc or feedback_pt_178)
  begin
      concorde =  vcc & !feedback_pt_178;
  end

reg feedback_pt_179;

always @(south or feedback_pt_179)
  begin
      stemcell = !south ^  feedback_pt_179;
  end

reg feedback_pt_180;

always @(stemcell or feedback_pt_180)
  begin
      shark = !stemcell ^  feedback_pt_180;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      carolina <= 0;
    else if (microsoft)
      carolina <= edible;
    else if (nhtcenso)
      carolina <= 0;
  end

always @(carolina)
  begin
      feedback_pt_169 = carolina;
  end

always @(carolina)
  begin
      feedback_pt_170 = carolina;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      avon <= 1;
    else
      avon <= hercules;
  end

always @(avon)
  begin
      feedback_pt_171 = avon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bomb <= 1;
    else
      bomb <= socialist;
  end

always @(bomb)
  begin
      feedback_pt_172 = bomb;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      school <= 1;
    else
      school <= touch;
  end

always @(school)
  begin
      feedback_pt_173 = school;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cornell <= 1;
    else
      cornell <= tabby;
  end

always @(cornell)
  begin
      feedback_pt_174 = cornell;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      soccer <= 0;
    else if (tukatuk)
      soccer <= surprise;
    else if (kappa)
      soccer <= 0;
  end

always @(soccer)
  begin
      feedback_pt_175 = soccer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      softball <= 1;
    else
      softball <= blessyou;
  end

always @(softball)
  begin
      feedback_pt_176 = softball;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fieldhockey <= 0;
    else
      fieldhockey <= bonker;
  end

always @(fieldhockey)
  begin
      feedback_pt_177 = fieldhockey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nirish <= 0;
    else if (elkarchmero)
      nirish <= blaster;
    else if (gnd)
      nirish <= 0;
  end

always @(nirish)
  begin
      feedback_pt_178 = nirish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peace <= 0;
    else
      peace <= jcrew;
  end

always @(peace)
  begin
      feedback_pt_179 = peace;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mideast <= 0;
    else if (honda)
      mideast <= dipsy;
    else if (kerchoozle)
      mideast <= 0;
  end

always @(mideast)
  begin
      feedback_pt_180 = mideast;
  end

wire illegal_wire;

dffeas illegal_ff (
  .clk(clock0),
  .d(blaster),
  .ena(neptune),
  .sclr(vcc),
  .sload(vcc),
  .asdata(kerchoozle),
  .clrn(!reset0),
  .q(illegal_wire)
);

always @(illegal_wire) begin
   drugs = illegal_wire;
end

wire infesting_wire;

dffeas infesting_ff (
  .clk(clock0),
  .d(killme),
  .ena(firemonkey),
  .sclr(nirish),
  .sload(gnd),
  .asdata(carolina),
  .clrn(!reset0),
  .q(infesting_wire)
);

always @(infesting_wire) begin
   children = infesting_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crank <= 0;
    else
      crank <= stemcell;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marijuana <= 0;
    else if (gnd)
      marijuana <= lockheed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lsd <= 0;
    else
      lsd <= gnd;
  end

wire acid_wire;

dffeas acid_ff (
  .clk(clock0),
  .d(inspection),
  .ena(gnd),
  .sclr(tabby),
  .sload(joseph),
  .asdata(guy),
  .clrn(!reset0),
  .q(acid_wire)
);

always @(acid_wire) begin
   crack = acid_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      speed <= 0;
    else if (concorde)
      speed <= 0;
    else if (pluto)
      speed <= tukatuk;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      meth <= 1;
    else
      meth <= waster;
  end

// Vanilla tristate output pin
  bufif1 (crystal,!hamachi, whatelse);  // output,dat,oe

// Priority MUX built out of tri buffers;
// None-hot is Z, conflict not possible
  wire [3:0] uppers_dat = {marijuana,gnd,tamago};
  wire [3:0] uppers_sel = {pyro,children,gnd};
  wire [3:0] uppers_ohsel;

  assign uppers_ohsel[0] = uppers_sel[0];
  assign uppers_ohsel[1] = uppers_sel[1] & !uppers_ohsel[0];
  assign uppers_ohsel[2] = uppers_sel[2] & !uppers_ohsel[1] & !uppers_ohsel[0];

  bufif0 (uppers, uppers_dat[0],!uppers_ohsel[0]);
  bufif0 (uppers, uppers_dat[1],!uppers_ohsel[1]);
  bufif1 (uppers,!uppers_dat[2], uppers_ohsel[2]);

// Tristate output pin with reg feedback
  bufif0 (downers,!barney, pluto);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(pluto or downers) begin
    if (!pluto) viagra = !downers;
    else viagra = gnd;
end

// Internal TRI bus MUX built out of tri buffers;
// Z and conflict not possible
  tri yohimbe_tri;
  wire [5:0] yohimbe_dat = {edible,crack,vcc,vcc,art};
  wire [5:0] yohimbe_sel = {vegan,mitsubishi,bomb,clothing,hamachi};
  wire [5:0] yohimbe_ohsel;
  wire yohimbe_def;

  assign yohimbe_ohsel[0] = yohimbe_sel[0];
  assign yohimbe_ohsel[1] = yohimbe_sel[1] & !yohimbe_ohsel[0];
  assign yohimbe_ohsel[2] = yohimbe_sel[2] & !yohimbe_ohsel[1] & !yohimbe_ohsel[0];
  assign yohimbe_ohsel[3] = yohimbe_sel[3] & !yohimbe_ohsel[2] & !yohimbe_ohsel[1] & !yohimbe_ohsel[0];
  assign yohimbe_ohsel[4] = yohimbe_sel[4] & !yohimbe_ohsel[3] & !yohimbe_ohsel[2] & !yohimbe_ohsel[1] & !yohimbe_ohsel[0];

  assign yohimbe_def = 
     !yohimbe_ohsel[0] & !yohimbe_ohsel[1] & !yohimbe_ohsel[2] & !yohimbe_ohsel[3] & !yohimbe_ohsel[4];

  // onehot tristate MUX
  bufif0 (yohimbe_tri, yohimbe_dat[0],!yohimbe_ohsel[0]);
  bufif0 (yohimbe_tri,!yohimbe_dat[1],!yohimbe_ohsel[1]);
  bufif1 (yohimbe_tri,!yohimbe_dat[2], yohimbe_ohsel[2]);
  bufif0 (yohimbe_tri,!yohimbe_dat[3],!yohimbe_ohsel[3]);
  bufif0 (yohimbe_tri, yohimbe_dat[4],!yohimbe_ohsel[4]);

  // default value for none-hot
  bufif1 (yohimbe_tri,vcc,yohimbe_def);
  always @(yohimbe_tri) begin
    yohimbe = yohimbe_tri;
  end

always @(neptune)
  begin
      decongestant = !neptune;
  end

always @(vcc)
  begin
      nyquil = !vcc;
  end

always @(gnd)
  begin
      dimetap = !gnd;
  end

always @(kana)
  begin
      coughsyrup = !kana;
  end

always @(gnd)
  begin
      vicks = !gnd;
  end

always @(abel)
  begin
      comtrex = !abel;
  end

always @(weapons)
  begin
      aspirin = !weapons;
  end

always @(gnd)
  begin
      advil = !gnd;
  end

always @(bono)
  begin
      naproxen = !bono;
  end

always @(gnd)
  begin
      tylenol = !gnd;
  end

always @(kappa)
  begin
      sinus = !kappa;
  end

always @(vcc)
  begin
      sinew = !vcc;
  end

always @(opus)
  begin
      snort = !opus;
  end

always @(nyquil)
  begin
      pcp = !nyquil;
  end

always @(naproxen)
  begin
      phenyalanine = !naproxen;
  end

always @(tylenol)
  begin
      saccarine = !tylenol;
  end

always @(vcc)
  begin
      nutrasweet = !vcc;
  end

always @(gnd)
  begin
      sugar = !gnd;
  end

always @(avon)
  begin
      honey = !avon;
  end

always @(blessyou)
  begin
      rose = !blessyou;
  end

always @(foryou)
  begin
      foliage = !foryou;
  end

always @(gnd)
  begin
      defoliant = !gnd;
  end

reg feedback_pt_181;

always @(pcp or feedback_pt_181)
  begin
      exfoliant =  pcp | !feedback_pt_181;
  end

reg feedback_pt_182;

always @(gnd or feedback_pt_182)
  begin
      curious =  gnd &  feedback_pt_182;
  end

reg feedback_pt_183;

always @(gnd or feedback_pt_183)
  begin
      george = !gnd ^  feedback_pt_183;
  end

reg feedback_pt_184;

always @(inquisition or feedback_pt_184)
  begin
      balloon =  inquisition | !feedback_pt_184;
  end

reg feedback_pt_185;

always @(gnd or feedback_pt_185)
  begin
      robust = !gnd ^  feedback_pt_185;
  end

reg feedback_pt_186;

always @(tukatuk or feedback_pt_186)
  begin
      enoch = !tukatuk ^ !feedback_pt_186;
  end

reg feedback_pt_187;

always @(gnd or feedback_pt_187)
  begin
      bobblehead = !gnd &  feedback_pt_187;
  end

reg feedback_pt_188;

always @(snort or feedback_pt_188)
  begin
      cheez = !snort |  feedback_pt_188;
  end

reg feedback_pt_189;

always @(papyrus or feedback_pt_189)
  begin
      zed =  papyrus ^ !feedback_pt_189;
  end

reg feedback_pt_190;

always @(neptune or feedback_pt_190)
  begin
      zen =  neptune | !feedback_pt_190;
  end

reg feedback_pt_191;

always @(lsd or feedback_pt_191)
  begin
      falafel = !lsd | !feedback_pt_191;
  end

reg feedback_pt_192;

always @(puttanesca or feedback_pt_192)
  begin
      rodriguez = !puttanesca & !feedback_pt_192;
  end

reg feedback_pt_193;

always @(vcc or feedback_pt_193)
  begin
      dukdodger =  vcc | !feedback_pt_193;
  end

reg feedback_pt_194;

always @(gnd or feedback_pt_194)
  begin
      ocha = !gnd &  feedback_pt_194;
  end

reg feedback_pt_195;

always @(vcc or feedback_pt_195)
  begin
      kaisha =  vcc & !feedback_pt_195;
  end

reg feedback_pt_196;

always @(vcc or feedback_pt_196)
  begin
      hellokitty = !vcc &  feedback_pt_196;
  end

reg feedback_pt_197;

always @(bust or feedback_pt_197)
  begin
      badtzmaru =  bust ^ !feedback_pt_197;
  end

reg feedback_pt_198;

always @(gnd or feedback_pt_198)
  begin
      sapporo =  gnd |  feedback_pt_198;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      asahi <= 0;
    else if (carolina)
      asahi <= viagra;
  end

always @(asahi)
  begin
      feedback_pt_181 = asahi;
  end

always @(asahi)
  begin
      feedback_pt_182 = asahi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hummer <= 0;
    else if (gnd)
      hummer <= harrydavid;
  end

always @(hummer)
  begin
      feedback_pt_183 = hummer;
  end

always @(hummer)
  begin
      feedback_pt_184 = hummer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      elian <= 1;
    else
      elian <= vcc;
  end

always @(elian)
  begin
      feedback_pt_185 = elian;
  end

always @(elian)
  begin
      feedback_pt_186 = elian;
  end

always @(elian)
  begin
      feedback_pt_187 = elian;
  end

always @(elian)
  begin
      feedback_pt_188 = elian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      condit <= 0;
    else if (vcc)
      condit <= gnd;
    else if (lafondue)
      condit <= 0;
  end

always @(condit)
  begin
      feedback_pt_189 = condit;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gopher <= 0;
    else if (speed)
      gopher <= 0;
    else if (elian)
      gopher <= defoliant;
  end

always @(gopher)
  begin
      feedback_pt_190 = gopher;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      giraffe <= 0;
    else
      giraffe <= hercules;
  end

always @(giraffe)
  begin
      feedback_pt_191 = giraffe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lotus <= 0;
    else if (hotel)
      lotus <= mideast;
  end

always @(lotus)
  begin
      feedback_pt_192 = lotus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flyingmonkey <= 0;
    else if (viagra)
      flyingmonkey <= gnd;
    else if (gnd)
      flyingmonkey <= 0;
  end

always @(flyingmonkey)
  begin
      feedback_pt_193 = flyingmonkey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scotchtape <= 0;
    else
      scotchtape <= george;
  end

always @(scotchtape)
  begin
      feedback_pt_194 = scotchtape;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wicked <= 0;
    else if (south)
      wicked <= cornell;
    else if (jacuzzi)
      wicked <= 0;
  end

always @(wicked)
  begin
      feedback_pt_195 = wicked;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      witch <= 0;
    else if (falafel)
      witch <= cheez;
  end

always @(witch)
  begin
      feedback_pt_196 = witch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ghost <= 0;
    else if (hercules)
      ghost <= 0;
    else if (vcc)
      ghost <= oranges;
  end

always @(ghost)
  begin
      feedback_pt_197 = ghost;
  end

wire goblin_wire;

dffeas goblin_ff (
  .clk(clock0),
  .d(vcc),
  .ena(falafel),
  .sclr(brothers),
  .sload(dumptruck),
  .asdata(aspirin),
  .clrn(!reset0),
  .q(goblin_wire)
);

always @(goblin_wire) begin
   elf = goblin_wire;
end

always @(elf)
  begin
      feedback_pt_198 = elf;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      centaur <= 0;
    else if (vicks)
      centaur <= foliage;
  end

wire theseus_wire;

dffea theseus_ff (
  .clk(clock0),
  .d(bust),
  .ena(ladder),
  .adata(tukatuk),
  .clrn(!reset0),
  .q(theseus_wire)
);

always @(theseus_wire) begin
   minotaur = theseus_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      midas <= 0;
    else
      midas <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      icarus <= 0;
    else if (vcc)
      icarus <= minotaur;
    else if (saccarine)
      icarus <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pegasus <= 0;
    else if (jacuzzi)
      pegasus <= gnd;
    else if (pyromaniac)
      pegasus <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      troll <= 0;
    else
      troll <= nutrasweet;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      warlock <= 0;
    else if (carolina)
      warlock <= 0;
    else if (vcc)
      warlock <= elian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chowmein <= 1;
    else
      chowmein <= tamago;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stirfry <= 1;
    else
      stirfry <= mideast;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tasty <= 0;
    else if (elian)
      tasty <= 0;
    else if (gnd)
      tasty <= school;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pastrami <= 1;
    else
      pastrami <= ghost;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      turkey <= 0;
    else if (gnd)
      turkey <= gnd;
    else if (speed)
      turkey <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beast <= 0;
    else if (chowmein)
      beast <= meth;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bacon <= 0;
    else if (gnd)
      bacon <= 0;
    else if (potter)
      bacon <= sapporo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salami <= 0;
    else if (pastrami)
      salami <= golfland;
    else if (vcc)
      salami <= 0;
  end

reg feedback_pt_199;

always @(vcc or feedback_pt_199)
  begin
      peaves = !vcc &  feedback_pt_199;
  end

reg feedback_pt_200;

always @(elf or feedback_pt_200)
  begin
      snape = !elf & !feedback_pt_200;
  end

reg feedback_pt_201;

always @(nutrasweet or feedback_pt_201)
  begin
      hagrid = !nutrasweet & !feedback_pt_201;
  end

reg feedback_pt_202;

always @(sinus or feedback_pt_202)
  begin
      tonks =  sinus & !feedback_pt_202;
  end

reg feedback_pt_203;

always @(gnd or feedback_pt_203)
  begin
      bumbledork = !gnd ^ !feedback_pt_203;
  end

reg feedback_pt_204;

always @(salami or feedback_pt_204)
  begin
      moody = !salami ^ !feedback_pt_204;
  end

reg feedback_pt_205;

always @(vcc or feedback_pt_205)
  begin
      madeye = !vcc & !feedback_pt_205;
  end

reg feedback_pt_206;

always @(dimetap or feedback_pt_206)
  begin
      weasley = !dimetap | !feedback_pt_206;
  end

reg feedback_pt_207;

always @(elguapo or feedback_pt_207)
  begin
      floo = !elguapo | !feedback_pt_207;
  end

reg feedback_pt_208;

always @(vcc or feedback_pt_208)
  begin
      powder =  vcc & !feedback_pt_208;
  end

reg feedback_pt_209;

always @(kerchoozle or feedback_pt_209)
  begin
      broom =  kerchoozle & !feedback_pt_209;
  end

reg feedback_pt_210;

always @(zed or feedback_pt_210)
  begin
      stick = !zed ^ !feedback_pt_210;
  end

reg feedback_pt_211;

always @(rodriguez or feedback_pt_211)
  begin
      quidditch =  rodriguez | !feedback_pt_211;
  end

reg feedback_pt_212;

always @(sugar or feedback_pt_212)
  begin
      phoenix =  sugar |  feedback_pt_212;
  end

reg feedback_pt_213;

always @(vcc or feedback_pt_213)
  begin
      arizona =  vcc | !feedback_pt_213;
  end

reg feedback_pt_214;

always @(subway or feedback_pt_214)
  begin
      fang =  subway & !feedback_pt_214;
  end

reg feedback_pt_215;

always @(hummer or feedback_pt_215)
  begin
      scabbers = !hummer | !feedback_pt_215;
  end

reg feedback_pt_216;

always @(gnd or feedback_pt_216)
  begin
      umbridge =  gnd & !feedback_pt_216;
  end

reg feedback_pt_217;

always @(barney or feedback_pt_217)
  begin
      filch = !barney ^  feedback_pt_217;
  end

reg feedback_pt_218;

always @(carolina or feedback_pt_218)
  begin
      norris =  carolina &  feedback_pt_218;
  end

reg feedback_pt_219;

always @(robust or feedback_pt_219)
  begin
      chuck = !robust &  feedback_pt_219;
  end

reg feedback_pt_220;

always @(centaur or feedback_pt_220)
  begin
      sirius = !centaur & !feedback_pt_220;
  end

reg feedback_pt_221;

always @(witch or feedback_pt_221)
  begin
      black = !witch & !feedback_pt_221;
  end

reg feedback_pt_222;

always @(gnd or feedback_pt_222)
  begin
      lupin =  gnd & !feedback_pt_222;
  end

reg feedback_pt_223;

always @(yummy or feedback_pt_223)
  begin
      severus = !yummy ^  feedback_pt_223;
  end

reg feedback_pt_224;

always @(rose or feedback_pt_224)
  begin
      arthur =  rose & !feedback_pt_224;
  end

reg feedback_pt_225;

always @(exfoliant or feedback_pt_225)
  begin
      snake = !exfoliant | !feedback_pt_225;
  end

reg feedback_pt_226;

always @(shark or feedback_pt_226)
  begin
      mundungus =  shark & !feedback_pt_226;
  end

reg feedback_pt_227;

always @(umbridge or feedback_pt_227)
  begin
      army = !umbridge ^  feedback_pt_227;
  end

reg feedback_pt_228;

always @(decongestant or feedback_pt_228)
  begin
      crookshanks = !decongestant | !feedback_pt_228;
  end

reg feedback_pt_229;

always @(vcc or feedback_pt_229)
  begin
      trevor = !vcc ^  feedback_pt_229;
  end

reg feedback_pt_230;

always @(warlock or feedback_pt_230)
  begin
      neville =  warlock | !feedback_pt_230;
  end

reg feedback_pt_231;

always @(scotchtape or feedback_pt_231)
  begin
      longbottom = !scotchtape & !feedback_pt_231;
  end

reg feedback_pt_232;

always @(kana or feedback_pt_232)
  begin
      bellatrix =  kana | !feedback_pt_232;
  end

reg feedback_pt_233;

always @(vcc or feedback_pt_233)
  begin
      lestrange = !vcc & !feedback_pt_233;
  end

reg feedback_pt_234;

always @(lupin or feedback_pt_234)
  begin
      malfoy = !lupin |  feedback_pt_234;
  end

reg feedback_pt_235;

always @(viagra or feedback_pt_235)
  begin
      draco = !viagra |  feedback_pt_235;
  end

reg feedback_pt_236;

always @(moody or feedback_pt_236)
  begin
      lucius =  moody &  feedback_pt_236;
  end

reg feedback_pt_237;

always @(gopher or feedback_pt_237)
  begin
      narcissa =  gopher & !feedback_pt_237;
  end

reg feedback_pt_238;

always @(genji or feedback_pt_238)
  begin
      albus = !genji |  feedback_pt_238;
  end

reg feedback_pt_239;

always @(troll or feedback_pt_239)
  begin
      mcgonagall = !troll ^  feedback_pt_239;
  end

reg feedback_pt_240;

always @(honey or feedback_pt_240)
  begin
      hogwarts = !honey ^  feedback_pt_240;
  end

reg feedback_pt_241;

always @(gnd or feedback_pt_241)
  begin
      rubeus = !gnd ^  feedback_pt_241;
  end

reg feedback_pt_242;

always @(gnd or feedback_pt_242)
  begin
      drumstrang = !gnd | !feedback_pt_242;
  end

wire norbert_wire;

dffeas norbert_ff (
  .clk(clock0),
  .d(malfoy),
  .ena(arizona),
  .sclr(brothers),
  .sload(filch),
  .asdata(school),
  .clrn(!reset0),
  .q(norbert_wire)
);

always @(norbert_wire) begin
   wizard = norbert_wire;
end

always @(wizard)
  begin
      feedback_pt_199 = wizard;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      diagon <= 0;
    else if (pasta)
      diagon <= 0;
    else if (gnd)
      diagon <= madeye;
  end

always @(diagon)
  begin
      feedback_pt_200 = diagon;
  end

always @(diagon)
  begin
      feedback_pt_201 = diagon;
  end

always @(diagon)
  begin
      feedback_pt_202 = diagon;
  end

always @(diagon)
  begin
      feedback_pt_203 = diagon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fireplace <= 1;
    else
      fireplace <= arthur;
  end

always @(fireplace)
  begin
      feedback_pt_204 = fireplace;
  end

always @(fireplace)
  begin
      feedback_pt_205 = fireplace;
  end

always @(fireplace)
  begin
      feedback_pt_206 = fireplace;
  end

always @(fireplace)
  begin
      feedback_pt_207 = fireplace;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crucio <= 1;
    else
      crucio <= gopher;
  end

always @(crucio)
  begin
      feedback_pt_208 = crucio;
  end

always @(crucio)
  begin
      feedback_pt_209 = crucio;
  end

always @(crucio)
  begin
      feedback_pt_210 = crucio;
  end

always @(crucio)
  begin
      feedback_pt_211 = crucio;
  end

always @(crucio)
  begin
      feedback_pt_212 = crucio;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kedavra <= 0;
    else
      kedavra <= wrecker;
  end

always @(kedavra)
  begin
      feedback_pt_213 = kedavra;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mario_owes <= 0;
    else
      mario_owes <= bumbledork;
  end

always @(mario_owes)
  begin
      feedback_pt_214 = mario_owes;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gregg_a <= 0;
    else
      gregg_a <= art;
  end

always @(gregg_a)
  begin
      feedback_pt_215 = gregg_a;
  end

always @(gregg_a)
  begin
      feedback_pt_216 = gregg_a;
  end

always @(gregg_a)
  begin
      feedback_pt_217 = gregg_a;
  end

always @(gregg_a)
  begin
      feedback_pt_218 = gregg_a;
  end

always @(gregg_a)
  begin
      feedback_pt_219 = gregg_a;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burrito <= 0;
    else if (vcc)
      burrito <= stick;
    else if (advil)
      burrito <= 0;
  end

always @(burrito)
  begin
      feedback_pt_220 = burrito;
  end

always @(burrito)
  begin
      feedback_pt_221 = burrito;
  end

always @(burrito)
  begin
      feedback_pt_222 = burrito;
  end

always @(burrito)
  begin
      feedback_pt_223 = burrito;
  end

always @(burrito)
  begin
      feedback_pt_224 = burrito;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      correctness <= 0;
    else if (peace)
      correctness <= puttanesca;
  end

always @(correctness)
  begin
      feedback_pt_225 = correctness;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cafe <= 0;
    else
      cafe <= crank;
  end

always @(cafe)
  begin
      feedback_pt_226 = cafe;
  end

always @(cafe)
  begin
      feedback_pt_227 = cafe;
  end

always @(cafe)
  begin
      feedback_pt_228 = cafe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      synplicity_burrito <= 0;
    else if (trevor)
      synplicity_burrito <= 0;
    else if (albus)
      synplicity_burrito <= burrito;
  end

always @(synplicity_burrito)
  begin
      feedback_pt_229 = synplicity_burrito;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      guacamole <= 0;
    else if (gap)
      guacamole <= vcc;
    else if (balloon)
      guacamole <= 0;
  end

always @(guacamole)
  begin
      feedback_pt_230 = guacamole;
  end

always @(guacamole)
  begin
      feedback_pt_231 = guacamole;
  end

always @(guacamole)
  begin
      feedback_pt_232 = guacamole;
  end

always @(guacamole)
  begin
      feedback_pt_233 = guacamole;
  end

always @(guacamole)
  begin
      feedback_pt_234 = guacamole;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sourcream <= 0;
    else if (stirfry)
      sourcream <= 0;
    else if (curious)
      sourcream <= gnd;
  end

always @(sourcream)
  begin
      feedback_pt_235 = sourcream;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      onion <= 1;
    else
      onion <= troll;
  end

always @(onion)
  begin
      feedback_pt_236 = onion;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jalapeno <= 0;
    else if (balloon)
      jalapeno <= gnd;
  end

always @(jalapeno)
  begin
      feedback_pt_237 = jalapeno;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beef <= 0;
    else if (crucio)
      beef <= 0;
    else if (gnd)
      beef <= wanton;
  end

always @(beef)
  begin
      feedback_pt_238 = beef;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pork <= 0;
    else
      pork <= ghost;
  end

always @(pork)
  begin
      feedback_pt_239 = pork;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blackbeans <= 1;
    else
      blackbeans <= vcc;
  end

always @(blackbeans)
  begin
      feedback_pt_240 = blackbeans;
  end

wire refriedbeans_wire;

dffea refriedbeans_ff (
  .clk(clock0),
  .d(vcc),
  .ena(gnd),
  .adata(bobblehead),
  .clrn(!reset0),
  .q(refriedbeans_wire)
);

always @(refriedbeans_wire) begin
   pintobeans = refriedbeans_wire;
end

always @(pintobeans)
  begin
      feedback_pt_241 = pintobeans;
  end

wire tortilla_wire;

dffeas tortilla_ff (
  .clk(clock0),
  .d(whatelse),
  .ena(sinew),
  .sclr(tonks),
  .sload(bomb),
  .asdata(synplicity_burrito),
  .clrn(!reset0),
  .q(tortilla_wire)
);

always @(tortilla_wire) begin
   salsa = tortilla_wire;
end

always @(salsa)
  begin
      feedback_pt_242 = salsa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      picante <= 0;
    else if (comtrex)
      picante <= 0;
    else if (soccer)
      picante <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chips <= 0;
    else if (vcc)
      chips <= 0;
    else if (gnd)
      chips <= mcgonagall;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tabasco <= 0;
    else if (powder)
      tabasco <= gnd;
    else if (gnd)
      tabasco <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mexican <= 0;
    else if (viagra)
      mexican <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      too_big <= 0;
    else
      too_big <= badtzmaru;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      llamas_dont_eat_burrito <= 0;
    else if (fireplace)
      llamas_dont_eat_burrito <= 0;
    else if (stemcell)
      llamas_dont_eat_burrito <= sirius;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      director_of_llamas <= 0;
    else if (softball)
      director_of_llamas <= mcgonagall;
    else if (whatelse)
      director_of_llamas <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fufu <= 0;
    else if (killme)
      fufu <= phoenix;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      castaway <= 0;
    else if (vcc)
      castaway <= 0;
    else if (severus)
      castaway <= gnd;
  end

wire coconut_wire;

dffeas coconut_ff (
  .clk(clock0),
  .d(broadway),
  .ena(scabbers),
  .sclr(harrydavid),
  .sload(vcc),
  .asdata(vcc),
  .clrn(!reset0),
  .q(coconut_wire)
);

always @(coconut_wire) begin
   maryann = coconut_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gilligan <= 1;
    else
      gilligan <= kedavra;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skipper <= 0;
    else if (condit)
      skipper <= gnd;
    else if (gnd)
      skipper <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      professor <= 0;
    else if (severus)
      professor <= 0;
    else if (genji)
      professor <= castaway;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moviestar <= 0;
    else
      moviestar <= zeus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ginger <= 0;
    else if (flyingmonkey)
      ginger <= 0;
    else if (gnd)
      ginger <= lupin;
  end

reg feedback_pt_243;

always @(gregg_a or feedback_pt_243)
  begin
      jonas =  gregg_a | !feedback_pt_243;
  end

reg feedback_pt_244;

always @(kana or feedback_pt_244)
  begin
      grumby = !kana ^  feedback_pt_244;
  end

reg feedback_pt_245;

always @(exfoliant or feedback_pt_245)
  begin
      minnow = !exfoliant &  feedback_pt_245;
  end

reg feedback_pt_246;

always @(gilligan or feedback_pt_246)
  begin
      lost =  gilligan ^ !feedback_pt_246;
  end

reg feedback_pt_247;

always @(vcc or feedback_pt_247)
  begin
      bfs =  vcc ^ !feedback_pt_247;
  end

reg feedback_pt_248;

always @(ginger or feedback_pt_248)
  begin
      thurston = !ginger &  feedback_pt_248;
  end

reg feedback_pt_249;

always @(mario_owes or feedback_pt_249)
  begin
      lovey =  mario_owes | !feedback_pt_249;
  end

reg feedback_pt_250;

always @(vcc or feedback_pt_250)
  begin
      howell =  vcc ^  feedback_pt_250;
  end

reg feedback_pt_251;

always @(vcc or feedback_pt_251)
  begin
      hinkley = !vcc &  feedback_pt_251;
  end

reg feedback_pt_252;

always @(rubeus or feedback_pt_252)
  begin
      eunice = !rubeus &  feedback_pt_252;
  end

reg feedback_pt_253;

always @(wicked or feedback_pt_253)
  begin
      witchdoctor = !wicked &  feedback_pt_253;
  end

reg feedback_pt_254;

always @(vcc or feedback_pt_254)
  begin
      voodoo =  vcc |  feedback_pt_254;
  end

reg feedback_pt_255;

always @(bomb or feedback_pt_255)
  begin
      uncharted =  bomb ^  feedback_pt_255;
  end

reg feedback_pt_256;

always @(black or feedback_pt_256)
  begin
      reallyloud = !black &  feedback_pt_256;
  end

reg feedback_pt_257;

always @(centaur or feedback_pt_257)
  begin
      hypnotized = !centaur ^ !feedback_pt_257;
  end

reg feedback_pt_258;

always @(voodoo or feedback_pt_258)
  begin
      ohthatcoconut = !voodoo ^  feedback_pt_258;
  end

reg feedback_pt_259;

always @(webvan or feedback_pt_259)
  begin
      booming =  webvan | !feedback_pt_259;
  end

reg feedback_pt_260;

always @(uncharted or feedback_pt_260)
  begin
      rarest =  uncharted |  feedback_pt_260;
  end

reg feedback_pt_261;

always @(beast or feedback_pt_261)
  begin
      butterfly = !beast | !feedback_pt_261;
  end

reg feedback_pt_262;

always @(witchdoctor or feedback_pt_262)
  begin
      palm = !witchdoctor |  feedback_pt_262;
  end

reg feedback_pt_263;

always @(crookshanks or feedback_pt_263)
  begin
      seashell =  crookshanks & !feedback_pt_263;
  end

reg feedback_pt_264;

always @(reallyloud or feedback_pt_264)
  begin
      ohisee =  reallyloud | !feedback_pt_264;
  end

// 9 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {rerun,fronds,hut,rescue,hawaii,wallstreet,levelization,huhhuh,uomcensor} <= 0;
    else if (whacky)
      {rerun,fronds,hut,rescue,hawaii,wallstreet,levelization,huhhuh,uomcensor} <= {rerun,fronds,hut,rescue,hawaii,wallstreet,levelization,huhhuh,uomcensor} + 1;
    else
      {rerun,fronds,hut,rescue,hawaii,wallstreet,levelization,huhhuh,uomcensor} <= {rerun,fronds,hut,rescue,hawaii,wallstreet,levelization,huhhuh,uomcensor} - 1;
  end

// Greater Equal Less compare
always @(wildboar or gnd or lagoon or husks or gnd or escape or foiled or bamboo or desert or isle or pacific or ocean or waterfall or tan_nodes or loud or millionaire)
  begin
    if ({wildboar,gnd,lagoon,husks,gnd,escape,foiled,bamboo} > {desert,isle,pacific,ocean,waterfall,tan_nodes,loud,millionaire})
       {hiswife,smack,banshee} = 3'b100;
    else if ({wildboar,gnd,lagoon,husks,gnd,escape,foiled,bamboo} < {desert,isle,pacific,ocean,waterfall,tan_nodes,loud,millionaire})
       {hiswife,smack,banshee} = 3'b010;
    else
       {hiswife,smack,banshee} = 3'b001;
  end

// 63 bit shift register
reg [62:0] dillweed;

initial begin
    dillweed = 0;
end

always @(posedge clock1)
begin
    dillweed <= (dillweed << 1) | gnd;
end

// shift taps every 3 bits
always @(dillweed)
begin
    vimcensorc = dillweed[62];
    tesla = dillweed[59];
    killer = dillweed[56];
    wonton = dillweed[53];
    pierre = dillweed[50];
    armand = dillweed[47];
    rufus = dillweed[44];
    willy = dillweed[41];
    gonzo = dillweed[38];
    gulp = dillweed[35];
    bonafide = dillweed[32];
    stroop = dillweed[29];
    waffle = dillweed[26];
    wheezer = dillweed[23];
    ozzy = dillweed[20];
    priest = dillweed[17];
    rabbi = dillweed[14];
    wancensorcens = dillweed[11];
    xbncensorcens = dillweed[8];
    tapered = dillweed[5];
    spastic = dillweed[2];
end

always @(tonks)
  begin
      lad = !tonks;
  end

always @(hawaii)
  begin
      mao = !hawaii;
  end

always @(hagrid)
  begin
      zedong = !hagrid;
  end

always @(hypnotized)
  begin
      deng = !hypnotized;
  end

always @(guacamole)
  begin
      xiaoping = !guacamole;
  end

always @(ocha)
  begin
      jinyong = !ocha;
  end

always @(madeye)
  begin
      lao = !madeye;
  end

always @(hinkley)
  begin
      zi = !hinkley;
  end

always @(pyromaniac)
  begin
      zhuang = !pyromaniac;
  end

always @(hellokitty)
  begin
      wujing = !hellokitty;
  end

always @(fang)
  begin
      wukong = !fang;
  end

always @(banshee)
  begin
      helena = !banshee;
  end

always @(waffle)
  begin
      gerrit = !waffle;
  end

always @(draco)
  begin
      willem = !draco;
  end

always @(palm)
  begin
      dirk = !palm;
  end

always @(vcc)
  begin
      klaas = !vcc;
  end

always @(tabasco)
  begin
      bep = !tabasco;
  end

always @(vcc)
  begin
      hans = !vcc;
  end

always @(pintobeans)
  begin
      gerard = !pintobeans;
  end

always @(meth)
  begin
      leeuwenhoek = !meth;
  end

always @(gonzo)
  begin
      microscope = !gonzo;
  end

always @(vcc)
  begin
      erasmus = !vcc;
  end

always @(yohimbe)
  begin
      deruyter = !yohimbe;
  end

always @(vcc)
  begin
      vangoh = !vcc;
  end

always @(gnd)
  begin
      fortuyn = !gnd;
  end

always @(gnd)
  begin
      oranje = !gnd;
  end

always @(ohisee)
  begin
      schwinger = !ohisee;
  end

always @(klaas)
  begin
      feynman = !klaas;
  end

always @(vcc)
  begin
      plague = !vcc;
  end

always @(pastrami)
  begin
      automounter = !pastrami;
  end

always @(cafe)
  begin
      boing = !cafe;
  end

always @(tapered)
  begin
      ykocens = !tapered;
  end

always @(kedavra)
  begin
      pixie = !kedavra;
  end

always @(guacamole)
  begin
      stix = !guacamole;
  end

always @(correctness)
  begin
      georgec = !correctness;
  end

always @(vcc)
  begin
      tango_loud = !vcc;
  end

always @(bacon)
  begin
      cluckU_fuji = !bacon;
  end

always @(stix)
  begin
      criminal_newt = !stix;
  end

always @(gnd)
  begin
      sun_milhouse = !gnd;
  end

always @(vcc)
  begin
      condit_yak = !vcc;
  end

wire romex_dingbat_outwire;
lcell bomb_yak (foryou,romex_dingbat_outwire);

always @(romex_dingbat_outwire)
begin
  romex_dingbat = romex_dingbat_outwire;
end

wire nyc_rubeus_outwire;
lcell sand_baron (fireplace,nyc_rubeus_outwire);

always @(nyc_rubeus_outwire)
begin
  nyc_rubeus = nyc_rubeus_outwire;
end

wire danger_star_outwire;
carry protest_bfs (butterfly,danger_star_outwire);

always @(danger_star_outwire)
begin
  danger_star = danger_star_outwire;
end

wire peace_boots_outwire;
exp cain_jupiter (llamas_dont_eat_burrito,peace_boots_outwire);

always @(peace_boots_outwire)
begin
  peace_boots = peace_boots_outwire;
end

wire tango_saturn_outwire, desade_touch_outwire;
carry_sum kang_usa (.sin(vimcensorc),.cin(gnd),.sout(tango_saturn_outwire),.cout(desade_touch_outwire));

always @(tango_saturn_outwire or desade_touch_outwire)
begin
  tango_saturn = tango_saturn_outwire;
  desade_touch = desade_touch_outwire;
end

wire salmon_mickey_outwire;
soft bust_doobie (barney,salmon_mickey_outwire);

always @(salmon_mickey_outwire)
begin
  salmon_mickey = salmon_mickey_outwire;
end

wire gin_kdqcens_outwire, atchoo_deng_outwire;
carry_sum atilla_sheep (.sin(eunice),.cin(lad),.sout(gin_kdqcens_outwire),.cout(atchoo_deng_outwire));

always @(gin_kdqcens_outwire or atchoo_deng_outwire)
begin
  gin_kdqcens = gin_kdqcens_outwire;
  atchoo_deng = atchoo_deng_outwire;
end

wire zulu_hagrid_outwire;
exp salsa_hulk (peace_boots,zulu_hagrid_outwire);

always @(zulu_hagrid_outwire)
begin
  zulu_hagrid = zulu_hagrid_outwire;
end

wire weevil_tako_outwire;
soft winner_bambi (broadway,weevil_tako_outwire);

always @(weevil_tako_outwire)
begin
  weevil_tako = weevil_tako_outwire;
end

wire china_ham_outwire, cheese_tobiko_outwire;
carry_sum elguapo_marco (.sin(nyc_rubeus),.cin(leeuwenhoek),.sout(china_ham_outwire),.cout(cheese_tobiko_outwire));

always @(china_ham_outwire or cheese_tobiko_outwire)
begin
  china_ham = china_ham_outwire;
  cheese_tobiko = cheese_tobiko_outwire;
end

wire pork_eel_outwire;
exp weevil_prison (lisa,pork_eel_outwire);

always @(pork_eel_outwire)
begin
  pork_eel = pork_eel_outwire;
end

wire thedon_goofy_outwire;
carry barnum_fufu (pork,thedon_goofy_outwire);

always @(thedon_goofy_outwire)
begin
  thedon_goofy = thedon_goofy_outwire;
end

wire skinner_ohno_outwire;
soft Iwin_odin (gnd,skinner_ohno_outwire);

always @(skinner_ohno_outwire)
begin
  skinner_ohno = skinner_ohno_outwire;
end

wire boots_sanity_outwire, jupiter_ceres_outwire;
carry_sum jiminy_fear (.sin(asahi),.cin(gnd),.sout(boots_sanity_outwire),.cout(jupiter_ceres_outwire));

always @(boots_sanity_outwire or jupiter_ceres_outwire)
begin
  boots_sanity = boots_sanity_outwire;
  jupiter_ceres = jupiter_ceres_outwire;
end

reg feedback_pt_265;

always @(levelization or feedback_pt_265)
  begin
      east_zealot =  levelization ^ !feedback_pt_265;
  end

reg feedback_pt_266;

always @(atchoo or feedback_pt_266)
  begin
      yankee_huey = !atchoo | !feedback_pt_266;
  end

reg feedback_pt_267;

always @(salmon_mickey or feedback_pt_267)
  begin
      stoner_zed =  salmon_mickey & !feedback_pt_267;
  end

reg feedback_pt_268;

always @(gnd or feedback_pt_268)
  begin
      aphid_bullet =  gnd & !feedback_pt_268;
  end

reg feedback_pt_269;

always @(automounter or feedback_pt_269)
  begin
      bach_onion = !automounter |  feedback_pt_269;
  end

reg feedback_pt_270;

always @(vcc or feedback_pt_270)
  begin
      chuck_golf =  vcc | !feedback_pt_270;
  end

reg feedback_pt_271;

always @(gnd or feedback_pt_271)
  begin
      hurt_saturn =  gnd & !feedback_pt_271;
  end

reg feedback_pt_272;

always @(gnd or feedback_pt_272)
  begin
      foxtrot_ring = !gnd ^  feedback_pt_272;
  end

reg feedback_pt_273;

always @(lafondue or feedback_pt_273)
  begin
      red_barty = !lafondue ^ !feedback_pt_273;
  end

reg feedback_pt_274;

always @(criminal_newt or feedback_pt_274)
  begin
      nyc_foliage =  criminal_newt ^  feedback_pt_274;
  end

reg feedback_pt_275;

always @(cluckU_fuji or feedback_pt_275)
  begin
      pluto_exodus = !cluckU_fuji ^ !feedback_pt_275;
  end

reg feedback_pt_276;

always @(gnd or feedback_pt_276)
  begin
      shark_avon =  gnd ^ !feedback_pt_276;
  end

reg feedback_pt_277;

always @(gnd or feedback_pt_277)
  begin
      marge_killme =  gnd & !feedback_pt_277;
  end

reg feedback_pt_278;

always @(drumstrang or feedback_pt_278)
  begin
      ostrich_gap = !drumstrang &  feedback_pt_278;
  end

reg feedback_pt_279;

always @(guacamole or feedback_pt_279)
  begin
      helena_sinus =  guacamole ^  feedback_pt_279;
  end

reg feedback_pt_280;

always @(gnd or feedback_pt_280)
  begin
      cluckU_klaas =  gnd | !feedback_pt_280;
  end

reg feedback_pt_281;

always @(vcc or feedback_pt_281)
  begin
      pizza_popacap = !vcc |  feedback_pt_281;
  end

reg feedback_pt_282;

always @(vcc or feedback_pt_282)
  begin
      odin_hotdog =  vcc ^  feedback_pt_282;
  end

reg feedback_pt_283;

always @(gnd or feedback_pt_283)
  begin
      goblin_romex =  gnd | !feedback_pt_283;
  end

reg feedback_pt_284;

always @(china_ham or feedback_pt_284)
  begin
      iguana_bullet =  china_ham ^ !feedback_pt_284;
  end

reg feedback_pt_285;

always @(xiaoping or feedback_pt_285)
  begin
      tofu_leidiot = !xiaoping ^  feedback_pt_285;
  end

reg feedback_pt_286;

always @(peaves or feedback_pt_286)
  begin
      turnip_doobie =  peaves |  feedback_pt_286;
  end

reg feedback_pt_287;

always @(pork_eel or feedback_pt_287)
  begin
      ibm_chief =  pork_eel ^  feedback_pt_287;
  end

reg feedback_pt_288;

always @(fortuyn or feedback_pt_288)
  begin
      south_norbert =  fortuyn ^  feedback_pt_288;
  end

reg feedback_pt_289;

always @(shark_avon or feedback_pt_289)
  begin
      gerrit_gyro = !shark_avon &  feedback_pt_289;
  end

reg feedback_pt_290;

always @(smack or feedback_pt_290)
  begin
      hans_kungfu = !smack | !feedback_pt_290;
  end

reg feedback_pt_291;

always @(zed or feedback_pt_291)
  begin
      floo_xray =  zed ^ !feedback_pt_291;
  end

reg feedback_pt_292;

always @(vcc or feedback_pt_292)
  begin
      solder_troll = !vcc | !feedback_pt_292;
  end

reg feedback_pt_293;

always @(feynman or feedback_pt_293)
  begin
      pyro_kmfdm =  feynman &  feedback_pt_293;
  end

reg feedback_pt_294;

always @(jinyong or feedback_pt_294)
  begin
      copper_beef = !jinyong | !feedback_pt_294;
  end

reg feedback_pt_295;

always @(vcc or feedback_pt_295)
  begin
      stoner_saturn =  vcc |  feedback_pt_295;
  end

reg feedback_pt_296;

always @(hagrid or feedback_pt_296)
  begin
      maki_hp =  hagrid ^ !feedback_pt_296;
  end

reg feedback_pt_297;

always @(gnd or feedback_pt_297)
  begin
      advil_rose = !gnd | !feedback_pt_297;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spirit_shuda <= 0;
    else if (jinyong)
      spirit_shuda <= 0;
    else if (microscope)
      spirit_shuda <= webvan;
  end

always @(spirit_shuda)
  begin
      feedback_pt_243 = spirit_shuda;
  end

always @(spirit_shuda)
  begin
      feedback_pt_244 = spirit_shuda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ohisee_malfoy <= 0;
    else if (jalapeno)
      ohisee_malfoy <= correctness;
    else if (advil_rose)
      ohisee_malfoy <= 0;
  end

always @(ohisee_malfoy)
  begin
      feedback_pt_245 = ohisee_malfoy;
  end

always @(ohisee_malfoy)
  begin
      feedback_pt_246 = ohisee_malfoy;
  end

always @(ohisee_malfoy)
  begin
      feedback_pt_247 = ohisee_malfoy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moody_opus <= 0;
    else
      moody_opus <= vcc;
  end

always @(moody_opus)
  begin
      feedback_pt_248 = moody_opus;
  end

always @(moody_opus)
  begin
      feedback_pt_249 = moody_opus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      army_cafe <= 0;
    else
      army_cafe <= narcissa;
  end

always @(army_cafe)
  begin
      feedback_pt_250 = army_cafe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whale_ocha <= 0;
    else if (rarest)
      whale_ocha <= 0;
    else if (bfs)
      whale_ocha <= gnd;
  end

always @(whale_ocha)
  begin
      feedback_pt_251 = whale_ocha;
  end

always @(whale_ocha)
  begin
      feedback_pt_252 = whale_ocha;
  end

always @(whale_ocha)
  begin
      feedback_pt_253 = whale_ocha;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_yankee <= 1;
    else
      curie_yankee <= quidditch;
  end

always @(curie_yankee)
  begin
      feedback_pt_254 = curie_yankee;
  end

always @(curie_yankee)
  begin
      feedback_pt_255 = curie_yankee;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chillis_avon <= 0;
    else
      chillis_avon <= vcc;
  end

always @(chillis_avon)
  begin
      feedback_pt_256 = chillis_avon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_fish <= 0;
    else if (tylenol)
      escape_fish <= bacon;
  end

always @(escape_fish)
  begin
      feedback_pt_257 = escape_fish;
  end

always @(escape_fish)
  begin
      feedback_pt_258 = escape_fish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rojas_bull <= 0;
    else if (thurston)
      rojas_bull <= fortuyn;
    else if (vcc)
      rojas_bull <= 0;
  end

always @(rojas_bull)
  begin
      feedback_pt_259 = rojas_bull;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sleeping_art <= 0;
    else if (rubeus)
      sleeping_art <= 0;
    else if (diagon)
      sleeping_art <= chuck_golf;
  end

always @(sleeping_art)
  begin
      feedback_pt_260 = sleeping_art;
  end

always @(sleeping_art)
  begin
      feedback_pt_261 = sleeping_art;
  end

always @(sleeping_art)
  begin
      feedback_pt_262 = sleeping_art;
  end

always @(sleeping_art)
  begin
      feedback_pt_263 = sleeping_art;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonton_tonic <= 0;
    else if (gnd)
      wonton_tonic <= 0;
    else if (rojas_bull)
      wonton_tonic <= boots_sanity;
  end

always @(wonton_tonic)
  begin
      feedback_pt_264 = wonton_tonic;
  end

always @(wonton_tonic)
  begin
      feedback_pt_265 = wonton_tonic;
  end

wire hoser_holland_wire;

dffeas hoser_holland_ff (
  .clk(clock1),
  .d(foxtrot_ring),
  .ena(gnd),
  .sclr(tesla),
  .sload(red_barty),
  .asdata(army),
  .clrn(!reset1),
  .q(hoser_holland_wire)
);

always @(hoser_holland_wire) begin
   leaky_sanity = hoser_holland_wire;
end

always @(leaky_sanity)
  begin
      feedback_pt_266 = leaky_sanity;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_black <= 0;
    else if (hawaii)
      ramone_black <= correctness;
  end

always @(ramone_black)
  begin
      feedback_pt_267 = ramone_black;
  end

always @(ramone_black)
  begin
      feedback_pt_268 = ramone_black;
  end

always @(ramone_black)
  begin
      feedback_pt_269 = ramone_black;
  end

always @(ramone_black)
  begin
      feedback_pt_270 = ramone_black;
  end

always @(ramone_black)
  begin
      feedback_pt_271 = ramone_black;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intuit_voodoo <= 0;
    else
      intuit_voodoo <= ibm_chief;
  end

always @(intuit_voodoo)
  begin
      feedback_pt_272 = intuit_voodoo;
  end

always @(intuit_voodoo)
  begin
      feedback_pt_273 = intuit_voodoo;
  end

always @(intuit_voodoo)
  begin
      feedback_pt_274 = intuit_voodoo;
  end

always @(intuit_voodoo)
  begin
      feedback_pt_275 = intuit_voodoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spain_stix <= 0;
    else if (uncharted)
      spain_stix <= banshee;
  end

always @(spain_stix)
  begin
      feedback_pt_276 = spain_stix;
  end

always @(spain_stix)
  begin
      feedback_pt_277 = spain_stix;
  end

always @(spain_stix)
  begin
      feedback_pt_278 = spain_stix;
  end

always @(spain_stix)
  begin
      feedback_pt_279 = spain_stix;
  end

always @(spain_stix)
  begin
      feedback_pt_280 = spain_stix;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_tobiko <= 0;
    else if (gnd)
      oscar_tobiko <= vcc;
    else if (voodoo)
      oscar_tobiko <= 0;
  end

always @(oscar_tobiko)
  begin
      feedback_pt_281 = oscar_tobiko;
  end

always @(oscar_tobiko)
  begin
      feedback_pt_282 = oscar_tobiko;
  end

always @(oscar_tobiko)
  begin
      feedback_pt_283 = oscar_tobiko;
  end

always @(oscar_tobiko)
  begin
      feedback_pt_284 = oscar_tobiko;
  end

always @(oscar_tobiko)
  begin
      feedback_pt_285 = oscar_tobiko;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_tinker <= 0;
    else
      deng_tinker <= ohthatcoconut;
  end

always @(deng_tinker)
  begin
      feedback_pt_286 = deng_tinker;
  end

always @(deng_tinker)
  begin
      feedback_pt_287 = deng_tinker;
  end

always @(deng_tinker)
  begin
      feedback_pt_288 = deng_tinker;
  end

wire shemp_floride_wire;

dffea shemp_floride_ff (
  .clk(clock1),
  .d(vcc),
  .ena(broom),
  .adata(broadway),
  .clrn(!reset1),
  .q(shemp_floride_wire)
);

always @(shemp_floride_wire) begin
   crack_donald = shemp_floride_wire;
end

always @(crack_donald)
  begin
      feedback_pt_289 = crack_donald;
  end

wire bathroom_elf_wire;

dffeas bathroom_elf_ff (
  .clk(clock1),
  .d(whale_ocha),
  .ena(exfoliant),
  .sclr(vcc),
  .sload(salsa),
  .asdata(copper_beef),
  .clrn(!reset1),
  .q(bathroom_elf_wire)
);

always @(bathroom_elf_wire) begin
   troll_lemon = bathroom_elf_wire;
end

always @(troll_lemon)
  begin
      feedback_pt_290 = troll_lemon;
  end

wire goblin_bear_wire;

dffea goblin_bear_ff (
  .clk(clock1),
  .d(vcc),
  .ena(snake),
  .adata(gnd),
  .clrn(!reset1),
  .q(goblin_bear_wire)
);

always @(goblin_bear_wire) begin
   parrot_eeevil = goblin_bear_wire;
end

always @(parrot_eeevil)
  begin
      feedback_pt_291 = parrot_eeevil;
  end

wire quebec_webvan_wire;

dffeas quebec_webvan_ff (
  .clk(clock1),
  .d(vcc),
  .ena(desade_touch),
  .sclr(gnd),
  .sload(vcc),
  .asdata(nyc_foliage),
  .clrn(!reset1),
  .q(quebec_webvan_wire)
);

always @(quebec_webvan_wire) begin
   lsd_turnip = quebec_webvan_wire;
end

always @(lsd_turnip)
  begin
      feedback_pt_292 = lsd_turnip;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bach_maryann <= 0;
    else if (gnd)
      bach_maryann <= midas;
    else if (sirius)
      bach_maryann <= 0;
  end

always @(bach_maryann)
  begin
      feedback_pt_293 = bach_maryann;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      danger_pig <= 0;
    else if (wujing)
      danger_pig <= 0;
    else if (decongestant)
      danger_pig <= vcc;
  end

always @(danger_pig)
  begin
      feedback_pt_294 = danger_pig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_sgates <= 0;
    else if (vangoh)
      lotus_sgates <= vcc;
  end

always @(lotus_sgates)
  begin
      feedback_pt_295 = lotus_sgates;
  end

wire pimpernel_moe_wire;

dffea pimpernel_moe_ff (
  .clk(clock1),
  .d(willem),
  .ena(gnd),
  .adata(gnd),
  .clrn(!reset1),
  .q(pimpernel_moe_wire)
);

always @(pimpernel_moe_wire) begin
   dopey_tattoo = pimpernel_moe_wire;
end

always @(dopey_tattoo)
  begin
      feedback_pt_296 = dopey_tattoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ready_tiger <= 1;
    else
      ready_tiger <= gnd;
  end

always @(ready_tiger)
  begin
      feedback_pt_297 = ready_tiger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rasp_stoned <= 0;
    else
      rasp_stoned <= pegasus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      weasley_valve <= 0;
    else
      weasley_valve <= escape_fish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      portnoy_stick <= 0;
    else
      portnoy_stick <= south_norbert;
  end

wire palmer_emails_wire;

dffea palmer_emails_ff (
  .clk(clock1),
  .d(icarus),
  .ena(vcc),
  .adata(snape),
  .clrn(!reset1),
  .q(palmer_emails_wire)
);

always @(palmer_emails_wire) begin
   weevil_solder = palmer_emails_wire;
end

wire isle_fufu_wire;

dffeas isle_fufu_ff (
  .clk(clock1),
  .d(sleeping_art),
  .ena(intuit_voodoo),
  .sclr(schwinger),
  .sload(curie_yankee),
  .asdata(fufu),
  .clrn(!reset1),
  .q(isle_fufu_wire)
);

always @(isle_fufu_wire) begin
   ladder_barnum = isle_fufu_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      guy_steaming <= 0;
    else if (gnd)
      guy_steaming <= 0;
    else if (whatelse)
      guy_steaming <= danger_pig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mike_mcnugget <= 0;
    else if (quidditch)
      mike_mcnugget <= 0;
    else if (vcc)
      mike_mcnugget <= wancensorcens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kebab_nyquil <= 0;
    else
      kebab_nyquil <= blaster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      possum_yoda <= 1;
    else
      possum_yoda <= pegasus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sweetie_grams <= 0;
    else if (gnd)
      sweetie_grams <= copper_beef;
    else if (lsd_turnip)
      sweetie_grams <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      avon_liberace <= 0;
    else
      avon_liberace <= butterfly;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      achilles_lala <= 1;
    else
      achilles_lala <= correctness;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ajax_too_big <= 1;
    else
      ajax_too_big <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chillis_willy <= 1;
    else
      chillis_willy <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dow_amex <= 0;
    else if (gnd)
      dow_amex <= ibm_chief;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lion_popcorn <= 0;
    else if (army_cafe)
      lion_popcorn <= thurston;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kang_bacon <= 0;
    else
      kang_bacon <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popcorn_advil <= 1;
    else
      popcorn_advil <= kebab_nyquil;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gerard_kungfu <= 0;
    else
      gerard_kungfu <= jupiter_ceres;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whale_malfoy <= 1;
    else
      whale_malfoy <= hypnotized;
  end

wire stoned_sake_wire;

dffeas stoned_sake_ff (
  .clk(clock1),
  .d(vcc),
  .ena(hans),
  .sclr(guacamole),
  .sload(ozzy),
  .asdata(wukong),
  .clrn(!reset1),
  .q(stoned_sake_wire)
);

always @(stoned_sake_wire) begin
   tylenol_otter = stoned_sake_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yankee_hoser <= 0;
    else if (blackbeans)
      yankee_hoser <= marge_killme;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bush_wiggles <= 0;
    else
      bush_wiggles <= priest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_eatem <= 0;
    else if (gnd)
      west_eatem <= neville;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kappa_zed <= 1;
    else
      kappa_zed <= bonafide;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beast_uppers <= 0;
    else
      beast_uppers <= kang_bacon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blue_aphid <= 1;
    else
      blue_aphid <= vcc;
  end

wire tasty_ebi_wire;

dffeas tasty_ebi_ff (
  .clk(clock1),
  .d(hinkley),
  .ena(sogood),
  .sclr(moviestar),
  .sload(oranje),
  .asdata(fronds),
  .clrn(!reset1),
  .q(tasty_ebi_wire)
);

always @(tasty_ebi_wire) begin
   jonas_falafel = tasty_ebi_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zulu_eel <= 0;
    else if (jonas_falafel)
      zulu_eel <= banshee;
    else if (banshee)
      zulu_eel <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wildboar_iron <= 0;
    else if (llamas_dont_eat_burrito)
      wildboar_iron <= albus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      madeye_mozart <= 0;
    else if (legos)
      madeye_mozart <= neville;
    else if (gnd)
      madeye_mozart <= 0;
  end

reg feedback_pt_298;

always @(turnip_doobie or feedback_pt_298)
  begin
      obiwan_rabbi = !turnip_doobie ^  feedback_pt_298;
  end

reg feedback_pt_299;

always @(kedavra or feedback_pt_299)
  begin
      tuna_minerva = !kedavra & !feedback_pt_299;
  end

reg feedback_pt_300;

always @(klaas or feedback_pt_300)
  begin
      parrot_doc = !klaas & !feedback_pt_300;
  end

reg feedback_pt_301;

always @(ghost or feedback_pt_301)
  begin
      homerun_stix = !ghost ^ !feedback_pt_301;
  end

reg feedback_pt_302;

always @(cheese_tobiko or feedback_pt_302)
  begin
      edible_amex = !cheese_tobiko &  feedback_pt_302;
  end

reg feedback_pt_303;

always @(jonas or feedback_pt_303)
  begin
      ham_alpha = !jonas |  feedback_pt_303;
  end

reg feedback_pt_304;

always @(hans_kungfu or feedback_pt_304)
  begin
      moody_noah = !hans_kungfu | !feedback_pt_304;
  end

reg feedback_pt_305;

always @(gnd or feedback_pt_305)
  begin
      hagrid_neon = !gnd |  feedback_pt_305;
  end

reg feedback_pt_306;

always @(beef or feedback_pt_306)
  begin
      diagon_willy =  beef | !feedback_pt_306;
  end

reg feedback_pt_307;

always @(incagardens or feedback_pt_307)
  begin
      uppers_speed = !incagardens ^ !feedback_pt_307;
  end

reg feedback_pt_308;

always @(chuck or feedback_pt_308)
  begin
      pentium_tin = !chuck |  feedback_pt_308;
  end

reg feedback_pt_309;

always @(zed or feedback_pt_309)
  begin
      oscar_parrot =  zed |  feedback_pt_309;
  end

reg feedback_pt_310;

always @(deruyter or feedback_pt_310)
  begin
      spain_loser =  deruyter &  feedback_pt_310;
  end

reg feedback_pt_311;

always @(vcc or feedback_pt_311)
  begin
      elian_romeo = !vcc |  feedback_pt_311;
  end

reg feedback_pt_312;

always @(gregg_a or feedback_pt_312)
  begin
      dingbat_palm =  gregg_a |  feedback_pt_312;
  end

reg feedback_pt_313;

always @(gnd or feedback_pt_313)
  begin
      superman_ebi = !gnd |  feedback_pt_313;
  end

reg feedback_pt_314;

always @(pentium_tin or feedback_pt_314)
  begin
      grumby_lucent = !pentium_tin ^  feedback_pt_314;
  end

reg feedback_pt_315;

always @(erasmus or feedback_pt_315)
  begin
      flew_bison = !erasmus | !feedback_pt_315;
  end

reg feedback_pt_316;

always @(arcade or feedback_pt_316)
  begin
      troll_uppers =  arcade | !feedback_pt_316;
  end

reg feedback_pt_317;

always @(gnd or feedback_pt_317)
  begin
      dingbat_tesla = !gnd ^  feedback_pt_317;
  end

reg feedback_pt_318;

always @(gnd or feedback_pt_318)
  begin
      homerun_echo =  gnd ^  feedback_pt_318;
  end

reg feedback_pt_319;

always @(goblin_romex or feedback_pt_319)
  begin
      moulin_crank = !goblin_romex | !feedback_pt_319;
  end

reg feedback_pt_320;

always @(vcc or feedback_pt_320)
  begin
      otter_kedavra =  vcc | !feedback_pt_320;
  end

reg feedback_pt_321;

always @(bach_maryann or feedback_pt_321)
  begin
      kana_zi =  bach_maryann & !feedback_pt_321;
  end

reg feedback_pt_322;

always @(gnd or feedback_pt_322)
  begin
      saturn_simasu =  gnd ^ !feedback_pt_322;
  end

reg feedback_pt_323;

always @(vcc or feedback_pt_323)
  begin
      ready_centaur = !vcc &  feedback_pt_323;
  end

reg feedback_pt_324;

always @(salmon_mickey or feedback_pt_324)
  begin
      rojas_tobe =  salmon_mickey ^ !feedback_pt_324;
  end

reg feedback_pt_325;

always @(levelization or feedback_pt_325)
  begin
      goofy_kappa =  levelization |  feedback_pt_325;
  end

reg feedback_pt_326;

always @(possum_yoda or feedback_pt_326)
  begin
      hoser_zen = !possum_yoda & !feedback_pt_326;
  end

reg feedback_pt_327;

always @(larry or feedback_pt_327)
  begin
      marco_freaky = !larry |  feedback_pt_327;
  end

reg feedback_pt_328;

always @(popcorn_advil or feedback_pt_328)
  begin
      zebra_lad = !popcorn_advil & !feedback_pt_328;
  end

reg feedback_pt_329;

always @(helena_sinus or feedback_pt_329)
  begin
      yellow_wine =  helena_sinus ^  feedback_pt_329;
  end

reg feedback_pt_330;

always @(sourcream or feedback_pt_330)
  begin
      wine_sand =  sourcream |  feedback_pt_330;
  end

reg feedback_pt_331;

always @(gnd or feedback_pt_331)
  begin
      curly_fear =  gnd & !feedback_pt_331;
  end

reg feedback_pt_332;

always @(vcc or feedback_pt_332)
  begin
      kmfdm_school =  vcc ^  feedback_pt_332;
  end

reg feedback_pt_333;

always @(stoner_zed or feedback_pt_333)
  begin
      ocha_hercules = !stoner_zed ^ !feedback_pt_333;
  end

reg feedback_pt_334;

always @(guy_steaming or feedback_pt_334)
  begin
      gin_ceres = !guy_steaming & !feedback_pt_334;
  end

reg feedback_pt_335;

always @(gnd or feedback_pt_335)
  begin
      tonic_dutch =  gnd &  feedback_pt_335;
  end

reg feedback_pt_336;

always @(curly_fear or feedback_pt_336)
  begin
      midas_hippo = !curly_fear |  feedback_pt_336;
  end

reg feedback_pt_337;

always @(zhuang or feedback_pt_337)
  begin
      moody_zhuang = !zhuang ^  feedback_pt_337;
  end

reg feedback_pt_338;

always @(stoner_saturn or feedback_pt_338)
  begin
      whiskey_alpha =  stoner_saturn | !feedback_pt_338;
  end

reg feedback_pt_339;

always @(deng or feedback_pt_339)
  begin
      howell_malfoy = !deng ^ !feedback_pt_339;
  end

reg feedback_pt_340;

always @(vcc or feedback_pt_340)
  begin
      sears_george =  vcc |  feedback_pt_340;
  end

reg feedback_pt_341;

always @(whale_malfoy or feedback_pt_341)
  begin
      cybex_air = !whale_malfoy | !feedback_pt_341;
  end

reg feedback_pt_342;

always @(gnd or feedback_pt_342)
  begin
      trevor_jiminy =  gnd &  feedback_pt_342;
  end

reg feedback_pt_343;

always @(monster or feedback_pt_343)
  begin
      dorkus_marge = !monster & !feedback_pt_343;
  end

reg feedback_pt_344;

always @(deng_tinker or feedback_pt_344)
  begin
      moe_carolina =  deng_tinker |  feedback_pt_344;
  end

reg feedback_pt_345;

always @(ohisee_malfoy or feedback_pt_345)
  begin
      doc_bathroom = !ohisee_malfoy | !feedback_pt_345;
  end

reg feedback_pt_346;

always @(rufus or feedback_pt_346)
  begin
      fury_saturn =  rufus | !feedback_pt_346;
  end

reg feedback_pt_347;

always @(marge_killme or feedback_pt_347)
  begin
      hiway_jesus = !marge_killme ^ !feedback_pt_347;
  end

reg feedback_pt_348;

always @(banshee or feedback_pt_348)
  begin
      bison_mexican =  banshee &  feedback_pt_348;
  end

reg feedback_pt_349;

always @(vcc or feedback_pt_349)
  begin
      wanton_flew = !vcc | !feedback_pt_349;
  end

reg feedback_pt_350;

always @(vcc or feedback_pt_350)
  begin
      killer_ready =  vcc |  feedback_pt_350;
  end

reg feedback_pt_351;

always @(beef or feedback_pt_351)
  begin
      stemcell_zed = !beef ^  feedback_pt_351;
  end

reg feedback_pt_352;

always @(yellow_wine or feedback_pt_352)
  begin
      valve_loud = !yellow_wine |  feedback_pt_352;
  end

reg feedback_pt_353;

always @(wheezer or feedback_pt_353)
  begin
      viagra_filch =  wheezer & !feedback_pt_353;
  end

reg feedback_pt_354;

always @(west_eatem or feedback_pt_354)
  begin
      peaves_dutch =  west_eatem & !feedback_pt_354;
  end

reg feedback_pt_355;

always @(gnd or feedback_pt_355)
  begin
      tabby_guy =  gnd | !feedback_pt_355;
  end

reg feedback_pt_356;

always @(ghost or feedback_pt_356)
  begin
      bacon_gyro = !ghost | !feedback_pt_356;
  end

reg feedback_pt_357;

always @(snape or feedback_pt_357)
  begin
      ready_chips =  snape ^  feedback_pt_357;
  end

reg feedback_pt_358;

always @(bacon_gyro or feedback_pt_358)
  begin
      copper_gerrit =  bacon_gyro ^  feedback_pt_358;
  end

reg feedback_pt_359;

always @(jalapeno or feedback_pt_359)
  begin
      water_foryou = !jalapeno &  feedback_pt_359;
  end

reg feedback_pt_360;

always @(giraffe or feedback_pt_360)
  begin
      show_mrbill = !giraffe ^ !feedback_pt_360;
  end

reg feedback_pt_361;

always @(doc_bathroom or feedback_pt_361)
  begin
      tin_lestrange =  doc_bathroom | !feedback_pt_361;
  end

reg feedback_pt_362;

always @(banshee or feedback_pt_362)
  begin
      draco_october =  banshee | !feedback_pt_362;
  end

reg feedback_pt_363;

always @(draco_october or feedback_pt_363)
  begin
      clay_yohimbe = !draco_october &  feedback_pt_363;
  end

reg feedback_pt_364;

always @(chillis_willy or feedback_pt_364)
  begin
      beef_covad = !chillis_willy | !feedback_pt_364;
  end

reg feedback_pt_365;

always @(water_foryou or feedback_pt_365)
  begin
      curious_moron = !water_foryou ^ !feedback_pt_365;
  end

reg feedback_pt_366;

always @(vcc or feedback_pt_366)
  begin
      chief_bambi =  vcc ^ !feedback_pt_366;
  end

reg feedback_pt_367;

always @(tonic_dutch or feedback_pt_367)
  begin
      rat_wakey = !tonic_dutch ^ !feedback_pt_367;
  end

reg feedback_pt_368;

always @(sun_milhouse or feedback_pt_368)
  begin
      aspirin_ritsu = !sun_milhouse & !feedback_pt_368;
  end

reg feedback_pt_369;

always @(salsa or feedback_pt_369)
  begin
      tonks_snake = !salsa |  feedback_pt_369;
  end

reg feedback_pt_370;

always @(gnd or feedback_pt_370)
  begin
      what_husks =  gnd |  feedback_pt_370;
  end

reg feedback_pt_371;

always @(deng or feedback_pt_371)
  begin
      newt_sirius = !deng |  feedback_pt_371;
  end

reg feedback_pt_372;

always @(danger_pig or feedback_pt_372)
  begin
      crack_lamer = !danger_pig | !feedback_pt_372;
  end

reg feedback_pt_373;

always @(danger_star or feedback_pt_373)
  begin
      egg_homer =  danger_star | !feedback_pt_373;
  end

// Random combinatorial logic block
always@(*)
  begin
      fear_star = ~( ~( ( ~( ~( ~zeus ) ^ ( boing & dirk ) ) ) ) ) & ( ( ~( ( ~( vcc ) & ~( vcc ) ) ^ ~( ~( vcc ) ) ) ) & ~( ~( xbncensorcens | ~spastic ) ) );
  end

  always@(*)
  begin
    rojas_kungfu = ( ~( ~( ~( ( ~gnd & waffle ) ) ) ) ^ ~( ( ~( ~( ~iguana_bullet ) | ~( ~parrot_eeevil ) ) ) ^ ( ~( guacamole & ( ~( ~aspirin_ritsu | ~tango_saturn ) ) ) ) ) ) ? ( ~( ( ( hinkley & ~skipper ) | viagra ) | ( ~( ~( ( ~( ~( ~hiswife ) ^ ~( kappa ) ) ) ) | ~( ( ~( leaky_sanity & ~gerrit_gyro & ~( gerard ) ) ) ) ) ) ) ) : ~( ~( ~( ( ~( ( ~gnd & uomcensor ) | ~( ~marco_freaky ) ) ) ) ) );
  end
// 7 bit divide
always @(vcc or elian_romeo or army or lucius or vcc or dow_amex or helena_sinus or wicked or tabby_guy or tango_saturn or valve_loud or vcc or hagrid_neon or homerun_stix)
  begin
    if ({wicked,tabby_guy,tango_saturn,valve_loud,vcc,hagrid_neon,homerun_stix} == 0)
       {solder_issac,kabar_whiskey,eel_zinc,pluto_psycho,yak_brothers,moreand_willy,ajax_psycho} = 0;
    else 
      {solder_issac,kabar_whiskey,eel_zinc,pluto_psycho,yak_brothers,moreand_willy,ajax_psycho} = 
	  	  {vcc,elian_romeo,army,lucius,vcc,dow_amex,helena_sinus} / 
		  {wicked,tabby_guy,tango_saturn,valve_loud,vcc,hagrid_neon,homerun_stix};
  end

// Start of 8 bit LFSR hp_eeevil...
always @(posedge reset1 or posedge clock1)
  begin
    if (reset1)
      hp_eeevil_reg <= 8'b00000000;
    else
      hp_eeevil_reg <= hp_eeevil_next;
  end

always @(hp_eeevil_reg or vcc or hp_eeevil_b0 or hp_eeevil_fbk)
  begin
    hp_eeevil_b0 = ~| hp_eeevil_reg[6:0];
    hp_eeevil_fbk = hp_eeevil_reg[7] ^ hp_eeevil_b0 ^ vcc;
    for (hp_eeevil_n=7; hp_eeevil_n>=1; hp_eeevil_n=hp_eeevil_n-1)
      if (hp_eeevil_taps[hp_eeevil_n-1] == 1)
        hp_eeevil_next[hp_eeevil_n]=hp_eeevil_reg[hp_eeevil_n-1] ^ hp_eeevil_fbk;
      else
        hp_eeevil_next[hp_eeevil_n]=hp_eeevil_reg[hp_eeevil_n-1];
    hp_eeevil_next[0]=hp_eeevil_fbk;
    {mushroom_dork,boots_yellow,oscar_bonker,bomb_yohimbe,sun_tesla,metal_dog,tabby_moses,kanji_uppers} = hp_eeevil_reg ^ 58;
  end

// XOR all of these bits together
always @(crack_lamer or chips)
  begin
      nobody_zeus = ^ {crack_lamer,chips};
  end

// 7 bit priority MUX
always @(
        spirit_shuda or yohimbe  or 
        lotus_sgates or vcc  or 
        gnd or gnd  or 
        troll_lemon or floo_xray  or 
        pcp or armand  or 
        ready_chips or dow_amex  or 
        lotus_sgates or oscar_parrot 
)

  begin
    if (spirit_shuda) tesla_scrooge = yohimbe;
    else if (lotus_sgates) tesla_scrooge = vcc;
    else if (gnd) tesla_scrooge = gnd;
    else if (troll_lemon) tesla_scrooge = floo_xray;
    else if (pcp) tesla_scrooge = armand;
    else if (ready_chips) tesla_scrooge = dow_amex;
    else if (lotus_sgates) tesla_scrooge = oscar_parrot;
    else tesla_scrooge = 0;
  end

// NAND all of these bits together
always @(newt_sirius or danger_pig or bacon_gyro or cybex_air or army or what_husks or pluto_exodus or cybex_air or gnd)
  begin
      pdiddy_dirty = ~& {newt_sirius,danger_pig,bacon_gyro,cybex_air,army,what_husks,pluto_exodus,cybex_air,gnd};
  end

reg feedback_pt_374;

always @(crack_donald or feedback_pt_374)
  begin
      neville_beef = !crack_donald | !feedback_pt_374;
  end

reg feedback_pt_375;

always @(portnoy_stick or feedback_pt_375)
  begin
      whacky_husks =  portnoy_stick &  feedback_pt_375;
  end

reg feedback_pt_376;

always @(beef_covad or feedback_pt_376)
  begin
      shark_palm =  beef_covad | !feedback_pt_376;
  end

reg feedback_pt_377;

always @(howell_malfoy or feedback_pt_377)
  begin
      loud_ariel =  howell_malfoy ^  feedback_pt_377;
  end

reg feedback_pt_378;

always @(neptune or feedback_pt_378)
  begin
      fortuyn_heidi =  neptune ^ !feedback_pt_378;
  end

reg feedback_pt_379;

always @(neville_beef or feedback_pt_379)
  begin
      mushroom_zed = !neville_beef &  feedback_pt_379;
  end

reg feedback_pt_380;

always @(peaves_dutch or feedback_pt_380)
  begin
      brian_zulu =  peaves_dutch ^ !feedback_pt_380;
  end

reg feedback_pt_381;

always @(tasty or feedback_pt_381)
  begin
      priest_echo = !tasty | !feedback_pt_381;
  end

reg feedback_pt_382;

always @(gnd or feedback_pt_382)
  begin
      dork_love_in = !gnd & !feedback_pt_382;
  end

reg feedback_pt_383;

always @(peace_boots or feedback_pt_383)
  begin
      kang_tsmc =  peace_boots ^ !feedback_pt_383;
  end

reg feedback_pt_384;

always @(vcc or feedback_pt_384)
  begin
      boots_cuckoo =  vcc ^  feedback_pt_384;
  end

reg feedback_pt_385;

always @(kappa_zed or feedback_pt_385)
  begin
      cybex_saturn = !kappa_zed ^ !feedback_pt_385;
  end

reg feedback_pt_386;

always @(bacon_gyro or feedback_pt_386)
  begin
      skipper_happy = !bacon_gyro &  feedback_pt_386;
  end

reg feedback_pt_387;

always @(bomb_yohimbe or feedback_pt_387)
  begin
      what_peta = !bomb_yohimbe ^  feedback_pt_387;
  end

reg feedback_pt_388;

always @(pdiddy_dirty or feedback_pt_388)
  begin
      midas_trevor =  pdiddy_dirty &  feedback_pt_388;
  end

reg feedback_pt_389;

always @(dukdodger or feedback_pt_389)
  begin
      donkey_genji = !dukdodger & !feedback_pt_389;
  end

reg feedback_pt_390;

always @(skinner_ohno or feedback_pt_390)
  begin
      starwars_gyro =  skinner_ohno & !feedback_pt_390;
  end

reg feedback_pt_391;

always @(ocha_hercules or feedback_pt_391)
  begin
      century_biker = !ocha_hercules | !feedback_pt_391;
  end

reg feedback_pt_392;

always @(troll_uppers or feedback_pt_392)
  begin
      dow_rubeus = !troll_uppers ^  feedback_pt_392;
  end

reg feedback_pt_393;

always @(tango_loud or feedback_pt_393)
  begin
      bush_gutter =  tango_loud | !feedback_pt_393;
  end

reg feedback_pt_394;

always @(zulu_hagrid or feedback_pt_394)
  begin
      sun_wannabe =  zulu_hagrid ^ !feedback_pt_394;
  end

reg feedback_pt_395;

always @(vcc or feedback_pt_395)
  begin
      guy_ykocens =  vcc &  feedback_pt_395;
  end

reg feedback_pt_396;

always @(bacon or feedback_pt_396)
  begin
      sake_ocha =  bacon | !feedback_pt_396;
  end

reg feedback_pt_397;

always @(tuna_minerva or feedback_pt_397)
  begin
      oscar_gin = !tuna_minerva & !feedback_pt_397;
  end

reg feedback_pt_398;

always @(spastic or feedback_pt_398)
  begin
      nasdaq_iron =  spastic &  feedback_pt_398;
  end

reg feedback_pt_399;

always @(vangoh or feedback_pt_399)
  begin
      po_killme =  vangoh & !feedback_pt_399;
  end

reg feedback_pt_400;

always @(vcc or feedback_pt_400)
  begin
      zinc_bust =  vcc ^ !feedback_pt_400;
  end

reg feedback_pt_401;

always @(lost or feedback_pt_401)
  begin
      joker_gotone =  lost ^  feedback_pt_401;
  end

reg feedback_pt_402;

always @(gnd or feedback_pt_402)
  begin
      rojas_norbert =  gnd ^  feedback_pt_402;
  end

reg feedback_pt_403;

always @(hurt_saturn or feedback_pt_403)
  begin
      iguana_buddha = !hurt_saturn &  feedback_pt_403;
  end

reg feedback_pt_404;

always @(icarus or feedback_pt_404)
  begin
      otter_hotel =  icarus ^ !feedback_pt_404;
  end

reg feedback_pt_405;

always @(gnd or feedback_pt_405)
  begin
      books_gojira =  gnd |  feedback_pt_405;
  end

reg feedback_pt_406;

always @(georgec or feedback_pt_406)
  begin
      tiger_drugs =  georgec &  feedback_pt_406;
  end

reg feedback_pt_407;

always @(ladder_barnum or feedback_pt_407)
  begin
      pdaddy_powder = !ladder_barnum |  feedback_pt_407;
  end

reg feedback_pt_408;

always @(vcc or feedback_pt_408)
  begin
      beauty_coffee =  vcc | !feedback_pt_408;
  end

reg feedback_pt_409;

always @(beast_uppers or feedback_pt_409)
  begin
      tabasco_snape =  beast_uppers ^  feedback_pt_409;
  end

reg feedback_pt_410;

always @(speeding or feedback_pt_410)
  begin
      quail_minnie =  speeding ^  feedback_pt_410;
  end

reg feedback_pt_411;

always @(lao or feedback_pt_411)
  begin
      barney_cannon = !lao &  feedback_pt_411;
  end

reg feedback_pt_412;

always @(gnd or feedback_pt_412)
  begin
      ghost_asahi = !gnd &  feedback_pt_412;
  end

reg feedback_pt_413;

always @(tofu_leidiot or feedback_pt_413)
  begin
      pirate_mrbill = !tofu_leidiot |  feedback_pt_413;
  end

reg feedback_pt_414;

always @(vcc or feedback_pt_414)
  begin
      black_intuit = !vcc ^ !feedback_pt_414;
  end

reg feedback_pt_415;

always @(hiway_jesus or feedback_pt_415)
  begin
      atomic_lad =  hiway_jesus & !feedback_pt_415;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shark_peace <= 1;
    else
      shark_peace <= ostrich_gap;
  end

always @(shark_peace)
  begin
      feedback_pt_298 = shark_peace;
  end

always @(shark_peace)
  begin
      feedback_pt_299 = shark_peace;
  end

always @(shark_peace)
  begin
      feedback_pt_300 = shark_peace;
  end

always @(shark_peace)
  begin
      feedback_pt_301 = shark_peace;
  end

always @(shark_peace)
  begin
      feedback_pt_302 = shark_peace;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      suffering_gm <= 0;
    else if (bison_mexican)
      suffering_gm <= pirate_mrbill;
    else if (vcc)
      suffering_gm <= 0;
  end

always @(suffering_gm)
  begin
      feedback_pt_303 = suffering_gm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spyro_lima <= 0;
    else
      spyro_lima <= gnd;
  end

always @(spyro_lima)
  begin
      feedback_pt_304 = spyro_lima;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lao_beef <= 0;
    else if (gnd)
      lao_beef <= 0;
    else if (yak_brothers)
      lao_beef <= edible_amex;
  end

always @(lao_beef)
  begin
      feedback_pt_305 = lao_beef;
  end

always @(lao_beef)
  begin
      feedback_pt_306 = lao_beef;
  end

always @(lao_beef)
  begin
      feedback_pt_307 = lao_beef;
  end

always @(lao_beef)
  begin
      feedback_pt_308 = lao_beef;
  end

always @(lao_beef)
  begin
      feedback_pt_309 = lao_beef;
  end

wire todd_malfoy_wire;

dffeas todd_malfoy_ff (
  .clk(clock1),
  .d(vcc),
  .ena(boots_cuckoo),
  .sclr(beauty_coffee),
  .sload(zinc_bust),
  .asdata(uppers_speed),
  .clrn(!reset1),
  .q(todd_malfoy_wire)
);

always @(todd_malfoy_wire) begin
   hulk_booming = todd_malfoy_wire;
end

always @(hulk_booming)
  begin
      feedback_pt_310 = hulk_booming;
  end

wire eunice_eunice_wire;

dffea eunice_eunice_ff (
  .clk(clock1),
  .d(vcc),
  .ena(cybex_saturn),
  .adata(gnd),
  .clrn(!reset1),
  .q(eunice_eunice_wire)
);

always @(eunice_eunice_wire) begin
   marco_thread = eunice_eunice_wire;
end

always @(marco_thread)
  begin
      feedback_pt_311 = marco_thread;
  end

always @(marco_thread)
  begin
      feedback_pt_312 = marco_thread;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sanity_fallen <= 0;
    else if (popcorn_advil)
      sanity_fallen <= ocha_hercules;
  end

always @(sanity_fallen)
  begin
      feedback_pt_313 = sanity_fallen;
  end

always @(sanity_fallen)
  begin
      feedback_pt_314 = sanity_fallen;
  end

always @(sanity_fallen)
  begin
      feedback_pt_315 = sanity_fallen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dopey_bomb <= 0;
    else if (condit_yak)
      dopey_bomb <= gnd;
    else if (tiger_drugs)
      dopey_bomb <= 0;
  end

always @(dopey_bomb)
  begin
      feedback_pt_316 = dopey_bomb;
  end

always @(dopey_bomb)
  begin
      feedback_pt_317 = dopey_bomb;
  end

wire ebi_bubba_wire;

dffeas ebi_bubba_ff (
  .clk(clock1),
  .d(solder_troll),
  .ena(fear_star),
  .sclr(fortuyn_heidi),
  .sload(suffering_gm),
  .asdata(george),
  .clrn(!reset1),
  .q(ebi_bubba_wire)
);

always @(ebi_bubba_wire) begin
   roid_kungfu = ebi_bubba_wire;
end

always @(roid_kungfu)
  begin
      feedback_pt_318 = roid_kungfu;
  end

always @(roid_kungfu)
  begin
      feedback_pt_319 = roid_kungfu;
  end

always @(roid_kungfu)
  begin
      feedback_pt_320 = roid_kungfu;
  end

wire hans_ritsu_wire;

dffeas hans_ritsu_ff (
  .clk(clock1),
  .d(priest_echo),
  .ena(solder_issac),
  .sclr(donkey_genji),
  .sload(rerun),
  .asdata(beast),
  .clrn(!reset1),
  .q(hans_ritsu_wire)
);

always @(hans_ritsu_wire) begin
   rewire_bubba = hans_ritsu_wire;
end

always @(rewire_bubba)
  begin
      feedback_pt_321 = rewire_bubba;
  end

always @(rewire_bubba)
  begin
      feedback_pt_322 = rewire_bubba;
  end

always @(rewire_bubba)
  begin
      feedback_pt_323 = rewire_bubba;
  end

always @(rewire_bubba)
  begin
      feedback_pt_324 = rewire_bubba;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wildboar_mao <= 0;
    else if (helena)
      wildboar_mao <= nation;
    else if (vcc)
      wildboar_mao <= 0;
  end

always @(wildboar_mao)
  begin
      feedback_pt_325 = wildboar_mao;
  end

always @(wildboar_mao)
  begin
      feedback_pt_326 = wildboar_mao;
  end

always @(wildboar_mao)
  begin
      feedback_pt_327 = wildboar_mao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_donut <= 0;
    else if (wallstreet)
      money_donut <= 0;
    else if (vcc)
      money_donut <= cluckU_fuji;
  end

always @(money_donut)
  begin
      feedback_pt_328 = money_donut;
  end

always @(money_donut)
  begin
      feedback_pt_329 = money_donut;
  end

always @(money_donut)
  begin
      feedback_pt_330 = money_donut;
  end

wire freaky_amex_wire;

dffeas freaky_amex_ff (
  .clk(clock1),
  .d(weevil_solder),
  .ena(tofu_leidiot),
  .sclr(kana_zi),
  .sload(tabby_moses),
  .asdata(gnd),
  .clrn(!reset1),
  .q(freaky_amex_wire)
);

always @(freaky_amex_wire) begin
   waffle_midas = freaky_amex_wire;
end

always @(waffle_midas)
  begin
      feedback_pt_331 = waffle_midas;
  end

always @(waffle_midas)
  begin
      feedback_pt_332 = waffle_midas;
  end

always @(waffle_midas)
  begin
      feedback_pt_333 = waffle_midas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wizard_norris <= 0;
    else if (yankee_hoser)
      wizard_norris <= gnd;
  end

always @(wizard_norris)
  begin
      feedback_pt_334 = wizard_norris;
  end

always @(wizard_norris)
  begin
      feedback_pt_335 = wizard_norris;
  end

wire tango_would_wire;

dffeas tango_would_ff (
  .clk(clock1),
  .d(aphid_bullet),
  .ena(oscar_bonker),
  .sclr(suffering_gm),
  .sload(gnd),
  .asdata(tylenol),
  .clrn(!reset1),
  .q(tango_would_wire)
);

always @(tango_would_wire) begin
   black_kebab = tango_would_wire;
end

always @(black_kebab)
  begin
      feedback_pt_336 = black_kebab;
  end

always @(black_kebab)
  begin
      feedback_pt_337 = black_kebab;
  end

always @(black_kebab)
  begin
      feedback_pt_338 = black_kebab;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      show_bacon <= 1;
    else
      show_bacon <= donkey_genji;
  end

always @(show_bacon)
  begin
      feedback_pt_339 = show_bacon;
  end

always @(show_bacon)
  begin
      feedback_pt_340 = show_bacon;
  end

always @(show_bacon)
  begin
      feedback_pt_341 = show_bacon;
  end

always @(show_bacon)
  begin
      feedback_pt_342 = show_bacon;
  end

always @(show_bacon)
  begin
      feedback_pt_343 = show_bacon;
  end

wire coffee_wujing_wire;

dffeas coffee_wujing_ff (
  .clk(clock1),
  .d(vcc),
  .ena(vcc),
  .sclr(larry),
  .sload(vcc),
  .asdata(longbottom),
  .clrn(!reset1),
  .q(coffee_wujing_wire)
);

always @(coffee_wujing_wire) begin
   master_elf = coffee_wujing_wire;
end

always @(master_elf)
  begin
      feedback_pt_344 = master_elf;
  end

always @(master_elf)
  begin
      feedback_pt_345 = master_elf;
  end

always @(master_elf)
  begin
      feedback_pt_346 = master_elf;
  end

always @(master_elf)
  begin
      feedback_pt_347 = master_elf;
  end

wire cartman_hurt_wire;

dffeas cartman_hurt_ff (
  .clk(clock1),
  .d(vcc),
  .ena(goofy_kappa),
  .sclr(zinc_bust),
  .sload(pdaddy_powder),
  .asdata(dow_rubeus),
  .clrn(!reset1),
  .q(cartman_hurt_wire)
);

always @(cartman_hurt_wire) begin
   purple_maki = cartman_hurt_wire;
end

always @(purple_maki)
  begin
      feedback_pt_348 = purple_maki;
  end

always @(purple_maki)
  begin
      feedback_pt_349 = purple_maki;
  end

wire lala_agitator_wire;

dffeas lala_agitator_ff (
  .clk(clock1),
  .d(tylenol),
  .ena(beef),
  .sclr(moody_noah),
  .sload(hoser_zen),
  .asdata(gnd),
  .clrn(!reset1),
  .q(lala_agitator_wire)
);

always @(lala_agitator_wire) begin
   baron_juliet = lala_agitator_wire;
end

always @(baron_juliet)
  begin
      feedback_pt_350 = baron_juliet;
  end

always @(baron_juliet)
  begin
      feedback_pt_351 = baron_juliet;
  end

always @(baron_juliet)
  begin
      feedback_pt_352 = baron_juliet;
  end

always @(baron_juliet)
  begin
      feedback_pt_353 = baron_juliet;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yoda_kangaroo <= 0;
    else if (enoch)
      yoda_kangaroo <= gilligan;
    else if (hut)
      yoda_kangaroo <= 0;
  end

always @(yoda_kangaroo)
  begin
      feedback_pt_354 = yoda_kangaroo;
  end

always @(yoda_kangaroo)
  begin
      feedback_pt_355 = yoda_kangaroo;
  end

always @(yoda_kangaroo)
  begin
      feedback_pt_356 = yoda_kangaroo;
  end

always @(yoda_kangaroo)
  begin
      feedback_pt_357 = yoda_kangaroo;
  end

always @(yoda_kangaroo)
  begin
      feedback_pt_358 = yoda_kangaroo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      banshee_think <= 1;
    else
      banshee_think <= yoda_kangaroo;
  end

always @(banshee_think)
  begin
      feedback_pt_359 = banshee_think;
  end

always @(banshee_think)
  begin
      feedback_pt_360 = banshee_think;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      martin_bolt <= 0;
    else if (gnd)
      martin_bolt <= 0;
    else if (vcc)
      martin_bolt <= gnd;
  end

always @(martin_bolt)
  begin
      feedback_pt_361 = martin_bolt;
  end

always @(martin_bolt)
  begin
      feedback_pt_362 = martin_bolt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bush_kbtoys <= 0;
    else if (wicked)
      bush_kbtoys <= baron_juliet;
    else if (zi)
      bush_kbtoys <= 0;
  end

always @(bush_kbtoys)
  begin
      feedback_pt_363 = bush_kbtoys;
  end

always @(bush_kbtoys)
  begin
      feedback_pt_364 = bush_kbtoys;
  end

always @(bush_kbtoys)
  begin
      feedback_pt_365 = bush_kbtoys;
  end

always @(bush_kbtoys)
  begin
      feedback_pt_366 = bush_kbtoys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mideast_bolt <= 0;
    else if (copper_gerrit)
      mideast_bolt <= beef;
  end

always @(mideast_bolt)
  begin
      feedback_pt_367 = mideast_bolt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minnow_marco <= 0;
    else
      minnow_marco <= stemcell_zed;
  end

always @(minnow_marco)
  begin
      feedback_pt_368 = minnow_marco;
  end

always @(minnow_marco)
  begin
      feedback_pt_369 = minnow_marco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hurt_rose <= 0;
    else
      hurt_rose <= gnd;
  end

always @(hurt_rose)
  begin
      feedback_pt_370 = hurt_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hours_green <= 0;
    else if (shark_peace)
      hours_green <= gnd;
  end

always @(hours_green)
  begin
      feedback_pt_371 = hours_green;
  end

always @(hours_green)
  begin
      feedback_pt_372 = hours_green;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      venus_elian <= 0;
    else if (vcc)
      venus_elian <= grumby_lucent;
  end

always @(venus_elian)
  begin
      feedback_pt_373 = venus_elian;
  end

always @(venus_elian)
  begin
      feedback_pt_374 = venus_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pyro_zipporah <= 1;
    else
      pyro_zipporah <= zedong;
  end

always @(pyro_zipporah)
  begin
      feedback_pt_375 = pyro_zipporah;
  end

always @(pyro_zipporah)
  begin
      feedback_pt_376 = pyro_zipporah;
  end

always @(pyro_zipporah)
  begin
      feedback_pt_377 = pyro_zipporah;
  end

always @(pyro_zipporah)
  begin
      feedback_pt_378 = pyro_zipporah;
  end

always @(pyro_zipporah)
  begin
      feedback_pt_379 = pyro_zipporah;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killer_marker <= 0;
    else if (atchoo_deng)
      killer_marker <= 0;
    else if (waffle_midas)
      killer_marker <= stroop;
  end

always @(killer_marker)
  begin
      feedback_pt_380 = killer_marker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snake_marco <= 0;
    else if (dopey_bomb)
      snake_marco <= beast;
    else if (sears_george)
      snake_marco <= 0;
  end

always @(snake_marco)
  begin
      feedback_pt_381 = snake_marco;
  end

always @(snake_marco)
  begin
      feedback_pt_382 = snake_marco;
  end

always @(snake_marco)
  begin
      feedback_pt_383 = snake_marco;
  end

always @(snake_marco)
  begin
      feedback_pt_384 = snake_marco;
  end

always @(snake_marco)
  begin
      feedback_pt_385 = snake_marco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bubba_peta <= 0;
    else if (yellow_wine)
      bubba_peta <= 0;
    else if (vcc)
      bubba_peta <= spyro_lima;
  end

always @(bubba_peta)
  begin
      feedback_pt_386 = bubba_peta;
  end

always @(bubba_peta)
  begin
      feedback_pt_387 = bubba_peta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honda_pdaddy <= 0;
    else if (killer)
      honda_pdaddy <= lotus_sgates;
  end

always @(honda_pdaddy)
  begin
      feedback_pt_388 = honda_pdaddy;
  end

wire midas_macys_wire;

dffeas midas_macys_ff (
  .clk(clock1),
  .d(weevil_tako),
  .ena(egg_homer),
  .sclr(minnow_marco),
  .sload(wonton_tonic),
  .asdata(gnd),
  .clrn(!reset1),
  .q(midas_macys_wire)
);

always @(midas_macys_wire) begin
   zed_orange = midas_macys_wire;
end

always @(zed_orange)
  begin
      feedback_pt_389 = zed_orange;
  end

wire drevil_spirit_wire;

dffeas drevil_spirit_ff (
  .clk(clock1),
  .d(mexican),
  .ena(kabar_whiskey),
  .sclr(whacky_husks),
  .sload(wildboar_mao),
  .asdata(honda_pdaddy),
  .clrn(!reset1),
  .q(drevil_spirit_wire)
);

always @(drevil_spirit_wire) begin
   ulysses_nyc = drevil_spirit_wire;
end

always @(ulysses_nyc)
  begin
      feedback_pt_390 = ulysses_nyc;
  end

always @(ulysses_nyc)
  begin
      feedback_pt_391 = ulysses_nyc;
  end

always @(ulysses_nyc)
  begin
      feedback_pt_392 = ulysses_nyc;
  end

wire mine_ostrich_wire;

dffeas mine_ostrich_ff (
  .clk(clock1),
  .d(tuna_minerva),
  .ena(professor),
  .sclr(peace_boots),
  .sload(whiskey_alpha),
  .asdata(picante),
  .clrn(!reset1),
  .q(mine_ostrich_wire)
);

always @(mine_ostrich_wire) begin
   art_zed = mine_ostrich_wire;
end

always @(art_zed)
  begin
      feedback_pt_393 = art_zed;
  end

always @(art_zed)
  begin
      feedback_pt_394 = art_zed;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      what_intel <= 0;
    else if (professor)
      what_intel <= 0;
    else if (bep)
      what_intel <= lotus;
  end

always @(what_intel)
  begin
      feedback_pt_395 = what_intel;
  end

always @(what_intel)
  begin
      feedback_pt_396 = what_intel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gopher_minnow <= 0;
    else
      gopher_minnow <= trevor_jiminy;
  end

always @(gopher_minnow)
  begin
      feedback_pt_397 = gopher_minnow;
  end

always @(gopher_minnow)
  begin
      feedback_pt_398 = gopher_minnow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neon_snape <= 0;
    else if (wildboar_mao)
      neon_snape <= 0;
    else if (donkey_genji)
      neon_snape <= sanity_fallen;
  end

always @(neon_snape)
  begin
      feedback_pt_399 = neon_snape;
  end

wire rufus_advil_wire;

dffeas rufus_advil_ff (
  .clk(clock1),
  .d(rescue),
  .ena(chief_bambi),
  .sclr(moe_carolina),
  .sload(viagra),
  .asdata(desade_touch),
  .clrn(!reset1),
  .q(rufus_advil_wire)
);

always @(rufus_advil_wire) begin
   zedong_lucius = rufus_advil_wire;
end

always @(zedong_lucius)
  begin
      feedback_pt_400 = zedong_lucius;
  end

always @(zedong_lucius)
  begin
      feedback_pt_401 = zedong_lucius;
  end

wire sake_bullet_wire;

dffeas sake_bullet_ff (
  .clk(clock1),
  .d(gulp),
  .ena(vcc),
  .sclr(tuna_minerva),
  .sload(sake_ocha),
  .asdata(bach_onion),
  .clrn(!reset1),
  .q(sake_bullet_wire)
);

always @(sake_bullet_wire) begin
   foryou_rubik = sake_bullet_wire;
end

always @(foryou_rubik)
  begin
      feedback_pt_402 = foryou_rubik;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chairman_bfs <= 0;
    else if (madeye_mozart)
      chairman_bfs <= 0;
    else if (vcc)
      chairman_bfs <= vcc;
  end

always @(chairman_bfs)
  begin
      feedback_pt_403 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_404 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_405 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_406 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_407 = chairman_bfs;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sgates_thedon <= 0;
    else
      sgates_thedon <= dingbat_palm;
  end

always @(sgates_thedon)
  begin
      feedback_pt_408 = sgates_thedon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hulk_atomic <= 0;
    else if (hours_green)
      hulk_atomic <= achilles_lala;
  end

always @(hulk_atomic)
  begin
      feedback_pt_409 = hulk_atomic;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peace_broom <= 0;
    else
      peace_broom <= lad;
  end

always @(peace_broom)
  begin
      feedback_pt_410 = peace_broom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_illegal <= 0;
    else if (minnow_marco)
      boing_illegal <= webvan;
    else if (chillis_avon)
      boing_illegal <= 0;
  end

always @(boing_illegal)
  begin
      feedback_pt_411 = boing_illegal;
  end

wire nobody_martin_wire;

dffea nobody_martin_ff (
  .clk(clock1),
  .d(howell_malfoy),
  .ena(roid_kungfu),
  .adata(gnd),
  .clrn(!reset1),
  .q(nobody_martin_wire)
);

always @(nobody_martin_wire) begin
   kang_minnie = nobody_martin_wire;
end

always @(kang_minnie)
  begin
      feedback_pt_412 = kang_minnie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fortuyn_lamer <= 0;
    else
      fortuyn_lamer <= flew_bison;
  end

always @(fortuyn_lamer)
  begin
      feedback_pt_413 = fortuyn_lamer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pacific_asahi <= 1;
    else
      pacific_asahi <= vcc;
  end

always @(pacific_asahi)
  begin
      feedback_pt_414 = pacific_asahi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      todd_pictures <= 0;
    else
      todd_pictures <= gnd;
  end

always @(todd_pictures)
  begin
      feedback_pt_415 = todd_pictures;
  end

wire thedon_potato_wire;

dffeas thedon_potato_ff (
  .clk(clock1),
  .d(martin_bolt),
  .ena(curious_moron),
  .sclr(oscar_bonker),
  .sload(beauty_coffee),
  .asdata(money_donut),
  .clrn(!reset1),
  .q(thedon_potato_wire)
);

always @(thedon_potato_wire) begin
   holland_haze = thedon_potato_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wujing_xray <= 0;
    else if (rojas_kungfu)
      wujing_xray <= 0;
    else if (director_of_llamas)
      wujing_xray <= dingbat_palm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dopey_sinew <= 1;
    else
      dopey_sinew <= ajax_too_big;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_cow <= 0;
    else if (todd_pictures)
      advil_cow <= 0;
    else if (vcc)
      advil_cow <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platinum_haze <= 0;
    else if (art_zed)
      platinum_haze <= 0;
    else if (gnd)
      platinum_haze <= advil_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fire_waster <= 1;
    else
      fire_waster <= moody_opus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iterate_sugar <= 0;
    else if (wheezer)
      iterate_sugar <= 0;
    else if (aspirin_ritsu)
      iterate_sugar <= fire_waster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      amex_potter <= 0;
    else if (hans_kungfu)
      amex_potter <= popcorn_advil;
  end

wire thor_cucumber_wire;

dffeas thor_cucumber_ff (
  .clk(clock1),
  .d(gnd),
  .ena(ready_centaur),
  .sclr(hut),
  .sload(helena_sinus),
  .asdata(vcc),
  .clrn(!reset1),
  .q(thor_cucumber_wire)
);

always @(thor_cucumber_wire) begin
   loud_chiptrip = thor_cucumber_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_toysrus <= 0;
    else
      south_toysrus <= advil_cow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      echo_eggsalad <= 0;
    else if (zhuang)
      echo_eggsalad <= midas_hippo;
    else if (gnd)
      echo_eggsalad <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_intel <= 0;
    else if (gnd)
      cain_intel <= 0;
    else if (lion_popcorn)
      cain_intel <= homerun_echo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homerun_deng <= 0;
    else if (dork_love_in)
      homerun_deng <= gnd;
    else if (zhuang)
      homerun_deng <= 0;
  end

wire dragon_malfoy_wire;

dffeas dragon_malfoy_ff (
  .clk(clock1),
  .d(cain_intel),
  .ena(vcc),
  .sclr(monster),
  .sload(pizza_popacap),
  .asdata(loud_chiptrip),
  .clrn(!reset1),
  .q(dragon_malfoy_wire)
);

always @(dragon_malfoy_wire) begin
   india_squad = dragon_malfoy_wire;
end

reg feedback_pt_416;

always @(meth or feedback_pt_416)
  begin
      sanity_tarzan =  meth &  feedback_pt_416;
  end

reg feedback_pt_417;

always @(zed or feedback_pt_417)
  begin
      concorde_show =  zed | !feedback_pt_417;
  end

reg feedback_pt_418;

always @(tin_lestrange or feedback_pt_418)
  begin
      covad_ocha =  tin_lestrange | !feedback_pt_418;
  end

reg feedback_pt_419;

always @(killer_marker or feedback_pt_419)
  begin
      weevil_money = !killer_marker & !feedback_pt_419;
  end

reg feedback_pt_420;

always @(vcc or feedback_pt_420)
  begin
      loser_echo =  vcc |  feedback_pt_420;
  end

reg feedback_pt_421;

always @(diagon or feedback_pt_421)
  begin
      potter_thor =  diagon & !feedback_pt_421;
  end

reg feedback_pt_422;

always @(vcc or feedback_pt_422)
  begin
      money_fortuyn =  vcc ^  feedback_pt_422;
  end

reg feedback_pt_423;

always @(viagra_filch or feedback_pt_423)
  begin
      blue_carolina = !viagra_filch | !feedback_pt_423;
  end

reg feedback_pt_424;

always @(bush_kbtoys or feedback_pt_424)
  begin
      hanger_lizard =  bush_kbtoys ^ !feedback_pt_424;
  end

reg feedback_pt_425;

always @(covad_ocha or feedback_pt_425)
  begin
      gregg_a_lovey =  covad_ocha | !feedback_pt_425;
  end

reg feedback_pt_426;

always @(gnd or feedback_pt_426)
  begin
      gap_tamago =  gnd |  feedback_pt_426;
  end

reg feedback_pt_427;

always @(gnd or feedback_pt_427)
  begin
      genji_stirfry = !gnd & !feedback_pt_427;
  end

reg feedback_pt_428;

always @(baron_juliet or feedback_pt_428)
  begin
      fish_waffle =  baron_juliet ^  feedback_pt_428;
  end

reg feedback_pt_429;

always @(clay_yohimbe or feedback_pt_429)
  begin
      daughter_sake = !clay_yohimbe ^  feedback_pt_429;
  end

reg feedback_pt_430;

always @(spyro_lima or feedback_pt_430)
  begin
      oscar_too_big = !spyro_lima ^ !feedback_pt_430;
  end

reg feedback_pt_431;

always @(egg_homer or feedback_pt_431)
  begin
      dork_rouge =  egg_homer ^ !feedback_pt_431;
  end

reg feedback_pt_432;

always @(vcc or feedback_pt_432)
  begin
      jonas_rocks = !vcc | !feedback_pt_432;
  end

reg feedback_pt_433;

always @(yohimbe or feedback_pt_433)
  begin
      husks_gotone = !yohimbe & !feedback_pt_433;
  end

reg feedback_pt_434;

always @(banshee_think or feedback_pt_434)
  begin
      klaas_diagon =  banshee_think | !feedback_pt_434;
  end

reg feedback_pt_435;

always @(saturn_simasu or feedback_pt_435)
  begin
      jcrew_cow =  saturn_simasu | !feedback_pt_435;
  end

reg feedback_pt_436;

always @(wukong or feedback_pt_436)
  begin
      rarest_emails = !wukong & !feedback_pt_436;
  end

reg feedback_pt_437;

always @(homerun_deng or feedback_pt_437)
  begin
      kanji_clay = !homerun_deng ^ !feedback_pt_437;
  end

reg feedback_pt_438;

always @(show_bacon or feedback_pt_438)
  begin
      concorde_bart = !show_bacon ^  feedback_pt_438;
  end

reg feedback_pt_439;

always @(uomcensor or feedback_pt_439)
  begin
      master_bamboo =  uomcensor |  feedback_pt_439;
  end

reg feedback_pt_440;

always @(hours_green or feedback_pt_440)
  begin
      att_launcher =  hours_green | !feedback_pt_440;
  end

reg feedback_pt_441;

always @(brian_zulu or feedback_pt_441)
  begin
      surfer_tuna = !brian_zulu ^ !feedback_pt_441;
  end

reg feedback_pt_442;

always @(vcc or feedback_pt_442)
  begin
      dig_shark = !vcc | !feedback_pt_442;
  end

reg feedback_pt_443;

always @(tylenol_otter or feedback_pt_443)
  begin
      illegal_rod = !tylenol_otter ^  feedback_pt_443;
  end

reg feedback_pt_444;

always @(wizard_norris or feedback_pt_444)
  begin
      vegas_peace = !wizard_norris ^  feedback_pt_444;
  end

reg feedback_pt_445;

always @(cluckU_klaas or feedback_pt_445)
  begin
      beef_shuda =  cluckU_klaas & !feedback_pt_445;
  end

reg feedback_pt_446;

always @(hagrid_neon or feedback_pt_446)
  begin
      soccer_speed =  hagrid_neon | !feedback_pt_446;
  end

reg feedback_pt_447;

always @(gnd or feedback_pt_447)
  begin
      zhuang_drugie = !gnd |  feedback_pt_447;
  end

reg feedback_pt_448;

always @(moreand_willy or feedback_pt_448)
  begin
      falafel_sun = !moreand_willy |  feedback_pt_448;
  end

reg feedback_pt_449;

always @(doc_bathroom or feedback_pt_449)
  begin
      quebec_lovey =  doc_bathroom ^  feedback_pt_449;
  end

reg feedback_pt_450;

always @(vcc or feedback_pt_450)
  begin
      potato_rod =  vcc &  feedback_pt_450;
  end

reg feedback_pt_451;

always @(zinc_bust or feedback_pt_451)
  begin
      south_nasdaq = !zinc_bust ^  feedback_pt_451;
  end

reg feedback_pt_452;

always @(achilles_lala or feedback_pt_452)
  begin
      malfoy_boing = !achilles_lala | !feedback_pt_452;
  end

reg feedback_pt_453;

always @(pyro_kmfdm or feedback_pt_453)
  begin
      yankees_heidi = !pyro_kmfdm & !feedback_pt_453;
  end

reg feedback_pt_454;

always @(east_zealot or feedback_pt_454)
  begin
      giraffe_huey = !east_zealot | !feedback_pt_454;
  end

reg feedback_pt_455;

always @(illegal_rod or feedback_pt_455)
  begin
      bono_homer = !illegal_rod &  feedback_pt_455;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pig_fear <= 1;
    else
      pig_fear <= saturn_simasu;
  end

always @(pig_fear)
  begin
      feedback_pt_416 = pig_fear;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curly_baron <= 0;
    else if (thedon_goofy)
      curly_baron <= zedong_lucius;
    else if (ulysses_nyc)
      curly_baron <= 0;
  end

always @(curly_baron)
  begin
      feedback_pt_417 = curly_baron;
  end

always @(curly_baron)
  begin
      feedback_pt_418 = curly_baron;
  end

always @(curly_baron)
  begin
      feedback_pt_419 = curly_baron;
  end

always @(curly_baron)
  begin
      feedback_pt_420 = curly_baron;
  end

always @(curly_baron)
  begin
      feedback_pt_421 = curly_baron;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      loser_curious <= 0;
    else if (husks_gotone)
      loser_curious <= guy_ykocens;
    else if (pixie)
      loser_curious <= 0;
  end

always @(loser_curious)
  begin
      feedback_pt_422 = loser_curious;
  end

always @(loser_curious)
  begin
      feedback_pt_423 = loser_curious;
  end

always @(loser_curious)
  begin
      feedback_pt_424 = loser_curious;
  end

always @(loser_curious)
  begin
      feedback_pt_425 = loser_curious;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      obiwan_quail <= 0;
    else if (gnd)
      obiwan_quail <= master_bamboo;
    else if (helena)
      obiwan_quail <= 0;
  end

always @(obiwan_quail)
  begin
      feedback_pt_426 = obiwan_quail;
  end

always @(obiwan_quail)
  begin
      feedback_pt_427 = obiwan_quail;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bravo_haze <= 0;
    else if (black_intuit)
      bravo_haze <= master_elf;
    else if (spastic)
      bravo_haze <= 0;
  end

always @(bravo_haze)
  begin
      feedback_pt_428 = bravo_haze;
  end

always @(bravo_haze)
  begin
      feedback_pt_429 = bravo_haze;
  end

always @(bravo_haze)
  begin
      feedback_pt_430 = bravo_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rasp_bubba <= 0;
    else if (hanger_lizard)
      rasp_bubba <= 0;
    else if (beef)
      rasp_bubba <= vcc;
  end

always @(rasp_bubba)
  begin
      feedback_pt_431 = rasp_bubba;
  end

always @(rasp_bubba)
  begin
      feedback_pt_432 = rasp_bubba;
  end

always @(rasp_bubba)
  begin
      feedback_pt_433 = rasp_bubba;
  end

always @(rasp_bubba)
  begin
      feedback_pt_434 = rasp_bubba;
  end

wire dork_dingbat_wire;

dffeas dork_dingbat_ff (
  .clk(clock1),
  .d(wanton_flew),
  .ena(pacific_asahi),
  .sclr(jcrew_cow),
  .sload(century_biker),
  .asdata(jcrew_cow),
  .clrn(!reset1),
  .q(dork_dingbat_wire)
);

always @(dork_dingbat_wire) begin
   drugie_pilot = dork_dingbat_wire;
end

always @(drugie_pilot)
  begin
      feedback_pt_435 = drugie_pilot;
  end

always @(drugie_pilot)
  begin
      feedback_pt_436 = drugie_pilot;
  end

always @(drugie_pilot)
  begin
      feedback_pt_437 = drugie_pilot;
  end

always @(drugie_pilot)
  begin
      feedback_pt_438 = drugie_pilot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tsmc_safada <= 1;
    else
      tsmc_safada <= gnd;
  end

always @(tsmc_safada)
  begin
      feedback_pt_439 = tsmc_safada;
  end

always @(tsmc_safada)
  begin
      feedback_pt_440 = tsmc_safada;
  end

always @(tsmc_safada)
  begin
      feedback_pt_441 = tsmc_safada;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ford_comtrex <= 0;
    else if (mushroom_dork)
      ford_comtrex <= quebec_lovey;
  end

always @(ford_comtrex)
  begin
      feedback_pt_442 = ford_comtrex;
  end

always @(ford_comtrex)
  begin
      feedback_pt_443 = ford_comtrex;
  end

always @(ford_comtrex)
  begin
      feedback_pt_444 = ford_comtrex;
  end

always @(ford_comtrex)
  begin
      feedback_pt_445 = ford_comtrex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snort_jinyong <= 1;
    else
      snort_jinyong <= klaas_diagon;
  end

always @(snort_jinyong)
  begin
      feedback_pt_446 = snort_jinyong;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bert_south <= 0;
    else if (homerun_deng)
      bert_south <= vcc;
    else if (vcc)
      bert_south <= 0;
  end

always @(bert_south)
  begin
      feedback_pt_447 = bert_south;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_norbert <= 0;
    else
      art_norbert <= vcc;
  end

always @(art_norbert)
  begin
      feedback_pt_448 = art_norbert;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      legos_tofu <= 0;
    else
      legos_tofu <= vcc;
  end

always @(legos_tofu)
  begin
      feedback_pt_449 = legos_tofu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_pyro <= 0;
    else if (tin_lestrange)
      ladder_pyro <= stroop;
    else if (gnd)
      ladder_pyro <= 0;
  end

always @(ladder_pyro)
  begin
      feedback_pt_450 = ladder_pyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotdog_sgates <= 0;
    else
      hotdog_sgates <= weasley_valve;
  end

always @(hotdog_sgates)
  begin
      feedback_pt_451 = hotdog_sgates;
  end

wire life_lao_wire;

dffeas life_lao_ff (
  .clk(clock1),
  .d(zulu_eel),
  .ena(beauty_coffee),
  .sclr(boing_illegal),
  .sload(edible_amex),
  .asdata(portnoy_stick),
  .clrn(!reset1),
  .q(life_lao_wire)
);

always @(life_lao_wire) begin
   palm_haze = life_lao_wire;
end

always @(palm_haze)
  begin
      feedback_pt_452 = palm_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boitano_brian <= 1;
    else
      boitano_brian <= bellatrix;
  end

always @(boitano_brian)
  begin
      feedback_pt_453 = boitano_brian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hippo_mozart <= 0;
    else if (gerard_kungfu)
      hippo_mozart <= 0;
    else if (kang_bacon)
      hippo_mozart <= rabbi;
  end

always @(hippo_mozart)
  begin
      feedback_pt_454 = hippo_mozart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nest_crank <= 0;
    else
      nest_crank <= wheezer;
  end

always @(nest_crank)
  begin
      feedback_pt_455 = nest_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roid_odin <= 0;
    else if (ajax_psycho)
      roid_odin <= 0;
    else if (zhuang_drugie)
      roid_odin <= palm_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_tango <= 0;
    else if (gnd)
      due_tango <= atchoo_deng;
    else if (kang_minnie)
      due_tango <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goofy_bach <= 1;
    else
      goofy_bach <= tiger_drugs;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_minnow <= 0;
    else if (gnd)
      fufu_minnow <= 0;
    else if (tonks_snake)
      fufu_minnow <= fury_saturn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      trevor_wanton <= 0;
    else
      trevor_wanton <= dingbat_tesla;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      freaky_marco <= 1;
    else
      freaky_marco <= vangoh;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lagoon_broom <= 0;
    else
      lagoon_broom <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tinker_sheep <= 0;
    else
      tinker_sheep <= saturn_simasu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lizard_kanji <= 1;
    else
      lizard_kanji <= tiger_drugs;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foxtrot_sears <= 0;
    else
      foxtrot_sears <= bacon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sheep_bart <= 0;
    else if (goofy_bach)
      sheep_bart <= vcc;
    else if (nyc_foliage)
      sheep_bart <= 0;
  end

wire air_monkey_wire;

dffeas air_monkey_ff (
  .clk(clock1),
  .d(gin_kdqcens),
  .ena(beauty_coffee),
  .sclr(norris),
  .sload(soccer_speed),
  .asdata(pacific_asahi),
  .clrn(!reset1),
  .q(air_monkey_wire)
);

always @(air_monkey_wire) begin
   chief_peta = air_monkey_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_powder <= 1;
    else
      west_powder <= concorde_bart;
  end

wire jacob_malfoy_wire;

dffea jacob_malfoy_ff (
  .clk(clock1),
  .d(loser_curious),
  .ena(genji_stirfry),
  .adata(plague),
  .clrn(!reset1),
  .q(jacob_malfoy_wire)
);

always @(jacob_malfoy_wire) begin
   dimetap_bagel = jacob_malfoy_wire;
end

wire neville_po_wire;

dffeas neville_po_ff (
  .clk(clock1),
  .d(snake_marco),
  .ena(vcc),
  .sclr(genji_stirfry),
  .sload(tango_saturn),
  .asdata(sgates_thedon),
  .clrn(!reset1),
  .q(neville_po_wire)
);

always @(neville_po_wire) begin
   trevor_thread = neville_po_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zen_tako <= 0;
    else if (rewire_bubba)
      zen_tako <= fortuyn_lamer;
    else if (gnd)
      zen_tako <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_macys <= 1;
    else
      curie_macys <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      exodus_lima <= 0;
    else if (gnd)
      exodus_lima <= bubba_peta;
    else if (egg_homer)
      exodus_lima <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nasdaq_ebay <= 0;
    else if (what_peta)
      nasdaq_ebay <= ford_comtrex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zulu_baron <= 0;
    else if (gnd)
      zulu_baron <= obiwan_rabbi;
    else if (curly_baron)
      zulu_baron <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fury_beast <= 1;
    else
      fury_beast <= wonton;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peaves_squad <= 0;
    else if (gnd)
      peaves_squad <= aspirin_ritsu;
    else if (legos_tofu)
      peaves_squad <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fury_grams <= 0;
    else if (pdaddy_powder)
      fury_grams <= viagra;
    else if (vcc)
      fury_grams <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_golf <= 0;
    else if (lestrange)
      lotus_golf <= vcc;
    else if (dork_rouge)
      lotus_golf <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rocks_ohisee <= 0;
    else if (tesla_scrooge)
      rocks_ohisee <= gnd;
    else if (fear_star)
      rocks_ohisee <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jonas_monster <= 0;
    else
      jonas_monster <= metal_dog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ginger_tsmc <= 0;
    else if (vcc)
      ginger_tsmc <= metal_dog;
    else if (rasp_stoned)
      ginger_tsmc <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotel_macys <= 1;
    else
      hotel_macys <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roe_abraham <= 0;
    else if (baron_juliet)
      roe_abraham <= hurt_rose;
    else if (cluckU_fuji)
      roe_abraham <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tinker_george <= 0;
    else if (priest_echo)
      tinker_george <= dork_rouge;
    else if (vcc)
      tinker_george <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pig_budlite <= 0;
    else if (vcc)
      pig_budlite <= 0;
    else if (midas_trevor)
      pig_budlite <= vcc;
  end

wire monkey_whale_wire;

dffea monkey_whale_ff (
  .clk(clock1),
  .d(rojas_norbert),
  .ena(trevor_thread),
  .adata(oscar_bonker),
  .clrn(!reset1),
  .q(monkey_whale_wire)
);

always @(monkey_whale_wire) begin
   babette_crank = monkey_whale_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chillis_peace <= 0;
    else if (ohisee)
      chillis_peace <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lima_hummer <= 0;
    else
      lima_hummer <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bolt_foliage <= 0;
    else if (skipper_happy)
      bolt_foliage <= killer_marker;
    else if (chillis_peace)
      bolt_foliage <= 0;
  end

wire severus_valve_wire;

dffeas severus_valve_ff (
  .clk(clock1),
  .d(trevor_wanton),
  .ena(gnd),
  .sclr(pig_fear),
  .sload(hotel_macys),
  .asdata(neon_snape),
  .clrn(!reset1),
  .q(severus_valve_wire)
);

always @(severus_valve_wire) begin
   dweebie_bep = severus_valve_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      llama_palm <= 1;
    else
      llama_palm <= ginger_tsmc;
  end

wire might_what_wire;

dffeas might_what_ff (
  .clk(clock1),
  .d(shark_palm),
  .ena(crack_donald),
  .sclr(covad_ocha),
  .sload(malfoy_boing),
  .asdata(dopey_sinew),
  .clrn(!reset1),
  .q(might_what_wire)
);

always @(might_what_wire) begin
   kilo_knot = might_what_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_xiaoping <= 1;
    else
      emu_xiaoping <= vcc;
  end

wire pastrami_bull_wire;

dffea pastrami_bull_ff (
  .clk(clock1),
  .d(vcc),
  .ena(lestrange),
  .adata(loud_ariel),
  .clrn(!reset1),
  .q(pastrami_bull_wire)
);

always @(pastrami_bull_wire) begin
   tiger_dimetap = pastrami_bull_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_century <= 0;
    else
      water_century <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ernie_woman <= 1;
    else
      ernie_woman <= art_zed;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      woman_tiger <= 0;
    else if (vcc)
      woman_tiger <= hiway_jesus;
    else if (vcc)
      woman_tiger <= 0;
  end

wire baron_foliage_wire;

dffea baron_foliage_ff (
  .clk(clock1),
  .d(intuit_voodoo),
  .ena(martin_bolt),
  .adata(dow_amex),
  .clrn(!reset1),
  .q(baron_foliage_wire)
);

always @(baron_foliage_wire) begin
   bust_zen = baron_foliage_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_enoch <= 1;
    else
      hinge_enoch <= minnow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homer_goofy <= 0;
    else if (vcc)
      homer_goofy <= kappa_zed;
    else if (due_tango)
      homer_goofy <= 0;
  end

wire theseus_maki_wire;

dffeas theseus_maki_ff (
  .clk(clock1),
  .d(zhuang_drugie),
  .ena(gnd),
  .sclr(gnd),
  .sload(mao),
  .asdata(vcc),
  .clrn(!reset1),
  .q(theseus_maki_wire)
);

always @(theseus_maki_wire) begin
   maklak_waffle = theseus_maki_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_starwars <= 0;
    else if (kmfdm_school)
      egg_starwars <= 0;
    else if (tylenol_otter)
      egg_starwars <= holland_haze;
  end

wire drevil_sinus_wire;

dffeas drevil_sinus_ff (
  .clk(clock1),
  .d(vcc),
  .ena(otter_kedavra),
  .sclr(bush_gutter),
  .sload(yak_brothers),
  .asdata(ohisee),
  .clrn(!reset1),
  .q(drevil_sinus_wire)
);

always @(drevil_sinus_wire) begin
   north_fortuyn = drevil_sinus_wire;
end

// Random combinatorial logic block
always@(*)
  begin
      ariel_wujing = ~( ~( ~( ( ~( gnd ) & ~( ~fury_saturn ) ) ) ) );
  end

  always@(*)
  begin
    boitano_bagel = ~( ( ~fufu_minnow ^ ( ~( ~( ~vcc ) ) & ~gap_tamago ) ) ) ? ( ~( ~( spain_loser ) ) | ( ~( ~( wizard_norris ) ) & ~( ~( ~gnd ) ) ) ^ ~( ( ~( ~( ready_tiger ) & ~( books_gojira ) ^ ~( ( ~( tiger_dimetap & ~nyc_foliage ) ) ) ) ) ) ) : ~lotus;
  end
// State Mek ladder_lizard Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_lizard <= ladder_lizard_0;
    else
      case (ladder_lizard)
        ladder_lizard_0: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 0)
            ladder_lizard <= ladder_lizard_4;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 13)
            ladder_lizard <= ladder_lizard_4;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 12)
            ladder_lizard <= ladder_lizard_1;
          else
            ladder_lizard <= ladder_lizard_0;
          end
        ladder_lizard_1: begin
            ladder_lizard <= ladder_lizard_1;
          end
        ladder_lizard_2: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 11)
            ladder_lizard <= ladder_lizard_6;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 9)
            ladder_lizard <= ladder_lizard_8;
          else
            ladder_lizard <= ladder_lizard_2;
          end
        ladder_lizard_3: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 4)
            ladder_lizard <= ladder_lizard_2;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 12)
            ladder_lizard <= ladder_lizard_4;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 10)
            ladder_lizard <= ladder_lizard_0;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 13)
            ladder_lizard <= ladder_lizard_0;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 6)
            ladder_lizard <= ladder_lizard_5;
          else
            ladder_lizard <= ladder_lizard_3;
          end
        ladder_lizard_4: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 2)
            ladder_lizard <= ladder_lizard_0;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 5)
            ladder_lizard <= ladder_lizard_7;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 8)
            ladder_lizard <= ladder_lizard_8;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 9)
            ladder_lizard <= ladder_lizard_2;
          else
            ladder_lizard <= ladder_lizard_4;
          end
        ladder_lizard_5: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 2)
            ladder_lizard <= ladder_lizard_6;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 15)
            ladder_lizard <= ladder_lizard_1;
          else
            ladder_lizard <= ladder_lizard_5;
          end
        ladder_lizard_6: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 2)
            ladder_lizard <= ladder_lizard_0;
          else
            ladder_lizard <= ladder_lizard_6;
          end
        ladder_lizard_7: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 5)
            ladder_lizard <= ladder_lizard_1;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 8)
            ladder_lizard <= ladder_lizard_1;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 11)
            ladder_lizard <= ladder_lizard_6;
          else
            ladder_lizard <= ladder_lizard_7;
          end
        ladder_lizard_8: begin
          if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 9)
            ladder_lizard <= ladder_lizard_3;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 12)
            ladder_lizard <= ladder_lizard_7;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 1)
            ladder_lizard <= ladder_lizard_3;
          else if ({eel_zinc,starwars_gyro,zulu_baron,rasp_stoned} == 7)
            ladder_lizard <= ladder_lizard_8;
          else
            ladder_lizard <= ladder_lizard_8;
          end
        default: ladder_lizard <= ladder_lizard_0;
      endcase
  end

// State Mek ladder_lizard Output logic
always @(ladder_lizard)
  begin
    // consider all state regs when doing outputs
    case (ladder_lizard)
        ladder_lizard_0: begin
            deuce_bismuth = 1;
            emu_skinner = 0;
            blessyou_haze = 0;
            knot_neville = 0;
            pepsi_spanish = 0;
            bolt_trevor = 0;
          end
        ladder_lizard_1: begin
            deuce_bismuth = 0;
            emu_skinner = 0;
            blessyou_haze = 0;
            knot_neville = 0;
            pepsi_spanish = 1;
            bolt_trevor = 1;
          end
        ladder_lizard_2: begin
            deuce_bismuth = 1;
            emu_skinner = 0;
            blessyou_haze = 0;
            knot_neville = 1;
            pepsi_spanish = 1;
            bolt_trevor = 0;
          end
        ladder_lizard_3: begin
            deuce_bismuth = 1;
            emu_skinner = 1;
            blessyou_haze = 0;
            knot_neville = 0;
            pepsi_spanish = 1;
            bolt_trevor = 0;
          end
        ladder_lizard_4: begin
            deuce_bismuth = 1;
            emu_skinner = 0;
            blessyou_haze = 0;
            knot_neville = 1;
            pepsi_spanish = 0;
            bolt_trevor = 1;
          end
        ladder_lizard_5: begin
            deuce_bismuth = 0;
            emu_skinner = 0;
            blessyou_haze = 1;
            knot_neville = 0;
            pepsi_spanish = 0;
            bolt_trevor = 0;
          end
        ladder_lizard_6: begin
            deuce_bismuth = 0;
            emu_skinner = 1;
            blessyou_haze = 0;
            knot_neville = 0;
            pepsi_spanish = 1;
            bolt_trevor = 1;
          end
        ladder_lizard_7: begin
            deuce_bismuth = 1;
            emu_skinner = 1;
            blessyou_haze = 1;
            knot_neville = 1;
            pepsi_spanish = 0;
            bolt_trevor = 1;
          end
        ladder_lizard_8: begin
            deuce_bismuth = 0;
            emu_skinner = 1;
            blessyou_haze = 1;
            knot_neville = 0;
            pepsi_spanish = 0;
            bolt_trevor = 1;
          end
        default: begin
            deuce_bismuth = 1;
            emu_skinner = 1;
            blessyou_haze = 0;
            knot_neville = 1;
            pepsi_spanish = 0;
            bolt_trevor = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire pizza_green_out;
nut_004_lut #(1) nut_004_lut_inst_pizza_green (
  .din({hippo_mozart}),
  .mask(2'b00),
  .out(pizza_green_out)
);

always @(pizza_green_out)
begin
   kungfu_surfer = pizza_green_out;
end


initial begin
    {gulp_mushroom,ihilani_bert,tattoo_east,ghost_zinc} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({tylenol_otter,gnd,concorde_show,fufu_minnow} < {vcc,gnd,vcc,portnoy_stick})
       {gulp_mushroom,ihilani_bert,tattoo_east,ghost_zinc} <= {vcc,gnd,vcc,portnoy_stick};
    else
       {gulp_mushroom,ihilani_bert,tattoo_east,ghost_zinc} <= {tylenol_otter,gnd,concorde_show,fufu_minnow};
  end

// AND all of these bits together
always @(tesla_scrooge or gnd or purple_maki or crookshanks or pepsi_spanish or potter_thor or blessyou_haze or weevil_money or india_squad)
  begin
      rat_xterm = & {tesla_scrooge,gnd,purple_maki,crookshanks,pepsi_spanish,potter_thor,blessyou_haze,weevil_money,india_squad};
  end

// NOR all of these bits together
always @(vcc or dig_shark or vcc or vcc or vcc)
  begin
      master_bart = ~| {vcc,dig_shark,vcc,vcc,vcc};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gonzo_eunice <= 0;
    else
    case ({wizard_norris,deuce_bismuth})
       0 : gonzo_eunice <= gonzo_eunice;
       1 : gonzo_eunice <= gonzo_eunice;
       2 : gonzo_eunice <= gonzo_eunice;
       3 : gonzo_eunice <= vcc;
       default : gonzo_eunice <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_onthepc <= 0;
    else
    case ({ghost_asahi,kabar_whiskey})
       0 : often_onthepc <= tinker_george;
       1 : often_onthepc <= often_onthepc;
       2 : often_onthepc <= often_onthepc;
       3 : often_onthepc <= often_onthepc;
       default : often_onthepc <= 0;
    endcase
  end

reg feedback_pt_456;

always @(gregg_a_lovey or feedback_pt_456)
  begin
      floo_saturn =  gregg_a_lovey & !feedback_pt_456;
  end

reg feedback_pt_457;

always @(gnd or feedback_pt_457)
  begin
      greenbay_sake = !gnd ^ !feedback_pt_457;
  end

reg feedback_pt_458;

always @(vcc or feedback_pt_458)
  begin
      llama_bismuth =  vcc |  feedback_pt_458;
  end

reg feedback_pt_459;

always @(gnd or feedback_pt_459)
  begin
      baron_clay = !gnd &  feedback_pt_459;
  end

reg feedback_pt_460;

always @(cluckU_fuji or feedback_pt_460)
  begin
      southern_cow = !cluckU_fuji | !feedback_pt_460;
  end

reg feedback_pt_461;

always @(east_zealot or feedback_pt_461)
  begin
      gotone_marvin = !east_zealot ^  feedback_pt_461;
  end

reg feedback_pt_462;

always @(drugs or feedback_pt_462)
  begin
      marge_tofu = !drugs ^ !feedback_pt_462;
  end

reg feedback_pt_463;

always @(wine_sand or feedback_pt_463)
  begin
      leaky_jinyong =  wine_sand |  feedback_pt_463;
  end

reg feedback_pt_464;

always @(concorde_show or feedback_pt_464)
  begin
      vicks_skinner =  concorde_show | !feedback_pt_464;
  end

reg feedback_pt_465;

always @(gnd or feedback_pt_465)
  begin
      mexico_sears = !gnd & !feedback_pt_465;
  end

reg feedback_pt_466;

always @(hulk_booming or feedback_pt_466)
  begin
      spyro_nirish = !hulk_booming &  feedback_pt_466;
  end

reg feedback_pt_467;

always @(bush_kbtoys or feedback_pt_467)
  begin
      boing_jiminy =  bush_kbtoys |  feedback_pt_467;
  end

reg feedback_pt_468;

always @(mexico_sears or feedback_pt_468)
  begin
      skipper_would = !mexico_sears &  feedback_pt_468;
  end

reg feedback_pt_469;

always @(wildboar_iron or feedback_pt_469)
  begin
      honda_elf = !wildboar_iron & !feedback_pt_469;
  end

reg feedback_pt_470;

always @(gnd or feedback_pt_470)
  begin
      lsd_downers =  gnd ^  feedback_pt_470;
  end

reg feedback_pt_471;

always @(north_fortuyn or feedback_pt_471)
  begin
      chicken_romex = !north_fortuyn & !feedback_pt_471;
  end

reg feedback_pt_472;

always @(chief_bambi or feedback_pt_472)
  begin
      pdaddy_kappa = !chief_bambi &  feedback_pt_472;
  end

reg feedback_pt_473;

always @(moody_zhuang or feedback_pt_473)
  begin
      kabar_jacques = !moody_zhuang ^ !feedback_pt_473;
  end

reg feedback_pt_474;

always @(vcc or feedback_pt_474)
  begin
      leidiot_duey = !vcc ^ !feedback_pt_474;
  end

reg feedback_pt_475;

always @(gnd or feedback_pt_475)
  begin
      egg_might =  gnd & !feedback_pt_475;
  end

reg feedback_pt_476;

always @(gregg_a_lovey or feedback_pt_476)
  begin
      golden_sleepy = !gregg_a_lovey ^ !feedback_pt_476;
  end

reg feedback_pt_477;

always @(oscar_gin or feedback_pt_477)
  begin
      joseph_husks = !oscar_gin |  feedback_pt_477;
  end

reg feedback_pt_478;

always @(tinker_sheep or feedback_pt_478)
  begin
      avon_oranges = !tinker_sheep ^ !feedback_pt_478;
  end

reg feedback_pt_479;

always @(priest_echo or feedback_pt_479)
  begin
      bananarep_rum = !priest_echo & !feedback_pt_479;
  end

reg feedback_pt_480;

always @(peaves_squad or feedback_pt_480)
  begin
      tank_centaur = !peaves_squad ^  feedback_pt_480;
  end

reg feedback_pt_481;

always @(gnd or feedback_pt_481)
  begin
      wonton_crack = !gnd ^  feedback_pt_481;
  end

reg feedback_pt_482;

always @(zhuang or feedback_pt_482)
  begin
      advil_army =  zhuang &  feedback_pt_482;
  end

reg feedback_pt_483;

always @(fortuyn_lamer or feedback_pt_483)
  begin
      broom_eagle = !fortuyn_lamer | !feedback_pt_483;
  end

reg feedback_pt_484;

always @(gnd or feedback_pt_484)
  begin
      clay_ritsu =  gnd |  feedback_pt_484;
  end

reg feedback_pt_485;

always @(rescue or feedback_pt_485)
  begin
      lemon_joseph = !rescue & !feedback_pt_485;
  end

reg feedback_pt_486;

always @(kappa_zed or feedback_pt_486)
  begin
      dimetap_vegan =  kappa_zed ^  feedback_pt_486;
  end

reg feedback_pt_487;

always @(ajax_psycho or feedback_pt_487)
  begin
      ocean_huhhuh = !ajax_psycho |  feedback_pt_487;
  end

reg feedback_pt_488;

always @(gnd or feedback_pt_488)
  begin
      cybex_romex =  gnd &  feedback_pt_488;
  end

reg feedback_pt_489;

always @(mao or feedback_pt_489)
  begin
      english_pyro = !mao & !feedback_pt_489;
  end

reg feedback_pt_490;

always @(pdaddy_kappa or feedback_pt_490)
  begin
      lamer_webvan =  pdaddy_kappa &  feedback_pt_490;
  end

reg feedback_pt_491;

always @(gerard_kungfu or feedback_pt_491)
  begin
      papa_dadada = !gerard_kungfu ^  feedback_pt_491;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marker_bep <= 0;
    else
      marker_bep <= snake_marco;
  end

always @(marker_bep)
  begin
      feedback_pt_456 = marker_bep;
  end

always @(marker_bep)
  begin
      feedback_pt_457 = marker_bep;
  end

always @(marker_bep)
  begin
      feedback_pt_458 = marker_bep;
  end

always @(marker_bep)
  begin
      feedback_pt_459 = marker_bep;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sgates_think <= 1;
    else
      sgates_think <= homerun_stix;
  end

always @(sgates_think)
  begin
      feedback_pt_460 = sgates_think;
  end

always @(sgates_think)
  begin
      feedback_pt_461 = sgates_think;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_elian <= 1;
    else
      ceres_elian <= oscar_too_big;
  end

always @(ceres_elian)
  begin
      feedback_pt_462 = ceres_elian;
  end

always @(ceres_elian)
  begin
      feedback_pt_463 = ceres_elian;
  end

always @(ceres_elian)
  begin
      feedback_pt_464 = ceres_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tamago_opus <= 1;
    else
      tamago_opus <= gnd;
  end

always @(tamago_opus)
  begin
      feedback_pt_465 = tamago_opus;
  end

always @(tamago_opus)
  begin
      feedback_pt_466 = tamago_opus;
  end

always @(tamago_opus)
  begin
      feedback_pt_467 = tamago_opus;
  end

always @(tamago_opus)
  begin
      feedback_pt_468 = tamago_opus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mine_nasdaq <= 0;
    else
      mine_nasdaq <= echo_eggsalad;
  end

always @(mine_nasdaq)
  begin
      feedback_pt_469 = mine_nasdaq;
  end

always @(mine_nasdaq)
  begin
      feedback_pt_470 = mine_nasdaq;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roid_crayons <= 0;
    else if (avon_liberace)
      roid_crayons <= llama_bismuth;
    else if (greenbay_sake)
      roid_crayons <= 0;
  end

always @(roid_crayons)
  begin
      feedback_pt_471 = roid_crayons;
  end

always @(roid_crayons)
  begin
      feedback_pt_472 = roid_crayons;
  end

always @(roid_crayons)
  begin
      feedback_pt_473 = roid_crayons;
  end

always @(roid_crayons)
  begin
      feedback_pt_474 = roid_crayons;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chief_timmy <= 0;
    else if (maklak_waffle)
      chief_timmy <= chief_bambi;
    else if (grumby)
      chief_timmy <= 0;
  end

always @(chief_timmy)
  begin
      feedback_pt_475 = chief_timmy;
  end

always @(chief_timmy)
  begin
      feedback_pt_476 = chief_timmy;
  end

always @(chief_timmy)
  begin
      feedback_pt_477 = chief_timmy;
  end

always @(chief_timmy)
  begin
      feedback_pt_478 = chief_timmy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      atoms_art <= 0;
    else if (ohisee)
      atoms_art <= vcc;
  end

always @(atoms_art)
  begin
      feedback_pt_479 = atoms_art;
  end

always @(atoms_art)
  begin
      feedback_pt_480 = atoms_art;
  end

always @(atoms_art)
  begin
      feedback_pt_481 = atoms_art;
  end

always @(atoms_art)
  begin
      feedback_pt_482 = atoms_art;
  end

always @(atoms_art)
  begin
      feedback_pt_483 = atoms_art;
  end

wire lucius_drax_wire;

dffea lucius_drax_ff (
  .clk(clock1),
  .d(lamer_webvan),
  .ena(crack_donald),
  .adata(vcc),
  .clrn(!reset1),
  .q(lucius_drax_wire)
);

always @(lucius_drax_wire) begin
   moderate_eel = lucius_drax_wire;
end

always @(moderate_eel)
  begin
      feedback_pt_484 = moderate_eel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kappa_rufus <= 0;
    else if (bolt_trevor)
      kappa_rufus <= kang_bacon;
  end

always @(kappa_rufus)
  begin
      feedback_pt_485 = kappa_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      safeway_nest <= 0;
    else if (gnd)
      safeway_nest <= vcc;
  end

always @(safeway_nest)
  begin
      feedback_pt_486 = safeway_nest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      biker_bono <= 0;
    else if (vcc)
      biker_bono <= oscar_gin;
  end

always @(biker_bono)
  begin
      feedback_pt_487 = biker_bono;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_rojas <= 0;
    else if (hulk_booming)
      kilo_rojas <= 0;
    else if (sun_wannabe)
      kilo_rojas <= emu_skinner;
  end

always @(kilo_rojas)
  begin
      feedback_pt_488 = kilo_rojas;
  end

wire green_gm_wire;

dffeas green_gm_ff (
  .clk(clock1),
  .d(viagra),
  .ena(snort_jinyong),
  .sclr(exodus_lima),
  .sload(parrot_doc),
  .asdata(fury_grams),
  .clrn(!reset1),
  .q(green_gm_wire)
);

always @(green_gm_wire) begin
   often_master = green_gm_wire;
end

always @(often_master)
  begin
      feedback_pt_489 = often_master;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      floating_guy <= 0;
    else if (boitano_bagel)
      floating_guy <= 0;
    else if (english_pyro)
      floating_guy <= beef_covad;
  end

always @(floating_guy)
  begin
      feedback_pt_490 = floating_guy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hawaii_danger <= 0;
    else
      hawaii_danger <= moody_zhuang;
  end

always @(hawaii_danger)
  begin
      feedback_pt_491 = hawaii_danger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_atchoo <= 0;
    else if (vcc)
      life_atchoo <= 0;
    else if (water_century)
      life_atchoo <= venus_elian;
  end

wire noah_mexican_wire;

dffeas noah_mexican_ff (
  .clk(clock1),
  .d(mike_mcnugget),
  .ena(crack_donald),
  .sclr(show_mrbill),
  .sload(vcc),
  .asdata(wujing_xray),
  .clrn(!reset1),
  .q(noah_mexican_wire)
);

always @(noah_mexican_wire) begin
   daughter_lisa = noah_mexican_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bfs_star <= 0;
    else if (pig_budlite)
      bfs_star <= 0;
    else if (tank_centaur)
      bfs_star <= cybex_romex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_nyquil <= 0;
    else if (papa_dadada)
      oscar_nyquil <= ham_alpha;
    else if (gnd)
      oscar_nyquil <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tako_fortuyn <= 0;
    else if (tsmc_safada)
      tako_fortuyn <= babette_crank;
    else if (golden_sleepy)
      tako_fortuyn <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      atoms_filch <= 0;
    else
      atoms_filch <= iterate_sugar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zed_weevil <= 0;
    else if (giraffe_huey)
      zed_weevil <= howell;
  end

wire rescue_sun_wire;

dffeas rescue_sun_ff (
  .clk(clock1),
  .d(zulu_baron),
  .ena(gnd),
  .sclr(vcc),
  .sload(platinum_haze),
  .asdata(vcc),
  .clrn(!reset1),
  .q(rescue_sun_wire)
);

always @(rescue_sun_wire) begin
   haze_smithers = rescue_sun_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burner_mrbill <= 0;
    else if (vcc)
      burner_mrbill <= jonas_rocks;
    else if (lsd_downers)
      burner_mrbill <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      squad_wukong <= 1;
    else
      squad_wukong <= potter_thor;
  end

wire malfoy_nyc_wire;

dffeas malfoy_nyc_ff (
  .clk(clock1),
  .d(egg_might),
  .ena(gnd),
  .sclr(gnd),
  .sload(nasdaq_iron),
  .asdata(what_intel),
  .clrn(!reset1),
  .q(malfoy_nyc_wire)
);

always @(malfoy_nyc_wire) begin
   dork_porfavor = malfoy_nyc_wire;
end

wire often_downers_wire;

dffea often_downers_ff (
  .clk(clock1),
  .d(gnd),
  .ena(vcc),
  .adata(voodoo),
  .clrn(!reset1),
  .q(often_downers_wire)
);

always @(often_downers_wire) begin
   sake_billnted = often_downers_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      purple_rod <= 1;
    else
      purple_rod <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      too_big_dirk <= 0;
    else if (vcc)
      too_big_dirk <= gulp_mushroom;
    else if (jonas_rocks)
      too_big_dirk <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      baron_nihlist <= 0;
    else if (iterate_sugar)
      baron_nihlist <= 0;
    else if (gnd)
      baron_nihlist <= roid_odin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stroop_mexico <= 0;
    else
      stroop_mexico <= spyro_nirish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bust_fear <= 0;
    else
      bust_fear <= venus_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_firewalk <= 0;
    else if (too_big_dirk)
      due_firewalk <= 0;
    else if (vcc)
      due_firewalk <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zedong_nyc <= 0;
    else
      zedong_nyc <= dork_rouge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_abraham <= 0;
    else if (vcc)
      emu_abraham <= moody_noah;
    else if (hotdog_sgates)
      emu_abraham <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      timmy_bracket <= 0;
    else
      timmy_bracket <= drugie_pilot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pilot_nasdaq <= 0;
    else if (gnd)
      pilot_nasdaq <= 0;
    else if (bono_homer)
      pilot_nasdaq <= baron_clay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sand_badger <= 0;
    else if (emu_abraham)
      sand_badger <= burner_mrbill;
    else if (weevil_money)
      sand_badger <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      muffin_homer <= 0;
    else if (vcc)
      muffin_homer <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_happy <= 0;
    else if (roid_odin)
      due_happy <= dweebie_bep;
    else if (vcc)
      due_happy <= 0;
  end

wire skipper_gonzo_wire;

dffea skipper_gonzo_ff (
  .clk(clock1),
  .d(holland_haze),
  .ena(often_master),
  .adata(gnd),
  .clrn(!reset1),
  .q(skipper_gonzo_wire)
);

always @(skipper_gonzo_wire) begin
   metal_covad = skipper_gonzo_wire;
end

wire klinton_macys_wire;

dffeas klinton_macys_ff (
  .clk(clock1),
  .d(vcc),
  .ena(kabar_jacques),
  .sclr(atoms_art),
  .sload(att_launcher),
  .asdata(pepsi_spanish),
  .clrn(!reset1),
  .q(klinton_macys_wire)
);

always @(klinton_macys_wire) begin
   quebec_crank = klinton_macys_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nest_mcnugget <= 0;
    else
      nest_mcnugget <= helena;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      armand_lovey <= 0;
    else if (neville)
      armand_lovey <= 0;
    else if (gnd)
      armand_lovey <= norris;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      priest_gopher <= 0;
    else if (kabar_jacques)
      priest_gopher <= opus;
    else if (gnd)
      priest_gopher <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marvin_xterm <= 0;
    else if (bush_wiggles)
      marvin_xterm <= often_onthepc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lsd_shuda <= 0;
    else if (vegas_peace)
      lsd_shuda <= 0;
    else if (hippo_mozart)
      lsd_shuda <= blue_carolina;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bambi_skipper <= 0;
    else
      bambi_skipper <= fish_waffle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegas_abraham <= 0;
    else if (gnd)
      vegas_abraham <= 0;
    else if (kappa_rufus)
      vegas_abraham <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kanji_gyro <= 0;
    else if (rescue)
      kanji_gyro <= pilot_nasdaq;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beauty_dog <= 0;
    else if (english_pyro)
      beauty_dog <= mexico_sears;
    else if (lisa)
      beauty_dog <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_romex <= 0;
    else if (sake_billnted)
      emu_romex <= floo_saturn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_trevor <= 1;
    else
      onion_trevor <= att_launcher;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubeus_egg <= 0;
    else if (oscar_too_big)
      rubeus_egg <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      avon_giants <= 1;
    else
      avon_giants <= gotone_marvin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fatality_sun <= 0;
    else
      fatality_sun <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rat_what <= 0;
    else if (gnd)
      rat_what <= 0;
    else if (ham_alpha)
      rat_what <= lsd_downers;
  end

reg feedback_pt_492;

always @(gnd or feedback_pt_492)
  begin
      marquis_husks = !gnd &  feedback_pt_492;
  end

reg feedback_pt_493;

always @(gap_tamago or feedback_pt_493)
  begin
      neville_bravo =  gap_tamago |  feedback_pt_493;
  end

reg feedback_pt_494;

always @(marco_thread or feedback_pt_494)
  begin
      water_ykocens =  marco_thread |  feedback_pt_494;
  end

reg feedback_pt_495;

always @(foxtrot_sears or feedback_pt_495)
  begin
      hotdog_priest =  foxtrot_sears & !feedback_pt_495;
  end

reg feedback_pt_496;

always @(atoms_filch or feedback_pt_496)
  begin
      thread_quail =  atoms_filch ^  feedback_pt_496;
  end

reg feedback_pt_497;

always @(clay_ritsu or feedback_pt_497)
  begin
      grumby_haze = !clay_ritsu ^  feedback_pt_497;
  end

reg feedback_pt_498;

always @(klaas_diagon or feedback_pt_498)
  begin
      louie_heidi = !klaas_diagon ^  feedback_pt_498;
  end

reg feedback_pt_499;

always @(haze_smithers or feedback_pt_499)
  begin
      snort_quebec = !haze_smithers &  feedback_pt_499;
  end

reg feedback_pt_500;

always @(echo_eggsalad or feedback_pt_500)
  begin
      spastic_pilot = !echo_eggsalad ^  feedback_pt_500;
  end

reg feedback_pt_501;

always @(vegas_peace or feedback_pt_501)
  begin
      goat_mouse = !vegas_peace |  feedback_pt_501;
  end

reg feedback_pt_502;

always @(gnd or feedback_pt_502)
  begin
      mike_stirfry = !gnd | !feedback_pt_502;
  end

reg feedback_pt_503;

always @(soccer_speed or feedback_pt_503)
  begin
      hagrid_indigo = !soccer_speed ^ !feedback_pt_503;
  end

reg feedback_pt_504;

always @(vcc or feedback_pt_504)
  begin
      crayons_ibm =  vcc ^  feedback_pt_504;
  end

reg feedback_pt_505;

always @(gnd or feedback_pt_505)
  begin
      hut_burnout = !gnd & !feedback_pt_505;
  end

reg feedback_pt_506;

always @(jonas_monster or feedback_pt_506)
  begin
      oranje_zen =  jonas_monster |  feedback_pt_506;
  end

reg feedback_pt_507;

always @(thread_quail or feedback_pt_507)
  begin
      covad_pdiddy =  thread_quail ^  feedback_pt_507;
  end

reg feedback_pt_508;

always @(aspirin_ritsu or feedback_pt_508)
  begin
      eel_psycho =  aspirin_ritsu |  feedback_pt_508;
  end

reg feedback_pt_509;

always @(honda_elf or feedback_pt_509)
  begin
      rarest_chevys =  honda_elf ^ !feedback_pt_509;
  end

reg feedback_pt_510;

always @(muffin_homer or feedback_pt_510)
  begin
      plaster_yummy =  muffin_homer &  feedback_pt_510;
  end

reg feedback_pt_511;

always @(west_powder or feedback_pt_511)
  begin
      stix_broom = !west_powder ^  feedback_pt_511;
  end

reg feedback_pt_512;

always @(dimetap_vegan or feedback_pt_512)
  begin
      kbtoys_tofu = !dimetap_vegan |  feedback_pt_512;
  end

reg feedback_pt_513;

always @(sanity_tarzan or feedback_pt_513)
  begin
      theseus_rojas =  sanity_tarzan & !feedback_pt_513;
  end

reg feedback_pt_514;

always @(chowmein or feedback_pt_514)
  begin
      stroop_doc =  chowmein | !feedback_pt_514;
  end

reg feedback_pt_515;

always @(vcc or feedback_pt_515)
  begin
      leaky_snort = !vcc &  feedback_pt_515;
  end

reg feedback_pt_516;

always @(gnd or feedback_pt_516)
  begin
      kilo_tylenol = !gnd & !feedback_pt_516;
  end

reg feedback_pt_517;

always @(vcc or feedback_pt_517)
  begin
      tiger_rubik = !vcc |  feedback_pt_517;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_kebab <= 0;
    else
      boing_kebab <= helena;
  end

always @(boing_kebab)
  begin
      feedback_pt_492 = boing_kebab;
  end

always @(boing_kebab)
  begin
      feedback_pt_493 = boing_kebab;
  end

always @(boing_kebab)
  begin
      feedback_pt_494 = boing_kebab;
  end

always @(boing_kebab)
  begin
      feedback_pt_495 = boing_kebab;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speed_tuna <= 0;
    else if (dopey_sinew)
      speed_tuna <= 0;
    else if (kabar_jacques)
      speed_tuna <= pdaddy_kappa;
  end

always @(speed_tuna)
  begin
      feedback_pt_496 = speed_tuna;
  end

always @(speed_tuna)
  begin
      feedback_pt_497 = speed_tuna;
  end

always @(speed_tuna)
  begin
      feedback_pt_498 = speed_tuna;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yankee_zi <= 0;
    else if (gnd)
      yankee_zi <= plaster_yummy;
  end

always @(yankee_zi)
  begin
      feedback_pt_499 = yankee_zi;
  end

always @(yankee_zi)
  begin
      feedback_pt_500 = yankee_zi;
  end

always @(yankee_zi)
  begin
      feedback_pt_501 = yankee_zi;
  end

always @(yankee_zi)
  begin
      feedback_pt_502 = yankee_zi;
  end

always @(yankee_zi)
  begin
      feedback_pt_503 = yankee_zi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_loser <= 0;
    else if (sheep_bart)
      ladder_loser <= ariel_wujing;
    else if (english_pyro)
      ladder_loser <= 0;
  end

always @(ladder_loser)
  begin
      feedback_pt_504 = ladder_loser;
  end

always @(ladder_loser)
  begin
      feedback_pt_505 = ladder_loser;
  end

always @(ladder_loser)
  begin
      feedback_pt_506 = ladder_loser;
  end

always @(ladder_loser)
  begin
      feedback_pt_507 = ladder_loser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quail_fascist <= 1;
    else
      quail_fascist <= gnd;
  end

always @(quail_fascist)
  begin
      feedback_pt_508 = quail_fascist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_brian <= 0;
    else if (solder_issac)
      sogood_brian <= gnd;
  end

always @(sogood_brian)
  begin
      feedback_pt_509 = sogood_brian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      condit_pirate <= 1;
    else
      condit_pirate <= amex_potter;
  end

always @(condit_pirate)
  begin
      feedback_pt_510 = condit_pirate;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_moe <= 0;
    else if (south_nasdaq)
      pepsi_moe <= kilo_knot;
  end

always @(pepsi_moe)
  begin
      feedback_pt_511 = pepsi_moe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      albus_what <= 0;
    else if (vcc)
      albus_what <= pilot_nasdaq;
  end

always @(albus_what)
  begin
      feedback_pt_512 = albus_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_dimetap <= 0;
    else if (gnd)
      oscar_dimetap <= 0;
    else if (killer_ready)
      oscar_dimetap <= nest_crank;
  end

always @(oscar_dimetap)
  begin
      feedback_pt_513 = oscar_dimetap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonks_jesus <= 0;
    else if (due_firewalk)
      tonks_jesus <= vcc;
  end

always @(tonks_jesus)
  begin
      feedback_pt_514 = tonks_jesus;
  end

wire oldnavy_romex_wire;

dffeas oldnavy_romex_ff (
  .clk(clock1),
  .d(life_atchoo),
  .ena(whiskey_alpha),
  .sclr(vcc),
  .sload(mike_mcnugget),
  .asdata(vcc),
  .clrn(!reset1),
  .q(oldnavy_romex_wire)
);

always @(oldnavy_romex_wire) begin
   crab_tank = oldnavy_romex_wire;
end

always @(crab_tank)
  begin
      feedback_pt_515 = crab_tank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      paper_english <= 0;
    else if (vcc)
      paper_english <= knot_neville;
  end

always @(paper_english)
  begin
      feedback_pt_516 = paper_english;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hawaii_plague <= 1;
    else
      hawaii_plague <= gnd;
  end

always @(hawaii_plague)
  begin
      feedback_pt_517 = hawaii_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      po_yellowtail <= 1;
    else
      po_yellowtail <= armand_lovey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonic_whale <= 0;
    else if (marvin_xterm)
      tonic_whale <= atoms_art;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_plague <= 0;
    else if (soccer_speed)
      egg_plague <= huhhuh;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cocaine_bart <= 0;
    else if (yankee_zi)
      cocaine_bart <= 0;
    else if (oranje_zen)
      cocaine_bart <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_hp <= 0;
    else if (boitano_bagel)
      rose_hp <= kilo_knot;
    else if (due_happy)
      rose_hp <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deuce_salsa <= 0;
    else if (purple_rod)
      deuce_salsa <= lotus_golf;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_mickey <= 0;
    else if (barney)
      stix_mickey <= vcc;
    else if (hotdog_priest)
      stix_mickey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eggsalad_dirk <= 0;
    else if (zen_tako)
      eggsalad_dirk <= vcc;
    else if (soccer_speed)
      eggsalad_dirk <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_faster <= 0;
    else if (moody_noah)
      animal_faster <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ginger_hinge <= 0;
    else if (vegas_abraham)
      ginger_hinge <= 0;
    else if (snort_quebec)
      ginger_hinge <= rat_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curly_red <= 0;
    else if (stix_broom)
      curly_red <= gnd;
    else if (marco_thread)
      curly_red <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lad_zebra <= 0;
    else
      lad_zebra <= rewire_bubba;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whacky_hinge <= 0;
    else
      whacky_hinge <= beauty_coffee;
  end

wire drax_intuit_wire;

dffeas drax_intuit_ff (
  .clk(clock1),
  .d(sand_badger),
  .ena(gopher_minnow),
  .sclr(kungfu_surfer),
  .sload(gnd),
  .asdata(venus_elian),
  .clrn(!reset1),
  .q(drax_intuit_wire)
);

always @(drax_intuit_wire) begin
   neville_over = drax_intuit_wire;
end

wire issac_gonzo_wire;

dffea issac_gonzo_ff (
  .clk(clock1),
  .d(plaster_yummy),
  .ena(babette_crank),
  .adata(eunice),
  .clrn(!reset1),
  .q(issac_gonzo_wire)
);

always @(issac_gonzo_wire) begin
   green_sortout = issac_gonzo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mine_chief <= 1;
    else
      mine_chief <= fear_star;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      avon_neon <= 0;
    else if (covad_pdiddy)
      avon_neon <= emu_abraham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snake_copper <= 0;
    else if (metal_dog)
      snake_copper <= 0;
    else if (fury_beast)
      snake_copper <= animal_faster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kmfdm_marvin <= 0;
    else if (vcc)
      kmfdm_marvin <= timmy_bracket;
  end

wire crayons_fury_wire;

dffeas crayons_fury_ff (
  .clk(clock1),
  .d(vcc),
  .ena(lad_zebra),
  .sclr(gnd),
  .sload(boitano_brian),
  .asdata(gnd),
  .clrn(!reset1),
  .q(crayons_fury_wire)
);

always @(crayons_fury_wire) begin
   cubish_issac = crayons_fury_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dig_uppers <= 0;
    else if (oscar_dimetap)
      dig_uppers <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      liberace_lad <= 1;
    else
      liberace_lad <= whiskey_alpha;
  end

wire boitano_wine_wire;

dffeas boitano_wine_ff (
  .clk(clock1),
  .d(otter_kedavra),
  .ena(tiger_rubik),
  .sclr(gnd),
  .sload(sanity_tarzan),
  .asdata(gnd),
  .clrn(!reset1),
  .q(boitano_wine_wire)
);

always @(boitano_wine_wire) begin
   goblin_cubish = boitano_wine_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_sand <= 0;
    else if (vcc)
      west_sand <= 0;
    else if (vcc)
      west_sand <= palm_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emails_lamer <= 0;
    else
      emails_lamer <= att_launcher;
  end

wire lao_ritsu_wire;

dffeas lao_ritsu_ff (
  .clk(clock1),
  .d(helena),
  .ena(tonks_jesus),
  .sclr(hagrid_indigo),
  .sload(roid_crayons),
  .asdata(rewire_bubba),
  .clrn(!reset1),
  .q(lao_ritsu_wire)
);

always @(lao_ritsu_wire) begin
   malfoy_indigo = lao_ritsu_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kungfu_duey <= 1;
    else
      kungfu_duey <= ladder_loser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wine_monster <= 0;
    else if (curly_red)
      wine_monster <= mine_chief;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stick_roid <= 0;
    else if (goblin_cubish)
      stick_roid <= 0;
    else if (diagon_willy)
      stick_roid <= reallyloud;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      metal_heidi <= 1;
    else
      metal_heidi <= ernie_woman;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grams_wakey <= 0;
    else if (loud_ariel)
      grams_wakey <= vcc;
    else if (tiger_rubik)
      grams_wakey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_hiway <= 0;
    else if (vcc)
      tiger_hiway <= yellow_wine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marco_chevys <= 0;
    else if (mideast_bolt)
      marco_chevys <= gnd;
    else if (neon_snape)
      marco_chevys <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romex_whiskey <= 0;
    else
      romex_whiskey <= lad_zebra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tsmc_milhouse <= 0;
    else if (lsd_shuda)
      tsmc_milhouse <= bust_fear;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_skipper <= 0;
    else if (deuce_salsa)
      tiger_skipper <= 0;
    else if (vcc)
      tiger_skipper <= pig_budlite;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      willy_emails <= 0;
    else if (bust_zen)
      willy_emails <= louie_heidi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_speedyg <= 0;
    else if (bust_fear)
      bear_speedyg <= 0;
    else if (llama_palm)
      bear_speedyg <= potato_rod;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yeanyow_atoms <= 1;
    else
      yeanyow_atoms <= bush_gutter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_wiggles <= 0;
    else if (tonic_whale)
      cain_wiggles <= obiwan_quail;
    else if (gnd)
      cain_wiggles <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zedong_coffee <= 1;
    else
      zedong_coffee <= kungfu_duey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      illegal_duck <= 0;
    else if (fear_star)
      illegal_duck <= neville_over;
    else if (eel_psycho)
      illegal_duck <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      square_hagrid <= 0;
    else if (gnd)
      square_hagrid <= 0;
    else if (vicks_skinner)
      square_hagrid <= stick_roid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegan_floo <= 0;
    else if (kmfdm_school)
      vegan_floo <= 0;
    else if (wine_monster)
      vegan_floo <= guy_ykocens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_lotus <= 0;
    else if (ihilani_bert)
      gm_lotus <= gnd;
    else if (marge_tofu)
      gm_lotus <= 0;
  end

wire chainsaw_clay_wire;

dffea chainsaw_clay_ff (
  .clk(clock1),
  .d(due_happy),
  .ena(roid_odin),
  .adata(oscar_nyquil),
  .clrn(!reset1),
  .q(chainsaw_clay_wire)
);

always @(chainsaw_clay_wire) begin
   nyc_pizza = chainsaw_clay_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tabby_nuclear <= 1;
    else
      tabby_nuclear <= snort_quebec;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mars_monkey <= 0;
    else
      mars_monkey <= metal_covad;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_amex <= 1;
    else
      ramone_amex <= master_bart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      remus_vicks <= 1;
    else
      remus_vicks <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      penguin_cheez <= 0;
    else if (advil_army)
      penguin_cheez <= dig_shark;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turkey_tank <= 0;
    else if (vcc)
      turkey_tank <= 0;
    else if (intuit_voodoo)
      turkey_tank <= pig_budlite;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foxtrot_boots <= 0;
    else if (emu_skinner)
      foxtrot_boots <= 0;
    else if (art_norbert)
      foxtrot_boots <= leaky_snort;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      porfavor_ebi <= 0;
    else if (master_bart)
      porfavor_ebi <= 0;
    else if (boing_kebab)
      porfavor_ebi <= knot_neville;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      palmer_dadada <= 0;
    else
      palmer_dadada <= gnd;
  end

// Random combinatorial logic block
always@(*)
  begin
      dragon_paper = booming & hulk_atomic;
  end

// Bus inputs for MACing
reg  [10:0] gonzo_scrooge_a;
reg signed [12:0] gonzo_scrooge_b;
reg signed [14:0] gonzo_scrooge_c;
reg  [7:0] gonzo_scrooge_d;
always @(dopey_sinew or palmer_dadada or papa_dadada or vcc or kilo_rojas or barney_cannon or emu_romex or parrot_doc or ants or south_toysrus or vcc) begin
  gonzo_scrooge_a = {dopey_sinew,palmer_dadada,papa_dadada,vcc,kilo_rojas,barney_cannon,emu_romex,parrot_doc,ants,south_toysrus,vcc};
end
initial gonzo_scrooge_b <= 0;
always @(posedge clock1) begin
  gonzo_scrooge_b <= {wildboar_iron,yeanyow_atoms,ramone_amex,lizard_kanji,wanton_flew,fortuyn_lamer,gnd,west_sand,gnd,ghost_zinc,stix_broom,vcc,gnd};
end
always @(gnd or south_nasdaq or cluckU_fuji or vcc or beauty_dog or crab_tank or gnd or chief_timmy or hawaii_plague or rose_hp or gonzo_eunice or quebec_crank or dopey_sinew or leidiot_duey or emu_xiaoping) begin
  gonzo_scrooge_c = {gnd,south_nasdaq,cluckU_fuji,vcc,beauty_dog,crab_tank,gnd,chief_timmy,hawaii_plague,rose_hp,gonzo_eunice,quebec_crank,dopey_sinew,leidiot_duey,emu_xiaoping};
end
always @(haze_smithers or avon_oranges or knot_neville or quail_minnie or gnd or thread_quail or due_firewalk or pig_budlite) begin
  gonzo_scrooge_d = {haze_smithers,avon_oranges,knot_neville,quail_minnie,gnd,thread_quail,due_firewalk,pig_budlite};
end

// MAC inference bait
always @(gonzo_scrooge_a or gonzo_scrooge_b or gonzo_scrooge_c or gonzo_scrooge_d)
  begin
    {po_mario_owes,stoner_candle,bravo_hours,george_lovey,sheep_gyro,jason_drunken,bach_rewire,beetle_genji} = 
        (-gonzo_scrooge_a *
        gonzo_scrooge_b) +
        (~gonzo_scrooge_c *
         gonzo_scrooge_d);
  end


initial begin
    {cybex_hawaii,iron_gonzo,advil_iceland,smack_beavis,southern_bfi,cafe_concorde,west_stick} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({stroop_mexico,lotus_sgates,stroop_doc,gnd,gnd,vcc,gnd} < {woman_tiger,foxtrot_boots,peace_broom,emails_lamer,emu_skinner,vcc,boing_kebab})
       {cybex_hawaii,iron_gonzo,advil_iceland,smack_beavis,southern_bfi,cafe_concorde,west_stick} <= {woman_tiger,foxtrot_boots,peace_broom,emails_lamer,emu_skinner,vcc,boing_kebab};
    else
       {cybex_hawaii,iron_gonzo,advil_iceland,smack_beavis,southern_bfi,cafe_concorde,west_stick} <= {stroop_mexico,lotus_sgates,stroop_doc,gnd,gnd,vcc,gnd};
  end

// 7 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum} <= 0;
    else if (vcc)
      {falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum} <= {falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum} + 1;
    else
      {falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum} <= {falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum} - 1;
  end

// A + const
always @(emails_lamer or egg_plague or hinge_enoch or grumby_haze or deruyter or po_mario_owes or water_foryou or gnd or whacky_hinge or gnd)
  begin
    {escape_escape,rerun_husks,kabar_mortar,wine_eggsalad,frog_emails,kana_red,kebab_arizona,leidiot_ghost} = {emails_lamer,egg_plague,hinge_enoch,grumby_haze,deruyter,po_mario_owes,water_foryou,gnd,whacky_hinge,gnd} + 48;
  end

// AND all of these bits together
always @(neville_bravo or homer_goofy or boing_jiminy or bambi_skipper or vcc or hurt_rose or trevor or kebab_arizona or amex_potter)
  begin
      dweebie_issac = & {neville_bravo,homer_goofy,boing_jiminy,bambi_skipper,vcc,hurt_rose,trevor,kebab_arizona,amex_potter};
  end

// 6 input 6 output permutation
always @(vcc or advil_army or wonton_crack or kilo_tylenol or kilo_tylenol or weasley)
  begin
    case ({vcc,advil_army,wonton_crack,kilo_tylenol,kilo_tylenol,weasley})
      0: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=1;
      1: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=0;
      2: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=29;
      3: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=58;
      4: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=13;
      5: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=26;
      6: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=63;
      7: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=22;
      8: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=36;
      9: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=51;
      10: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=23;
      11: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=45;
      12: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=2;
      13: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=15;
      14: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=33;
      15: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=35;
      16: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=6;
      17: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=40;
      18: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=34;
      19: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=20;
      20: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=24;
      21: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=52;
      22: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=28;
      23: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=38;
      24: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=18;
      25: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=8;
      26: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=60;
      27: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=57;
      28: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=43;
      29: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=37;
      30: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=49;
      31: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=39;
      32: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=25;
      33: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=12;
      34: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=48;
      35: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=17;
      36: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=10;
      37: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=9;
      38: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=3;
      39: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=54;
      40: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=61;
      41: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=62;
      42: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=55;
      43: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=19;
      44: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=46;
      45: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=4;
      46: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=16;
      47: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=41;
      48: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=32;
      49: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=11;
      50: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=21;
      51: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=56;
      52: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=50;
      53: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=31;
      54: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=27;
      55: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=53;
      56: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=5;
      57: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=44;
      58: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=30;
      59: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=14;
      60: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=7;
      61: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=47;
      62: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=42;
      63: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=59;
      default: {bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain}=0;
    endcase
  end

// AND all of these bits together
always @(nyc_pizza or hippo_mozart or vcc or rerun_husks or foryou_rubik)
  begin
      rouge_east = & {nyc_pizza,hippo_mozart,vcc,rerun_husks,foryou_rubik};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      phoenix_ebay <= 0;
    else
    case ({vcc,south_nasdaq})
       0 : phoenix_ebay <= phoenix_ebay;
       1 : phoenix_ebay <= giraffe_huey;
       2 : phoenix_ebay <= phoenix_ebay;
       3 : phoenix_ebay <= vcc;
       default : phoenix_ebay <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zen_firstpart <= 0;
    else
    case ({gnd,cocaine_bart})
       0 : zen_firstpart <= helena_sinus;
       1 : zen_firstpart <= zen_firstpart;
       2 : zen_firstpart <= zen_firstpart;
       3 : zen_firstpart <= stroop_doc;
       default : zen_firstpart <= 0;
    endcase
  end

reg feedback_pt_518;

always @(po_mario_owes or feedback_pt_518)
  begin
      rarest_tabby = !po_mario_owes & !feedback_pt_518;
  end

reg feedback_pt_519;

always @(marco_thread or feedback_pt_519)
  begin
      viagra_plague =  marco_thread & !feedback_pt_519;
  end

reg feedback_pt_520;

always @(gnd or feedback_pt_520)
  begin
      lupin_gotone = !gnd &  feedback_pt_520;
  end

reg feedback_pt_521;

always @(speed_tuna or feedback_pt_521)
  begin
      dig_obiwan = !speed_tuna & !feedback_pt_521;
  end

reg feedback_pt_522;

always @(life_atchoo or feedback_pt_522)
  begin
      alpha_maryann = !life_atchoo &  feedback_pt_522;
  end

reg feedback_pt_523;

always @(tako_fortuyn or feedback_pt_523)
  begin
      often_pdaddy =  tako_fortuyn & !feedback_pt_523;
  end

reg feedback_pt_524;

always @(spyro_lima or feedback_pt_524)
  begin
      aphid_lantern =  spyro_lima & !feedback_pt_524;
  end

reg feedback_pt_525;

always @(gnd or feedback_pt_525)
  begin
      sugar_coconut = !gnd |  feedback_pt_525;
  end

reg feedback_pt_526;

always @(rojas_norbert or feedback_pt_526)
  begin
      ernie_emu = !rojas_norbert & !feedback_pt_526;
  end

reg feedback_pt_527;

always @(vcc or feedback_pt_527)
  begin
      burning_ohno =  vcc ^ !feedback_pt_527;
  end

reg feedback_pt_528;

always @(emu_xiaoping or feedback_pt_528)
  begin
      rod_sebastian = !emu_xiaoping & !feedback_pt_528;
  end

reg feedback_pt_529;

always @(kbtoys_tofu or feedback_pt_529)
  begin
      zeus_hinkley = !kbtoys_tofu &  feedback_pt_529;
  end

reg feedback_pt_530;

always @(southern_cow or feedback_pt_530)
  begin
      shark_richard = !southern_cow ^ !feedback_pt_530;
  end

reg feedback_pt_531;

always @(smack_beavis or feedback_pt_531)
  begin
      avon_century = !smack_beavis | !feedback_pt_531;
  end

reg feedback_pt_532;

always @(marco_chevys or feedback_pt_532)
  begin
      gyro_love_in = !marco_chevys ^  feedback_pt_532;
  end

reg feedback_pt_533;

always @(malfoy_indigo or feedback_pt_533)
  begin
      spyro_lotus = !malfoy_indigo &  feedback_pt_533;
  end

reg feedback_pt_534;

always @(skipper_would or feedback_pt_534)
  begin
      popcorn_whack =  skipper_would ^  feedback_pt_534;
  end

reg feedback_pt_535;

always @(po_yellowtail or feedback_pt_535)
  begin
      eagle_beef =  po_yellowtail |  feedback_pt_535;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      riddler_hans <= 0;
    else if (vcc)
      riddler_hans <= beef_shuda;
  end

always @(riddler_hans)
  begin
      feedback_pt_518 = riddler_hans;
  end

always @(riddler_hans)
  begin
      feedback_pt_519 = riddler_hans;
  end

always @(riddler_hans)
  begin
      feedback_pt_520 = riddler_hans;
  end

always @(riddler_hans)
  begin
      feedback_pt_521 = riddler_hans;
  end

always @(riddler_hans)
  begin
      feedback_pt_522 = riddler_hans;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_morrison <= 0;
    else if (sgates_think)
      bear_morrison <= genji_dweebie;
    else if (kanji_gyro)
      bear_morrison <= 0;
  end

always @(bear_morrison)
  begin
      feedback_pt_523 = bear_morrison;
  end

always @(bear_morrison)
  begin
      feedback_pt_524 = bear_morrison;
  end

always @(bear_morrison)
  begin
      feedback_pt_525 = bear_morrison;
  end

always @(bear_morrison)
  begin
      feedback_pt_526 = bear_morrison;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dow_blue <= 0;
    else if (stix_broom)
      dow_blue <= tsmc_milhouse;
  end

always @(dow_blue)
  begin
      feedback_pt_527 = dow_blue;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      protest_cow <= 1;
    else
      protest_cow <= vcc;
  end

always @(protest_cow)
  begin
      feedback_pt_528 = protest_cow;
  end

wire george_hp_wire;

dffeas george_hp_ff (
  .clk(clock1),
  .d(sheep_gyro),
  .ena(tiger_skipper),
  .sclr(condit_pirate),
  .sload(beetle_genji),
  .asdata(vcc),
  .clrn(!reset1),
  .q(george_hp_wire)
);

always @(george_hp_wire) begin
   opus_riddler = george_hp_wire;
end

always @(opus_riddler)
  begin
      feedback_pt_529 = opus_riddler;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_rose <= 0;
    else if (wine_eggsalad)
      pizza_rose <= vcc;
    else if (gnd)
      pizza_rose <= 0;
  end

always @(pizza_rose)
  begin
      feedback_pt_530 = pizza_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_autotest <= 0;
    else if (bach_rewire)
      kilo_autotest <= squad_wukong;
  end

always @(kilo_autotest)
  begin
      feedback_pt_531 = kilo_autotest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fitter_pilot <= 0;
    else if (lima_hummer)
      fitter_pilot <= 0;
    else if (spyro_nirish)
      fitter_pilot <= vcc;
  end

always @(fitter_pilot)
  begin
      feedback_pt_532 = fitter_pilot;
  end

wire bravo_exodus_wire;

dffeas bravo_exodus_ff (
  .clk(clock1),
  .d(vcc),
  .ena(gnd),
  .sclr(gnd),
  .sload(dorkus_marge),
  .asdata(kanji_gyro),
  .clrn(!reset1),
  .q(bravo_exodus_wire)
);

always @(bravo_exodus_wire) begin
   spastic_todd = bravo_exodus_wire;
end

always @(spastic_todd)
  begin
      feedback_pt_533 = spastic_todd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golfland_roid <= 1;
    else
      golfland_roid <= gnd;
  end

always @(golfland_roid)
  begin
      feedback_pt_534 = golfland_roid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_lamer <= 0;
    else
      richard_lamer <= lizard_kanji;
  end

always @(richard_lamer)
  begin
      feedback_pt_535 = richard_lamer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beemer_floo <= 0;
    else if (gnd)
      beemer_floo <= alpha_maryann;
  end

wire vicks_tracy_wire;

dffeas vicks_tracy_ff (
  .clk(clock1),
  .d(gin_ceres),
  .ena(riddler_hans),
  .sclr(stix_mickey),
  .sload(lisa),
  .asdata(gnd),
  .clrn(!reset1),
  .q(vicks_tracy_wire)
);

always @(vicks_tracy_wire) begin
   escape_jesus = vicks_tracy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dragon_broom <= 0;
    else if (biker_bono)
      dragon_broom <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burner_bfi <= 0;
    else if (dragon_paper)
      burner_bfi <= curie_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_wonton <= 0;
    else
      egg_wonton <= bfs_star;
  end

wire abraham_albus_wire;

dffea abraham_albus_ff (
  .clk(clock1),
  .d(bach_rewire),
  .ena(oscar_bonker),
  .adata(arcade),
  .clrn(!reset1),
  .q(abraham_albus_wire)
);

always @(abraham_albus_wire) begin
   curie_lost = abraham_albus_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wine_mine <= 0;
    else if (rojas_tobe)
      wine_mine <= 0;
    else if (surfer_tuna)
      wine_mine <= zen_firstpart;
  end

wire monkey_barney_wire;

dffeas monkey_barney_ff (
  .clk(clock1),
  .d(gnd),
  .ena(gnd),
  .sclr(pluto_psycho),
  .sload(tattoo_east),
  .asdata(wine_sand),
  .clrn(!reset1),
  .q(monkey_barney_wire)
);

always @(monkey_barney_wire) begin
   mrbill_mars = monkey_barney_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      athena_barty <= 0;
    else
      athena_barty <= moody_noah;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marge_dirty <= 0;
    else if (zeus_hinkley)
      marge_dirty <= safeway_nest;
    else if (legos_tofu)
      marge_dirty <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salsa_master <= 0;
    else if (wine_sand)
      salsa_master <= 0;
    else if (vcc)
      salsa_master <= crack_donald;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sirius_tobiko <= 0;
    else if (falafel_sun)
      sirius_tobiko <= 0;
    else if (gnd)
      sirius_tobiko <= curie_lost;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      venus_martian <= 0;
    else if (platinum_haze)
      venus_martian <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goat_romex <= 0;
    else
      goat_romex <= golden_sleepy;
  end

wire fang_atilla_wire;

dffea fang_atilla_ff (
  .clk(clock1),
  .d(gnd),
  .ena(crack_donald),
  .adata(deruyter),
  .clrn(!reset1),
  .q(fang_atilla_wire)
);

always @(fang_atilla_wire) begin
   egg_barney = fang_atilla_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eagle_centaur <= 1;
    else
      eagle_centaur <= bear_morrison;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_palmer <= 1;
    else
      ramone_palmer <= rat_xterm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      schwinger_red <= 0;
    else if (cain_wiggles)
      schwinger_red <= jacques_rum;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      potato_bull <= 0;
    else
      potato_bull <= priest_gopher;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_kungfu <= 0;
    else if (gnd)
      pixie_kungfu <= 0;
    else if (oscar_too_big)
      pixie_kungfu <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pasta_shuda <= 0;
    else
      pasta_shuda <= pixie_kungfu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lost_agitator <= 0;
    else if (vcc)
      lost_agitator <= burner_bfi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      square_cubish <= 1;
    else
      square_cubish <= phoenix_ebay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dig_fsncens <= 1;
    else
      dig_fsncens <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lao_shudamak <= 0;
    else if (arcade)
      lao_shudamak <= gnd;
    else if (gm_lotus)
      lao_shudamak <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hawaii_marco <= 0;
    else if (hinge_enoch)
      hawaii_marco <= west_sand;
    else if (vcc)
      hawaii_marco <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      palmer_bust <= 0;
    else if (broom_eagle)
      palmer_bust <= 0;
    else if (malfoy_indigo)
      palmer_bust <= dork_porfavor;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rodriguez_guy <= 0;
    else
      rodriguez_guy <= spastic;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonder_stroop <= 1;
    else
      wonder_stroop <= hut_burnout;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marco_orange <= 0;
    else if (leaky_jinyong)
      marco_orange <= 0;
    else if (goofy_bach)
      marco_orange <= spyro_lotus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bep_defoliant <= 0;
    else
      bep_defoliant <= marco_chevys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      what_eel <= 0;
    else if (tiger_hiway)
      what_eel <= onion_trevor;
    else if (gnd)
      what_eel <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      happy_mortar <= 0;
    else if (loser_echo)
      happy_mortar <= 0;
    else if (rarest_chevys)
      happy_mortar <= popcorn_whack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      metal_romulus <= 0;
    else if (vcc)
      metal_romulus <= gyro_love_in;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bravo_arcade <= 0;
    else if (dig_obiwan)
      bravo_arcade <= 0;
    else if (gnd)
      bravo_arcade <= banshee_think;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chowmein_haze <= 0;
    else if (zed_weevil)
      chowmein_haze <= square_cubish;
    else if (ocean_huhhuh)
      chowmein_haze <= 0;
  end

wire ham_bacon_wire;

dffeas ham_bacon_ff (
  .clk(clock1),
  .d(cubish_issac),
  .ena(burning_ohno),
  .sclr(kilo_autotest),
  .sload(vcc),
  .asdata(po_mario_owes),
  .clrn(!reset1),
  .q(ham_bacon_wire)
);

always @(ham_bacon_wire) begin
   moron_gin = ham_bacon_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roe_kanji <= 1;
    else
      roe_kanji <= nest_mcnugget;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nyc_candle <= 0;
    else if (gnd)
      nyc_candle <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elf_killer <= 1;
    else
      elf_killer <= hut_burnout;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_plague <= 0;
    else
      curie_plague <= bert_south;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spyro_neon <= 0;
    else if (spyro_lotus)
      spyro_neon <= 0;
    else if (ready_tiger)
      spyro_neon <= nest_mcnugget;
  end

wire ocha_meffert_wire;

dffeas ocha_meffert_ff (
  .clk(clock1),
  .d(vcc),
  .ena(vcc),
  .sclr(marker_bep),
  .sload(snort_jinyong),
  .asdata(seashell_mars),
  .clrn(!reset1),
  .q(ocha_meffert_wire)
);

always @(ocha_meffert_wire) begin
   kungfu_elian = ocha_meffert_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gap_greenbay <= 1;
    else
      gap_greenbay <= smack_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gilligan_mine <= 0;
    else if (falafel_north)
      gilligan_mine <= 0;
    else if (wine_mine)
      gilligan_mine <= bust_fear;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hector_potato <= 0;
    else if (spastic_pilot)
      hector_potato <= guy_ykocens;
  end

wire tsmc_wildboar_wire;

dffeas tsmc_wildboar_ff (
  .clk(clock1),
  .d(egg_wonton),
  .ena(due_firewalk),
  .sclr(oscar_tobiko),
  .sload(happy_mortar),
  .asdata(marge_dirty),
  .clrn(!reset1),
  .q(tsmc_wildboar_wire)
);

always @(tsmc_wildboar_wire) begin
   moron_curious = tsmc_wildboar_wire;
end

wire jesus_rubik_wire;

dffea jesus_rubik_ff (
  .clk(clock1),
  .d(gnd),
  .ena(po_mario_owes),
  .adata(hector_potato),
  .clrn(!reset1),
  .q(jesus_rubik_wire)
);

always @(jesus_rubik_wire) begin
   what_doobie = jesus_rubik_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_larry <= 0;
    else
      rose_larry <= escape_jesus;
  end

wire oscar_tapered_wire;

dffeas oscar_tapered_ff (
  .clk(clock1),
  .d(condit_pirate),
  .ena(po_yellowtail),
  .sclr(clay_yohimbe),
  .sload(oscar_too_big),
  .asdata(rod_sebastian),
  .clrn(!reset1),
  .q(oscar_tapered_wire)
);

always @(oscar_tapered_wire) begin
   chillis_cybex = oscar_tapered_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spain_yellow <= 0;
    else
      spain_yellow <= guy_ykocens;
  end

// State Mek homerun_meth Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homerun_meth <= homerun_meth_0;
    else
      case (homerun_meth)
        homerun_meth_0: begin
          if ({mars_monkey,seashell_mars,gnd,gnd} == 5)
            homerun_meth <= homerun_meth_2;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 2)
            homerun_meth <= homerun_meth_2;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 7)
            homerun_meth <= homerun_meth_3;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 12)
            homerun_meth <= homerun_meth_1;
          else
            homerun_meth <= homerun_meth_0;
          end
        homerun_meth_1: begin
          if ({mars_monkey,seashell_mars,gnd,gnd} == 8)
            homerun_meth <= homerun_meth_2;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 5)
            homerun_meth <= homerun_meth_3;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 7)
            homerun_meth <= homerun_meth_2;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 0)
            homerun_meth <= homerun_meth_0;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 12)
            homerun_meth <= homerun_meth_4;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 10)
            homerun_meth <= homerun_meth_2;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 3)
            homerun_meth <= homerun_meth_5;
          else
            homerun_meth <= homerun_meth_1;
          end
        homerun_meth_2: begin
          if ({mars_monkey,seashell_mars,gnd,gnd} == 5)
            homerun_meth <= homerun_meth_1;
          else
            homerun_meth <= homerun_meth_2;
          end
        homerun_meth_3: begin
          if ({mars_monkey,seashell_mars,gnd,gnd} == 14)
            homerun_meth <= homerun_meth_5;
          else
            homerun_meth <= homerun_meth_3;
          end
        homerun_meth_4: begin
          if ({mars_monkey,seashell_mars,gnd,gnd} == 7)
            homerun_meth <= homerun_meth_0;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 13)
            homerun_meth <= homerun_meth_0;
          else if ({mars_monkey,seashell_mars,gnd,gnd} == 15)
            homerun_meth <= homerun_meth_1;
          else
            homerun_meth <= homerun_meth_4;
          end
        homerun_meth_5: begin
            homerun_meth <= homerun_meth_5;
          end
        default: homerun_meth <= homerun_meth_0;
      endcase
  end

// State Mek homerun_meth Output logic
always @(homerun_meth)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (homerun_meth[3:1])
        homerun_meth_0: begin
            advil_yummy = 0;
            foryou_subway = 0;
            freaky_pdaddy = 1;
            bonker_gonzo = 0;
            bfs_mortar = 1;
            hans_palmer = 1;
            curie_sogood = 1;
            life_rabbi = 0;
            fear_exodus = 0;
            itchy_rose = 0;
            parrot_dragon = 1;
            yak_holepunch = 0;
            ajax_spyro = 0;
          end
        homerun_meth_1: begin
            advil_yummy = 0;
            foryou_subway = 1;
            freaky_pdaddy = 0;
            bonker_gonzo = 1;
            bfs_mortar = 0;
            hans_palmer = 0;
            curie_sogood = 1;
            life_rabbi = 0;
            fear_exodus = 1;
            itchy_rose = 1;
            parrot_dragon = 0;
            yak_holepunch = 0;
            ajax_spyro = 1;
          end
        homerun_meth_2: begin
            advil_yummy = 1;
            foryou_subway = 1;
            freaky_pdaddy = 1;
            bonker_gonzo = 1;
            bfs_mortar = 0;
            hans_palmer = 1;
            curie_sogood = 1;
            life_rabbi = 1;
            fear_exodus = 1;
            itchy_rose = 1;
            parrot_dragon = 0;
            yak_holepunch = 0;
            ajax_spyro = 0;
          end
        default: begin
            advil_yummy = 1;
            foryou_subway = 1;
            freaky_pdaddy = 0;
            bonker_gonzo = 0;
            bfs_mortar = 1;
            hans_palmer = 1;
            curie_sogood = 1;
            life_rabbi = 0;
            fear_exodus = 1;
            itchy_rose = 1;
            parrot_dragon = 0;
            yak_holepunch = 0;
            ajax_spyro = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire wood_notalot_out;
nut_004_lut #(5) nut_004_lut_inst_wood_notalot (
  .din({gnd,jason_drunken,goat_mouse,atoms_art,loser_echo}),
  .mask(32'b11001000000000000100001101100000),
  .out(wood_notalot_out)
);

always @(wood_notalot_out)
begin
   indigo_buddha = wood_notalot_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire pirate_gutter_out;
nut_004_lut #(4) nut_004_lut_inst_pirate_gutter (
  .din({vcc,gnd,gnd,freaky_marco}),
  .mask(16'b0010100011101110),
  .out(pirate_gutter_out)
);

always @(pirate_gutter_out)
begin
   minerva_wakey = pirate_gutter_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire orange_cubish_out;
nut_004_lut #(6) nut_004_lut_inst_orange_cubish (
  .din({beemer_floo,mine_nasdaq,bambi_skipper,curie_plague,sirius_tobiko,gnd}),
  .mask(64'b1000101111010010101000000011000000110001000010010010100010001000),
  .out(orange_cubish_out)
);

always @(orange_cubish_out)
begin
   wonder_fronds = orange_cubish_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire whattime_bert_out;
nut_004_lut #(1) nut_004_lut_inst_whattime_bert (
  .din({advil_yummy}),
  .mask(2'b00),
  .out(whattime_bert_out)
);

always @(whattime_bert_out)
begin
   nasdaq_shemp = whattime_bert_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire sanity_hp_out;
nut_004_lut #(4) nut_004_lut_inst_sanity_hp (
  .din({rum_tukatuk,salsa_master,gnd,dweebie_issac}),
  .mask(16'h83cb),
  .out(sanity_hp_out)
);

always @(sanity_hp_out)
begin
   opus_liberace = sanity_hp_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire iron_cheese_out;
nut_004_lut #(6) nut_004_lut_inst_iron_cheese (
  .din({bfi_obiwan,vcc,fitter_pilot,cybex_hawaii,gnd,snake_copper}),
  .mask(64'ha1ffc1026fd1098d),
  .out(iron_cheese_out)
);

always @(iron_cheese_out)
begin
   stick_intuit = iron_cheese_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire ready_spirit_out;
nut_004_lut #(1) nut_004_lut_inst_ready_spirit (
  .din({vcc}),
  .mask(2'b00),
  .out(ready_spirit_out)
);

always @(ready_spirit_out)
begin
   hulk_kaisha = ready_spirit_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire molokai_rum_out;
nut_004_lut #(3) nut_004_lut_inst_molokai_rum (
  .din({sanity_tarzan,rum_tukatuk,drugs}),
  .mask(8'he3),
  .out(molokai_rum_out)
);

always @(molokai_rum_out)
begin
   show_theseus = molokai_rum_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire maryann_yoku_out;
nut_004_lut #(1) nut_004_lut_inst_maryann_yoku (
  .din({rouge_alpha}),
  .mask(2'b10),
  .out(maryann_yoku_out)
);

always @(maryann_yoku_out)
begin
   seashell_abel = maryann_yoku_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire float_floo_out;
nut_004_lut #(2) nut_004_lut_inst_float_floo (
  .din({lao_beef,gnd}),
  .mask(4'b0001),
  .out(float_floo_out)
);

always @(float_floo_out)
begin
   lao_steaming = float_floo_out;
end

// State Mek beetle_whale Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beetle_whale <= beetle_whale_0;
    else
      case (beetle_whale)
        beetle_whale_0: begin
          if ({lao_steaming,salsa_master,gnd,viagra} == 6)
            beetle_whale <= beetle_whale_3;
          else if ({lao_steaming,salsa_master,gnd,viagra} == 5)
            beetle_whale <= beetle_whale_1;
          else if ({lao_steaming,salsa_master,gnd,viagra} == 12)
            beetle_whale <= beetle_whale_0;
          else if ({lao_steaming,salsa_master,gnd,viagra} == 1)
            beetle_whale <= beetle_whale_3;
          else if ({lao_steaming,salsa_master,gnd,viagra} == 2)
            beetle_whale <= beetle_whale_1;
          else
            beetle_whale <= beetle_whale_0;
          end
        beetle_whale_1: begin
          if ({lao_steaming,salsa_master,gnd,viagra} == 9)
            beetle_whale <= beetle_whale_1;
          else
            beetle_whale <= beetle_whale_1;
          end
        beetle_whale_2: begin
          if ({lao_steaming,salsa_master,gnd,viagra} == 14)
            beetle_whale <= beetle_whale_1;
          else if ({lao_steaming,salsa_master,gnd,viagra} == 8)
            beetle_whale <= beetle_whale_1;
          else if ({lao_steaming,salsa_master,gnd,viagra} == 11)
            beetle_whale <= beetle_whale_1;
          else
            beetle_whale <= beetle_whale_2;
          end
        beetle_whale_3: begin
          if ({lao_steaming,salsa_master,gnd,viagra} == 4)
            beetle_whale <= beetle_whale_2;
          else
            beetle_whale <= beetle_whale_3;
          end
        default: beetle_whale <= beetle_whale_0;
      endcase
  end

// State Mek beetle_whale Output logic
always @(beetle_whale)
  begin
    // consider all state regs when doing outputs
    case (beetle_whale)
        beetle_whale_0: begin
            elf_east = 0;
            boitano_boing = 0;
            pcp_master = 0;
            isle_mortgate = 1;
            acid_gopher = 1;
            norbert_goofy = 1;
            yummy_pizza = 1;
            deng_gerrit = 0;
            echo_zealot = 0;
            rerun_might = 0;
            ebay_sogood = 1;
          end
        beetle_whale_1: begin
            elf_east = 0;
            boitano_boing = 0;
            pcp_master = 0;
            isle_mortgate = 1;
            acid_gopher = 0;
            norbert_goofy = 0;
            yummy_pizza = 1;
            deng_gerrit = 1;
            echo_zealot = 0;
            rerun_might = 1;
            ebay_sogood = 1;
          end
        beetle_whale_2: begin
            elf_east = 0;
            boitano_boing = 0;
            pcp_master = 1;
            isle_mortgate = 0;
            acid_gopher = 0;
            norbert_goofy = 1;
            yummy_pizza = 1;
            deng_gerrit = 0;
            echo_zealot = 0;
            rerun_might = 0;
            ebay_sogood = 1;
          end
        beetle_whale_3: begin
            elf_east = 1;
            boitano_boing = 1;
            pcp_master = 1;
            isle_mortgate = 0;
            acid_gopher = 0;
            norbert_goofy = 1;
            yummy_pizza = 0;
            deng_gerrit = 1;
            echo_zealot = 1;
            rerun_might = 1;
            ebay_sogood = 0;
          end
        default: begin
            elf_east = 0;
            boitano_boing = 1;
            pcp_master = 1;
            isle_mortgate = 0;
            acid_gopher = 0;
            norbert_goofy = 0;
            yummy_pizza = 1;
            deng_gerrit = 1;
            echo_zealot = 1;
            rerun_might = 0;
            ebay_sogood = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire nigiri_ford_out;
nut_004_lut #(5) nut_004_lut_inst_nigiri_ford (
  .din({life_rabbi,liberace_lad,gap_greenbay,moron_curious,crayons_ibm}),
  .mask(32'b00000000011011000010111010000000),
  .out(nigiri_ford_out)
);

always @(nigiri_ford_out)
begin
   nigiri_chuck = nigiri_ford_out;
end

reg feedback_pt_536;

always @(whiskey_alpha or feedback_pt_536)
  begin
      lizard_peta = !whiskey_alpha |  feedback_pt_536;
  end

reg feedback_pt_537;

always @(quail_fascist or feedback_pt_537)
  begin
      donald_rescue =  quail_fascist &  feedback_pt_537;
  end

reg feedback_pt_538;

always @(kilo_tylenol or feedback_pt_538)
  begin
      jupiter_lsd =  kilo_tylenol | !feedback_pt_538;
  end

reg feedback_pt_539;

always @(vcc or feedback_pt_539)
  begin
      kennyg_barney =  vcc | !feedback_pt_539;
  end

reg feedback_pt_540;

always @(vcc or feedback_pt_540)
  begin
      delta_desert = !vcc ^  feedback_pt_540;
  end

reg feedback_pt_541;

always @(fatality_sun or feedback_pt_541)
  begin
      lao_pegasus =  fatality_sun |  feedback_pt_541;
  end

reg feedback_pt_542;

always @(advil_iceland or feedback_pt_542)
  begin
      blanket_tonks = !advil_iceland ^ !feedback_pt_542;
  end

reg feedback_pt_543;

always @(vegan_floo or feedback_pt_543)
  begin
      richard_lovey = !vegan_floo ^  feedback_pt_543;
  end

reg feedback_pt_544;

always @(vcc or feedback_pt_544)
  begin
      pcp_aphid =  vcc |  feedback_pt_544;
  end

reg feedback_pt_545;

always @(yak_holepunch or feedback_pt_545)
  begin
      obiwan_tonks = !yak_holepunch |  feedback_pt_545;
  end

reg feedback_pt_546;

always @(south_toysrus or feedback_pt_546)
  begin
      gin_golden =  south_toysrus & !feedback_pt_546;
  end

reg feedback_pt_547;

always @(palm_haze or feedback_pt_547)
  begin
      tobe_foiled =  palm_haze & !feedback_pt_547;
  end

reg feedback_pt_548;

always @(egg_starwars or feedback_pt_548)
  begin
      burner_often = !egg_starwars ^ !feedback_pt_548;
  end

reg feedback_pt_549;

always @(vcc or feedback_pt_549)
  begin
      dweebie_ring = !vcc & !feedback_pt_549;
  end

reg feedback_pt_550;

always @(quail_minnie or feedback_pt_550)
  begin
      babette_aphid = !quail_minnie & !feedback_pt_550;
  end

reg feedback_pt_551;

always @(crack_donald or feedback_pt_551)
  begin
      lockheed_fire = !crack_donald ^  feedback_pt_551;
  end

reg feedback_pt_552;

always @(eagle_centaur or feedback_pt_552)
  begin
      bagel_shuda =  eagle_centaur ^ !feedback_pt_552;
  end

reg feedback_pt_553;

always @(nation or feedback_pt_553)
  begin
      chainsaw_tofu = !nation ^  feedback_pt_553;
  end

reg feedback_pt_554;

always @(bfi_obiwan or feedback_pt_554)
  begin
      spirit_norris = !bfi_obiwan ^  feedback_pt_554;
  end

reg feedback_pt_555;

always @(kebab_arizona or feedback_pt_555)
  begin
      touch_scotch = !kebab_arizona | !feedback_pt_555;
  end

reg feedback_pt_556;

always @(gulp_oitcen or feedback_pt_556)
  begin
      cheez_zedong =  gulp_oitcen & !feedback_pt_556;
  end

reg feedback_pt_557;

always @(vcc or feedback_pt_557)
  begin
      badger_donkey = !vcc ^ !feedback_pt_557;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lizard_donkey <= 0;
    else if (illegal_duck)
      lizard_donkey <= gnd;
  end

always @(lizard_donkey)
  begin
      feedback_pt_536 = lizard_donkey;
  end

always @(lizard_donkey)
  begin
      feedback_pt_537 = lizard_donkey;
  end

always @(lizard_donkey)
  begin
      feedback_pt_538 = lizard_donkey;
  end

always @(lizard_donkey)
  begin
      feedback_pt_539 = lizard_donkey;
  end

wire ihilani_vadar_wire;

dffeas ihilani_vadar_ff (
  .clk(clock1),
  .d(gnd),
  .ena(yak_brothers),
  .sclr(goat_romex),
  .sload(dweebie_ring),
  .asdata(lumber_kmfdm),
  .clrn(!reset1),
  .q(ihilani_vadar_wire)
);

always @(ihilani_vadar_wire) begin
   jonas_bep = ihilani_vadar_wire;
end

always @(jonas_bep)
  begin
      feedback_pt_540 = jonas_bep;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vangoh_ebay <= 0;
    else
      vangoh_ebay <= dig_uppers;
  end

always @(vangoh_ebay)
  begin
      feedback_pt_541 = vangoh_ebay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fire_boing <= 0;
    else if (vcc)
      fire_boing <= 0;
    else if (what_doobie)
      fire_boing <= vcc;
  end

always @(fire_boing)
  begin
      feedback_pt_542 = fire_boing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gap_india <= 0;
    else if (water_ykocens)
      gap_india <= rum_tukatuk;
    else if (echo_zealot)
      gap_india <= 0;
  end

always @(gap_india)
  begin
      feedback_pt_543 = gap_india;
  end

always @(gap_india)
  begin
      feedback_pt_544 = gap_india;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      my_tummy_zi <= 0;
    else if (gnd)
      my_tummy_zi <= dow_blue;
    else if (gap_india)
      my_tummy_zi <= 0;
  end

always @(my_tummy_zi)
  begin
      feedback_pt_545 = my_tummy_zi;
  end

always @(my_tummy_zi)
  begin
      feedback_pt_546 = my_tummy_zi;
  end

always @(my_tummy_zi)
  begin
      feedback_pt_547 = my_tummy_zi;
  end

always @(my_tummy_zi)
  begin
      feedback_pt_548 = my_tummy_zi;
  end

always @(my_tummy_zi)
  begin
      feedback_pt_549 = my_tummy_zi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jonas_aspirin <= 0;
    else
      jonas_aspirin <= gnd;
  end

always @(jonas_aspirin)
  begin
      feedback_pt_550 = jonas_aspirin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      timmy_snake <= 0;
    else if (advil_yummy)
      timmy_snake <= ykocens;
  end

always @(timmy_snake)
  begin
      feedback_pt_551 = timmy_snake;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_zipporah <= 0;
    else if (gnd)
      emu_zipporah <= kungfu_elian;
    else if (minerva_wakey)
      emu_zipporah <= 0;
  end

always @(emu_zipporah)
  begin
      feedback_pt_552 = emu_zipporah;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      enoch_vangoh <= 0;
    else if (gnd)
      enoch_vangoh <= 0;
    else if (freaky_pdaddy)
      enoch_vangoh <= gnd;
  end

always @(enoch_vangoh)
  begin
      feedback_pt_553 = enoch_vangoh;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dirty_cow <= 0;
    else if (obiwan_tonks)
      dirty_cow <= 0;
    else if (nyc_candle)
      dirty_cow <= gnd;
  end

always @(dirty_cow)
  begin
      feedback_pt_554 = dirty_cow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_clothing <= 0;
    else if (tylenol_otter)
      newt_clothing <= biker_bono;
    else if (kennyg_barney)
      newt_clothing <= 0;
  end

always @(newt_clothing)
  begin
      feedback_pt_555 = newt_clothing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mickey_willy <= 0;
    else if (chicken_romex)
      mickey_willy <= gnd;
  end

always @(mickey_willy)
  begin
      feedback_pt_556 = mickey_willy;
  end

wire soccer_moe_wire;

dffeas soccer_moe_ff (
  .clk(clock1),
  .d(guy_ykocens),
  .ena(lao_pegasus),
  .sclr(wonder_stroop),
  .sload(sogood_brian),
  .asdata(stroop_mexico),
  .clrn(!reset1),
  .q(soccer_moe_wire)
);

always @(soccer_moe_wire) begin
   weasley_hinge = soccer_moe_wire;
end

always @(weasley_hinge)
  begin
      feedback_pt_557 = weasley_hinge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bismuth_fire <= 0;
    else if (gnd)
      bismuth_fire <= 0;
    else if (gnd)
      bismuth_fire <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sand_lotus <= 0;
    else if (vcc)
      sand_lotus <= 0;
    else if (southern_bfi)
      sand_lotus <= beetle_star;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yoku_tonic <= 0;
    else
      yoku_tonic <= smack_beavis;
  end

wire mexico_atoms_wire;

dffeas mexico_atoms_ff (
  .clk(clock1),
  .d(vcc),
  .ena(ramone_palmer),
  .sclr(curie_sogood),
  .sload(bonker_gonzo),
  .asdata(quail_minnie),
  .clrn(!reset1),
  .q(mexico_atoms_wire)
);

always @(mexico_atoms_wire) begin
   south_curie = mexico_atoms_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      att_maryann <= 0;
    else if (wonder_fronds)
      att_maryann <= donald_rescue;
    else if (water_foryou)
      att_maryann <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whack_smack <= 0;
    else
      whack_smack <= show_theseus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_questo <= 0;
    else
      hinge_questo <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tsmc_snape <= 0;
    else if (sogood_brian)
      tsmc_snape <= killer_ready;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      victor_cuanto <= 0;
    else if (kabar_whiskey)
      victor_cuanto <= bolt_foliage;
    else if (kanji_clay)
      victor_cuanto <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      baron_viagra <= 0;
    else
      baron_viagra <= athena_barty;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elephant_gm <= 0;
    else if (frog_emails)
      elephant_gm <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blanket_pilot <= 0;
    else
      blanket_pilot <= kana_red;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_intel <= 0;
    else if (gnd)
      ceres_intel <= hans_palmer;
    else if (dorkus_marge)
      ceres_intel <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      superman_todd <= 0;
    else if (daughter_lisa)
      superman_todd <= 0;
    else if (dimetap_bagel)
      superman_todd <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mike_lotus <= 1;
    else
      mike_lotus <= baron_nihlist;
  end

wire cocacola_milo_wire;

dffeas cocacola_milo_ff (
  .clk(clock1),
  .d(po_killme),
  .ena(chief_bambi),
  .sclr(ernie_emu),
  .sload(egg_starwars),
  .asdata(gnd),
  .clrn(!reset1),
  .q(cocacola_milo_wire)
);

always @(cocacola_milo_wire) begin
   parrot_hippo = cocacola_milo_wire;
end

wire nyc_rod_wire;

dffea nyc_rod_ff (
  .clk(clock1),
  .d(neon_snape),
  .ena(hawaii_marco),
  .adata(gnd),
  .clrn(!reset1),
  .q(nyc_rod_wire)
);

always @(nyc_rod_wire) begin
   acid_tapered = nyc_rod_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_gerard <= 0;
    else if (often_pdaddy)
      pepsi_gerard <= 0;
    else if (joseph_husks)
      pepsi_gerard <= alpha_maryann;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crack_kungfu <= 0;
    else if (gnd)
      crack_kungfu <= avon_neon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snape_neptune <= 0;
    else if (whiskey_alpha)
      snape_neptune <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fish_itchy <= 0;
    else
      fish_itchy <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_ernie <= 0;
    else if (egg_wonton)
      star_ernie <= itchy_rose;
  end

wire dog_charlie_wire;

dffea dog_charlie_ff (
  .clk(clock1),
  .d(vcc),
  .ena(smack_beavis),
  .adata(gnd),
  .clrn(!reset1),
  .q(dog_charlie_wire)
);

always @(dog_charlie_wire) begin
   hp_rampacker = dog_charlie_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turnip_foiled <= 0;
    else if (jonas_bep)
      turnip_foiled <= 0;
    else if (gnd)
      turnip_foiled <= master_bart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jason_dirty <= 1;
    else
      jason_dirty <= marco_orange;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_burning <= 0;
    else
      moe_burning <= gnd;
  end

wire mexican_mike_wire;

dffea mexican_mike_ff (
  .clk(clock1),
  .d(gnd),
  .ena(pcp_master),
  .adata(spyro_neon),
  .clrn(!reset1),
  .q(mexican_mike_wire)
);

always @(mexican_mike_wire) begin
   papa_sun = mexican_mike_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zen_drugie <= 0;
    else if (whack_smack)
      zen_drugie <= fish_itchy;
    else if (ramone_palmer)
      zen_drugie <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wizard_snape <= 0;
    else if (bert_south)
      wizard_snape <= 0;
    else if (elf_east)
      wizard_snape <= minerva_wakey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tunafish_duey <= 0;
    else
      tunafish_duey <= tobe_foiled;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whiskey_crank <= 0;
    else if (smack_beavis)
      whiskey_crank <= foryou_subway;
    else if (tsmc_snape)
      whiskey_crank <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bono_bonafide <= 0;
    else if (killer_ready)
      bono_bonafide <= jupiter_lsd;
    else if (acid_tapered)
      bono_bonafide <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_drax <= 0;
    else if (gnd)
      sogood_drax <= 0;
    else if (chowmein_haze)
      sogood_drax <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burner_hurt <= 0;
    else if (fire_whack)
      burner_hurt <= george_lovey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fury_mozart <= 0;
    else if (dig_obiwan)
      fury_mozart <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      what_booming <= 1;
    else
      what_booming <= enoch_vangoh;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_intel <= 1;
    else
      sinew_intel <= gonzo_eunice;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bacon_nest <= 0;
    else if (chief_peta)
      bacon_nest <= crack_donald;
    else if (salsa_master)
      bacon_nest <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killme_arcade <= 0;
    else
      killme_arcade <= remus_vicks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ariel_thedon <= 0;
    else if (baron_nihlist)
      ariel_thedon <= venus_martian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crank_mozart <= 1;
    else
      crank_mozart <= gnd;
  end

wire diagon_zebra_wire;

dffeas diagon_zebra_ff (
  .clk(clock1),
  .d(norris),
  .ena(vcc),
  .sclr(golfland_roid),
  .sload(cafe_concorde),
  .asdata(rouge_alpha),
  .clrn(!reset1),
  .q(diagon_zebra_wire)
);

always @(diagon_zebra_wire) begin
   sgates_juliet = diagon_zebra_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_oranje <= 0;
    else
      itchy_oranje <= pizza_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platinum_frog <= 0;
    else
      platinum_frog <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hulk_doobie <= 0;
    else if (pilot_nasdaq)
      hulk_doobie <= boitano_boing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      echo_testyour <= 0;
    else if (vcc)
      echo_testyour <= 0;
    else if (gnd)
      echo_testyour <= snape_neptune;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ykocens_kana <= 0;
    else if (homerun_stix)
      ykocens_kana <= pixie_spain;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golden_robust <= 1;
    else
      golden_robust <= sogood_drax;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_jupiter <= 1;
    else
      oscar_jupiter <= eggsalad_dirk;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whiskey_bambi <= 0;
    else if (timmy_snake)
      whiskey_bambi <= bfs_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_romex <= 0;
    else if (ceres_intel)
      ramone_romex <= 0;
    else if (hp_rampacker)
      ramone_romex <= crank_mozart;
  end

wire protest_mine_wire;

dffeas protest_mine_ff (
  .clk(clock1),
  .d(vcc),
  .ena(oscar_tobiko),
  .sclr(bambi_skipper),
  .sload(bagel_shuda),
  .asdata(vcc),
  .clrn(!reset1),
  .q(protest_mine_wire)
);

always @(protest_mine_wire) begin
   illegal_dow = protest_mine_wire;
end

wire kanji_bambi_wire;

dffea kanji_bambi_ff (
  .clk(clock1),
  .d(burner_hurt),
  .ena(snort_jinyong),
  .adata(burner_hurt),
  .clrn(!reset1),
  .q(kanji_bambi_wire)
);

always @(kanji_bambi_wire) begin
   furnace_kilo = kanji_bambi_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_bach <= 0;
    else
      ceres_bach <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oranges_loud <= 0;
    else
      oranges_loud <= square_hagrid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_aspirin <= 0;
    else
      curie_aspirin <= gnd;
  end

// State Mek fitter_honey Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fitter_honey <= fitter_honey_0;
    else
      case (fitter_honey)
        fitter_honey_0: begin
          if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 8)
            fitter_honey <= fitter_honey_4;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 14)
            fitter_honey <= fitter_honey_3;
          else
            fitter_honey <= fitter_honey_0;
          end
        fitter_honey_1: begin
          if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 13)
            fitter_honey <= fitter_honey_1;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 2)
            fitter_honey <= fitter_honey_1;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 12)
            fitter_honey <= fitter_honey_3;
          else
            fitter_honey <= fitter_honey_1;
          end
        fitter_honey_2: begin
          if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 10)
            fitter_honey <= fitter_honey_2;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 2)
            fitter_honey <= fitter_honey_4;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 1)
            fitter_honey <= fitter_honey_3;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 15)
            fitter_honey <= fitter_honey_1;
          else
            fitter_honey <= fitter_honey_2;
          end
        fitter_honey_3: begin
          if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 1)
            fitter_honey <= fitter_honey_2;
          else
            fitter_honey <= fitter_honey_3;
          end
        fitter_honey_4: begin
          if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 3)
            fitter_honey <= fitter_honey_2;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 6)
            fitter_honey <= fitter_honey_4;
          else if ({emu_xiaoping,ajax_spyro,gnd,gnd} == 7)
            fitter_honey <= fitter_honey_1;
          else
            fitter_honey <= fitter_honey_4;
          end
        default: fitter_honey <= fitter_honey_0;
      endcase
  end

// State Mek fitter_honey Output logic
always @(fitter_honey)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (fitter_honey[3:1])
        fitter_honey_0: begin
            vangoh_dadada = 0;
            vegan_lupin = 1;
            chevys_mexico = 0;
            bacon_drugs = 1;
            bolt_kabar = 1;
            boots_macys = 0;
            roid_broom = 0;
            star_arthur = 1;
            turnip_deng = 1;
            master_milo = 0;
            raiders_louie = 0;
            knot_picante = 0;
            sirius_dopey = 1;
            killer_hanger = 0;
            china_whacky = 0;
          end
        fitter_honey_1: begin
            vangoh_dadada = 1;
            vegan_lupin = 0;
            chevys_mexico = 0;
            bacon_drugs = 1;
            bolt_kabar = 0;
            boots_macys = 0;
            roid_broom = 1;
            star_arthur = 0;
            turnip_deng = 0;
            master_milo = 0;
            raiders_louie = 1;
            knot_picante = 0;
            sirius_dopey = 1;
            killer_hanger = 0;
            china_whacky = 1;
          end
        default: begin
            vangoh_dadada = 1;
            vegan_lupin = 0;
            chevys_mexico = 1;
            bacon_drugs = 1;
            bolt_kabar = 1;
            boots_macys = 1;
            roid_broom = 0;
            star_arthur = 1;
            turnip_deng = 1;
            master_milo = 0;
            raiders_louie = 1;
            knot_picante = 1;
            sirius_dopey = 1;
            killer_hanger = 1;
            china_whacky = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire often_surfer_out;
nut_004_lut #(3) nut_004_lut_inst_often_surfer (
  .din({kappa_rufus,norbert_goofy,victor_cuanto}),
  .mask(8'b10000000),
  .out(often_surfer_out)
);

always @(often_surfer_out)
begin
   kappa_drax = often_surfer_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire elguapo_ghost_out;
nut_004_lut #(5) nut_004_lut_inst_elguapo_ghost (
  .din({zedong_coffee,gnd,pepsi_moe,gnd,lizard_donkey}),
  .mask(32'h2e76af5e),
  .out(elguapo_ghost_out)
);

always @(elguapo_ghost_out)
begin
   acid_muffin = elguapo_ghost_out;
end

// In range compare
always @(gnd or oscar_gin or egg_barney)
  begin
    if ({gnd,oscar_gin,egg_barney} > 175 &&
        {gnd,oscar_gin,egg_barney} < 191)
      tattoo_bloom = 1;
    else
      tattoo_bloom = 0;
  end

// 10 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {salmon_badger,fire_hiswife,chips_jacuzzi,rodent_south,iceland_egg,would_husks,kbtoys_pepsi,jacob_ulysses,vicks_bach,uniform_crank} <= 0;
    else if (mike_lotus)
      {salmon_badger,fire_hiswife,chips_jacuzzi,rodent_south,iceland_egg,would_husks,kbtoys_pepsi,jacob_ulysses,vicks_bach,uniform_crank} <= {salmon_badger,fire_hiswife,chips_jacuzzi,rodent_south,iceland_egg,would_husks,kbtoys_pepsi,jacob_ulysses,vicks_bach,uniform_crank} + 1;
    else
      {salmon_badger,fire_hiswife,chips_jacuzzi,rodent_south,iceland_egg,would_husks,kbtoys_pepsi,jacob_ulysses,vicks_bach,uniform_crank} <= {salmon_badger,fire_hiswife,chips_jacuzzi,rodent_south,iceland_egg,would_husks,kbtoys_pepsi,jacob_ulysses,vicks_bach,uniform_crank} - 1;
  end

// XOR all of these bits together
always @(weevil_money or nasdaq_shemp or tesla_scrooge or marquis_husks or egg_barney or vcc or opus_riddler)
  begin
      Iwin_neon = ^ {weevil_money,nasdaq_shemp,tesla_scrooge,marquis_husks,egg_barney,vcc,opus_riddler};
  end

// NAND all of these bits together
always @(hogwarts or chief_peta or gnd or chips_jacuzzi or gnd or blanket_pilot or killer_hanger or vcc)
  begin
      spirit_loser = ~& {hogwarts,chief_peta,gnd,chips_jacuzzi,gnd,blanket_pilot,killer_hanger,vcc};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roe_lad <= 0;
    else
    case ({pcp_aphid,iron_gonzo})
       0 : roe_lad <= gnd;
       1 : roe_lad <= roe_lad;
       2 : roe_lad <= roe_lad;
       3 : roe_lad <= roe_lad;
       default : roe_lad <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      george_soccer <= 0;
    else
    case ({gnd,vcc})
       0 : george_soccer <= george_soccer;
       1 : george_soccer <= george_soccer;
       2 : george_soccer <= zebra_lad;
       3 : george_soccer <= george_soccer;
       default : george_soccer <= 0;
    endcase
  end

reg feedback_pt_558;

always @(freaky_marco or feedback_pt_558)
  begin
      tiger_eagle = !freaky_marco | !feedback_pt_558;
  end

reg feedback_pt_559;

always @(uniform_crank or feedback_pt_559)
  begin
      zulu_satanist =  uniform_crank | !feedback_pt_559;
  end

reg feedback_pt_560;

always @(iceland_egg or feedback_pt_560)
  begin
      huey_banality = !iceland_egg | !feedback_pt_560;
  end

reg feedback_pt_561;

always @(schwinger_red or feedback_pt_561)
  begin
      saturn_iguana = !schwinger_red ^ !feedback_pt_561;
  end

reg feedback_pt_562;

always @(broom_eagle or feedback_pt_562)
  begin
      yak_edible = !broom_eagle &  feedback_pt_562;
  end

reg feedback_pt_563;

always @(emu_zipporah or feedback_pt_563)
  begin
      ham_vadar = !emu_zipporah &  feedback_pt_563;
  end

reg feedback_pt_564;

always @(gnd or feedback_pt_564)
  begin
      boitano_romeo = !gnd |  feedback_pt_564;
  end

reg feedback_pt_565;

always @(yoku_tonic or feedback_pt_565)
  begin
      often_crack =  yoku_tonic ^ !feedback_pt_565;
  end

reg feedback_pt_566;

always @(lemon_joseph or feedback_pt_566)
  begin
      star_tylenol = !lemon_joseph & !feedback_pt_566;
  end

reg feedback_pt_567;

always @(tattoo_east or feedback_pt_567)
  begin
      dingbat_lad =  tattoo_east |  feedback_pt_567;
  end

reg feedback_pt_568;

always @(whiskey_bambi or feedback_pt_568)
  begin
      psycho_goofy = !whiskey_bambi ^ !feedback_pt_568;
  end

reg feedback_pt_569;

always @(burner_often or feedback_pt_569)
  begin
      mushroom_east = !burner_often | !feedback_pt_569;
  end

reg feedback_pt_570;

always @(vcc or feedback_pt_570)
  begin
      howell_hans =  vcc & !feedback_pt_570;
  end

reg feedback_pt_571;

always @(gnd or feedback_pt_571)
  begin
      Iwin_intuit = !gnd & !feedback_pt_571;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zen_loud <= 0;
    else
      zen_loud <= vcc;
  end

always @(zen_loud)
  begin
      feedback_pt_558 = zen_loud;
  end

always @(zen_loud)
  begin
      feedback_pt_559 = zen_loud;
  end

always @(zen_loud)
  begin
      feedback_pt_560 = zen_loud;
  end

always @(zen_loud)
  begin
      feedback_pt_561 = zen_loud;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iron_wonton <= 0;
    else if (vangoh_dadada)
      iron_wonton <= 0;
    else if (south_curie)
      iron_wonton <= gnd;
  end

always @(iron_wonton)
  begin
      feedback_pt_562 = iron_wonton;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_flew <= 1;
    else
      pirate_flew <= vcc;
  end

always @(pirate_flew)
  begin
      feedback_pt_563 = pirate_flew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_iterate <= 0;
    else
      crab_iterate <= Iwin_intuit;
  end

always @(crab_iterate)
  begin
      feedback_pt_564 = crab_iterate;
  end

wire hawaii_turnip_wire;

dffeas hawaii_turnip_ff (
  .clk(clock1),
  .d(furnace_kilo),
  .ena(jason_dirty),
  .sclr(george_lovey),
  .sload(marquis_husks),
  .asdata(gnd),
  .clrn(!reset1),
  .q(hawaii_turnip_wire)
);

always @(hawaii_turnip_wire) begin
   green_eeevil = hawaii_turnip_wire;
end

always @(green_eeevil)
  begin
      feedback_pt_565 = green_eeevil;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rescue_hp <= 0;
    else if (rerun_might)
      rescue_hp <= sirius_dopey;
    else if (vcc)
      rescue_hp <= 0;
  end

always @(rescue_hp)
  begin
      feedback_pt_566 = rescue_hp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      touch_neptune <= 0;
    else if (ykocens_kana)
      touch_neptune <= 0;
    else if (vcc)
      touch_neptune <= gnd;
  end

always @(touch_neptune)
  begin
      feedback_pt_567 = touch_neptune;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foxtrot_honda <= 0;
    else if (lsd_shuda)
      foxtrot_honda <= tattoo_east;
    else if (mars_monkey)
      foxtrot_honda <= 0;
  end

always @(foxtrot_honda)
  begin
      feedback_pt_568 = foxtrot_honda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      happy_bear <= 0;
    else
      happy_bear <= bust_fear;
  end

always @(happy_bear)
  begin
      feedback_pt_569 = happy_bear;
  end

wire dutch_victor_wire;

dffeas dutch_victor_ff (
  .clk(clock1),
  .d(nasdaq_shemp),
  .ena(george_soccer),
  .sclr(pasta_shuda),
  .sload(avon_neon),
  .asdata(vcc),
  .clrn(!reset1),
  .q(dutch_victor_wire)
);

always @(dutch_victor_wire) begin
   loud_romulus = dutch_victor_wire;
end

always @(loud_romulus)
  begin
      feedback_pt_570 = loud_romulus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hurt_pluto <= 0;
    else if (bismuth_fire)
      hurt_pluto <= gnd;
    else if (indigo_buddha)
      hurt_pluto <= 0;
  end

always @(hurt_pluto)
  begin
      feedback_pt_571 = hurt_pluto;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iterate_south <= 0;
    else if (bono_bonafide)
      iterate_south <= elephant_gm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mouse_icarus <= 0;
    else if (spain_yellow)
      mouse_icarus <= fear_exodus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kaisha_yak <= 0;
    else if (golfland_roid)
      kaisha_yak <= gnd;
    else if (lupin_gotone)
      kaisha_yak <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homer_donkey <= 1;
    else
      homer_donkey <= zen_drugie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_whale <= 0;
    else if (viagra_plague)
      ceres_whale <= purple_rod;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shrimp_eagle <= 0;
    else
      shrimp_eagle <= gnd;
  end

wire jacques_bach_wire;

dffeas jacques_bach_ff (
  .clk(clock1),
  .d(kabar_mortar),
  .ena(spirit_loser),
  .sclr(vicks_bach),
  .sload(hinge_questo),
  .asdata(golden_robust),
  .clrn(!reset1),
  .q(jacques_bach_wire)
);

always @(jacques_bach_wire) begin
   often_faster = jacques_bach_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      palm_what <= 0;
    else if (pilot_nasdaq)
      palm_what <= curly_baron;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_zinc <= 0;
    else
      ladder_zinc <= avon_giants;
  end

wire whiskey_egg_wire;

dffeas whiskey_egg_ff (
  .clk(clock1),
  .d(ginger_hinge),
  .ena(vcc),
  .sclr(vcc),
  .sload(acid_muffin),
  .asdata(illegal_dow),
  .clrn(!reset1),
  .q(whiskey_egg_wire)
);

always @(whiskey_egg_wire) begin
   lion_sheep = whiskey_egg_wire;
end

wire cheese_ebi_wire;

dffeas cheese_ebi_ff (
  .clk(clock1),
  .d(spyro_nirish),
  .ena(mrbill_mars),
  .sclr(pirate_flew),
  .sload(master_milo),
  .asdata(turnip_deng),
  .clrn(!reset1),
  .q(cheese_ebi_wire)
);

always @(cheese_ebi_wire) begin
   muffin_joseph = cheese_ebi_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      balloon_yoku <= 0;
    else if (vcc)
      balloon_yoku <= lad_fascist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tuna_bracket <= 0;
    else if (parrot_dragon)
      tuna_bracket <= 0;
    else if (bolt_kabar)
      tuna_bracket <= rerun_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_willem <= 0;
    else if (gnd)
      mao_willem <= 0;
    else if (opus_riddler)
      mao_willem <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arcade_chuck <= 1;
    else
      arcade_chuck <= lemon_joseph;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      malfoy_bull <= 0;
    else if (ham_vadar)
      malfoy_bull <= vcc;
  end

wire dirk_charlie_wire;

dffeas dirk_charlie_ff (
  .clk(clock1),
  .d(vcc),
  .ena(dimetap_bagel),
  .sclr(china_whacky),
  .sload(vcc),
  .asdata(protest_cow),
  .clrn(!reset1),
  .q(dirk_charlie_wire)
);

always @(dirk_charlie_wire) begin
   prison_star = dirk_charlie_wire;
end

wire broom_kabar_wire;

dffea broom_kabar_ff (
  .clk(clock1),
  .d(gnd),
  .ena(boitano_romeo),
  .adata(timmy_snake),
  .clrn(!reset1),
  .q(broom_kabar_wire)
);

always @(broom_kabar_wire) begin
   dragon_golf = broom_kabar_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      atilla_hans <= 0;
    else if (badger_donkey)
      atilla_hans <= gulp_mushroom;
    else if (bono_homer)
      atilla_hans <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golden_fallen <= 0;
    else
      golden_fallen <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_mandarin <= 0;
    else if (gnd)
      fufu_mandarin <= 0;
    else if (wizard_snape)
      fufu_mandarin <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ohno_minnow <= 0;
    else if (stroop_mexico)
      ohno_minnow <= seashell_abel;
    else if (newt_clothing)
      ohno_minnow <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      happy_deuce <= 0;
    else if (rarest_tabby)
      happy_deuce <= 0;
    else if (vcc)
      happy_deuce <= gilligan_mine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cybex_moe <= 0;
    else
      cybex_moe <= often_crack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peace_tin <= 1;
    else
      peace_tin <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lovey_guy <= 1;
    else
      lovey_guy <= babette_aphid;
  end

wire whammy_armand_wire;

dffeas whammy_armand_ff (
  .clk(clock1),
  .d(gnd),
  .ena(willy_emails),
  .sclr(sgates_juliet),
  .sload(deruyter),
  .asdata(pcp_master),
  .clrn(!reset1),
  .q(whammy_armand_wire)
);

always @(whammy_armand_wire) begin
   sanity_beast = whammy_armand_wire;
end

wire kungfu_itchy_wire;

dffeas kungfu_itchy_ff (
  .clk(clock1),
  .d(kanji_clay),
  .ena(iceland_egg),
  .sclr(gnd),
  .sload(vcc),
  .asdata(pcp_master),
  .clrn(!reset1),
  .q(kungfu_itchy_wire)
);

always @(kungfu_itchy_wire) begin
   platinum_crab = kungfu_itchy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goat_wujing <= 1;
    else
      goat_wujing <= gilligan_mine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sand_wanton <= 0;
    else
      sand_wanton <= condit_pirate;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      athena_arthur <= 0;
    else
      athena_arthur <= shark_richard;
  end

wire stix_marvin_wire;

dffeas stix_marvin_ff (
  .clk(clock1),
  .d(tako_fortuyn),
  .ena(rescue_hp),
  .sclr(pepsi_gerard),
  .sload(vcc),
  .asdata(fury_mozart),
  .clrn(!reset1),
  .q(stix_marvin_wire)
);

always @(stix_marvin_wire) begin
   neon_xuprocar = stix_marvin_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      broom_oranje <= 1;
    else
      broom_oranje <= howell_hans;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maklak_gyro <= 0;
    else if (viagra)
      maklak_gyro <= black_kebab;
    else if (ladder_zinc)
      maklak_gyro <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      schwinger_bfs <= 0;
    else if (malfoy_bull)
      schwinger_bfs <= 0;
    else if (mickey_willy)
      schwinger_bfs <= kanji_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hiswife_zinc <= 0;
    else if (emu_xiaoping)
      hiswife_zinc <= weevil_money;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_martian <= 0;
    else
      lala_martian <= oranges_loud;
  end

wire oracle_pixie_wire;

dffea oracle_pixie_ff (
  .clk(clock1),
  .d(gnd),
  .ena(tunafish_duey),
  .adata(opus_liberace),
  .clrn(!reset1),
  .q(oracle_pixie_wire)
);

always @(oracle_pixie_wire) begin
   stix_unicorn = oracle_pixie_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_faster <= 0;
    else if (oscar_tobiko)
      ham_faster <= kappa_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marge_uppers <= 1;
    else
      marge_uppers <= elephant_gm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_theonion <= 0;
    else
      due_theonion <= dirty_cow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peta_willy <= 1;
    else
      peta_willy <= mushroom_east;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      penguin_genji <= 0;
    else
      penguin_genji <= pepsi_gerard;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_rodent <= 1;
    else
      sinew_rodent <= rat_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_davidlin <= 0;
    else if (tattoo_bloom)
      tobe_davidlin <= gnd;
    else if (yak_edible)
      tobe_davidlin <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      llama_tobiko <= 0;
    else if (marge_uppers)
      llama_tobiko <= superman_todd;
    else if (zulu_baron)
      llama_tobiko <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      louie_mideast <= 0;
    else if (athena_arthur)
      louie_mideast <= bust_fear;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      warlock_rod <= 1;
    else
      warlock_rod <= purple_rod;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zhuang_often <= 0;
    else if (marco_chevys)
      zhuang_often <= atilla_hans;
    else if (vcc)
      zhuang_often <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_obiwan <= 0;
    else if (yak_brothers)
      star_obiwan <= viagra_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_yoku <= 0;
    else if (vcc)
      star_yoku <= protest_cow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jcrew_chips <= 1;
    else
      jcrew_chips <= crab_iterate;
  end

wire fronds_pluto_wire;

dffeas fronds_pluto_ff (
  .clk(clock1),
  .d(oscar_jupiter),
  .ena(rerun_might),
  .sclr(gnd),
  .sload(vcc),
  .asdata(mao_willem),
  .clrn(!reset1),
  .q(fronds_pluto_wire)
);

always @(fronds_pluto_wire) begin
   burning_tesla = fronds_pluto_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gopher_thread <= 0;
    else if (touch_neptune)
      gopher_thread <= vcc;
    else if (shark_richard)
      gopher_thread <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_golf <= 0;
    else
      bear_golf <= gnd;
  end

wire ozzy_doc_wire;

dffeas ozzy_doc_ff (
  .clk(clock1),
  .d(often_crack),
  .ena(golden_fallen),
  .sclr(rerun_husks),
  .sload(show_theseus),
  .asdata(star_ernie),
  .clrn(!reset1),
  .q(ozzy_doc_wire)
);

always @(ozzy_doc_wire) begin
   bagel_rubik = ozzy_doc_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_school <= 1;
    else
      gm_school <= vcc;
  end

wire rescue_george_wire;

dffeas rescue_george_ff (
  .clk(clock1),
  .d(lumber_kmfdm),
  .ena(att_maryann),
  .sclr(boing_kebab),
  .sload(athena_barty),
  .asdata(baron_viagra),
  .clrn(!reset1),
  .q(rescue_george_wire)
);

always @(rescue_george_wire) begin
   newt_devotion = rescue_george_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      plumber_fish <= 0;
    else if (mushroom_zed)
      plumber_fish <= 0;
    else if (gnd)
      plumber_fish <= vcc;
  end

wire todd_beavis_wire;

dffeas todd_beavis_ff (
  .clk(clock1),
  .d(vcc),
  .ena(gnd),
  .sclr(bust_fear),
  .sload(my_tummy_zi),
  .asdata(vcc),
  .clrn(!reset1),
  .q(todd_beavis_wire)
);

always @(todd_beavis_wire) begin
   stix_iterate = todd_beavis_wire;
end

wire iron_lizard_wire;

dffea iron_lizard_ff (
  .clk(clock1),
  .d(platinum_crab),
  .ena(ceres_whale),
  .adata(stix_unicorn),
  .clrn(!reset1),
  .q(iron_lizard_wire)
);

always @(iron_lizard_wire) begin
   tonks_england = iron_lizard_wire;
end

wire drugs_ozzy_wire;

dffeas drugs_ozzy_ff (
  .clk(clock1),
  .d(roid_broom),
  .ena(gnd),
  .sclr(gnd),
  .sload(howell),
  .asdata(rodriguez_guy),
  .clrn(!reset1),
  .q(drugs_ozzy_wire)
);

always @(drugs_ozzy_wire) begin
   killme_larry = drugs_ozzy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arcade_ritsu <= 1;
    else
      arcade_ritsu <= kbtoys_pepsi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      waster_beetle <= 0;
    else if (lizard_peta)
      waster_beetle <= platinum_frog;
    else if (gnd)
      waster_beetle <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_dirk <= 0;
    else
      meth_dirk <= gnd;
  end

wire kabar_tabby_wire;

dffeas kabar_tabby_ff (
  .clk(clock1),
  .d(vcc),
  .ena(gnd),
  .sclr(penguin_cheez),
  .sload(green_eeevil),
  .asdata(loud_romulus),
  .clrn(!reset1),
  .q(kabar_tabby_wire)
);

always @(kabar_tabby_wire) begin
   rod_wiggles = kabar_tabby_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      raiders_bart <= 1;
    else
      raiders_bart <= spastic_pilot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      air_gutter <= 0;
    else if (schwinger_red)
      air_gutter <= 0;
    else if (tsmc_safada)
      air_gutter <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      air_wildboar <= 0;
    else if (snort_jinyong)
      air_wildboar <= 0;
    else if (sgates_juliet)
      air_wildboar <= green_sortout;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_ghost <= 1;
    else
      sinew_ghost <= quail_minnie;
  end

// A + const
always @(gnd or echo_eggsalad or vcc or sogood_drax or cybex_moe or athena_barty or bert_south or spastic_todd)
  begin
    {remus_fallen,tango_ykocens,maki_unicorn,parrot_east,rouge_plaster,powder_ariel,ants_edible,bert_kaisha,dipsy_odin} = {gnd,echo_eggsalad,vcc,sogood_drax,cybex_moe,athena_barty,bert_south,spastic_todd} + 11;
  end

// Ternary sign extend bait
always @(jcrew_chips or jcrew_chips or jcrew_chips or jcrew_chips or jcrew_chips or vcc or gnd or star_tylenol or schwinger_red or floating_guy or often_pdaddy or zen_loud or bust_fear or gnd or echo_testyour or gnd or rerun_husks or vcc or jacob_ulysses or zeus_hinkley or foxtrot_honda or gnd or
         homer_donkey or homer_donkey or homer_donkey or homer_donkey or homer_donkey or gnd or tuna_bracket or platinum_crab or vcc or raiders_bart or roe_kanji or cafe_concorde or psycho_goofy or vcc or leidiot_ghost or vcc or hp_rampacker or gnd or victor_cuanto or itchy_oranje or advil_army or muffin_joseph or
         dig_obiwan or dig_obiwan or dig_obiwan or dig_obiwan or dig_obiwan or dig_obiwan or dig_obiwan or pcp_master or gnd or vcc or vcc or hogwarts or warlock_rod or air_wildboar or dig_obiwan or star_arthur or gnd or louie_mideast or gnd or gnd or deng_gerrit or sinew_ghost)
  begin
    {rubeus_acid,nest_cow,sears_rerun,arthur_att,pirate_joseph,newt_cheese,green_bep,draco_salmon,lion_grumby,butthead_duey,mars_turkey,oscar_cheez,hippo_lao,bravo_sapporo,leaky_mortar,egg_abel,xterm_sierra,tobe_ants,zebra_bubba,hans_voodoo,Iwin_ladder,rat_solder} = 
        {jcrew_chips,jcrew_chips,jcrew_chips,jcrew_chips,jcrew_chips,vcc,gnd,star_tylenol,schwinger_red,floating_guy,often_pdaddy,zen_loud,bust_fear,gnd,echo_testyour,gnd,rerun_husks,vcc,jacob_ulysses,zeus_hinkley,foxtrot_honda,gnd} +
        {homer_donkey,homer_donkey,homer_donkey,homer_donkey,homer_donkey,gnd,tuna_bracket,platinum_crab,vcc,raiders_bart,roe_kanji,cafe_concorde,psycho_goofy,vcc,leidiot_ghost,vcc,hp_rampacker,gnd,victor_cuanto,itchy_oranje,advil_army,muffin_joseph} +
        {dig_obiwan,dig_obiwan,dig_obiwan,dig_obiwan,dig_obiwan,dig_obiwan,dig_obiwan,pcp_master,gnd,vcc,vcc,hogwarts,warlock_rod,air_wildboar,dig_obiwan,star_arthur,gnd,louie_mideast,gnd,gnd,deng_gerrit,sinew_ghost};
  end

// 6 bit add sub
always @(meth_dirk or baron_nihlist or turnip_foiled or gnd or weasley_hinge or lion_grumby or gnd or gnd or Iwin_ladder or lion_sheep or palm_haze or gnd)
  begin
    {escape_rojas,spyro_might,sun_mrbill,south_aspirin,togos_haze,papyrus_huey} = 
		({meth_dirk,baron_nihlist,turnip_foiled,gnd,weasley_hinge,lion_grumby} ^ 50) + 
		({gnd,gnd,Iwin_ladder,lion_sheep,palm_haze,gnd} ^ 24);
  end

// 6 bit divide
always @(vcc or aphid_lantern or ants_edible or acid_gopher or goat_wujing or palm_what or waster_beetle or eagle_beef or marge_tofu or gnd or gnd or ladder_zinc)
  begin
    if ({waster_beetle,eagle_beef,marge_tofu,gnd,gnd,ladder_zinc} == 0)
       {heidi_crank,sinew_gulp,turkey_sanity,lovey_ring,sun_larry,turtle_kilo} = 0;
    else 
      {heidi_crank,sinew_gulp,turkey_sanity,lovey_ring,sun_larry,turtle_kilo} = 
	  	  {vcc,aphid_lantern,ants_edible,acid_gopher,goat_wujing,palm_what} / 
		  {waster_beetle,eagle_beef,marge_tofu,gnd,gnd,ladder_zinc};
  end

reg feedback_pt_572;

always @(ladder_zinc or feedback_pt_572)
  begin
      fang_honda = !ladder_zinc | !feedback_pt_572;
  end

reg feedback_pt_573;

always @(vcc or feedback_pt_573)
  begin
      snort_nasdaq =  vcc & !feedback_pt_573;
  end

reg feedback_pt_574;

always @(what_eel or feedback_pt_574)
  begin
      charlie_ariel =  what_eel &  feedback_pt_574;
  end

reg feedback_pt_575;

always @(roe_lad or feedback_pt_575)
  begin
      mandarin_bfs = !roe_lad ^ !feedback_pt_575;
  end

reg feedback_pt_576;

always @(vcc or feedback_pt_576)
  begin
      desert_albus = !vcc |  feedback_pt_576;
  end

reg feedback_pt_577;

always @(tako_fortuyn or feedback_pt_577)
  begin
      zeus_po =  tako_fortuyn & !feedback_pt_577;
  end

reg feedback_pt_578;

always @(sinew_intel or feedback_pt_578)
  begin
      yellow_victor = !sinew_intel ^  feedback_pt_578;
  end

reg feedback_pt_579;

always @(sanity_beast or feedback_pt_579)
  begin
      crab_popcorn = !sanity_beast ^ !feedback_pt_579;
  end

reg feedback_pt_580;

always @(vangoh_dadada or feedback_pt_580)
  begin
      fufu_bono = !vangoh_dadada ^  feedback_pt_580;
  end

reg feedback_pt_581;

always @(togos_haze or feedback_pt_581)
  begin
      money_delta =  togos_haze & !feedback_pt_581;
  end

reg feedback_pt_582;

always @(yellow_victor or feedback_pt_582)
  begin
      doobie_macys = !yellow_victor &  feedback_pt_582;
  end

reg feedback_pt_583;

always @(dragon_golf or feedback_pt_583)
  begin
      fufu_vangoh = !dragon_golf &  feedback_pt_583;
  end

reg feedback_pt_584;

always @(snort_nasdaq or feedback_pt_584)
  begin
      lala_sanity = !snort_nasdaq & !feedback_pt_584;
  end

reg feedback_pt_585;

always @(money_delta or feedback_pt_585)
  begin
      kilo_marge =  money_delta ^  feedback_pt_585;
  end

reg feedback_pt_586;

always @(vegan_lupin or feedback_pt_586)
  begin
      sinew_wine = !vegan_lupin ^  feedback_pt_586;
  end

reg feedback_pt_587;

always @(baron_viagra or feedback_pt_587)
  begin
      bagel_howell =  baron_viagra &  feedback_pt_587;
  end

reg feedback_pt_588;

always @(hulk_kaisha or feedback_pt_588)
  begin
      meth_athena = !hulk_kaisha |  feedback_pt_588;
  end

reg feedback_pt_589;

always @(crack_kungfu or feedback_pt_589)
  begin
      hector_mao = !crack_kungfu |  feedback_pt_589;
  end

reg feedback_pt_590;

always @(tobe_foiled or feedback_pt_590)
  begin
      spock_webvan =  tobe_foiled ^  feedback_pt_590;
  end

reg feedback_pt_591;

always @(escape_rojas or feedback_pt_591)
  begin
      rat_fsncens = !escape_rojas | !feedback_pt_591;
  end

reg feedback_pt_592;

always @(vcc or feedback_pt_592)
  begin
      chillis_fish =  vcc & !feedback_pt_592;
  end

reg feedback_pt_593;

always @(lockheed_fire or feedback_pt_593)
  begin
      bart_speed =  lockheed_fire ^  feedback_pt_593;
  end

reg feedback_pt_594;

always @(spyro_might or feedback_pt_594)
  begin
      coconut_witch = !spyro_might | !feedback_pt_594;
  end

reg feedback_pt_595;

always @(bravo_sapporo or feedback_pt_595)
  begin
      mouse_ghost =  bravo_sapporo | !feedback_pt_595;
  end

reg feedback_pt_596;

always @(vcc or feedback_pt_596)
  begin
      bagel_atomic =  vcc ^  feedback_pt_596;
  end

reg feedback_pt_597;

always @(vcc or feedback_pt_597)
  begin
      books_rodent =  vcc & !feedback_pt_597;
  end

reg feedback_pt_598;

always @(gnd or feedback_pt_598)
  begin
      bush_uppers =  gnd | !feedback_pt_598;
  end

reg feedback_pt_599;

always @(rarest_chevys or feedback_pt_599)
  begin
      lamer_fear =  rarest_chevys | !feedback_pt_599;
  end

reg feedback_pt_600;

always @(pepsi_gerard or feedback_pt_600)
  begin
      midas_dirty = !pepsi_gerard |  feedback_pt_600;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turtle_life <= 0;
    else if (dragon_golf)
      turtle_life <= gnd;
    else if (blanket_tonks)
      turtle_life <= 0;
  end

always @(turtle_life)
  begin
      feedback_pt_572 = turtle_life;
  end

always @(turtle_life)
  begin
      feedback_pt_573 = turtle_life;
  end

always @(turtle_life)
  begin
      feedback_pt_574 = turtle_life;
  end

always @(turtle_life)
  begin
      feedback_pt_575 = turtle_life;
  end

always @(turtle_life)
  begin
      feedback_pt_576 = turtle_life;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_fsncens <= 0;
    else
      ibm_fsncens <= dig_obiwan;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_577 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_578 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_579 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_580 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_581 = ibm_fsncens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      north_pacbell <= 0;
    else if (chillis_fish)
      north_pacbell <= zhuang_often;
    else if (obiwan_quail)
      north_pacbell <= 0;
  end

always @(north_pacbell)
  begin
      feedback_pt_582 = north_pacbell;
  end

always @(north_pacbell)
  begin
      feedback_pt_583 = north_pacbell;
  end

always @(north_pacbell)
  begin
      feedback_pt_584 = north_pacbell;
  end

always @(north_pacbell)
  begin
      feedback_pt_585 = north_pacbell;
  end

always @(north_pacbell)
  begin
      feedback_pt_586 = north_pacbell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      black_yoku <= 0;
    else if (cheez_zedong)
      black_yoku <= gnd;
    else if (kappa_drax)
      black_yoku <= 0;
  end

always @(black_yoku)
  begin
      feedback_pt_587 = black_yoku;
  end

always @(black_yoku)
  begin
      feedback_pt_588 = black_yoku;
  end

always @(black_yoku)
  begin
      feedback_pt_589 = black_yoku;
  end

always @(black_yoku)
  begin
      feedback_pt_590 = black_yoku;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hummer_potter <= 0;
    else if (bono_homer)
      hummer_potter <= athena_arthur;
    else if (ibm_fsncens)
      hummer_potter <= 0;
  end

always @(hummer_potter)
  begin
      feedback_pt_591 = hummer_potter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nobody_ebi <= 1;
    else
      nobody_ebi <= eagle_beef;
  end

always @(nobody_ebi)
  begin
      feedback_pt_592 = nobody_ebi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pdaddy_willy <= 0;
    else if (gnd)
      pdaddy_willy <= gnd;
    else if (crab_iterate)
      pdaddy_willy <= 0;
  end

always @(pdaddy_willy)
  begin
      feedback_pt_593 = pdaddy_willy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tako_handroll <= 0;
    else if (peta_willy)
      tako_handroll <= penguin_cheez;
    else if (gnd)
      tako_handroll <= 0;
  end

always @(tako_handroll)
  begin
      feedback_pt_594 = tako_handroll;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_platypus <= 1;
    else
      meth_platypus <= yummy_pizza;
  end

always @(meth_platypus)
  begin
      feedback_pt_595 = meth_platypus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sugar_newt <= 0;
    else if (dipsy_odin)
      sugar_newt <= 0;
    else if (thread_quail)
      sugar_newt <= spock_webvan;
  end

always @(sugar_newt)
  begin
      feedback_pt_596 = sugar_newt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacuzzi_tabby <= 0;
    else if (avon_oranges)
      jacuzzi_tabby <= oscar_nyquil;
  end

always @(jacuzzi_tabby)
  begin
      feedback_pt_597 = jacuzzi_tabby;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joseph_hoser <= 0;
    else if (isle_mortgate)
      joseph_hoser <= nobody_ebi;
    else if (hiswife_zinc)
      joseph_hoser <= 0;
  end

always @(joseph_hoser)
  begin
      feedback_pt_598 = joseph_hoser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      macys_neptune <= 0;
    else if (zhuang_often)
      macys_neptune <= 0;
    else if (llama_tobiko)
      macys_neptune <= warlock_rod;
  end

always @(macys_neptune)
  begin
      feedback_pt_599 = macys_neptune;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stroop_bart <= 0;
    else if (gnd)
      stroop_bart <= aphid_lantern;
  end

always @(stroop_bart)
  begin
      feedback_pt_600 = stroop_bart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maryann_hotel <= 1;
    else
      maryann_hotel <= theseus_rojas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tracy_gyro <= 1;
    else
      tracy_gyro <= vcc;
  end

wire due_bolt_wire;

dffeas due_bolt_ff (
  .clk(clock1),
  .d(gnd),
  .ena(lovey_guy),
  .sclr(charlie_ariel),
  .sload(oscar_cheez),
  .asdata(mike_stirfry),
  .clrn(!reset1),
  .q(due_bolt_wire)
);

always @(due_bolt_wire) begin
   kennyg_tracy = due_bolt_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genji_fuji <= 0;
    else
      genji_fuji <= tobe_davidlin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_waster <= 0;
    else if (hippo_lao)
      pcp_waster <= 0;
    else if (gnd)
      pcp_waster <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tako_remus <= 0;
    else if (kaisha_yak)
      tako_remus <= pirate_joseph;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      achilles_dig <= 0;
    else
      achilles_dig <= venus_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marker_tako <= 0;
    else
      marker_tako <= pizza_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xuprocar_fuji <= 1;
    else
      xuprocar_fuji <= yellow_victor;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      phoenix_ozzy <= 1;
    else
      phoenix_ozzy <= money_delta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nation_potato <= 0;
    else if (vcc)
      nation_potato <= killme_larry;
    else if (bagel_atomic)
      nation_potato <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bambi_bubba <= 0;
    else if (vcc)
      bambi_bubba <= oscar_cheez;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      martin_sirius <= 0;
    else
      martin_sirius <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_wukong <= 0;
    else if (bear_golf)
      itchy_wukong <= fufu_mandarin;
    else if (vcc)
      itchy_wukong <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oranje_spyro <= 0;
    else if (vcc)
      oranje_spyro <= peace_tin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_pomodoro <= 1;
    else
      moe_pomodoro <= penguin_cheez;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deuce_air <= 1;
    else
      deuce_air <= badger_donkey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hagrid_zeus <= 0;
    else
      hagrid_zeus <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dog_vulture <= 0;
    else if (vcc)
      dog_vulture <= macys_neptune;
    else if (lupin_gotone)
      dog_vulture <= 0;
  end

wire platypus_Iwin_wire;

dffeas platypus_Iwin_ff (
  .clk(clock1),
  .d(powder_ariel),
  .ena(lima_hummer),
  .sclr(vcc),
  .sload(gnd),
  .asdata(zulu_eel),
  .clrn(!reset1),
  .q(platypus_Iwin_wire)
);

always @(platypus_Iwin_wire) begin
   blaster_togos = platypus_Iwin_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      copper_rubeus <= 0;
    else
      copper_rubeus <= killme_larry;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      riddler_stix <= 1;
    else
      riddler_stix <= draco_salmon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tasty_condit <= 0;
    else if (sand_wanton)
      tasty_condit <= deuce_air;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marker_potter <= 1;
    else
      marker_potter <= gm_school;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bracket_boing <= 1;
    else
      bracket_boing <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zi_zed <= 1;
    else
      zi_zed <= desert_albus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tank_eagle <= 0;
    else if (vcc)
      tank_eagle <= joseph_hoser;
    else if (ohno_minnow)
      tank_eagle <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      george_roe <= 0;
    else if (elf_killer)
      george_roe <= 0;
    else if (porfavor_ebi)
      george_roe <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      banality_tuna <= 0;
    else if (salsa_master)
      banality_tuna <= 0;
    else if (gnd)
      banality_tuna <= pasta_shuda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_crank <= 1;
    else
      south_crank <= tank_eagle;
  end

wire rubeus_att_wire;

dffea rubeus_att_ff (
  .clk(clock1),
  .d(maryann_hotel),
  .ena(gnd),
  .adata(sinew_ghost),
  .clrn(!reset1),
  .q(rubeus_att_wire)
);

always @(rubeus_att_wire) begin
   freaky_winner = rubeus_att_wire;
end

wire kdqcens_ritsu_wire;

dffeas kdqcens_ritsu_ff (
  .clk(clock1),
  .d(marker_potter),
  .ena(vcc),
  .sclr(books_rodent),
  .sload(lala_martian),
  .asdata(Iwin_ladder),
  .clrn(!reset1),
  .q(kdqcens_ritsu_wire)
);

always @(kdqcens_ritsu_wire) begin
   sirius_zhuang = kdqcens_ritsu_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wukong_float <= 0;
    else if (gnd)
      wukong_float <= bert_kaisha;
    else if (star_obiwan)
      wukong_float <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      exodus_touch <= 0;
    else
      exodus_touch <= south_aspirin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tuna_baron <= 0;
    else if (bacon_drugs)
      tuna_baron <= 0;
    else if (seashell_abel)
      tuna_baron <= parrot_east;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_eagle <= 0;
    else
      fufu_eagle <= vcc;
  end

wire beetle_wakey_wire;

dffeas beetle_wakey_ff (
  .clk(clock1),
  .d(vcc),
  .ena(gnd),
  .sclr(metal_romulus),
  .sload(gnd),
  .asdata(fang_honda),
  .clrn(!reset1),
  .q(beetle_wakey_wire)
);

always @(beetle_wakey_wire) begin
   dopey_pierre = beetle_wakey_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_gyro <= 1;
    else
      deng_gyro <= echo_testyour;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_tango <= 0;
    else if (marker_tako)
      advil_tango <= oscar_gin;
    else if (tako_remus)
      advil_tango <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      riddler_po <= 0;
    else if (midas_dirty)
      riddler_po <= ariel_thedon;
    else if (pasta_shuda)
      riddler_po <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_lxtcen <= 1;
    else
      fronds_lxtcen <= leaky_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubeus_mortar <= 1;
    else
      rubeus_mortar <= chainsaw_tofu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_clay <= 0;
    else
      knot_clay <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_honey <= 0;
    else
      mao_honey <= turkey_sanity;
  end

wire surfer_fuji_wire;

dffeas surfer_fuji_ff (
  .clk(clock1),
  .d(riddler_po),
  .ena(vcc),
  .sclr(gnd),
  .sload(stix_unicorn),
  .asdata(gnd),
  .clrn(!reset1),
  .q(surfer_fuji_wire)
);

always @(surfer_fuji_wire) begin
   tonks_fallen = surfer_fuji_wire;
end

wire cain_tuna_wire;

dffea cain_tuna_ff (
  .clk(clock1),
  .d(vcc),
  .ena(mouse_ghost),
  .adata(zi_zed),
  .clrn(!reset1),
  .q(cain_tuna_wire)
);

always @(cain_tuna_wire) begin
   wood_gokidsgo = cain_tuna_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_freaky <= 0;
    else if (gin_golden)
      boing_freaky <= thread_quail;
    else if (phoenix_ozzy)
      boing_freaky <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_mickey <= 0;
    else if (dog_vulture)
      animal_mickey <= tiger_eagle;
  end

wire duey_superman_wire;

dffea duey_superman_ff (
  .clk(clock1),
  .d(xterm_sierra),
  .ena(gulp_oitcen),
  .adata(stix_iterate),
  .clrn(!reset1),
  .q(duey_superman_wire)
);

always @(duey_superman_wire) begin
   wine_edible = duey_superman_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joseph_deuce <= 0;
    else
      joseph_deuce <= marquis_husks;
  end

// Random combinatorial logic block
always@(*)
  begin
      brian_advil = ( ~( ( ~( ( ~( ~boitano_boing ^ ~cain_wiggles ) ) ^ ~fish_itchy | ~cafe_concorde ) ) | ~( ~potato_bull & oscar_tobiko ) ) ^ ~( ( ~( ( ~( ~( snake_copper ) & ( ~sears_rerun | ~gnd ) ) ) ^ stoner_candle ) ) ) );
  end

// State Mek pixie_india Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_india <= pixie_india_0;
    else
      case (pixie_india)
        pixie_india_0: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 10)
            pixie_india <= pixie_india_8;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 12)
            pixie_india <= pixie_india_4;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 4)
            pixie_india <= pixie_india_8;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 2)
            pixie_india <= pixie_india_2;
          else
            pixie_india <= pixie_india_0;
          end
        pixie_india_1: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 13)
            pixie_india <= pixie_india_0;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 8)
            pixie_india <= pixie_india_8;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 10)
            pixie_india <= pixie_india_8;
          else
            pixie_india <= pixie_india_1;
          end
        pixie_india_2: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 0)
            pixie_india <= pixie_india_3;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 9)
            pixie_india <= pixie_india_8;
          else
            pixie_india <= pixie_india_2;
          end
        pixie_india_3: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 4)
            pixie_india <= pixie_india_7;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 15)
            pixie_india <= pixie_india_5;
          else
            pixie_india <= pixie_india_3;
          end
        pixie_india_4: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 0)
            pixie_india <= pixie_india_4;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 5)
            pixie_india <= pixie_india_3;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 8)
            pixie_india <= pixie_india_8;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 13)
            pixie_india <= pixie_india_6;
          else
            pixie_india <= pixie_india_4;
          end
        pixie_india_5: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 12)
            pixie_india <= pixie_india_6;
          else
            pixie_india <= pixie_india_5;
          end
        pixie_india_6: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 9)
            pixie_india <= pixie_india_1;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 3)
            pixie_india <= pixie_india_8;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 15)
            pixie_india <= pixie_india_0;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 4)
            pixie_india <= pixie_india_8;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 11)
            pixie_india <= pixie_india_6;
          else
            pixie_india <= pixie_india_6;
          end
        pixie_india_7: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 15)
            pixie_india <= pixie_india_0;
          else
            pixie_india <= pixie_india_7;
          end
        pixie_india_8: begin
          if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 15)
            pixie_india <= pixie_india_1;
          else if ({clay_yohimbe,gnd,achilles_dig,hans_voodoo} == 4)
            pixie_india <= pixie_india_0;
          else
            pixie_india <= pixie_india_8;
          end
        default: pixie_india <= pixie_india_0;
      endcase
  end

// State Mek pixie_india Output logic
always @(pixie_india)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (pixie_india[3:1])
        pixie_india_0: begin
            china_fitter = 1;
            ebi_iwocensor = 0;
            jesus_what = 0;
            elian_bamboo = 0;
            killer_curie = 1;
            hp_richard = 1;
            hotel_zed = 1;
            dingbat_snape = 0;
          end
        pixie_india_1: begin
            china_fitter = 0;
            ebi_iwocensor = 1;
            jesus_what = 0;
            elian_bamboo = 1;
            killer_curie = 0;
            hp_richard = 0;
            hotel_zed = 1;
            dingbat_snape = 1;
          end
        pixie_india_2: begin
            china_fitter = 0;
            ebi_iwocensor = 1;
            jesus_what = 0;
            elian_bamboo = 1;
            killer_curie = 1;
            hp_richard = 0;
            hotel_zed = 0;
            dingbat_snape = 1;
          end
        pixie_india_3: begin
            china_fitter = 0;
            ebi_iwocensor = 1;
            jesus_what = 0;
            elian_bamboo = 0;
            killer_curie = 1;
            hp_richard = 1;
            hotel_zed = 0;
            dingbat_snape = 1;
          end
        default: begin
            china_fitter = 1;
            ebi_iwocensor = 0;
            jesus_what = 0;
            elian_bamboo = 1;
            killer_curie = 0;
            hp_richard = 0;
            hotel_zed = 0;
            dingbat_snape = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire pixie_hummer_out;
nut_004_lut #(6) nut_004_lut_inst_pixie_hummer (
  .din({kang_bacon,china_whacky,sogood_brian,happy_bear,wood_gokidsgo,hp_richard}),
  .mask(64'h23aeeaa86166f02c),
  .out(pixie_hummer_out)
);

always @(pixie_hummer_out)
begin
   bubba_doc = pixie_hummer_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire lotus_salami_out;
nut_004_lut #(2) nut_004_lut_inst_lotus_salami (
  .din({lizard_peta,gnd}),
  .mask(4'h4),
  .out(lotus_salami_out)
);

always @(lotus_salami_out)
begin
   vangoh_hinge = lotus_salami_out;
end

// In range compare
always @(papa_sun or rouge_plaster or gopher_thread or gnd or boing_jiminy or due_theonion)
  begin
    if ({papa_sun,rouge_plaster,gopher_thread,gnd,boing_jiminy,due_theonion} > 138 &&
        {papa_sun,rouge_plaster,gopher_thread,gnd,boing_jiminy,due_theonion} < 164)
      martin_safada = 1;
    else
      martin_safada = 0;
  end

// 4 bit add sub
always @(boots_yellow or tiger_eagle or kmfdm_marvin or jesus_what or hulk_doobie or gnd or kanji_clay or star_yoku)
  begin
    {peaves_hut,ready_xray,rerun_tapered,vadar_protest} = 
		({boots_yellow,tiger_eagle,kmfdm_marvin,jesus_what} ^ 5) - 
		({hulk_doobie,gnd,kanji_clay,star_yoku} ^ 146);
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      picante_meth <= 0;
    else
    case ({vcc,vcc})
       0 : picante_meth <= picante_meth;
       1 : picante_meth <= picante_meth;
       2 : picante_meth <= picante_meth;
       3 : picante_meth <= picante_meth;
       default : picante_meth <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_ebi <= 0;
    else
    case ({smack_beavis,dipsy_odin})
       0 : south_ebi <= south_ebi;
       1 : south_ebi <= vcc;
       2 : south_ebi <= south_ebi;
       3 : south_ebi <= south_ebi;
       default : south_ebi <= 0;
    endcase
  end

reg feedback_pt_601;

always @(gnd or feedback_pt_601)
  begin
      questo_tamago = !gnd | !feedback_pt_601;
  end

reg feedback_pt_602;

always @(wine_edible or feedback_pt_602)
  begin
      lisa_yoku = !wine_edible &  feedback_pt_602;
  end

reg feedback_pt_603;

always @(dweebie_ring or feedback_pt_603)
  begin
      nasdaq_doc = !dweebie_ring &  feedback_pt_603;
  end

reg feedback_pt_604;

always @(broom_oranje or feedback_pt_604)
  begin
      pork_balloon =  broom_oranje | !feedback_pt_604;
  end

reg feedback_pt_605;

always @(vcc or feedback_pt_605)
  begin
      moulin_Iwin =  vcc ^ !feedback_pt_605;
  end

reg feedback_pt_606;

always @(isle_mortgate or feedback_pt_606)
  begin
      drax_rat = !isle_mortgate ^ !feedback_pt_606;
  end

reg feedback_pt_607;

always @(platinum_frog or feedback_pt_607)
  begin
      rabbi_waffle = !platinum_frog |  feedback_pt_607;
  end

reg feedback_pt_608;

always @(gnd or feedback_pt_608)
  begin
      peace_cannon =  gnd |  feedback_pt_608;
  end

reg feedback_pt_609;

always @(zulu_satanist or feedback_pt_609)
  begin
      zed_erncenso =  zulu_satanist & !feedback_pt_609;
  end

reg feedback_pt_610;

always @(gnd or feedback_pt_610)
  begin
      midas_killer = !gnd ^ !feedback_pt_610;
  end

reg feedback_pt_611;

always @(rose_larry or feedback_pt_611)
  begin
      square_cheese = !rose_larry & !feedback_pt_611;
  end

reg feedback_pt_612;

always @(zebra_bubba or feedback_pt_612)
  begin
      jacuzzi_meth = !zebra_bubba ^ !feedback_pt_612;
  end

reg feedback_pt_613;

always @(indigo_buddha or feedback_pt_613)
  begin
      dopey_master = !indigo_buddha &  feedback_pt_613;
  end

reg feedback_pt_614;

always @(fury_mozart or feedback_pt_614)
  begin
      moe_maritime =  fury_mozart & !feedback_pt_614;
  end

reg feedback_pt_615;

always @(hiswife_zinc or feedback_pt_615)
  begin
      heidi_school =  hiswife_zinc ^  feedback_pt_615;
  end

reg feedback_pt_616;

always @(banality_tuna or feedback_pt_616)
  begin
      falafel_duey = !banality_tuna ^  feedback_pt_616;
  end

reg feedback_pt_617;

always @(sinew_wine or feedback_pt_617)
  begin
      deng_junkie =  sinew_wine |  feedback_pt_617;
  end

reg feedback_pt_618;

always @(boing_freaky or feedback_pt_618)
  begin
      dadada_rescue = !boing_freaky | !feedback_pt_618;
  end

reg feedback_pt_619;

always @(gnd or feedback_pt_619)
  begin
      love_in_zulu = !gnd & !feedback_pt_619;
  end

reg feedback_pt_620;

always @(pepsi_gerard or feedback_pt_620)
  begin
      cow_tabasco = !pepsi_gerard &  feedback_pt_620;
  end

reg feedback_pt_621;

always @(boots_macys or feedback_pt_621)
  begin
      drugie_maki = !boots_macys ^  feedback_pt_621;
  end

reg feedback_pt_622;

always @(gnd or feedback_pt_622)
  begin
      wonder_bart = !gnd &  feedback_pt_622;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tasty_floo <= 0;
    else if (vcc)
      tasty_floo <= dadada_rescue;
    else if (gnd)
      tasty_floo <= 0;
  end

always @(tasty_floo)
  begin
      feedback_pt_601 = tasty_floo;
  end

always @(tasty_floo)
  begin
      feedback_pt_602 = tasty_floo;
  end

always @(tasty_floo)
  begin
      feedback_pt_603 = tasty_floo;
  end

always @(tasty_floo)
  begin
      feedback_pt_604 = tasty_floo;
  end

always @(tasty_floo)
  begin
      feedback_pt_605 = tasty_floo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tapered_xray <= 1;
    else
      tapered_xray <= plumber_fish;
  end

always @(tapered_xray)
  begin
      feedback_pt_606 = tapered_xray;
  end

always @(tapered_xray)
  begin
      feedback_pt_607 = tapered_xray;
  end

always @(tapered_xray)
  begin
      feedback_pt_608 = tapered_xray;
  end

always @(tapered_xray)
  begin
      feedback_pt_609 = tapered_xray;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dork_valve <= 0;
    else if (newt_devotion)
      dork_valve <= zulu_eel;
    else if (martin_safada)
      dork_valve <= 0;
  end

always @(dork_valve)
  begin
      feedback_pt_610 = dork_valve;
  end

always @(dork_valve)
  begin
      feedback_pt_611 = dork_valve;
  end

always @(dork_valve)
  begin
      feedback_pt_612 = dork_valve;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_viagra <= 0;
    else if (vcc)
      tobe_viagra <= vcc;
  end

always @(tobe_viagra)
  begin
      feedback_pt_613 = tobe_viagra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genesis_ozzy <= 1;
    else
      genesis_ozzy <= richard_lamer;
  end

always @(genesis_ozzy)
  begin
      feedback_pt_614 = genesis_ozzy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_pacbell <= 0;
    else if (wonder_bart)
      mao_pacbell <= vcc;
    else if (ready_xray)
      mao_pacbell <= 0;
  end

always @(mao_pacbell)
  begin
      feedback_pt_615 = mao_pacbell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dadada_rubik <= 0;
    else if (moron_curious)
      dadada_rubik <= gnd;
  end

always @(dadada_rubik)
  begin
      feedback_pt_616 = dadada_rubik;
  end

wire hogwarts_zeus_wire;

dffeas hogwarts_zeus_ff (
  .clk(clock1),
  .d(iterate_south),
  .ena(gnd),
  .sclr(sgates_juliet),
  .sload(vcc),
  .asdata(gnd),
  .clrn(!reset1),
  .q(hogwarts_zeus_wire)
);

always @(hogwarts_zeus_wire) begin
   hp_asahi = hogwarts_zeus_wire;
end

always @(hp_asahi)
  begin
      feedback_pt_617 = hp_asahi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mortar_school <= 0;
    else
      mortar_school <= tuna_baron;
  end

always @(mortar_school)
  begin
      feedback_pt_618 = mortar_school;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peace_willem <= 0;
    else
      peace_willem <= advil_army;
  end

always @(peace_willem)
  begin
      feedback_pt_619 = peace_willem;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lagoon_rodent <= 0;
    else if (bambi_bubba)
      lagoon_rodent <= sinew_wine;
  end

always @(lagoon_rodent)
  begin
      feedback_pt_620 = lagoon_rodent;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fallen_pdaddy <= 0;
    else if (lizard_donkey)
      fallen_pdaddy <= bush_uppers;
  end

always @(fallen_pdaddy)
  begin
      feedback_pt_621 = fallen_pdaddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      clay_marco <= 0;
    else
      clay_marco <= gnd;
  end

always @(clay_marco)
  begin
      feedback_pt_622 = clay_marco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kanji_mars <= 0;
    else if (vcc)
      kanji_mars <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_star <= 0;
    else if (hotel_zed)
      escape_star <= marquis_husks;
    else if (vcc)
      escape_star <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_pixie <= 0;
    else if (tasty_floo)
      kilo_pixie <= arcade_ritsu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      odin_hamachi <= 0;
    else if (north_pacbell)
      odin_hamachi <= south_crank;
    else if (vcc)
      odin_hamachi <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegas_clay <= 1;
    else
      vegas_clay <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jcrew_siamese <= 1;
    else
      jcrew_siamese <= rubeus_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bert_burning <= 0;
    else if (illegal_duck)
      bert_burning <= 0;
    else if (vcc)
      bert_burning <= tonks_england;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bracket_barty <= 0;
    else if (hiswife_zinc)
      bracket_barty <= stix_iterate;
  end

wire lxtcen_gopher_wire;

dffea lxtcen_gopher_ff (
  .clk(clock1),
  .d(brian_advil),
  .ena(falafel_north),
  .adata(killer_curie),
  .clrn(!reset1),
  .q(lxtcen_gopher_wire)
);

always @(lxtcen_gopher_wire) begin
   venus_georgec = lxtcen_gopher_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      witch_drugs <= 1;
    else
      witch_drugs <= golden_robust;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fatality_noah <= 0;
    else if (hummer_potter)
      fatality_noah <= palmer_dadada;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      howell_eatem <= 0;
    else if (papyrus_huey)
      howell_eatem <= 0;
    else if (gnd)
      howell_eatem <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golf_onion <= 0;
    else if (rodriguez_guy)
      golf_onion <= 0;
    else if (spyro_nirish)
      golf_onion <= gnd;
  end

wire togos_piggish_wire;

dffeas togos_piggish_ff (
  .clk(clock1),
  .d(turtle_kilo),
  .ena(protest_cow),
  .sclr(heidi_school),
  .sload(dork_valve),
  .asdata(indigo_buddha),
  .clrn(!reset1),
  .q(togos_piggish_wire)
);

always @(togos_piggish_wire) begin
   rose_vangoh = togos_piggish_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_donut <= 0;
    else if (vcc)
      ham_donut <= gnd;
    else if (fatality_noah)
      ham_donut <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      would_chips <= 0;
    else if (smack_beavis)
      would_chips <= bagel_rubik;
    else if (jacuzzi_tabby)
      would_chips <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marco_icarus <= 0;
    else
      marco_icarus <= avon_giants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rodent_badger <= 0;
    else
      rodent_badger <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_atoms <= 0;
    else if (isle_mortgate)
      deng_atoms <= fury_mozart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_moses <= 0;
    else
      onion_moses <= achilles_dig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      callme_stoned <= 0;
    else
      callme_stoned <= moron_curious;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_bep <= 0;
    else
      advil_bep <= lisa_yoku;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mexico_pork <= 0;
    else if (lala_sanity)
      mexico_pork <= 0;
    else if (vcc)
      mexico_pork <= moe_burning;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kanji_todd <= 0;
    else if (vadar_protest)
      kanji_todd <= 0;
    else if (tobe_ants)
      kanji_todd <= tasty_condit;
  end

wire tracy_snape_wire;

dffea tracy_snape_ff (
  .clk(clock1),
  .d(hippo_lao),
  .ena(gnd),
  .adata(fang_honda),
  .clrn(!reset1),
  .q(tracy_snape_wire)
);

always @(tracy_snape_wire) begin
   rarest_yummy = tracy_snape_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crank_star <= 0;
    else if (fire_boing)
      crank_star <= tonks_fallen;
    else if (gnd)
      crank_star <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      thread_plague <= 1;
    else
      thread_plague <= happy_deuce;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_fallen <= 0;
    else if (pirate_flew)
      itchy_fallen <= 0;
    else if (tobe_foiled)
      itchy_fallen <= blaster_togos;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_yummy <= 0;
    else if (fish_itchy)
      water_yummy <= 0;
    else if (vcc)
      water_yummy <= george_roe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lagoon_ebay <= 1;
    else
      lagoon_ebay <= often_pdaddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubik_whack <= 1;
    else
      rubik_whack <= golden_robust;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beavis_kbtoys <= 0;
    else
      beavis_kbtoys <= knot_clay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      psycho_eagle <= 0;
    else if (vcc)
      psycho_eagle <= hotel_zed;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bambi_lao <= 0;
    else if (fronds_lxtcen)
      bambi_lao <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_books <= 0;
    else if (ceres_bach)
      webvan_books <= 0;
    else if (hiswife_zinc)
      webvan_books <= wonder_bart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spain_nail <= 0;
    else if (opus_liberace)
      spain_nail <= vcc;
    else if (what_booming)
      spain_nail <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      larry_alpha <= 0;
    else
      larry_alpha <= picante_meth;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bep_pirate <= 1;
    else
      bep_pirate <= questo_tamago;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onthepc_moe <= 0;
    else if (blaster_togos)
      onthepc_moe <= 0;
    else if (gnd)
      onthepc_moe <= boing_freaky;
  end

wire turnip_jason_wire;

dffeas turnip_jason_ff (
  .clk(clock1),
  .d(exodus_touch),
  .ena(dadada_rubik),
  .sclr(kilo_pixie),
  .sload(opus_liberace),
  .asdata(bracket_boing),
  .clrn(!reset1),
  .q(turnip_jason_wire)
);

always @(turnip_jason_wire) begin
   tukatuk_mike = turnip_jason_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      po_wizard <= 0;
    else
      po_wizard <= advil_bep;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      atomic_joker <= 0;
    else if (sun_larry)
      atomic_joker <= sirius_zhuang;
    else if (vcc)
      atomic_joker <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tesla_icarus <= 0;
    else if (vcc)
      tesla_icarus <= peace_tin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_holland <= 0;
    else
      meth_holland <= hp_asahi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ajax_shuda <= 0;
    else if (roe_lad)
      ajax_shuda <= vcc;
    else if (zulu_eel)
      ajax_shuda <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      desade_cuckoo <= 0;
    else if (ginger_hinge)
      desade_cuckoo <= itchy_wukong;
    else if (vcc)
      desade_cuckoo <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yak_on_sale <= 1;
    else
      yak_on_sale <= obiwan_quail;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whacky_exodus <= 0;
    else if (desert_albus)
      whacky_exodus <= fufu_bono;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drdeath_gulp <= 0;
    else if (midas_killer)
      drdeath_gulp <= gin_golden;
    else if (gnd)
      drdeath_gulp <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pluto_armand <= 0;
    else if (obiwan_quail)
      pluto_armand <= south_aspirin;
    else if (gnd)
      pluto_armand <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegan_isle <= 0;
    else
      vegan_isle <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_bear <= 0;
    else if (fallen_pdaddy)
      newt_bear <= 0;
    else if (palm_what)
      newt_bear <= love_in_zulu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bison_midas <= 1;
    else
      bison_midas <= bert_burning;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      faster_rocks <= 1;
    else
      faster_rocks <= deng_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speed_george <= 0;
    else
      speed_george <= lagoon_rodent;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      macys_draco <= 0;
    else if (spock_webvan)
      macys_draco <= 0;
    else if (advil_tango)
      macys_draco <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_cocaine <= 1;
    else
      advil_cocaine <= kappa_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_tin <= 1;
    else
      oldnavy_tin <= xterm_sierra;
  end

wire luthor_sleepy_wire;

dffeas luthor_sleepy_ff (
  .clk(clock1),
  .d(Iwin_neon),
  .ena(palmer_bust),
  .sclr(gnd),
  .sload(tesla_icarus),
  .asdata(vcc),
  .clrn(!reset1),
  .q(luthor_sleepy_wire)
);

always @(luthor_sleepy_wire) begin
   pizza_tobiko = luthor_sleepy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheese_jonas <= 1;
    else
      cheese_jonas <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mortar_rouge <= 1;
    else
      mortar_rouge <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonder_luthor <= 0;
    else if (rose_vangoh)
      wonder_luthor <= 0;
    else if (vcc)
      wonder_luthor <= sears_rerun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      senorduck_pig <= 0;
    else if (martin_safada)
      senorduck_pig <= fish_itchy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bison_donut <= 1;
    else
      bison_donut <= rubik_whack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_jupiter <= 0;
    else if (fufu_eagle)
      art_jupiter <= kennyg_tracy;
    else if (dig_obiwan)
      art_jupiter <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_kungfu <= 0;
    else if (banality_tuna)
      lotus_kungfu <= vcc;
    else if (sears_rerun)
      lotus_kungfu <= 0;
  end

reg feedback_pt_623;

always @(green_bep or feedback_pt_623)
  begin
      rum_thankee = !green_bep | !feedback_pt_623;
  end

reg feedback_pt_624;

always @(kanji_gyro or feedback_pt_624)
  begin
      icarus_dig =  kanji_gyro |  feedback_pt_624;
  end

reg feedback_pt_625;

always @(schwinger_red or feedback_pt_625)
  begin
      remus_peta =  schwinger_red &  feedback_pt_625;
  end

reg feedback_pt_626;

always @(advil_tango or feedback_pt_626)
  begin
      oitcen_fuji = !advil_tango ^  feedback_pt_626;
  end

reg feedback_pt_627;

always @(gnd or feedback_pt_627)
  begin
      often_safeway =  gnd ^ !feedback_pt_627;
  end

reg feedback_pt_628;

always @(floating_guy or feedback_pt_628)
  begin
      advil_picture =  floating_guy ^ !feedback_pt_628;
  end

reg feedback_pt_629;

always @(drugie_maki or feedback_pt_629)
  begin
      eatem_pixie =  drugie_maki ^  feedback_pt_629;
  end

reg feedback_pt_630;

always @(rodent_badger or feedback_pt_630)
  begin
      nyc_witch = !rodent_badger | !feedback_pt_630;
  end

reg feedback_pt_631;

always @(ginger_hinge or feedback_pt_631)
  begin
      rouge_burner =  ginger_hinge & !feedback_pt_631;
  end

reg feedback_pt_632;

always @(zulu_eel or feedback_pt_632)
  begin
      pasta_jupiter = !zulu_eel ^  feedback_pt_632;
  end

reg feedback_pt_633;

always @(vcc or feedback_pt_633)
  begin
      kbtoys_often =  vcc ^  feedback_pt_633;
  end

reg feedback_pt_634;

always @(zeus_po or feedback_pt_634)
  begin
      cocaine_bush =  zeus_po | !feedback_pt_634;
  end

reg feedback_pt_635;

always @(bfs_mortar or feedback_pt_635)
  begin
      spirit_bust =  bfs_mortar | !feedback_pt_635;
  end

reg feedback_pt_636;

always @(faster_rocks or feedback_pt_636)
  begin
      hut_athena = !faster_rocks |  feedback_pt_636;
  end

reg feedback_pt_637;

always @(fufu_vangoh or feedback_pt_637)
  begin
      doc_copper = !fufu_vangoh | !feedback_pt_637;
  end

reg feedback_pt_638;

always @(ham_donut or feedback_pt_638)
  begin
      hours_would =  ham_donut & !feedback_pt_638;
  end

reg feedback_pt_639;

always @(killer_curie or feedback_pt_639)
  begin
      pasta_buddha =  killer_curie | !feedback_pt_639;
  end

reg feedback_pt_640;

always @(wine_sand or feedback_pt_640)
  begin
      nyquil_desert = !wine_sand &  feedback_pt_640;
  end

reg feedback_pt_641;

always @(joseph_deuce or feedback_pt_641)
  begin
      onthepc_guy =  joseph_deuce ^ !feedback_pt_641;
  end

reg feedback_pt_642;

always @(bambi_bubba or feedback_pt_642)
  begin
      kangaroo_Iwin =  bambi_bubba |  feedback_pt_642;
  end

reg feedback_pt_643;

always @(gnd or feedback_pt_643)
  begin
      illegal_loser = !gnd &  feedback_pt_643;
  end

reg feedback_pt_644;

always @(hagrid_zeus or feedback_pt_644)
  begin
      arthur_ring =  hagrid_zeus |  feedback_pt_644;
  end

reg feedback_pt_645;

always @(moron_curious or feedback_pt_645)
  begin
      smack_thread = !moron_curious | !feedback_pt_645;
  end

reg feedback_pt_646;

always @(gnd or feedback_pt_646)
  begin
      rubik_palmer = !gnd | !feedback_pt_646;
  end

reg feedback_pt_647;

always @(onthepc_guy or feedback_pt_647)
  begin
      mortar_alpha =  onthepc_guy ^ !feedback_pt_647;
  end

reg feedback_pt_648;

always @(peace_cannon or feedback_pt_648)
  begin
      shemp_rufus = !peace_cannon | !feedback_pt_648;
  end

reg feedback_pt_649;

always @(gnd or feedback_pt_649)
  begin
      burnout_louie =  gnd &  feedback_pt_649;
  end

reg feedback_pt_650;

always @(arcade_ritsu or feedback_pt_650)
  begin
      winner_cubish = !arcade_ritsu ^  feedback_pt_650;
  end

reg feedback_pt_651;

always @(vcc or feedback_pt_651)
  begin
      vegas_emails = !vcc &  feedback_pt_651;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      broadway_duck <= 0;
    else
      broadway_duck <= moron_gin;
  end

always @(broadway_duck)
  begin
      feedback_pt_623 = broadway_duck;
  end

always @(broadway_duck)
  begin
      feedback_pt_624 = broadway_duck;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacuzzi_lotus <= 0;
    else if (copper_rubeus)
      jacuzzi_lotus <= gnd;
  end

always @(jacuzzi_lotus)
  begin
      feedback_pt_625 = jacuzzi_lotus;
  end

always @(jacuzzi_lotus)
  begin
      feedback_pt_626 = jacuzzi_lotus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      usa_salmon <= 0;
    else if (green_eeevil)
      usa_salmon <= jcrew_siamese;
    else if (maryann_hotel)
      usa_salmon <= 0;
  end

always @(usa_salmon)
  begin
      feedback_pt_627 = usa_salmon;
  end

always @(usa_salmon)
  begin
      feedback_pt_628 = usa_salmon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      loud_art <= 1;
    else
      loud_art <= llama_tobiko;
  end

always @(loud_art)
  begin
      feedback_pt_629 = loud_art;
  end

always @(loud_art)
  begin
      feedback_pt_630 = loud_art;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golfland_rose <= 1;
    else
      golfland_rose <= deng_junkie;
  end

always @(golfland_rose)
  begin
      feedback_pt_631 = golfland_rose;
  end

always @(golfland_rose)
  begin
      feedback_pt_632 = golfland_rose;
  end

always @(golfland_rose)
  begin
      feedback_pt_633 = golfland_rose;
  end

always @(golfland_rose)
  begin
      feedback_pt_634 = golfland_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zinc_zealot <= 1;
    else
      zinc_zealot <= egg_abel;
  end

always @(zinc_zealot)
  begin
      feedback_pt_635 = zinc_zealot;
  end

always @(zinc_zealot)
  begin
      feedback_pt_636 = zinc_zealot;
  end

always @(zinc_zealot)
  begin
      feedback_pt_637 = zinc_zealot;
  end

always @(zinc_zealot)
  begin
      feedback_pt_638 = zinc_zealot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tango_lala <= 0;
    else
      tango_lala <= bep_pirate;
  end

always @(tango_lala)
  begin
      feedback_pt_639 = tango_lala;
  end

always @(tango_lala)
  begin
      feedback_pt_640 = tango_lala;
  end

always @(tango_lala)
  begin
      feedback_pt_641 = tango_lala;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dipsy_ants <= 1;
    else
      dipsy_ants <= midas_dirty;
  end

always @(dipsy_ants)
  begin
      feedback_pt_642 = dipsy_ants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platypus_mars <= 0;
    else if (killer_ready)
      platypus_mars <= bep_defoliant;
    else if (kanji_todd)
      platypus_mars <= 0;
  end

always @(platypus_mars)
  begin
      feedback_pt_643 = platypus_mars;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_rojas <= 0;
    else
      lala_rojas <= hector_mao;
  end

always @(lala_rojas)
  begin
      feedback_pt_644 = lala_rojas;
  end

wire itchy_sun_wire;

dffeas itchy_sun_ff (
  .clk(clock1),
  .d(cheese_jonas),
  .ena(raiders_louie),
  .sclr(vcc),
  .sload(drax_rat),
  .asdata(richard_lamer),
  .clrn(!reset1),
  .q(itchy_sun_wire)
);

always @(itchy_sun_wire) begin
   drax_timmy = itchy_sun_wire;
end

always @(drax_timmy)
  begin
      feedback_pt_645 = drax_timmy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      badger_hotel <= 1;
    else
      badger_hotel <= jacuzzi_tabby;
  end

always @(badger_hotel)
  begin
      feedback_pt_646 = badger_hotel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      biker_snake <= 0;
    else if (south_ebi)
      biker_snake <= 0;
    else if (lamer_fear)
      biker_snake <= square_cheese;
  end

always @(biker_snake)
  begin
      feedback_pt_647 = biker_snake;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      llama_eunice <= 0;
    else if (peace_willem)
      llama_eunice <= vcc;
  end

always @(llama_eunice)
  begin
      feedback_pt_648 = llama_eunice;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      po_yeanyow <= 0;
    else if (obiwan_tonks)
      po_yeanyow <= vcc;
  end

always @(po_yeanyow)
  begin
      feedback_pt_649 = po_yeanyow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huhhuh_smack <= 0;
    else
      huhhuh_smack <= gin_golden;
  end

always @(huhhuh_smack)
  begin
      feedback_pt_650 = huhhuh_smack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bfi_curious <= 0;
    else
      bfi_curious <= china_whacky;
  end

always @(bfi_curious)
  begin
      feedback_pt_651 = bfi_curious;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vicks_monster <= 1;
    else
      vicks_monster <= hans_voodoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_comtrex <= 0;
    else if (hut_athena)
      boing_comtrex <= 0;
    else if (vcc)
      boing_comtrex <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_vicks <= 0;
    else
      curie_vicks <= mexico_pork;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      freaky_tasty <= 0;
    else if (kanji_clay)
      freaky_tasty <= 0;
    else if (kbtoys_often)
      freaky_tasty <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacques_macys <= 0;
    else
      jacques_macys <= advil_picture;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      togos_monster <= 0;
    else if (ebi_iwocensor)
      togos_monster <= 0;
    else if (neon_xuprocar)
      togos_monster <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      heidi_joker <= 1;
    else
      heidi_joker <= onion_moses;
  end

wire waster_jjocen_wire;

dffeas waster_jjocen_ff (
  .clk(clock1),
  .d(gnd),
  .ena(pluto_armand),
  .sclr(vcc),
  .sload(rubeus_acid),
  .asdata(vcc),
  .clrn(!reset1),
  .q(waster_jjocen_wire)
);

always @(waster_jjocen_wire) begin
   bison_mickey = waster_jjocen_wire;
end

wire nyc_drevil_wire;

dffeas nyc_drevil_ff (
  .clk(clock1),
  .d(oitcen_fuji),
  .ena(tako_handroll),
  .sclr(platinum_crab),
  .sload(rerun_tapered),
  .asdata(bep_defoliant),
  .clrn(!reset1),
  .q(nyc_drevil_wire)
);

always @(nyc_drevil_wire) begin
   onion_shemp = nyc_drevil_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kappa_bismuth <= 1;
    else
      kappa_bismuth <= coconut_witch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_xterm <= 0;
    else
      neville_xterm <= rabbi_waffle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xterm_wakey <= 0;
    else if (winner_cubish)
      xterm_wakey <= burnout_louie;
  end

wire dutch_ostrich_wire;

dffeas dutch_ostrich_ff (
  .clk(clock1),
  .d(thread_plague),
  .ena(avon_giants),
  .sclr(nest_cow),
  .sload(vcc),
  .asdata(turtle_life),
  .clrn(!reset1),
  .q(dutch_ostrich_wire)
);

always @(dutch_ostrich_wire) begin
   potter_zealot = dutch_ostrich_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huhhuh_dow <= 0;
    else if (exodus_touch)
      huhhuh_dow <= 0;
    else if (neville_xterm)
      huhhuh_dow <= xuprocar_fuji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honda_goofy <= 0;
    else if (att_maryann)
      honda_goofy <= desade_cuckoo;
    else if (roe_lad)
      honda_goofy <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tofu_bonker <= 0;
    else if (bart_speed)
      tofu_bonker <= 0;
    else if (pasta_jupiter)
      tofu_bonker <= salsa_master;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      copper_due <= 0;
    else if (pasta_jupiter)
      copper_due <= 0;
    else if (killer_curie)
      copper_due <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_bubba <= 0;
    else if (roe_lad)
      webvan_bubba <= 0;
    else if (vcc)
      webvan_bubba <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platinum_clay <= 1;
    else
      platinum_clay <= lotus_sgates;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homer_egg <= 0;
    else if (maki_unicorn)
      homer_egg <= wonder_bart;
    else if (gnd)
      homer_egg <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chuck_tattoo <= 0;
    else if (dipsy_ants)
      chuck_tattoo <= heidi_crank;
  end

wire fang_dimetap_wire;

dffeas fang_dimetap_ff (
  .clk(clock1),
  .d(togos_monster),
  .ena(mao_honey),
  .sclr(itchy_wukong),
  .sload(louie_mideast),
  .asdata(vegas_clay),
  .clrn(!reset1),
  .q(fang_dimetap_wire)
);

always @(fang_dimetap_wire) begin
   larry_advil = fang_dimetap_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sugar_donut <= 0;
    else if (avon_century)
      sugar_donut <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ready_lovey <= 0;
    else if (gnd)
      ready_lovey <= tapered_xray;
    else if (wonder_bart)
      ready_lovey <= 0;
  end

wire sake_waster_wire;

dffea sake_waster_ff (
  .clk(clock1),
  .d(vcc),
  .ena(dingbat_snape),
  .adata(chevys_mexico),
  .clrn(!reset1),
  .q(sake_waster_wire)
);

always @(sake_waster_wire) begin
   wonder_wood = sake_waster_wire;
end

wire mexico_green_wire;

dffeas mexico_green_ff (
  .clk(clock1),
  .d(gnd),
  .ena(ebay_sogood),
  .sclr(dopey_master),
  .sload(lala_rojas),
  .asdata(sand_lotus),
  .clrn(!reset1),
  .q(mexico_green_wire)
);

always @(mexico_green_wire) begin
   square_hanger = mexico_green_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lima_pictures <= 0;
    else if (gnd)
      lima_pictures <= 0;
    else if (Iwin_neon)
      lima_pictures <= cheez_zedong;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      north_wonton <= 0;
    else if (cocaine_bush)
      north_wonton <= riddler_stix;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oranje_beef <= 0;
    else if (butthead_duey)
      oranje_beef <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_hinge <= 1;
    else
      egg_hinge <= onion_shemp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whack_woman <= 0;
    else if (vcc)
      whack_woman <= nyc_witch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lad_spirit <= 0;
    else if (lala_martian)
      lad_spirit <= ginger_hinge;
    else if (rarest_yummy)
      lad_spirit <= 0;
  end

wire zhuang_indigo_wire;

dffeas zhuang_indigo_ff (
  .clk(clock1),
  .d(pasta_buddha),
  .ena(sinew_gulp),
  .sclr(senorduck_pig),
  .sload(stoner_candle),
  .asdata(po_wizard),
  .clrn(!reset1),
  .q(zhuang_indigo_wire)
);

always @(zhuang_indigo_wire) begin
   hp_zeus = zhuang_indigo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_xray <= 0;
    else
      neville_xray <= bravo_hours;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      draco_rabbi <= 0;
    else if (newt_bear)
      draco_rabbi <= 0;
    else if (gnd)
      draco_rabbi <= green_bep;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mickey_fish <= 1;
    else
      mickey_fish <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      suffering_pig <= 0;
    else if (gnd)
      suffering_pig <= 0;
    else if (xterm_wakey)
      suffering_pig <= meth_athena;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      november_ebay <= 0;
    else if (square_hanger)
      november_ebay <= parrot_east;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rufus_black <= 0;
    else if (gnd)
      rufus_black <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      papyrus_lisa <= 0;
    else if (rose_vangoh)
      papyrus_lisa <= joker_gotone;
    else if (gnd)
      papyrus_lisa <= 0;
  end

// Random combinatorial logic block
always@(*)
  begin
      abraham_yoda = ( ~( ( ~( ~gnd & nyquil_desert & ~( ~gnd ) ) ) & ~( pcp_waster ) & ~( ~neon_snape ) ) ^ ( ~( ~hours_would ^ ~( bagel_rubik ) ) ) );
  end

// State Mek clay_shark Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      clay_shark <= clay_shark_0;
    else
      case (clay_shark)
        clay_shark_0: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 1)
            clay_shark <= clay_shark_5;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 15)
            clay_shark <= clay_shark_4;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 7)
            clay_shark <= clay_shark_5;
          else
            clay_shark <= clay_shark_0;
          end
        clay_shark_1: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 4)
            clay_shark <= clay_shark_4;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 3)
            clay_shark <= clay_shark_7;
          else
            clay_shark <= clay_shark_1;
          end
        clay_shark_2: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 9)
            clay_shark <= clay_shark_5;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 3)
            clay_shark <= clay_shark_7;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 13)
            clay_shark <= clay_shark_7;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 4)
            clay_shark <= clay_shark_4;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 2)
            clay_shark <= clay_shark_5;
          else
            clay_shark <= clay_shark_2;
          end
        clay_shark_3: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 10)
            clay_shark <= clay_shark_0;
          else
            clay_shark <= clay_shark_3;
          end
        clay_shark_4: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 8)
            clay_shark <= clay_shark_6;
          else
            clay_shark <= clay_shark_4;
          end
        clay_shark_5: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 10)
            clay_shark <= clay_shark_2;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 9)
            clay_shark <= clay_shark_1;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 1)
            clay_shark <= clay_shark_7;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 12)
            clay_shark <= clay_shark_2;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 4)
            clay_shark <= clay_shark_2;
          else
            clay_shark <= clay_shark_5;
          end
        clay_shark_6: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 15)
            clay_shark <= clay_shark_6;
          else
            clay_shark <= clay_shark_6;
          end
        clay_shark_7: begin
          if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 3)
            clay_shark <= clay_shark_7;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 12)
            clay_shark <= clay_shark_6;
          else if ({badger_hotel,platinum_clay,often_faster,snape_neptune} == 10)
            clay_shark <= clay_shark_3;
          else
            clay_shark <= clay_shark_7;
          end
        default: clay_shark <= clay_shark_0;
      endcase
  end

// State Mek clay_shark Output logic
always @(clay_shark)
  begin
    // consider all state regs when doing outputs
    case (clay_shark)
        clay_shark_0: begin
            turkey_ohno = 0;
            duck_wood = 0;
            ibm_ykocens = 0;
            dipsy_spanish = 1;
            rescue_wakey = 1;
            kilo_star = 1;
          end
        clay_shark_1: begin
            turkey_ohno = 1;
            duck_wood = 1;
            ibm_ykocens = 1;
            dipsy_spanish = 0;
            rescue_wakey = 1;
            kilo_star = 1;
          end
        clay_shark_2: begin
            turkey_ohno = 0;
            duck_wood = 1;
            ibm_ykocens = 1;
            dipsy_spanish = 1;
            rescue_wakey = 0;
            kilo_star = 0;
          end
        clay_shark_3: begin
            turkey_ohno = 0;
            duck_wood = 1;
            ibm_ykocens = 1;
            dipsy_spanish = 1;
            rescue_wakey = 0;
            kilo_star = 0;
          end
        clay_shark_4: begin
            turkey_ohno = 1;
            duck_wood = 1;
            ibm_ykocens = 0;
            dipsy_spanish = 1;
            rescue_wakey = 0;
            kilo_star = 0;
          end
        clay_shark_5: begin
            turkey_ohno = 1;
            duck_wood = 1;
            ibm_ykocens = 1;
            dipsy_spanish = 1;
            rescue_wakey = 1;
            kilo_star = 0;
          end
        clay_shark_6: begin
            turkey_ohno = 1;
            duck_wood = 1;
            ibm_ykocens = 0;
            dipsy_spanish = 1;
            rescue_wakey = 0;
            kilo_star = 1;
          end
        clay_shark_7: begin
            turkey_ohno = 0;
            duck_wood = 1;
            ibm_ykocens = 0;
            dipsy_spanish = 0;
            rescue_wakey = 1;
            kilo_star = 1;
          end
        default: begin
            turkey_ohno = 0;
            duck_wood = 0;
            ibm_ykocens = 1;
            dipsy_spanish = 1;
            rescue_wakey = 1;
            kilo_star = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire touch_safeway_out;
nut_004_lut #(3) nut_004_lut_inst_touch_safeway (
  .din({gnd,elian_bamboo,gnd}),
  .mask(8'he0),
  .out(touch_safeway_out)
);

always @(touch_safeway_out)
begin
   zedong_eunice = touch_safeway_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire bear_cow_out;
nut_004_lut #(6) nut_004_lut_inst_bear_cow (
  .din({abraham_yoda,llama_eunice,oranje_spyro,art_jupiter,animal_mickey,shemp_rufus}),
  .mask(64'h102e23612f9d9108),
  .out(bear_cow_out)
);

always @(bear_cow_out)
begin
   escape_acid = bear_cow_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire ramone_spirit_out;
nut_004_lut #(5) nut_004_lut_inst_ramone_spirit (
  .din({marquis_husks,arthur_ring,jacuzzi_lotus,vcc,rescue_wakey}),
  .mask(32'b01001101010100000110100000010011),
  .out(ramone_spirit_out)
);

always @(ramone_spirit_out)
begin
   moe_stroop = ramone_spirit_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire bust_ocean_out;
nut_004_lut #(2) nut_004_lut_inst_bust_ocean (
  .din({onion_moses,gnd}),
  .mask(4'b0010),
  .out(bust_ocean_out)
);

always @(bust_ocean_out)
begin
   doc_pictures = bust_ocean_out;
end

// In range compare
always @(rouge_burner or gnd or snort_nasdaq or gnd)
  begin
    if ({rouge_burner,gnd,snort_nasdaq,gnd} > 245 &&
        {rouge_burner,gnd,snort_nasdaq,gnd} < 25)
      kmfdm_bismuth = 1;
    else
      kmfdm_bismuth = 0;
  end

// 7 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {richard_ariel,eatem_lotus,thankee_homer,ghost_school,ceres_bep,lumber_crucio,ramone_jcrew} <= 0;
    else if (gnd)
      {richard_ariel,eatem_lotus,thankee_homer,ghost_school,ceres_bep,lumber_crucio,ramone_jcrew} <= {richard_ariel,eatem_lotus,thankee_homer,ghost_school,ceres_bep,lumber_crucio,ramone_jcrew} + 189;
    else
      {richard_ariel,eatem_lotus,thankee_homer,ghost_school,ceres_bep,lumber_crucio,ramone_jcrew} <= {richard_ariel,eatem_lotus,thankee_homer,ghost_school,ceres_bep,lumber_crucio,ramone_jcrew} - 111;
  end

reg feedback_pt_652;

always @(bubba_doc or feedback_pt_652)
  begin
      biker_homer =  bubba_doc ^ !feedback_pt_652;
  end

reg feedback_pt_653;

always @(turkey_ohno or feedback_pt_653)
  begin
      psycho_danger = !turkey_ohno | !feedback_pt_653;
  end

reg feedback_pt_654;

always @(oranje_spyro or feedback_pt_654)
  begin
      tasty_jjocen = !oranje_spyro |  feedback_pt_654;
  end

reg feedback_pt_655;

always @(curie_aspirin or feedback_pt_655)
  begin
      deuce_juliet = !curie_aspirin |  feedback_pt_655;
  end

reg feedback_pt_656;

always @(onthepc_guy or feedback_pt_656)
  begin
      egg_cafe =  onthepc_guy ^ !feedback_pt_656;
  end

reg feedback_pt_657;

always @(potato_rod or feedback_pt_657)
  begin
      golf_xiaoping =  potato_rod ^ !feedback_pt_657;
  end

reg feedback_pt_658;

always @(fufu_vangoh or feedback_pt_658)
  begin
      chowmein_guy = !fufu_vangoh & !feedback_pt_658;
  end

reg feedback_pt_659;

always @(remus_fallen or feedback_pt_659)
  begin
      ostrich_zi = !remus_fallen | !feedback_pt_659;
  end

reg feedback_pt_660;

always @(falafel_duey or feedback_pt_660)
  begin
      crab_crayons =  falafel_duey &  feedback_pt_660;
  end

reg feedback_pt_661;

always @(sanity_tarzan or feedback_pt_661)
  begin
      raiders_loser =  sanity_tarzan ^ !feedback_pt_661;
  end

reg feedback_pt_662;

always @(gnd or feedback_pt_662)
  begin
      bach_thankee = !gnd |  feedback_pt_662;
  end

reg feedback_pt_663;

always @(kangaroo_Iwin or feedback_pt_663)
  begin
      luthor_turtle = !kangaroo_Iwin |  feedback_pt_663;
  end

reg feedback_pt_664;

always @(nigiri_chuck or feedback_pt_664)
  begin
      arizona_water =  nigiri_chuck ^  feedback_pt_664;
  end

reg feedback_pt_665;

always @(gnd or feedback_pt_665)
  begin
      sneezy_junkie = !gnd ^ !feedback_pt_665;
  end

reg feedback_pt_666;

always @(meth_holland or feedback_pt_666)
  begin
      lion_would =  meth_holland ^ !feedback_pt_666;
  end

reg feedback_pt_667;

always @(golf_xiaoping or feedback_pt_667)
  begin
      tapered_dig = !golf_xiaoping &  feedback_pt_667;
  end

reg feedback_pt_668;

always @(draco_rabbi or feedback_pt_668)
  begin
      think_would =  draco_rabbi ^  feedback_pt_668;
  end

reg feedback_pt_669;

always @(hp_zeus or feedback_pt_669)
  begin
      wine_athena = !hp_zeus & !feedback_pt_669;
  end

reg feedback_pt_670;

always @(dipsy_spanish or feedback_pt_670)
  begin
      dig_bambi = !dipsy_spanish |  feedback_pt_670;
  end

reg feedback_pt_671;

always @(vcc or feedback_pt_671)
  begin
      tinker_sierra = !vcc | !feedback_pt_671;
  end

reg feedback_pt_672;

always @(pirate_joseph or feedback_pt_672)
  begin
      cannon_hanger = !pirate_joseph |  feedback_pt_672;
  end

reg feedback_pt_673;

always @(martin_sirius or feedback_pt_673)
  begin
      sneezy_zealot =  martin_sirius ^ !feedback_pt_673;
  end

reg feedback_pt_674;

always @(burning_tesla or feedback_pt_674)
  begin
      asahi_bloom = !burning_tesla ^  feedback_pt_674;
  end

reg feedback_pt_675;

always @(mars_turkey or feedback_pt_675)
  begin
      rasp_green =  mars_turkey & !feedback_pt_675;
  end

reg feedback_pt_676;

always @(onion_moses or feedback_pt_676)
  begin
      jason_emu =  onion_moses ^  feedback_pt_676;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_doc <= 0;
    else
      webvan_doc <= rabbi_waffle;
  end

always @(webvan_doc)
  begin
      feedback_pt_652 = webvan_doc;
  end

always @(webvan_doc)
  begin
      feedback_pt_653 = webvan_doc;
  end

always @(webvan_doc)
  begin
      feedback_pt_654 = webvan_doc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_gutter <= 0;
    else
      boing_gutter <= gnd;
  end

always @(boing_gutter)
  begin
      feedback_pt_655 = boing_gutter;
  end

always @(boing_gutter)
  begin
      feedback_pt_656 = boing_gutter;
  end

always @(boing_gutter)
  begin
      feedback_pt_657 = boing_gutter;
  end

always @(boing_gutter)
  begin
      feedback_pt_658 = boing_gutter;
  end

always @(boing_gutter)
  begin
      feedback_pt_659 = boing_gutter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_smack <= 0;
    else if (vcc)
      art_smack <= bracket_barty;
    else if (dig_bambi)
      art_smack <= 0;
  end

always @(art_smack)
  begin
      feedback_pt_660 = art_smack;
  end

always @(art_smack)
  begin
      feedback_pt_661 = art_smack;
  end

always @(art_smack)
  begin
      feedback_pt_662 = art_smack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blue_tracy <= 0;
    else if (bear_speedyg)
      blue_tracy <= 0;
    else if (dingbat_lad)
      blue_tracy <= spastic_todd;
  end

always @(blue_tracy)
  begin
      feedback_pt_663 = blue_tracy;
  end

always @(blue_tracy)
  begin
      feedback_pt_664 = blue_tracy;
  end

always @(blue_tracy)
  begin
      feedback_pt_665 = blue_tracy;
  end

always @(blue_tracy)
  begin
      feedback_pt_666 = blue_tracy;
  end

always @(blue_tracy)
  begin
      feedback_pt_667 = blue_tracy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lemon_tapered <= 0;
    else if (rabbi_waffle)
      lemon_tapered <= 0;
    else if (schwinger_bfs)
      lemon_tapered <= vegan_isle;
  end

always @(lemon_tapered)
  begin
      feedback_pt_668 = lemon_tapered;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_valve <= 0;
    else if (freaky_tasty)
      pcp_valve <= lumber_crucio;
  end

always @(pcp_valve)
  begin
      feedback_pt_669 = pcp_valve;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      aphid_diagon <= 0;
    else if (dadada_rescue)
      aphid_diagon <= vcc;
  end

always @(aphid_diagon)
  begin
      feedback_pt_670 = aphid_diagon;
  end

wire hummer_star_wire;

dffea hummer_star_ff (
  .clk(clock1),
  .d(vcc),
  .ena(egg_hinge),
  .adata(gnd),
  .clrn(!reset1),
  .q(hummer_star_wire)
);

always @(hummer_star_wire) begin
   snake_often = hummer_star_wire;
end

always @(snake_often)
  begin
      feedback_pt_671 = snake_often;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      madeye_badger <= 0;
    else if (gnd)
      madeye_badger <= genesis_ozzy;
  end

always @(madeye_badger)
  begin
      feedback_pt_672 = madeye_badger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joey_golden <= 1;
    else
      joey_golden <= pcp_waster;
  end

always @(joey_golden)
  begin
      feedback_pt_673 = joey_golden;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bubba_plague <= 0;
    else if (vcc)
      bubba_plague <= ajax_shuda;
  end

always @(bubba_plague)
  begin
      feedback_pt_674 = bubba_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      armand_tesla <= 0;
    else if (vcc)
      armand_tesla <= 0;
    else if (jacques_macys)
      armand_tesla <= gnd;
  end

always @(armand_tesla)
  begin
      feedback_pt_675 = armand_tesla;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arizona_newt <= 0;
    else if (gnd)
      arizona_newt <= crab_crayons;
  end

always @(arizona_newt)
  begin
      feedback_pt_676 = arizona_newt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rum_partners <= 0;
    else if (gnd)
      rum_partners <= cocaine_bush;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bloom_batman <= 0;
    else
      bloom_batman <= hulk_doobie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      waster_minnie <= 0;
    else if (doobie_macys)
      waster_minnie <= falafel_sun;
    else if (vcc)
      waster_minnie <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_candle <= 0;
    else
      bear_candle <= lad_spirit;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sanity_minnie <= 0;
    else
      sanity_minnie <= yak_on_sale;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sheep_grams <= 1;
    else
      sheep_grams <= pdaddy_willy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_potato <= 0;
    else if (vcc)
      art_potato <= 0;
    else if (enoch_vangoh)
      art_potato <= doc_copper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_vegan <= 0;
    else if (lagoon_broom)
      hinge_vegan <= 0;
    else if (newt_cheese)
      hinge_vegan <= ramone_jcrew;
  end

wire hotdog_arthur_wire;

dffeas hotdog_arthur_ff (
  .clk(clock1),
  .d(bfs_star),
  .ena(vcc),
  .sclr(smack_thread),
  .sload(platypus_mars),
  .asdata(chillis_cybex),
  .clrn(!reset1),
  .q(hotdog_arthur_wire)
);

always @(hotdog_arthur_wire) begin
   deng_love_in = hotdog_arthur_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wine_amadeus <= 0;
    else if (boing_gutter)
      wine_amadeus <= 0;
    else if (eatem_pixie)
      wine_amadeus <= itchy_fallen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      monster_isle <= 0;
    else if (snake_often)
      monster_isle <= lagoon_broom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_ihilani <= 0;
    else
      moe_ihilani <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      smack_ohno <= 0;
    else
      smack_ohno <= ramone_romex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_golf <= 0;
    else if (gnd)
      crab_golf <= 0;
    else if (november_ebay)
      crab_golf <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      draco_moulin <= 0;
    else if (potato_rod)
      draco_moulin <= gnd;
  end

wire blessyou_meth_wire;

dffeas blessyou_meth_ff (
  .clk(clock1),
  .d(arthur_att),
  .ena(chuck_tattoo),
  .sclr(north_wonton),
  .sload(north_wonton),
  .asdata(drdeath_gulp),
  .clrn(!reset1),
  .q(blessyou_meth_wire)
);

always @(blessyou_meth_wire) begin
   ernie_spyro = blessyou_meth_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      siamese_rojas <= 0;
    else if (gnd)
      siamese_rojas <= marco_icarus;
    else if (ohno_minnow)
      siamese_rojas <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homer_pirate <= 0;
    else
      homer_pirate <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whammy_kabar <= 0;
    else if (gnd)
      whammy_kabar <= biker_snake;
    else if (heidi_joker)
      whammy_kabar <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      remus_bagel <= 1;
    else
      remus_bagel <= clay_marco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      purple_vegan <= 0;
    else if (rodent_badger)
      purple_vegan <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      exodus_grumpy <= 0;
    else if (moe_pomodoro)
      exodus_grumpy <= raiders_loser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_rocks <= 0;
    else
      ibm_rocks <= potter_zealot;
  end

wire plague_tango_wire;

dffea plague_tango_ff (
  .clk(clock1),
  .d(vcc),
  .ena(gnd),
  .adata(tracy_gyro),
  .clrn(!reset1),
  .q(plague_tango_wire)
);

always @(plague_tango_wire) begin
   aspirin_papa = plague_tango_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zi_chowmein <= 0;
    else if (richard_ariel)
      zi_chowmein <= shark_richard;
    else if (larry_advil)
      zi_chowmein <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zi_bloom <= 0;
    else if (tapered_dig)
      zi_bloom <= raiders_louie;
  end

wire goat_marco_wire;

dffeas goat_marco_ff (
  .clk(clock1),
  .d(vcc),
  .ena(vcc),
  .sclr(tango_lala),
  .sload(platinum_clay),
  .asdata(joseph_deuce),
  .clrn(!reset1),
  .q(goat_marco_wire)
);

always @(goat_marco_wire) begin
   helena_rubik = goat_marco_wire;
end

wire sleepy_marco_wire;

dffea sleepy_marco_ff (
  .clk(clock1),
  .d(papyrus_huey),
  .ena(pork_balloon),
  .adata(gnd),
  .clrn(!reset1),
  .q(sleepy_marco_wire)
);

always @(sleepy_marco_wire) begin
   bison_gotone = sleepy_marco_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pork_mine <= 0;
    else if (egg_cafe)
      pork_mine <= 0;
    else if (gnd)
      pork_mine <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fallen_pyro <= 0;
    else if (knot_picante)
      fallen_pyro <= gnd;
    else if (tasty_condit)
      fallen_pyro <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuckoo_cuckoo <= 1;
    else
      cuckoo_cuckoo <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nigiri_donut <= 0;
    else if (gnd)
      nigiri_donut <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      paper_yoku <= 1;
    else
      paper_yoku <= stix_iterate;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zinc_foxtrot <= 0;
    else
      zinc_foxtrot <= tank_eagle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_picture <= 0;
    else if (vcc)
      money_picture <= gnd;
    else if (gnd)
      money_picture <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whale_mexico <= 0;
    else if (gnd)
      whale_mexico <= lion_would;
    else if (wonder_wood)
      whale_mexico <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ebay_ihilani <= 0;
    else
      ebay_ihilani <= vcc;
  end

wire tiger_tako_wire;

dffea tiger_tako_ff (
  .clk(clock1),
  .d(often_safeway),
  .ena(art_smack),
  .adata(ready_lovey),
  .clrn(!reset1),
  .q(tiger_tako_wire)
);

always @(tiger_tako_wire) begin
   sleepy_gin = tiger_tako_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      asahi_too_big <= 0;
    else if (lala_rojas)
      asahi_too_big <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hulk_feynman <= 0;
    else
      hulk_feynman <= gnd;
  end

wire west_athena_wire;

dffeas west_athena_ff (
  .clk(clock1),
  .d(tapered_dig),
  .ena(jacques_macys),
  .sclr(vcc),
  .sload(quail_fascist),
  .asdata(cuckoo_cuckoo),
  .clrn(!reset1),
  .q(west_athena_wire)
);

always @(west_athena_wire) begin
   kilo_india = west_athena_wire;
end

wire over_rabbi_wire;

dffea over_rabbi_ff (
  .clk(clock1),
  .d(opus_liberace),
  .ena(eggsalad_dirk),
  .adata(cow_tabasco),
  .clrn(!reset1),
  .q(over_rabbi_wire)
);

always @(over_rabbi_wire) begin
   klaas_oitcen = over_rabbi_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      touch_homerun <= 0;
    else
      touch_homerun <= kilo_india;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sapporo_chuck <= 0;
    else
      sapporo_chuck <= sheep_grams;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gin_zhuang <= 0;
    else if (stix_iterate)
      gin_zhuang <= gnd;
    else if (bart_speed)
      gin_zhuang <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_danger <= 0;
    else
      animal_danger <= riddler_stix;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      flew_valve <= 0;
    else
      flew_valve <= bison_gotone;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romex_pyro <= 0;
    else if (ebi_iwocensor)
      romex_pyro <= ready_xray;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      otter_warlock <= 0;
    else if (louie_mideast)
      otter_warlock <= abraham_yoda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_questo <= 0;
    else
      escape_questo <= bison_midas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peta_zinc <= 0;
    else if (whammy_kabar)
      peta_zinc <= 0;
    else if (nation_potato)
      peta_zinc <= gin_golden;
  end

wire fire_pierre_wire;

dffeas fire_pierre_ff (
  .clk(clock1),
  .d(rose_larry),
  .ena(platinum_crab),
  .sclr(pdaddy_willy),
  .sload(asahi_too_big),
  .asdata(kilo_marge),
  .clrn(!reset1),
  .q(fire_pierre_wire)
);

always @(fire_pierre_wire) begin
   golden_candle = fire_pierre_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      loud_brian <= 0;
    else if (gnd)
      loud_brian <= pirate_flew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wujing_rubik <= 1;
    else
      wujing_rubik <= aphid_diagon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      protest_goofy <= 0;
    else if (vcc)
      protest_goofy <= golf_onion;
    else if (bear_candle)
      protest_goofy <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_marker <= 0;
    else
      rerun_marker <= sheep_grams;
  end

wire spain_wonton_wire;

dffeas spain_wonton_ff (
  .clk(clock1),
  .d(rescue_wakey),
  .ena(south_aspirin),
  .sclr(paper_yoku),
  .sload(crab_crayons),
  .asdata(snake_often),
  .clrn(!reset1),
  .q(spain_wonton_wire)
);

always @(spain_wonton_wire) begin
   bep_rafting = spain_wonton_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_floride <= 0;
    else if (bubba_plague)
      cain_floride <= gin_zhuang;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tank_nhtcenso <= 1;
    else
      tank_nhtcenso <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      donald_dig <= 1;
    else
      donald_dig <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whammy_green <= 1;
    else
      whammy_green <= nasdaq_doc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nail_north <= 0;
    else if (knot_picante)
      nail_north <= 0;
    else if (gnd)
      nail_north <= zi_chowmein;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_cheez <= 0;
    else if (green_sortout)
      curie_cheez <= larry_alpha;
    else if (mickey_fish)
      curie_cheez <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      east_boots <= 0;
    else if (gnd)
      east_boots <= neville_xterm;
    else if (ramone_jcrew)
      east_boots <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romex_ginger <= 0;
    else if (rose_vangoh)
      romex_ginger <= happy_bear;
    else if (maryann_hotel)
      romex_ginger <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_nirish <= 0;
    else if (gnd)
      hinge_nirish <= 0;
    else if (bison_mickey)
      hinge_nirish <= rasp_green;
  end

reg feedback_pt_677;

always @(hp_zeus or feedback_pt_677)
  begin
      pdiddy_tracy =  hp_zeus | !feedback_pt_677;
  end

reg feedback_pt_678;

always @(too_big or feedback_pt_678)
  begin
      att_hinge = !too_big |  feedback_pt_678;
  end

reg feedback_pt_679;

always @(peaves_hut or feedback_pt_679)
  begin
      ocean_think =  peaves_hut ^ !feedback_pt_679;
  end

reg feedback_pt_680;

always @(zinc_foxtrot or feedback_pt_680)
  begin
      burrito_venus =  zinc_foxtrot | !feedback_pt_680;
  end

reg feedback_pt_681;

always @(gnd or feedback_pt_681)
  begin
      ceres_mars = !gnd ^  feedback_pt_681;
  end

reg feedback_pt_682;

always @(gnd or feedback_pt_682)
  begin
      dweebie_elian = !gnd ^  feedback_pt_682;
  end

reg feedback_pt_683;

always @(whacky_exodus or feedback_pt_683)
  begin
      rodent_ford =  whacky_exodus ^ !feedback_pt_683;
  end

reg feedback_pt_684;

always @(vcc or feedback_pt_684)
  begin
      yoku_zed =  vcc |  feedback_pt_684;
  end

reg feedback_pt_685;

always @(potato_rod or feedback_pt_685)
  begin
      wakey_zebra =  potato_rod |  feedback_pt_685;
  end

reg feedback_pt_686;

always @(gnd or feedback_pt_686)
  begin
      bfi_quebec =  gnd | !feedback_pt_686;
  end

reg feedback_pt_687;

always @(papyrus_lisa or feedback_pt_687)
  begin
      england_red =  papyrus_lisa &  feedback_pt_687;
  end

reg feedback_pt_688;

always @(broadway_duck or feedback_pt_688)
  begin
      giraffe_hp = !broadway_duck & !feedback_pt_688;
  end

reg feedback_pt_689;

always @(tukatuk_mike or feedback_pt_689)
  begin
      blue_popcorn =  tukatuk_mike ^  feedback_pt_689;
  end

reg feedback_pt_690;

always @(boing_comtrex or feedback_pt_690)
  begin
      bull_rufus =  boing_comtrex |  feedback_pt_690;
  end

reg feedback_pt_691;

always @(whale_mexico or feedback_pt_691)
  begin
      subway_speed =  whale_mexico | !feedback_pt_691;
  end

reg feedback_pt_692;

always @(art_potato or feedback_pt_692)
  begin
      rose_roe = !art_potato ^  feedback_pt_692;
  end

reg feedback_pt_693;

always @(vcc or feedback_pt_693)
  begin
      rarest_newt = !vcc & !feedback_pt_693;
  end

reg feedback_pt_694;

always @(remus_bagel or feedback_pt_694)
  begin
      lion_hotdog = !remus_bagel & !feedback_pt_694;
  end

reg feedback_pt_695;

always @(whacky_exodus or feedback_pt_695)
  begin
      pizza_tapered = !whacky_exodus & !feedback_pt_695;
  end

reg feedback_pt_696;

always @(kmfdm_bismuth or feedback_pt_696)
  begin
      testyour_duey =  kmfdm_bismuth ^ !feedback_pt_696;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gyro_copper <= 0;
    else if (cocaine_bush)
      gyro_copper <= eatem_lotus;
  end

always @(gyro_copper)
  begin
      feedback_pt_677 = gyro_copper;
  end

always @(gyro_copper)
  begin
      feedback_pt_678 = gyro_copper;
  end

always @(gyro_copper)
  begin
      feedback_pt_679 = gyro_copper;
  end

always @(gyro_copper)
  begin
      feedback_pt_680 = gyro_copper;
  end

always @(gyro_copper)
  begin
      feedback_pt_681 = gyro_copper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_moonraker <= 0;
    else if (gyro_copper)
      pcp_moonraker <= wine_amadeus;
  end

always @(pcp_moonraker)
  begin
      feedback_pt_682 = pcp_moonraker;
  end

always @(pcp_moonraker)
  begin
      feedback_pt_683 = pcp_moonraker;
  end

always @(pcp_moonraker)
  begin
      feedback_pt_684 = pcp_moonraker;
  end

always @(pcp_moonraker)
  begin
      feedback_pt_685 = pcp_moonraker;
  end

always @(pcp_moonraker)
  begin
      feedback_pt_686 = pcp_moonraker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_shuda <= 0;
    else if (wukong_float)
      fronds_shuda <= 0;
    else if (lagoon_ebay)
      fronds_shuda <= lagoon_broom;
  end

always @(fronds_shuda)
  begin
      feedback_pt_687 = fronds_shuda;
  end

wire due_guacamole_wire;

dffeas due_guacamole_ff (
  .clk(clock1),
  .d(louie_mideast),
  .ena(maklak_gyro),
  .sclr(lotus_sgates),
  .sload(mortar_rouge),
  .asdata(asahi_too_big),
  .clrn(!reset1),
  .q(due_guacamole_wire)
);

always @(due_guacamole_wire) begin
   soccer_viagra = due_guacamole_wire;
end

always @(soccer_viagra)
  begin
      feedback_pt_688 = soccer_viagra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wicked_gonzo <= 0;
    else if (giraffe_hp)
      wicked_gonzo <= whammy_kabar;
  end

always @(wicked_gonzo)
  begin
      feedback_pt_689 = wicked_gonzo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_ebay <= 1;
    else
      emu_ebay <= square_hagrid;
  end

always @(emu_ebay)
  begin
      feedback_pt_690 = emu_ebay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      victor_copper <= 1;
    else
      victor_copper <= raiders_louie;
  end

always @(victor_copper)
  begin
      feedback_pt_691 = victor_copper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blessyou_palm <= 1;
    else
      blessyou_palm <= honda_goofy;
  end

always @(blessyou_palm)
  begin
      feedback_pt_692 = blessyou_palm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_thor <= 0;
    else if (gnd)
      webvan_thor <= vcc;
  end

always @(webvan_thor)
  begin
      feedback_pt_693 = webvan_thor;
  end

wire aladdin_egg_wire;

dffeas aladdin_egg_ff (
  .clk(clock1),
  .d(rabbi_waffle),
  .ena(gnd),
  .sclr(vangoh_hinge),
  .sload(howell_eatem),
  .asdata(homer_pirate),
  .clrn(!reset1),
  .q(aladdin_egg_wire)
);

always @(aladdin_egg_wire) begin
   portnoy_lost = aladdin_egg_wire;
end

always @(portnoy_lost)
  begin
      feedback_pt_694 = portnoy_lost;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vangoh_lovey <= 1;
    else
      vangoh_lovey <= avon_giants;
  end

always @(vangoh_lovey)
  begin
      feedback_pt_695 = vangoh_lovey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popacap_goofy <= 1;
    else
      popacap_goofy <= giraffe_hp;
  end

always @(popacap_goofy)
  begin
      feedback_pt_696 = popacap_goofy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      brian_cuanto <= 1;
    else
      brian_cuanto <= rarest_newt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xray_arcade <= 0;
    else
      xray_arcade <= siamese_rojas;
  end

wire yoda_cubish_wire;

dffeas yoda_cubish_ff (
  .clk(clock1),
  .d(nigiri_chuck),
  .ena(rose_vangoh),
  .sclr(burrito_venus),
  .sload(wine_amadeus),
  .asdata(butthead_duey),
  .clrn(!reset1),
  .q(yoda_cubish_wire)
);

always @(yoda_cubish_wire) begin
   willy_lxtcen = yoda_cubish_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fsncens_draco <= 1;
    else
      fsncens_draco <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intuit_nyquil <= 0;
    else
      intuit_nyquil <= ykocens_kana;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pyro_yummy <= 1;
    else
      pyro_yummy <= curie_vicks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wicked_desade <= 1;
    else
      wicked_desade <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      scotland_over <= 0;
    else if (otter_warlock)
      scotland_over <= rubeus_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      century_delta <= 0;
    else if (mickey_willy)
      century_delta <= 0;
    else if (ernie_spyro)
      century_delta <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      naproxen_loud <= 0;
    else if (mortar_school)
      naproxen_loud <= 0;
    else if (beavis_kbtoys)
      naproxen_loud <= raiders_loser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_narcissa <= 0;
    else if (gnd)
      rose_narcissa <= 0;
    else if (moe_maritime)
      rose_narcissa <= rerun_marker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      erncenso_mine <= 0;
    else if (spirit_norris)
      erncenso_mine <= zed_erncenso;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hercules_opus <= 0;
    else if (gnd)
      hercules_opus <= pirate_flew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crack_sortout <= 1;
    else
      crack_sortout <= neville_xterm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_ykocens <= 0;
    else if (rose_narcissa)
      meth_ykocens <= moulin_Iwin;
  end

wire bach_salami_wire;

dffeas bach_salami_ff (
  .clk(clock1),
  .d(fronds_lxtcen),
  .ena(escape_star),
  .sclr(vcc),
  .sload(lion_hotdog),
  .asdata(escape_acid),
  .clrn(!reset1),
  .q(bach_salami_wire)
);

always @(bach_salami_wire) begin
   salmon_wood = bach_salami_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_comrade <= 0;
    else if (honda_goofy)
      life_comrade <= 0;
    else if (vcc)
      life_comrade <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      babette_chuck <= 1;
    else
      babette_chuck <= money_picture;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_ceres <= 0;
    else if (remus_peta)
      sogood_ceres <= 0;
    else if (romex_pyro)
      sogood_ceres <= intuit_nyquil;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_tylenol <= 0;
    else if (hercules_opus)
      often_tylenol <= copper_due;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shark_pork <= 0;
    else if (england_red)
      shark_pork <= clay_marco;
    else if (donald_dig)
      shark_pork <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quail_shemp <= 1;
    else
      quail_shemp <= bison_gotone;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tortilla_red <= 0;
    else if (po_yeanyow)
      tortilla_red <= 0;
    else if (gnd)
      tortilla_red <= intuit_nyquil;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      alpha_black <= 0;
    else if (romex_ginger)
      alpha_black <= copper_due;
    else if (chowmein_guy)
      alpha_black <= 0;
  end

wire cat_whiskey_wire;

dffeas cat_whiskey_ff (
  .clk(clock1),
  .d(protest_goofy),
  .ena(fallen_pyro),
  .sclr(sanity_minnie),
  .sload(moe_stroop),
  .asdata(stix_iterate),
  .clrn(!reset1),
  .q(cat_whiskey_wire)
);

always @(cat_whiskey_wire) begin
   ebi_bert = cat_whiskey_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      amadeus_stick <= 0;
    else if (peaves_hut)
      amadeus_stick <= 0;
    else if (babette_chuck)
      amadeus_stick <= sapporo_chuck;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elian_heidi <= 0;
    else if (willy_emails)
      elian_heidi <= 0;
    else if (po_yeanyow)
      elian_heidi <= webvan_bubba;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whale_elguapo <= 0;
    else if (pcp_valve)
      whale_elguapo <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moses_dig <= 0;
    else
      moses_dig <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_marvin <= 0;
    else if (homer_egg)
      rose_marvin <= 0;
    else if (pyro_yummy)
      rose_marvin <= duck_wood;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugie_diagon <= 0;
    else if (crab_golf)
      drugie_diagon <= vcc;
    else if (bison_midas)
      drugie_diagon <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_rufus <= 1;
    else
      pixie_rufus <= escape_questo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      century_vegas <= 0;
    else if (gnd)
      century_vegas <= nail_north;
  end

wire aphid_pluto_wire;

dffeas aphid_pluto_ff (
  .clk(clock1),
  .d(tortilla_red),
  .ena(hp_zeus),
  .sclr(curie_cheez),
  .sload(animal_danger),
  .asdata(wicked_gonzo),
  .clrn(!reset1),
  .q(aphid_pluto_wire)
);

always @(aphid_pluto_wire) begin
   taoist_dipsy = aphid_pluto_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      barty_maryann <= 0;
    else if (naproxen_loud)
      barty_maryann <= xterm_wakey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_cannon <= 0;
    else if (pork_mine)
      lala_cannon <= larry_alpha;
  end

wire klaas_tesla_wire;

dffeas klaas_tesla_ff (
  .clk(clock1),
  .d(gnd),
  .ena(curie_vicks),
  .sclr(hulk_feynman),
  .sload(neon_snape),
  .asdata(rubik_palmer),
  .clrn(!reset1),
  .q(klaas_tesla_wire)
);

always @(klaas_tesla_wire) begin
   naproxen_blue = klaas_tesla_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pyro_booming <= 0;
    else
      pyro_booming <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ebi_madeye <= 0;
    else
      ebi_madeye <= wine_athena;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      doc_whoiswho <= 1;
    else
      doc_whoiswho <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      siamese_pyro <= 0;
    else if (vcc)
      siamese_pyro <= rarest_yummy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugs_chief <= 1;
    else
      drugs_chief <= whale_elguapo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      holland_zeus <= 1;
    else
      holland_zeus <= crab_popcorn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curious_vicks <= 0;
    else if (remus_fallen)
      curious_vicks <= siamese_pyro;
    else if (rose_marvin)
      curious_vicks <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      condit_bambi <= 0;
    else if (gnd)
      condit_bambi <= papyrus_lisa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      devotion_mao <= 0;
    else if (emu_ebay)
      devotion_mao <= 0;
    else if (doc_whoiswho)
      devotion_mao <= condit_bambi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      over_athena <= 1;
    else
      over_athena <= ernie_spyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minnow_potter <= 0;
    else if (vcc)
      minnow_potter <= atilla_hans;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grumpy_hotel <= 0;
    else
      grumpy_hotel <= tracy_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_willem <= 0;
    else if (zinc_zealot)
      sinew_willem <= lala_rojas;
  end

wire stoned_zeus_wire;

dffeas stoned_zeus_ff (
  .clk(clock1),
  .d(ebi_madeye),
  .ena(itchy_wukong),
  .sclr(east_boots),
  .sload(peta_zinc),
  .asdata(thankee_homer),
  .clrn(!reset1),
  .q(stoned_zeus_wire)
);

always @(stoned_zeus_wire) begin
   golf_pizza = stoned_zeus_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kebab_books <= 0;
    else if (sinew_rodent)
      kebab_books <= 0;
    else if (gnd)
      kebab_books <= over_athena;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dig_molokai <= 0;
    else if (rod_wiggles)
      dig_molokai <= 0;
    else if (pdiddy_tracy)
      dig_molokai <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whatelse_bull <= 0;
    else
      whatelse_bull <= soccer_viagra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_drugs <= 0;
    else
      lala_drugs <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nuclear_jonas <= 0;
    else if (alpha_black)
      nuclear_jonas <= moses_dig;
    else if (copper_due)
      nuclear_jonas <= 0;
  end

wire tobe_fear_wire;

dffeas tobe_fear_ff (
  .clk(clock1),
  .d(hulk_doobie),
  .ena(zen_firstpart),
  .sclr(rufus_black),
  .sload(rasp_green),
  .asdata(vcc),
  .clrn(!reset1),
  .q(tobe_fear_wire)
);

always @(tobe_fear_wire) begin
   rocks_lumber = tobe_fear_wire;
end

wire juliet_simasu_wire;

dffeas juliet_simasu_ff (
  .clk(clock1),
  .d(minnow_potter),
  .ena(cheez_zedong),
  .sclr(hinge_vegan),
  .sload(gnd),
  .asdata(gnd),
  .clrn(!reset1),
  .q(juliet_simasu_wire)
);

always @(juliet_simasu_wire) begin
   sheep_octapus = juliet_simasu_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      midas_balloon <= 0;
    else if (burning_tesla)
      midas_balloon <= 0;
    else if (vcc)
      midas_balloon <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      filch_rojas <= 0;
    else
      filch_rojas <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      husks_minnow <= 0;
    else if (lala_rojas)
      husks_minnow <= rufus_black;
    else if (rocks_lumber)
      husks_minnow <= 0;
  end

wire kang_howell_wire;

dffeas kang_howell_ff (
  .clk(clock1),
  .d(sand_lotus),
  .ena(erncenso_mine),
  .sclr(vcc),
  .sload(draco_rabbi),
  .asdata(popacap_goofy),
  .clrn(!reset1),
  .q(kang_howell_wire)
);

always @(kang_howell_wire) begin
   due_valve = kang_howell_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      alpha_zeus <= 0;
    else
      alpha_zeus <= newt_bear;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      extremist_due <= 0;
    else if (gnd)
      extremist_due <= 0;
    else if (webvan_books)
      extremist_due <= meth_athena;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sneezy_zulu <= 1;
    else
      sneezy_zulu <= rat_solder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      workhere_mao <= 0;
    else if (nobody_ebi)
      workhere_mao <= deuce_juliet;
  end

// Random combinatorial logic block
always@(*)
  begin
      castaway_bull = ~( ( ( ~( ~( ~( ~gnd ) ) | ~( ( ~( ~shrimp_eagle ^ ~alpha_black ) ) ) ) ) | ~( ~( ~( oldnavy_tin ) ) ) ) );
  end

  always@(*)
  begin
    intel_warlock = ( ( smack_ohno & ~bravo_hours ) ^ ~( kanji_mars ) ^ ~( ~jonas_aspirin ) ^ lala_rojas ^ ~zi_bloom & ~( ~holland_zeus ) & ~( ~advil_cocaine ) ) | ~( ~( ~( ~gnd & ~rum_partners ) ) ) ? rouge_plaster : ~( rescue_wakey );
  end
// State Mek captain_milo Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      captain_milo <= captain_milo_0;
    else
      case (captain_milo)
        captain_milo_0: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 3)
            captain_milo <= captain_milo_2;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 9)
            captain_milo <= captain_milo_7;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 11)
            captain_milo <= captain_milo_7;
          else
            captain_milo <= captain_milo_0;
          end
        captain_milo_1: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 15)
            captain_milo <= captain_milo_0;
          else
            captain_milo <= captain_milo_1;
          end
        captain_milo_2: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 1)
            captain_milo <= captain_milo_1;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 0)
            captain_milo <= captain_milo_4;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 11)
            captain_milo <= captain_milo_11;
          else
            captain_milo <= captain_milo_2;
          end
        captain_milo_3: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 8)
            captain_milo <= captain_milo_5;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 0)
            captain_milo <= captain_milo_10;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 6)
            captain_milo <= captain_milo_0;
          else
            captain_milo <= captain_milo_3;
          end
        captain_milo_4: begin
            captain_milo <= captain_milo_4;
          end
        captain_milo_5: begin
            captain_milo <= captain_milo_5;
          end
        captain_milo_6: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 4)
            captain_milo <= captain_milo_3;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 12)
            captain_milo <= captain_milo_0;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 13)
            captain_milo <= captain_milo_2;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 8)
            captain_milo <= captain_milo_6;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 7)
            captain_milo <= captain_milo_6;
          else
            captain_milo <= captain_milo_6;
          end
        captain_milo_7: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 15)
            captain_milo <= captain_milo_5;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 9)
            captain_milo <= captain_milo_1;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 10)
            captain_milo <= captain_milo_9;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 8)
            captain_milo <= captain_milo_1;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 5)
            captain_milo <= captain_milo_11;
          else
            captain_milo <= captain_milo_7;
          end
        captain_milo_8: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 13)
            captain_milo <= captain_milo_3;
          else
            captain_milo <= captain_milo_8;
          end
        captain_milo_9: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 8)
            captain_milo <= captain_milo_9;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 4)
            captain_milo <= captain_milo_10;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 6)
            captain_milo <= captain_milo_0;
          else
            captain_milo <= captain_milo_9;
          end
        captain_milo_10: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 13)
            captain_milo <= captain_milo_1;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 8)
            captain_milo <= captain_milo_0;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 14)
            captain_milo <= captain_milo_7;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 1)
            captain_milo <= captain_milo_11;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 11)
            captain_milo <= captain_milo_10;
          else
            captain_milo <= captain_milo_10;
          end
        captain_milo_11: begin
          if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 2)
            captain_milo <= captain_milo_8;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 4)
            captain_milo <= captain_milo_7;
          else if ({sogood_ceres,llama_eunice,subway_speed,rocks_lumber} == 5)
            captain_milo <= captain_milo_6;
          else
            captain_milo <= captain_milo_11;
          end
        default: captain_milo <= captain_milo_0;
      endcase
  end

// State Mek captain_milo Output logic
always @(captain_milo)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (captain_milo[3:1])
        captain_milo_0: begin
            gutter_giants = 0;
            shrimp_sogood = 1;
            crank_comtrex = 0;
            rose_martian = 1;
            water_crystal = 1;
            money_wiggles = 0;
            bloom_larry = 0;
            goblin_buddha = 1;
            drugs_drunken = 1;
            air_goat = 0;
            biker_school = 0;
            stapler_hulk = 1;
            hours_floride = 1;
            vadar_yoku = 0;
            pcp_tattoo = 0;
            golden_boots = 0;
          end
        captain_milo_1: begin
            gutter_giants = 0;
            shrimp_sogood = 1;
            crank_comtrex = 0;
            rose_martian = 0;
            water_crystal = 0;
            money_wiggles = 0;
            bloom_larry = 0;
            goblin_buddha = 1;
            drugs_drunken = 1;
            air_goat = 1;
            biker_school = 0;
            stapler_hulk = 0;
            hours_floride = 0;
            vadar_yoku = 0;
            pcp_tattoo = 0;
            golden_boots = 1;
          end
        captain_milo_2: begin
            gutter_giants = 1;
            shrimp_sogood = 1;
            crank_comtrex = 1;
            rose_martian = 1;
            water_crystal = 1;
            money_wiggles = 0;
            bloom_larry = 1;
            goblin_buddha = 1;
            drugs_drunken = 0;
            air_goat = 0;
            biker_school = 0;
            stapler_hulk = 1;
            hours_floride = 1;
            vadar_yoku = 0;
            pcp_tattoo = 1;
            golden_boots = 1;
          end
        captain_milo_3: begin
            gutter_giants = 1;
            shrimp_sogood = 0;
            crank_comtrex = 0;
            rose_martian = 0;
            water_crystal = 0;
            money_wiggles = 0;
            bloom_larry = 1;
            goblin_buddha = 0;
            drugs_drunken = 1;
            air_goat = 0;
            biker_school = 1;
            stapler_hulk = 0;
            hours_floride = 0;
            vadar_yoku = 0;
            pcp_tattoo = 1;
            golden_boots = 1;
          end
        captain_milo_4: begin
            gutter_giants = 0;
            shrimp_sogood = 1;
            crank_comtrex = 0;
            rose_martian = 0;
            water_crystal = 0;
            money_wiggles = 1;
            bloom_larry = 0;
            goblin_buddha = 0;
            drugs_drunken = 0;
            air_goat = 1;
            biker_school = 0;
            stapler_hulk = 1;
            hours_floride = 1;
            vadar_yoku = 0;
            pcp_tattoo = 1;
            golden_boots = 0;
          end
        captain_milo_5: begin
            gutter_giants = 0;
            shrimp_sogood = 1;
            crank_comtrex = 1;
            rose_martian = 1;
            water_crystal = 1;
            money_wiggles = 0;
            bloom_larry = 0;
            goblin_buddha = 0;
            drugs_drunken = 1;
            air_goat = 0;
            biker_school = 0;
            stapler_hulk = 0;
            hours_floride = 1;
            vadar_yoku = 0;
            pcp_tattoo = 1;
            golden_boots = 1;
          end
        default: begin
            gutter_giants = 0;
            shrimp_sogood = 0;
            crank_comtrex = 0;
            rose_martian = 1;
            water_crystal = 1;
            money_wiggles = 1;
            bloom_larry = 0;
            goblin_buddha = 1;
            drugs_drunken = 1;
            air_goat = 0;
            biker_school = 1;
            stapler_hulk = 1;
            hours_floride = 1;
            vadar_yoku = 0;
            pcp_tattoo = 0;
            golden_boots = 1;
          end
      endcase
  end

// 2 bit up counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {bravo_foliage,onion_egg} <= 0;
    else
      {bravo_foliage,onion_egg} <= {bravo_foliage,onion_egg} + 1;
  end

// 2s comp negate A
always @(wujing_rubik or bison_midas or dopey_pierre or vcc or pizza_tapered or hinge_nirish or sleepy_gin or testyour_duey)
  begin
    {drunken_paper,loud_bullet,lupin_bullet,cow_alpha,kilo_jxnbox} = - {wujing_rubik,bison_midas,dopey_pierre,vcc,pizza_tapered,hinge_nirish,sleepy_gin,testyour_duey};
  end

// XOR all of these bits together
always @(alpha_black or tasty_jjocen or klaas_oitcen or soccer_viagra or gnd or rum_thankee)
  begin
      rocks_killme = ^ {alpha_black,tasty_jjocen,klaas_oitcen,soccer_viagra,gnd,rum_thankee};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      safeway_egg <= 0;
    else
    case ({tracy_gyro,vcc})
       0 : safeway_egg <= safeway_egg;
       1 : safeway_egg <= safeway_egg;
       2 : safeway_egg <= safeway_egg;
       3 : safeway_egg <= safeway_egg;
       default : safeway_egg <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dutch_zebra <= 0;
    else
    case ({winner_cubish,think_would})
       0 : dutch_zebra <= fire_hiswife;
       1 : dutch_zebra <= dutch_zebra;
       2 : dutch_zebra <= dutch_zebra;
       3 : dutch_zebra <= lala_cannon;
       default : dutch_zebra <= 0;
    endcase
  end

reg feedback_pt_697;

always @(curious_vicks or feedback_pt_697)
  begin
      tobe_crystal =  curious_vicks | !feedback_pt_697;
  end

reg feedback_pt_698;

always @(sun_mrbill or feedback_pt_698)
  begin
      warlock_remus =  sun_mrbill &  feedback_pt_698;
  end

reg feedback_pt_699;

always @(happy_bear or feedback_pt_699)
  begin
      gutter_jcrew =  happy_bear ^  feedback_pt_699;
  end

reg feedback_pt_700;

always @(gnd or feedback_pt_700)
  begin
      jiminy_draco =  gnd | !feedback_pt_700;
  end

reg feedback_pt_701;

always @(stapler_hulk or feedback_pt_701)
  begin
      wine_money =  stapler_hulk ^ !feedback_pt_701;
  end

reg feedback_pt_702;

always @(blessyou_palm or feedback_pt_702)
  begin
      tonks_marquis =  blessyou_palm &  feedback_pt_702;
  end

reg feedback_pt_703;

always @(gnd or feedback_pt_703)
  begin
      wonton_guy = !gnd |  feedback_pt_703;
  end

reg feedback_pt_704;

always @(thankee_homer or feedback_pt_704)
  begin
      spock_cain = !thankee_homer | !feedback_pt_704;
  end

reg feedback_pt_705;

always @(rose_martian or feedback_pt_705)
  begin
      potato_bert = !rose_martian |  feedback_pt_705;
  end

reg feedback_pt_706;

always @(rodent_ford or feedback_pt_706)
  begin
      dragon_zen = !rodent_ford &  feedback_pt_706;
  end

reg feedback_pt_707;

always @(pirate_joseph or feedback_pt_707)
  begin
      float_severus =  pirate_joseph | !feedback_pt_707;
  end

reg feedback_pt_708;

always @(vcc or feedback_pt_708)
  begin
      troll_water = !vcc &  feedback_pt_708;
  end

reg feedback_pt_709;

always @(money_wiggles or feedback_pt_709)
  begin
      pierre_tasty = !money_wiggles | !feedback_pt_709;
  end

reg feedback_pt_710;

always @(gin_zhuang or feedback_pt_710)
  begin
      heidi_neville =  gin_zhuang |  feedback_pt_710;
  end

reg feedback_pt_711;

always @(vcc or feedback_pt_711)
  begin
      timmy_scotch =  vcc ^ !feedback_pt_711;
  end

reg feedback_pt_712;

always @(vcc or feedback_pt_712)
  begin
      heidi_deuce =  vcc | !feedback_pt_712;
  end

reg feedback_pt_713;

always @(att_hinge or feedback_pt_713)
  begin
      stroop_prison = !att_hinge ^  feedback_pt_713;
  end

reg feedback_pt_714;

always @(gnd or feedback_pt_714)
  begin
      jinyong_eagle = !gnd & !feedback_pt_714;
  end

reg feedback_pt_715;

always @(rabbi_waffle or feedback_pt_715)
  begin
      moulin_lizard = !rabbi_waffle &  feedback_pt_715;
  end

reg feedback_pt_716;

always @(nuclear_jonas or feedback_pt_716)
  begin
      kilo_waffle = !nuclear_jonas ^  feedback_pt_716;
  end

reg feedback_pt_717;

always @(biker_school or feedback_pt_717)
  begin
      newt_bach =  biker_school & !feedback_pt_717;
  end

reg feedback_pt_718;

always @(vcc or feedback_pt_718)
  begin
      starwars_rum =  vcc ^ !feedback_pt_718;
  end

reg feedback_pt_719;

always @(gnd or feedback_pt_719)
  begin
      spastic_haze =  gnd &  feedback_pt_719;
  end

reg feedback_pt_720;

always @(gnd or feedback_pt_720)
  begin
      ulysses_kappa =  gnd |  feedback_pt_720;
  end

reg feedback_pt_721;

always @(huhhuh_dow or feedback_pt_721)
  begin
      curly_frog = !huhhuh_dow | !feedback_pt_721;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_nirish <= 1;
    else
      money_nirish <= vcc;
  end

always @(money_nirish)
  begin
      feedback_pt_697 = money_nirish;
  end

always @(money_nirish)
  begin
      feedback_pt_698 = money_nirish;
  end

always @(money_nirish)
  begin
      feedback_pt_699 = money_nirish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eel_iceland <= 0;
    else if (vcc)
      eel_iceland <= eatem_pixie;
  end

always @(eel_iceland)
  begin
      feedback_pt_700 = eel_iceland;
  end

always @(eel_iceland)
  begin
      feedback_pt_701 = eel_iceland;
  end

always @(eel_iceland)
  begin
      feedback_pt_702 = eel_iceland;
  end

always @(eel_iceland)
  begin
      feedback_pt_703 = eel_iceland;
  end

always @(eel_iceland)
  begin
      feedback_pt_704 = eel_iceland;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_think <= 0;
    else if (gnd)
      salmon_think <= 0;
    else if (gnd)
      salmon_think <= arizona_newt;
  end

always @(salmon_think)
  begin
      feedback_pt_705 = salmon_think;
  end

always @(salmon_think)
  begin
      feedback_pt_706 = salmon_think;
  end

always @(salmon_think)
  begin
      feedback_pt_707 = salmon_think;
  end

always @(salmon_think)
  begin
      feedback_pt_708 = salmon_think;
  end

always @(salmon_think)
  begin
      feedback_pt_709 = salmon_think;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      plaster_isle <= 0;
    else if (oranje_beef)
      plaster_isle <= gutter_giants;
    else if (ocean_think)
      plaster_isle <= 0;
  end

always @(plaster_isle)
  begin
      feedback_pt_710 = plaster_isle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      woman_elian <= 0;
    else if (gnd)
      woman_elian <= jinyong_eagle;
  end

always @(woman_elian)
  begin
      feedback_pt_711 = woman_elian;
  end

always @(woman_elian)
  begin
      feedback_pt_712 = woman_elian;
  end

always @(woman_elian)
  begin
      feedback_pt_713 = woman_elian;
  end

always @(woman_elian)
  begin
      feedback_pt_714 = woman_elian;
  end

always @(woman_elian)
  begin
      feedback_pt_715 = woman_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      howell_dopey <= 0;
    else if (newt_bach)
      howell_dopey <= marquis_husks;
    else if (gnd)
      howell_dopey <= 0;
  end

always @(howell_dopey)
  begin
      feedback_pt_716 = howell_dopey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_nyc <= 0;
    else if (gnd)
      pcp_nyc <= gnd;
  end

always @(pcp_nyc)
  begin
      feedback_pt_717 = pcp_nyc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      trevor_beavis <= 0;
    else if (ebi_bert)
      trevor_beavis <= purple_vegan;
    else if (whatelse_bull)
      trevor_beavis <= 0;
  end

always @(trevor_beavis)
  begin
      feedback_pt_718 = trevor_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stick_budlite <= 0;
    else if (rocks_killme)
      stick_budlite <= hinge_vegan;
    else if (water_yummy)
      stick_budlite <= 0;
  end

always @(stick_budlite)
  begin
      feedback_pt_719 = stick_budlite;
  end

wire weevil_whammy_wire;

dffea weevil_whammy_ff (
  .clk(clock1),
  .d(life_comrade),
  .ena(tank_nhtcenso),
  .adata(moe_burning),
  .clrn(!reset1),
  .q(weevil_whammy_wire)
);

always @(weevil_whammy_wire) begin
   mortar_po = weevil_whammy_wire;
end

always @(mortar_po)
  begin
      feedback_pt_720 = mortar_po;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_bacon <= 0;
    else
      oldnavy_bacon <= quail_shemp;
  end

always @(oldnavy_bacon)
  begin
      feedback_pt_721 = oldnavy_bacon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zealot_tesla <= 0;
    else if (onion_egg)
      zealot_tesla <= mickey_willy;
    else if (blue_popcorn)
      zealot_tesla <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_gin <= 0;
    else if (vcc)
      advil_gin <= gnd;
    else if (vcc)
      advil_gin <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vicks_troll <= 0;
    else if (yoku_zed)
      vicks_troll <= 0;
    else if (madeye_badger)
      vicks_troll <= nigiri_donut;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      usa_lizard <= 0;
    else if (scotland_over)
      usa_lizard <= 0;
    else if (rat_solder)
      usa_lizard <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      desade_vegas <= 1;
    else
      desade_vegas <= ostrich_zi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pasta_wukong <= 0;
    else
      pasta_wukong <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kana_rerun <= 0;
    else if (heidi_neville)
      kana_rerun <= kilo_jxnbox;
    else if (gnd)
      kana_rerun <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_wizard <= 0;
    else if (ebi_bert)
      cain_wizard <= 0;
    else if (vcc)
      cain_wizard <= lagoon_ebay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goblin_drevil <= 0;
    else
      goblin_drevil <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gonzo_kmfdm <= 0;
    else if (sneezy_zulu)
      gonzo_kmfdm <= 0;
    else if (whale_elguapo)
      gonzo_kmfdm <= devotion_mao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      uppers_bull <= 0;
    else
      uppers_bull <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goat_ulysses <= 0;
    else if (gnd)
      goat_ulysses <= 0;
    else if (sugar_newt)
      goat_ulysses <= asahi_too_big;
  end

wire hp_safada_wire;

dffeas hp_safada_ff (
  .clk(clock1),
  .d(fury_mozart),
  .ena(often_faster),
  .sclr(moulin_lizard),
  .sload(fury_mozart),
  .asdata(dig_bambi),
  .clrn(!reset1),
  .q(hp_safada_wire)
);

always @(hp_safada_wire) begin
   blue_gonzo = hp_safada_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_curly <= 0;
    else if (thread_quail)
      art_curly <= maki_unicorn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      albus_zen <= 0;
    else
      albus_zen <= pasta_wukong;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fang_cuckoo <= 0;
    else if (lima_pictures)
      fang_cuckoo <= gnd;
    else if (warlock_remus)
      fang_cuckoo <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minerva_pcp <= 0;
    else
      minerva_pcp <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_desert <= 0;
    else if (shrimp_sogood)
      rerun_desert <= alpha_zeus;
    else if (woman_elian)
      rerun_desert <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goblin_bison <= 0;
    else if (fronds_shuda)
      goblin_bison <= sleepy_gin;
    else if (sheep_octapus)
      goblin_bison <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      baron_coconut <= 0;
    else if (vcc)
      baron_coconut <= vcc;
    else if (gnd)
      baron_coconut <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genji_att <= 0;
    else if (hercules_opus)
      genji_att <= fufu_eagle;
    else if (hagrid_zeus)
      genji_att <= 0;
  end

wire homer_babette_wire;

dffea homer_babette_ff (
  .clk(clock1),
  .d(often_tylenol),
  .ena(vcc),
  .adata(tinker_sierra),
  .clrn(!reset1),
  .q(homer_babette_wire)
);

always @(homer_babette_wire) begin
   often_foryou = homer_babette_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      icarus_cow <= 0;
    else if (golden_boots)
      icarus_cow <= 0;
    else if (pirate_joseph)
      icarus_cow <= bagel_howell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      venus_madeye <= 0;
    else if (safeway_egg)
      venus_madeye <= 0;
    else if (zedong_nyc)
      venus_madeye <= plaster_isle;
  end

wire nigiri_delta_wire;

dffeas nigiri_delta_ff (
  .clk(clock1),
  .d(vcc),
  .ena(woman_elian),
  .sclr(falafel_sun),
  .sload(curie_vicks),
  .asdata(pirate_joseph),
  .clrn(!reset1),
  .q(nigiri_delta_wire)
);

always @(nigiri_delta_wire) begin
   giants_romex = nigiri_delta_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheese_gap <= 0;
    else if (bfi_curious)
      cheese_gap <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maki_maryann <= 1;
    else
      maki_maryann <= tank_nhtcenso;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quail_lao <= 0;
    else if (gnd)
      quail_lao <= rodent_ford;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_athena <= 0;
    else if (potter_zealot)
      lala_athena <= 0;
    else if (lupin_bullet)
      lala_athena <= advil_gin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacuzzi_cow <= 1;
    else
      jacuzzi_cow <= dragon_zen;
  end

wire frog_umbridge_wire;

dffeas frog_umbridge_ff (
  .clk(clock1),
  .d(heidi_school),
  .ena(crank_star),
  .sclr(wonder_luthor),
  .sload(cheese_gap),
  .asdata(vcc),
  .clrn(!reset1),
  .q(frog_umbridge_wire)
);

always @(frog_umbridge_wire) begin
   red_gilligan = frog_umbridge_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sgates_lupin <= 1;
    else
      sgates_lupin <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ants_gap <= 0;
    else if (webvan_doc)
      ants_gap <= often_foryou;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roid_att <= 0;
    else if (red_gilligan)
      roid_att <= stick_budlite;
    else if (water_yummy)
      roid_att <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      athena_onion <= 0;
    else
      athena_onion <= atomic_joker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ginger_supurb <= 0;
    else if (vcc)
      ginger_supurb <= drugie_diagon;
    else if (athena_onion)
      ginger_supurb <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_meffert <= 1;
    else
      star_meffert <= tapered_dig;
  end

wire armand_smack_wire;

dffeas armand_smack_ff (
  .clk(clock1),
  .d(workhere_mao),
  .ena(gnd),
  .sclr(bloom_batman),
  .sload(cain_wizard),
  .asdata(lupin_bullet),
  .clrn(!reset1),
  .q(armand_smack_wire)
);

always @(armand_smack_wire) begin
   yoku_bono = armand_smack_wire;
end

wire palm_erasmus_wire;

dffeas palm_erasmus_ff (
  .clk(clock1),
  .d(mortar_alpha),
  .ena(usa_lizard),
  .sclr(potato_rod),
  .sload(vcc),
  .asdata(dadada_rescue),
  .clrn(!reset1),
  .q(palm_erasmus_wire)
);

always @(palm_erasmus_wire) begin
   red_issac = palm_erasmus_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      legos_cow <= 0;
    else if (art_curly)
      legos_cow <= huhhuh_smack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      valve_salami <= 0;
    else
      valve_salami <= jacques_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      uppers_att <= 0;
    else if (amadeus_stick)
      uppers_att <= victor_copper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lucent_animal <= 0;
    else if (vcc)
      lucent_animal <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      illegal_vadar <= 0;
    else
      illegal_vadar <= century_delta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      flew_coffee <= 0;
    else if (spastic_haze)
      flew_coffee <= webvan_doc;
    else if (crack_sortout)
      flew_coffee <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zealot_elian <= 1;
    else
      zealot_elian <= ostrich_zi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lupin_moreand <= 0;
    else if (vcc)
      lupin_moreand <= gnd;
    else if (loud_brian)
      lupin_moreand <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bush_isle <= 0;
    else if (vcc)
      bush_isle <= 0;
    else if (venus_madeye)
      bush_isle <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ring_meth <= 0;
    else if (fsncens_draco)
      ring_meth <= armand_tesla;
  end

wire ebay_boing_wire;

dffeas ebay_boing_ff (
  .clk(clock1),
  .d(vcc),
  .ena(crab_golf),
  .sclr(flew_coffee),
  .sload(mortar_po),
  .asdata(gnd),
  .clrn(!reset1),
  .q(ebay_boing_wire)
);

always @(ebay_boing_wire) begin
   ants_Iwin = ebay_boing_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mickey_hummer <= 0;
    else if (papyrus_huey)
      mickey_hummer <= 0;
    else if (drugs_drunken)
      mickey_hummer <= homer_egg;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceecensor_gap <= 1;
    else
      ceecensor_gap <= intel_warlock;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peace_solder <= 0;
    else
      peace_solder <= ceres_mars;
  end

wire october_jonas_wire;

dffeas october_jonas_ff (
  .clk(clock1),
  .d(float_severus),
  .ena(uniform_crank),
  .sclr(att_hinge),
  .sload(vcc),
  .asdata(gnd),
  .clrn(!reset1),
  .q(october_jonas_wire)
);

always @(october_jonas_wire) begin
   wakey_ham = october_jonas_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      centaur_black <= 0;
    else if (gnd)
      centaur_black <= 0;
    else if (spastic_pilot)
      centaur_black <= mao_pacbell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      junkie_duck <= 0;
    else if (dragon_broom)
      junkie_duck <= vcc;
    else if (vcc)
      junkie_duck <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gojira_huhhuh <= 1;
    else
      gojira_huhhuh <= often_faster;
  end

wire ebi_cheese_wire;

dffeas ebi_cheese_ff (
  .clk(clock1),
  .d(dig_fsncens),
  .ena(pcp_waster),
  .sclr(vcc),
  .sload(dragon_broom),
  .asdata(lima_pictures),
  .clrn(!reset1),
  .q(ebi_cheese_wire)
);

always @(ebi_cheese_wire) begin
   marvin_hours = ebi_cheese_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_jason <= 0;
    else if (doc_pictures)
      mao_jason <= vcc;
    else if (gnd)
      mao_jason <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nobody_east <= 0;
    else
      nobody_east <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      floo_voodoo <= 0;
    else if (legos_cow)
      floo_voodoo <= 0;
    else if (eggsalad_dirk)
      floo_voodoo <= neville_xray;
  end

// NOR all of these bits together
always @(waster_minnie or money_nirish or mao_jason or naproxen_blue or troll_water)
  begin
      foxtrot_gonzo = ~| {waster_minnie,money_nirish,mao_jason,naproxen_blue,troll_water};
  end

// 3 bit SOP selector
always @(
        turkey_tank or vcc  or 
        green_eeevil or husks_minnow  or 
        ring_meth or gnd 
)

begin
    drugs_bullet = 
      turkey_tank & vcc |
      green_eeevil & husks_minnow |
      ring_meth & gnd;
end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rocks_batman <= 0;
    else
    case ({helena_rubik,ants_gap})
       0 : rocks_batman <= rocks_batman;
       1 : rocks_batman <= golden_boots;
       2 : rocks_batman <= rocks_batman;
       3 : rocks_batman <= rocks_batman;
       default : rocks_batman <= 0;
    endcase
  end

// OR all of these bits together
always @(drugs_chief or vegas_clay or wicked_gonzo or zedong_eunice or illegal_vadar)
  begin
      newt_gin = | {drugs_chief,vegas_clay,wicked_gonzo,zedong_eunice,illegal_vadar};
  end

// 7 bit priority MUX
always @(
        webvan_doc or newt_gin  or 
        cannon_hanger or dig_molokai  or 
        vcc or drugs_bullet  or 
        vcc or shark_pork  or 
        gnd or iron_wonton  or 
        illegal_vadar or bison_donut  or 
        gnd or gnd 
)

  begin
    if (webvan_doc) shrimp_priest = newt_gin;
    else if (cannon_hanger) shrimp_priest = dig_molokai;
    else if (vcc) shrimp_priest = drugs_bullet;
    else if (vcc) shrimp_priest = shark_pork;
    else if (gnd) shrimp_priest = iron_wonton;
    else if (illegal_vadar) shrimp_priest = bison_donut;
    else if (gnd) shrimp_priest = gnd;
    else shrimp_priest = 0;
  end


// building a 128 to 1 MUX operator
reg [127:0] animal_what_mux_dat;
reg [6:0] animal_what_mux_sel;
always @(filch_rojas or gnd or gnd or lupin_moreand or papyrus_huey or curly_frog or jiminy_draco or bacon_nest or vcc or giraffe_hp or whiskey_bambi or wine_money or suffering_pig or pork_balloon or bfs_star or gnd or wicked_gonzo or hercules_opus or zealot_tesla or woman_elian or wine_amadeus or pixie_rufus or yoku_bono or elian_heidi or mickey_hummer or llama_eunice or vcc or gnd or asahi_too_big or gnd or loud_bullet or gnd or wonder_luthor or louie_mideast or stroop_prison or tank_eagle or gnd or hercules_opus or goat_ulysses or zealot_elian or joker_gotone or vcc or nobody_east or cuckoo_cuckoo or larry_advil or mickey_willy or trevor_beavis or ebay_ihilani or huey_banality or lima_pictures or gnd or floo_voodoo or arizona_water or gnd or golden_candle or ginger_hinge or burrito_venus or rocks_killme or lucent_animal or ginger_supurb or vcc or spirit_bust or ants_gap or rose_narcissa or spastic_pilot or doc_whoiswho or gnd or grumpy_hotel or vcc or trevor_beavis or brian_cuanto or wine_sand or tango_lala or flew_valve or hulk_kaisha or quail_shemp or wakey_zebra or genji_att or goblin_bison or gnd or paper_yoku or nigiri_donut or whale_elguapo or star_meffert or green_sortout or wine_money or kana_rerun or rose_marvin or vcc or bush_isle or gnd or gnd or junkie_duck or gnd or bloom_larry or vcc or yoku_bono or gulp_oitcen or bfi_quebec or wakey_ham or turkey_ohno or emu_ebay or ebi_bert or loud_bullet or turkey_ohno or roid_att or bravo_foliage or atomic_joker or rerun_desert or elian_heidi or kebab_books or vcc or ceres_bep or whammy_green or crank_star or gnd or bach_thankee or atomic_joker or minerva_pcp or sneezy_zealot or pirate_joseph or whammy_kabar or sinew_willem or gnd or helena_rubik or gnd or gnd or icarus_cow)
  begin
    animal_what_mux_dat = {filch_rojas,gnd,gnd,lupin_moreand,papyrus_huey,curly_frog,jiminy_draco,bacon_nest,vcc,giraffe_hp,whiskey_bambi,wine_money,suffering_pig,pork_balloon,bfs_star,gnd,wicked_gonzo,hercules_opus,zealot_tesla,woman_elian,wine_amadeus,pixie_rufus,yoku_bono,elian_heidi,mickey_hummer,llama_eunice,vcc,gnd,asahi_too_big,gnd,loud_bullet,gnd,wonder_luthor,louie_mideast,stroop_prison,tank_eagle,gnd,hercules_opus,goat_ulysses,zealot_elian,joker_gotone,vcc,nobody_east,cuckoo_cuckoo,larry_advil,mickey_willy,trevor_beavis,ebay_ihilani,huey_banality,lima_pictures,gnd,floo_voodoo,arizona_water,gnd,golden_candle,ginger_hinge,burrito_venus,rocks_killme,lucent_animal,ginger_supurb,vcc,spirit_bust,ants_gap,rose_narcissa,spastic_pilot,doc_whoiswho,gnd,grumpy_hotel,vcc,trevor_beavis,brian_cuanto,wine_sand,tango_lala,flew_valve,hulk_kaisha,quail_shemp,wakey_zebra,genji_att,goblin_bison,gnd,paper_yoku,nigiri_donut,whale_elguapo,star_meffert,green_sortout,wine_money,kana_rerun,rose_marvin,vcc,bush_isle,gnd,gnd,junkie_duck,gnd,bloom_larry,vcc,yoku_bono,gulp_oitcen,bfi_quebec,wakey_ham,turkey_ohno,emu_ebay,ebi_bert,loud_bullet,turkey_ohno,roid_att,bravo_foliage,atomic_joker,rerun_desert,elian_heidi,kebab_books,vcc,ceres_bep,whammy_green,crank_star,gnd,bach_thankee,atomic_joker,minerva_pcp,sneezy_zealot,pirate_joseph,whammy_kabar,sinew_willem,gnd,helena_rubik,gnd,gnd,icarus_cow};
  end

always @(wonder_luthor or pcp_waster or chuck_tattoo or mars_monkey or vcc or gnd or clay_marco)
  begin
    animal_what_mux_sel = {wonder_luthor,pcp_waster,chuck_tattoo,mars_monkey,vcc,gnd,clay_marco};
  end

always @(animal_what_mux_dat or animal_what_mux_sel)
  begin
    opus_geisha = animal_what_mux_dat[animal_what_mux_sel];
  end

// XNOR all of these bits together
always @(gnd or dutch_zebra or gnd or stroop_bart or rod_wiggles or art_curly)
  begin
      advil_clay = ~^ {gnd,dutch_zebra,gnd,stroop_bart,rod_wiggles,art_curly};
  end

// 6 bit priority MUX
always @(
        spock_cain or newt_bach  or 
        waster_minnie or kilo_marge  or 
        valve_salami or naproxen_blue  or 
        lotus_sgates or lala_drugs  or 
        gnd or vegas_emails  or 
        joseph_deuce or rubik_palmer 
)

  begin
    if (spock_cain) louie_fsncens = newt_bach;
    else if (waster_minnie) louie_fsncens = kilo_marge;
    else if (valve_salami) louie_fsncens = naproxen_blue;
    else if (lotus_sgates) louie_fsncens = lala_drugs;
    else if (gnd) louie_fsncens = vegas_emails;
    else if (joseph_deuce) louie_fsncens = rubik_palmer;
    else louie_fsncens = 0;
  end

// 4 bit priority MUX
always @(
        jacuzzi_cow or taoist_dipsy  or 
        bull_rufus or vcc  or 
        castaway_bull or gnd  or 
        gnd or prison_star 
)

  begin
    if (jacuzzi_cow) gokidsgo_zeus = taoist_dipsy;
    else if (bull_rufus) gokidsgo_zeus = vcc;
    else if (castaway_bull) gokidsgo_zeus = gnd;
    else if (gnd) gokidsgo_zeus = prison_star;
    else gokidsgo_zeus = 0;
  end

// XNOR all of these bits together
always @(drunken_paper or jacques_macys or deng_love_in)
  begin
      kbtoys_danger = ~^ {drunken_paper,jacques_macys,deng_love_in};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yellow_marco <= 0;
    else
    case ({vcc,gnd})
       0 : yellow_marco <= yellow_marco;
       1 : yellow_marco <= vangoh_lovey;
       2 : yellow_marco <= babette_chuck;
       3 : yellow_marco <= yellow_marco;
       default : yellow_marco <= 0;
    endcase
  end

// AND all of these bits together
always @(gnd or whale_elguapo or tonks_marquis or psycho_danger or xterm_wakey or timmy_scotch or wonton_guy or portnoy_lost or vcc)
  begin
      troll_coffee = & {gnd,whale_elguapo,tonks_marquis,psycho_danger,xterm_wakey,timmy_scotch,wonton_guy,portnoy_lost,vcc};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      abel_dingbat <= 0;
    else
    case ({ulysses_kappa,spain_nail})
       0 : abel_dingbat <= abel_dingbat;
       1 : abel_dingbat <= abel_dingbat;
       2 : abel_dingbat <= abel_dingbat;
       3 : abel_dingbat <= abel_dingbat;
       default : abel_dingbat <= 0;
    endcase
  end

// OR all of these bits together
always @(albus_zen or xray_arcade or sinew_willem or armand_tesla or maki_unicorn or troll_coffee or vcc)
  begin
      frog_palm = | {albus_zen,xray_arcade,sinew_willem,armand_tesla,maki_unicorn,troll_coffee,vcc};
  end


// building a 128 to 1 MUX operator
reg [127:0] rabbi_soccer_mux_dat;
reg [6:0] rabbi_soccer_mux_sel;
always @(yellow_marco or golden_candle or ants_gap or gonzo_kmfdm or kbtoys_danger or louie_fsncens or sinew_willem or uniform_crank or gnd or rodent_badger or joseph_deuce or vcc or vcc or spirit_norris or ostrich_zi or gnd or jason_emu or art_potato or heidi_deuce or loud_art or gnd or zinc_foxtrot or tofu_bonker or zinc_zealot or howell_dopey or vcc or gnd or biker_homer or due_valve or bep_rafting or sgates_lupin or giants_romex or wonder_luthor or green_sortout or art_potato or spirit_bust or thread_quail or butthead_duey or egg_hinge or quail_lao or vcc or jonas_aspirin or elian_heidi or gnd or vicks_troll or vcc or kilo_jxnbox or naproxen_blue or neville_xray or sneezy_junkie or doc_copper or loud_art or thread_quail or vcc or aspirin_papa or ants_Iwin or tapered_xray or goblin_buddha or vcc or would_chips or gokidsgo_zeus or arthur_att or vcc or deng_love_in or vcc or ceres_mars or drugs_chief or castaway_bull or ceres_bep or bach_thankee or vcc or gnd or century_vegas or vcc or float_severus or gnd or louie_fsncens or vcc or gnd or bach_thankee or gnd or wicked_desade or pirate_joseph or lima_pictures or rodent_badger or zealot_elian or ants_gap or ceres_mars or heidi_deuce or mortar_po or what_eel or curie_vicks or yoku_zed or valve_salami or ibm_ykocens or riddler_stix or hagrid_zeus or egg_hinge or joseph_deuce or salmon_wood or elian_heidi or kilo_waffle or lemon_tapered or jonas_aspirin or nyc_witch or moulin_Iwin or drax_timmy or waster_minnie or grumpy_hotel or pyro_booming or gulp_oitcen or gnd or vcc or pyro_booming or icarus_cow or gnd or crank_comtrex or stroop_bart or bull_rufus or gnd or vangoh_lovey or goat_ulysses or gyro_copper or webvan_thor or marvin_hours or genji_att or draco_moulin or vcc)
  begin
    rabbi_soccer_mux_dat = {yellow_marco,golden_candle,ants_gap,gonzo_kmfdm,kbtoys_danger,louie_fsncens,sinew_willem,uniform_crank,gnd,rodent_badger,joseph_deuce,vcc,vcc,spirit_norris,ostrich_zi,gnd,jason_emu,art_potato,heidi_deuce,loud_art,gnd,zinc_foxtrot,tofu_bonker,zinc_zealot,howell_dopey,vcc,gnd,biker_homer,due_valve,bep_rafting,sgates_lupin,giants_romex,wonder_luthor,green_sortout,art_potato,spirit_bust,thread_quail,butthead_duey,egg_hinge,quail_lao,vcc,jonas_aspirin,elian_heidi,gnd,vicks_troll,vcc,kilo_jxnbox,naproxen_blue,neville_xray,sneezy_junkie,doc_copper,loud_art,thread_quail,vcc,aspirin_papa,ants_Iwin,tapered_xray,goblin_buddha,vcc,would_chips,gokidsgo_zeus,arthur_att,vcc,deng_love_in,vcc,ceres_mars,drugs_chief,castaway_bull,ceres_bep,bach_thankee,vcc,gnd,century_vegas,vcc,float_severus,gnd,louie_fsncens,vcc,gnd,bach_thankee,gnd,wicked_desade,pirate_joseph,lima_pictures,rodent_badger,zealot_elian,ants_gap,ceres_mars,heidi_deuce,mortar_po,what_eel,curie_vicks,yoku_zed,valve_salami,ibm_ykocens,riddler_stix,hagrid_zeus,egg_hinge,joseph_deuce,salmon_wood,elian_heidi,kilo_waffle,lemon_tapered,jonas_aspirin,nyc_witch,moulin_Iwin,drax_timmy,waster_minnie,grumpy_hotel,pyro_booming,gulp_oitcen,gnd,vcc,pyro_booming,icarus_cow,gnd,crank_comtrex,stroop_bart,bull_rufus,gnd,vangoh_lovey,goat_ulysses,gyro_copper,webvan_thor,marvin_hours,genji_att,draco_moulin,vcc};
  end

always @(egg_hinge or mortar_alpha or taoist_dipsy or vcc or quail_lao or vcc or drugs_chief)
  begin
    rabbi_soccer_mux_sel = {egg_hinge,mortar_alpha,taoist_dipsy,vcc,quail_lao,vcc,drugs_chief};
  end

always @(rabbi_soccer_mux_dat or rabbi_soccer_mux_sel)
  begin
    moron_ham = rabbi_soccer_mux_dat[rabbi_soccer_mux_sel];
  end

// NAND all of these bits together
always @(square_hagrid or hinge_nirish or gnd or tonks_marquis or kilo_star or waster_minnie or wonton_guy or green_sortout or joseph_deuce or peace_solder or plaster_isle or vadar_yoku)
  begin
      elf_stirfry = ~& {square_hagrid,hinge_nirish,gnd,tonks_marquis,kilo_star,waster_minnie,wonton_guy,green_sortout,joseph_deuce,peace_solder,plaster_isle,vadar_yoku};
  end


// building a 8 to 1 MUX operator
reg [7:0] sgates_amex_mux_dat;
reg [2:0] sgates_amex_mux_sel;
always @(vcc or touch_homerun or zinc_zealot or gnd or wonton_guy or gnd or psycho_eagle or gnd)
  begin
    sgates_amex_mux_dat = {vcc,touch_homerun,zinc_zealot,gnd,wonton_guy,gnd,psycho_eagle,gnd};
  end

always @(ebi_bert or hurt_pluto or drugs_chief)
  begin
    sgates_amex_mux_sel = {ebi_bert,hurt_pluto,drugs_chief};
  end

always @(sgates_amex_mux_dat or sgates_amex_mux_sel)
  begin
    tobe_priest = sgates_amex_mux_dat[sgates_amex_mux_sel];
  end

// NOR all of these bits together
always @(fronds_lxtcen or gnd or albus_zen or vcc or kilo_marge or bfi_curious or aspirin_papa or vcc or potato_bert or fang_cuckoo or vcc)
  begin
      lucent_grumpy = ~| {fronds_lxtcen,gnd,albus_zen,vcc,kilo_marge,bfi_curious,aspirin_papa,vcc,potato_bert,fang_cuckoo,vcc};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_haze <= 0;
    else
    case ({bfi_quebec,usa_lizard})
       0 : curie_haze <= curie_haze;
       1 : curie_haze <= shrimp_priest;
       2 : curie_haze <= curie_haze;
       3 : curie_haze <= fronds_lxtcen;
       default : curie_haze <= 0;
    endcase
  end

// Greater Equal Less compare
always @(vcc or crab_crayons or boing_comtrex or cain_floride or vcc or opus_geisha)
  begin
    if ({vcc,crab_crayons,boing_comtrex} > {cain_floride,vcc,opus_geisha})
       {peta_mickey,mao_att,vadar_army} = 3'b100;
    else if ({vcc,crab_crayons,boing_comtrex} < {cain_floride,vcc,opus_geisha})
       {peta_mickey,mao_att,vadar_army} = 3'b010;
    else
       {peta_mickey,mao_att,vadar_army} = 3'b001;
  end


// building a 8 to 1 MUX operator
reg [7:0] howell_nation_mux_dat;
reg [2:0] howell_nation_mux_sel;
always @(foxtrot_gonzo or vcc or lupin_moreand or bach_thankee or timmy_scotch or webvan_thor or fufu_eagle or gnd)
  begin
    howell_nation_mux_dat = {foxtrot_gonzo,vcc,lupin_moreand,bach_thankee,timmy_scotch,webvan_thor,fufu_eagle,gnd};
  end

always @(aphid_diagon or curie_haze or meth_ykocens)
  begin
    howell_nation_mux_sel = {aphid_diagon,curie_haze,meth_ykocens};
  end

always @(howell_nation_mux_dat or howell_nation_mux_sel)
  begin
    goblin_snape = howell_nation_mux_dat[howell_nation_mux_sel];
  end

// 5 bit priority MUX
always @(
        vcc or pcp_nyc  or 
        gnd or tapered_xray  or 
        pcp_moonraker or gnd  or 
        desade_vegas or luthor_turtle  or 
        pierre_tasty or oldnavy_bacon 
)

  begin
    if (vcc) tracy_numbers = pcp_nyc;
    else if (gnd) tracy_numbers = tapered_xray;
    else if (pcp_moonraker) tracy_numbers = gnd;
    else if (desade_vegas) tracy_numbers = luthor_turtle;
    else if (pierre_tasty) tracy_numbers = oldnavy_bacon;
    else tracy_numbers = 0;
  end

// AND all of these bits together
always @(salmon_wood or centaur_black or fronds_shuda or blue_gonzo)
  begin
      madeye_maki = & {salmon_wood,centaur_black,fronds_shuda,blue_gonzo};
  end


initial begin
    {ceres_crab,noah_yellow,gopher_cheez} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (meth_ykocens)
      {ceres_crab,noah_yellow,gopher_cheez} <= 0;
    else if (touch_homerun)
      {ceres_crab,noah_yellow,gopher_cheez} <=
		  {vcc,huhhuh_dow,lala_athena};
    else
      {ceres_crab,noah_yellow,gopher_cheez} <=
		 {extremist_due,vcc,opus_geisha} + 
		 {sgates_lupin,crab_crayons,due_valve};
  end


// building a 16 to 1 MUX operator
reg [15:0] wrecker_lsd_mux_dat;
reg [3:0] wrecker_lsd_mux_sel;
always @(crab_popcorn or frog_palm or hurt_pluto or crank_star or uppers_bull or icarus_cow or elian_heidi or mao_att or tracy_numbers or gnd or willy_lxtcen or maki_maryann or eel_iceland or golfland_rose or gnd or fang_cuckoo)
  begin
    wrecker_lsd_mux_dat = {crab_popcorn,frog_palm,hurt_pluto,crank_star,uppers_bull,icarus_cow,elian_heidi,mao_att,tracy_numbers,gnd,willy_lxtcen,maki_maryann,eel_iceland,golfland_rose,gnd,fang_cuckoo};
  end

always @(gnd or kilo_marge or money_picture or newt_cheese)
  begin
    wrecker_lsd_mux_sel = {gnd,kilo_marge,money_picture,newt_cheese};
  end

always @(wrecker_lsd_mux_dat or wrecker_lsd_mux_sel)
  begin
    huhhuh_wujing = wrecker_lsd_mux_dat[wrecker_lsd_mux_sel];
  end

// AND all of these bits together
always @(bull_rufus or gnd)
  begin
      stix_comrade = & {bull_rufus,gnd};
  end


initial begin
    {might_popacap,juliet_west,peaves_pilot} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (gnd)
      {might_popacap,juliet_west,peaves_pilot} <= 0;
    else if (boing_comtrex)
      {might_popacap,juliet_west,peaves_pilot} <=
		  {huhhuh_wujing,oldnavy_bacon,vcc};
    else
      {might_popacap,juliet_west,peaves_pilot} <=
		 {float_severus,castaway_bull,starwars_rum} + 
		 {gnd,elf_stirfry,gnd};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_beast <= 0;
    else
    case ({gnd,frog_palm})
       0 : west_beast <= gnd;
       1 : west_beast <= west_beast;
       2 : west_beast <= west_beast;
       3 : west_beast <= west_beast;
       default : west_beast <= 0;
    endcase
  end

// NOR all of these bits together
always @(peaves_pilot or gnd or opus_geisha or dweebie_elian)
  begin
      tesla_think = ~| {peaves_pilot,gnd,opus_geisha,dweebie_elian};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elf_stroop <= 0;
    else
    case ({juliet_west,dig_molokai})
       0 : elf_stroop <= elf_stroop;
       1 : elf_stroop <= elf_stroop;
       2 : elf_stroop <= elf_stroop;
       3 : elf_stroop <= maki_maryann;
       default : elf_stroop <= 0;
    endcase
  end

// 6 bit SOP selector
always @(
        elf_stroop or tobe_priest  or 
        castaway_bull or gnd  or 
        salmon_wood or frog_palm  or 
        heidi_deuce or odin_hamachi  or 
        vcc or rarest_newt  or 
        vcc or curie_haze 
)

begin
    whammy_supurb = 
      elf_stroop & tobe_priest |
      castaway_bull & gnd |
      salmon_wood & frog_palm |
      heidi_deuce & odin_hamachi |
      vcc & rarest_newt |
      vcc & curie_haze;
end

// NAND all of these bits together
always @(raiders_loser or advil_clay or draco_moulin or salmon_wood or money_picture or rocks_killme or gnd or kilo_marge or fsncens_draco)
  begin
      partners_ring = ~& {raiders_loser,advil_clay,draco_moulin,salmon_wood,money_picture,rocks_killme,gnd,kilo_marge,fsncens_draco};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      avon_todd <= 0;
    else
    case ({water_crystal,uppers_att})
       0 : avon_todd <= gojira_huhhuh;
       1 : avon_todd <= avon_todd;
       2 : avon_todd <= avon_todd;
       3 : avon_todd <= loud_brian;
       default : avon_todd <= 0;
    endcase
  end

reg feedback_pt_722;

always @(gnd or feedback_pt_722)
  begin
      xterm_ginger = !gnd ^ !feedback_pt_722;
  end

reg feedback_pt_723;

always @(pizza_tapered or feedback_pt_723)
  begin
      broom_meth =  pizza_tapered & !feedback_pt_723;
  end

reg feedback_pt_724;

always @(moe_burning or feedback_pt_724)
  begin
      enoch_pork =  moe_burning &  feedback_pt_724;
  end

reg feedback_pt_725;

always @(might_popacap or feedback_pt_725)
  begin
      smack_mozart = !might_popacap |  feedback_pt_725;
  end

reg feedback_pt_726;

always @(cow_alpha or feedback_pt_726)
  begin
      cuckoo_quail =  cow_alpha &  feedback_pt_726;
  end

reg feedback_pt_727;

always @(gutter_jcrew or feedback_pt_727)
  begin
      zen_potato =  gutter_jcrew |  feedback_pt_727;
  end

reg feedback_pt_728;

always @(arizona_water or feedback_pt_728)
  begin
      romeo_tin = !arizona_water &  feedback_pt_728;
  end

reg feedback_pt_729;

always @(willy_lxtcen or feedback_pt_729)
  begin
      pixie_sortout =  willy_lxtcen ^ !feedback_pt_729;
  end

reg feedback_pt_730;

always @(vcc or feedback_pt_730)
  begin
      holland_romeo =  vcc &  feedback_pt_730;
  end

reg feedback_pt_731;

always @(vcc or feedback_pt_731)
  begin
      ocean_green = !vcc ^ !feedback_pt_731;
  end

reg feedback_pt_732;

always @(willy_lxtcen or feedback_pt_732)
  begin
      nail_scotch = !willy_lxtcen &  feedback_pt_732;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ford_flew <= 0;
    else if (ocean_green)
      ford_flew <= cow_alpha;
  end

always @(ford_flew)
  begin
      feedback_pt_722 = ford_flew;
  end

always @(ford_flew)
  begin
      feedback_pt_723 = ford_flew;
  end

wire oitcen_rodent_wire;

dffea oitcen_rodent_ff (
  .clk(clock1),
  .d(louie_mideast),
  .ena(vcc),
  .adata(red_issac),
  .clrn(!reset1),
  .q(oitcen_rodent_wire)
);

always @(oitcen_rodent_wire) begin
   metal_drugie = oitcen_rodent_wire;
end

always @(metal_drugie)
  begin
      feedback_pt_724 = metal_drugie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grams_valve <= 1;
    else
      grams_valve <= xterm_ginger;
  end

always @(grams_valve)
  begin
      feedback_pt_725 = grams_valve;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_rasp <= 1;
    else
      oldnavy_rasp <= vcc;
  end

always @(oldnavy_rasp)
  begin
      feedback_pt_726 = oldnavy_rasp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dutch_ariel <= 0;
    else if (jacuzzi_cow)
      dutch_ariel <= rarest_newt;
    else if (juliet_west)
      dutch_ariel <= 0;
  end

always @(dutch_ariel)
  begin
      feedback_pt_727 = dutch_ariel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobiko_tabby <= 0;
    else
      tobiko_tabby <= oldnavy_rasp;
  end

always @(tobiko_tabby)
  begin
      feedback_pt_728 = tobiko_tabby;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_wine <= 0;
    else if (vcc)
      life_wine <= dutch_ariel;
  end

always @(life_wine)
  begin
      feedback_pt_729 = life_wine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stroop_vadar <= 1;
    else
      stroop_vadar <= wonton_guy;
  end

always @(stroop_vadar)
  begin
      feedback_pt_730 = stroop_vadar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      brian_deuce <= 1;
    else
      brian_deuce <= cuckoo_quail;
  end

always @(brian_deuce)
  begin
      feedback_pt_731 = brian_deuce;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_kmfdm <= 0;
    else
      hinge_kmfdm <= vcc;
  end

always @(hinge_kmfdm)
  begin
      feedback_pt_732 = hinge_kmfdm;
  end

wire huhhuh_quebec_wire;

dffeas huhhuh_quebec_ff (
  .clk(clock1),
  .d(zen_potato),
  .ena(romeo_tin),
  .sclr(broom_meth),
  .sload(xterm_ginger),
  .asdata(ford_flew),
  .clrn(!reset1),
  .q(huhhuh_quebec_wire)
);

always @(huhhuh_quebec_wire) begin
   wonton_psycho = huhhuh_quebec_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      helena_goat <= 0;
    else if (gnd)
      helena_goat <= 0;
    else if (touch_homerun)
      helena_goat <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wiggum_avon <= 0;
    else
      wiggum_avon <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      surfer_knot <= 0;
    else if (uppers_att)
      surfer_knot <= lupin_moreand;
    else if (gnd)
      surfer_knot <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kana_dorkus <= 1;
    else
      kana_dorkus <= pcp_tattoo;
  end

wire speed_vegan_wire;

dffeas speed_vegan_ff (
  .clk(clock1),
  .d(brian_deuce),
  .ena(peta_mickey),
  .sclr(vadar_army),
  .sload(desade_vegas),
  .asdata(tobe_crystal),
  .clrn(!reset1),
  .q(speed_vegan_wire)
);

always @(speed_vegan_wire) begin
   eatem_spanish = speed_vegan_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      candle_army <= 1;
    else
      candle_army <= hinge_kmfdm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wakey_tesla <= 0;
    else if (hurt_pluto)
      wakey_tesla <= romeo_tin;
    else if (red_issac)
      wakey_tesla <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lxtcen_wonton <= 0;
    else
      lxtcen_wonton <= pixie_sortout;
  end

// Random combinatorial logic block
always@(*)
  begin
      sogood_bonker = ~( ~( ~candle_army ) );
  end

  always@(*)
  begin
    speedyg_abel = nail_scotch ? ~( ~( barty_maryann ) ) : ~( ~( ( ~( ~lucent_grumpy ^ ~tobe_priest ) ) & ( ~( ~vcc | ~stick_budlite ) ) ) & ~( ( ~( ~( ~metal_drugie ) & ~( bagel_howell ) ) ) ) );
  end
// NAND all of these bits together
always @(gopher_cheez or vcc or moe_burning or gnd or odin_hamachi or grams_valve or gnd or vcc)
  begin
      popacap_bull = ~& {gopher_cheez,vcc,moe_burning,gnd,odin_hamachi,grams_valve,gnd,vcc};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knockout_dow <= 0;
    else
    case ({partners_ring,barty_maryann})
       0 : knockout_dow <= knockout_dow;
       1 : knockout_dow <= holland_romeo;
       2 : knockout_dow <= knockout_dow;
       3 : knockout_dow <= knockout_dow;
       default : knockout_dow <= 0;
    endcase
  end

reg feedback_pt_733;

always @(vcc or feedback_pt_733)
  begin
      wine_ham =  vcc ^ !feedback_pt_733;
  end

reg feedback_pt_734;

always @(whammy_supurb or feedback_pt_734)
  begin
      wood_dragon =  whammy_supurb | !feedback_pt_734;
  end

reg feedback_pt_735;

always @(often_faster or feedback_pt_735)
  begin
      wiggum_wanton =  often_faster |  feedback_pt_735;
  end

reg feedback_pt_736;

always @(odin_hamachi or feedback_pt_736)
  begin
      kabar_floo =  odin_hamachi | !feedback_pt_736;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whack_mouse <= 1;
    else
      whack_mouse <= dutch_ariel;
  end

always @(whack_mouse)
  begin
      feedback_pt_733 = whack_mouse;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drevil_air <= 1;
    else
      drevil_air <= life_wine;
  end

always @(drevil_air)
  begin
      feedback_pt_734 = drevil_air;
  end

wire boots_ramone_wire;

dffeas boots_ramone_ff (
  .clk(clock1),
  .d(wonton_psycho),
  .ena(bart_speed),
  .sclr(stroop_vadar),
  .sload(gnd),
  .asdata(rocks_killme),
  .clrn(!reset1),
  .q(boots_ramone_wire)
);

always @(boots_ramone_wire) begin
   safeway_tonic = boots_ramone_wire;
end

always @(safeway_tonic)
  begin
      feedback_pt_735 = safeway_tonic;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pork_george <= 1;
    else
      pork_george <= gnd;
  end

always @(pork_george)
  begin
      feedback_pt_736 = pork_george;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      isle_husks <= 1;
    else
      isle_husks <= drevil_air;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_gregg_a <= 0;
    else if (gnd)
      deng_gregg_a <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moses_bull <= 1;
    else
      moses_bull <= madeye_maki;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zen_hp <= 0;
    else if (often_faster)
      zen_hp <= lxtcen_wonton;
    else if (drugs_chief)
      zen_hp <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_sheep <= 0;
    else if (vcc)
      pirate_sheep <= gnd;
    else if (vcc)
      pirate_sheep <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_bfs <= 0;
    else if (pyro_booming)
      pcp_bfs <= vcc;
    else if (vcc)
      pcp_bfs <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yummy_wine <= 1;
    else
      yummy_wine <= goblin_snape;
  end

wire minnie_moses_wire;

dffea minnie_moses_ff (
  .clk(clock1),
  .d(vcc),
  .ena(eatem_spanish),
  .adata(vcc),
  .clrn(!reset1),
  .q(minnie_moses_wire)
);

always @(minnie_moses_wire) begin
   juliet_hummer = minnie_moses_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      winner_howell <= 0;
    else if (vcc)
      winner_howell <= 0;
    else if (madeye_maki)
      winner_howell <= pcp_bfs;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huey_golfland <= 0;
    else
      huey_golfland <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_cornell <= 0;
    else if (safeway_tonic)
      emu_cornell <= 0;
    else if (vcc)
      emu_cornell <= quail_lao;
  end

// AND all of these bits together
always @(wakey_tesla or surfer_knot or elf_stroop or yummy_wine or gnd or wiggum_avon or gnd or gnd)
  begin
      ready_star = & {wakey_tesla,surfer_knot,elf_stroop,yummy_wine,gnd,wiggum_avon,gnd,gnd};
  end


initial begin
    {yoku_weasley,icarus_sun,eel_cuanto,sun_cassowary} = 0;
end

// Registered 4 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (gnd)
      {yoku_weasley,icarus_sun,eel_cuanto,sun_cassowary} <= 0;
    else if (stroop_vadar)
      {yoku_weasley,icarus_sun,eel_cuanto,sun_cassowary} <=
		  {stix_comrade,uniform_crank,gnd,wiggum_wanton};
    else
      {yoku_weasley,icarus_sun,eel_cuanto,sun_cassowary} <=
		 {juliet_west,midas_balloon,wood_dragon,goblin_drevil} + 
		 {rodent_badger,asahi_bloom,gnd,juliet_hummer};
  end

reg feedback_pt_737;

always @(sogood_bonker or feedback_pt_737)
  begin
      solder_kbtoys =  sogood_bonker ^ !feedback_pt_737;
  end

reg feedback_pt_738;

always @(gnd or feedback_pt_738)
  begin
      devotion_red = !gnd |  feedback_pt_738;
  end

reg feedback_pt_739;

always @(partners_ring or feedback_pt_739)
  begin
      lxtcen_copper = !partners_ring & !feedback_pt_739;
  end

reg feedback_pt_740;

always @(isle_husks or feedback_pt_740)
  begin
      shuda_togos =  isle_husks |  feedback_pt_740;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arcade_sogood <= 0;
    else if (vcc)
      arcade_sogood <= vcc;
  end

always @(arcade_sogood)
  begin
      feedback_pt_737 = arcade_sogood;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      giants_beavis <= 0;
    else if (eatem_spanish)
      giants_beavis <= zen_hp;
    else if (enoch_pork)
      giants_beavis <= 0;
  end

always @(giants_beavis)
  begin
      feedback_pt_738 = giants_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_banality <= 0;
    else if (vcc)
      ibm_banality <= 0;
    else if (tesla_think)
      ibm_banality <= gnd;
  end

always @(ibm_banality)
  begin
      feedback_pt_739 = ibm_banality;
  end

wire china_subway_wire;

dffeas china_subway_ff (
  .clk(clock1),
  .d(kabar_floo),
  .ena(gnd),
  .sclr(psycho_danger),
  .sload(arcade_sogood),
  .asdata(ocean_green),
  .clrn(!reset1),
  .q(china_subway_wire)
);

always @(china_subway_wire) begin
   willem_indigo = china_subway_wire;
end

always @(willem_indigo)
  begin
      feedback_pt_740 = willem_indigo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sleepy_boots <= 0;
    else
      sleepy_boots <= pork_george;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ulysses_legos <= 0;
    else if (drugs_chief)
      ulysses_legos <= cow_alpha;
    else if (gnd)
      ulysses_legos <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuanto_float <= 0;
    else if (gnd)
      cuanto_float <= gnd;
    else if (gnd)
      cuanto_float <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      guy_rhvcens <= 1;
    else
      guy_rhvcens <= heidi_deuce;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chips_deng <= 0;
    else if (yummy_wine)
      chips_deng <= 0;
    else if (gnd)
      chips_deng <= dragon_broom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speeding_fuji <= 0;
    else
      speeding_fuji <= fang_cuckoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      att_buddha <= 0;
    else if (deng_gregg_a)
      att_buddha <= helena_goat;
    else if (helena_goat)
      att_buddha <= 0;
  end

wire tracy_lamer_wire;

dffea tracy_lamer_ff (
  .clk(clock1),
  .d(giants_beavis),
  .ena(gnd),
  .adata(sun_cassowary),
  .clrn(!reset1),
  .q(tracy_lamer_wire)
);

always @(tracy_lamer_wire) begin
   knot_foryou = tracy_lamer_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_salami <= 0;
    else if (often_faster)
      pizza_salami <= lxtcen_copper;
    else if (sleepy_boots)
      pizza_salami <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jiminy_ariel <= 0;
    else
      jiminy_ariel <= knockout_dow;
  end

wire odin_midas_wire;

dffeas odin_midas_ff (
  .clk(clock1),
  .d(vcc),
  .ena(pizza_salami),
  .sclr(rodent_badger),
  .sload(sun_cassowary),
  .asdata(pcp_tattoo),
  .clrn(!reset1),
  .q(odin_midas_wire)
);

always @(odin_midas_wire) begin
   vegan_guy = odin_midas_wire;
end

wire noah_zedong_wire;

dffeas noah_zedong_ff (
  .clk(clock1),
  .d(tobe_crystal),
  .ena(vcc),
  .sclr(att_buddha),
  .sload(partners_ring),
  .asdata(gnd),
  .clrn(!reset1),
  .q(noah_zedong_wire)
);

always @(noah_zedong_wire) begin
   ohno_sixyears = noah_zedong_wire;
end

wire intel_stoned_wire;

dffea intel_stoned_ff (
  .clk(clock1),
  .d(desade_vegas),
  .ena(ceres_crab),
  .adata(wine_ham),
  .clrn(!reset1),
  .q(intel_stoned_wire)
);

always @(intel_stoned_wire) begin
   bolt_dragon = intel_stoned_wire;
end

wire rod_mcnugget_wire;

dffea rod_mcnugget_ff (
  .clk(clock1),
  .d(juliet_west),
  .ena(ulysses_legos),
  .adata(moe_burning),
  .clrn(!reset1),
  .q(rod_mcnugget_wire)
);

always @(rod_mcnugget_wire) begin
   viagra_red = rod_mcnugget_wire;
end

wire deng_cannon_wire;

dffeas deng_cannon_ff (
  .clk(clock1),
  .d(bagel_howell),
  .ena(gnd),
  .sclr(icarus_sun),
  .sload(ulysses_legos),
  .asdata(popacap_bull),
  .clrn(!reset1),
  .q(deng_cannon_wire)
);

always @(deng_cannon_wire) begin
   nigiri_wonder = deng_cannon_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      doobie_Iwin <= 0;
    else if (vcc)
      doobie_Iwin <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tasty_meffert <= 0;
    else if (vcc)
      tasty_meffert <= 0;
    else if (knot_foryou)
      tasty_meffert <= ibm_banality;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tango_whiskey <= 0;
    else if (vcc)
      tango_whiskey <= vcc;
  end

// data words for bus muxing
wire [10:0] hotdog_egg_word0_data;
wire [10:0] hotdog_egg_word1_data;
wire [10:0] hotdog_egg_word2_data;
wire [10:0] hotdog_egg_word3_data;
wire [10:0] hotdog_egg_word4_data;
wire [10:0] hotdog_egg_word5_data;
wire [10:0] hotdog_egg_word6_data;
assign hotdog_egg_word0_data = {juliet_west,surfer_knot,vcc,asahi_bloom,drevil_air,gnd,tasty_meffert,lxtcen_wonton,vcc,wakey_tesla,chips_deng};
assign hotdog_egg_word1_data = {vcc,winner_howell,huhhuh_wujing,popacap_bull,doobie_Iwin,cow_alpha,solder_kbtoys,jiminy_ariel,ibm_banality,vcc,gnd};
assign hotdog_egg_word2_data = {juliet_hummer,devotion_red,moses_bull,pcp_tattoo,bagel_howell,juliet_hummer,moses_bull,babette_chuck,cuanto_float,icarus_sun,gonzo_kmfdm};
assign hotdog_egg_word3_data = {gnd,vcc,tobe_crystal,gnd,gnd,avon_todd,speeding_fuji,golf_pizza,hours_floride,pcp_tattoo,tango_whiskey};
assign hotdog_egg_word4_data = {babette_chuck,gnd,gnd,pcp_bfs,cow_alpha,avon_todd,ceres_crab,gnd,gnd,blue_gonzo,hours_floride};
assign hotdog_egg_word5_data = {nigiri_wonder,arizona_newt,guy_rhvcens,eel_cuanto,vcc,goblin_drevil,vcc,gnd,yoku_weasley,gnd,juliet_hummer};
assign hotdog_egg_word6_data = {metal_drugie,gnd,avon_todd,vcc,jiminy_ariel,kebab_books,juliet_west,ulysses_legos,pcp_bfs,lxtcen_copper,vcc};

// select control for bus muxing
wire [4:0] hotdog_egg_select;
assign hotdog_egg_select = {devotion_red,willem_indigo,sleepy_boots,pcp_bfs,gnd};


// Mux output word
reg [10:0] hotdog_egg_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    hotdog_egg_result = hotdog_egg_word0_data;
    if (hotdog_egg_select == 9)
        hotdog_egg_result = ~hotdog_egg_word6_data;

    if (hotdog_egg_select == 4)
        hotdog_egg_result = 0;

    if (hotdog_egg_select == 12)
        hotdog_egg_result = 0;

    if (hotdog_egg_select[3])
        hotdog_egg_result = hotdog_egg_word1_data;

    if (hotdog_egg_select[1])
        hotdog_egg_result = hotdog_egg_word6_data;

    if (hotdog_egg_select == 31)
        hotdog_egg_result = 0;

    if (hotdog_egg_select[3] && hotdog_egg_select[3])
        hotdog_egg_result = hotdog_egg_word3_data;

    if (hotdog_egg_select[3])
        hotdog_egg_result = hotdog_egg_word2_data;

    if (hotdog_egg_select == 5)
        hotdog_egg_result = 0;

    if (hotdog_egg_select[2])
        hotdog_egg_result = hotdog_egg_word4_data;

end


// Send the out bus back to the world
always @(hotdog_egg_result)
begin
    english_kilo = hotdog_egg_result[0];
    candle_pig = hotdog_egg_result[1];
    honey_beavis = hotdog_egg_result[2];
    lsd_tobiko = hotdog_egg_result[3];
    solder_obiwan = hotdog_egg_result[4];
    kaisha_jonas = hotdog_egg_result[5];
    life_lima = hotdog_egg_result[6];
    cain_parrot = hotdog_egg_result[7];
    doc_senorduck = hotdog_egg_result[8];
    dr_zaius_bep = hotdog_egg_result[9];
    supurb_barnum = hotdog_egg_result[10];
end

// RAM - Data is 6 bits. Depth is 32 words.
wire [5:0] bolt_ibm_d;
wire [4:0] bolt_ibm_raddr;
wire [4:0] bolt_ibm_waddr;
wire bolt_ibm_rclk, bolt_ibm_wclk, bolt_ibm_we;

assign bolt_ibm_d = {crank_star,arizona_newt,whammy_supurb,honey_beavis,solder_kbtoys,willem_indigo};
assign bolt_ibm_raddr = {emu_cornell,athena_onion,tasty_meffert,life_lima,crank_star};
assign bolt_ibm_waddr = {speedyg_abel,doc_senorduck,drugs_chief,shuda_togos,noah_yellow};
assign bolt_ibm_rclk = clock0;
assign bolt_ibm_wclk = clock0;
assign bolt_ibm_we = lsd_tobiko;

reg [5:0] bolt_ibm_q;
reg [5:0] bolt_ibm_ram [31:0];
reg [4:0] bolt_ibm_raddr_reg;
reg [4:0] bolt_ibm_waddr_reg;


// synthesis translate off
initial begin
    bolt_ibm_waddr_reg = 0;
    bolt_ibm_raddr_reg = 0;
    bolt_ibm_ram[0] = 0;
    bolt_ibm_ram[1] = 0;
    bolt_ibm_ram[2] = 0;
    bolt_ibm_ram[3] = 0;
    bolt_ibm_ram[4] = 0;
    bolt_ibm_ram[5] = 0;
    bolt_ibm_ram[6] = 0;
    bolt_ibm_ram[7] = 0;
    bolt_ibm_ram[8] = 0;
    bolt_ibm_ram[9] = 0;
    bolt_ibm_ram[10] = 0;
    bolt_ibm_ram[11] = 0;
    bolt_ibm_ram[12] = 0;
    bolt_ibm_ram[13] = 0;
    bolt_ibm_ram[14] = 0;
    bolt_ibm_ram[15] = 0;
    bolt_ibm_ram[16] = 0;
    bolt_ibm_ram[17] = 0;
    bolt_ibm_ram[18] = 0;
    bolt_ibm_ram[19] = 0;
    bolt_ibm_ram[20] = 0;
    bolt_ibm_ram[21] = 0;
    bolt_ibm_ram[22] = 0;
    bolt_ibm_ram[23] = 0;
    bolt_ibm_ram[24] = 0;
    bolt_ibm_ram[25] = 0;
    bolt_ibm_ram[26] = 0;
    bolt_ibm_ram[27] = 0;
    bolt_ibm_ram[28] = 0;
    bolt_ibm_ram[29] = 0;
    bolt_ibm_ram[30] = 0;
    bolt_ibm_ram[31] = 0;
    bolt_ibm_q = 0;
end
// synthesis translate on
always @ (posedge bolt_ibm_wclk)
begin
   bolt_ibm_waddr_reg <= bolt_ibm_waddr;
end

always @ (posedge bolt_ibm_wclk)
begin
  if (bolt_ibm_we) bolt_ibm_ram[bolt_ibm_waddr_reg] <= bolt_ibm_d;
end

// don't register the read addr
//   to prevent collision behavior mismatch
always @ (bolt_ibm_raddr)
begin
  bolt_ibm_raddr_reg <= bolt_ibm_raddr;
end

always @ (posedge bolt_ibm_rclk)
begin
  bolt_ibm_q <= bolt_ibm_ram[bolt_ibm_raddr_reg];
end

always @ (bolt_ibm_q)
begin
   shrimp_peta=bolt_ibm_q[0];
   pirate_icarus=bolt_ibm_q[1];
   south_ham=bolt_ibm_q[2];
   shrimp_cubish=bolt_ibm_q[3];
   goat_ham=bolt_ibm_q[4];
   norbert_eel=bolt_ibm_q[5];
end

reg feedback_pt_741;

always @(vcc or feedback_pt_741)
  begin
      frog_stroop =  vcc ^ !feedback_pt_741;
  end

reg feedback_pt_742;

always @(wakey_tesla or feedback_pt_742)
  begin
      south_noah =  wakey_tesla | !feedback_pt_742;
  end

reg feedback_pt_743;

always @(cow_alpha or feedback_pt_743)
  begin
      rewire_frog = !cow_alpha ^  feedback_pt_743;
  end

reg feedback_pt_744;

always @(vcc or feedback_pt_744)
  begin
      crack_foxtrot = !vcc &  feedback_pt_744;
  end

reg feedback_pt_745;

always @(pirate_icarus or feedback_pt_745)
  begin
      cheez_voodoo = !pirate_icarus |  feedback_pt_745;
  end

reg feedback_pt_746;

always @(gnd or feedback_pt_746)
  begin
      xterm_simasu =  gnd & !feedback_pt_746;
  end

reg feedback_pt_747;

always @(doc_senorduck or feedback_pt_747)
  begin
      beast_kdqcens =  doc_senorduck |  feedback_pt_747;
  end

wire wonton_edible_wire;

dffeas wonton_edible_ff (
  .clk(clock1),
  .d(knot_foryou),
  .ena(avon_todd),
  .sclr(tango_whiskey),
  .sload(pirate_icarus),
  .asdata(kebab_books),
  .clrn(!reset1),
  .q(wonton_edible_wire)
);

always @(wonton_edible_wire) begin
   master_giants = wonton_edible_wire;
end

always @(master_giants)
  begin
      feedback_pt_741 = master_giants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bart_joey <= 0;
    else if (moe_burning)
      bart_joey <= 0;
    else if (shrimp_cubish)
      bart_joey <= drugs_chief;
  end

always @(bart_joey)
  begin
      feedback_pt_742 = bart_joey;
  end

wire amadeus_romeo_wire;

dffeas amadeus_romeo_ff (
  .clk(clock1),
  .d(ceecensor_gap),
  .ena(rocks_batman),
  .sclr(frog_stroop),
  .sload(lxtcen_copper),
  .asdata(vcc),
  .clrn(!reset1),
  .q(amadeus_romeo_wire)
);

always @(amadeus_romeo_wire) begin
   guy_powder = amadeus_romeo_wire;
end

always @(guy_powder)
  begin
      feedback_pt_743 = guy_powder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      danger_zinc <= 0;
    else if (xterm_simasu)
      danger_zinc <= 0;
    else if (juliet_west)
      danger_zinc <= guy_powder;
  end

always @(danger_zinc)
  begin
      feedback_pt_744 = danger_zinc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peta_cryptic <= 0;
    else if (nigiri_wonder)
      peta_cryptic <= 0;
    else if (ready_star)
      peta_cryptic <= kaisha_jonas;
  end

always @(peta_cryptic)
  begin
      feedback_pt_745 = peta_cryptic;
  end

wire mouse_tobe_wire;

dffea mouse_tobe_ff (
  .clk(clock1),
  .d(west_beast),
  .ena(noah_yellow),
  .adata(gutter_jcrew),
  .clrn(!reset1),
  .q(mouse_tobe_wire)
);

always @(mouse_tobe_wire) begin
   jacob_bolt = mouse_tobe_wire;
end

always @(jacob_bolt)
  begin
      feedback_pt_746 = jacob_bolt;
  end

wire tracy_aphid_wire;

dffea tracy_aphid_ff (
  .clk(clock1),
  .d(moses_bull),
  .ena(sleepy_boots),
  .adata(doc_senorduck),
  .clrn(!reset1),
  .q(tracy_aphid_wire)
);

always @(tracy_aphid_wire) begin
   jason_numbers = tracy_aphid_wire;
end

always @(jason_numbers)
  begin
      feedback_pt_747 = jason_numbers;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vampire_gyro <= 0;
    else if (gutter_jcrew)
      vampire_gyro <= pirate_sheep;
    else if (babette_chuck)
      vampire_gyro <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      toysrus_roe <= 0;
    else if (neville_xray)
      toysrus_roe <= 0;
    else if (junkie_duck)
      toysrus_roe <= gutter_jcrew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chiptrip_pig <= 0;
    else if (bolt_dragon)
      chiptrip_pig <= ceres_crab;
    else if (juliet_west)
      chiptrip_pig <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bert_life <= 1;
    else
      bert_life <= drugs_chief;
  end

wire dragon_deng_wire;

dffea dragon_deng_ff (
  .clk(clock1),
  .d(peta_cryptic),
  .ena(ohno_sixyears),
  .adata(peta_cryptic),
  .clrn(!reset1),
  .q(dragon_deng_wire)
);

always @(dragon_deng_wire) begin
   tesla_whale = dragon_deng_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      waffle_hummer <= 0;
    else
      waffle_hummer <= rocks_batman;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mouse_tiger <= 0;
    else if (vcc)
      mouse_tiger <= pcp_tattoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sneezy_stoned <= 0;
    else if (toysrus_roe)
      sneezy_stoned <= cow_alpha;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      solder_tank <= 0;
    else if (gnd)
      solder_tank <= nigiri_wonder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ozzy_southern <= 0;
    else
      ozzy_southern <= bolt_dragon;
  end

wire stix_nigiri_wire;

dffeas stix_nigiri_ff (
  .clk(clock1),
  .d(ozzy_southern),
  .ena(life_wine),
  .sclr(master_giants),
  .sload(bart_joey),
  .asdata(vcc),
  .clrn(!reset1),
  .q(stix_nigiri_wire)
);

always @(stix_nigiri_wire) begin
   dipsy_ginger = stix_nigiri_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fuji_condit <= 0;
    else if (sneezy_stoned)
      fuji_condit <= 0;
    else if (gnd)
      fuji_condit <= vegan_guy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quail_lumber <= 0;
    else
      quail_lumber <= vcc;
  end

// Tristate output pin with reg feedback
  bufif0 (atilla_cuanto, ohno_sixyears, vegan_guy);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(vegan_guy or atilla_cuanto) begin
    if (!vegan_guy) spock_tango = !atilla_cuanto;
    else spock_tango = gnd;
end

reg feedback_pt_748;

always @(honey_beavis or feedback_pt_748)
  begin
      advil_nobody = !honey_beavis &  feedback_pt_748;
  end

reg feedback_pt_749;

always @(tango_whiskey or feedback_pt_749)
  begin
      tiger_dorkus =  tango_whiskey &  feedback_pt_749;
  end

reg feedback_pt_750;

always @(drugs_chief or feedback_pt_750)
  begin
      pegasus_meth =  drugs_chief ^ !feedback_pt_750;
  end

reg feedback_pt_751;

always @(shrimp_peta or feedback_pt_751)
  begin
      coffee_fang =  shrimp_peta |  feedback_pt_751;
  end

reg feedback_pt_752;

always @(gnd or feedback_pt_752)
  begin
      turnip_hinge =  gnd &  feedback_pt_752;
  end

reg feedback_pt_753;

always @(ozzy_southern or feedback_pt_753)
  begin
      ihilani_army = !ozzy_southern ^  feedback_pt_753;
  end

reg feedback_pt_754;

always @(cow_alpha or feedback_pt_754)
  begin
      cryptic_chief = !cow_alpha ^ !feedback_pt_754;
  end

reg feedback_pt_755;

always @(vcc or feedback_pt_755)
  begin
      salami_ibm = !vcc | !feedback_pt_755;
  end

reg feedback_pt_756;

always @(shrimp_peta or feedback_pt_756)
  begin
      emu_pixie = !shrimp_peta | !feedback_pt_756;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      psycho_fang <= 0;
    else
      psycho_fang <= south_noah;
  end

always @(psycho_fang)
  begin
      feedback_pt_748 = psycho_fang;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blueled_army <= 0;
    else if (pegasus_meth)
      blueled_army <= fuji_condit;
  end

always @(blueled_army)
  begin
      feedback_pt_749 = blueled_army;
  end

wire otter_mexican_wire;

dffea otter_mexican_ff (
  .clk(clock1),
  .d(spock_tango),
  .ena(asahi_bloom),
  .adata(crank_star),
  .clrn(!reset1),
  .q(otter_mexican_wire)
);

always @(otter_mexican_wire) begin
   north_roe = otter_mexican_wire;
end

always @(north_roe)
  begin
      feedback_pt_750 = north_roe;
  end

wire uniform_would_wire;

dffeas uniform_would_ff (
  .clk(clock1),
  .d(gnd),
  .ena(north_roe),
  .sclr(vampire_gyro),
  .sload(avon_todd),
  .asdata(jacob_bolt),
  .clrn(!reset1),
  .q(uniform_would_wire)
);

always @(uniform_would_wire) begin
   waffle_meth = uniform_would_wire;
end

always @(waffle_meth)
  begin
      feedback_pt_751 = waffle_meth;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genesis_black <= 0;
    else if (vcc)
      genesis_black <= 0;
    else if (gnd)
      genesis_black <= cow_alpha;
  end

always @(genesis_black)
  begin
      feedback_pt_752 = genesis_black;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wakey_neon <= 0;
    else if (waffle_meth)
      wakey_neon <= gnd;
  end

always @(wakey_neon)
  begin
      feedback_pt_753 = wakey_neon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popcorn_tuna <= 1;
    else
      popcorn_tuna <= gnd;
  end

always @(popcorn_tuna)
  begin
      feedback_pt_754 = popcorn_tuna;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rufus_pdaddy <= 1;
    else
      rufus_pdaddy <= asahi_bloom;
  end

always @(rufus_pdaddy)
  begin
      feedback_pt_755 = rufus_pdaddy;
  end

wire questo_kabar_wire;

dffea questo_kabar_ff (
  .clk(clock1),
  .d(deng_gregg_a),
  .ena(gnd),
  .adata(chiptrip_pig),
  .clrn(!reset1),
  .q(questo_kabar_wire)
);

always @(questo_kabar_wire) begin
   pirate_pluto = questo_kabar_wire;
end

always @(pirate_pluto)
  begin
      feedback_pt_756 = pirate_pluto;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      metal_willem <= 1;
    else
      metal_willem <= juliet_west;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gulp_ready <= 0;
    else if (jacob_bolt)
      gulp_ready <= 0;
    else if (frog_stroop)
      gulp_ready <= sleepy_boots;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotel_quail <= 0;
    else if (gnd)
      hotel_quail <= 0;
    else if (tesla_whale)
      hotel_quail <= psycho_eagle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iceland_advil <= 0;
    else if (pirate_sheep)
      iceland_advil <= popcorn_tuna;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cafe_kang <= 1;
    else
      cafe_kang <= dr_zaius_bep;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honey_huey <= 0;
    else if (fuji_condit)
      honey_huey <= mouse_tiger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killme_pyro <= 0;
    else if (supurb_barnum)
      killme_pyro <= gnd;
    else if (babette_chuck)
      killme_pyro <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_nation <= 0;
    else if (supurb_barnum)
      moe_nation <= psycho_fang;
    else if (fuji_condit)
      moe_nation <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_gutter <= 0;
    else if (vcc)
      kilo_gutter <= vcc;
  end

reg feedback_pt_757;

always @(gnd or feedback_pt_757)
  begin
      arcade_uppers =  gnd & !feedback_pt_757;
  end

reg feedback_pt_758;

always @(norbert_eel or feedback_pt_758)
  begin
      school_cheez =  norbert_eel ^ !feedback_pt_758;
  end

reg feedback_pt_759;

always @(goblin_drevil or feedback_pt_759)
  begin
      bert_foiled =  goblin_drevil &  feedback_pt_759;
  end

reg feedback_pt_760;

always @(waffle_meth or feedback_pt_760)
  begin
      naproxen_dig =  waffle_meth | !feedback_pt_760;
  end

reg feedback_pt_761;

always @(lxtcen_wonton or feedback_pt_761)
  begin
      tasty_pdaddy =  lxtcen_wonton ^ !feedback_pt_761;
  end

reg feedback_pt_762;

always @(vampire_gyro or feedback_pt_762)
  begin
      lotus_jacuzzi = !vampire_gyro &  feedback_pt_762;
  end

reg feedback_pt_763;

always @(vcc or feedback_pt_763)
  begin
      tofu_squad =  vcc | !feedback_pt_763;
  end

always @(smack_mozart)
  begin
      tinker_pasta = !smack_mozart;
  end

always @(popcorn_tuna)
  begin
      klaas_touch = !popcorn_tuna;
  end

always @(gnd)
  begin
      whatelse_odin = !gnd;
  end

always @(vcc)
  begin
      heidi_eeevil = !vcc;
  end

always @(vcc)
  begin
      badger_baron = !vcc;
  end

always @(arcade_uppers)
  begin
      school_kmfdm = !arcade_uppers;
  end

always @(ohno_sixyears)
  begin
      richard_thor = !ohno_sixyears;
  end

always @(metal_willem)
  begin
      rewire_bison = !metal_willem;
  end

always @(life_wine)
  begin
      greenland_doc = !life_wine;
  end

always @(bert_life)
  begin
      bison_exodus = !bert_life;
  end

always @(kaisha_jonas)
  begin
      abel_picante = !kaisha_jonas;
  end

always @(salami_ibm)
  begin
      jiminy_palm = !salami_ibm;
  end

always @(gnd)
  begin
      plaster_echo = !gnd;
  end

always @(whatelse_odin)
  begin
      remus_blaster = !whatelse_odin;
  end

always @(nigiri_wonder)
  begin
      draco_waffle = !nigiri_wonder;
  end

always @(genesis_black)
  begin
      boing_diagon = !genesis_black;
  end

always @(lotus_jacuzzi)
  begin
      broom_school = !lotus_jacuzzi;
  end

wire luthor_square_wire;

dffeas luthor_square_ff (
  .clk(clock1),
  .d(turnip_hinge),
  .ena(gnd),
  .sclr(solder_tank),
  .sload(honey_huey),
  .asdata(tinker_pasta),
  .clrn(!reset1),
  .q(luthor_square_wire)
);

always @(luthor_square_wire) begin
   ibm_kidnapper = luthor_square_wire;
end

always @(ibm_kidnapper)
  begin
      feedback_pt_757 = ibm_kidnapper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yummy_over <= 0;
    else if (naproxen_dig)
      yummy_over <= crank_star;
  end

always @(yummy_over)
  begin
      feedback_pt_758 = yummy_over;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      malfoy_jcrew <= 0;
    else if (ibm_kidnapper)
      malfoy_jcrew <= pirate_icarus;
    else if (supurb_barnum)
      malfoy_jcrew <= 0;
  end

always @(malfoy_jcrew)
  begin
      feedback_pt_759 = malfoy_jcrew;
  end

wire rufus_huhhuh_wire;

dffeas rufus_huhhuh_ff (
  .clk(clock1),
  .d(waffle_meth),
  .ena(klaas_touch),
  .sclr(dipsy_ginger),
  .sload(gnd),
  .asdata(gnd),
  .clrn(!reset1),
  .q(rufus_huhhuh_wire)
);

always @(rufus_huhhuh_wire) begin
   master_lao = rufus_huhhuh_wire;
end

always @(master_lao)
  begin
      feedback_pt_760 = master_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_davidlin <= 0;
    else
      lala_davidlin <= moe_nation;
  end

always @(lala_davidlin)
  begin
      feedback_pt_761 = lala_davidlin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      floating_todd <= 1;
    else
      floating_todd <= smack_mozart;
  end

always @(floating_todd)
  begin
      feedback_pt_762 = floating_todd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheese_bull <= 0;
    else if (rewire_frog)
      cheese_bull <= 0;
    else if (vcc)
      cheese_bull <= waffle_hummer;
  end

always @(cheese_bull)
  begin
      feedback_pt_763 = cheese_bull;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iguana_fire <= 0;
    else
      iguana_fire <= malfoy_jcrew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xray_potter <= 0;
    else if (killme_pyro)
      xray_potter <= 0;
    else if (gnd)
      xray_potter <= master_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_rod <= 0;
    else
      knot_rod <= bison_exodus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wiggum_doobie <= 1;
    else
      wiggum_doobie <= broom_school;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vicks_raiders <= 0;
    else
      vicks_raiders <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_armand <= 0;
    else if (kilo_gutter)
      salmon_armand <= 0;
    else if (heidi_eeevil)
      salmon_armand <= master_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_athena <= 1;
    else
      pixie_athena <= gonzo_kmfdm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      master_crab <= 0;
    else if (vcc)
      master_crab <= emu_pixie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spock_south <= 0;
    else if (waffle_meth)
      spock_south <= bert_foiled;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moulin_willy <= 0;
    else
      moulin_willy <= gnd;
  end

wire issac_opus_wire;

dffeas issac_opus_ff (
  .clk(clock1),
  .d(shuda_togos),
  .ena(ozzy_southern),
  .sclr(supurb_barnum),
  .sload(solder_tank),
  .asdata(bert_foiled),
  .clrn(!reset1),
  .q(issac_opus_wire)
);

always @(issac_opus_wire) begin
   chicken_louie = issac_opus_wire;
end

wire isle_mcnugget_wire;

dffeas isle_mcnugget_ff (
  .clk(clock1),
  .d(tofu_squad),
  .ena(pegasus_meth),
  .sclr(rufus_pdaddy),
  .sload(school_cheez),
  .asdata(gonzo_kmfdm),
  .clrn(!reset1),
  .q(isle_mcnugget_wire)
);

always @(isle_mcnugget_wire) begin
   show_fang = isle_mcnugget_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      master_sugar <= 0;
    else
      master_sugar <= wakey_neon;
  end

// State Mek hp_elephant Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_elephant <= hp_elephant_0;
    else
      case (hp_elephant)
        hp_elephant_0: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 1)
            hp_elephant <= hp_elephant_1;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 6)
            hp_elephant <= hp_elephant_8;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 9)
            hp_elephant <= hp_elephant_9;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 0)
            hp_elephant <= hp_elephant_3;
          else
            hp_elephant <= hp_elephant_0;
          end
        hp_elephant_1: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 1)
            hp_elephant <= hp_elephant_3;
          else
            hp_elephant <= hp_elephant_1;
          end
        hp_elephant_2: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 10)
            hp_elephant <= hp_elephant_3;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 13)
            hp_elephant <= hp_elephant_9;
          else
            hp_elephant <= hp_elephant_2;
          end
        hp_elephant_3: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 4)
            hp_elephant <= hp_elephant_10;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 8)
            hp_elephant <= hp_elephant_6;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 6)
            hp_elephant <= hp_elephant_2;
          else
            hp_elephant <= hp_elephant_3;
          end
        hp_elephant_4: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 7)
            hp_elephant <= hp_elephant_9;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 3)
            hp_elephant <= hp_elephant_3;
          else
            hp_elephant <= hp_elephant_4;
          end
        hp_elephant_5: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 7)
            hp_elephant <= hp_elephant_8;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 14)
            hp_elephant <= hp_elephant_6;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 1)
            hp_elephant <= hp_elephant_8;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 10)
            hp_elephant <= hp_elephant_4;
          else
            hp_elephant <= hp_elephant_5;
          end
        hp_elephant_6: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 5)
            hp_elephant <= hp_elephant_3;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 11)
            hp_elephant <= hp_elephant_1;
          else
            hp_elephant <= hp_elephant_6;
          end
        hp_elephant_7: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 5)
            hp_elephant <= hp_elephant_2;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 1)
            hp_elephant <= hp_elephant_5;
          else
            hp_elephant <= hp_elephant_7;
          end
        hp_elephant_8: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 9)
            hp_elephant <= hp_elephant_10;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 15)
            hp_elephant <= hp_elephant_8;
          else
            hp_elephant <= hp_elephant_8;
          end
        hp_elephant_9: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 7)
            hp_elephant <= hp_elephant_3;
          else
            hp_elephant <= hp_elephant_9;
          end
        hp_elephant_10: begin
          if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 6)
            hp_elephant <= hp_elephant_0;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 1)
            hp_elephant <= hp_elephant_3;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 5)
            hp_elephant <= hp_elephant_2;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 13)
            hp_elephant <= hp_elephant_7;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 3)
            hp_elephant <= hp_elephant_7;
          else if ({vcc,cryptic_chief,nigiri_wonder,pegasus_meth} == 10)
            hp_elephant <= hp_elephant_6;
          else
            hp_elephant <= hp_elephant_10;
          end
        default: hp_elephant <= hp_elephant_0;
      endcase
  end

// State Mek hp_elephant Output logic
always @(hp_elephant)
  begin
    // consider all state regs when doing outputs
    case (hp_elephant)
        hp_elephant_0: begin
            salmon_todd = 0;
            desade_india = 0;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 0;
            dog_webvan = 1;
            leidiot_rat = 0;
            knot_questo = 0;
            unicorn_llama = 0;
          end
        hp_elephant_1: begin
            salmon_todd = 0;
            desade_india = 1;
            scotch_beast = 1;
            guy_neptune = 1;
            stroop_coffee = 1;
            fufu_jonas = 1;
            juliet_hotel = 1;
            dog_webvan = 1;
            leidiot_rat = 1;
            knot_questo = 1;
            unicorn_llama = 1;
          end
        hp_elephant_2: begin
            salmon_todd = 1;
            desade_india = 1;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 0;
            dog_webvan = 0;
            leidiot_rat = 1;
            knot_questo = 0;
            unicorn_llama = 1;
          end
        hp_elephant_3: begin
            salmon_todd = 1;
            desade_india = 0;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 0;
            dog_webvan = 0;
            leidiot_rat = 0;
            knot_questo = 1;
            unicorn_llama = 1;
          end
        hp_elephant_4: begin
            salmon_todd = 1;
            desade_india = 0;
            scotch_beast = 0;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 1;
            dog_webvan = 1;
            leidiot_rat = 0;
            knot_questo = 0;
            unicorn_llama = 0;
          end
        hp_elephant_5: begin
            salmon_todd = 0;
            desade_india = 0;
            scotch_beast = 1;
            guy_neptune = 1;
            stroop_coffee = 0;
            fufu_jonas = 1;
            juliet_hotel = 1;
            dog_webvan = 1;
            leidiot_rat = 1;
            knot_questo = 1;
            unicorn_llama = 0;
          end
        hp_elephant_6: begin
            salmon_todd = 1;
            desade_india = 1;
            scotch_beast = 0;
            guy_neptune = 1;
            stroop_coffee = 0;
            fufu_jonas = 1;
            juliet_hotel = 0;
            dog_webvan = 1;
            leidiot_rat = 0;
            knot_questo = 1;
            unicorn_llama = 1;
          end
        hp_elephant_7: begin
            salmon_todd = 1;
            desade_india = 1;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 0;
            fufu_jonas = 1;
            juliet_hotel = 0;
            dog_webvan = 0;
            leidiot_rat = 0;
            knot_questo = 0;
            unicorn_llama = 0;
          end
        hp_elephant_8: begin
            salmon_todd = 0;
            desade_india = 0;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 1;
            dog_webvan = 0;
            leidiot_rat = 1;
            knot_questo = 1;
            unicorn_llama = 1;
          end
        hp_elephant_9: begin
            salmon_todd = 0;
            desade_india = 1;
            scotch_beast = 0;
            guy_neptune = 1;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 1;
            dog_webvan = 0;
            leidiot_rat = 0;
            knot_questo = 0;
            unicorn_llama = 1;
          end
        hp_elephant_10: begin
            salmon_todd = 1;
            desade_india = 1;
            scotch_beast = 0;
            guy_neptune = 0;
            stroop_coffee = 0;
            fufu_jonas = 1;
            juliet_hotel = 1;
            dog_webvan = 1;
            leidiot_rat = 1;
            knot_questo = 1;
            unicorn_llama = 1;
          end
        default: begin
            salmon_todd = 0;
            desade_india = 0;
            scotch_beast = 0;
            guy_neptune = 0;
            stroop_coffee = 0;
            fufu_jonas = 0;
            juliet_hotel = 0;
            dog_webvan = 0;
            leidiot_rat = 1;
            knot_questo = 1;
            unicorn_llama = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire freaky_deuce_out;
nut_004_lut #(5) nut_004_lut_inst_freaky_deuce (
  .din({vcc,spock_south,greenland_doc,frog_stroop,jason_numbers}),
  .mask(32'hbf1c7680),
  .out(freaky_deuce_out)
);

always @(freaky_deuce_out)
begin
   xray_nest = freaky_deuce_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire snort_bfs_out;
nut_004_lut #(3) nut_004_lut_inst_snort_bfs (
  .din({hotel_quail,draco_waffle,rewire_bison}),
  .mask(8'b00000001),
  .out(snort_bfs_out)
);

always @(snort_bfs_out)
begin
   bull_would = snort_bfs_out;
end

// Bus inputs for MACing
reg  [15:0] sogood_troll_a;
reg  [10:0] sogood_troll_b;
reg  [7:0] sogood_troll_c;
reg  [12:0] sogood_troll_d;
initial sogood_troll_a <= 0;
always @(posedge clock1) begin
  sogood_troll_a <= {xray_potter,gnd,wiggum_doobie,boing_diagon,jacob_bolt,noah_yellow,pixie_athena,master_crab,lxtcen_copper,gnd,vcc,guy_neptune,unicorn_llama,malfoy_jcrew,advil_nobody,vcc};
end
always @(cheese_bull or solder_obiwan or asahi_bloom or pirate_pluto or pixie_athena or gonzo_kmfdm or dipsy_ginger or bull_would or gutter_jcrew or bull_would or tasty_pdaddy) begin
  sogood_troll_b = {cheese_bull,solder_obiwan,asahi_bloom,pirate_pluto,pixie_athena,gonzo_kmfdm,dipsy_ginger,bull_would,gutter_jcrew,bull_would,tasty_pdaddy};
end
initial sogood_troll_c <= 0;
always @(posedge clock1) begin
  sogood_troll_c <= {pixie_athena,gulp_ready,vcc,gnd,pirate_icarus,greenland_doc,master_lao,leidiot_rat};
end
initial sogood_troll_d <= 0;
always @(posedge clock1) begin
  sogood_troll_d <= {scotch_beast,vcc,vcc,rewire_bison,iceland_advil,vcc,popcorn_tuna,gnd,vcc,floating_todd,cryptic_chief,floating_todd,gnd};
end

// MAC inference bait
always @(sogood_troll_a or sogood_troll_b or sogood_troll_c or sogood_troll_d)
  begin
    {biker_jesus,southern_cafe,dadada_ramone,minnie_floo,oscar_peace,tobe_boitano,neptune_willy,muffin_robust,icarus_pluto,rerun_hinge,opus_hp,saturn_would,air_minnie,oranje_bomb} = 
        (-sogood_troll_a *
        sogood_troll_b) -
        (~sogood_troll_c *
         sogood_troll_d);
  end

// OR all of these bits together
always @(danger_zinc or gnd or vcc or stroop_coffee or whatelse_odin or candle_pig or dog_webvan or vicks_raiders or shrimp_peta or junkie_duck or school_cheez)
  begin
      oranges_draco = | {danger_zinc,gnd,vcc,stroop_coffee,whatelse_odin,candle_pig,dog_webvan,vicks_raiders,shrimp_peta,junkie_duck,school_cheez};
  end

always @(opus_hp or juliet_hotel or oscar_peace or vcc or biker_jesus or 
   opus_hp or juliet_hotel or oscar_peace or vcc or wiggum_doobie or 
   life_wine
)
  begin
    if (life_wine)
    begin
      case ({{opus_hp,juliet_hotel,oscar_peace,vcc},biker_jesus})
        0: balloon_what=1;
        1: balloon_what=0;
        2: balloon_what=0;
        3: balloon_what=0;
        4: balloon_what=0;
        5: balloon_what=0;
        6: balloon_what=1;
        7: balloon_what=0;
        8: balloon_what=1;
        9: balloon_what=1;
        10: balloon_what=0;
        11: balloon_what=1;
        12: balloon_what=1;
        13: balloon_what=1;
        14: balloon_what=1;
        15: balloon_what=1;
        16: balloon_what=1;
        17: balloon_what=0;
        18: balloon_what=1;
        19: balloon_what=1;
        20: balloon_what=1;
        21: balloon_what=1;
        22: balloon_what=1;
        23: balloon_what=1;
        24: balloon_what=0;
        25: balloon_what=0;
        26: balloon_what=0;
        27: balloon_what=0;
        28: balloon_what=1;
        29: balloon_what=0;
        30: balloon_what=0;
        31: balloon_what=1;
      default: balloon_what=0;
      endcase
    end
    else
    begin
      case ({{opus_hp,juliet_hotel,oscar_peace,vcc},wiggum_doobie})
        0: balloon_what=0;
        1: balloon_what=1;
        2: balloon_what=1;
        3: balloon_what=1;
        4: balloon_what=1;
        5: balloon_what=0;
        6: balloon_what=0;
        7: balloon_what=1;
        8: balloon_what=1;
        9: balloon_what=0;
        10: balloon_what=0;
        11: balloon_what=0;
        12: balloon_what=0;
        13: balloon_what=0;
        14: balloon_what=1;
        15: balloon_what=0;
        16: balloon_what=0;
        17: balloon_what=0;
        18: balloon_what=0;
        19: balloon_what=0;
        20: balloon_what=0;
        21: balloon_what=1;
        22: balloon_what=0;
        23: balloon_what=0;
        24: balloon_what=0;
        25: balloon_what=0;
        26: balloon_what=1;
        27: balloon_what=1;
        28: balloon_what=1;
        29: balloon_what=1;
        30: balloon_what=1;
        31: balloon_what=1;
      default: balloon_what=0;
      endcase
    end
  end

// NOR all of these bits together
always @(oranges_draco or junkie_duck or kaisha_jonas or show_fang or rerun_hinge or saturn_would or vcc or gnd or junkie_duck or tobe_boitano or beast_kdqcens)
  begin
      saturn_bull = ~| {oranges_draco,junkie_duck,kaisha_jonas,show_fang,rerun_hinge,saturn_would,vcc,gnd,junkie_duck,tobe_boitano,beast_kdqcens};
  end

reg feedback_pt_764;

always @(minnie_floo or feedback_pt_764)
  begin
      safeway_willy =  minnie_floo ^  feedback_pt_764;
  end

reg feedback_pt_765;

always @(gnd or feedback_pt_765)
  begin
      todd_green =  gnd |  feedback_pt_765;
  end

reg feedback_pt_766;

always @(badger_baron or feedback_pt_766)
  begin
      kana_helena = !badger_baron &  feedback_pt_766;
  end

reg feedback_pt_767;

always @(guy_neptune or feedback_pt_767)
  begin
      aladdin_roid =  guy_neptune &  feedback_pt_767;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      desert_sierra <= 1;
    else
      desert_sierra <= goat_ham;
  end

always @(desert_sierra)
  begin
      feedback_pt_764 = desert_sierra;
  end

wire lantern_jcrew_wire;

dffeas lantern_jcrew_ff (
  .clk(clock1),
  .d(tobe_boitano),
  .ena(salmon_todd),
  .sclr(vcc),
  .sload(south_ham),
  .asdata(kilo_gutter),
  .clrn(!reset1),
  .q(lantern_jcrew_wire)
);

always @(lantern_jcrew_wire) begin
   delta_yohimbe = lantern_jcrew_wire;
end

always @(delta_yohimbe)
  begin
      feedback_pt_765 = delta_yohimbe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_foiled <= 1;
    else
      pepsi_foiled <= show_fang;
  end

always @(pepsi_foiled)
  begin
      feedback_pt_766 = pepsi_foiled;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      loser_lad <= 0;
    else if (chiptrip_pig)
      loser_lad <= vcc;
    else if (cain_parrot)
      loser_lad <= 0;
  end

always @(loser_lad)
  begin
      feedback_pt_767 = loser_lad;
  end

wire ring_winner_wire;

dffea ring_winner_ff (
  .clk(clock1),
  .d(boing_diagon),
  .ena(safeway_willy),
  .adata(master_sugar),
  .clrn(!reset1),
  .q(ring_winner_wire)
);

always @(ring_winner_wire) begin
   geisha_dorkus = ring_winner_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_peta <= 0;
    else if (bert_life)
      webvan_peta <= gnd;
    else if (gnd)
      webvan_peta <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dirty_xterm <= 0;
    else
      dirty_xterm <= advil_nobody;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huey_comtrex <= 0;
    else if (safeway_willy)
      huey_comtrex <= gnd;
    else if (advil_nobody)
      huey_comtrex <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vadar_wonder <= 1;
    else
      vadar_wonder <= genesis_black;
  end

wire hiswife_moe_wire;

dffeas hiswife_moe_ff (
  .clk(clock1),
  .d(richard_thor),
  .ena(salami_ibm),
  .sclr(neptune_willy),
  .sload(plaster_echo),
  .asdata(rerun_hinge),
  .clrn(!reset1),
  .q(hiswife_moe_wire)
);

always @(hiswife_moe_wire) begin
   donkey_lad = hiswife_moe_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      withme_fang <= 0;
    else if (school_kmfdm)
      withme_fang <= moulin_willy;
    else if (life_wine)
      withme_fang <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_phoenix <= 0;
    else if (badger_baron)
      tiger_phoenix <= air_minnie;
  end

wire bono_bomb_wire;

dffeas bono_bomb_ff (
  .clk(clock1),
  .d(chicken_louie),
  .ena(gnd),
  .sclr(geisha_dorkus),
  .sload(gnd),
  .asdata(withme_fang),
  .clrn(!reset1),
  .q(bono_bomb_wire)
);

always @(bono_bomb_wire) begin
   atoms_whacky = bono_bomb_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      plumber_papa <= 0;
    else if (salami_ibm)
      plumber_papa <= air_minnie;
    else if (air_minnie)
      plumber_papa <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      devotion_knot <= 0;
    else if (gnd)
      devotion_knot <= vadar_wonder;
    else if (spock_tango)
      devotion_knot <= 0;
  end

wire school_gerrit_wire;

dffeas school_gerrit_ff (
  .clk(clock1),
  .d(chicken_louie),
  .ena(safeway_willy),
  .sclr(master_lao),
  .sload(junkie_duck),
  .asdata(jiminy_palm),
  .clrn(!reset1),
  .q(school_gerrit_wire)
);

always @(school_gerrit_wire) begin
   broom_riddler = school_gerrit_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tin_think <= 0;
    else if (oranje_bomb)
      tin_think <= abel_picante;
    else if (drugs_chief)
      tin_think <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      guy_tuna <= 0;
    else if (badger_baron)
      guy_tuna <= quail_lumber;
    else if (iceland_advil)
      guy_tuna <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      davidlin_fuji <= 0;
    else if (gnd)
      davidlin_fuji <= webvan_peta;
  end

wire fish_hummer_wire;

dffeas fish_hummer_ff (
  .clk(clock1),
  .d(balloon_what),
  .ena(gnd),
  .sclr(guy_neptune),
  .sload(goblin_drevil),
  .asdata(aladdin_roid),
  .clrn(!reset1),
  .q(fish_hummer_wire)
);

always @(fish_hummer_wire) begin
   tiger_hurt = fish_hummer_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blueled_kilo <= 0;
    else
      blueled_kilo <= viagra_red;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      issac_ihilani <= 0;
    else if (gnd)
      issac_ihilani <= moulin_willy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      duey_speedyg <= 0;
    else
      duey_speedyg <= south_ham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hurt_genesis <= 0;
    else if (supurb_barnum)
      hurt_genesis <= 0;
    else if (vcc)
      hurt_genesis <= moulin_willy;
  end

// State Mek nation_soccer Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nation_soccer <= nation_soccer_0;
    else
      case (nation_soccer)
        nation_soccer_0: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 14)
            nation_soccer <= nation_soccer_4;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 13)
            nation_soccer <= nation_soccer_7;
          else
            nation_soccer <= nation_soccer_0;
          end
        nation_soccer_1: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 6)
            nation_soccer <= nation_soccer_7;
          else
            nation_soccer <= nation_soccer_1;
          end
        nation_soccer_2: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 0)
            nation_soccer <= nation_soccer_1;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 1)
            nation_soccer <= nation_soccer_6;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 9)
            nation_soccer <= nation_soccer_5;
          else
            nation_soccer <= nation_soccer_2;
          end
        nation_soccer_3: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 15)
            nation_soccer <= nation_soccer_0;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 0)
            nation_soccer <= nation_soccer_7;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 4)
            nation_soccer <= nation_soccer_1;
          else
            nation_soccer <= nation_soccer_3;
          end
        nation_soccer_4: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 12)
            nation_soccer <= nation_soccer_8;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 14)
            nation_soccer <= nation_soccer_5;
          else
            nation_soccer <= nation_soccer_4;
          end
        nation_soccer_5: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 5)
            nation_soccer <= nation_soccer_2;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 6)
            nation_soccer <= nation_soccer_4;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 8)
            nation_soccer <= nation_soccer_5;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 4)
            nation_soccer <= nation_soccer_0;
          else
            nation_soccer <= nation_soccer_5;
          end
        nation_soccer_6: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 4)
            nation_soccer <= nation_soccer_1;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 13)
            nation_soccer <= nation_soccer_4;
          else
            nation_soccer <= nation_soccer_6;
          end
        nation_soccer_7: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 13)
            nation_soccer <= nation_soccer_8;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 6)
            nation_soccer <= nation_soccer_6;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 8)
            nation_soccer <= nation_soccer_8;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 14)
            nation_soccer <= nation_soccer_3;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 5)
            nation_soccer <= nation_soccer_3;
          else
            nation_soccer <= nation_soccer_7;
          end
        nation_soccer_8: begin
          if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 15)
            nation_soccer <= nation_soccer_5;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 12)
            nation_soccer <= nation_soccer_9;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 14)
            nation_soccer <= nation_soccer_3;
          else if ({pepsi_foiled,gnd,pcp_bfs,moulin_willy} == 2)
            nation_soccer <= nation_soccer_5;
          else
            nation_soccer <= nation_soccer_8;
          end
        nation_soccer_9: begin
            nation_soccer <= nation_soccer_9;
          end
        default: nation_soccer <= nation_soccer_0;
      endcase
  end

// State Mek nation_soccer Output logic
always @(nation_soccer)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (nation_soccer[3:1])
        nation_soccer_0: begin
            southern_papa = 1;
            ariel_century = 1;
            grumby_deng = 0;
            palmer_mrbill = 1;
            oscar_comrade = 1;
            piggish_might = 0;
            dorkus_sand = 0;
            robust_xterm = 0;
            zhuang_goat = 1;
          end
        nation_soccer_1: begin
            southern_papa = 0;
            ariel_century = 0;
            grumby_deng = 1;
            palmer_mrbill = 1;
            oscar_comrade = 1;
            piggish_might = 1;
            dorkus_sand = 1;
            robust_xterm = 1;
            zhuang_goat = 0;
          end
        nation_soccer_2: begin
            southern_papa = 1;
            ariel_century = 1;
            grumby_deng = 0;
            palmer_mrbill = 1;
            oscar_comrade = 1;
            piggish_might = 1;
            dorkus_sand = 0;
            robust_xterm = 0;
            zhuang_goat = 1;
          end
        nation_soccer_3: begin
            southern_papa = 1;
            ariel_century = 1;
            grumby_deng = 1;
            palmer_mrbill = 1;
            oscar_comrade = 1;
            piggish_might = 1;
            dorkus_sand = 1;
            robust_xterm = 0;
            zhuang_goat = 0;
          end
        nation_soccer_4: begin
            southern_papa = 0;
            ariel_century = 1;
            grumby_deng = 0;
            palmer_mrbill = 0;
            oscar_comrade = 0;
            piggish_might = 0;
            dorkus_sand = 0;
            robust_xterm = 0;
            zhuang_goat = 0;
          end
        default: begin
            southern_papa = 0;
            ariel_century = 1;
            grumby_deng = 0;
            palmer_mrbill = 0;
            oscar_comrade = 0;
            piggish_might = 1;
            dorkus_sand = 1;
            robust_xterm = 1;
            zhuang_goat = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire concorde_kana_out;
nut_004_lut #(2) nut_004_lut_inst_concorde_kana (
  .din({bull_would,guy_tuna}),
  .mask(4'b0000),
  .out(concorde_kana_out)
);

always @(concorde_kana_out)
begin
   hinge_sears = concorde_kana_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire money_covad_out;
nut_004_lut #(1) nut_004_lut_inst_money_covad (
  .din({huey_comtrex}),
  .mask(2'b00),
  .out(money_covad_out)
);

always @(money_covad_out)
begin
   joker_lucius = money_covad_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire tobe_bust_out;
nut_004_lut #(6) nut_004_lut_inst_tobe_bust (
  .din({todd_green,rufus_pdaddy,vcc,dadada_ramone,malfoy_jcrew,vcc}),
  .mask(64'heb38a89d20db2d58),
  .out(tobe_bust_out)
);

always @(tobe_bust_out)
begin
   athena_sierra = tobe_bust_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire duey_goblin_out;
nut_004_lut #(6) nut_004_lut_inst_duey_goblin (
  .din({vcc,bull_would,moe_nation,xray_nest,vcc,aladdin_roid}),
  .mask(64'hcf27e35a7e54eeba),
  .out(duey_goblin_out)
);

always @(duey_goblin_out)
begin
   wujing_golf = duey_goblin_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire bull_kmfdm_out;
nut_004_lut #(5) nut_004_lut_inst_bull_kmfdm (
  .din({atoms_whacky,joker_lucius,tiger_phoenix,dirty_xterm,master_crab}),
  .mask(32'b00000110000001000010001001000110),
  .out(bull_kmfdm_out)
);

always @(bull_kmfdm_out)
begin
   alpha_badger = bull_kmfdm_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire larry_subway_out;
nut_004_lut #(1) nut_004_lut_inst_larry_subway (
  .din({atoms_whacky}),
  .mask(2'b00),
  .out(larry_subway_out)
);

always @(larry_subway_out)
begin
   the_pope_palm = larry_subway_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire sweetie_att_out;
nut_004_lut #(5) nut_004_lut_inst_sweetie_att (
  .din({issac_ihilani,gnd,vcc,malfoy_jcrew,salmon_armand}),
  .mask(32'h43b678ff),
  .out(sweetie_att_out)
);

always @(sweetie_att_out)
begin
   iceland_moses = sweetie_att_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire minerva_tonic_out;
nut_004_lut #(1) nut_004_lut_inst_minerva_tonic (
  .din({vcc}),
  .mask(2'b00),
  .out(minerva_tonic_out)
);

always @(minerva_tonic_out)
begin
   withme_yummy = minerva_tonic_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire hagrid_condit_out;
nut_004_lut #(1) nut_004_lut_inst_hagrid_condit (
  .din({desade_india}),
  .mask(2'b11),
  .out(hagrid_condit_out)
);

always @(hagrid_condit_out)
begin
   sinus_goofy = hagrid_condit_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire fear_my_tummy_out;
nut_004_lut #(4) nut_004_lut_inst_fear_my_tummy (
  .din({gnd,tiger_dorkus,sinus_goofy,dadada_ramone}),
  .mask(16'h1ff3),
  .out(fear_my_tummy_out)
);

always @(fear_my_tummy_out)
begin
   pluto_sgates = fear_my_tummy_out;
end

// Note - state 1 is unreachable
// Note - state 6 is unreachable
// State Mek gulp_sapporo Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gulp_sapporo <= gulp_sapporo_0;
    else
      case (gulp_sapporo)
        gulp_sapporo_0: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 13)
            gulp_sapporo <= gulp_sapporo_4;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 8)
            gulp_sapporo <= gulp_sapporo_7;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 1)
            gulp_sapporo <= gulp_sapporo_9;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 3)
            gulp_sapporo <= gulp_sapporo_10;
          else
            gulp_sapporo <= gulp_sapporo_0;
          end
        gulp_sapporo_1: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 12)
            gulp_sapporo <= gulp_sapporo_0;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 4)
            gulp_sapporo <= gulp_sapporo_6;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 1)
            gulp_sapporo <= gulp_sapporo_7;
          else
            gulp_sapporo <= gulp_sapporo_1;
          end
        gulp_sapporo_2: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 9)
            gulp_sapporo <= gulp_sapporo_0;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 4)
            gulp_sapporo <= gulp_sapporo_2;
          else
            gulp_sapporo <= gulp_sapporo_2;
          end
        gulp_sapporo_3: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 10)
            gulp_sapporo <= gulp_sapporo_2;
          else
            gulp_sapporo <= gulp_sapporo_3;
          end
        gulp_sapporo_4: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 8)
            gulp_sapporo <= gulp_sapporo_10;
          else
            gulp_sapporo <= gulp_sapporo_4;
          end
        gulp_sapporo_5: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 4)
            gulp_sapporo <= gulp_sapporo_10;
          else
            gulp_sapporo <= gulp_sapporo_5;
          end
        gulp_sapporo_6: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 8)
            gulp_sapporo <= gulp_sapporo_10;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 10)
            gulp_sapporo <= gulp_sapporo_3;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 13)
            gulp_sapporo <= gulp_sapporo_2;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 5)
            gulp_sapporo <= gulp_sapporo_0;
          else
            gulp_sapporo <= gulp_sapporo_6;
          end
        gulp_sapporo_7: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 8)
            gulp_sapporo <= gulp_sapporo_9;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 5)
            gulp_sapporo <= gulp_sapporo_8;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 9)
            gulp_sapporo <= gulp_sapporo_0;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 0)
            gulp_sapporo <= gulp_sapporo_3;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 4)
            gulp_sapporo <= gulp_sapporo_10;
          else
            gulp_sapporo <= gulp_sapporo_7;
          end
        gulp_sapporo_8: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 0)
            gulp_sapporo <= gulp_sapporo_4;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 14)
            gulp_sapporo <= gulp_sapporo_9;
          else
            gulp_sapporo <= gulp_sapporo_8;
          end
        gulp_sapporo_9: begin
          if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 2)
            gulp_sapporo <= gulp_sapporo_4;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 15)
            gulp_sapporo <= gulp_sapporo_9;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 14)
            gulp_sapporo <= gulp_sapporo_10;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 0)
            gulp_sapporo <= gulp_sapporo_5;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 6)
            gulp_sapporo <= gulp_sapporo_3;
          else if ({bull_would,dorkus_sand,devotion_knot,atoms_whacky} == 12)
            gulp_sapporo <= gulp_sapporo_8;
          else
            gulp_sapporo <= gulp_sapporo_9;
          end
        gulp_sapporo_10: begin
            gulp_sapporo <= gulp_sapporo_10;
          end
        default: gulp_sapporo <= gulp_sapporo_0;
      endcase
  end

// State Mek gulp_sapporo Output logic
always @(gulp_sapporo)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (gulp_sapporo[3:1])
        gulp_sapporo_0: begin
            drdeath_chuck = 0;
            pluto_quebec = 0;
            indigo_hurt = 0;
            juliet_doobie = 0;
            acid_wheezer = 0;
            larry_hagrid = 0;
            popcorn_air = 0;
            odin_brothers = 1;
            deuce_crack = 0;
          end
        gulp_sapporo_1: begin
            drdeath_chuck = 0;
            pluto_quebec = 0;
            indigo_hurt = 1;
            juliet_doobie = 0;
            acid_wheezer = 0;
            larry_hagrid = 0;
            popcorn_air = 1;
            odin_brothers = 0;
            deuce_crack = 1;
          end
        gulp_sapporo_2: begin
            drdeath_chuck = 1;
            pluto_quebec = 0;
            indigo_hurt = 0;
            juliet_doobie = 0;
            acid_wheezer = 0;
            larry_hagrid = 0;
            popcorn_air = 0;
            odin_brothers = 1;
            deuce_crack = 1;
          end
        gulp_sapporo_3: begin
            drdeath_chuck = 1;
            pluto_quebec = 0;
            indigo_hurt = 1;
            juliet_doobie = 0;
            acid_wheezer = 0;
            larry_hagrid = 1;
            popcorn_air = 0;
            odin_brothers = 1;
            deuce_crack = 0;
          end
        gulp_sapporo_4: begin
            drdeath_chuck = 1;
            pluto_quebec = 1;
            indigo_hurt = 0;
            juliet_doobie = 1;
            acid_wheezer = 1;
            larry_hagrid = 0;
            popcorn_air = 0;
            odin_brothers = 0;
            deuce_crack = 1;
          end
        default: begin
            drdeath_chuck = 1;
            pluto_quebec = 1;
            indigo_hurt = 1;
            juliet_doobie = 0;
            acid_wheezer = 1;
            larry_hagrid = 0;
            popcorn_air = 0;
            odin_brothers = 1;
            deuce_crack = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire crab_rarest_out;
nut_004_lut #(2) nut_004_lut_inst_crab_rarest (
  .din({wujing_golf,viagra_red}),
  .mask(4'b0100),
  .out(crab_rarest_out)
);

always @(crab_rarest_out)
begin
   devotion_ants = crab_rarest_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire hp_lala_out;
nut_004_lut #(2) nut_004_lut_inst_hp_lala (
  .din({davidlin_fuji,kaisha_jonas}),
  .mask(4'b0000),
  .out(hp_lala_out)
);

always @(hp_lala_out)
begin
   haze_children = hp_lala_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire victor_shuda_out;
nut_004_lut #(3) nut_004_lut_inst_victor_shuda (
  .din({vcc,gnd,southern_papa}),
  .mask(8'b00000000),
  .out(victor_shuda_out)
);

always @(victor_shuda_out)
begin
   cuckoo_haze = victor_shuda_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire tango_ulysses_out;
nut_004_lut #(2) nut_004_lut_inst_tango_ulysses (
  .din({gnd,noah_yellow}),
  .mask(4'h2),
  .out(tango_ulysses_out)
);

always @(tango_ulysses_out)
begin
   touch_gm = tango_ulysses_out;
end

reg feedback_pt_768;

always @(vcc or feedback_pt_768)
  begin
      moron_ramone =  vcc ^  feedback_pt_768;
  end

reg feedback_pt_769;

always @(hinge_sears or feedback_pt_769)
  begin
      neon_sortout = !hinge_sears &  feedback_pt_769;
  end

reg feedback_pt_770;

always @(the_pope_palm or feedback_pt_770)
  begin
      dragon_bonker = !the_pope_palm |  feedback_pt_770;
  end

reg feedback_pt_771;

always @(gnd or feedback_pt_771)
  begin
      dopey_bacon =  gnd ^  feedback_pt_771;
  end

reg feedback_pt_772;

always @(pluto_sgates or feedback_pt_772)
  begin
      gm_grams = !pluto_sgates &  feedback_pt_772;
  end

reg feedback_pt_773;

always @(viagra_red or feedback_pt_773)
  begin
      wiggum_curie =  viagra_red & !feedback_pt_773;
  end

reg feedback_pt_774;

always @(palmer_mrbill or feedback_pt_774)
  begin
      moulin_deuce = !palmer_mrbill & !feedback_pt_774;
  end

reg feedback_pt_775;

always @(badger_baron or feedback_pt_775)
  begin
      bfs_monster =  badger_baron &  feedback_pt_775;
  end

reg feedback_pt_776;

always @(salmon_armand or feedback_pt_776)
  begin
      cheese_sheep = !salmon_armand & !feedback_pt_776;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_gonzo <= 0;
    else if (bfs_monster)
      sinew_gonzo <= vcc;
  end

always @(sinew_gonzo)
  begin
      feedback_pt_768 = sinew_gonzo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beef_crank <= 0;
    else if (knot_questo)
      beef_crank <= 0;
    else if (vcc)
      beef_crank <= joker_lucius;
  end

always @(beef_crank)
  begin
      feedback_pt_769 = beef_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dadada_eel <= 0;
    else
      dadada_eel <= vcc;
  end

always @(dadada_eel)
  begin
      feedback_pt_770 = dadada_eel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kangaroo_bolt <= 0;
    else if (gnd)
      kangaroo_bolt <= popcorn_air;
  end

always @(kangaroo_bolt)
  begin
      feedback_pt_771 = kangaroo_bolt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubik_centaur <= 0;
    else if (iceland_advil)
      rubik_centaur <= gnd;
    else if (quail_lumber)
      rubik_centaur <= 0;
  end

always @(rubik_centaur)
  begin
      feedback_pt_772 = rubik_centaur;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      usa_chillis <= 0;
    else if (sinew_gonzo)
      usa_chillis <= spock_tango;
    else if (haze_children)
      usa_chillis <= 0;
  end

always @(usa_chillis)
  begin
      feedback_pt_773 = usa_chillis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yak_stemcell <= 1;
    else
      yak_stemcell <= neon_sortout;
  end

always @(yak_stemcell)
  begin
      feedback_pt_774 = yak_stemcell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fallen_ohno <= 1;
    else
      fallen_ohno <= blueled_army;
  end

always @(fallen_ohno)
  begin
      feedback_pt_775 = fallen_ohno;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      parrot_tinker <= 1;
    else
      parrot_tinker <= knot_rod;
  end

always @(parrot_tinker)
  begin
      feedback_pt_776 = parrot_tinker;
  end

wire nest_nuclear_wire;

dffeas nest_nuclear_ff (
  .clk(clock1),
  .d(goblin_drevil),
  .ena(vcc),
  .sclr(loser_lad),
  .sload(duey_speedyg),
  .asdata(vcc),
  .clrn(!reset1),
  .q(nest_nuclear_wire)
);

always @(nest_nuclear_wire) begin
   heidi_might = nest_nuclear_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gerrit_remus <= 0;
    else if (south_ham)
      gerrit_remus <= 0;
    else if (gnd)
      gerrit_remus <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuckoo_clay <= 1;
    else
      cuckoo_clay <= gnd;
  end

wire maki_indigo_wire;

dffeas maki_indigo_ff (
  .clk(clock1),
  .d(gnd),
  .ena(gnd),
  .sclr(tin_think),
  .sload(gnd),
  .asdata(neon_sortout),
  .clrn(!reset1),
  .q(maki_indigo_wire)
);

always @(maki_indigo_wire) begin
   juliet_rod = maki_indigo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lxtcen_alpha <= 0;
    else
      lxtcen_alpha <= greenland_doc;
  end

wire stirfry_wine_wire;

dffea stirfry_wine_ff (
  .clk(clock1),
  .d(zhuang_goat),
  .ena(indigo_hurt),
  .adata(vcc),
  .clrn(!reset1),
  .q(stirfry_wine_wire)
);

always @(stirfry_wine_wire) begin
   monster_golf = stirfry_wine_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      holland_honda <= 0;
    else if (monster_golf)
      holland_honda <= deuce_crack;
  end

wire brian_beavis_wire;

dffeas brian_beavis_ff (
  .clk(clock1),
  .d(ariel_century),
  .ena(vcc),
  .sclr(todd_green),
  .sload(vcc),
  .asdata(kangaroo_bolt),
  .clrn(!reset1),
  .q(brian_beavis_wire)
);

always @(brian_beavis_wire) begin
   deng_questo = brian_beavis_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chicken_nail <= 0;
    else
      chicken_nail <= honey_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      midas_thankee <= 0;
    else if (cuckoo_haze)
      midas_thankee <= delta_yohimbe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      alpha_clay <= 0;
    else
      alpha_clay <= midas_thankee;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honda_kang <= 1;
    else
      honda_kang <= gnd;
  end

// Random combinatorial logic block
always@(*)
  begin
      stick_foryou = ~( ( ~( ~( ( dadada_ramone | ~usa_chillis ) ) ^ ( ~( honda_kang ) ^ parrot_tinker & ~loser_lad ) ) ) ^ ~( ~( ( ~( vcc ^ ~cuckoo_clay ) ) ) ) );
  end

// State Mek usa_stoner Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      usa_stoner <= usa_stoner_0;
    else
      case (usa_stoner)
        usa_stoner_0: begin
          if ({donkey_lad,gnd,chicken_nail,vcc} == 6)
            usa_stoner <= usa_stoner_2;
          else if ({donkey_lad,gnd,chicken_nail,vcc} == 11)
            usa_stoner <= usa_stoner_0;
          else if ({donkey_lad,gnd,chicken_nail,vcc} == 4)
            usa_stoner <= usa_stoner_1;
          else
            usa_stoner <= usa_stoner_0;
          end
        usa_stoner_1: begin
          if ({donkey_lad,gnd,chicken_nail,vcc} == 2)
            usa_stoner <= usa_stoner_1;
          else if ({donkey_lad,gnd,chicken_nail,vcc} == 15)
            usa_stoner <= usa_stoner_1;
          else if ({donkey_lad,gnd,chicken_nail,vcc} == 6)
            usa_stoner <= usa_stoner_2;
          else if ({donkey_lad,gnd,chicken_nail,vcc} == 1)
            usa_stoner <= usa_stoner_1;
          else
            usa_stoner <= usa_stoner_1;
          end
        usa_stoner_2: begin
          if ({donkey_lad,gnd,chicken_nail,vcc} == 15)
            usa_stoner <= usa_stoner_1;
          else if ({donkey_lad,gnd,chicken_nail,vcc} == 8)
            usa_stoner <= usa_stoner_3;
          else
            usa_stoner <= usa_stoner_2;
          end
        usa_stoner_3: begin
          if ({donkey_lad,gnd,chicken_nail,vcc} == 10)
            usa_stoner <= usa_stoner_2;
          else
            usa_stoner <= usa_stoner_3;
          end
        default: usa_stoner <= usa_stoner_0;
      endcase
  end

// State Mek usa_stoner Output logic
always @(usa_stoner)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (usa_stoner[3:1])
        usa_stoner_0: begin
            yummy_newt = 1;
            freaky_condit = 1;
            donut_zhuang = 1;
            xray_junkie = 1;
            hippo_buddha = 1;
            sand_ready = 1;
            bull_onion = 0;
            rum_waster = 0;
            rojas_tango = 0;
            spain_stick = 0;
          end
        usa_stoner_1: begin
            yummy_newt = 1;
            freaky_condit = 0;
            donut_zhuang = 1;
            xray_junkie = 1;
            hippo_buddha = 1;
            sand_ready = 0;
            bull_onion = 0;
            rum_waster = 1;
            rojas_tango = 0;
            spain_stick = 1;
          end
        default: begin
            yummy_newt = 0;
            freaky_condit = 1;
            donut_zhuang = 0;
            xray_junkie = 0;
            hippo_buddha = 1;
            sand_ready = 1;
            bull_onion = 1;
            rum_waster = 0;
            rojas_tango = 0;
            spain_stick = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire quail_pirate_out;
nut_004_lut #(2) nut_004_lut_inst_quail_pirate (
  .din({geisha_dorkus,vcc}),
  .mask(4'hc),
  .out(quail_pirate_out)
);

always @(quail_pirate_out)
begin
   fsncens_spyro = quail_pirate_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_004_lut.v
///////////////////////////////////////////

wire abel_deng_out;
nut_004_lut #(1) nut_004_lut_inst_abel_deng (
  .din({athena_sierra}),
  .mask(2'b00),
  .out(abel_deng_out)
);

always @(abel_deng_out)
begin
   weevil_papa = abel_deng_out;
end

// 5 by 7 to 5 bit A*B mult
reg  [4:0] eggsalad_roe_a;
always @(devotion_ants or vcc or drdeath_chuck or webvan_peta or xray_potter) begin
  eggsalad_roe_a = {devotion_ants,vcc,drdeath_chuck,webvan_peta,xray_potter};
end

reg signed [6:0] eggsalad_roe_b;
always @(kangaroo_bolt or huey_comtrex or southern_papa or rubik_centaur or gnd or life_wine or withme_yummy) begin
  eggsalad_roe_b = {kangaroo_bolt,huey_comtrex,southern_papa,rubik_centaur,gnd,life_wine,withme_yummy};
end

always @(eggsalad_roe_a or eggsalad_roe_b)
  begin
      {spyro_kmfdm,squad_genji,elephant_mine,art_anarchist,carolina_acid} = 
	  	  ~eggsalad_roe_a * 
		  ~eggsalad_roe_b;
  end


initial begin
    {lucent_cain,larry_shuda,bep_chairman,tobe_roid} = 0;
end

// Registered 4 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (donut_zhuang)
      {lucent_cain,larry_shuda,bep_chairman,tobe_roid} <= 0;
    else if (yummy_newt)
      {lucent_cain,larry_shuda,bep_chairman,tobe_roid} <=
		  {neon_sortout,balloon_what,art_anarchist,vcc};
    else
      {lucent_cain,larry_shuda,bep_chairman,tobe_roid} <=
		 {vcc,dragon_bonker,deuce_crack,xray_junkie} + 
		 {guy_powder,blueled_kilo,pcp_bfs,cheez_voodoo};
  end

// data words for bus muxing
wire [4:0] papyrus_genji_word0_data;
wire [4:0] papyrus_genji_word1_data;
wire [4:0] papyrus_genji_word2_data;
assign papyrus_genji_word0_data = {atoms_whacky,gnd,blueled_army,alpha_badger,life_wine};
assign papyrus_genji_word1_data = {alpha_clay,heidi_might,pluto_quebec,fsncens_spyro,parrot_tinker};
assign papyrus_genji_word2_data = {vcc,gnd,odin_brothers,xray_junkie,acid_wheezer};

// Registered output word
reg  [4:0] papyrus_genji_result;

initial begin
    papyrus_genji_result = 0;
end


// Clearable 3:1 registered MUX
always @ (posedge clock1)
begin
   if (fufu_jonas)
     papyrus_genji_result <= 0;
   else if (stick_foryou)
     papyrus_genji_result <= papyrus_genji_word0_data;
   else if (lxtcen_alpha)
     papyrus_genji_result <= papyrus_genji_word1_data;
   else
     papyrus_genji_result <= papyrus_genji_word2_data;
end


// Send the out bus back to the world
always @(papyrus_genji_result)
begin
    usa_huey = papyrus_genji_result[0];
    palm_wukong = papyrus_genji_result[1];
    ring_abel = papyrus_genji_result[2];
    questo_rojas = papyrus_genji_result[3];
    moron_palmer = papyrus_genji_result[4];
end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intel_aspirin <= 0;
    else
    case ({boing_diagon,lucent_cain})
       0 : intel_aspirin <= intel_aspirin;
       1 : intel_aspirin <= intel_aspirin;
       2 : intel_aspirin <= dopey_bacon;
       3 : intel_aspirin <= intel_aspirin;
       default : intel_aspirin <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kungfu_sheep <= 0;
    else
    case ({rum_waster,vcc})
       0 : kungfu_sheep <= delta_yohimbe;
       1 : kungfu_sheep <= kungfu_sheep;
       2 : kungfu_sheep <= kungfu_sheep;
       3 : kungfu_sheep <= kungfu_sheep;
       default : kungfu_sheep <= 0;
    endcase
  end

reg feedback_pt_777;

always @(haze_children or feedback_pt_777)
  begin
      beemer_xterm = !haze_children ^ !feedback_pt_777;
  end

reg feedback_pt_778;

always @(moron_ramone or feedback_pt_778)
  begin
      speed_coffee = !moron_ramone ^ !feedback_pt_778;
  end

reg feedback_pt_779;

always @(desade_india or feedback_pt_779)
  begin
      lucius_iguana =  desade_india &  feedback_pt_779;
  end

reg feedback_pt_780;

always @(southern_cafe or feedback_pt_780)
  begin
      stix_animal = !southern_cafe |  feedback_pt_780;
  end

reg feedback_pt_781;

always @(desert_sierra or feedback_pt_781)
  begin
      rerun_wujing =  desert_sierra |  feedback_pt_781;
  end

reg feedback_pt_782;

always @(stix_animal or feedback_pt_782)
  begin
      bamboo_yellow = !stix_animal & !feedback_pt_782;
  end

reg feedback_pt_783;

always @(piggish_might or feedback_pt_783)
  begin
      sierra_pdiddy = !piggish_might & !feedback_pt_783;
  end

wire over_sierra_wire;

dffea over_sierra_ff (
  .clk(clock1),
  .d(boing_diagon),
  .ena(moulin_deuce),
  .adata(kungfu_sheep),
  .clrn(!reset1),
  .q(over_sierra_wire)
);

always @(over_sierra_wire) begin
   taoist_klaas = over_sierra_wire;
end

always @(taoist_klaas)
  begin
      feedback_pt_777 = taoist_klaas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maki_joseph <= 0;
    else if (salami_ibm)
      maki_joseph <= 0;
    else if (gnd)
      maki_joseph <= spain_stick;
  end

always @(maki_joseph)
  begin
      feedback_pt_778 = maki_joseph;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gin_gulp <= 0;
    else if (grumby_deng)
      gin_gulp <= tiger_hurt;
  end

always @(gin_gulp)
  begin
      feedback_pt_779 = gin_gulp;
  end

wire notsure_opus_wire;

dffeas notsure_opus_ff (
  .clk(clock1),
  .d(taoist_klaas),
  .ena(drdeath_chuck),
  .sclr(juliet_doobie),
  .sload(vcc),
  .asdata(tiger_hurt),
  .clrn(!reset1),
  .q(notsure_opus_wire)
);

always @(notsure_opus_wire) begin
   knot_yellow = notsure_opus_wire;
end

always @(knot_yellow)
  begin
      feedback_pt_780 = knot_yellow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_pasta <= 0;
    else if (gin_gulp)
      webvan_pasta <= 0;
    else if (palm_wukong)
      webvan_pasta <= sand_ready;
  end

always @(webvan_pasta)
  begin
      feedback_pt_781 = webvan_pasta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      potato_larry <= 1;
    else
      potato_larry <= vcc;
  end

always @(potato_larry)
  begin
      feedback_pt_782 = potato_larry;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      att_leviticus <= 1;
    else
      att_leviticus <= holland_honda;
  end

always @(att_leviticus)
  begin
      feedback_pt_783 = att_leviticus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foryou_jxnbox <= 0;
    else if (neptune_willy)
      foryou_jxnbox <= 0;
    else if (hippo_buddha)
      foryou_jxnbox <= ring_abel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_moe <= 0;
    else if (desert_sierra)
      richard_moe <= 0;
    else if (gnd)
      richard_moe <= cheese_sheep;
  end

wire lamer_rufus_wire;

dffeas lamer_rufus_ff (
  .clk(clock1),
  .d(questo_rojas),
  .ena(att_leviticus),
  .sclr(vcc),
  .sload(larry_hagrid),
  .asdata(gnd),
  .clrn(!reset1),
  .q(lamer_rufus_wire)
);

always @(lamer_rufus_wire) begin
   smack_wonder = lamer_rufus_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sake_rerun <= 0;
    else if (juliet_doobie)
      sake_rerun <= scotch_beast;
    else if (potato_larry)
      sake_rerun <= 0;
  end

wire star_brothers_wire;

dffea star_brothers_ff (
  .clk(clock1),
  .d(fallen_ohno),
  .ena(gutter_jcrew),
  .adata(gerrit_remus),
  .clrn(!reset1),
  .q(star_brothers_wire)
);

always @(star_brothers_wire) begin
   elguapo_yoda = star_brothers_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mine_brothers <= 0;
    else if (vcc)
      mine_brothers <= wiggum_curie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_peta <= 1;
    else
      onion_peta <= heidi_might;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dork_knot <= 0;
    else if (geisha_dorkus)
      dork_knot <= juliet_doobie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_muffin <= 1;
    else
      knot_muffin <= webvan_pasta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ebay_ohisee <= 1;
    else
      ebay_ohisee <= cafe_kang;
  end

wire snape_pizza_wire;

dffeas snape_pizza_ff (
  .clk(clock1),
  .d(gnd),
  .ena(salami_ibm),
  .sclr(robust_xterm),
  .sload(plaster_echo),
  .asdata(vcc),
  .clrn(!reset1),
  .q(snape_pizza_wire)
);

always @(snape_pizza_wire) begin
   ariel_callme = snape_pizza_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blessyou_dow <= 1;
    else
      blessyou_dow <= dork_knot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beef_hawaii <= 0;
    else if (onion_peta)
      beef_hawaii <= broom_riddler;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bush_zhuang <= 0;
    else if (boing_diagon)
      bush_zhuang <= carolina_acid;
    else if (toysrus_roe)
      bush_zhuang <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fury_bloom <= 0;
    else if (carolina_acid)
      fury_bloom <= gnd;
    else if (palmer_mrbill)
      fury_bloom <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_filch <= 0;
    else if (bfs_monster)
      rerun_filch <= gerrit_remus;
    else if (mine_brothers)
      rerun_filch <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whoiswho_pig <= 0;
    else if (juliet_rod)
      whoiswho_pig <= lucius_iguana;
  end

wire gm_curly_wire;

dffea gm_curly_ff (
  .clk(clock1),
  .d(knot_yellow),
  .ena(delta_yohimbe),
  .adata(gnd),
  .clrn(!reset1),
  .q(gm_curly_wire)
);

always @(gm_curly_wire) begin
   tonks_uniform = gm_curly_wire;
end

reg feedback_pt_784;

always @(smack_wonder or feedback_pt_784)
  begin
      pomodoro_hulk =  smack_wonder | !feedback_pt_784;
  end

reg feedback_pt_785;

always @(elephant_mine or feedback_pt_785)
  begin
      donkey_pig =  elephant_mine ^  feedback_pt_785;
  end

reg feedback_pt_786;

always @(beef_hawaii or feedback_pt_786)
  begin
      kebab_sake =  beef_hawaii ^ !feedback_pt_786;
  end

reg feedback_pt_787;

always @(vcc or feedback_pt_787)
  begin
      witch_joseph =  vcc |  feedback_pt_787;
  end

reg feedback_pt_788;

always @(witch_joseph or feedback_pt_788)
  begin
      unicorn_alpha =  witch_joseph &  feedback_pt_788;
  end

reg feedback_pt_789;

always @(fury_bloom or feedback_pt_789)
  begin
      sogood_india =  fury_bloom |  feedback_pt_789;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pierre_taoist <= 0;
    else if (quail_lumber)
      pierre_taoist <= gnd;
    else if (gnd)
      pierre_taoist <= 0;
  end

always @(pierre_taoist)
  begin
      feedback_pt_784 = pierre_taoist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_junkie <= 0;
    else
      sogood_junkie <= boing_diagon;
  end

always @(sogood_junkie)
  begin
      feedback_pt_785 = sogood_junkie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      happy_legos <= 0;
    else
      happy_legos <= zhuang_goat;
  end

always @(happy_legos)
  begin
      feedback_pt_786 = happy_legos;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      solder_haze <= 1;
    else
      solder_haze <= lala_davidlin;
  end

always @(solder_haze)
  begin
      feedback_pt_787 = solder_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eagle_red <= 0;
    else if (gnd)
      eagle_red <= vcc;
    else if (vcc)
      eagle_red <= 0;
  end

always @(eagle_red)
  begin
      feedback_pt_788 = eagle_red;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      questo_show <= 0;
    else
      questo_show <= kungfu_sheep;
  end

always @(questo_show)
  begin
      feedback_pt_789 = questo_show;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      krabapple_emu <= 0;
    else
      krabapple_emu <= vcc;
  end

wire killer_lagoon_wire;

dffeas killer_lagoon_ff (
  .clk(clock1),
  .d(candle_pig),
  .ena(alpha_badger),
  .sclr(kana_helena),
  .sload(maki_joseph),
  .asdata(moulin_deuce),
  .clrn(!reset1),
  .q(killer_lagoon_wire)
);

always @(killer_lagoon_wire) begin
   fufu_ulysses = killer_lagoon_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iron_zebra <= 0;
    else if (bush_zhuang)
      iron_zebra <= 0;
    else if (happy_legos)
      iron_zebra <= ariel_century;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      scotland_bush <= 0;
    else if (iron_zebra)
      scotland_bush <= larry_shuda;
  end

wire hanger_zed_wire;

dffeas hanger_zed_ff (
  .clk(clock1),
  .d(xray_junkie),
  .ena(elguapo_yoda),
  .sclr(gnd),
  .sload(kana_helena),
  .asdata(sogood_india),
  .clrn(!reset1),
  .q(hanger_zed_wire)
);

always @(hanger_zed_wire) begin
   fascist_donut = hanger_zed_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_jacuzzi <= 1;
    else
      gm_jacuzzi <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nation_rod <= 0;
    else if (vcc)
      nation_rod <= southern_papa;
    else if (atoms_whacky)
      nation_rod <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bullet_wonton <= 0;
    else if (solder_haze)
      bullet_wonton <= 0;
    else if (squad_genji)
      bullet_wonton <= gerrit_remus;
  end

// 9 bit to 15 bit const mult
always @(bamboo_yellow or vcc or gnd or gnd or vcc or vcc or freaky_condit or plumber_papa or vcc)
  begin
      {troll_hans,crab_hp,yoku_ebi,beef_bismuth,hanger_cheese,faster_snort,minnow_sand,lagoon_dork,george_bullet,ants_cuckoo,stoned_pasta,marquis_bolt,burnout_tuna,danger_jxnbox,touch_legos} = 
	  	  {bamboo_yellow,vcc,gnd,gnd,vcc,vcc,freaky_condit,plumber_papa,vcc} * 
		  14141;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sun_eatem <= 0;
    else
    case ({gnd,larry_shuda})
       0 : sun_eatem <= questo_show;
       1 : sun_eatem <= sun_eatem;
       2 : sun_eatem <= sun_eatem;
       3 : sun_eatem <= gnd;
       default : sun_eatem <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_famulan <= 0;
    else
    case ({gnd,life_wine})
       0 : oscar_famulan <= supurb_barnum;
       1 : oscar_famulan <= icarus_pluto;
       2 : oscar_famulan <= gnd;
       3 : oscar_famulan <= krabapple_emu;
       default : oscar_famulan <= 0;
    endcase
  end

reg feedback_pt_790;

always @(gnd or feedback_pt_790)
  begin
      burning_bono =  gnd ^ !feedback_pt_790;
  end

reg feedback_pt_791;

always @(spyro_kmfdm or feedback_pt_791)
  begin
      ebay_speeding =  spyro_kmfdm & !feedback_pt_791;
  end

reg feedback_pt_792;

always @(holland_honda or feedback_pt_792)
  begin
      biker_thor = !holland_honda ^  feedback_pt_792;
  end

reg feedback_pt_793;

always @(burning_bono or feedback_pt_793)
  begin
      isle_foliage = !burning_bono &  feedback_pt_793;
  end

reg feedback_pt_794;

always @(rerun_wujing or feedback_pt_794)
  begin
      bono_minerva = !rerun_wujing ^  feedback_pt_794;
  end

reg feedback_pt_795;

always @(vcc or feedback_pt_795)
  begin
      pixie_asahi = !vcc ^ !feedback_pt_795;
  end

reg feedback_pt_796;

always @(gnd or feedback_pt_796)
  begin
      testyour_duck =  gnd & !feedback_pt_796;
  end

reg feedback_pt_797;

always @(fufu_jonas or feedback_pt_797)
  begin
      prison_moron = !fufu_jonas ^ !feedback_pt_797;
  end

wire sheep_lao_wire;

dffeas sheep_lao_ff (
  .clk(clock1),
  .d(taoist_klaas),
  .ena(bull_onion),
  .sclr(ants_cuckoo),
  .sload(vcc),
  .asdata(faster_snort),
  .clrn(!reset1),
  .q(sheep_lao_wire)
);

always @(sheep_lao_wire) begin
   ohno_grams = sheep_lao_wire;
end

always @(ohno_grams)
  begin
      feedback_pt_790 = ohno_grams;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kana_tapered <= 0;
    else if (ohno_grams)
      kana_tapered <= sun_eatem;
    else if (burnout_tuna)
      kana_tapered <= 0;
  end

always @(kana_tapered)
  begin
      feedback_pt_791 = kana_tapered;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      satanist_zed <= 1;
    else
      satanist_zed <= speed_coffee;
  end

always @(satanist_zed)
  begin
      feedback_pt_792 = satanist_zed;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      milo_deng <= 0;
    else if (kana_tapered)
      milo_deng <= 0;
    else if (weevil_papa)
      milo_deng <= solder_haze;
  end

always @(milo_deng)
  begin
      feedback_pt_793 = milo_deng;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacques_tank <= 0;
    else if (touch_legos)
      jacques_tank <= 0;
    else if (foryou_jxnbox)
      jacques_tank <= bep_chairman;
  end

always @(jacques_tank)
  begin
      feedback_pt_794 = jacques_tank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bcdcensor_dig <= 0;
    else if (rufus_pdaddy)
      bcdcensor_dig <= 0;
    else if (kana_helena)
      bcdcensor_dig <= chicken_louie;
  end

always @(bcdcensor_dig)
  begin
      feedback_pt_795 = bcdcensor_dig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intel_itchy <= 0;
    else if (gm_jacuzzi)
      intel_itchy <= pomodoro_hulk;
    else if (vcc)
      intel_itchy <= 0;
  end

always @(intel_itchy)
  begin
      feedback_pt_796 = intel_itchy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      clay_cuckoo <= 0;
    else if (gnd)
      clay_cuckoo <= fascist_donut;
    else if (blessyou_dow)
      clay_cuckoo <= 0;
  end

always @(clay_cuckoo)
  begin
      feedback_pt_797 = clay_cuckoo;
  end

wire porfavor_odin_wire;

dffeas porfavor_odin_ff (
  .clk(clock1),
  .d(athena_sierra),
  .ena(rufus_pdaddy),
  .sclr(kana_helena),
  .sload(scotland_bush),
  .asdata(the_pope_palm),
  .clrn(!reset1),
  .q(porfavor_odin_wire)
);

always @(porfavor_odin_wire) begin
   huey_drevil = porfavor_odin_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      troll_hut <= 0;
    else if (gnd)
      troll_hut <= 0;
    else if (george_bullet)
      troll_hut <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speedyg_sand <= 0;
    else
      speedyg_sand <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      show_peace <= 1;
    else
      show_peace <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      safeway_kappa <= 0;
    else if (freaky_condit)
      safeway_kappa <= 0;
    else if (yak_stemcell)
      safeway_kappa <= lucent_cain;
  end

wire drax_rafting_wire;

dffea drax_rafting_ff (
  .clk(clock1),
  .d(dadada_eel),
  .ena(nation_rod),
  .adata(vcc),
  .clrn(!reset1),
  .q(drax_rafting_wire)
);

always @(drax_rafting_wire) begin
   chief_tobe = drax_rafting_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      obiwan_monkey <= 0;
    else if (vcc)
      obiwan_monkey <= vcc;
    else if (ariel_callme)
      obiwan_monkey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      martin_emu <= 0;
    else if (gnd)
      martin_emu <= 0;
    else if (taoist_klaas)
      martin_emu <= joker_lucius;
  end

wire ozzy_snape_wire;

dffeas ozzy_snape_ff (
  .clk(clock1),
  .d(isle_foliage),
  .ena(gnd),
  .sclr(gnd),
  .sload(speedyg_sand),
  .asdata(marquis_bolt),
  .clrn(!reset1),
  .q(ozzy_snape_wire)
);

always @(ozzy_snape_wire) begin
   jonas_nigiri = ozzy_snape_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moses_marge <= 0;
    else if (gnd)
      moses_marge <= 0;
    else if (crab_hp)
      moses_marge <= pierre_taoist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pacbell_curie <= 1;
    else
      pacbell_curie <= obiwan_monkey;
  end

reg feedback_pt_798;

always @(pierre_taoist or feedback_pt_798)
  begin
      meth_burner = !pierre_taoist &  feedback_pt_798;
  end

reg feedback_pt_799;

always @(vcc or feedback_pt_799)
  begin
      gap_foiled = !vcc | !feedback_pt_799;
  end

reg feedback_pt_800;

always @(vcc or feedback_pt_800)
  begin
      madeye_rescue =  vcc &  feedback_pt_800;
  end

reg feedback_pt_801;

always @(rerun_filch or feedback_pt_801)
  begin
      moreand_enoch = !rerun_filch & !feedback_pt_801;
  end

reg feedback_pt_802;

always @(gnd or feedback_pt_802)
  begin
      plague_buddha =  gnd ^  feedback_pt_802;
  end

reg feedback_pt_803;

always @(vcc or feedback_pt_803)
  begin
      jcrew_eel = !vcc ^  feedback_pt_803;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_illegal <= 0;
    else if (vcc)
      oscar_illegal <= eagle_red;
  end

always @(oscar_illegal)
  begin
      feedback_pt_798 = oscar_illegal;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romex_india <= 0;
    else if (hanger_cheese)
      romex_india <= 0;
    else if (sogood_junkie)
      romex_india <= madeye_rescue;
  end

always @(romex_india)
  begin
      feedback_pt_799 = romex_india;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      picture_att <= 0;
    else if (ebay_ohisee)
      picture_att <= stoned_pasta;
  end

always @(picture_att)
  begin
      feedback_pt_800 = picture_att;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_vampire <= 0;
    else
      tobe_vampire <= rerun_filch;
  end

always @(tobe_vampire)
  begin
      feedback_pt_801 = tobe_vampire;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sake_blue <= 0;
    else if (gnd)
      sake_blue <= athena_sierra;
  end

always @(sake_blue)
  begin
      feedback_pt_802 = sake_blue;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sun_jacuzzi <= 1;
    else
      sun_jacuzzi <= gnd;
  end

always @(sun_jacuzzi)
  begin
      feedback_pt_803 = sun_jacuzzi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ariel_giants <= 0;
    else if (vcc)
      ariel_giants <= vcc;
    else if (lucent_cain)
      ariel_giants <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crank_juliet <= 0;
    else
      crank_juliet <= minnow_sand;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beef_rufus <= 0;
    else if (sake_blue)
      beef_rufus <= beef_bismuth;
    else if (pixie_asahi)
      beef_rufus <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rod_maryann <= 0;
    else if (jacques_tank)
      rod_maryann <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bull_pacific <= 0;
    else if (gnd)
      bull_pacific <= prison_moron;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bep_vulture <= 0;
    else
      bep_vulture <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peace_october <= 0;
    else if (gnd)
      peace_october <= 0;
    else if (safeway_kappa)
      peace_october <= tonks_uniform;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salami_howell <= 0;
    else if (donkey_pig)
      salami_howell <= 0;
    else if (unicorn_alpha)
      salami_howell <= bullet_wonton;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      faster_bacon <= 0;
    else if (gm_grams)
      faster_bacon <= 0;
    else if (safeway_kappa)
      faster_bacon <= hurt_genesis;
  end

wire stick_dog_wire;

dffeas stick_dog_ff (
  .clk(clock1),
  .d(peace_october),
  .ena(moses_marge),
  .sclr(oscar_comrade),
  .sload(moreand_enoch),
  .asdata(south_ham),
  .clrn(!reset1),
  .q(stick_dog_wire)
);

always @(stick_dog_wire) begin
   arizona_pizza = stick_dog_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jxnbox_bacon <= 0;
    else
      jxnbox_bacon <= south_ham;
  end

wire mozart_tiger_wire;

dffeas mozart_tiger_ff (
  .clk(clock1),
  .d(deng_questo),
  .ena(maki_joseph),
  .sclr(gnd),
  .sload(donkey_pig),
  .asdata(solder_haze),
  .clrn(!reset1),
  .q(mozart_tiger_wire)
);

always @(mozart_tiger_wire) begin
   crack_arthur = mozart_tiger_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_nihlist <= 0;
    else if (vcc)
      pepsi_nihlist <= fufu_ulysses;
    else if (gnd)
      pepsi_nihlist <= 0;
  end

// data words for bus muxing
wire [8:0] meth_sgates_word0_data;
wire [8:0] meth_sgates_word1_data;
wire [8:0] meth_sgates_word2_data;
wire [8:0] meth_sgates_word3_data;
wire [8:0] meth_sgates_word4_data;
wire [8:0] meth_sgates_word5_data;
wire [8:0] meth_sgates_word6_data;
wire [8:0] meth_sgates_word7_data;
wire [8:0] meth_sgates_word8_data;
wire [8:0] meth_sgates_word9_data;
wire [8:0] meth_sgates_word10_data;
wire [8:0] meth_sgates_word11_data;
wire [8:0] meth_sgates_word12_data;
wire [8:0] meth_sgates_word13_data;
assign meth_sgates_word0_data = {picture_att,vcc,richard_moe,crank_juliet,sun_jacuzzi,mine_brothers,satanist_zed,gm_grams,gnd};
assign meth_sgates_word1_data = {ariel_callme,troll_hut,squad_genji,gnd,sun_eatem,testyour_duck,jxnbox_bacon,usa_huey,bep_vulture};
assign meth_sgates_word2_data = {chicken_louie,oscar_famulan,lagoon_dork,vcc,isle_foliage,alpha_clay,gnd,show_peace,vcc};
assign meth_sgates_word3_data = {pierre_taoist,crack_arthur,holland_honda,jonas_nigiri,troll_hans,meth_burner,troll_hut,satanist_zed,burnout_tuna};
assign meth_sgates_word4_data = {gnd,bep_chairman,pepsi_nihlist,prison_moron,gnd,desert_sierra,vcc,vcc,knot_muffin};
assign meth_sgates_word5_data = {bcdcensor_dig,sake_rerun,bull_pacific,vcc,dadada_eel,vcc,yoku_ebi,vcc,foryou_jxnbox};
assign meth_sgates_word6_data = {jxnbox_bacon,alpha_clay,vcc,ariel_giants,chief_tobe,milo_deng,burnout_tuna,arizona_pizza,oscar_comrade};
assign meth_sgates_word7_data = {pacbell_curie,danger_jxnbox,minnow_sand,crack_arthur,minnow_sand,ebay_ohisee,clay_cuckoo,gap_foiled,squad_genji};
assign meth_sgates_word8_data = {gm_grams,scotland_bush,pepsi_nihlist,safeway_kappa,palm_wukong,the_pope_palm,vcc,pacbell_curie,holland_honda};
assign meth_sgates_word9_data = {marquis_bolt,vcc,tobe_roid,safeway_kappa,xray_potter,unicorn_alpha,martin_emu,show_peace,beef_rufus};
assign meth_sgates_word10_data = {xray_junkie,vcc,huey_drevil,moses_marge,ariel_callme,danger_jxnbox,rod_maryann,gnd,testyour_duck};
assign meth_sgates_word11_data = {gnd,palm_wukong,gnd,faster_bacon,jxnbox_bacon,alpha_clay,moses_marge,unicorn_alpha,gnd};
assign meth_sgates_word12_data = {vcc,cheese_sheep,oscar_famulan,pierre_taoist,bull_pacific,desert_sierra,danger_jxnbox,gnd,richard_moe};
assign meth_sgates_word13_data = {oscar_illegal,vcc,chief_tobe,vcc,fufu_jonas,vcc,south_ham,vcc,plague_buddha};

// select control for bus muxing
wire [12:0] meth_sgates_select;
assign meth_sgates_select = {oscar_comrade,gnd,vcc,vcc,arizona_pizza,ariel_callme,gerrit_remus,troll_hut,satanist_zed,arizona_pizza,vcc,gap_foiled,salami_howell};


// Mux output word
reg [8:0] meth_sgates_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    meth_sgates_result = meth_sgates_word0_data;
    if (meth_sgates_select[2] && meth_sgates_select[2])
        meth_sgates_result = meth_sgates_word11_data;

    if (meth_sgates_select[5])
        meth_sgates_result = meth_sgates_word7_data;

    if (meth_sgates_select == 16)
        meth_sgates_result = meth_sgates_word3_data;

    if (meth_sgates_select == 86)
        meth_sgates_result = 165;

    if (meth_sgates_select == 84)
        meth_sgates_result = meth_sgates_word2_data;

    if (meth_sgates_select == 72)
        meth_sgates_result = ~meth_sgates_word13_data;

    if (meth_sgates_select == 72)
        meth_sgates_result = 31;

    if (meth_sgates_select == 169)
        meth_sgates_result = meth_sgates_word0_data;

    if (meth_sgates_select == 91)
        meth_sgates_result = 229;

    if (meth_sgates_select[4])
        meth_sgates_result = meth_sgates_word11_data;

    if (meth_sgates_select == 2)
        meth_sgates_result = 0;

    if (meth_sgates_select[5])
        meth_sgates_result = meth_sgates_word9_data;

end


// Send the out bus back to the world
always @(meth_sgates_result)
begin
    jacob_chillis = meth_sgates_result[0];
    ring_tapered = meth_sgates_result[1];
    cocaine_bfs = meth_sgates_result[2];
    norbert_ring = meth_sgates_result[3];
    lupin_duck = meth_sgates_result[4];
    rouge_bubba = meth_sgates_result[5];
    rojas_luthor = meth_sgates_result[6];
    stirfry_bono = meth_sgates_result[7];
    intel_lumber = meth_sgates_result[8];
end

reg feedback_pt_804;

always @(vcc or feedback_pt_804)
  begin
      cow_cow =  vcc |  feedback_pt_804;
  end

reg feedback_pt_805;

always @(unicorn_alpha or feedback_pt_805)
  begin
      helena_ladder = !unicorn_alpha |  feedback_pt_805;
  end

reg feedback_pt_806;

always @(oscar_comrade or feedback_pt_806)
  begin
      thread_filch =  oscar_comrade ^ !feedback_pt_806;
  end

reg feedback_pt_807;

always @(vcc or feedback_pt_807)
  begin
      drugs_boots = !vcc |  feedback_pt_807;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sears_jxnbox <= 0;
    else
      sears_jxnbox <= oscar_famulan;
  end

always @(sears_jxnbox)
  begin
      feedback_pt_804 = sears_jxnbox;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      enoch_hans <= 0;
    else if (romex_india)
      enoch_hans <= 0;
    else if (gnd)
      enoch_hans <= marquis_bolt;
  end

always @(enoch_hans)
  begin
      feedback_pt_805 = enoch_hans;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pictures_sun <= 1;
    else
      pictures_sun <= stirfry_bono;
  end

always @(pictures_sun)
  begin
      feedback_pt_806 = pictures_sun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kungfu_lucent <= 0;
    else
      kungfu_lucent <= vcc;
  end

always @(kungfu_lucent)
  begin
      feedback_pt_807 = kungfu_lucent;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maryann_rocks <= 0;
    else if (kungfu_lucent)
      maryann_rocks <= cheese_sheep;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      agitator_wine <= 0;
    else if (intel_lumber)
      agitator_wine <= 0;
    else if (gnd)
      agitator_wine <= scotland_bush;
  end

wire riddler_tako_wire;

dffea riddler_tako_ff (
  .clk(clock1),
  .d(the_pope_palm),
  .ena(salami_howell),
  .adata(gnd),
  .clrn(!reset1),
  .q(riddler_tako_wire)
);

always @(riddler_tako_wire) begin
   fortuyn_deng = riddler_tako_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      midas_diagon <= 0;
    else if (vcc)
      midas_diagon <= cow_cow;
    else if (vcc)
      midas_diagon <= 0;
  end

wire ykocens_fury_wire;

dffeas ykocens_fury_ff (
  .clk(clock1),
  .d(cocaine_bfs),
  .ena(vcc),
  .sclr(testyour_duck),
  .sload(fufu_jonas),
  .asdata(troll_hut),
  .clrn(!reset1),
  .q(ykocens_fury_wire)
);

always @(ykocens_fury_wire) begin
   ham_heidi = ykocens_fury_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      macys_lion <= 0;
    else if (marquis_bolt)
      macys_lion <= 0;
    else if (the_pope_palm)
      macys_lion <= marquis_bolt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_brian <= 0;
    else if (jcrew_eel)
      moe_brian <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_atomic <= 0;
    else if (intel_itchy)
      fufu_atomic <= vcc;
    else if (lupin_duck)
      fufu_atomic <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eel_huey <= 0;
    else
      eel_huey <= gnd;
  end

// Priority MUX built out of tri buffers;
// None-hot is Z, conflict not possible
  wire [4:0] tako_marco_dat = {isle_foliage,vcc,gnd,vcc};
  wire [4:0] tako_marco_sel = {macys_lion,oscar_illegal,gnd,rod_maryann};
  wire [4:0] tako_marco_ohsel;

  assign tako_marco_ohsel[0] = tako_marco_sel[0];
  assign tako_marco_ohsel[1] = tako_marco_sel[1] & !tako_marco_ohsel[0];
  assign tako_marco_ohsel[2] = tako_marco_sel[2] & !tako_marco_ohsel[1] & !tako_marco_ohsel[0];
  assign tako_marco_ohsel[3] = tako_marco_sel[3] & !tako_marco_ohsel[2] & !tako_marco_ohsel[1] & !tako_marco_ohsel[0];

  bufif1 (tako_marco,!tako_marco_dat[0], tako_marco_ohsel[0]);
  bufif0 (tako_marco, tako_marco_dat[1],!tako_marco_ohsel[1]);
  bufif0 (tako_marco,!tako_marco_dat[2],!tako_marco_ohsel[2]);
  bufif0 (tako_marco,!tako_marco_dat[3],!tako_marco_ohsel[3]);

///////////////////////////////////////////
// Verilog subdesign in nut_004_word_swap.v
///////////////////////////////////////////

wire [15:0] red_sun_dout;
nut_004_word_swap #(16, 12) nut_004_word_swap_inst_red_sun (
  .data_in({fufu_jonas,marquis_bolt,drugs_boots,satanist_zed,vcc,vcc,oscar_illegal,rufus_pdaddy,jcrew_eel,lucent_cain,lupin_duck,vcc,rod_maryann,the_pope_palm,tobe_roid,fufu_jonas,tobe_vampire,pierre_taoist,moe_brian,satanist_zed,intel_aspirin,vcc,pictures_sun,jcrew_eel,fortuyn_deng,isle_foliage,vcc,rojas_luthor,eel_huey,fortuyn_deng,gnd,ariel_callme,faster_bacon,palm_wukong,pierre_taoist,vcc,pierre_taoist,rod_maryann,kungfu_lucent,plague_buddha,sears_jxnbox,fortuyn_deng,ariel_callme,vcc,vcc,maryann_rocks,vcc,gnd,ohno_grams,larry_hagrid,maryann_rocks,tobe_vampire,marquis_bolt,gnd,norbert_ring,salami_howell,gnd,eel_huey,fortuyn_deng,rouge_bubba,intel_lumber,jcrew_eel,gerrit_remus,vcc,thread_filch,lucent_cain,gnd,gnd,plague_buddha,gnd,gnd,gnd,milo_deng,bull_pacific,helena_ladder,gm_grams,plague_buddha,salami_howell,stirfry_bono,vcc,drugs_boots,maryann_rocks,vcc,chief_tobe,fufu_jonas,gnd,cocaine_bfs,jcrew_eel,gnd,enoch_hans,gnd,jacob_chillis,gm_grams,gnd,gnd,plague_buddha,vcc,ariel_callme,vcc,the_pope_palm,fufu_jonas,jacob_chillis,milo_deng,gnd,enoch_hans,gnd,drugs_boots,scotland_bush,enoch_hans,ring_tapered,pictures_sun,cocaine_bfs,pictures_sun,faster_bacon,larry_hagrid,faster_bacon,midas_diagon,fufu_atomic,palm_wukong,ham_heidi,unicorn_alpha,vcc,unicorn_alpha,ham_heidi,scotland_bush,fufu_atomic,oscar_famulan,gnd,vcc,drugs_boots,oscar_comrade,vcc,ariel_callme,jcrew_eel,lucent_cain,enoch_hans,lucent_cain,oscar_famulan,lucent_cain,rouge_bubba,cocaine_bfs,vcc,chevys_pork,kanji_bubba,deng_pepsi,fufu_pilot,itchy_cubish,boing_guy,boots_theseus,pentium_meth,vcc,hotdog_armand,boitano_yak,ocean_barney,zed_zi,cheez_isle,roe_starwars,chuck_wizard,pepsi_valve,floo_shrimp,curie_xray,tiger_water,mars_handroll,buddha_subway,vcc,heidi_moreand,purple_macys,nigiri_nigiri,geisha_moe,nasdaq_fire,covad_lost,meth_yak,vcc,potter_covad,prison_icarus,spain_vegas,drax_the_pope,albus_china,tracy_think,bagel_fury,troll_green,gnd,lsd_huey,dorkus_fang,gnd,ozzy_ulysses,amex_richard,bfi_billnted,rubeus_goblin,ebay_kedavra,vcc,bomb_pop_pyro}),
  .index_a({ham_mickey,pierre_eagle,enoch_amex,yoda_kaisha,aladdin_curie,venus_homerun,fascist_bambi,vcc,zinc_blessyou,homer_abraham,togos_jonas,gnd,emu_isle,money_desert,bach_aladdin,vulture_east}),
  .index_b({drunken_clay,romex_weapons,draco_sortout,vcc,llama_cuanto,gnd,gnd,too_big_goofy,gnd,hours_acid,oitcen_wicked,vcc,desade_arthur,picante_pizza,gnd,mine_green}),
  .data_out(red_sun_dout)
);

always @(red_sun_dout)
begin
   {feynman_xray,minnie_beavis,comrade_sand,vegan_possum,hanger_tango,jxnbox_hp,bacon_kanji,wheezer_boots,rod_rewire,porfavor_fury,doc_leidiot,salsa_otter,hotdog_enoch,maki_ring,love_in_fish,donut_hoser,malfoy_float,fufu_ebay,tobe_goofy,bravo_gopher,roid_handroll,weasley_goat,hummer_wiggum,sanity_foiled,po_kidnapper,dirk_whiskey,monkey_solder,iguana_east,haze_plumber,raiders_ariel,ulysses_zulu,duck_itchy,noah_dingbat,zeus_protest,oranges_broom,sinus_ernie,sheep_chief,moulin_ceres,zulu_lumber,mao_kbtoys,donkey_ford,stick_cheez,danger_beemer,wrecker_otter,maklak_enoch,fish_beast,frog_klinton,hoser_husks,hp_drugs,nyquil_husks,foiled_hawaii,nirish_pirate,ocha_sneezy,rouge_dutch,hours_huhhuh,banshee_pasta,eggsalad_bolt,snape_subway,floo_nasdaq,iterate_rod,draco_ladder,honey_palm,donkey_gin,elf_chicken,onthepc_meth,escape_gap,eel_speedyg,cuckoo_stix,surprise_yoda,fire_papyrus,tobe_sierra,lantern_pizza,sun_badmonkey,india_rarest,honey_jacques,tabasco_eel,shuda_pixie,gilligan_kana,steaming_eel,speeding_bfi,kmfdm_shuda,oranges_ebi,lsd_potato,kappa_speedyg,zedong_tesla,nail_curly,xray_criminal,drugie_otter,bashful_curie,psycho_beavis,odin_stix,drevil_square,chillis_frog,nihlist_bart,wukong_po,goofy_kanji,pdiddy_eel,Iwin_heidi,guy_portnoy,fallen_whammy,peace_beemer,lucent_nigiri,ihilani_togos,dopey_boots,blue_llama,hut_milo,waffle_shark,gerard_indigo,chips_jjocen,willy_chevys,iron_biker,waffle_pizza,bloom_onthepc,papa_pyro,dog_dig,isle_clothing,graduated_red,barnum_mars,octapus_golf,Iwin_wiggum,pluto_ariel,iron_monkey,iron_goblin,isle_smithers,zhuang_egg,troll_bismuth,hurt_hinge,cain_ford,att_bathroom,onion_fury,barty_burnout,jason_rerun,atilla_bonker,thor_geisha,ibm_ceres,loser_leaky,palm_gopher,duck_speed,what_goblin,curie_moody,lotus_potter,larry_hut,broom_jacob,shrimp_albus,scabbers_guy,jcrew_oracle,pepsi_papa,sapporo_fang,wine_due,golden_arthur,surfer_mexico,dipsy_mine,drax_maryann,beauty_heidi,wicked_onion,subway_lost,biker_pirate,fallen_plague,wanton_rocks,hours_captain,foryou_killme,zebra_south,haze_venus,peta_yellow,bust_north,neon_ozzy,troll_hummer,tabasco_husks,jiminy_goblin,firewalk_tako,fuji_nihlist,barty_loser,marquis_sinew,pacbell_abel,kedavra_albus,downers_cafe,rhvcens_shark,ants_asahi,knot_yankee,bear_erncenso,papa_scotch,whale_oldnavy,wildboar_west,questo_blue,tobe_cubish,tesla_cafe,llama_molokai,marker_yankee,luthor_vadar,siamese_honda,rasp_joey,drugs_otter} = red_sun_dout;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bono_knockout <= 0;
    else if (gnd)
      bono_knockout <= 0;
    else if (elf_chicken)
      bono_knockout <= monkey_solder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ants_fitter <= 0;
    else if (fallen_plague)
      ants_fitter <= 0;
    else if (scabbers_guy)
      ants_fitter <= dirk_whiskey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genji_stix <= 0;
    else
      genji_stix <= marker_yankee;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      penguin_cafe <= 0;
    else if (lotus_potter)
      penguin_cafe <= escape_gap;
    else if (hoser_husks)
      penguin_cafe <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blue_kappa <= 0;
    else if (gerard_indigo)
      blue_kappa <= atilla_bonker;
    else if (eel_speedyg)
      blue_kappa <= 0;
  end

wire lala_genji_wire;

dffeas lala_genji_ff (
  .clk(clock1),
  .d(vcc),
  .ena(intel_lumber),
  .sclr(beauty_heidi),
  .sload(hours_captain),
  .asdata(vcc),
  .clrn(!reset1),
  .q(lala_genji_wire)
);

always @(lala_genji_wire) begin
   nyquil_broom = lala_genji_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spock_egg <= 0;
    else if (zebra_south)
      spock_egg <= sinus_ernie;
    else if (fallen_whammy)
      spock_egg <= 0;
  end

wire dog_yellow_wire;

dffeas dog_yellow_ff (
  .clk(clock1),
  .d(tobe_vampire),
  .ena(salsa_otter),
  .sclr(vcc),
  .sload(xray_criminal),
  .asdata(vcc),
  .clrn(!reset1),
  .q(dog_yellow_wire)
);

always @(dog_yellow_wire) begin
   hotel_faster = dog_yellow_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zedong_romeo <= 0;
    else if (waffle_pizza)
      zedong_romeo <= rhvcens_shark;
    else if (ulysses_zulu)
      zedong_romeo <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pilot_china <= 1;
    else
      pilot_china <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      monkey_crab <= 0;
    else if (thor_geisha)
      monkey_crab <= cain_ford;
    else if (isle_clothing)
      monkey_crab <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      woman_giraffe <= 1;
    else
      woman_giraffe <= tobe_goofy;
  end

wire gap_chowmein_wire;

dffeas gap_chowmein_ff (
  .clk(clock1),
  .d(rod_rewire),
  .ena(palm_wukong),
  .sclr(drugie_otter),
  .sload(wukong_po),
  .asdata(honey_jacques),
  .clrn(!reset1),
  .q(gap_chowmein_wire)
);

always @(gap_chowmein_wire) begin
   zebra_dimetap = gap_chowmein_wire;
end

wire blaster_papa_wire;

dffeas blaster_papa_ff (
  .clk(clock1),
  .d(gnd),
  .ena(vcc),
  .sclr(gnd),
  .sload(the_pope_palm),
  .asdata(monkey_crab),
  .clrn(!reset1),
  .q(blaster_papa_wire)
);

always @(blaster_papa_wire) begin
   blue_floo = blaster_papa_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zulu_barty <= 0;
    else if (vcc)
      zulu_barty <= barnum_mars;
    else if (escape_gap)
      zulu_barty <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joey_wonder <= 0;
    else
      joey_wonder <= larry_hut;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lima_famulan <= 1;
    else
      lima_famulan <= maki_ring;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dork_tukatuk <= 0;
    else if (donkey_gin)
      dork_tukatuk <= steaming_eel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tin_atchoo <= 0;
    else
      tin_atchoo <= gnd;
  end

wire crucio_webvan_wire;

dffea crucio_webvan_ff (
  .clk(clock1),
  .d(gilligan_kana),
  .ena(vcc),
  .adata(haze_plumber),
  .clrn(!reset1),
  .q(crucio_webvan_wire)
);

always @(crucio_webvan_wire) begin
   newt_sgates = crucio_webvan_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dimetap_enoch <= 1;
    else
      dimetap_enoch <= guy_portnoy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_lion <= 1;
    else
      richard_lion <= ariel_callme;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kebab_subway <= 1;
    else
      kebab_subway <= richard_lion;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ohno_bomb_pop <= 1;
    else
      ohno_bomb_pop <= luthor_vadar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salsa_norris <= 0;
    else
      salsa_norris <= wrecker_otter;
  end

wire doc_bison_wire;

dffeas doc_bison_ff (
  .clk(clock1),
  .d(nyquil_husks),
  .ena(ibm_ceres),
  .sclr(downers_cafe),
  .sload(zulu_barty),
  .asdata(banshee_pasta),
  .clrn(!reset1),
  .q(doc_bison_wire)
);

always @(doc_bison_wire) begin
   mine_nest = doc_bison_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speed_brian <= 1;
    else
      speed_brian <= donut_hoser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pdiddy_hawaii <= 0;
    else
      pdiddy_hawaii <= vcc;
  end

wire meffert_lima_wire;

dffeas meffert_lima_ff (
  .clk(clock1),
  .d(haze_plumber),
  .ena(vcc),
  .sclr(vcc),
  .sload(haze_plumber),
  .asdata(vcc),
  .clrn(!reset1),
  .q(meffert_lima_wire)
);

always @(meffert_lima_wire) begin
   helena_sleepy = meffert_lima_wire;
end

wire kabar_holland_wire;

dffeas kabar_holland_ff (
  .clk(clock1),
  .d(peta_yellow),
  .ena(nihlist_bart),
  .sclr(dopey_boots),
  .sload(foiled_hawaii),
  .asdata(maki_ring),
  .clrn(!reset1),
  .q(kabar_holland_wire)
);

always @(kabar_holland_wire) begin
   hours_zealot = kabar_holland_wire;
end

wire popcorn_bfi_wire;

dffeas popcorn_bfi_ff (
  .clk(clock1),
  .d(tesla_cafe),
  .ena(spock_egg),
  .sclr(fufu_jonas),
  .sload(haze_venus),
  .asdata(surfer_mexico),
  .clrn(!reset1),
  .q(popcorn_bfi_wire)
);

always @(popcorn_bfi_wire) begin
   obiwan_foryou = popcorn_bfi_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wrecker_beef <= 0;
    else if (danger_beemer)
      wrecker_beef <= 0;
    else if (vcc)
      wrecker_beef <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_yankee <= 0;
    else
      newt_yankee <= pdiddy_eel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      troll_stirfry <= 0;
    else
      troll_stirfry <= jason_rerun;
  end

wire martin_over_wire;

dffea martin_over_ff (
  .clk(clock1),
  .d(curie_moody),
  .ena(vcc),
  .adata(gnd),
  .clrn(!reset1),
  .q(martin_over_wire)
);

always @(martin_over_wire) begin
   art_squad = martin_over_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whatelse_lima <= 0;
    else if (vcc)
      whatelse_lima <= tobe_sierra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bacon_chuck <= 0;
    else
      bacon_chuck <= barty_burnout;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bfs_romeo <= 1;
    else
      bfs_romeo <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      asahi_potter <= 0;
    else
      asahi_potter <= feynman_xray;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pig_rainbow <= 0;
    else
      pig_rainbow <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neptune_ceres <= 0;
    else
      neptune_ceres <= doc_leidiot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moses_pork <= 0;
    else
      moses_pork <= wrecker_otter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ritsu_orange <= 0;
    else if (barty_loser)
      ritsu_orange <= intel_lumber;
    else if (vcc)
      ritsu_orange <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_indigo <= 0;
    else if (fuji_nihlist)
      moron_indigo <= 0;
    else if (honey_jacques)
      moron_indigo <= weasley_goat;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kdqcens_ring <= 0;
    else if (vcc)
      kdqcens_ring <= chips_jjocen;
    else if (gnd)
      kdqcens_ring <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fury_bismuth <= 0;
    else
      fury_bismuth <= dork_tukatuk;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      witch_animal <= 0;
    else
      witch_animal <= hotel_faster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fear_homer <= 0;
    else if (vcc)
      fear_homer <= rasp_joey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tattoo_cubish <= 1;
    else
      tattoo_cubish <= mao_kbtoys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      square_bison <= 1;
    else
      square_bison <= art_squad;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      china_ramone <= 0;
    else if (fire_papyrus)
      china_ramone <= gnd;
    else if (banshee_pasta)
      china_ramone <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      donut_vadar <= 0;
    else
      donut_vadar <= psycho_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_eggsalad <= 0;
    else if (romex_india)
      moe_eggsalad <= wildboar_west;
    else if (penguin_cafe)
      moe_eggsalad <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lemon_nasdaq <= 0;
    else if (agitator_wine)
      lemon_nasdaq <= 0;
    else if (pluto_ariel)
      lemon_nasdaq <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beast_golden <= 0;
    else if (ants_fitter)
      beast_golden <= vcc;
    else if (tobe_sierra)
      beast_golden <= 0;
  end

wire maryann_art_wire;

dffeas maryann_art_ff (
  .clk(clock1),
  .d(marker_yankee),
  .ena(nyquil_husks),
  .sclr(sapporo_fang),
  .sload(pluto_ariel),
  .asdata(tin_atchoo),
  .clrn(!reset1),
  .q(maryann_art_wire)
);

always @(maryann_art_wire) begin
   crab_kbtoys = maryann_art_wire;
end


endmodule

