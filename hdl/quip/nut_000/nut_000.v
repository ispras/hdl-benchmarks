/////////////////////////////////////////////////////////////////
// Altera Corporation
// File - nut_000.v
// 73 inputs 232 outputs
//
/////////////////////////////////////////////////////////////////
module nut_000 (
// inputs
 alpha, bravo, charlie, hotel, adbcensor, gojira,
      richard, lumber, launcher, mortar, tank, cannon,
      mine, marker, red, blue, beetle, frog,
      goat, hippo, platypus, possum, quail, unicorn,
      vulture, whale, zebra, sirius, army_cafe, whale_ocha,
      curie_yankee, chillis_avon, escape_fish, rojas_bull, sleeping_art, wonton_tonic,
      hoser_holland, leaky_sanity, ramone_black, intuit_voodoo, spain_stix, oscar_tobiko,
      deng_tinker, shemp_floride, crack_donald, bathroom_elf, troll_lemon, goblin_bear,
      sanity_fallen, freaky_amex, waffle_midas, wizard_norris, tango_would, black_kebab,
      show_bacon, coffee_wujing, master_elf, cartman_hurt, purple_maki, lala_agitator,
      baron_juliet, yoda_kangaroo, banshee_think, martin_bolt, bush_kbtoys, zed_orange,
      drevil_spirit, ulysses_nyc, mine_ostrich, art_zed, what_intel, gopher_minnow,
      neon_snape,

     // outputs
 george, rodriguez, norris, pirate_sheep, gm_jacuzzi, intel_itchy,
      rouge_bubba, riddler_tako, covad_lost, lsd_huey, ham_mickey, zinc_blessyou,
      togos_jonas, vulture_east, hours_acid, minnie_beavis, comrade_sand, rod_rewire,
      porfavor_fury, roid_handroll, sanity_foiled, ulysses_zulu, zeus_protest, oranges_broom,
      moulin_ceres, zulu_lumber, mao_kbtoys, stick_cheez, hoser_husks, hp_drugs,
      nirish_pirate, ocha_sneezy, rouge_dutch, floo_nasdaq, iterate_rod, donkey_gin,
      onthepc_meth, surprise_yoda, fire_papyrus, tobe_sierra, sun_badmonkey, india_rarest,
      honey_jacques, shuda_pixie, steaming_eel, lsd_potato, zedong_tesla, nail_curly,
      xray_criminal, drevil_square, nihlist_bart, pdiddy_eel, guy_portnoy, peace_beemer,
      ihilani_togos, blue_llama, hut_milo, waffle_shark, willy_chevys, waffle_pizza,
      papa_pyro, barnum_mars, octapus_golf, pluto_ariel, isle_smithers, zhuang_egg,
      hurt_hinge, att_bathroom, onion_fury, barty_burnout, jason_rerun, loser_leaky,
      duck_speed, curie_moody, larry_hut, broom_jacob, shrimp_albus, pepsi_papa,
      sapporo_fang, wine_due, dipsy_mine, drax_maryann, beauty_heidi, wicked_onion,
      subway_lost, biker_pirate, wanton_rocks, foryou_killme, zebra_south, haze_venus,
      peta_yellow, bust_north, jiminy_goblin, firewalk_tako, barty_loser, marquis_sinew,
      pacbell_abel, kedavra_albus, downers_cafe, ants_asahi, bear_erncenso, wildboar_west,
      tobe_cubish, tesla_cafe, luthor_vadar, siamese_honda, rasp_joey, drugs_otter,
      red_sun, bono_knockout, ants_fitter, penguin_cafe, blue_kappa, lala_genji,
      spock_egg, dog_yellow, hotel_faster, pilot_china, zulu_barty, joey_wonder,
      lima_famulan, dork_tukatuk, tin_atchoo, crucio_webvan, newt_sgates, dimetap_enoch,
      richard_lion, kebab_subway, ohno_bomb_pop, salsa_norris, mine_nest, speed_brian,
      pdiddy_hawaii, meffert_lima, helena_sleepy, kabar_holland, hours_zealot, obiwan_foryou,
      wrecker_beef, troll_stirfry, martin_over, whatelse_lima, bacon_chuck, bfs_romeo,
      pig_rainbow, neptune_ceres, moses_pork, ritsu_orange, moron_indigo, fury_bismuth,
      tattoo_cubish, china_ramone, moe_eggsalad, lemon_nasdaq, maryann_art, crab_kbtoys,
      fish_monkey, stix_sugar, gerard_leaky, fear_tank, rojas_huey, whacky_fish,
      cartman_huey, fang_whack, zen_bush, rabbi_vegan, arizona_rat, tesla_uniform,
      spyro_zeus, desert_safada, venus_what, emails_lumber, lion_muggers, avon_chemical,
      sneezy_sake, rubeus_tank, sleepy_jcrew, joseph_crack, cannon_klaas, duey_castaway,
      wanton_gerard, india_dadada, float_wakey, monkey_honda, bear_michelle, simasu_dig,
      todd_bismuth, faster_gotone, over_chemical, duck_sears, donald_supurb, gulp_would,
      amadeus_hoser, turnip_green, cain_eatem, rouge_isle, gregg_a_life, bagel_tobe,
      think_hippo, sun_lumber, oldnavy_barty, vegan_junkie, gulp_mortgate, faster_rufus,
      troll_norbert, gap_tan_nodes, money_safada, moses_joseph, minnow_vangoh, cain_rufus,
      wonton_meth, romeo_loser, lala_tracy, wiggum_lagoon, uppers_beauty, sand_nest,
      peta_blaster, pcp_hamachi, emails_todd, would_zinc, boing_deuce, chips_pegasus,
      sanity_bust, sheep_callme, fury_cannon, newt_genji, snape_geisha, hamburger_moe,
      acid_float, frog_oitcen, oracle_juliet, yankees_dow,

     // tristate outputs
 jonas_falafel, wildboar_iron, obiwan_rabbi, tuna_minerva, aladdin_curie,

     clock0, clock1, reset0, reset1
);
  input alpha;
  input bravo;
  input charlie;
  input hotel;
  input adbcensor;
  input gojira;
  input richard;
  input lumber;
  input launcher;
  input mortar;
  input tank;
  input cannon;
  input mine;
  input marker;
  input red;
  input blue;
  input beetle;
  input frog;
  input goat;
  input hippo;
  input platypus;
  input possum;
  input quail;
  input unicorn;
  input vulture;
  input whale;
  input zebra;
  input sirius;
  input army_cafe;
  input whale_ocha;
  input curie_yankee;
  input chillis_avon;
  input escape_fish;
  input rojas_bull;
  input sleeping_art;
  input wonton_tonic;
  input hoser_holland;
  input leaky_sanity;
  input ramone_black;
  input intuit_voodoo;
  input spain_stix;
  input oscar_tobiko;
  input deng_tinker;
  input shemp_floride;
  input crack_donald;
  input bathroom_elf;
  input troll_lemon;
  input goblin_bear;
  input sanity_fallen;
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
  input zed_orange;
  input drevil_spirit;
  input ulysses_nyc;
  input mine_ostrich;
  input art_zed;
  input what_intel;
  input gopher_minnow;
  input neon_snape;
  input clock0, clock1, reset0, reset1;

  output george;
  output rodriguez;
  output norris;
  output pirate_sheep;
  output gm_jacuzzi;
  output intel_itchy;
  output rouge_bubba;
  output riddler_tako;
  output covad_lost;
  output lsd_huey;
  output ham_mickey;
  output zinc_blessyou;
  output togos_jonas;
  output vulture_east;
  output hours_acid;
  output minnie_beavis;
  output comrade_sand;
  output rod_rewire;
  output porfavor_fury;
  output roid_handroll;
  output sanity_foiled;
  output ulysses_zulu;
  output zeus_protest;
  output oranges_broom;
  output moulin_ceres;
  output zulu_lumber;
  output mao_kbtoys;
  output stick_cheez;
  output hoser_husks;
  output hp_drugs;
  output nirish_pirate;
  output ocha_sneezy;
  output rouge_dutch;
  output floo_nasdaq;
  output iterate_rod;
  output donkey_gin;
  output onthepc_meth;
  output surprise_yoda;
  output fire_papyrus;
  output tobe_sierra;
  output sun_badmonkey;
  output india_rarest;
  output honey_jacques;
  output shuda_pixie;
  output steaming_eel;
  output lsd_potato;
  output zedong_tesla;
  output nail_curly;
  output xray_criminal;
  output drevil_square;
  output nihlist_bart;
  output pdiddy_eel;
  output guy_portnoy;
  output peace_beemer;
  output ihilani_togos;
  output blue_llama;
  output hut_milo;
  output waffle_shark;
  output willy_chevys;
  output waffle_pizza;
  output papa_pyro;
  output barnum_mars;
  output octapus_golf;
  output pluto_ariel;
  output isle_smithers;
  output zhuang_egg;
  output hurt_hinge;
  output att_bathroom;
  output onion_fury;
  output barty_burnout;
  output jason_rerun;
  output loser_leaky;
  output duck_speed;
  output curie_moody;
  output larry_hut;
  output broom_jacob;
  output shrimp_albus;
  output pepsi_papa;
  output sapporo_fang;
  output wine_due;
  output dipsy_mine;
  output drax_maryann;
  output beauty_heidi;
  output wicked_onion;
  output subway_lost;
  output biker_pirate;
  output wanton_rocks;
  output foryou_killme;
  output zebra_south;
  output haze_venus;
  output peta_yellow;
  output bust_north;
  output jiminy_goblin;
  output firewalk_tako;
  output barty_loser;
  output marquis_sinew;
  output pacbell_abel;
  output kedavra_albus;
  output downers_cafe;
  output ants_asahi;
  output bear_erncenso;
  output wildboar_west;
  output tobe_cubish;
  output tesla_cafe;
  output luthor_vadar;
  output siamese_honda;
  output rasp_joey;
  output drugs_otter;
  output red_sun;
  output bono_knockout;
  output ants_fitter;
  output penguin_cafe;
  output blue_kappa;
  output lala_genji;
  output spock_egg;
  output dog_yellow;
  output hotel_faster;
  output pilot_china;
  output zulu_barty;
  output joey_wonder;
  output lima_famulan;
  output dork_tukatuk;
  output tin_atchoo;
  output crucio_webvan;
  output newt_sgates;
  output dimetap_enoch;
  output richard_lion;
  output kebab_subway;
  output ohno_bomb_pop;
  output salsa_norris;
  output mine_nest;
  output speed_brian;
  output pdiddy_hawaii;
  output meffert_lima;
  output helena_sleepy;
  output kabar_holland;
  output hours_zealot;
  output obiwan_foryou;
  output wrecker_beef;
  output troll_stirfry;
  output martin_over;
  output whatelse_lima;
  output bacon_chuck;
  output bfs_romeo;
  output pig_rainbow;
  output neptune_ceres;
  output moses_pork;
  output ritsu_orange;
  output moron_indigo;
  output fury_bismuth;
  output tattoo_cubish;
  output china_ramone;
  output moe_eggsalad;
  output lemon_nasdaq;
  output maryann_art;
  output crab_kbtoys;
  output fish_monkey;
  output stix_sugar;
  output gerard_leaky;
  output fear_tank;
  output rojas_huey;
  output whacky_fish;
  output cartman_huey;
  output fang_whack;
  output zen_bush;
  output rabbi_vegan;
  output arizona_rat;
  output tesla_uniform;
  output spyro_zeus;
  output desert_safada;
  output venus_what;
  output emails_lumber;
  output lion_muggers;
  output avon_chemical;
  output sneezy_sake;
  output rubeus_tank;
  output sleepy_jcrew;
  output joseph_crack;
  output cannon_klaas;
  output duey_castaway;
  output wanton_gerard;
  output india_dadada;
  output float_wakey;
  output monkey_honda;
  output bear_michelle;
  output simasu_dig;
  output todd_bismuth;
  output faster_gotone;
  output over_chemical;
  output duck_sears;
  output donald_supurb;
  output gulp_would;
  output amadeus_hoser;
  output turnip_green;
  output cain_eatem;
  output rouge_isle;
  output gregg_a_life;
  output bagel_tobe;
  output think_hippo;
  output sun_lumber;
  output oldnavy_barty;
  output vegan_junkie;
  output gulp_mortgate;
  output faster_rufus;
  output troll_norbert;
  output gap_tan_nodes;
  output money_safada;
  output moses_joseph;
  output minnow_vangoh;
  output cain_rufus;
  output wonton_meth;
  output romeo_loser;
  output lala_tracy;
  output wiggum_lagoon;
  output uppers_beauty;
  output sand_nest;
  output peta_blaster;
  output pcp_hamachi;
  output emails_todd;
  output would_zinc;
  output boing_deuce;
  output chips_pegasus;
  output sanity_bust;
  output sheep_callme;
  output fury_cannon;
  output newt_genji;
  output snape_geisha;
  output hamburger_moe;
  output acid_float;
  output frog_oitcen;
  output oracle_juliet;
  output yankees_dow;

//tristate outs
  output jonas_falafel;
  output wildboar_iron;
  output obiwan_rabbi;
  output tuna_minerva;
  output aladdin_curie;


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



  reg delta;
  reg echo;
  reg foxtrot;
  reg india;
  reg juliet;
  reg kilo;
  reg lima;
  reg mike;
  reg november;
  reg oscar;
  reg papa;
  reg quebec;
  reg romeo;
  reg sierra;
  reg tango;
  reg uniform;
  reg victor;
  reg whiskey;
  reg xray;
  reg yankee;
  reg zulu;
  reg bomb_pop;
  reg for_gregg;
  reg yeanyow;
  reg rubik;
  reg cybex;
  reg babette;
  reg hanger;
  reg hinge;
  reg nail;
  reg bolt;
  reg bullet;
  reg green;
  reg aphid;
  reg badger;
  reg bison;
  reg bull;
  reg cassowary;
  reg cat;
  reg chicken;
  reg cow;
  reg dog;
  reg donkey;
  reg dragon;
  reg duck;
  reg eagle;
  reg eel;
  reg elephant;
  reg emu;
  reg iguana;
  reg jellyfish;
  reg kangaroo;
  reg lion;
  reg lizard;
  reg llama;
  reg monkey;
    parameter fish_0 = 0,fish_1 = 1,fish_2 = 2,fish_3 = 3,fish_4 = 4,fish_5 = 5;
    reg [3:0] fish;

  reg mouse;
  reg ostrich;
  reg penguin;
  reg rat;
  reg sheep;
  reg tiger;
  reg turtle;
  reg wolverine;
  reg woodpecker;
  reg xuprocar;
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
  reg noah;
  reg bagel;
  reg english;
  reg muffin;
  reg ceres;
  reg moulin;
  reg rouge;
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
  reg riddler;
  reg luthor;
  reg hercules;
  reg achilles;
  reg hector;
  reg ulysses;
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
  reg magicwand;
  reg beavis;
  reg butthead;
  reg homer;
  reg barty;
  reg cartman;
  reg sand;
  reg hours;
  reg lamer;
  reg dweebie;
  reg motorhead;
  reg burnout;
  reg jacques;
  reg pdiddy;
  reg pdaddy;
  reg dorkus;
  reg master;
  reg flew;
  reg cuckoo;
  reg nest;
  reg yoda;
  reg obiwan;
  reg vadar;
  reg skywalker;
  reg north;
  reg southern;
  reg east;
  reg west;
  reg porfavor;
  reg questo;
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
  reg chairman;
  reg biker;
  reg tattoo;
    parameter indigo_0 = 0,indigo_1 = 1,indigo_2 = 2,indigo_3 = 3,indigo_4 = 4,indigo_5 = 5,indigo_6 = 6;
    reg [3:0] indigo;

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
  reg blueled;
  reg pirate;
  reg prison;
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
  reg candle;
  reg spyro;
  reg speedyg;
  reg johndenver;
  reg jacklemon;
  reg theonion;
  reg chatanooga;
  reg kabar;
  reg fullmetal;
  reg aluminum;
  reg copper;
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
  reg hxncensorce;
  reg opus;
  reg portnoy;
  reg milo;
  reg bloom;
  reg potatoskin;
  reg hotpastrami;
  reg roastbeef;
  reg donut;
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
  reg iwocensor;
  reg incompetent;
  reg secondrate;
  reg inspection;
  reg thedon;
  reg marco;
  reg cocacola;
  reg ham;
  reg mandarin;
    parameter waydeelect_0 = 0,waydeelect_1 = 1,waydeelect_2 = 2,waydeelect_3 = 3,waydeelect_4 = 4,waydeelect_5 = 5,waydeelect_6 = 6,waydeelect_7 = 7;
    reg [3:0] waydeelect;

  reg ihilani;
  reg tracy;
  reg meffert;
  reg floride;
  reg pyromaniac;
  reg waster;
  reg crackhead;
  reg drugie;
  reg brothers;
  reg eggsalad;
  reg postulator;
  reg plagarist;
  reg money;
  reg firewalk;
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
  reg speeding;
  reg hiway;
  reg grams;
  reg kdqcens;
  reg bust;
  reg gotone;
  reg sogood;
  reg moreand;
  reg elementary;
  reg sixyears;
  reg graduated;
  reg notalot;
  reg nation;
  reg protest;
  reg animal;
  reg vegan;
  reg vegetarian;
  reg liberation;
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
  reg curie;
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
  reg ringlingbros;
  reg lxtcen;
  reg terrance;
  reg cryptic;
  reg crapeteria;
  reg mdtcensorc;
  reg nihlist;
  reg moses;
  reg burning;
  reg oitcen;
  reg daughter;
  reg wine;
  reg gin;
  reg tonic;
  reg rum;
  reg scotch;
  reg curly;
  reg barnum;
  reg shemp;
  reg bart;
  reg lisa;
  reg marge;
  reg homerun;
  reg barney;
  reg skinner;
  reg krabapple;
  reg tarzan;
    parameter wiggum_0 = 0,wiggum_1 = 1,wiggum_2 = 2,wiggum_3 = 3,wiggum_4 = 4,wiggum_5 = 5,wiggum_6 = 6,wiggum_7 = 7;
    reg [3:0] wiggum;

  reg moe;
  reg comicbook;
  reg flanders;
  reg steaming;
  reg rod;
  reg chewbacca;
  reg tukatuk;
  reg weevil;
  reg deuce;
  reg intuit;
  reg ernie;
  reg life;
  reg snuffleupagus;
  reg peta;
  reg happyists;
  reg atomic;
  reg firemonkey;
  reg captain;
  reg rhvcens;
  reg roid;
  reg itchy;
  reg squad;
  reg joey;
  reg ramone;
  reg stoned;
  reg [7:0] qfvcensorce_reg, qfvcensorce_next;
  reg qfvcensorce_b0, qfvcensorce_fbk;
  parameter qfvcensorce_taps = 8'b10001110;
  integer qfvcensorce_n;
  reg often;
  reg south;
  reg edible;
  reg srvcensorce;
  reg on_sale;
  reg aisle_two;
  reg dinoblaster;
  reg crunchyfrog;
  reg nobody;
  reg expects_the;
  reg spanish;
  reg chief;
  reg weapons;
  reg fear;
  reg efficiency;
  reg fanatical;
  reg devotion;
  reg the_pope;
  reg yummy;
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
  reg sebastian;
  reg bach;
  reg mozart;
  reg goodmonkey;
  reg badmonkey;
  reg partners;
  reg cubish;
  reg solder;
  reg valve;
  reg furnace;
  reg pilot;
  reg leaky;
    parameter guy_0 = 0,guy_1 = 1,guy_2 = 2,guy_3 = 3,guy_4 = 4;
    reg [3:0] guy;

  reg potter;
  reg moonraker;
  reg tyycensor;
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
  reg golden;
  reg egg;
  reg tofu;
  reg rodent;
  reg billnted;
  reg whiteboard;
  reg synthesis;
  reg fitter;
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
  reg tako;
  reg octapus;
  reg hamachi;
  reg yellowtail;
  reg kana;
  reg crab;
  reg nigiri;
  reg handroll;
  reg maki;
  reg roe;
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
  reg chevys;
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
  reg jcrew;
  reg whatelse;
  reg blessyou;
  reg kerchoozle;
  reg atchoo;
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
  reg cornell;
  reg soccer;
  reg softball;
  reg fieldhockey;
  reg nirish;
  reg peace;
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
  reg snort;
  reg pcp;
  reg phenyalanine;
  reg saccarine;
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
  reg badtzmaru;
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
  reg goblin;
  reg elf;
  reg centaur;
  reg theseus;
  reg minotaur;
  reg midas;
  reg icarus;
  reg troll;
  reg warlock;
  reg chowmein;
  reg stirfry;
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
    parameter tasty_0 = 0,tasty_1 = 1,tasty_2 = 2,tasty_3 = 3,tasty_4 = 4;
    reg [3:0] tasty;

  reg moody;
  reg weasley;
  reg powder;
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
  reg lestrange;
  reg malfoy;
  reg draco;
  reg lucius;
  reg narcissa;
  reg albus;
  reg hogwarts;
  reg rubeus;
  reg drumstrang;
  reg norbert;
  reg wizard;
  reg diagon;
  reg fireplace;
  reg crucio;
  reg mario_owes;
  reg gregg_a;
  reg burrito;
  reg correctness;
  reg cafe;
  reg synplicity_burrito;
  reg guacamole;
  reg onion;
  reg jalapeno;
  reg beef;
  reg pork;
  reg blackbeans;
  reg pintobeans;
  reg tortilla;
  reg salsa;
  reg picante;
  reg chips;
  reg tabasco;
  reg mexican;
  reg too_big;
  reg llamas_dont_eat_burrito;
    parameter refriedbeans_0 = 0,refriedbeans_1 = 1,refriedbeans_2 = 2,refriedbeans_3 = 3,refriedbeans_4 = 4,refriedbeans_5 = 5,refriedbeans_6 = 6,refriedbeans_7 = 7,refriedbeans_8 = 8,refriedbeans_9 = 9;
    reg [3:0] refriedbeans;

  reg director_of_llamas;
  reg castaway;
  reg maryann;
  reg skipper;
  reg moviestar;
  reg jonas;
  reg minnow;
  reg bfs;
  reg lovey;
  reg hinkley;
  reg witchdoctor;
  reg uncharted;
  reg hypnotized;
  reg booming;
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
  reg lagoon;
  reg husks;
    parameter butterfly_0 = 0,butterfly_1 = 1,butterfly_2 = 2,butterfly_3 = 3;
    reg [3:0] butterfly;

  reg escape;
  reg bamboo;
  reg isle;
  reg ocean;
  reg tan_nodes;
  reg millionaire;
  reg smack;
  reg dillweed;
  reg tesla;
  reg wonton;
  reg armand;
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
  reg tapered;
  reg spastic;
  reg mao;
  reg zedong;
  reg deng;
  reg xiaoping;
  reg jinyong;
  reg lao;
  reg zi;
  reg wujing;
  reg wukong;
  reg helena;
  reg gerrit;
  reg willem;
  reg dirk;
  reg bep;
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
  reg condit_yak;
  reg romex_dingbat;
  reg sand_baron;
  reg nyc_rubeus;
  reg danger_star;
  reg cain_jupiter;
  reg peace_boots;
  reg kang_usa;
  reg tango_saturn;
  reg desade_touch;
  reg bust_doobie;
  reg salmon_mickey;
  reg atilla_sheep;
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
  reg spirit_shuda;
  reg ohisee_malfoy;
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
  reg kang_bacon;
  reg gerard_kungfu;
  reg whale_malfoy;
  reg tylenol_otter;
  reg bush_wiggles;
  reg west_eatem;
  reg kappa_zed;
  reg beast_uppers;
  reg blue_aphid;
  reg tasty_ebi;
  tri jonas_falafel;
  reg zulu_eel;
  tri wildboar_iron;
  reg madeye_mozart;
  tri obiwan_rabbi;
  tri tuna_minerva;
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
  reg troll_uppers;
  reg dingbat_tesla;
  reg homerun_echo;
  reg moulin_crank;
  reg otter_kedavra;
  reg kana_zi;
  reg saturn_simasu;
  reg ready_centaur;
  reg rojas_tobe;
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
  reg hp_eeevil;
  reg mushroom_dork;
  reg boots_yellow;
  reg oscar_bonker;
  reg bomb_yohimbe;
  reg sun_tesla;
  reg metal_dog;
  reg tabby_moses;
  reg kanji_uppers;
  reg nobody_zeus;
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
  reg sun_wannabe;
  reg guy_ykocens;
  reg sake_ocha;
  reg oscar_gin;
  reg nasdaq_iron;
  reg po_killme;
  reg zinc_bust;
  reg joker_gotone;
  reg rojas_norbert;
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
  reg todd_malfoy;
  reg hulk_booming;
  reg eunice_eunice;
  reg marco_thread;
  reg dopey_bomb;
  reg ebi_bubba;
  reg roid_kungfu;
  reg hans_ritsu;
  reg rewire_bubba;
  reg wildboar_mao;
  reg money_donut;
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
  reg midas_macys;
  reg rufus_advil;
  reg zedong_lucius;
  reg sake_bullet;
  reg foryou_rubik;
  reg chairman_bfs;
  reg sgates_thedon;
  reg hulk_atomic;
  reg peace_broom;
  reg boing_illegal;
  reg nobody_martin;
  reg kang_minnie;
  reg fortuyn_lamer;
  reg pacific_asahi;
  reg todd_pictures;
  reg thedon_potato;
  reg holland_haze;
  reg wujing_xray;
  reg dopey_sinew;
  reg advil_cow;
  reg platinum_haze;
  reg fire_waster;
  reg iterate_sugar;
  reg amex_potter;
  reg thor_cucumber;
  reg loud_chiptrip;
  reg south_toysrus;
  reg echo_eggsalad;
  reg cain_intel;
  reg homerun_deng;
  reg dragon_malfoy;
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
  reg dork_dingbat;
  reg drugie_pilot;
  reg tsmc_safada;
  reg ford_comtrex;
  reg snort_jinyong;
  reg bert_south;
  reg art_norbert;
  reg legos_tofu;
  reg ladder_pyro;
  reg hotdog_sgates;
  reg life_lao;
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
  reg air_monkey;
  reg chief_peta;
  reg west_powder;
  reg jacob_malfoy;
  reg dimetap_bagel;
  reg neville_po;
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
  reg boitano_bagel;
  reg ladder_lizard;
  reg deuce_bismuth;
  reg emu_skinner;
  reg blessyou_haze;
  reg knot_neville;
  reg pepsi_spanish;
  reg bolt_trevor;
  reg kungfu_surfer;
  reg pizza_green;
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
  reg lamer_webvan;
  reg marker_bep;
  reg ceres_elian;
  reg mine_nasdaq;
  reg roid_crayons;
  reg atoms_art;
  reg lucius_drax;
  reg kappa_rufus;
  reg biker_bono;
  reg green_gm;
  reg floating_guy;
  reg life_atchoo;
  reg daughter_lisa;
  reg bfs_star;
  reg tako_fortuyn;
  reg atoms_filch;
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
  reg avon_giants;
  reg fatality_sun;
  reg marquis_husks;
  reg neville_bravo;
  reg water_ykocens;
  reg hotdog_priest;
  reg thread_quail;
  reg grumby_haze;
  reg louie_heidi;
  reg snort_quebec;
  reg spastic_pilot;
  reg mike_stirfry;
  reg hagrid_indigo;
  reg hut_burnout;
  reg oranje_zen;
  reg covad_pdiddy;
  reg rarest_chevys;
  reg plaster_yummy;
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
  reg oldnavy_romex;
  reg crab_tank;
  reg paper_english;
  reg po_yellowtail;
  reg tonic_whale;
  reg egg_plague;
  reg cocaine_bart;
  reg deuce_salsa;
  reg stix_mickey;
  reg eggsalad_dirk;
  reg animal_faster;
  reg ginger_hinge;
  reg curly_red;
  reg lad_zebra;
  reg whacky_hinge;
  reg drax_intuit;
  reg neville_over;
  reg issac_gonzo;
  reg mine_chief;
  reg avon_neon;
  reg snake_copper;
  reg kmfdm_marvin;
  reg crayons_fury;
  reg cubish_issac;
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
  reg mars_monkey;
  reg ramone_amex;
  reg remus_vicks;
  reg penguin_cheez;
  reg turkey_tank;
  reg foxtrot_boots;
  reg porfavor_ebi;
  reg palmer_dadada;
  reg dragon_paper;
  reg gonzo_scrooge;
  reg po_mario_owes;
  reg stoner_candle;
  reg bravo_hours;
  reg george_lovey;
  reg sheep_gyro;
  reg jason_drunken;
  reg bach_rewire;
  reg beetle_genji;
  reg cybex_hawaii;
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
  reg chillis_cybex;
  reg spain_yellow;
  reg homerun_meth;
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
  reg indigo_buddha;
  reg wood_notalot;
  reg minerva_wakey;
  reg pirate_gutter;
  reg wonder_fronds;
  reg orange_cubish;
  reg nasdaq_shemp;
  reg whattime_bert;
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
  reg ihilani_vadar;
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
  reg soccer_moe;
  reg weasley_hinge;
  reg bismuth_fire;
  reg sand_lotus;
  reg yoku_tonic;
  reg mexico_atoms;
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
  reg cocacola_milo;
  reg parrot_hippo;
  reg nyc_rod;
  reg acid_tapered;
  reg pepsi_gerard;
  reg crack_kungfu;
  reg snape_neptune;
  reg fish_itchy;
  reg star_ernie;
  reg dog_charlie;
  reg hp_rampacker;
  reg turnip_foiled;
  reg jason_dirty;
  reg moe_burning;
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
  reg roid_broom;
  reg star_arthur;
  reg turnip_deng;
  reg master_milo;
  reg raiders_louie;
  reg knot_picante;
  reg sirius_dopey;
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
  reg kungfu_itchy;
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
  reg warlock_rod;
  reg zhuang_often;
  reg star_obiwan;
  reg star_yoku;
  reg jcrew_chips;
  reg fronds_pluto;
  reg burning_tesla;
  reg gopher_thread;
  reg bear_golf;
  reg ozzy_doc;
  reg bagel_rubik;
  reg gm_school;
  reg rescue_george;
  reg newt_devotion;
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
  reg tasty_condit;
  reg marker_potter;
  reg zi_zed;
  reg tank_eagle;
  reg banality_tuna;
  reg south_crank;
  reg rubeus_att;
  reg kdqcens_ritsu;
  reg sirius_zhuang;
  reg exodus_touch;
  reg tuna_baron;
  reg beetle_wakey;
  reg deng_gyro;
  reg riddler_po;
  reg fronds_lxtcen;
  reg rubeus_mortar;
  reg knot_clay;
  reg mao_honey;
  reg surfer_fuji;
  reg cain_tuna;
  reg wood_gokidsgo;
  reg boing_freaky;
  reg animal_mickey;
  reg duey_superman;
  reg joseph_deuce;
  reg brian_advil;
  reg china_fitter;
  reg jesus_what;
  reg elian_bamboo;
  reg killer_curie;
  reg hp_richard;
  reg hotel_zed;
  reg dingbat_snape;
  reg pixie_hummer;
  reg vangoh_hinge;
  reg lotus_salami;
  reg peaves_hut;
  reg ready_xray;
  reg rerun_tapered;
  reg vadar_protest;
  reg picante_meth;
  reg south_ebi;
  reg questo_tamago;
  reg nasdaq_doc;
  reg pork_balloon;
  reg moulin_Iwin;
  reg drax_rat;
  reg rabbi_waffle;
  reg peace_cannon;
  reg midas_killer;
  reg square_cheese;
  reg jacuzzi_meth;
  reg dopey_master;
  reg moe_maritime;
  reg heidi_school;
  reg falafel_duey;
  reg deng_junkie;
  reg dadada_rescue;
  reg cow_tabasco;
  reg drugie_maki;
  reg tasty_floo;
  reg tapered_xray;
  reg dork_valve;
  reg tobe_viagra;
  reg genesis_ozzy;
  reg mao_pacbell;
  reg dadada_rubik;
  reg hogwarts_zeus;
  reg hp_asahi;
  reg mortar_school;
  reg peace_willem;
  reg lagoon_rodent;
  reg clay_marco;
  reg kanji_mars;
  reg escape_star;
  reg kilo_pixie;
  reg odin_hamachi;
  reg jcrew_siamese;
  reg bert_burning;
  reg bracket_barty;
  reg lxtcen_gopher;
  reg witch_drugs;
  reg fatality_noah;
  reg howell_eatem;
  reg golf_onion;
  reg togos_piggish;
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
  reg tracy_snape;
  reg rarest_yummy;
  reg crank_star;
  reg thread_plague;
  reg itchy_fallen;
  reg lagoon_ebay;
  reg rubik_whack;
  reg beavis_kbtoys;
  reg bambi_lao;
  reg spain_nail;
  reg larry_alpha;
  reg onthepc_moe;
  reg turnip_jason;
  reg tukatuk_mike;
  reg po_wizard;
  reg atomic_joker;
  reg tesla_icarus;
  reg meth_holland;
  reg ajax_shuda;
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
  reg luthor_sleepy;
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
  reg golfland_rose;
  reg zinc_zealot;
  reg dipsy_ants;
  reg platypus_mars;
  reg itchy_sun;
  reg drax_timmy;
  reg badger_hotel;
  reg biker_snake;
  reg llama_eunice;
  reg po_yeanyow;
  reg huhhuh_smack;
  reg vicks_monster;
  reg boing_comtrex;
  reg curie_vicks;
  reg freaky_tasty;
  reg jacques_macys;
  reg togos_monster;
  reg heidi_joker;
  reg waster_jjocen;
  reg nyc_drevil;
  reg onion_shemp;
  reg kappa_bismuth;
  reg neville_xterm;
  reg xterm_wakey;
  reg dutch_ostrich;
  reg potter_zealot;
  reg huhhuh_dow;
  reg honda_goofy;
  reg tofu_bonker;
  reg webvan_bubba;
  reg platinum_clay;
  reg homer_egg;
  reg fang_dimetap;
  reg larry_advil;
  reg sugar_donut;
  reg ready_lovey;
  reg sake_waster;
  reg wonder_wood;
  reg square_hanger;
  reg lima_pictures;
  reg north_wonton;
  reg egg_hinge;
  reg lad_spirit;
  reg zhuang_indigo;
  reg hp_zeus;
  reg neville_xray;
  reg draco_rabbi;
  reg mickey_fish;
  reg suffering_pig;
  reg november_ebay;
  reg papyrus_lisa;
  reg abraham_yoda;
  reg clay_shark;
  reg turkey_ohno;
  reg duck_wood;
  reg ibm_ykocens;
  reg dipsy_spanish;
  reg rescue_wakey;
  reg kilo_star;
  reg zedong_eunice;
  reg touch_safeway;
  reg escape_acid;
  reg bear_cow;
  reg moe_stroop;
  reg doc_pictures;
  reg bust_ocean;
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
  reg egg_cafe;
  reg golf_xiaoping;
  reg chowmein_guy;
  reg ostrich_zi;
  reg crab_crayons;
  reg bach_thankee;
  reg arizona_water;
  reg lion_would;
  reg think_would;
  reg wine_athena;
  reg dig_bambi;
  reg tinker_sierra;
  reg cannon_hanger;
  reg asahi_bloom;
  reg rasp_green;
  reg webvan_doc;
  reg boing_gutter;
  reg art_smack;
  reg blue_tracy;
  reg pcp_valve;
  reg aphid_diagon;
  reg hummer_star;
  reg snake_often;
  reg madeye_badger;
  reg joey_golden;
  reg bubba_plague;
  reg armand_tesla;
  reg rum_partners;
  reg waster_minnie;
  reg bear_candle;
  reg sanity_minnie;
  reg sheep_grams;
  reg art_potato;
  reg hinge_vegan;
  reg hotdog_arthur;
  reg deng_love_in;
  reg wine_amadeus;
    parameter bloom_batman_0 = 0,bloom_batman_1 = 1,bloom_batman_2 = 2,bloom_batman_3 = 3,bloom_batman_4 = 4;
    reg [3:0] bloom_batman;

  reg monster_isle;
  reg smack_ohno;
  reg draco_moulin;
  reg ernie_spyro;
  reg homer_pirate;
  reg remus_bagel;
  reg exodus_grumpy;
  reg plague_tango;
  reg zi_chowmein;
  reg goat_marco;
  reg sleepy_marco;
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
  reg tiger_tako;
  reg sleepy_gin;
  reg asahi_too_big;
  reg hulk_feynman;
  reg west_athena;
  reg kilo_india;
  reg over_rabbi;
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
  reg fire_pierre;
  reg golden_candle;
  reg loud_brian;
  reg wujing_rubik;
  reg protest_goofy;
  reg rerun_marker;
  reg spain_wonton;
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
  reg att_hinge;
  reg ocean_think;
  reg burrito_venus;
  reg dweebie_elian;
  reg rodent_ford;
  reg yoku_zed;
  reg wakey_zebra;
  reg bfi_quebec;
  reg england_red;
  reg giraffe_hp;
  reg bull_rufus;
  reg subway_speed;
  reg rose_roe;
  reg rarest_newt;
  reg lion_hotdog;
  reg pizza_tapered;
  reg testyour_duey;
  reg pcp_moonraker;
  reg fronds_shuda;
  reg soccer_viagra;
  reg wicked_gonzo;
  reg emu_ebay;
  reg victor_copper;
  reg blessyou_palm;
  reg webvan_thor;
  reg aladdin_egg;
  reg portnoy_lost;
  reg vangoh_lovey;
  reg popacap_goofy;
  reg brian_cuanto;
  reg yoda_cubish;
  reg willy_lxtcen;
  reg fsncens_draco;
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
  reg bach_salami;
  reg salmon_wood;
  reg life_comrade;
  reg babette_chuck;
  reg sogood_ceres;
  reg often_tylenol;
  reg shark_pork;
  reg quail_shemp;
  reg tortilla_red;
  reg alpha_black;
  reg cat_whiskey;
  reg ebi_bert;
  reg amadeus_stick;
  reg elian_heidi;
  reg whale_elguapo;
  reg moses_dig;
  reg rose_marvin;
  reg drugie_diagon;
  reg pixie_rufus;
  reg century_vegas;
  reg aphid_pluto;
  reg barty_maryann;
  reg klaas_tesla;
  reg naproxen_blue;
  reg pyro_booming;
  reg doc_whoiswho;
  reg siamese_pyro;
  reg drugs_chief;
  reg holland_zeus;
  reg condit_bambi;
  reg devotion_mao;
  reg over_athena;
  reg minnow_potter;
  reg grumpy_hotel;
  reg sinew_willem;
  reg stoned_zeus;
  reg golf_pizza;
  reg kebab_books;
  reg dig_molokai;
  reg whatelse_bull;
  reg lala_drugs;
  reg nuclear_jonas;
  reg rocks_lumber;
  reg juliet_simasu;
  reg sheep_octapus;
  reg midas_balloon;
  reg filch_rojas;
  reg kang_howell;
  reg due_valve;
  reg alpha_zeus;
  reg extremist_due;
  reg sneezy_zulu;
  reg workhere_mao;
  reg castaway_bull;
  reg intel_warlock;
  reg captain_milo;
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
  reg stapler_hulk;
  reg hours_floride;
  reg pcp_tattoo;
  reg golden_boots;
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
  reg warlock_remus;
  reg gutter_jcrew;
  reg jiminy_draco;
  reg wine_money;
  reg tonks_marquis;
  reg wonton_guy;
  reg spock_cain;
  reg potato_bert;
  reg dragon_zen;
  reg troll_water;
  reg pierre_tasty;
  reg heidi_neville;
  reg timmy_scotch;
  reg heidi_deuce;
  reg stroop_prison;
  reg jinyong_eagle;
  reg moulin_lizard;
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
  reg weevil_whammy;
  reg mortar_po;
  reg oldnavy_bacon;
  reg zealot_tesla;
  reg advil_gin;
  reg vicks_troll;
  reg desade_vegas;
  reg kana_rerun;
  reg cain_wizard;
  reg goblin_drevil;
  reg uppers_bull;
  reg goat_ulysses;
  reg hp_safada;
  reg blue_gonzo;
  reg art_curly;
  reg albus_zen;
  reg minerva_pcp;
  reg rerun_desert;
  reg goblin_bison;
  reg baron_coconut;
  reg genji_att;
  reg homer_babette;
  reg often_foryou;
  reg icarus_cow;
  reg venus_madeye;
  reg nigiri_delta;
  reg giants_romex;
  reg cheese_gap;
  reg maki_maryann;
  reg quail_lao;
  reg lala_athena;
  reg jacuzzi_cow;
  reg frog_umbridge;
  reg red_gilligan;
  reg sgates_lupin;
  reg ants_gap;
  reg roid_att;
  reg athena_onion;
  reg ginger_supurb;
  reg star_meffert;
  reg armand_smack;
  reg yoku_bono;
  reg palm_erasmus;
  reg red_issac;
  reg legos_cow;
  reg valve_salami;
  reg uppers_att;
  reg lucent_animal;
  reg flew_coffee;
  reg zealot_elian;
  reg bush_isle;
  reg ring_meth;
  reg ebay_boing;
  reg ants_Iwin;
  reg mickey_hummer;
  reg ceecensor_gap;
  reg peace_solder;
  reg october_jonas;
  reg wakey_ham;
  reg centaur_black;
  reg junkie_duck;
  reg gojira_huhhuh;
  reg ebi_cheese;
  reg marvin_hours;
  reg mao_jason;
  reg nobody_east;
  reg floo_voodoo;
  reg foxtrot_gonzo;
  reg drugs_bullet;
  reg rocks_batman;
  reg newt_gin;
  reg shrimp_priest;
  reg animal_what;
  reg opus_geisha;
  reg advil_clay;
  reg louie_fsncens;
  reg gokidsgo_zeus;
  reg yellow_marco;
  reg troll_coffee;
  reg abel_dingbat;
  reg frog_palm;
  reg rabbi_soccer;
  reg moron_ham;
  reg sgates_amex;
  reg tobe_priest;
  reg lucent_grumpy;
  reg curie_haze;
  reg peta_mickey;
  reg mao_att;
  reg vadar_army;
  reg howell_nation;
  reg goblin_snape;
  reg tracy_numbers;
  reg madeye_maki;
  reg ceres_crab;
  reg noah_yellow;
  reg gopher_cheez;
  reg wrecker_lsd;
  reg huhhuh_wujing;
  reg stix_comrade;
  reg juliet_west;
  reg peaves_pilot;
  reg west_beast;
  reg tesla_think;
  reg elf_stroop;
  reg partners_ring;
  reg avon_todd;
  reg xterm_ginger;
  reg broom_meth;
  reg enoch_pork;
  reg smack_mozart;
  reg cuckoo_quail;
  reg romeo_tin;
  reg pixie_sortout;
  reg holland_romeo;
  reg ocean_green;
  reg ford_flew;
  reg oitcen_rodent;
  reg metal_drugie;
  reg grams_valve;
  reg oldnavy_rasp;
  reg dutch_ariel;
  reg tobiko_tabby;
  reg life_wine;
  reg stroop_vadar;
  reg brian_deuce;
  reg hinge_kmfdm;
  reg huhhuh_quebec;
  reg wonton_psycho;
  reg wiggum_avon;
  reg kana_dorkus;
  reg speed_vegan;
  reg eatem_spanish;
  reg wakey_tesla;
  reg lxtcen_wonton;
  reg sogood_bonker;
  reg speedyg_abel;
  reg popacap_bull;
  reg knockout_dow;
  reg wood_dragon;
  reg kabar_floo;
  reg drevil_air;
  reg boots_ramone;
  reg safeway_tonic;
  reg pork_george;
  reg isle_husks;
  reg deng_gregg_a;
  reg moses_bull;
  reg zen_hp;
  reg pirate_sheep;
  reg pcp_bfs;
  reg yummy_wine;
  reg minnie_moses;
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
  reg arcade_sogood;
  reg giants_beavis;
  reg china_subway;
  reg sleepy_boots;
  reg ulysses_legos;
  reg cuanto_float;
  reg guy_rhvcens;
  reg chips_deng;
  reg att_buddha;
  reg tracy_lamer;
  reg knot_foryou;
  reg pizza_salami;
  reg jiminy_ariel;
  reg odin_midas;
  reg vegan_guy;
  reg noah_zedong;
  reg ohno_sixyears;
  reg intel_stoned;
  reg bolt_dragon;
  reg rod_mcnugget;
  reg viagra_red;
  reg deng_cannon;
  reg nigiri_wonder;
  reg doobie_Iwin;
  reg tasty_meffert;
  reg tango_whiskey;
  reg hotdog_egg;
  reg candle_pig;
  reg honey_beavis;
  reg lsd_tobiko;
  reg solder_obiwan;
  reg life_lima;
  reg doc_senorduck;
  reg supurb_barnum;
  reg bolt_ibm;
  reg shrimp_peta;
  reg pirate_icarus;
  reg south_ham;
  reg goat_ham;
  reg norbert_eel;
  reg south_noah;
  reg rewire_frog;
  reg cheez_voodoo;
  reg xterm_simasu;
  reg beast_kdqcens;
  reg wonton_edible;
  reg bart_joey;
  reg guy_powder;
  reg danger_zinc;
  reg peta_cryptic;
  reg mouse_tobe;
  reg jacob_bolt;
  reg tracy_aphid;
  reg jason_numbers;
  reg vampire_gyro;
  reg toysrus_roe;
  reg chiptrip_pig;
  reg bert_life;
  reg dragon_deng;
  reg tesla_whale;
    parameter amadeus_romeo_0 = 0,amadeus_romeo_1 = 1,amadeus_romeo_2 = 2,amadeus_romeo_3 = 3,amadeus_romeo_4 = 4,amadeus_romeo_5 = 5,amadeus_romeo_6 = 6;
    reg [3:0] amadeus_romeo;

  reg waffle_hummer;
  reg sneezy_stoned;
  reg ozzy_southern;
  reg dipsy_ginger;
  reg quail_lumber;
  reg spock_tango;
  reg tiger_dorkus;
  reg coffee_fang;
  reg ihilani_army;
  reg salami_ibm;
  reg psycho_fang;
  reg otter_mexican;
  reg uniform_would;
  reg genesis_black;
  reg rufus_pdaddy;
  reg questo_kabar;
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
    parameter popcorn_tuna_0 = 0,popcorn_tuna_1 = 1,popcorn_tuna_2 = 2,popcorn_tuna_3 = 3,popcorn_tuna_4 = 4,popcorn_tuna_5 = 5,popcorn_tuna_6 = 6,popcorn_tuna_7 = 7,popcorn_tuna_8 = 8;
    reg [3:0] popcorn_tuna;

  reg naproxen_dig;
  reg lotus_jacuzzi;
  reg tinker_pasta;
  reg whatelse_odin;
  reg badger_baron;
  reg school_kmfdm;
  reg richard_thor;
  reg greenland_doc;
  reg bison_exodus;
  reg abel_picante;
  reg jiminy_palm;
  reg plaster_echo;
  reg remus_blaster;
  reg draco_waffle;
  reg boing_diagon;
  reg broom_school;
  reg luthor_square;
  reg ibm_kidnapper;
  reg yummy_over;
  reg malfoy_jcrew;
  reg rufus_huhhuh;
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
  reg isle_mcnugget;
  reg show_fang;
  reg master_sugar;
  reg hp_elephant;
  reg salmon_todd;
  reg desade_india;
  reg scotch_beast;
  reg guy_neptune;
  reg stroop_coffee;
  reg fufu_jonas;
  reg juliet_hotel;
    parameter issac_opus_0 = 0,issac_opus_1 = 1,issac_opus_2 = 2,issac_opus_3 = 3,issac_opus_4 = 4,issac_opus_5 = 5,issac_opus_6 = 6;
    reg [3:0] issac_opus;

  reg dog_webvan;
  reg knot_questo;
  reg xray_nest;
  reg bull_would;
  reg sogood_troll;
  reg southern_cafe;
  reg minnie_floo;
  reg tobe_boitano;
  reg muffin_robust;
  reg rerun_hinge;
  reg saturn_would;
  reg oranje_bomb;
  reg oranges_draco;
  reg balloon_what;
  reg saturn_bull;
  reg safeway_willy;
  reg todd_green;
  reg kana_helena;
  reg aladdin_roid;
  reg desert_sierra;
  reg lantern_jcrew;
  reg delta_yohimbe;
  reg pepsi_foiled;
  reg loser_lad;
  reg ring_winner;
  reg geisha_dorkus;
  reg webvan_peta;
  reg dirty_xterm;
  reg huey_comtrex;
  reg vadar_wonder;
  reg hiswife_moe;
  reg donkey_lad;
  reg withme_fang;
  reg tiger_phoenix;
  reg bono_bomb;
  reg atoms_whacky;
  reg plumber_papa;
  reg devotion_knot;
  reg school_gerrit;
  reg broom_riddler;
  reg tin_think;
  reg guy_tuna;
  reg davidlin_fuji;
  reg fish_hummer;
  reg tiger_hurt;
  reg blueled_kilo;
  reg issac_ihilani;
  reg duey_speedyg;
  reg hurt_genesis;
  reg nation_soccer;
  reg southern_papa;
  reg ariel_century;
  reg grumby_deng;
  reg palmer_mrbill;
  reg oscar_comrade;
  reg piggish_might;
  reg dorkus_sand;
  reg robust_xterm;
  reg hinge_sears;
  reg concorde_kana;
  reg joker_lucius;
  reg money_covad;
  reg athena_sierra;
  reg tobe_bust;
  reg wujing_golf;
  reg alpha_badger;
  reg bull_kmfdm;
  reg the_pope_palm;
  reg larry_subway;
  reg sweetie_att;
  reg withme_yummy;
  reg minerva_tonic;
  reg sinus_goofy;
  reg hagrid_condit;
  reg pluto_sgates;
  reg fear_my_tummy;
  reg gulp_sapporo;
  reg drdeath_chuck;
  reg pluto_quebec;
  reg indigo_hurt;
  reg juliet_doobie;
  reg larry_hagrid;
  reg popcorn_air;
  reg deuce_crack;
  reg devotion_ants;
  reg crab_rarest;
  reg haze_children;
  reg hp_lala;
  reg victor_shuda;
  reg tango_ulysses;
  reg moron_ramone;
  reg neon_sortout;
  reg dopey_bacon;
  reg gm_grams;
  reg wiggum_curie;
  reg moulin_deuce;
  reg bfs_monster;
  reg sinew_gonzo;
  reg beef_crank;
  reg dadada_eel;
  reg kangaroo_bolt;
  reg rubik_centaur;
  reg usa_chillis;
  reg yak_stemcell;
  reg fallen_ohno;
    parameter cheese_sheep_0 = 0,cheese_sheep_1 = 1,cheese_sheep_2 = 2,cheese_sheep_3 = 3,cheese_sheep_4 = 4,cheese_sheep_5 = 5;
    reg [3:0] cheese_sheep;

  reg parrot_tinker;
  reg heidi_might;
  reg cuckoo_clay;
  reg juliet_rod;
  reg stirfry_wine;
  reg holland_honda;
  reg deng_questo;
  reg midas_thankee;
  reg honda_kang;
  reg usa_stoner;
  reg freaky_condit;
  reg xray_junkie;
  reg sand_ready;
  reg bull_onion;
  reg rum_waster;
  reg rojas_tango;
  reg spain_stick;
  reg fsncens_spyro;
  reg quail_pirate;
  reg weevil_papa;
  reg abel_deng;
  reg eggsalad_roe;
  reg spyro_kmfdm;
  reg squad_genji;
  reg elephant_mine;
  reg art_anarchist;
  reg carolina_acid;
  reg lucent_cain;
  reg larry_shuda;
  reg bep_chairman;
  reg tobe_roid;
  reg papyrus_genji;
  reg usa_huey;
  reg palm_wukong;
  reg ring_abel;
  reg questo_rojas;
  reg moron_palmer;
  reg intel_aspirin;
  reg beemer_xterm;
  reg speed_coffee;
  reg lucius_iguana;
  reg stix_animal;
  reg rerun_wujing;
  reg bamboo_yellow;
  reg sierra_pdiddy;
  reg over_sierra;
  reg taoist_klaas;
  reg maki_joseph;
  reg gin_gulp;
  reg knot_yellow;
  reg webvan_pasta;
  reg potato_larry;
  reg att_leviticus;
  reg foryou_jxnbox;
  reg richard_moe;
  reg lamer_rufus;
  reg smack_wonder;
  reg sake_rerun;
  reg star_brothers;
  reg elguapo_yoda;
  reg mine_brothers;
  reg onion_peta;
  reg dork_knot;
  reg knot_muffin;
  reg ebay_ohisee;
  reg snape_pizza;
  reg ariel_callme;
  reg blessyou_dow;
  reg beef_hawaii;
  reg bush_zhuang;
  reg fury_bloom;
  reg rerun_filch;
  reg whoiswho_pig;
  reg gm_curly;
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
  reg killer_lagoon;
  reg fufu_ulysses;
  reg iron_zebra;
  reg scotland_bush;
  reg hanger_zed;
  reg fascist_donut;
  reg gm_jacuzzi;
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
  reg sheep_lao;
    parameter danger_jxnbox_0 = 0,danger_jxnbox_1 = 1,danger_jxnbox_2 = 2,danger_jxnbox_3 = 3,danger_jxnbox_4 = 4,danger_jxnbox_5 = 5,danger_jxnbox_6 = 6,danger_jxnbox_7 = 7,danger_jxnbox_8 = 8,danger_jxnbox_9 = 9,danger_jxnbox_10 = 10;
    reg [3:0] danger_jxnbox;

  reg kana_tapered;
  reg satanist_zed;
  reg milo_deng;
  reg jacques_tank;
  reg bcdcensor_dig;
  reg intel_itchy;
  reg clay_cuckoo;
  reg porfavor_odin;
  reg huey_drevil;
  reg troll_hut;
  reg speedyg_sand;
  reg show_peace;
  reg safeway_kappa;
  reg drax_rafting;
  reg chief_tobe;
  reg obiwan_monkey;
  reg martin_emu;
  reg ozzy_snape;
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
  reg picture_att;
  reg tobe_vampire;
  reg sake_blue;
  reg sun_jacuzzi;
  reg ariel_giants;
  reg beef_rufus;
  reg rod_maryann;
  reg bep_vulture;
  reg salami_howell;
  reg faster_bacon;
  reg arizona_pizza;
  reg jxnbox_bacon;
  reg mozart_tiger;
  reg pepsi_nihlist;
  reg meth_sgates;
  reg jacob_chillis;
  reg cocaine_bfs;
  reg norbert_ring;
  reg rouge_bubba;
  reg rojas_luthor;
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
  reg riddler_tako;
  reg fortuyn_deng;
  reg midas_diagon;
  reg ykocens_fury;
  reg ham_heidi;
  reg macys_lion;
  reg moe_brian;
  reg fufu_atomic;
  reg eel_huey;
  reg tako_marco;
  reg kanji_bubba;
  reg deng_pepsi;
  reg fufu_pilot;
  reg itchy_cubish;
  reg boing_guy;
  reg boots_theseus;
  reg pentium_meth;
  reg hotdog_armand;
  reg boitano_yak;
  reg zed_zi;
  reg cheez_isle;
  reg roe_starwars;
  reg chuck_wizard;
  reg pepsi_valve;
  reg floo_shrimp;
  reg curie_xray;
  reg tiger_water;
  reg mars_handroll;
  reg buddha_subway;
  reg heidi_moreand;
  reg purple_macys;
  reg nigiri_nigiri;
  reg geisha_moe;
  reg nasdaq_fire;
  reg covad_lost;
  reg meth_yak;
  reg potter_covad;
  reg prison_icarus;
  reg spain_vegas;
  reg drax_the_pope;
  reg albus_china;
  reg tracy_think;
  reg bagel_fury;
  reg troll_green;
  reg lsd_huey;
  reg dorkus_fang;
  reg ozzy_ulysses;
  reg amex_richard;
  reg bfi_billnted;
  reg ebay_kedavra;
  reg bomb_pop_pyro;
  reg ham_mickey;
  reg enoch_amex;
  reg yoda_kaisha;
  tri aladdin_curie;
  reg venus_homerun;
  reg fascist_bambi;
  reg zinc_blessyou;
  reg homer_abraham;
  reg togos_jonas;
  reg emu_isle;
  reg money_desert;
  reg bach_aladdin;
  reg vulture_east;
  reg drunken_clay;
  reg romex_weapons;
  reg draco_sortout;
  reg llama_cuanto;
  reg too_big_goofy;
  reg hours_acid;
  reg oitcen_wicked;
  reg desade_arthur;
  reg picante_pizza;
  reg mine_green;
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
  reg red_sun;
  reg bono_knockout;
  reg ants_fitter;
  reg genji_stix;
  reg penguin_cafe;
  reg blue_kappa;
  reg lala_genji;
  reg nyquil_broom;
  reg spock_egg;
  reg dog_yellow;
  reg hotel_faster;
  reg zedong_romeo;
  reg pilot_china;
  reg monkey_crab;
  reg woman_giraffe;
  reg gap_chowmein;
  reg zebra_dimetap;
  reg blaster_papa;
  reg blue_floo;
  reg zulu_barty;
  reg joey_wonder;
  reg lima_famulan;
  reg dork_tukatuk;
  reg tin_atchoo;
  reg crucio_webvan;
  reg newt_sgates;
  reg dimetap_enoch;
  reg richard_lion;
  reg kebab_subway;
  reg ohno_bomb_pop;
  reg salsa_norris;
  reg doc_bison;
  reg mine_nest;
  reg speed_brian;
  reg pdiddy_hawaii;
  reg meffert_lima;
  reg helena_sleepy;
  reg kabar_holland;
  reg hours_zealot;
  reg popcorn_bfi;
  reg obiwan_foryou;
  reg wrecker_beef;
  reg newt_yankee;
  reg troll_stirfry;
  reg martin_over;
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
  reg maryann_art;
  reg crab_kbtoys;
  reg mortar_ohisee;
  reg fish_monkey;
  reg stix_sugar;
  reg gerard_leaky;
  reg fear_tank;
  reg rojas_huey;
  reg crack_bamboo;
  reg peaves_ernie;
  reg whacky_fish;
  reg cartman_huey;
  reg fang_whack;
  reg zi_nobody;
  reg zen_bush;
  reg rabbi_vegan;
  reg arizona_rat;
  reg tesla_uniform;
  reg spyro_zeus;
  reg desert_safada;
  reg venus_what;
  reg emails_lumber;
  reg lion_muggers;
  reg avon_chemical;
  reg sneezy_sake;
  reg rubeus_tank;
  reg sleepy_jcrew;
  reg joseph_crack;
  reg cannon_klaas;
  reg duey_castaway;
  reg wanton_gerard;
  reg india_dadada;
  reg float_wakey;
  reg monkey_honda;
  reg sinew_tako;
  reg advil_victor;
  reg bear_michelle;
  reg bep_happyists;
  reg simasu_dig;
  reg todd_bismuth;
  reg faster_gotone;
  reg over_chemical;
  reg maki_bach;
  reg duck_sears;
  reg pyro_witch;
  reg parrot_green;
  reg donald_supurb;
  reg gulp_would;
  reg amadeus_hoser;
  reg hp_tako;
  reg arizona_pasta;
  reg turnip_green;
  reg cain_eatem;
  reg rouge_isle;
  reg gregg_a_life;
  reg callme_valve;
  reg bagel_tobe;
  reg think_hippo;
  reg sun_lumber;
  reg oldnavy_barty;
  reg vegan_junkie;
  reg gulp_mortgate;
  reg smack_kana;
  reg faster_rufus;
  reg troll_norbert;
  reg gap_tan_nodes;
  reg stoner_iguana;
  reg money_safada;
  reg moses_joseph;
  reg ebay_intel;
  reg minnow_vangoh;
  reg cain_rufus;
  reg wonton_meth;
  reg donut_clay;
  reg romeo_loser;
  reg lala_tracy;
  reg wiggum_lagoon;
  reg uppers_beauty;
  reg sand_nest;
  reg peta_blaster;
  reg pcp_hamachi;
  reg emails_todd;
  reg would_zinc;
  reg boing_deuce;
  reg chips_pegasus;
  reg sanity_bust;
  reg sheep_callme;
  reg fury_cannon;
  reg newt_genji;
  reg snape_geisha;
  reg hamburger_moe;
  reg acid_float;
  reg frog_oitcen;
  reg oracle_juliet;
  reg yankees_dow;


// Greater Equal Less compare
always @(alpha or vcc or bravo or charlie)
  begin
    if ({alpha,vcc} > {bravo,charlie})
       {delta,echo,foxtrot} = 3'b100;
    else if ({alpha,vcc} < {bravo,charlie})
       {delta,echo,foxtrot} = 3'b010;
    else
       {delta,echo,foxtrot} = 3'b001;
  end

// 72 bit shift register
reg [71:0] golf;

initial begin
    golf = 0;
end

always @(posedge clock0)
begin
    golf <= (golf << 1) | hotel;
end

// shift taps every 4 bits
always @(golf)
begin
    india = golf[71];
    juliet = golf[67];
    kilo = golf[63];
    lima = golf[59];
    mike = golf[55];
    november = golf[51];
    oscar = golf[47];
    papa = golf[43];
    quebec = golf[39];
    romeo = golf[35];
    sierra = golf[31];
    tango = golf[27];
    uniform = golf[23];
    victor = golf[19];
    whiskey = golf[15];
    xray = golf[11];
    yankee = golf[7];
    zulu = golf[3];
end

// 2 bit up counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {bomb_pop,for_gregg} <= 0;
    else
      {bomb_pop,for_gregg} <= {bomb_pop,for_gregg} + 1;
  end

// A + const
always @(gnd or adbcensor or gojira or richard or gnd)
  begin
    {yeanyow,rubik,cybex,babette,hanger,hinge,nail,bolt} = {gnd,adbcensor,gojira,richard,gnd} + 207;
  end

// Random 6 input look up table
always @(lumber or launcher or mortar or tank or cannon or mine)
  begin
    casex ({lumber,launcher,mortar,tank,cannon,mine})
      0: bullet=1;
      1: bullet=1;
      2: bullet=1;
      3: bullet=0;
      4: bullet=1;
      5: bullet=0;
      6: bullet=1;
      7: bullet=1;
      8: bullet=0;
      9: bullet=0;
      10: bullet=0;
      11: bullet=1;
      12: bullet=0;
      13: bullet=1;
      14: bullet=0;
      15: bullet=0;
      16: bullet=1;
      17: bullet=0;
      18: bullet=0;
      19: bullet=1;
      20: bullet=0;
      21: bullet=1;
      22: bullet=1;
      23: bullet=0;
      24: bullet=0;
      25: bullet=1;
      26: bullet=1;
      27: bullet=1;
      28: bullet=0;
      29: bullet=1;
      30: bullet=1;
      31: bullet=0;
      32: bullet=0;
      33: bullet=0;
      34: bullet=0;
      35: bullet=1;
      36: bullet=0;
      37: bullet=0;
      38: bullet=0;
      39: bullet=1;
      40: bullet=0;
      41: bullet=0;
      42: bullet=1;
      43: bullet=0;
      44: bullet=0;
      45: bullet=1;
      46: bullet=0;
      47: bullet=1;
      48: bullet=0;
      49: bullet=0;
      50: bullet=0;
      51: bullet=0;
      52: bullet=0;
      53: bullet=0;
      54: bullet=0;
      55: bullet=1;
      56: bullet=0;
      57: bullet=1;
      58: bullet=0;
      59: bullet=0;
      60: bullet=1;
      61: bullet=0;
      62: bullet=1;
      63: bullet=0;
      default: bullet=0;
    endcase
  end

// Greater Equal Less compare
always @(gnd or marker or red or blue)
  begin
    if ({gnd,marker} > {red,blue})
       {green,aphid,badger} = 3'b100;
    else if ({gnd,marker} < {red,blue})
       {green,aphid,badger} = 3'b010;
    else
       {green,aphid,badger} = 3'b001;
  end

// 70 bit shift register
reg [69:0] bear;

initial begin
    bear = 0;
end

always @(posedge clock0)
begin
    bear <= (bear << 1) | beetle;
end

// shift taps every 5 bits
always @(bear)
begin
    bison = bear[69];
    bull = bear[64];
    cassowary = bear[59];
    cat = bear[54];
    chicken = bear[49];
    cow = bear[44];
    dog = bear[39];
    donkey = bear[34];
    dragon = bear[29];
    duck = bear[24];
    eagle = bear[19];
    eel = bear[14];
    elephant = bear[9];
    emu = bear[4];
end

// State Mek fish Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fish <= fish_0;
    else
      case (fish)
        fish_0: begin
          if ({frog,goat,hippo,vcc} == 8)
            fish <= fish_4;
          else if ({frog,goat,hippo,vcc} == 15)
            fish <= fish_1;
          else if ({frog,goat,hippo,vcc} == 14)
            fish <= fish_0;
          else
            fish <= fish_0;
          end
        fish_1: begin
          if ({frog,goat,hippo,vcc} == 13)
            fish <= fish_5;
          else if ({frog,goat,hippo,vcc} == 3)
            fish <= fish_2;
          else if ({frog,goat,hippo,vcc} == 12)
            fish <= fish_2;
          else
            fish <= fish_1;
          end
        fish_2: begin
            fish <= fish_2;
          end
        fish_3: begin
          if ({frog,goat,hippo,vcc} == 9)
            fish <= fish_5;
          else
            fish <= fish_3;
          end
        fish_4: begin
          if ({frog,goat,hippo,vcc} == 12)
            fish <= fish_5;
          else if ({frog,goat,hippo,vcc} == 2)
            fish <= fish_1;
          else if ({frog,goat,hippo,vcc} == 3)
            fish <= fish_5;
          else if ({frog,goat,hippo,vcc} == 10)
            fish <= fish_3;
          else if ({frog,goat,hippo,vcc} == 0)
            fish <= fish_1;
          else if ({frog,goat,hippo,vcc} == 7)
            fish <= fish_3;
          else
            fish <= fish_4;
          end
        fish_5: begin
          if ({frog,goat,hippo,vcc} == 5)
            fish <= fish_0;
          else if ({frog,goat,hippo,vcc} == 3)
            fish <= fish_5;
          else if ({frog,goat,hippo,vcc} == 14)
            fish <= fish_1;
          else
            fish <= fish_5;
          end
        default: fish <= fish_0;
      endcase
  end

// State Mek fish Output logic
always @(fish)
  begin
    // consider all state regs when doing outputs
    case (fish)
        fish_0: begin
            iguana = 1;
            jellyfish = 0;
            kangaroo = 0;
            lion = 1;
            lizard = 0;
            llama = 1;
            monkey = 0;
          end
        fish_1: begin
            iguana = 1;
            jellyfish = 1;
            kangaroo = 1;
            lion = 0;
            lizard = 0;
            llama = 0;
            monkey = 0;
          end
        fish_2: begin
            iguana = 0;
            jellyfish = 1;
            kangaroo = 1;
            lion = 1;
            lizard = 0;
            llama = 1;
            monkey = 1;
          end
        fish_3: begin
            iguana = 0;
            jellyfish = 1;
            kangaroo = 0;
            lion = 1;
            lizard = 1;
            llama = 0;
            monkey = 0;
          end
        fish_4: begin
            iguana = 1;
            jellyfish = 1;
            kangaroo = 0;
            lion = 0;
            lizard = 1;
            llama = 1;
            monkey = 0;
          end
        fish_5: begin
            iguana = 0;
            jellyfish = 1;
            kangaroo = 0;
            lion = 0;
            lizard = 1;
            llama = 1;
            monkey = 1;
          end
        default: begin
            iguana = 0;
            jellyfish = 1;
            kangaroo = 0;
            lion = 1;
            lizard = 0;
            llama = 0;
            monkey = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire newt_out;
nut_000_lut #(6) nut_000_lut_inst_newt (
  .din({lima,xray,aphid,november,papa,cat}),
  .mask(64'h6abded3934c4bf54),
  .out(newt_out)
);

always @(newt_out)
begin
   mouse = newt_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire otter_out;
nut_000_lut #(6) nut_000_lut_inst_otter (
  .din({bull,duck,nail,gnd,vcc,sierra}),
  .mask(64'h70aeb354bb132c42),
  .out(otter_out)
);

always @(otter_out)
begin
   ostrich = otter_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire pig_out;
nut_000_lut #(3) nut_000_lut_inst_pig (
  .din({cat,dragon,yankee}),
  .mask(8'b00000000),
  .out(pig_out)
);

always @(pig_out)
begin
   penguin = pig_out;
end

// A + const
always @(platypus or possum or gnd or quail)
  begin
    {rat,sheep,tiger,turtle} = {platypus,possum,gnd,quail} + 81;
  end

// Greater Equal Less compare
always @(unicorn or gnd or vulture or whale or vcc or vcc)
  begin
    if ({unicorn,gnd,vulture} > {whale,vcc,vcc})
       {wolverine,woodpecker,xuprocar} = 3'b100;
    else if ({unicorn,gnd,vulture} < {whale,vcc,vcc})
       {wolverine,woodpecker,xuprocar} = 3'b010;
    else
       {wolverine,woodpecker,xuprocar} = 3'b001;
  end

// 72 bit shift register
reg [71:0] yak;

initial begin
    yak = 0;
end

always @(posedge clock0)
begin
    yak <= (yak << 1) | zebra;
end

// shift taps every 6 bits
always @(yak)
begin
    shuda = yak[71];
    maklak = yak[65];
    bcdcensor = yak[59];
    safada = yak[53];
    ceecensor = yak[47];
    dfecensorc = yak[41];
    saturn = yak[35];
    neon = yak[29];
    loser = yak[23];
    turnip = yak[17];
    potato = yak[11];
    nuclear = yak[5];
end

always @(neon)
  begin
      insurance = !neon;
  end

always @(bcdcensor)
  begin
      bathroom = !bcdcensor;
  end

always @(bison)
  begin
      popcorn = !bison;
  end

always @(monkey)
  begin
      jimmyjames = !monkey;
  end

always @(delta)
  begin
      dr_zaius = !delta;
  end

always @(aphid)
  begin
      amadeus = !aphid;
  end

always @(lima)
  begin
      whack = !lima;
  end

always @(india)
  begin
      jason = !india;
  end

always @(india)
  begin
      funkadelic = !india;
  end

always @(vcc)
  begin
      books = !vcc;
  end

always @(oscar)
  begin
      cluckU = !oscar;
  end

always @(neon)
  begin
      togos = !neon;
  end

always @(ostrich)
  begin
      chiptrip = !ostrich;
  end

always @(wolverine)
  begin
      what = !wolverine;
  end

always @(lizard)
  begin
      would = !lizard;
  end

reg feedback_pt_0;

always @(chiptrip or feedback_pt_0)
  begin
      brian = !chiptrip ^  feedback_pt_0;
  end

reg feedback_pt_1;

always @(yeanyow or feedback_pt_1)
  begin
      boitano = !yeanyow &  feedback_pt_1;
  end

reg feedback_pt_2;

always @(gnd or feedback_pt_2)
  begin
      due =  gnd |  feedback_pt_2;
  end

reg feedback_pt_3;

always @(cluckU or feedback_pt_3)
  begin
      genesis = !cluckU |  feedback_pt_3;
  end

reg feedback_pt_4;

always @(vcc or feedback_pt_4)
  begin
      deuteronomy =  vcc | !feedback_pt_4;
  end

reg feedback_pt_5;

always @(amadeus or feedback_pt_5)
  begin
      leviticus = !amadeus |  feedback_pt_5;
  end

reg feedback_pt_6;

always @(turnip or feedback_pt_6)
  begin
      xterm =  turnip ^  feedback_pt_6;
  end

reg feedback_pt_7;

always @(gnd or feedback_pt_7)
  begin
      numbers =  gnd | !feedback_pt_7;
  end

reg feedback_pt_8;

always @(romeo or feedback_pt_8)
  begin
      noah = !romeo | !feedback_pt_8;
  end

reg feedback_pt_9;

always @(potato or feedback_pt_9)
  begin
      bagel = !potato ^  feedback_pt_9;
  end

reg feedback_pt_10;

always @(bullet or feedback_pt_10)
  begin
      english = !bullet ^ !feedback_pt_10;
  end

reg feedback_pt_11;

always @(boitano or feedback_pt_11)
  begin
      muffin =  boitano ^  feedback_pt_11;
  end

reg feedback_pt_12;

always @(hinge or feedback_pt_12)
  begin
      ceres = !hinge ^  feedback_pt_12;
  end

reg feedback_pt_13;

always @(vcc or feedback_pt_13)
  begin
      moulin = !vcc &  feedback_pt_13;
  end

reg feedback_pt_14;

always @(iguana or feedback_pt_14)
  begin
      rouge =  iguana ^  feedback_pt_14;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_m245.v
///////////////////////////////////////////

wire [32:0] cellphone_dout;
wire [34:0] cellphone_din;
assign cellphone_din[34:25] = {popcorn,deuteronomy,sierra,vcc,deuteronomy,juliet,vcc,badger,vcc,vcc};
assign cellphone_din[24:15] = {eel,ceecensor,xterm,penguin,noah,gnd,green,bison,quebec,vcc};
assign cellphone_din[14:5] = {turtle,bomb_pop,vcc,leviticus,badger,gnd,books,maklak,rouge,vcc};
assign cellphone_din[4:0] = {for_gregg,gnd,gnd,jason,togos};

nut_000_m245 nut_000_m245_inst_cellphone (
  .ins(cellphone_din),
  .clock(clock0),
  .reset(reset0),
  .outs(cellphone_dout)
);

always @(cellphone_dout)
begin
  {mortgate,stapler,holepunch,metal,dork,autotest,picture,sleepy,dopey,sneezy} = cellphone_dout[32:23];
  {happy,grumpy,bashful,doc,donald,mickey,minnie,spock,goofy,gyro} = cellphone_dout[22:13];
  {scrooge,huey,duey,louie,jiminy,cinderella,sleeping,beauty,superman,batman} = cellphone_dout[12:3];
  {wonder,woman,hulk} = cellphone_dout[2:0];
end

wire riddler_outwire;
exp lantern (safada,riddler_outwire);

always @(riddler_outwire)
begin
  riddler = riddler_outwire;
end

wire luthor_outwire, hercules_outwire;
carry_sum joker (.sin(emu),.cin(insurance),.sout(luthor_outwire),.cout(hercules_outwire));

always @(luthor_outwire or hercules_outwire)
begin
  luthor = luthor_outwire;
  hercules = hercules_outwire;
end

wire achilles_outwire, hector_outwire;
carry_sum ajax (.sin(vcc),.cin(duey),.sout(achilles_outwire),.cout(hector_outwire));

always @(achilles_outwire or hector_outwire)
begin
  achilles = achilles_outwire;
  hector = hector_outwire;
end

reg feedback_pt_15;

always @(mouse or feedback_pt_15)
  begin
      ulysses = !mouse & !feedback_pt_15;
  end

reg feedback_pt_16;

always @(goofy or feedback_pt_16)
  begin
      agamemnon = !goofy &  feedback_pt_16;
  end

reg feedback_pt_17;

always @(superman or feedback_pt_17)
  begin
      aladdin = !superman | !feedback_pt_17;
  end

reg feedback_pt_18;

always @(muffin or feedback_pt_18)
  begin
      bambi =  muffin &  feedback_pt_18;
  end

reg feedback_pt_19;

always @(sneezy or feedback_pt_19)
  begin
      pocahontas =  sneezy ^ !feedback_pt_19;
  end

reg feedback_pt_20;

always @(agamemnon or feedback_pt_20)
  begin
      jesus = !agamemnon ^ !feedback_pt_20;
  end

reg feedback_pt_21;

always @(vcc or feedback_pt_21)
  begin
      buddha = !vcc & !feedback_pt_21;
  end

reg feedback_pt_22;

always @(gnd or feedback_pt_22)
  begin
      dali_llama =  gnd ^  feedback_pt_22;
  end

reg feedback_pt_23;

always @(picture or feedback_pt_23)
  begin
      clinton =  picture |  feedback_pt_23;
  end

reg feedback_pt_24;

always @(gnd or feedback_pt_24)
  begin
      bush = !gnd ^  feedback_pt_24;
  end

reg feedback_pt_25;

always @(elephant or feedback_pt_25)
  begin
      washington = !elephant &  feedback_pt_25;
  end

reg feedback_pt_26;

always @(cassowary or feedback_pt_26)
  begin
      hamburger = !cassowary ^  feedback_pt_26;
  end

reg feedback_pt_27;

always @(dali_llama or feedback_pt_27)
  begin
      hotdog = !dali_llama |  feedback_pt_27;
  end

reg feedback_pt_28;

always @(delta or feedback_pt_28)
  begin
      drdeath = !delta & !feedback_pt_28;
  end

reg feedback_pt_29;

always @(maklak or feedback_pt_29)
  begin
      klinton =  maklak &  feedback_pt_29;
  end

reg feedback_pt_30;

always @(vcc or feedback_pt_30)
  begin
      kang = !vcc | !feedback_pt_30;
  end

reg feedback_pt_31;

always @(victor or feedback_pt_31)
  begin
      water =  victor &  feedback_pt_31;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      air <= 0;
    else if (gnd)
      air <= 0;
    else if (neon)
      air <= kilo;
  end

always @(air)
  begin
      feedback_pt_0 = air;
  end

always @(air)
  begin
      feedback_pt_1 = air;
  end

always @(air)
  begin
      feedback_pt_2 = air;
  end

always @(air)
  begin
      feedback_pt_3 = air;
  end

always @(air)
  begin
      feedback_pt_4 = air;
  end

wire fire_wire;

dffea fire_ff (
  .clk(clock0),
  .d(vcc),
  .ena(vcc),
  .adata(gnd),
  .clrn(!reset0),
  .q(fire_wire)
);

always @(fire_wire) begin
   magicwand = fire_wire;
end

always @(magicwand)
  begin
      feedback_pt_5 = magicwand;
  end

always @(magicwand)
  begin
      feedback_pt_6 = magicwand;
  end

always @(magicwand)
  begin
      feedback_pt_7 = magicwand;
  end

always @(magicwand)
  begin
      feedback_pt_8 = magicwand;
  end

always @(magicwand)
  begin
      feedback_pt_9 = magicwand;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beavis <= 0;
    else if (woodpecker)
      beavis <= 0;
    else if (lion)
      beavis <= drdeath;
  end

always @(beavis)
  begin
      feedback_pt_10 = beavis;
  end

always @(beavis)
  begin
      feedback_pt_11 = beavis;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      butthead <= 0;
    else
      butthead <= english;
  end

always @(butthead)
  begin
      feedback_pt_12 = butthead;
  end

always @(butthead)
  begin
      feedback_pt_13 = butthead;
  end

always @(butthead)
  begin
      feedback_pt_14 = butthead;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      homer <= 0;
    else
      homer <= batman;
  end

always @(homer)
  begin
      feedback_pt_15 = homer;
  end

always @(homer)
  begin
      feedback_pt_16 = homer;
  end

always @(homer)
  begin
      feedback_pt_17 = homer;
  end

always @(homer)
  begin
      feedback_pt_18 = homer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      barty <= 0;
    else if (cinderella)
      barty <= noah;
    else if (hercules)
      barty <= 0;
  end

always @(barty)
  begin
      feedback_pt_19 = barty;
  end

always @(barty)
  begin
      feedback_pt_20 = barty;
  end

always @(barty)
  begin
      feedback_pt_21 = barty;
  end

always @(barty)
  begin
      feedback_pt_22 = barty;
  end

always @(barty)
  begin
      feedback_pt_23 = barty;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cartman <= 1;
    else
      cartman <= vcc;
  end

always @(cartman)
  begin
      feedback_pt_24 = cartman;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sand <= 0;
    else if (huey)
      sand <= jesus;
  end

always @(sand)
  begin
      feedback_pt_25 = sand;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hours <= 0;
    else if (duey)
      hours <= 0;
    else if (cybex)
      hours <= bush;
  end

always @(hours)
  begin
      feedback_pt_26 = hours;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lamer <= 1;
    else
      lamer <= luthor;
  end

always @(lamer)
  begin
      feedback_pt_27 = lamer;
  end

wire hoser_wire;

dffeas hoser_ff (
  .clk(clock0),
  .d(hotdog),
  .ena(wonder),
  .sclr(due),
  .sload(gnd),
  .asdata(achilles),
  .clrn(!reset0),
  .q(hoser_wire)
);

always @(hoser_wire) begin
   dweebie = hoser_wire;
end

always @(dweebie)
  begin
      feedback_pt_28 = dweebie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      motorhead <= 0;
    else if (what)
      motorhead <= bagel;
    else if (klinton)
      motorhead <= 0;
  end

always @(motorhead)
  begin
      feedback_pt_29 = motorhead;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burnout <= 0;
    else if (gnd)
      burnout <= rubik;
    else if (jiminy)
      burnout <= 0;
  end

always @(burnout)
  begin
      feedback_pt_30 = burnout;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacques <= 0;
    else
      jacques <= sand;
  end

always @(jacques)
  begin
      feedback_pt_31 = jacques;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pdiddy <= 0;
    else if (air)
      pdiddy <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pdaddy <= 0;
    else
      pdaddy <= bashful;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dorkus <= 0;
    else if (pocahontas)
      dorkus <= 0;
    else if (vcc)
      dorkus <= mortgate;
  end

wire drunken_wire;

dffea drunken_ff (
  .clk(clock0),
  .d(sand),
  .ena(whack),
  .adata(nuclear),
  .clrn(!reset0),
  .q(drunken_wire)
);

always @(drunken_wire) begin
   master = drunken_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flew <= 1;
    else
      flew <= gnd;
  end

wire over_wire;

dffeas over_ff (
  .clk(clock0),
  .d(safada),
  .ena(dorkus),
  .sclr(nuclear),
  .sload(xuprocar),
  .asdata(vcc),
  .clrn(!reset0),
  .q(over_wire)
);

always @(over_wire) begin
   cuckoo = over_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nest <= 0;
    else if (iguana)
      nest <= vcc;
  end

wire starwars_wire;

dffea starwars_ff (
  .clk(clock0),
  .d(autotest),
  .ena(rubik),
  .adata(woodpecker),
  .clrn(!reset0),
  .q(starwars_wire)
);

always @(starwars_wire) begin
   yoda = starwars_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      obiwan <= 0;
    else if (jimmyjames)
      obiwan <= water;
    else if (vcc)
      obiwan <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vadar <= 0;
    else if (insurance)
      vadar <= 0;
    else if (clinton)
      vadar <= india;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skywalker <= 0;
    else if (beauty)
      skywalker <= popcorn;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      north <= 0;
    else if (tango)
      north <= gnd;
    else if (eagle)
      north <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      southern <= 0;
    else if (jimmyjames)
      southern <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      east <= 0;
    else if (sand)
      east <= butthead;
    else if (llama)
      east <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      west <= 0;
    else
      west <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      porfavor <= 1;
    else
      porfavor <= pdaddy;
  end

wire cuanto_wire;

dffeas cuanto_ff (
  .clk(clock0),
  .d(butthead),
  .ena(vcc),
  .sclr(vcc),
  .sload(tiger),
  .asdata(badger),
  .clrn(!reset0),
  .q(cuanto_wire)
);

always @(cuanto_wire) begin
   questo = cuanto_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pantalones <= 0;
    else if (muffin)
      pantalones <= 0;
    else if (gnd)
      pantalones <= gnd;
  end

reg feedback_pt_32;

always @(obiwan or feedback_pt_32)
  begin
      rojas =  obiwan | !feedback_pt_32;
  end

reg feedback_pt_33;

always @(vcc or feedback_pt_33)
  begin
      popacap =  vcc & !feedback_pt_33;
  end

reg feedback_pt_34;

always @(magicwand or feedback_pt_34)
  begin
      pizza =  magicwand &  feedback_pt_34;
  end

reg feedback_pt_35;

always @(hamburger or feedback_pt_35)
  begin
      mushroom = !hamburger & !feedback_pt_35;
  end

reg feedback_pt_36;

always @(gnd or feedback_pt_36)
  begin
      cheese = !gnd |  feedback_pt_36;
  end

reg feedback_pt_37;

always @(dweebie or feedback_pt_37)
  begin
      mcnugget =  dweebie ^  feedback_pt_37;
  end

reg feedback_pt_38;

always @(gyro or feedback_pt_38)
  begin
      werewolf = !gyro ^ !feedback_pt_38;
  end

reg feedback_pt_39;

always @(happy or feedback_pt_39)
  begin
      spirit =  happy |  feedback_pt_39;
  end

reg feedback_pt_40;

always @(india or feedback_pt_40)
  begin
      vampire = !india | !feedback_pt_40;
  end

reg feedback_pt_41;

always @(brian or feedback_pt_41)
  begin
      pyro = !brian ^ !feedback_pt_41;
  end

reg feedback_pt_42;

always @(vcc or feedback_pt_42)
  begin
      criminal =  vcc | !feedback_pt_42;
  end

reg feedback_pt_43;

always @(whack or feedback_pt_43)
  begin
      orange = !whack ^ !feedback_pt_43;
  end

reg feedback_pt_44;

always @(questo or feedback_pt_44)
  begin
      purple =  questo ^  feedback_pt_44;
  end

reg feedback_pt_45;

always @(mushroom or feedback_pt_45)
  begin
      yellow =  mushroom ^ !feedback_pt_45;
  end

reg feedback_pt_46;

always @(stapler or feedback_pt_46)
  begin
      clay =  stapler ^ !feedback_pt_46;
  end

reg feedback_pt_47;

always @(batman or feedback_pt_47)
  begin
      paper =  batman ^ !feedback_pt_47;
  end

reg feedback_pt_48;

always @(vcc or feedback_pt_48)
  begin
      crayons =  vcc ^ !feedback_pt_48;
  end

// State Mek indigo Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      indigo <= indigo_0;
    else
      case (indigo)
        indigo_0: begin
          if ({east,gnd,vampire,echo} == 12)
            indigo <= indigo_6;
          else if ({east,gnd,vampire,echo} == 6)
            indigo <= indigo_4;
          else if ({east,gnd,vampire,echo} == 15)
            indigo <= indigo_5;
          else if ({east,gnd,vampire,echo} == 9)
            indigo <= indigo_2;
          else
            indigo <= indigo_0;
          end
        indigo_1: begin
          if ({east,gnd,vampire,echo} == 8)
            indigo <= indigo_2;
          else
            indigo <= indigo_1;
          end
        indigo_2: begin
          if ({east,gnd,vampire,echo} == 0)
            indigo <= indigo_2;
          else if ({east,gnd,vampire,echo} == 2)
            indigo <= indigo_5;
          else
            indigo <= indigo_2;
          end
        indigo_3: begin
          if ({east,gnd,vampire,echo} == 12)
            indigo <= indigo_1;
          else
            indigo <= indigo_3;
          end
        indigo_4: begin
          if ({east,gnd,vampire,echo} == 11)
            indigo <= indigo_6;
          else if ({east,gnd,vampire,echo} == 0)
            indigo <= indigo_0;
          else if ({east,gnd,vampire,echo} == 9)
            indigo <= indigo_3;
          else
            indigo <= indigo_4;
          end
        indigo_5: begin
          if ({east,gnd,vampire,echo} == 8)
            indigo <= indigo_4;
          else if ({east,gnd,vampire,echo} == 1)
            indigo <= indigo_2;
          else
            indigo <= indigo_5;
          end
        indigo_6: begin
          if ({east,gnd,vampire,echo} == 4)
            indigo <= indigo_3;
          else if ({east,gnd,vampire,echo} == 0)
            indigo <= indigo_5;
          else if ({east,gnd,vampire,echo} == 3)
            indigo <= indigo_1;
          else if ({east,gnd,vampire,echo} == 10)
            indigo <= indigo_6;
          else if ({east,gnd,vampire,echo} == 13)
            indigo <= indigo_0;
          else
            indigo <= indigo_6;
          end
        default: indigo <= indigo_0;
      endcase
  end

// State Mek indigo Output logic
always @(indigo)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (indigo)
        indigo_0: begin
            kmfdm = 0;
            pentium = 0;
            bubba = 0;
            ohno = 0;
            fallen = 0;
            comrade = 1;
            chairman = 0;
            biker = 1;
            tattoo = 0;
          end
        indigo_1: begin
            kmfdm = 0;
            pentium = 1;
            bubba = 0;
            ohno = 0;
            fallen = 0;
            comrade = 0;
            chairman = 0;
            biker = 1;
            tattoo = 1;
          end
        indigo_2: begin
            kmfdm = 0;
            pentium = 1;
            bubba = 0;
            ohno = 0;
            fallen = 0;
            comrade = 1;
            chairman = 1;
            biker = 0;
            tattoo = 1;
          end
        indigo_3: begin
            kmfdm = 0;
            pentium = 0;
            bubba = 0;
            ohno = 1;
            fallen = 0;
            comrade = 0;
            chairman = 0;
            biker = 0;
            tattoo = 1;
          end
        indigo_4: begin
            kmfdm = 0;
            pentium = 0;
            bubba = 1;
            ohno = 0;
            fallen = 1;
            comrade = 1;
            chairman = 1;
            biker = 1;
            tattoo = 1;
          end
        indigo_5: begin
            kmfdm = 1;
            pentium = 0;
            bubba = 1;
            ohno = 0;
            fallen = 0;
            comrade = 1;
            chairman = 0;
            biker = 1;
            tattoo = 1;
          end
        indigo_6: begin
            kmfdm = 0;
            pentium = 1;
            bubba = 1;
            ohno = 0;
            fallen = 1;
            comrade = 0;
            chairman = 1;
            biker = 1;
            tattoo = 1;
          end
        default: begin
            kmfdm = 1;
            pentium = 1;
            bubba = 1;
            ohno = 0;
            fallen = 1;
            comrade = 1;
            chairman = 1;
            biker = 0;
            tattoo = 0;
          end
      endcase
  end

always @(kmfdm)
  begin
      feedback_pt_32 = kmfdm;
  end

always @(kmfdm)
  begin
      feedback_pt_33 = kmfdm;
  end

always @(pentium)
  begin
      feedback_pt_34 = pentium;
  end

always @(bubba)
  begin
      feedback_pt_35 = bubba;
  end

always @(ohno)
  begin
      feedback_pt_36 = ohno;
  end

always @(ohno)
  begin
      feedback_pt_37 = ohno;
  end

always @(ohno)
  begin
      feedback_pt_38 = ohno;
  end

always @(ohno)
  begin
      feedback_pt_39 = ohno;
  end

always @(ohno)
  begin
      feedback_pt_40 = ohno;
  end

always @(fallen)
  begin
      feedback_pt_41 = fallen;
  end

always @(comrade)
  begin
      feedback_pt_42 = comrade;
  end

always @(chairman)
  begin
      feedback_pt_43 = chairman;
  end

always @(biker)
  begin
      feedback_pt_44 = biker;
  end

always @(tattoo)
  begin
      feedback_pt_45 = tattoo;
  end


initial begin
    {kanji,knot,bellybutton} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (hamburger)
      {kanji,knot,bellybutton} <= 0;
    else if (gnd)
      {kanji,knot,bellybutton} <=
		  {cow,popcorn,yellow};
    else
      {kanji,knot,bellybutton} <=
		 {vcc,hulk,gnd} + 
		 {nest,beavis,vcc};
  end

// NOR all of these bits together
always @(southern or gnd or gyro or ceres or woman or whack or vcc or gnd or cinderella or spirit or obiwan)
  begin
      whammy = ~| {southern,gnd,gyro,ceres,woman,whack,vcc,gnd,cinderella,spirit,obiwan};
  end

reg feedback_pt_49;

always @(gnd or feedback_pt_49)
  begin
      deathguild =  gnd | !feedback_pt_49;
  end

reg feedback_pt_50;

always @(gnd or feedback_pt_50)
  begin
      maritime = !gnd ^  feedback_pt_50;
  end

reg feedback_pt_51;

always @(gnd or feedback_pt_51)
  begin
      surfer = !gnd & !feedback_pt_51;
  end

reg feedback_pt_52;

always @(vcc or feedback_pt_52)
  begin
      moron = !vcc ^  feedback_pt_52;
  end

reg feedback_pt_53;

always @(bush or feedback_pt_53)
  begin
      iterate = !bush ^ !feedback_pt_53;
  end

reg feedback_pt_54;

always @(achilles or feedback_pt_54)
  begin
      elkarchmero = !achilles & !feedback_pt_54;
  end

reg feedback_pt_55;

always @(papa or feedback_pt_55)
  begin
      elguapo = !papa &  feedback_pt_55;
  end

reg feedback_pt_56;

always @(butthead or feedback_pt_56)
  begin
      senorduck =  butthead |  feedback_pt_56;
  end

reg feedback_pt_57;

always @(gnd or feedback_pt_57)
  begin
      firstpart =  gnd ^  feedback_pt_57;
  end

reg feedback_pt_58;

always @(chairman or feedback_pt_58)
  begin
      leidiot = !chairman |  feedback_pt_58;
  end

reg feedback_pt_59;

always @(pizza or feedback_pt_59)
  begin
      kidnapper =  pizza &  feedback_pt_59;
  end

reg feedback_pt_60;

always @(iterate or feedback_pt_60)
  begin
      ring = !iterate & !feedback_pt_60;
  end

reg feedback_pt_61;

always @(sleepy or feedback_pt_61)
  begin
      think =  sleepy |  feedback_pt_61;
  end

reg feedback_pt_62;

always @(popcorn or feedback_pt_62)
  begin
      firewiggle =  popcorn &  feedback_pt_62;
  end

reg feedback_pt_63;

always @(mortgate or feedback_pt_63)
  begin
      bracket = !mortgate ^  feedback_pt_63;
  end

reg feedback_pt_64;

always @(biker or feedback_pt_64)
  begin
      probably =  biker ^  feedback_pt_64;
  end

reg feedback_pt_65;

always @(vcc or feedback_pt_65)
  begin
      shudamak =  vcc &  feedback_pt_65;
  end

reg feedback_pt_66;

always @(gnd or feedback_pt_66)
  begin
      callme = !gnd &  feedback_pt_66;
  end

reg feedback_pt_67;

always @(foxtrot or feedback_pt_67)
  begin
      wannabe = !foxtrot ^  feedback_pt_67;
  end

reg feedback_pt_68;

always @(sheep or feedback_pt_68)
  begin
      fuji =  sheep | !feedback_pt_68;
  end

reg feedback_pt_69;

always @(vcc or feedback_pt_69)
  begin
      emails =  vcc |  feedback_pt_69;
  end

reg feedback_pt_70;

always @(cheese or feedback_pt_70)
  begin
      dadada =  cheese |  feedback_pt_70;
  end

reg feedback_pt_71;

always @(elkarchmero or feedback_pt_71)
  begin
      conference =  elkarchmero ^ !feedback_pt_71;
  end

reg feedback_pt_72;

always @(kmfdm or feedback_pt_72)
  begin
      parrot =  kmfdm ^  feedback_pt_72;
  end

reg feedback_pt_73;

always @(pantalones or feedback_pt_73)
  begin
      workhere = !pantalones &  feedback_pt_73;
  end

reg feedback_pt_74;

always @(cluckU or feedback_pt_74)
  begin
      onthepc = !cluckU & !feedback_pt_74;
  end

reg feedback_pt_75;

always @(barty or feedback_pt_75)
  begin
      facetious = !barty & !feedback_pt_75;
  end

reg feedback_pt_76;

always @(bellybutton or feedback_pt_76)
  begin
      mariollama = !bellybutton ^  feedback_pt_76;
  end

reg feedback_pt_77;

always @(jellyfish or feedback_pt_77)
  begin
      rafting = !jellyfish & !feedback_pt_77;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      freaky <= 0;
    else if (whiskey)
      freaky <= onthepc;
  end

always @(freaky)
  begin
      feedback_pt_46 = freaky;
  end

always @(freaky)
  begin
      feedback_pt_47 = freaky;
  end

always @(freaky)
  begin
      feedback_pt_48 = freaky;
  end

always @(freaky)
  begin
      feedback_pt_49 = freaky;
  end

wire davidlin_wire;

dffeas davidlin_ff (
  .clk(clock0),
  .d(gnd),
  .ena(lima),
  .sclr(gnd),
  .sload(achilles),
  .asdata(uniform),
  .clrn(!reset0),
  .q(davidlin_wire)
);

always @(davidlin_wire) begin
   blueled = davidlin_wire;
end

always @(blueled)
  begin
      feedback_pt_50 = blueled;
  end

always @(blueled)
  begin
      feedback_pt_51 = blueled;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pirate <= 0;
    else if (conference)
      pirate <= freaky;
  end

always @(pirate)
  begin
      feedback_pt_52 = pirate;
  end

always @(pirate)
  begin
      feedback_pt_53 = pirate;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      prison <= 0;
    else if (jellyfish)
      prison <= 0;
    else if (vcc)
      prison <= bomb_pop;
  end

always @(prison)
  begin
      feedback_pt_54 = prison;
  end

always @(prison)
  begin
      feedback_pt_55 = prison;
  end

always @(prison)
  begin
      feedback_pt_56 = prison;
  end

always @(prison)
  begin
      feedback_pt_57 = prison;
  end

always @(prison)
  begin
      feedback_pt_58 = prison;
  end

wire marquis_wire;

dffeas marquis_ff (
  .clk(clock0),
  .d(air),
  .ena(gnd),
  .sclr(lima),
  .sload(gnd),
  .asdata(washington),
  .clrn(!reset0),
  .q(marquis_wire)
);

always @(marquis_wire) begin
   desade = marquis_wire;
end

always @(desade)
  begin
      feedback_pt_59 = desade;
  end

always @(desade)
  begin
      feedback_pt_60 = desade;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      baron <= 1;
    else
      baron <= skywalker;
  end

always @(baron)
  begin
      feedback_pt_61 = baron;
  end

always @(baron)
  begin
      feedback_pt_62 = baron;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vonmunchhausen <= 0;
    else if (parrot)
      vonmunchhausen <= crayons;
  end

always @(vonmunchhausen)
  begin
      feedback_pt_63 = vonmunchhausen;
  end

always @(vonmunchhausen)
  begin
      feedback_pt_64 = vonmunchhausen;
  end

always @(vonmunchhausen)
  begin
      feedback_pt_65 = vonmunchhausen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      boots <= 0;
    else
      boots <= gnd;
  end

always @(boots)
  begin
      feedback_pt_66 = boots;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      narcotics <= 1;
    else
      narcotics <= orange;
  end

always @(narcotics)
  begin
      feedback_pt_67 = narcotics;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cocaine <= 0;
    else if (elkarchmero)
      cocaine <= rojas;
    else if (surfer)
      cocaine <= 0;
  end

always @(cocaine)
  begin
      feedback_pt_68 = cocaine;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      contractor <= 0;
    else if (cartman)
      contractor <= safada;
    else if (dork)
      contractor <= 0;
  end

always @(contractor)
  begin
      feedback_pt_69 = contractor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      doobie <= 0;
    else
      doobie <= hanger;
  end

always @(doobie)
  begin
      feedback_pt_70 = doobie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      float <= 0;
    else if (lima)
      float <= prison;
    else if (funkadelic)
      float <= 0;
  end

always @(float)
  begin
      feedback_pt_71 = float;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      budlite <= 0;
    else
      budlite <= gnd;
  end

always @(budlite)
  begin
      feedback_pt_72 = budlite;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      morenames <= 0;
    else
      morenames <= dweebie;
  end

always @(morenames)
  begin
      feedback_pt_73 = morenames;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mrbill <= 0;
    else if (vcc)
      mrbill <= vcc;
  end

always @(mrbill)
  begin
      feedback_pt_74 = mrbill;
  end

wire dutch_wire;

dffeas dutch_ff (
  .clk(clock0),
  .d(vadar),
  .ena(goofy),
  .sclr(gnd),
  .sload(chicken),
  .asdata(vcc),
  .clrn(!reset0),
  .q(dutch_wire)
);

always @(dutch_wire) begin
   candle = dutch_wire;
end

always @(candle)
  begin
      feedback_pt_75 = candle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spyro <= 0;
    else if (popacap)
      spyro <= neon;
    else if (facetious)
      spyro <= 0;
  end

always @(spyro)
  begin
      feedback_pt_76 = spyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      speedyg <= 0;
    else if (questo)
      speedyg <= duey;
  end

always @(speedyg)
  begin
      feedback_pt_77 = speedyg;
  end

wire kennyg_wire;

dffeas kennyg_ff (
  .clk(clock0),
  .d(buddha),
  .ena(gnd),
  .sclr(gnd),
  .sload(green),
  .asdata(gnd),
  .clrn(!reset0),
  .q(kennyg_wire)
);

always @(kennyg_wire) begin
   johndenver = kennyg_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacklemon <= 1;
    else
      jacklemon <= kanji;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      theonion <= 1;
    else
      theonion <= hulk;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chatanooga <= 0;
    else if (purple)
      chatanooga <= senorduck;
  end

wire kebab_wire;

dffea kebab_ff (
  .clk(clock0),
  .d(emails),
  .ena(pdiddy),
  .adata(ulysses),
  .clrn(!reset0),
  .q(kebab_wire)
);

always @(kebab_wire) begin
   kabar = kebab_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fullmetal <= 0;
    else if (vcc)
      fullmetal <= bagel;
    else if (minnie)
      fullmetal <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aluminum <= 0;
    else if (master)
      aluminum <= callme;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      copper <= 1;
    else
      copper <= zulu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zinc <= 0;
    else if (johndenver)
      zinc <= vcc;
  end

wire platinum_wire;

dffeas platinum_ff (
  .clk(clock0),
  .d(spyro),
  .ena(moulin),
  .sclr(togos),
  .sload(mike),
  .asdata(pyro),
  .clrn(!reset0),
  .q(platinum_wire)
);

always @(platinum_wire) begin
   tin = platinum_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iron <= 1;
    else
      iron <= lima;
  end

// NOR all of these bits together
always @(vcc or vcc or llama or vcc or dali_llama or doobie)
  begin
      fascist = ~| {vcc,vcc,llama,vcc,dali_llama,doobie};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      anarchist <= 0;
    else
    case ({vcc,metal})
       0 : anarchist <= vcc;
       1 : anarchist <= grumpy;
       2 : anarchist <= anarchist;
       3 : anarchist <= anarchist;
       default : anarchist <= 0;
    endcase
  end


// building a 16 to 1 MUX operator
reg [15:0] capitalist_mux_dat;
reg [3:0] capitalist_mux_sel;
always @(vcc or criminal or gnd or rojas or parrot or gnd or mariollama or budlite or ohno or vcc or vcc or fuji or aluminum or firewiggle or vcc or mcnugget)
  begin
    capitalist_mux_dat = {vcc,criminal,gnd,rojas,parrot,gnd,mariollama,budlite,ohno,vcc,vcc,fuji,aluminum,firewiggle,vcc,mcnugget};
  end

always @(zulu or fullmetal or zinc or speedyg)
  begin
    capitalist_mux_sel = {zulu,fullmetal,zinc,speedyg};
  end

always @(capitalist_mux_dat or capitalist_mux_sel)
  begin
    socialist = capitalist_mux_dat[capitalist_mux_sel];
  end

// OR all of these bits together
always @(vcc or gnd or jacklemon or nest or mickey or vonmunchhausen)
  begin
      moderate = | {vcc,gnd,jacklemon,nest,mickey,vonmunchhausen};
  end

// 8 bit priority MUX
always @(
        spyro or moron  or 
        vcc or gnd  or 
        buddha or gnd  or 
        vcc or gnd  or 
        gnd or vcc  or 
        vcc or prison  or 
        porfavor or johndenver  or 
        doc or louie 
)

  begin
    if (spyro) floating = moron;
    else if (vcc) floating = gnd;
    else if (buddha) floating = gnd;
    else if (vcc) floating = gnd;
    else if (gnd) floating = vcc;
    else if (vcc) floating = prison;
    else if (porfavor) floating = johndenver;
    else if (doc) floating = louie;
    else floating = 0;
  end

// Random 3 input look up table
always @(vcc or conference or scrooge)
  begin
    casex ({vcc,conference,scrooge})
      0: drevil=0;
      1: drevil=0;
      2: drevil=1;
      3: drevil=0;
      4: drevil=0;
      5: drevil=0;
      6: drevil=1;
      7: drevil=0;
      default: drevil=0;
    endcase
  end

// Random 5 input look up table
always @(stapler or vcc or morenames or bubba or vcc)
  begin
    casex ({stapler,vcc,morenames,bubba,vcc})
      0: erncenso=1;
      1: erncenso=1;
      2: erncenso=0;
      3: erncenso=1;
      4: erncenso=1;
      5: erncenso=1;
      6: erncenso=0;
      7: erncenso=0;
      8: erncenso=0;
      9: erncenso=1;
      10: erncenso=1;
      11: erncenso=0;
      12: erncenso=1;
      13: erncenso=1;
      14: erncenso=0;
      15: erncenso=1;
      16: erncenso=0;
      17: erncenso=0;
      18: erncenso=1;
      19: erncenso=1;
      20: erncenso=1;
      21: erncenso=0;
      22: erncenso=1;
      23: erncenso=1;
      24: erncenso=0;
      25: erncenso=0;
      26: erncenso=0;
      27: erncenso=0;
      28: erncenso=1;
      29: erncenso=1;
      30: erncenso=0;
      31: erncenso=1;
      default: erncenso=0;
    endcase
  end

// 7 bit priority MUX
always @(
        aladdin or floating  or 
        wannabe or rat  or 
        boots or vcc  or 
        fuji or surfer  or 
        gnd or whack  or 
        vcc or genesis  or 
        kidnapper or erncenso 
)

  begin
    if (aladdin) fsncens = floating;
    else if (wannabe) fsncens = rat;
    else if (boots) fsncens = vcc;
    else if (fuji) fsncens = surfer;
    else if (gnd) fsncens = whack;
    else if (vcc) fsncens = genesis;
    else if (kidnapper) fsncens = erncenso;
    else fsncens = 0;
  end

// 7 bit priority MUX
always @(
        firstpart or vcc  or 
        vcc or vcc  or 
        gnd or fsncens  or 
        rafting or desade  or 
        vcc or shudamak  or 
        boots or shudamak  or 
        papa or gnd 
)

  begin
    if (firstpart) gtncensor = vcc;
    else if (vcc) gtncensor = vcc;
    else if (gnd) gtncensor = fsncens;
    else if (rafting) gtncensor = desade;
    else if (vcc) gtncensor = shudamak;
    else if (boots) gtncensor = shudamak;
    else if (papa) gtncensor = gnd;
    else gtncensor = 0;
  end

// 2 bit SOP selector
always @(
        gnd or orange  or 
        probably or duey 
)

begin
    tinker = 
      gnd & orange |
      probably & duey;
end

// Random 4 input look up table
always @(gyro or hector or genesis or loser)
  begin
    casex ({gyro,hector,genesis,loser})
      0: lunchtime=0;
      1: lunchtime=1;
      2: lunchtime=0;
      3: lunchtime=0;
      4: lunchtime=0;
      5: lunchtime=1;
      6: lunchtime=0;
      7: lunchtime=0;
      8: lunchtime=1;
      9: lunchtime=0;
      10: lunchtime=0;
      11: lunchtime=1;
      12: lunchtime=1;
      13: lunchtime=1;
      14: lunchtime=1;
      15: lunchtime=1;
      default: lunchtime=0;
    endcase
  end


// building a 128 to 1 MUX operator
reg [127:0] roosevelt_mux_dat;
reg [6:0] roosevelt_mux_sel;
always @(west or mrbill or emails or dr_zaius or doobie or green or lamer or pdiddy or ring or loser or gnd or sleeping or babette or cow or green or clay or hanger or stapler or bracket or vcc or deathguild or gnd or obiwan or pentium or speedyg or gnd or comrade or vcc or lunchtime or firstpart or mike or pirate or stapler or mrbill or fascist or float or think or flew or vonmunchhausen or hanger or batman or copper or gnd or echo or contractor or maritime or gnd or vcc or popcorn or facetious or vcc or vcc or vcc or vcc or ring or babette or kilo or gnd or gtncensor or rojas or kabar or dadada or zulu or ulysses or dog or knot or vcc or rat or whammy or gnd or water or would or burnout or vcc or baron or foxtrot or paper or hanger or holepunch or moderate or vcc or happy or firstpart or cuckoo or tin or fascist or anarchist or gnd or fascist or vcc or donkey or gnd or would or gnd or rafting or pyro or vcc or hamburger or gnd or gnd or gnd or burnout or ohno or surfer or bambi or wannabe or east or vcc or vcc or gnd or speedyg or vcc or gnd or candle or lima or vcc or holepunch or vcc or mcnugget or gnd or mike or chiptrip or cocaine or rat or north or socialist or vcc or grumpy)
  begin
    roosevelt_mux_dat = {west,mrbill,emails,dr_zaius,doobie,green,lamer,pdiddy,ring,loser,gnd,sleeping,babette,cow,green,clay,hanger,stapler,bracket,vcc,deathguild,gnd,obiwan,pentium,speedyg,gnd,comrade,vcc,lunchtime,firstpart,mike,pirate,stapler,mrbill,fascist,float,think,flew,vonmunchhausen,hanger,batman,copper,gnd,echo,contractor,maritime,gnd,vcc,popcorn,facetious,vcc,vcc,vcc,vcc,ring,babette,kilo,gnd,gtncensor,rojas,kabar,dadada,zulu,ulysses,dog,knot,vcc,rat,whammy,gnd,water,would,burnout,vcc,baron,foxtrot,paper,hanger,holepunch,moderate,vcc,happy,firstpart,cuckoo,tin,fascist,anarchist,gnd,fascist,vcc,donkey,gnd,would,gnd,rafting,pyro,vcc,hamburger,gnd,gnd,gnd,burnout,ohno,surfer,bambi,wannabe,east,vcc,vcc,gnd,speedyg,vcc,gnd,candle,lima,vcc,holepunch,vcc,mcnugget,gnd,mike,chiptrip,cocaine,rat,north,socialist,vcc,grumpy};
  end

always @(homer or vcc or leviticus or fullmetal or gnd or copper or vcc)
  begin
    roosevelt_mux_sel = {homer,vcc,leviticus,fullmetal,gnd,copper,vcc};
  end

always @(roosevelt_mux_dat or roosevelt_mux_sel)
  begin
    hxncensorce = roosevelt_mux_dat[roosevelt_mux_sel];
  end

reg feedback_pt_78;

always @(east or feedback_pt_78)
  begin
      opus = !east ^  feedback_pt_78;
  end

reg feedback_pt_79;

always @(master or feedback_pt_79)
  begin
      portnoy =  master ^ !feedback_pt_79;
  end

reg feedback_pt_80;

always @(vcc or feedback_pt_80)
  begin
      milo =  vcc & !feedback_pt_80;
  end

reg feedback_pt_81;

always @(johndenver or feedback_pt_81)
  begin
      bloom = !johndenver | !feedback_pt_81;
  end

reg feedback_pt_82;

always @(yellow or feedback_pt_82)
  begin
      potatoskin = !yellow &  feedback_pt_82;
  end

reg feedback_pt_83;

always @(tinker or feedback_pt_83)
  begin
      hotpastrami =  tinker | !feedback_pt_83;
  end

reg feedback_pt_84;

always @(iron or feedback_pt_84)
  begin
      roastbeef = !iron &  feedback_pt_84;
  end

reg feedback_pt_85;

always @(potatoskin or feedback_pt_85)
  begin
      donut =  potatoskin &  feedback_pt_85;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      poppyseed <= 1;
    else
      poppyseed <= bolt;
  end

always @(poppyseed)
  begin
      feedback_pt_78 = poppyseed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      clubsandwich <= 0;
    else if (anarchist)
      clubsandwich <= bloom;
    else if (opus)
      clubsandwich <= 0;
  end

always @(clubsandwich)
  begin
      feedback_pt_79 = clubsandwich;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kungfu <= 0;
    else
      kungfu <= grumpy;
  end

always @(kungfu)
  begin
      feedback_pt_80 = kungfu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fatality <= 0;
    else if (lion)
      fatality <= 0;
    else if (donald)
      fatality <= portnoy;
  end

always @(fatality)
  begin
      feedback_pt_81 = fatality;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      testyour <= 0;
    else
      testyour <= fallen;
  end

always @(testyour)
  begin
      feedback_pt_82 = testyour;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      might <= 0;
    else if (lamer)
      might <= gnd;
    else if (roastbeef)
      might <= 0;
  end

always @(might)
  begin
      feedback_pt_83 = might;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      excellent <= 1;
    else
      excellent <= stapler;
  end

always @(excellent)
  begin
      feedback_pt_84 = excellent;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      Iwin <= 0;
    else if (funkadelic)
      Iwin <= potatoskin;
    else if (jacques)
      Iwin <= 0;
  end

always @(Iwin)
  begin
      feedback_pt_85 = Iwin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      danger <= 1;
    else
      danger <= zulu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      screaming <= 0;
    else if (theonion)
      screaming <= portnoy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atilla <= 0;
    else if (kilo)
      atilla <= ring;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      famulan <= 0;
    else if (funkadelic)
      famulan <= 0;
    else if (gnd)
      famulan <= grumpy;
  end

// Random combinatorial logic block
always@(*)
  begin
      supurb = ~( ( ~( ~( ~( would ) ) ) ^ ( ~( ~atilla & ( ~( werewolf & ~vcc ^ ~( ~foxtrot ) ) ) ) ) ) );
  end

  always@(*)
  begin
    jayqueeze = ~( ~( ( ~( ~atilla & vcc ) & ( fallen & ~vcc | ~( ~jacques ) ) ) ) ) ? ~( ~( ~( ( ~anarchist & ~hotpastrami ) ) ) ) | vcc : ( ~lunchtime | donut & ( ~( ~( gnd ) ) | ~( ( ~gnd & famulan ) ) ) );
  end
// State Mek waydeelect Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      waydeelect <= waydeelect_0;
    else
      case (waydeelect)
        waydeelect_0: begin
          if ({motorhead,bambi,leidiot,holepunch} == 10)
            waydeelect <= waydeelect_1;
          else if ({motorhead,bambi,leidiot,holepunch} == 4)
            waydeelect <= waydeelect_4;
          else
            waydeelect <= waydeelect_0;
          end
        waydeelect_1: begin
          if ({motorhead,bambi,leidiot,holepunch} == 4)
            waydeelect <= waydeelect_3;
          else if ({motorhead,bambi,leidiot,holepunch} == 5)
            waydeelect <= waydeelect_4;
          else if ({motorhead,bambi,leidiot,holepunch} == 12)
            waydeelect <= waydeelect_6;
          else if ({motorhead,bambi,leidiot,holepunch} == 8)
            waydeelect <= waydeelect_6;
          else if ({motorhead,bambi,leidiot,holepunch} == 15)
            waydeelect <= waydeelect_3;
          else if ({motorhead,bambi,leidiot,holepunch} == 6)
            waydeelect <= waydeelect_0;
          else if ({motorhead,bambi,leidiot,holepunch} == 2)
            waydeelect <= waydeelect_0;
          else
            waydeelect <= waydeelect_1;
          end
        waydeelect_2: begin
          if ({motorhead,bambi,leidiot,holepunch} == 15)
            waydeelect <= waydeelect_2;
          else if ({motorhead,bambi,leidiot,holepunch} == 11)
            waydeelect <= waydeelect_6;
          else if ({motorhead,bambi,leidiot,holepunch} == 6)
            waydeelect <= waydeelect_0;
          else if ({motorhead,bambi,leidiot,holepunch} == 9)
            waydeelect <= waydeelect_7;
          else
            waydeelect <= waydeelect_2;
          end
        waydeelect_3: begin
          if ({motorhead,bambi,leidiot,holepunch} == 11)
            waydeelect <= waydeelect_3;
          else if ({motorhead,bambi,leidiot,holepunch} == 3)
            waydeelect <= waydeelect_5;
          else
            waydeelect <= waydeelect_3;
          end
        waydeelect_4: begin
          if ({motorhead,bambi,leidiot,holepunch} == 0)
            waydeelect <= waydeelect_7;
          else
            waydeelect <= waydeelect_4;
          end
        waydeelect_5: begin
          if ({motorhead,bambi,leidiot,holepunch} == 5)
            waydeelect <= waydeelect_6;
          else if ({motorhead,bambi,leidiot,holepunch} == 13)
            waydeelect <= waydeelect_2;
          else
            waydeelect <= waydeelect_5;
          end
        waydeelect_6: begin
          if ({motorhead,bambi,leidiot,holepunch} == 5)
            waydeelect <= waydeelect_3;
          else if ({motorhead,bambi,leidiot,holepunch} == 3)
            waydeelect <= waydeelect_2;
          else
            waydeelect <= waydeelect_6;
          end
        waydeelect_7: begin
          if ({motorhead,bambi,leidiot,holepunch} == 14)
            waydeelect <= waydeelect_4;
          else
            waydeelect <= waydeelect_7;
          end
        default: waydeelect <= waydeelect_0;
      endcase
  end

// State Mek waydeelect Output logic
always @(waydeelect)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (waydeelect[3:1])
        waydeelect_0: begin
            iwocensor = 1;
            incompetent = 0;
            secondrate = 0;
            inspection = 0;
            thedon = 0;
            marco = 0;
            cocacola = 1;
            ham = 1;
            mandarin = 0;
          end
        waydeelect_1: begin
            iwocensor = 1;
            incompetent = 1;
            secondrate = 1;
            inspection = 0;
            thedon = 1;
            marco = 1;
            cocacola = 1;
            ham = 1;
            mandarin = 0;
          end
        waydeelect_2: begin
            iwocensor = 0;
            incompetent = 1;
            secondrate = 0;
            inspection = 0;
            thedon = 1;
            marco = 0;
            cocacola = 1;
            ham = 1;
            mandarin = 1;
          end
        waydeelect_3: begin
            iwocensor = 1;
            incompetent = 0;
            secondrate = 1;
            inspection = 0;
            thedon = 0;
            marco = 1;
            cocacola = 1;
            ham = 0;
            mandarin = 1;
          end
        default: begin
            iwocensor = 1;
            incompetent = 1;
            secondrate = 1;
            inspection = 1;
            thedon = 0;
            marco = 1;
            cocacola = 0;
            ham = 1;
            mandarin = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire october_out;
nut_000_lut #(6) nut_000_lut_inst_october (
  .din({atilla,vcc,kangaroo,poppyseed,bloom,drevil}),
  .mask(64'hcd8ccf59579fed9c),
  .out(october_out)
);

always @(october_out)
begin
   ihilani = october_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire jjocen_out;
nut_000_lut #(4) nut_000_lut_inst_jjocen (
  .din({socialist,ihilani,portnoy,elguapo}),
  .mask(16'b0001110001010000),
  .out(jjocen_out)
);

always @(jjocen_out)
begin
   tracy = jjocen_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire bismuth_out;
nut_000_lut #(6) nut_000_lut_inst_bismuth (
  .din({moron,gnd,vcc,think,thedon,narcotics}),
  .mask(64'h9480bb64ea5ab30e),
  .out(bismuth_out)
);

always @(bismuth_out)
begin
   meffert = bismuth_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire oranges_out;
nut_000_lut #(2) nut_000_lut_inst_oranges (
  .din({foxtrot,jiminy}),
  .mask(4'h4),
  .out(oranges_out)
);

always @(oranges_out)
begin
   floride = oranges_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire junkie_out;
nut_000_lut #(4) nut_000_lut_inst_junkie (
  .din({gnd,thedon,lion,fatality}),
  .mask(16'h8249),
  .out(junkie_out)
);

always @(junkie_out)
begin
   pyromaniac = junkie_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire burner_out;
nut_000_lut #(5) nut_000_lut_inst_burner (
  .din({gnd,portnoy,chatanooga,vcc,floride}),
  .mask(32'b01000000110011100011001000001001),
  .out(burner_out)
);

always @(burner_out)
begin
   waster = burner_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire stoner_out;
nut_000_lut #(6) nut_000_lut_inst_stoner (
  .din({kilo,vcc,chiptrip,kungfu,vcc,atilla}),
  .mask(64'b0000000000000100011000001010101000001110010011100011110000010011),
  .out(stoner_out)
);

always @(stoner_out)
begin
   crackhead = stoner_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire chemical_out;
nut_000_lut #(2) nut_000_lut_inst_chemical (
  .din({yoda,bambi}),
  .mask(4'hb),
  .out(chemical_out)
);

always @(chemical_out)
begin
   drugie = chemical_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire tunafish_out;
nut_000_lut #(3) nut_000_lut_inst_tunafish (
  .din({might,gnd,danger}),
  .mask(8'h5c),
  .out(tunafish_out)
);

always @(tunafish_out)
begin
   brothers = tunafish_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire agitator_out;
nut_000_lut #(6) nut_000_lut_inst_agitator (
  .din({crackhead,pyromaniac,testyour,secondrate,blueled,zulu}),
  .mask(64'h46fdb624c2efaecb),
  .out(agitator_out)
);

always @(agitator_out)
begin
   eggsalad = agitator_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire satanist_out;
nut_000_lut #(4) nut_000_lut_inst_satanist (
  .din({motorhead,pyromaniac,hxncensorce,workhere}),
  .mask(16'h0c32),
  .out(satanist_out)
);

always @(satanist_out)
begin
   postulator = satanist_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire whoiswho_out;
nut_000_lut #(2) nut_000_lut_inst_whoiswho (
  .din({vcc,supurb}),
  .mask(4'b0111),
  .out(whoiswho_out)
);

always @(whoiswho_out)
begin
   plagarist = whoiswho_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire morrison_out;
nut_000_lut #(6) nut_000_lut_inst_morrison (
  .din({vcc,portnoy,kilo,screaming,drugie,tracy}),
  .mask(64'b0100011010100000000001001000000100001001000001000100000011001100),
  .out(morrison_out)
);

always @(morrison_out)
begin
   money = morrison_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire withme_out;
nut_000_lut #(1) nut_000_lut_inst_withme (
  .din({east}),
  .mask(2'b01),
  .out(withme_out)
);

always @(withme_out)
begin
   firewalk = withme_out;
end

// Greater Equal Less compare
always @(gnd or foxtrot or paper or hxncensorce or vadar or vcc or vcc or lunchtime)
  begin
    if ({gnd,foxtrot,paper,hxncensorce} > {vadar,vcc,vcc,lunchtime})
       {palmer,banality,brutality} = 3'b100;
    else if ({gnd,foxtrot,paper,hxncensorce} < {vadar,vcc,vcc,lunchtime})
       {palmer,banality,brutality} = 3'b010;
    else
       {palmer,banality,brutality} = 3'b001;
  end

// 7 bit SOP selector
always @(
        atilla or kangaroo  or 
        milo or facetious  or 
        kangaroo or palmer  or 
        brothers or vcc  or 
        vcc or kungfu  or 
        gnd or kungfu  or 
        thedon or firewalk 
)

begin
    fury = 
      atilla & kangaroo |
      milo & facetious |
      kangaroo & palmer |
      brothers & vcc |
      vcc & kungfu |
      gnd & kungfu |
      thedon & firewalk;
end

reg feedback_pt_86;

always @(bambi or feedback_pt_86)
  begin
      hurt =  bambi ^ !feedback_pt_86;
  end

reg feedback_pt_87;

always @(poppyseed or feedback_pt_87)
  begin
      tobe =  poppyseed | !feedback_pt_87;
  end

reg feedback_pt_88;

always @(banality or feedback_pt_88)
  begin
      yoku =  banality |  feedback_pt_88;
  end

reg feedback_pt_89;

always @(fury or feedback_pt_89)
  begin
      simasu =  fury | !feedback_pt_89;
  end

reg feedback_pt_90;

always @(bambi or feedback_pt_90)
  begin
      geisha = !bambi ^  feedback_pt_90;
  end

reg feedback_pt_91;

always @(vcc or feedback_pt_91)
  begin
      pictures =  vcc & !feedback_pt_91;
  end

reg feedback_pt_92;

always @(milo or feedback_pt_92)
  begin
      star = !milo &  feedback_pt_92;
  end

reg feedback_pt_93;

always @(pyromaniac or feedback_pt_93)
  begin
      show =  pyromaniac & !feedback_pt_93;
  end

reg feedback_pt_94;

always @(vcc or feedback_pt_94)
  begin
      ready =  vcc |  feedback_pt_94;
  end

reg feedback_pt_95;

always @(bambi or feedback_pt_95)
  begin
      gokidsgo =  bambi & !feedback_pt_95;
  end

reg feedback_pt_96;

always @(socialist or feedback_pt_96)
  begin
      lemon =  socialist ^  feedback_pt_96;
  end

wire winner_wire;

dffea winner_ff (
  .clk(clock0),
  .d(east),
  .ena(cocacola),
  .adata(show),
  .clrn(!reset0),
  .q(winner_wire)
);

always @(winner_wire) begin
   speeding = winner_wire;
end

always @(speeding)
  begin
      feedback_pt_86 = speeding;
  end

always @(speeding)
  begin
      feedback_pt_87 = speeding;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hiway <= 0;
    else if (plagarist)
      hiway <= 0;
    else if (bolt)
      hiway <= speeding;
  end

always @(hiway)
  begin
      feedback_pt_88 = hiway;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      grams <= 0;
    else
      grams <= vcc;
  end

always @(grams)
  begin
      feedback_pt_89 = grams;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kdqcens <= 0;
    else if (firewalk)
      kdqcens <= bloom;
    else if (vcc)
      kdqcens <= 0;
  end

always @(kdqcens)
  begin
      feedback_pt_90 = kdqcens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bust <= 0;
    else if (geisha)
      bust <= incompetent;
  end

always @(bust)
  begin
      feedback_pt_91 = bust;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gotone <= 0;
    else if (vcc)
      gotone <= 0;
    else if (grams)
      gotone <= workhere;
  end

always @(gotone)
  begin
      feedback_pt_92 = gotone;
  end

wire foryou_wire;

dffea foryou_ff (
  .clk(clock0),
  .d(gnd),
  .ena(kdqcens),
  .adata(workhere),
  .clrn(!reset0),
  .q(foryou_wire)
);

always @(foryou_wire) begin
   sogood = foryou_wire;
end

always @(sogood)
  begin
      feedback_pt_93 = sogood;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moreand <= 0;
    else if (lunchtime)
      moreand <= gnd;
  end

always @(moreand)
  begin
      feedback_pt_94 = moreand;
  end

wire faster_wire;

dffea faster_ff (
  .clk(clock0),
  .d(pyro),
  .ena(brutality),
  .adata(hiway),
  .clrn(!reset0),
  .q(faster_wire)
);

always @(faster_wire) begin
   elementary = faster_wire;
end

always @(elementary)
  begin
      feedback_pt_95 = elementary;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sixyears <= 0;
    else if (lemon)
      sixyears <= 0;
    else if (iwocensor)
      sixyears <= star;
  end

always @(sixyears)
  begin
      feedback_pt_96 = sixyears;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      graduated <= 0;
    else if (postulator)
      graduated <= mandarin;
    else if (pyro)
      graduated <= 0;
  end

wire overeducated_wire;

dffea overeducated_ff (
  .clk(clock0),
  .d(cocaine),
  .ena(gotone),
  .adata(gnd),
  .clrn(!reset0),
  .q(overeducated_wire)
);

always @(overeducated_wire) begin
   notalot = overeducated_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nation <= 1;
    else
      nation <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      protest <= 0;
    else
      protest <= vcc;
  end

// A + const
always @(notalot or postulator or hurt or vcc or gnd or clubsandwich or eggsalad)
  begin
    {animal,vegan,vegetarian,liberation} = {notalot,postulator,hurt,vcc,gnd,clubsandwich,eggsalad} + 114;
  end

// Ternary sign extend bait
always @(vcc or vcc or vcc or vcc or marco or superman or vcc or maritime or gotone or lunchtime or ready or clubsandwich or drugie or protest or zulu or kdqcens or banality or waster or gnd or fatality or gokidsgo or gnd or gotone or lunchtime or elementary or simasu or
         Iwin or Iwin or Iwin or Iwin or Iwin or Iwin or Iwin or Iwin or Iwin or Iwin or clubsandwich or pyromaniac or animal or vcc or inspection or moreand or banality or vegan or mandarin or sogood or cocaine or moron or hiway or nation or lunchtime or kdqcens or
         floride or floride or floride or floride or floride or floride or floride or iwocensor or vcc or drugie or vcc or pyromaniac or cocaine or kdqcens or graduated or tobe or gnd or poppyseed or vcc or liberation or incompetent or marco or marco or waster or gnd or excellent)
  begin
    {psycho,extremist,fruitcake,zealot,chainsaw,rasp,square,romex,jxnbox,knockout,curie,gutter,plaster,wood,rampacker,greenbay,raiders,giants,yankees,nyc,broadway,dirty,noyoudirty,muggers,whattime,sanity} = 
        {vcc,vcc,vcc,vcc,marco,superman,vcc,maritime,gotone,lunchtime,ready,clubsandwich,drugie,protest,zulu,kdqcens,banality,waster,gnd,fatality,gokidsgo,gnd,gotone,lunchtime,elementary,simasu} +
        {Iwin,Iwin,Iwin,Iwin,Iwin,Iwin,Iwin,Iwin,Iwin,Iwin,clubsandwich,pyromaniac,animal,vcc,inspection,moreand,banality,vegan,mandarin,sogood,cocaine,moron,hiway,nation,lunchtime,kdqcens} +
        {floride,floride,floride,floride,floride,floride,floride,iwocensor,vcc,drugie,vcc,pyromaniac,cocaine,kdqcens,graduated,tobe,gnd,poppyseed,vcc,liberation,incompetent,marco,marco,waster,gnd,excellent};
  end

// Triple add / sub bait
always @(extremist or postulator or gutter or vcc or nation or whattime or moron or sixyears or dirty or
         vegetarian or gnd or chainsaw or rasp or gnd or gnd or gnd or vcc or broadway or
         broadway or yankees or gokidsgo or gnd or elementary or giants or simasu or fruitcake or vcc)
  begin
    {michelle,rocks,legos,eatem,blanket,china,usa,holland,puertorico} = 
        {extremist,postulator,gutter,vcc,nation,whattime,moron,sixyears,dirty} -
        {vegetarian,gnd,chainsaw,rasp,gnd,gnd,gnd,vcc,broadway} -
        {broadway,yankees,gokidsgo,gnd,elementary,giants,simasu,fruitcake,vcc};
  end

// 5 bit modulus
always @(gnd or star or michelle or vcc or fruitcake or plaster or gnd or blanket or kdqcens or dirty)
  begin
    if ({plaster,gnd,blanket,kdqcens,dirty} == 0)
       {mexico,spain,greenland,scotland,england} = 0;
    else 
      {mexico,spain,greenland,scotland,england} = 
	  	  {gnd,star,michelle,vcc,fruitcake} % 
		  {plaster,gnd,blanket,kdqcens,dirty};
  end

reg feedback_pt_97;

always @(wood or feedback_pt_97)
  begin
      iceland = !wood |  feedback_pt_97;
  end

reg feedback_pt_98;

always @(gnd or feedback_pt_98)
  begin
      romulus = !gnd | !feedback_pt_98;
  end

reg feedback_pt_99;

always @(nyc or feedback_pt_99)
  begin
      remus =  nyc |  feedback_pt_99;
  end

reg feedback_pt_100;

always @(romulus or feedback_pt_100)
  begin
      cain =  romulus & !feedback_pt_100;
  end

reg feedback_pt_101;

always @(holland or feedback_pt_101)
  begin
      abel = !holland | !feedback_pt_101;
  end

reg feedback_pt_102;

always @(money or feedback_pt_102)
  begin
      zipporah = !money ^  feedback_pt_102;
  end

reg feedback_pt_103;

always @(show or feedback_pt_103)
  begin
      issac =  show | !feedback_pt_103;
  end

reg feedback_pt_104;

always @(psycho or feedback_pt_104)
  begin
      abraham = !psycho | !feedback_pt_104;
  end

reg feedback_pt_105;

always @(remus or feedback_pt_105)
  begin
      jacob =  remus | !feedback_pt_105;
  end

reg feedback_pt_106;

always @(gnd or feedback_pt_106)
  begin
      joseph =  gnd &  feedback_pt_106;
  end

reg feedback_pt_107;

always @(vcc or feedback_pt_107)
  begin
      dreamcoat = !vcc & !feedback_pt_107;
  end

reg feedback_pt_108;

always @(vcc or feedback_pt_108)
  begin
      ringlingbros = !vcc | !feedback_pt_108;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lxtcen <= 0;
    else if (greenland)
      lxtcen <= gutter;
    else if (sanity)
      lxtcen <= 0;
  end

always @(lxtcen)
  begin
      feedback_pt_97 = lxtcen;
  end

always @(lxtcen)
  begin
      feedback_pt_98 = lxtcen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      terrance <= 0;
    else if (gnd)
      terrance <= 0;
    else if (gutter)
      terrance <= vcc;
  end

always @(terrance)
  begin
      feedback_pt_99 = terrance;
  end

wire piggish_wire;

dffeas piggish_ff (
  .clk(clock0),
  .d(drugie),
  .ena(gnd),
  .sclr(moron),
  .sload(nation),
  .asdata(spain),
  .clrn(!reset0),
  .q(piggish_wire)
);

always @(piggish_wire) begin
   cryptic = piggish_wire;
end

always @(cryptic)
  begin
      feedback_pt_100 = cryptic;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crapeteria <= 0;
    else
      crapeteria <= curie;
  end

always @(crapeteria)
  begin
      feedback_pt_101 = crapeteria;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mdtcensorc <= 0;
    else if (zealot)
      mdtcensorc <= excellent;
  end

always @(mdtcensorc)
  begin
      feedback_pt_102 = mdtcensorc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nihlist <= 1;
    else
      nihlist <= pictures;
  end

always @(nihlist)
  begin
      feedback_pt_103 = nihlist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moses <= 1;
    else
      moses <= abraham;
  end

always @(moses)
  begin
      feedback_pt_104 = moses;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burning <= 1;
    else
      burning <= crapeteria;
  end

always @(burning)
  begin
      feedback_pt_105 = burning;
  end

wire nhtcenso_wire;

dffeas nhtcenso_ff (
  .clk(clock0),
  .d(gnd),
  .ena(abel),
  .sclr(dreamcoat),
  .sload(terrance),
  .asdata(iwocensor),
  .clrn(!reset0),
  .q(nhtcenso_wire)
);

always @(nhtcenso_wire) begin
   oitcen = nhtcenso_wire;
end

always @(oitcen)
  begin
      feedback_pt_106 = oitcen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      daughter <= 0;
    else if (england)
      daughter <= 0;
    else if (show)
      daughter <= yoku;
  end

always @(daughter)
  begin
      feedback_pt_107 = daughter;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wine <= 0;
    else if (gnd)
      wine <= 0;
    else if (abraham)
      wine <= moses;
  end

always @(wine)
  begin
      feedback_pt_108 = wine;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gin <= 0;
    else if (vcc)
      gin <= giants;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tonic <= 1;
    else
      tonic <= noyoudirty;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rum <= 1;
    else
      rum <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scotch <= 0;
    else
      scotch <= joseph;
  end

wire larry_wire;

dffeas larry_ff (
  .clk(clock0),
  .d(simasu),
  .ena(vcc),
  .sclr(nihlist),
  .sload(gnd),
  .asdata(animal),
  .clrn(!reset0),
  .q(larry_wire)
);

always @(larry_wire) begin
   curly = larry_wire;
end

// Random combinatorial logic block
always@(*)
  begin
      barnum = ~( ~( ( ~( wine ^ ( ( ~gnd ^ gnd ) | ( ~( ~vcc & jayqueeze ) ) ) ) ) ) );
  end

  always@(*)
  begin
    shemp = ~( ~( ~( ~( ( ~tracy | ~tracy ) ) ) ) ) ? ~( ~( ~( ( ~( ~vcc | ~vcc ) ) & ~( ~inspection ) ) ) ) : ~( ~( ~( burning ) ) );
  end
// State Mek wiggum Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wiggum <= wiggum_0;
    else
      case (wiggum)
        wiggum_0: begin
          if ({dirty,scotch,gnd,yankees} == 12)
            wiggum <= wiggum_4;
          else if ({dirty,scotch,gnd,yankees} == 0)
            wiggum <= wiggum_1;
          else if ({dirty,scotch,gnd,yankees} == 15)
            wiggum <= wiggum_5;
          else
            wiggum <= wiggum_0;
          end
        wiggum_1: begin
          if ({dirty,scotch,gnd,yankees} == 13)
            wiggum <= wiggum_7;
          else if ({dirty,scotch,gnd,yankees} == 9)
            wiggum <= wiggum_1;
          else if ({dirty,scotch,gnd,yankees} == 2)
            wiggum <= wiggum_4;
          else if ({dirty,scotch,gnd,yankees} == 5)
            wiggum <= wiggum_0;
          else
            wiggum <= wiggum_1;
          end
        wiggum_2: begin
            wiggum <= wiggum_2;
          end
        wiggum_3: begin
          if ({dirty,scotch,gnd,yankees} == 11)
            wiggum <= wiggum_4;
          else if ({dirty,scotch,gnd,yankees} == 10)
            wiggum <= wiggum_1;
          else if ({dirty,scotch,gnd,yankees} == 0)
            wiggum <= wiggum_1;
          else if ({dirty,scotch,gnd,yankees} == 4)
            wiggum <= wiggum_1;
          else
            wiggum <= wiggum_3;
          end
        wiggum_4: begin
          if ({dirty,scotch,gnd,yankees} == 6)
            wiggum <= wiggum_0;
          else
            wiggum <= wiggum_4;
          end
        wiggum_5: begin
          if ({dirty,scotch,gnd,yankees} == 6)
            wiggum <= wiggum_6;
          else if ({dirty,scotch,gnd,yankees} == 1)
            wiggum <= wiggum_3;
          else
            wiggum <= wiggum_5;
          end
        wiggum_6: begin
          if ({dirty,scotch,gnd,yankees} == 5)
            wiggum <= wiggum_3;
          else if ({dirty,scotch,gnd,yankees} == 15)
            wiggum <= wiggum_4;
          else if ({dirty,scotch,gnd,yankees} == 3)
            wiggum <= wiggum_6;
          else if ({dirty,scotch,gnd,yankees} == 11)
            wiggum <= wiggum_2;
          else if ({dirty,scotch,gnd,yankees} == 12)
            wiggum <= wiggum_3;
          else if ({dirty,scotch,gnd,yankees} == 1)
            wiggum <= wiggum_3;
          else if ({dirty,scotch,gnd,yankees} == 8)
            wiggum <= wiggum_5;
          else
            wiggum <= wiggum_6;
          end
        wiggum_7: begin
            wiggum <= wiggum_7;
          end
        default: wiggum <= wiggum_0;
      endcase
  end

// State Mek wiggum Output logic
always @(wiggum)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (wiggum)
        wiggum_0: begin
            bart = 0;
            lisa = 0;
            marge = 0;
            homerun = 0;
            barney = 1;
            skinner = 1;
            krabapple = 1;
            tarzan = 1;
          end
        wiggum_1: begin
            bart = 0;
            lisa = 1;
            marge = 0;
            homerun = 0;
            barney = 0;
            skinner = 0;
            krabapple = 0;
            tarzan = 0;
          end
        wiggum_2: begin
            bart = 0;
            lisa = 0;
            marge = 1;
            homerun = 0;
            barney = 0;
            skinner = 0;
            krabapple = 0;
            tarzan = 0;
          end
        wiggum_3: begin
            bart = 1;
            lisa = 1;
            marge = 0;
            homerun = 0;
            barney = 0;
            skinner = 1;
            krabapple = 1;
            tarzan = 1;
          end
        wiggum_4: begin
            bart = 0;
            lisa = 0;
            marge = 1;
            homerun = 0;
            barney = 1;
            skinner = 1;
            krabapple = 0;
            tarzan = 0;
          end
        wiggum_5: begin
            bart = 0;
            lisa = 0;
            marge = 0;
            homerun = 0;
            barney = 0;
            skinner = 1;
            krabapple = 0;
            tarzan = 0;
          end
        wiggum_6: begin
            bart = 0;
            lisa = 0;
            marge = 0;
            homerun = 0;
            barney = 0;
            skinner = 0;
            krabapple = 1;
            tarzan = 0;
          end
        wiggum_7: begin
            bart = 1;
            lisa = 1;
            marge = 1;
            homerun = 0;
            barney = 0;
            skinner = 1;
            krabapple = 0;
            tarzan = 0;
          end
        default: begin
            bart = 0;
            lisa = 1;
            marge = 0;
            homerun = 0;
            barney = 1;
            skinner = 1;
            krabapple = 1;
            tarzan = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire smithers_out;
nut_000_lut #(4) nut_000_lut_inst_smithers (
  .din({marge,iceland,gnd,jacob}),
  .mask(16'b0000001000000001),
  .out(smithers_out)
);

always @(smithers_out)
begin
   moe = smithers_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire worstdesignever_out;
nut_000_lut #(1) nut_000_lut_inst_worstdesignever (
  .din({psycho}),
  .mask(2'b00),
  .out(worstdesignever_out)
);

always @(worstdesignever_out)
begin
   comicbook = worstdesignever_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire heidi_out;
nut_000_lut #(3) nut_000_lut_inst_heidi (
  .din({krabapple,simasu,rum}),
  .mask(8'h3d),
  .out(heidi_out)
);

always @(heidi_out)
begin
   flanders = heidi_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire milhouse_out;
nut_000_lut #(1) nut_000_lut_inst_milhouse (
  .din({gnd}),
  .mask(2'b01),
  .out(milhouse_out)
);

always @(milhouse_out)
begin
   steaming = milhouse_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire todd_out;
nut_000_lut #(4) nut_000_lut_inst_todd (
  .din({noyoudirty,rocks,vcc,knockout}),
  .mask(16'b0100100001000010),
  .out(todd_out)
);

always @(todd_out)
begin
   rod = todd_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire timmy_out;
nut_000_lut #(6) nut_000_lut_inst_timmy (
  .din({cocaine,moreand,money,vcc,zipporah,comicbook}),
  .mask(64'b0110010101101100001001010010100000001001100000010011101000011001),
  .out(timmy_out)
);

always @(timmy_out)
begin
   chewbacca = timmy_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire slobbering_out;
nut_000_lut #(6) nut_000_lut_inst_slobbering (
  .din({rod,bart,joseph,joseph,romex,geisha}),
  .mask(64'b0000111000010100001001110110001010100010000011000001100000000100),
  .out(slobbering_out)
);

always @(slobbering_out)
begin
   tukatuk = slobbering_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire psucensorc_out;
nut_000_lut #(3) nut_000_lut_inst_psucensorc (
  .din({comicbook,rampacker,puertorico}),
  .mask(8'h99),
  .out(psucensorc_out)
);

always @(psucensorc_out)
begin
   weevil = psucensorc_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire eeevil_out;
nut_000_lut #(5) nut_000_lut_inst_eeevil (
  .din({vcc,weevil,curly,gnd,krabapple}),
  .mask(32'b01010010001000101000001101000100),
  .out(eeevil_out)
);

always @(eeevil_out)
begin
   deuce = eeevil_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire bert_out;
nut_000_lut #(6) nut_000_lut_inst_bert (
  .din({skinner,issac,gnd,abraham,chewbacca,vcc}),
  .mask(64'h4907d896b3cfe12d),
  .out(bert_out)
);

always @(bert_out)
begin
   intuit = bert_out;
end

// 5 bit modulus
always @(china or cryptic or yankees or shemp or krabapple or grams or lxtcen or muggers or vcc or oitcen)
  begin
    if ({grams,lxtcen,muggers,vcc,oitcen} == 0)
       {ernie,life,snuffleupagus,peta,happyists} = 0;
    else 
      {ernie,life,snuffleupagus,peta,happyists} = 
	  	  {china,cryptic,yankees,shemp,krabapple} % 
		  {grams,lxtcen,muggers,vcc,oitcen};
  end


initial begin
    {atomic,firemonkey} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({vcc,greenbay} < {iwocensor,lisa})
       {atomic,firemonkey} <= {iwocensor,lisa};
    else
       {atomic,firemonkey} <= {vcc,greenbay};
  end

// Start of 8 bit LFSR qfvcensorce...
always @(posedge reset0 or posedge clock0)
  begin
    if (reset0)
      qfvcensorce_reg <= 8'b00000000;
    else
      qfvcensorce_reg <= qfvcensorce_next;
  end

always @(qfvcensorce_reg or michelle or qfvcensorce_b0 or qfvcensorce_fbk)
  begin
    qfvcensorce_b0 = ~| qfvcensorce_reg[6:0];
    qfvcensorce_fbk = qfvcensorce_reg[7] ^ qfvcensorce_b0 ^ michelle;
    for (qfvcensorce_n=7; qfvcensorce_n>=1; qfvcensorce_n=qfvcensorce_n-1)
      if (qfvcensorce_taps[qfvcensorce_n-1] == 1)
        qfvcensorce_next[qfvcensorce_n]=qfvcensorce_reg[qfvcensorce_n-1] ^ qfvcensorce_fbk;
      else
        qfvcensorce_next[qfvcensorce_n]=qfvcensorce_reg[qfvcensorce_n-1];
    qfvcensorce_next[0]=qfvcensorce_fbk;
    {captain,rhvcens,roid,itchy,squad,joey,ramone,stoned} = qfvcensorce_reg ^ 146;
  end

// AND all of these bits together
always @(peta or daughter or homerun or hiway)
  begin
      often = & {peta,daughter,homerun,hiway};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      south <= 0;
    else
    case ({life,hours})
       0 : south <= tukatuk;
       1 : south <= south;
       2 : south <= south;
       3 : south <= itchy;
       default : south <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      edible <= 0;
    else
    case ({legos,lxtcen})
       0 : edible <= edible;
       1 : edible <= edible;
       2 : edible <= edible;
       3 : edible <= vcc;
       default : edible <= 0;
    endcase
  end

reg feedback_pt_109;

always @(edible or feedback_pt_109)
  begin
      srvcensorce =  edible ^ !feedback_pt_109;
  end

reg feedback_pt_110;

always @(vcc or feedback_pt_110)
  begin
      on_sale = !vcc | !feedback_pt_110;
  end

reg feedback_pt_111;

always @(tonic or feedback_pt_111)
  begin
      aisle_two =  tonic ^  feedback_pt_111;
  end

reg feedback_pt_112;

always @(cain or feedback_pt_112)
  begin
      dinoblaster =  cain ^  feedback_pt_112;
  end

reg feedback_pt_113;

always @(gin or feedback_pt_113)
  begin
      crunchyfrog = !gin |  feedback_pt_113;
  end

reg feedback_pt_114;

always @(moreand or feedback_pt_114)
  begin
      nobody = !moreand &  feedback_pt_114;
  end

reg feedback_pt_115;

always @(gnd or feedback_pt_115)
  begin
      expects_the = !gnd ^  feedback_pt_115;
  end

reg feedback_pt_116;

always @(vcc or feedback_pt_116)
  begin
      spanish =  vcc & !feedback_pt_116;
  end

wire inquisition_wire;

dffeas inquisition_ff (
  .clk(clock0),
  .d(geisha),
  .ena(stoned),
  .sclr(show),
  .sload(on_sale),
  .asdata(jxnbox),
  .clrn(!reset0),
  .q(inquisition_wire)
);

always @(inquisition_wire) begin
   chief = inquisition_wire;
end

always @(chief)
  begin
      feedback_pt_109 = chief;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weapons <= 0;
    else if (krabapple)
      weapons <= spanish;
    else if (spain)
      weapons <= 0;
  end

always @(weapons)
  begin
      feedback_pt_110 = weapons;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fear <= 1;
    else
      fear <= eatem;
  end

always @(fear)
  begin
      feedback_pt_111 = fear;
  end

wire surprise_wire;

dffea surprise_ff (
  .clk(clock0),
  .d(plaster),
  .ena(scotland),
  .adata(grams),
  .clrn(!reset0),
  .q(surprise_wire)
);

always @(surprise_wire) begin
   efficiency = surprise_wire;
end

always @(efficiency)
  begin
      feedback_pt_112 = efficiency;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fanatical <= 0;
    else
      fanatical <= south;
  end

always @(fanatical)
  begin
      feedback_pt_113 = fanatical;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      devotion <= 0;
    else if (moreand)
      devotion <= 0;
    else if (often)
      devotion <= snuffleupagus;
  end

always @(devotion)
  begin
      feedback_pt_114 = devotion;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      the_pope <= 0;
    else if (ramone)
      the_pope <= 0;
    else if (captain)
      the_pope <= abraham;
  end

always @(the_pope)
  begin
      feedback_pt_115 = the_pope;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yummy <= 0;
    else if (joey)
      yummy <= weapons;
    else if (krabapple)
      yummy <= 0;
  end

always @(yummy)
  begin
      feedback_pt_116 = yummy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      love_in <= 0;
    else
      love_in <= deuce;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      my_tummy <= 0;
    else if (yummy)
      my_tummy <= the_pope;
    else if (vcc)
      my_tummy <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      po <= 0;
    else if (weapons)
      po <= on_sale;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lala <= 1;
    else
      lala <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dipsy <= 0;
    else if (romulus)
      dipsy <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      touch <= 0;
    else if (barney)
      touch <= 0;
    else if (crunchyfrog)
      touch <= barnum;
  end

reg feedback_pt_117;

always @(vcc or feedback_pt_117)
  begin
      kissthesky = !vcc &  feedback_pt_117;
  end

reg feedback_pt_118;

always @(barney or feedback_pt_118)
  begin
      peopleeater = !barney ^ !feedback_pt_118;
  end

reg feedback_pt_119;

always @(my_tummy or feedback_pt_119)
  begin
      haze = !my_tummy &  feedback_pt_119;
  end

reg feedback_pt_120;

always @(weapons or feedback_pt_120)
  begin
      timingmodel = !weapons | !feedback_pt_120;
  end

reg feedback_pt_121;

always @(efficiency or feedback_pt_121)
  begin
      plumber = !efficiency ^ !feedback_pt_121;
  end

reg feedback_pt_122;

always @(fruitcake or feedback_pt_122)
  begin
      odin = !fruitcake ^ !feedback_pt_122;
  end

reg feedback_pt_123;

always @(gnd or feedback_pt_123)
  begin
      thor = !gnd | !feedback_pt_123;
  end

reg feedback_pt_124;

always @(vcc or feedback_pt_124)
  begin
      jupiter =  vcc ^  feedback_pt_124;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zeus <= 0;
    else
      zeus <= ringlingbros;
  end

always @(zeus)
  begin
      feedback_pt_117 = zeus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      athena <= 0;
    else if (gnd)
      athena <= 0;
    else if (vcc)
      athena <= rum;
  end

always @(athena)
  begin
      feedback_pt_118 = athena;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      minerva <= 1;
    else
      minerva <= vcc;
  end

always @(minerva)
  begin
      feedback_pt_119 = minerva;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mars <= 1;
    else
      mars <= square;
  end

always @(mars)
  begin
      feedback_pt_120 = mars;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      venus <= 1;
    else
      venus <= vcc;
  end

always @(venus)
  begin
      feedback_pt_121 = venus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pluto <= 0;
    else if (vcc)
      pluto <= 0;
    else if (animal)
      pluto <= simasu;
  end

always @(pluto)
  begin
      feedback_pt_122 = pluto;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      neptune <= 1;
    else
      neptune <= square;
  end

always @(neptune)
  begin
      feedback_pt_123 = neptune;
  end

wire ariel_wire;

dffeas ariel_ff (
  .clk(clock0),
  .d(vcc),
  .ena(vcc),
  .sclr(deuce),
  .sload(lala),
  .asdata(scotland),
  .clrn(!reset0),
  .q(ariel_wire)
);

always @(ariel_wire) begin
   sebastian = ariel_wire;
end

always @(sebastian)
  begin
      feedback_pt_124 = sebastian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bach <= 1;
    else
      bach <= dipsy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mozart <= 1;
    else
      mozart <= psycho;
  end

// Random combinatorial logic block
always@(*)
  begin
      goodmonkey = ~( ~( ( ( vcc ^ usa ) | ( ~( athena ^ ~fear ) ) ) ) ) & ~( ~( ~( vcc ) & ( ~vcc | south ) ) );
  end

  always@(*)
  begin
    badmonkey = ~( ~( ~( ( ~( ~crunchyfrog ) ^ ~( nobody ) ) ) ) ) ? ( ( ~( ~( ~( ~gnd ) ) ) ^ ( ~( ~( ~( ~haze ) ) | ~( ~moe ) | ~moe ) ) ) | ~( ( ( ~( ~( ~mars ) | ~( gnd ) ) ) ^ ~( ~( ~gnd ) ) ) ) ) : ~( ~( ~( south ) ) );
  end
// State Mek guy Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      guy <= guy_0;
    else
      case (guy)
        guy_0: begin
          if ({raiders,happyists,gnd,neptune} == 8)
            guy <= guy_2;
          else if ({raiders,happyists,gnd,neptune} == 1)
            guy <= guy_1;
          else if ({raiders,happyists,gnd,neptune} == 14)
            guy <= guy_4;
          else
            guy <= guy_0;
          end
        guy_1: begin
            guy <= guy_1;
          end
        guy_2: begin
          if ({raiders,happyists,gnd,neptune} == 14)
            guy <= guy_4;
          else if ({raiders,happyists,gnd,neptune} == 15)
            guy <= guy_0;
          else if ({raiders,happyists,gnd,neptune} == 12)
            guy <= guy_1;
          else if ({raiders,happyists,gnd,neptune} == 5)
            guy <= guy_3;
          else
            guy <= guy_2;
          end
        guy_3: begin
          if ({raiders,happyists,gnd,neptune} == 9)
            guy <= guy_1;
          else if ({raiders,happyists,gnd,neptune} == 8)
            guy <= guy_2;
          else if ({raiders,happyists,gnd,neptune} == 7)
            guy <= guy_3;
          else
            guy <= guy_3;
          end
        guy_4: begin
          if ({raiders,happyists,gnd,neptune} == 9)
            guy <= guy_3;
          else if ({raiders,happyists,gnd,neptune} == 7)
            guy <= guy_4;
          else if ({raiders,happyists,gnd,neptune} == 8)
            guy <= guy_3;
          else
            guy <= guy_4;
          end
        default: guy <= guy_0;
      endcase
  end

// State Mek guy Output logic
always @(guy)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (guy)
        guy_0: begin
            partners = 0;
            cubish = 0;
            solder = 0;
            valve = 0;
            furnace = 0;
            pilot = 0;
            leaky = 0;
          end
        guy_1: begin
            partners = 1;
            cubish = 0;
            solder = 0;
            valve = 0;
            furnace = 0;
            pilot = 1;
            leaky = 0;
          end
        guy_2: begin
            partners = 0;
            cubish = 0;
            solder = 1;
            valve = 0;
            furnace = 0;
            pilot = 1;
            leaky = 1;
          end
        guy_3: begin
            partners = 0;
            cubish = 0;
            solder = 0;
            valve = 1;
            furnace = 0;
            pilot = 0;
            leaky = 1;
          end
        guy_4: begin
            partners = 0;
            cubish = 0;
            solder = 0;
            valve = 0;
            furnace = 1;
            pilot = 1;
            leaky = 1;
          end
        default: begin
            partners = 0;
            cubish = 1;
            solder = 1;
            valve = 1;
            furnace = 1;
            pilot = 0;
            leaky = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire drax_out;
nut_000_lut #(6) nut_000_lut_inst_drax (
  .din({gnd,gnd,cubish,greenbay,vcc,minerva}),
  .mask(64'b0010011010000000001110000010010000001100010001000000011010010011),
  .out(drax_out)
);

always @(drax_out)
begin
   potter = drax_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire killme_out;
nut_000_lut #(4) nut_000_lut_inst_killme (
  .din({odin,intuit,moses,bart}),
  .mask(16'b0000000101101001),
  .out(killme_out)
);

always @(killme_out)
begin
   moonraker = killme_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire sortout_out;
nut_000_lut #(3) nut_000_lut_inst_sortout (
  .din({flanders,vcc,potter}),
  .mask(8'hef),
  .out(sortout_out)
);

always @(sortout_out)
begin
   tyycensor = sortout_out;
end

// Greater Equal Less compare
always @(gnd or gnd or timingmodel or rhvcens or leaky or vcc)
  begin
    if ({gnd,gnd,timingmodel} > {rhvcens,leaky,vcc})
       {sgates,atoms,thankee} = 3'b100;
    else if ({gnd,gnd,timingmodel} < {rhvcens,leaky,vcc})
       {sgates,atoms,thankee} = 3'b010;
    else
       {sgates,atoms,thankee} = 3'b001;
  end


initial begin
    {wakey,ants,dig,ladder,wrecker,dumptruck} = 0;
end

// Registered 6 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (vcc)
      {wakey,ants,dig,ladder,wrecker,dumptruck} <= 0;
    else if (romulus)
      {wakey,ants,dig,ladder,wrecker,dumptruck} <=
		  {vcc,tyycensor,valve,tyycensor,bach,zeus};
    else
      {wakey,ants,dig,ladder,wrecker,dumptruck} <=
		 {pluto,moses,gnd,gnd,atomic,tyycensor} + 
		 {crunchyfrog,plumber,fruitcake,gnd,badmonkey,steaming};
  end

// XNOR all of these bits together
always @(animal or gnd or gnd or badmonkey or dig or plaster or touch)
  begin
      dumbarton = ~^ {animal,gnd,gnd,badmonkey,dig,plaster,touch};
  end

// 7 input 7 output permutation
always @(vcc or sebastian or crapeteria or animal or deuce or gnd or plaster)
  begin
    case ({vcc,sebastian,crapeteria,animal,deuce,gnd,plaster})
      0: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=40;
      1: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=122;
      2: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=65;
      3: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=97;
      4: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=6;
      5: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=62;
      6: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=125;
      7: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=108;
      8: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=18;
      9: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=60;
      10: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=39;
      11: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=5;
      12: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=9;
      13: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=77;
      14: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=126;
      15: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=124;
      16: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=63;
      17: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=119;
      18: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=44;
      19: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=123;
      20: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=81;
      21: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=90;
      22: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=102;
      23: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=61;
      24: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=57;
      25: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=32;
      26: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=85;
      27: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=110;
      28: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=87;
      29: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=78;
      30: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=31;
      31: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=114;
      32: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=30;
      33: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=8;
      34: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=94;
      35: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=23;
      36: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=49;
      37: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=113;
      38: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=48;
      39: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=116;
      40: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=52;
      41: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=67;
      42: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=70;
      43: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=45;
      44: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=11;
      45: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=127;
      46: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=17;
      47: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=104;
      48: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=105;
      49: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=16;
      50: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=115;
      51: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=58;
      52: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=86;
      53: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=83;
      54: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=12;
      55: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=107;
      56: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=72;
      57: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=99;
      58: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=34;
      59: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=96;
      60: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=41;
      61: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=36;
      62: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=33;
      63: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=68;
      64: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=71;
      65: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=20;
      66: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=120;
      67: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=4;
      68: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=25;
      69: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=82;
      70: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=37;
      71: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=84;
      72: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=19;
      73: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=118;
      74: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=103;
      75: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=22;
      76: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=54;
      77: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=89;
      78: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=55;
      79: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=38;
      80: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=26;
      81: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=121;
      82: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=117;
      83: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=111;
      84: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=21;
      85: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=51;
      86: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=7;
      87: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=2;
      88: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=91;
      89: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=98;
      90: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=56;
      91: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=101;
      92: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=73;
      93: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=109;
      94: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=1;
      95: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=28;
      96: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=53;
      97: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=88;
      98: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=43;
      99: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=100;
      100: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=95;
      101: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=59;
      102: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=106;
      103: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=64;
      104: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=24;
      105: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=42;
      106: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=27;
      107: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=3;
      108: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=50;
      109: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=76;
      110: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=0;
      111: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=92;
      112: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=15;
      113: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=14;
      114: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=74;
      115: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=80;
      116: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=47;
      117: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=75;
      118: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=79;
      119: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=69;
      120: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=13;
      121: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=46;
      122: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=93;
      123: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=66;
      124: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=112;
      125: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=35;
      126: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=10;
      127: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=29;
      default: {golden,egg,tofu,rodent,billnted,whiteboard,synthesis}=0;
    endcase
  end

// XOR all of these bits together
always @(crapeteria or vcc or vcc or mdtcensorc or odin or raiders or dinoblaster or crapeteria or gnd or gnd)
  begin
      fitter = ^ {crapeteria,vcc,vcc,mdtcensorc,odin,raiders,dinoblaster,crapeteria,gnd,gnd};
  end

reg feedback_pt_125;

always @(nobody or feedback_pt_125)
  begin
      dingbat =  nobody &  feedback_pt_125;
  end

reg feedback_pt_126;

always @(vcc or feedback_pt_126)
  begin
      sweetie = !vcc ^  feedback_pt_126;
  end

reg feedback_pt_127;

always @(vcc or feedback_pt_127)
  begin
      wiggles =  vcc &  feedback_pt_127;
  end

reg feedback_pt_128;

always @(ladder or feedback_pt_128)
  begin
      wanton = !ladder ^  feedback_pt_128;
  end

reg feedback_pt_129;

always @(wiggles or feedback_pt_129)
  begin
      rewire = !wiggles ^ !feedback_pt_129;
  end

reg feedback_pt_130;

always @(goodmonkey or feedback_pt_130)
  begin
      thread = !goodmonkey | !feedback_pt_130;
  end

reg feedback_pt_131;

always @(gnd or feedback_pt_131)
  begin
      suffering =  gnd ^  feedback_pt_131;
  end

reg feedback_pt_132;

always @(srvcensorce or feedback_pt_132)
  begin
      art =  srvcensorce ^  feedback_pt_132;
  end

reg feedback_pt_133;

always @(solder or feedback_pt_133)
  begin
      vegas = !solder |  feedback_pt_133;
  end

reg feedback_pt_134;

always @(gnd or feedback_pt_134)
  begin
      tamago = !gnd &  feedback_pt_134;
  end

reg feedback_pt_135;

always @(furnace or feedback_pt_135)
  begin
      tuna = !furnace ^ !feedback_pt_135;
  end

reg feedback_pt_136;

always @(dingbat or feedback_pt_136)
  begin
      salmon = !dingbat ^  feedback_pt_136;
  end

reg feedback_pt_137;

always @(squad or feedback_pt_137)
  begin
      sake =  squad | !feedback_pt_137;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ritsu <= 0;
    else if (ants)
      ritsu <= 0;
    else if (tamago)
      ritsu <= rodent;
  end

always @(ritsu)
  begin
      feedback_pt_125 = ritsu;
  end

always @(ritsu)
  begin
      feedback_pt_126 = ritsu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ebi <= 0;
    else if (bart)
      ebi <= 0;
    else if (wrecker)
      ebi <= expects_the;
  end

always @(ebi)
  begin
      feedback_pt_127 = ebi;
  end

always @(ebi)
  begin
      feedback_pt_128 = ebi;
  end

always @(ebi)
  begin
      feedback_pt_129 = ebi;
  end

always @(ebi)
  begin
      feedback_pt_130 = ebi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shrimp <= 1;
    else
      shrimp <= wiggles;
  end

always @(shrimp)
  begin
      feedback_pt_131 = shrimp;
  end

wire rainbow_wire;

dffeas rainbow_ff (
  .clk(clock0),
  .d(vcc),
  .ena(vcc),
  .sclr(synthesis),
  .sload(squad),
  .asdata(gnd),
  .clrn(!reset0),
  .q(rainbow_wire)
);

always @(rainbow_wire) begin
   tako = rainbow_wire;
end

always @(tako)
  begin
      feedback_pt_132 = tako;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      octapus <= 0;
    else if (billnted)
      octapus <= 0;
    else if (dumbarton)
      octapus <= rewire;
  end

always @(octapus)
  begin
      feedback_pt_133 = octapus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hamachi <= 0;
    else
      hamachi <= zeus;
  end

always @(hamachi)
  begin
      feedback_pt_134 = hamachi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yellowtail <= 0;
    else if (vegas)
      yellowtail <= vcc;
    else if (partners)
      yellowtail <= 0;
  end

always @(yellowtail)
  begin
      feedback_pt_135 = yellowtail;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kana <= 1;
    else
      kana <= salmon;
  end

always @(kana)
  begin
      feedback_pt_136 = kana;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crab <= 0;
    else if (po)
      crab <= thread;
  end

always @(crab)
  begin
      feedback_pt_137 = crab;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nigiri <= 0;
    else if (ebi)
      nigiri <= gnd;
    else if (yellowtail)
      nigiri <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      handroll <= 0;
    else if (gnd)
      handroll <= 0;
    else if (roid)
      handroll <= homerun;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      maki <= 0;
    else if (mars)
      maki <= 0;
    else if (crab)
      maki <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      roe <= 0;
    else if (gnd)
      roe <= 0;
    else if (gnd)
      roe <= vcc;
  end

wire tobiko_wire;

dffea tobiko_ff (
  .clk(clock0),
  .d(gnd),
  .ena(venus),
  .adata(firemonkey),
  .clrn(!reset0),
  .q(tobiko_wire)
);

always @(tobiko_wire) begin
   kappa = tobiko_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cucumber <= 0;
    else
      cucumber <= tuna;
  end

// 2s comp negate A
always @(gnd or vcc or pilot or kappa or sake or thread or kissthesky or roid or tako or gnd)
  begin
    {california,ebay,covad,exodus,abovenet,webvan,sears,lucent,ibm} = - {gnd,vcc,pilot,kappa,sake,thread,kissthesky,roid,tako,gnd};
  end

// Ternary sign extend bait
always @(dumptruck or dumptruck or dumptruck or dumptruck or gnd or aisle_two or kissthesky or lala or tarzan or ebay or vcc or wakey or fanatical or maki or shrimp or art or vcc or cucumber or gnd or crapeteria or vcc or atoms or expects_the or crapeteria or gnd or gnd or peopleeater or
         fanatical or fanatical or fanatical or fanatical or fanatical or fanatical or vcc or ritsu or tako or gnd or gnd or vcc or gnd or lucent or sears or neptune or partners or vcc or covad or gnd or neptune or vcc or abovenet or jupiter or athena or golden or vcc or
         dumbarton or dumbarton or dumbarton or dumbarton or dumbarton or dumbarton or vcc or kana or gnd or gnd or exodus or exodus or california or kissthesky or gnd or sweetie or whiteboard or sebastian or pluto or abovenet or gnd or gnd or devotion or vcc or po or vcc or thor)
  begin
    {intel,hp,gm,ford,chevys,chillis,macdonalds,lockheed,martin,marvin,martian,molokai,amex,nasdaq,dow,taoist,liberace,microsoft,sun,oracle,bfi,century,harrydavid,safeway,pepsi,pacbell,att} = 
        {dumptruck,dumptruck,dumptruck,dumptruck,gnd,aisle_two,kissthesky,lala,tarzan,ebay,vcc,wakey,fanatical,maki,shrimp,art,vcc,cucumber,gnd,crapeteria,vcc,atoms,expects_the,crapeteria,gnd,gnd,peopleeater} +
        {fanatical,fanatical,fanatical,fanatical,fanatical,fanatical,vcc,ritsu,tako,gnd,gnd,vcc,gnd,lucent,sears,neptune,partners,vcc,covad,gnd,neptune,vcc,abovenet,jupiter,athena,golden,vcc} -
        {dumbarton,dumbarton,dumbarton,dumbarton,dumbarton,dumbarton,vcc,kana,gnd,gnd,exodus,exodus,california,kissthesky,gnd,sweetie,whiteboard,sebastian,pluto,abovenet,gnd,gnd,devotion,vcc,po,vcc,thor};
  end

// Ternary sign extend bait
always @(hamachi or hamachi or hamachi or hamachi or hamachi or hamachi or hamachi or covad or lucent or intel or neptune or abovenet or gnd or vcc or lockheed or gnd or
         ritsu or ritsu or ritsu or ritsu or ritsu or ritsu or egg or thankee or thor or sun or amex or pepsi or gnd or crapeteria or vcc or ford or
         gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or moreand or dingbat or nigiri or romex or vcc)
  begin
    {tsmc,bathbody,papyrus,macys,sharperimg,mitsubishi,honda,pimpernel,kbtoys,toysrus,gap,bananarep,oldnavy,clothing,starbucks,coffee} = 
        {hamachi,hamachi,hamachi,hamachi,hamachi,hamachi,hamachi,covad,lucent,intel,neptune,abovenet,gnd,vcc,lockheed,gnd} +
        {ritsu,ritsu,ritsu,ritsu,ritsu,ritsu,egg,thankee,thor,sun,amex,pepsi,gnd,crapeteria,vcc,ford} +
        {gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,moreand,dingbat,nigiri,romex,vcc};
  end

// 4 to 4 bit A*Const mult
reg signed [3:0] structure;
always @(pimpernel or vcc or vcc or vcc) begin
  structure = {pimpernel,vcc,vcc,vcc};
end

always @(structure)
  begin
      {jcrew,whatelse,blessyou,kerchoozle} = 
	  	  structure * 
		  80;
  end

reg feedback_pt_138;

always @(pacbell or feedback_pt_138)
  begin
      atchoo = !pacbell &  feedback_pt_138;
  end

reg feedback_pt_139;

always @(sharperimg or feedback_pt_139)
  begin
      siamese =  sharperimg ^ !feedback_pt_139;
  end

reg feedback_pt_140;

always @(sgates or feedback_pt_140)
  begin
      tabby =  sgates & !feedback_pt_140;
  end

reg feedback_pt_141;

always @(art or feedback_pt_141)
  begin
      notsure =  art | !feedback_pt_141;
  end

reg feedback_pt_142;

always @(art or feedback_pt_142)
  begin
      monster =  art & !feedback_pt_142;
  end

reg feedback_pt_143;

always @(ford or feedback_pt_143)
  begin
      incagardens = !ford & !feedback_pt_143;
  end

reg feedback_pt_144;

always @(jcrew or feedback_pt_144)
  begin
      genji = !jcrew ^ !feedback_pt_144;
  end

reg feedback_pt_145;

always @(oracle or feedback_pt_145)
  begin
      lafondue =  oracle | !feedback_pt_145;
  end

reg feedback_pt_146;

always @(webvan or feedback_pt_146)
  begin
      subway = !webvan |  feedback_pt_146;
  end

reg feedback_pt_147;

always @(mozart or feedback_pt_147)
  begin
      pasta =  mozart ^ !feedback_pt_147;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pomodoro <= 0;
    else if (blessyou)
      pomodoro <= suffering;
    else if (clothing)
      pomodoro <= 0;
  end

always @(pomodoro)
  begin
      feedback_pt_138 = pomodoro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      puttanesca <= 0;
    else if (hp)
      puttanesca <= vcc;
    else if (microsoft)
      puttanesca <= 0;
  end

always @(puttanesca)
  begin
      feedback_pt_139 = puttanesca;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      golfland <= 1;
    else
      golfland <= pimpernel;
  end

always @(golfland)
  begin
      feedback_pt_140 = golfland;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      arcade <= 1;
    else
      arcade <= gnd;
  end

always @(arcade)
  begin
      feedback_pt_141 = arcade;
  end

wire jacuzzi_wire;

dffeas jacuzzi_ff (
  .clk(clock0),
  .d(ibm),
  .ena(vcc),
  .sclr(puttanesca),
  .sload(clothing),
  .asdata(tsmc),
  .clrn(!reset0),
  .q(jacuzzi_wire)
);

always @(jacuzzi_wire) begin
   blaster = jacuzzi_wire;
end

always @(blaster)
  begin
      feedback_pt_142 = blaster;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bonker <= 0;
    else if (steaming)
      bonker <= genji;
    else if (genji)
      bonker <= 0;
  end

always @(bonker)
  begin
      feedback_pt_143 = bonker;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beemer <= 0;
    else
      beemer <= starbucks;
  end

always @(beemer)
  begin
      feedback_pt_144 = beemer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bono <= 0;
    else if (vcc)
      bono <= gnd;
  end

always @(bono)
  begin
      feedback_pt_145 = bono;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      concorde <= 0;
    else if (vcc)
      concorde <= puttanesca;
  end

always @(concorde)
  begin
      feedback_pt_146 = concorde;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stemcell <= 0;
    else
      stemcell <= gnd;
  end

always @(stemcell)
  begin
      feedback_pt_147 = stemcell;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shark <= 0;
    else if (mozart)
      shark <= 0;
    else if (vcc)
      shark <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      carolina <= 0;
    else
      carolina <= thankee;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      avon <= 0;
    else if (molokai)
      avon <= taoist;
    else if (carolina)
      avon <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bomb <= 0;
    else if (vcc)
      bomb <= 0;
    else if (chillis)
      bomb <= kbtoys;
  end

wire school_wire;

dffea school_ff (
  .clk(clock0),
  .d(tako),
  .ena(dingbat),
  .adata(concorde),
  .clrn(!reset0),
  .q(school_wire)
);

always @(school_wire) begin
   cornell = school_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      soccer <= 0;
    else if (gm)
      soccer <= art;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      softball <= 0;
    else if (toysrus)
      softball <= 0;
    else if (exodus)
      softball <= love_in;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fieldhockey <= 1;
    else
      fieldhockey <= beemer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nirish <= 0;
    else if (papyrus)
      nirish <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peace <= 0;
    else if (century)
      peace <= cornell;
    else if (chevys)
      peace <= 0;
  end

wire mideast_wire;

dffea mideast_ff (
  .clk(clock0),
  .d(martian),
  .ena(macdonalds),
  .adata(chevys),
  .clrn(!reset0),
  .q(mideast_wire)
);

always @(mideast_wire) begin
   illegal = mideast_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drugs <= 0;
    else
      drugs <= gnd;
  end

// Random combinatorial logic block
always@(*)
  begin
      infesting = ~( ( ~( ~( ( ( ~( ~liberace & ~drugs ) ) | ~( octapus ) ) ) ^ ~( ~( hours ) ) & ( ~( ~kerchoozle ) | ~( ~taoist ) ) ) ) );
  end

  always@(*)
  begin
    children = ~( ~( ~( ( ~( ~coffee ) & ~( bananarep ) ) ) ) ) ? ( ~( ( ~( ( ~( ~atchoo | ~( ~gap ) ) ) & ~( vcc & ~bono ) ) ) ) & ~( ~( ( ~( ~( ~marge ) & ~( ~vcc ) ) ) ) ) ) : ~( ( ( ~( ( ~( vcc & vcc ) ) ^ ( ~( ~gnd & ~subway ) ) ) ) & ( ( ~( ~wakey | att ) ) & ( ~( illegal | ~siamese ) ) ) ) ) ^ ( ~( ~( ~( ~liberace ) ) ) | ( genji | ~fieldhockey ) | ~softball ^ ~gnd & ~gnd | ~( firemonkey ) );
  end

initial begin
    {crank,marijuana} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({avon,macys} < {subway,coffee})
       {crank,marijuana} <= {subway,coffee};
    else
       {crank,marijuana} <= {avon,macys};
  end

// Random 3 in 3 out table
always @(vcc or blaster or vcc)
  begin
    casex ({vcc,blaster,vcc})
      0: {lsd,acid,crack}=0;
      1: {lsd,acid,crack}=3;
      2: {lsd,acid,crack}=5;
      3: {lsd,acid,crack}=6;
      4: {lsd,acid,crack}=1;
      5: {lsd,acid,crack}=6;
      6: {lsd,acid,crack}=1;
      7: {lsd,acid,crack}=4;
      default: {lsd,acid,crack}=0;
    endcase
  end

reg feedback_pt_148;

always @(vcc or feedback_pt_148)
  begin
      speed =  vcc |  feedback_pt_148;
  end

reg feedback_pt_149;

always @(infesting or feedback_pt_149)
  begin
      meth =  infesting ^ !feedback_pt_149;
  end

reg feedback_pt_150;

always @(speed or feedback_pt_150)
  begin
      crystal =  speed |  feedback_pt_150;
  end

reg feedback_pt_151;

always @(vcc or feedback_pt_151)
  begin
      uppers = !vcc &  feedback_pt_151;
  end

reg feedback_pt_152;

always @(children or feedback_pt_152)
  begin
      downers =  children &  feedback_pt_152;
  end

reg feedback_pt_153;

always @(gnd or feedback_pt_153)
  begin
      viagra =  gnd & !feedback_pt_153;
  end

reg feedback_pt_154;

always @(papyrus or feedback_pt_154)
  begin
      yohimbe = !papyrus &  feedback_pt_154;
  end

reg feedback_pt_155;

always @(martin or feedback_pt_155)
  begin
      decongestant = !martin |  feedback_pt_155;
  end

reg feedback_pt_156;

always @(aisle_two or feedback_pt_156)
  begin
      nyquil = !aisle_two ^ !feedback_pt_156;
  end

reg feedback_pt_157;

always @(mitsubishi or feedback_pt_157)
  begin
      dimetap =  mitsubishi |  feedback_pt_157;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      coughsyrup <= 0;
    else
      coughsyrup <= sebastian;
  end

always @(coughsyrup)
  begin
      feedback_pt_148 = coughsyrup;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vicks <= 1;
    else
      vicks <= gnd;
  end

always @(vicks)
  begin
      feedback_pt_149 = vicks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      comtrex <= 0;
    else if (coffee)
      comtrex <= golfland;
    else if (lsd)
      comtrex <= 0;
  end

always @(comtrex)
  begin
      feedback_pt_150 = comtrex;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aspirin <= 1;
    else
      aspirin <= vcc;
  end

always @(aspirin)
  begin
      feedback_pt_151 = aspirin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      advil <= 0;
    else if (gnd)
      advil <= 0;
    else if (speed)
      advil <= romex;
  end

always @(advil)
  begin
      feedback_pt_152 = advil;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      naproxen <= 0;
    else if (vcc)
      naproxen <= nyquil;
  end

always @(naproxen)
  begin
      feedback_pt_153 = naproxen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tylenol <= 0;
    else
      tylenol <= soccer;
  end

always @(tylenol)
  begin
      feedback_pt_154 = tylenol;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sinus <= 0;
    else
      sinus <= viagra;
  end

always @(sinus)
  begin
      feedback_pt_155 = sinus;
  end

wire sinew_wire;

dffea sinew_ff (
  .clk(clock0),
  .d(crystal),
  .ena(tabby),
  .adata(tako),
  .clrn(!reset0),
  .q(sinew_wire)
);

always @(sinew_wire) begin
   snort = sinew_wire;
end

always @(snort)
  begin
      feedback_pt_156 = snort;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pcp <= 0;
    else
      pcp <= bonker;
  end

always @(pcp)
  begin
      feedback_pt_157 = pcp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      phenyalanine <= 0;
    else if (concorde)
      phenyalanine <= 0;
    else if (uppers)
      phenyalanine <= sweetie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      saccarine <= 0;
    else if (gnd)
      saccarine <= tylenol;
    else if (marijuana)
      saccarine <= 0;
  end

wire nutrasweet_wire;

dffeas nutrasweet_ff (
  .clk(clock0),
  .d(marijuana),
  .ena(dimetap),
  .sclr(coffee),
  .sload(gnd),
  .asdata(honda),
  .clrn(!reset0),
  .q(nutrasweet_wire)
);

always @(nutrasweet_wire) begin
   sugar = nutrasweet_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      honey <= 0;
    else
      honey <= molokai;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rose <= 1;
    else
      rose <= nyquil;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foliage <= 1;
    else
      foliage <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      defoliant <= 0;
    else
      defoliant <= century;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      exfoliant <= 0;
    else if (oldnavy)
      exfoliant <= pomodoro;
    else if (tabby)
      exfoliant <= 0;
  end

reg feedback_pt_158;

always @(crack or feedback_pt_158)
  begin
      curious = !crack & !feedback_pt_158;
  end

reg feedback_pt_159;

always @(vcc or feedback_pt_159)
  begin
      george =  vcc ^  feedback_pt_159;
  end

reg feedback_pt_160;

always @(aspirin or feedback_pt_160)
  begin
      balloon =  aspirin | !feedback_pt_160;
  end

reg feedback_pt_161;

always @(tofu or feedback_pt_161)
  begin
      robust = !tofu &  feedback_pt_161;
  end

reg feedback_pt_162;

always @(nasdaq or feedback_pt_162)
  begin
      enoch =  nasdaq &  feedback_pt_162;
  end

reg feedback_pt_163;

always @(tsmc or feedback_pt_163)
  begin
      bobblehead =  tsmc | !feedback_pt_163;
  end

reg feedback_pt_164;

always @(vcc or feedback_pt_164)
  begin
      cheez = !vcc | !feedback_pt_164;
  end

reg feedback_pt_165;

always @(harrydavid or feedback_pt_165)
  begin
      zed = !harrydavid |  feedback_pt_165;
  end

reg feedback_pt_166;

always @(bathbody or feedback_pt_166)
  begin
      zen = !bathbody & !feedback_pt_166;
  end

reg feedback_pt_167;

always @(tako or feedback_pt_167)
  begin
      falafel =  tako |  feedback_pt_167;
  end

reg feedback_pt_168;

always @(gnd or feedback_pt_168)
  begin
      rodriguez =  gnd ^ !feedback_pt_168;
  end

reg feedback_pt_169;

always @(pomodoro or feedback_pt_169)
  begin
      dukdodger =  pomodoro |  feedback_pt_169;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ocha <= 0;
    else if (gnd)
      ocha <= macys;
  end

always @(ocha)
  begin
      feedback_pt_158 = ocha;
  end

always @(ocha)
  begin
      feedback_pt_159 = ocha;
  end

always @(ocha)
  begin
      feedback_pt_160 = ocha;
  end

always @(ocha)
  begin
      feedback_pt_161 = ocha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kaisha <= 0;
    else if (att)
      kaisha <= 0;
    else if (nasdaq)
      kaisha <= tylenol;
  end

always @(kaisha)
  begin
      feedback_pt_162 = kaisha;
  end

wire hellokitty_wire;

dffeas hellokitty_ff (
  .clk(clock0),
  .d(aisle_two),
  .ena(pasta),
  .sclr(dukdodger),
  .sload(shark),
  .asdata(gnd),
  .clrn(!reset0),
  .q(hellokitty_wire)
);

always @(hellokitty_wire) begin
   badtzmaru = hellokitty_wire;
end

always @(badtzmaru)
  begin
      feedback_pt_163 = badtzmaru;
  end

wire sapporo_wire;

dffea sapporo_ff (
  .clk(clock0),
  .d(gnd),
  .ena(dingbat),
  .adata(saccarine),
  .clrn(!reset0),
  .q(sapporo_wire)
);

always @(sapporo_wire) begin
   asahi = sapporo_wire;
end

always @(asahi)
  begin
      feedback_pt_164 = asahi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hummer <= 0;
    else
      hummer <= enoch;
  end

always @(hummer)
  begin
      feedback_pt_165 = hummer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      elian <= 0;
    else if (vcc)
      elian <= wanton;
    else if (bomb)
      elian <= 0;
  end

always @(elian)
  begin
      feedback_pt_166 = elian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      condit <= 0;
    else if (lafondue)
      condit <= 0;
    else if (gnd)
      condit <= sinus;
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
      gopher <= nasdaq;
  end

always @(gopher)
  begin
      feedback_pt_168 = gopher;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      giraffe <= 0;
    else if (octapus)
      giraffe <= marge;
    else if (siamese)
      giraffe <= 0;
  end

always @(giraffe)
  begin
      feedback_pt_169 = giraffe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lotus <= 0;
    else if (gnd)
      lotus <= condit;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flyingmonkey <= 0;
    else if (vcc)
      flyingmonkey <= gnd;
    else if (lotus)
      flyingmonkey <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scotchtape <= 0;
    else
      scotchtape <= enoch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wicked <= 0;
    else if (vcc)
      wicked <= 0;
    else if (vcc)
      wicked <= thankee;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      witch <= 0;
    else if (martin)
      witch <= naproxen;
    else if (gnd)
      witch <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ghost <= 0;
    else if (sebastian)
      ghost <= atchoo;
    else if (scotchtape)
      ghost <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goblin <= 1;
    else
      goblin <= decongestant;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      elf <= 1;
    else
      elf <= thankee;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      centaur <= 1;
    else
      centaur <= tako;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      theseus <= 0;
    else if (ghost)
      theseus <= 0;
    else if (kaisha)
      theseus <= acid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      minotaur <= 0;
    else if (gnd)
      minotaur <= nirish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      midas <= 0;
    else
      midas <= gopher;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      icarus <= 0;
    else
      icarus <= gnd;
  end

wire pegasus_wire;

dffeas pegasus_ff (
  .clk(clock0),
  .d(nirish),
  .ena(bobblehead),
  .sclr(gnd),
  .sload(gnd),
  .asdata(gnd),
  .clrn(!reset0),
  .q(pegasus_wire)
);

always @(pegasus_wire) begin
   troll = pegasus_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      warlock <= 0;
    else if (pasta)
      warlock <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chowmein <= 0;
    else if (stemcell)
      chowmein <= 0;
    else if (vcc)
      chowmein <= nirish;
  end

// Random combinatorial logic block
always@(*)
  begin
      stirfry = ( ~( ~( ~( exfoliant ) ) & ( ~( ~jupiter ) & ~( ~vcc ) ) ) ) & ~( ~( ~( liberace ) ) ) | ( ~( ~( ~( ( vcc | liberace ) ) ) & ~( ( ( ~( warlock ^ lafondue ) ) & ( vcc & ~atchoo ) ) ) ) );
  end

// State Mek tasty Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tasty <= tasty_0;
    else
      case (tasty)
        tasty_0: begin
          if ({centaur,pcp,gnd,gnd} == 5)
            tasty <= tasty_2;
          else if ({centaur,pcp,gnd,gnd} == 2)
            tasty <= tasty_0;
          else if ({centaur,pcp,gnd,gnd} == 9)
            tasty <= tasty_1;
          else
            tasty <= tasty_0;
          end
        tasty_1: begin
          if ({centaur,pcp,gnd,gnd} == 14)
            tasty <= tasty_4;
          else if ({centaur,pcp,gnd,gnd} == 11)
            tasty <= tasty_1;
          else
            tasty <= tasty_1;
          end
        tasty_2: begin
          if ({centaur,pcp,gnd,gnd} == 14)
            tasty <= tasty_1;
          else if ({centaur,pcp,gnd,gnd} == 6)
            tasty <= tasty_2;
          else if ({centaur,pcp,gnd,gnd} == 15)
            tasty <= tasty_1;
          else
            tasty <= tasty_2;
          end
        tasty_3: begin
            tasty <= tasty_3;
          end
        tasty_4: begin
          if ({centaur,pcp,gnd,gnd} == 0)
            tasty <= tasty_2;
          else if ({centaur,pcp,gnd,gnd} == 5)
            tasty <= tasty_3;
          else if ({centaur,pcp,gnd,gnd} == 10)
            tasty <= tasty_1;
          else if ({centaur,pcp,gnd,gnd} == 6)
            tasty <= tasty_4;
          else if ({centaur,pcp,gnd,gnd} == 13)
            tasty <= tasty_2;
          else
            tasty <= tasty_4;
          end
        default: tasty <= tasty_0;
      endcase
  end

// State Mek tasty Output logic
always @(tasty)
  begin
    // consider all state regs when doing outputs
    case (tasty)
        tasty_0: begin
            pastrami = 0;
            turkey = 1;
            beast = 1;
            bacon = 0;
            salami = 0;
            peaves = 1;
            snape = 1;
            hagrid = 0;
            tonks = 1;
            bumbledork = 0;
          end
        tasty_1: begin
            pastrami = 0;
            turkey = 1;
            beast = 0;
            bacon = 0;
            salami = 1;
            peaves = 0;
            snape = 0;
            hagrid = 1;
            tonks = 1;
            bumbledork = 1;
          end
        tasty_2: begin
            pastrami = 0;
            turkey = 1;
            beast = 0;
            bacon = 1;
            salami = 1;
            peaves = 1;
            snape = 1;
            hagrid = 0;
            tonks = 0;
            bumbledork = 1;
          end
        tasty_3: begin
            pastrami = 1;
            turkey = 1;
            beast = 1;
            bacon = 1;
            salami = 1;
            peaves = 0;
            snape = 1;
            hagrid = 1;
            tonks = 0;
            bumbledork = 0;
          end
        tasty_4: begin
            pastrami = 1;
            turkey = 0;
            beast = 0;
            bacon = 1;
            salami = 0;
            peaves = 0;
            snape = 1;
            hagrid = 1;
            tonks = 0;
            bumbledork = 0;
          end
        default: begin
            pastrami = 0;
            turkey = 0;
            beast = 0;
            bacon = 1;
            salami = 0;
            peaves = 1;
            snape = 0;
            hagrid = 0;
            tonks = 1;
            bumbledork = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire madeye_out;
nut_000_lut #(3) nut_000_lut_inst_madeye (
  .din({aisle_two,snort,peace}),
  .mask(8'b10110001),
  .out(madeye_out)
);

always @(madeye_out)
begin
   moody = madeye_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire floo_out;
nut_000_lut #(3) nut_000_lut_inst_floo (
  .din({gnd,pcp,animal}),
  .mask(8'b00001010),
  .out(floo_out)
);

always @(floo_out)
begin
   weasley = floo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire broom_out;
nut_000_lut #(2) nut_000_lut_inst_broom (
  .din({gnd,gnd}),
  .mask(4'h7),
  .out(broom_out)
);

always @(broom_out)
begin
   powder = broom_out;
end

// In range compare
always @(whatelse or troll or cheez or molokai or yohimbe or bomb or salami or speed)
  begin
    if ({whatelse,troll,cheez,molokai,yohimbe,bomb,salami,speed} > 21 &&
        {whatelse,troll,cheez,molokai,yohimbe,bomb,salami,speed} < 30)
      stick = 1;
    else
      stick = 0;
  end


initial begin
    {quidditch,phoenix,arizona,fang,scabbers,umbridge,filch} = 0;
end

// Registered 7 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (snape)
      {quidditch,phoenix,arizona,fang,scabbers,umbridge,filch} <= 0;
    else if (handroll)
      {quidditch,phoenix,arizona,fang,scabbers,umbridge,filch} <=
		  {goblin,gnd,vcc,downers,decongestant,vcc,vcc};
    else
      {quidditch,phoenix,arizona,fang,scabbers,umbridge,filch} <=
		 {vcc,infesting,icarus,witch,bacon,peaves,gnd} + 
		 {tonks,icarus,speed,gnd,flyingmonkey,weasley,dow};
  end

// NAND all of these bits together
always @(vcc or vcc or shark or pastrami or bathbody or gnd or harrydavid or george)
  begin
      norris = ~& {vcc,vcc,shark,pastrami,bathbody,gnd,harrydavid,george};
  end

// Random 3 input look up table
always @(stemcell or giraffe or moody)
  begin
    casex ({stemcell,giraffe,moody})
      0: chuck=1;
      1: chuck=1;
      2: chuck=1;
      3: chuck=0;
      4: chuck=1;
      5: chuck=0;
      6: chuck=1;
      7: chuck=1;
      default: chuck=0;
    endcase
  end

// 32:1 MUX with repeating data
always @(quidditch or nirish or safeway or arizona or atchoo or gnd or sirius or vcc)
  begin
    casex ({quidditch,nirish,safeway,arizona,atchoo})
      0: black=vcc;
      1: black=gnd;
      2: black=vcc;
      3: black=gnd;
      4: black=sirius;
      5: black=vcc;
      6: black=vcc;
      7: black=0;
      8: black=sirius;
      9: black=vcc;
      10: black=vcc;
      11: black=gnd;
      12: black=sirius;
      13: black=vcc;
      14: black=gnd;
      15: black=vcc;
      16: black=sirius;
      17: black=vcc;
      18: black=vcc;
      19: black=gnd;
      20: black=1;
      21: black=vcc;
      22: black=vcc;
      23: black=sirius;
      24: black=vcc;
      25: black=vcc;
      26: black=vcc;
      27: black=sirius;
      28: black=sirius;
      29: black=vcc;
      30: black=vcc;
      31: black=sirius;
      default: black=0;
    endcase
  end

// XOR all of these bits together
always @(vcc or gnd or aisle_two or scabbers or meth or marvin or gnd or gnd or gnd or mozart)
  begin
      lupin = ^ {vcc,gnd,aisle_two,scabbers,meth,marvin,gnd,gnd,gnd,mozart};
  end

reg feedback_pt_170;

always @(rose or feedback_pt_170)
  begin
      severus =  rose &  feedback_pt_170;
  end

reg feedback_pt_171;

always @(advil or feedback_pt_171)
  begin
      arthur = !advil |  feedback_pt_171;
  end

reg feedback_pt_172;

always @(norris or feedback_pt_172)
  begin
      snake = !norris & !feedback_pt_172;
  end

reg feedback_pt_173;

always @(vcc or feedback_pt_173)
  begin
      mundungus =  vcc ^ !feedback_pt_173;
  end

reg feedback_pt_174;

always @(vcc or feedback_pt_174)
  begin
      army = !vcc & !feedback_pt_174;
  end

reg feedback_pt_175;

always @(theseus or feedback_pt_175)
  begin
      crookshanks = !theseus |  feedback_pt_175;
  end

reg feedback_pt_176;

always @(dukdodger or feedback_pt_176)
  begin
      trevor =  dukdodger &  feedback_pt_176;
  end

reg feedback_pt_177;

always @(black or feedback_pt_177)
  begin
      neville =  black ^ !feedback_pt_177;
  end

reg feedback_pt_178;

always @(gnd or feedback_pt_178)
  begin
      longbottom = !gnd | !feedback_pt_178;
  end

wire bellatrix_wire;

dffeas bellatrix_ff (
  .clk(clock0),
  .d(abraham),
  .ena(scabbers),
  .sclr(elian),
  .sload(arthur),
  .asdata(turkey),
  .clrn(!reset0),
  .q(bellatrix_wire)
);

always @(bellatrix_wire) begin
   lestrange = bellatrix_wire;
end

always @(lestrange)
  begin
      feedback_pt_170 = lestrange;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      malfoy <= 0;
    else if (gnd)
      malfoy <= harrydavid;
    else if (longbottom)
      malfoy <= 0;
  end

always @(malfoy)
  begin
      feedback_pt_171 = malfoy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      draco <= 0;
    else if (meth)
      draco <= gnd;
  end

always @(draco)
  begin
      feedback_pt_172 = draco;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lucius <= 0;
    else
      lucius <= gnd;
  end

always @(lucius)
  begin
      feedback_pt_173 = lucius;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      narcissa <= 0;
    else if (arizona)
      narcissa <= honey;
  end

always @(narcissa)
  begin
      feedback_pt_174 = narcissa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      albus <= 0;
    else
      albus <= tonks;
  end

always @(albus)
  begin
      feedback_pt_175 = albus;
  end

wire mcgonagall_wire;

dffea mcgonagall_ff (
  .clk(clock0),
  .d(infesting),
  .ena(gnd),
  .adata(lestrange),
  .clrn(!reset0),
  .q(mcgonagall_wire)
);

always @(mcgonagall_wire) begin
   hogwarts = mcgonagall_wire;
end

always @(hogwarts)
  begin
      feedback_pt_176 = hogwarts;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rubeus <= 1;
    else
      rubeus <= gnd;
  end

always @(rubeus)
  begin
      feedback_pt_177 = rubeus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drumstrang <= 0;
    else if (severus)
      drumstrang <= vcc;
    else if (george)
      drumstrang <= 0;
  end

always @(drumstrang)
  begin
      feedback_pt_178 = drumstrang;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      norbert <= 0;
    else if (vcc)
      norbert <= gnd;
    else if (hogwarts)
      norbert <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wizard <= 0;
    else
      wizard <= stick;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      diagon <= 0;
    else if (abraham)
      diagon <= pastrami;
    else if (elf)
      diagon <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fireplace <= 0;
    else if (gnd)
      fireplace <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crucio <= 1;
    else
      crucio <= exodus;
  end

wire kedavra_wire;

dffeas kedavra_ff (
  .clk(clock0),
  .d(exfoliant),
  .ena(quidditch),
  .sclr(gnd),
  .sload(lucius),
  .asdata(snort),
  .clrn(!reset0),
  .q(kedavra_wire)
);

always @(kedavra_wire) begin
   mario_owes = kedavra_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gregg_a <= 0;
    else if (gnd)
      gregg_a <= ocha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burrito <= 0;
    else if (mitsubishi)
      burrito <= bumbledork;
    else if (robust)
      burrito <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      correctness <= 0;
    else if (malfoy)
      correctness <= phenyalanine;
    else if (burrito)
      correctness <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cafe <= 0;
    else if (bomb)
      cafe <= 0;
    else if (defoliant)
      cafe <= minotaur;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      synplicity_burrito <= 0;
    else if (hagrid)
      synplicity_burrito <= vcc;
    else if (zed)
      synplicity_burrito <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      guacamole <= 0;
    else
      guacamole <= vcc;
  end

wire sourcream_wire;

dffeas sourcream_ff (
  .clk(clock0),
  .d(snake),
  .ena(speed),
  .sclr(longbottom),
  .sload(turkey),
  .asdata(stick),
  .clrn(!reset0),
  .q(sourcream_wire)
);

always @(sourcream_wire) begin
   onion = sourcream_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jalapeno <= 0;
    else if (neville)
      jalapeno <= chuck;
    else if (vcc)
      jalapeno <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beef <= 1;
    else
      beef <= umbridge;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pork <= 1;
    else
      pork <= crucio;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blackbeans <= 0;
    else if (filch)
      blackbeans <= gnd;
    else if (narcissa)
      blackbeans <= 0;
  end

// State Mek refriedbeans Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      refriedbeans <= refriedbeans_0;
    else
      case (refriedbeans)
        refriedbeans_0: begin
          if ({sugar,curious,badtzmaru,vcc} == 8)
            refriedbeans <= refriedbeans_7;
          else
            refriedbeans <= refriedbeans_0;
          end
        refriedbeans_1: begin
          if ({sugar,curious,badtzmaru,vcc} == 6)
            refriedbeans <= refriedbeans_5;
          else
            refriedbeans <= refriedbeans_1;
          end
        refriedbeans_2: begin
          if ({sugar,curious,badtzmaru,vcc} == 6)
            refriedbeans <= refriedbeans_9;
          else if ({sugar,curious,badtzmaru,vcc} == 14)
            refriedbeans <= refriedbeans_4;
          else if ({sugar,curious,badtzmaru,vcc} == 13)
            refriedbeans <= refriedbeans_6;
          else if ({sugar,curious,badtzmaru,vcc} == 2)
            refriedbeans <= refriedbeans_0;
          else
            refriedbeans <= refriedbeans_2;
          end
        refriedbeans_3: begin
          if ({sugar,curious,badtzmaru,vcc} == 1)
            refriedbeans <= refriedbeans_3;
          else if ({sugar,curious,badtzmaru,vcc} == 9)
            refriedbeans <= refriedbeans_5;
          else if ({sugar,curious,badtzmaru,vcc} == 12)
            refriedbeans <= refriedbeans_0;
          else
            refriedbeans <= refriedbeans_3;
          end
        refriedbeans_4: begin
          if ({sugar,curious,badtzmaru,vcc} == 9)
            refriedbeans <= refriedbeans_5;
          else
            refriedbeans <= refriedbeans_4;
          end
        refriedbeans_5: begin
            refriedbeans <= refriedbeans_5;
          end
        refriedbeans_6: begin
          if ({sugar,curious,badtzmaru,vcc} == 8)
            refriedbeans <= refriedbeans_0;
          else if ({sugar,curious,badtzmaru,vcc} == 2)
            refriedbeans <= refriedbeans_8;
          else if ({sugar,curious,badtzmaru,vcc} == 1)
            refriedbeans <= refriedbeans_7;
          else
            refriedbeans <= refriedbeans_6;
          end
        refriedbeans_7: begin
          if ({sugar,curious,badtzmaru,vcc} == 7)
            refriedbeans <= refriedbeans_2;
          else if ({sugar,curious,badtzmaru,vcc} == 15)
            refriedbeans <= refriedbeans_7;
          else if ({sugar,curious,badtzmaru,vcc} == 3)
            refriedbeans <= refriedbeans_2;
          else
            refriedbeans <= refriedbeans_7;
          end
        refriedbeans_8: begin
          if ({sugar,curious,badtzmaru,vcc} == 3)
            refriedbeans <= refriedbeans_2;
          else if ({sugar,curious,badtzmaru,vcc} == 1)
            refriedbeans <= refriedbeans_3;
          else if ({sugar,curious,badtzmaru,vcc} == 4)
            refriedbeans <= refriedbeans_3;
          else if ({sugar,curious,badtzmaru,vcc} == 12)
            refriedbeans <= refriedbeans_5;
          else
            refriedbeans <= refriedbeans_8;
          end
        refriedbeans_9: begin
          if ({sugar,curious,badtzmaru,vcc} == 8)
            refriedbeans <= refriedbeans_5;
          else if ({sugar,curious,badtzmaru,vcc} == 5)
            refriedbeans <= refriedbeans_3;
          else if ({sugar,curious,badtzmaru,vcc} == 6)
            refriedbeans <= refriedbeans_3;
          else if ({sugar,curious,badtzmaru,vcc} == 11)
            refriedbeans <= refriedbeans_1;
          else if ({sugar,curious,badtzmaru,vcc} == 4)
            refriedbeans <= refriedbeans_9;
          else if ({sugar,curious,badtzmaru,vcc} == 14)
            refriedbeans <= refriedbeans_2;
          else
            refriedbeans <= refriedbeans_9;
          end
        default: refriedbeans <= refriedbeans_0;
      endcase
  end

// State Mek refriedbeans Output logic
always @(refriedbeans)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (refriedbeans)
        refriedbeans_0: begin
            pintobeans = 1;
            tortilla = 0;
            salsa = 0;
            picante = 0;
            chips = 0;
            tabasco = 0;
            mexican = 0;
            too_big = 0;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_1: begin
            pintobeans = 1;
            tortilla = 0;
            salsa = 0;
            picante = 0;
            chips = 1;
            tabasco = 0;
            mexican = 0;
            too_big = 0;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_2: begin
            pintobeans = 0;
            tortilla = 1;
            salsa = 0;
            picante = 0;
            chips = 1;
            tabasco = 0;
            mexican = 1;
            too_big = 1;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_3: begin
            pintobeans = 0;
            tortilla = 0;
            salsa = 0;
            picante = 1;
            chips = 0;
            tabasco = 0;
            mexican = 0;
            too_big = 0;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_4: begin
            pintobeans = 0;
            tortilla = 0;
            salsa = 0;
            picante = 0;
            chips = 1;
            tabasco = 0;
            mexican = 0;
            too_big = 0;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_5: begin
            pintobeans = 0;
            tortilla = 0;
            salsa = 0;
            picante = 0;
            chips = 0;
            tabasco = 1;
            mexican = 0;
            too_big = 0;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_6: begin
            pintobeans = 0;
            tortilla = 1;
            salsa = 1;
            picante = 0;
            chips = 1;
            tabasco = 1;
            mexican = 0;
            too_big = 0;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_7: begin
            pintobeans = 1;
            tortilla = 1;
            salsa = 1;
            picante = 0;
            chips = 1;
            tabasco = 0;
            mexican = 1;
            too_big = 1;
            llamas_dont_eat_burrito = 0;
          end
        refriedbeans_8: begin
            pintobeans = 0;
            tortilla = 0;
            salsa = 0;
            picante = 1;
            chips = 1;
            tabasco = 1;
            mexican = 0;
            too_big = 0;
            llamas_dont_eat_burrito = 1;
          end
        refriedbeans_9: begin
            pintobeans = 1;
            tortilla = 0;
            salsa = 0;
            picante = 1;
            chips = 0;
            tabasco = 1;
            mexican = 0;
            too_big = 1;
            llamas_dont_eat_burrito = 1;
          end
        default: begin
            pintobeans = 1;
            tortilla = 0;
            salsa = 1;
            picante = 0;
            chips = 1;
            tabasco = 1;
            mexican = 1;
            too_big = 0;
            llamas_dont_eat_burrito = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire fufu_out;
nut_000_lut #(5) nut_000_lut_inst_fufu (
  .din({wizard,norbert,onion,gregg_a,trevor}),
  .mask(32'b00101110010001101001010000000101),
  .out(fufu_out)
);

always @(fufu_out)
begin
   director_of_llamas = fufu_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire coconut_out;
nut_000_lut #(5) nut_000_lut_inst_coconut (
  .din({gnd,picante,vcc,beef,minotaur}),
  .mask(32'ha2477eb5),
  .out(coconut_out)
);

always @(coconut_out)
begin
   castaway = coconut_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire gilligan_out;
nut_000_lut #(2) nut_000_lut_inst_gilligan (
  .din({gnd,vcc}),
  .mask(4'b0001),
  .out(gilligan_out)
);

always @(gilligan_out)
begin
   maryann = gilligan_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire professor_out;
nut_000_lut #(2) nut_000_lut_inst_professor (
  .din({comtrex,chips}),
  .mask(4'ha),
  .out(professor_out)
);

always @(professor_out)
begin
   skipper = professor_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire ginger_out;
nut_000_lut #(2) nut_000_lut_inst_ginger (
  .din({fang,longbottom}),
  .mask(4'ha),
  .out(ginger_out)
);

always @(ginger_out)
begin
   moviestar = ginger_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire grumby_out;
nut_000_lut #(6) nut_000_lut_inst_grumby (
  .din({gnd,maryann,rubeus,vcc,mario_owes,phenyalanine}),
  .mask(64'b0010000110010000001000000001100000000101001000000000001000000000),
  .out(grumby_out)
);

always @(grumby_out)
begin
   jonas = grumby_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire lost_out;
nut_000_lut #(2) nut_000_lut_inst_lost (
  .din({pintobeans,stemcell}),
  .mask(4'h7),
  .out(lost_out)
);

always @(lost_out)
begin
   minnow = lost_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire thurston_out;
nut_000_lut #(1) nut_000_lut_inst_thurston (
  .din({minnow}),
  .mask(2'b00),
  .out(thurston_out)
);

always @(thurston_out)
begin
   bfs = thurston_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire howell_out;
nut_000_lut #(6) nut_000_lut_inst_howell (
  .din({falafel,robust,gnd,midas,gnd,vcc}),
  .mask(64'b0011010100000000001101000000011111010011000100010100000000000000),
  .out(howell_out)
);

always @(howell_out)
begin
   lovey = howell_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire eunice_out;
nut_000_lut #(2) nut_000_lut_inst_eunice (
  .din({tortilla,gnd}),
  .mask(4'hc),
  .out(eunice_out)
);

always @(eunice_out)
begin
   hinkley = eunice_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire voodoo_out;
nut_000_lut #(2) nut_000_lut_inst_voodoo (
  .din({filch,vcc}),
  .mask(4'b0000),
  .out(voodoo_out)
);

always @(voodoo_out)
begin
   witchdoctor = voodoo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire reallyloud_out;
nut_000_lut #(6) nut_000_lut_inst_reallyloud (
  .din({vcc,too_big,correctness,gnd,gnd,stemcell}),
  .mask(64'b1101001000101000010000000111100011010000001010100000000000001000),
  .out(reallyloud_out)
);

always @(reallyloud_out)
begin
   uncharted = reallyloud_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire ohthatcoconut_out;
nut_000_lut #(6) nut_000_lut_inst_ohthatcoconut (
  .din({gnd,hinkley,llamas_dont_eat_burrito,witchdoctor,cafe,gnd}),
  .mask(64'b0010110110000000000000000010001000100101001000100001000000101000),
  .out(ohthatcoconut_out)
);

always @(ohthatcoconut_out)
begin
   hypnotized = ohthatcoconut_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire rarest_out;
nut_000_lut #(2) nut_000_lut_inst_rarest (
  .din({uncharted,skipper}),
  .mask(4'h4),
  .out(rarest_out)
);

always @(rarest_out)
begin
   booming = rarest_out;
end

// State Mek butterfly Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      butterfly <= butterfly_0;
    else
      case (butterfly)
        butterfly_0: begin
          if ({gnd,hummer,defoliant,diagon} == 8)
            butterfly <= butterfly_1;
          else if ({gnd,hummer,defoliant,diagon} == 1)
            butterfly <= butterfly_2;
          else
            butterfly <= butterfly_0;
          end
        butterfly_1: begin
          if ({gnd,hummer,defoliant,diagon} == 1)
            butterfly <= butterfly_3;
          else if ({gnd,hummer,defoliant,diagon} == 9)
            butterfly <= butterfly_3;
          else
            butterfly <= butterfly_1;
          end
        butterfly_2: begin
          if ({gnd,hummer,defoliant,diagon} == 11)
            butterfly <= butterfly_0;
          else if ({gnd,hummer,defoliant,diagon} == 2)
            butterfly <= butterfly_2;
          else
            butterfly <= butterfly_2;
          end
        butterfly_3: begin
          if ({gnd,hummer,defoliant,diagon} == 10)
            butterfly <= butterfly_3;
          else if ({gnd,hummer,defoliant,diagon} == 11)
            butterfly <= butterfly_0;
          else if ({gnd,hummer,defoliant,diagon} == 1)
            butterfly <= butterfly_1;
          else if ({gnd,hummer,defoliant,diagon} == 5)
            butterfly <= butterfly_2;
          else
            butterfly <= butterfly_3;
          end
        default: butterfly <= butterfly_0;
      endcase
  end

// State Mek butterfly Output logic
always @(butterfly)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (butterfly)
        butterfly_0: begin
            palm = 1;
            seashell = 0;
            ohisee = 0;
            whacky = 0;
            rerun = 1;
            fronds = 1;
            hut = 0;
            rescue = 1;
            hawaii = 1;
            wallstreet = 1;
            levelization = 0;
            huhhuh = 1;
            uomcensor = 1;
            wildboar = 1;
            lagoon = 1;
            husks = 0;
          end
        butterfly_1: begin
            palm = 0;
            seashell = 1;
            ohisee = 0;
            whacky = 0;
            rerun = 0;
            fronds = 0;
            hut = 1;
            rescue = 0;
            hawaii = 1;
            wallstreet = 1;
            levelization = 0;
            huhhuh = 0;
            uomcensor = 1;
            wildboar = 1;
            lagoon = 0;
            husks = 1;
          end
        butterfly_2: begin
            palm = 0;
            seashell = 1;
            ohisee = 0;
            whacky = 0;
            rerun = 1;
            fronds = 0;
            hut = 0;
            rescue = 1;
            hawaii = 1;
            wallstreet = 1;
            levelization = 0;
            huhhuh = 1;
            uomcensor = 1;
            wildboar = 1;
            lagoon = 0;
            husks = 1;
          end
        butterfly_3: begin
            palm = 1;
            seashell = 1;
            ohisee = 0;
            whacky = 0;
            rerun = 1;
            fronds = 1;
            hut = 1;
            rescue = 1;
            hawaii = 1;
            wallstreet = 0;
            levelization = 0;
            huhhuh = 0;
            uomcensor = 0;
            wildboar = 0;
            lagoon = 0;
            husks = 1;
          end
        default: begin
            palm = 0;
            seashell = 1;
            ohisee = 1;
            whacky = 1;
            rerun = 1;
            fronds = 0;
            hut = 1;
            rescue = 0;
            hawaii = 0;
            wallstreet = 1;
            levelization = 0;
            huhhuh = 0;
            uomcensor = 0;
            wildboar = 1;
            lagoon = 1;
            husks = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire foiled_out;
nut_000_lut #(5) nut_000_lut_inst_foiled (
  .din({director_of_llamas,malfoy,fireplace,correctness,vcc}),
  .mask(32'ha6f23e1a),
  .out(foiled_out)
);

always @(foiled_out)
begin
   escape = foiled_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire desert_out;
nut_000_lut #(1) nut_000_lut_inst_desert (
  .din({lovey}),
  .mask(2'b10),
  .out(desert_out)
);

always @(desert_out)
begin
   bamboo = desert_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire pacific_out;
nut_000_lut #(1) nut_000_lut_inst_pacific (
  .din({levelization}),
  .mask(2'b01),
  .out(pacific_out)
);

always @(pacific_out)
begin
   isle = pacific_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire waterfall_out;
nut_000_lut #(5) nut_000_lut_inst_waterfall (
  .din({lupin,mario_owes,fronds,palm,vcc}),
  .mask(32'b10010000000010101000011100100010),
  .out(waterfall_out)
);

always @(waterfall_out)
begin
   ocean = waterfall_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire loud_out;
nut_000_lut #(2) nut_000_lut_inst_loud (
  .din({mexican,gnd}),
  .mask(4'he),
  .out(loud_out)
);

always @(loud_out)
begin
   tan_nodes = loud_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire hiswife_out;
nut_000_lut #(4) nut_000_lut_inst_hiswife (
  .din({castaway,wallstreet,vcc,tabasco}),
  .mask(16'b1100001110001000),
  .out(hiswife_out)
);

always @(hiswife_out)
begin
   millionaire = hiswife_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire banshee_out;
nut_000_lut #(1) nut_000_lut_inst_banshee (
  .din({robust}),
  .mask(2'b10),
  .out(banshee_out)
);

always @(banshee_out)
begin
   smack = banshee_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire vimcensorc_out;
nut_000_lut #(5) nut_000_lut_inst_vimcensorc (
  .din({vcc,hypnotized,whacky,mitsubishi,vcc}),
  .mask(32'b01000000001010000000000000000001),
  .out(vimcensorc_out)
);

always @(vimcensorc_out)
begin
   dillweed = vimcensorc_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire killer_out;
nut_000_lut #(4) nut_000_lut_inst_killer (
  .din({mexican,gnd,jalapeno,draco}),
  .mask(16'b0001100011101000),
  .out(killer_out)
);

always @(killer_out)
begin
   tesla = killer_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire pierre_out;
nut_000_lut #(1) nut_000_lut_inst_pierre (
  .din({beast}),
  .mask(2'b00),
  .out(pierre_out)
);

always @(pierre_out)
begin
   wonton = pierre_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire rufus_out;
nut_000_lut #(2) nut_000_lut_inst_rufus (
  .din({vcc,lupin}),
  .mask(4'ha),
  .out(rufus_out)
);

always @(rufus_out)
begin
   armand = rufus_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire gonzo_out;
nut_000_lut #(1) nut_000_lut_inst_gonzo (
  .din({tesla}),
  .mask(2'b00),
  .out(gonzo_out)
);

always @(gonzo_out)
begin
   willy = gonzo_out;
end

reg feedback_pt_179;

always @(gnd or feedback_pt_179)
  begin
      gulp =  gnd | !feedback_pt_179;
  end

reg feedback_pt_180;

always @(moviestar or feedback_pt_180)
  begin
      bonafide =  moviestar |  feedback_pt_180;
  end

reg feedback_pt_181;

always @(rerun or feedback_pt_181)
  begin
      stroop =  rerun & !feedback_pt_181;
  end

reg feedback_pt_182;

always @(chowmein or feedback_pt_182)
  begin
      waffle = !chowmein ^ !feedback_pt_182;
  end

reg feedback_pt_183;

always @(smack or feedback_pt_183)
  begin
      wheezer = !smack |  feedback_pt_183;
  end

reg feedback_pt_184;

always @(escape or feedback_pt_184)
  begin
      ozzy = !escape | !feedback_pt_184;
  end

reg feedback_pt_185;

always @(lafondue or feedback_pt_185)
  begin
      priest =  lafondue |  feedback_pt_185;
  end

reg feedback_pt_186;

always @(centaur or feedback_pt_186)
  begin
      rabbi = !centaur ^  feedback_pt_186;
  end

reg feedback_pt_187;

always @(gnd or feedback_pt_187)
  begin
      wancensorcens = !gnd |  feedback_pt_187;
  end

reg feedback_pt_188;

always @(isle or feedback_pt_188)
  begin
      xbncensorcens =  isle ^  feedback_pt_188;
  end

reg feedback_pt_189;

always @(mundungus or feedback_pt_189)
  begin
      tapered = !mundungus ^  feedback_pt_189;
  end

reg feedback_pt_190;

always @(minnow or feedback_pt_190)
  begin
      spastic = !minnow &  feedback_pt_190;
  end

wire lad_wire;

dffeas lad_ff (
  .clk(clock0),
  .d(naproxen),
  .ena(armand),
  .sclr(drumstrang),
  .sload(midas),
  .asdata(naproxen),
  .clrn(!reset0),
  .q(lad_wire)
);

always @(lad_wire) begin
   mao = lad_wire;
end

always @(mao)
  begin
      feedback_pt_179 = mao;
  end

always @(mao)
  begin
      feedback_pt_180 = mao;
  end

always @(mao)
  begin
      feedback_pt_181 = mao;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zedong <= 0;
    else if (pasta)
      zedong <= filch;
    else if (ozzy)
      zedong <= 0;
  end

always @(zedong)
  begin
      feedback_pt_182 = zedong;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deng <= 0;
    else if (gnd)
      deng <= xbncensorcens;
  end

always @(deng)
  begin
      feedback_pt_183 = deng;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      xiaoping <= 0;
    else if (ocha)
      xiaoping <= vcc;
  end

always @(xiaoping)
  begin
      feedback_pt_184 = xiaoping;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jinyong <= 0;
    else if (pork)
      jinyong <= skipper;
  end

always @(jinyong)
  begin
      feedback_pt_185 = jinyong;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lao <= 0;
    else
      lao <= gnd;
  end

always @(lao)
  begin
      feedback_pt_186 = lao;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zi <= 0;
    else if (gnd)
      zi <= 0;
    else if (vcc)
      zi <= vcc;
  end

always @(zi)
  begin
      feedback_pt_187 = zi;
  end

wire zhuang_wire;

dffea zhuang_ff (
  .clk(clock0),
  .d(stroop),
  .ena(priest),
  .adata(fireplace),
  .clrn(!reset0),
  .q(zhuang_wire)
);

always @(zhuang_wire) begin
   wujing = zhuang_wire;
end

always @(wujing)
  begin
      feedback_pt_188 = wujing;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wukong <= 0;
    else if (wujing)
      wukong <= powder;
  end

always @(wukong)
  begin
      feedback_pt_189 = wukong;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      helena <= 0;
    else if (gnd)
      helena <= 0;
    else if (gnd)
      helena <= wonton;
  end

always @(helena)
  begin
      feedback_pt_190 = helena;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gerrit <= 0;
    else
      gerrit <= mexican;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      willem <= 0;
    else if (wukong)
      willem <= 0;
    else if (waffle)
      willem <= lao;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dirk <= 0;
    else if (lafondue)
      dirk <= 0;
    else if (millionaire)
      dirk <= tapered;
  end

wire klaas_wire;

dffeas klaas_ff (
  .clk(clock0),
  .d(rescue),
  .ena(gnd),
  .sclr(mundungus),
  .sload(vcc),
  .asdata(vcc),
  .clrn(!reset0),
  .q(klaas_wire)
);

always @(klaas_wire) begin
   bep = klaas_wire;
end

wire hans_wire;

dffea hans_ff (
  .clk(clock0),
  .d(ohisee),
  .ena(hut),
  .adata(gnd),
  .clrn(!reset0),
  .q(hans_wire)
);

always @(hans_wire) begin
   gerard = hans_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      leeuwenhoek <= 0;
    else
      leeuwenhoek <= gnd;
  end

// 5 bit divide
always @(castaway or gnd or jonas or hut or hut or husks or naproxen or gulp or lafondue or phoenix)
  begin
    if ({husks,naproxen,gulp,lafondue,phoenix} == 0)
       {microscope,erasmus,deruyter,vangoh,fortuyn} = 0;
    else 
      {microscope,erasmus,deruyter,vangoh,fortuyn} = 
	  	  {castaway,gnd,jonas,hut,hut} / 
		  {husks,naproxen,gulp,lafondue,phoenix};
  end


initial begin
    {oranje,schwinger} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({gnd,cafe} < {helena,rabbi})
       {oranje,schwinger} <= {helena,rabbi};
    else
       {oranje,schwinger} <= {gnd,cafe};
  end

// OR all of these bits together
always @(rabbi or minotaur or synplicity_burrito or deruyter or xiaoping or zedong or stick or xbncensorcens or phoenix or salsa or wukong or gerrit)
  begin
      feynman = | {rabbi,minotaur,synplicity_burrito,deruyter,xiaoping,zedong,stick,xbncensorcens,phoenix,salsa,wukong,gerrit};
  end

always @(gnd or vcc or guacamole or hawaii or gnd or 
   gnd or vcc or guacamole or hawaii or oranje or 
   norbert
)
  begin
    if (norbert)
    begin
      case ({{gnd,vcc,guacamole,hawaii},gnd})
        0: plague=0;
        1: plague=1;
        2: plague=1;
        3: plague=0;
        4: plague=1;
        5: plague=1;
        6: plague=1;
        7: plague=0;
        8: plague=0;
        9: plague=0;
        10: plague=0;
        11: plague=1;
        12: plague=0;
        13: plague=1;
        14: plague=1;
        15: plague=0;
        16: plague=1;
        17: plague=0;
        18: plague=1;
        19: plague=1;
        20: plague=0;
        21: plague=1;
        22: plague=0;
        23: plague=1;
        24: plague=1;
        25: plague=1;
        26: plague=1;
        27: plague=1;
        28: plague=1;
        29: plague=1;
        30: plague=1;
        31: plague=1;
      default: plague=0;
      endcase
    end
    else
    begin
      case ({{gnd,vcc,guacamole,hawaii},oranje})
        0: plague=1;
        1: plague=0;
        2: plague=0;
        3: plague=0;
        4: plague=1;
        5: plague=0;
        6: plague=1;
        7: plague=0;
        8: plague=0;
        9: plague=0;
        10: plague=1;
        11: plague=0;
        12: plague=1;
        13: plague=1;
        14: plague=0;
        15: plague=1;
        16: plague=0;
        17: plague=1;
        18: plague=1;
        19: plague=0;
        20: plague=1;
        21: plague=1;
        22: plague=1;
        23: plague=1;
        24: plague=0;
        25: plague=0;
        26: plague=0;
        27: plague=0;
        28: plague=0;
        29: plague=1;
        30: plague=0;
        31: plague=0;
      default: plague=0;
      endcase
    end
  end

// AND all of these bits together
always @(gnd or seashell or norbert or rescue or gerard or gnd or bfs or norbert or dillweed)
  begin
      automounter = & {gnd,seashell,norbert,rescue,gerard,gnd,bfs,norbert,dillweed};
  end

reg feedback_pt_191;

always @(pork or feedback_pt_191)
  begin
      boing = !pork | !feedback_pt_191;
  end

reg feedback_pt_192;

always @(draco or feedback_pt_192)
  begin
      ykocens = !draco ^ !feedback_pt_192;
  end

reg feedback_pt_193;

always @(boing or feedback_pt_193)
  begin
      pixie =  boing &  feedback_pt_193;
  end

reg feedback_pt_194;

always @(gnd or feedback_pt_194)
  begin
      stix = !gnd &  feedback_pt_194;
  end

reg feedback_pt_195;

always @(salsa or feedback_pt_195)
  begin
      georgec =  salsa ^ !feedback_pt_195;
  end

reg feedback_pt_196;

always @(correctness or feedback_pt_196)
  begin
      tango_loud = !correctness | !feedback_pt_196;
  end

reg feedback_pt_197;

always @(lafondue or feedback_pt_197)
  begin
      cluckU_fuji = !lafondue |  feedback_pt_197;
  end

reg feedback_pt_198;

always @(vcc or feedback_pt_198)
  begin
      criminal_newt =  vcc ^ !feedback_pt_198;
  end

wire sun_milhouse_wire;

dffea sun_milhouse_ff (
  .clk(clock0),
  .d(wancensorcens),
  .ena(tan_nodes),
  .adata(centaur),
  .clrn(!reset0),
  .q(sun_milhouse_wire)
);

always @(sun_milhouse_wire) begin
   condit_yak = sun_milhouse_wire;
end

always @(condit_yak)
  begin
      feedback_pt_191 = condit_yak;
  end

wire bomb_yak_wire;

dffeas bomb_yak_ff (
  .clk(clock0),
  .d(crucio),
  .ena(pcp),
  .sclr(gnd),
  .sload(stix),
  .asdata(gerrit),
  .clrn(!reset0),
  .q(bomb_yak_wire)
);

always @(bomb_yak_wire) begin
   romex_dingbat = bomb_yak_wire;
end

always @(romex_dingbat)
  begin
      feedback_pt_192 = romex_dingbat;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sand_baron <= 0;
    else
      sand_baron <= umbridge;
  end

always @(sand_baron)
  begin
      feedback_pt_193 = sand_baron;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nyc_rubeus <= 1;
    else
      nyc_rubeus <= priest;
  end

always @(nyc_rubeus)
  begin
      feedback_pt_194 = nyc_rubeus;
  end

wire protest_bfs_wire;

dffeas protest_bfs_ff (
  .clk(clock0),
  .d(seashell),
  .ena(tango_loud),
  .sclr(gnd),
  .sload(plague),
  .asdata(zi),
  .clrn(!reset0),
  .q(protest_bfs_wire)
);

always @(protest_bfs_wire) begin
   danger_star = protest_bfs_wire;
end

always @(danger_star)
  begin
      feedback_pt_195 = danger_star;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cain_jupiter <= 0;
    else if (vcc)
      cain_jupiter <= feynman;
    else if (wancensorcens)
      cain_jupiter <= 0;
  end

always @(cain_jupiter)
  begin
      feedback_pt_196 = cain_jupiter;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peace_boots <= 1;
    else
      peace_boots <= bonafide;
  end

always @(peace_boots)
  begin
      feedback_pt_197 = peace_boots;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kang_usa <= 0;
    else if (gnd)
      kang_usa <= 0;
    else if (danger_star)
      kang_usa <= pixie;
  end

always @(kang_usa)
  begin
      feedback_pt_198 = kang_usa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tango_saturn <= 0;
    else if (bacon)
      tango_saturn <= siamese;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      desade_touch <= 1;
    else
      desade_touch <= gerard;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bust_doobie <= 0;
    else
      bust_doobie <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salmon_mickey <= 0;
    else
      salmon_mickey <= beast;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atilla_sheep <= 0;
    else
      atilla_sheep <= boing;
  end

wire gin_kdqcens_wire;

dffea gin_kdqcens_ff (
  .clk(clock0),
  .d(lagoon),
  .ena(tesla),
  .adata(vcc),
  .clrn(!reset0),
  .q(gin_kdqcens_wire)
);

always @(gin_kdqcens_wire) begin
   atchoo_deng = gin_kdqcens_wire;
end

// 2s comp negate A
always @(gnd or lagoon or vcc or pasta or tapered or kang_usa or waffle or tango_saturn)
  begin
    {salsa_hulk,zulu_hagrid,winner_bambi,weevil_tako,elguapo_marco,china_ham,cheese_tobiko,weevil_prison} = - {gnd,lagoon,vcc,pasta,tapered,kang_usa,waffle,tango_saturn};
  end

// A + const
always @(gnd or vcc or flyingmonkey or desade_touch or deruyter or gnd or gnd)
  begin
    {pork_eel,barnum_fufu,thedon_goofy,Iwin_odin,skinner_ohno,jiminy_fear,boots_sanity} = {gnd,vcc,flyingmonkey,desade_touch,deruyter,gnd,gnd} + 241;
  end

// 5 bit add sub
always @(vcc or Iwin_odin or wheezer or booming or vcc or elguapo_marco or cain_jupiter or microscope or vcc or cluckU_fuji)
  begin
    {jupiter_ceres,east_zealot,yankee_huey,stoner_zed,aphid_bullet} = 
		({vcc,Iwin_odin,wheezer,booming,vcc} ^ 200) + 
		({elguapo_marco,cain_jupiter,microscope,vcc,cluckU_fuji} ^ 5);
  end

// 3 to 3 bit A*Const mult
reg signed [2:0] bach_onion;
always @(uomcensor or romex_dingbat or gnd) begin
  bach_onion = {uomcensor,romex_dingbat,gnd};
end

always @(bach_onion)
  begin
      {chuck_golf,hurt_saturn,foxtrot_ring} = 
	  	  bach_onion * 
		  52;
  end

reg feedback_pt_199;

always @(jupiter_ceres or feedback_pt_199)
  begin
      red_barty =  jupiter_ceres | !feedback_pt_199;
  end

reg feedback_pt_200;

always @(uomcensor or feedback_pt_200)
  begin
      nyc_foliage = !uomcensor |  feedback_pt_200;
  end

reg feedback_pt_201;

always @(vcc or feedback_pt_201)
  begin
      pluto_exodus = !vcc |  feedback_pt_201;
  end

reg feedback_pt_202;

always @(foxtrot_ring or feedback_pt_202)
  begin
      shark_avon =  foxtrot_ring ^ !feedback_pt_202;
  end

reg feedback_pt_203;

always @(bust_doobie or feedback_pt_203)
  begin
      marge_killme =  bust_doobie | !feedback_pt_203;
  end

reg feedback_pt_204;

always @(schwinger or feedback_pt_204)
  begin
      ostrich_gap =  schwinger &  feedback_pt_204;
  end

reg feedback_pt_205;

always @(east_zealot or feedback_pt_205)
  begin
      helena_sinus = !east_zealot ^ !feedback_pt_205;
  end

reg feedback_pt_206;

always @(willy or feedback_pt_206)
  begin
      cluckU_klaas =  willy &  feedback_pt_206;
  end

reg feedback_pt_207;

always @(whatelse or feedback_pt_207)
  begin
      pizza_popacap =  whatelse ^ !feedback_pt_207;
  end

reg feedback_pt_208;

always @(cluckU_klaas or feedback_pt_208)
  begin
      odin_hotdog =  cluckU_klaas ^  feedback_pt_208;
  end

reg feedback_pt_209;

always @(flyingmonkey or feedback_pt_209)
  begin
      goblin_romex =  flyingmonkey | !feedback_pt_209;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iguana_bullet <= 1;
    else
      iguana_bullet <= wildboar;
  end

always @(iguana_bullet)
  begin
      feedback_pt_199 = iguana_bullet;
  end

always @(iguana_bullet)
  begin
      feedback_pt_200 = iguana_bullet;
  end

always @(iguana_bullet)
  begin
      feedback_pt_201 = iguana_bullet;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tofu_leidiot <= 1;
    else
      tofu_leidiot <= nyc_foliage;
  end

always @(tofu_leidiot)
  begin
      feedback_pt_202 = tofu_leidiot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      turnip_doobie <= 0;
    else if (cheese_tobiko)
      turnip_doobie <= stoner_zed;
  end

always @(turnip_doobie)
  begin
      feedback_pt_203 = turnip_doobie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ibm_chief <= 0;
    else if (flyingmonkey)
      ibm_chief <= weevil_tako;
  end

always @(ibm_chief)
  begin
      feedback_pt_204 = ibm_chief;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      south_norbert <= 0;
    else if (gnd)
      south_norbert <= hurt_saturn;
  end

always @(south_norbert)
  begin
      feedback_pt_205 = south_norbert;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gerrit_gyro <= 1;
    else
      gerrit_gyro <= vcc;
  end

always @(gerrit_gyro)
  begin
      feedback_pt_206 = gerrit_gyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hans_kungfu <= 0;
    else
      hans_kungfu <= salsa;
  end

always @(hans_kungfu)
  begin
      feedback_pt_207 = hans_kungfu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floo_xray <= 1;
    else
      floo_xray <= vcc;
  end

always @(floo_xray)
  begin
      feedback_pt_208 = floo_xray;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      solder_troll <= 1;
    else
      solder_troll <= jiminy_fear;
  end

always @(solder_troll)
  begin
      feedback_pt_209 = solder_troll;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pyro_kmfdm <= 0;
    else if (boing)
      pyro_kmfdm <= vangoh;
    else if (iguana_bullet)
      pyro_kmfdm <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      copper_beef <= 0;
    else if (bep)
      copper_beef <= castaway;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stoner_saturn <= 0;
    else if (bamboo)
      stoner_saturn <= pyro_kmfdm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      maki_hp <= 0;
    else if (hans_kungfu)
      maki_hp <= 0;
    else if (tapered)
      maki_hp <= winner_bambi;
  end

wire advil_rose_wire;

dffeas advil_rose_ff (
  .clk(clock0),
  .d(vcc),
  .ena(weevil_prison),
  .sclr(weevil_prison),
  .sload(ibm_chief),
  .asdata(goblin_romex),
  .clrn(!reset0),
  .q(advil_rose_wire)
);

always @(advil_rose_wire) begin
   spirit_shuda = advil_rose_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ohisee_malfoy <= 0;
    else
      ohisee_malfoy <= sand_baron;
  end

// data words for bus muxing
wire [22:0] moody_opus_word0_data;
wire [22:0] moody_opus_word1_data;
wire [22:0] moody_opus_word2_data;
wire [22:0] moody_opus_word3_data;
wire [22:0] moody_opus_word4_data;
wire [22:0] moody_opus_word5_data;
wire [22:0] moody_opus_word6_data;
wire [22:0] moody_opus_word7_data;
assign moody_opus_word0_data = {east_zealot,pizza_popacap,aphid_bullet,helena_sinus,tofu_leidiot,tofu_leidiot,gnd,boots_sanity,stoner_zed,pluto_exodus,copper_beef,boing,pork_eel,south_norbert,gnd,criminal_newt,salsa_hulk,gnd,gnd,barnum_fufu,gnd,pluto_exodus,gnd};
assign moody_opus_word1_data = {vcc,cluckU_fuji,vcc,vcc,erasmus,condit_yak,fortuyn,leeuwenhoek,vcc,ibm_chief,wukong,peace_boots,ykocens,red_barty,dirk,red_barty,blackbeans,norbert,china_ham,yankee_huey,gnd,tofu_leidiot,maki_hp};
assign moody_opus_word2_data = {gnd,albus,thedon_goofy,erasmus,red_barty,vcc,vcc,gnd,turnip_doobie,maki_hp,floo_xray,vcc,peace_boots,china_ham,dirk,automounter,gnd,chuck_golf,gerrit,phoenix,thedon_goofy,gnd,solder_troll};
assign moody_opus_word3_data = {hurt_saturn,ostrich_gap,gnd,vcc,zulu_hagrid,hurt_saturn,nyc_rubeus,turnip_doobie,china_ham,vcc,gnd,jupiter_ceres,south_norbert,stirfry,wancensorcens,odin_hotdog,solder_troll,leeuwenhoek,georgec,georgec,fronds,spastic,fronds};
assign moody_opus_word4_data = {boots_sanity,hinkley,vcc,red_barty,nyc_rubeus,winner_bambi,deruyter,vcc,vcc,spastic,gnd,weevil_tako,stoner_saturn,shark_avon,shark_avon,condit_yak,jiminy_fear,stirfry,gnd,solder_troll,vcc,automounter,ostrich_gap};
assign moody_opus_word5_data = {gnd,boots_sanity,stirfry,spirit_shuda,deruyter,Iwin_odin,odin_hotdog,gnd,leeuwenhoek,odin_hotdog,odin_hotdog,solder_troll,erasmus,vcc,jiminy_fear,phoenix,atchoo_deng,floo_xray,vcc,salmon_mickey,skinner_ohno,jupiter_ceres,marge_killme};
assign moody_opus_word6_data = {floo_xray,automounter,vcc,hinkley,automounter,leeuwenhoek,weevil_tako,hinkley,ohisee_malfoy,nyc_rubeus,jupiter_ceres,china_ham,gnd,spirit_shuda,vcc,atchoo_deng,gnd,china_ham,Iwin_odin,spirit_shuda,automounter,gnd,army_cafe};
assign moody_opus_word7_data = {gnd,whale_ocha,curie_yankee,chillis_avon,gnd,gnd,escape_fish,rojas_bull,sleeping_art,wonton_tonic,hoser_holland,leaky_sanity,ramone_black,gnd,gnd,intuit_voodoo,gnd,spain_stix,gnd,vcc,vcc,oscar_tobiko,deng_tinker};

// select control for bus muxing
wire [4:0] moody_opus_select;
assign moody_opus_select = {shemp_floride,crack_donald,bathroom_elf,troll_lemon,goblin_bear};


// Mux output word
reg [22:0] moody_opus_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    moody_opus_result = moody_opus_word0_data;
    if (moody_opus_select == 26)
        moody_opus_result = 5;

    if (moody_opus_select[3])
        moody_opus_result = moody_opus_word1_data;

    if (moody_opus_select == 22)
        moody_opus_result = moody_opus_word1_data;

    if (moody_opus_select == 31)
        moody_opus_result = 0;

    if (moody_opus_select == 20)
        moody_opus_result = ~moody_opus_word3_data;

    if (moody_opus_select == 8)
        moody_opus_result = moody_opus_word5_data;

    if (moody_opus_select == 4)
        moody_opus_result = 110;

    if (moody_opus_select[3])
        moody_opus_result = moody_opus_word2_data;

end


// Send the out bus back to the world
always @(moody_opus_result)
begin
    parrot_eeevil = moody_opus_result[0];
    quebec_webvan = moody_opus_result[1];
    lsd_turnip = moody_opus_result[2];
    bach_maryann = moody_opus_result[3];
    danger_pig = moody_opus_result[4];
    lotus_sgates = moody_opus_result[5];
    pimpernel_moe = moody_opus_result[6];
    dopey_tattoo = moody_opus_result[7];
    ready_tiger = moody_opus_result[8];
    rasp_stoned = moody_opus_result[9];
    weasley_valve = moody_opus_result[10];
    portnoy_stick = moody_opus_result[11];
    palmer_emails = moody_opus_result[12];
    weevil_solder = moody_opus_result[13];
    isle_fufu = moody_opus_result[14];
    ladder_barnum = moody_opus_result[15];
    guy_steaming = moody_opus_result[16];
    mike_mcnugget = moody_opus_result[17];
    kebab_nyquil = moody_opus_result[18];
    possum_yoda = moody_opus_result[19];
    sweetie_grams = moody_opus_result[20];
    avon_liberace = moody_opus_result[21];
    achilles_lala = moody_opus_result[22];
end

reg feedback_pt_210;

always @(vcc or feedback_pt_210)
  begin
      ajax_too_big = !vcc |  feedback_pt_210;
  end

reg feedback_pt_211;

always @(tofu_leidiot or feedback_pt_211)
  begin
      chillis_willy = !tofu_leidiot & !feedback_pt_211;
  end

reg feedback_pt_212;

always @(sweetie_grams or feedback_pt_212)
  begin
      dow_amex = !sweetie_grams |  feedback_pt_212;
  end

reg feedback_pt_213;

always @(nyc_rubeus or feedback_pt_213)
  begin
      lion_popcorn =  nyc_rubeus ^ !feedback_pt_213;
  end

reg feedback_pt_214;

always @(vcc or feedback_pt_214)
  begin
      kang_bacon =  vcc &  feedback_pt_214;
  end

wire popcorn_advil_wire;

dffeas popcorn_advil_ff (
  .clk(clock0),
  .d(winner_bambi),
  .ena(vcc),
  .sclr(isle_fufu),
  .sload(lion_popcorn),
  .asdata(rasp_stoned),
  .clrn(!reset0),
  .q(popcorn_advil_wire)
);

always @(popcorn_advil_wire) begin
   gerard_kungfu = popcorn_advil_wire;
end

always @(gerard_kungfu)
  begin
      feedback_pt_210 = gerard_kungfu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      whale_malfoy <= 0;
    else if (booming)
      whale_malfoy <= 0;
    else if (bach_maryann)
      whale_malfoy <= possum_yoda;
  end

always @(whale_malfoy)
  begin
      feedback_pt_211 = whale_malfoy;
  end

wire stoned_sake_wire;

dffeas stoned_sake_ff (
  .clk(clock0),
  .d(dow_amex),
  .ena(nyc_rubeus),
  .sclr(quebec_webvan),
  .sload(lsd_turnip),
  .asdata(ajax_too_big),
  .clrn(!reset0),
  .q(stoned_sake_wire)
);

always @(stoned_sake_wire) begin
   tylenol_otter = stoned_sake_wire;
end

always @(tylenol_otter)
  begin
      feedback_pt_212 = tylenol_otter;
  end

wire yankee_hoser_wire;

dffeas yankee_hoser_ff (
  .clk(clock0),
  .d(pimpernel_moe),
  .ena(gnd),
  .sclr(mike_mcnugget),
  .sload(palmer_emails),
  .asdata(tylenol_otter),
  .clrn(!reset0),
  .q(yankee_hoser_wire)
);

always @(yankee_hoser_wire) begin
   bush_wiggles = yankee_hoser_wire;
end

always @(bush_wiggles)
  begin
      feedback_pt_213 = bush_wiggles;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      west_eatem <= 0;
    else if (quebec_webvan)
      west_eatem <= erasmus;
  end

always @(west_eatem)
  begin
      feedback_pt_214 = west_eatem;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kappa_zed <= 0;
    else if (palmer_emails)
      kappa_zed <= gnd;
    else if (south_norbert)
      kappa_zed <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beast_uppers <= 0;
    else if (Iwin_odin)
      beast_uppers <= kappa_zed;
    else if (whale_malfoy)
      beast_uppers <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blue_aphid <= 0;
    else if (isle)
      blue_aphid <= kang_bacon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tasty_ebi <= 0;
    else if (parrot_eeevil)
      tasty_ebi <= vcc;
    else if (vcc)
      tasty_ebi <= 0;
  end

// Tristate output pin with reg feedback
  bufif0 (jonas_falafel,!vcc,!gnd);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(posedge clock0 or posedge reset0) begin
    if (reset0) zulu_eel <= 0;
    else if ( gnd) zulu_eel <=  jonas_falafel;
end

// Tristate output pin with reg feedback
  bufif1 (wildboar_iron, kappa_zed,!gerard_kungfu);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(posedge clock0 or posedge reset0) begin
    if (reset0) madeye_mozart <= 0;
    else if (!gerard_kungfu) madeye_mozart <=  wildboar_iron;
end

// Priority MUX built out of tri buffers;
// None-hot is Z, conflict not possible
  wire [5:0] obiwan_rabbi_dat = {vcc,gnd,gnd,madeye_mozart,vcc};
  wire [5:0] obiwan_rabbi_sel = {chillis_willy,isle_fufu,whale_malfoy,solder_troll,gnd};
  wire [5:0] obiwan_rabbi_ohsel;

  assign obiwan_rabbi_ohsel[0] = obiwan_rabbi_sel[0];
  assign obiwan_rabbi_ohsel[1] = obiwan_rabbi_sel[1] & !obiwan_rabbi_ohsel[0];
  assign obiwan_rabbi_ohsel[2] = obiwan_rabbi_sel[2] & !obiwan_rabbi_ohsel[1] & !obiwan_rabbi_ohsel[0];
  assign obiwan_rabbi_ohsel[3] = obiwan_rabbi_sel[3] & !obiwan_rabbi_ohsel[2] & !obiwan_rabbi_ohsel[1] & !obiwan_rabbi_ohsel[0];
  assign obiwan_rabbi_ohsel[4] = obiwan_rabbi_sel[4] & !obiwan_rabbi_ohsel[3] & !obiwan_rabbi_ohsel[2] & !obiwan_rabbi_ohsel[1] & !obiwan_rabbi_ohsel[0];

  bufif1 (obiwan_rabbi,!obiwan_rabbi_dat[0], obiwan_rabbi_ohsel[0]);
  bufif0 (obiwan_rabbi, obiwan_rabbi_dat[1],!obiwan_rabbi_ohsel[1]);
  bufif1 (obiwan_rabbi,!obiwan_rabbi_dat[2], obiwan_rabbi_ohsel[2]);
  bufif1 (obiwan_rabbi,!obiwan_rabbi_dat[3], obiwan_rabbi_ohsel[3]);
  bufif0 (obiwan_rabbi, obiwan_rabbi_dat[4],!obiwan_rabbi_ohsel[4]);

// Tristate output pin with reg feedback
  bufif1 (tuna_minerva,!gnd,!vcc);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(vcc or tuna_minerva) begin
    if (!vcc) parrot_doc = !tuna_minerva;
    else parrot_doc = gnd;
end

always @(gnd)
  begin
      homerun_stix = !gnd;
  end

always @(vcc)
  begin
      edible_amex = !vcc;
  end

always @(chillis_willy)
  begin
      ham_alpha = !chillis_willy;
  end

always @(edible_amex)
  begin
      moody_noah = !edible_amex;
  end

always @(homerun_stix)
  begin
      hagrid_neon = !homerun_stix;
  end

always @(weasley_valve)
  begin
      diagon_willy = !weasley_valve;
  end

always @(hagrid_neon)
  begin
      uppers_speed = !hagrid_neon;
  end

always @(lion_popcorn)
  begin
      pentium_tin = !lion_popcorn;
  end

always @(madeye_mozart)
  begin
      oscar_parrot = !madeye_mozart;
  end

reg feedback_pt_215;

always @(gnd or feedback_pt_215)
  begin
      spain_loser = !gnd |  feedback_pt_215;
  end

reg feedback_pt_216;

always @(isle or feedback_pt_216)
  begin
      elian_romeo = !isle & !feedback_pt_216;
  end

reg feedback_pt_217;

always @(gnd or feedback_pt_217)
  begin
      dingbat_palm = !gnd ^  feedback_pt_217;
  end

reg feedback_pt_218;

always @(vcc or feedback_pt_218)
  begin
      superman_ebi = !vcc & !feedback_pt_218;
  end

reg feedback_pt_219;

always @(west_eatem or feedback_pt_219)
  begin
      grumby_lucent = !west_eatem | !feedback_pt_219;
  end

wire flew_bison_wire;

dffeas flew_bison_ff (
  .clk(clock0),
  .d(vcc),
  .ena(dopey_tattoo),
  .sclr(diagon_willy),
  .sload(spain_loser),
  .asdata(isle),
  .clrn(!reset0),
  .q(flew_bison_wire)
);

always @(flew_bison_wire) begin
   troll_uppers = flew_bison_wire;
end

always @(troll_uppers)
  begin
      feedback_pt_215 = troll_uppers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dingbat_tesla <= 0;
    else if (dow_amex)
      dingbat_tesla <= blue_aphid;
    else if (vcc)
      dingbat_tesla <= 0;
  end

always @(dingbat_tesla)
  begin
      feedback_pt_216 = dingbat_tesla;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      homerun_echo <= 0;
    else
      homerun_echo <= possum_yoda;
  end

always @(homerun_echo)
  begin
      feedback_pt_217 = homerun_echo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moulin_crank <= 0;
    else
      moulin_crank <= elian_romeo;
  end

always @(moulin_crank)
  begin
      feedback_pt_218 = moulin_crank;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      otter_kedavra <= 0;
    else if (bush_wiggles)
      otter_kedavra <= 0;
    else if (gnd)
      otter_kedavra <= vcc;
  end

always @(otter_kedavra)
  begin
      feedback_pt_219 = otter_kedavra;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kana_zi <= 0;
    else if (gnd)
      kana_zi <= 0;
    else if (troll_uppers)
      kana_zi <= pentium_tin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      saturn_simasu <= 0;
    else if (pentium_tin)
      saturn_simasu <= isle;
    else if (achilles_lala)
      saturn_simasu <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ready_centaur <= 0;
    else if (vcc)
      ready_centaur <= 0;
    else if (uppers_speed)
      ready_centaur <= isle_fufu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rojas_tobe <= 0;
    else if (uppers_speed)
      rojas_tobe <= ready_tiger;
    else if (superman_ebi)
      rojas_tobe <= 0;
  end

wire goofy_kappa_wire;

dffeas goofy_kappa_ff (
  .clk(clock0),
  .d(troll_uppers),
  .ena(portnoy_stick),
  .sclr(vcc),
  .sload(danger_pig),
  .asdata(dingbat_tesla),
  .clrn(!reset0),
  .q(goofy_kappa_wire)
);

always @(goofy_kappa_wire) begin
   hoser_zen = goofy_kappa_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marco_freaky <= 0;
    else if (blue_aphid)
      marco_freaky <= ready_tiger;
    else if (tasty_ebi)
      marco_freaky <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zebra_lad <= 0;
    else if (avon_liberace)
      zebra_lad <= saturn_simasu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yellow_wine <= 0;
    else if (vcc)
      yellow_wine <= saturn_simasu;
    else if (mike_mcnugget)
      yellow_wine <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wine_sand <= 1;
    else
      wine_sand <= mike_mcnugget;
  end

reg feedback_pt_220;

always @(dopey_tattoo or feedback_pt_220)
  begin
      curly_fear =  dopey_tattoo | !feedback_pt_220;
  end

reg feedback_pt_221;

always @(Iwin_odin or feedback_pt_221)
  begin
      kmfdm_school =  Iwin_odin |  feedback_pt_221;
  end

reg feedback_pt_222;

always @(beast_uppers or feedback_pt_222)
  begin
      ocha_hercules = !beast_uppers |  feedback_pt_222;
  end

reg feedback_pt_223;

always @(vcc or feedback_pt_223)
  begin
      gin_ceres = !vcc ^ !feedback_pt_223;
  end

reg feedback_pt_224;

always @(vcc or feedback_pt_224)
  begin
      tonic_dutch =  vcc | !feedback_pt_224;
  end

reg feedback_pt_225;

always @(curly_fear or feedback_pt_225)
  begin
      midas_hippo =  curly_fear | !feedback_pt_225;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [7:0] tesla_scrooge_dout;
nut_000_word_swap #(8, 7) nut_000_word_swap_inst_tesla_scrooge (
  .data_in({vcc,floo_xray,zebra_lad,superman_ebi,parrot_doc,dow_amex,ready_centaur,gnd,guy_steaming,pentium_tin,otter_kedavra,kebab_nyquil,mike_mcnugget,marco_freaky,vcc,gnd,curly_fear,kana_zi,vcc,quebec_webvan,gnd,gnd,south_norbert,saturn_simasu,ham_alpha,moody_noah,zulu_eel,dingbat_palm,wine_sand,vcc,booming,gnd,gnd,curly_fear,guy_steaming,gnd,dingbat_tesla,south_norbert,hoser_zen,tonic_dutch,willem,oscar_parrot,yellow_wine,floo_xray,yellow_wine,gnd,grumby_lucent,midas_hippo,hoser_zen,booming,gnd,ocha_hercules,kmfdm_school,gnd,moody_noah,vcc}),
  .index_a({gnd,rojas_tobe,homerun_echo,gnd,homerun_echo,avon_liberace,edible_amex,willem}),
  .index_b({yellow_wine,edible_amex,booming,curly_fear,gnd,superman_ebi,vcc,vcc}),
  .data_out(tesla_scrooge_dout)
);

always @(tesla_scrooge_dout)
begin
   {moody_zhuang,whiskey_alpha,howell_malfoy,sears_george,cybex_air,trevor_jiminy,dorkus_marge,moe_carolina,doc_bathroom,fury_saturn,hiway_jesus,bison_mexican,wanton_flew,killer_ready,stemcell_zed,valve_loud,viagra_filch,peaves_dutch,tabby_guy,bacon_gyro,ready_chips,copper_gerrit,water_foryou,show_mrbill,tin_lestrange,draco_october,clay_yohimbe,beef_covad,curious_moron,chief_bambi,rat_wakey,aspirin_ritsu,tonks_snake,what_husks,newt_sirius,crack_lamer,egg_homer,fear_star,rojas_kungfu,solder_issac,kabar_whiskey,eel_zinc,pluto_psycho,yak_brothers,moreand_willy,ajax_psycho,hp_eeevil,mushroom_dork,boots_yellow,oscar_bonker,bomb_yohimbe,sun_tesla,metal_dog,tabby_moses,kanji_uppers,nobody_zeus} = tesla_scrooge_dout;
end

reg feedback_pt_226;

always @(egg_homer or feedback_pt_226)
  begin
      pdiddy_dirty = !egg_homer | !feedback_pt_226;
  end

reg feedback_pt_227;

always @(ajax_psycho or feedback_pt_227)
  begin
      neville_beef =  ajax_psycho ^ !feedback_pt_227;
  end

reg feedback_pt_228;

always @(peaves_dutch or feedback_pt_228)
  begin
      whacky_husks =  peaves_dutch ^ !feedback_pt_228;
  end

reg feedback_pt_229;

always @(sun_tesla or feedback_pt_229)
  begin
      shark_palm =  sun_tesla & !feedback_pt_229;
  end

reg feedback_pt_230;

always @(wine_sand or feedback_pt_230)
  begin
      loud_ariel = !wine_sand ^  feedback_pt_230;
  end

reg feedback_pt_231;

always @(gnd or feedback_pt_231)
  begin
      fortuyn_heidi = !gnd | !feedback_pt_231;
  end

reg feedback_pt_232;

always @(gnd or feedback_pt_232)
  begin
      mushroom_zed =  gnd | !feedback_pt_232;
  end

reg feedback_pt_233;

always @(tabby_moses or feedback_pt_233)
  begin
      brian_zulu = !tabby_moses | !feedback_pt_233;
  end

reg feedback_pt_234;

always @(whiskey_alpha or feedback_pt_234)
  begin
      priest_echo = !whiskey_alpha | !feedback_pt_234;
  end

reg feedback_pt_235;

always @(gnd or feedback_pt_235)
  begin
      dork_love_in = !gnd ^  feedback_pt_235;
  end

reg feedback_pt_236;

always @(gnd or feedback_pt_236)
  begin
      kang_tsmc = !gnd | !feedback_pt_236;
  end

reg feedback_pt_237;

always @(water_foryou or feedback_pt_237)
  begin
      boots_cuckoo = !water_foryou &  feedback_pt_237;
  end

reg feedback_pt_238;

always @(mushroom_dork or feedback_pt_238)
  begin
      cybex_saturn = !mushroom_dork &  feedback_pt_238;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skipper_happy <= 0;
    else if (doc_bathroom)
      skipper_happy <= 0;
    else if (fury_saturn)
      skipper_happy <= mushroom_zed;
  end

always @(skipper_happy)
  begin
      feedback_pt_220 = skipper_happy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      what_peta <= 1;
    else
      what_peta <= wine_sand;
  end

always @(what_peta)
  begin
      feedback_pt_221 = what_peta;
  end

always @(what_peta)
  begin
      feedback_pt_222 = what_peta;
  end

always @(what_peta)
  begin
      feedback_pt_223 = what_peta;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      midas_trevor <= 0;
    else
      midas_trevor <= vcc;
  end

always @(midas_trevor)
  begin
      feedback_pt_224 = midas_trevor;
  end

always @(midas_trevor)
  begin
      feedback_pt_225 = midas_trevor;
  end

always @(midas_trevor)
  begin
      feedback_pt_226 = midas_trevor;
  end

always @(midas_trevor)
  begin
      feedback_pt_227 = midas_trevor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      donkey_genji <= 0;
    else if (beef_covad)
      donkey_genji <= vcc;
    else if (howell_malfoy)
      donkey_genji <= 0;
  end

always @(donkey_genji)
  begin
      feedback_pt_228 = donkey_genji;
  end

always @(donkey_genji)
  begin
      feedback_pt_229 = donkey_genji;
  end

always @(donkey_genji)
  begin
      feedback_pt_230 = donkey_genji;
  end

always @(donkey_genji)
  begin
      feedback_pt_231 = donkey_genji;
  end

always @(donkey_genji)
  begin
      feedback_pt_232 = donkey_genji;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      starwars_gyro <= 0;
    else if (hp_eeevil)
      starwars_gyro <= 0;
    else if (hp_eeevil)
      starwars_gyro <= moreand_willy;
  end

always @(starwars_gyro)
  begin
      feedback_pt_233 = starwars_gyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      century_biker <= 0;
    else if (south_norbert)
      century_biker <= 0;
    else if (vcc)
      century_biker <= homerun_echo;
  end

always @(century_biker)
  begin
      feedback_pt_234 = century_biker;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dow_rubeus <= 0;
    else
      dow_rubeus <= pluto_psycho;
  end

always @(dow_rubeus)
  begin
      feedback_pt_235 = dow_rubeus;
  end

wire bush_gutter_wire;

dffeas bush_gutter_ff (
  .clk(clock0),
  .d(hiway_jesus),
  .ena(hiway_jesus),
  .sclr(tin_lestrange),
  .sload(vcc),
  .asdata(donkey_genji),
  .clrn(!reset0),
  .q(bush_gutter_wire)
);

always @(bush_gutter_wire) begin
   sun_wannabe = bush_gutter_wire;
end

always @(sun_wannabe)
  begin
      feedback_pt_236 = sun_wannabe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      guy_ykocens <= 0;
    else if (neville_beef)
      guy_ykocens <= 0;
    else if (otter_kedavra)
      guy_ykocens <= moody_noah;
  end

always @(guy_ykocens)
  begin
      feedback_pt_237 = guy_ykocens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sake_ocha <= 0;
    else if (moody_noah)
      sake_ocha <= 0;
    else if (nobody_zeus)
      sake_ocha <= egg_homer;
  end

always @(sake_ocha)
  begin
      feedback_pt_238 = sake_ocha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oscar_gin <= 0;
    else if (gnd)
      oscar_gin <= 0;
    else if (gnd)
      oscar_gin <= tin_lestrange;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nasdaq_iron <= 0;
    else
      nasdaq_iron <= shark_palm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      po_killme <= 0;
    else
      po_killme <= century_biker;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zinc_bust <= 0;
    else
      zinc_bust <= howell_malfoy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      joker_gotone <= 0;
    else if (cybex_air)
      joker_gotone <= kanji_uppers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rojas_norbert <= 0;
    else
      rojas_norbert <= gnd;
  end

wire iguana_buddha_wire;

dffeas iguana_buddha_ff (
  .clk(clock0),
  .d(viagra_filch),
  .ena(vcc),
  .sclr(show_mrbill),
  .sload(vcc),
  .asdata(bacon_gyro),
  .clrn(!reset0),
  .q(iguana_buddha_wire)
);

always @(iguana_buddha_wire) begin
   otter_hotel = iguana_buddha_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      books_gojira <= 0;
    else if (joker_gotone)
      books_gojira <= 0;
    else if (nasdaq_iron)
      books_gojira <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tiger_drugs <= 0;
    else if (sears_george)
      tiger_drugs <= vcc;
    else if (mushroom_zed)
      tiger_drugs <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pdaddy_powder <= 0;
    else if (tabby_guy)
      pdaddy_powder <= 0;
    else if (dork_love_in)
      pdaddy_powder <= whiskey_alpha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beauty_coffee <= 1;
    else
      beauty_coffee <= midas_trevor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tabasco_snape <= 0;
    else
      tabasco_snape <= whiskey_alpha;
  end

reg feedback_pt_239;

always @(copper_gerrit or feedback_pt_239)
  begin
      quail_minnie =  copper_gerrit ^ !feedback_pt_239;
  end

reg feedback_pt_240;

always @(hiway_jesus or feedback_pt_240)
  begin
      barney_cannon = !hiway_jesus & !feedback_pt_240;
  end

reg feedback_pt_241;

always @(rojas_kungfu or feedback_pt_241)
  begin
      ghost_asahi = !rojas_kungfu | !feedback_pt_241;
  end

reg feedback_pt_242;

always @(otter_hotel or feedback_pt_242)
  begin
      pirate_mrbill =  otter_hotel & !feedback_pt_242;
  end

reg feedback_pt_243;

always @(priest_echo or feedback_pt_243)
  begin
      black_intuit =  priest_echo ^  feedback_pt_243;
  end

reg feedback_pt_244;

always @(ready_chips or feedback_pt_244)
  begin
      atomic_lad = !ready_chips ^ !feedback_pt_244;
  end

reg feedback_pt_245;

always @(pirate_mrbill or feedback_pt_245)
  begin
      shark_peace = !pirate_mrbill & !feedback_pt_245;
  end

reg feedback_pt_246;

always @(superman_ebi or feedback_pt_246)
  begin
      suffering_gm = !superman_ebi &  feedback_pt_246;
  end

reg feedback_pt_247;

always @(starwars_gyro or feedback_pt_247)
  begin
      spyro_lima =  starwars_gyro ^  feedback_pt_247;
  end

reg feedback_pt_248;

always @(gnd or feedback_pt_248)
  begin
      lao_beef =  gnd |  feedback_pt_248;
  end

reg feedback_pt_249;

always @(curious_moron or feedback_pt_249)
  begin
      todd_malfoy = !curious_moron ^ !feedback_pt_249;
  end

reg feedback_pt_250;

always @(otter_hotel or feedback_pt_250)
  begin
      hulk_booming =  otter_hotel & !feedback_pt_250;
  end

reg feedback_pt_251;

always @(sake_ocha or feedback_pt_251)
  begin
      eunice_eunice = !sake_ocha |  feedback_pt_251;
  end

reg feedback_pt_252;

always @(vcc or feedback_pt_252)
  begin
      marco_thread = !vcc |  feedback_pt_252;
  end

// 7 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {dopey_bomb,ebi_bubba,roid_kungfu,hans_ritsu,rewire_bubba,wildboar_mao,money_donut} <= 0;
    else if (sanity_fallen)
      {dopey_bomb,ebi_bubba,roid_kungfu,hans_ritsu,rewire_bubba,wildboar_mao,money_donut} <= {dopey_bomb,ebi_bubba,roid_kungfu,hans_ritsu,rewire_bubba,wildboar_mao,money_donut} + 92;
    else
      {dopey_bomb,ebi_bubba,roid_kungfu,hans_ritsu,rewire_bubba,wildboar_mao,money_donut} <= {dopey_bomb,ebi_bubba,roid_kungfu,hans_ritsu,rewire_bubba,wildboar_mao,money_donut} - 153;
  end

// Ternary sign extend bait
always @(freaky_amex or freaky_amex or freaky_amex or freaky_amex or tango_would or vcc or show_bacon or coffee_wujing or purple_maki or yoda_kangaroo or vcc or
         waffle_midas or waffle_midas or waffle_midas or waffle_midas or waffle_midas or waffle_midas or waffle_midas or master_elf or lala_agitator or banshee_think or vcc or
         wizard_norris or wizard_norris or wizard_norris or wizard_norris or wizard_norris or black_kebab or vcc or cartman_hurt or baron_juliet or martin_bolt or bush_kbtoys)
  begin
    {mideast_bolt,minnow_marco,hurt_rose,hours_green,venus_elian,pyro_zipporah,killer_marker,snake_marco,bubba_peta,honda_pdaddy,midas_macys} = 
        {freaky_amex,freaky_amex,freaky_amex,freaky_amex,tango_would,vcc,show_bacon,coffee_wujing,purple_maki,yoda_kangaroo,vcc} +
        {waffle_midas,waffle_midas,waffle_midas,waffle_midas,waffle_midas,waffle_midas,waffle_midas,master_elf,lala_agitator,banshee_think,vcc} +
        {wizard_norris,wizard_norris,wizard_norris,wizard_norris,wizard_norris,black_kebab,vcc,cartman_hurt,baron_juliet,martin_bolt,bush_kbtoys};
  end

// Greater Equal Less compare
always @(vcc or gnd or zed_orange or drevil_spirit or ulysses_nyc or vcc or gnd or mine_ostrich or art_zed or what_intel or gopher_minnow or neon_snape)
  begin
    if ({vcc,gnd,zed_orange,drevil_spirit,ulysses_nyc,vcc} > {gnd,mine_ostrich,art_zed,what_intel,gopher_minnow,neon_snape})
       {rufus_advil,zedong_lucius,sake_bullet} = 3'b100;
    else if ({vcc,gnd,zed_orange,drevil_spirit,ulysses_nyc,vcc} < {gnd,mine_ostrich,art_zed,what_intel,gopher_minnow,neon_snape})
       {rufus_advil,zedong_lucius,sake_bullet} = 3'b010;
    else
       {rufus_advil,zedong_lucius,sake_bullet} = 3'b001;
  end

always @(gnd)
  begin
      foryou_rubik = !gnd;
  end

always @(vcc)
  begin
      chairman_bfs = !vcc;
  end

always @(what_peta)
  begin
      sgates_thedon = !what_peta;
  end

always @(vcc)
  begin
      hulk_atomic = !vcc;
  end

always @(atomic_lad)
  begin
      peace_broom = !atomic_lad;
  end

always @(hours_green)
  begin
      boing_illegal = !hours_green;
  end

always @(books_gojira)
  begin
      nobody_martin = !books_gojira;
  end

always @(trevor_jiminy)
  begin
      kang_minnie = !trevor_jiminy;
  end

always @(moody_zhuang)
  begin
      fortuyn_lamer = !moody_zhuang;
  end

always @(vcc)
  begin
      pacific_asahi = !vcc;
  end

always @(gnd)
  begin
      todd_pictures = !gnd;
  end

always @(kang_tsmc)
  begin
      thedon_potato = !kang_tsmc;
  end

always @(pyro_zipporah)
  begin
      holland_haze = !pyro_zipporah;
  end

always @(ebi_bubba)
  begin
      wujing_xray = !ebi_bubba;
  end

always @(floo_xray)
  begin
      dopey_sinew = !floo_xray;
  end

always @(vcc)
  begin
      advil_cow = !vcc;
  end

always @(gnd)
  begin
      platinum_haze = !gnd;
  end

always @(kebab_nyquil)
  begin
      fire_waster = !kebab_nyquil;
  end

always @(stemcell_zed)
  begin
      iterate_sugar = !stemcell_zed;
  end

always @(draco_october)
  begin
      amex_potter = !draco_october;
  end

always @(rojas_norbert)
  begin
      thor_cucumber = !rojas_norbert;
  end

always @(vcc)
  begin
      loud_chiptrip = !vcc;
  end

always @(kabar_whiskey)
  begin
      south_toysrus = !kabar_whiskey;
  end

always @(kang_minnie)
  begin
      echo_eggsalad = !kang_minnie;
  end

always @(oscar_gin)
  begin
      cain_intel = !oscar_gin;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [6:0] monkey_whale_dout;
nut_000_word_swap #(7, 14) nut_000_word_swap_inst_monkey_whale (
  .data_in({eunice_eunice,gnd,marco_thread,brian_zulu,south_toysrus,rufus_advil,sgates_thedon,honda_pdaddy,marco_thread,bison_mexican,cain_intel,rojas_kungfu,rat_wakey,wanton_flew,cain_intel,dow_rubeus,sun_tesla,otter_kedavra,vcc,priest_echo,holland_haze,barney_cannon,moe_carolina,gnd,tabasco_snape,vcc,mideast_bolt,whacky_husks,quebec_webvan,homerun_echo,donkey_genji,thedon_potato,gnd,aspirin_ritsu,black_intuit,vcc,tiger_drugs,boots_yellow,killer_marker,vcc,rewire_bubba,money_donut,cybex_saturn,pacific_asahi,vcc,vcc,fire_waster,wujing_xray,quail_minnie,gnd,ajax_psycho,solder_issac,vcc,loud_ariel,gnd,gnd,newt_sirius,spyro_lima,vcc,chief_bambi,foryou_rubik,quail_minnie,sun_tesla,pacific_asahi,venus_elian,avon_liberace,lao_beef,vcc,vcc,wujing_xray,midas_macys,venus_elian,hulk_atomic,moody_zhuang,viagra_filch,vcc,vcc,vcc,suffering_gm,skipper_happy,pdiddy_dirty,mushroom_zed,midas_macys,vcc,hans_ritsu,pdaddy_powder,gnd,guy_ykocens,yak_brothers,amex_potter,hurt_rose,suffering_gm,pdaddy_powder,po_killme,vcc,gnd,hurt_rose,boing_illegal}),
  .index_a({dopey_bomb,south_norbert,boots_yellow,rat_wakey,moody_zhuang,hiway_jesus,spyro_lima}),
  .index_b({bubba_peta,rewire_bubba,copper_gerrit,vcc,aspirin_ritsu,fortuyn_lamer,sun_tesla}),
  .data_out(monkey_whale_dout)
);

always @(monkey_whale_dout)
begin
   {homerun_deng,dragon_malfoy,india_squad,sanity_tarzan,concorde_show,covad_ocha,weevil_money,loser_echo,potter_thor,money_fortuyn,blue_carolina,hanger_lizard,gregg_a_lovey,gap_tamago,genji_stirfry,fish_waffle,daughter_sake,oscar_too_big,dork_rouge,jonas_rocks,husks_gotone,klaas_diagon,jcrew_cow,rarest_emails,kanji_clay,concorde_bart,master_bamboo,att_launcher,surfer_tuna,dig_shark,illegal_rod,vegas_peace,beef_shuda,soccer_speed,zhuang_drugie,falafel_sun,quebec_lovey,potato_rod,south_nasdaq,malfoy_boing,yankees_heidi,giraffe_huey,bono_homer,pig_fear,curly_baron,loser_curious,obiwan_quail,bravo_haze,rasp_bubba,dork_dingbat,drugie_pilot,tsmc_safada,ford_comtrex,snort_jinyong,bert_south,art_norbert,legos_tofu,ladder_pyro,hotdog_sgates,life_lao,palm_haze,boitano_brian,hippo_mozart,nest_crank,roid_odin,due_tango,goofy_bach,fufu_minnow,trevor_wanton,freaky_marco,lagoon_broom,tinker_sheep,lizard_kanji,foxtrot_sears,sheep_bart,air_monkey,chief_peta,west_powder,jacob_malfoy,dimetap_bagel,neville_po,trevor_thread,zen_tako,curie_macys,exodus_lima,nasdaq_ebay,zulu_baron,fury_beast,peaves_squad,fury_grams,lotus_golf,rocks_ohisee,jonas_monster,ginger_tsmc,hotel_macys,roe_abraham,tinker_george,pig_budlite} = monkey_whale_dout;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [6:0] honda_elf_dout;
nut_000_word_swap #(7, 8) nut_000_word_swap_inst_honda_elf (
  .data_in({gnd,valve_loud,vcc,money_donut,rewire_bubba,fury_grams,dork_love_in,vcc,obiwan_quail,west_powder,sgates_thedon,curie_macys,killer_ready,tinker_george,potter_thor,moe_carolina,gnd,copper_gerrit,gregg_a_lovey,gnd,vegas_peace,platinum_haze,ford_comtrex,vcc,lotus_golf,drugie_pilot,sake_bullet,donkey_genji,bravo_haze,suffering_gm,peace_broom,gnd,wildboar_mao,fufu_minnow,lagoon_broom,gnd,vcc,gnd,weevil_money,gnd,india_squad,pdaddy_powder,bert_south,chief_peta,gap_tamago,sheep_bart,snake_marco,hurt_rose,vcc,doc_bathroom,vcc,peace_broom,tinker_sheep,yankees_heidi,trevor_wanton,gnd}),
  .index_a({oscar_too_big,gnd,chairman_bfs,shark_peace,falafel_sun,vcc,dork_dingbat}),
  .index_b({vcc,fortuyn_heidi,gnd,hans_ritsu,vcc,chief_peta,curie_macys}),
  .data_out(honda_elf_dout)
);

always @(honda_elf_dout)
begin
   {babette_crank,chillis_peace,lima_hummer,bolt_foliage,severus_valve,dweebie_bep,llama_palm,might_what,kilo_knot,emu_xiaoping,pastrami_bull,tiger_dimetap,water_century,ernie_woman,woman_tiger,baron_foliage,bust_zen,hinge_enoch,homer_goofy,theseus_maki,maklak_waffle,egg_starwars,drevil_sinus,north_fortuyn,ariel_wujing,boitano_bagel,ladder_lizard,deuce_bismuth,emu_skinner,blessyou_haze,knot_neville,pepsi_spanish,bolt_trevor,kungfu_surfer,pizza_green,gulp_mushroom,ihilani_bert,tattoo_east,ghost_zinc,rat_xterm,master_bart,gonzo_eunice,often_onthepc,floo_saturn,greenbay_sake,llama_bismuth,baron_clay,southern_cow,gotone_marvin,marge_tofu,leaky_jinyong,vicks_skinner,mexico_sears,spyro_nirish,boing_jiminy,skipper_would} = honda_elf_dout;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [2:0] cybex_romex_dout;
nut_000_word_swap #(3, 6) nut_000_word_swap_inst_cybex_romex (
  .data_in({donkey_genji,gnd,gnd,foxtrot_sears,vcc,drevil_sinus,dig_shark,rat_xterm,nobody_martin,loud_chiptrip,concorde_bart,midas_macys,thedon_potato,gulp_mushroom,vcc,fury_beast,gotone_marvin,gnd}),
  .index_a({gnd,gnd,homerun_deng}),
  .index_b({kanji_uppers,vcc,hanger_lizard}),
  .data_out(cybex_romex_dout)
);

always @(cybex_romex_dout)
begin
   {lsd_downers,chicken_romex,pdaddy_kappa,kabar_jacques,leidiot_duey,egg_might,golden_sleepy,joseph_husks,avon_oranges,bananarep_rum,tank_centaur,wonton_crack,advil_army,broom_eagle,clay_ritsu,lemon_joseph,dimetap_vegan,ocean_huhhuh} = cybex_romex_dout;
end

wire lamer_webvan_outwire;
soft english_pyro (loser_curious,lamer_webvan_outwire);

always @(lamer_webvan_outwire)
begin
  lamer_webvan = lamer_webvan_outwire;
end

wire marker_bep_outwire;
lcell papa_dadada (gnd,marker_bep_outwire);

always @(marker_bep_outwire)
begin
  marker_bep = marker_bep_outwire;
end

wire ceres_elian_outwire;
carry sgates_think (goofy_bach,ceres_elian_outwire);

always @(ceres_elian_outwire)
begin
  ceres_elian = ceres_elian_outwire;
end

wire mine_nasdaq_outwire, roid_crayons_outwire;
carry_sum tamago_opus (.sin(kungfu_surfer),.cin(beauty_coffee),.sout(mine_nasdaq_outwire),.cout(roid_crayons_outwire));

always @(mine_nasdaq_outwire or roid_crayons_outwire)
begin
  mine_nasdaq = mine_nasdaq_outwire;
  roid_crayons = roid_crayons_outwire;
end

wire atoms_art_outwire, lucius_drax_outwire;
carry_sum chief_timmy (.sin(vicks_skinner),.cin(hotdog_sgates),.sout(atoms_art_outwire),.cout(lucius_drax_outwire));

always @(atoms_art_outwire or lucius_drax_outwire)
begin
  atoms_art = atoms_art_outwire;
  lucius_drax = lucius_drax_outwire;
end

wire kappa_rufus_outwire;
cascade moderate_eel (midas_macys,kappa_rufus_outwire);

always @(kappa_rufus_outwire)
begin
  kappa_rufus = kappa_rufus_outwire;
end

wire biker_bono_outwire;
lcell safeway_nest (chief_bambi,biker_bono_outwire);

always @(biker_bono_outwire)
begin
  biker_bono = biker_bono_outwire;
end

wire green_gm_outwire;
exp kilo_rojas (trevor_jiminy,green_gm_outwire);

always @(green_gm_outwire)
begin
  green_gm = green_gm_outwire;
end

wire floating_guy_outwire;
exp often_master (freaky_marco,floating_guy_outwire);

always @(floating_guy_outwire)
begin
  floating_guy = floating_guy_outwire;
end

wire life_atchoo_outwire;
exp hawaii_danger (emu_skinner,life_atchoo_outwire);

always @(life_atchoo_outwire)
begin
  life_atchoo = life_atchoo_outwire;
end

wire daughter_lisa_outwire, bfs_star_outwire;
carry_sum noah_mexican (.sin(gnd),.cin(clay_yohimbe),.sout(daughter_lisa_outwire),.cout(bfs_star_outwire));

always @(daughter_lisa_outwire or bfs_star_outwire)
begin
  daughter_lisa = daughter_lisa_outwire;
  bfs_star = bfs_star_outwire;
end

wire tako_fortuyn_outwire, atoms_filch_outwire;
carry_sum oscar_nyquil (.sin(eel_zinc),.cin(dig_shark),.sout(tako_fortuyn_outwire),.cout(atoms_filch_outwire));

always @(tako_fortuyn_outwire or atoms_filch_outwire)
begin
  tako_fortuyn = tako_fortuyn_outwire;
  atoms_filch = atoms_filch_outwire;
end

wire rescue_sun_outwire, haze_smithers_outwire;
carry_sum zed_weevil (.sin(green_gm),.cin(fear_star),.sout(rescue_sun_outwire),.cout(haze_smithers_outwire));

always @(rescue_sun_outwire or haze_smithers_outwire)
begin
  rescue_sun = rescue_sun_outwire;
  haze_smithers = haze_smithers_outwire;
end

reg feedback_pt_253;

always @(vcc or feedback_pt_253)
  begin
      burner_mrbill = !vcc ^  feedback_pt_253;
  end

reg feedback_pt_254;

always @(atoms_filch or feedback_pt_254)
  begin
      squad_wukong = !atoms_filch &  feedback_pt_254;
  end

reg feedback_pt_255;

always @(wildboar_mao or feedback_pt_255)
  begin
      malfoy_nyc =  wildboar_mao & !feedback_pt_255;
  end

reg feedback_pt_256;

always @(mexico_sears or feedback_pt_256)
  begin
      dork_porfavor = !mexico_sears ^ !feedback_pt_256;
  end

reg feedback_pt_257;

always @(baron_foliage or feedback_pt_257)
  begin
      often_downers =  baron_foliage | !feedback_pt_257;
  end

reg feedback_pt_258;

always @(black_intuit or feedback_pt_258)
  begin
      sake_billnted =  black_intuit ^ !feedback_pt_258;
  end

reg feedback_pt_259;

always @(hippo_mozart or feedback_pt_259)
  begin
      purple_rod = !hippo_mozart |  feedback_pt_259;
  end

reg feedback_pt_260;

always @(haze_smithers or feedback_pt_260)
  begin
      too_big_dirk = !haze_smithers ^ !feedback_pt_260;
  end

reg feedback_pt_261;

always @(atoms_art or feedback_pt_261)
  begin
      baron_nihlist =  atoms_art |  feedback_pt_261;
  end

reg feedback_pt_262;

always @(vcc or feedback_pt_262)
  begin
      stroop_mexico = !vcc |  feedback_pt_262;
  end

reg feedback_pt_263;

always @(boitano_bagel or feedback_pt_263)
  begin
      bust_fear =  boitano_bagel ^ !feedback_pt_263;
  end

reg feedback_pt_264;

always @(pdaddy_kappa or feedback_pt_264)
  begin
      due_firewalk = !pdaddy_kappa ^  feedback_pt_264;
  end

reg feedback_pt_265;

always @(moe_carolina or feedback_pt_265)
  begin
      zedong_nyc =  moe_carolina & !feedback_pt_265;
  end

reg feedback_pt_266;

always @(curly_baron or feedback_pt_266)
  begin
      emu_abraham = !curly_baron ^  feedback_pt_266;
  end

reg feedback_pt_267;

always @(hotel_macys or feedback_pt_267)
  begin
      timmy_bracket = !hotel_macys | !feedback_pt_267;
  end

reg feedback_pt_268;

always @(severus_valve or feedback_pt_268)
  begin
      pilot_nasdaq = !severus_valve | !feedback_pt_268;
  end

reg feedback_pt_269;

always @(sake_billnted or feedback_pt_269)
  begin
      sand_badger =  sake_billnted & !feedback_pt_269;
  end

reg feedback_pt_270;

always @(money_fortuyn or feedback_pt_270)
  begin
      muffin_homer = !money_fortuyn | !feedback_pt_270;
  end

reg feedback_pt_271;

always @(zen_tako or feedback_pt_271)
  begin
      due_happy = !zen_tako | !feedback_pt_271;
  end

reg feedback_pt_272;

always @(bfs_star or feedback_pt_272)
  begin
      skipper_gonzo =  bfs_star & !feedback_pt_272;
  end

reg feedback_pt_273;

always @(gnd or feedback_pt_273)
  begin
      metal_covad =  gnd ^  feedback_pt_273;
  end

reg feedback_pt_274;

always @(nasdaq_ebay or feedback_pt_274)
  begin
      klinton_macys = !nasdaq_ebay |  feedback_pt_274;
  end

reg feedback_pt_275;

always @(marker_bep or feedback_pt_275)
  begin
      quebec_crank = !marker_bep ^  feedback_pt_275;
  end

reg feedback_pt_276;

always @(skipper_gonzo or feedback_pt_276)
  begin
      nest_mcnugget =  skipper_gonzo ^ !feedback_pt_276;
  end

reg feedback_pt_277;

always @(art_norbert or feedback_pt_277)
  begin
      armand_lovey = !art_norbert |  feedback_pt_277;
  end

reg feedback_pt_278;

always @(dork_rouge or feedback_pt_278)
  begin
      priest_gopher =  dork_rouge |  feedback_pt_278;
  end

reg feedback_pt_279;

always @(ghost_zinc or feedback_pt_279)
  begin
      marvin_xterm = !ghost_zinc & !feedback_pt_279;
  end

reg feedback_pt_280;

always @(ladder_pyro or feedback_pt_280)
  begin
      lsd_shuda =  ladder_pyro |  feedback_pt_280;
  end

reg feedback_pt_281;

always @(baron_clay or feedback_pt_281)
  begin
      bambi_skipper =  baron_clay &  feedback_pt_281;
  end

reg feedback_pt_282;

always @(vcc or feedback_pt_282)
  begin
      vegas_abraham =  vcc ^ !feedback_pt_282;
  end

reg feedback_pt_283;

always @(jonas_monster or feedback_pt_283)
  begin
      kanji_gyro = !jonas_monster & !feedback_pt_283;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beauty_dog <= 0;
    else
      beauty_dog <= vcc;
  end

always @(beauty_dog)
  begin
      feedback_pt_239 = beauty_dog;
  end

always @(beauty_dog)
  begin
      feedback_pt_240 = beauty_dog;
  end

always @(beauty_dog)
  begin
      feedback_pt_241 = beauty_dog;
  end

always @(beauty_dog)
  begin
      feedback_pt_242 = beauty_dog;
  end

always @(beauty_dog)
  begin
      feedback_pt_243 = beauty_dog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_romex <= 0;
    else if (gnd)
      emu_romex <= 0;
    else if (dork_porfavor)
      emu_romex <= gnd;
  end

always @(emu_romex)
  begin
      feedback_pt_244 = emu_romex;
  end

always @(emu_romex)
  begin
      feedback_pt_245 = emu_romex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_trevor <= 0;
    else
      onion_trevor <= too_big_dirk;
  end

always @(onion_trevor)
  begin
      feedback_pt_246 = onion_trevor;
  end

wire rubeus_egg_wire;

dffeas rubeus_egg_ff (
  .clk(clock1),
  .d(boing_jiminy),
  .ena(ladder_lizard),
  .sclr(potato_rod),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset1),
  .q(rubeus_egg_wire)
);

always @(rubeus_egg_wire) begin
   avon_giants = rubeus_egg_wire;
end

always @(avon_giants)
  begin
      feedback_pt_247 = avon_giants;
  end

always @(avon_giants)
  begin
      feedback_pt_248 = avon_giants;
  end

always @(avon_giants)
  begin
      feedback_pt_249 = avon_giants;
  end

always @(avon_giants)
  begin
      feedback_pt_250 = avon_giants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fatality_sun <= 0;
    else if (legos_tofu)
      fatality_sun <= gnd;
  end

always @(fatality_sun)
  begin
      feedback_pt_251 = fatality_sun;
  end

always @(fatality_sun)
  begin
      feedback_pt_252 = fatality_sun;
  end

wire rat_what_wire;

dffea rat_what_ff (
  .clk(clock1),
  .d(pilot_nasdaq),
  .ena(peaves_squad),
  .adata(jcrew_cow),
  .clrn(!reset1),
  .q(rat_what_wire)
);

always @(rat_what_wire) begin
   marquis_husks = rat_what_wire;
end

always @(marquis_husks)
  begin
      feedback_pt_253 = marquis_husks;
  end

always @(marquis_husks)
  begin
      feedback_pt_254 = marquis_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_bravo <= 0;
    else if (vcc)
      neville_bravo <= 0;
    else if (fatality_sun)
      neville_bravo <= att_launcher;
  end

always @(neville_bravo)
  begin
      feedback_pt_255 = neville_bravo;
  end

always @(neville_bravo)
  begin
      feedback_pt_256 = neville_bravo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_ykocens <= 0;
    else if (armand_lovey)
      water_ykocens <= rescue_sun;
    else if (leaky_jinyong)
      water_ykocens <= 0;
  end

always @(water_ykocens)
  begin
      feedback_pt_257 = water_ykocens;
  end

always @(water_ykocens)
  begin
      feedback_pt_258 = water_ykocens;
  end

always @(water_ykocens)
  begin
      feedback_pt_259 = water_ykocens;
  end

always @(water_ykocens)
  begin
      feedback_pt_260 = water_ykocens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotdog_priest <= 0;
    else if (egg_starwars)
      hotdog_priest <= pig_fear;
    else if (husks_gotone)
      hotdog_priest <= 0;
  end

always @(hotdog_priest)
  begin
      feedback_pt_261 = hotdog_priest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      thread_quail <= 0;
    else if (llama_palm)
      thread_quail <= zedong_nyc;
    else if (onion_trevor)
      thread_quail <= 0;
  end

always @(thread_quail)
  begin
      feedback_pt_262 = thread_quail;
  end

always @(thread_quail)
  begin
      feedback_pt_263 = thread_quail;
  end

always @(thread_quail)
  begin
      feedback_pt_264 = thread_quail;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grumby_haze <= 0;
    else if (blue_carolina)
      grumby_haze <= marge_tofu;
  end

always @(grumby_haze)
  begin
      feedback_pt_265 = grumby_haze;
  end

always @(grumby_haze)
  begin
      feedback_pt_266 = grumby_haze;
  end

always @(grumby_haze)
  begin
      feedback_pt_267 = grumby_haze;
  end

always @(grumby_haze)
  begin
      feedback_pt_268 = grumby_haze;
  end

always @(grumby_haze)
  begin
      feedback_pt_269 = grumby_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      louie_heidi <= 0;
    else if (llama_palm)
      louie_heidi <= 0;
    else if (ernie_woman)
      louie_heidi <= hurt_rose;
  end

always @(louie_heidi)
  begin
      feedback_pt_270 = louie_heidi;
  end

always @(louie_heidi)
  begin
      feedback_pt_271 = louie_heidi;
  end

always @(louie_heidi)
  begin
      feedback_pt_272 = louie_heidi;
  end

always @(louie_heidi)
  begin
      feedback_pt_273 = louie_heidi;
  end

always @(louie_heidi)
  begin
      feedback_pt_274 = louie_heidi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snort_quebec <= 0;
    else if (lamer_webvan)
      snort_quebec <= 0;
    else if (surfer_tuna)
      snort_quebec <= sun_wannabe;
  end

always @(snort_quebec)
  begin
      feedback_pt_275 = snort_quebec;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spastic_pilot <= 0;
    else if (water_ykocens)
      spastic_pilot <= mike_mcnugget;
  end

always @(spastic_pilot)
  begin
      feedback_pt_276 = spastic_pilot;
  end

wire goat_mouse_wire;

dffeas goat_mouse_ff (
  .clk(clock1),
  .d(lucius_drax),
  .ena(ocean_huhhuh),
  .sclr(mike_mcnugget),
  .sload(vcc),
  .asdata(marvin_xterm),
  .clrn(!reset1),
  .q(goat_mouse_wire)
);

always @(goat_mouse_wire) begin
   mike_stirfry = goat_mouse_wire;
end

always @(mike_stirfry)
  begin
      feedback_pt_277 = mike_stirfry;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hagrid_indigo <= 0;
    else if (jonas_rocks)
      hagrid_indigo <= legos_tofu;
    else if (att_launcher)
      hagrid_indigo <= 0;
  end

always @(hagrid_indigo)
  begin
      feedback_pt_278 = hagrid_indigo;
  end

wire crayons_ibm_wire;

dffeas crayons_ibm_ff (
  .clk(clock1),
  .d(vcc),
  .ena(lsd_downers),
  .sclr(nest_crank),
  .sload(ocean_huhhuh),
  .asdata(foxtrot_sears),
  .clrn(!reset1),
  .q(crayons_ibm_wire)
);

always @(crayons_ibm_wire) begin
   hut_burnout = crayons_ibm_wire;
end

always @(hut_burnout)
  begin
      feedback_pt_279 = hut_burnout;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oranje_zen <= 0;
    else
      oranje_zen <= ocean_huhhuh;
  end

always @(oranje_zen)
  begin
      feedback_pt_280 = oranje_zen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      covad_pdiddy <= 0;
    else if (gnd)
      covad_pdiddy <= boitano_bagel;
  end

always @(covad_pdiddy)
  begin
      feedback_pt_281 = covad_pdiddy;
  end

wire eel_psycho_wire;

dffeas eel_psycho_ff (
  .clk(clock1),
  .d(metal_covad),
  .ena(freaky_marco),
  .sclr(rasp_bubba),
  .sload(zen_tako),
  .asdata(louie_heidi),
  .clrn(!reset1),
  .q(eel_psycho_wire)
);

always @(eel_psycho_wire) begin
   rarest_chevys = eel_psycho_wire;
end

always @(rarest_chevys)
  begin
      feedback_pt_282 = rarest_chevys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      plaster_yummy <= 1;
    else
      plaster_yummy <= gnd;
  end

always @(plaster_yummy)
  begin
      feedback_pt_283 = plaster_yummy;
  end

wire stix_broom_wire;

dffeas stix_broom_ff (
  .clk(clock1),
  .d(vcc),
  .ena(loud_chiptrip),
  .sclr(often_onthepc),
  .sload(vcc),
  .asdata(newt_sirius),
  .clrn(!reset1),
  .q(stix_broom_wire)
);

always @(stix_broom_wire) begin
   kbtoys_tofu = stix_broom_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      theseus_rojas <= 0;
    else if (covad_ocha)
      theseus_rojas <= roid_kungfu;
    else if (att_launcher)
      theseus_rojas <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stroop_doc <= 1;
    else
      stroop_doc <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      leaky_snort <= 0;
    else if (vcc)
      leaky_snort <= gin_ceres;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_tylenol <= 0;
    else
      kilo_tylenol <= potato_rod;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_rubik <= 0;
    else if (bert_south)
      tiger_rubik <= dig_shark;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_kebab <= 0;
    else if (bert_south)
      boing_kebab <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speed_tuna <= 0;
    else
      speed_tuna <= roid_odin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yankee_zi <= 0;
    else
      yankee_zi <= money_fortuyn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_loser <= 0;
    else if (klinton_macys)
      ladder_loser <= roe_abraham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quail_fascist <= 1;
    else
      quail_fascist <= greenbay_sake;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_brian <= 0;
    else if (pig_budlite)
      sogood_brian <= hotdog_priest;
    else if (vcc)
      sogood_brian <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      condit_pirate <= 1;
    else
      condit_pirate <= avon_oranges;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_moe <= 0;
    else if (ceres_elian)
      pepsi_moe <= theseus_maki;
    else if (gnd)
      pepsi_moe <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      albus_what <= 0;
    else if (dweebie_bep)
      albus_what <= joseph_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_dimetap <= 0;
    else if (weevil_solder)
      oscar_dimetap <= 0;
    else if (vcc)
      oscar_dimetap <= pepsi_spanish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonks_jesus <= 0;
    else if (gnd)
      tonks_jesus <= palm_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_romex <= 0;
    else if (roid_odin)
      oldnavy_romex <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_tank <= 0;
    else if (life_lao)
      crab_tank <= blessyou_haze;
    else if (advil_army)
      crab_tank <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      paper_english <= 0;
    else if (vcc)
      paper_english <= haze_smithers;
    else if (gnd)
      paper_english <= 0;
  end

wire hawaii_plague_wire;

dffeas hawaii_plague_ff (
  .clk(clock1),
  .d(hagrid_indigo),
  .ena(vcc),
  .sclr(boing_jiminy),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset1),
  .q(hawaii_plague_wire)
);

always @(hawaii_plague_wire) begin
   po_yellowtail = hawaii_plague_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonic_whale <= 0;
    else if (gnd)
      tonic_whale <= babette_crank;
    else if (vcc)
      tonic_whale <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_plague <= 0;
    else if (trevor_wanton)
      egg_plague <= dig_shark;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cocaine_bart <= 0;
    else
      cocaine_bart <= wonton_crack;
  end

wire rose_hp_wire;

dffea rose_hp_ff (
  .clk(clock1),
  .d(gin_ceres),
  .ena(beauty_dog),
  .adata(yak_brothers),
  .clrn(!reset1),
  .q(rose_hp_wire)
);

always @(rose_hp_wire) begin
   deuce_salsa = rose_hp_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_mickey <= 0;
    else if (woman_tiger)
      stix_mickey <= fury_beast;
    else if (ford_comtrex)
      stix_mickey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eggsalad_dirk <= 1;
    else
      eggsalad_dirk <= hinge_enoch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_faster <= 0;
    else if (vcc)
      animal_faster <= vcc;
    else if (priest_gopher)
      animal_faster <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ginger_hinge <= 0;
    else if (vcc)
      ginger_hinge <= 0;
    else if (dimetap_vegan)
      ginger_hinge <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curly_red <= 0;
    else if (avon_giants)
      curly_red <= jonas_monster;
    else if (malfoy_nyc)
      curly_red <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lad_zebra <= 0;
    else if (ford_comtrex)
      lad_zebra <= soccer_speed;
    else if (ginger_tsmc)
      lad_zebra <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whacky_hinge <= 0;
    else if (vcc)
      whacky_hinge <= 0;
    else if (vcc)
      whacky_hinge <= sand_badger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drax_intuit <= 0;
    else
      drax_intuit <= freaky_marco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_over <= 0;
    else
      neville_over <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      issac_gonzo <= 0;
    else if (gnd)
      issac_gonzo <= 0;
    else if (tinker_sheep)
      issac_gonzo <= thor_cucumber;
  end

wire green_sortout_wire;

dffeas green_sortout_ff (
  .clk(clock1),
  .d(timmy_bracket),
  .ena(bomb_yohimbe),
  .sclr(pdaddy_kappa),
  .sload(timmy_bracket),
  .asdata(gnd),
  .clrn(!reset1),
  .q(green_sortout_wire)
);

always @(green_sortout_wire) begin
   mine_chief = green_sortout_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      avon_neon <= 0;
    else if (bananarep_rum)
      avon_neon <= 0;
    else if (spyro_nirish)
      avon_neon <= golden_sleepy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snake_copper <= 0;
    else if (whacky_hinge)
      snake_copper <= often_downers;
  end

reg feedback_pt_284;

always @(roid_kungfu or feedback_pt_284)
  begin
      kmfdm_marvin = !roid_kungfu ^ !feedback_pt_284;
  end

reg feedback_pt_285;

always @(egg_plague or feedback_pt_285)
  begin
      crayons_fury = !egg_plague &  feedback_pt_285;
  end

reg feedback_pt_286;

always @(vcc or feedback_pt_286)
  begin
      cubish_issac =  vcc ^  feedback_pt_286;
  end

reg feedback_pt_287;

always @(zinc_bust or feedback_pt_287)
  begin
      dig_uppers =  zinc_bust & !feedback_pt_287;
  end

reg feedback_pt_288;

always @(advil_army or feedback_pt_288)
  begin
      liberace_lad = !advil_army | !feedback_pt_288;
  end

reg feedback_pt_289;

always @(sheep_bart or feedback_pt_289)
  begin
      boitano_wine = !sheep_bart ^  feedback_pt_289;
  end

reg feedback_pt_290;

always @(muffin_homer or feedback_pt_290)
  begin
      goblin_cubish = !muffin_homer & !feedback_pt_290;
  end

reg feedback_pt_291;

always @(jonas_monster or feedback_pt_291)
  begin
      west_sand = !jonas_monster &  feedback_pt_291;
  end

reg feedback_pt_292;

always @(neville_po or feedback_pt_292)
  begin
      emails_lamer =  neville_po |  feedback_pt_292;
  end

reg feedback_pt_293;

always @(chillis_peace or feedback_pt_293)
  begin
      lao_ritsu = !chillis_peace &  feedback_pt_293;
  end

reg feedback_pt_294;

always @(beauty_coffee or feedback_pt_294)
  begin
      malfoy_indigo = !beauty_coffee |  feedback_pt_294;
  end

reg feedback_pt_295;

always @(southern_cow or feedback_pt_295)
  begin
      kungfu_duey =  southern_cow | !feedback_pt_295;
  end

reg feedback_pt_296;

always @(bananarep_rum or feedback_pt_296)
  begin
      wine_monster =  bananarep_rum | !feedback_pt_296;
  end

reg feedback_pt_297;

always @(vcc or feedback_pt_297)
  begin
      stick_roid = !vcc | !feedback_pt_297;
  end

reg feedback_pt_298;

always @(gnd or feedback_pt_298)
  begin
      metal_heidi = !gnd ^ !feedback_pt_298;
  end

reg feedback_pt_299;

always @(kilo_knot or feedback_pt_299)
  begin
      grams_wakey = !kilo_knot ^  feedback_pt_299;
  end

reg feedback_pt_300;

always @(gnd or feedback_pt_300)
  begin
      tiger_hiway = !gnd & !feedback_pt_300;
  end

reg feedback_pt_301;

always @(leidiot_duey or feedback_pt_301)
  begin
      marco_chevys = !leidiot_duey ^  feedback_pt_301;
  end

reg feedback_pt_302;

always @(echo_eggsalad or feedback_pt_302)
  begin
      romex_whiskey =  echo_eggsalad |  feedback_pt_302;
  end

reg feedback_pt_303;

always @(palm_haze or feedback_pt_303)
  begin
      tsmc_milhouse =  palm_haze &  feedback_pt_303;
  end

reg feedback_pt_304;

always @(gnd or feedback_pt_304)
  begin
      tiger_skipper = !gnd ^ !feedback_pt_304;
  end

reg feedback_pt_305;

always @(gnd or feedback_pt_305)
  begin
      willy_emails =  gnd ^  feedback_pt_305;
  end

reg feedback_pt_306;

always @(burner_mrbill or feedback_pt_306)
  begin
      bear_speedyg =  burner_mrbill & !feedback_pt_306;
  end

reg feedback_pt_307;

always @(emu_xiaoping or feedback_pt_307)
  begin
      yeanyow_atoms =  emu_xiaoping & !feedback_pt_307;
  end

reg feedback_pt_308;

always @(gonzo_eunice or feedback_pt_308)
  begin
      cain_wiggles = !gonzo_eunice |  feedback_pt_308;
  end

reg feedback_pt_309;

always @(romex_whiskey or feedback_pt_309)
  begin
      zedong_coffee = !romex_whiskey &  feedback_pt_309;
  end

reg feedback_pt_310;

always @(pig_budlite or feedback_pt_310)
  begin
      illegal_duck = !pig_budlite |  feedback_pt_310;
  end

reg feedback_pt_311;

always @(beef_shuda or feedback_pt_311)
  begin
      square_hagrid =  beef_shuda &  feedback_pt_311;
  end

reg feedback_pt_312;

always @(trevor_wanton or feedback_pt_312)
  begin
      vegan_floo =  trevor_wanton ^ !feedback_pt_312;
  end

reg feedback_pt_313;

always @(vcc or feedback_pt_313)
  begin
      gm_lotus = !vcc ^ !feedback_pt_313;
  end

reg feedback_pt_314;

always @(ihilani_bert or feedback_pt_314)
  begin
      chainsaw_clay = !ihilani_bert & !feedback_pt_314;
  end

reg feedback_pt_315;

always @(vcc or feedback_pt_315)
  begin
      nyc_pizza = !vcc ^ !feedback_pt_315;
  end

reg feedback_pt_316;

always @(water_century or feedback_pt_316)
  begin
      tabby_nuclear =  water_century ^ !feedback_pt_316;
  end

reg feedback_pt_317;

always @(thread_quail or feedback_pt_317)
  begin
      mars_monkey = !thread_quail & !feedback_pt_317;
  end

reg feedback_pt_318;

always @(rescue_sun or feedback_pt_318)
  begin
      ramone_amex = !rescue_sun ^  feedback_pt_318;
  end

reg feedback_pt_319;

always @(zulu_baron or feedback_pt_319)
  begin
      remus_vicks =  zulu_baron ^  feedback_pt_319;
  end

reg feedback_pt_320;

always @(rarest_chevys or feedback_pt_320)
  begin
      penguin_cheez = !rarest_chevys ^ !feedback_pt_320;
  end

reg feedback_pt_321;

always @(floo_saturn or feedback_pt_321)
  begin
      turkey_tank =  floo_saturn ^  feedback_pt_321;
  end

reg feedback_pt_322;

always @(zedong_lucius or feedback_pt_322)
  begin
      foxtrot_boots =  zedong_lucius ^ !feedback_pt_322;
  end

reg feedback_pt_323;

always @(broom_eagle or feedback_pt_323)
  begin
      porfavor_ebi =  broom_eagle &  feedback_pt_323;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [2:0] iron_gonzo_dout;
nut_000_word_swap #(3, 4) nut_000_word_swap_inst_iron_gonzo (
  .data_in({bambi_skipper,iterate_sugar,sogood_brian,gnd,crab_tank,snake_copper,daughter_sake,gnd,roid_odin,snort_quebec,vcc,marquis_husks}),
  .index_a({boitano_wine,zulu_baron,zedong_nyc}),
  .index_b({ramone_amex,dorkus_marge,vcc}),
  .data_out(iron_gonzo_dout)
);

always @(iron_gonzo_dout)
begin
   {palmer_dadada,dragon_paper,gonzo_scrooge,po_mario_owes,stoner_candle,bravo_hours,george_lovey,sheep_gyro,jason_drunken,bach_rewire,beetle_genji,cybex_hawaii} = iron_gonzo_dout;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [15:0] platinum_frog_dout;
nut_000_word_swap #(16, 16) nut_000_word_swap_inst_platinum_frog (
  .data_in({golden_sleepy,curly_baron,tiger_rubik,timmy_bracket,vcc,vcc,hanger_lizard,aspirin_ritsu,maklak_waffle,due_tango,sanity_tarzan,gnd,tako_fortuyn,vcc,biker_bono,vcc,hanger_lizard,vcc,ginger_tsmc,malfoy_indigo,west_sand,gnd,dopey_sinew,george_lovey,gnd,bomb_yohimbe,water_foryou,cocaine_bart,george_lovey,paper_english,spastic_pilot,tonks_jesus,vcc,loud_chiptrip,foxtrot_boots,gnd,gnd,vcc,speed_tuna,vcc,illegal_rod,lad_zebra,bach_rewire,vcc,gnd,vcc,lemon_joseph,ceres_elian,chainsaw_clay,what_husks,vcc,kilo_tylenol,purple_rod,vcc,eggsalad_dirk,emails_lamer,due_tango,gnd,gnd,illegal_duck,vcc,life_atchoo,wine_monster,vcc,mike_stirfry,leaky_snort,spastic_pilot,knot_neville,tsmc_safada,vcc,minnow_marco,potato_rod,vcc,neville_bravo,goblin_cubish,gnd,copper_gerrit,vcc,zhuang_drugie,vcc,gnd,stroop_doc,llama_bismuth,metal_heidi,gnd,romex_whiskey,deuce_salsa,vcc,pastrami_bull,beetle_genji,illegal_duck,tiger_hiway,vcc,bolt_foliage,neville_over,gm_lotus,purple_rod,palmer_dadada,leidiot_duey,vcc,rocks_ohisee,emu_romex,baron_nihlist,ceres_elian,vcc,master_bart,advil_army,gnd,stroop_mexico,lao_ritsu,zedong_coffee,crayons_fury,llama_bismuth,todd_malfoy,tiger_hiway,vcc,gnd,stoner_candle,purple_rod,gnd,liberace_lad,floating_guy,tsmc_milhouse,kappa_rufus,vegas_abraham,vcc,foxtrot_sears,spyro_nirish,klaas_diagon,fury_beast,lsd_shuda,snort_jinyong,rufus_advil,maklak_waffle,ariel_wujing,dragon_paper,gnd,tiger_rubik,kanji_gyro,due_tango,potter_thor,bravo_hours,porfavor_ebi,echo_eggsalad,emails_lamer,kmfdm_marvin,theseus_rojas,grumby_haze,snort_quebec,ginger_hinge,vegas_peace,hulk_booming,paper_english,vcc,vcc,boitano_bagel,gnd,stick_roid,stix_mickey,illegal_duck,vcc,tattoo_east,malfoy_indigo,sheep_gyro,hanger_lizard,daughter_lisa,vcc,bust_fear,vcc,skipper_would,kungfu_duey,neville_over,egg_might,vcc,floo_saturn,emu_abraham,oscar_dimetap,marco_chevys,wonton_crack,often_downers,porfavor_ebi,kungfu_duey,advil_army,lagoon_broom,often_downers,vcc,malfoy_boing,turkey_tank,cybex_hawaii,peaves_squad,bear_speedyg,vcc,tonks_snake,hinge_enoch,albus_what,tank_centaur,penguin_cheez,tonks_snake,due_firewalk,gnd,gnd,beetle_genji,tiger_skipper,chicken_romex,gnd,ghost_asahi,tattoo_east,avon_neon,vcc,tank_centaur,maklak_waffle,vcc,marco_chevys,southern_cow,vcc,animal_faster,vcc,wine_monster,bust_zen,yeanyow_atoms,giraffe_huey,gnd,purple_rod,dig_uppers,vcc,master_bamboo,south_nasdaq,drax_intuit,vcc,gnd,gnd,tabby_nuclear,tiger_drugs,genji_stirfry,emails_lamer,roid_crayons,gnd,po_mario_owes,often_downers,wine_monster,nyc_pizza,chainsaw_clay,chainsaw_clay,malfoy_nyc,advil_cow,gnd,trevor_thread,gnd,vcc,gonzo_scrooge,ginger_hinge,po_yellowtail,bolt_trevor,killer_ready,jason_drunken,gnd}),
  .index_a({deuce_bismuth,due_happy,leaky_snort,vcc,gnd,beetle_genji,gnd,vcc,louie_heidi,foxtrot_boots,ghost_asahi,avon_neon,pastrami_bull,covad_pdiddy,gnd,giraffe_huey}),
  .index_b({chainsaw_clay,beef_shuda,zedong_coffee,gnd,gnd,advil_cow,vcc,condit_pirate,chainsaw_clay,concorde_show,tiger_skipper,kungfu_duey,vcc,bust_fear,quail_fascist,baron_clay}),
  .data_out(platinum_frog_dout)
);

always @(platinum_frog_dout)
begin
   {advil_iceland,smack_beavis,southern_bfi,cafe_concorde,west_stick,falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum,escape_escape,rerun_husks,kabar_mortar,wine_eggsalad,frog_emails,kana_red,kebab_arizona,leidiot_ghost,dweebie_issac,bfi_obiwan,seashell_mars,fire_whack,lumber_kmfdm,rouge_alpha,pixie_spain,rouge_east,phoenix_ebay,zen_firstpart,rarest_tabby,viagra_plague,lupin_gotone,dig_obiwan,alpha_maryann,often_pdaddy,aphid_lantern,sugar_coconut,ernie_emu,burning_ohno,rod_sebastian,zeus_hinkley,shark_richard,avon_century,gyro_love_in,spyro_lotus,popcorn_whack,eagle_beef,riddler_hans,bear_morrison,dow_blue,protest_cow,george_hp,opus_riddler,pizza_rose,kilo_autotest,fitter_pilot,bravo_exodus,spastic_todd,golfland_roid,richard_lamer,beemer_floo,vicks_tracy,escape_jesus,dragon_broom,burner_bfi,egg_wonton,abraham_albus,curie_lost,wine_mine,monkey_barney,mrbill_mars,athena_barty,marge_dirty,salsa_master,sirius_tobiko,venus_martian,goat_romex,fang_atilla,egg_barney,eagle_centaur,ramone_palmer,schwinger_red,potato_bull,pixie_kungfu,pasta_shuda,lost_agitator,square_cubish,dig_fsncens,lao_shudamak,hawaii_marco,palmer_bust,rodriguez_guy,wonder_stroop,marco_orange,bep_defoliant,what_eel,happy_mortar,metal_romulus,bravo_arcade,chowmein_haze,ham_bacon,moron_gin,roe_kanji,nyc_candle,elf_killer,curie_plague,spyro_neon,ocha_meffert,kungfu_elian,gap_greenbay,gilligan_mine,hector_potato,tsmc_wildboar,moron_curious,jesus_rubik,what_doobie,rose_larry,oscar_tapered,chillis_cybex,spain_yellow,homerun_meth,advil_yummy,foryou_subway,freaky_pdaddy,bonker_gonzo,bfs_mortar,hans_palmer,curie_sogood,life_rabbi,fear_exodus,itchy_rose,parrot_dragon,yak_holepunch,ajax_spyro,indigo_buddha,wood_notalot,minerva_wakey,pirate_gutter,wonder_fronds,orange_cubish,nasdaq_shemp,whattime_bert,opus_liberace,sanity_hp,stick_intuit,iron_cheese,hulk_kaisha,ready_spirit,show_theseus,molokai_rum,seashell_abel,maryann_yoku,lao_steaming,float_floo,beetle_whale,elf_east,boitano_boing,pcp_master,isle_mortgate,acid_gopher,norbert_goofy,yummy_pizza,deng_gerrit,echo_zealot,rerun_might,ebay_sogood,nigiri_chuck,nigiri_ford,lizard_peta,donald_rescue,jupiter_lsd,kennyg_barney,delta_desert,lao_pegasus,blanket_tonks,richard_lovey,pcp_aphid,obiwan_tonks,gin_golden,tobe_foiled,burner_often,dweebie_ring,babette_aphid,lockheed_fire,bagel_shuda,chainsaw_tofu,spirit_norris,touch_scotch,cheez_zedong,badger_donkey,lizard_donkey,ihilani_vadar,jonas_bep,vangoh_ebay,fire_boing,gap_india,my_tummy_zi,jonas_aspirin,timmy_snake,emu_zipporah,enoch_vangoh,dirty_cow,newt_clothing,mickey_willy,soccer_moe,weasley_hinge,bismuth_fire,sand_lotus,yoku_tonic,mexico_atoms,south_curie,att_maryann,whack_smack,hinge_questo,tsmc_snape,victor_cuanto,baron_viagra,elephant_gm,blanket_pilot,ceres_intel,superman_todd,mike_lotus,cocacola_milo,parrot_hippo,nyc_rod,acid_tapered,pepsi_gerard,crack_kungfu,snape_neptune,fish_itchy,star_ernie,dog_charlie,hp_rampacker,turnip_foiled,jason_dirty,moe_burning,mexican_mike,papa_sun,zen_drugie,wizard_snape,tunafish_duey,whiskey_crank,bono_bonafide,sogood_drax,burner_hurt,fury_mozart,what_booming,sinew_intel,bacon_nest,killme_arcade,ariel_thedon,crank_mozart,diagon_zebra,sgates_juliet,itchy_oranje} = platinum_frog_dout;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [4:0] boots_macys_dout;
nut_000_word_swap #(5, 4) nut_000_word_swap_inst_boots_macys (
  .data_in({donald_rescue,yoku_tonic,molokai_rum,molokai_rum,gnd,ramone_palmer,orange_cubish,ebay_sogood,gnd,kabar_mortar,nasdaq_shemp,freaky_pdaddy,richard_lovey,vcc,aphid_lantern,life_rabbi,often_pdaddy,smack_beavis,gnd,gnd}),
  .index_a({tattoo_east,hp_rampacker,eagle_centaur,gnd,gnd}),
  .index_b({mike_lotus,vcc,lupin_gotone,rerun_husks,vcc}),
  .data_out(boots_macys_dout)
);

always @(boots_macys_dout)
begin
   {hulk_doobie,echo_testyour,ykocens_kana,golden_robust,oscar_jupiter,whiskey_bambi,ramone_romex,protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin,fitter_honey,vangoh_dadada,vegan_lupin,chevys_mexico,bacon_drugs,bolt_kabar} = boots_macys_dout;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [10:0] dragon_golf_dout;
nut_000_word_swap #(11, 7) nut_000_word_swap_inst_dragon_golf (
  .data_in({gnd,hinge_questo,rouge_alpha,gnd,advil_army,hurt_rose,egg_wonton,rerun_might,nigiri_chuck,fitter_pilot,itchy_rose,vcc,salsa_master,bfi_obiwan,oscar_tapered,hotel_macys,pepsi_gerard,covad_ocha,dog_charlie,lao_steaming,shark_richard,gnd,gnd,vcc,vcc,kana_red,atoms_filch,pepsi_gerard,beemer_floo,happy_mortar,cubish_issac,bfi_obiwan,gnd,gnd,opus_liberace,vcc,athena_barty,gnd,pcp_master,north_fortuyn,tsmc_snape,superman_todd,hawaii_marco,dweebie_ring,vcc,penguin_cheez,squad_wukong,burner_hurt,ceres_elian,mexico_sears,hulk_doobie,timmy_bracket,bacon_drugs,vegan_floo,nigiri_chuck,vcc,fire_boing,hotel_macys,jonas_aspirin,jason_dirty,elephant_gm,itchy_rose,beemer_floo,dweebie_issac,victor_cuanto,pixie_kungfu,oscar_jupiter,timmy_bracket,vcc,norbert_goofy,jacques_rum,fear_exodus,dirty_cow,float_floo,gnd,gnd,vcc}),
  .index_a({gnd,gnd,vcc,dork_rouge,chowmein_haze,gnd,vcc,gnd,curie_lost,parrot_hippo,vcc}),
  .index_b({genji_dweebie,rum_tukatuk,whiskey_bambi,marge_dirty,gnd,foxtrot_sears,todd_pictures,rarest_tabby,bep_defoliant,dimetap_vegan,george_hp}),
  .data_out(dragon_golf_dout)
);

always @(dragon_golf_dout)
begin
   {roid_broom,star_arthur,turnip_deng,master_milo,raiders_louie,knot_picante,sirius_dopey,killer_hanger,china_whacky,kappa_drax,often_surfer,acid_muffin,elguapo_ghost,tattoo_bloom,salmon_badger,fire_hiswife,chips_jacuzzi,rodent_south,iceland_egg,would_husks,kbtoys_pepsi,jacob_ulysses,vicks_bach,uniform_crank,Iwin_neon,spirit_loser,roe_lad,george_soccer,tiger_eagle,zulu_satanist,huey_banality,saturn_iguana,yak_edible,ham_vadar,boitano_romeo,often_crack,star_tylenol,dingbat_lad,psycho_goofy,mushroom_east,howell_hans,Iwin_intuit,zen_loud,iron_wonton,pirate_flew,crab_iterate,hawaii_turnip,green_eeevil,rescue_hp,touch_neptune,foxtrot_honda,happy_bear,dutch_victor,loud_romulus,hurt_pluto,iterate_south,mouse_icarus,kaisha_yak,homer_donkey,ceres_whale,shrimp_eagle,jacques_bach,often_faster,palm_what,ladder_zinc,whiskey_egg,lion_sheep,cheese_ebi,muffin_joseph,balloon_yoku,tuna_bracket,mao_willem,arcade_chuck,malfoy_bull,dirk_charlie,prison_star,broom_kabar} = dragon_golf_dout;
end

reg feedback_pt_324;

always @(gnd or feedback_pt_324)
  begin
      atilla_hans =  gnd &  feedback_pt_324;
  end

reg feedback_pt_325;

always @(vcc or feedback_pt_325)
  begin
      golden_fallen =  vcc &  feedback_pt_325;
  end

reg feedback_pt_326;

always @(frog_emails or feedback_pt_326)
  begin
      fufu_mandarin = !frog_emails |  feedback_pt_326;
  end

reg feedback_pt_327;

always @(vicks_bach or feedback_pt_327)
  begin
      ohno_minnow = !vicks_bach ^ !feedback_pt_327;
  end

reg feedback_pt_328;

always @(fufu_mandarin or feedback_pt_328)
  begin
      happy_deuce = !fufu_mandarin |  feedback_pt_328;
  end

reg feedback_pt_329;

always @(lima_hummer or feedback_pt_329)
  begin
      cybex_moe = !lima_hummer &  feedback_pt_329;
  end

reg feedback_pt_330;

always @(spyro_neon or feedback_pt_330)
  begin
      peace_tin =  spyro_neon | !feedback_pt_330;
  end

reg feedback_pt_331;

always @(gnd or feedback_pt_331)
  begin
      lovey_guy =  gnd & !feedback_pt_331;
  end

reg feedback_pt_332;

always @(ford_comtrex or feedback_pt_332)
  begin
      whammy_armand = !ford_comtrex ^  feedback_pt_332;
  end

reg feedback_pt_333;

always @(rose_larry or feedback_pt_333)
  begin
      sanity_beast = !rose_larry ^  feedback_pt_333;
  end

reg feedback_pt_334;

always @(beetle_whale or feedback_pt_334)
  begin
      kungfu_itchy =  beetle_whale & !feedback_pt_334;
  end

reg feedback_pt_335;

always @(chillis_cybex or feedback_pt_335)
  begin
      platinum_crab = !chillis_cybex ^ !feedback_pt_335;
  end

reg feedback_pt_336;

always @(zen_firstpart or feedback_pt_336)
  begin
      goat_wujing =  zen_firstpart &  feedback_pt_336;
  end

reg feedback_pt_337;

always @(gnd or feedback_pt_337)
  begin
      sand_wanton = !gnd | !feedback_pt_337;
  end

reg feedback_pt_338;

always @(phoenix_ebay or feedback_pt_338)
  begin
      athena_arthur =  phoenix_ebay |  feedback_pt_338;
  end

reg feedback_pt_339;

always @(gnd or feedback_pt_339)
  begin
      stix_marvin = !gnd |  feedback_pt_339;
  end

reg feedback_pt_340;

always @(opus_riddler or feedback_pt_340)
  begin
      neon_xuprocar =  opus_riddler &  feedback_pt_340;
  end

reg feedback_pt_341;

always @(moron_curious or feedback_pt_341)
  begin
      broom_oranje =  moron_curious |  feedback_pt_341;
  end

reg feedback_pt_342;

always @(vcc or feedback_pt_342)
  begin
      maklak_gyro =  vcc ^  feedback_pt_342;
  end

reg feedback_pt_343;

always @(rescue_hp or feedback_pt_343)
  begin
      schwinger_bfs = !rescue_hp & !feedback_pt_343;
  end

reg feedback_pt_344;

always @(gnd or feedback_pt_344)
  begin
      hiswife_zinc =  gnd &  feedback_pt_344;
  end

reg feedback_pt_345;

always @(moe_burning or feedback_pt_345)
  begin
      lala_martian =  moe_burning & !feedback_pt_345;
  end

reg feedback_pt_346;

always @(cheese_ebi or feedback_pt_346)
  begin
      oracle_pixie = !cheese_ebi &  feedback_pt_346;
  end

reg feedback_pt_347;

always @(whiskey_bambi or feedback_pt_347)
  begin
      stix_unicorn = !whiskey_bambi & !feedback_pt_347;
  end

reg feedback_pt_348;

always @(dragon_broom or feedback_pt_348)
  begin
      ham_faster =  dragon_broom | !feedback_pt_348;
  end

reg feedback_pt_349;

always @(peace_tin or feedback_pt_349)
  begin
      marge_uppers =  peace_tin |  feedback_pt_349;
  end

reg feedback_pt_350;

always @(oracle_pixie or feedback_pt_350)
  begin
      due_theonion =  oracle_pixie & !feedback_pt_350;
  end

reg feedback_pt_351;

always @(obiwan_tonks or feedback_pt_351)
  begin
      peta_willy = !obiwan_tonks | !feedback_pt_351;
  end

reg feedback_pt_352;

always @(platinum_crab or feedback_pt_352)
  begin
      penguin_genji =  platinum_crab ^  feedback_pt_352;
  end

reg feedback_pt_353;

always @(babette_aphid or feedback_pt_353)
  begin
      sinew_rodent = !babette_aphid ^ !feedback_pt_353;
  end

reg feedback_pt_354;

always @(advil_yummy or feedback_pt_354)
  begin
      tobe_davidlin =  advil_yummy ^ !feedback_pt_354;
  end

reg feedback_pt_355;

always @(gnd or feedback_pt_355)
  begin
      llama_tobiko = !gnd &  feedback_pt_355;
  end

reg feedback_pt_356;

always @(baron_viagra or feedback_pt_356)
  begin
      louie_mideast = !baron_viagra | !feedback_pt_356;
  end

reg feedback_pt_357;

always @(sogood_drax or feedback_pt_357)
  begin
      warlock_rod = !sogood_drax |  feedback_pt_357;
  end

reg feedback_pt_358;

always @(kappa_drax or feedback_pt_358)
  begin
      zhuang_often = !kappa_drax ^  feedback_pt_358;
  end

reg feedback_pt_359;

always @(vcc or feedback_pt_359)
  begin
      star_obiwan = !vcc ^ !feedback_pt_359;
  end

reg feedback_pt_360;

always @(gnd or feedback_pt_360)
  begin
      star_yoku =  gnd & !feedback_pt_360;
  end

reg feedback_pt_361;

always @(whack_smack or feedback_pt_361)
  begin
      jcrew_chips =  whack_smack &  feedback_pt_361;
  end

reg feedback_pt_362;

always @(lao_shudamak or feedback_pt_362)
  begin
      fronds_pluto =  lao_shudamak ^  feedback_pt_362;
  end

reg feedback_pt_363;

always @(nest_mcnugget or feedback_pt_363)
  begin
      burning_tesla =  nest_mcnugget ^ !feedback_pt_363;
  end

reg feedback_pt_364;

always @(george_soccer or feedback_pt_364)
  begin
      gopher_thread =  george_soccer &  feedback_pt_364;
  end

reg feedback_pt_365;

always @(advil_yummy or feedback_pt_365)
  begin
      bear_golf =  advil_yummy | !feedback_pt_365;
  end

reg feedback_pt_366;

always @(touch_neptune or feedback_pt_366)
  begin
      ozzy_doc = !touch_neptune ^ !feedback_pt_366;
  end

reg feedback_pt_367;

always @(fufu_mandarin or feedback_pt_367)
  begin
      bagel_rubik =  fufu_mandarin ^ !feedback_pt_367;
  end

reg feedback_pt_368;

always @(chevys_mexico or feedback_pt_368)
  begin
      gm_school =  chevys_mexico ^  feedback_pt_368;
  end

reg feedback_pt_369;

always @(saturn_iguana or feedback_pt_369)
  begin
      rescue_george =  saturn_iguana | !feedback_pt_369;
  end

reg feedback_pt_370;

always @(psycho_goofy or feedback_pt_370)
  begin
      newt_devotion =  psycho_goofy &  feedback_pt_370;
  end

reg feedback_pt_371;

always @(killer_hanger or feedback_pt_371)
  begin
      plumber_fish = !killer_hanger ^  feedback_pt_371;
  end

reg feedback_pt_372;

always @(baron_foliage or feedback_pt_372)
  begin
      todd_beavis = !baron_foliage &  feedback_pt_372;
  end

reg feedback_pt_373;

always @(gnd or feedback_pt_373)
  begin
      stix_iterate = !gnd |  feedback_pt_373;
  end

reg feedback_pt_374;

always @(lion_sheep or feedback_pt_374)
  begin
      iron_lizard = !lion_sheep ^ !feedback_pt_374;
  end

reg feedback_pt_375;

always @(roe_lad or feedback_pt_375)
  begin
      tonks_england =  roe_lad ^ !feedback_pt_375;
  end

reg feedback_pt_376;

always @(fury_mozart or feedback_pt_376)
  begin
      drugs_ozzy = !fury_mozart |  feedback_pt_376;
  end

reg feedback_pt_377;

always @(leidiot_ghost or feedback_pt_377)
  begin
      killme_larry = !leidiot_ghost ^ !feedback_pt_377;
  end

reg feedback_pt_378;

always @(vcc or feedback_pt_378)
  begin
      arcade_ritsu = !vcc ^  feedback_pt_378;
  end

reg feedback_pt_379;

always @(bear_golf or feedback_pt_379)
  begin
      waster_beetle = !bear_golf & !feedback_pt_379;
  end

reg feedback_pt_380;

always @(pcp_aphid or feedback_pt_380)
  begin
      meth_dirk =  pcp_aphid & !feedback_pt_380;
  end

reg feedback_pt_381;

always @(vicks_bach or feedback_pt_381)
  begin
      kabar_tabby =  vicks_bach &  feedback_pt_381;
  end

reg feedback_pt_382;

always @(ham_bacon or feedback_pt_382)
  begin
      rod_wiggles = !ham_bacon ^  feedback_pt_382;
  end

reg feedback_pt_383;

always @(wine_eggsalad or feedback_pt_383)
  begin
      raiders_bart =  wine_eggsalad &  feedback_pt_383;
  end

reg feedback_pt_384;

always @(whammy_armand or feedback_pt_384)
  begin
      air_gutter = !whammy_armand | !feedback_pt_384;
  end

reg feedback_pt_385;

always @(star_obiwan or feedback_pt_385)
  begin
      air_wildboar = !star_obiwan |  feedback_pt_385;
  end

reg feedback_pt_386;

always @(vcc or feedback_pt_386)
  begin
      sinew_ghost =  vcc ^  feedback_pt_386;
  end

reg feedback_pt_387;

always @(pepsi_gerard or feedback_pt_387)
  begin
      remus_fallen = !pepsi_gerard ^ !feedback_pt_387;
  end

reg feedback_pt_388;

always @(ladder_zinc or feedback_pt_388)
  begin
      tango_ykocens = !ladder_zinc |  feedback_pt_388;
  end

reg feedback_pt_389;

always @(zen_loud or feedback_pt_389)
  begin
      maki_unicorn = !zen_loud | !feedback_pt_389;
  end

reg feedback_pt_390;

always @(lao_pegasus or feedback_pt_390)
  begin
      parrot_east =  lao_pegasus &  feedback_pt_390;
  end

reg feedback_pt_391;

always @(beauty_coffee or feedback_pt_391)
  begin
      rouge_plaster = !beauty_coffee |  feedback_pt_391;
  end

reg feedback_pt_392;

always @(timmy_snake or feedback_pt_392)
  begin
      powder_ariel = !timmy_snake |  feedback_pt_392;
  end

reg feedback_pt_393;

always @(roe_lad or feedback_pt_393)
  begin
      ants_edible =  roe_lad ^ !feedback_pt_393;
  end

reg feedback_pt_394;

always @(burner_mrbill or feedback_pt_394)
  begin
      bert_kaisha =  burner_mrbill & !feedback_pt_394;
  end

// AND all of these bits together
always @(tonks_england or vcc)
  begin
      dipsy_odin = & {tonks_england,vcc};
  end

// OR all of these bits together
always @(gnd or pizza_rose or oracle_pixie or tuna_bracket or elf_killer or badger_donkey or hp_rampacker)
  begin
      rubeus_acid = | {gnd,pizza_rose,oracle_pixie,tuna_bracket,elf_killer,badger_donkey,hp_rampacker};
  end

reg feedback_pt_395;

always @(elf_killer or feedback_pt_395)
  begin
      nest_cow =  elf_killer & !feedback_pt_395;
  end

reg feedback_pt_396;

always @(sanity_hp or feedback_pt_396)
  begin
      sears_rerun = !sanity_hp &  feedback_pt_396;
  end

reg feedback_pt_397;

always @(isle_mortgate or feedback_pt_397)
  begin
      arthur_att =  isle_mortgate &  feedback_pt_397;
  end

reg feedback_pt_398;

always @(lima_hummer or feedback_pt_398)
  begin
      pirate_joseph =  lima_hummer |  feedback_pt_398;
  end

reg feedback_pt_399;

always @(vcc or feedback_pt_399)
  begin
      newt_cheese =  vcc |  feedback_pt_399;
  end

reg feedback_pt_400;

always @(green_eeevil or feedback_pt_400)
  begin
      green_bep =  green_eeevil ^ !feedback_pt_400;
  end

reg feedback_pt_401;

always @(tiger_eagle or feedback_pt_401)
  begin
      draco_salmon =  tiger_eagle & !feedback_pt_401;
  end

reg feedback_pt_402;

always @(gnd or feedback_pt_402)
  begin
      lion_grumby = !gnd |  feedback_pt_402;
  end

reg feedback_pt_403;

always @(vcc or feedback_pt_403)
  begin
      butthead_duey =  vcc |  feedback_pt_403;
  end

reg feedback_pt_404;

always @(show_theseus or feedback_pt_404)
  begin
      mars_turkey =  show_theseus |  feedback_pt_404;
  end

reg feedback_pt_405;

always @(lovey_guy or feedback_pt_405)
  begin
      oscar_cheez =  lovey_guy ^  feedback_pt_405;
  end

reg feedback_pt_406;

always @(vcc or feedback_pt_406)
  begin
      hippo_lao = !vcc ^  feedback_pt_406;
  end

reg feedback_pt_407;

always @(illegal_dow or feedback_pt_407)
  begin
      bravo_sapporo =  illegal_dow &  feedback_pt_407;
  end

reg feedback_pt_408;

always @(gnd or feedback_pt_408)
  begin
      leaky_mortar =  gnd |  feedback_pt_408;
  end

reg feedback_pt_409;

always @(sugar_coconut or feedback_pt_409)
  begin
      egg_abel =  sugar_coconut |  feedback_pt_409;
  end

reg feedback_pt_410;

always @(itchy_oranje or feedback_pt_410)
  begin
      xterm_sierra =  itchy_oranje | !feedback_pt_410;
  end

reg feedback_pt_411;

always @(vcc or feedback_pt_411)
  begin
      tobe_ants =  vcc | !feedback_pt_411;
  end

reg feedback_pt_412;

always @(gnd or feedback_pt_412)
  begin
      zebra_bubba = !gnd & !feedback_pt_412;
  end

reg feedback_pt_413;

always @(schwinger_red or feedback_pt_413)
  begin
      hans_voodoo = !schwinger_red &  feedback_pt_413;
  end

reg feedback_pt_414;

always @(gnd or feedback_pt_414)
  begin
      Iwin_ladder =  gnd |  feedback_pt_414;
  end

reg feedback_pt_415;

always @(stix_marvin or feedback_pt_415)
  begin
      rat_solder =  stix_marvin |  feedback_pt_415;
  end

reg feedback_pt_416;

always @(tobe_foiled or feedback_pt_416)
  begin
      escape_rojas =  tobe_foiled ^  feedback_pt_416;
  end

reg feedback_pt_417;

always @(lupin_gotone or feedback_pt_417)
  begin
      spyro_might =  lupin_gotone &  feedback_pt_417;
  end

reg feedback_pt_418;

always @(often_crack or feedback_pt_418)
  begin
      sun_mrbill = !often_crack | !feedback_pt_418;
  end

reg feedback_pt_419;

always @(turnip_foiled or feedback_pt_419)
  begin
      south_aspirin =  turnip_foiled ^ !feedback_pt_419;
  end

reg feedback_pt_420;

always @(egg_barney or feedback_pt_420)
  begin
      togos_haze = !egg_barney ^ !feedback_pt_420;
  end

reg feedback_pt_421;

always @(vcc or feedback_pt_421)
  begin
      papyrus_huey =  vcc | !feedback_pt_421;
  end

reg feedback_pt_422;

always @(gnd or feedback_pt_422)
  begin
      heidi_crank =  gnd &  feedback_pt_422;
  end

reg feedback_pt_423;

always @(happy_deuce or feedback_pt_423)
  begin
      sinew_gulp = !happy_deuce &  feedback_pt_423;
  end

reg feedback_pt_424;

always @(newt_cheese or feedback_pt_424)
  begin
      turkey_sanity =  newt_cheese & !feedback_pt_424;
  end

reg feedback_pt_425;

always @(bono_bonafide or feedback_pt_425)
  begin
      lovey_ring = !bono_bonafide ^ !feedback_pt_425;
  end

reg feedback_pt_426;

always @(sand_wanton or feedback_pt_426)
  begin
      sun_larry =  sand_wanton | !feedback_pt_426;
  end

reg feedback_pt_427;

always @(marge_uppers or feedback_pt_427)
  begin
      turtle_kilo =  marge_uppers &  feedback_pt_427;
  end

reg feedback_pt_428;

always @(bert_kaisha or feedback_pt_428)
  begin
      fang_honda = !bert_kaisha |  feedback_pt_428;
  end

reg feedback_pt_429;

always @(bfs_mortar or feedback_pt_429)
  begin
      snort_nasdaq =  bfs_mortar & !feedback_pt_429;
  end

reg feedback_pt_430;

always @(gap_greenbay or feedback_pt_430)
  begin
      charlie_ariel =  gap_greenbay ^ !feedback_pt_430;
  end

reg feedback_pt_431;

always @(golden_fallen or feedback_pt_431)
  begin
      mandarin_bfs = !golden_fallen &  feedback_pt_431;
  end

reg feedback_pt_432;

always @(hippo_lao or feedback_pt_432)
  begin
      desert_albus = !hippo_lao ^  feedback_pt_432;
  end

reg feedback_pt_433;

always @(lovey_ring or feedback_pt_433)
  begin
      zeus_po = !lovey_ring ^  feedback_pt_433;
  end

reg feedback_pt_434;

always @(gnd or feedback_pt_434)
  begin
      yellow_victor =  gnd ^  feedback_pt_434;
  end

reg feedback_pt_435;

always @(sinew_intel or feedback_pt_435)
  begin
      crab_popcorn = !sinew_intel &  feedback_pt_435;
  end

reg feedback_pt_436;

always @(pcp_master or feedback_pt_436)
  begin
      fufu_bono = !pcp_master |  feedback_pt_436;
  end

reg feedback_pt_437;

always @(dig_obiwan or feedback_pt_437)
  begin
      money_delta = !dig_obiwan | !feedback_pt_437;
  end

reg feedback_pt_438;

always @(zhuang_often or feedback_pt_438)
  begin
      doobie_macys = !zhuang_often ^  feedback_pt_438;
  end

reg feedback_pt_439;

always @(foxtrot_honda or feedback_pt_439)
  begin
      fufu_vangoh = !foxtrot_honda |  feedback_pt_439;
  end

reg feedback_pt_440;

always @(protest_cow or feedback_pt_440)
  begin
      lala_sanity =  protest_cow |  feedback_pt_440;
  end

reg feedback_pt_441;

always @(turkey_tank or feedback_pt_441)
  begin
      kilo_marge =  turkey_tank ^  feedback_pt_441;
  end

reg feedback_pt_442;

always @(sirius_dopey or feedback_pt_442)
  begin
      sinew_wine = !sirius_dopey ^ !feedback_pt_442;
  end

reg feedback_pt_443;

always @(green_bep or feedback_pt_443)
  begin
      bagel_howell =  green_bep ^  feedback_pt_443;
  end

reg feedback_pt_444;

always @(bravo_exodus or feedback_pt_444)
  begin
      meth_athena =  bravo_exodus | !feedback_pt_444;
  end

reg feedback_pt_445;

always @(clay_ritsu or feedback_pt_445)
  begin
      hector_mao = !clay_ritsu | !feedback_pt_445;
  end

reg feedback_pt_446;

always @(fufu_vangoh or feedback_pt_446)
  begin
      spock_webvan = !fufu_vangoh & !feedback_pt_446;
  end

reg feedback_pt_447;

always @(knot_picante or feedback_pt_447)
  begin
      rat_fsncens = !knot_picante ^ !feedback_pt_447;
  end

reg feedback_pt_448;

always @(vicks_bach or feedback_pt_448)
  begin
      chillis_fish =  vicks_bach &  feedback_pt_448;
  end

reg feedback_pt_449;

always @(lao_steaming or feedback_pt_449)
  begin
      bart_speed = !lao_steaming ^  feedback_pt_449;
  end

reg feedback_pt_450;

always @(escape_jesus or feedback_pt_450)
  begin
      coconut_witch = !escape_jesus ^ !feedback_pt_450;
  end

reg feedback_pt_451;

always @(schwinger_bfs or feedback_pt_451)
  begin
      mouse_ghost = !schwinger_bfs ^ !feedback_pt_451;
  end

reg feedback_pt_452;

always @(vcc or feedback_pt_452)
  begin
      bagel_atomic = !vcc &  feedback_pt_452;
  end

reg feedback_pt_453;

always @(wonder_fronds or feedback_pt_453)
  begin
      books_rodent =  wonder_fronds &  feedback_pt_453;
  end

reg feedback_pt_454;

always @(books_rodent or feedback_pt_454)
  begin
      bush_uppers = !books_rodent &  feedback_pt_454;
  end

reg feedback_pt_455;

always @(square_hagrid or feedback_pt_455)
  begin
      lamer_fear = !square_hagrid | !feedback_pt_455;
  end

reg feedback_pt_456;

always @(potato_bull or feedback_pt_456)
  begin
      midas_dirty = !potato_bull & !feedback_pt_456;
  end

reg feedback_pt_457;

always @(zen_drugie or feedback_pt_457)
  begin
      turtle_life = !zen_drugie &  feedback_pt_457;
  end

reg feedback_pt_458;

always @(raiders_louie or feedback_pt_458)
  begin
      ibm_fsncens = !raiders_louie | !feedback_pt_458;
  end

reg feedback_pt_459;

always @(gnd or feedback_pt_459)
  begin
      north_pacbell = !gnd &  feedback_pt_459;
  end

reg feedback_pt_460;

always @(gnd or feedback_pt_460)
  begin
      black_yoku =  gnd ^  feedback_pt_460;
  end

reg feedback_pt_461;

always @(cheez_zedong or feedback_pt_461)
  begin
      hummer_potter = !cheez_zedong &  feedback_pt_461;
  end

reg feedback_pt_462;

always @(gnd or feedback_pt_462)
  begin
      nobody_ebi = !gnd |  feedback_pt_462;
  end

reg feedback_pt_463;

always @(gnd or feedback_pt_463)
  begin
      pdaddy_willy =  gnd | !feedback_pt_463;
  end

reg feedback_pt_464;

always @(ready_spirit or feedback_pt_464)
  begin
      tako_handroll =  ready_spirit | !feedback_pt_464;
  end

reg feedback_pt_465;

always @(plaster_yummy or feedback_pt_465)
  begin
      meth_platypus =  plaster_yummy & !feedback_pt_465;
  end

reg feedback_pt_466;

always @(desert_albus or feedback_pt_466)
  begin
      sugar_newt = !desert_albus |  feedback_pt_466;
  end

reg feedback_pt_467;

always @(eggsalad_dirk or feedback_pt_467)
  begin
      jacuzzi_tabby = !eggsalad_dirk ^ !feedback_pt_467;
  end

reg feedback_pt_468;

always @(vcc or feedback_pt_468)
  begin
      joseph_hoser =  vcc &  feedback_pt_468;
  end

reg feedback_pt_469;

always @(vcc or feedback_pt_469)
  begin
      macys_neptune =  vcc & !feedback_pt_469;
  end

reg feedback_pt_470;

always @(seashell_abel or feedback_pt_470)
  begin
      stroop_bart = !seashell_abel | !feedback_pt_470;
  end

reg feedback_pt_471;

always @(gnd or feedback_pt_471)
  begin
      maryann_hotel =  gnd &  feedback_pt_471;
  end

reg feedback_pt_472;

always @(advil_cow or feedback_pt_472)
  begin
      tracy_gyro = !advil_cow ^ !feedback_pt_472;
  end

reg feedback_pt_473;

always @(burning_ohno or feedback_pt_473)
  begin
      due_bolt = !burning_ohno |  feedback_pt_473;
  end

reg feedback_pt_474;

always @(vcc or feedback_pt_474)
  begin
      kennyg_tracy = !vcc ^ !feedback_pt_474;
  end

reg feedback_pt_475;

always @(broom_kabar or feedback_pt_475)
  begin
      genji_fuji =  broom_kabar ^ !feedback_pt_475;
  end

reg feedback_pt_476;

always @(newt_clothing or feedback_pt_476)
  begin
      pcp_waster =  newt_clothing ^ !feedback_pt_476;
  end

reg feedback_pt_477;

always @(elguapo_ghost or feedback_pt_477)
  begin
      tako_remus =  elguapo_ghost ^ !feedback_pt_477;
  end

reg feedback_pt_478;

always @(venus_martian or feedback_pt_478)
  begin
      achilles_dig = !venus_martian & !feedback_pt_478;
  end

reg feedback_pt_479;

always @(macys_neptune or feedback_pt_479)
  begin
      marker_tako = !macys_neptune & !feedback_pt_479;
  end

reg feedback_pt_480;

always @(riddler_hans or feedback_pt_480)
  begin
      xuprocar_fuji =  riddler_hans |  feedback_pt_480;
  end

reg feedback_pt_481;

always @(wine_monster or feedback_pt_481)
  begin
      phoenix_ozzy = !wine_monster ^  feedback_pt_481;
  end

reg feedback_pt_482;

always @(fire_boing or feedback_pt_482)
  begin
      nation_potato =  fire_boing | !feedback_pt_482;
  end

reg feedback_pt_483;

always @(jcrew_chips or feedback_pt_483)
  begin
      bambi_bubba = !jcrew_chips & !feedback_pt_483;
  end

reg feedback_pt_484;

always @(ceres_bach or feedback_pt_484)
  begin
      martin_sirius =  ceres_bach |  feedback_pt_484;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_wukong <= 0;
    else if (bambi_bubba)
      itchy_wukong <= vcc;
  end

always @(itchy_wukong)
  begin
      feedback_pt_284 = itchy_wukong;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oranje_spyro <= 0;
    else if (gnd)
      oranje_spyro <= vangoh_dadada;
    else if (turkey_sanity)
      oranje_spyro <= 0;
  end

always @(oranje_spyro)
  begin
      feedback_pt_285 = oranje_spyro;
  end

always @(oranje_spyro)
  begin
      feedback_pt_286 = oranje_spyro;
  end

always @(oranje_spyro)
  begin
      feedback_pt_287 = oranje_spyro;
  end

always @(oranje_spyro)
  begin
      feedback_pt_288 = oranje_spyro;
  end

always @(oranje_spyro)
  begin
      feedback_pt_289 = oranje_spyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_pomodoro <= 0;
    else if (homer_donkey)
      moe_pomodoro <= lockheed_fire;
    else if (whiskey_egg)
      moe_pomodoro <= 0;
  end

always @(moe_pomodoro)
  begin
      feedback_pt_290 = moe_pomodoro;
  end

always @(moe_pomodoro)
  begin
      feedback_pt_291 = moe_pomodoro;
  end

always @(moe_pomodoro)
  begin
      feedback_pt_292 = moe_pomodoro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deuce_air <= 0;
    else if (gnd)
      deuce_air <= yeanyow_atoms;
  end

always @(deuce_air)
  begin
      feedback_pt_293 = deuce_air;
  end

always @(deuce_air)
  begin
      feedback_pt_294 = deuce_air;
  end

always @(deuce_air)
  begin
      feedback_pt_295 = deuce_air;
  end

always @(deuce_air)
  begin
      feedback_pt_296 = deuce_air;
  end

always @(deuce_air)
  begin
      feedback_pt_297 = deuce_air;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hagrid_zeus <= 0;
    else if (sanity_beast)
      hagrid_zeus <= att_maryann;
  end

always @(hagrid_zeus)
  begin
      feedback_pt_298 = hagrid_zeus;
  end

always @(hagrid_zeus)
  begin
      feedback_pt_299 = hagrid_zeus;
  end

always @(hagrid_zeus)
  begin
      feedback_pt_300 = hagrid_zeus;
  end

always @(hagrid_zeus)
  begin
      feedback_pt_301 = hagrid_zeus;
  end

always @(hagrid_zeus)
  begin
      feedback_pt_302 = hagrid_zeus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dog_vulture <= 0;
    else
      dog_vulture <= tako_remus;
  end

always @(dog_vulture)
  begin
      feedback_pt_303 = dog_vulture;
  end

always @(dog_vulture)
  begin
      feedback_pt_304 = dog_vulture;
  end

always @(dog_vulture)
  begin
      feedback_pt_305 = dog_vulture;
  end

always @(dog_vulture)
  begin
      feedback_pt_306 = dog_vulture;
  end

always @(dog_vulture)
  begin
      feedback_pt_307 = dog_vulture;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platypus_Iwin <= 1;
    else
      platypus_Iwin <= chips_jacuzzi;
  end

always @(platypus_Iwin)
  begin
      feedback_pt_308 = platypus_Iwin;
  end

always @(platypus_Iwin)
  begin
      feedback_pt_309 = platypus_Iwin;
  end

always @(platypus_Iwin)
  begin
      feedback_pt_310 = platypus_Iwin;
  end

always @(platypus_Iwin)
  begin
      feedback_pt_311 = platypus_Iwin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blaster_togos <= 0;
    else if (pdaddy_willy)
      blaster_togos <= tracy_gyro;
  end

always @(blaster_togos)
  begin
      feedback_pt_312 = blaster_togos;
  end

always @(blaster_togos)
  begin
      feedback_pt_313 = blaster_togos;
  end

always @(blaster_togos)
  begin
      feedback_pt_314 = blaster_togos;
  end

always @(blaster_togos)
  begin
      feedback_pt_315 = blaster_togos;
  end

always @(blaster_togos)
  begin
      feedback_pt_316 = blaster_togos;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      copper_rubeus <= 0;
    else if (richard_lamer)
      copper_rubeus <= money_delta;
    else if (hawaii_turnip)
      copper_rubeus <= 0;
  end

always @(copper_rubeus)
  begin
      feedback_pt_317 = copper_rubeus;
  end

wire riddler_stix_wire;

dffeas riddler_stix_ff (
  .clk(clock1),
  .d(acid_muffin),
  .ena(vcc),
  .sclr(broom_oranje),
  .sload(golden_robust),
  .asdata(gnd),
  .clrn(!reset1),
  .q(riddler_stix_wire)
);

always @(riddler_stix_wire) begin
   tasty_condit = riddler_stix_wire;
end

always @(tasty_condit)
  begin
      feedback_pt_318 = tasty_condit;
  end

always @(tasty_condit)
  begin
      feedback_pt_319 = tasty_condit;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marker_potter <= 0;
    else if (venus_martian)
      marker_potter <= 0;
    else if (weasley_hinge)
      marker_potter <= tunafish_duey;
  end

always @(marker_potter)
  begin
      feedback_pt_320 = marker_potter;
  end

always @(marker_potter)
  begin
      feedback_pt_321 = marker_potter;
  end

always @(marker_potter)
  begin
      feedback_pt_322 = marker_potter;
  end

always @(marker_potter)
  begin
      feedback_pt_323 = marker_potter;
  end

always @(marker_potter)
  begin
      feedback_pt_324 = marker_potter;
  end

wire bracket_boing_wire;

dffeas bracket_boing_ff (
  .clk(clock1),
  .d(sugar_newt),
  .ena(vcc),
  .sclr(bismuth_fire),
  .sload(jacob_ulysses),
  .asdata(potato_bull),
  .clrn(!reset1),
  .q(bracket_boing_wire)
);

always @(bracket_boing_wire) begin
   zi_zed = bracket_boing_wire;
end

always @(zi_zed)
  begin
      feedback_pt_325 = zi_zed;
  end

always @(zi_zed)
  begin
      feedback_pt_326 = zi_zed;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tank_eagle <= 0;
    else if (cain_wiggles)
      tank_eagle <= 0;
    else if (mushroom_east)
      tank_eagle <= vcc;
  end

always @(tank_eagle)
  begin
      feedback_pt_327 = tank_eagle;
  end

always @(tank_eagle)
  begin
      feedback_pt_328 = tank_eagle;
  end

always @(tank_eagle)
  begin
      feedback_pt_329 = tank_eagle;
  end

always @(tank_eagle)
  begin
      feedback_pt_330 = tank_eagle;
  end

wire george_roe_wire;

dffea george_roe_ff (
  .clk(clock1),
  .d(newt_cheese),
  .ena(pizza_rose),
  .adata(purple_rod),
  .clrn(!reset1),
  .q(george_roe_wire)
);

always @(george_roe_wire) begin
   banality_tuna = george_roe_wire;
end

always @(banality_tuna)
  begin
      feedback_pt_331 = banality_tuna;
  end

always @(banality_tuna)
  begin
      feedback_pt_332 = banality_tuna;
  end

always @(banality_tuna)
  begin
      feedback_pt_333 = banality_tuna;
  end

always @(banality_tuna)
  begin
      feedback_pt_334 = banality_tuna;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_crank <= 0;
    else
      south_crank <= chainsaw_tofu;
  end

always @(south_crank)
  begin
      feedback_pt_335 = south_crank;
  end

always @(south_crank)
  begin
      feedback_pt_336 = south_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubeus_att <= 0;
    else
      rubeus_att <= yeanyow_atoms;
  end

always @(rubeus_att)
  begin
      feedback_pt_337 = rubeus_att;
  end

always @(rubeus_att)
  begin
      feedback_pt_338 = rubeus_att;
  end

always @(rubeus_att)
  begin
      feedback_pt_339 = rubeus_att;
  end

wire freaky_winner_wire;

dffeas freaky_winner_ff (
  .clk(clock1),
  .d(spirit_loser),
  .ena(vcc),
  .sclr(loser_echo),
  .sload(gnd),
  .asdata(marco_chevys),
  .clrn(!reset1),
  .q(freaky_winner_wire)
);

always @(freaky_winner_wire) begin
   kdqcens_ritsu = freaky_winner_wire;
end

always @(kdqcens_ritsu)
  begin
      feedback_pt_340 = kdqcens_ritsu;
  end

always @(kdqcens_ritsu)
  begin
      feedback_pt_341 = kdqcens_ritsu;
  end

always @(kdqcens_ritsu)
  begin
      feedback_pt_342 = kdqcens_ritsu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sirius_zhuang <= 0;
    else if (kanji_bambi)
      sirius_zhuang <= bagel_atomic;
    else if (egg_abel)
      sirius_zhuang <= 0;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_343 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_344 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_345 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_346 = sirius_zhuang;
  end

always @(sirius_zhuang)
  begin
      feedback_pt_347 = sirius_zhuang;
  end

wire wukong_float_wire;

dffeas wukong_float_ff (
  .clk(clock1),
  .d(minerva_wakey),
  .ena(gnd),
  .sclr(cafe_concorde),
  .sload(bono_homer),
  .asdata(nyc_rod),
  .clrn(!reset1),
  .q(wukong_float_wire)
);

always @(wukong_float_wire) begin
   exodus_touch = wukong_float_wire;
end

always @(exodus_touch)
  begin
      feedback_pt_348 = exodus_touch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tuna_baron <= 1;
    else
      tuna_baron <= curie_lost;
  end

always @(tuna_baron)
  begin
      feedback_pt_349 = tuna_baron;
  end

wire fufu_eagle_wire;

dffeas fufu_eagle_ff (
  .clk(clock1),
  .d(often_surfer),
  .ena(kebab_arizona),
  .sclr(curly_baron),
  .sload(sinew_ghost),
  .asdata(killme_larry),
  .clrn(!reset1),
  .q(fufu_eagle_wire)
);

always @(fufu_eagle_wire) begin
   beetle_wakey = fufu_eagle_wire;
end

always @(beetle_wakey)
  begin
      feedback_pt_350 = beetle_wakey;
  end

always @(beetle_wakey)
  begin
      feedback_pt_351 = beetle_wakey;
  end

always @(beetle_wakey)
  begin
      feedback_pt_352 = beetle_wakey;
  end

wire dopey_pierre_wire;

dffeas dopey_pierre_ff (
  .clk(clock1),
  .d(ibm_fsncens),
  .ena(moe_pomodoro),
  .sclr(balloon_yoku),
  .sload(lion_grumby),
  .asdata(sinew_gulp),
  .clrn(!reset1),
  .q(dopey_pierre_wire)
);

always @(dopey_pierre_wire) begin
   deng_gyro = dopey_pierre_wire;
end

always @(deng_gyro)
  begin
      feedback_pt_353 = deng_gyro;
  end

always @(deng_gyro)
  begin
      feedback_pt_354 = deng_gyro;
  end

always @(deng_gyro)
  begin
      feedback_pt_355 = deng_gyro;
  end

wire advil_tango_wire;

dffeas advil_tango_ff (
  .clk(clock1),
  .d(zulu_satanist),
  .ena(cocacola_milo),
  .sclr(sogood_drax),
  .sload(skipper_gonzo),
  .asdata(salmon_badger),
  .clrn(!reset1),
  .q(advil_tango_wire)
);

always @(advil_tango_wire) begin
   riddler_po = advil_tango_wire;
end

always @(riddler_po)
  begin
      feedback_pt_356 = riddler_po;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_lxtcen <= 0;
    else if (oldnavy_romex)
      fronds_lxtcen <= mine_nasdaq;
    else if (arcade_chuck)
      fronds_lxtcen <= 0;
  end

always @(fronds_lxtcen)
  begin
      feedback_pt_357 = fronds_lxtcen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubeus_mortar <= 0;
    else if (llama_tobiko)
      rubeus_mortar <= 0;
    else if (gnd)
      rubeus_mortar <= gin_ceres;
  end

always @(rubeus_mortar)
  begin
      feedback_pt_358 = rubeus_mortar;
  end

always @(rubeus_mortar)
  begin
      feedback_pt_359 = rubeus_mortar;
  end

always @(rubeus_mortar)
  begin
      feedback_pt_360 = rubeus_mortar;
  end

always @(rubeus_mortar)
  begin
      feedback_pt_361 = rubeus_mortar;
  end

always @(rubeus_mortar)
  begin
      feedback_pt_362 = rubeus_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_clay <= 1;
    else
      knot_clay <= riddler_po;
  end

always @(knot_clay)
  begin
      feedback_pt_363 = knot_clay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_honey <= 0;
    else if (richard_lamer)
      mao_honey <= moron_curious;
  end

always @(mao_honey)
  begin
      feedback_pt_364 = mao_honey;
  end

always @(mao_honey)
  begin
      feedback_pt_365 = mao_honey;
  end

always @(mao_honey)
  begin
      feedback_pt_366 = mao_honey;
  end

always @(mao_honey)
  begin
      feedback_pt_367 = mao_honey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      surfer_fuji <= 0;
    else if (yummy_pizza)
      surfer_fuji <= 0;
    else if (nyc_pizza)
      surfer_fuji <= yankee_zi;
  end

always @(surfer_fuji)
  begin
      feedback_pt_368 = surfer_fuji;
  end

always @(surfer_fuji)
  begin
      feedback_pt_369 = surfer_fuji;
  end

always @(surfer_fuji)
  begin
      feedback_pt_370 = surfer_fuji;
  end

wire tonks_fallen_wire;

dffeas tonks_fallen_ff (
  .clk(clock1),
  .d(gnd),
  .ena(pirate_gutter),
  .sclr(vicks_bach),
  .sload(itchy_wukong),
  .asdata(ebay_sogood),
  .clrn(!reset1),
  .q(tonks_fallen_wire)
);

always @(tonks_fallen_wire) begin
   cain_tuna = tonks_fallen_wire;
end

always @(cain_tuna)
  begin
      feedback_pt_371 = cain_tuna;
  end

always @(cain_tuna)
  begin
      feedback_pt_372 = cain_tuna;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wood_gokidsgo <= 0;
    else if (malfoy_bull)
      wood_gokidsgo <= vcc;
    else if (beetle_star)
      wood_gokidsgo <= 0;
  end

always @(wood_gokidsgo)
  begin
      feedback_pt_373 = wood_gokidsgo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_freaky <= 0;
    else if (what_doobie)
      boing_freaky <= vcc;
  end

always @(boing_freaky)
  begin
      feedback_pt_374 = boing_freaky;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_mickey <= 0;
    else
      animal_mickey <= deuce_bismuth;
  end

always @(animal_mickey)
  begin
      feedback_pt_375 = animal_mickey;
  end

always @(animal_mickey)
  begin
      feedback_pt_376 = animal_mickey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      duey_superman <= 1;
    else
      duey_superman <= mandarin_bfs;
  end

always @(duey_superman)
  begin
      feedback_pt_377 = duey_superman;
  end

always @(duey_superman)
  begin
      feedback_pt_378 = duey_superman;
  end

wire wine_edible_wire;

dffeas wine_edible_ff (
  .clk(clock1),
  .d(stix_iterate),
  .ena(knot_clay),
  .sclr(rubeus_att),
  .sload(fronds_lxtcen),
  .asdata(homerun_meth),
  .clrn(!reset1),
  .q(wine_edible_wire)
);

always @(wine_edible_wire) begin
   joseph_deuce = wine_edible_wire;
end

always @(joseph_deuce)
  begin
      feedback_pt_379 = joseph_deuce;
  end

always @(joseph_deuce)
  begin
      feedback_pt_380 = joseph_deuce;
  end

always @(joseph_deuce)
  begin
      feedback_pt_381 = joseph_deuce;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      brian_advil <= 0;
    else if (whiskey_crank)
      brian_advil <= due_theonion;
    else if (gnd)
      brian_advil <= 0;
  end

always @(brian_advil)
  begin
      feedback_pt_382 = brian_advil;
  end

always @(brian_advil)
  begin
      feedback_pt_383 = brian_advil;
  end

always @(brian_advil)
  begin
      feedback_pt_384 = brian_advil;
  end

always @(brian_advil)
  begin
      feedback_pt_385 = brian_advil;
  end

wire pixie_india_wire;

dffeas pixie_india_ff (
  .clk(clock1),
  .d(deng_gerrit),
  .ena(Iwin_ladder),
  .sclr(seashell_mars),
  .sload(parrot_east),
  .asdata(floo_saturn),
  .clrn(!reset1),
  .q(pixie_india_wire)
);

always @(pixie_india_wire) begin
   china_fitter = pixie_india_wire;
end

always @(china_fitter)
  begin
      feedback_pt_386 = china_fitter;
  end

always @(china_fitter)
  begin
      feedback_pt_387 = china_fitter;
  end

always @(china_fitter)
  begin
      feedback_pt_388 = china_fitter;
  end

always @(china_fitter)
  begin
      feedback_pt_389 = china_fitter;
  end

always @(china_fitter)
  begin
      feedback_pt_390 = china_fitter;
  end

wire ebi_iwocensor_wire;

dffeas ebi_iwocensor_ff (
  .clk(clock1),
  .d(dingbat_lad),
  .ena(grams_wakey),
  .sclr(ozzy_doc),
  .sload(vcc),
  .asdata(gnd),
  .clrn(!reset1),
  .q(ebi_iwocensor_wire)
);

always @(ebi_iwocensor_wire) begin
   jesus_what = ebi_iwocensor_wire;
end

always @(jesus_what)
  begin
      feedback_pt_391 = jesus_what;
  end

always @(jesus_what)
  begin
      feedback_pt_392 = jesus_what;
  end

always @(jesus_what)
  begin
      feedback_pt_393 = jesus_what;
  end

always @(jesus_what)
  begin
      feedback_pt_394 = jesus_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elian_bamboo <= 0;
    else if (hurt_pluto)
      elian_bamboo <= vcc;
  end

always @(elian_bamboo)
  begin
      feedback_pt_395 = elian_bamboo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killer_curie <= 0;
    else if (knot_picante)
      killer_curie <= avon_century;
  end

always @(killer_curie)
  begin
      feedback_pt_396 = killer_curie;
  end

always @(killer_curie)
  begin
      feedback_pt_397 = killer_curie;
  end

always @(killer_curie)
  begin
      feedback_pt_398 = killer_curie;
  end

always @(killer_curie)
  begin
      feedback_pt_399 = killer_curie;
  end

always @(killer_curie)
  begin
      feedback_pt_400 = killer_curie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_richard <= 0;
    else if (gnd)
      hp_richard <= palmer_bust;
  end

always @(hp_richard)
  begin
      feedback_pt_401 = hp_richard;
  end

always @(hp_richard)
  begin
      feedback_pt_402 = hp_richard;
  end

always @(hp_richard)
  begin
      feedback_pt_403 = hp_richard;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotel_zed <= 1;
    else
      hotel_zed <= gnd;
  end

always @(hotel_zed)
  begin
      feedback_pt_404 = hotel_zed;
  end

always @(hotel_zed)
  begin
      feedback_pt_405 = hotel_zed;
  end

always @(hotel_zed)
  begin
      feedback_pt_406 = hotel_zed;
  end

always @(hotel_zed)
  begin
      feedback_pt_407 = hotel_zed;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dingbat_snape <= 0;
    else if (vcc)
      dingbat_snape <= pcp_waster;
  end

always @(dingbat_snape)
  begin
      feedback_pt_408 = dingbat_snape;
  end

always @(dingbat_snape)
  begin
      feedback_pt_409 = dingbat_snape;
  end

always @(dingbat_snape)
  begin
      feedback_pt_410 = dingbat_snape;
  end

always @(dingbat_snape)
  begin
      feedback_pt_411 = dingbat_snape;
  end

wire bubba_doc_wire;

dffeas bubba_doc_ff (
  .clk(clock1),
  .d(marge_uppers),
  .ena(rouge_plaster),
  .sclr(zeus_hinkley),
  .sload(peta_willy),
  .asdata(ernie_emu),
  .clrn(!reset1),
  .q(bubba_doc_wire)
);

always @(bubba_doc_wire) begin
   pixie_hummer = bubba_doc_wire;
end

always @(pixie_hummer)
  begin
      feedback_pt_412 = pixie_hummer;
  end

always @(pixie_hummer)
  begin
      feedback_pt_413 = pixie_hummer;
  end

always @(pixie_hummer)
  begin
      feedback_pt_414 = pixie_hummer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vangoh_hinge <= 0;
    else if (dragon_broom)
      vangoh_hinge <= vcc;
  end

always @(vangoh_hinge)
  begin
      feedback_pt_415 = vangoh_hinge;
  end

always @(vangoh_hinge)
  begin
      feedback_pt_416 = vangoh_hinge;
  end

always @(vangoh_hinge)
  begin
      feedback_pt_417 = vangoh_hinge;
  end

always @(vangoh_hinge)
  begin
      feedback_pt_418 = vangoh_hinge;
  end

always @(vangoh_hinge)
  begin
      feedback_pt_419 = vangoh_hinge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_salami <= 1;
    else
      lotus_salami <= midas_dirty;
  end

always @(lotus_salami)
  begin
      feedback_pt_420 = lotus_salami;
  end

always @(lotus_salami)
  begin
      feedback_pt_421 = lotus_salami;
  end

always @(lotus_salami)
  begin
      feedback_pt_422 = lotus_salami;
  end

always @(lotus_salami)
  begin
      feedback_pt_423 = lotus_salami;
  end

wire martin_safada_wire;

dffeas martin_safada_ff (
  .clk(clock1),
  .d(giraffe_huey),
  .ena(gnd),
  .sclr(nobody_ebi),
  .sload(babette_crank),
  .asdata(tobe_ants),
  .clrn(!reset1),
  .q(martin_safada_wire)
);

always @(martin_safada_wire) begin
   peaves_hut = martin_safada_wire;
end

always @(peaves_hut)
  begin
      feedback_pt_424 = peaves_hut;
  end

always @(peaves_hut)
  begin
      feedback_pt_425 = peaves_hut;
  end

always @(peaves_hut)
  begin
      feedback_pt_426 = peaves_hut;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ready_xray <= 0;
    else if (gnd)
      ready_xray <= cybex_moe;
    else if (rodriguez_guy)
      ready_xray <= 0;
  end

always @(ready_xray)
  begin
      feedback_pt_427 = ready_xray;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_tapered <= 1;
    else
      rerun_tapered <= vcc;
  end

always @(rerun_tapered)
  begin
      feedback_pt_428 = rerun_tapered;
  end

always @(rerun_tapered)
  begin
      feedback_pt_429 = rerun_tapered;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vadar_protest <= 0;
    else if (pcp_waster)
      vadar_protest <= nobody_ebi;
    else if (nigiri_ford)
      vadar_protest <= 0;
  end

always @(vadar_protest)
  begin
      feedback_pt_430 = vadar_protest;
  end

always @(vadar_protest)
  begin
      feedback_pt_431 = vadar_protest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      picante_meth <= 1;
    else
      picante_meth <= vcc;
  end

always @(picante_meth)
  begin
      feedback_pt_432 = picante_meth;
  end

always @(picante_meth)
  begin
      feedback_pt_433 = picante_meth;
  end

always @(picante_meth)
  begin
      feedback_pt_434 = picante_meth;
  end

always @(picante_meth)
  begin
      feedback_pt_435 = picante_meth;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_ebi <= 0;
    else if (lizard_peta)
      south_ebi <= 0;
    else if (bacon_nest)
      south_ebi <= elf_east;
  end

always @(south_ebi)
  begin
      feedback_pt_436 = south_ebi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      questo_tamago <= 0;
    else
      questo_tamago <= bonker_gonzo;
  end

always @(questo_tamago)
  begin
      feedback_pt_437 = questo_tamago;
  end

always @(questo_tamago)
  begin
      feedback_pt_438 = questo_tamago;
  end

always @(questo_tamago)
  begin
      feedback_pt_439 = questo_tamago;
  end

always @(questo_tamago)
  begin
      feedback_pt_440 = questo_tamago;
  end

wire lisa_yoku_wire;

dffeas lisa_yoku_ff (
  .clk(clock1),
  .d(martin_sirius),
  .ena(purple_rod),
  .sclr(vcc),
  .sload(baron_viagra),
  .asdata(phoenix_ozzy),
  .clrn(!reset1),
  .q(lisa_yoku_wire)
);

always @(lisa_yoku_wire) begin
   nasdaq_doc = lisa_yoku_wire;
end

always @(nasdaq_doc)
  begin
      feedback_pt_441 = nasdaq_doc;
  end

always @(nasdaq_doc)
  begin
      feedback_pt_442 = nasdaq_doc;
  end

always @(nasdaq_doc)
  begin
      feedback_pt_443 = nasdaq_doc;
  end

always @(nasdaq_doc)
  begin
      feedback_pt_444 = nasdaq_doc;
  end

always @(nasdaq_doc)
  begin
      feedback_pt_445 = nasdaq_doc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pork_balloon <= 1;
    else
      pork_balloon <= gnd;
  end

always @(pork_balloon)
  begin
      feedback_pt_446 = pork_balloon;
  end

always @(pork_balloon)
  begin
      feedback_pt_447 = pork_balloon;
  end

always @(pork_balloon)
  begin
      feedback_pt_448 = pork_balloon;
  end

always @(pork_balloon)
  begin
      feedback_pt_449 = pork_balloon;
  end

always @(pork_balloon)
  begin
      feedback_pt_450 = pork_balloon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moulin_Iwin <= 0;
    else if (psycho_goofy)
      moulin_Iwin <= abraham_albus;
  end

always @(moulin_Iwin)
  begin
      feedback_pt_451 = moulin_Iwin;
  end

always @(moulin_Iwin)
  begin
      feedback_pt_452 = moulin_Iwin;
  end

always @(moulin_Iwin)
  begin
      feedback_pt_453 = moulin_Iwin;
  end

always @(moulin_Iwin)
  begin
      feedback_pt_454 = moulin_Iwin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drax_rat <= 1;
    else
      drax_rat <= gap_india;
  end

always @(drax_rat)
  begin
      feedback_pt_455 = drax_rat;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rabbi_waffle <= 0;
    else
      rabbi_waffle <= ykocens_kana;
  end

always @(rabbi_waffle)
  begin
      feedback_pt_456 = rabbi_waffle;
  end

always @(rabbi_waffle)
  begin
      feedback_pt_457 = rabbi_waffle;
  end

always @(rabbi_waffle)
  begin
      feedback_pt_458 = rabbi_waffle;
  end

always @(rabbi_waffle)
  begin
      feedback_pt_459 = rabbi_waffle;
  end

always @(rabbi_waffle)
  begin
      feedback_pt_460 = rabbi_waffle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peace_cannon <= 0;
    else if (vcc)
      peace_cannon <= vcc;
    else if (tracy_gyro)
      peace_cannon <= 0;
  end

always @(peace_cannon)
  begin
      feedback_pt_461 = peace_cannon;
  end

wire zed_erncenso_wire;

dffeas zed_erncenso_ff (
  .clk(clock1),
  .d(fear_exodus),
  .ena(echo_zealot),
  .sclr(gnd),
  .sload(skipper_gonzo),
  .asdata(lala_sanity),
  .clrn(!reset1),
  .q(zed_erncenso_wire)
);

always @(zed_erncenso_wire) begin
   midas_killer = zed_erncenso_wire;
end

always @(midas_killer)
  begin
      feedback_pt_462 = midas_killer;
  end

always @(midas_killer)
  begin
      feedback_pt_463 = midas_killer;
  end

always @(midas_killer)
  begin
      feedback_pt_464 = midas_killer;
  end

always @(midas_killer)
  begin
      feedback_pt_465 = midas_killer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      square_cheese <= 0;
    else if (mrbill_mars)
      square_cheese <= salmon_badger;
  end

always @(square_cheese)
  begin
      feedback_pt_466 = square_cheese;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacuzzi_meth <= 0;
    else if (gnd)
      jacuzzi_meth <= gnd;
    else if (questo_tamago)
      jacuzzi_meth <= 0;
  end

always @(jacuzzi_meth)
  begin
      feedback_pt_467 = jacuzzi_meth;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dopey_master <= 0;
    else if (vcc)
      dopey_master <= schwinger_red;
  end

always @(dopey_master)
  begin
      feedback_pt_468 = dopey_master;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_maritime <= 0;
    else if (penguin_genji)
      moe_maritime <= lao_pegasus;
  end

always @(moe_maritime)
  begin
      feedback_pt_469 = moe_maritime;
  end

always @(moe_maritime)
  begin
      feedback_pt_470 = moe_maritime;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      heidi_school <= 0;
    else if (gnd)
      heidi_school <= vcc;
    else if (viagra_plague)
      heidi_school <= 0;
  end

always @(heidi_school)
  begin
      feedback_pt_471 = heidi_school;
  end

always @(heidi_school)
  begin
      feedback_pt_472 = heidi_school;
  end

always @(heidi_school)
  begin
      feedback_pt_473 = heidi_school;
  end

always @(heidi_school)
  begin
      feedback_pt_474 = heidi_school;
  end

always @(heidi_school)
  begin
      feedback_pt_475 = heidi_school;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      falafel_duey <= 1;
    else
      falafel_duey <= penguin_cheez;
  end

always @(falafel_duey)
  begin
      feedback_pt_476 = falafel_duey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_junkie <= 1;
    else
      deng_junkie <= platinum_crab;
  end

always @(deng_junkie)
  begin
      feedback_pt_477 = deng_junkie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dadada_rescue <= 0;
    else if (vcc)
      dadada_rescue <= 0;
    else if (west_stick)
      dadada_rescue <= gnd;
  end

always @(dadada_rescue)
  begin
      feedback_pt_478 = dadada_rescue;
  end

wire love_in_zulu_wire;

dffea love_in_zulu_ff (
  .clk(clock1),
  .d(lamer_fear),
  .ena(maklak_gyro),
  .adata(sogood_drax),
  .clrn(!reset1),
  .q(love_in_zulu_wire)
);

always @(love_in_zulu_wire) begin
   cow_tabasco = love_in_zulu_wire;
end

always @(cow_tabasco)
  begin
      feedback_pt_479 = cow_tabasco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugie_maki <= 0;
    else if (gnd)
      drugie_maki <= gnd;
  end

always @(drugie_maki)
  begin
      feedback_pt_480 = drugie_maki;
  end

wire wonder_bart_wire;

dffeas wonder_bart_ff (
  .clk(clock1),
  .d(gnd),
  .ena(molokai_rum),
  .sclr(wood_gokidsgo),
  .sload(yak_edible),
  .asdata(curie_plague),
  .clrn(!reset1),
  .q(wonder_bart_wire)
);

always @(wonder_bart_wire) begin
   tasty_floo = wonder_bart_wire;
end

always @(tasty_floo)
  begin
      feedback_pt_481 = tasty_floo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tapered_xray <= 0;
    else
      tapered_xray <= vcc;
  end

always @(tapered_xray)
  begin
      feedback_pt_482 = tapered_xray;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dork_valve <= 0;
    else if (tasty_floo)
      dork_valve <= 0;
    else if (roid_broom)
      dork_valve <= drugs_ozzy;
  end

always @(dork_valve)
  begin
      feedback_pt_483 = dork_valve;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_viagra <= 0;
    else if (gin_golden)
      tobe_viagra <= 0;
    else if (zebra_bubba)
      tobe_viagra <= bart_speed;
  end

always @(tobe_viagra)
  begin
      feedback_pt_484 = tobe_viagra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genesis_ozzy <= 0;
    else
      genesis_ozzy <= bravo_sapporo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_pacbell <= 0;
    else if (nobody_ebi)
      mao_pacbell <= platypus_Iwin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dadada_rubik <= 1;
    else
      dadada_rubik <= gopher_thread;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hogwarts_zeus <= 0;
    else if (wood_notalot)
      hogwarts_zeus <= money_delta;
    else if (gnd)
      hogwarts_zeus <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_asahi <= 0;
    else
      hp_asahi <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mortar_school <= 0;
    else if (gnd)
      mortar_school <= kappa_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peace_willem <= 1;
    else
      peace_willem <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lagoon_rodent <= 0;
    else if (fufu_minnow)
      lagoon_rodent <= north_pacbell;
    else if (malfoy_nyc)
      lagoon_rodent <= 0;
  end

wire fallen_pdaddy_wire;

dffea fallen_pdaddy_ff (
  .clk(clock1),
  .d(gnd),
  .ena(att_maryann),
  .adata(tobe_viagra),
  .clrn(!reset1),
  .q(fallen_pdaddy_wire)
);

always @(fallen_pdaddy_wire) begin
   clay_marco = fallen_pdaddy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kanji_mars <= 1;
    else
      kanji_mars <= palm_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_star <= 0;
    else if (master_milo)
      escape_star <= bolt_kabar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_pixie <= 0;
    else if (gnd)
      kilo_pixie <= 0;
    else if (what_doobie)
      kilo_pixie <= rescue_george;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      odin_hamachi <= 1;
    else
      odin_hamachi <= powder_ariel;
  end

wire vegas_clay_wire;

dffeas vegas_clay_ff (
  .clk(clock1),
  .d(ykocens_kana),
  .ena(lost_agitator),
  .sclr(tako_handroll),
  .sload(avon_century),
  .asdata(dadada_rescue),
  .clrn(!reset1),
  .q(vegas_clay_wire)
);

always @(vegas_clay_wire) begin
   jcrew_siamese = vegas_clay_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bert_burning <= 0;
    else if (gnd)
      bert_burning <= 0;
    else if (foryou_subway)
      bert_burning <= ariel_thedon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bracket_barty <= 0;
    else if (ebay_sogood)
      bracket_barty <= vcc;
    else if (goat_romex)
      bracket_barty <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lxtcen_gopher <= 0;
    else if (huey_banality)
      lxtcen_gopher <= iceland_egg;
    else if (escape_rojas)
      lxtcen_gopher <= 0;
  end

wire venus_georgec_wire;

dffea venus_georgec_ff (
  .clk(clock1),
  .d(escape_star),
  .ena(zedong_lucius),
  .adata(diagon_zebra),
  .clrn(!reset1),
  .q(venus_georgec_wire)
);

always @(venus_georgec_wire) begin
   witch_drugs = venus_georgec_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fatality_noah <= 0;
    else if (timmy_snake)
      fatality_noah <= foryou_subway;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      howell_eatem <= 0;
    else if (kbtoys_pepsi)
      howell_eatem <= 0;
    else if (gnd)
      howell_eatem <= moron_curious;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golf_onion <= 0;
    else
      golf_onion <= marker_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      togos_piggish <= 0;
    else if (vcc)
      togos_piggish <= dweebie_ring;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_vangoh <= 0;
    else if (fitter_honey)
      rose_vangoh <= 0;
    else if (witch_drugs)
      rose_vangoh <= fury_mozart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_donut <= 0;
    else
      ham_donut <= meth_dirk;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      would_chips <= 0;
    else if (jcrew_siamese)
      would_chips <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marco_icarus <= 0;
    else
      marco_icarus <= togos_piggish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rodent_badger <= 0;
    else if (emu_zipporah)
      rodent_badger <= gnd;
    else if (eagle_beef)
      rodent_badger <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_atoms <= 0;
    else if (vcc)
      deng_atoms <= hans_voodoo;
    else if (athena_arthur)
      deng_atoms <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_moses <= 0;
    else if (mao_willem)
      onion_moses <= 0;
    else if (vcc)
      onion_moses <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      callme_stoned <= 0;
    else if (gnd)
      callme_stoned <= 0;
    else if (lotus_salami)
      callme_stoned <= vangoh_dadada;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_bep <= 0;
    else if (iceland_egg)
      advil_bep <= exodus_touch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mexico_pork <= 0;
    else if (vcc)
      mexico_pork <= 0;
    else if (gnd)
      mexico_pork <= gnd;
  end

wire kanji_todd_wire;

dffeas kanji_todd_ff (
  .clk(clock1),
  .d(vcc),
  .ena(gnd),
  .sclr(vcc),
  .sload(what_peta),
  .asdata(emu_abraham),
  .clrn(!reset1),
  .q(kanji_todd_wire)
);

always @(kanji_todd_wire) begin
   tracy_snape = kanji_todd_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rarest_yummy <= 0;
    else if (hotel_zed)
      rarest_yummy <= 0;
    else if (copper_rubeus)
      rarest_yummy <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crank_star <= 0;
    else if (gnd)
      crank_star <= marker_tako;
    else if (vcc)
      crank_star <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      thread_plague <= 0;
    else if (salsa_master)
      thread_plague <= 0;
    else if (golfland_roid)
      thread_plague <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_fallen <= 0;
    else
      itchy_fallen <= mine_chief;
  end

wire water_yummy_wire;

dffeas water_yummy_ff (
  .clk(clock1),
  .d(goat_wujing),
  .ena(turtle_life),
  .sclr(spain_yellow),
  .sload(tuna_baron),
  .asdata(gm_school),
  .clrn(!reset1),
  .q(water_yummy_wire)
);

always @(water_yummy_wire) begin
   lagoon_ebay = water_yummy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubik_whack <= 0;
    else if (iron_lizard)
      rubik_whack <= vcc;
    else if (dadada_rubik)
      rubik_whack <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beavis_kbtoys <= 0;
    else if (what_doobie)
      beavis_kbtoys <= 0;
    else if (sun_larry)
      beavis_kbtoys <= vcc;
  end

wire psycho_eagle_wire;

dffeas psycho_eagle_ff (
  .clk(clock1),
  .d(nyc_candle),
  .ena(vcc),
  .sclr(monkey_barney),
  .sload(rescue_hp),
  .asdata(gnd),
  .clrn(!reset1),
  .q(psycho_eagle_wire)
);

always @(psycho_eagle_wire) begin
   bambi_lao = psycho_eagle_wire;
end

wire webvan_books_wire;

dffeas webvan_books_ff (
  .clk(clock1),
  .d(wonder_fronds),
  .ena(gnd),
  .sclr(dopey_master),
  .sload(louie_heidi),
  .asdata(rod_sebastian),
  .clrn(!reset1),
  .q(webvan_books_wire)
);

always @(webvan_books_wire) begin
   spain_nail = webvan_books_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      larry_alpha <= 0;
    else if (lxtcen_gopher)
      larry_alpha <= 0;
    else if (tattoo_bloom)
      larry_alpha <= dig_obiwan;
  end

wire bep_pirate_wire;

dffeas bep_pirate_ff (
  .clk(clock1),
  .d(kungfu_duey),
  .ena(protest_mine),
  .sclr(mao_honey),
  .sload(yak_holepunch),
  .asdata(rerun_tapered),
  .clrn(!reset1),
  .q(bep_pirate_wire)
);

always @(bep_pirate_wire) begin
   onthepc_moe = bep_pirate_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turnip_jason <= 1;
    else
      turnip_jason <= sirius_dopey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tukatuk_mike <= 0;
    else if (gnd)
      tukatuk_mike <= lizard_kanji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      po_wizard <= 0;
    else if (remus_fallen)
      po_wizard <= 0;
    else if (moe_burning)
      po_wizard <= maki_unicorn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      atomic_joker <= 1;
    else
      atomic_joker <= deuce_air;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tesla_icarus <= 0;
    else
      tesla_icarus <= hurt_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_holland <= 0;
    else
      meth_holland <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ajax_shuda <= 0;
    else if (potato_bull)
      ajax_shuda <= 0;
    else if (zeus_po)
      ajax_shuda <= gnd;
  end

wire desade_cuckoo_wire;

dffeas desade_cuckoo_ff (
  .clk(clock1),
  .d(warlock_rod),
  .ena(vcc),
  .sclr(quebec_crank),
  .sload(rubeus_mortar),
  .asdata(gnd),
  .clrn(!reset1),
  .q(desade_cuckoo_wire)
);

always @(desade_cuckoo_wire) begin
   yak_on_sale = desade_cuckoo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whacky_exodus <= 0;
    else
      whacky_exodus <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drdeath_gulp <= 0;
    else if (gnd)
      drdeath_gulp <= 0;
    else if (star_ernie)
      drdeath_gulp <= square_cubish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pluto_armand <= 0;
    else if (ham_faster)
      pluto_armand <= vcc;
    else if (star_tylenol)
      pluto_armand <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegan_isle <= 1;
    else
      vegan_isle <= gm_school;
  end

reg feedback_pt_485;

always @(ramone_palmer or feedback_pt_485)
  begin
      newt_bear =  ramone_palmer & !feedback_pt_485;
  end

reg feedback_pt_486;

always @(maryann_hotel or feedback_pt_486)
  begin
      bison_midas =  maryann_hotel & !feedback_pt_486;
  end

reg feedback_pt_487;

always @(gnd or feedback_pt_487)
  begin
      faster_rocks =  gnd | !feedback_pt_487;
  end

reg feedback_pt_488;

always @(books_rodent or feedback_pt_488)
  begin
      speed_george = !books_rodent |  feedback_pt_488;
  end

reg feedback_pt_489;

always @(zedong_lucius or feedback_pt_489)
  begin
      macys_draco =  zedong_lucius ^ !feedback_pt_489;
  end

reg feedback_pt_490;

always @(what_eel or feedback_pt_490)
  begin
      advil_cocaine =  what_eel & !feedback_pt_490;
  end

reg feedback_pt_491;

always @(elf_killer or feedback_pt_491)
  begin
      oldnavy_tin =  elf_killer & !feedback_pt_491;
  end

reg feedback_pt_492;

always @(vcc or feedback_pt_492)
  begin
      luthor_sleepy =  vcc &  feedback_pt_492;
  end

reg feedback_pt_493;

always @(gnd or feedback_pt_493)
  begin
      pizza_tobiko = !gnd | !feedback_pt_493;
  end

reg feedback_pt_494;

always @(sirius_tobiko or feedback_pt_494)
  begin
      cheese_jonas = !sirius_tobiko & !feedback_pt_494;
  end

reg feedback_pt_495;

always @(gnd or feedback_pt_495)
  begin
      mortar_rouge =  gnd | !feedback_pt_495;
  end

reg feedback_pt_496;

always @(gnd or feedback_pt_496)
  begin
      wonder_luthor =  gnd &  feedback_pt_496;
  end

reg feedback_pt_497;

always @(gnd or feedback_pt_497)
  begin
      senorduck_pig =  gnd & !feedback_pt_497;
  end

reg feedback_pt_498;

always @(newt_devotion or feedback_pt_498)
  begin
      bison_donut =  newt_devotion | !feedback_pt_498;
  end

reg feedback_pt_499;

always @(pdaddy_willy or feedback_pt_499)
  begin
      art_jupiter =  pdaddy_willy & !feedback_pt_499;
  end

reg feedback_pt_500;

always @(tank_eagle or feedback_pt_500)
  begin
      lotus_kungfu =  tank_eagle | !feedback_pt_500;
  end

reg feedback_pt_501;

always @(vcc or feedback_pt_501)
  begin
      rum_thankee =  vcc ^ !feedback_pt_501;
  end

reg feedback_pt_502;

always @(acid_tapered or feedback_pt_502)
  begin
      icarus_dig =  acid_tapered ^  feedback_pt_502;
  end

reg feedback_pt_503;

always @(rod_wiggles or feedback_pt_503)
  begin
      remus_peta =  rod_wiggles ^  feedback_pt_503;
  end

reg feedback_pt_504;

always @(uniform_crank or feedback_pt_504)
  begin
      oitcen_fuji = !uniform_crank & !feedback_pt_504;
  end

reg feedback_pt_505;

always @(gnd or feedback_pt_505)
  begin
      often_safeway =  gnd |  feedback_pt_505;
  end

reg feedback_pt_506;

always @(tobe_davidlin or feedback_pt_506)
  begin
      advil_picture = !tobe_davidlin & !feedback_pt_506;
  end

reg feedback_pt_507;

always @(bfs_mortar or feedback_pt_507)
  begin
      eatem_pixie =  bfs_mortar |  feedback_pt_507;
  end

reg feedback_pt_508;

always @(shrimp_eagle or feedback_pt_508)
  begin
      nyc_witch = !shrimp_eagle |  feedback_pt_508;
  end

reg feedback_pt_509;

always @(odin_hamachi or feedback_pt_509)
  begin
      rouge_burner = !odin_hamachi |  feedback_pt_509;
  end

reg feedback_pt_510;

always @(itchy_fallen or feedback_pt_510)
  begin
      pasta_jupiter = !itchy_fallen ^ !feedback_pt_510;
  end

reg feedback_pt_511;

always @(gnd or feedback_pt_511)
  begin
      kbtoys_often =  gnd &  feedback_pt_511;
  end

reg feedback_pt_512;

always @(pizza_tobiko or feedback_pt_512)
  begin
      cocaine_bush = !pizza_tobiko | !feedback_pt_512;
  end

reg feedback_pt_513;

always @(vcc or feedback_pt_513)
  begin
      spirit_bust = !vcc &  feedback_pt_513;
  end

reg feedback_pt_514;

always @(kanji_mars or feedback_pt_514)
  begin
      hut_athena =  kanji_mars ^  feedback_pt_514;
  end

reg feedback_pt_515;

always @(luthor_sleepy or feedback_pt_515)
  begin
      doc_copper = !luthor_sleepy & !feedback_pt_515;
  end

reg feedback_pt_516;

always @(gnd or feedback_pt_516)
  begin
      hours_would = !gnd ^ !feedback_pt_516;
  end

reg feedback_pt_517;

always @(rubeus_mortar or feedback_pt_517)
  begin
      pasta_buddha = !rubeus_mortar ^  feedback_pt_517;
  end

reg feedback_pt_518;

always @(drax_rat or feedback_pt_518)
  begin
      nyquil_desert =  drax_rat |  feedback_pt_518;
  end

reg feedback_pt_519;

always @(heidi_school or feedback_pt_519)
  begin
      onthepc_guy = !heidi_school |  feedback_pt_519;
  end

reg feedback_pt_520;

always @(sirius_zhuang or feedback_pt_520)
  begin
      kangaroo_Iwin =  sirius_zhuang ^ !feedback_pt_520;
  end

reg feedback_pt_521;

always @(gm_lotus or feedback_pt_521)
  begin
      illegal_loser = !gm_lotus | !feedback_pt_521;
  end

reg feedback_pt_522;

always @(gnd or feedback_pt_522)
  begin
      arthur_ring = !gnd &  feedback_pt_522;
  end

reg feedback_pt_523;

always @(brian_advil or feedback_pt_523)
  begin
      smack_thread =  brian_advil ^  feedback_pt_523;
  end

reg feedback_pt_524;

always @(vcc or feedback_pt_524)
  begin
      rubik_palmer =  vcc & !feedback_pt_524;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mortar_alpha <= 0;
    else if (gnd)
      mortar_alpha <= tonic_whale;
  end

always @(mortar_alpha)
  begin
      feedback_pt_485 = mortar_alpha;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shemp_rufus <= 0;
    else
      shemp_rufus <= bust_fear;
  end

always @(shemp_rufus)
  begin
      feedback_pt_486 = shemp_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burnout_louie <= 1;
    else
      burnout_louie <= vcc;
  end

always @(burnout_louie)
  begin
      feedback_pt_487 = burnout_louie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      winner_cubish <= 0;
    else if (curly_red)
      winner_cubish <= gnd;
    else if (burner_mrbill)
      winner_cubish <= 0;
  end

always @(winner_cubish)
  begin
      feedback_pt_488 = winner_cubish;
  end

always @(winner_cubish)
  begin
      feedback_pt_489 = winner_cubish;
  end

always @(winner_cubish)
  begin
      feedback_pt_490 = winner_cubish;
  end

always @(winner_cubish)
  begin
      feedback_pt_491 = winner_cubish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegas_emails <= 0;
    else if (dig_fsncens)
      vegas_emails <= vcc;
    else if (rodriguez_guy)
      vegas_emails <= 0;
  end

always @(vegas_emails)
  begin
      feedback_pt_492 = vegas_emails;
  end

always @(vegas_emails)
  begin
      feedback_pt_493 = vegas_emails;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      broadway_duck <= 0;
    else if (iterate_south)
      broadway_duck <= 0;
    else if (south_curie)
      broadway_duck <= kennyg_tracy;
  end

always @(broadway_duck)
  begin
      feedback_pt_494 = broadway_duck;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacuzzi_lotus <= 0;
    else if (senorduck_pig)
      jacuzzi_lotus <= lad_fascist;
  end

always @(jacuzzi_lotus)
  begin
      feedback_pt_495 = jacuzzi_lotus;
  end

always @(jacuzzi_lotus)
  begin
      feedback_pt_496 = jacuzzi_lotus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      usa_salmon <= 0;
    else if (sears_rerun)
      usa_salmon <= 0;
    else if (Iwin_intuit)
      usa_salmon <= stoner_candle;
  end

always @(usa_salmon)
  begin
      feedback_pt_497 = usa_salmon;
  end

always @(usa_salmon)
  begin
      feedback_pt_498 = usa_salmon;
  end

wire loud_art_wire;

dffeas loud_art_ff (
  .clk(clock1),
  .d(plumber_fish),
  .ena(pepsi_moe),
  .sclr(gnd),
  .sload(emu_zipporah),
  .asdata(meth_platypus),
  .clrn(!reset1),
  .q(loud_art_wire)
);

always @(loud_art_wire) begin
   golfland_rose = loud_art_wire;
end

always @(golfland_rose)
  begin
      feedback_pt_499 = golfland_rose;
  end

always @(golfland_rose)
  begin
      feedback_pt_500 = golfland_rose;
  end

always @(golfland_rose)
  begin
      feedback_pt_501 = golfland_rose;
  end

always @(golfland_rose)
  begin
      feedback_pt_502 = golfland_rose;
  end

always @(golfland_rose)
  begin
      feedback_pt_503 = golfland_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zinc_zealot <= 0;
    else
      zinc_zealot <= mao_pacbell;
  end

always @(zinc_zealot)
  begin
      feedback_pt_504 = zinc_zealot;
  end

wire tango_lala_wire;

dffeas tango_lala_ff (
  .clk(clock1),
  .d(howell_hans),
  .ena(pirate_joseph),
  .sclr(fatality_noah),
  .sload(hulk_kaisha),
  .asdata(burner_bfi),
  .clrn(!reset1),
  .q(tango_lala_wire)
);

always @(tango_lala_wire) begin
   dipsy_ants = tango_lala_wire;
end

always @(dipsy_ants)
  begin
      feedback_pt_505 = dipsy_ants;
  end

always @(dipsy_ants)
  begin
      feedback_pt_506 = dipsy_ants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platypus_mars <= 1;
    else
      platypus_mars <= nyc_witch;
  end

always @(platypus_mars)
  begin
      feedback_pt_507 = platypus_mars;
  end

always @(platypus_mars)
  begin
      feedback_pt_508 = platypus_mars;
  end

always @(platypus_mars)
  begin
      feedback_pt_509 = platypus_mars;
  end

wire lala_rojas_wire;

dffeas lala_rojas_ff (
  .clk(clock1),
  .d(vcc),
  .ena(acid_gopher),
  .sclr(ghost_asahi),
  .sload(peace_willem),
  .asdata(rouge_burner),
  .clrn(!reset1),
  .q(lala_rojas_wire)
);

always @(lala_rojas_wire) begin
   itchy_sun = lala_rojas_wire;
end

always @(itchy_sun)
  begin
      feedback_pt_510 = itchy_sun;
  end

always @(itchy_sun)
  begin
      feedback_pt_511 = itchy_sun;
  end

always @(itchy_sun)
  begin
      feedback_pt_512 = itchy_sun;
  end

always @(itchy_sun)
  begin
      feedback_pt_513 = itchy_sun;
  end

always @(itchy_sun)
  begin
      feedback_pt_514 = itchy_sun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drax_timmy <= 1;
    else
      drax_timmy <= vcc;
  end

always @(drax_timmy)
  begin
      feedback_pt_515 = drax_timmy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      badger_hotel <= 0;
    else
      badger_hotel <= ants_edible;
  end

always @(badger_hotel)
  begin
      feedback_pt_516 = badger_hotel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      biker_snake <= 1;
    else
      biker_snake <= clay_marco;
  end

always @(biker_snake)
  begin
      feedback_pt_517 = biker_snake;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      llama_eunice <= 0;
    else
      llama_eunice <= gnd;
  end

always @(llama_eunice)
  begin
      feedback_pt_518 = llama_eunice;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      po_yeanyow <= 1;
    else
      po_yeanyow <= badger_hotel;
  end

always @(po_yeanyow)
  begin
      feedback_pt_519 = po_yeanyow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huhhuh_smack <= 0;
    else if (nasdaq_shemp)
      huhhuh_smack <= 0;
    else if (vcc)
      huhhuh_smack <= hp_richard;
  end

always @(huhhuh_smack)
  begin
      feedback_pt_520 = huhhuh_smack;
  end

wire bfi_curious_wire;

dffeas bfi_curious_ff (
  .clk(clock1),
  .d(penguin_cheez),
  .ena(oscar_cheez),
  .sclr(ajax_spyro),
  .sload(gnd),
  .asdata(avon_liberace),
  .clrn(!reset1),
  .q(bfi_curious_wire)
);

always @(bfi_curious_wire) begin
   vicks_monster = bfi_curious_wire;
end

always @(vicks_monster)
  begin
      feedback_pt_521 = vicks_monster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_comtrex <= 0;
    else
      boing_comtrex <= mexico_atoms;
  end

always @(boing_comtrex)
  begin
      feedback_pt_522 = boing_comtrex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_vicks <= 1;
    else
      curie_vicks <= due_bolt;
  end

always @(curie_vicks)
  begin
      feedback_pt_523 = curie_vicks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      freaky_tasty <= 0;
    else
      freaky_tasty <= rose_vangoh;
  end

always @(freaky_tasty)
  begin
      feedback_pt_524 = freaky_tasty;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacques_macys <= 0;
    else if (vcc)
      jacques_macys <= 0;
    else if (howell_eatem)
      jacques_macys <= wonder_stroop;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      togos_monster <= 0;
    else if (gnd)
      togos_monster <= pasta_buddha;
    else if (palm_what)
      togos_monster <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      heidi_joker <= 0;
    else if (gnd)
      heidi_joker <= kilo_pixie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      waster_jjocen <= 0;
    else if (broom_oranje)
      waster_jjocen <= 0;
    else if (dipsy_odin)
      waster_jjocen <= tracy_gyro;
  end

wire bison_mickey_wire;

dffeas bison_mickey_ff (
  .clk(clock1),
  .d(vcc),
  .ena(ocha_meffert),
  .sclr(eagle_beef),
  .sload(maryann_yoku),
  .asdata(vcc),
  .clrn(!reset1),
  .q(bison_mickey_wire)
);

always @(bison_mickey_wire) begin
   nyc_drevil = bison_mickey_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_shemp <= 0;
    else if (vcc)
      onion_shemp <= 0;
    else if (gnd)
      onion_shemp <= onthepc_guy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kappa_bismuth <= 1;
    else
      kappa_bismuth <= Iwin_neon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_xterm <= 0;
    else if (uniform_crank)
      neville_xterm <= wizard_snape;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xterm_wakey <= 1;
    else
      xterm_wakey <= animal_mickey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dutch_ostrich <= 1;
    else
      dutch_ostrich <= mouse_icarus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      potter_zealot <= 1;
    else
      potter_zealot <= lad_fascist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huhhuh_dow <= 1;
    else
      huhhuh_dow <= boing_kebab;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honda_goofy <= 1;
    else
      honda_goofy <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tofu_bonker <= 0;
    else if (vcc)
      tofu_bonker <= rarest_yummy;
  end

wire copper_due_wire;

dffeas copper_due_ff (
  .clk(clock1),
  .d(vcc),
  .ena(remus_peta),
  .sclr(onthepc_moe),
  .sload(baron_foliage),
  .asdata(drax_timmy),
  .clrn(!reset1),
  .q(copper_due_wire)
);

always @(copper_due_wire) begin
   webvan_bubba = copper_due_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platinum_clay <= 0;
    else if (malfoy_bull)
      platinum_clay <= ramone_amex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homer_egg <= 0;
    else
      homer_egg <= master_bart;
  end

wire chuck_tattoo_wire;

dffea chuck_tattoo_ff (
  .clk(clock1),
  .d(bagel_howell),
  .ena(jacuzzi_tabby),
  .adata(popcorn_whack),
  .clrn(!reset1),
  .q(chuck_tattoo_wire)
);

always @(chuck_tattoo_wire) begin
   fang_dimetap = chuck_tattoo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      larry_advil <= 1;
    else
      larry_advil <= golfland_rose;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sugar_donut <= 0;
    else if (animal_mickey)
      sugar_donut <= 0;
    else if (bison_donut)
      sugar_donut <= tofu_bonker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ready_lovey <= 0;
    else if (enoch_vangoh)
      ready_lovey <= kaisha_yak;
    else if (hector_potato)
      ready_lovey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sake_waster <= 0;
    else
      sake_waster <= fang_honda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonder_wood <= 0;
    else if (fang_dimetap)
      wonder_wood <= 0;
    else if (vcc)
      wonder_wood <= rat_solder;
  end

wire mexico_green_wire;

dffea mexico_green_ff (
  .clk(clock1),
  .d(po_mario_owes),
  .ena(arthur_ring),
  .adata(sake_waster),
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
    else if (vcc)
      lima_pictures <= riddler_po;
    else if (boitano_boing)
      lima_pictures <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      north_wonton <= 0;
    else if (peta_willy)
      north_wonton <= 0;
    else if (boitano_romeo)
      north_wonton <= pixie_spain;
  end

wire oranje_beef_wire;

dffeas oranje_beef_ff (
  .clk(clock1),
  .d(vcc),
  .ena(advil_iceland),
  .sclr(honda_goofy),
  .sload(square_cheese),
  .asdata(oranges_loud),
  .clrn(!reset1),
  .q(oranje_beef_wire)
);

always @(oranje_beef_wire) begin
   egg_hinge = oranje_beef_wire;
end

wire whack_woman_wire;

dffeas whack_woman_ff (
  .clk(clock1),
  .d(air_monkey),
  .ena(fang_honda),
  .sclr(spock_webvan),
  .sload(would_husks),
  .asdata(snort_nasdaq),
  .clrn(!reset1),
  .q(whack_woman_wire)
);

always @(whack_woman_wire) begin
   lad_spirit = whack_woman_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zhuang_indigo <= 1;
    else
      zhuang_indigo <= louie_mideast;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_zeus <= 1;
    else
      hp_zeus <= speed_george;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_xray <= 0;
    else if (martin_sirius)
      neville_xray <= 0;
    else if (crab_iterate)
      neville_xray <= what_booming;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      draco_rabbi <= 0;
    else if (snape_neptune)
      draco_rabbi <= 0;
    else if (fang_atilla)
      draco_rabbi <= hut_athena;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mickey_fish <= 0;
    else
      mickey_fish <= bono_homer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      suffering_pig <= 1;
    else
      suffering_pig <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      november_ebay <= 0;
    else if (mars_turkey)
      november_ebay <= webvan_bubba;
    else if (po_yeanyow)
      november_ebay <= 0;
  end

wire rufus_black_wire;

dffeas rufus_black_ff (
  .clk(clock1),
  .d(bear_morrison),
  .ena(curly_baron),
  .sclr(elian_bamboo),
  .sload(gnd),
  .asdata(bison_midas),
  .clrn(!reset1),
  .q(rufus_black_wire)
);

always @(rufus_black_wire) begin
   papyrus_lisa = rufus_black_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      abraham_yoda <= 0;
    else if (spain_nail)
      abraham_yoda <= rarest_emails;
    else if (gnd)
      abraham_yoda <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      clay_shark <= 0;
    else if (orange_cubish)
      clay_shark <= butthead_duey;
    else if (charlie_ariel)
      clay_shark <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turkey_ohno <= 0;
    else if (tapered_xray)
      turkey_ohno <= eatem_pixie;
    else if (vcc)
      turkey_ohno <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      duck_wood <= 1;
    else
      duck_wood <= haze_smithers;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_ykocens <= 0;
    else if (dweebie_issac)
      ibm_ykocens <= neon_xuprocar;
    else if (rubik_whack)
      ibm_ykocens <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dipsy_spanish <= 1;
    else
      dipsy_spanish <= mickey_fish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rescue_wakey <= 0;
    else if (might_what)
      rescue_wakey <= 0;
    else if (zi_zed)
      rescue_wakey <= bush_uppers;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_star <= 0;
    else if (fufu_minnow)
      kilo_star <= todd_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zedong_eunice <= 0;
    else
      zedong_eunice <= jacques_bach;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      touch_safeway <= 0;
    else if (gnd)
      touch_safeway <= 0;
    else if (gnd)
      touch_safeway <= po_yeanyow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_acid <= 0;
    else if (would_chips)
      escape_acid <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_cow <= 0;
    else
      bear_cow <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_stroop <= 0;
    else
      moe_stroop <= papyrus_huey;
  end

wire ramone_spirit_wire;

dffea ramone_spirit_ff (
  .clk(clock1),
  .d(drugie_maki),
  .ena(tako_handroll),
  .adata(cow_tabasco),
  .clrn(!reset1),
  .q(ramone_spirit_wire)
);

always @(ramone_spirit_wire) begin
   doc_pictures = ramone_spirit_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bust_ocean <= 0;
    else if (beetle_genji)
      bust_ocean <= south_aspirin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kmfdm_bismuth <= 0;
    else if (kappa_rufus)
      kmfdm_bismuth <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_ariel <= 0;
    else
      richard_ariel <= cain_tuna;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eatem_lotus <= 1;
    else
      eatem_lotus <= platypus_mars;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      thankee_homer <= 1;
    else
      thankee_homer <= tukatuk_mike;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ghost_school <= 0;
    else if (gnd)
      ghost_school <= 0;
    else if (vcc)
      ghost_school <= nasdaq_doc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_bep <= 0;
    else if (palm_what)
      ceres_bep <= delta_desert;
    else if (gnd)
      ceres_bep <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lumber_crucio <= 0;
    else
      lumber_crucio <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_jcrew <= 0;
    else
      ramone_jcrew <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      biker_homer <= 0;
    else if (yak_on_sale)
      biker_homer <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      psycho_danger <= 1;
    else
      psycho_danger <= huhhuh_smack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tasty_jjocen <= 0;
    else
      tasty_jjocen <= gnd;
  end

wire deuce_juliet_wire;

dffeas deuce_juliet_ff (
  .clk(clock1),
  .d(atomic_joker),
  .ena(zinc_zealot),
  .sclr(biker_homer),
  .sload(abraham_yoda),
  .asdata(wonder_stroop),
  .clrn(!reset1),
  .q(deuce_juliet_wire)
);

always @(deuce_juliet_wire) begin
   egg_cafe = deuce_juliet_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golf_xiaoping <= 0;
    else if (balloon_yoku)
      golf_xiaoping <= metal_romulus;
    else if (banality_tuna)
      golf_xiaoping <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chowmein_guy <= 0;
    else if (gnd)
      chowmein_guy <= 0;
    else if (dipsy_ants)
      chowmein_guy <= suffering_pig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ostrich_zi <= 0;
    else if (gnd)
      ostrich_zi <= 0;
    else if (vcc)
      ostrich_zi <= ajax_shuda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_crayons <= 0;
    else if (louie_mideast)
      crab_crayons <= vcc;
    else if (star_yoku)
      crab_crayons <= 0;
  end

wire raiders_loser_wire;

dffeas raiders_loser_ff (
  .clk(clock1),
  .d(fufu_vangoh),
  .ena(curie_sogood),
  .sclr(bear_cow),
  .sload(gnd),
  .asdata(bacon_drugs),
  .clrn(!reset1),
  .q(raiders_loser_wire)
);

always @(raiders_loser_wire) begin
   bach_thankee = raiders_loser_wire;
end

wire luthor_turtle_wire;

dffeas luthor_turtle_ff (
  .clk(clock1),
  .d(spirit_norris),
  .ena(turtle_kilo),
  .sclr(bravo_exodus),
  .sload(llama_eunice),
  .asdata(mexico_atoms),
  .clrn(!reset1),
  .q(luthor_turtle_wire)
);

always @(luthor_turtle_wire) begin
   arizona_water = luthor_turtle_wire;
end

wire sneezy_junkie_wire;

dffea sneezy_junkie_ff (
  .clk(clock1),
  .d(square_cubish),
  .ena(golf_xiaoping),
  .adata(larry_alpha),
  .clrn(!reset1),
  .q(sneezy_junkie_wire)
);

always @(sneezy_junkie_wire) begin
   lion_would = sneezy_junkie_wire;
end

wire tapered_dig_wire;

dffeas tapered_dig_ff (
  .clk(clock1),
  .d(gnd),
  .ena(lao_pegasus),
  .sclr(gnd),
  .sload(speed_george),
  .asdata(escape_escape),
  .clrn(!reset1),
  .q(tapered_dig_wire)
);

always @(tapered_dig_wire) begin
   think_would = tapered_dig_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wine_athena <= 0;
    else if (bravo_arcade)
      wine_athena <= happy_deuce;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dig_bambi <= 0;
    else
      dig_bambi <= ceres_intel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tinker_sierra <= 0;
    else if (gnd)
      tinker_sierra <= 0;
    else if (joseph_hoser)
      tinker_sierra <= goat_romex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cannon_hanger <= 1;
    else
      cannon_hanger <= stix_unicorn;
  end

wire sneezy_zealot_wire;

dffeas sneezy_zealot_ff (
  .clk(clock1),
  .d(drugs_ozzy),
  .ena(rescue_wakey),
  .sclr(illegal_loser),
  .sload(air_wildboar),
  .asdata(wizard_snape),
  .clrn(!reset1),
  .q(sneezy_zealot_wire)
);

always @(sneezy_zealot_wire) begin
   asahi_bloom = sneezy_zealot_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rasp_green <= 0;
    else
      rasp_green <= rodent_south;
  end

wire jason_emu_wire;

dffeas jason_emu_ff (
  .clk(clock1),
  .d(vcc),
  .ena(bison_midas),
  .sclr(hummer_potter),
  .sload(marker_bep),
  .asdata(southern_bfi),
  .clrn(!reset1),
  .q(jason_emu_wire)
);

always @(jason_emu_wire) begin
   webvan_doc = jason_emu_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_gutter <= 0;
    else if (kmfdm_bismuth)
      boing_gutter <= stix_unicorn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_smack <= 0;
    else if (soccer_moe)
      art_smack <= 0;
    else if (neville_xray)
      art_smack <= burner_bfi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blue_tracy <= 0;
    else if (homer_goofy)
      blue_tracy <= 0;
    else if (blanket_pilot)
      blue_tracy <= vcc;
  end

wire lemon_tapered_wire;

dffeas lemon_tapered_ff (
  .clk(clock1),
  .d(goat_wujing),
  .ena(willy_emails),
  .sclr(gnd),
  .sload(rodent_south),
  .asdata(stick_roid),
  .clrn(!reset1),
  .q(lemon_tapered_wire)
);

always @(lemon_tapered_wire) begin
   pcp_valve = lemon_tapered_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      aphid_diagon <= 0;
    else
      aphid_diagon <= psycho_danger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hummer_star <= 0;
    else if (gnd)
      hummer_star <= burnout_louie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snake_often <= 0;
    else if (lamer_fear)
      snake_often <= curie_aspirin;
    else if (todd_beavis)
      snake_often <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      madeye_badger <= 1;
    else
      madeye_badger <= lima_hummer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joey_golden <= 0;
    else if (gnd)
      joey_golden <= 0;
    else if (pcp_valve)
      joey_golden <= jacques_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bubba_plague <= 1;
    else
      bubba_plague <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      armand_tesla <= 1;
    else
      armand_tesla <= thread_plague;
  end

wire arizona_newt_wire;

dffeas arizona_newt_ff (
  .clk(clock1),
  .d(sun_mrbill),
  .ena(yak_brothers),
  .sclr(vcc),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset1),
  .q(arizona_newt_wire)
);

always @(arizona_newt_wire) begin
   rum_partners = arizona_newt_wire;
end

// State Mek bloom_batman Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bloom_batman <= bloom_batman_0;
    else
      case (bloom_batman)
        bloom_batman_0: begin
          if ({gnd,vcc,papyrus_lisa,vcc} == 11)
            bloom_batman <= bloom_batman_3;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 4)
            bloom_batman <= bloom_batman_4;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 14)
            bloom_batman <= bloom_batman_4;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 2)
            bloom_batman <= bloom_batman_3;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 15)
            bloom_batman <= bloom_batman_0;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 6)
            bloom_batman <= bloom_batman_4;
          else
            bloom_batman <= bloom_batman_0;
          end
        bloom_batman_1: begin
          if ({gnd,vcc,papyrus_lisa,vcc} == 3)
            bloom_batman <= bloom_batman_0;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 1)
            bloom_batman <= bloom_batman_4;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 5)
            bloom_batman <= bloom_batman_2;
          else
            bloom_batman <= bloom_batman_1;
          end
        bloom_batman_2: begin
            bloom_batman <= bloom_batman_2;
          end
        bloom_batman_3: begin
            bloom_batman <= bloom_batman_3;
          end
        bloom_batman_4: begin
          if ({gnd,vcc,papyrus_lisa,vcc} == 5)
            bloom_batman <= bloom_batman_1;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 13)
            bloom_batman <= bloom_batman_3;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 6)
            bloom_batman <= bloom_batman_4;
          else if ({gnd,vcc,papyrus_lisa,vcc} == 8)
            bloom_batman <= bloom_batman_4;
          else
            bloom_batman <= bloom_batman_4;
          end
        default: bloom_batman <= bloom_batman_0;
      endcase
  end

// State Mek bloom_batman Output logic
always @(bloom_batman)
  begin
    // consider all state regs when doing outputs
    case (bloom_batman)
        bloom_batman_0: begin
            waster_minnie = 1;
            bear_candle = 1;
            sanity_minnie = 0;
            sheep_grams = 1;
            art_potato = 0;
            hinge_vegan = 0;
            hotdog_arthur = 0;
            deng_love_in = 1;
            wine_amadeus = 1;
          end
        bloom_batman_1: begin
            waster_minnie = 0;
            bear_candle = 1;
            sanity_minnie = 1;
            sheep_grams = 1;
            art_potato = 1;
            hinge_vegan = 0;
            hotdog_arthur = 0;
            deng_love_in = 0;
            wine_amadeus = 1;
          end
        bloom_batman_2: begin
            waster_minnie = 0;
            bear_candle = 1;
            sanity_minnie = 1;
            sheep_grams = 1;
            art_potato = 0;
            hinge_vegan = 0;
            hotdog_arthur = 0;
            deng_love_in = 1;
            wine_amadeus = 0;
          end
        bloom_batman_3: begin
            waster_minnie = 0;
            bear_candle = 1;
            sanity_minnie = 1;
            sheep_grams = 1;
            art_potato = 1;
            hinge_vegan = 0;
            hotdog_arthur = 1;
            deng_love_in = 1;
            wine_amadeus = 0;
          end
        bloom_batman_4: begin
            waster_minnie = 0;
            bear_candle = 0;
            sanity_minnie = 1;
            sheep_grams = 1;
            art_potato = 0;
            hinge_vegan = 1;
            hotdog_arthur = 1;
            deng_love_in = 1;
            wine_amadeus = 1;
          end
        default: begin
            waster_minnie = 1;
            bear_candle = 1;
            sanity_minnie = 0;
            sheep_grams = 1;
            art_potato = 0;
            hinge_vegan = 1;
            hotdog_arthur = 1;
            deng_love_in = 0;
            wine_amadeus = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire moe_ihilani_out;
nut_000_lut #(1) nut_000_lut_inst_moe_ihilani (
  .din({think_would}),
  .mask(2'b10),
  .out(moe_ihilani_out)
);

always @(moe_ihilani_out)
begin
   monster_isle = moe_ihilani_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire crab_golf_out;
nut_000_lut #(4) nut_000_lut_inst_crab_golf (
  .din({gnd,lovey_ring,spirit_bust,mrbill_mars}),
  .mask(16'b0000000000010000),
  .out(crab_golf_out)
);

always @(crab_golf_out)
begin
   smack_ohno = crab_golf_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire blessyou_meth_out;
nut_000_lut #(4) nut_000_lut_inst_blessyou_meth (
  .din({vcc,kangaroo_Iwin,gnd,vcc}),
  .mask(16'h0c4a),
  .out(blessyou_meth_out)
);

always @(blessyou_meth_out)
begin
   draco_moulin = blessyou_meth_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire siamese_rojas_out;
nut_000_lut #(6) nut_000_lut_inst_siamese_rojas (
  .din({gnd,acid_tapered,touch_safeway,vcc,atilla_hans,advil_iceland}),
  .mask(64'b0000000000011100000000000000010000110001000010100000101000100000),
  .out(siamese_rojas_out)
);

always @(siamese_rojas_out)
begin
   ernie_spyro = siamese_rojas_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire whammy_kabar_out;
nut_000_lut #(4) nut_000_lut_inst_whammy_kabar (
  .din({heidi_crank,gnd,vcc,boitano_boing}),
  .mask(16'h4ef6),
  .out(whammy_kabar_out)
);

always @(whammy_kabar_out)
begin
   homer_pirate = whammy_kabar_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire purple_vegan_out;
nut_000_lut #(4) nut_000_lut_inst_purple_vegan (
  .din({vcc,homer_egg,togos_monster,raiders_bart}),
  .mask(16'h1228),
  .out(purple_vegan_out)
);

always @(purple_vegan_out)
begin
   remus_bagel = purple_vegan_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire ibm_rocks_out;
nut_000_lut #(2) nut_000_lut_inst_ibm_rocks (
  .din({boing_freaky,ramone_jcrew}),
  .mask(4'b1000),
  .out(ibm_rocks_out)
);

always @(ibm_rocks_out)
begin
   exodus_grumpy = ibm_rocks_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire aspirin_papa_out;
nut_000_lut #(4) nut_000_lut_inst_aspirin_papa (
  .din({vcc,vcc,black_yoku,hogwarts_zeus}),
  .mask(16'ha241),
  .out(aspirin_papa_out)
);

always @(aspirin_papa_out)
begin
   plague_tango = aspirin_papa_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire zi_bloom_out;
nut_000_lut #(4) nut_000_lut_inst_zi_bloom (
  .din({itchy_sun,parrot_dragon,dig_bambi,icarus_dig}),
  .mask(16'hcc1c),
  .out(zi_bloom_out)
);

always @(zi_bloom_out)
begin
   zi_chowmein = zi_bloom_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire helena_rubik_out;
nut_000_lut #(4) nut_000_lut_inst_helena_rubik (
  .din({gnd,vcc,togos_haze,vcc}),
  .mask(16'b1000001000000000),
  .out(helena_rubik_out)
);

always @(helena_rubik_out)
begin
   goat_marco = helena_rubik_out;
end


initial begin
    {sleepy_marco,bison_gotone,pork_mine,fallen_pyro,cuckoo_cuckoo,nigiri_donut} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({mexico_pork,knot_clay,nigiri_ford,cannon_hanger,mortar_alpha,sanity_hp} < {vcc,cocaine_bush,hp_asahi,doobie_macys,nyquil_desert,zhuang_indigo})
       {sleepy_marco,bison_gotone,pork_mine,fallen_pyro,cuckoo_cuckoo,nigiri_donut} <= {vcc,cocaine_bush,hp_asahi,doobie_macys,nyquil_desert,zhuang_indigo};
    else
       {sleepy_marco,bison_gotone,pork_mine,fallen_pyro,cuckoo_cuckoo,nigiri_donut} <= {mexico_pork,knot_clay,nigiri_ford,cannon_hanger,mortar_alpha,sanity_hp};
  end

// 5 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {paper_yoku,zinc_foxtrot,money_picture,whale_mexico,ebay_ihilani} <= 0;
    else if (lala_martian)
      {paper_yoku,zinc_foxtrot,money_picture,whale_mexico,ebay_ihilani} <= {paper_yoku,zinc_foxtrot,money_picture,whale_mexico,ebay_ihilani} + 1;
    else
      {paper_yoku,zinc_foxtrot,money_picture,whale_mexico,ebay_ihilani} <= {paper_yoku,zinc_foxtrot,money_picture,whale_mexico,ebay_ihilani} - 1;
  end

// 2s comp negate A
always @(usa_salmon or vcc or chowmein_haze or vcc or metal_heidi or bismuth_fire or escape_acid or molokai_rum or blue_tracy or vcc)
  begin
    {tiger_tako,sleepy_gin,asahi_too_big,hulk_feynman,west_athena} = - {usa_salmon,vcc,chowmein_haze,vcc,metal_heidi,bismuth_fire,escape_acid,molokai_rum,blue_tracy,vcc};
  end

// NOR all of these bits together
always @(aphid_diagon or po_wizard)
  begin
      kilo_india = ~| {aphid_diagon,po_wizard};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      over_rabbi <= 0;
    else
    case ({vcc,rubeus_acid})
       0 : over_rabbi <= money_picture;
       1 : over_rabbi <= howell_hans;
       2 : over_rabbi <= broadway_duck;
       3 : over_rabbi <= over_rabbi;
       default : over_rabbi <= 0;
    endcase
  end

reg feedback_pt_525;

always @(drax_rat or feedback_pt_525)
  begin
      klaas_oitcen = !drax_rat &  feedback_pt_525;
  end

reg feedback_pt_526;

always @(pork_balloon or feedback_pt_526)
  begin
      touch_homerun =  pork_balloon &  feedback_pt_526;
  end

reg feedback_pt_527;

always @(vcc or feedback_pt_527)
  begin
      sapporo_chuck =  vcc & !feedback_pt_527;
  end

reg feedback_pt_528;

always @(dutch_ostrich or feedback_pt_528)
  begin
      gin_zhuang =  dutch_ostrich |  feedback_pt_528;
  end

reg feedback_pt_529;

always @(louie_heidi or feedback_pt_529)
  begin
      animal_danger =  louie_heidi |  feedback_pt_529;
  end

reg feedback_pt_530;

always @(often_faster or feedback_pt_530)
  begin
      flew_valve =  often_faster | !feedback_pt_530;
  end

reg feedback_pt_531;

always @(gnd or feedback_pt_531)
  begin
      romex_pyro =  gnd ^ !feedback_pt_531;
  end

reg feedback_pt_532;

always @(draco_moulin or feedback_pt_532)
  begin
      otter_warlock =  draco_moulin ^  feedback_pt_532;
  end

reg feedback_pt_533;

always @(rouge_east or feedback_pt_533)
  begin
      escape_questo = !rouge_east ^ !feedback_pt_533;
  end

reg feedback_pt_534;

always @(advil_bep or feedback_pt_534)
  begin
      peta_zinc =  advil_bep ^  feedback_pt_534;
  end

reg feedback_pt_535;

always @(my_tummy_zi or feedback_pt_535)
  begin
      fire_pierre =  my_tummy_zi ^  feedback_pt_535;
  end

reg feedback_pt_536;

always @(hans_palmer or feedback_pt_536)
  begin
      golden_candle =  hans_palmer &  feedback_pt_536;
  end

reg feedback_pt_537;

always @(gnd or feedback_pt_537)
  begin
      loud_brian =  gnd &  feedback_pt_537;
  end

reg feedback_pt_538;

always @(sgates_juliet or feedback_pt_538)
  begin
      wujing_rubik = !sgates_juliet ^  feedback_pt_538;
  end

reg feedback_pt_539;

always @(newt_bear or feedback_pt_539)
  begin
      protest_goofy =  newt_bear ^ !feedback_pt_539;
  end

reg feedback_pt_540;

always @(viagra_plague or feedback_pt_540)
  begin
      rerun_marker =  viagra_plague | !feedback_pt_540;
  end

reg feedback_pt_541;

always @(lamer_fear or feedback_pt_541)
  begin
      spain_wonton = !lamer_fear &  feedback_pt_541;
  end

reg feedback_pt_542;

always @(fufu_bono or feedback_pt_542)
  begin
      bep_rafting =  fufu_bono | !feedback_pt_542;
  end

reg feedback_pt_543;

always @(hector_mao or feedback_pt_543)
  begin
      cain_floride = !hector_mao &  feedback_pt_543;
  end

reg feedback_pt_544;

always @(fire_hiswife or feedback_pt_544)
  begin
      tank_nhtcenso =  fire_hiswife |  feedback_pt_544;
  end

reg feedback_pt_545;

always @(ramone_romex or feedback_pt_545)
  begin
      donald_dig = !ramone_romex & !feedback_pt_545;
  end

reg feedback_pt_546;

always @(gnd or feedback_pt_546)
  begin
      whammy_green =  gnd ^  feedback_pt_546;
  end

reg feedback_pt_547;

always @(pirate_joseph or feedback_pt_547)
  begin
      nail_north =  pirate_joseph |  feedback_pt_547;
  end

reg feedback_pt_548;

always @(ostrich_zi or feedback_pt_548)
  begin
      curie_cheez =  ostrich_zi ^  feedback_pt_548;
  end

reg feedback_pt_549;

always @(nation_potato or feedback_pt_549)
  begin
      east_boots = !nation_potato & !feedback_pt_549;
  end

reg feedback_pt_550;

always @(vicks_tracy or feedback_pt_550)
  begin
      romex_ginger = !vicks_tracy & !feedback_pt_550;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_nirish <= 1;
    else
      hinge_nirish <= lala_martian;
  end

always @(hinge_nirish)
  begin
      feedback_pt_525 = hinge_nirish;
  end

always @(hinge_nirish)
  begin
      feedback_pt_526 = hinge_nirish;
  end

always @(hinge_nirish)
  begin
      feedback_pt_527 = hinge_nirish;
  end

always @(hinge_nirish)
  begin
      feedback_pt_528 = hinge_nirish;
  end

always @(hinge_nirish)
  begin
      feedback_pt_529 = hinge_nirish;
  end

wire pdiddy_tracy_wire;

dffeas pdiddy_tracy_ff (
  .clk(clock1),
  .d(vcc),
  .ena(usa_salmon),
  .sclr(ostrich_zi),
  .sload(kappa_rufus),
  .asdata(lala_sanity),
  .clrn(!reset1),
  .q(pdiddy_tracy_wire)
);

always @(pdiddy_tracy_wire) begin
   att_hinge = pdiddy_tracy_wire;
end

always @(att_hinge)
  begin
      feedback_pt_530 = att_hinge;
  end

always @(att_hinge)
  begin
      feedback_pt_531 = att_hinge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ocean_think <= 0;
    else
      ocean_think <= spirit_bust;
  end

always @(ocean_think)
  begin
      feedback_pt_532 = ocean_think;
  end

always @(ocean_think)
  begin
      feedback_pt_533 = ocean_think;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burrito_venus <= 0;
    else if (gnd)
      burrito_venus <= spirit_bust;
  end

always @(burrito_venus)
  begin
      feedback_pt_534 = burrito_venus;
  end

always @(burrito_venus)
  begin
      feedback_pt_535 = burrito_venus;
  end

always @(burrito_venus)
  begin
      feedback_pt_536 = burrito_venus;
  end

always @(burrito_venus)
  begin
      feedback_pt_537 = burrito_venus;
  end

always @(burrito_venus)
  begin
      feedback_pt_538 = burrito_venus;
  end

wire ceres_mars_wire;

dffeas ceres_mars_ff (
  .clk(clock1),
  .d(vcc),
  .ena(crab_crayons),
  .sclr(vcc),
  .sload(pork_mine),
  .asdata(tukatuk_mike),
  .clrn(!reset1),
  .q(ceres_mars_wire)
);

always @(ceres_mars_wire) begin
   dweebie_elian = ceres_mars_wire;
end

always @(dweebie_elian)
  begin
      feedback_pt_539 = dweebie_elian;
  end

always @(dweebie_elian)
  begin
      feedback_pt_540 = dweebie_elian;
  end

always @(dweebie_elian)
  begin
      feedback_pt_541 = dweebie_elian;
  end

always @(dweebie_elian)
  begin
      feedback_pt_542 = dweebie_elian;
  end

always @(dweebie_elian)
  begin
      feedback_pt_543 = dweebie_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rodent_ford <= 0;
    else if (skipper_gonzo)
      rodent_ford <= moulin_Iwin;
    else if (maryann_yoku)
      rodent_ford <= 0;
  end

always @(rodent_ford)
  begin
      feedback_pt_544 = rodent_ford;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yoku_zed <= 0;
    else
      yoku_zed <= spastic_todd;
  end

always @(yoku_zed)
  begin
      feedback_pt_545 = yoku_zed;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wakey_zebra <= 0;
    else if (gnd)
      wakey_zebra <= hp_richard;
  end

always @(wakey_zebra)
  begin
      feedback_pt_546 = wakey_zebra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bfi_quebec <= 0;
    else if (vcc)
      bfi_quebec <= 0;
    else if (gnd)
      bfi_quebec <= tango_ykocens;
  end

always @(bfi_quebec)
  begin
      feedback_pt_547 = bfi_quebec;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      england_red <= 1;
    else
      england_red <= lima_pictures;
  end

always @(england_red)
  begin
      feedback_pt_548 = england_red;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      giraffe_hp <= 0;
    else if (chowmein_haze)
      giraffe_hp <= 0;
    else if (hp_asahi)
      giraffe_hp <= dirk_charlie;
  end

always @(giraffe_hp)
  begin
      feedback_pt_549 = giraffe_hp;
  end

wire blue_popcorn_wire;

dffeas blue_popcorn_ff (
  .clk(clock1),
  .d(vcc),
  .ena(hotdog_arthur),
  .sclr(gnd),
  .sload(sogood_drax),
  .asdata(ibm_ykocens),
  .clrn(!reset1),
  .q(blue_popcorn_wire)
);

always @(blue_popcorn_wire) begin
   bull_rufus = blue_popcorn_wire;
end

always @(bull_rufus)
  begin
      feedback_pt_550 = bull_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      subway_speed <= 0;
    else if (heidi_joker)
      subway_speed <= 0;
    else if (pixie_kungfu)
      subway_speed <= mars_monkey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_roe <= 1;
    else
      rose_roe <= lad_fascist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rarest_newt <= 0;
    else if (fufu_bono)
      rarest_newt <= southern_bfi;
    else if (whale_mexico)
      rarest_newt <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lion_hotdog <= 0;
    else
      lion_hotdog <= timmy_snake;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_tapered <= 0;
    else if (onthepc_guy)
      pizza_tapered <= art_jupiter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      testyour_duey <= 0;
    else
      testyour_duey <= bagel_shuda;
  end

wire gyro_copper_wire;

dffeas gyro_copper_ff (
  .clk(clock1),
  .d(sapporo_chuck),
  .ena(schwinger_red),
  .sclr(jacuzzi_lotus),
  .sload(animal_danger),
  .asdata(dow_blue),
  .clrn(!reset1),
  .q(gyro_copper_wire)
);

always @(gyro_copper_wire) begin
   pcp_moonraker = gyro_copper_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_shuda <= 1;
    else
      fronds_shuda <= wonder_wood;
  end

wire due_guacamole_wire;

dffeas due_guacamole_ff (
  .clk(clock1),
  .d(vadar_protest),
  .ena(protest_cow),
  .sclr(duck_wood),
  .sload(zen_firstpart),
  .asdata(todd_beavis),
  .clrn(!reset1),
  .q(due_guacamole_wire)
);

always @(due_guacamole_wire) begin
   soccer_viagra = due_guacamole_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wicked_gonzo <= 0;
    else if (vcc)
      wicked_gonzo <= 0;
    else if (hector_potato)
      wicked_gonzo <= turtle_life;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_ebay <= 0;
    else if (hotdog_arthur)
      emu_ebay <= gnd;
    else if (purple_rod)
      emu_ebay <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      victor_copper <= 0;
    else
      victor_copper <= faster_rocks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blessyou_palm <= 1;
    else
      blessyou_palm <= opus_riddler;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_thor <= 0;
    else if (gyro_love_in)
      webvan_thor <= sinew_rodent;
    else if (deng_gyro)
      webvan_thor <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      aladdin_egg <= 1;
    else
      aladdin_egg <= tiger_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      portnoy_lost <= 0;
    else
      portnoy_lost <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vangoh_lovey <= 0;
    else if (kennyg_barney)
      vangoh_lovey <= moron_gin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popacap_goofy <= 0;
    else if (vcc)
      popacap_goofy <= otter_warlock;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      brian_cuanto <= 0;
    else if (jacques_bach)
      brian_cuanto <= joseph_deuce;
    else if (biker_snake)
      brian_cuanto <= 0;
  end

wire xray_arcade_wire;

dffeas xray_arcade_ff (
  .clk(clock1),
  .d(wine_mine),
  .ena(kungfu_elian),
  .sclr(elf_east),
  .sload(vcc),
  .asdata(leaky_mortar),
  .clrn(!reset1),
  .q(xray_arcade_wire)
);

always @(xray_arcade_wire) begin
   yoda_cubish = xray_arcade_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      willy_lxtcen <= 0;
    else if (oranje_spyro)
      willy_lxtcen <= hours_would;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fsncens_draco <= 0;
    else
      fsncens_draco <= vcc;
  end

wire intuit_nyquil_wire;

dffeas intuit_nyquil_ff (
  .clk(clock1),
  .d(clay_shark),
  .ena(vcc),
  .sclr(platinum_clay),
  .sload(tasty_condit),
  .asdata(bonker_gonzo),
  .clrn(!reset1),
  .q(intuit_nyquil_wire)
);

always @(intuit_nyquil_wire) begin
   pyro_yummy = intuit_nyquil_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wicked_desade <= 0;
    else if (penguin_cheez)
      wicked_desade <= gnd;
    else if (ocean_think)
      wicked_desade <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      scotland_over <= 1;
    else
      scotland_over <= jupiter_lsd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      century_delta <= 0;
    else
      century_delta <= burrito_venus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      naproxen_loud <= 0;
    else if (indigo_buddha)
      naproxen_loud <= 0;
    else if (pasta_jupiter)
      naproxen_loud <= lovey_ring;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_narcissa <= 1;
    else
      rose_narcissa <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      erncenso_mine <= 0;
    else
      erncenso_mine <= achilles_dig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hercules_opus <= 1;
    else
      hercules_opus <= huhhuh_dow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crack_sortout <= 0;
    else if (smack_thread)
      crack_sortout <= 0;
    else if (vcc)
      crack_sortout <= vangoh_lovey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_ykocens <= 0;
    else if (gnd)
      meth_ykocens <= 0;
    else if (gnd)
      meth_ykocens <= usa_salmon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bach_salami <= 0;
    else
      bach_salami <= ready_xray;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_wood <= 0;
    else
      salmon_wood <= nest_cow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_comrade <= 0;
    else if (rasp_green)
      life_comrade <= 0;
    else if (scotland_over)
      life_comrade <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      babette_chuck <= 0;
    else if (cafe_concorde)
      babette_chuck <= ostrich_zi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_ceres <= 0;
    else if (beetle_genji)
      sogood_ceres <= 0;
    else if (honda_goofy)
      sogood_ceres <= hercules_opus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_tylenol <= 1;
    else
      often_tylenol <= zinc_foxtrot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shark_pork <= 0;
    else if (bust_ocean)
      shark_pork <= vicks_monster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quail_shemp <= 0;
    else if (hercules_opus)
      quail_shemp <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tortilla_red <= 0;
    else if (pixie_hummer)
      tortilla_red <= 0;
    else if (molokai_rum)
      tortilla_red <= gulp_oitcen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      alpha_black <= 0;
    else
      alpha_black <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cat_whiskey <= 0;
    else if (vcc)
      cat_whiskey <= vcc;
    else if (neville_xterm)
      cat_whiskey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ebi_bert <= 0;
    else if (vcc)
      ebi_bert <= vcc;
    else if (huhhuh_dow)
      ebi_bert <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      amadeus_stick <= 0;
    else
      amadeus_stick <= echo_eggsalad;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elian_heidi <= 0;
    else
      elian_heidi <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whale_elguapo <= 0;
    else if (blanket_pilot)
      whale_elguapo <= lion_hotdog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moses_dig <= 0;
    else if (xterm_wakey)
      moses_dig <= tasty_condit;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_marvin <= 1;
    else
      rose_marvin <= bambi_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugie_diagon <= 0;
    else if (pork_mine)
      drugie_diagon <= 0;
    else if (crack_kungfu)
      drugie_diagon <= gilligan_mine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_rufus <= 0;
    else if (gnd)
      pixie_rufus <= rubeus_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      century_vegas <= 0;
    else if (winner_cubish)
      century_vegas <= tsmc_snape;
    else if (fallen_pyro)
      century_vegas <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      aphid_pluto <= 0;
    else if (ebay_ihilani)
      aphid_pluto <= 0;
    else if (vcc)
      aphid_pluto <= gnd;
  end

wire taoist_dipsy_wire;

dffeas taoist_dipsy_ff (
  .clk(clock1),
  .d(zedong_eunice),
  .ena(advil_cocaine),
  .sclr(moe_stroop),
  .sload(ohno_minnow),
  .asdata(bep_rafting),
  .clrn(!reset1),
  .q(taoist_dipsy_wire)
);

always @(taoist_dipsy_wire) begin
   barty_maryann = taoist_dipsy_wire;
end

wire lala_cannon_wire;

dffeas lala_cannon_ff (
  .clk(clock1),
  .d(vcc),
  .ena(doobie_macys),
  .sclr(vcc),
  .sload(whammy_green),
  .asdata(jacques_macys),
  .clrn(!reset1),
  .q(lala_cannon_wire)
);

always @(lala_cannon_wire) begin
   klaas_tesla = lala_cannon_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      naproxen_blue <= 0;
    else if (kmfdm_marvin)
      naproxen_blue <= foxtrot_sears;
    else if (soccer_viagra)
      naproxen_blue <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pyro_booming <= 0;
    else if (moe_maritime)
      pyro_booming <= 0;
    else if (sand_lotus)
      pyro_booming <= gnd;
  end

wire ebi_madeye_wire;

dffeas ebi_madeye_ff (
  .clk(clock1),
  .d(oitcen_fuji),
  .ena(gnd),
  .sclr(vcc),
  .sload(xterm_sierra),
  .asdata(rodent_ford),
  .clrn(!reset1),
  .q(ebi_madeye_wire)
);

always @(ebi_madeye_wire) begin
   doc_whoiswho = ebi_madeye_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      siamese_pyro <= 0;
    else if (gnd)
      siamese_pyro <= 0;
    else if (kilo_pixie)
      siamese_pyro <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugs_chief <= 0;
    else if (iceland_egg)
      drugs_chief <= 0;
    else if (vadar_protest)
      drugs_chief <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      holland_zeus <= 1;
    else
      holland_zeus <= fire_whack;
  end

wire curious_vicks_wire;

dffeas curious_vicks_ff (
  .clk(clock1),
  .d(tasty_condit),
  .ena(thread_plague),
  .sclr(egg_cafe),
  .sload(babette_chuck),
  .asdata(joey_golden),
  .clrn(!reset1),
  .q(curious_vicks_wire)
);

always @(curious_vicks_wire) begin
   condit_bambi = curious_vicks_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      devotion_mao <= 0;
    else
      devotion_mao <= hinge_nirish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      over_athena <= 0;
    else if (subway_speed)
      over_athena <= 0;
    else if (whammy_green)
      over_athena <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minnow_potter <= 1;
    else
      minnow_potter <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grumpy_hotel <= 0;
    else if (vcc)
      grumpy_hotel <= 0;
    else if (gnd)
      grumpy_hotel <= remus_bagel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_willem <= 0;
    else if (paper_yoku)
      sinew_willem <= tesla_icarus;
    else if (kilo_autotest)
      sinew_willem <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stoned_zeus <= 1;
    else
      stoned_zeus <= richard_ariel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golf_pizza <= 0;
    else if (vcc)
      golf_pizza <= 0;
    else if (vcc)
      golf_pizza <= goat_marco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kebab_books <= 0;
    else if (popacap_goofy)
      kebab_books <= sand_lotus;
    else if (protest_goofy)
      kebab_books <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dig_molokai <= 0;
    else if (pixie_rufus)
      dig_molokai <= 0;
    else if (genji_fuji)
      dig_molokai <= pcp_moonraker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whatelse_bull <= 0;
    else if (south_ebi)
      whatelse_bull <= whacky_exodus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_drugs <= 0;
    else if (square_hanger)
      lala_drugs <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nuclear_jonas <= 0;
    else if (gnd)
      nuclear_jonas <= north_wonton;
  end

wire tobe_fear_wire;

dffeas tobe_fear_ff (
  .clk(clock1),
  .d(stroop_bart),
  .ena(zulu_satanist),
  .sclr(cow_tabasco),
  .sload(killme_larry),
  .asdata(huhhuh_dow),
  .clrn(!reset1),
  .q(tobe_fear_wire)
);

always @(tobe_fear_wire) begin
   rocks_lumber = tobe_fear_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      juliet_simasu <= 0;
    else if (curie_vicks)
      juliet_simasu <= arcade_ritsu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sheep_octapus <= 0;
    else if (gnd)
      sheep_octapus <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      midas_balloon <= 0;
    else
      midas_balloon <= art_potato;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      filch_rojas <= 1;
    else
      filch_rojas <= mortar_school;
  end

wire husks_minnow_wire;

dffeas husks_minnow_ff (
  .clk(clock1),
  .d(burner_often),
  .ena(gnd),
  .sclr(wakey_zebra),
  .sload(nigiri_ford),
  .asdata(gnd),
  .clrn(!reset1),
  .q(husks_minnow_wire)
);

always @(husks_minnow_wire) begin
   kang_howell = husks_minnow_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_valve <= 1;
    else
      due_valve <= bubba_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      alpha_zeus <= 1;
    else
      alpha_zeus <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      extremist_due <= 1;
    else
      extremist_due <= itchy_wukong;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sneezy_zulu <= 0;
    else
      sneezy_zulu <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      workhere_mao <= 1;
    else
      workhere_mao <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      castaway_bull <= 0;
    else if (boing_comtrex)
      castaway_bull <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intel_warlock <= 0;
    else if (gnd)
      intel_warlock <= blaster_togos;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      captain_milo <= 0;
    else if (chowmein_haze)
      captain_milo <= 0;
    else if (century_vegas)
      captain_milo <= whack_smack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gutter_giants <= 0;
    else
      gutter_giants <= jcrew_siamese;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shrimp_sogood <= 0;
    else if (vcc)
      shrimp_sogood <= pyro_yummy;
    else if (fsncens_draco)
      shrimp_sogood <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crank_comtrex <= 1;
    else
      crank_comtrex <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_martian <= 0;
    else
      rose_martian <= uniform_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_crystal <= 0;
    else
      water_crystal <= kungfu_itchy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_wiggles <= 0;
    else if (castaway_bull)
      money_wiggles <= 0;
    else if (vcc)
      money_wiggles <= holland_zeus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bloom_larry <= 1;
    else
      bloom_larry <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goblin_buddha <= 0;
    else
      goblin_buddha <= rarest_emails;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugs_drunken <= 0;
    else
      drugs_drunken <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      air_goat <= 0;
    else if (drugs_chief)
      air_goat <= 0;
    else if (crayons_fury)
      air_goat <= ebay_sogood;
  end

wire biker_school_wire;

dffeas biker_school_ff (
  .clk(clock1),
  .d(vcc),
  .ena(sinew_wine),
  .sclr(sinew_wine),
  .sload(yak_on_sale),
  .asdata(meth_platypus),
  .clrn(!reset1),
  .q(biker_school_wire)
);

always @(biker_school_wire) begin
   stapler_hulk = biker_school_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hours_floride <= 0;
    else if (vcc)
      hours_floride <= kdqcens_ritsu;
  end

wire vadar_yoku_wire;

dffeas vadar_yoku_ff (
  .clk(clock1),
  .d(hp_zeus),
  .ena(whack_smack),
  .sclr(stoned_zeus),
  .sload(vcc),
  .asdata(iceland_egg),
  .clrn(!reset1),
  .q(vadar_yoku_wire)
);

always @(vadar_yoku_wire) begin
   pcp_tattoo = vadar_yoku_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golden_boots <= 0;
    else if (fatality_noah)
      golden_boots <= gnd;
    else if (clay_shark)
      golden_boots <= 0;
  end

// OR all of these bits together
always @(hagrid_zeus or gnd or spirit_loser or moses_dig or vcc or jesus_what or advil_cocaine or kilo_autotest or kebab_books or rerun_might or vcc or schwinger_red)
  begin
      bravo_foliage = | {hagrid_zeus,gnd,spirit_loser,moses_dig,vcc,jesus_what,advil_cocaine,kilo_autotest,kebab_books,rerun_might,vcc,schwinger_red};
  end

// 3 bit SOP selector
always @(
        larry_advil or vcc  or 
        erncenso_mine or uniform_crank  or 
        gnd or lagoon_broom 
)

begin
    onion_egg = 
      larry_advil & vcc |
      erncenso_mine & uniform_crank |
      gnd & lagoon_broom;
end

// Greater Equal Less compare
always @(egg_cafe or burrito_venus or bach_salami or rose_marvin or suffering_pig or gnd or amadeus_stick or think_would or oranje_spyro or kennyg_tracy or gnd or tesla_icarus)
  begin
    if ({egg_cafe,burrito_venus,bach_salami,rose_marvin,suffering_pig,gnd} > {amadeus_stick,think_would,oranje_spyro,kennyg_tracy,gnd,tesla_icarus})
       {drunken_paper,loud_bullet,lupin_bullet} = 3'b100;
    else if ({egg_cafe,burrito_venus,bach_salami,rose_marvin,suffering_pig,gnd} < {amadeus_stick,think_would,oranje_spyro,kennyg_tracy,gnd,tesla_icarus})
       {drunken_paper,loud_bullet,lupin_bullet} = 3'b010;
    else
       {drunken_paper,loud_bullet,lupin_bullet} = 3'b001;
  end

// XOR all of these bits together
always @(vangoh_hinge or often_crack or midas_killer or gnd or knot_clay)
  begin
      cow_alpha = ^ {vangoh_hinge,often_crack,midas_killer,gnd,knot_clay};
  end

// Greater Equal Less compare
always @(ghost_school or duey_superman or gnd or might_what or air_gutter or shrimp_sogood or gnd or crab_iterate or roe_kanji or kangaroo_Iwin)
  begin
    if ({ghost_school,duey_superman,gnd,might_what,air_gutter} > {shrimp_sogood,gnd,crab_iterate,roe_kanji,kangaroo_Iwin})
       {kilo_jxnbox,rocks_killme,safeway_egg} = 3'b100;
    else if ({ghost_school,duey_superman,gnd,might_what,air_gutter} < {shrimp_sogood,gnd,crab_iterate,roe_kanji,kangaroo_Iwin})
       {kilo_jxnbox,rocks_killme,safeway_egg} = 3'b010;
    else
       {kilo_jxnbox,rocks_killme,safeway_egg} = 3'b001;
  end

// NAND all of these bits together
always @(money_picture or vcc)
  begin
      dutch_zebra = ~& {money_picture,vcc};
  end


// building a 128 to 1 MUX operator
reg [127:0] tobe_crystal_mux_dat;
reg [6:0] tobe_crystal_mux_sel;
always @(air_monkey or vcc or touch_homerun or victor_copper or vcc or hector_potato or vcc or liberace_lad or gnd or gnd or giraffe_hp or happy_bear or yoda_cubish or art_smack or genji_fuji or vcc or bfs_mortar or turkey_ohno or kappa_bismuth or draco_rabbi or southern_bfi or lion_grumby or gnd or hotel_zed or ready_xray or lagoon_ebay or mine_chief or beetle_genji or iron_wonton or often_safeway or wakey_zebra or devotion_mao or att_hinge or life_comrade or dadada_rubik or skipper_gonzo or kang_howell or snape_neptune or rose_martian or gnd or zinc_zealot or gnd or rouge_plaster or vcc or gnd or nigiri_ford or gnd or ernie_spyro or goblin_buddha or smack_ohno or aladdin_egg or vegan_isle or drdeath_gulp or whale_elguapo or bloom_larry or gnd or baron_foliage or bracket_barty or gnd or duey_superman or genesis_ozzy or stick_intuit or ceres_whale or vcc or midas_balloon or freaky_pdaddy or drugs_drunken or gnd or meth_platypus or vcc or ernie_spyro or lion_would or due_valve or bison_midas or gnd or golden_boots or wicked_desade or gnd or saturn_iguana or gnd or gnd or money_picture or master_bart or rum_partners or vcc or bert_burning or vcc or doc_copper or dutch_zebra or escape_rojas or parrot_dragon or yoda_cubish or atilla_hans or nyc_drevil or gnd or stix_unicorn or vcc or sleepy_marco or sgates_juliet or waster_beetle or gnd or naproxen_loud or stapler_hulk or crank_mozart or gnd or west_stick or crank_comtrex or zi_chowmein or extremist_due or crack_sortout or saturn_iguana or fufu_bono or tracy_snape or rose_narcissa or pcp_moonraker or spyro_lotus or elian_heidi or gnd or might_what or workhere_mao or jcrew_siamese or peaves_hut or chillis_fish or golf_onion or vcc or lizard_peta or vcc or chowmein_guy)
  begin
    tobe_crystal_mux_dat = {air_monkey,vcc,touch_homerun,victor_copper,vcc,hector_potato,vcc,liberace_lad,gnd,gnd,giraffe_hp,happy_bear,yoda_cubish,art_smack,genji_fuji,vcc,bfs_mortar,turkey_ohno,kappa_bismuth,draco_rabbi,southern_bfi,lion_grumby,gnd,hotel_zed,ready_xray,lagoon_ebay,mine_chief,beetle_genji,iron_wonton,often_safeway,wakey_zebra,devotion_mao,att_hinge,life_comrade,dadada_rubik,skipper_gonzo,kang_howell,snape_neptune,rose_martian,gnd,zinc_zealot,gnd,rouge_plaster,vcc,gnd,nigiri_ford,gnd,ernie_spyro,goblin_buddha,smack_ohno,aladdin_egg,vegan_isle,drdeath_gulp,whale_elguapo,bloom_larry,gnd,baron_foliage,bracket_barty,gnd,duey_superman,genesis_ozzy,stick_intuit,ceres_whale,vcc,midas_balloon,freaky_pdaddy,drugs_drunken,gnd,meth_platypus,vcc,ernie_spyro,lion_would,due_valve,bison_midas,gnd,golden_boots,wicked_desade,gnd,saturn_iguana,gnd,gnd,money_picture,master_bart,rum_partners,vcc,bert_burning,vcc,doc_copper,dutch_zebra,escape_rojas,parrot_dragon,yoda_cubish,atilla_hans,nyc_drevil,gnd,stix_unicorn,vcc,sleepy_marco,sgates_juliet,waster_beetle,gnd,naproxen_loud,stapler_hulk,crank_mozart,gnd,west_stick,crank_comtrex,zi_chowmein,extremist_due,crack_sortout,saturn_iguana,fufu_bono,tracy_snape,rose_narcissa,pcp_moonraker,spyro_lotus,elian_heidi,gnd,might_what,workhere_mao,jcrew_siamese,peaves_hut,chillis_fish,golf_onion,vcc,lizard_peta,vcc,chowmein_guy};
  end

always @(homer_pirate or curie_cheez or stroop_bart or kangaroo_Iwin or willy_lxtcen or hp_richard or naproxen_loud)
  begin
    tobe_crystal_mux_sel = {homer_pirate,curie_cheez,stroop_bart,kangaroo_Iwin,willy_lxtcen,hp_richard,naproxen_loud};
  end

always @(tobe_crystal_mux_dat or tobe_crystal_mux_sel)
  begin
    warlock_remus = tobe_crystal_mux_dat[tobe_crystal_mux_sel];
  end

// XOR all of these bits together
always @(suffering_pig or zedong_eunice or louie_mideast or whatelse_bull or blessyou_palm or prison_star)
  begin
      gutter_jcrew = ^ {suffering_pig,zedong_eunice,louie_mideast,whatelse_bull,blessyou_palm,prison_star};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jiminy_draco <= 0;
    else
    case ({gnd,vcc})
       0 : jiminy_draco <= flew_valve;
       1 : jiminy_draco <= draco_salmon;
       2 : jiminy_draco <= jiminy_draco;
       3 : jiminy_draco <= castaway_bull;
       default : jiminy_draco <= 0;
    endcase
  end

// XOR all of these bits together
always @(doc_pictures or vcc or deng_atoms or kappa_bismuth or cow_alpha or vcc or sears_rerun)
  begin
      wine_money = ^ {doc_pictures,vcc,deng_atoms,kappa_bismuth,cow_alpha,vcc,sears_rerun};
  end

// 3 bit SOP selector
always @(
        protest_mine or vcc  or 
        portnoy_lost or arizona_water  or 
        deng_love_in or rarest_yummy 
)

begin
    tonks_marquis = 
      protest_mine & vcc |
      portnoy_lost & arizona_water |
      deng_love_in & rarest_yummy;
end

// Greater Equal Less compare
always @(jacques_bach or art_jupiter or ceres_elian or gnd or money_wiggles or stapler_hulk or pizza_tobiko or pcp_moonraker or lala_drugs or homerun_deng)
  begin
    if ({jacques_bach,art_jupiter,ceres_elian,gnd,money_wiggles} > {stapler_hulk,pizza_tobiko,pcp_moonraker,lala_drugs,homerun_deng})
       {wonton_guy,spock_cain,potato_bert} = 3'b100;
    else if ({jacques_bach,art_jupiter,ceres_elian,gnd,money_wiggles} < {stapler_hulk,pizza_tobiko,pcp_moonraker,lala_drugs,homerun_deng})
       {wonton_guy,spock_cain,potato_bert} = 3'b010;
    else
       {wonton_guy,spock_cain,potato_bert} = 3'b001;
  end

// XNOR all of these bits together
always @(muffin_joseph or kbtoys_often or vcc or golf_pizza or curly_baron or vcc)
  begin
      dragon_zen = ~^ {muffin_joseph,kbtoys_often,vcc,golf_pizza,curly_baron,vcc};
  end


// building a 8 to 1 MUX operator
reg [7:0] float_severus_mux_dat;
reg [2:0] float_severus_mux_sel;
always @(bert_kaisha or vcc or marco_icarus or gnd or zebra_bubba or spain_nail or vcc or safeway_egg)
  begin
    float_severus_mux_dat = {bert_kaisha,vcc,marco_icarus,gnd,zebra_bubba,spain_nail,vcc,safeway_egg};
  end

always @(vcc or saturn_iguana or badger_hotel)
  begin
    float_severus_mux_sel = {vcc,saturn_iguana,badger_hotel};
  end

always @(float_severus_mux_dat or float_severus_mux_sel)
  begin
    troll_water = float_severus_mux_dat[float_severus_mux_sel];
  end

// NOR all of these bits together
always @(suffering_pig or rose_marvin or rabbi_waffle or joseph_hoser or gnd or wonder_luthor or west_athena)
  begin
      pierre_tasty = ~| {suffering_pig,rose_marvin,rabbi_waffle,joseph_hoser,gnd,wonder_luthor,west_athena};
  end

// Random 2 input look up table
always @(sanity_minnie or gnd)
  begin
    casex ({sanity_minnie,gnd})
      0: heidi_neville=1;
      1: heidi_neville=0;
      2: heidi_neville=0;
      3: heidi_neville=1;
      default: heidi_neville=0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      timmy_scotch <= 0;
    else
    case ({romex_ginger,papa_sun})
       0 : timmy_scotch <= life_comrade;
       1 : timmy_scotch <= timmy_scotch;
       2 : timmy_scotch <= timmy_scotch;
       3 : timmy_scotch <= gnd;
       default : timmy_scotch <= 0;
    endcase
  end

// XNOR all of these bits together
always @(tabby_nuclear or golf_onion or yellow_victor or tobe_davidlin or nuclear_jonas or gin_zhuang or yellow_victor or rose_martian or ready_lovey or emu_ebay)
  begin
      heidi_deuce = ~^ {tabby_nuclear,golf_onion,yellow_victor,tobe_davidlin,nuclear_jonas,gin_zhuang,yellow_victor,rose_martian,ready_lovey,emu_ebay};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stroop_prison <= 0;
    else
    case ({sand_lotus,siamese_pyro})
       0 : stroop_prison <= lagoon_rodent;
       1 : stroop_prison <= stroop_prison;
       2 : stroop_prison <= stroop_prison;
       3 : stroop_prison <= stroop_prison;
       default : stroop_prison <= 0;
    endcase
  end

// 4 bit SOP selector
always @(
        jiminy_draco or deng_gyro  or 
        vcc or klaas_tesla  or 
        gin_golden or advil_yummy  or 
        vcc or sgates_juliet 
)

begin
    jinyong_eagle = 
      jiminy_draco & deng_gyro |
      vcc & klaas_tesla |
      gin_golden & advil_yummy |
      vcc & sgates_juliet;
end

// 5 bit SOP selector
always @(
        kilo_india or emu_zipporah  or 
        vcc or pierre_tasty  or 
        turnip_jason or quail_shemp  or 
        captain_milo or molokai_rum  or 
        nail_north or baron_foliage 
)

begin
    moulin_lizard = 
      kilo_india & emu_zipporah |
      vcc & pierre_tasty |
      turnip_jason & quail_shemp |
      captain_milo & molokai_rum |
      nail_north & baron_foliage;
end


// building a 8 to 1 MUX operator
reg [7:0] kilo_waffle_mux_dat;
reg [2:0] kilo_waffle_mux_sel;
always @(sogood_ceres or ham_vadar or snape_neptune or foryou_subway or money_picture or thread_plague or ebi_bert or sheep_grams)
  begin
    kilo_waffle_mux_dat = {sogood_ceres,ham_vadar,snape_neptune,foryou_subway,money_picture,thread_plague,ebi_bert,sheep_grams};
  end

always @(lumber_crucio or crab_popcorn or stick_intuit)
  begin
    kilo_waffle_mux_sel = {lumber_crucio,crab_popcorn,stick_intuit};
  end

always @(kilo_waffle_mux_dat or kilo_waffle_mux_sel)
  begin
    newt_bach = kilo_waffle_mux_dat[kilo_waffle_mux_sel];
  end

// NOR all of these bits together
always @(burning_tesla or waster_minnie or hulk_feynman or boing_gutter or lion_grumby or gnd or ernie_spyro or jesus_rubik)
  begin
      starwars_rum = ~| {burning_tesla,waster_minnie,hulk_feynman,boing_gutter,lion_grumby,gnd,ernie_spyro,jesus_rubik};
  end

// Greater Equal Less compare
always @(lumber_kmfdm or wonder_wood or turnip_jason or jacuzzi_lotus or chillis_fish or metal_romulus or star_arthur or gnd or vcc or snake_often or moe_burning or deng_junkie or gnd or star_ernie)
  begin
    if ({lumber_kmfdm,wonder_wood,turnip_jason,jacuzzi_lotus,chillis_fish,metal_romulus,star_arthur} > {gnd,vcc,snake_often,moe_burning,deng_junkie,gnd,star_ernie})
       {spastic_haze,ulysses_kappa,curly_frog} = 3'b100;
    else if ({lumber_kmfdm,wonder_wood,turnip_jason,jacuzzi_lotus,chillis_fish,metal_romulus,star_arthur} < {gnd,vcc,snake_often,moe_burning,deng_junkie,gnd,star_ernie})
       {spastic_haze,ulysses_kappa,curly_frog} = 3'b010;
    else
       {spastic_haze,ulysses_kappa,curly_frog} = 3'b001;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_nirish <= 0;
    else
    case ({sheep_grams,nyc_drevil})
       0 : money_nirish <= spyro_might;
       1 : money_nirish <= huhhuh_smack;
       2 : money_nirish <= floating_guy;
       3 : money_nirish <= money_nirish;
       default : money_nirish <= 0;
    endcase
  end

// XOR all of these bits together
always @(vcc or often_crack or killme_arcade or tonic_whale or gnd or leaky_mortar or advil_picture or boing_freaky or paper_yoku or hinge_vegan or dadada_rubik or klaas_oitcen)
  begin
      eel_iceland = ^ {vcc,often_crack,killme_arcade,tonic_whale,gnd,leaky_mortar,advil_picture,boing_freaky,paper_yoku,hinge_vegan,dadada_rubik,klaas_oitcen};
  end


initial begin
    {salmon_think,plaster_isle,woman_elian} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (iron_cheese)
      {salmon_think,plaster_isle,woman_elian} <= 0;
    else if (rodent_badger)
      {salmon_think,plaster_isle,woman_elian} <=
		  {star_arthur,escape_escape,floating_guy};
    else
      {salmon_think,plaster_isle,woman_elian} <=
		 {nigiri_donut,vcc,advil_picture} + 
		 {vcc,dig_molokai,brian_cuanto};
  end

// 9 bit SOP selector
always @(
        gnd or rose_marvin  or 
        gnd or sogood_ceres  or 
        china_fitter or gnd  or 
        homerun_deng or devotion_mao  or 
        hummer_star or warlock_remus  or 
        vcc or monster_isle  or 
        dragon_malfoy or blaster_togos  or 
        hp_rampacker or golf_xiaoping  or 
        testyour_duey or beauty_coffee 
)

begin
    howell_dopey = 
      gnd & rose_marvin |
      gnd & sogood_ceres |
      china_fitter & gnd |
      homerun_deng & devotion_mao |
      hummer_star & warlock_remus |
      vcc & monster_isle |
      dragon_malfoy & blaster_togos |
      hp_rampacker & golf_xiaoping |
      testyour_duey & beauty_coffee;
end

// OR all of these bits together
always @(troll_water or woman_elian or alpha_maryann)
  begin
      pcp_nyc = | {troll_water,woman_elian,alpha_maryann};
  end


initial begin
    {trevor_beavis,stick_budlite,weevil_whammy} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (hercules_opus)
      {trevor_beavis,stick_budlite,weevil_whammy} <= 0;
    else if (ebi_bert)
      {trevor_beavis,stick_budlite,weevil_whammy} <=
		  {bust_ocean,eel_iceland,vcc};
    else
      {trevor_beavis,stick_budlite,weevil_whammy} <=
		 {jinyong_eagle,vcc,clay_marco} + 
		 {salmon_wood,vcc,sheep_octapus};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mortar_po <= 0;
    else
    case ({vcc,drunken_paper})
       0 : mortar_po <= cain_floride;
       1 : mortar_po <= mortar_po;
       2 : mortar_po <= mortar_po;
       3 : mortar_po <= mortar_po;
       default : mortar_po <= 0;
    endcase
  end

// XNOR all of these bits together
always @(vcc or ceres_bep or curly_frog or peta_zinc or gnd or gnd or tonks_marquis or gnd)
  begin
      oldnavy_bacon = ~^ {vcc,ceres_bep,curly_frog,peta_zinc,gnd,gnd,tonks_marquis,gnd};
  end

// 6 bit SOP selector
always @(
        sinew_willem or lamer_fear  or 
        neville_xterm or vcc  or 
        goat_marco or west_stick  or 
        emu_zipporah or whatelse_bull  or 
        intel_warlock or vcc  or 
        jonas_bep or meth_holland 
)

begin
    zealot_tesla = 
      sinew_willem & lamer_fear |
      neville_xterm & vcc |
      goat_marco & west_stick |
      emu_zipporah & whatelse_bull |
      intel_warlock & vcc |
      jonas_bep & meth_holland;
end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_gin <= 0;
    else
    case ({vcc,mortar_po})
       0 : advil_gin <= advil_gin;
       1 : advil_gin <= vcc;
       2 : advil_gin <= advil_gin;
       3 : advil_gin <= advil_gin;
       default : advil_gin <= 0;
    endcase
  end

// XOR all of these bits together
always @(escape_questo or iron_cheese or vcc or egg_hinge or vcc or rerun_might or star_yoku or zulu_satanist or beemer_floo or lumber_crucio or arthur_att or gnd)
  begin
      vicks_troll = ^ {escape_questo,iron_cheese,vcc,egg_hinge,vcc,rerun_might,star_yoku,zulu_satanist,beemer_floo,lumber_crucio,arthur_att,gnd};
  end


// building a 128 to 1 MUX operator
reg [127:0] usa_lizard_mux_dat;
reg [6:0] usa_lizard_mux_sel;
always @(newt_bach or spyro_might or animal_danger or tasty_jjocen or gnd or gnd or lagoon_ebay or drugs_drunken or gnd or boing_freaky or meth_holland or molokai_rum or monster_isle or goat_marco or dingbat_snape or loud_bullet or mine_nasdaq or fronds_shuda or moe_burning or gnd or gnd or loud_brian or zedong_eunice or pizza_tapered or egg_hinge or molokai_rum or often_tylenol or sand_lotus or ready_lovey or wonton_guy or art_smack or hotel_zed or vcc or vcc or peta_zinc or cheese_jonas or intel_warlock or meth_holland or gnd or vcc or zulu_satanist or ready_lovey or condit_bambi or bison_gotone or surfer_fuji or vcc or lumber_kmfdm or sheep_grams or rodent_south or sheep_grams or hours_floride or alpha_zeus or advil_gin or sneezy_zulu or hagrid_zeus or deng_gyro or salmon_think or gnd or troll_water or haze_smithers or dog_vulture or ulysses_kappa or gnd or escape_rojas or wakey_zebra or east_boots or kabar_tabby or tinker_sierra or spock_cain or lotus_kungfu or bear_candle or hercules_opus or tracy_snape or turkey_ohno or drax_rat or vcc or bach_salami or jacuzzi_meth or rat_solder or rose_roe or spain_wonton or gnd or waster_jjocen or vcc or vcc or lad_spirit or jacques_bach or sheep_grams or emu_zipporah or gm_school or stroop_prison or pcp_nyc or lupin_bullet or money_picture or starwars_rum or ready_lovey or intel_warlock or air_goat or onion_shemp or remus_vicks or gnd or gnd or vcc or tango_ykocens or wonder_fronds or kang_howell or gnd or baron_foliage or jesus_rubik or dork_valve or deng_gyro or gnd or west_athena or killer_curie or gnd or vcc or timmy_scotch or joseph_deuce or dig_fsncens or picante_meth or gnd or killme_arcade or kilo_marge or vcc or gnd or gnd or gnd or sinew_rodent)
  begin
    usa_lizard_mux_dat = {newt_bach,spyro_might,animal_danger,tasty_jjocen,gnd,gnd,lagoon_ebay,drugs_drunken,gnd,boing_freaky,meth_holland,molokai_rum,monster_isle,goat_marco,dingbat_snape,loud_bullet,mine_nasdaq,fronds_shuda,moe_burning,gnd,gnd,loud_brian,zedong_eunice,pizza_tapered,egg_hinge,molokai_rum,often_tylenol,sand_lotus,ready_lovey,wonton_guy,art_smack,hotel_zed,vcc,vcc,peta_zinc,cheese_jonas,intel_warlock,meth_holland,gnd,vcc,zulu_satanist,ready_lovey,condit_bambi,bison_gotone,surfer_fuji,vcc,lumber_kmfdm,sheep_grams,rodent_south,sheep_grams,hours_floride,alpha_zeus,advil_gin,sneezy_zulu,hagrid_zeus,deng_gyro,salmon_think,gnd,troll_water,haze_smithers,dog_vulture,ulysses_kappa,gnd,escape_rojas,wakey_zebra,east_boots,kabar_tabby,tinker_sierra,spock_cain,lotus_kungfu,bear_candle,hercules_opus,tracy_snape,turkey_ohno,drax_rat,vcc,bach_salami,jacuzzi_meth,rat_solder,rose_roe,spain_wonton,gnd,waster_jjocen,vcc,vcc,lad_spirit,jacques_bach,sheep_grams,emu_zipporah,gm_school,stroop_prison,pcp_nyc,lupin_bullet,money_picture,starwars_rum,ready_lovey,intel_warlock,air_goat,onion_shemp,remus_vicks,gnd,gnd,vcc,tango_ykocens,wonder_fronds,kang_howell,gnd,baron_foliage,jesus_rubik,dork_valve,deng_gyro,gnd,west_athena,killer_curie,gnd,vcc,timmy_scotch,joseph_deuce,dig_fsncens,picante_meth,gnd,killme_arcade,kilo_marge,vcc,gnd,gnd,gnd,sinew_rodent};
  end

always @(yoda_cubish or money_nirish or spirit_norris or pasta_buddha or vcc or onion_shemp or spastic_haze)
  begin
    usa_lizard_mux_sel = {yoda_cubish,money_nirish,spirit_norris,pasta_buddha,vcc,onion_shemp,spastic_haze};
  end

always @(usa_lizard_mux_dat or usa_lizard_mux_sel)
  begin
    desade_vegas = usa_lizard_mux_dat[usa_lizard_mux_sel];
  end


// building a 16 to 1 MUX operator
reg [15:0] pasta_wukong_mux_dat;
reg [3:0] pasta_wukong_mux_sel;
always @(rocks_lumber or onion_moses or sinew_willem or kang_howell or advil_picture or wicked_desade or gnd or flew_valve or gnd or potter_zealot or mexican_mike or falafel_duey or gnd or vicks_troll or dweebie_elian or oldnavy_bacon)
  begin
    pasta_wukong_mux_dat = {rocks_lumber,onion_moses,sinew_willem,kang_howell,advil_picture,wicked_desade,gnd,flew_valve,gnd,potter_zealot,mexican_mike,falafel_duey,gnd,vicks_troll,dweebie_elian,oldnavy_bacon};
  end

always @(vcc or gnd or draco_salmon or freaky_tasty)
  begin
    pasta_wukong_mux_sel = {vcc,gnd,draco_salmon,freaky_tasty};
  end

always @(pasta_wukong_mux_dat or pasta_wukong_mux_sel)
  begin
    kana_rerun = pasta_wukong_mux_dat[pasta_wukong_mux_sel];
  end

// XNOR all of these bits together
always @(meth_holland or rarest_yummy or vcc or dig_bambi or gnd)
  begin
      cain_wizard = ~^ {meth_holland,rarest_yummy,vcc,dig_bambi,gnd};
  end

// Random 9 input look up table
always @(vcc or square_cubish or gnd or cain_wizard or trevor_beavis or spock_cain or vcc or air_gutter or howell_hans)
  begin
    casex ({vcc,square_cubish,gnd,cain_wizard,trevor_beavis,spock_cain,vcc,air_gutter,howell_hans})
      0: goblin_drevil=1;
      1: goblin_drevil=1;
      2: goblin_drevil=0;
      3: goblin_drevil=0;
      4: goblin_drevil=0;
      5: goblin_drevil=0;
      6: goblin_drevil=1;
      7: goblin_drevil=0;
      8: goblin_drevil=0;
      9: goblin_drevil=0;
      10: goblin_drevil=1;
      11: goblin_drevil=1;
      12: goblin_drevil=0;
      13: goblin_drevil=0;
      14: goblin_drevil=1;
      15: goblin_drevil=1;
      16: goblin_drevil=1;
      17: goblin_drevil=0;
      18: goblin_drevil=1;
      19: goblin_drevil=1;
      20: goblin_drevil=1;
      21: goblin_drevil=0;
      22: goblin_drevil=0;
      23: goblin_drevil=1;
      24: goblin_drevil=0;
      25: goblin_drevil=1;
      26: goblin_drevil=1;
      27: goblin_drevil=1;
      28: goblin_drevil=1;
      29: goblin_drevil=1;
      30: goblin_drevil=0;
      31: goblin_drevil=1;
      32: goblin_drevil=1;
      33: goblin_drevil=0;
      34: goblin_drevil=0;
      35: goblin_drevil=1;
      36: goblin_drevil=1;
      37: goblin_drevil=1;
      38: goblin_drevil=1;
      39: goblin_drevil=0;
      40: goblin_drevil=0;
      41: goblin_drevil=0;
      42: goblin_drevil=1;
      43: goblin_drevil=1;
      44: goblin_drevil=0;
      45: goblin_drevil=1;
      46: goblin_drevil=1;
      47: goblin_drevil=1;
      48: goblin_drevil=0;
      49: goblin_drevil=0;
      50: goblin_drevil=0;
      51: goblin_drevil=1;
      52: goblin_drevil=0;
      53: goblin_drevil=0;
      54: goblin_drevil=1;
      55: goblin_drevil=1;
      56: goblin_drevil=1;
      57: goblin_drevil=0;
      58: goblin_drevil=1;
      59: goblin_drevil=0;
      60: goblin_drevil=1;
      61: goblin_drevil=0;
      62: goblin_drevil=0;
      63: goblin_drevil=0;
      64: goblin_drevil=1;
      65: goblin_drevil=0;
      66: goblin_drevil=0;
      67: goblin_drevil=1;
      68: goblin_drevil=0;
      69: goblin_drevil=0;
      70: goblin_drevil=1;
      71: goblin_drevil=1;
      72: goblin_drevil=1;
      73: goblin_drevil=0;
      74: goblin_drevil=1;
      75: goblin_drevil=0;
      76: goblin_drevil=1;
      77: goblin_drevil=0;
      78: goblin_drevil=0;
      79: goblin_drevil=0;
      80: goblin_drevil=1;
      81: goblin_drevil=0;
      82: goblin_drevil=0;
      83: goblin_drevil=0;
      84: goblin_drevil=1;
      85: goblin_drevil=0;
      86: goblin_drevil=0;
      87: goblin_drevil=1;
      88: goblin_drevil=1;
      89: goblin_drevil=0;
      90: goblin_drevil=1;
      91: goblin_drevil=0;
      92: goblin_drevil=0;
      93: goblin_drevil=1;
      94: goblin_drevil=1;
      95: goblin_drevil=0;
      96: goblin_drevil=1;
      97: goblin_drevil=0;
      98: goblin_drevil=1;
      99: goblin_drevil=1;
      100: goblin_drevil=0;
      101: goblin_drevil=0;
      102: goblin_drevil=1;
      103: goblin_drevil=0;
      104: goblin_drevil=1;
      105: goblin_drevil=1;
      106: goblin_drevil=0;
      107: goblin_drevil=0;
      108: goblin_drevil=1;
      109: goblin_drevil=0;
      110: goblin_drevil=1;
      111: goblin_drevil=1;
      112: goblin_drevil=0;
      113: goblin_drevil=1;
      114: goblin_drevil=0;
      115: goblin_drevil=1;
      116: goblin_drevil=1;
      117: goblin_drevil=0;
      118: goblin_drevil=1;
      119: goblin_drevil=0;
      120: goblin_drevil=1;
      121: goblin_drevil=0;
      122: goblin_drevil=0;
      123: goblin_drevil=0;
      124: goblin_drevil=1;
      125: goblin_drevil=0;
      126: goblin_drevil=1;
      127: goblin_drevil=0;
      128: goblin_drevil=0;
      129: goblin_drevil=1;
      130: goblin_drevil=0;
      131: goblin_drevil=0;
      132: goblin_drevil=0;
      133: goblin_drevil=1;
      134: goblin_drevil=0;
      135: goblin_drevil=1;
      136: goblin_drevil=1;
      137: goblin_drevil=1;
      138: goblin_drevil=0;
      139: goblin_drevil=0;
      140: goblin_drevil=1;
      141: goblin_drevil=1;
      142: goblin_drevil=0;
      143: goblin_drevil=0;
      144: goblin_drevil=0;
      145: goblin_drevil=1;
      146: goblin_drevil=0;
      147: goblin_drevil=1;
      148: goblin_drevil=0;
      149: goblin_drevil=0;
      150: goblin_drevil=0;
      151: goblin_drevil=1;
      152: goblin_drevil=0;
      153: goblin_drevil=0;
      154: goblin_drevil=1;
      155: goblin_drevil=1;
      156: goblin_drevil=1;
      157: goblin_drevil=1;
      158: goblin_drevil=0;
      159: goblin_drevil=1;
      160: goblin_drevil=0;
      161: goblin_drevil=0;
      162: goblin_drevil=0;
      163: goblin_drevil=0;
      164: goblin_drevil=1;
      165: goblin_drevil=0;
      166: goblin_drevil=1;
      167: goblin_drevil=0;
      168: goblin_drevil=1;
      169: goblin_drevil=0;
      170: goblin_drevil=1;
      171: goblin_drevil=0;
      172: goblin_drevil=0;
      173: goblin_drevil=0;
      174: goblin_drevil=1;
      175: goblin_drevil=0;
      176: goblin_drevil=1;
      177: goblin_drevil=1;
      178: goblin_drevil=1;
      179: goblin_drevil=0;
      180: goblin_drevil=0;
      181: goblin_drevil=0;
      182: goblin_drevil=0;
      183: goblin_drevil=1;
      184: goblin_drevil=0;
      185: goblin_drevil=0;
      186: goblin_drevil=1;
      187: goblin_drevil=1;
      188: goblin_drevil=1;
      189: goblin_drevil=0;
      190: goblin_drevil=1;
      191: goblin_drevil=0;
      192: goblin_drevil=1;
      193: goblin_drevil=0;
      194: goblin_drevil=0;
      195: goblin_drevil=1;
      196: goblin_drevil=0;
      197: goblin_drevil=0;
      198: goblin_drevil=1;
      199: goblin_drevil=1;
      200: goblin_drevil=1;
      201: goblin_drevil=1;
      202: goblin_drevil=1;
      203: goblin_drevil=1;
      204: goblin_drevil=1;
      205: goblin_drevil=0;
      206: goblin_drevil=1;
      207: goblin_drevil=0;
      208: goblin_drevil=0;
      209: goblin_drevil=1;
      210: goblin_drevil=1;
      211: goblin_drevil=0;
      212: goblin_drevil=1;
      213: goblin_drevil=0;
      214: goblin_drevil=1;
      215: goblin_drevil=0;
      216: goblin_drevil=1;
      217: goblin_drevil=1;
      218: goblin_drevil=0;
      219: goblin_drevil=1;
      220: goblin_drevil=0;
      221: goblin_drevil=0;
      222: goblin_drevil=0;
      223: goblin_drevil=1;
      224: goblin_drevil=0;
      225: goblin_drevil=1;
      226: goblin_drevil=1;
      227: goblin_drevil=0;
      228: goblin_drevil=0;
      229: goblin_drevil=1;
      230: goblin_drevil=1;
      231: goblin_drevil=0;
      232: goblin_drevil=1;
      233: goblin_drevil=1;
      234: goblin_drevil=0;
      235: goblin_drevil=1;
      236: goblin_drevil=1;
      237: goblin_drevil=1;
      238: goblin_drevil=0;
      239: goblin_drevil=1;
      240: goblin_drevil=0;
      241: goblin_drevil=1;
      242: goblin_drevil=1;
      243: goblin_drevil=1;
      244: goblin_drevil=1;
      245: goblin_drevil=0;
      246: goblin_drevil=0;
      247: goblin_drevil=0;
      248: goblin_drevil=0;
      249: goblin_drevil=0;
      250: goblin_drevil=0;
      251: goblin_drevil=1;
      252: goblin_drevil=1;
      253: goblin_drevil=1;
      254: goblin_drevil=0;
      255: goblin_drevil=0;
      256: goblin_drevil=0;
      257: goblin_drevil=0;
      258: goblin_drevil=0;
      259: goblin_drevil=1;
      260: goblin_drevil=1;
      261: goblin_drevil=1;
      262: goblin_drevil=1;
      263: goblin_drevil=0;
      264: goblin_drevil=0;
      265: goblin_drevil=1;
      266: goblin_drevil=1;
      267: goblin_drevil=1;
      268: goblin_drevil=1;
      269: goblin_drevil=1;
      270: goblin_drevil=0;
      271: goblin_drevil=0;
      272: goblin_drevil=1;
      273: goblin_drevil=0;
      274: goblin_drevil=0;
      275: goblin_drevil=1;
      276: goblin_drevil=1;
      277: goblin_drevil=1;
      278: goblin_drevil=1;
      279: goblin_drevil=0;
      280: goblin_drevil=1;
      281: goblin_drevil=0;
      282: goblin_drevil=1;
      283: goblin_drevil=1;
      284: goblin_drevil=1;
      285: goblin_drevil=1;
      286: goblin_drevil=1;
      287: goblin_drevil=1;
      288: goblin_drevil=0;
      289: goblin_drevil=0;
      290: goblin_drevil=1;
      291: goblin_drevil=0;
      292: goblin_drevil=1;
      293: goblin_drevil=1;
      294: goblin_drevil=1;
      295: goblin_drevil=1;
      296: goblin_drevil=0;
      297: goblin_drevil=1;
      298: goblin_drevil=0;
      299: goblin_drevil=1;
      300: goblin_drevil=0;
      301: goblin_drevil=0;
      302: goblin_drevil=0;
      303: goblin_drevil=1;
      304: goblin_drevil=1;
      305: goblin_drevil=0;
      306: goblin_drevil=0;
      307: goblin_drevil=1;
      308: goblin_drevil=0;
      309: goblin_drevil=0;
      310: goblin_drevil=1;
      311: goblin_drevil=0;
      312: goblin_drevil=0;
      313: goblin_drevil=1;
      314: goblin_drevil=0;
      315: goblin_drevil=1;
      316: goblin_drevil=1;
      317: goblin_drevil=1;
      318: goblin_drevil=0;
      319: goblin_drevil=1;
      320: goblin_drevil=0;
      321: goblin_drevil=1;
      322: goblin_drevil=1;
      323: goblin_drevil=0;
      324: goblin_drevil=1;
      325: goblin_drevil=1;
      326: goblin_drevil=0;
      327: goblin_drevil=0;
      328: goblin_drevil=1;
      329: goblin_drevil=1;
      330: goblin_drevil=1;
      331: goblin_drevil=1;
      332: goblin_drevil=1;
      333: goblin_drevil=1;
      334: goblin_drevil=1;
      335: goblin_drevil=0;
      336: goblin_drevil=1;
      337: goblin_drevil=1;
      338: goblin_drevil=1;
      339: goblin_drevil=0;
      340: goblin_drevil=1;
      341: goblin_drevil=0;
      342: goblin_drevil=1;
      343: goblin_drevil=0;
      344: goblin_drevil=0;
      345: goblin_drevil=0;
      346: goblin_drevil=0;
      347: goblin_drevil=1;
      348: goblin_drevil=1;
      349: goblin_drevil=1;
      350: goblin_drevil=1;
      351: goblin_drevil=0;
      352: goblin_drevil=0;
      353: goblin_drevil=1;
      354: goblin_drevil=1;
      355: goblin_drevil=1;
      356: goblin_drevil=1;
      357: goblin_drevil=1;
      358: goblin_drevil=0;
      359: goblin_drevil=0;
      360: goblin_drevil=0;
      361: goblin_drevil=1;
      362: goblin_drevil=0;
      363: goblin_drevil=1;
      364: goblin_drevil=0;
      365: goblin_drevil=0;
      366: goblin_drevil=1;
      367: goblin_drevil=1;
      368: goblin_drevil=1;
      369: goblin_drevil=1;
      370: goblin_drevil=1;
      371: goblin_drevil=1;
      372: goblin_drevil=1;
      373: goblin_drevil=1;
      374: goblin_drevil=1;
      375: goblin_drevil=1;
      376: goblin_drevil=1;
      377: goblin_drevil=1;
      378: goblin_drevil=0;
      379: goblin_drevil=1;
      380: goblin_drevil=1;
      381: goblin_drevil=0;
      382: goblin_drevil=0;
      383: goblin_drevil=0;
      384: goblin_drevil=0;
      385: goblin_drevil=1;
      386: goblin_drevil=0;
      387: goblin_drevil=1;
      388: goblin_drevil=0;
      389: goblin_drevil=0;
      390: goblin_drevil=1;
      391: goblin_drevil=1;
      392: goblin_drevil=0;
      393: goblin_drevil=0;
      394: goblin_drevil=0;
      395: goblin_drevil=0;
      396: goblin_drevil=0;
      397: goblin_drevil=0;
      398: goblin_drevil=0;
      399: goblin_drevil=1;
      400: goblin_drevil=1;
      401: goblin_drevil=0;
      402: goblin_drevil=1;
      403: goblin_drevil=1;
      404: goblin_drevil=0;
      405: goblin_drevil=0;
      406: goblin_drevil=1;
      407: goblin_drevil=1;
      408: goblin_drevil=0;
      409: goblin_drevil=1;
      410: goblin_drevil=1;
      411: goblin_drevil=0;
      412: goblin_drevil=1;
      413: goblin_drevil=0;
      414: goblin_drevil=0;
      415: goblin_drevil=0;
      416: goblin_drevil=0;
      417: goblin_drevil=1;
      418: goblin_drevil=1;
      419: goblin_drevil=1;
      420: goblin_drevil=0;
      421: goblin_drevil=1;
      422: goblin_drevil=1;
      423: goblin_drevil=1;
      424: goblin_drevil=0;
      425: goblin_drevil=0;
      426: goblin_drevil=0;
      427: goblin_drevil=1;
      428: goblin_drevil=1;
      429: goblin_drevil=0;
      430: goblin_drevil=1;
      431: goblin_drevil=0;
      432: goblin_drevil=0;
      433: goblin_drevil=0;
      434: goblin_drevil=0;
      435: goblin_drevil=0;
      436: goblin_drevil=0;
      437: goblin_drevil=0;
      438: goblin_drevil=0;
      439: goblin_drevil=0;
      440: goblin_drevil=1;
      441: goblin_drevil=0;
      442: goblin_drevil=0;
      443: goblin_drevil=1;
      444: goblin_drevil=1;
      445: goblin_drevil=1;
      446: goblin_drevil=0;
      447: goblin_drevil=1;
      448: goblin_drevil=1;
      449: goblin_drevil=1;
      450: goblin_drevil=1;
      451: goblin_drevil=0;
      452: goblin_drevil=0;
      453: goblin_drevil=1;
      454: goblin_drevil=0;
      455: goblin_drevil=1;
      456: goblin_drevil=0;
      457: goblin_drevil=1;
      458: goblin_drevil=0;
      459: goblin_drevil=1;
      460: goblin_drevil=0;
      461: goblin_drevil=1;
      462: goblin_drevil=1;
      463: goblin_drevil=0;
      464: goblin_drevil=1;
      465: goblin_drevil=0;
      466: goblin_drevil=0;
      467: goblin_drevil=1;
      468: goblin_drevil=0;
      469: goblin_drevil=0;
      470: goblin_drevil=1;
      471: goblin_drevil=0;
      472: goblin_drevil=0;
      473: goblin_drevil=0;
      474: goblin_drevil=0;
      475: goblin_drevil=0;
      476: goblin_drevil=1;
      477: goblin_drevil=1;
      478: goblin_drevil=0;
      479: goblin_drevil=0;
      480: goblin_drevil=0;
      481: goblin_drevil=0;
      482: goblin_drevil=1;
      483: goblin_drevil=1;
      484: goblin_drevil=0;
      485: goblin_drevil=1;
      486: goblin_drevil=1;
      487: goblin_drevil=1;
      488: goblin_drevil=0;
      489: goblin_drevil=0;
      490: goblin_drevil=1;
      491: goblin_drevil=0;
      492: goblin_drevil=1;
      493: goblin_drevil=0;
      494: goblin_drevil=1;
      495: goblin_drevil=1;
      496: goblin_drevil=1;
      497: goblin_drevil=0;
      498: goblin_drevil=0;
      499: goblin_drevil=0;
      500: goblin_drevil=1;
      501: goblin_drevil=1;
      502: goblin_drevil=1;
      503: goblin_drevil=0;
      504: goblin_drevil=1;
      505: goblin_drevil=0;
      506: goblin_drevil=0;
      507: goblin_drevil=0;
      508: goblin_drevil=1;
      509: goblin_drevil=1;
      510: goblin_drevil=0;
      511: goblin_drevil=1;
      default: goblin_drevil=0;
    endcase
  end


// building a 16 to 1 MUX operator
reg [15:0] gonzo_kmfdm_mux_dat;
reg [3:0] gonzo_kmfdm_mux_sel;
always @(vcc or salmon_wood or donald_dig or vcc or vcc or advil_cocaine or pluto_armand or east_boots or cat_whiskey or yoku_zed or turtle_kilo or aphid_pluto or gnd or onthepc_guy or joseph_deuce or england_red)
  begin
    gonzo_kmfdm_mux_dat = {vcc,salmon_wood,donald_dig,vcc,vcc,advil_cocaine,pluto_armand,east_boots,cat_whiskey,yoku_zed,turtle_kilo,aphid_pluto,gnd,onthepc_guy,joseph_deuce,england_red};
  end

always @(gin_golden or rerun_marker or gnd or monster_isle)
  begin
    gonzo_kmfdm_mux_sel = {gin_golden,rerun_marker,gnd,monster_isle};
  end

always @(gonzo_kmfdm_mux_dat or gonzo_kmfdm_mux_sel)
  begin
    uppers_bull = gonzo_kmfdm_mux_dat[gonzo_kmfdm_mux_sel];
  end

// NAND all of these bits together
always @(pcp_tattoo or vcc or senorduck_pig or vegan_lupin or whattime_bert or goblin_drevil or minnow_potter or sand_lotus or vcc or gnd)
  begin
      goat_ulysses = ~& {pcp_tattoo,vcc,senorduck_pig,vegan_lupin,whattime_bert,goblin_drevil,minnow_potter,sand_lotus,vcc,gnd};
  end

// Greater Equal Less compare
always @(stoned_zeus or curie_vicks or elf_killer or vcc or turtle_kilo or drugie_diagon or gutter_jcrew or togos_monster or vcc or sugar_newt or arizona_water or vcc)
  begin
    if ({stoned_zeus,curie_vicks,elf_killer,vcc,turtle_kilo,drugie_diagon} > {gutter_jcrew,togos_monster,vcc,sugar_newt,arizona_water,vcc})
       {hp_safada,blue_gonzo,art_curly} = 3'b100;
    else if ({stoned_zeus,curie_vicks,elf_killer,vcc,turtle_kilo,drugie_diagon} < {gutter_jcrew,togos_monster,vcc,sugar_newt,arizona_water,vcc})
       {hp_safada,blue_gonzo,art_curly} = 3'b010;
    else
       {hp_safada,blue_gonzo,art_curly} = 3'b001;
  end

// NAND all of these bits together
always @(burner_bfi or gnd or gnd or joseph_deuce or heidi_neville or onthepc_guy or gin_zhuang or kilo_star or wonton_guy or warlock_remus or gm_school or warlock_remus)
  begin
      albus_zen = ~& {burner_bfi,gnd,gnd,joseph_deuce,heidi_neville,onthepc_guy,gin_zhuang,kilo_star,wonton_guy,warlock_remus,gm_school,warlock_remus};
  end


// building a 8 to 1 MUX operator
reg [7:0] fang_cuckoo_mux_dat;
reg [2:0] fang_cuckoo_mux_sel;
always @(tinker_sierra or hp_richard or gnd or vcc or advil_picture or gnd or hiswife_zinc or peace_cannon)
  begin
    fang_cuckoo_mux_dat = {tinker_sierra,hp_richard,gnd,vcc,advil_picture,gnd,hiswife_zinc,peace_cannon};
  end

always @(rerun_might or fronds_pluto or rose_vangoh)
  begin
    fang_cuckoo_mux_sel = {rerun_might,fronds_pluto,rose_vangoh};
  end

always @(fang_cuckoo_mux_dat or fang_cuckoo_mux_sel)
  begin
    minerva_pcp = fang_cuckoo_mux_dat[fang_cuckoo_mux_sel];
  end

// XOR all of these bits together
always @(obiwan_tonks or often_tylenol or draco_salmon or pasta_shuda)
  begin
      rerun_desert = ^ {obiwan_tonks,often_tylenol,draco_salmon,pasta_shuda};
  end

// 4 bit priority MUX
always @(
        eatem_lotus or prison_star  or 
        badger_hotel or kilo_jxnbox  or 
        baron_viagra or rose_martian  or 
        furnace_kilo or curly_frog 
)

  begin
    if (eatem_lotus) goblin_bison = prison_star;
    else if (badger_hotel) goblin_bison = kilo_jxnbox;
    else if (baron_viagra) goblin_bison = rose_martian;
    else if (furnace_kilo) goblin_bison = curly_frog;
    else goblin_bison = 0;
  end

// Random 3 input look up table
always @(vcc or over_rabbi or vcc)
  begin
    casex ({vcc,over_rabbi,vcc})
      0: baron_coconut=1;
      1: baron_coconut=1;
      2: baron_coconut=1;
      3: baron_coconut=1;
      4: baron_coconut=0;
      5: baron_coconut=0;
      6: baron_coconut=0;
      7: baron_coconut=0;
      default: baron_coconut=0;
    endcase
  end

// OR all of these bits together
always @(rocks_killme or ford_comtrex or ariel_thedon or often_crack or cheese_jonas or zealot_tesla or starwars_rum or vcc or plague_tango or armand_tesla or mortar_po)
  begin
      genji_att = | {rocks_killme,ford_comtrex,ariel_thedon,often_crack,cheese_jonas,zealot_tesla,starwars_rum,vcc,plague_tango,armand_tesla,mortar_po};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homer_babette <= 0;
    else
    case ({bull_rufus,pyro_booming})
       0 : homer_babette <= homer_babette;
       1 : homer_babette <= homer_babette;
       2 : homer_babette <= lion_hotdog;
       3 : homer_babette <= homer_babette;
       default : homer_babette <= 0;
    endcase
  end

// Greater Equal Less compare
always @(vcc or curly_frog or monkey_barney or togos_monster or curly_baron or gnd or cow_alpha or arthur_ring or tortilla_red or gnd or ariel_thedon or webvan_thor or might_what or waster_jjocen or remus_bagel or dingbat_snape)
  begin
    if ({vcc,curly_frog,monkey_barney,togos_monster,curly_baron,gnd,cow_alpha,arthur_ring} > {tortilla_red,gnd,ariel_thedon,webvan_thor,might_what,waster_jjocen,remus_bagel,dingbat_snape})
       {often_foryou,icarus_cow,venus_madeye} = 3'b100;
    else if ({vcc,curly_frog,monkey_barney,togos_monster,curly_baron,gnd,cow_alpha,arthur_ring} < {tortilla_red,gnd,ariel_thedon,webvan_thor,might_what,waster_jjocen,remus_bagel,dingbat_snape})
       {often_foryou,icarus_cow,venus_madeye} = 3'b010;
    else
       {often_foryou,icarus_cow,venus_madeye} = 3'b001;
  end

// NAND all of these bits together
always @(kilo_india or vcc or gnd or duey_superman or vcc)
  begin
      nigiri_delta = ~& {kilo_india,vcc,gnd,duey_superman,vcc};
  end

// 4 bit SOP selector
always @(
        rarest_newt or bust_ocean  or 
        gnd or senorduck_pig  or 
        giraffe_hp or vcc  or 
        blue_gonzo or vcc 
)

begin
    giants_romex = 
      rarest_newt & bust_ocean |
      gnd & senorduck_pig |
      giraffe_hp & vcc |
      blue_gonzo & vcc;
end


initial begin
    {cheese_gap,maki_maryann,quail_lao,lala_athena,jacuzzi_cow,frog_umbridge,red_gilligan} = 0;
end

// Registered 7 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (vcc)
      {cheese_gap,maki_maryann,quail_lao,lala_athena,jacuzzi_cow,frog_umbridge,red_gilligan} <= 0;
    else if (genji_att)
      {cheese_gap,maki_maryann,quail_lao,lala_athena,jacuzzi_cow,frog_umbridge,red_gilligan} <=
		  {pyro_booming,ready_xray,vcc,vcc,ford_comtrex,gnd,tango_ykocens};
    else
      {cheese_gap,maki_maryann,quail_lao,lala_athena,jacuzzi_cow,frog_umbridge,red_gilligan} <=
		 {mexican_mike,vcc,bust_ocean,falafel_duey,testyour_duey,cuckoo_cuckoo,gnd} + 
		 {juliet_simasu,blanket_tonks,duey_superman,minerva_pcp,pizza_tobiko,kana_rerun,potter_zealot};
  end

// NOR all of these bits together
always @(vcc or tonic_whale or gnd or wujing_rubik)
  begin
      sgates_lupin = ~| {vcc,tonic_whale,gnd,wujing_rubik};
  end

// 5 bit SOP selector
always @(
        art_curly or dingbat_snape  or 
        barty_maryann or boing_gutter  or 
        pierre_tasty or kilo_india  or 
        think_would or spain_wonton  or 
        whacky_exodus or brian_cuanto 
)

begin
    ants_gap = 
      art_curly & dingbat_snape |
      barty_maryann & boing_gutter |
      pierre_tasty & kilo_india |
      think_would & spain_wonton |
      whacky_exodus & brian_cuanto;
end

// 8 bit SOP selector
always @(
        vcc or bull_rufus  or 
        gnd or sand_lotus  or 
        dragon_malfoy or albus_zen  or 
        elian_heidi or badger_hotel  or 
        peta_zinc or bull_rufus  or 
        rocks_killme or safeway_egg  or 
        vcc or curly_frog  or 
        vcc or kana_red 
)

begin
    roid_att = 
      vcc & bull_rufus |
      gnd & sand_lotus |
      dragon_malfoy & albus_zen |
      elian_heidi & badger_hotel |
      peta_zinc & bull_rufus |
      rocks_killme & safeway_egg |
      vcc & curly_frog |
      vcc & kana_red;
end

// XOR all of these bits together
always @(mexican_mike or yellow_victor or vcc)
  begin
      athena_onion = ^ {mexican_mike,yellow_victor,vcc};
  end


initial begin
    {ginger_supurb,star_meffert,armand_smack} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (vcc)
      {ginger_supurb,star_meffert,armand_smack} <= 0;
    else if (gnd)
      {ginger_supurb,star_meffert,armand_smack} <=
		  {roid_att,loud_romulus,vcc};
    else
      {ginger_supurb,star_meffert,armand_smack} <=
		 {flew_valve,spain_yellow,duey_superman} + 
		 {vcc,november_ebay,blue_gonzo};
  end

// XOR all of these bits together
always @(barty_maryann or spock_cain or tonks_marquis or marco_orange or bolt_kabar or gnd or gnd or england_red or whacky_exodus or gnd)
  begin
      yoku_bono = ^ {barty_maryann,spock_cain,tonks_marquis,marco_orange,bolt_kabar,gnd,gnd,england_red,whacky_exodus,gnd};
  end

// 9 bit priority MUX
always @(
        rerun_desert or weevil_whammy  or 
        england_red or vcc  or 
        turtle_kilo or gnd  or 
        plague_tango or gnd  or 
        quail_lao or elf_killer  or 
        plaster_isle or lion_hotdog  or 
        vcc or kungfu_itchy  or 
        vcc or venus_madeye  or 
        vcc or marker_potter 
)

  begin
    if (rerun_desert) palm_erasmus = weevil_whammy;
    else if (england_red) palm_erasmus = vcc;
    else if (turtle_kilo) palm_erasmus = gnd;
    else if (plague_tango) palm_erasmus = gnd;
    else if (quail_lao) palm_erasmus = elf_killer;
    else if (plaster_isle) palm_erasmus = lion_hotdog;
    else if (vcc) palm_erasmus = kungfu_itchy;
    else if (vcc) palm_erasmus = venus_madeye;
    else if (vcc) palm_erasmus = marker_potter;
    else palm_erasmus = 0;
  end

// AND all of these bits together
always @(kungfu_itchy or pyro_booming or wine_athena or joseph_hoser or gnd or gnd or vcc or blanket_tonks)
  begin
      red_issac = & {kungfu_itchy,pyro_booming,wine_athena,joseph_hoser,gnd,gnd,vcc,blanket_tonks};
  end


initial begin
    {legos_cow,valve_salami,uppers_att,lucent_animal} = 0;
end

// Registered 4 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (water_crystal)
      {legos_cow,valve_salami,uppers_att,lucent_animal} <= 0;
    else if (falafel_north)
      {legos_cow,valve_salami,uppers_att,lucent_animal} <=
		  {bfi_quebec,often_tylenol,zedong_eunice,atilla_hans};
    else
      {legos_cow,valve_salami,uppers_att,lucent_animal} <=
		 {nasdaq_shemp,turtle_kilo,albus_zen,aphid_pluto} + 
		 {vcc,quail_lao,gnd,south_aspirin};
  end


// building a 64 to 1 MUX operator
reg [63:0] illegal_vadar_mux_dat;
reg [5:0] illegal_vadar_mux_sel;
always @(weevil_whammy or gnd or quail_lao or gnd or grumpy_hotel or vcc or nigiri_donut or brian_cuanto or maki_maryann or plaster_isle or vegas_emails or baron_coconut or blanket_tonks or often_foryou or gnd or clay_shark or gnd or prison_star or sugar_newt or remus_bagel or touch_safeway or gm_school or kilo_india or trevor_beavis or vcc or plaster_isle or gnd or elf_killer or vcc or escape_rojas or lala_martian or doc_whoiswho or loud_romulus or armand_smack or vcc or madeye_badger or palm_erasmus or moulin_lizard or giraffe_hp or kungfu_elian or wicked_gonzo or vcc or giraffe_hp or hercules_opus or fire_pierre or red_issac or jacuzzi_cow or gnd or plague_tango or vcc or falafel_duey or valve_salami or art_smack or monkey_barney or cheese_gap or vcc or gnd or nigiri_delta or yoda_cubish or over_rabbi or tabby_nuclear or madeye_badger or icarus_cow or zi_chowmein)
  begin
    illegal_vadar_mux_dat = {weevil_whammy,gnd,quail_lao,gnd,grumpy_hotel,vcc,nigiri_donut,brian_cuanto,maki_maryann,plaster_isle,vegas_emails,baron_coconut,blanket_tonks,often_foryou,gnd,clay_shark,gnd,prison_star,sugar_newt,remus_bagel,touch_safeway,gm_school,kilo_india,trevor_beavis,vcc,plaster_isle,gnd,elf_killer,vcc,escape_rojas,lala_martian,doc_whoiswho,loud_romulus,armand_smack,vcc,madeye_badger,palm_erasmus,moulin_lizard,giraffe_hp,kungfu_elian,wicked_gonzo,vcc,giraffe_hp,hercules_opus,fire_pierre,red_issac,jacuzzi_cow,gnd,plague_tango,vcc,falafel_duey,valve_salami,art_smack,monkey_barney,cheese_gap,vcc,gnd,nigiri_delta,yoda_cubish,over_rabbi,tabby_nuclear,madeye_badger,icarus_cow,zi_chowmein};
  end

always @(ants_gap or gnd or gnd or lala_athena or gnd or gnd)
  begin
    illegal_vadar_mux_sel = {ants_gap,gnd,gnd,lala_athena,gnd,gnd};
  end

always @(illegal_vadar_mux_dat or illegal_vadar_mux_sel)
  begin
    flew_coffee = illegal_vadar_mux_dat[illegal_vadar_mux_sel];
  end

// OR all of these bits together
always @(sugar_donut or gnd or vcc or gnd or moulin_lizard or dweebie_elian or badger_hotel or vcc)
  begin
      zealot_elian = | {sugar_donut,gnd,vcc,gnd,moulin_lizard,dweebie_elian,badger_hotel,vcc};
  end


// building a 64 to 1 MUX operator
reg [63:0] lupin_moreand_mux_dat;
reg [5:0] lupin_moreand_mux_sel;
always @(clay_shark or gnd or howell_dopey or burning_tesla or vcc or filch_rojas or egg_hinge or loud_brian or bravo_foliage or ginger_supurb or tortilla_red or potato_bert or mine_nasdaq or gnd or vcc or muffin_joseph or fufu_vangoh or crank_star or warlock_remus or curly_baron or egg_hinge or dweebie_issac or athena_onion or yellow_victor or animal_mickey or dweebie_issac or albus_zen or filch_rojas or vcc or sleepy_gin or stick_budlite or vcc or gutter_giants or zedong_eunice or homer_babette or pcp_nyc or howell_dopey or naproxen_blue or tonic_whale or gnd or water_crystal or siamese_pyro or wine_money or homer_babette or whale_mexico or november_ebay or rerun_desert or blessyou_palm or gnd or moulin_Iwin or goblin_bison or dragon_zen or water_crystal or meth_holland or stick_budlite or advil_gin or sand_lotus or money_wiggles or nation_potato or money_wiggles or vcc or vcc or gnd or heidi_deuce)
  begin
    lupin_moreand_mux_dat = {clay_shark,gnd,howell_dopey,burning_tesla,vcc,filch_rojas,egg_hinge,loud_brian,bravo_foliage,ginger_supurb,tortilla_red,potato_bert,mine_nasdaq,gnd,vcc,muffin_joseph,fufu_vangoh,crank_star,warlock_remus,curly_baron,egg_hinge,dweebie_issac,athena_onion,yellow_victor,animal_mickey,dweebie_issac,albus_zen,filch_rojas,vcc,sleepy_gin,stick_budlite,vcc,gutter_giants,zedong_eunice,homer_babette,pcp_nyc,howell_dopey,naproxen_blue,tonic_whale,gnd,water_crystal,siamese_pyro,wine_money,homer_babette,whale_mexico,november_ebay,rerun_desert,blessyou_palm,gnd,moulin_Iwin,goblin_bison,dragon_zen,water_crystal,meth_holland,stick_budlite,advil_gin,sand_lotus,money_wiggles,nation_potato,money_wiggles,vcc,vcc,gnd,heidi_deuce};
  end

always @(black_yoku or marco_orange or west_stick or vcc or egg_hinge or jinyong_eagle)
  begin
    lupin_moreand_mux_sel = {black_yoku,marco_orange,west_stick,vcc,egg_hinge,jinyong_eagle};
  end

always @(lupin_moreand_mux_dat or lupin_moreand_mux_sel)
  begin
    bush_isle = lupin_moreand_mux_dat[lupin_moreand_mux_sel];
  end

// NOR all of these bits together
always @(vcc or kilo_india or alpha_maryann or huhhuh_smack or vcc or homer_babette or lucent_animal or potter_zealot or aphid_diagon or naproxen_blue)
  begin
      ring_meth = ~| {vcc,kilo_india,alpha_maryann,huhhuh_smack,vcc,homer_babette,lucent_animal,potter_zealot,aphid_diagon,naproxen_blue};
  end

// 5 bit priority MUX
always @(
        giants_romex or uppers_att  or 
        flew_valve or stoned_zeus  or 
        pasta_shuda or gin_zhuang  or 
        south_crank or kdqcens_ritsu  or 
        rerun_desert or vcc 
)

  begin
    if (giants_romex) ebay_boing = uppers_att;
    else if (flew_valve) ebay_boing = stoned_zeus;
    else if (pasta_shuda) ebay_boing = gin_zhuang;
    else if (south_crank) ebay_boing = kdqcens_ritsu;
    else if (rerun_desert) ebay_boing = vcc;
    else ebay_boing = 0;
  end

// XOR all of these bits together
always @(siamese_pyro or gnd or lala_athena or vcc or gnd or gnd or gnd)
  begin
      ants_Iwin = ^ {siamese_pyro,gnd,lala_athena,vcc,gnd,gnd,gnd};
  end

// 5 bit priority MUX
always @(
        curly_frog or gnd  or 
        remus_bagel or jacuzzi_cow  or 
        yellow_victor or east_boots  or 
        wicked_gonzo or vegas_emails  or 
        curly_baron or vcc 
)

  begin
    if (curly_frog) mickey_hummer = gnd;
    else if (remus_bagel) mickey_hummer = jacuzzi_cow;
    else if (yellow_victor) mickey_hummer = east_boots;
    else if (wicked_gonzo) mickey_hummer = vegas_emails;
    else if (curly_baron) mickey_hummer = vcc;
    else mickey_hummer = 0;
  end

// 4 bit priority MUX
always @(
        gnd or uppers_att  or 
        starwars_rum or vcc  or 
        ants_Iwin or vegas_emails  or 
        vcc or ebay_boing 
)

  begin
    if (gnd) ceecensor_gap = uppers_att;
    else if (starwars_rum) ceecensor_gap = vcc;
    else if (ants_Iwin) ceecensor_gap = vegas_emails;
    else if (vcc) ceecensor_gap = ebay_boing;
    else ceecensor_gap = 0;
  end

reg feedback_pt_551;

always @(lion_hotdog or feedback_pt_551)
  begin
      peace_solder =  lion_hotdog ^  feedback_pt_551;
  end

reg feedback_pt_552;

always @(vcc or feedback_pt_552)
  begin
      october_jonas =  vcc &  feedback_pt_552;
  end

reg feedback_pt_553;

always @(ants_Iwin or feedback_pt_553)
  begin
      wakey_ham =  ants_Iwin | !feedback_pt_553;
  end

reg feedback_pt_554;

always @(peace_solder or feedback_pt_554)
  begin
      centaur_black = !peace_solder ^  feedback_pt_554;
  end

reg feedback_pt_555;

always @(vcc or feedback_pt_555)
  begin
      junkie_duck = !vcc &  feedback_pt_555;
  end

reg feedback_pt_556;

always @(naproxen_blue or feedback_pt_556)
  begin
      gojira_huhhuh = !naproxen_blue ^ !feedback_pt_556;
  end

reg feedback_pt_557;

always @(crab_popcorn or feedback_pt_557)
  begin
      ebi_cheese =  crab_popcorn | !feedback_pt_557;
  end

reg feedback_pt_558;

always @(vcc or feedback_pt_558)
  begin
      marvin_hours =  vcc |  feedback_pt_558;
  end

reg feedback_pt_559;

always @(falafel_duey or feedback_pt_559)
  begin
      mao_jason = !falafel_duey & !feedback_pt_559;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nobody_east <= 0;
    else if (frog_umbridge)
      nobody_east <= 0;
    else if (klaas_oitcen)
      nobody_east <= vcc;
  end

always @(nobody_east)
  begin
      feedback_pt_551 = nobody_east;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      floo_voodoo <= 0;
    else if (marvin_hours)
      floo_voodoo <= 0;
    else if (frog_umbridge)
      floo_voodoo <= desade_vegas;
  end

always @(floo_voodoo)
  begin
      feedback_pt_552 = floo_voodoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foxtrot_gonzo <= 0;
    else if (pasta_shuda)
      foxtrot_gonzo <= vcc;
    else if (weevil_whammy)
      foxtrot_gonzo <= 0;
  end

always @(foxtrot_gonzo)
  begin
      feedback_pt_553 = foxtrot_gonzo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugs_bullet <= 0;
    else if (junkie_duck)
      drugs_bullet <= foxtrot_gonzo;
  end

always @(drugs_bullet)
  begin
      feedback_pt_554 = drugs_bullet;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rocks_batman <= 0;
    else
      rocks_batman <= gojira_huhhuh;
  end

always @(rocks_batman)
  begin
      feedback_pt_555 = rocks_batman;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_gin <= 0;
    else
      newt_gin <= vcc;
  end

always @(newt_gin)
  begin
      feedback_pt_556 = newt_gin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shrimp_priest <= 1;
    else
      shrimp_priest <= vcc;
  end

always @(shrimp_priest)
  begin
      feedback_pt_557 = shrimp_priest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_what <= 1;
    else
      animal_what <= floo_voodoo;
  end

always @(animal_what)
  begin
      feedback_pt_558 = animal_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      opus_geisha <= 0;
    else if (ring_meth)
      opus_geisha <= advil_gin;
    else if (gnd)
      opus_geisha <= 0;
  end

always @(opus_geisha)
  begin
      feedback_pt_559 = opus_geisha;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_clay <= 0;
    else
      advil_clay <= hercules_opus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      louie_fsncens <= 0;
    else if (aphid_diagon)
      louie_fsncens <= 0;
    else if (mao_jason)
      louie_fsncens <= onion_egg;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gokidsgo_zeus <= 1;
    else
      gokidsgo_zeus <= ready_lovey;
  end

wire kbtoys_danger_wire;

dffeas kbtoys_danger_ff (
  .clk(clock1),
  .d(vcc),
  .ena(lala_martian),
  .sclr(siamese_pyro),
  .sload(gokidsgo_zeus),
  .asdata(star_meffert),
  .clrn(!reset1),
  .q(kbtoys_danger_wire)
);

always @(kbtoys_danger_wire) begin
   yellow_marco = kbtoys_danger_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      troll_coffee <= 0;
    else
      troll_coffee <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      abel_dingbat <= 1;
    else
      abel_dingbat <= whammy_green;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      frog_palm <= 1;
    else
      frog_palm <= wakey_ham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rabbi_soccer <= 0;
    else if (ebi_cheese)
      rabbi_soccer <= floating_guy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_ham <= 0;
    else if (october_jonas)
      moron_ham <= gnd;
  end

wire elf_stirfry_wire;

dffeas elf_stirfry_ff (
  .clk(clock1),
  .d(vcc),
  .ena(newt_gin),
  .sclr(yellow_marco),
  .sload(mao_jason),
  .asdata(vcc),
  .clrn(!reset1),
  .q(elf_stirfry_wire)
);

always @(elf_stirfry_wire) begin
   sgates_amex = elf_stirfry_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_priest <= 0;
    else if (shark_pork)
      tobe_priest <= frog_palm;
    else if (goat_wujing)
      tobe_priest <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lucent_grumpy <= 0;
    else
      lucent_grumpy <= frog_umbridge;
  end

// Random 6 input look up table
always @(gnd or rocks_batman or drugs_bullet or frog_palm or vegas_emails or october_jonas)
  begin
    casex ({gnd,rocks_batman,drugs_bullet,frog_palm,vegas_emails,october_jonas})
      0: curie_haze=0;
      1: curie_haze=1;
      2: curie_haze=0;
      3: curie_haze=0;
      4: curie_haze=1;
      5: curie_haze=1;
      6: curie_haze=0;
      7: curie_haze=0;
      8: curie_haze=0;
      9: curie_haze=0;
      10: curie_haze=0;
      11: curie_haze=1;
      12: curie_haze=0;
      13: curie_haze=1;
      14: curie_haze=0;
      15: curie_haze=1;
      16: curie_haze=1;
      17: curie_haze=0;
      18: curie_haze=0;
      19: curie_haze=1;
      20: curie_haze=1;
      21: curie_haze=0;
      22: curie_haze=1;
      23: curie_haze=1;
      24: curie_haze=1;
      25: curie_haze=0;
      26: curie_haze=1;
      27: curie_haze=1;
      28: curie_haze=1;
      29: curie_haze=0;
      30: curie_haze=1;
      31: curie_haze=0;
      32: curie_haze=0;
      33: curie_haze=1;
      34: curie_haze=1;
      35: curie_haze=1;
      36: curie_haze=0;
      37: curie_haze=1;
      38: curie_haze=1;
      39: curie_haze=0;
      40: curie_haze=1;
      41: curie_haze=0;
      42: curie_haze=0;
      43: curie_haze=1;
      44: curie_haze=0;
      45: curie_haze=0;
      46: curie_haze=0;
      47: curie_haze=0;
      48: curie_haze=0;
      49: curie_haze=1;
      50: curie_haze=0;
      51: curie_haze=0;
      52: curie_haze=1;
      53: curie_haze=0;
      54: curie_haze=0;
      55: curie_haze=0;
      56: curie_haze=1;
      57: curie_haze=1;
      58: curie_haze=1;
      59: curie_haze=0;
      60: curie_haze=1;
      61: curie_haze=1;
      62: curie_haze=1;
      63: curie_haze=1;
      default: curie_haze=0;
    endcase
  end


initial begin
    {peta_mickey,mao_att,vadar_army,howell_nation,goblin_snape} = 0;
end

// Registered 5 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (gnd)
      {peta_mickey,mao_att,vadar_army,howell_nation,goblin_snape} <= 0;
    else if (monkey_barney)
      {peta_mickey,mao_att,vadar_army,howell_nation,goblin_snape} <=
		  {vcc,ants_Iwin,doc_whoiswho,fufu_bono,ariel_thedon};
    else
      {peta_mickey,mao_att,vadar_army,howell_nation,goblin_snape} <=
		 {gnd,vcc,gnd,vcc,flew_coffee} + 
		 {vcc,october_jonas,hp_safada,vcc,century_delta};
  end

// XNOR all of these bits together
always @(fufu_bono or red_gilligan or bracket_barty or aphid_diagon or uppers_bull or curly_baron or goblin_bison or mao_jason or vcc or mickey_hummer or warlock_remus)
  begin
      tracy_numbers = ~^ {fufu_bono,red_gilligan,bracket_barty,aphid_diagon,uppers_bull,curly_baron,goblin_bison,mao_jason,vcc,mickey_hummer,warlock_remus};
  end

// Greater Equal Less compare
always @(baron_viagra or ceecensor_gap or gnd or gokidsgo_zeus)
  begin
    if ({baron_viagra,ceecensor_gap} > {gnd,gokidsgo_zeus})
       {madeye_maki,ceres_crab,noah_yellow} = 3'b100;
    else if ({baron_viagra,ceecensor_gap} < {gnd,gokidsgo_zeus})
       {madeye_maki,ceres_crab,noah_yellow} = 3'b010;
    else
       {madeye_maki,ceres_crab,noah_yellow} = 3'b001;
  end

reg feedback_pt_560;

always @(wakey_zebra or feedback_pt_560)
  begin
      gopher_cheez =  wakey_zebra & !feedback_pt_560;
  end

reg feedback_pt_561;

always @(animal_what or feedback_pt_561)
  begin
      wrecker_lsd = !animal_what &  feedback_pt_561;
  end

reg feedback_pt_562;

always @(lucent_grumpy or feedback_pt_562)
  begin
      huhhuh_wujing =  lucent_grumpy ^  feedback_pt_562;
  end

reg feedback_pt_563;

always @(jacuzzi_cow or feedback_pt_563)
  begin
      stix_comrade =  jacuzzi_cow ^ !feedback_pt_563;
  end

wire might_popacap_wire;

dffea might_popacap_ff (
  .clk(clock1),
  .d(vcc),
  .ena(dig_fsncens),
  .adata(rabbi_soccer),
  .clrn(!reset1),
  .q(might_popacap_wire)
);

always @(might_popacap_wire) begin
   juliet_west = might_popacap_wire;
end

always @(juliet_west)
  begin
      feedback_pt_560 = juliet_west;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peaves_pilot <= 1;
    else
      peaves_pilot <= vcc;
  end

always @(peaves_pilot)
  begin
      feedback_pt_561 = peaves_pilot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_beast <= 0;
    else if (nigiri_delta)
      west_beast <= maki_maryann;
    else if (gnd)
      west_beast <= 0;
  end

always @(west_beast)
  begin
      feedback_pt_562 = west_beast;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tesla_think <= 1;
    else
      tesla_think <= stix_comrade;
  end

always @(tesla_think)
  begin
      feedback_pt_563 = tesla_think;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elf_stroop <= 1;
    else
      elf_stroop <= tobe_priest;
  end

wire whammy_supurb_wire;

dffea whammy_supurb_ff (
  .clk(clock1),
  .d(lucent_grumpy),
  .ena(vcc),
  .adata(warlock_remus),
  .clrn(!reset1),
  .q(whammy_supurb_wire)
);

always @(whammy_supurb_wire) begin
   partners_ring = whammy_supurb_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      avon_todd <= 0;
    else if (whammy_green)
      avon_todd <= 0;
    else if (sgates_lupin)
      avon_todd <= kdqcens_ritsu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xterm_ginger <= 0;
    else
      xterm_ginger <= goat_wujing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      broom_meth <= 0;
    else
      broom_meth <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      enoch_pork <= 0;
    else
      enoch_pork <= bust_ocean;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      smack_mozart <= 0;
    else if (juliet_west)
      smack_mozart <= drugs_bullet;
    else if (vcc)
      smack_mozart <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuckoo_quail <= 0;
    else if (goat_wujing)
      cuckoo_quail <= 0;
    else if (vcc)
      cuckoo_quail <= gnd;
  end

wire zen_potato_wire;

dffeas zen_potato_ff (
  .clk(clock1),
  .d(vcc),
  .ena(frog_palm),
  .sclr(dadada_rubik),
  .sload(vcc),
  .asdata(elf_stroop),
  .clrn(!reset1),
  .q(zen_potato_wire)
);

always @(zen_potato_wire) begin
   romeo_tin = zen_potato_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_sortout <= 0;
    else if (extremist_due)
      pixie_sortout <= 0;
    else if (gnd)
      pixie_sortout <= baron_viagra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      holland_romeo <= 0;
    else if (moulin_lizard)
      holland_romeo <= shark_pork;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ocean_green <= 1;
    else
      ocean_green <= tobe_priest;
  end

wire nail_scotch_wire;

dffeas nail_scotch_ff (
  .clk(clock1),
  .d(mao_att),
  .ena(madeye_maki),
  .sclr(gnd),
  .sload(bush_isle),
  .asdata(vcc),
  .clrn(!reset1),
  .q(nail_scotch_wire)
);

always @(nail_scotch_wire) begin
   ford_flew = nail_scotch_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oitcen_rodent <= 0;
    else if (pixie_sortout)
      oitcen_rodent <= 0;
    else if (plague_tango)
      oitcen_rodent <= maki_maryann;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      metal_drugie <= 0;
    else if (huhhuh_wujing)
      metal_drugie <= 0;
    else if (east_boots)
      metal_drugie <= shrimp_priest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grams_valve <= 0;
    else if (vcc)
      grams_valve <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_rasp <= 1;
    else
      oldnavy_rasp <= ocean_green;
  end

// Internal TRI bus MUX built out of tri buffers;
// Z and conflict not possible
  tri dutch_ariel_tri;
  wire [5:0] dutch_ariel_dat = {yellow_marco,floo_voodoo,peta_mickey,vcc,gnd};
  wire [5:0] dutch_ariel_sel = {vcc,broom_meth,goblin_snape,gnd,think_would};
  wire [5:0] dutch_ariel_ohsel;
  wire dutch_ariel_def;

  assign dutch_ariel_ohsel[0] = dutch_ariel_sel[0];
  assign dutch_ariel_ohsel[1] = dutch_ariel_sel[1] & !dutch_ariel_ohsel[0];
  assign dutch_ariel_ohsel[2] = dutch_ariel_sel[2] & !dutch_ariel_ohsel[1] & !dutch_ariel_ohsel[0];
  assign dutch_ariel_ohsel[3] = dutch_ariel_sel[3] & !dutch_ariel_ohsel[2] & !dutch_ariel_ohsel[1] & !dutch_ariel_ohsel[0];
  assign dutch_ariel_ohsel[4] = dutch_ariel_sel[4] & !dutch_ariel_ohsel[3] & !dutch_ariel_ohsel[2] & !dutch_ariel_ohsel[1] & !dutch_ariel_ohsel[0];

  assign dutch_ariel_def = 
     !dutch_ariel_ohsel[0] & !dutch_ariel_ohsel[1] & !dutch_ariel_ohsel[2] & !dutch_ariel_ohsel[3] & !dutch_ariel_ohsel[4];

  // onehot tristate MUX
  bufif0 (dutch_ariel_tri,!dutch_ariel_dat[0],!dutch_ariel_ohsel[0]);
  bufif1 (dutch_ariel_tri, dutch_ariel_dat[1], dutch_ariel_ohsel[1]);
  bufif1 (dutch_ariel_tri, dutch_ariel_dat[2], dutch_ariel_ohsel[2]);
  bufif1 (dutch_ariel_tri,!dutch_ariel_dat[3], dutch_ariel_ohsel[3]);
  bufif1 (dutch_ariel_tri,!dutch_ariel_dat[4], dutch_ariel_ohsel[4]);

  // default value for none-hot
  bufif1 (dutch_ariel_tri,vcc,dutch_ariel_def);
  always @(dutch_ariel_tri) begin
    dutch_ariel = dutch_ariel_tri;
  end

reg feedback_pt_564;

always @(dig_fsncens or feedback_pt_564)
  begin
      tobiko_tabby =  dig_fsncens &  feedback_pt_564;
  end

reg feedback_pt_565;

always @(sgates_lupin or feedback_pt_565)
  begin
      life_wine =  sgates_lupin &  feedback_pt_565;
  end

reg feedback_pt_566;

always @(money_wiggles or feedback_pt_566)
  begin
      stroop_vadar = !money_wiggles ^ !feedback_pt_566;
  end

reg feedback_pt_567;

always @(gnd or feedback_pt_567)
  begin
      brian_deuce = !gnd |  feedback_pt_567;
  end

reg feedback_pt_568;

always @(stroop_vadar or feedback_pt_568)
  begin
      hinge_kmfdm = !stroop_vadar & !feedback_pt_568;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huhhuh_quebec <= 0;
    else if (tobiko_tabby)
      huhhuh_quebec <= 0;
    else if (dutch_ariel)
      huhhuh_quebec <= west_beast;
  end

always @(huhhuh_quebec)
  begin
      feedback_pt_564 = huhhuh_quebec;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonton_psycho <= 0;
    else
      wonton_psycho <= oldnavy_rasp;
  end

always @(wonton_psycho)
  begin
      feedback_pt_565 = wonton_psycho;
  end

wire helena_goat_wire;

dffeas helena_goat_ff (
  .clk(clock1),
  .d(vcc),
  .ena(extremist_due),
  .sclr(jacuzzi_cow),
  .sload(dig_bambi),
  .asdata(opus_geisha),
  .clrn(!reset1),
  .q(helena_goat_wire)
);

always @(helena_goat_wire) begin
   wiggum_avon = helena_goat_wire;
end

always @(wiggum_avon)
  begin
      feedback_pt_566 = wiggum_avon;
  end

wire surfer_knot_wire;

dffeas surfer_knot_ff (
  .clk(clock1),
  .d(ceecensor_gap),
  .ena(wine_athena),
  .sclr(gnd),
  .sload(vcc),
  .asdata(vcc),
  .clrn(!reset1),
  .q(surfer_knot_wire)
);

always @(surfer_knot_wire) begin
   kana_dorkus = surfer_knot_wire;
end

always @(kana_dorkus)
  begin
      feedback_pt_567 = kana_dorkus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speed_vegan <= 0;
    else if (gnd)
      speed_vegan <= dig_fsncens;
    else if (juliet_west)
      speed_vegan <= 0;
  end

always @(speed_vegan)
  begin
      feedback_pt_568 = speed_vegan;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eatem_spanish <= 0;
    else
      eatem_spanish <= grams_valve;
  end

wire candle_army_wire;

dffeas candle_army_ff (
  .clk(clock1),
  .d(legos_cow),
  .ena(ocean_green),
  .sclr(speed_vegan),
  .sload(partners_ring),
  .asdata(wiggum_avon),
  .clrn(!reset1),
  .q(candle_army_wire)
);

always @(candle_army_wire) begin
   wakey_tesla = candle_army_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lxtcen_wonton <= 0;
    else if (gnd)
      lxtcen_wonton <= oitcen_rodent;
    else if (huhhuh_quebec)
      lxtcen_wonton <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_bonker <= 0;
    else if (frog_palm)
      sogood_bonker <= abel_dingbat;
    else if (lala_athena)
      sogood_bonker <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speedyg_abel <= 0;
    else if (partners_ring)
      speedyg_abel <= xterm_ginger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popacap_bull <= 1;
    else
      popacap_bull <= sgates_amex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knockout_dow <= 1;
    else
      knockout_dow <= cuckoo_quail;
  end

wire wine_ham_wire;

dffeas wine_ham_ff (
  .clk(clock1),
  .d(vcc),
  .ena(vcc),
  .sclr(stroop_vadar),
  .sload(wonton_psycho),
  .asdata(tracy_numbers),
  .clrn(!reset1),
  .q(wine_ham_wire)
);

always @(wine_ham_wire) begin
   wood_dragon = wine_ham_wire;
end

wire wiggum_wanton_wire;

dffeas wiggum_wanton_ff (
  .clk(clock1),
  .d(goat_ulysses),
  .ena(vcc),
  .sclr(vcc),
  .sload(south_crank),
  .asdata(metal_drugie),
  .clrn(!reset1),
  .q(wiggum_wanton_wire)
);

always @(wiggum_wanton_wire) begin
   kabar_floo = wiggum_wanton_wire;
end

wire whack_mouse_wire;

dffeas whack_mouse_ff (
  .clk(clock1),
  .d(holland_romeo),
  .ena(lxtcen_wonton),
  .sclr(yoku_bono),
  .sload(crab_popcorn),
  .asdata(howell_nation),
  .clrn(!reset1),
  .q(whack_mouse_wire)
);

always @(whack_mouse_wire) begin
   drevil_air = whack_mouse_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boots_ramone <= 1;
    else
      boots_ramone <= vcc;
  end

reg feedback_pt_569;

always @(vcc or feedback_pt_569)
  begin
      safeway_tonic = !vcc ^ !feedback_pt_569;
  end

reg feedback_pt_570;

always @(ford_flew or feedback_pt_570)
  begin
      pork_george = !ford_flew | !feedback_pt_570;
  end

reg feedback_pt_571;

always @(curie_haze or feedback_pt_571)
  begin
      isle_husks =  curie_haze ^ !feedback_pt_571;
  end

always @(sand_lotus)
  begin
      deng_gregg_a = !sand_lotus;
  end

always @(thankee_homer)
  begin
      moses_bull = !thankee_homer;
  end

always @(sogood_bonker)
  begin
      zen_hp = !sogood_bonker;
  end

always @(vcc)
  begin
      pirate_sheep = !vcc;
  end

always @(noah_yellow)
  begin
      pcp_bfs = !noah_yellow;
  end

always @(moses_bull)
  begin
      yummy_wine = !moses_bull;
  end

always @(nobody_east)
  begin
      minnie_moses = !nobody_east;
  end

always @(gnd)
  begin
      juliet_hummer = !gnd;
  end

always @(curie_haze)
  begin
      winner_howell = !curie_haze;
  end

always @(vcc)
  begin
      huey_golfland = !vcc;
  end

always @(bush_isle)
  begin
      emu_cornell = !bush_isle;
  end

always @(vcc)
  begin
      ready_star = !vcc;
  end

always @(star_meffert)
  begin
      yoku_weasley = !star_meffert;
  end

always @(sogood_bonker)
  begin
      icarus_sun = !sogood_bonker;
  end

always @(partners_ring)
  begin
      eel_cuanto = !partners_ring;
  end

always @(rocks_batman)
  begin
      sun_cassowary = !rocks_batman;
  end

always @(ready_star)
  begin
      solder_kbtoys = !ready_star;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      devotion_red <= 0;
    else if (advil_clay)
      devotion_red <= legos_cow;
  end

always @(devotion_red)
  begin
      feedback_pt_569 = devotion_red;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lxtcen_copper <= 0;
    else
      lxtcen_copper <= romex_pyro;
  end

always @(lxtcen_copper)
  begin
      feedback_pt_570 = lxtcen_copper;
  end

wire shuda_togos_wire;

dffea shuda_togos_ff (
  .clk(clock1),
  .d(brian_deuce),
  .ena(safeway_tonic),
  .adata(eatem_spanish),
  .clrn(!reset1),
  .q(shuda_togos_wire)
);

always @(shuda_togos_wire) begin
   arcade_sogood = shuda_togos_wire;
end

always @(arcade_sogood)
  begin
      feedback_pt_571 = arcade_sogood;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      giants_beavis <= 1;
    else
      giants_beavis <= trevor_beavis;
  end

wire ibm_banality_wire;

dffeas ibm_banality_ff (
  .clk(clock1),
  .d(vcc),
  .ena(sun_cassowary),
  .sclr(yellow_victor),
  .sload(safeway_tonic),
  .asdata(rarest_tabby),
  .clrn(!reset1),
  .q(ibm_banality_wire)
);

always @(ibm_banality_wire) begin
   china_subway = ibm_banality_wire;
end

wire willem_indigo_wire;

dffeas willem_indigo_ff (
  .clk(clock1),
  .d(louie_fsncens),
  .ena(curie_haze),
  .sclr(minnie_moses),
  .sload(kabar_floo),
  .asdata(jacuzzi_cow),
  .clrn(!reset1),
  .q(willem_indigo_wire)
);

always @(willem_indigo_wire) begin
   sleepy_boots = willem_indigo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ulysses_legos <= 0;
    else if (thankee_homer)
      ulysses_legos <= tesla_think;
    else if (dig_fsncens)
      ulysses_legos <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuanto_float <= 0;
    else
      cuanto_float <= knockout_dow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      guy_rhvcens <= 1;
    else
      guy_rhvcens <= grams_valve;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chips_deng <= 0;
    else
      chips_deng <= drevil_air;
  end

wire speeding_fuji_wire;

dffeas speeding_fuji_ff (
  .clk(clock1),
  .d(vcc),
  .ena(vcc),
  .sclr(vcc),
  .sload(thankee_homer),
  .asdata(gnd),
  .clrn(!reset1),
  .q(speeding_fuji_wire)
);

always @(speeding_fuji_wire) begin
   att_buddha = speeding_fuji_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tracy_lamer <= 0;
    else if (cuanto_float)
      tracy_lamer <= moron_ham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_foryou <= 1;
    else
      knot_foryou <= peace_solder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_salami <= 0;
    else if (fufu_bono)
      pizza_salami <= advil_clay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jiminy_ariel <= 0;
    else if (wrecker_lsd)
      jiminy_ariel <= water_crystal;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      odin_midas <= 0;
    else if (zen_hp)
      odin_midas <= bust_ocean;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegan_guy <= 0;
    else if (noah_yellow)
      vegan_guy <= wood_dragon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      noah_zedong <= 0;
    else if (yellow_marco)
      noah_zedong <= 0;
    else if (vcc)
      noah_zedong <= vcc;
  end

  always@(*)
  begin
    ohno_sixyears = ~( ( ~( ~( ~wakey_tesla ) | ~( yoku_weasley ) ^ ( ~( jiminy_ariel | zen_hp ) ) ^ ~( ~( ~att_buddha ) ) & ~( ~( holland_romeo ) ) ) ) ) ? ( ~( moe_burning | ~( vcc ) ) ) : ( ~( ~icarus_sun ) & ( ~( ~( ( ~( vcc ) | ~smack_mozart ^ ~stroop_vadar ) ) | ( ~( ~speedyg_abel & juliet_hummer ) ) ^ ~goat_wujing & ~( ~gnd | gnd ) ) ) );
  end
// In range compare
always @(legos_cow or huey_golfland or pork_george or lxtcen_copper)
  begin
    if ({legos_cow,huey_golfland,pork_george,lxtcen_copper} > 166 &&
        {legos_cow,huey_golfland,pork_george,lxtcen_copper} < 238)
      intel_stoned = 1;
    else
      intel_stoned = 0;
  end

// XNOR all of these bits together
always @(vadar_army or vcc or eel_cuanto or life_wine or wiggum_avon)
  begin
      bolt_dragon = ~^ {vadar_army,vcc,eel_cuanto,life_wine,wiggum_avon};
  end

// NOR all of these bits together
always @(arcade_sogood or moron_ham or bolt_dragon)
  begin
      rod_mcnugget = ~| {arcade_sogood,moron_ham,bolt_dragon};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      viagra_red <= 0;
    else
    case ({vcc,china_subway})
       0 : viagra_red <= viagra_red;
       1 : viagra_red <= viagra_red;
       2 : viagra_red <= viagra_red;
       3 : viagra_red <= viagra_red;
       default : viagra_red <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_cannon <= 0;
    else
    case ({gnd,wonton_psycho})
       0 : deng_cannon <= deng_cannon;
       1 : deng_cannon <= goat_wujing;
       2 : deng_cannon <= deng_cannon;
       3 : deng_cannon <= deng_cannon;
       default : deng_cannon <= 0;
    endcase
  end

reg feedback_pt_572;

always @(pizza_salami or feedback_pt_572)
  begin
      nigiri_wonder = !pizza_salami |  feedback_pt_572;
  end

reg feedback_pt_573;

always @(gnd or feedback_pt_573)
  begin
      doobie_Iwin = !gnd ^  feedback_pt_573;
  end

reg feedback_pt_574;

always @(moron_ham or feedback_pt_574)
  begin
      tasty_meffert = !moron_ham & !feedback_pt_574;
  end

reg feedback_pt_575;

always @(doobie_Iwin or feedback_pt_575)
  begin
      tango_whiskey = !doobie_Iwin |  feedback_pt_575;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotdog_egg <= 0;
    else if (oitcen_rodent)
      hotdog_egg <= 0;
    else if (ceres_crab)
      hotdog_egg <= smack_mozart;
  end

always @(hotdog_egg)
  begin
      feedback_pt_572 = hotdog_egg;
  end

wire english_kilo_wire;

dffea english_kilo_ff (
  .clk(clock1),
  .d(vcc),
  .ena(intel_stoned),
  .adata(lxtcen_wonton),
  .clrn(!reset1),
  .q(english_kilo_wire)
);

always @(english_kilo_wire) begin
   candle_pig = english_kilo_wire;
end

always @(candle_pig)
  begin
      feedback_pt_573 = candle_pig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honey_beavis <= 0;
    else if (vcc)
      honey_beavis <= nigiri_wonder;
  end

always @(honey_beavis)
  begin
      feedback_pt_574 = honey_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lsd_tobiko <= 1;
    else
      lsd_tobiko <= intel_stoned;
  end

always @(lsd_tobiko)
  begin
      feedback_pt_575 = lsd_tobiko;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      solder_obiwan <= 0;
    else
      solder_obiwan <= gnd;
  end

wire kaisha_jonas_wire;

dffeas kaisha_jonas_ff (
  .clk(clock1),
  .d(abel_dingbat),
  .ena(gnd),
  .sclr(vcc),
  .sload(century_delta),
  .asdata(pcp_bfs),
  .clrn(!reset1),
  .q(kaisha_jonas_wire)
);

always @(kaisha_jonas_wire) begin
   life_lima = kaisha_jonas_wire;
end

wire cain_parrot_wire;

dffea cain_parrot_ff (
  .clk(clock1),
  .d(marco_orange),
  .ena(south_crank),
  .adata(vcc),
  .clrn(!reset1),
  .q(cain_parrot_wire)
);

always @(cain_parrot_wire) begin
   doc_senorduck = cain_parrot_wire;
end

wire dr_zaius_bep_wire;

dffeas dr_zaius_bep_ff (
  .clk(clock1),
  .d(goat_ulysses),
  .ena(vegan_guy),
  .sclr(devotion_red),
  .sload(boots_ramone),
  .asdata(noah_zedong),
  .clrn(!reset1),
  .q(dr_zaius_bep_wire)
);

always @(dr_zaius_bep_wire) begin
   supurb_barnum = dr_zaius_bep_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bolt_ibm <= 0;
    else if (vcc)
      bolt_ibm <= sogood_bonker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shrimp_peta <= 1;
    else
      shrimp_peta <= ceres_crab;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_icarus <= 0;
    else if (gnd)
      pirate_icarus <= lxtcen_wonton;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_ham <= 0;
    else
      south_ham <= vcc;
  end

wire shrimp_cubish_wire;

dffea shrimp_cubish_ff (
  .clk(clock1),
  .d(frog_palm),
  .ena(grams_valve),
  .adata(knockout_dow),
  .clrn(!reset1),
  .q(shrimp_cubish_wire)
);

always @(shrimp_cubish_wire) begin
   goat_ham = shrimp_cubish_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      norbert_eel <= 0;
    else if (pirate_icarus)
      norbert_eel <= life_wine;
  end

wire frog_stroop_wire;

dffeas frog_stroop_ff (
  .clk(clock1),
  .d(gnd),
  .ena(speedyg_abel),
  .sclr(legos_cow),
  .sload(viagra_red),
  .asdata(wood_dragon),
  .clrn(!reset1),
  .q(frog_stroop_wire)
);

always @(frog_stroop_wire) begin
   south_noah = frog_stroop_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rewire_frog <= 0;
    else if (vcc)
      rewire_frog <= 0;
    else if (viagra_red)
      rewire_frog <= gnd;
  end

wire crack_foxtrot_wire;

dffea crack_foxtrot_ff (
  .clk(clock1),
  .d(hercules_opus),
  .ena(smack_mozart),
  .adata(lala_athena),
  .clrn(!reset1),
  .q(crack_foxtrot_wire)
);

always @(crack_foxtrot_wire) begin
   cheez_voodoo = crack_foxtrot_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xterm_simasu <= 0;
    else if (vegan_guy)
      xterm_simasu <= cheez_voodoo;
    else if (moe_burning)
      xterm_simasu <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beast_kdqcens <= 0;
    else if (life_lima)
      beast_kdqcens <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonton_edible <= 0;
    else
      wonton_edible <= bolt_ibm;
  end

wire master_giants_wire;

dffeas master_giants_ff (
  .clk(clock1),
  .d(moe_burning),
  .ena(emu_cornell),
  .sclr(intel_stoned),
  .sload(norbert_eel),
  .asdata(south_noah),
  .clrn(!reset1),
  .q(master_giants_wire)
);

always @(master_giants_wire) begin
   bart_joey = master_giants_wire;
end

// State Mek amadeus_romeo Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      amadeus_romeo <= amadeus_romeo_0;
    else
      case (amadeus_romeo)
        amadeus_romeo_0: begin
          if ({juliet_west,south_ham,life_wine,south_noah} == 10)
            amadeus_romeo <= amadeus_romeo_2;
          else
            amadeus_romeo <= amadeus_romeo_0;
          end
        amadeus_romeo_1: begin
            amadeus_romeo <= amadeus_romeo_1;
          end
        amadeus_romeo_2: begin
          if ({juliet_west,south_ham,life_wine,south_noah} == 4)
            amadeus_romeo <= amadeus_romeo_4;
          else
            amadeus_romeo <= amadeus_romeo_2;
          end
        amadeus_romeo_3: begin
          if ({juliet_west,south_ham,life_wine,south_noah} == 4)
            amadeus_romeo <= amadeus_romeo_4;
          else
            amadeus_romeo <= amadeus_romeo_3;
          end
        amadeus_romeo_4: begin
          if ({juliet_west,south_ham,life_wine,south_noah} == 12)
            amadeus_romeo <= amadeus_romeo_0;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 0)
            amadeus_romeo <= amadeus_romeo_5;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 13)
            amadeus_romeo <= amadeus_romeo_1;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 10)
            amadeus_romeo <= amadeus_romeo_3;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 5)
            amadeus_romeo <= amadeus_romeo_0;
          else
            amadeus_romeo <= amadeus_romeo_4;
          end
        amadeus_romeo_5: begin
          if ({juliet_west,south_ham,life_wine,south_noah} == 12)
            amadeus_romeo <= amadeus_romeo_2;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 2)
            amadeus_romeo <= amadeus_romeo_6;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 4)
            amadeus_romeo <= amadeus_romeo_4;
          else
            amadeus_romeo <= amadeus_romeo_5;
          end
        amadeus_romeo_6: begin
          if ({juliet_west,south_ham,life_wine,south_noah} == 8)
            amadeus_romeo <= amadeus_romeo_4;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 5)
            amadeus_romeo <= amadeus_romeo_6;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 13)
            amadeus_romeo <= amadeus_romeo_4;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 1)
            amadeus_romeo <= amadeus_romeo_6;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 0)
            amadeus_romeo <= amadeus_romeo_5;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 12)
            amadeus_romeo <= amadeus_romeo_4;
          else if ({juliet_west,south_ham,life_wine,south_noah} == 9)
            amadeus_romeo <= amadeus_romeo_3;
          else
            amadeus_romeo <= amadeus_romeo_6;
          end
        default: amadeus_romeo <= amadeus_romeo_0;
      endcase
  end

// State Mek amadeus_romeo Output logic
always @(amadeus_romeo)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (amadeus_romeo[3:1])
        amadeus_romeo_0: begin
            guy_powder = 0;
            danger_zinc = 0;
            peta_cryptic = 0;
            mouse_tobe = 0;
            jacob_bolt = 1;
            tracy_aphid = 0;
            jason_numbers = 0;
            vampire_gyro = 0;
            toysrus_roe = 0;
            chiptrip_pig = 0;
            bert_life = 1;
            dragon_deng = 0;
            tesla_whale = 1;
          end
        amadeus_romeo_1: begin
            guy_powder = 0;
            danger_zinc = 1;
            peta_cryptic = 0;
            mouse_tobe = 0;
            jacob_bolt = 0;
            tracy_aphid = 0;
            jason_numbers = 0;
            vampire_gyro = 1;
            toysrus_roe = 0;
            chiptrip_pig = 1;
            bert_life = 0;
            dragon_deng = 1;
            tesla_whale = 1;
          end
        amadeus_romeo_2: begin
            guy_powder = 0;
            danger_zinc = 1;
            peta_cryptic = 0;
            mouse_tobe = 0;
            jacob_bolt = 0;
            tracy_aphid = 1;
            jason_numbers = 0;
            vampire_gyro = 1;
            toysrus_roe = 1;
            chiptrip_pig = 1;
            bert_life = 0;
            dragon_deng = 1;
            tesla_whale = 0;
          end
        default: begin
            guy_powder = 1;
            danger_zinc = 0;
            peta_cryptic = 0;
            mouse_tobe = 0;
            jacob_bolt = 0;
            tracy_aphid = 1;
            jason_numbers = 1;
            vampire_gyro = 1;
            toysrus_roe = 1;
            chiptrip_pig = 1;
            bert_life = 0;
            dragon_deng = 0;
            tesla_whale = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire mouse_tiger_out;
nut_000_lut #(6) nut_000_lut_inst_mouse_tiger (
  .din({vcc,frog_palm,vcc,knot_foryou,gnd,lsd_tobiko}),
  .mask(64'b0000100000100100001010010010000011100000110000100000000010000001),
  .out(mouse_tiger_out)
);

always @(mouse_tiger_out)
begin
   waffle_hummer = mouse_tiger_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire solder_tank_out;
nut_000_lut #(3) nut_000_lut_inst_solder_tank (
  .din({ceres_crab,ceres_crab,baron_viagra}),
  .mask(8'hcd),
  .out(solder_tank_out)
);

always @(solder_tank_out)
begin
   sneezy_stoned = solder_tank_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire stix_nigiri_out;
nut_000_lut #(6) nut_000_lut_inst_stix_nigiri (
  .din({tracy_lamer,guy_powder,gnd,viagra_red,romex_pyro,zealot_elian}),
  .mask(64'h90fb28cc9494da5d),
  .out(stix_nigiri_out)
);

always @(stix_nigiri_out)
begin
   ozzy_southern = stix_nigiri_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire fuji_condit_out;
nut_000_lut #(2) nut_000_lut_inst_fuji_condit (
  .din({honey_beavis,vcc}),
  .mask(4'he),
  .out(fuji_condit_out)
);

always @(fuji_condit_out)
begin
   dipsy_ginger = fuji_condit_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire atilla_cuanto_out;
nut_000_lut #(4) nut_000_lut_inst_atilla_cuanto (
  .din({lala_athena,mouse_tobe,troll_coffee,life_lima}),
  .mask(16'b1000000000000011),
  .out(atilla_cuanto_out)
);

always @(atilla_cuanto_out)
begin
   quail_lumber = atilla_cuanto_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire advil_nobody_out;
nut_000_lut #(1) nut_000_lut_inst_advil_nobody (
  .din({gnd}),
  .mask(2'b11),
  .out(advil_nobody_out)
);

always @(advil_nobody_out)
begin
   spock_tango = advil_nobody_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire pegasus_meth_out;
nut_000_lut #(4) nut_000_lut_inst_pegasus_meth (
  .din({legos_cow,bert_life,gnd,gopher_cheez}),
  .mask(16'b0001000001101001),
  .out(pegasus_meth_out)
);

always @(pegasus_meth_out)
begin
   tiger_dorkus = pegasus_meth_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire turnip_hinge_out;
nut_000_lut #(2) nut_000_lut_inst_turnip_hinge (
  .din({peace_solder,sleepy_boots}),
  .mask(4'h7),
  .out(turnip_hinge_out)
);

always @(turnip_hinge_out)
begin
   coffee_fang = turnip_hinge_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire cryptic_chief_out;
nut_000_lut #(5) nut_000_lut_inst_cryptic_chief (
  .din({moe_burning,gnd,goat_ham,howell_nation,candle_pig}),
  .mask(32'b00000000000100000000100001001000),
  .out(cryptic_chief_out)
);

always @(cryptic_chief_out)
begin
   ihilani_army = cryptic_chief_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire emu_pixie_out;
nut_000_lut #(6) nut_000_lut_inst_emu_pixie (
  .din({rod_mcnugget,vcc,chiptrip_pig,coffee_fang,waffle_hummer,yummy_wine}),
  .mask(64'b1000000011000000000100010000101010000110000010001100100000011010),
  .out(emu_pixie_out)
);

always @(emu_pixie_out)
begin
   salami_ibm = emu_pixie_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire blueled_army_out;
nut_000_lut #(1) nut_000_lut_inst_blueled_army (
  .din({lala_athena}),
  .mask(2'b00),
  .out(blueled_army_out)
);

always @(blueled_army_out)
begin
   psycho_fang = blueled_army_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire north_roe_out;
nut_000_lut #(3) nut_000_lut_inst_north_roe (
  .din({vcc,ozzy_southern,deng_cannon}),
  .mask(8'h7b),
  .out(north_roe_out)
);

always @(north_roe_out)
begin
   otter_mexican = north_roe_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire waffle_meth_out;
nut_000_lut #(5) nut_000_lut_inst_waffle_meth (
  .din({peta_cryptic,odin_midas,kabar_floo,salami_ibm,yoku_weasley}),
  .mask(32'h0f1838e0),
  .out(waffle_meth_out)
);

always @(waffle_meth_out)
begin
   uniform_would = waffle_meth_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire wakey_neon_out;
nut_000_lut #(5) nut_000_lut_inst_wakey_neon (
  .din({tracy_lamer,tasty_meffert,rocks_batman,chiptrip_pig,pirate_sheep}),
  .mask(32'h1450cbe2),
  .out(wakey_neon_out)
);

always @(wakey_neon_out)
begin
   genesis_black = wakey_neon_out;
end

// State Mek popcorn_tuna Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popcorn_tuna <= popcorn_tuna_0;
    else
      case (popcorn_tuna)
        popcorn_tuna_0: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 0)
            popcorn_tuna <= popcorn_tuna_8;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 11)
            popcorn_tuna <= popcorn_tuna_4;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 7)
            popcorn_tuna <= popcorn_tuna_3;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 15)
            popcorn_tuna <= popcorn_tuna_3;
          else
            popcorn_tuna <= popcorn_tuna_0;
          end
        popcorn_tuna_1: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 13)
            popcorn_tuna <= popcorn_tuna_3;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 1)
            popcorn_tuna <= popcorn_tuna_4;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 3)
            popcorn_tuna <= popcorn_tuna_7;
          else
            popcorn_tuna <= popcorn_tuna_1;
          end
        popcorn_tuna_2: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 15)
            popcorn_tuna <= popcorn_tuna_1;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 13)
            popcorn_tuna <= popcorn_tuna_6;
          else
            popcorn_tuna <= popcorn_tuna_2;
          end
        popcorn_tuna_3: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 13)
            popcorn_tuna <= popcorn_tuna_6;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 8)
            popcorn_tuna <= popcorn_tuna_1;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 9)
            popcorn_tuna <= popcorn_tuna_2;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 6)
            popcorn_tuna <= popcorn_tuna_3;
          else
            popcorn_tuna <= popcorn_tuna_3;
          end
        popcorn_tuna_4: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 2)
            popcorn_tuna <= popcorn_tuna_1;
          else
            popcorn_tuna <= popcorn_tuna_4;
          end
        popcorn_tuna_5: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 9)
            popcorn_tuna <= popcorn_tuna_6;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 3)
            popcorn_tuna <= popcorn_tuna_7;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 5)
            popcorn_tuna <= popcorn_tuna_0;
          else
            popcorn_tuna <= popcorn_tuna_5;
          end
        popcorn_tuna_6: begin
            popcorn_tuna <= popcorn_tuna_6;
          end
        popcorn_tuna_7: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 3)
            popcorn_tuna <= popcorn_tuna_4;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 6)
            popcorn_tuna <= popcorn_tuna_0;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 0)
            popcorn_tuna <= popcorn_tuna_6;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 11)
            popcorn_tuna <= popcorn_tuna_5;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 7)
            popcorn_tuna <= popcorn_tuna_1;
          else if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 15)
            popcorn_tuna <= popcorn_tuna_4;
          else
            popcorn_tuna <= popcorn_tuna_7;
          end
        popcorn_tuna_8: begin
          if ({psycho_fang,spock_tango,ulysses_legos,yoku_weasley} == 7)
            popcorn_tuna <= popcorn_tuna_0;
          else
            popcorn_tuna <= popcorn_tuna_8;
          end
        default: popcorn_tuna <= popcorn_tuna_0;
      endcase
  end

// State Mek popcorn_tuna Output logic
always @(popcorn_tuna)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (popcorn_tuna)
        popcorn_tuna_0: begin
            rufus_pdaddy = 0;
            questo_kabar = 0;
            pirate_pluto = 0;
            metal_willem = 0;
            gulp_ready = 1;
            hotel_quail = 0;
            iceland_advil = 1;
            cafe_kang = 0;
            honey_huey = 1;
            killme_pyro = 0;
            moe_nation = 0;
            kilo_gutter = 0;
            arcade_uppers = 1;
            school_cheez = 0;
            bert_foiled = 1;
          end
        popcorn_tuna_1: begin
            rufus_pdaddy = 1;
            questo_kabar = 0;
            pirate_pluto = 0;
            metal_willem = 0;
            gulp_ready = 0;
            hotel_quail = 0;
            iceland_advil = 1;
            cafe_kang = 0;
            honey_huey = 0;
            killme_pyro = 0;
            moe_nation = 0;
            kilo_gutter = 1;
            arcade_uppers = 0;
            school_cheez = 0;
            bert_foiled = 0;
          end
        popcorn_tuna_2: begin
            rufus_pdaddy = 0;
            questo_kabar = 0;
            pirate_pluto = 1;
            metal_willem = 0;
            gulp_ready = 0;
            hotel_quail = 0;
            iceland_advil = 0;
            cafe_kang = 0;
            honey_huey = 0;
            killme_pyro = 1;
            moe_nation = 0;
            kilo_gutter = 1;
            arcade_uppers = 1;
            school_cheez = 0;
            bert_foiled = 0;
          end
        popcorn_tuna_3: begin
            rufus_pdaddy = 1;
            questo_kabar = 1;
            pirate_pluto = 0;
            metal_willem = 0;
            gulp_ready = 1;
            hotel_quail = 0;
            iceland_advil = 0;
            cafe_kang = 0;
            honey_huey = 0;
            killme_pyro = 0;
            moe_nation = 1;
            kilo_gutter = 0;
            arcade_uppers = 0;
            school_cheez = 1;
            bert_foiled = 1;
          end
        popcorn_tuna_4: begin
            rufus_pdaddy = 0;
            questo_kabar = 0;
            pirate_pluto = 1;
            metal_willem = 0;
            gulp_ready = 0;
            hotel_quail = 1;
            iceland_advil = 1;
            cafe_kang = 0;
            honey_huey = 0;
            killme_pyro = 0;
            moe_nation = 0;
            kilo_gutter = 1;
            arcade_uppers = 1;
            school_cheez = 0;
            bert_foiled = 1;
          end
        popcorn_tuna_5: begin
            rufus_pdaddy = 1;
            questo_kabar = 0;
            pirate_pluto = 1;
            metal_willem = 0;
            gulp_ready = 0;
            hotel_quail = 0;
            iceland_advil = 1;
            cafe_kang = 0;
            honey_huey = 1;
            killme_pyro = 0;
            moe_nation = 1;
            kilo_gutter = 1;
            arcade_uppers = 1;
            school_cheez = 0;
            bert_foiled = 1;
          end
        popcorn_tuna_6: begin
            rufus_pdaddy = 0;
            questo_kabar = 1;
            pirate_pluto = 1;
            metal_willem = 0;
            gulp_ready = 0;
            hotel_quail = 1;
            iceland_advil = 0;
            cafe_kang = 0;
            honey_huey = 1;
            killme_pyro = 0;
            moe_nation = 1;
            kilo_gutter = 1;
            arcade_uppers = 0;
            school_cheez = 1;
            bert_foiled = 0;
          end
        popcorn_tuna_7: begin
            rufus_pdaddy = 1;
            questo_kabar = 1;
            pirate_pluto = 1;
            metal_willem = 0;
            gulp_ready = 0;
            hotel_quail = 0;
            iceland_advil = 1;
            cafe_kang = 0;
            honey_huey = 0;
            killme_pyro = 0;
            moe_nation = 0;
            kilo_gutter = 0;
            arcade_uppers = 0;
            school_cheez = 1;
            bert_foiled = 0;
          end
        popcorn_tuna_8: begin
            rufus_pdaddy = 0;
            questo_kabar = 0;
            pirate_pluto = 0;
            metal_willem = 1;
            gulp_ready = 1;
            hotel_quail = 1;
            iceland_advil = 1;
            cafe_kang = 1;
            honey_huey = 1;
            killme_pyro = 1;
            moe_nation = 1;
            kilo_gutter = 1;
            arcade_uppers = 1;
            school_cheez = 1;
            bert_foiled = 0;
          end
        default: begin
            rufus_pdaddy = 0;
            questo_kabar = 0;
            pirate_pluto = 1;
            metal_willem = 1;
            gulp_ready = 0;
            hotel_quail = 1;
            iceland_advil = 0;
            cafe_kang = 0;
            honey_huey = 0;
            killme_pyro = 1;
            moe_nation = 1;
            kilo_gutter = 0;
            arcade_uppers = 0;
            school_cheez = 1;
            bert_foiled = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire tasty_pdaddy_out;
nut_000_lut #(2) nut_000_lut_inst_tasty_pdaddy (
  .din({vcc,iceland_advil}),
  .mask(4'b0001),
  .out(tasty_pdaddy_out)
);

always @(tasty_pdaddy_out)
begin
   naproxen_dig = tasty_pdaddy_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire tofu_squad_out;
nut_000_lut #(4) nut_000_lut_inst_tofu_squad (
  .din({rufus_pdaddy,bart_joey,naproxen_dig,spock_tango}),
  .mask(16'b0101110001010000),
  .out(tofu_squad_out)
);

always @(tofu_squad_out)
begin
   lotus_jacuzzi = tofu_squad_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire klaas_touch_out;
nut_000_lut #(2) nut_000_lut_inst_klaas_touch (
  .din({solder_kbtoys,chiptrip_pig}),
  .mask(4'b1100),
  .out(klaas_touch_out)
);

always @(klaas_touch_out)
begin
   tinker_pasta = klaas_touch_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire heidi_eeevil_out;
nut_000_lut #(2) nut_000_lut_inst_heidi_eeevil (
  .din({jason_numbers,gnd}),
  .mask(4'hc),
  .out(heidi_eeevil_out)
);

always @(heidi_eeevil_out)
begin
   whatelse_odin = heidi_eeevil_out;
end

// AND all of these bits together
always @(vcc or pirate_sheep or shrimp_peta or arcade_uppers or tesla_whale or supurb_barnum or whatelse_odin or wonton_edible or dragon_deng)
  begin
      badger_baron = & {vcc,pirate_sheep,shrimp_peta,arcade_uppers,tesla_whale,supurb_barnum,whatelse_odin,wonton_edible,dragon_deng};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      school_kmfdm <= 0;
    else
    case ({gnd,supurb_barnum})
       0 : school_kmfdm <= beast_kdqcens;
       1 : school_kmfdm <= school_kmfdm;
       2 : school_kmfdm <= school_kmfdm;
       3 : school_kmfdm <= school_kmfdm;
       default : school_kmfdm <= 0;
    endcase
  end

// OR all of these bits together
always @(life_wine or dipsy_ginger or vcc or honey_huey or pirate_pluto or isle_husks or rocks_batman or school_kmfdm or tango_whiskey or nigiri_donut or vcc)
  begin
      richard_thor = | {life_wine,dipsy_ginger,vcc,honey_huey,pirate_pluto,isle_husks,rocks_batman,school_kmfdm,tango_whiskey,nigiri_donut,vcc};
  end


// building a 8 to 1 MUX operator
reg [7:0] rewire_bison_mux_dat;
reg [2:0] rewire_bison_mux_sel;
always @(danger_zinc or vcc or hinge_kmfdm or popacap_bull or vcc or mouse_tobe or water_crystal or lxtcen_copper)
  begin
    rewire_bison_mux_dat = {danger_zinc,vcc,hinge_kmfdm,popacap_bull,vcc,mouse_tobe,water_crystal,lxtcen_copper};
  end

always @(intel_stoned or quail_lumber or vcc)
  begin
    rewire_bison_mux_sel = {intel_stoned,quail_lumber,vcc};
  end

always @(rewire_bison_mux_dat or rewire_bison_mux_sel)
  begin
    greenland_doc = rewire_bison_mux_dat[rewire_bison_mux_sel];
  end

reg feedback_pt_576;

always @(killme_pyro or feedback_pt_576)
  begin
      bison_exodus =  killme_pyro ^ !feedback_pt_576;
  end

reg feedback_pt_577;

always @(ihilani_army or feedback_pt_577)
  begin
      abel_picante = !ihilani_army |  feedback_pt_577;
  end

reg feedback_pt_578;

always @(questo_kabar or feedback_pt_578)
  begin
      jiminy_palm =  questo_kabar | !feedback_pt_578;
  end

reg feedback_pt_579;

always @(gnd or feedback_pt_579)
  begin
      plaster_echo = !gnd |  feedback_pt_579;
  end

reg feedback_pt_580;

always @(bison_exodus or feedback_pt_580)
  begin
      remus_blaster =  bison_exodus | !feedback_pt_580;
  end

reg feedback_pt_581;

always @(candle_pig or feedback_pt_581)
  begin
      draco_waffle = !candle_pig | !feedback_pt_581;
  end

reg feedback_pt_582;

always @(gnd or feedback_pt_582)
  begin
      boing_diagon =  gnd & !feedback_pt_582;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      broom_school <= 0;
    else
      broom_school <= sogood_bonker;
  end

always @(broom_school)
  begin
      feedback_pt_576 = broom_school;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      luthor_square <= 1;
    else
      luthor_square <= boing_diagon;
  end

always @(luthor_square)
  begin
      feedback_pt_577 = luthor_square;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_kidnapper <= 0;
    else if (gnd)
      ibm_kidnapper <= peace_solder;
  end

always @(ibm_kidnapper)
  begin
      feedback_pt_578 = ibm_kidnapper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yummy_over <= 1;
    else
      yummy_over <= luthor_square;
  end

always @(yummy_over)
  begin
      feedback_pt_579 = yummy_over;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      malfoy_jcrew <= 0;
    else
      malfoy_jcrew <= school_cheez;
  end

always @(malfoy_jcrew)
  begin
      feedback_pt_580 = malfoy_jcrew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rufus_huhhuh <= 0;
    else if (chiptrip_pig)
      rufus_huhhuh <= 0;
    else if (gnd)
      rufus_huhhuh <= supurb_barnum;
  end

always @(rufus_huhhuh)
  begin
      feedback_pt_581 = rufus_huhhuh;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      master_lao <= 0;
    else if (gnd)
      master_lao <= vcc;
  end

always @(master_lao)
  begin
      feedback_pt_582 = master_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_davidlin <= 0;
    else if (pizza_salami)
      lala_davidlin <= gnd;
    else if (mao_jason)
      lala_davidlin <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      floating_todd <= 0;
    else if (troll_coffee)
      floating_todd <= jiminy_palm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheese_bull <= 0;
    else
      cheese_bull <= deng_gregg_a;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iguana_fire <= 0;
    else if (vcc)
      iguana_fire <= vcc;
    else if (gnd)
      iguana_fire <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xray_potter <= 1;
    else
      xray_potter <= troll_coffee;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_rod <= 0;
    else if (vcc)
      knot_rod <= plaster_echo;
    else if (hotdog_egg)
      knot_rod <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wiggum_doobie <= 0;
    else if (rewire_frog)
      wiggum_doobie <= rufus_pdaddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vicks_raiders <= 1;
    else
      vicks_raiders <= danger_zinc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_armand <= 0;
    else
      salmon_armand <= killme_pyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_athena <= 0;
    else if (abel_picante)
      pixie_athena <= 0;
    else if (abel_dingbat)
      pixie_athena <= ibm_kidnapper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      master_crab <= 0;
    else if (lotus_jacuzzi)
      master_crab <= killme_pyro;
    else if (vcc)
      master_crab <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spock_south <= 0;
    else
      spock_south <= gnd;
  end

  always@(*)
  begin
    moulin_willy = ~( ~( ( ~( ( ~( ~( ~floating_todd ) ^ ~( ~draco_waffle ) ) ) ^ ~( ( ~( ibm_kidnapper ^ ~waffle_hummer ) ) ) ) ) ) ) ? ~( ~( ~( luthor_square | ~south_crank ) ) | ~tinker_pasta ^ ~howell_nation ^ ( ~( gnd ^ moe_nation ) ) ^ ~( ( uniform_would ^ ~pixie_athena ) ) ) : ( ~( ~( ~( ~( salmon_armand ) ) ) | ( ( ~( gnd ) ^ ( ~( vampire_gyro | gnd ) ) ) | ~( ~jacob_bolt ^ vcc ) ^ ~( ~( ~( ~pirate_pluto ) ) ) ) ) );
  end
// State Mek issac_opus Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      issac_opus <= issac_opus_0;
    else
      case (issac_opus)
        issac_opus_0: begin
          if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 15)
            issac_opus <= issac_opus_0;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 5)
            issac_opus <= issac_opus_4;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 13)
            issac_opus <= issac_opus_1;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 7)
            issac_opus <= issac_opus_5;
          else
            issac_opus <= issac_opus_0;
          end
        issac_opus_1: begin
          if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 14)
            issac_opus <= issac_opus_5;
          else
            issac_opus <= issac_opus_1;
          end
        issac_opus_2: begin
            issac_opus <= issac_opus_2;
          end
        issac_opus_3: begin
          if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 11)
            issac_opus <= issac_opus_3;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 12)
            issac_opus <= issac_opus_6;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 2)
            issac_opus <= issac_opus_6;
          else
            issac_opus <= issac_opus_3;
          end
        issac_opus_4: begin
          if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 15)
            issac_opus <= issac_opus_5;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 3)
            issac_opus <= issac_opus_6;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 10)
            issac_opus <= issac_opus_4;
          else
            issac_opus <= issac_opus_4;
          end
        issac_opus_5: begin
          if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 14)
            issac_opus <= issac_opus_3;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 6)
            issac_opus <= issac_opus_1;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 5)
            issac_opus <= issac_opus_1;
          else
            issac_opus <= issac_opus_5;
          end
        issac_opus_6: begin
          if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 1)
            issac_opus <= issac_opus_2;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 8)
            issac_opus <= issac_opus_5;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 7)
            issac_opus <= issac_opus_4;
          else if ({pirate_sheep,doc_senorduck,sneezy_stoned,master_lao} == 11)
            issac_opus <= issac_opus_1;
          else
            issac_opus <= issac_opus_6;
          end
        default: issac_opus <= issac_opus_0;
      endcase
  end

// State Mek issac_opus Output logic
always @(issac_opus)
  begin
    // consider all state regs when doing outputs
    case (issac_opus)
        issac_opus_0: begin
            chicken_louie = 0;
            isle_mcnugget = 1;
            show_fang = 1;
            master_sugar = 1;
            hp_elephant = 1;
            salmon_todd = 0;
            desade_india = 0;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 0;
            fufu_jonas = 1;
            juliet_hotel = 1;
          end
        issac_opus_1: begin
            chicken_louie = 1;
            isle_mcnugget = 1;
            show_fang = 0;
            master_sugar = 1;
            hp_elephant = 1;
            salmon_todd = 0;
            desade_india = 1;
            scotch_beast = 0;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 1;
          end
        issac_opus_2: begin
            chicken_louie = 0;
            isle_mcnugget = 0;
            show_fang = 1;
            master_sugar = 0;
            hp_elephant = 0;
            salmon_todd = 1;
            desade_india = 0;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 0;
            fufu_jonas = 1;
            juliet_hotel = 1;
          end
        issac_opus_3: begin
            chicken_louie = 0;
            isle_mcnugget = 1;
            show_fang = 1;
            master_sugar = 1;
            hp_elephant = 0;
            salmon_todd = 0;
            desade_india = 0;
            scotch_beast = 0;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 1;
            juliet_hotel = 0;
          end
        issac_opus_4: begin
            chicken_louie = 1;
            isle_mcnugget = 1;
            show_fang = 0;
            master_sugar = 0;
            hp_elephant = 0;
            salmon_todd = 1;
            desade_india = 1;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 0;
            fufu_jonas = 0;
            juliet_hotel = 0;
          end
        issac_opus_5: begin
            chicken_louie = 1;
            isle_mcnugget = 1;
            show_fang = 0;
            master_sugar = 0;
            hp_elephant = 1;
            salmon_todd = 1;
            desade_india = 1;
            scotch_beast = 1;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 1;
            juliet_hotel = 1;
          end
        issac_opus_6: begin
            chicken_louie = 1;
            isle_mcnugget = 0;
            show_fang = 1;
            master_sugar = 0;
            hp_elephant = 0;
            salmon_todd = 0;
            desade_india = 1;
            scotch_beast = 0;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 0;
            juliet_hotel = 1;
          end
        default: begin
            chicken_louie = 1;
            isle_mcnugget = 0;
            show_fang = 0;
            master_sugar = 0;
            hp_elephant = 1;
            salmon_todd = 0;
            desade_india = 0;
            scotch_beast = 0;
            guy_neptune = 0;
            stroop_coffee = 1;
            fufu_jonas = 1;
            juliet_hotel = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire leidiot_rat_out;
nut_000_lut #(4) nut_000_lut_inst_leidiot_rat (
  .din({show_fang,bison_exodus,salmon_todd,master_sugar}),
  .mask(16'b0000000010010000),
  .out(leidiot_rat_out)
);

always @(leidiot_rat_out)
begin
   dog_webvan = leidiot_rat_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire unicorn_llama_out;
nut_000_lut #(2) nut_000_lut_inst_unicorn_llama (
  .din({bert_foiled,cafe_kang}),
  .mask(4'b0000),
  .out(unicorn_llama_out)
);

always @(unicorn_llama_out)
begin
   knot_questo = unicorn_llama_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire freaky_deuce_out;
nut_000_lut #(5) nut_000_lut_inst_freaky_deuce (
  .din({isle_husks,genesis_black,chicken_louie,abel_picante,metal_willem}),
  .mask(32'h551eca0a),
  .out(freaky_deuce_out)
);

always @(freaky_deuce_out)
begin
   xray_nest = freaky_deuce_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire snort_bfs_out;
nut_000_lut #(6) nut_000_lut_inst_snort_bfs (
  .din({pirate_sheep,fufu_jonas,gnd,peace_solder,broom_school,rocks_batman}),
  .mask(64'b1000111001010001001100000100010000100001001000001010000000000000),
  .out(snort_bfs_out)
);

always @(snort_bfs_out)
begin
   bull_would = snort_bfs_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire biker_jesus_out;
nut_000_lut #(3) nut_000_lut_inst_biker_jesus (
  .din({vcc,knot_rod,knockout_dow}),
  .mask(8'hff),
  .out(biker_jesus_out)
);

always @(biker_jesus_out)
begin
   sogood_troll = biker_jesus_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire dadada_ramone_out;
nut_000_lut #(4) nut_000_lut_inst_dadada_ramone (
  .din({toysrus_roe,vcc,marco_orange,jacuzzi_cow}),
  .mask(16'h6b2c),
  .out(dadada_ramone_out)
);

always @(dadada_ramone_out)
begin
   southern_cafe = dadada_ramone_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire oscar_peace_out;
nut_000_lut #(1) nut_000_lut_inst_oscar_peace (
  .din({boots_ramone}),
  .mask(2'b01),
  .out(oscar_peace_out)
);

always @(oscar_peace_out)
begin
   minnie_floo = oscar_peace_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire neptune_willy_out;
nut_000_lut #(5) nut_000_lut_inst_neptune_willy (
  .din({xray_potter,richard_thor,vicks_raiders,south_ham,vcc}),
  .mask(32'b00000101100000010000000000010100),
  .out(neptune_willy_out)
);

always @(neptune_willy_out)
begin
   tobe_boitano = neptune_willy_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire icarus_pluto_out;
nut_000_lut #(3) nut_000_lut_inst_icarus_pluto (
  .din({vampire_gyro,vcc,master_crab}),
  .mask(8'b01000000),
  .out(icarus_pluto_out)
);

always @(icarus_pluto_out)
begin
   muffin_robust = icarus_pluto_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire opus_hp_out;
nut_000_lut #(6) nut_000_lut_inst_opus_hp (
  .din({tracy_aphid,plaster_echo,metal_willem,show_fang,sogood_bonker,dog_webvan}),
  .mask(64'b1000000000000110001001001100000000100001000010000000010000001000),
  .out(opus_hp_out)
);

always @(opus_hp_out)
begin
   rerun_hinge = opus_hp_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire air_minnie_out;
nut_000_lut #(6) nut_000_lut_inst_air_minnie (
  .din({rerun_hinge,juliet_hotel,gnd,fufu_jonas,waffle_hummer,stroop_coffee}),
  .mask(64'b1010000100100000001000000010100101010000101001000111111100010110),
  .out(air_minnie_out)
);

always @(air_minnie_out)
begin
   saturn_would = air_minnie_out;
end

// 14 bit to 20 bit const mult
always @(pirate_sheep or spock_south or ulysses_legos or rufus_pdaddy or vcc or kana_dorkus or pirate_sheep or rufus_huhhuh or boots_ramone or mouse_tobe or gnd or tiger_dorkus or southern_cafe or sleepy_boots)
  begin
      {oranje_bomb,oranges_draco,balloon_what,saturn_bull,safeway_willy,todd_green,kana_helena,aladdin_roid,desert_sierra,lantern_jcrew,delta_yohimbe,pepsi_foiled,loser_lad,ring_winner,geisha_dorkus,webvan_peta,dirty_xterm,huey_comtrex,vadar_wonder,hiswife_moe} = 
	  	  {pirate_sheep,spock_south,ulysses_legos,rufus_pdaddy,vcc,kana_dorkus,pirate_sheep,rufus_huhhuh,boots_ramone,mouse_tobe,gnd,tiger_dorkus,southern_cafe,sleepy_boots} * 
		  141159;
  end


initial begin
    {donkey_lad,withme_fang,tiger_phoenix,bono_bomb,atoms_whacky,plumber_papa} = 0;
end

// Registered 6 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (oranges_draco)
      {donkey_lad,withme_fang,tiger_phoenix,bono_bomb,atoms_whacky,plumber_papa} <= 0;
    else if (gnd)
      {donkey_lad,withme_fang,tiger_phoenix,bono_bomb,atoms_whacky,plumber_papa} <=
		  {lala_athena,saturn_bull,gnd,south_crank,isle_mcnugget,genesis_black};
    else
      {donkey_lad,withme_fang,tiger_phoenix,bono_bomb,atoms_whacky,plumber_papa} <=
		 {minnie_floo,vcc,gnd,gnd,sleepy_boots,century_delta} + 
		 {gulp_ready,knot_questo,vcc,scotch_beast,wiggum_doobie,vcc};
  end

// Triple add / sub bait
always @(floating_todd or lala_davidlin or rufus_huhhuh or gnd or gnd or mouse_tobe or ulysses_legos or gnd or safeway_willy or minnie_floo or delta_yohimbe or abel_dingbat or
         salmon_armand or juliet_hotel or gnd or kana_helena or huey_golfland or solder_obiwan or vcc or oranje_bomb or moulin_willy or vcc or withme_fang or pixie_athena or
         huey_comtrex or water_crystal or vcc or sogood_troll or gnd or wiggum_doobie or greenland_doc or gnd or cheese_bull or rufus_huhhuh or gnd or desert_sierra)
  begin
    {devotion_knot,school_gerrit,broom_riddler,tin_think,guy_tuna,davidlin_fuji,fish_hummer,tiger_hurt,blueled_kilo,issac_ihilani,duey_speedyg,hurt_genesis} = 
        {floating_todd,lala_davidlin,rufus_huhhuh,gnd,gnd,mouse_tobe,ulysses_legos,gnd,safeway_willy,minnie_floo,delta_yohimbe,abel_dingbat} -
        {salmon_armand,juliet_hotel,gnd,kana_helena,huey_golfland,solder_obiwan,vcc,oranje_bomb,moulin_willy,vcc,withme_fang,pixie_athena} +
        {huey_comtrex,water_crystal,vcc,sogood_troll,gnd,wiggum_doobie,greenland_doc,gnd,cheese_bull,rufus_huhhuh,gnd,desert_sierra};
  end

// Random 4 input look up table
always @(tiger_phoenix or knot_rod or badger_baron or muffin_robust)
  begin
    casex ({tiger_phoenix,knot_rod,badger_baron,muffin_robust})
      0: nation_soccer=1;
      1: nation_soccer=0;
      2: nation_soccer=0;
      3: nation_soccer=0;
      4: nation_soccer=1;
      5: nation_soccer=0;
      6: nation_soccer=1;
      7: nation_soccer=0;
      8: nation_soccer=0;
      9: nation_soccer=0;
      10: nation_soccer=0;
      11: nation_soccer=1;
      12: nation_soccer=0;
      13: nation_soccer=1;
      14: nation_soccer=1;
      15: nation_soccer=0;
      default: nation_soccer=0;
    endcase
  end

// XNOR all of these bits together
always @(vcc or lantern_jcrew or pirate_sheep or bono_bomb or solder_obiwan or tin_think or kilo_gutter or vcc or supurb_barnum or iceland_advil or duey_speedyg or bono_bomb)
  begin
      southern_papa = ~^ {vcc,lantern_jcrew,pirate_sheep,bono_bomb,solder_obiwan,tin_think,kilo_gutter,vcc,supurb_barnum,iceland_advil,duey_speedyg,bono_bomb};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ariel_century <= 0;
    else
    case ({vcc,plague_tango})
       0 : ariel_century <= ariel_century;
       1 : ariel_century <= ring_winner;
       2 : ariel_century <= ariel_century;
       3 : ariel_century <= gnd;
       default : ariel_century <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grumby_deng <= 0;
    else
    case ({gnd,ring_winner})
       0 : grumby_deng <= grumby_deng;
       1 : grumby_deng <= loser_lad;
       2 : grumby_deng <= grumby_deng;
       3 : grumby_deng <= grumby_deng;
       default : grumby_deng <= 0;
    endcase
  end

reg feedback_pt_583;

always @(gulp_ready or feedback_pt_583)
  begin
      palmer_mrbill = !gulp_ready ^ !feedback_pt_583;
  end

reg feedback_pt_584;

always @(gnd or feedback_pt_584)
  begin
      oscar_comrade = !gnd &  feedback_pt_584;
  end

reg feedback_pt_585;

always @(southern_papa or feedback_pt_585)
  begin
      piggish_might = !southern_papa |  feedback_pt_585;
  end

reg feedback_pt_586;

always @(gnd or feedback_pt_586)
  begin
      dorkus_sand =  gnd | !feedback_pt_586;
  end

reg feedback_pt_587;

always @(plumber_papa or feedback_pt_587)
  begin
      robust_xterm = !plumber_papa ^ !feedback_pt_587;
  end

wire zhuang_goat_wire;

dffeas zhuang_goat_ff (
  .clk(clock1),
  .d(gnd),
  .ena(rufus_pdaddy),
  .sclr(issac_ihilani),
  .sload(rocks_batman),
  .asdata(oscar_comrade),
  .clrn(!reset1),
  .q(zhuang_goat_wire)
);

always @(zhuang_goat_wire) begin
   hinge_sears = zhuang_goat_wire;
end

always @(hinge_sears)
  begin
      feedback_pt_583 = hinge_sears;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      concorde_kana <= 0;
    else if (ulysses_legos)
      concorde_kana <= 0;
    else if (troll_coffee)
      concorde_kana <= broom_riddler;
  end

always @(concorde_kana)
  begin
      feedback_pt_584 = concorde_kana;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joker_lucius <= 1;
    else
      joker_lucius <= iguana_fire;
  end

always @(joker_lucius)
  begin
      feedback_pt_585 = joker_lucius;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_covad <= 1;
    else
      money_covad <= donkey_lad;
  end

always @(money_covad)
  begin
      feedback_pt_586 = money_covad;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      athena_sierra <= 1;
    else
      athena_sierra <= dirty_xterm;
  end

always @(athena_sierra)
  begin
      feedback_pt_587 = athena_sierra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_bust <= 0;
    else if (tiger_hurt)
      tobe_bust <= joker_lucius;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wujing_golf <= 0;
    else if (vcc)
      wujing_golf <= gnd;
    else if (fish_hummer)
      wujing_golf <= 0;
  end

wire duey_goblin_wire;

dffeas duey_goblin_ff (
  .clk(clock1),
  .d(cheese_bull),
  .ena(chips_deng),
  .sclr(vcc),
  .sload(gnd),
  .asdata(rerun_hinge),
  .clrn(!reset1),
  .q(duey_goblin_wire)
);

always @(duey_goblin_wire) begin
   alpha_badger = duey_goblin_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bull_kmfdm <= 1;
    else
      bull_kmfdm <= alpha_badger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      the_pope_palm <= 0;
    else
      the_pope_palm <= master_crab;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      larry_subway <= 0;
    else if (vcc)
      larry_subway <= guy_rhvcens;
  end

wire iceland_moses_wire;

dffeas iceland_moses_ff (
  .clk(clock1),
  .d(lala_davidlin),
  .ena(piggish_might),
  .sclr(century_delta),
  .sload(sogood_troll),
  .asdata(todd_green),
  .clrn(!reset1),
  .q(iceland_moses_wire)
);

always @(iceland_moses_wire) begin
   sweetie_att = iceland_moses_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      withme_yummy <= 1;
    else
      withme_yummy <= abel_picante;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minerva_tonic <= 1;
    else
      minerva_tonic <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinus_goofy <= 0;
    else if (vcc)
      sinus_goofy <= 0;
    else if (tiger_hurt)
      sinus_goofy <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hagrid_condit <= 0;
    else if (rufus_pdaddy)
      hagrid_condit <= plaster_echo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pluto_sgates <= 0;
    else if (palmer_mrbill)
      pluto_sgates <= oranje_bomb;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fear_my_tummy <= 0;
    else if (gnd)
      fear_my_tummy <= troll_coffee;
    else if (vcc)
      fear_my_tummy <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gulp_sapporo <= 1;
    else
      gulp_sapporo <= master_crab;
  end

reg feedback_pt_588;

always @(larry_subway or feedback_pt_588)
  begin
      drdeath_chuck = !larry_subway & !feedback_pt_588;
  end

reg feedback_pt_589;

always @(joker_lucius or feedback_pt_589)
  begin
      pluto_quebec =  joker_lucius |  feedback_pt_589;
  end

reg feedback_pt_590;

always @(bull_kmfdm or feedback_pt_590)
  begin
      indigo_hurt = !bull_kmfdm ^  feedback_pt_590;
  end

reg feedback_pt_591;

always @(rufus_pdaddy or feedback_pt_591)
  begin
      juliet_doobie = !rufus_pdaddy ^  feedback_pt_591;
  end

wire acid_wheezer_wire;

dffeas acid_wheezer_ff (
  .clk(clock1),
  .d(pirate_sheep),
  .ena(robust_xterm),
  .sclr(money_covad),
  .sload(hinge_sears),
  .asdata(school_gerrit),
  .clrn(!reset1),
  .q(acid_wheezer_wire)
);

always @(acid_wheezer_wire) begin
   larry_hagrid = acid_wheezer_wire;
end

always @(larry_hagrid)
  begin
      feedback_pt_588 = larry_hagrid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popcorn_air <= 0;
    else if (pluto_quebec)
      popcorn_air <= 0;
    else if (hagrid_condit)
      popcorn_air <= gnd;
  end

always @(popcorn_air)
  begin
      feedback_pt_589 = popcorn_air;
  end

wire odin_brothers_wire;

dffeas odin_brothers_ff (
  .clk(clock1),
  .d(gnd),
  .ena(wujing_golf),
  .sclr(gnd),
  .sload(abel_dingbat),
  .asdata(juliet_doobie),
  .clrn(!reset1),
  .q(odin_brothers_wire)
);

always @(odin_brothers_wire) begin
   deuce_crack = odin_brothers_wire;
end

always @(deuce_crack)
  begin
      feedback_pt_590 = deuce_crack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      devotion_ants <= 0;
    else if (atoms_whacky)
      devotion_ants <= 0;
    else if (draco_waffle)
      devotion_ants <= popcorn_air;
  end

always @(devotion_ants)
  begin
      feedback_pt_591 = devotion_ants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_rarest <= 0;
    else
      crab_rarest <= guy_rhvcens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      haze_children <= 0;
    else if (gnd)
      haze_children <= fear_my_tummy;
    else if (dorkus_sand)
      haze_children <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_lala <= 1;
    else
      hp_lala <= vcc;
  end

wire cuckoo_haze_wire;

dffeas cuckoo_haze_ff (
  .clk(clock1),
  .d(otter_mexican),
  .ena(indigo_hurt),
  .sclr(desert_sierra),
  .sload(pepsi_foiled),
  .asdata(tobe_boitano),
  .clrn(!reset1),
  .q(cuckoo_haze_wire)
);

always @(cuckoo_haze_wire) begin
   victor_shuda = cuckoo_haze_wire;
end

wire touch_gm_wire;

dffeas touch_gm_ff (
  .clk(clock1),
  .d(victor_shuda),
  .ena(malfoy_jcrew),
  .sclr(chips_deng),
  .sload(nigiri_donut),
  .asdata(athena_sierra),
  .clrn(!reset1),
  .q(touch_gm_wire)
);

always @(touch_gm_wire) begin
   tango_ulysses = touch_gm_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_ramone <= 0;
    else
      moron_ramone <= saturn_would;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neon_sortout <= 1;
    else
      neon_sortout <= davidlin_fuji;
  end

wire dragon_bonker_wire;

dffeas dragon_bonker_ff (
  .clk(clock1),
  .d(pirate_sheep),
  .ena(vcc),
  .sclr(malfoy_jcrew),
  .sload(balloon_what),
  .asdata(crab_rarest),
  .clrn(!reset1),
  .q(dragon_bonker_wire)
);

always @(dragon_bonker_wire) begin
   dopey_bacon = dragon_bonker_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_grams <= 0;
    else if (devotion_ants)
      gm_grams <= 0;
    else if (pluto_sgates)
      gm_grams <= sinus_goofy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wiggum_curie <= 0;
    else if (plague_tango)
      wiggum_curie <= 0;
    else if (minerva_tonic)
      wiggum_curie <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moulin_deuce <= 0;
    else
      moulin_deuce <= the_pope_palm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bfs_monster <= 1;
    else
      bfs_monster <= tobe_bust;
  end

// State Mek cheese_sheep Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheese_sheep <= cheese_sheep_0;
    else
      case (cheese_sheep)
        cheese_sheep_0: begin
          if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 13)
            cheese_sheep <= cheese_sheep_0;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 15)
            cheese_sheep <= cheese_sheep_5;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 10)
            cheese_sheep <= cheese_sheep_1;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 6)
            cheese_sheep <= cheese_sheep_2;
          else
            cheese_sheep <= cheese_sheep_0;
          end
        cheese_sheep_1: begin
          if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 12)
            cheese_sheep <= cheese_sheep_3;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 3)
            cheese_sheep <= cheese_sheep_3;
          else
            cheese_sheep <= cheese_sheep_1;
          end
        cheese_sheep_2: begin
          if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 15)
            cheese_sheep <= cheese_sheep_5;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 12)
            cheese_sheep <= cheese_sheep_1;
          else
            cheese_sheep <= cheese_sheep_2;
          end
        cheese_sheep_3: begin
          if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 14)
            cheese_sheep <= cheese_sheep_1;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 4)
            cheese_sheep <= cheese_sheep_4;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 11)
            cheese_sheep <= cheese_sheep_1;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 10)
            cheese_sheep <= cheese_sheep_0;
          else
            cheese_sheep <= cheese_sheep_3;
          end
        cheese_sheep_4: begin
          if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 8)
            cheese_sheep <= cheese_sheep_3;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 11)
            cheese_sheep <= cheese_sheep_0;
          else
            cheese_sheep <= cheese_sheep_4;
          end
        cheese_sheep_5: begin
          if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 5)
            cheese_sheep <= cheese_sheep_5;
          else if ({hp_lala,sneezy_stoned,wiggum_curie,metal_willem} == 7)
            cheese_sheep <= cheese_sheep_4;
          else
            cheese_sheep <= cheese_sheep_5;
          end
        default: cheese_sheep <= cheese_sheep_0;
      endcase
  end

// State Mek cheese_sheep Output logic
always @(cheese_sheep)
  begin
    // consider all state regs when doing outputs
    case (cheese_sheep)
        cheese_sheep_0: begin
            sinew_gonzo = 1;
            beef_crank = 0;
            dadada_eel = 1;
            kangaroo_bolt = 0;
            rubik_centaur = 0;
            usa_chillis = 0;
            yak_stemcell = 0;
            fallen_ohno = 0;
          end
        cheese_sheep_1: begin
            sinew_gonzo = 1;
            beef_crank = 1;
            dadada_eel = 1;
            kangaroo_bolt = 0;
            rubik_centaur = 1;
            usa_chillis = 1;
            yak_stemcell = 1;
            fallen_ohno = 0;
          end
        cheese_sheep_2: begin
            sinew_gonzo = 0;
            beef_crank = 0;
            dadada_eel = 0;
            kangaroo_bolt = 0;
            rubik_centaur = 0;
            usa_chillis = 1;
            yak_stemcell = 1;
            fallen_ohno = 1;
          end
        cheese_sheep_3: begin
            sinew_gonzo = 1;
            beef_crank = 0;
            dadada_eel = 1;
            kangaroo_bolt = 0;
            rubik_centaur = 0;
            usa_chillis = 0;
            yak_stemcell = 0;
            fallen_ohno = 1;
          end
        cheese_sheep_4: begin
            sinew_gonzo = 0;
            beef_crank = 1;
            dadada_eel = 0;
            kangaroo_bolt = 1;
            rubik_centaur = 0;
            usa_chillis = 0;
            yak_stemcell = 1;
            fallen_ohno = 1;
          end
        cheese_sheep_5: begin
            sinew_gonzo = 1;
            beef_crank = 0;
            dadada_eel = 0;
            kangaroo_bolt = 0;
            rubik_centaur = 0;
            usa_chillis = 1;
            yak_stemcell = 1;
            fallen_ohno = 1;
          end
        default: begin
            sinew_gonzo = 1;
            beef_crank = 0;
            dadada_eel = 0;
            kangaroo_bolt = 1;
            rubik_centaur = 0;
            usa_chillis = 1;
            yak_stemcell = 1;
            fallen_ohno = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire nest_nuclear_out;
nut_000_lut #(5) nut_000_lut_inst_nest_nuclear (
  .din({yummy_over,school_kmfdm,tobe_bust,vcc,crab_rarest}),
  .mask(32'b01101100000001010100000000100110),
  .out(nest_nuclear_out)
);

always @(nest_nuclear_out)
begin
   parrot_tinker = nest_nuclear_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire gerrit_remus_out;
nut_000_lut #(2) nut_000_lut_inst_gerrit_remus (
  .din({sweetie_att,honey_huey}),
  .mask(4'b0000),
  .out(gerrit_remus_out)
);

always @(gerrit_remus_out)
begin
   heidi_might = gerrit_remus_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire maki_indigo_out;
nut_000_lut #(6) nut_000_lut_inst_maki_indigo (
  .din({vcc,gnd,vcc,moron_ramone,neon_sortout,atoms_whacky}),
  .mask(64'h49be69550075cd4b),
  .out(maki_indigo_out)
);

always @(maki_indigo_out)
begin
   cuckoo_clay = maki_indigo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire lxtcen_alpha_out;
nut_000_lut #(2) nut_000_lut_inst_lxtcen_alpha (
  .din({pluto_quebec,yummy_over}),
  .mask(4'b0001),
  .out(lxtcen_alpha_out)
);

always @(lxtcen_alpha_out)
begin
   juliet_rod = lxtcen_alpha_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire monster_golf_out;
nut_000_lut #(1) nut_000_lut_inst_monster_golf (
  .din({ariel_century}),
  .mask(2'b00),
  .out(monster_golf_out)
);

always @(monster_golf_out)
begin
   stirfry_wine = monster_golf_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire brian_beavis_out;
nut_000_lut #(5) nut_000_lut_inst_brian_beavis (
  .din({aladdin_roid,larry_hagrid,tango_ulysses,vcc,south_crank}),
  .mask(32'b00010100110100000000101000010000),
  .out(brian_beavis_out)
);

always @(brian_beavis_out)
begin
   holland_honda = brian_beavis_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire chicken_nail_out;
nut_000_lut #(6) nut_000_lut_inst_chicken_nail (
  .din({dadada_eel,vcc,guy_tuna,vcc,parrot_tinker,deng_gregg_a}),
  .mask(64'h0cf0b6944f5a1fdf),
  .out(chicken_nail_out)
);

always @(chicken_nail_out)
begin
   deng_questo = chicken_nail_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire alpha_clay_out;
nut_000_lut #(1) nut_000_lut_inst_alpha_clay (
  .din({desade_india}),
  .mask(2'b00),
  .out(alpha_clay_out)
);

always @(alpha_clay_out)
begin
   midas_thankee = alpha_clay_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire stick_foryou_out;
nut_000_lut #(5) nut_000_lut_inst_stick_foryou (
  .din({plumber_papa,deuce_crack,usa_chillis,aladdin_roid,yak_stemcell}),
  .mask(32'b10010011010000010100011001001010),
  .out(stick_foryou_out)
);

always @(stick_foryou_out)
begin
   honda_kang = stick_foryou_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire yummy_newt_out;
nut_000_lut #(5) nut_000_lut_inst_yummy_newt (
  .din({yummy_over,stirfry_wine,deng_questo,tinker_pasta,bfs_monster}),
  .mask(32'h18a0214c),
  .out(yummy_newt_out)
);

always @(yummy_newt_out)
begin
   usa_stoner = yummy_newt_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire donut_zhuang_out;
nut_000_lut #(5) nut_000_lut_inst_donut_zhuang (
  .din({heidi_might,dadada_eel,alpha_badger,beef_crank,gnd}),
  .mask(32'hefa283b8),
  .out(donut_zhuang_out)
);

always @(donut_zhuang_out)
begin
   freaky_condit = donut_zhuang_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_lut.v
///////////////////////////////////////////

wire hippo_buddha_out;
nut_000_lut #(6) nut_000_lut_inst_hippo_buddha (
  .din({devotion_knot,webvan_peta,guy_neptune,sinew_gonzo,pirate_sheep,sinew_gonzo}),
  .mask(64'hb1e921f89e588cde),
  .out(hippo_buddha_out)
);

always @(hippo_buddha_out)
begin
   xray_junkie = hippo_buddha_out;
end

// 6 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {sand_ready,bull_onion,rum_waster,rojas_tango,spain_stick,fsncens_spyro} <= 0;
    else if (vcc)
      {sand_ready,bull_onion,rum_waster,rojas_tango,spain_stick,fsncens_spyro} <= {sand_ready,bull_onion,rum_waster,rojas_tango,spain_stick,fsncens_spyro} + 20;
    else
      {sand_ready,bull_onion,rum_waster,rojas_tango,spain_stick,fsncens_spyro} <= {sand_ready,bull_onion,rum_waster,rojas_tango,spain_stick,fsncens_spyro} - 220;
  end

// 6 bit add sub
always @(vcc or stirfry_wine or vcc or ulysses_legos or gnd or gnd or hinge_sears or saturn_would or vcc or vcc or stirfry_wine or honda_kang)
  begin
    {quail_pirate,weevil_papa,abel_deng,eggsalad_roe,spyro_kmfdm,squad_genji} = 
		({vcc,stirfry_wine,vcc,ulysses_legos,gnd,gnd} ^ 217) - 
		({hinge_sears,saturn_would,vcc,vcc,stirfry_wine,honda_kang} ^ 216);
  end

// 2 bit SOP selector
always @(
        nigiri_donut or ibm_kidnapper  or 
        haze_children or gnd 
)

begin
    elephant_mine = 
      nigiri_donut & ibm_kidnapper |
      haze_children & gnd;
end

// AND all of these bits together
always @(quail_pirate or desert_sierra or hp_elephant or athena_sierra or midas_thankee)
  begin
      art_anarchist = & {quail_pirate,desert_sierra,hp_elephant,athena_sierra,midas_thankee};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      carolina_acid <= 0;
    else
    case ({bull_onion,spain_stick})
       0 : carolina_acid <= carolina_acid;
       1 : carolina_acid <= carolina_acid;
       2 : carolina_acid <= carolina_acid;
       3 : carolina_acid <= bull_kmfdm;
       default : carolina_acid <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lucent_cain <= 0;
    else
    case ({gnd,gnd})
       0 : lucent_cain <= lucent_cain;
       1 : lucent_cain <= lucent_cain;
       2 : lucent_cain <= pluto_sgates;
       3 : lucent_cain <= guy_rhvcens;
       default : lucent_cain <= 0;
    endcase
  end

reg feedback_pt_592;

always @(withme_yummy or feedback_pt_592)
  begin
      larry_shuda =  withme_yummy ^ !feedback_pt_592;
  end

reg feedback_pt_593;

always @(heidi_might or feedback_pt_593)
  begin
      bep_chairman =  heidi_might & !feedback_pt_593;
  end

reg feedback_pt_594;

always @(vcc or feedback_pt_594)
  begin
      tobe_roid =  vcc | !feedback_pt_594;
  end

reg feedback_pt_595;

always @(vcc or feedback_pt_595)
  begin
      papyrus_genji =  vcc | !feedback_pt_595;
  end

reg feedback_pt_596;

always @(plumber_papa or feedback_pt_596)
  begin
      usa_huey = !plumber_papa & !feedback_pt_596;
  end

reg feedback_pt_597;

always @(minerva_tonic or feedback_pt_597)
  begin
      palm_wukong = !minerva_tonic & !feedback_pt_597;
  end

reg feedback_pt_598;

always @(gnd or feedback_pt_598)
  begin
      ring_abel = !gnd ^ !feedback_pt_598;
  end

reg feedback_pt_599;

always @(school_kmfdm or feedback_pt_599)
  begin
      questo_rojas = !school_kmfdm &  feedback_pt_599;
  end

reg feedback_pt_600;

always @(rum_waster or feedback_pt_600)
  begin
      moron_palmer = !rum_waster & !feedback_pt_600;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intel_aspirin <= 1;
    else
      intel_aspirin <= abel_deng;
  end

always @(intel_aspirin)
  begin
      feedback_pt_592 = intel_aspirin;
  end

wire kungfu_sheep_wire;

dffeas kungfu_sheep_ff (
  .clk(clock1),
  .d(intel_aspirin),
  .ena(iguana_fire),
  .sclr(squad_genji),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset1),
  .q(kungfu_sheep_wire)
);

always @(kungfu_sheep_wire) begin
   beemer_xterm = kungfu_sheep_wire;
end

always @(beemer_xterm)
  begin
      feedback_pt_593 = beemer_xterm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      speed_coffee <= 1;
    else
      speed_coffee <= questo_rojas;
  end

always @(speed_coffee)
  begin
      feedback_pt_594 = speed_coffee;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lucius_iguana <= 1;
    else
      lucius_iguana <= larry_shuda;
  end

always @(lucius_iguana)
  begin
      feedback_pt_595 = lucius_iguana;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_animal <= 0;
    else if (blueled_kilo)
      stix_animal <= gnd;
    else if (gnd)
      stix_animal <= 0;
  end

always @(stix_animal)
  begin
      feedback_pt_596 = stix_animal;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_wujing <= 0;
    else
      rerun_wujing <= squad_genji;
  end

always @(rerun_wujing)
  begin
      feedback_pt_597 = rerun_wujing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bamboo_yellow <= 0;
    else if (cuckoo_clay)
      bamboo_yellow <= remus_blaster;
    else if (bep_chairman)
      bamboo_yellow <= 0;
  end

always @(bamboo_yellow)
  begin
      feedback_pt_598 = bamboo_yellow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sierra_pdiddy <= 0;
    else
      sierra_pdiddy <= vcc;
  end

always @(sierra_pdiddy)
  begin
      feedback_pt_599 = sierra_pdiddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      over_sierra <= 0;
    else if (kana_dorkus)
      over_sierra <= guy_neptune;
    else if (gnd)
      over_sierra <= 0;
  end

always @(over_sierra)
  begin
      feedback_pt_600 = over_sierra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      taoist_klaas <= 1;
    else
      taoist_klaas <= weevil_papa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maki_joseph <= 0;
    else if (stix_animal)
      maki_joseph <= bull_would;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gin_gulp <= 0;
    else if (school_kmfdm)
      gin_gulp <= 0;
    else if (gnd)
      gin_gulp <= maki_joseph;
  end

wire notsure_opus_wire;

dffeas notsure_opus_ff (
  .clk(clock1),
  .d(rerun_hinge),
  .ena(yak_stemcell),
  .sclr(dopey_bacon),
  .sload(beemer_xterm),
  .asdata(nation_soccer),
  .clrn(!reset1),
  .q(notsure_opus_wire)
);

always @(notsure_opus_wire) begin
   knot_yellow = notsure_opus_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_pasta <= 0;
    else
      webvan_pasta <= gm_grams;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      potato_larry <= 1;
    else
      potato_larry <= bamboo_yellow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      att_leviticus <= 0;
    else if (bull_kmfdm)
      att_leviticus <= bep_chairman;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foryou_jxnbox <= 0;
    else if (fallen_ohno)
      foryou_jxnbox <= tinker_pasta;
  end

// 3 bit add sub
always @(tiger_dorkus or gnd or wiggum_curie or gnd or rojas_tango or vcc)
  begin
    {richard_moe,lamer_rufus,smack_wonder} = 
		{tiger_dorkus,gnd,wiggum_curie} + 
		{gnd,rojas_tango,vcc};
  end

// 6 bit add sub
always @(spyro_kmfdm or ulysses_legos or carolina_acid or bfs_monster or dorkus_sand or moron_palmer or quail_pirate or gnd or intel_aspirin or deng_gregg_a or bull_kmfdm or moron_ramone)
  begin
    {sake_rerun,star_brothers,elguapo_yoda,mine_brothers,onion_peta,dork_knot} = 
		{spyro_kmfdm,ulysses_legos,carolina_acid,bfs_monster,dorkus_sand,moron_palmer} - 
		{quail_pirate,gnd,intel_aspirin,deng_gregg_a,bull_kmfdm,moron_ramone};
  end

// A + const
always @(bep_chairman or vcc or vcc or vadar_wonder or rum_waster)
  begin
    {knot_muffin,ebay_ohisee,snape_pizza,ariel_callme,blessyou_dow} = {bep_chairman,vcc,vcc,vadar_wonder,rum_waster} + 131;
  end

// 6 bit divide
always @(lucius_iguana or gnd or sweetie_att or gnd or star_brothers or gnd or vcc or atoms_whacky or wiggum_curie or beef_crank or webvan_pasta or cheese_bull)
  begin
    if ({vcc,atoms_whacky,wiggum_curie,beef_crank,webvan_pasta,cheese_bull} == 0)
       {beef_hawaii,bush_zhuang,fury_bloom,rerun_filch,whoiswho_pig,gm_curly} = 0;
    else 
      {beef_hawaii,bush_zhuang,fury_bloom,rerun_filch,whoiswho_pig,gm_curly} = 
	  	  {lucius_iguana,gnd,sweetie_att,gnd,star_brothers,gnd} / 
		  {vcc,atoms_whacky,wiggum_curie,beef_crank,webvan_pasta,cheese_bull};
  end

reg feedback_pt_601;

always @(vcc or feedback_pt_601)
  begin
      tonks_uniform = !vcc ^  feedback_pt_601;
  end

reg feedback_pt_602;

always @(speed_coffee or feedback_pt_602)
  begin
      pomodoro_hulk =  speed_coffee ^ !feedback_pt_602;
  end

reg feedback_pt_603;

always @(tobe_roid or feedback_pt_603)
  begin
      donkey_pig =  tobe_roid |  feedback_pt_603;
  end

reg feedback_pt_604;

always @(dadada_eel or feedback_pt_604)
  begin
      kebab_sake =  dadada_eel | !feedback_pt_604;
  end

reg feedback_pt_605;

always @(vcc or feedback_pt_605)
  begin
      witch_joseph =  vcc ^  feedback_pt_605;
  end

reg feedback_pt_606;

always @(nation_soccer or feedback_pt_606)
  begin
      unicorn_alpha =  nation_soccer |  feedback_pt_606;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_india <= 0;
    else
      sogood_india <= hinge_sears;
  end

always @(sogood_india)
  begin
      feedback_pt_601 = sogood_india;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pierre_taoist <= 0;
    else
      pierre_taoist <= whoiswho_pig;
  end

always @(pierre_taoist)
  begin
      feedback_pt_602 = pierre_taoist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_junkie <= 0;
    else if (sake_rerun)
      sogood_junkie <= beef_hawaii;
  end

always @(sogood_junkie)
  begin
      feedback_pt_603 = sogood_junkie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      happy_legos <= 0;
    else if (vcc)
      happy_legos <= 0;
    else if (vcc)
      happy_legos <= dirty_xterm;
  end

always @(happy_legos)
  begin
      feedback_pt_604 = happy_legos;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      solder_haze <= 0;
    else if (vcc)
      solder_haze <= 0;
    else if (gulp_sapporo)
      solder_haze <= knot_muffin;
  end

always @(solder_haze)
  begin
      feedback_pt_605 = solder_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eagle_red <= 0;
    else
      eagle_red <= moron_ramone;
  end

always @(eagle_red)
  begin
      feedback_pt_606 = eagle_red;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      questo_show <= 0;
    else if (south_ham)
      questo_show <= blessyou_dow;
    else if (spain_stick)
      questo_show <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      krabapple_emu <= 0;
    else if (fury_bloom)
      krabapple_emu <= over_sierra;
    else if (concorde_kana)
      krabapple_emu <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killer_lagoon <= 0;
    else if (taoist_klaas)
      killer_lagoon <= richard_moe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_ulysses <= 0;
    else if (vcc)
      fufu_ulysses <= sneezy_stoned;
    else if (gnd)
      fufu_ulysses <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iron_zebra <= 0;
    else if (ebay_ohisee)
      iron_zebra <= 0;
    else if (rubik_centaur)
      iron_zebra <= questo_rojas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      scotland_bush <= 0;
    else if (kebab_sake)
      scotland_bush <= ariel_century;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hanger_zed <= 0;
    else if (killer_lagoon)
      hanger_zed <= 0;
    else if (gnd)
      hanger_zed <= lamer_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fascist_donut <= 1;
    else
      fascist_donut <= iron_zebra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_jacuzzi <= 1;
    else
      gm_jacuzzi <= webvan_peta;
  end

wire nation_rod_wire;

dffea nation_rod_ff (
  .clk(clock1),
  .d(pirate_sheep),
  .ena(gnd),
  .adata(gnd),
  .clrn(!reset1),
  .q(nation_rod_wire)
);

always @(nation_rod_wire) begin
   bullet_wonton = nation_rod_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      troll_hans <= 0;
    else
      troll_hans <= beemer_xterm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_hp <= 0;
    else if (smack_wonder)
      crab_hp <= 0;
    else if (sogood_junkie)
      crab_hp <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yoku_ebi <= 0;
    else
      yoku_ebi <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beef_bismuth <= 0;
    else if (pirate_sheep)
      beef_bismuth <= usa_stoner;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hanger_cheese <= 1;
    else
      hanger_cheese <= sogood_india;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      faster_snort <= 0;
    else if (huey_comtrex)
      faster_snort <= vcc;
    else if (gnd)
      faster_snort <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minnow_sand <= 0;
    else if (fallen_ohno)
      minnow_sand <= solder_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lagoon_dork <= 0;
    else if (xray_junkie)
      lagoon_dork <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      george_bullet <= 0;
    else
      george_bullet <= bullet_wonton;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ants_cuckoo <= 1;
    else
      ants_cuckoo <= plumber_papa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stoned_pasta <= 0;
    else if (sierra_pdiddy)
      stoned_pasta <= hanger_cheese;
    else if (vcc)
      stoned_pasta <= 0;
  end

// Random combinatorial logic block
always@(*)
  begin
      marquis_bolt = ~( ~rubik_centaur ) | ( ~( ~( ~gnd & ~drdeath_chuck ^ ~( vcc ) ) | ~( ~( gnd & ~deng_gregg_a ) ) ) );
  end

  always@(*)
  begin
    burnout_tuna = ( ~( ~( ( ( ~( ariel_century | ~fascist_donut ) ) ^ ~( ~art_anarchist ) ) & holland_honda & ~donkey_pig | ( ~( bep_chairman & ~beef_crank ) ) ) | ~( ~( ( ~( ~( ~solder_haze ) & ( ~pomodoro_hulk ^ ~elephant_mine ) ) ) ) ) ) ) ? ( ~( crab_hp ) | hinge_sears ) & ~( ~( ( sweetie_att ^ gin_gulp & ~( ~wiggum_curie ) ) ) ) : ~( ( ~( ~( ~att_leviticus ) & ~( ~drdeath_chuck ) ^ ~krabapple_emu & ~( ( ~( ~foryou_jxnbox & ~onion_peta | ~( ~rerun_filch ) ) ) ) ) ) );
  end
// State Mek danger_jxnbox Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      danger_jxnbox <= danger_jxnbox_0;
    else
      case (danger_jxnbox)
        danger_jxnbox_0: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 2)
            danger_jxnbox <= danger_jxnbox_10;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 5)
            danger_jxnbox <= danger_jxnbox_1;
          else
            danger_jxnbox <= danger_jxnbox_0;
          end
        danger_jxnbox_1: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 11)
            danger_jxnbox <= danger_jxnbox_4;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 14)
            danger_jxnbox <= danger_jxnbox_1;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 4)
            danger_jxnbox <= danger_jxnbox_6;
          else
            danger_jxnbox <= danger_jxnbox_1;
          end
        danger_jxnbox_2: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 1)
            danger_jxnbox <= danger_jxnbox_4;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 11)
            danger_jxnbox <= danger_jxnbox_6;
          else
            danger_jxnbox <= danger_jxnbox_2;
          end
        danger_jxnbox_3: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 15)
            danger_jxnbox <= danger_jxnbox_9;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 10)
            danger_jxnbox <= danger_jxnbox_5;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 1)
            danger_jxnbox <= danger_jxnbox_1;
          else
            danger_jxnbox <= danger_jxnbox_3;
          end
        danger_jxnbox_4: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 4)
            danger_jxnbox <= danger_jxnbox_1;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 0)
            danger_jxnbox <= danger_jxnbox_8;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 5)
            danger_jxnbox <= danger_jxnbox_8;
          else
            danger_jxnbox <= danger_jxnbox_4;
          end
        danger_jxnbox_5: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 8)
            danger_jxnbox <= danger_jxnbox_1;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 9)
            danger_jxnbox <= danger_jxnbox_2;
          else
            danger_jxnbox <= danger_jxnbox_5;
          end
        danger_jxnbox_6: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 8)
            danger_jxnbox <= danger_jxnbox_7;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 9)
            danger_jxnbox <= danger_jxnbox_2;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 13)
            danger_jxnbox <= danger_jxnbox_3;
          else
            danger_jxnbox <= danger_jxnbox_6;
          end
        danger_jxnbox_7: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 13)
            danger_jxnbox <= danger_jxnbox_8;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 6)
            danger_jxnbox <= danger_jxnbox_1;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 12)
            danger_jxnbox <= danger_jxnbox_1;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 11)
            danger_jxnbox <= danger_jxnbox_10;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 3)
            danger_jxnbox <= danger_jxnbox_8;
          else
            danger_jxnbox <= danger_jxnbox_7;
          end
        danger_jxnbox_8: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 10)
            danger_jxnbox <= danger_jxnbox_5;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 11)
            danger_jxnbox <= danger_jxnbox_2;
          else
            danger_jxnbox <= danger_jxnbox_8;
          end
        danger_jxnbox_9: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 11)
            danger_jxnbox <= danger_jxnbox_7;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 10)
            danger_jxnbox <= danger_jxnbox_2;
          else
            danger_jxnbox <= danger_jxnbox_9;
          end
        danger_jxnbox_10: begin
          if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 4)
            danger_jxnbox <= danger_jxnbox_7;
          else if ({rubik_centaur,gin_gulp,vcc,beef_hawaii} == 11)
            danger_jxnbox <= danger_jxnbox_10;
          else
            danger_jxnbox <= danger_jxnbox_10;
          end
        default: danger_jxnbox <= danger_jxnbox_0;
      endcase
  end

// State Mek danger_jxnbox Output logic
always @(danger_jxnbox)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (danger_jxnbox[3:1])
        danger_jxnbox_0: begin
            touch_legos = 1;
            sun_eatem = 0;
            oscar_famulan = 0;
            burning_bono = 0;
            ebay_speeding = 0;
            biker_thor = 0;
            isle_foliage = 0;
            bono_minerva = 0;
            pixie_asahi = 0;
            testyour_duck = 0;
            prison_moron = 0;
            sheep_lao = 0;
          end
        danger_jxnbox_1: begin
            touch_legos = 0;
            sun_eatem = 1;
            oscar_famulan = 0;
            burning_bono = 0;
            ebay_speeding = 0;
            biker_thor = 0;
            isle_foliage = 0;
            bono_minerva = 0;
            pixie_asahi = 0;
            testyour_duck = 0;
            prison_moron = 0;
            sheep_lao = 1;
          end
        danger_jxnbox_2: begin
            touch_legos = 0;
            sun_eatem = 0;
            oscar_famulan = 1;
            burning_bono = 0;
            ebay_speeding = 0;
            biker_thor = 0;
            isle_foliage = 0;
            bono_minerva = 0;
            pixie_asahi = 0;
            testyour_duck = 0;
            prison_moron = 0;
            sheep_lao = 1;
          end
        danger_jxnbox_3: begin
            touch_legos = 1;
            sun_eatem = 1;
            oscar_famulan = 0;
            burning_bono = 0;
            ebay_speeding = 1;
            biker_thor = 0;
            isle_foliage = 0;
            bono_minerva = 0;
            pixie_asahi = 1;
            testyour_duck = 1;
            prison_moron = 0;
            sheep_lao = 1;
          end
        danger_jxnbox_4: begin
            touch_legos = 0;
            sun_eatem = 0;
            oscar_famulan = 1;
            burning_bono = 0;
            ebay_speeding = 0;
            biker_thor = 1;
            isle_foliage = 1;
            bono_minerva = 1;
            pixie_asahi = 1;
            testyour_duck = 1;
            prison_moron = 1;
            sheep_lao = 0;
          end
        default: begin
            touch_legos = 1;
            sun_eatem = 0;
            oscar_famulan = 1;
            burning_bono = 1;
            ebay_speeding = 1;
            biker_thor = 0;
            isle_foliage = 1;
            bono_minerva = 0;
            pixie_asahi = 0;
            testyour_duck = 1;
            prison_moron = 1;
            sheep_lao = 0;
          end
      endcase
  end

// 3 by 6 to 5 bit A*B mult
reg signed [2:0] ohno_grams_a;
always @(eggsalad_roe or vcc or grumby_deng) begin
  ohno_grams_a = {eggsalad_roe,vcc,grumby_deng};
end

reg  [5:0] ohno_grams_b;
always @(kana_dorkus or gnd or scotland_bush or rerun_hinge or pomodoro_hulk or ring_abel) begin
  ohno_grams_b = {kana_dorkus,gnd,scotland_bush,rerun_hinge,pomodoro_hulk,ring_abel};
end

always @(ohno_grams_a or ohno_grams_b)
  begin
      {kana_tapered,satanist_zed,milo_deng,jacques_tank,bcdcensor_dig} = 
	  	  ohno_grams_a * 
		  ~ohno_grams_b;
  end

// 4 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {intel_itchy,clay_cuckoo,porfavor_odin,huey_drevil} <= 0;
    else if (vcc)
      {intel_itchy,clay_cuckoo,porfavor_odin,huey_drevil} <= {intel_itchy,clay_cuckoo,porfavor_odin,huey_drevil} + 1;
    else
      {intel_itchy,clay_cuckoo,porfavor_odin,huey_drevil} <= {intel_itchy,clay_cuckoo,porfavor_odin,huey_drevil} - 1;
  end

// AND all of these bits together
always @(gnd or usa_huey or gnd or clay_cuckoo or grumby_deng or bono_minerva or testyour_duck or ebay_speeding or gnd or moulin_deuce)
  begin
      troll_hut = & {gnd,usa_huey,gnd,clay_cuckoo,grumby_deng,bono_minerva,testyour_duck,ebay_speeding,gnd,moulin_deuce};
  end

// 7 bit SOP selector
always @(
        atoms_whacky or tonks_uniform  or 
        testyour_duck or ants_cuckoo  or 
        lamer_rufus or lagoon_dork  or 
        gnd or gnd  or 
        witch_joseph or kangaroo_bolt  or 
        rubik_centaur or fsncens_spyro  or 
        gnd or vcc 
)

begin
    speedyg_sand = 
      atoms_whacky & tonks_uniform |
      testyour_duck & ants_cuckoo |
      lamer_rufus & lagoon_dork |
      gnd & gnd |
      witch_joseph & kangaroo_bolt |
      rubik_centaur & fsncens_spyro |
      gnd & vcc;
end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      show_peace <= 0;
    else
    case ({isle_foliage,vcc})
       0 : show_peace <= lamer_rufus;
       1 : show_peace <= show_peace;
       2 : show_peace <= show_peace;
       3 : show_peace <= show_peace;
       default : show_peace <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      safeway_kappa <= 0;
    else
    case ({marquis_bolt,jacques_tank})
       0 : safeway_kappa <= snape_pizza;
       1 : safeway_kappa <= vcc;
       2 : safeway_kappa <= safeway_kappa;
       3 : safeway_kappa <= safeway_kappa;
       default : safeway_kappa <= 0;
    endcase
  end

reg feedback_pt_607;

always @(troll_hans or feedback_pt_607)
  begin
      drax_rafting =  troll_hans ^ !feedback_pt_607;
  end

reg feedback_pt_608;

always @(gnd or feedback_pt_608)
  begin
      chief_tobe = !gnd ^  feedback_pt_608;
  end

reg feedback_pt_609;

always @(kana_tapered or feedback_pt_609)
  begin
      obiwan_monkey = !kana_tapered & !feedback_pt_609;
  end

reg feedback_pt_610;

always @(hiswife_moe or feedback_pt_610)
  begin
      martin_emu = !hiswife_moe & !feedback_pt_610;
  end

reg feedback_pt_611;

always @(vcc or feedback_pt_611)
  begin
      ozzy_snape = !vcc &  feedback_pt_611;
  end

reg feedback_pt_612;

always @(marquis_bolt or feedback_pt_612)
  begin
      jonas_nigiri =  marquis_bolt &  feedback_pt_612;
  end

reg feedback_pt_613;

always @(beef_bismuth or feedback_pt_613)
  begin
      moses_marge = !beef_bismuth & !feedback_pt_613;
  end

reg feedback_pt_614;

always @(gm_grams or feedback_pt_614)
  begin
      pacbell_curie = !gm_grams ^ !feedback_pt_614;
  end

reg feedback_pt_615;

always @(vcc or feedback_pt_615)
  begin
      meth_burner =  vcc |  feedback_pt_615;
  end

reg feedback_pt_616;

always @(speedyg_sand or feedback_pt_616)
  begin
      gap_foiled = !speedyg_sand | !feedback_pt_616;
  end

reg feedback_pt_617;

always @(beef_hawaii or feedback_pt_617)
  begin
      madeye_rescue =  beef_hawaii | !feedback_pt_617;
  end

reg feedback_pt_618;

always @(george_bullet or feedback_pt_618)
  begin
      moreand_enoch =  george_bullet & !feedback_pt_618;
  end

reg feedback_pt_619;

always @(moses_marge or feedback_pt_619)
  begin
      plague_buddha = !moses_marge ^  feedback_pt_619;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jcrew_eel <= 0;
    else if (blueled_kilo)
      jcrew_eel <= 0;
    else if (rum_waster)
      jcrew_eel <= century_delta;
  end

always @(jcrew_eel)
  begin
      feedback_pt_607 = jcrew_eel;
  end

always @(jcrew_eel)
  begin
      feedback_pt_608 = jcrew_eel;
  end

always @(jcrew_eel)
  begin
      feedback_pt_609 = jcrew_eel;
  end

always @(jcrew_eel)
  begin
      feedback_pt_610 = jcrew_eel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_illegal <= 1;
    else
      oscar_illegal <= gnd;
  end

always @(oscar_illegal)
  begin
      feedback_pt_611 = oscar_illegal;
  end

wire romex_india_wire;

dffeas romex_india_ff (
  .clk(clock1),
  .d(ebay_speeding),
  .ena(ozzy_snape),
  .sclr(vcc),
  .sload(yoku_ebi),
  .asdata(minnow_sand),
  .clrn(!reset1),
  .q(romex_india_wire)
);

always @(romex_india_wire) begin
   picture_att = romex_india_wire;
end

always @(picture_att)
  begin
      feedback_pt_612 = picture_att;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_vampire <= 0;
    else if (blueled_kilo)
      tobe_vampire <= gnd;
  end

always @(tobe_vampire)
  begin
      feedback_pt_613 = tobe_vampire;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sake_blue <= 0;
    else if (moreand_enoch)
      sake_blue <= plague_buddha;
  end

always @(sake_blue)
  begin
      feedback_pt_614 = sake_blue;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sun_jacuzzi <= 0;
    else if (juliet_rod)
      sun_jacuzzi <= vcc;
    else if (drdeath_chuck)
      sun_jacuzzi <= 0;
  end

always @(sun_jacuzzi)
  begin
      feedback_pt_615 = sun_jacuzzi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ariel_giants <= 0;
    else if (bcdcensor_dig)
      ariel_giants <= prison_moron;
  end

always @(ariel_giants)
  begin
      feedback_pt_616 = ariel_giants;
  end

wire crank_juliet_wire;

dffea crank_juliet_ff (
  .clk(clock1),
  .d(jonas_nigiri),
  .ena(vcc),
  .adata(tobe_vampire),
  .clrn(!reset1),
  .q(crank_juliet_wire)
);

always @(crank_juliet_wire) begin
   beef_rufus = crank_juliet_wire;
end

always @(beef_rufus)
  begin
      feedback_pt_617 = beef_rufus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rod_maryann <= 0;
    else
      rod_maryann <= unicorn_alpha;
  end

always @(rod_maryann)
  begin
      feedback_pt_618 = rod_maryann;
  end

wire bull_pacific_wire;

dffeas bull_pacific_ff (
  .clk(clock1),
  .d(burnout_tuna),
  .ena(drax_rafting),
  .sclr(biker_thor),
  .sload(drax_rafting),
  .asdata(potato_larry),
  .clrn(!reset1),
  .q(bull_pacific_wire)
);

always @(bull_pacific_wire) begin
   bep_vulture = bull_pacific_wire;
end

always @(bep_vulture)
  begin
      feedback_pt_619 = bep_vulture;
  end

wire peace_october_wire;

dffeas peace_october_ff (
  .clk(clock1),
  .d(gnd),
  .ena(sheep_lao),
  .sclr(larry_hagrid),
  .sload(meth_burner),
  .asdata(gnd),
  .clrn(!reset1),
  .q(peace_october_wire)
);

always @(peace_october_wire) begin
   salami_howell = peace_october_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      faster_bacon <= 0;
    else if (solder_haze)
      faster_bacon <= 0;
    else if (blueled_kilo)
      faster_bacon <= geisha_dorkus;
  end

wire stick_dog_wire;

dffeas stick_dog_ff (
  .clk(clock1),
  .d(lucent_cain),
  .ena(porfavor_odin),
  .sclr(rerun_wujing),
  .sload(chief_tobe),
  .asdata(vcc),
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
      jxnbox_bacon <= troll_hut;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mozart_tiger <= 0;
    else
      mozart_tiger <= papyrus_genji;
  end

wire crack_arthur_wire;

dffeas crack_arthur_ff (
  .clk(clock1),
  .d(gnd),
  .ena(knot_muffin),
  .sclr(show_peace),
  .sload(sogood_india),
  .asdata(bep_chairman),
  .clrn(!reset1),
  .q(crack_arthur_wire)
);

always @(crack_arthur_wire) begin
   pepsi_nihlist = crack_arthur_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_sgates <= 0;
    else if (south_ham)
      meth_sgates <= madeye_rescue;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacob_chillis <= 0;
    else if (satanist_zed)
      jacob_chillis <= 0;
    else if (jcrew_eel)
      jacob_chillis <= sinus_goofy;
  end

wire ring_tapered_wire;

dffeas ring_tapered_ff (
  .clk(clock1),
  .d(salmon_todd),
  .ena(gnd),
  .sclr(gnd),
  .sload(gnd),
  .asdata(rod_maryann),
  .clrn(!reset1),
  .q(ring_tapered_wire)
);

always @(ring_tapered_wire) begin
   cocaine_bfs = ring_tapered_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      norbert_ring <= 0;
    else if (touch_legos)
      norbert_ring <= 0;
    else if (arizona_pizza)
      norbert_ring <= gnd;
  end

wire lupin_duck_wire;

dffeas lupin_duck_ff (
  .clk(clock1),
  .d(tobe_vampire),
  .ena(moses_marge),
  .sclr(pixie_asahi),
  .sload(pepsi_nihlist),
  .asdata(jxnbox_bacon),
  .clrn(!reset1),
  .q(lupin_duck_wire)
);

always @(lupin_duck_wire) begin
   rouge_bubba = lupin_duck_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rojas_luthor <= 0;
    else if (gnd)
      rojas_luthor <= 0;
    else if (whoiswho_pig)
      rojas_luthor <= gnd;
  end

wire stirfry_bono_wire;

dffeas stirfry_bono_ff (
  .clk(clock1),
  .d(deng_gregg_a),
  .ena(intel_itchy),
  .sclr(vcc),
  .sload(marquis_bolt),
  .asdata(vcc),
  .clrn(!reset1),
  .q(stirfry_bono_wire)
);

always @(stirfry_bono_wire) begin
   intel_lumber = stirfry_bono_wire;
end

reg feedback_pt_620;

always @(show_peace or feedback_pt_620)
  begin
      cow_cow =  show_peace |  feedback_pt_620;
  end

reg feedback_pt_621;

always @(ariel_callme or feedback_pt_621)
  begin
      helena_ladder = !ariel_callme ^  feedback_pt_621;
  end

reg feedback_pt_622;

always @(gnd or feedback_pt_622)
  begin
      thread_filch = !gnd | !feedback_pt_622;
  end

reg feedback_pt_623;

always @(gnd or feedback_pt_623)
  begin
      drugs_boots = !gnd &  feedback_pt_623;
  end

reg feedback_pt_624;

always @(fufu_ulysses or feedback_pt_624)
  begin
      sears_jxnbox =  fufu_ulysses & !feedback_pt_624;
  end

reg feedback_pt_625;

always @(biker_thor or feedback_pt_625)
  begin
      enoch_hans =  biker_thor ^ !feedback_pt_625;
  end

reg feedback_pt_626;

always @(gnd or feedback_pt_626)
  begin
      pictures_sun = !gnd ^ !feedback_pt_626;
  end

reg feedback_pt_627;

always @(gnd or feedback_pt_627)
  begin
      kungfu_lucent = !gnd ^ !feedback_pt_627;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maryann_rocks <= 0;
    else
      maryann_rocks <= kangaroo_bolt;
  end

always @(maryann_rocks)
  begin
      feedback_pt_620 = maryann_rocks;
  end

wire agitator_wine_wire;

dffeas agitator_wine_ff (
  .clk(clock1),
  .d(gnd),
  .ena(kana_dorkus),
  .sclr(pacbell_curie),
  .sload(rod_maryann),
  .asdata(jxnbox_bacon),
  .clrn(!reset1),
  .q(agitator_wine_wire)
);

always @(agitator_wine_wire) begin
   riddler_tako = agitator_wine_wire;
end

always @(riddler_tako)
  begin
      feedback_pt_621 = riddler_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fortuyn_deng <= 0;
    else
      fortuyn_deng <= kana_dorkus;
  end

always @(fortuyn_deng)
  begin
      feedback_pt_622 = fortuyn_deng;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      midas_diagon <= 0;
    else if (enoch_hans)
      midas_diagon <= oscar_famulan;
  end

always @(midas_diagon)
  begin
      feedback_pt_623 = midas_diagon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ykocens_fury <= 1;
    else
      ykocens_fury <= sun_eatem;
  end

always @(ykocens_fury)
  begin
      feedback_pt_624 = ykocens_fury;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_heidi <= 0;
    else if (mine_brothers)
      ham_heidi <= oscar_famulan;
    else if (mozart_tiger)
      ham_heidi <= 0;
  end

always @(ham_heidi)
  begin
      feedback_pt_625 = ham_heidi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      macys_lion <= 0;
    else if (huey_drevil)
      macys_lion <= gnd;
  end

always @(macys_lion)
  begin
      feedback_pt_626 = macys_lion;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_brian <= 0;
    else if (enoch_hans)
      moe_brian <= maryann_rocks;
  end

always @(moe_brian)
  begin
      feedback_pt_627 = moe_brian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_atomic <= 0;
    else if (sears_jxnbox)
      fufu_atomic <= burning_bono;
    else if (gnd)
      fufu_atomic <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eel_huey <= 0;
    else if (parrot_tinker)
      eel_huey <= ariel_callme;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tako_marco <= 1;
    else
      tako_marco <= gnd;
  end

wire chevys_pork_wire;

dffeas chevys_pork_ff (
  .clk(clock1),
  .d(cocaine_bfs),
  .ena(potato_larry),
  .sclr(moses_marge),
  .sload(drax_rafting),
  .asdata(rouge_bubba),
  .clrn(!reset1),
  .q(chevys_pork_wire)
);

always @(chevys_pork_wire) begin
   kanji_bubba = chevys_pork_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_pepsi <= 0;
    else if (vcc)
      deng_pepsi <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_pilot <= 0;
    else if (macys_lion)
      fufu_pilot <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_cubish <= 0;
    else
      itchy_cubish <= clay_cuckoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_guy <= 1;
    else
      boing_guy <= obiwan_monkey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boots_theseus <= 0;
    else
      boots_theseus <= stoned_pasta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pentium_meth <= 0;
    else if (sake_blue)
      pentium_meth <= faster_snort;
    else if (parrot_tinker)
      pentium_meth <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotdog_armand <= 0;
    else if (testyour_duck)
      hotdog_armand <= pictures_sun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boitano_yak <= 0;
    else if (thread_filch)
      boitano_yak <= 0;
    else if (lucent_cain)
      boitano_yak <= macys_lion;
  end

// data words for bus muxing
wire [15:0] ocean_barney_word0_data;
wire [15:0] ocean_barney_word1_data;
wire [15:0] ocean_barney_word2_data;
wire [15:0] ocean_barney_word3_data;
wire [15:0] ocean_barney_word4_data;
assign ocean_barney_word0_data = {vcc,ham_heidi,ariel_giants,ariel_giants,hotdog_armand,gnd,fortuyn_deng,riddler_tako,intel_itchy,iron_zebra,lucent_cain,pierre_taoist,kana_dorkus,fufu_atomic,pixie_asahi,hanger_zed};
assign ocean_barney_word1_data = {eel_huey,cocaine_bfs,jacques_tank,knot_yellow,macys_lion,pirate_sheep,yoku_ebi,safeway_kappa,satanist_zed,cow_cow,intel_itchy,vcc,dork_knot,faster_bacon,martin_emu,moe_brian};
assign ocean_barney_word2_data = {gnd,gnd,pentium_meth,heidi_might,obiwan_monkey,rubik_centaur,faster_bacon,gnd,bep_chairman,vcc,picture_att,gnd,gnd,midas_diagon,gnd,intel_lumber};
assign ocean_barney_word3_data = {weevil_papa,gnd,fufu_atomic,satanist_zed,sake_rerun,geisha_dorkus,gnd,gnd,midas_diagon,gnd,kanji_bubba,gnd,kungfu_lucent,intel_itchy,beef_rufus,george_bullet};
assign ocean_barney_word4_data = {moreand_enoch,riddler_tako,drdeath_chuck,gnd,chief_tobe,meth_burner,sand_ready,kanji_bubba,fufu_pilot,cocaine_bfs,drugs_boots,vcc,ykocens_fury,norbert_ring,bep_vulture,vcc};

// select control for bus muxing
wire [22:0] ocean_barney_select;
assign ocean_barney_select = {gnd,drdeath_chuck,plague_buddha,milo_deng,milo_deng,gnd,alpha_badger,ham_heidi,boots_theseus,itchy_cubish,faster_bacon,mozart_tiger,gnd,gnd,jacob_chillis,itchy_cubish,sake_rerun,thread_filch,boitano_yak,knot_yellow,drugs_boots,satanist_zed,palm_wukong};


// Mux output word
reg [15:0] ocean_barney_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    ocean_barney_result = ocean_barney_word0_data;
    if (ocean_barney_select == 14)
        ocean_barney_result = 198;

    if (ocean_barney_select == 76)
        ocean_barney_result = 0;

    if (ocean_barney_select == 160)
        ocean_barney_result = 109;

    if (ocean_barney_select == 255)
        ocean_barney_result = ~ocean_barney_word2_data;

    if (ocean_barney_select[19] && ocean_barney_select[19])
        ocean_barney_result = ocean_barney_word1_data;

    if (ocean_barney_select == 35)
        ocean_barney_result = 0;

    if (ocean_barney_select[11] && ocean_barney_select[11])
        ocean_barney_result = ocean_barney_word0_data;

    if (ocean_barney_select[3] && ocean_barney_select[3])
        ocean_barney_result = ocean_barney_word2_data;

    if (ocean_barney_select[5])
        ocean_barney_result = ocean_barney_word3_data;

    if (ocean_barney_select == 214)
        ocean_barney_result = ocean_barney_word4_data;

    if (ocean_barney_select == 219)
        ocean_barney_result = ~ocean_barney_word2_data;

end


// Send the out bus back to the world
always @(ocean_barney_result)
begin
    zed_zi = ocean_barney_result[0];
    cheez_isle = ocean_barney_result[1];
    roe_starwars = ocean_barney_result[2];
    chuck_wizard = ocean_barney_result[3];
    pepsi_valve = ocean_barney_result[4];
    floo_shrimp = ocean_barney_result[5];
    curie_xray = ocean_barney_result[6];
    tiger_water = ocean_barney_result[7];
    mars_handroll = ocean_barney_result[8];
    buddha_subway = ocean_barney_result[9];
    heidi_moreand = ocean_barney_result[10];
    purple_macys = ocean_barney_result[11];
    nigiri_nigiri = ocean_barney_result[12];
    geisha_moe = ocean_barney_result[13];
    nasdaq_fire = ocean_barney_result[14];
    covad_lost = ocean_barney_result[15];
end

// NOR all of these bits together
always @(purple_macys or curie_xray or gnd or vcc or gnd or vcc or sand_ready or boots_theseus or bep_vulture or cheez_isle or vcc or riddler_tako)
  begin
      meth_yak = ~| {purple_macys,curie_xray,gnd,vcc,gnd,vcc,sand_ready,boots_theseus,bep_vulture,cheez_isle,vcc,riddler_tako};
  end

// 3 bit priority MUX
always @(
        alpha_badger or deng_gregg_a  or 
        vcc or vcc  or 
        vcc or gnd 
)

  begin
    if (alpha_badger) potter_covad = deng_gregg_a;
    else if (vcc) potter_covad = vcc;
    else if (vcc) potter_covad = gnd;
    else potter_covad = 0;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      prison_icarus <= 0;
    else
    case ({chuck_wizard,heidi_moreand})
       0 : prison_icarus <= isle_foliage;
       1 : prison_icarus <= prison_icarus;
       2 : prison_icarus <= vcc;
       3 : prison_icarus <= tiger_water;
       default : prison_icarus <= 0;
    endcase
  end

reg feedback_pt_628;

always @(floo_shrimp or feedback_pt_628)
  begin
      spain_vegas =  floo_shrimp ^ !feedback_pt_628;
  end

reg feedback_pt_629;

always @(prison_icarus or feedback_pt_629)
  begin
      drax_the_pope = !prison_icarus & !feedback_pt_629;
  end

reg feedback_pt_630;

always @(purple_macys or feedback_pt_630)
  begin
      albus_china = !purple_macys |  feedback_pt_630;
  end

reg feedback_pt_631;

always @(spain_vegas or feedback_pt_631)
  begin
      tracy_think = !spain_vegas & !feedback_pt_631;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_fury <= 1;
    else
      bagel_fury <= meth_sgates;
  end

always @(bagel_fury)
  begin
      feedback_pt_628 = bagel_fury;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      troll_green <= 0;
    else if (gnd)
      troll_green <= tobe_vampire;
    else if (carolina_acid)
      troll_green <= 0;
  end

always @(troll_green)
  begin
      feedback_pt_629 = troll_green;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lsd_huey <= 0;
    else if (vcc)
      lsd_huey <= testyour_duck;
  end

always @(lsd_huey)
  begin
      feedback_pt_630 = lsd_huey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dorkus_fang <= 0;
    else if (nasdaq_fire)
      dorkus_fang <= 0;
    else if (gnd)
      dorkus_fang <= clay_cuckoo;
  end

always @(dorkus_fang)
  begin
      feedback_pt_631 = dorkus_fang;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ozzy_ulysses <= 1;
    else
      ozzy_ulysses <= floo_shrimp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      amex_richard <= 0;
    else if (gnd)
      amex_richard <= boing_guy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bfi_billnted <= 0;
    else if (quail_pirate)
      bfi_billnted <= 0;
    else if (lsd_huey)
      bfi_billnted <= boots_theseus;
  end

wire rubeus_goblin_wire;

dffea rubeus_goblin_ff (
  .clk(clock1),
  .d(palm_wukong),
  .ena(vcc),
  .adata(drugs_boots),
  .clrn(!reset1),
  .q(rubeus_goblin_wire)
);

always @(rubeus_goblin_wire) begin
   ebay_kedavra = rubeus_goblin_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bomb_pop_pyro <= 0;
    else if (tracy_think)
      bomb_pop_pyro <= 0;
    else if (lsd_huey)
      bomb_pop_pyro <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_mickey <= 1;
    else
      ham_mickey <= tiger_water;
  end

wire pierre_eagle_wire;

dffea pierre_eagle_ff (
  .clk(clock1),
  .d(gnd),
  .ena(vcc),
  .adata(papyrus_genji),
  .clrn(!reset1),
  .q(pierre_eagle_wire)
);

always @(pierre_eagle_wire) begin
   enoch_amex = pierre_eagle_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yoda_kaisha <= 0;
    else if (clay_cuckoo)
      yoda_kaisha <= gnd;
    else if (heidi_might)
      yoda_kaisha <= 0;
  end

// Tristate output pin with reg feedback
  bufif0 (aladdin_curie, boots_theseus, gnd);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(posedge clock1 or posedge reset1) begin
    if (reset1) venus_homerun <= 0;
    else if (!gnd) venus_homerun <= !aladdin_curie;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [4:0] iguana_east_dout;
nut_000_word_swap #(5, 9) nut_000_word_swap_inst_iguana_east (
  .data_in({palm_wukong,ozzy_ulysses,vcc,satanist_zed,satanist_zed,vcc,nigiri_nigiri,covad_lost,bep_vulture,drugs_boots,gnd,gnd,bush_zhuang,thread_filch,gnd,tako_marco,dorkus_fang,gnd,boitano_yak,thread_filch,vcc,elguapo_yoda,zed_zi,yoda_kaisha,mars_handroll,venus_homerun,troll_green,vcc,ebay_kedavra,vcc,vcc,gnd,pepsi_valve,maryann_rocks,isle_foliage,chuck_wizard,boitano_yak,gnd,itchy_cubish,itchy_cubish,gnd,tiger_water,vcc,vcc,rouge_bubba}),
  .index_a({nasdaq_fire,sake_rerun,riddler_tako,vcc,quail_pirate}),
  .index_b({potter_covad,ozzy_ulysses,thread_filch,roe_starwars,boots_theseus}),
  .data_out(iguana_east_dout)
);

always @(iguana_east_dout)
begin
   {fascist_bambi,zinc_blessyou,homer_abraham,togos_jonas,emu_isle,money_desert,bach_aladdin,vulture_east,drunken_clay,romex_weapons,draco_sortout,llama_cuanto,too_big_goofy,hours_acid,oitcen_wicked,desade_arthur,picante_pizza,mine_green,feynman_xray,minnie_beavis,comrade_sand,vegan_possum,hanger_tango,jxnbox_hp,bacon_kanji,wheezer_boots,rod_rewire,porfavor_fury,doc_leidiot,salsa_otter,hotdog_enoch,maki_ring,love_in_fish,donut_hoser,malfoy_float,fufu_ebay,tobe_goofy,bravo_gopher,roid_handroll,weasley_goat,hummer_wiggum,sanity_foiled,po_kidnapper,dirk_whiskey,monkey_solder} = iguana_east_dout;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [15:0] lotus_potter_dout;
nut_000_word_swap #(16, 7) nut_000_word_swap_inst_lotus_potter (
  .data_in({tobe_goofy,donut_hoser,vcc,martin_emu,salami_howell,picante_pizza,vcc,gnd,roe_starwars,nasdaq_fire,cheez_isle,rod_rewire,doc_leidiot,albus_china,oscar_illegal,fufu_ebay,feynman_xray,geisha_moe,tobe_vampire,gnd,testyour_duck,gnd,heidi_might,boots_theseus,vegan_possum,intel_lumber,ozzy_ulysses,wheezer_boots,enoch_amex,draco_sortout,gnd,wheezer_boots,isle_foliage,carolina_acid,maki_ring,romex_weapons,jxnbox_hp,po_kidnapper,llama_cuanto,gnd,porfavor_fury,sheep_lao,chuck_wizard,enoch_amex,helena_ladder,jxnbox_bacon,vcc,papyrus_genji,thread_filch,tako_marco,gnd,bagel_fury,pirate_sheep,gm_jacuzzi,gnd,boots_theseus,po_kidnapper,gnd,gnd,ham_mickey,questo_show,dirk_whiskey,salsa_otter,gnd,fufu_ebay,hotdog_enoch,fascist_bambi,too_big_goofy,bravo_gopher,fufu_ebay,money_desert,jxnbox_hp,oitcen_wicked,rojas_luthor,drax_the_pope,questo_show,enoch_amex,ham_mickey,togos_jonas,nasdaq_fire,bomb_pop_pyro,fufu_ebay,gnd,vcc,prison_icarus,gnd,clay_cuckoo,enoch_amex,gnd,mine_green,dirk_whiskey,vcc,vcc,hours_acid,gnd,vcc,vcc,papyrus_genji,romex_weapons,zinc_blessyou,hanger_tango,venus_homerun,togos_jonas,bach_aladdin,maryann_rocks,sanity_foiled,thread_filch,vcc,troll_green,gnd,malfoy_float,drugs_boots}),
  .index_a({homer_abraham,malfoy_float,riddler_tako,geisha_moe,bagel_fury,gnd,gnd,potter_covad,homer_abraham,gnd,homer_abraham,picture_att,bomb_pop_pyro,vcc,pirate_sheep,dirk_whiskey}),
  .index_b({gnd,weasley_goat,love_in_fish,love_in_fish,rouge_bubba,gnd,bravo_gopher,gnd,quail_pirate,nasdaq_fire,thread_filch,chuck_wizard,togos_jonas,gm_jacuzzi,vcc,dirk_whiskey}),
  .data_out(lotus_potter_dout)
);

always @(lotus_potter_dout)
begin
   {haze_plumber,raiders_ariel,ulysses_zulu,duck_itchy,noah_dingbat,zeus_protest,oranges_broom,sinus_ernie,sheep_chief,moulin_ceres,zulu_lumber,mao_kbtoys,donkey_ford,stick_cheez,danger_beemer,wrecker_otter,maklak_enoch,fish_beast,frog_klinton,hoser_husks,hp_drugs,nyquil_husks,foiled_hawaii,nirish_pirate,ocha_sneezy,rouge_dutch,hours_huhhuh,banshee_pasta,eggsalad_bolt,snape_subway,floo_nasdaq,iterate_rod,draco_ladder,honey_palm,donkey_gin,elf_chicken,onthepc_meth,escape_gap,eel_speedyg,cuckoo_stix,surprise_yoda,fire_papyrus,tobe_sierra,lantern_pizza,sun_badmonkey,india_rarest,honey_jacques,tabasco_eel,shuda_pixie,gilligan_kana,steaming_eel,speeding_bfi,kmfdm_shuda,oranges_ebi,lsd_potato,kappa_speedyg,zedong_tesla,nail_curly,xray_criminal,drugie_otter,bashful_curie,psycho_beavis,odin_stix,drevil_square,chillis_frog,nihlist_bart,wukong_po,goofy_kanji,pdiddy_eel,Iwin_heidi,guy_portnoy,fallen_whammy,peace_beemer,lucent_nigiri,ihilani_togos,dopey_boots,blue_llama,hut_milo,waffle_shark,gerard_indigo,chips_jjocen,willy_chevys,iron_biker,waffle_pizza,bloom_onthepc,papa_pyro,dog_dig,isle_clothing,graduated_red,barnum_mars,octapus_golf,Iwin_wiggum,pluto_ariel,iron_monkey,iron_goblin,isle_smithers,zhuang_egg,troll_bismuth,hurt_hinge,cain_ford,att_bathroom,onion_fury,barty_burnout,jason_rerun,atilla_bonker,thor_geisha,ibm_ceres,loser_leaky,palm_gopher,duck_speed,what_goblin,curie_moody} = lotus_potter_dout;
end

///////////////////////////////////////////
// Verilog subdesign in nut_000_word_swap.v
///////////////////////////////////////////

wire [8:0] rerun_lala_dout;
nut_000_word_swap #(9, 17) nut_000_word_swap_inst_rerun_lala (
  .data_in({vcc,floo_shrimp,cain_ford,onion_fury,draco_sortout,sinus_ernie,vcc,eel_speedyg,gnd,banshee_pasta,dog_dig,hummer_wiggum,jxnbox_bacon,gnd,drunken_clay,troll_bismuth,tako_marco,what_goblin,dog_dig,hotdog_enoch,blue_llama,frog_klinton,boots_theseus,wrecker_otter,donkey_ford,intel_itchy,vcc,boots_theseus,norbert_ring,wukong_po,vcc,rod_rewire,maklak_enoch,gnd,kappa_speedyg,vcc,isle_smithers,bach_aladdin,goofy_kanji,lucent_nigiri,gilligan_kana,picture_att,danger_beemer,jason_rerun,vcc,prison_icarus,gnd,roe_starwars,psycho_beavis,honey_palm,vcc,Iwin_wiggum,wukong_po,foiled_hawaii,kmfdm_shuda,curie_moody,vcc,dopey_boots,sanity_foiled,odin_stix,gnd,thor_geisha,vcc,emu_isle,cuckoo_stix,iron_biker,sake_rerun,lsd_huey,monkey_solder,jxnbox_bacon,octapus_golf,escape_gap,fish_beast,ham_mickey,mao_kbtoys,graduated_red,duck_itchy,gnd,sheep_chief,covad_lost,gnd,iron_monkey,sake_rerun,gerard_indigo,intel_itchy,bloom_onthepc,gnd,vcc,nail_curly,gnd,Iwin_heidi,pdiddy_eel,hut_milo,lsd_potato,tabasco_eel,dog_dig,peace_beemer,gnd,togos_jonas,oranges_ebi,zhuang_egg,tabasco_eel,drugie_otter,hoser_husks,vcc,gnd,odin_stix,gnd,guy_portnoy,vcc,jxnbox_bacon,atilla_bonker,eggsalad_bolt,raiders_ariel,fufu_ebay,elf_chicken,ibm_ceres,iron_goblin,psycho_beavis,gnd,speeding_bfi,nyquil_husks,desade_arthur,draco_ladder,desade_arthur,snape_subway,palm_gopher,homer_abraham,atilla_bonker,gnd,hours_huhhuh,bravo_gopher,chillis_frog,graduated_red,escape_gap,roe_starwars,gnd,vcc,potter_covad,draco_ladder,vcc,draco_ladder,potter_covad,lucent_nigiri,zhuang_egg,roid_handroll,octapus_golf,bomb_pop_pyro,hours_huhhuh,iron_biker,vcc,pirate_sheep,noah_dingbat}),
  .index_a({raiders_ariel,zulu_lumber,love_in_fish,hurt_hinge,isle_clothing,hurt_hinge,odin_stix,gnd,lsd_potato}),
  .index_b({fish_beast,bashful_curie,zedong_tesla,wukong_po,bacon_kanji,guy_portnoy,dopey_boots,ulysses_zulu,chips_jjocen}),
  .data_out(rerun_lala_dout)
);

always @(rerun_lala_dout)
begin
   {larry_hut,broom_jacob,shrimp_albus,scabbers_guy,jcrew_oracle,pepsi_papa,sapporo_fang,wine_due,golden_arthur,surfer_mexico,dipsy_mine,drax_maryann,beauty_heidi,wicked_onion,subway_lost,biker_pirate,fallen_plague,wanton_rocks,hours_captain,foryou_killme,zebra_south,haze_venus,peta_yellow,bust_north,neon_ozzy,troll_hummer,tabasco_husks,jiminy_goblin,firewalk_tako,fuji_nihlist,barty_loser,marquis_sinew,pacbell_abel,kedavra_albus,downers_cafe,rhvcens_shark,ants_asahi,knot_yankee,bear_erncenso,papa_scotch,whale_oldnavy,wildboar_west,questo_blue,tobe_cubish,tesla_cafe,llama_molokai,marker_yankee,luthor_vadar,siamese_honda,rasp_joey,drugs_otter,red_sun,bono_knockout,ants_fitter,genji_stix,penguin_cafe,blue_kappa,lala_genji,nyquil_broom,spock_egg,dog_yellow,hotel_faster,zedong_romeo,pilot_china,monkey_crab,woman_giraffe,gap_chowmein,zebra_dimetap,blaster_papa,blue_floo,zulu_barty,joey_wonder,lima_famulan,dork_tukatuk,tin_atchoo,crucio_webvan,newt_sgates,dimetap_enoch,richard_lion,kebab_subway,ohno_bomb_pop,salsa_norris,doc_bison,mine_nest,speed_brian,pdiddy_hawaii,meffert_lima,helena_sleepy,kabar_holland,hours_zealot,popcorn_bfi,obiwan_foryou,wrecker_beef,newt_yankee,troll_stirfry,martin_over,art_squad,whatelse_lima,bacon_chuck,bfs_romeo,asahi_potter,pig_rainbow,neptune_ceres,moses_pork,ritsu_orange,moron_indigo,kdqcens_ring,fury_bismuth,witch_animal,fear_homer,tattoo_cubish,square_bison,china_ramone,donut_vadar,moe_eggsalad,lemon_nasdaq,beast_golden,maryann_art,crab_kbtoys,mortar_ohisee,fish_monkey,stix_sugar,gerard_leaky,fear_tank,rojas_huey,crack_bamboo,peaves_ernie,whacky_fish,cartman_huey,fang_whack,zi_nobody,zen_bush,rabbi_vegan,arizona_rat,tesla_uniform,spyro_zeus,desert_safada,venus_what,emails_lumber,lion_muggers,avon_chemical,sneezy_sake,rubeus_tank,sleepy_jcrew,joseph_crack,cannon_klaas,duey_castaway,wanton_gerard,india_dadada,float_wakey,monkey_honda,sinew_tako,advil_victor} = rerun_lala_dout;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_michelle <= 0;
    else if (moron_indigo)
      bear_michelle <= crucio_webvan;
  end

wire baron_pork_wire;

dffeas baron_pork_ff (
  .clk(clock1),
  .d(sanity_foiled),
  .ena(knot_yankee),
  .sclr(minnie_beavis),
  .sload(bear_michelle),
  .asdata(gnd),
  .clrn(!reset1),
  .q(baron_pork_wire)
);

always @(baron_pork_wire) begin
   bep_happyists = baron_pork_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      simasu_dig <= 0;
    else if (art_squad)
      simasu_dig <= papa_scotch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      todd_bismuth <= 1;
    else
      todd_bismuth <= india_rarest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      faster_gotone <= 0;
    else if (doc_bison)
      faster_gotone <= troll_hummer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      over_chemical <= 0;
    else
      over_chemical <= gnd;
  end

wire homerun_klaas_wire;

dffea homerun_klaas_ff (
  .clk(clock1),
  .d(newt_yankee),
  .ena(zedong_romeo),
  .adata(genji_stix),
  .clrn(!reset1),
  .q(homerun_klaas_wire)
);

always @(homerun_klaas_wire) begin
   maki_bach = homerun_klaas_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      duck_sears <= 0;
    else
      duck_sears <= advil_victor;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pyro_witch <= 1;
    else
      pyro_witch <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      parrot_green <= 0;
    else
      parrot_green <= blaster_papa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      donald_supurb <= 0;
    else
      donald_supurb <= hours_zealot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gulp_would <= 1;
    else
      gulp_would <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      amadeus_hoser <= 0;
    else if (rhvcens_shark)
      amadeus_hoser <= 0;
    else if (blue_floo)
      amadeus_hoser <= india_rarest;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_tako <= 0;
    else if (kdqcens_ring)
      hp_tako <= golden_arthur;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arizona_pasta <= 0;
    else if (marker_yankee)
      arizona_pasta <= 0;
    else if (richard_lion)
      arizona_pasta <= lucent_nigiri;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turnip_green <= 1;
    else
      turnip_green <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_eatem <= 0;
    else if (nihlist_bart)
      cain_eatem <= 0;
    else if (hours_captain)
      cain_eatem <= isle_smithers;
  end

wire baron_thread_wire;

dffeas baron_thread_ff (
  .clk(clock1),
  .d(bomb_pop_pyro),
  .ena(bep_happyists),
  .sclr(wildboar_west),
  .sload(hotel_faster),
  .asdata(pluto_ariel),
  .clrn(!reset1),
  .q(baron_thread_wire)
);

always @(baron_thread_wire) begin
   rouge_isle = baron_thread_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gregg_a_life <= 0;
    else if (questo_blue)
      gregg_a_life <= 0;
    else if (scabbers_guy)
      gregg_a_life <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      callme_valve <= 0;
    else if (dipsy_mine)
      callme_valve <= meffert_lima;
    else if (guy_portnoy)
      callme_valve <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_tobe <= 0;
    else if (monkey_crab)
      bagel_tobe <= 0;
    else if (fallen_plague)
      bagel_tobe <= vcc;
  end

wire north_monkey_wire;

dffeas north_monkey_ff (
  .clk(clock1),
  .d(sanity_foiled),
  .ena(jcrew_oracle),
  .sclr(tesla_uniform),
  .sload(duck_sears),
  .asdata(vcc),
  .clrn(!reset1),
  .q(north_monkey_wire)
);

always @(north_monkey_wire) begin
   think_hippo = north_monkey_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sun_lumber <= 0;
    else if (gap_chowmein)
      sun_lumber <= 0;
    else if (zen_bush)
      sun_lumber <= crab_kbtoys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_barty <= 0;
    else if (crack_bamboo)
      oldnavy_barty <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegan_junkie <= 1;
    else
      vegan_junkie <= woman_giraffe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gulp_mortgate <= 0;
    else
      gulp_mortgate <= mortar_ohisee;
  end

wire jxnbox_mortar_wire;

dffeas jxnbox_mortar_ff (
  .clk(clock1),
  .d(pyro_witch),
  .ena(gnd),
  .sclr(hurt_hinge),
  .sload(fallen_whammy),
  .asdata(gnd),
  .clrn(!reset1),
  .q(jxnbox_mortar_wire)
);

always @(jxnbox_mortar_wire) begin
   smack_kana = jxnbox_mortar_wire;
end

wire plague_golden_wire;

dffea plague_golden_ff (
  .clk(clock1),
  .d(vcc),
  .ena(parrot_green),
  .adata(vcc),
  .clrn(!reset1),
  .q(plague_golden_wire)
);

always @(plague_golden_wire) begin
   faster_rufus = plague_golden_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      troll_norbert <= 1;
    else
      troll_norbert <= ritsu_orange;
  end

wire fufu_south_wire;

dffeas fufu_south_ff (
  .clk(clock1),
  .d(pilot_china),
  .ena(hp_tako),
  .sclr(gnd),
  .sload(duey_castaway),
  .asdata(square_bison),
  .clrn(!reset1),
  .q(fufu_south_wire)
);

always @(fufu_south_wire) begin
   gap_tan_nodes = fufu_south_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stoner_iguana <= 0;
    else if (papa_pyro)
      stoner_iguana <= tabasco_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_safada <= 0;
    else if (gnd)
      money_safada <= isle_smithers;
    else if (stoner_iguana)
      money_safada <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moses_joseph <= 0;
    else if (zebra_south)
      moses_joseph <= asahi_potter;
  end

wire ykocens_dipsy_wire;

dffeas ykocens_dipsy_ff (
  .clk(clock1),
  .d(nyquil_broom),
  .ena(gnd),
  .sclr(witch_animal),
  .sload(covad_lost),
  .asdata(peaves_ernie),
  .clrn(!reset1),
  .q(ykocens_dipsy_wire)
);

always @(ykocens_dipsy_wire) begin
   ebay_intel = ykocens_dipsy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      minnow_vangoh <= 0;
    else if (whale_oldnavy)
      minnow_vangoh <= 0;
    else if (lantern_pizza)
      minnow_vangoh <= att_bathroom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_rufus <= 0;
    else if (callme_valve)
      cain_rufus <= fuji_nihlist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonton_meth <= 0;
    else if (gnd)
      wonton_meth <= neon_ozzy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      donut_clay <= 1;
    else
      donut_clay <= nyquil_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romeo_loser <= 0;
    else if (broom_jacob)
      romeo_loser <= 0;
    else if (fuji_nihlist)
      romeo_loser <= vegan_junkie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_tracy <= 1;
    else
      lala_tracy <= joseph_crack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wiggum_lagoon <= 0;
    else
      wiggum_lagoon <= sinew_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      uppers_beauty <= 0;
    else
      uppers_beauty <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sand_nest <= 0;
    else
      sand_nest <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peta_blaster <= 0;
    else
      peta_blaster <= llama_molokai;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_hamachi <= 1;
    else
      pcp_hamachi <= fear_homer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emails_todd <= 0;
    else
      emails_todd <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      would_zinc <= 0;
    else
      would_zinc <= jcrew_oracle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_deuce <= 0;
    else if (popcorn_bfi)
      boing_deuce <= 0;
    else if (comrade_sand)
      boing_deuce <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chips_pegasus <= 0;
    else if (ohno_bomb_pop)
      chips_pegasus <= china_ramone;
    else if (donut_vadar)
      chips_pegasus <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sanity_bust <= 0;
    else
      sanity_bust <= beast_golden;
  end

wire honda_saturn_wire;

dffea honda_saturn_ff (
  .clk(clock1),
  .d(bear_michelle),
  .ena(gnd),
  .adata(bust_north),
  .clrn(!reset1),
  .q(honda_saturn_wire)
);

always @(honda_saturn_wire) begin
   sheep_callme = honda_saturn_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fury_cannon <= 0;
    else
      fury_cannon <= bfs_romeo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_genji <= 1;
    else
      newt_genji <= maki_bach;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snape_geisha <= 0;
    else
      snape_geisha <= smack_kana;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hamburger_moe <= 1;
    else
      hamburger_moe <= stix_sugar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      acid_float <= 0;
    else if (minnie_beavis)
      acid_float <= gnd;
    else if (ebay_intel)
      acid_float <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      frog_oitcen <= 0;
    else if (vcc)
      frog_oitcen <= zebra_dimetap;
    else if (gnd)
      frog_oitcen <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oracle_juliet <= 0;
    else
      oracle_juliet <= shrimp_albus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yankees_dow <= 0;
    else if (advil_victor)
      yankees_dow <= hp_tako;
  end


endmodule

