/////////////////////////////////////////////////////////////////
// Altera Corporation
//
// File - nut_002.v
// 40 inputs 75 outputs
//
//
/////////////////////////////////////////////////////////////////
module nut_002 (
// inputs
 bravo, charlie, delta, echo, quebec, romeo,
      sierra, tango, gojira, richard, yeanyow, cybex,
      babette, hanger, lumber, launcher, mortar, tank,
      red, blue, green, chicken, cow, dog,
      donkey, dragon, duck, eagle, elephant, emu,
      fish, frog, goat, jellyfish, draco, lucius,
      narcissa, pintobeans, tortilla, salsa,

     // outputs
 george, rodriguez, norris, ready_spirit, platinum_frog, vicks_bach,
      Iwin_neon, ham_vadar, pirate_flew, ceres_whale, often_faster, ladder_zinc,
      arcade_chuck, broom_kabar, ohno_minnow, whammy_armand, platinum_crab, goat_wujing,
      stix_marvin, broom_oranje, hiswife_zinc, jcrew_chips, fronds_pluto, burning_tesla,
      bear_golf, ozzy_doc, newt_devotion, todd_beavis, tonks_england, drugs_ozzy,
      killme_larry, kabar_tabby, raiders_bart, sinew_ghost, remus_fallen, rouge_plaster,
      powder_ariel, ants_edible, bert_kaisha, dipsy_odin, sears_rerun, arthur_att,
      pirate_joseph, green_bep, bravo_sapporo, egg_abel, xterm_sierra, tobe_ants,
      Iwin_ladder, rat_solder, escape_rojas, sun_mrbill, south_aspirin, togos_haze,
      turkey_sanity, lovey_ring, turtle_kilo, snort_nasdaq, charlie_ariel, mandarin_bfs,
      desert_albus, yellow_victor, crab_popcorn, fufu_bono, fufu_vangoh, lala_sanity,
      kilo_marge, sinew_wine, meth_athena, hector_mao, rat_fsncens, bart_speed,
      coconut_witch, mouse_ghost, books_rodent,

     // tristate outputs
 due_theonion, peta_willy, penguin_genji,

     clock0, clock1, reset0, reset1
);
  input bravo;
  input charlie;
  input delta;
  input echo;
  input quebec;
  input romeo;
  input sierra;
  input tango;
  input gojira;
  input richard;
  input yeanyow;
  input cybex;
  input babette;
  input hanger;
  input lumber;
  input launcher;
  input mortar;
  input tank;
  input red;
  input blue;
  input green;
  input chicken;
  input cow;
  input dog;
  input donkey;
  input dragon;
  input duck;
  input eagle;
  input elephant;
  input emu;
  input fish;
  input frog;
  input goat;
  input jellyfish;
  input draco;
  input lucius;
  input narcissa;
  input pintobeans;
  input tortilla;
  input salsa;
  input clock0, clock1, reset0, reset1;

  output george;
  output rodriguez;
  output norris;
  output ready_spirit;
  output platinum_frog;
  output vicks_bach;
  output Iwin_neon;
  output ham_vadar;
  output pirate_flew;
  output ceres_whale;
  output often_faster;
  output ladder_zinc;
  output arcade_chuck;
  output broom_kabar;
  output ohno_minnow;
  output whammy_armand;
  output platinum_crab;
  output goat_wujing;
  output stix_marvin;
  output broom_oranje;
  output hiswife_zinc;
  output jcrew_chips;
  output fronds_pluto;
  output burning_tesla;
  output bear_golf;
  output ozzy_doc;
  output newt_devotion;
  output todd_beavis;
  output tonks_england;
  output drugs_ozzy;
  output killme_larry;
  output kabar_tabby;
  output raiders_bart;
  output sinew_ghost;
  output remus_fallen;
  output rouge_plaster;
  output powder_ariel;
  output ants_edible;
  output bert_kaisha;
  output dipsy_odin;
  output sears_rerun;
  output arthur_att;
  output pirate_joseph;
  output green_bep;
  output bravo_sapporo;
  output egg_abel;
  output xterm_sierra;
  output tobe_ants;
  output Iwin_ladder;
  output rat_solder;
  output escape_rojas;
  output sun_mrbill;
  output south_aspirin;
  output togos_haze;
  output turkey_sanity;
  output lovey_ring;
  output turtle_kilo;
  output snort_nasdaq;
  output charlie_ariel;
  output mandarin_bfs;
  output desert_albus;
  output yellow_victor;
  output crab_popcorn;
  output fufu_bono;
  output fufu_vangoh;
  output lala_sanity;
  output kilo_marge;
  output sinew_wine;
  output meth_athena;
  output hector_mao;
  output rat_fsncens;
  output bart_speed;
  output coconut_witch;
  output mouse_ghost;
  output books_rodent;

//tristate outs
  output due_theonion;
  output peta_willy;
  output penguin_genji;


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



  reg foxtrot;
  reg golf;
  reg hotel;
  reg india;
  reg juliet;
  reg kilo;
  reg lima;
  reg mike;
  reg november;
  reg oscar;
  reg papa;
    parameter alpha_0 = 0,alpha_1 = 1,alpha_2 = 2,alpha_3 = 3,alpha_4 = 4,alpha_5 = 5,alpha_6 = 6,alpha_7 = 7,alpha_8 = 8,alpha_9 = 9,alpha_10 = 10,alpha_11 = 11;
    reg [3:0] alpha;

  reg uniform;
  reg victor;
  reg whiskey;
  reg xray;
  reg yankee;
  reg zulu;
  reg bomb_pop;
  reg for_gregg;
  reg adbcensor;
  reg rubik;
  reg hinge;
  reg nail;
  reg bolt;
  reg cannon;
  reg mine;
  reg bullet;
  reg aphid;
  reg badger;
  reg bear;
  reg beetle;
  reg bison;
  reg bull;
  reg cassowary;
  reg cat;
    parameter marker_0 = 0,marker_1 = 1,marker_2 = 2,marker_3 = 3;
    reg [3:0] marker;

  reg eel;
  reg hippo;
  reg kangaroo;
  reg lion;
  reg lizard;
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
  reg loser;
  reg potato;
  reg nuclear;
  reg bathroom;
  reg popcorn;
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
  reg deuteronomy;
  reg xterm;
  reg numbers;
  reg noah;
  reg bagel;
  reg english;
  reg muffin;
  reg ceres;
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
  reg jesus;
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
  reg beavis;
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
  reg drunken;
  reg master;
  reg flew;
    parameter hoser_0 = 0,hoser_1 = 1,hoser_2 = 2,hoser_3 = 3,hoser_4 = 4,hoser_5 = 5,hoser_6 = 6,hoser_7 = 7,hoser_8 = 8,hoser_9 = 9;
    reg [3:0] hoser;

  reg cuckoo;
  reg nest;
  reg starwars;
  reg yoda;
  reg obiwan;
  reg vadar;
    parameter over_0 = 0,over_1 = 1,over_2 = 2,over_3 = 3,over_4 = 4,over_5 = 5,over_6 = 6,over_7 = 7;
    reg [3:0] over;

  reg skywalker;
  reg southern;
  reg west;
  reg cuanto;
  reg pantalones;
  reg popacap;
  reg mushroom;
  reg mcnugget;
  reg spirit;
  reg pyro;
  reg orange;
  reg yellow;
  reg paper;
  reg indigo;
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
  reg ring;
  reg think;
  reg firewiggle;
  reg bracket;
  reg probably;
  reg shudamak;
  reg callme;
  reg fuji;
  reg emails;
  reg dadada;
  reg conference;
  reg workhere;
  reg onthepc;
  reg mariollama;
  reg rafting;
  reg freaky;
  reg davidlin;
  reg blueled;
  reg pirate;
  reg prison;
  reg marquis;
  reg desade;
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
  reg copper;
  reg zinc;
  reg platinum;
  reg tin;
  reg iron;
  reg anarchist;
  reg capitalist;
  reg socialist;
  reg moderate;
  reg floating;
  reg drevil;
  reg erncenso;
  reg fsncens;
  reg tinker;
  reg lunchtime;
  reg roosevelt;
  reg hxncensorce;
  reg opus;
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
  reg supurb;
  reg waydeelect;
  reg iwocensor;
  reg secondrate;
  reg thedon;
  reg marco;
  reg ham;
  reg mandarin;
  reg ihilani;
  reg october;
  reg tracy;
  reg jjocen;
  reg meffert;
  reg bismuth;
  reg floride;
  reg pyromaniac;
  reg waster;
  reg burner;
  reg crackhead;
  reg stoner;
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
    parameter drugie_0 = 0,drugie_1 = 1,drugie_2 = 2,drugie_3 = 3,drugie_4 = 4,drugie_5 = 5;
    reg [3:0] drugie;

  reg fury;
  reg tobe;
  reg simasu;
  reg pictures;
  reg show;
  reg gokidsgo;
  reg winner;
  reg hiway;
  reg kdqcens;
  reg gotone;
  reg sogood;
  reg faster;
  reg elementary;
  reg sixyears;
  reg graduated;
  reg overeducated;
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
  reg wine;
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
  reg krabapple;
  reg tarzan;
  reg moe;
  reg comicbook;
  reg worstdesignever;
  reg flanders;
  reg heidi;
  reg steaming;
  reg milhouse;
  reg todd;
  reg chewbacca;
  reg tukatuk;
  reg slobbering;
  reg weevil;
  reg psucensorc;
  reg deuce;
  reg eeevil;
  reg intuit;
  reg bert;
  reg ernie;
  reg snuffleupagus;
  reg peta;
  reg happyists;
  reg firemonkey;
  reg qfvcensorce;
  reg captain;
  reg rhvcens;
  reg roid;
  reg itchy;
  reg squad;
  reg joey;
    parameter atomic_0 = 0,atomic_1 = 1,atomic_2 = 2,atomic_3 = 3,atomic_4 = 4,atomic_5 = 5,atomic_6 = 6,atomic_7 = 7,atomic_8 = 8;
    reg [3:0] atomic;

  reg ramone;
  reg often;
  reg edible;
  reg srvcensorce;
  reg on_sale;
  reg aisle_two;
  reg dinoblaster;
  reg crunchyfrog;
  reg nobody;
  reg expects_the;
  reg inquisition;
  reg chief;
  reg weapons;
  reg fear;
  reg surprise;
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
  reg guy;
  reg partners;
  reg cubish;
  reg solder;
  reg valve;
  reg furnace;
  reg leaky;
  reg potter;
  reg drax;
  reg killme;
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
  reg yellowtail;
  reg crab;
  reg nigiri;
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
  reg harrydavid;
  reg pepsi;
  reg att;
  reg tsmc;
  reg papyrus;
  reg sharperimg;
  reg honda;
  reg pimpernel;
  reg kbtoys;
  reg toysrus;
  reg gap;
  reg bananarep;
  reg oldnavy;
  reg clothing;
  reg starbucks;
  reg structure;
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
  reg nyquil;
  reg dimetap;
  reg coughsyrup;
  reg vicks;
  reg comtrex;
  reg aspirin;
  reg advil;
  reg tylenol;
  reg sinus;
  reg sinew;
  reg snort;
  reg pcp;
  reg phenyalanine;
  reg saccarine;
  reg nutrasweet;
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
  reg theseus;
  reg minotaur;
  reg icarus;
  reg pegasus;
  reg warlock;
  reg chowmein;
  reg stirfry;
  reg pastrami;
  reg turkey;
  reg beast;
  reg bacon;
  reg peaves;
  reg snape;
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
    parameter malfoy_0 = 0,malfoy_1 = 1,malfoy_2 = 2,malfoy_3 = 3,malfoy_4 = 4,malfoy_5 = 5,malfoy_6 = 6,malfoy_7 = 7,malfoy_8 = 8;
    reg [3:0] malfoy;

  reg mario_owes;
  reg burrito;
  reg cafe;
  reg guacamole;
  reg sourcream;
  reg onion;
  reg jalapeno;
  reg beef;
  reg pork;
  reg blackbeans;
  reg refriedbeans;
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
  reg gerrit;
  reg dirk;
  reg klaas;
  reg hans;
  reg gerard;
  reg microscope;
  reg erasmus;
  reg vangoh;
  reg fortuyn;
  reg schwinger;
  reg feynman;
  reg automounter;
  reg boing;
  reg pixie;
  reg stix;
  reg tango_loud;
  reg cluckU_fuji;
  reg sun_milhouse;
  reg bomb_yak;
  reg romex_dingbat;
  reg sand_baron;
  reg nyc_rubeus;
  reg protest_bfs;
  reg danger_star;
  reg cain_jupiter;
  reg peace_boots;
  reg kang_usa;
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
  reg bach_onion;
  reg chuck_golf;
  reg foxtrot_ring;
  reg red_barty;
  reg nyc_foliage;
  reg pluto_exodus;
  reg shark_avon;
  reg marge_killme;
  reg ostrich_gap;
  reg helena_sinus;
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
  reg moody_opus;
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
  reg shemp_floride;
  reg bathroom_elf;
  reg goblin_bear;
  reg parrot_eeevil;
  reg quebec_webvan;
  reg lsd_turnip;
  reg danger_pig;
  reg lotus_sgates;
  reg pimpernel_moe;
  reg dopey_tattoo;
  reg rasp_stoned;
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
  reg popcorn_advil;
  reg gerard_kungfu;
  reg whale_malfoy;
  reg stoned_sake;
  reg tylenol_otter;
  reg yankee_hoser;
  reg bush_wiggles;
  reg west_eatem;
  reg kappa_zed;
  reg beast_uppers;
  reg blue_aphid;
  reg tasty_ebi;
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
  reg metal_dog;
  reg tabby_moses;
  reg kanji_uppers;
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
  reg todd_malfoy;
  reg hulk_booming;
  reg eunice_eunice;
  reg marco_thread;
  reg sanity_fallen;
  reg dopey_bomb;
  reg ebi_bubba;
  reg roid_kungfu;
  reg hans_ritsu;
  reg rewire_bubba;
  reg wildboar_mao;
  reg money_donut;
  reg freaky_amex;
  reg waffle_midas;
  reg wizard_norris;
  reg tango_would;
  reg black_kebab;
  reg show_bacon;
  reg coffee_wujing;
  reg master_elf;
  reg cartman_hurt;
  reg purple_maki;
  reg lala_agitator;
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
  reg midas_macys;
  reg zed_orange;
  reg drevil_spirit;
  reg ulysses_nyc;
  reg mine_ostrich;
  reg art_zed;
  reg what_intel;
  reg gopher_minnow;
  reg neon_snape;
  reg rufus_advil;
  reg zedong_lucius;
  reg sake_bullet;
  reg chairman_bfs;
  reg sgates_thedon;
  reg hulk_atomic;
  reg peace_broom;
  reg boing_illegal;
  reg nobody_martin;
  reg kang_minnie;
  reg fortuyn_lamer;
  reg pacific_asahi;
    parameter foryou_rubik_0 = 0,foryou_rubik_1 = 1,foryou_rubik_2 = 2,foryou_rubik_3 = 3,foryou_rubik_4 = 4,foryou_rubik_5 = 5,foryou_rubik_6 = 6,foryou_rubik_7 = 7,foryou_rubik_8 = 8,foryou_rubik_9 = 9,foryou_rubik_10 = 10;
    reg [3:0] foryou_rubik;

  reg todd_pictures;
  reg holland_haze;
  reg dopey_sinew;
  reg platinum_haze;
  reg iterate_sugar;
  reg thor_cucumber;
  reg south_toysrus;
  reg cain_intel;
  reg dragon_malfoy;
  reg sanity_tarzan;
  reg covad_ocha;
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
  reg trevor_wanton;
  reg lagoon_broom;
  reg tinker_sheep;
  reg lizard_kanji;
  reg foxtrot_sears;
  reg sheep_bart;
  reg chief_peta;
  reg west_powder;
  reg jacob_malfoy;
  reg dimetap_bagel;
  reg neville_po;
  reg trevor_thread;
  reg zen_tako;
  reg curie_macys;
  reg nasdaq_ebay;
  reg zulu_baron;
  reg peaves_squad;
  reg fury_grams;
  reg lotus_golf;
  reg rocks_ohisee;
  reg jonas_monster;
  reg hotel_macys;
  reg roe_abraham;
  reg tinker_george;
  reg pig_budlite;
  reg babette_crank;
  reg chillis_peace;
  reg lima_hummer;
  reg bolt_foliage;
  reg severus_valve;
  reg llama_palm;
  reg might_what;
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
  reg maklak_waffle;
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
  reg lucius_drax;
  reg kappa_rufus;
  reg safeway_nest;
  reg biker_bono;
  reg kilo_rojas;
  reg green_gm;
  reg often_master;
  reg floating_guy;
  reg hawaii_danger;
  reg life_atchoo;
  reg noah_mexican;
  reg daughter_lisa;
  reg bfs_star;
  reg oscar_nyquil;
  reg tako_fortuyn;
  reg atoms_filch;
  reg zed_weevil;
  reg rescue_sun;
  reg haze_smithers;
  reg burner_mrbill;
  reg squad_wukong;
  reg malfoy_nyc;
  reg dork_porfavor;
  reg often_downers;
  reg sake_billnted;
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
  reg oldnavy_romex;
  reg paper_english;
  reg hawaii_plague;
  reg po_yellowtail;
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
  reg bear_speedyg;
  reg yeanyow_atoms;
  reg cain_wiggles;
  reg zedong_coffee;
  reg illegal_duck;
  reg square_hagrid;
  reg vegan_floo;
  reg chainsaw_clay;
  reg nyc_pizza;
  reg mars_monkey;
  reg ramone_amex;
  reg remus_vicks;
  reg penguin_cheez;
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
    parameter turkey_tank_0 = 0,turkey_tank_1 = 1,turkey_tank_2 = 2,turkey_tank_3 = 3;
    reg [3:0] turkey_tank;

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
  reg gyro_love_in;
  reg spyro_lotus;
  reg popcorn_whack;
  reg eagle_beef;
  reg riddler_hans;
  reg bear_morrison;
  reg dow_blue;
  reg george_hp;
  reg opus_riddler;
  reg pizza_rose;
  reg kilo_autotest;
  reg fitter_pilot;
  reg bravo_exodus;
  reg golfland_roid;
  reg beemer_floo;
  reg vicks_tracy;
  reg escape_jesus;
  reg dragon_broom;
  reg burner_bfi;
  reg abraham_albus;
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
  reg square_cubish;
  reg dig_fsncens;
  reg lao_shudamak;
  reg hawaii_marco;
  reg palmer_bust;
  reg rodriguez_guy;
  reg marco_orange;
  reg bep_defoliant;
  reg what_eel;
  reg happy_mortar;
  reg bravo_arcade;
  reg chowmein_haze;
  reg ham_bacon;
  reg moron_gin;
  reg nyc_candle;
  reg curie_plague;
  reg spyro_neon;
  reg ocha_meffert;
  reg gap_greenbay;
  reg hector_potato;
  reg tsmc_wildboar;
  reg moron_curious;
  reg jesus_rubik;
  reg what_doobie;
  reg rose_larry;
  reg oscar_tapered;
  reg spain_yellow;
  reg homerun_meth;
  reg advil_yummy;
  reg foryou_subway;
  reg freaky_pdaddy;
  reg bonker_gonzo;
  reg bfs_mortar;
  reg hans_palmer;
    parameter chillis_cybex_0 = 0,chillis_cybex_1 = 1,chillis_cybex_2 = 2,chillis_cybex_3 = 3,chillis_cybex_4 = 4;
    reg [3:0] chillis_cybex;

  reg curie_sogood;
  reg fear_exodus;
  reg parrot_dragon;
  reg ajax_spyro;
  reg wood_notalot;
  reg pirate_gutter;
  reg orange_cubish;
  reg whattime_bert;
  reg sanity_hp;
  reg iron_cheese;
  reg ready_spirit;
  reg molokai_rum;
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
  reg dweebie_ring;
  reg lockheed_fire;
  reg bagel_shuda;
  reg chainsaw_tofu;
  reg spirit_norris;
  reg cheez_zedong;
  reg badger_donkey;
  reg ihilani_vadar;
  reg jonas_bep;
  reg fire_boing;
  reg gap_india;
  reg my_tummy_zi;
  reg jonas_aspirin;
  reg timmy_snake;
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
  reg blanket_pilot;
  reg ceres_intel;
  reg superman_todd;
  reg mike_lotus;
  reg cocacola_milo;
  reg nyc_rod;
  reg acid_tapered;
  reg pepsi_gerard;
  reg snape_neptune;
  reg fish_itchy;
  reg star_ernie;
  reg dog_charlie;
  reg turnip_foiled;
  reg jason_dirty;
  reg moe_burning;
  reg mexican_mike;
  reg papa_sun;
  reg wizard_snape;
  reg tunafish_duey;
  reg whiskey_crank;
  reg sogood_drax;
  reg burner_hurt;
  reg fury_mozart;
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
    parameter what_booming_0 = 0,what_booming_1 = 1,what_booming_2 = 2,what_booming_3 = 3,what_booming_4 = 4;
    reg [3:0] what_booming;

  reg ykocens_kana;
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
  reg star_arthur;
  reg turnip_deng;
  reg raiders_louie;
  reg knot_picante;
  reg sirius_dopey;
  reg killer_hanger;
  reg china_whacky;
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
  reg mushroom_east;
  reg howell_hans;
  reg zen_loud;
  reg pirate_flew;
  reg crab_iterate;
  reg hawaii_turnip;
  reg green_eeevil;
  reg touch_neptune;
  reg foxtrot_honda;
  reg happy_bear;
  reg dutch_victor;
  reg loud_romulus;
  reg iterate_south;
  reg mouse_icarus;
  reg kaisha_yak;
  reg ceres_whale;
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
  reg kungfu_itchy;
  reg platinum_crab;
  reg goat_wujing;
  reg sand_wanton;
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
  tri due_theonion;
  tri peta_willy;
  tri penguin_genji;
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
  reg rescue_george;
  reg newt_devotion;
  reg todd_beavis;
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
  reg butthead_duey;
  reg oscar_cheez;
  reg hippo_lao;
  reg bravo_sapporo;
  reg leaky_mortar;
  reg egg_abel;
  reg xterm_sierra;
  reg tobe_ants;
  reg hans_voodoo;
  reg Iwin_ladder;
  reg rat_solder;
  reg escape_rojas;
  reg sun_mrbill;
  reg south_aspirin;
  reg togos_haze;
  reg heidi_crank;
  reg turkey_sanity;
  reg lovey_ring;
  reg turtle_kilo;
  reg snort_nasdaq;
  reg charlie_ariel;
  reg mandarin_bfs;
  reg desert_albus;
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
  reg rat_fsncens;
  reg bart_speed;
  reg coconut_witch;
  reg mouse_ghost;
  reg books_rodent;


// State Mek alpha Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      alpha <= alpha_0;
    else
      case (alpha)
        alpha_0: begin
          if ({bravo,charlie,delta,echo} == 7)
            alpha <= alpha_6;
          else if ({bravo,charlie,delta,echo} == 3)
            alpha <= alpha_2;
          else if ({bravo,charlie,delta,echo} == 9)
            alpha <= alpha_2;
          else
            alpha <= alpha_0;
          end
        alpha_1: begin
          if ({bravo,charlie,delta,echo} == 14)
            alpha <= alpha_5;
          else if ({bravo,charlie,delta,echo} == 2)
            alpha <= alpha_4;
          else if ({bravo,charlie,delta,echo} == 3)
            alpha <= alpha_9;
          else if ({bravo,charlie,delta,echo} == 4)
            alpha <= alpha_5;
          else if ({bravo,charlie,delta,echo} == 12)
            alpha <= alpha_11;
          else if ({bravo,charlie,delta,echo} == 9)
            alpha <= alpha_0;
          else
            alpha <= alpha_1;
          end
        alpha_2: begin
          if ({bravo,charlie,delta,echo} == 13)
            alpha <= alpha_11;
          else if ({bravo,charlie,delta,echo} == 1)
            alpha <= alpha_5;
          else
            alpha <= alpha_2;
          end
        alpha_3: begin
          if ({bravo,charlie,delta,echo} == 7)
            alpha <= alpha_1;
          else
            alpha <= alpha_3;
          end
        alpha_4: begin
          if ({bravo,charlie,delta,echo} == 15)
            alpha <= alpha_3;
          else if ({bravo,charlie,delta,echo} == 13)
            alpha <= alpha_5;
          else
            alpha <= alpha_4;
          end
        alpha_5: begin
          if ({bravo,charlie,delta,echo} == 0)
            alpha <= alpha_5;
          else
            alpha <= alpha_5;
          end
        alpha_6: begin
          if ({bravo,charlie,delta,echo} == 3)
            alpha <= alpha_8;
          else if ({bravo,charlie,delta,echo} == 12)
            alpha <= alpha_10;
          else
            alpha <= alpha_6;
          end
        alpha_7: begin
          if ({bravo,charlie,delta,echo} == 8)
            alpha <= alpha_1;
          else if ({bravo,charlie,delta,echo} == 6)
            alpha <= alpha_11;
          else if ({bravo,charlie,delta,echo} == 14)
            alpha <= alpha_1;
          else
            alpha <= alpha_7;
          end
        alpha_8: begin
          if ({bravo,charlie,delta,echo} == 4)
            alpha <= alpha_9;
          else if ({bravo,charlie,delta,echo} == 1)
            alpha <= alpha_7;
          else
            alpha <= alpha_8;
          end
        alpha_9: begin
          if ({bravo,charlie,delta,echo} == 7)
            alpha <= alpha_0;
          else if ({bravo,charlie,delta,echo} == 4)
            alpha <= alpha_8;
          else if ({bravo,charlie,delta,echo} == 3)
            alpha <= alpha_6;
          else
            alpha <= alpha_9;
          end
        alpha_10: begin
          if ({bravo,charlie,delta,echo} == 6)
            alpha <= alpha_11;
          else if ({bravo,charlie,delta,echo} == 0)
            alpha <= alpha_1;
          else if ({bravo,charlie,delta,echo} == 11)
            alpha <= alpha_1;
          else if ({bravo,charlie,delta,echo} == 4)
            alpha <= alpha_0;
          else if ({bravo,charlie,delta,echo} == 9)
            alpha <= alpha_5;
          else
            alpha <= alpha_10;
          end
        alpha_11: begin
          if ({bravo,charlie,delta,echo} == 15)
            alpha <= alpha_7;
          else if ({bravo,charlie,delta,echo} == 9)
            alpha <= alpha_6;
          else
            alpha <= alpha_11;
          end
        default: alpha <= alpha_0;
      endcase
  end

// State Mek alpha Output logic
always @(alpha)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (alpha[3:1])
        alpha_0: begin
            foxtrot = 0;
            golf = 1;
            hotel = 0;
            india = 0;
            juliet = 0;
            kilo = 1;
            lima = 1;
            mike = 0;
            november = 1;
            oscar = 1;
            papa = 1;
          end
        alpha_1: begin
            foxtrot = 0;
            golf = 1;
            hotel = 1;
            india = 0;
            juliet = 0;
            kilo = 0;
            lima = 1;
            mike = 1;
            november = 0;
            oscar = 0;
            papa = 1;
          end
        alpha_2: begin
            foxtrot = 1;
            golf = 0;
            hotel = 0;
            india = 0;
            juliet = 0;
            kilo = 0;
            lima = 0;
            mike = 0;
            november = 0;
            oscar = 1;
            papa = 0;
          end
        alpha_3: begin
            foxtrot = 0;
            golf = 0;
            hotel = 0;
            india = 1;
            juliet = 0;
            kilo = 1;
            lima = 0;
            mike = 0;
            november = 0;
            oscar = 1;
            papa = 1;
          end
        alpha_4: begin
            foxtrot = 1;
            golf = 1;
            hotel = 0;
            india = 0;
            juliet = 0;
            kilo = 1;
            lima = 0;
            mike = 0;
            november = 0;
            oscar = 0;
            papa = 1;
          end
        alpha_5: begin
            foxtrot = 0;
            golf = 1;
            hotel = 1;
            india = 1;
            juliet = 0;
            kilo = 1;
            lima = 0;
            mike = 1;
            november = 1;
            oscar = 0;
            papa = 1;
          end
        default: begin
            foxtrot = 1;
            golf = 1;
            hotel = 0;
            india = 0;
            juliet = 1;
            kilo = 0;
            lima = 1;
            mike = 0;
            november = 1;
            oscar = 1;
            papa = 1;
          end
      endcase
  end

// 2s comp negate A
always @(quebec or romeo or vcc or sierra or tango or gnd)
  begin
    {uniform,victor,whiskey,xray,yankee,zulu,bomb_pop,for_gregg,adbcensor} = - {quebec,romeo,vcc,sierra,tango,gnd};
  end

always @(gojira or richard or yeanyow)
  begin
      rubik = (gojira ? richard : yeanyow);
  end

// 3 input 3 output permutation
always @(cybex or babette or hanger)
  begin
    case ({cybex,babette,hanger})
      0: {hinge,nail,bolt}=4;
      1: {hinge,nail,bolt}=1;
      2: {hinge,nail,bolt}=0;
      3: {hinge,nail,bolt}=7;
      4: {hinge,nail,bolt}=5;
      5: {hinge,nail,bolt}=3;
      6: {hinge,nail,bolt}=2;
      7: {hinge,nail,bolt}=6;
      default: {hinge,nail,bolt}=0;
    endcase
  end


initial begin
    {cannon,mine,bullet} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({lumber,vcc,launcher} < {mortar,gnd,tank})
       {cannon,mine,bullet} <= {mortar,gnd,tank};
    else
       {cannon,mine,bullet} <= {lumber,vcc,launcher};
  end

// State Mek marker Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marker <= marker_0;
    else
      case (marker)
        marker_0: begin
          if ({red,vcc,blue,green} == 15)
            marker <= marker_0;
          else if ({red,vcc,blue,green} == 1)
            marker <= marker_0;
          else if ({red,vcc,blue,green} == 0)
            marker <= marker_3;
          else if ({red,vcc,blue,green} == 2)
            marker <= marker_1;
          else if ({red,vcc,blue,green} == 14)
            marker <= marker_2;
          else
            marker <= marker_0;
          end
        marker_1: begin
          if ({red,vcc,blue,green} == 4)
            marker <= marker_3;
          else
            marker <= marker_1;
          end
        marker_2: begin
          if ({red,vcc,blue,green} == 14)
            marker <= marker_3;
          else if ({red,vcc,blue,green} == 7)
            marker <= marker_3;
          else
            marker <= marker_2;
          end
        marker_3: begin
          if ({red,vcc,blue,green} == 11)
            marker <= marker_3;
          else if ({red,vcc,blue,green} == 8)
            marker <= marker_3;
          else
            marker <= marker_3;
          end
        default: marker <= marker_0;
      endcase
  end

// State Mek marker Output logic
always @(marker)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (marker[3:1])
        marker_0: begin
            aphid = 0;
            badger = 0;
            bear = 0;
            beetle = 0;
            bison = 0;
            bull = 0;
            cassowary = 1;
            cat = 0;
          end
        marker_1: begin
            aphid = 1;
            badger = 0;
            bear = 0;
            beetle = 0;
            bison = 0;
            bull = 0;
            cassowary = 1;
            cat = 0;
          end
        default: begin
            aphid = 1;
            badger = 1;
            bear = 0;
            beetle = 0;
            bison = 0;
            bull = 1;
            cassowary = 0;
            cat = 1;
          end
      endcase
  end

always @(chicken or cow or dog or donkey or dragon or 
   chicken or cow or dog or donkey or duck or 
   eagle
)
  begin
    if (eagle)
    begin
      case ({{chicken,cow,dog,donkey},dragon})
        0: eel=0;
        1: eel=0;
        2: eel=0;
        3: eel=1;
        4: eel=0;
        5: eel=1;
        6: eel=1;
        7: eel=0;
        8: eel=1;
        9: eel=1;
        10: eel=0;
        11: eel=1;
        12: eel=0;
        13: eel=1;
        14: eel=1;
        15: eel=0;
        16: eel=1;
        17: eel=0;
        18: eel=1;
        19: eel=0;
        20: eel=1;
        21: eel=0;
        22: eel=1;
        23: eel=0;
        24: eel=0;
        25: eel=1;
        26: eel=1;
        27: eel=0;
        28: eel=0;
        29: eel=1;
        30: eel=1;
        31: eel=1;
      default: eel=0;
      endcase
    end
    else
    begin
      case ({{chicken,cow,dog,donkey},duck})
        0: eel=1;
        1: eel=0;
        2: eel=1;
        3: eel=1;
        4: eel=0;
        5: eel=0;
        6: eel=0;
        7: eel=0;
        8: eel=1;
        9: eel=0;
        10: eel=0;
        11: eel=0;
        12: eel=0;
        13: eel=1;
        14: eel=1;
        15: eel=0;
        16: eel=1;
        17: eel=1;
        18: eel=1;
        19: eel=1;
        20: eel=0;
        21: eel=0;
        22: eel=1;
        23: eel=1;
        24: eel=0;
        25: eel=0;
        26: eel=0;
        27: eel=0;
        28: eel=0;
        29: eel=0;
        30: eel=1;
        31: eel=0;
      default: eel=0;
      endcase
    end
  end

// In range compare
always @(elephant or emu or fish or frog or goat)
  begin
    if ({elephant,emu,fish,frog,goat} > 220 &&
        {elephant,emu,fish,frog,goat} < 169)
      hippo = 1;
    else
      hippo = 0;
  end

// 75 bit shift register
reg [74:0] iguana;

initial begin
    iguana = 0;
end

always @(posedge clock0)
begin
    iguana <= (iguana << 1) | jellyfish;
end

// shift taps every 5 bits
always @(iguana)
begin
    kangaroo = iguana[74];
    lion = iguana[69];
    lizard = iguana[64];
    llama = iguana[59];
    monkey = iguana[54];
    mouse = iguana[49];
    newt = iguana[44];
    ostrich = iguana[39];
    otter = iguana[34];
    penguin = iguana[29];
    pig = iguana[24];
    platypus = iguana[19];
    possum = iguana[14];
    quail = iguana[9];
    rat = iguana[4];
end

always @(penguin)
  begin
      sheep = !penguin;
  end

always @(monkey)
  begin
      tiger = !monkey;
  end

always @(vcc)
  begin
      turtle = !vcc;
  end

always @(whiskey)
  begin
      unicorn = !whiskey;
  end

always @(zulu)
  begin
      vulture = !zulu;
  end

always @(gnd)
  begin
      whale = !gnd;
  end

always @(gnd)
  begin
      wolverine = !gnd;
  end

always @(gnd)
  begin
      woodpecker = !gnd;
  end

always @(gnd)
  begin
      xuprocar = !gnd;
  end

always @(adbcensor)
  begin
      yak = !adbcensor;
  end

always @(bullet)
  begin
      zebra = !bullet;
  end

always @(xray)
  begin
      shuda = !xray;
  end

reg feedback_pt_0;

always @(vcc or feedback_pt_0)
  begin
      maklak = !vcc & !feedback_pt_0;
  end

reg feedback_pt_1;

always @(gnd or feedback_pt_1)
  begin
      bcdcensor =  gnd ^  feedback_pt_1;
  end

reg feedback_pt_2;

always @(zebra or feedback_pt_2)
  begin
      safada =  zebra & !feedback_pt_2;
  end

reg feedback_pt_3;

always @(xuprocar or feedback_pt_3)
  begin
      ceecensor = !xuprocar |  feedback_pt_3;
  end

reg feedback_pt_4;

always @(bolt or feedback_pt_4)
  begin
      dfecensorc =  bolt | !feedback_pt_4;
  end

reg feedback_pt_5;

always @(rat or feedback_pt_5)
  begin
      saturn = !rat ^ !feedback_pt_5;
  end

wire loser_outwire;
carry neon (foxtrot,loser_outwire);

always @(loser_outwire)
begin
  loser = loser_outwire;
end

wire potato_outwire, nuclear_outwire;
carry_sum turnip (.sin(victor),.cin(gnd),.sout(potato_outwire),.cout(nuclear_outwire));

always @(potato_outwire or nuclear_outwire)
begin
  potato = potato_outwire;
  nuclear = nuclear_outwire;
end

wire bathroom_outwire, popcorn_outwire;
carry_sum insurance (.sin(ostrich),.cin(yankee),.sout(bathroom_outwire),.cout(popcorn_outwire));

always @(bathroom_outwire or popcorn_outwire)
begin
  bathroom = bathroom_outwire;
  popcorn = popcorn_outwire;
end

wire dr_zaius_outwire, amadeus_outwire;
carry_sum jimmyjames (.sin(golf),.cin(kilo),.sout(dr_zaius_outwire),.cout(amadeus_outwire));

always @(dr_zaius_outwire or amadeus_outwire)
begin
  dr_zaius = dr_zaius_outwire;
  amadeus = amadeus_outwire;
end

reg feedback_pt_6;

always @(vcc or feedback_pt_6)
  begin
      whack =  vcc ^ !feedback_pt_6;
  end

reg feedback_pt_7;

always @(oscar or feedback_pt_7)
  begin
      jason = !oscar & !feedback_pt_7;
  end

reg feedback_pt_8;

always @(tiger or feedback_pt_8)
  begin
      funkadelic = !tiger &  feedback_pt_8;
  end

reg feedback_pt_9;

always @(shuda or feedback_pt_9)
  begin
      books = !shuda ^ !feedback_pt_9;
  end

reg feedback_pt_10;

always @(books or feedback_pt_10)
  begin
      cluckU =  books ^  feedback_pt_10;
  end

reg feedback_pt_11;

always @(rat or feedback_pt_11)
  begin
      togos =  rat ^ !feedback_pt_11;
  end

reg feedback_pt_12;

always @(maklak or feedback_pt_12)
  begin
      chiptrip = !maklak ^ !feedback_pt_12;
  end

reg feedback_pt_13;

always @(togos or feedback_pt_13)
  begin
      what = !togos ^ !feedback_pt_13;
  end

reg feedback_pt_14;

always @(hotel or feedback_pt_14)
  begin
      would = !hotel & !feedback_pt_14;
  end

reg feedback_pt_15;

always @(yak or feedback_pt_15)
  begin
      brian = !yak | !feedback_pt_15;
  end

reg feedback_pt_16;

always @(dr_zaius or feedback_pt_16)
  begin
      boitano = !dr_zaius ^  feedback_pt_16;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      due <= 0;
    else if (vcc)
      due <= 0;
    else if (ceecensor)
      due <= lima;
  end

always @(due)
  begin
      feedback_pt_0 = due;
  end

always @(due)
  begin
      feedback_pt_1 = due;
  end

always @(due)
  begin
      feedback_pt_2 = due;
  end

wire genesis_wire;

dffeas genesis_ff (
  .clk(clock0),
  .d(vcc),
  .ena(vcc),
  .sclr(gnd),
  .sload(ceecensor),
  .asdata(mouse),
  .clrn(!reset0),
  .q(genesis_wire)
);

always @(genesis_wire) begin
   deuteronomy = genesis_wire;
end

always @(deuteronomy)
  begin
      feedback_pt_3 = deuteronomy;
  end

wire leviticus_wire;

dffeas leviticus_ff (
  .clk(clock0),
  .d(safada),
  .ena(due),
  .sclr(foxtrot),
  .sload(gnd),
  .asdata(ceecensor),
  .clrn(!reset0),
  .q(leviticus_wire)
);

always @(leviticus_wire) begin
   xterm = leviticus_wire;
end

always @(xterm)
  begin
      feedback_pt_4 = xterm;
  end

always @(xterm)
  begin
      feedback_pt_5 = xterm;
  end

always @(xterm)
  begin
      feedback_pt_6 = xterm;
  end

always @(xterm)
  begin
      feedback_pt_7 = xterm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      numbers <= 1;
    else
      numbers <= platypus;
  end

always @(numbers)
  begin
      feedback_pt_8 = numbers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      noah <= 0;
    else if (india)
      noah <= 0;
    else if (gnd)
      noah <= papa;
  end

always @(noah)
  begin
      feedback_pt_9 = noah;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bagel <= 0;
    else if (hinge)
      bagel <= 0;
    else if (gnd)
      bagel <= potato;
  end

always @(bagel)
  begin
      feedback_pt_10 = bagel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      english <= 0;
    else if (chiptrip)
      english <= 0;
    else if (gnd)
      english <= yak;
  end

always @(english)
  begin
      feedback_pt_11 = english;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      muffin <= 0;
    else if (kilo)
      muffin <= for_gregg;
    else if (bomb_pop)
      muffin <= 0;
  end

always @(muffin)
  begin
      feedback_pt_12 = muffin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ceres <= 0;
    else if (dfecensorc)
      ceres <= 0;
    else if (whale)
      ceres <= sheep;
  end

always @(ceres)
  begin
      feedback_pt_13 = ceres;
  end

wire moulin_wire;

dffeas moulin_ff (
  .clk(clock0),
  .d(rubik),
  .ena(vcc),
  .sclr(gnd),
  .sload(vcc),
  .asdata(vcc),
  .clrn(!reset0),
  .q(moulin_wire)
);

always @(moulin_wire) begin
   rouge = moulin_wire;
end

always @(rouge)
  begin
      feedback_pt_14 = rouge;
  end

wire cellphone_wire;

dffea cellphone_ff (
  .clk(clock0),
  .d(newt),
  .ena(for_gregg),
  .adata(gnd),
  .clrn(!reset0),
  .q(cellphone_wire)
);

always @(cellphone_wire) begin
   mortgate = cellphone_wire;
end

always @(mortgate)
  begin
      feedback_pt_15 = mortgate;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stapler <= 0;
    else if (gnd)
      stapler <= cat;
  end

always @(stapler)
  begin
      feedback_pt_16 = stapler;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      holepunch <= 0;
    else if (nail)
      holepunch <= 0;
    else if (vcc)
      holepunch <= pig;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      metal <= 0;
    else
      metal <= mouse;
  end

reg feedback_pt_17;

always @(popcorn or feedback_pt_17)
  begin
      dork = !popcorn | !feedback_pt_17;
  end

reg feedback_pt_18;

always @(gnd or feedback_pt_18)
  begin
      autotest = !gnd ^  feedback_pt_18;
  end

reg feedback_pt_19;

always @(vcc or feedback_pt_19)
  begin
      picture = !vcc &  feedback_pt_19;
  end

reg feedback_pt_20;

always @(gnd or feedback_pt_20)
  begin
      sleepy =  gnd | !feedback_pt_20;
  end

reg feedback_pt_21;

always @(nail or feedback_pt_21)
  begin
      dopey =  nail | !feedback_pt_21;
  end

reg feedback_pt_22;

always @(vcc or feedback_pt_22)
  begin
      sneezy = !vcc ^  feedback_pt_22;
  end

reg feedback_pt_23;

always @(whack or feedback_pt_23)
  begin
      happy =  whack & !feedback_pt_23;
  end

reg feedback_pt_24;

always @(unicorn or feedback_pt_24)
  begin
      grumpy = !unicorn ^ !feedback_pt_24;
  end

// Random combinatorial logic block
always@(*)
  begin
      bashful = ( ~( ( ~( ~( ~( bcdcensor ) ^ ~( ~eel ) ) ^ ~( ~( vcc ) | ( quail ^ ~muffin ) ) ) ) ^ ~( ~( ~( ( whack ^ ~badger ) ) ) ) ) );
  end

  always@(*)
  begin
    doc = ( ~( ( otter | ~( ~( ( foxtrot ^ gnd ) ) ) ) | ( ( ~( ( ~( ( ~what & ~gnd ) | ~( vcc ) ) ) & ( hinge & ~stapler ) ^ ( ~mike ^ holepunch ) ) ) & ~( tiger ) ) ) ) ? ~( ~( ~( mike ) ) ) : ~( ~( ( ~( ( ~vcc ^ beetle ^ ~ceres ) & ~( ~( books ) ) ) ) ) );
  end
// 6 bit modulus
always @(saturn or rouge or would or deuteronomy or gnd or rouge or gnd or vcc or gnd or sneezy or india or funkadelic)
  begin
    if ({gnd,vcc,gnd,sneezy,india,funkadelic} == 0)
       {donald,mickey,minnie,spock,goofy,gyro} = 0;
    else 
      {donald,mickey,minnie,spock,goofy,gyro} = 
	  	  {saturn,rouge,would,deuteronomy,gnd,rouge} % 
		  {gnd,vcc,gnd,sneezy,india,funkadelic};
  end


initial begin
    {scrooge,huey,duey,louie,jiminy} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({autotest,minnie,lion,zulu,bagel} < {vcc,minnie,vcc,vcc,tiger})
       {scrooge,huey,duey,louie,jiminy} <= {vcc,minnie,vcc,vcc,tiger};
    else
       {scrooge,huey,duey,louie,jiminy} <= {autotest,minnie,lion,zulu,bagel};
  end

// XNOR all of these bits together
always @(bison or noah or duey or possum or turtle or vcc or grumpy or gnd)
  begin
      cinderella = ~^ {bison,noah,duey,possum,turtle,vcc,grumpy,gnd};
  end

always @(dfecensorc or gnd or vcc or cassowary or metal or 
   dfecensorc or gnd or vcc or cassowary or muffin or 
   uniform
)
  begin
    if (uniform)
    begin
      case ({{dfecensorc,gnd,vcc,cassowary},metal})
        0: sleeping=1;
        1: sleeping=0;
        2: sleeping=0;
        3: sleeping=0;
        4: sleeping=1;
        5: sleeping=1;
        6: sleeping=1;
        7: sleeping=0;
        8: sleeping=0;
        9: sleeping=0;
        10: sleeping=1;
        11: sleeping=0;
        12: sleeping=0;
        13: sleeping=1;
        14: sleeping=1;
        15: sleeping=0;
        16: sleeping=0;
        17: sleeping=0;
        18: sleeping=1;
        19: sleeping=0;
        20: sleeping=0;
        21: sleeping=1;
        22: sleeping=1;
        23: sleeping=1;
        24: sleeping=0;
        25: sleeping=1;
        26: sleeping=1;
        27: sleeping=0;
        28: sleeping=1;
        29: sleeping=1;
        30: sleeping=1;
        31: sleeping=0;
      default: sleeping=0;
      endcase
    end
    else
    begin
      case ({{dfecensorc,gnd,vcc,cassowary},muffin})
        0: sleeping=0;
        1: sleeping=0;
        2: sleeping=1;
        3: sleeping=0;
        4: sleeping=1;
        5: sleeping=1;
        6: sleeping=1;
        7: sleeping=0;
        8: sleeping=1;
        9: sleeping=0;
        10: sleeping=1;
        11: sleeping=1;
        12: sleeping=1;
        13: sleeping=0;
        14: sleeping=1;
        15: sleeping=1;
        16: sleeping=0;
        17: sleeping=1;
        18: sleeping=0;
        19: sleeping=1;
        20: sleeping=1;
        21: sleeping=0;
        22: sleeping=0;
        23: sleeping=1;
        24: sleeping=0;
        25: sleeping=1;
        26: sleeping=0;
        27: sleeping=0;
        28: sleeping=1;
        29: sleeping=0;
        30: sleeping=0;
        31: sleeping=0;
      default: sleeping=0;
      endcase
    end
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beauty <= 0;
    else
    case ({bagel,scrooge})
       0 : beauty <= picture;
       1 : beauty <= beauty;
       2 : beauty <= bagel;
       3 : beauty <= jason;
       default : beauty <= 0;
    endcase
  end

always @(beauty)
  begin
      feedback_pt_17 = beauty;
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      superman <= 0;
    else
    case ({mortgate,bashful})
       0 : superman <= gnd;
       1 : superman <= superman;
       2 : superman <= superman;
       3 : superman <= loser;
       default : superman <= 0;
    endcase
  end

always @(superman)
  begin
      feedback_pt_18 = superman;
  end

reg feedback_pt_25;

always @(amadeus or feedback_pt_25)
  begin
      batman =  amadeus &  feedback_pt_25;
  end

reg feedback_pt_26;

always @(bagel or feedback_pt_26)
  begin
      wonder = !bagel | !feedback_pt_26;
  end

reg feedback_pt_27;

always @(louie or feedback_pt_27)
  begin
      woman =  louie ^  feedback_pt_27;
  end

reg feedback_pt_28;

always @(gnd or feedback_pt_28)
  begin
      hulk =  gnd ^ !feedback_pt_28;
  end

reg feedback_pt_29;

always @(llama or feedback_pt_29)
  begin
      lantern =  llama & !feedback_pt_29;
  end

reg feedback_pt_30;

always @(what or feedback_pt_30)
  begin
      riddler =  what | !feedback_pt_30;
  end

reg feedback_pt_31;

always @(cassowary or feedback_pt_31)
  begin
      joker =  cassowary | !feedback_pt_31;
  end

reg feedback_pt_32;

always @(rouge or feedback_pt_32)
  begin
      luthor =  rouge &  feedback_pt_32;
  end

reg feedback_pt_33;

always @(gnd or feedback_pt_33)
  begin
      hercules = !gnd & !feedback_pt_33;
  end

reg feedback_pt_34;

always @(books or feedback_pt_34)
  begin
      ajax =  books &  feedback_pt_34;
  end

reg feedback_pt_35;

always @(gnd or feedback_pt_35)
  begin
      achilles =  gnd ^  feedback_pt_35;
  end

reg feedback_pt_36;

always @(superman or feedback_pt_36)
  begin
      hector =  superman &  feedback_pt_36;
  end

reg feedback_pt_37;

always @(lantern or feedback_pt_37)
  begin
      ulysses = !lantern |  feedback_pt_37;
  end

reg feedback_pt_38;

always @(doc or feedback_pt_38)
  begin
      agamemnon = !doc | !feedback_pt_38;
  end

reg feedback_pt_39;

always @(goofy or feedback_pt_39)
  begin
      aladdin =  goofy | !feedback_pt_39;
  end

reg feedback_pt_40;

always @(cannon or feedback_pt_40)
  begin
      bambi =  cannon ^ !feedback_pt_40;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pocahontas <= 0;
    else if (books)
      pocahontas <= spock;
  end

always @(pocahontas)
  begin
      feedback_pt_19 = pocahontas;
  end

always @(pocahontas)
  begin
      feedback_pt_20 = pocahontas;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jesus <= 0;
    else if (gnd)
      jesus <= vcc;
    else if (vcc)
      jesus <= 0;
  end

always @(jesus)
  begin
      feedback_pt_21 = jesus;
  end

wire buddha_wire;

dffeas buddha_ff (
  .clk(clock0),
  .d(vcc),
  .ena(vulture),
  .sclr(donald),
  .sload(grumpy),
  .asdata(gnd),
  .clrn(!reset0),
  .q(buddha_wire)
);

always @(buddha_wire) begin
   dali_llama = buddha_wire;
end

always @(dali_llama)
  begin
      feedback_pt_22 = dali_llama;
  end

always @(dali_llama)
  begin
      feedback_pt_23 = dali_llama;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      clinton <= 0;
    else if (vcc)
      clinton <= gnd;
  end

always @(clinton)
  begin
      feedback_pt_24 = clinton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bush <= 0;
    else if (vcc)
      bush <= bambi;
    else if (safada)
      bush <= 0;
  end

always @(bush)
  begin
      feedback_pt_25 = bush;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      washington <= 0;
    else if (rouge)
      washington <= vcc;
    else if (vcc)
      washington <= 0;
  end

always @(washington)
  begin
      feedback_pt_26 = washington;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hamburger <= 0;
    else if (dopey)
      hamburger <= 0;
    else if (november)
      hamburger <= wolverine;
  end

always @(hamburger)
  begin
      feedback_pt_27 = hamburger;
  end

always @(hamburger)
  begin
      feedback_pt_28 = hamburger;
  end

always @(hamburger)
  begin
      feedback_pt_29 = hamburger;
  end

always @(hamburger)
  begin
      feedback_pt_30 = hamburger;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hotdog <= 1;
    else
      hotdog <= gnd;
  end

always @(hotdog)
  begin
      feedback_pt_31 = hotdog;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drdeath <= 0;
    else if (whale)
      drdeath <= 0;
    else if (gnd)
      drdeath <= papa;
  end

always @(drdeath)
  begin
      feedback_pt_32 = drdeath;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      klinton <= 0;
    else
      klinton <= cinderella;
  end

always @(klinton)
  begin
      feedback_pt_33 = klinton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kang <= 0;
    else if (riddler)
      kang <= 0;
    else if (joker)
      kang <= turtle;
  end

always @(kang)
  begin
      feedback_pt_34 = kang;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      water <= 0;
    else if (happy)
      water <= loser;
    else if (woodpecker)
      water <= 0;
  end

always @(water)
  begin
      feedback_pt_35 = water;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      air <= 0;
    else
      air <= noah;
  end

always @(air)
  begin
      feedback_pt_36 = air;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fire <= 0;
    else if (dopey)
      fire <= stapler;
  end

always @(fire)
  begin
      feedback_pt_37 = fire;
  end

wire magicwand_wire;

dffeas magicwand_ff (
  .clk(clock0),
  .d(turtle),
  .ena(vcc),
  .sclr(jesus),
  .sload(dork),
  .asdata(numbers),
  .clrn(!reset0),
  .q(magicwand_wire)
);

always @(magicwand_wire) begin
   beavis = magicwand_wire;
end

always @(beavis)
  begin
      feedback_pt_38 = beavis;
  end

wire butthead_wire;

dffeas butthead_ff (
  .clk(clock0),
  .d(funkadelic),
  .ena(boitano),
  .sclr(monkey),
  .sload(vcc),
  .asdata(would),
  .clrn(!reset0),
  .q(butthead_wire)
);

always @(butthead_wire) begin
   homer = butthead_wire;
end

always @(homer)
  begin
      feedback_pt_39 = homer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      barty <= 0;
    else
      barty <= possum;
  end

always @(barty)
  begin
      feedback_pt_40 = barty;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cartman <= 0;
    else if (brian)
      cartman <= mortgate;
    else if (vcc)
      cartman <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sand <= 0;
    else if (vcc)
      sand <= bathroom;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hours <= 0;
    else if (wolverine)
      hours <= aphid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lamer <= 0;
    else if (agamemnon)
      lamer <= 0;
    else if (nail)
      lamer <= vcc;
  end

// State Mek hoser Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hoser <= hoser_0;
    else
      case (hoser)
        hoser_0: begin
          if ({huey,happy,lantern,autotest} == 7)
            hoser <= hoser_4;
          else if ({huey,happy,lantern,autotest} == 12)
            hoser <= hoser_6;
          else
            hoser <= hoser_0;
          end
        hoser_1: begin
          if ({huey,happy,lantern,autotest} == 0)
            hoser <= hoser_4;
          else if ({huey,happy,lantern,autotest} == 3)
            hoser <= hoser_9;
          else if ({huey,happy,lantern,autotest} == 12)
            hoser <= hoser_1;
          else
            hoser <= hoser_1;
          end
        hoser_2: begin
          if ({huey,happy,lantern,autotest} == 14)
            hoser <= hoser_5;
          else
            hoser <= hoser_2;
          end
        hoser_3: begin
          if ({huey,happy,lantern,autotest} == 9)
            hoser <= hoser_7;
          else if ({huey,happy,lantern,autotest} == 13)
            hoser <= hoser_6;
          else if ({huey,happy,lantern,autotest} == 0)
            hoser <= hoser_3;
          else if ({huey,happy,lantern,autotest} == 12)
            hoser <= hoser_8;
          else
            hoser <= hoser_3;
          end
        hoser_4: begin
          if ({huey,happy,lantern,autotest} == 4)
            hoser <= hoser_9;
          else if ({huey,happy,lantern,autotest} == 5)
            hoser <= hoser_0;
          else
            hoser <= hoser_4;
          end
        hoser_5: begin
          if ({huey,happy,lantern,autotest} == 6)
            hoser <= hoser_2;
          else if ({huey,happy,lantern,autotest} == 7)
            hoser <= hoser_3;
          else if ({huey,happy,lantern,autotest} == 12)
            hoser <= hoser_5;
          else if ({huey,happy,lantern,autotest} == 3)
            hoser <= hoser_7;
          else if ({huey,happy,lantern,autotest} == 10)
            hoser <= hoser_9;
          else
            hoser <= hoser_5;
          end
        hoser_6: begin
            hoser <= hoser_6;
          end
        hoser_7: begin
          if ({huey,happy,lantern,autotest} == 11)
            hoser <= hoser_9;
          else
            hoser <= hoser_7;
          end
        hoser_8: begin
          if ({huey,happy,lantern,autotest} == 15)
            hoser <= hoser_6;
          else if ({huey,happy,lantern,autotest} == 2)
            hoser <= hoser_5;
          else if ({huey,happy,lantern,autotest} == 1)
            hoser <= hoser_1;
          else
            hoser <= hoser_8;
          end
        hoser_9: begin
          if ({huey,happy,lantern,autotest} == 4)
            hoser <= hoser_9;
          else if ({huey,happy,lantern,autotest} == 3)
            hoser <= hoser_5;
          else if ({huey,happy,lantern,autotest} == 7)
            hoser <= hoser_3;
          else if ({huey,happy,lantern,autotest} == 2)
            hoser <= hoser_2;
          else if ({huey,happy,lantern,autotest} == 8)
            hoser <= hoser_3;
          else
            hoser <= hoser_9;
          end
        default: hoser <= hoser_0;
      endcase
  end

// State Mek hoser Output logic
always @(hoser)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (hoser[3:1])
        hoser_0: begin
            dweebie = 0;
            motorhead = 1;
            burnout = 1;
            jacques = 1;
            pdiddy = 0;
            pdaddy = 1;
            dorkus = 1;
            drunken = 1;
            master = 1;
            flew = 1;
          end
        hoser_1: begin
            dweebie = 1;
            motorhead = 1;
            burnout = 0;
            jacques = 0;
            pdiddy = 1;
            pdaddy = 1;
            dorkus = 1;
            drunken = 1;
            master = 1;
            flew = 1;
          end
        hoser_2: begin
            dweebie = 0;
            motorhead = 0;
            burnout = 0;
            jacques = 1;
            pdiddy = 1;
            pdaddy = 0;
            dorkus = 0;
            drunken = 1;
            master = 0;
            flew = 1;
          end
        hoser_3: begin
            dweebie = 0;
            motorhead = 1;
            burnout = 1;
            jacques = 0;
            pdiddy = 0;
            pdaddy = 1;
            dorkus = 1;
            drunken = 1;
            master = 1;
            flew = 0;
          end
        hoser_4: begin
            dweebie = 1;
            motorhead = 0;
            burnout = 1;
            jacques = 0;
            pdiddy = 1;
            pdaddy = 1;
            dorkus = 0;
            drunken = 1;
            master = 1;
            flew = 1;
          end
        default: begin
            dweebie = 1;
            motorhead = 0;
            burnout = 1;
            jacques = 0;
            pdiddy = 1;
            pdaddy = 1;
            dorkus = 0;
            drunken = 1;
            master = 1;
            flew = 1;
          end
      endcase
  end

// State Mek over Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      over <= over_0;
    else
      case (over)
        over_0: begin
          if ({brian,vcc,bathroom,dr_zaius} == 13)
            over <= over_4;
          else if ({brian,vcc,bathroom,dr_zaius} == 4)
            over <= over_3;
          else if ({brian,vcc,bathroom,dr_zaius} == 0)
            over <= over_3;
          else
            over <= over_0;
          end
        over_1: begin
          if ({brian,vcc,bathroom,dr_zaius} == 11)
            over <= over_1;
          else if ({brian,vcc,bathroom,dr_zaius} == 2)
            over <= over_0;
          else if ({brian,vcc,bathroom,dr_zaius} == 14)
            over <= over_2;
          else
            over <= over_1;
          end
        over_2: begin
          if ({brian,vcc,bathroom,dr_zaius} == 15)
            over <= over_6;
          else if ({brian,vcc,bathroom,dr_zaius} == 14)
            over <= over_2;
          else if ({brian,vcc,bathroom,dr_zaius} == 6)
            over <= over_7;
          else if ({brian,vcc,bathroom,dr_zaius} == 5)
            over <= over_0;
          else if ({brian,vcc,bathroom,dr_zaius} == 8)
            over <= over_7;
          else
            over <= over_2;
          end
        over_3: begin
          if ({brian,vcc,bathroom,dr_zaius} == 11)
            over <= over_2;
          else
            over <= over_3;
          end
        over_4: begin
          if ({brian,vcc,bathroom,dr_zaius} == 4)
            over <= over_6;
          else
            over <= over_4;
          end
        over_5: begin
          if ({brian,vcc,bathroom,dr_zaius} == 11)
            over <= over_3;
          else
            over <= over_5;
          end
        over_6: begin
          if ({brian,vcc,bathroom,dr_zaius} == 1)
            over <= over_1;
          else if ({brian,vcc,bathroom,dr_zaius} == 9)
            over <= over_5;
          else if ({brian,vcc,bathroom,dr_zaius} == 2)
            over <= over_1;
          else if ({brian,vcc,bathroom,dr_zaius} == 5)
            over <= over_6;
          else
            over <= over_6;
          end
        over_7: begin
          if ({brian,vcc,bathroom,dr_zaius} == 8)
            over <= over_5;
          else if ({brian,vcc,bathroom,dr_zaius} == 11)
            over <= over_7;
          else if ({brian,vcc,bathroom,dr_zaius} == 6)
            over <= over_4;
          else
            over <= over_7;
          end
        default: over <= over_0;
      endcase
  end

// State Mek over Output logic
always @(over)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (over[3:1])
        over_0: begin
            cuckoo = 0;
            nest = 0;
            starwars = 0;
            yoda = 0;
            obiwan = 1;
            vadar = 1;
          end
        over_1: begin
            cuckoo = 1;
            nest = 0;
            starwars = 0;
            yoda = 0;
            obiwan = 1;
            vadar = 1;
          end
        over_2: begin
            cuckoo = 0;
            nest = 1;
            starwars = 0;
            yoda = 0;
            obiwan = 0;
            vadar = 1;
          end
        over_3: begin
            cuckoo = 0;
            nest = 0;
            starwars = 0;
            yoda = 1;
            obiwan = 0;
            vadar = 0;
          end
        default: begin
            cuckoo = 0;
            nest = 1;
            starwars = 0;
            yoda = 0;
            obiwan = 1;
            vadar = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire north_out;
nut_002_lut #(2) nut_002_lut_inst_north (
  .din({vcc,washington}),
  .mask(4'b0011),
  .out(north_out)
);

always @(north_out)
begin
   skywalker = north_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire east_out;
nut_002_lut #(6) nut_002_lut_inst_east (
  .din({woodpecker,drunken,mickey,nest,gnd,llama}),
  .mask(64'b0001011001000000000011000110001100100000001110100000000000010000),
  .out(east_out)
);

always @(east_out)
begin
   southern = east_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire porfavor_out;
nut_002_lut #(6) nut_002_lut_inst_porfavor (
  .din({vcc,mine,gnd,popcorn,air,vcc}),
  .mask(64'h6accad49e602b6d7),
  .out(porfavor_out)
);

always @(porfavor_out)
begin
   west = porfavor_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire questo_out;
nut_002_lut #(4) nut_002_lut_inst_questo (
  .din({autotest,dorkus,sneezy,skywalker}),
  .mask(16'b0001000000000100),
  .out(questo_out)
);

always @(questo_out)
begin
   cuanto = questo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire rojas_out;
nut_002_lut #(3) nut_002_lut_inst_rojas (
  .din({maklak,jacques,sand}),
  .mask(8'b00000000),
  .out(rojas_out)
);

always @(rojas_out)
begin
   pantalones = rojas_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire pizza_out;
nut_002_lut #(5) nut_002_lut_inst_pizza (
  .din({batman,fire,achilles,gnd,cuanto}),
  .mask(32'b00101110001001100010110000000010),
  .out(pizza_out)
);

always @(pizza_out)
begin
   popacap = pizza_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire cheese_out;
nut_002_lut #(5) nut_002_lut_inst_cheese (
  .din({gnd,vcc,hours,hamburger,whack}),
  .mask(32'h30ec3f74),
  .out(cheese_out)
);

always @(cheese_out)
begin
   mushroom = cheese_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire werewolf_out;
nut_002_lut #(4) nut_002_lut_inst_werewolf (
  .din({dfecensorc,drdeath,kangaroo,gnd}),
  .mask(16'b1000011000100100),
  .out(werewolf_out)
);

always @(werewolf_out)
begin
   mcnugget = werewolf_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire vampire_out;
nut_002_lut #(6) nut_002_lut_inst_vampire (
  .din({dopey,ulysses,pdiddy,homer,vcc,hotdog}),
  .mask(64'b1100000000000000010000000000010000000000001101100000101100100101),
  .out(vampire_out)
);

always @(vampire_out)
begin
   spirit = vampire_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire criminal_out;
nut_002_lut #(4) nut_002_lut_inst_criminal (
  .din({obiwan,mushroom,jason,luthor}),
  .mask(16'h95e2),
  .out(criminal_out)
);

always @(criminal_out)
begin
   pyro = criminal_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire purple_out;
nut_002_lut #(3) nut_002_lut_inst_purple (
  .din({vcc,dopey,starwars}),
  .mask(8'h84),
  .out(purple_out)
);

always @(purple_out)
begin
   orange = purple_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire clay_out;
nut_002_lut #(1) nut_002_lut_inst_clay (
  .din({spock}),
  .mask(2'b00),
  .out(clay_out)
);

always @(clay_out)
begin
   yellow = clay_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire crayons_out;
nut_002_lut #(3) nut_002_lut_inst_crayons (
  .din({muffin,starwars,hector}),
  .mask(8'b01000001),
  .out(crayons_out)
);

always @(crayons_out)
begin
   paper = crayons_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire kmfdm_out;
nut_002_lut #(5) nut_002_lut_inst_kmfdm (
  .din({vcc,woman,west,vcc,ajax}),
  .mask(32'h7a2347d1),
  .out(kmfdm_out)
);

always @(kmfdm_out)
begin
   indigo = kmfdm_out;
end


initial begin
    {pentium,bubba,ohno,fallen,comrade,chairman,biker} = 0;
end

// Registered 7 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (orange)
      {pentium,bubba,ohno,fallen,comrade,chairman,biker} <= 0;
    else if (vcc)
      {pentium,bubba,ohno,fallen,comrade,chairman,biker} <=
		  {orange,agamemnon,vcc,kang,gnd,cluckU,aladdin};
    else
      {pentium,bubba,ohno,fallen,comrade,chairman,biker} <=
		 {vcc,gnd,bush,barty,sand,gnd,paper} + 
		 {klinton,monkey,motorhead,dr_zaius,chiptrip,water,juliet};
  end

// NOR all of these bits together
always @(funkadelic or gnd or beauty or vcc or bashful)
  begin
      tattoo = ~| {funkadelic,gnd,beauty,vcc,bashful};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kanji <= 0;
    else
    case ({bashful,jiminy})
       0 : kanji <= mushroom;
       1 : kanji <= pantalones;
       2 : kanji <= gnd;
       3 : kanji <= kanji;
       default : kanji <= 0;
    endcase
  end

reg feedback_pt_41;

always @(dfecensorc or feedback_pt_41)
  begin
      knot =  dfecensorc &  feedback_pt_41;
  end

reg feedback_pt_42;

always @(vcc or feedback_pt_42)
  begin
      bellybutton =  vcc | !feedback_pt_42;
  end

reg feedback_pt_43;

always @(dali_llama or feedback_pt_43)
  begin
      whammy = !dali_llama & !feedback_pt_43;
  end

reg feedback_pt_44;

always @(jiminy or feedback_pt_44)
  begin
      deathguild =  jiminy ^  feedback_pt_44;
  end

reg feedback_pt_45;

always @(gnd or feedback_pt_45)
  begin
      maritime = !gnd &  feedback_pt_45;
  end

reg feedback_pt_46;

always @(muffin or feedback_pt_46)
  begin
      surfer = !muffin ^  feedback_pt_46;
  end

reg feedback_pt_47;

always @(chairman or feedback_pt_47)
  begin
      moron =  chairman ^  feedback_pt_47;
  end

reg feedback_pt_48;

always @(vcc or feedback_pt_48)
  begin
      iterate = !vcc ^  feedback_pt_48;
  end

reg feedback_pt_49;

always @(hotdog or feedback_pt_49)
  begin
      elkarchmero = !hotdog ^  feedback_pt_49;
  end

reg feedback_pt_50;

always @(sleeping or feedback_pt_50)
  begin
      elguapo =  sleeping & !feedback_pt_50;
  end

reg feedback_pt_51;

always @(cuckoo or feedback_pt_51)
  begin
      senorduck = !cuckoo |  feedback_pt_51;
  end

reg feedback_pt_52;

always @(whammy or feedback_pt_52)
  begin
      firstpart =  whammy ^ !feedback_pt_52;
  end

reg feedback_pt_53;

always @(vcc or feedback_pt_53)
  begin
      leidiot = !vcc | !feedback_pt_53;
  end

wire kidnapper_wire;

dffeas kidnapper_ff (
  .clk(clock0),
  .d(kangaroo),
  .ena(would),
  .sclr(dopey),
  .sload(spock),
  .asdata(pdaddy),
  .clrn(!reset0),
  .q(kidnapper_wire)
);

always @(kidnapper_wire) begin
   ring = kidnapper_wire;
end

always @(ring)
  begin
      feedback_pt_41 = ring;
  end

always @(ring)
  begin
      feedback_pt_42 = ring;
  end

always @(ring)
  begin
      feedback_pt_43 = ring;
  end

always @(ring)
  begin
      feedback_pt_44 = ring;
  end

always @(ring)
  begin
      feedback_pt_45 = ring;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      think <= 0;
    else if (gnd)
      think <= lamer;
    else if (tattoo)
      think <= 0;
  end

always @(think)
  begin
      feedback_pt_46 = think;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      firewiggle <= 0;
    else
      firewiggle <= vcc;
  end

always @(firewiggle)
  begin
      feedback_pt_47 = firewiggle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bracket <= 0;
    else if (ajax)
      bracket <= deathguild;
  end

always @(bracket)
  begin
      feedback_pt_48 = bracket;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      probably <= 0;
    else
      probably <= agamemnon;
  end

always @(probably)
  begin
      feedback_pt_49 = probably;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shudamak <= 0;
    else if (aladdin)
      shudamak <= motorhead;
  end

always @(shudamak)
  begin
      feedback_pt_50 = shudamak;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      callme <= 1;
    else
      callme <= firstpart;
  end

always @(callme)
  begin
      feedback_pt_51 = callme;
  end

wire wannabe_wire;

dffeas wannabe_ff (
  .clk(clock0),
  .d(callme),
  .ena(master),
  .sclr(gnd),
  .sload(bracket),
  .asdata(elguapo),
  .clrn(!reset0),
  .q(wannabe_wire)
);

always @(wannabe_wire) begin
   fuji = wannabe_wire;
end

always @(fuji)
  begin
      feedback_pt_52 = fuji;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      emails <= 0;
    else if (whale)
      emails <= vcc;
  end

always @(emails)
  begin
      feedback_pt_53 = emails;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dadada <= 1;
    else
      dadada <= clinton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      conference <= 0;
    else if (kanji)
      conference <= vcc;
    else if (hours)
      conference <= 0;
  end

wire parrot_wire;

dffea parrot_ff (
  .clk(clock0),
  .d(burnout),
  .ena(gnd),
  .adata(achilles),
  .clrn(!reset0),
  .q(parrot_wire)
);

always @(parrot_wire) begin
   workhere = parrot_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      onthepc <= 0;
    else if (dali_llama)
      onthepc <= bush;
    else if (aladdin)
      onthepc <= 0;
  end

wire facetious_wire;

dffeas facetious_ff (
  .clk(clock0),
  .d(bear),
  .ena(cartman),
  .sclr(gnd),
  .sload(moron),
  .asdata(gnd),
  .clrn(!reset0),
  .q(facetious_wire)
);

always @(facetious_wire) begin
   mariollama = facetious_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rafting <= 0;
    else if (gyro)
      rafting <= 0;
    else if (lamer)
      rafting <= workhere;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      freaky <= 0;
    else
      freaky <= beavis;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      davidlin <= 0;
    else if (southern)
      davidlin <= 0;
    else if (deuteronomy)
      davidlin <= would;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blueled <= 1;
    else
      blueled <= kanji;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pirate <= 0;
    else if (vcc)
      pirate <= lizard;
    else if (ohno)
      pirate <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      prison <= 1;
    else
      prison <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marquis <= 0;
    else if (vcc)
      marquis <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      desade <= 1;
    else
      desade <= gnd;
  end

wire baron_wire;

dffeas baron_ff (
  .clk(clock0),
  .d(vcc),
  .ena(wonder),
  .sclr(vcc),
  .sload(gnd),
  .asdata(whack),
  .clrn(!reset0),
  .q(baron_wire)
);

always @(baron_wire) begin
   vonmunchhausen = baron_wire;
end

// Random combinatorial logic block
always@(*)
  begin
      boots = ~( ( ~( ( muffin ^ ~( gnd ) ) ) | ~( ( ( ~( ~blueled ^ fuji ) ) | ~dfecensorc ) ) ) );
  end

  always@(*)
  begin
    narcotics = ( ~( ( ~( ( ~( ( dopey | ~pantalones ) ) | ~( ( ~stapler ^ ~vcc ) ) ) | ~( ( ~( shudamak | ~emails ) ) ) ^ ( ( ~mcnugget ^ desade ) ^ ~( drdeath ) ) ) ) & ( ~( ~ring ^ ~( ~vcc & ~conference ^ gnd ) ) ) ) ) ? ~( ~( ( ~( ( ~( ~pocahontas & ~flew ) ) & ~( ~vcc ) ) ) ) & ( ~( ( ~( vcc ^ ~vcc ) ) ) ^ think ) ) : ~( ~( ( ~( ( ~( ~( ~indigo ) ^ ~knot ) ) & ~( popacap ) | ~( ~bubba ) ) ) ) );
  end

initial begin
    {cocaine,contractor,doobie,float,budlite,morenames,mrbill} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({bear,biker,pirate,mcnugget,gnd,fallen,comrade} < {conference,elguapo,hippo,vcc,probably,kilo,gnd})
       {cocaine,contractor,doobie,float,budlite,morenames,mrbill} <= {conference,elguapo,hippo,vcc,probably,kilo,gnd};
    else
       {cocaine,contractor,doobie,float,budlite,morenames,mrbill} <= {bear,biker,pirate,mcnugget,gnd,fallen,comrade};
  end

// AND all of these bits together
always @(freaky or spock or dweebie or whack or gnd)
  begin
      dutch = & {freaky,spock,dweebie,whack,gnd};
  end

// AND all of these bits together
always @(vonmunchhausen or float or english or dopey or bellybutton or mcnugget or senorduck)
  begin
      candle = & {vonmunchhausen,float,english,dopey,bellybutton,mcnugget,senorduck};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spyro <= 0;
    else
    case ({cuanto,shudamak})
       0 : spyro <= spyro;
       1 : spyro <= spyro;
       2 : spyro <= spyro;
       3 : spyro <= comrade;
       default : spyro <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      speedyg <= 0;
    else
    case ({doobie,freaky})
       0 : speedyg <= motorhead;
       1 : speedyg <= vcc;
       2 : speedyg <= speedyg;
       3 : speedyg <= speedyg;
       default : speedyg <= 0;
    endcase
  end

reg feedback_pt_54;

always @(vcc or feedback_pt_54)
  begin
      kennyg =  vcc ^  feedback_pt_54;
  end

reg feedback_pt_55;

always @(elkarchmero or feedback_pt_55)
  begin
      johndenver = !elkarchmero & !feedback_pt_55;
  end

reg feedback_pt_56;

always @(southern or feedback_pt_56)
  begin
      jacklemon = !southern ^  feedback_pt_56;
  end

reg feedback_pt_57;

always @(beavis or feedback_pt_57)
  begin
      theonion = !beavis |  feedback_pt_57;
  end

reg feedback_pt_58;

always @(ceecensor or feedback_pt_58)
  begin
      chatanooga = !ceecensor &  feedback_pt_58;
  end

reg feedback_pt_59;

always @(johndenver or feedback_pt_59)
  begin
      kebab = !johndenver | !feedback_pt_59;
  end

reg feedback_pt_60;

always @(sleepy or feedback_pt_60)
  begin
      kabar =  sleepy ^  feedback_pt_60;
  end

reg feedback_pt_61;

always @(emails or feedback_pt_61)
  begin
      fullmetal = !emails ^  feedback_pt_61;
  end

reg feedback_pt_62;

always @(vcc or feedback_pt_62)
  begin
      aluminum = !vcc | !feedback_pt_62;
  end

reg feedback_pt_63;

always @(flew or feedback_pt_63)
  begin
      copper =  flew |  feedback_pt_63;
  end

reg feedback_pt_64;

always @(jacklemon or feedback_pt_64)
  begin
      zinc =  jacklemon | !feedback_pt_64;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      platinum <= 1;
    else
      platinum <= yellow;
  end

always @(platinum)
  begin
      feedback_pt_54 = platinum;
  end

always @(platinum)
  begin
      feedback_pt_55 = platinum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tin <= 0;
    else if (hippo)
      tin <= vcc;
  end

always @(tin)
  begin
      feedback_pt_56 = tin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iron <= 0;
    else if (davidlin)
      iron <= marquis;
    else if (vcc)
      iron <= 0;
  end

always @(iron)
  begin
      feedback_pt_57 = iron;
  end

wire fascist_wire;

dffeas fascist_ff (
  .clk(clock0),
  .d(whack),
  .ena(southern),
  .sclr(shudamak),
  .sload(gnd),
  .asdata(kebab),
  .clrn(!reset0),
  .q(fascist_wire)
);

always @(fascist_wire) begin
   anarchist = fascist_wire;
end

always @(anarchist)
  begin
      feedback_pt_58 = anarchist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      capitalist <= 0;
    else if (vonmunchhausen)
      capitalist <= comrade;
    else if (speedyg)
      capitalist <= 0;
  end

always @(capitalist)
  begin
      feedback_pt_59 = capitalist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      socialist <= 0;
    else if (narcotics)
      socialist <= onthepc;
    else if (water)
      socialist <= 0;
  end

always @(socialist)
  begin
      feedback_pt_60 = socialist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moderate <= 0;
    else if (socialist)
      moderate <= 0;
    else if (contractor)
      moderate <= aladdin;
  end

always @(moderate)
  begin
      feedback_pt_61 = moderate;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floating <= 0;
    else
      floating <= surfer;
  end

always @(floating)
  begin
      feedback_pt_62 = floating;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drevil <= 0;
    else
      drevil <= vadar;
  end

always @(drevil)
  begin
      feedback_pt_63 = drevil;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      erncenso <= 0;
    else if (prison)
      erncenso <= ohno;
    else if (kabar)
      erncenso <= 0;
  end

always @(erncenso)
  begin
      feedback_pt_64 = erncenso;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fsncens <= 1;
    else
      fsncens <= gnd;
  end

wire gtncensor_wire;

dffeas gtncensor_ff (
  .clk(clock0),
  .d(achilles),
  .ena(vcc),
  .sclr(vcc),
  .sload(gnd),
  .asdata(bush),
  .clrn(!reset0),
  .q(gtncensor_wire)
);

always @(gtncensor_wire) begin
   tinker = gtncensor_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lunchtime <= 0;
    else
      lunchtime <= fsncens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      roosevelt <= 0;
    else if (chatanooga)
      roosevelt <= 0;
    else if (vcc)
      roosevelt <= ceecensor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hxncensorce <= 0;
    else
      hxncensorce <= mrbill;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      opus <= 0;
    else
      opus <= fullmetal;
  end

wire portnoy_wire;

dffea portnoy_ff (
  .clk(clock0),
  .d(opus),
  .ena(firewiggle),
  .adata(mariollama),
  .clrn(!reset0),
  .q(portnoy_wire)
);

always @(portnoy_wire) begin
   milo = portnoy_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bloom <= 1;
    else
      bloom <= erncenso;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      potatoskin <= 1;
    else
      potatoskin <= spirit;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hotpastrami <= 0;
    else if (float)
      hotpastrami <= 0;
    else if (potatoskin)
      hotpastrami <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      roastbeef <= 0;
    else if (copper)
      roastbeef <= floating;
    else if (yoda)
      roastbeef <= 0;
  end

reg feedback_pt_65;

always @(dweebie or feedback_pt_65)
  begin
      donut = !dweebie &  feedback_pt_65;
  end

reg feedback_pt_66;

always @(gnd or feedback_pt_66)
  begin
      poppyseed = !gnd ^ !feedback_pt_66;
  end

reg feedback_pt_67;

always @(gnd or feedback_pt_67)
  begin
      clubsandwich =  gnd ^ !feedback_pt_67;
  end

reg feedback_pt_68;

always @(hxncensorce or feedback_pt_68)
  begin
      kungfu =  hxncensorce |  feedback_pt_68;
  end

reg feedback_pt_69;

always @(platinum or feedback_pt_69)
  begin
      fatality = !platinum ^  feedback_pt_69;
  end

reg feedback_pt_70;

always @(deathguild or feedback_pt_70)
  begin
      testyour =  deathguild | !feedback_pt_70;
  end

reg feedback_pt_71;

always @(floating or feedback_pt_71)
  begin
      might =  floating &  feedback_pt_71;
  end

reg feedback_pt_72;

always @(comrade or feedback_pt_72)
  begin
      excellent =  comrade ^  feedback_pt_72;
  end

reg feedback_pt_73;

always @(yellow or feedback_pt_73)
  begin
      Iwin = !yellow |  feedback_pt_73;
  end

reg feedback_pt_74;

always @(cocaine or feedback_pt_74)
  begin
      danger =  cocaine &  feedback_pt_74;
  end

reg feedback_pt_75;

always @(hxncensorce or feedback_pt_75)
  begin
      screaming =  hxncensorce | !feedback_pt_75;
  end

reg feedback_pt_76;

always @(gnd or feedback_pt_76)
  begin
      atilla =  gnd &  feedback_pt_76;
  end

wire famulan_wire;

dffea famulan_ff (
  .clk(clock0),
  .d(firewiggle),
  .ena(skywalker),
  .adata(gnd),
  .clrn(!reset0),
  .q(famulan_wire)
);

always @(famulan_wire) begin
   supurb = famulan_wire;
end

always @(supurb)
  begin
      feedback_pt_65 = supurb;
  end

wire jayqueeze_wire;

dffea jayqueeze_ff (
  .clk(clock0),
  .d(flew),
  .ena(vcc),
  .adata(gnd),
  .clrn(!reset0),
  .q(jayqueeze_wire)
);

always @(jayqueeze_wire) begin
   waydeelect = jayqueeze_wire;
end

always @(waydeelect)
  begin
      feedback_pt_66 = waydeelect;
  end

always @(waydeelect)
  begin
      feedback_pt_67 = waydeelect;
  end

always @(waydeelect)
  begin
      feedback_pt_68 = waydeelect;
  end

always @(waydeelect)
  begin
      feedback_pt_69 = waydeelect;
  end

always @(waydeelect)
  begin
      feedback_pt_70 = waydeelect;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iwocensor <= 0;
    else if (unicorn)
      iwocensor <= 0;
    else if (donut)
      iwocensor <= kungfu;
  end

always @(iwocensor)
  begin
      feedback_pt_71 = iwocensor;
  end

wire incompetent_wire;

dffeas incompetent_ff (
  .clk(clock0),
  .d(morenames),
  .ena(dali_llama),
  .sclr(theonion),
  .sload(drevil),
  .asdata(maritime),
  .clrn(!reset0),
  .q(incompetent_wire)
);

always @(incompetent_wire) begin
   secondrate = incompetent_wire;
end

always @(secondrate)
  begin
      feedback_pt_72 = secondrate;
  end

wire inspection_wire;

dffeas inspection_ff (
  .clk(clock0),
  .d(moderate),
  .ena(screaming),
  .sclr(maritime),
  .sload(excellent),
  .asdata(pentium),
  .clrn(!reset0),
  .q(inspection_wire)
);

always @(inspection_wire) begin
   thedon = inspection_wire;
end

always @(thedon)
  begin
      feedback_pt_73 = thedon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marco <= 0;
    else if (hxncensorce)
      marco <= 0;
    else if (vadar)
      marco <= floating;
  end

always @(marco)
  begin
      feedback_pt_74 = marco;
  end

wire cocacola_wire;

dffea cocacola_ff (
  .clk(clock0),
  .d(gnd),
  .ena(moderate),
  .adata(drunken),
  .clrn(!reset0),
  .q(cocacola_wire)
);

always @(cocacola_wire) begin
   ham = cocacola_wire;
end

always @(ham)
  begin
      feedback_pt_75 = ham;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mandarin <= 1;
    else
      mandarin <= gnd;
  end

always @(mandarin)
  begin
      feedback_pt_76 = mandarin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ihilani <= 0;
    else
      ihilani <= tinker;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      october <= 0;
    else
      october <= Iwin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tracy <= 0;
    else if (poppyseed)
      tracy <= 0;
    else if (fallen)
      tracy <= zinc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jjocen <= 1;
    else
      jjocen <= zinc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      meffert <= 0;
    else if (vcc)
      meffert <= pyro;
    else if (achilles)
      meffert <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bismuth <= 0;
    else if (marco)
      bismuth <= pyro;
    else if (aladdin)
      bismuth <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floride <= 0;
    else if (fullmetal)
      floride <= firewiggle;
  end

wire oranges_wire;

dffeas oranges_ff (
  .clk(clock0),
  .d(fatality),
  .ena(vcc),
  .sclr(southern),
  .sload(tin),
  .asdata(vcc),
  .clrn(!reset0),
  .q(oranges_wire)
);

always @(oranges_wire) begin
   pyromaniac = oranges_wire;
end

wire junkie_wire;

dffea junkie_ff (
  .clk(clock0),
  .d(milo),
  .ena(vcc),
  .adata(vcc),
  .clrn(!reset0),
  .q(junkie_wire)
);

always @(junkie_wire) begin
   waster = junkie_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burner <= 0;
    else
      burner <= roosevelt;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crackhead <= 1;
    else
      crackhead <= pyromaniac;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stoner <= 1;
    else
      stoner <= clubsandwich;
  end

// Note - state 1 is unreachable
// Note - state 3 is unreachable
// Note - state 4 is unreachable
// State Mek drugie Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drugie <= drugie_0;
    else
      case (drugie)
        drugie_0: begin
          if ({yoda,kebab,burner,vcc} == 5)
            drugie <= drugie_2;
          else
            drugie <= drugie_0;
          end
        drugie_1: begin
          if ({yoda,kebab,burner,vcc} == 2)
            drugie <= drugie_2;
          else if ({yoda,kebab,burner,vcc} == 12)
            drugie <= drugie_2;
          else if ({yoda,kebab,burner,vcc} == 1)
            drugie <= drugie_3;
          else
            drugie <= drugie_1;
          end
        drugie_2: begin
          if ({yoda,kebab,burner,vcc} == 0)
            drugie <= drugie_0;
          else if ({yoda,kebab,burner,vcc} == 2)
            drugie <= drugie_5;
          else if ({yoda,kebab,burner,vcc} == 10)
            drugie <= drugie_0;
          else
            drugie <= drugie_2;
          end
        drugie_3: begin
          if ({yoda,kebab,burner,vcc} == 1)
            drugie <= drugie_1;
          else if ({yoda,kebab,burner,vcc} == 11)
            drugie <= drugie_2;
          else if ({yoda,kebab,burner,vcc} == 0)
            drugie <= drugie_5;
          else if ({yoda,kebab,burner,vcc} == 4)
            drugie <= drugie_0;
          else if ({yoda,kebab,burner,vcc} == 14)
            drugie <= drugie_3;
          else
            drugie <= drugie_3;
          end
        drugie_4: begin
          if ({yoda,kebab,burner,vcc} == 9)
            drugie <= drugie_1;
          else if ({yoda,kebab,burner,vcc} == 10)
            drugie <= drugie_5;
          else
            drugie <= drugie_4;
          end
        drugie_5: begin
          if ({yoda,kebab,burner,vcc} == 2)
            drugie <= drugie_5;
          else if ({yoda,kebab,burner,vcc} == 5)
            drugie <= drugie_0;
          else
            drugie <= drugie_5;
          end
        default: drugie <= drugie_0;
      endcase
  end

// State Mek drugie Output logic
always @(drugie)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (drugie)
        drugie_0: begin
            chemical = 1;
            brothers = 0;
            tunafish = 0;
            eggsalad = 0;
            agitator = 0;
            postulator = 0;
            satanist = 1;
            plagarist = 0;
            whoiswho = 0;
            money = 1;
            morrison = 1;
            firewalk = 1;
            withme = 1;
            palmer = 1;
            banality = 1;
            brutality = 1;
          end
        drugie_1: begin
            chemical = 1;
            brothers = 0;
            tunafish = 0;
            eggsalad = 0;
            agitator = 1;
            postulator = 1;
            satanist = 0;
            plagarist = 0;
            whoiswho = 0;
            money = 1;
            morrison = 0;
            firewalk = 0;
            withme = 1;
            palmer = 0;
            banality = 0;
            brutality = 0;
          end
        drugie_2: begin
            chemical = 0;
            brothers = 0;
            tunafish = 1;
            eggsalad = 0;
            agitator = 0;
            postulator = 0;
            satanist = 0;
            plagarist = 1;
            whoiswho = 0;
            money = 1;
            morrison = 1;
            firewalk = 1;
            withme = 1;
            palmer = 1;
            banality = 1;
            brutality = 0;
          end
        drugie_3: begin
            chemical = 0;
            brothers = 0;
            tunafish = 0;
            eggsalad = 1;
            agitator = 0;
            postulator = 0;
            satanist = 1;
            plagarist = 1;
            whoiswho = 0;
            money = 0;
            morrison = 1;
            firewalk = 1;
            withme = 0;
            palmer = 1;
            banality = 1;
            brutality = 0;
          end
        drugie_4: begin
            chemical = 0;
            brothers = 0;
            tunafish = 0;
            eggsalad = 0;
            agitator = 1;
            postulator = 0;
            satanist = 1;
            plagarist = 1;
            whoiswho = 1;
            money = 1;
            morrison = 1;
            firewalk = 0;
            withme = 1;
            palmer = 1;
            banality = 0;
            brutality = 0;
          end
        drugie_5: begin
            chemical = 0;
            brothers = 0;
            tunafish = 0;
            eggsalad = 0;
            agitator = 0;
            postulator = 1;
            satanist = 1;
            plagarist = 1;
            whoiswho = 1;
            money = 1;
            morrison = 1;
            firewalk = 1;
            withme = 1;
            palmer = 0;
            banality = 1;
            brutality = 0;
          end
        default: begin
            chemical = 0;
            brothers = 0;
            tunafish = 0;
            eggsalad = 1;
            agitator = 1;
            postulator = 0;
            satanist = 1;
            plagarist = 1;
            whoiswho = 1;
            money = 1;
            morrison = 1;
            firewalk = 0;
            withme = 1;
            palmer = 1;
            banality = 0;
            brutality = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire hurt_out;
nut_002_lut #(2) nut_002_lut_inst_hurt (
  .din({gnd,hotpastrami}),
  .mask(4'b0001),
  .out(hurt_out)
);

always @(hurt_out)
begin
   fury = hurt_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire yoku_out;
nut_002_lut #(4) nut_002_lut_inst_yoku (
  .din({money,atilla,aluminum,stoner}),
  .mask(16'h798c),
  .out(yoku_out)
);

always @(yoku_out)
begin
   tobe = yoku_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire geisha_out;
nut_002_lut #(1) nut_002_lut_inst_geisha (
  .din({brothers}),
  .mask(2'b01),
  .out(geisha_out)
);

always @(geisha_out)
begin
   simasu = geisha_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire star_out;
nut_002_lut #(6) nut_002_lut_inst_star (
  .din({danger,skywalker,roastbeef,palmer,bloom,gnd}),
  .mask(64'hca7cf8d52098db14),
  .out(star_out)
);

always @(star_out)
begin
   pictures = star_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire ready_out;
nut_002_lut #(3) nut_002_lut_inst_ready (
  .din({drunken,withme,marco}),
  .mask(8'ha9),
  .out(ready_out)
);

always @(ready_out)
begin
   show = ready_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire lemon_out;
nut_002_lut #(1) nut_002_lut_inst_lemon (
  .din({bismuth}),
  .mask(2'b00),
  .out(lemon_out)
);

always @(lemon_out)
begin
   gokidsgo = lemon_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire speeding_out;
nut_002_lut #(5) nut_002_lut_inst_speeding (
  .din({vcc,whoiswho,vcc,gnd,stoner}),
  .mask(32'b01010100010110000001000010000000),
  .out(speeding_out)
);

always @(speeding_out)
begin
   winner = speeding_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire grams_out;
nut_002_lut #(2) nut_002_lut_inst_grams (
  .din({gnd,maritime}),
  .mask(4'h2),
  .out(grams_out)
);

always @(grams_out)
begin
   hiway = grams_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire bust_out;
nut_002_lut #(6) nut_002_lut_inst_bust (
  .din({gnd,gnd,floating,aluminum,ham,agitator}),
  .mask(64'b0100011001000001000110010011100010001001000011001010100100000000),
  .out(bust_out)
);

always @(bust_out)
begin
   kdqcens = bust_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire foryou_out;
nut_002_lut #(6) nut_002_lut_inst_foryou (
  .din({brothers,ihilani,gnd,fury,dutch,vcc}),
  .mask(64'h918f3e3e46d89154),
  .out(foryou_out)
);

always @(foryou_out)
begin
   gotone = foryou_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire moreand_out;
nut_002_lut #(1) nut_002_lut_inst_moreand (
  .din({iterate}),
  .mask(2'b00),
  .out(moreand_out)
);

always @(moreand_out)
begin
   sogood = moreand_out;
end


initial begin
    {faster,elementary,sixyears,graduated,overeducated} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({atilla,dutch,sogood,gnd,firewiggle} < {gnd,kdqcens,vcc,fury,boots})
       {faster,elementary,sixyears,graduated,overeducated} <= {gnd,kdqcens,vcc,fury,boots};
    else
       {faster,elementary,sixyears,graduated,overeducated} <= {atilla,dutch,sogood,gnd,firewiggle};
  end

// AND all of these bits together
always @(fullmetal or vcc)
  begin
      notalot = & {fullmetal,vcc};
  end

// Random 5 in 5 out table
always @(gnd or tracy or budlite or spyro or gnd)
  begin
    casex ({gnd,tracy,budlite,spyro,gnd})
      0: {nation,protest,animal,vegan,vegetarian}=1;
      1: {nation,protest,animal,vegan,vegetarian}=19;
      2: {nation,protest,animal,vegan,vegetarian}=25;
      3: {nation,protest,animal,vegan,vegetarian}=2;
      4: {nation,protest,animal,vegan,vegetarian}=13;
      5: {nation,protest,animal,vegan,vegetarian}=12;
      6: {nation,protest,animal,vegan,vegetarian}=22;
      7: {nation,protest,animal,vegan,vegetarian}=28;
      8: {nation,protest,animal,vegan,vegetarian}=21;
      9: {nation,protest,animal,vegan,vegetarian}=23;
      10: {nation,protest,animal,vegan,vegetarian}=22;
      11: {nation,protest,animal,vegan,vegetarian}=20;
      12: {nation,protest,animal,vegan,vegetarian}=1;
      13: {nation,protest,animal,vegan,vegetarian}=3;
      14: {nation,protest,animal,vegan,vegetarian}=5;
      15: {nation,protest,animal,vegan,vegetarian}=1;
      16: {nation,protest,animal,vegan,vegetarian}=31;
      17: {nation,protest,animal,vegan,vegetarian}=23;
      18: {nation,protest,animal,vegan,vegetarian}=12;
      19: {nation,protest,animal,vegan,vegetarian}=23;
      20: {nation,protest,animal,vegan,vegetarian}=15;
      21: {nation,protest,animal,vegan,vegetarian}=11;
      22: {nation,protest,animal,vegan,vegetarian}=4;
      23: {nation,protest,animal,vegan,vegetarian}=5;
      24: {nation,protest,animal,vegan,vegetarian}=12;
      25: {nation,protest,animal,vegan,vegetarian}=28;
      26: {nation,protest,animal,vegan,vegetarian}=24;
      27: {nation,protest,animal,vegan,vegetarian}=18;
      28: {nation,protest,animal,vegan,vegetarian}=14;
      29: {nation,protest,animal,vegan,vegetarian}=3;
      30: {nation,protest,animal,vegan,vegetarian}=23;
      31: {nation,protest,animal,vegan,vegetarian}=28;
      default: {nation,protest,animal,vegan,vegetarian}=0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      liberation <= 0;
    else
    case ({bush,hulk})
       0 : liberation <= liberation;
       1 : liberation <= gnd;
       2 : liberation <= liberation;
       3 : liberation <= gotone;
       default : liberation <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      psycho <= 0;
    else
    case ({might,boots})
       0 : psycho <= psycho;
       1 : psycho <= psycho;
       2 : psycho <= morrison;
       3 : psycho <= psycho;
       default : psycho <= 0;
    endcase
  end

reg feedback_pt_77;

always @(overeducated or feedback_pt_77)
  begin
      extremist =  overeducated ^  feedback_pt_77;
  end

reg feedback_pt_78;

always @(gnd or feedback_pt_78)
  begin
      fruitcake =  gnd | !feedback_pt_78;
  end

reg feedback_pt_79;

always @(liberation or feedback_pt_79)
  begin
      zealot =  liberation |  feedback_pt_79;
  end

reg feedback_pt_80;

always @(satanist or feedback_pt_80)
  begin
      chainsaw =  satanist ^  feedback_pt_80;
  end

reg feedback_pt_81;

always @(gnd or feedback_pt_81)
  begin
      rasp =  gnd & !feedback_pt_81;
  end

reg feedback_pt_82;

always @(notalot or feedback_pt_82)
  begin
      square = !notalot ^ !feedback_pt_82;
  end

reg feedback_pt_83;

always @(meffert or feedback_pt_83)
  begin
      romex =  meffert | !feedback_pt_83;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jxnbox <= 0;
    else if (gnd)
      jxnbox <= tobe;
    else if (testyour)
      jxnbox <= 0;
  end

always @(jxnbox)
  begin
      feedback_pt_77 = jxnbox;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      knockout <= 1;
    else
      knockout <= square;
  end

always @(knockout)
  begin
      feedback_pt_78 = knockout;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      curie <= 0;
    else
      curie <= vcc;
  end

always @(curie)
  begin
      feedback_pt_79 = curie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gutter <= 0;
    else if (knockout)
      gutter <= gnd;
  end

always @(gutter)
  begin
      feedback_pt_80 = gutter;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      plaster <= 0;
    else if (animal)
      plaster <= gotone;
  end

always @(plaster)
  begin
      feedback_pt_81 = plaster;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wood <= 0;
    else if (agitator)
      wood <= 0;
    else if (fatality)
      wood <= gnd;
  end

always @(wood)
  begin
      feedback_pt_82 = wood;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rampacker <= 0;
    else
      rampacker <= might;
  end

always @(rampacker)
  begin
      feedback_pt_83 = rampacker;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      greenbay <= 0;
    else if (kdqcens)
      greenbay <= 0;
    else if (faster)
      greenbay <= tunafish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      raiders <= 1;
    else
      raiders <= kennyg;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      giants <= 0;
    else if (eggsalad)
      giants <= notalot;
    else if (floride)
      giants <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yankees <= 0;
    else
      yankees <= pyromaniac;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nyc <= 0;
    else if (postulator)
      nyc <= boots;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      broadway <= 0;
    else if (gnd)
      broadway <= 0;
    else if (overeducated)
      broadway <= tin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dirty <= 0;
    else
      dirty <= october;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      noyoudirty <= 0;
    else
      noyoudirty <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      muggers <= 0;
    else if (liberation)
      muggers <= gnd;
  end

// const - A
always @(rampacker or yankees or greenbay or jjocen or atilla)
  begin
    {whattime,sanity,michelle,rocks,legos,eatem,blanket,china} = 134 - {rampacker,yankees,greenbay,jjocen,atilla};
  end

// 4 bit add sub
always @(curie or faster or chemical or nyc or gnd or whattime or tin or kennyg)
  begin
    {usa,holland,puertorico,mexico} = 
		{curie,faster,chemical,nyc} - 
		{gnd,whattime,tin,kennyg};
  end

// Ternary sign extend bait
always @(gnd or gnd or gnd or gnd or michelle or gnd or dirty or spyro or gokidsgo or vcc or screaming or surfer or
         skywalker or skywalker or skywalker or skywalker or skywalker or skywalker or skywalker or skywalker or chemical or sixyears or banality or plagarist or
         usa or usa or usa or usa or usa or usa or usa or chainsaw or satanist or liberation or gnd or china)
  begin
    {spain,greenland,scotland,england,iceland,romulus,remus,cain,abel,zipporah,issac,abraham} = 
        {gnd,gnd,gnd,gnd,michelle,gnd,dirty,spyro,gokidsgo,vcc,screaming,surfer} +
        {skywalker,skywalker,skywalker,skywalker,skywalker,skywalker,skywalker,skywalker,chemical,sixyears,banality,plagarist} +
        {usa,usa,usa,usa,usa,usa,usa,chainsaw,satanist,liberation,gnd,china};
  end

// Bus inputs for MACing
reg  [19:0] jacob_a;
reg  [12:0] jacob_b;
reg signed [19:0] jacob_c;
reg  [12:0] jacob_d;
initial jacob_a <= 0;
always @(posedge clock0) begin
  jacob_a <= {hiway,cain,firewalk,greenland,tin,firewalk,faster,whoiswho,vcc,vcc,scotland,unicorn,extremist,wood,gnd,vcc,blanket,fallen,fallen,liberation};
end
always @(lunchtime or sanity or banality or remus or waster or gnd or greenbay or vcc or winner or ham or sixyears or tunafish or giants) begin
  jacob_b = {lunchtime,sanity,banality,remus,waster,gnd,greenbay,vcc,winner,ham,sixyears,tunafish,giants};
end
initial jacob_c <= 0;
always @(posedge clock0) begin
  jacob_c <= {tobe,vcc,bismuth,simasu,palmer,gutter,anarchist,rocks,sixyears,liberation,mexico,vcc,usa,gnd,faster,brutality,remus,prison,vcc,mandarin};
end
always @(overeducated or hxncensorce or jjocen or fruitcake or floating or gnd or vcc or holland or vegan or vcc or china or eatem or gnd) begin
  jacob_d = {overeducated,hxncensorce,jjocen,fruitcake,floating,gnd,vcc,holland,vegan,vcc,china,eatem,gnd};
end

// MAC inference bait
always @(jacob_a or jacob_b or jacob_c or jacob_d)
  begin
    {joseph,dreamcoat,ringlingbros,lxtcen,terrance,piggish,cryptic,crapeteria,mdtcensorc,nihlist,moses,burning,nhtcenso,oitcen,daughter,wine,gin,tonic,rum} = 
        ( jacob_a *
        jacob_b) +
        ( jacob_c *
         jacob_d);
  end

reg feedback_pt_84;

always @(gnd or feedback_pt_84)
  begin
      scotch = !gnd |  feedback_pt_84;
  end

reg feedback_pt_85;

always @(supurb or feedback_pt_85)
  begin
      larry = !supurb &  feedback_pt_85;
  end

reg feedback_pt_86;

always @(excellent or feedback_pt_86)
  begin
      curly =  excellent ^ !feedback_pt_86;
  end

reg feedback_pt_87;

always @(ringlingbros or feedback_pt_87)
  begin
      barnum =  ringlingbros | !feedback_pt_87;
  end

reg feedback_pt_88;

always @(whoiswho or feedback_pt_88)
  begin
      shemp =  whoiswho ^ !feedback_pt_88;
  end

reg feedback_pt_89;

always @(spain or feedback_pt_89)
  begin
      wiggum =  spain ^ !feedback_pt_89;
  end

reg feedback_pt_90;

always @(crapeteria or feedback_pt_90)
  begin
      bart =  crapeteria | !feedback_pt_90;
  end

reg feedback_pt_91;

always @(theonion or feedback_pt_91)
  begin
      lisa = !theonion ^ !feedback_pt_91;
  end

reg feedback_pt_92;

always @(puertorico or feedback_pt_92)
  begin
      marge = !puertorico | !feedback_pt_92;
  end

reg feedback_pt_93;

always @(usa or feedback_pt_93)
  begin
      homerun =  usa ^ !feedback_pt_93;
  end

reg feedback_pt_94;

always @(whoiswho or feedback_pt_94)
  begin
      barney = !whoiswho & !feedback_pt_94;
  end

reg feedback_pt_95;

always @(moses or feedback_pt_95)
  begin
      skinner =  moses ^  feedback_pt_95;
  end

reg feedback_pt_96;

always @(vcc or feedback_pt_96)
  begin
      krabapple = !vcc |  feedback_pt_96;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tarzan <= 0;
    else
      tarzan <= gnd;
  end

always @(tarzan)
  begin
      feedback_pt_84 = tarzan;
  end

always @(tarzan)
  begin
      feedback_pt_85 = tarzan;
  end

always @(tarzan)
  begin
      feedback_pt_86 = tarzan;
  end

always @(tarzan)
  begin
      feedback_pt_87 = tarzan;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moe <= 1;
    else
      moe <= raiders;
  end

always @(moe)
  begin
      feedback_pt_88 = moe;
  end

wire smithers_wire;

dffeas smithers_ff (
  .clk(clock0),
  .d(legos),
  .ena(raiders),
  .sclr(shemp),
  .sload(tarzan),
  .asdata(gnd),
  .clrn(!reset0),
  .q(smithers_wire)
);

always @(smithers_wire) begin
   comicbook = smithers_wire;
end

always @(comicbook)
  begin
      feedback_pt_89 = comicbook;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      worstdesignever <= 1;
    else
      worstdesignever <= hxncensorce;
  end

always @(worstdesignever)
  begin
      feedback_pt_90 = worstdesignever;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flanders <= 0;
    else if (vegetarian)
      flanders <= tobe;
    else if (crackhead)
      flanders <= 0;
  end

always @(flanders)
  begin
      feedback_pt_91 = flanders;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      heidi <= 1;
    else
      heidi <= gnd;
  end

always @(heidi)
  begin
      feedback_pt_92 = heidi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      steaming <= 0;
    else
      steaming <= raiders;
  end

always @(steaming)
  begin
      feedback_pt_93 = steaming;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      milhouse <= 0;
    else
      milhouse <= jjocen;
  end

always @(milhouse)
  begin
      feedback_pt_94 = milhouse;
  end

wire rod_wire;

dffea rod_ff (
  .clk(clock0),
  .d(skinner),
  .ena(wood),
  .adata(elementary),
  .clrn(!reset0),
  .q(rod_wire)
);

always @(rod_wire) begin
   todd = rod_wire;
end

always @(todd)
  begin
      feedback_pt_95 = todd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chewbacca <= 0;
    else if (gnd)
      chewbacca <= 0;
    else if (socialist)
      chewbacca <= dirty;
  end

always @(chewbacca)
  begin
      feedback_pt_96 = chewbacca;
  end

wire timmy_wire;

dffeas timmy_ff (
  .clk(clock0),
  .d(protest),
  .ena(burning),
  .sclr(anarchist),
  .sload(wine),
  .asdata(krabapple),
  .clrn(!reset0),
  .q(timmy_wire)
);

always @(timmy_wire) begin
   tukatuk = timmy_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      slobbering <= 0;
    else if (broadway)
      slobbering <= skinner;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weevil <= 1;
    else
      weevil <= oitcen;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      psucensorc <= 1;
    else
      psucensorc <= moses;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deuce <= 0;
    else if (pictures)
      deuce <= gnd;
    else if (show)
      deuce <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eeevil <= 0;
    else if (todd)
      eeevil <= lisa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      intuit <= 1;
    else
      intuit <= gin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bert <= 0;
    else if (abraham)
      bert <= 0;
    else if (romulus)
      bert <= dreamcoat;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ernie <= 0;
    else if (abel)
      ernie <= broadway;
    else if (gutter)
      ernie <= 0;
  end

wire life_wire;

dffea life_ff (
  .clk(clock0),
  .d(vcc),
  .ena(vcc),
  .adata(prison),
  .clrn(!reset0),
  .q(life_wire)
);

always @(life_wire) begin
   snuffleupagus = life_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peta <= 1;
    else
      peta <= terrance;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      happyists <= 0;
    else
      happyists <= theonion;
  end

// State Mek atomic Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atomic <= atomic_0;
    else
      case (atomic)
        atomic_0: begin
          if ({gutter,mdtcensorc,nation,zealot} == 9)
            atomic <= atomic_6;
          else if ({gutter,mdtcensorc,nation,zealot} == 7)
            atomic <= atomic_0;
          else
            atomic <= atomic_0;
          end
        atomic_1: begin
          if ({gutter,mdtcensorc,nation,zealot} == 5)
            atomic <= atomic_0;
          else if ({gutter,mdtcensorc,nation,zealot} == 14)
            atomic <= atomic_0;
          else if ({gutter,mdtcensorc,nation,zealot} == 10)
            atomic <= atomic_7;
          else
            atomic <= atomic_1;
          end
        atomic_2: begin
          if ({gutter,mdtcensorc,nation,zealot} == 5)
            atomic <= atomic_8;
          else if ({gutter,mdtcensorc,nation,zealot} == 9)
            atomic <= atomic_1;
          else
            atomic <= atomic_2;
          end
        atomic_3: begin
          if ({gutter,mdtcensorc,nation,zealot} == 5)
            atomic <= atomic_1;
          else if ({gutter,mdtcensorc,nation,zealot} == 4)
            atomic <= atomic_7;
          else
            atomic <= atomic_3;
          end
        atomic_4: begin
          if ({gutter,mdtcensorc,nation,zealot} == 0)
            atomic <= atomic_4;
          else
            atomic <= atomic_4;
          end
        atomic_5: begin
          if ({gutter,mdtcensorc,nation,zealot} == 7)
            atomic <= atomic_8;
          else
            atomic <= atomic_5;
          end
        atomic_6: begin
          if ({gutter,mdtcensorc,nation,zealot} == 6)
            atomic <= atomic_0;
          else if ({gutter,mdtcensorc,nation,zealot} == 5)
            atomic <= atomic_4;
          else if ({gutter,mdtcensorc,nation,zealot} == 14)
            atomic <= atomic_4;
          else if ({gutter,mdtcensorc,nation,zealot} == 15)
            atomic <= atomic_4;
          else if ({gutter,mdtcensorc,nation,zealot} == 3)
            atomic <= atomic_2;
          else if ({gutter,mdtcensorc,nation,zealot} == 2)
            atomic <= atomic_5;
          else
            atomic <= atomic_6;
          end
        atomic_7: begin
          if ({gutter,mdtcensorc,nation,zealot} == 9)
            atomic <= atomic_8;
          else
            atomic <= atomic_7;
          end
        atomic_8: begin
          if ({gutter,mdtcensorc,nation,zealot} == 4)
            atomic <= atomic_5;
          else if ({gutter,mdtcensorc,nation,zealot} == 9)
            atomic <= atomic_8;
          else if ({gutter,mdtcensorc,nation,zealot} == 2)
            atomic <= atomic_6;
          else if ({gutter,mdtcensorc,nation,zealot} == 7)
            atomic <= atomic_0;
          else if ({gutter,mdtcensorc,nation,zealot} == 12)
            atomic <= atomic_7;
          else if ({gutter,mdtcensorc,nation,zealot} == 13)
            atomic <= atomic_3;
          else
            atomic <= atomic_8;
          end
        default: atomic <= atomic_0;
      endcase
  end

// State Mek atomic Output logic
always @(atomic)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (atomic)
        atomic_0: begin
            firemonkey = 0;
            qfvcensorce = 0;
            captain = 0;
            rhvcens = 0;
            roid = 0;
            itchy = 1;
            squad = 1;
            joey = 1;
          end
        atomic_1: begin
            firemonkey = 0;
            qfvcensorce = 1;
            captain = 0;
            rhvcens = 0;
            roid = 0;
            itchy = 0;
            squad = 0;
            joey = 0;
          end
        atomic_2: begin
            firemonkey = 0;
            qfvcensorce = 0;
            captain = 1;
            rhvcens = 0;
            roid = 0;
            itchy = 0;
            squad = 0;
            joey = 0;
          end
        atomic_3: begin
            firemonkey = 1;
            qfvcensorce = 1;
            captain = 0;
            rhvcens = 0;
            roid = 0;
            itchy = 0;
            squad = 1;
            joey = 0;
          end
        atomic_4: begin
            firemonkey = 0;
            qfvcensorce = 0;
            captain = 1;
            rhvcens = 0;
            roid = 1;
            itchy = 0;
            squad = 0;
            joey = 0;
          end
        atomic_5: begin
            firemonkey = 0;
            qfvcensorce = 0;
            captain = 0;
            rhvcens = 0;
            roid = 0;
            itchy = 1;
            squad = 0;
            joey = 0;
          end
        atomic_6: begin
            firemonkey = 0;
            qfvcensorce = 0;
            captain = 0;
            rhvcens = 0;
            roid = 0;
            itchy = 0;
            squad = 1;
            joey = 0;
          end
        atomic_7: begin
            firemonkey = 1;
            qfvcensorce = 1;
            captain = 1;
            rhvcens = 0;
            roid = 1;
            itchy = 1;
            squad = 1;
            joey = 0;
          end
        atomic_8: begin
            firemonkey = 0;
            qfvcensorce = 0;
            captain = 0;
            rhvcens = 0;
            roid = 0;
            itchy = 0;
            squad = 0;
            joey = 0;
          end
        default: begin
            firemonkey = 0;
            qfvcensorce = 1;
            captain = 0;
            rhvcens = 1;
            roid = 0;
            itchy = 1;
            squad = 0;
            joey = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire stoned_out;
nut_002_lut #(5) nut_002_lut_inst_stoned (
  .din({rum,vcc,gnd,peta,rhvcens}),
  .mask(32'b01000000010100100100001000010010),
  .out(stoned_out)
);

always @(stoned_out)
begin
   ramone = stoned_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire south_out;
nut_002_lut #(3) nut_002_lut_inst_south (
  .din({vcc,milhouse,cryptic}),
  .mask(8'b10000000),
  .out(south_out)
);

always @(south_out)
begin
   often = south_out;
end

// Greater Equal Less compare
always @(money or gnd or gnd or milhouse or firemonkey or overeducated)
  begin
    if ({money,gnd,gnd} > {milhouse,firemonkey,overeducated})
       {edible,srvcensorce,on_sale} = 3'b100;
    else if ({money,gnd,gnd} < {milhouse,firemonkey,overeducated})
       {edible,srvcensorce,on_sale} = 3'b010;
    else
       {edible,srvcensorce,on_sale} = 3'b001;
  end

// 4 bit add sub
always @(rhvcens or rampacker or chewbacca or chewbacca or intuit or happyists or edible or gnd)
  begin
    {aisle_two,dinoblaster,crunchyfrog,nobody} = 
		{rhvcens,rampacker,chewbacca,chewbacca} + 
		{intuit,happyists,edible,gnd};
  end

// XOR all of these bits together
always @(bert or china or on_sale or vcc or piggish or slobbering or vcc or tonic or intuit or zinc or gnd)
  begin
      expects_the = ^ {bert,china,on_sale,vcc,piggish,slobbering,vcc,tonic,intuit,zinc,gnd};
  end


// Building a 3->8 1 hot decoder
reg [7:0] spanish_dec_out;
reg [2:0] spanish_dec_in;
  always @(itchy or chewbacca or leidiot)
  begin
    spanish_dec_in = {itchy,chewbacca,leidiot};
  end

  always @(spanish_dec_in)
  begin
    spanish_dec_out=0;
    spanish_dec_out[spanish_dec_in]=1;
  end

  always @(spanish_dec_out)
  begin
    {inquisition,chief,weapons,fear,surprise,efficiency,fanatical,devotion} = spanish_dec_out;
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      the_pope <= 0;
    else
    case ({tunafish,vcc})
       0 : the_pope <= jxnbox;
       1 : the_pope <= crunchyfrog;
       2 : the_pope <= the_pope;
       3 : the_pope <= crunchyfrog;
       default : the_pope <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yummy <= 0;
    else
    case ({the_pope,vcc})
       0 : yummy <= yummy;
       1 : yummy <= yummy;
       2 : yummy <= yummy;
       3 : yummy <= tunafish;
       default : yummy <= 0;
    endcase
  end

reg feedback_pt_97;

always @(eeevil or feedback_pt_97)
  begin
      love_in =  eeevil ^ !feedback_pt_97;
  end

reg feedback_pt_98;

always @(efficiency or feedback_pt_98)
  begin
      my_tummy = !efficiency |  feedback_pt_98;
  end

reg feedback_pt_99;

always @(skywalker or feedback_pt_99)
  begin
      po = !skywalker | !feedback_pt_99;
  end

reg feedback_pt_100;

always @(moe or feedback_pt_100)
  begin
      lala = !moe & !feedback_pt_100;
  end

reg feedback_pt_101;

always @(england or feedback_pt_101)
  begin
      dipsy = !england & !feedback_pt_101;
  end

reg feedback_pt_102;

always @(mdtcensorc or feedback_pt_102)
  begin
      touch =  mdtcensorc | !feedback_pt_102;
  end

reg feedback_pt_103;

always @(vegan or feedback_pt_103)
  begin
      kissthesky = !vegan | !feedback_pt_103;
  end

reg feedback_pt_104;

always @(flanders or feedback_pt_104)
  begin
      peopleeater =  flanders | !feedback_pt_104;
  end

reg feedback_pt_105;

always @(vcc or feedback_pt_105)
  begin
      haze = !vcc ^ !feedback_pt_105;
  end

reg feedback_pt_106;

always @(squad or feedback_pt_106)
  begin
      timingmodel = !squad | !feedback_pt_106;
  end

reg feedback_pt_107;

always @(gnd or feedback_pt_107)
  begin
      plumber =  gnd ^  feedback_pt_107;
  end

reg feedback_pt_108;

always @(gnd or feedback_pt_108)
  begin
      odin = !gnd ^ !feedback_pt_108;
  end

reg feedback_pt_109;

always @(deuce or feedback_pt_109)
  begin
      thor =  deuce | !feedback_pt_109;
  end

reg feedback_pt_110;

always @(plaster or feedback_pt_110)
  begin
      jupiter =  plaster ^ !feedback_pt_110;
  end

reg feedback_pt_111;

always @(vcc or feedback_pt_111)
  begin
      zeus = !vcc &  feedback_pt_111;
  end

reg feedback_pt_112;

always @(gnd or feedback_pt_112)
  begin
      athena = !gnd | !feedback_pt_112;
  end

reg feedback_pt_113;

always @(nobody or feedback_pt_113)
  begin
      minerva = !nobody | !feedback_pt_113;
  end

reg feedback_pt_114;

always @(deuce or feedback_pt_114)
  begin
      mars = !deuce ^ !feedback_pt_114;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      venus <= 0;
    else if (weapons)
      venus <= 0;
    else if (gnd)
      venus <= gnd;
  end

always @(venus)
  begin
      feedback_pt_97 = venus;
  end

always @(venus)
  begin
      feedback_pt_98 = venus;
  end

always @(venus)
  begin
      feedback_pt_99 = venus;
  end

always @(venus)
  begin
      feedback_pt_100 = venus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pluto <= 0;
    else
      pluto <= gnd;
  end

always @(pluto)
  begin
      feedback_pt_101 = pluto;
  end

always @(pluto)
  begin
      feedback_pt_102 = pluto;
  end

always @(pluto)
  begin
      feedback_pt_103 = pluto;
  end

always @(pluto)
  begin
      feedback_pt_104 = pluto;
  end

always @(pluto)
  begin
      feedback_pt_105 = pluto;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      neptune <= 0;
    else
      neptune <= candle;
  end

always @(neptune)
  begin
      feedback_pt_106 = neptune;
  end

wire ariel_wire;

dffea ariel_ff (
  .clk(clock0),
  .d(plumber),
  .ena(zeus),
  .adata(vcc),
  .clrn(!reset0),
  .q(ariel_wire)
);

always @(ariel_wire) begin
   sebastian = ariel_wire;
end

always @(sebastian)
  begin
      feedback_pt_107 = sebastian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bach <= 0;
    else if (cryptic)
      bach <= 0;
    else if (money)
      bach <= remus;
  end

always @(bach)
  begin
      feedback_pt_108 = bach;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mozart <= 0;
    else if (bach)
      mozart <= surprise;
    else if (sanity)
      mozart <= 0;
  end

always @(mozart)
  begin
      feedback_pt_109 = mozart;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goodmonkey <= 0;
    else if (vcc)
      goodmonkey <= 0;
    else if (gnd)
      goodmonkey <= heidi;
  end

always @(goodmonkey)
  begin
      feedback_pt_110 = goodmonkey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      badmonkey <= 0;
    else if (vcc)
      badmonkey <= vcc;
  end

always @(badmonkey)
  begin
      feedback_pt_111 = badmonkey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      guy <= 0;
    else if (socialist)
      guy <= psucensorc;
    else if (weevil)
      guy <= 0;
  end

always @(guy)
  begin
      feedback_pt_112 = guy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      partners <= 0;
    else if (qfvcensorce)
      partners <= 0;
    else if (gnd)
      partners <= guy;
  end

always @(partners)
  begin
      feedback_pt_113 = partners;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cubish <= 1;
    else
      cubish <= qfvcensorce;
  end

always @(cubish)
  begin
      feedback_pt_114 = cubish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      solder <= 0;
    else if (vcc)
      solder <= 0;
    else if (fanatical)
      solder <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      valve <= 0;
    else
      valve <= firewalk;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      furnace <= 0;
    else if (vcc)
      furnace <= 0;
    else if (nhtcenso)
      furnace <= show;
  end

wire pilot_wire;

dffeas pilot_ff (
  .clk(clock0),
  .d(crapeteria),
  .ena(solder),
  .sclr(gnd),
  .sload(tunafish),
  .asdata(gnd),
  .clrn(!reset0),
  .q(pilot_wire)
);

always @(pilot_wire) begin
   leaky = pilot_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      potter <= 0;
    else if (athena)
      potter <= barney;
    else if (snuffleupagus)
      potter <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drax <= 1;
    else
      drax <= mdtcensorc;
  end

wire moonraker_wire;

dffeas moonraker_ff (
  .clk(clock0),
  .d(ihilani),
  .ena(faster),
  .sclr(joseph),
  .sload(haze),
  .asdata(protest),
  .clrn(!reset0),
  .q(moonraker_wire)
);

always @(moonraker_wire) begin
   killme = moonraker_wire;
end

wire tyycensor_wire;

dffeas tyycensor_ff (
  .clk(clock0),
  .d(tonic),
  .ena(terrance),
  .sclr(eeevil),
  .sload(inquisition),
  .asdata(waster),
  .clrn(!reset0),
  .q(tyycensor_wire)
);

always @(tyycensor_wire) begin
   sortout = tyycensor_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sgates <= 1;
    else
      sgates <= gnd;
  end

reg feedback_pt_115;

always @(thor or feedback_pt_115)
  begin
      atoms = !thor & !feedback_pt_115;
  end

reg feedback_pt_116;

always @(killme or feedback_pt_116)
  begin
      thankee =  killme |  feedback_pt_116;
  end

reg feedback_pt_117;

always @(neptune or feedback_pt_117)
  begin
      wakey = !neptune | !feedback_pt_117;
  end

reg feedback_pt_118;

always @(vcc or feedback_pt_118)
  begin
      ants =  vcc ^ !feedback_pt_118;
  end

reg feedback_pt_119;

always @(aisle_two or feedback_pt_119)
  begin
      dig =  aisle_two &  feedback_pt_119;
  end

reg feedback_pt_120;

always @(devotion or feedback_pt_120)
  begin
      ladder =  devotion & !feedback_pt_120;
  end

reg feedback_pt_121;

always @(dig or feedback_pt_121)
  begin
      wrecker = !dig &  feedback_pt_121;
  end

reg feedback_pt_122;

always @(gnd or feedback_pt_122)
  begin
      dumptruck =  gnd & !feedback_pt_122;
  end

reg feedback_pt_123;

always @(england or feedback_pt_123)
  begin
      dumbarton = !england ^ !feedback_pt_123;
  end

reg feedback_pt_124;

always @(ants or feedback_pt_124)
  begin
      golden =  ants &  feedback_pt_124;
  end

reg feedback_pt_125;

always @(dumptruck or feedback_pt_125)
  begin
      egg = !dumptruck ^  feedback_pt_125;
  end

reg feedback_pt_126;

always @(vcc or feedback_pt_126)
  begin
      tofu = !vcc &  feedback_pt_126;
  end

reg feedback_pt_127;

always @(gnd or feedback_pt_127)
  begin
      rodent = !gnd &  feedback_pt_127;
  end

reg feedback_pt_128;

always @(fullmetal or feedback_pt_128)
  begin
      billnted =  fullmetal &  feedback_pt_128;
  end

reg feedback_pt_129;

always @(gnd or feedback_pt_129)
  begin
      whiteboard = !gnd & !feedback_pt_129;
  end

reg feedback_pt_130;

always @(vcc or feedback_pt_130)
  begin
      synthesis =  vcc ^ !feedback_pt_130;
  end

reg feedback_pt_131;

always @(roid or feedback_pt_131)
  begin
      fitter = !roid | !feedback_pt_131;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dingbat <= 1;
    else
      dingbat <= gnd;
  end

always @(dingbat)
  begin
      feedback_pt_115 = dingbat;
  end

always @(dingbat)
  begin
      feedback_pt_116 = dingbat;
  end

always @(dingbat)
  begin
      feedback_pt_117 = dingbat;
  end

always @(dingbat)
  begin
      feedback_pt_118 = dingbat;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sweetie <= 0;
    else if (cubish)
      sweetie <= 0;
    else if (gnd)
      sweetie <= wiggum;
  end

always @(sweetie)
  begin
      feedback_pt_119 = sweetie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wiggles <= 0;
    else if (gnd)
      wiggles <= bart;
    else if (issac)
      wiggles <= 0;
  end

always @(wiggles)
  begin
      feedback_pt_120 = wiggles;
  end

always @(wiggles)
  begin
      feedback_pt_121 = wiggles;
  end

always @(wiggles)
  begin
      feedback_pt_122 = wiggles;
  end

always @(wiggles)
  begin
      feedback_pt_123 = wiggles;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wanton <= 0;
    else if (vcc)
      wanton <= srvcensorce;
    else if (minerva)
      wanton <= 0;
  end

always @(wanton)
  begin
      feedback_pt_124 = wanton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rewire <= 0;
    else if (gnd)
      rewire <= vcc;
    else if (gnd)
      rewire <= 0;
  end

always @(rewire)
  begin
      feedback_pt_125 = rewire;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      thread <= 0;
    else if (burning)
      thread <= plaster;
  end

always @(thread)
  begin
      feedback_pt_126 = thread;
  end

wire suffering_wire;

dffeas suffering_ff (
  .clk(clock0),
  .d(ramone),
  .ena(vcc),
  .sclr(rewire),
  .sload(muggers),
  .asdata(gnd),
  .clrn(!reset0),
  .q(suffering_wire)
);

always @(suffering_wire) begin
   art = suffering_wire;
end

always @(art)
  begin
      feedback_pt_127 = art;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vegas <= 1;
    else
      vegas <= plumber;
  end

always @(vegas)
  begin
      feedback_pt_128 = vegas;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tamago <= 0;
    else if (issac)
      tamago <= thread;
  end

always @(tamago)
  begin
      feedback_pt_129 = tamago;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tuna <= 1;
    else
      tuna <= wanton;
  end

always @(tuna)
  begin
      feedback_pt_130 = tuna;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salmon <= 1;
    else
      salmon <= vcc;
  end

always @(salmon)
  begin
      feedback_pt_131 = salmon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sake <= 1;
    else
      sake <= chemical;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ritsu <= 0;
    else if (vcc)
      ritsu <= gnd;
    else if (gnd)
      ritsu <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ebi <= 0;
    else if (vcc)
      ebi <= 0;
    else if (timingmodel)
      ebi <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shrimp <= 0;
    else
      shrimp <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rainbow <= 0;
    else if (bach)
      rainbow <= rasp;
    else if (thor)
      rainbow <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tako <= 0;
    else if (kissthesky)
      tako <= comicbook;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      octapus <= 0;
    else
      octapus <= art;
  end

wire hamachi_wire;

dffea hamachi_ff (
  .clk(clock0),
  .d(vcc),
  .ena(drax),
  .adata(sebastian),
  .clrn(!reset0),
  .q(hamachi_wire)
);

always @(hamachi_wire) begin
   yellowtail = hamachi_wire;
end

wire kana_wire;

dffeas kana_ff (
  .clk(clock0),
  .d(yellowtail),
  .ena(wiggles),
  .sclr(vegas),
  .sload(vcc),
  .asdata(curly),
  .clrn(!reset0),
  .q(kana_wire)
);

always @(kana_wire) begin
   crab = kana_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nigiri <= 0;
    else if (tuna)
      nigiri <= romex;
    else if (iceland)
      nigiri <= 0;
  end

// RAM - Data is 10 bits. Depth is 32 words.
wire [9:0] handroll_d;
wire [4:0] handroll_raddr;
wire [4:0] handroll_waddr;
wire handroll_rclk, handroll_wclk, handroll_we;

assign handroll_d = {gnd,peopleeater,daughter,killme,protest,gnd,captain,bart,tofu,art};
assign handroll_raddr = {barnum,ham,gnd,thread,dumptruck};
assign handroll_waddr = {peopleeater,crab,vcc,vcc,thankee};
assign handroll_rclk = clock0;
assign handroll_wclk = clock0;
assign handroll_we = killme;

reg [9:0] handroll_q;
reg [9:0] handroll_ram [31:0];
reg [4:0] handroll_raddr_reg;
reg [4:0] handroll_waddr_reg;


// synthesis translate off
initial begin
    handroll_waddr_reg = 0;
    handroll_raddr_reg = 0;
    handroll_ram[0] = 0;
    handroll_ram[1] = 0;
    handroll_ram[2] = 0;
    handroll_ram[3] = 0;
    handroll_ram[4] = 0;
    handroll_ram[5] = 0;
    handroll_ram[6] = 0;
    handroll_ram[7] = 0;
    handroll_ram[8] = 0;
    handroll_ram[9] = 0;
    handroll_ram[10] = 0;
    handroll_ram[11] = 0;
    handroll_ram[12] = 0;
    handroll_ram[13] = 0;
    handroll_ram[14] = 0;
    handroll_ram[15] = 0;
    handroll_ram[16] = 0;
    handroll_ram[17] = 0;
    handroll_ram[18] = 0;
    handroll_ram[19] = 0;
    handroll_ram[20] = 0;
    handroll_ram[21] = 0;
    handroll_ram[22] = 0;
    handroll_ram[23] = 0;
    handroll_ram[24] = 0;
    handroll_ram[25] = 0;
    handroll_ram[26] = 0;
    handroll_ram[27] = 0;
    handroll_ram[28] = 0;
    handroll_ram[29] = 0;
    handroll_ram[30] = 0;
    handroll_ram[31] = 0;
    handroll_q = 0;
end
// synthesis translate on
always @ (posedge handroll_wclk)
begin
   handroll_waddr_reg <= handroll_waddr;
end

always @ (posedge handroll_wclk)
begin
  if (handroll_we) handroll_ram[handroll_waddr_reg] <= handroll_d;
end

// don't register the read addr
//   to prevent collision behavior mismatch
always @ (handroll_raddr)
begin
  handroll_raddr_reg <= handroll_raddr;
end

always @ (posedge handroll_rclk)
begin
  handroll_q <= handroll_ram[handroll_raddr_reg];
end

always @ (handroll_q)
begin
   maki=handroll_q[0];
   roe=handroll_q[1];
   tobiko=handroll_q[2];
   kappa=handroll_q[3];
   cucumber=handroll_q[4];
   california=handroll_q[5];
   ebay=handroll_q[6];
   covad=handroll_q[7];
   exodus=handroll_q[8];
   abovenet=handroll_q[9];
end

reg feedback_pt_132;

always @(sake or feedback_pt_132)
  begin
      webvan =  sake | !feedback_pt_132;
  end

reg feedback_pt_133;

always @(po or feedback_pt_133)
  begin
      sears =  po & !feedback_pt_133;
  end

reg feedback_pt_134;

always @(tamago or feedback_pt_134)
  begin
      lucent = !tamago ^  feedback_pt_134;
  end

reg feedback_pt_135;

always @(ramone or feedback_pt_135)
  begin
      ibm =  ramone | !feedback_pt_135;
  end

reg feedback_pt_136;

always @(mozart or feedback_pt_136)
  begin
      intel = !mozart | !feedback_pt_136;
  end

reg feedback_pt_137;

always @(thor or feedback_pt_137)
  begin
      hp =  thor ^  feedback_pt_137;
  end

reg feedback_pt_138;

always @(graduated or feedback_pt_138)
  begin
      gm = !graduated ^  feedback_pt_138;
  end

reg feedback_pt_139;

always @(vcc or feedback_pt_139)
  begin
      ford =  vcc | !feedback_pt_139;
  end

reg feedback_pt_140;

always @(octapus or feedback_pt_140)
  begin
      chevys = !octapus &  feedback_pt_140;
  end

reg feedback_pt_141;

always @(qfvcensorce or feedback_pt_141)
  begin
      chillis = !qfvcensorce |  feedback_pt_141;
  end

reg feedback_pt_142;

always @(vcc or feedback_pt_142)
  begin
      macdonalds =  vcc & !feedback_pt_142;
  end

reg feedback_pt_143;

always @(socialist or feedback_pt_143)
  begin
      lockheed =  socialist ^ !feedback_pt_143;
  end

reg feedback_pt_144;

always @(sgates or feedback_pt_144)
  begin
      martin = !sgates | !feedback_pt_144;
  end

reg feedback_pt_145;

always @(gnd or feedback_pt_145)
  begin
      marvin = !gnd &  feedback_pt_145;
  end

reg feedback_pt_146;

always @(fear or feedback_pt_146)
  begin
      martian = !fear ^ !feedback_pt_146;
  end

reg feedback_pt_147;

always @(socialist or feedback_pt_147)
  begin
      molokai =  socialist ^ !feedback_pt_147;
  end

reg feedback_pt_148;

always @(roe or feedback_pt_148)
  begin
      amex = !roe | !feedback_pt_148;
  end

reg feedback_pt_149;

always @(graduated or feedback_pt_149)
  begin
      nasdaq =  graduated | !feedback_pt_149;
  end

reg feedback_pt_150;

always @(gnd or feedback_pt_150)
  begin
      dow =  gnd & !feedback_pt_150;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      taoist <= 0;
    else if (cucumber)
      taoist <= egg;
    else if (bart)
      taoist <= 0;
  end

always @(taoist)
  begin
      feedback_pt_132 = taoist;
  end

always @(taoist)
  begin
      feedback_pt_133 = taoist;
  end

always @(taoist)
  begin
      feedback_pt_134 = taoist;
  end

always @(taoist)
  begin
      feedback_pt_135 = taoist;
  end

always @(taoist)
  begin
      feedback_pt_136 = taoist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      liberace <= 0;
    else if (gnd)
      liberace <= dow;
    else if (gm)
      liberace <= 0;
  end

always @(liberace)
  begin
      feedback_pt_137 = liberace;
  end

always @(liberace)
  begin
      feedback_pt_138 = liberace;
  end

always @(liberace)
  begin
      feedback_pt_139 = liberace;
  end

always @(liberace)
  begin
      feedback_pt_140 = liberace;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      microsoft <= 0;
    else
      microsoft <= ernie;
  end

always @(microsoft)
  begin
      feedback_pt_141 = microsoft;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sun <= 0;
    else if (billnted)
      sun <= chillis;
    else if (ibm)
      sun <= 0;
  end

always @(sun)
  begin
      feedback_pt_142 = sun;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oracle <= 0;
    else if (covad)
      oracle <= lxtcen;
    else if (wrecker)
      oracle <= 0;
  end

always @(oracle)
  begin
      feedback_pt_143 = oracle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bfi <= 0;
    else
      bfi <= salmon;
  end

always @(bfi)
  begin
      feedback_pt_144 = bfi;
  end

wire century_wire;

dffeas century_ff (
  .clk(clock0),
  .d(gnd),
  .ena(exodus),
  .sclr(vcc),
  .sload(odin),
  .asdata(surprise),
  .clrn(!reset0),
  .q(century_wire)
);

always @(century_wire) begin
   harrydavid = century_wire;
end

always @(harrydavid)
  begin
      feedback_pt_145 = harrydavid;
  end

wire safeway_wire;

dffeas safeway_ff (
  .clk(clock0),
  .d(pluto),
  .ena(killme),
  .sclr(wiggum),
  .sload(vcc),
  .asdata(worstdesignever),
  .clrn(!reset0),
  .q(safeway_wire)
);

always @(safeway_wire) begin
   pepsi = safeway_wire;
end

always @(pepsi)
  begin
      feedback_pt_146 = pepsi;
  end

wire pacbell_wire;

dffea pacbell_ff (
  .clk(clock0),
  .d(marvin),
  .ena(gnd),
  .adata(chemical),
  .clrn(!reset0),
  .q(pacbell_wire)
);

always @(pacbell_wire) begin
   att = pacbell_wire;
end

always @(att)
  begin
      feedback_pt_147 = att;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tsmc <= 0;
    else if (partners)
      tsmc <= valve;
    else if (california)
      tsmc <= 0;
  end

always @(tsmc)
  begin
      feedback_pt_148 = tsmc;
  end

wire bathbody_wire;

dffea bathbody_ff (
  .clk(clock0),
  .d(sears),
  .ena(fullmetal),
  .adata(tako),
  .clrn(!reset0),
  .q(bathbody_wire)
);

always @(bathbody_wire) begin
   papyrus = bathbody_wire;
end

always @(papyrus)
  begin
      feedback_pt_149 = papyrus;
  end

wire macys_wire;

dffeas macys_ff (
  .clk(clock0),
  .d(vcc),
  .ena(california),
  .sclr(vcc),
  .sload(maki),
  .asdata(timingmodel),
  .clrn(!reset0),
  .q(macys_wire)
);

always @(macys_wire) begin
   sharperimg = macys_wire;
end

always @(sharperimg)
  begin
      feedback_pt_150 = sharperimg;
  end

wire mitsubishi_wire;

dffea mitsubishi_ff (
  .clk(clock0),
  .d(att),
  .ena(taoist),
  .adata(intuit),
  .clrn(!reset0),
  .q(mitsubishi_wire)
);

always @(mitsubishi_wire) begin
   honda = mitsubishi_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pimpernel <= 0;
    else if (jupiter)
      pimpernel <= harrydavid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kbtoys <= 0;
    else if (nasdaq)
      kbtoys <= 0;
    else if (ebi)
      kbtoys <= tako;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      toysrus <= 0;
    else if (chief)
      toysrus <= 0;
    else if (gnd)
      toysrus <= fear;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gap <= 0;
    else
      gap <= honda;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bananarep <= 0;
    else
      bananarep <= abovenet;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oldnavy <= 0;
    else if (gnd)
      oldnavy <= larry;
    else if (pluto)
      oldnavy <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      clothing <= 0;
    else
      clothing <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      starbucks <= 0;
    else
      starbucks <= gnd;
  end

wire coffee_wire;

dffeas coffee_ff (
  .clk(clock0),
  .d(ibm),
  .ena(puertorico),
  .sclr(amex),
  .sload(badmonkey),
  .asdata(protest),
  .clrn(!reset0),
  .q(coffee_wire)
);

always @(coffee_wire) begin
   structure = coffee_wire;
end

wire jcrew_wire;

dffeas jcrew_ff (
  .clk(clock0),
  .d(touch),
  .ena(gnd),
  .sclr(intel),
  .sload(webvan),
  .asdata(ebi),
  .clrn(!reset0),
  .q(jcrew_wire)
);

always @(jcrew_wire) begin
   whatelse = jcrew_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blessyou <= 0;
    else
      blessyou <= ladder;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kerchoozle <= 1;
    else
      kerchoozle <= pimpernel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atchoo <= 0;
    else if (gnd)
      atchoo <= molokai;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      siamese <= 0;
    else if (rodent)
      siamese <= thor;
    else if (blessyou)
      siamese <= 0;
  end

// Internal TRI bus MUX built out of tri buffers;
// Z and conflict not possible
  tri tabby_tri;
  wire [3:0] tabby_dat = {gnd,sweetie,furnace};
  wire [3:0] tabby_sel = {abovenet,kerchoozle,vcc};
  wire [3:0] tabby_ohsel;
  wire tabby_def;

  assign tabby_ohsel[0] = tabby_sel[0];
  assign tabby_ohsel[1] = tabby_sel[1] & !tabby_ohsel[0];
  assign tabby_ohsel[2] = tabby_sel[2] & !tabby_ohsel[1] & !tabby_ohsel[0];

  assign tabby_def = 
     !tabby_ohsel[0] & !tabby_ohsel[1] & !tabby_ohsel[2];

  // onehot tristate MUX
  bufif1 (tabby_tri, tabby_dat[0], tabby_ohsel[0]);
  bufif0 (tabby_tri,!tabby_dat[1],!tabby_ohsel[1]);
  bufif0 (tabby_tri,!tabby_dat[2],!tabby_ohsel[2]);

  // default value for none-hot
  bufif1 (tabby_tri,vcc,tabby_def);
  always @(tabby_tri) begin
    tabby = tabby_tri;
  end

always @(sweetie)
  begin
      notsure = !sweetie;
  end

always @(gnd)
  begin
      monster = !gnd;
  end

always @(shrimp)
  begin
      incagardens = !shrimp;
  end

always @(dumbarton)
  begin
      genji = !dumbarton;
  end

always @(kbtoys)
  begin
      lafondue = !kbtoys;
  end

always @(gutter)
  begin
      subway = !gutter;
  end

always @(sun)
  begin
      pasta = !sun;
  end

always @(thor)
  begin
      pomodoro = !thor;
  end

always @(hp)
  begin
      puttanesca = !hp;
  end

always @(gnd)
  begin
      golfland = !gnd;
  end

always @(ebay)
  begin
      arcade = !ebay;
  end

always @(synthesis)
  begin
      jacuzzi = !synthesis;
  end

always @(arcade)
  begin
      blaster = !arcade;
  end

always @(att)
  begin
      bonker = !att;
  end

always @(love_in)
  begin
      beemer = !love_in;
  end

always @(vcc)
  begin
      bono = !vcc;
  end

always @(partners)
  begin
      concorde = !partners;
  end

always @(vcc)
  begin
      stemcell = !vcc;
  end

always @(devotion)
  begin
      shark = !devotion;
  end

always @(tabby)
  begin
      carolina = !tabby;
  end

always @(lucent)
  begin
      avon = !lucent;
  end

reg feedback_pt_151;

always @(vcc or feedback_pt_151)
  begin
      bomb = !vcc & !feedback_pt_151;
  end

reg feedback_pt_152;

always @(ebi or feedback_pt_152)
  begin
      school =  ebi & !feedback_pt_152;
  end

reg feedback_pt_153;

always @(gnd or feedback_pt_153)
  begin
      cornell = !gnd ^ !feedback_pt_153;
  end

reg feedback_pt_154;

always @(carolina or feedback_pt_154)
  begin
      soccer = !carolina |  feedback_pt_154;
  end

reg feedback_pt_155;

always @(gnd or feedback_pt_155)
  begin
      softball = !gnd |  feedback_pt_155;
  end

reg feedback_pt_156;

always @(joseph or feedback_pt_156)
  begin
      fieldhockey = !joseph &  feedback_pt_156;
  end

reg feedback_pt_157;

always @(structure or feedback_pt_157)
  begin
      nirish =  structure | !feedback_pt_157;
  end

reg feedback_pt_158;

always @(pasta or feedback_pt_158)
  begin
      peace =  pasta ^ !feedback_pt_158;
  end

reg feedback_pt_159;

always @(my_tummy or feedback_pt_159)
  begin
      mideast =  my_tummy ^  feedback_pt_159;
  end

reg feedback_pt_160;

always @(webvan or feedback_pt_160)
  begin
      illegal = !webvan &  feedback_pt_160;
  end

reg feedback_pt_161;

always @(bart or feedback_pt_161)
  begin
      drugs = !bart ^  feedback_pt_161;
  end

reg feedback_pt_162;

always @(ibm or feedback_pt_162)
  begin
      infesting = !ibm ^  feedback_pt_162;
  end

reg feedback_pt_163;

always @(microsoft or feedback_pt_163)
  begin
      children =  microsoft | !feedback_pt_163;
  end

reg feedback_pt_164;

always @(jupiter or feedback_pt_164)
  begin
      crank =  jupiter ^  feedback_pt_164;
  end

reg feedback_pt_165;

always @(fitter or feedback_pt_165)
  begin
      marijuana = !fitter & !feedback_pt_165;
  end

reg feedback_pt_166;

always @(potter or feedback_pt_166)
  begin
      lsd = !potter &  feedback_pt_166;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      acid <= 1;
    else
      acid <= vcc;
  end

always @(acid)
  begin
      feedback_pt_151 = acid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crack <= 0;
    else if (sortout)
      crack <= atchoo;
    else if (taoist)
      crack <= 0;
  end

always @(crack)
  begin
      feedback_pt_152 = crack;
  end

always @(crack)
  begin
      feedback_pt_153 = crack;
  end

always @(crack)
  begin
      feedback_pt_154 = crack;
  end

always @(crack)
  begin
      feedback_pt_155 = crack;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      speed <= 0;
    else if (vcc)
      speed <= 0;
    else if (dingbat)
      speed <= martin;
  end

always @(speed)
  begin
      feedback_pt_156 = speed;
  end

always @(speed)
  begin
      feedback_pt_157 = speed;
  end

always @(speed)
  begin
      feedback_pt_158 = speed;
  end

always @(speed)
  begin
      feedback_pt_159 = speed;
  end

always @(speed)
  begin
      feedback_pt_160 = speed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      meth <= 1;
    else
      meth <= abovenet;
  end

always @(meth)
  begin
      feedback_pt_161 = meth;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crystal <= 0;
    else if (qfvcensorce)
      crystal <= 0;
    else if (ford)
      crystal <= steaming;
  end

always @(crystal)
  begin
      feedback_pt_162 = crystal;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      uppers <= 1;
    else
      uppers <= vcc;
  end

always @(uppers)
  begin
      feedback_pt_163 = uppers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      downers <= 0;
    else if (vcc)
      downers <= bonker;
    else if (yummy)
      downers <= 0;
  end

always @(downers)
  begin
      feedback_pt_164 = downers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      viagra <= 0;
    else if (cornell)
      viagra <= pasta;
    else if (ibm)
      viagra <= 0;
  end

always @(viagra)
  begin
      feedback_pt_165 = viagra;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yohimbe <= 0;
    else if (dig)
      yohimbe <= gnd;
  end

always @(yohimbe)
  begin
      feedback_pt_166 = yohimbe;
  end

wire decongestant_wire;

dffeas decongestant_ff (
  .clk(clock0),
  .d(golden),
  .ena(pepsi),
  .sclr(expects_the),
  .sload(blaster),
  .asdata(thor),
  .clrn(!reset0),
  .q(decongestant_wire)
);

always @(decongestant_wire) begin
   nyquil = decongestant_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dimetap <= 0;
    else if (peace)
      dimetap <= 0;
    else if (monster)
      dimetap <= maki;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      coughsyrup <= 0;
    else
      coughsyrup <= mideast;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vicks <= 1;
    else
      vicks <= martian;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      comtrex <= 0;
    else
      comtrex <= jacuzzi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aspirin <= 0;
    else if (acid)
      aspirin <= kappa;
    else if (mideast)
      aspirin <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      advil <= 0;
    else
      advil <= infesting;
  end

wire naproxen_wire;

dffeas naproxen_ff (
  .clk(clock0),
  .d(vcc),
  .ena(goodmonkey),
  .sclr(bomb),
  .sload(protest),
  .asdata(vcc),
  .clrn(!reset0),
  .q(naproxen_wire)
);

always @(naproxen_wire) begin
   tylenol = naproxen_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sinus <= 1;
    else
      sinus <= crack;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sinew <= 0;
    else
      sinew <= subway;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      snort <= 0;
    else
      snort <= toysrus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pcp <= 0;
    else if (homerun)
      pcp <= skywalker;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      phenyalanine <= 1;
    else
      phenyalanine <= rodent;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      saccarine <= 0;
    else if (yohimbe)
      saccarine <= 0;
    else if (rodent)
      saccarine <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nutrasweet <= 0;
    else if (gnd)
      nutrasweet <= 0;
    else if (nasdaq)
      nutrasweet <= children;
  end

wire sugar_wire;

dffeas sugar_ff (
  .clk(clock0),
  .d(salmon),
  .ena(vcc),
  .sclr(gnd),
  .sload(beemer),
  .asdata(vicks),
  .clrn(!reset0),
  .q(sugar_wire)
);

always @(sugar_wire) begin
   honey = sugar_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rose <= 0;
    else
      rose <= expects_the;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foliage <= 0;
    else if (aspirin)
      foliage <= 0;
    else if (tsmc)
      foliage <= gnd;
  end

reg feedback_pt_167;

always @(molokai or feedback_pt_167)
  begin
      defoliant =  molokai | !feedback_pt_167;
  end

reg feedback_pt_168;

always @(lsd or feedback_pt_168)
  begin
      exfoliant =  lsd | !feedback_pt_168;
  end

reg feedback_pt_169;

always @(my_tummy or feedback_pt_169)
  begin
      curious = !my_tummy ^  feedback_pt_169;
  end

reg feedback_pt_170;

always @(fieldhockey or feedback_pt_170)
  begin
      george = !fieldhockey | !feedback_pt_170;
  end

reg feedback_pt_171;

always @(leaky or feedback_pt_171)
  begin
      balloon =  leaky & !feedback_pt_171;
  end

reg feedback_pt_172;

always @(vcc or feedback_pt_172)
  begin
      robust = !vcc ^ !feedback_pt_172;
  end

reg feedback_pt_173;

always @(vcc or feedback_pt_173)
  begin
      enoch = !vcc ^ !feedback_pt_173;
  end

reg feedback_pt_174;

always @(vcc or feedback_pt_174)
  begin
      bobblehead = !vcc &  feedback_pt_174;
  end

reg feedback_pt_175;

always @(sebastian or feedback_pt_175)
  begin
      cheez = !sebastian &  feedback_pt_175;
  end

reg feedback_pt_176;

always @(gnd or feedback_pt_176)
  begin
      zed = !gnd ^  feedback_pt_176;
  end

reg feedback_pt_177;

always @(incagardens or feedback_pt_177)
  begin
      zen =  incagardens ^  feedback_pt_177;
  end

reg feedback_pt_178;

always @(gnd or feedback_pt_178)
  begin
      falafel =  gnd ^ !feedback_pt_178;
  end

reg feedback_pt_179;

always @(comtrex or feedback_pt_179)
  begin
      rodriguez = !comtrex |  feedback_pt_179;
  end

reg feedback_pt_180;

always @(gnd or feedback_pt_180)
  begin
      dukdodger =  gnd &  feedback_pt_180;
  end

reg feedback_pt_181;

always @(jupiter or feedback_pt_181)
  begin
      ocha = !jupiter ^  feedback_pt_181;
  end

reg feedback_pt_182;

always @(drugs or feedback_pt_182)
  begin
      kaisha =  drugs &  feedback_pt_182;
  end

reg feedback_pt_183;

always @(vcc or feedback_pt_183)
  begin
      hellokitty =  vcc ^ !feedback_pt_183;
  end

reg feedback_pt_184;

always @(snort or feedback_pt_184)
  begin
      badtzmaru =  snort ^ !feedback_pt_184;
  end

reg feedback_pt_185;

always @(carolina or feedback_pt_185)
  begin
      sapporo = !carolina &  feedback_pt_185;
  end

reg feedback_pt_186;

always @(oldnavy or feedback_pt_186)
  begin
      asahi = !oldnavy | !feedback_pt_186;
  end

reg feedback_pt_187;

always @(illegal or feedback_pt_187)
  begin
      hummer = !illegal | !feedback_pt_187;
  end

reg feedback_pt_188;

always @(nirish or feedback_pt_188)
  begin
      elian = !nirish &  feedback_pt_188;
  end

reg feedback_pt_189;

always @(gnd or feedback_pt_189)
  begin
      condit = !gnd &  feedback_pt_189;
  end

reg feedback_pt_190;

always @(gnd or feedback_pt_190)
  begin
      gopher =  gnd |  feedback_pt_190;
  end

reg feedback_pt_191;

always @(nasdaq or feedback_pt_191)
  begin
      giraffe =  nasdaq ^ !feedback_pt_191;
  end

reg feedback_pt_192;

always @(vcc or feedback_pt_192)
  begin
      lotus =  vcc ^  feedback_pt_192;
  end

reg feedback_pt_193;

always @(uppers or feedback_pt_193)
  begin
      flyingmonkey =  uppers |  feedback_pt_193;
  end

reg feedback_pt_194;

always @(elian or feedback_pt_194)
  begin
      scotchtape = !elian & !feedback_pt_194;
  end

reg feedback_pt_195;

always @(sweetie or feedback_pt_195)
  begin
      wicked =  sweetie &  feedback_pt_195;
  end

reg feedback_pt_196;

always @(zen or feedback_pt_196)
  begin
      witch =  zen ^  feedback_pt_196;
  end

reg feedback_pt_197;

always @(uppers or feedback_pt_197)
  begin
      ghost =  uppers &  feedback_pt_197;
  end

wire goblin_wire;

dffeas goblin_ff (
  .clk(clock0),
  .d(sun),
  .ena(robust),
  .sclr(vcc),
  .sload(gnd),
  .asdata(hummer),
  .clrn(!reset0),
  .q(goblin_wire)
);

always @(goblin_wire) begin
   elf = goblin_wire;
end

always @(elf)
  begin
      feedback_pt_167 = elf;
  end

always @(elf)
  begin
      feedback_pt_168 = elf;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      centaur <= 0;
    else if (gnd)
      centaur <= 0;
    else if (concorde)
      centaur <= crystal;
  end

always @(centaur)
  begin
      feedback_pt_169 = centaur;
  end

always @(centaur)
  begin
      feedback_pt_170 = centaur;
  end

always @(centaur)
  begin
      feedback_pt_171 = centaur;
  end

always @(centaur)
  begin
      feedback_pt_172 = centaur;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      theseus <= 0;
    else if (avon)
      theseus <= 0;
    else if (kaisha)
      theseus <= skywalker;
  end

always @(theseus)
  begin
      feedback_pt_173 = theseus;
  end

always @(theseus)
  begin
      feedback_pt_174 = theseus;
  end

always @(theseus)
  begin
      feedback_pt_175 = theseus;
  end

always @(theseus)
  begin
      feedback_pt_176 = theseus;
  end

always @(theseus)
  begin
      feedback_pt_177 = theseus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      minotaur <= 0;
    else
      minotaur <= school;
  end

always @(minotaur)
  begin
      feedback_pt_178 = minotaur;
  end

always @(minotaur)
  begin
      feedback_pt_179 = minotaur;
  end

always @(minotaur)
  begin
      feedback_pt_180 = minotaur;
  end

always @(minotaur)
  begin
      feedback_pt_181 = minotaur;
  end

always @(minotaur)
  begin
      feedback_pt_182 = minotaur;
  end

wire midas_wire;

dffea midas_ff (
  .clk(clock0),
  .d(giraffe),
  .ena(tobiko),
  .adata(sun),
  .clrn(!reset0),
  .q(midas_wire)
);

always @(midas_wire) begin
   icarus = midas_wire;
end

always @(icarus)
  begin
      feedback_pt_183 = icarus;
  end

always @(icarus)
  begin
      feedback_pt_184 = icarus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pegasus <= 0;
    else if (srvcensorce)
      pegasus <= 0;
    else if (gap)
      pegasus <= downers;
  end

always @(pegasus)
  begin
      feedback_pt_185 = pegasus;
  end

always @(pegasus)
  begin
      feedback_pt_186 = pegasus;
  end

always @(pegasus)
  begin
      feedback_pt_187 = pegasus;
  end

wire troll_wire;

dffeas troll_ff (
  .clk(clock0),
  .d(exfoliant),
  .ena(stemcell),
  .sclr(vcc),
  .sload(saccarine),
  .asdata(vcc),
  .clrn(!reset0),
  .q(troll_wire)
);

always @(troll_wire) begin
   warlock = troll_wire;
end

always @(warlock)
  begin
      feedback_pt_188 = warlock;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chowmein <= 0;
    else if (vcc)
      chowmein <= 0;
    else if (gnd)
      chowmein <= theseus;
  end

always @(chowmein)
  begin
      feedback_pt_189 = chowmein;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stirfry <= 1;
    else
      stirfry <= cheez;
  end

always @(stirfry)
  begin
      feedback_pt_190 = stirfry;
  end

wire tasty_wire;

dffeas tasty_ff (
  .clk(clock0),
  .d(gnd),
  .ena(warlock),
  .sclr(flyingmonkey),
  .sload(rodriguez),
  .asdata(nation),
  .clrn(!reset0),
  .q(tasty_wire)
);

always @(tasty_wire) begin
   pastrami = tasty_wire;
end

always @(pastrami)
  begin
      feedback_pt_191 = pastrami;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      turkey <= 0;
    else
      turkey <= ritsu;
  end

always @(turkey)
  begin
      feedback_pt_192 = turkey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beast <= 1;
    else
      beast <= crack;
  end

always @(beast)
  begin
      feedback_pt_193 = beast;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bacon <= 0;
    else if (vcc)
      bacon <= vcc;
  end

always @(bacon)
  begin
      feedback_pt_194 = bacon;
  end

wire salami_wire;

dffea salami_ff (
  .clk(clock0),
  .d(gnd),
  .ena(vcc),
  .adata(curious),
  .clrn(!reset0),
  .q(salami_wire)
);

always @(salami_wire) begin
   peaves = salami_wire;
end

always @(peaves)
  begin
      feedback_pt_195 = peaves;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      snape <= 0;
    else if (vcc)
      snape <= lafondue;
  end

always @(snape)
  begin
      feedback_pt_196 = snape;
  end

wire hagrid_wire;

dffeas hagrid_ff (
  .clk(clock0),
  .d(sun),
  .ena(beast),
  .sclr(rainbow),
  .sload(minotaur),
  .asdata(golfland),
  .clrn(!reset0),
  .q(hagrid_wire)
);

always @(hagrid_wire) begin
   tonks = hagrid_wire;
end

always @(tonks)
  begin
      feedback_pt_197 = tonks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bumbledork <= 1;
    else
      bumbledork <= curious;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moody <= 0;
    else if (nasdaq)
      moody <= nasdaq;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      madeye <= 0;
    else if (athena)
      madeye <= 0;
    else if (vcc)
      madeye <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weasley <= 0;
    else
      weasley <= falafel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floo <= 0;
    else if (often)
      floo <= 0;
    else if (peaves)
      floo <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      powder <= 0;
    else if (salmon)
      powder <= 0;
    else if (kaisha)
      powder <= wicked;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      broom <= 0;
    else if (subway)
      broom <= whatelse;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stick <= 0;
    else if (crank)
      stick <= zed;
    else if (vcc)
      stick <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      quidditch <= 0;
    else
      quidditch <= comtrex;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      phoenix <= 0;
    else if (moody)
      phoenix <= honey;
    else if (gnd)
      phoenix <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      arizona <= 0;
    else if (vcc)
      arizona <= notsure;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fang <= 0;
    else if (coughsyrup)
      fang <= moody;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scabbers <= 1;
    else
      scabbers <= att;
  end

reg feedback_pt_198;

always @(tylenol or feedback_pt_198)
  begin
      umbridge = !tylenol | !feedback_pt_198;
  end

reg feedback_pt_199;

always @(rose or feedback_pt_199)
  begin
      filch =  rose ^ !feedback_pt_199;
  end

reg feedback_pt_200;

always @(scotchtape or feedback_pt_200)
  begin
      norris =  scotchtape & !feedback_pt_200;
  end

reg feedback_pt_201;

always @(condit or feedback_pt_201)
  begin
      chuck = !condit |  feedback_pt_201;
  end

reg feedback_pt_202;

always @(sun or feedback_pt_202)
  begin
      sirius = !sun | !feedback_pt_202;
  end

reg feedback_pt_203;

always @(joey or feedback_pt_203)
  begin
      black =  joey | !feedback_pt_203;
  end

reg feedback_pt_204;

always @(exfoliant or feedback_pt_204)
  begin
      lupin =  exfoliant | !feedback_pt_204;
  end

reg feedback_pt_205;

always @(asahi or feedback_pt_205)
  begin
      severus =  asahi |  feedback_pt_205;
  end

reg feedback_pt_206;

always @(madeye or feedback_pt_206)
  begin
      arthur = !madeye | !feedback_pt_206;
  end

reg feedback_pt_207;

always @(avon or feedback_pt_207)
  begin
      snake = !avon & !feedback_pt_207;
  end

reg feedback_pt_208;

always @(black or feedback_pt_208)
  begin
      mundungus = !black ^  feedback_pt_208;
  end

reg feedback_pt_209;

always @(vcc or feedback_pt_209)
  begin
      army = !vcc &  feedback_pt_209;
  end

reg feedback_pt_210;

always @(george or feedback_pt_210)
  begin
      crookshanks = !george ^ !feedback_pt_210;
  end

reg feedback_pt_211;

always @(crack or feedback_pt_211)
  begin
      trevor = !crack &  feedback_pt_211;
  end

reg feedback_pt_212;

always @(snake or feedback_pt_212)
  begin
      neville = !snake & !feedback_pt_212;
  end

reg feedback_pt_213;

always @(quidditch or feedback_pt_213)
  begin
      longbottom = !quidditch &  feedback_pt_213;
  end

reg feedback_pt_214;

always @(venus or feedback_pt_214)
  begin
      bellatrix =  venus ^ !feedback_pt_214;
  end

reg feedback_pt_215;

always @(ghost or feedback_pt_215)
  begin
      lestrange = !ghost | !feedback_pt_215;
  end

// State Mek malfoy Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      malfoy <= malfoy_0;
    else
      case (malfoy)
        malfoy_0: begin
          if ({draco,lucius,narcissa,gnd} == 4)
            malfoy <= malfoy_5;
          else if ({draco,lucius,narcissa,gnd} == 8)
            malfoy <= malfoy_3;
          else if ({draco,lucius,narcissa,gnd} == 5)
            malfoy <= malfoy_1;
          else if ({draco,lucius,narcissa,gnd} == 1)
            malfoy <= malfoy_6;
          else
            malfoy <= malfoy_0;
          end
        malfoy_1: begin
          if ({draco,lucius,narcissa,gnd} == 4)
            malfoy <= malfoy_2;
          else if ({draco,lucius,narcissa,gnd} == 1)
            malfoy <= malfoy_4;
          else if ({draco,lucius,narcissa,gnd} == 10)
            malfoy <= malfoy_4;
          else
            malfoy <= malfoy_1;
          end
        malfoy_2: begin
          if ({draco,lucius,narcissa,gnd} == 1)
            malfoy <= malfoy_4;
          else
            malfoy <= malfoy_2;
          end
        malfoy_3: begin
          if ({draco,lucius,narcissa,gnd} == 15)
            malfoy <= malfoy_5;
          else if ({draco,lucius,narcissa,gnd} == 14)
            malfoy <= malfoy_2;
          else
            malfoy <= malfoy_3;
          end
        malfoy_4: begin
          if ({draco,lucius,narcissa,gnd} == 2)
            malfoy <= malfoy_6;
          else if ({draco,lucius,narcissa,gnd} == 7)
            malfoy <= malfoy_3;
          else if ({draco,lucius,narcissa,gnd} == 3)
            malfoy <= malfoy_1;
          else if ({draco,lucius,narcissa,gnd} == 15)
            malfoy <= malfoy_6;
          else if ({draco,lucius,narcissa,gnd} == 5)
            malfoy <= malfoy_8;
          else
            malfoy <= malfoy_4;
          end
        malfoy_5: begin
          if ({draco,lucius,narcissa,gnd} == 3)
            malfoy <= malfoy_8;
          else
            malfoy <= malfoy_5;
          end
        malfoy_6: begin
            malfoy <= malfoy_6;
          end
        malfoy_7: begin
          if ({draco,lucius,narcissa,gnd} == 13)
            malfoy <= malfoy_0;
          else if ({draco,lucius,narcissa,gnd} == 9)
            malfoy <= malfoy_4;
          else if ({draco,lucius,narcissa,gnd} == 11)
            malfoy <= malfoy_0;
          else
            malfoy <= malfoy_7;
          end
        malfoy_8: begin
          if ({draco,lucius,narcissa,gnd} == 12)
            malfoy <= malfoy_7;
          else if ({draco,lucius,narcissa,gnd} == 15)
            malfoy <= malfoy_0;
          else if ({draco,lucius,narcissa,gnd} == 2)
            malfoy <= malfoy_8;
          else if ({draco,lucius,narcissa,gnd} == 4)
            malfoy <= malfoy_1;
          else if ({draco,lucius,narcissa,gnd} == 8)
            malfoy <= malfoy_2;
          else
            malfoy <= malfoy_8;
          end
        default: malfoy <= malfoy_0;
      endcase
  end

// State Mek malfoy Output logic
always @(malfoy)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (malfoy)
        malfoy_0: begin
            albus = 1;
            mcgonagall = 0;
            hogwarts = 0;
            rubeus = 0;
            drumstrang = 0;
            norbert = 0;
            wizard = 0;
            diagon = 0;
            fireplace = 0;
            crucio = 0;
            kedavra = 0;
          end
        malfoy_1: begin
            albus = 1;
            mcgonagall = 0;
            hogwarts = 0;
            rubeus = 0;
            drumstrang = 0;
            norbert = 0;
            wizard = 0;
            diagon = 1;
            fireplace = 1;
            crucio = 1;
            kedavra = 0;
          end
        malfoy_2: begin
            albus = 0;
            mcgonagall = 1;
            hogwarts = 0;
            rubeus = 0;
            drumstrang = 0;
            norbert = 1;
            wizard = 0;
            diagon = 0;
            fireplace = 0;
            crucio = 0;
            kedavra = 0;
          end
        malfoy_3: begin
            albus = 1;
            mcgonagall = 1;
            hogwarts = 0;
            rubeus = 0;
            drumstrang = 0;
            norbert = 0;
            wizard = 1;
            diagon = 1;
            fireplace = 0;
            crucio = 0;
            kedavra = 1;
          end
        malfoy_4: begin
            albus = 0;
            mcgonagall = 0;
            hogwarts = 0;
            rubeus = 0;
            drumstrang = 1;
            norbert = 0;
            wizard = 0;
            diagon = 0;
            fireplace = 0;
            crucio = 1;
            kedavra = 0;
          end
        malfoy_5: begin
            albus = 0;
            mcgonagall = 0;
            hogwarts = 0;
            rubeus = 0;
            drumstrang = 0;
            norbert = 1;
            wizard = 0;
            diagon = 0;
            fireplace = 0;
            crucio = 0;
            kedavra = 1;
          end
        malfoy_6: begin
            albus = 0;
            mcgonagall = 1;
            hogwarts = 1;
            rubeus = 0;
            drumstrang = 1;
            norbert = 0;
            wizard = 1;
            diagon = 1;
            fireplace = 1;
            crucio = 0;
            kedavra = 0;
          end
        malfoy_7: begin
            albus = 1;
            mcgonagall = 1;
            hogwarts = 1;
            rubeus = 0;
            drumstrang = 1;
            norbert = 1;
            wizard = 0;
            diagon = 0;
            fireplace = 1;
            crucio = 1;
            kedavra = 1;
          end
        malfoy_8: begin
            albus = 0;
            mcgonagall = 0;
            hogwarts = 0;
            rubeus = 1;
            drumstrang = 0;
            norbert = 1;
            wizard = 0;
            diagon = 0;
            fireplace = 0;
            crucio = 0;
            kedavra = 1;
          end
        default: begin
            albus = 0;
            mcgonagall = 1;
            hogwarts = 1;
            rubeus = 1;
            drumstrang = 0;
            norbert = 1;
            wizard = 0;
            diagon = 0;
            fireplace = 1;
            crucio = 1;
            kedavra = 0;
          end
      endcase
  end

always @(albus)
  begin
      feedback_pt_198 = albus;
  end

always @(albus)
  begin
      feedback_pt_199 = albus;
  end

always @(mcgonagall)
  begin
      feedback_pt_200 = mcgonagall;
  end

always @(mcgonagall)
  begin
      feedback_pt_201 = mcgonagall;
  end

always @(hogwarts)
  begin
      feedback_pt_202 = hogwarts;
  end

always @(hogwarts)
  begin
      feedback_pt_203 = hogwarts;
  end

always @(rubeus)
  begin
      feedback_pt_204 = rubeus;
  end

always @(rubeus)
  begin
      feedback_pt_205 = rubeus;
  end

always @(rubeus)
  begin
      feedback_pt_206 = rubeus;
  end

always @(rubeus)
  begin
      feedback_pt_207 = rubeus;
  end

always @(rubeus)
  begin
      feedback_pt_208 = rubeus;
  end

always @(drumstrang)
  begin
      feedback_pt_209 = drumstrang;
  end

always @(norbert)
  begin
      feedback_pt_210 = norbert;
  end

always @(wizard)
  begin
      feedback_pt_211 = wizard;
  end

always @(diagon)
  begin
      feedback_pt_212 = diagon;
  end

always @(fireplace)
  begin
      feedback_pt_213 = fireplace;
  end

always @(crucio)
  begin
      feedback_pt_214 = crucio;
  end

always @(kedavra)
  begin
      feedback_pt_215 = kedavra;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire gregg_a_out;
nut_002_lut #(2) nut_002_lut_inst_gregg_a (
  .din({chuck,lotus}),
  .mask(4'ha),
  .out(gregg_a_out)
);

always @(gregg_a_out)
begin
   mario_owes = gregg_a_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire correctness_out;
nut_002_lut #(1) nut_002_lut_inst_correctness (
  .din({gnd}),
  .mask(2'b01),
  .out(correctness_out)
);

always @(correctness_out)
begin
   burrito = correctness_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire synplicity_burrito_out;
nut_002_lut #(5) nut_002_lut_inst_synplicity_burrito (
  .din({pimpernel,softball,venus,wakey,fang}),
  .mask(32'b00000000000001010010010001101010),
  .out(synplicity_burrito_out)
);

always @(synplicity_burrito_out)
begin
   cafe = synplicity_burrito_out;
end

// 8 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {guacamole,sourcream,onion,jalapeno,beef,pork,blackbeans,refriedbeans} <= 0;
    else if (gnd)
      {guacamole,sourcream,onion,jalapeno,beef,pork,blackbeans,refriedbeans} <= {guacamole,sourcream,onion,jalapeno,beef,pork,blackbeans,refriedbeans} + 1;
    else
      {guacamole,sourcream,onion,jalapeno,beef,pork,blackbeans,refriedbeans} <= {guacamole,sourcream,onion,jalapeno,beef,pork,blackbeans,refriedbeans} - 1;
  end

// Random 4 in 4 out table
always @(gnd or pintobeans or tortilla or salsa)
  begin
    casex ({gnd,pintobeans,tortilla,salsa})
      0: {picante,chips,tabasco,mexican}=13;
      1: {picante,chips,tabasco,mexican}=1;
      2: {picante,chips,tabasco,mexican}=10;
      3: {picante,chips,tabasco,mexican}=14;
      4: {picante,chips,tabasco,mexican}=13;
      5: {picante,chips,tabasco,mexican}=9;
      6: {picante,chips,tabasco,mexican}=4;
      7: {picante,chips,tabasco,mexican}=6;
      8: {picante,chips,tabasco,mexican}=6;
      9: {picante,chips,tabasco,mexican}=7;
      10: {picante,chips,tabasco,mexican}=8;
      11: {picante,chips,tabasco,mexican}=4;
      12: {picante,chips,tabasco,mexican}=8;
      13: {picante,chips,tabasco,mexican}=13;
      14: {picante,chips,tabasco,mexican}=3;
      15: {picante,chips,tabasco,mexican}=10;
      default: {picante,chips,tabasco,mexican}=0;
    endcase
  end

always @(mundungus)
  begin
      too_big = !mundungus;
  end

always @(ibm)
  begin
      llamas_dont_eat_burrito = !ibm;
  end

always @(rainbow)
  begin
      director_of_llamas = !rainbow;
  end

always @(gnd)
  begin
      fufu = !gnd;
  end

always @(dukdodger)
  begin
      castaway = !dukdodger;
  end

always @(neville)
  begin
      coconut = !neville;
  end

always @(stirfry)
  begin
      maryann = !stirfry;
  end

always @(vcc)
  begin
      gilligan = !vcc;
  end

always @(bfi)
  begin
      skipper = !bfi;
  end

always @(gnd)
  begin
      professor = !gnd;
  end

always @(gnd)
  begin
      moviestar = !gnd;
  end

always @(pcp)
  begin
      ginger = !pcp;
  end

always @(squad)
  begin
      jonas = !squad;
  end

always @(moviestar)
  begin
      grumby = !moviestar;
  end

always @(viagra)
  begin
      minnow = !viagra;
  end

always @(vcc)
  begin
      lost = !vcc;
  end

always @(vcc)
  begin
      bfs = !vcc;
  end

always @(protest)
  begin
      thurston = !protest;
  end

always @(chuck)
  begin
      lovey = !chuck;
  end

always @(refriedbeans)
  begin
      howell = !refriedbeans;
  end

always @(cheez)
  begin
      hinkley = !cheez;
  end

always @(wakey)
  begin
      eunice = !wakey;
  end

always @(ginger)
  begin
      witchdoctor = !ginger;
  end

always @(weasley)
  begin
      voodoo = !weasley;
  end

always @(vcc)
  begin
      uncharted = !vcc;
  end

always @(asahi)
  begin
      reallyloud = !asahi;
  end

always @(vcc)
  begin
      hypnotized = !vcc;
  end

always @(too_big)
  begin
      ohthatcoconut = !too_big;
  end

always @(dinoblaster)
  begin
      booming = !dinoblaster;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_rarest.v
///////////////////////////////////////////

wire  nut_002_rarest_inst0_smack, nut_002_rarest_inst0_banshee, nut_002_rarest_inst0_dillweed,
     nut_002_rarest_inst0_vimcensorc, nut_002_rarest_inst0_tesla, nut_002_rarest_inst0_killer, nut_002_rarest_inst0_wonton,
     nut_002_rarest_inst0_pierre, nut_002_rarest_inst0_armand, nut_002_rarest_inst0_rufus, nut_002_rarest_inst0_willy,
     nut_002_rarest_inst0_gonzo, nut_002_rarest_inst0_gulp, nut_002_rarest_inst0_bonafide, nut_002_rarest_inst0_rabbi;

nut_002_rarest nut_002_rarest_inst0 (

    //inputs
     .butterfly(albus), .palm(saccarine), .seashell(gnd), .ohisee(norris),
     .whacky(vcc), .rerun(stirfry), .fronds(vcc), .hut(fitter), .rescue(gnd),
     .hawaii(gnd), .wallstreet(vcc), .levelization(oldnavy), .huhhuh(qfvcensorce), .uomcensor(theseus),
     .wildboar(nigiri), .lagoon(gnd), .husks(golfland), .escape(castaway), .foiled(witch),
     .bamboo(sun), .desert(gnd), .isle(nutrasweet), .pacific(vcc), .ocean(gap),
     .waterfall(mideast), .tan_nodes(booming), .loud(arthur), .millionaire(pegasus), .hiswife(bellatrix),
     .stroop(longbottom), .waffle(gnd), .wheezer(defoliant), .ozzy(bfi), .priest(vcc),

    //outputs
     .smack(nut_002_rarest_inst0_smack), .banshee(nut_002_rarest_inst0_banshee),
     .dillweed(nut_002_rarest_inst0_dillweed), .vimcensorc(nut_002_rarest_inst0_vimcensorc), .tesla(nut_002_rarest_inst0_tesla),
     .killer(nut_002_rarest_inst0_killer), .wonton(nut_002_rarest_inst0_wonton), .pierre(nut_002_rarest_inst0_pierre),
     .armand(nut_002_rarest_inst0_armand), .rufus(nut_002_rarest_inst0_rufus), .willy(nut_002_rarest_inst0_willy),
     .gonzo(nut_002_rarest_inst0_gonzo), .gulp(nut_002_rarest_inst0_gulp), .bonafide(nut_002_rarest_inst0_bonafide),
     .rabbi(nut_002_rarest_inst0_rabbi),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   wancensorcens = nut_002_rarest_inst0_smack;
   xbncensorcens = nut_002_rarest_inst0_banshee;
   tapered = nut_002_rarest_inst0_dillweed;
   spastic = nut_002_rarest_inst0_vimcensorc;
   lad = nut_002_rarest_inst0_tesla;
   mao = nut_002_rarest_inst0_killer;
   zedong = nut_002_rarest_inst0_wonton;
   deng = nut_002_rarest_inst0_pierre;
   xiaoping = nut_002_rarest_inst0_armand;
   jinyong = nut_002_rarest_inst0_rufus;
   lao = nut_002_rarest_inst0_willy;
   zi = nut_002_rarest_inst0_gonzo;
   zhuang = nut_002_rarest_inst0_gulp;
   wujing = nut_002_rarest_inst0_bonafide;
   wukong = nut_002_rarest_inst0_rabbi;
end

wire gerrit_outwire;
carry helena (mars,gerrit_outwire);

always @(gerrit_outwire)
begin
  gerrit = gerrit_outwire;
end

wire dirk_outwire, klaas_outwire;
carry_sum willem (.sin(gnd),.cin(diagon),.sout(dirk_outwire),.cout(klaas_outwire));

always @(dirk_outwire or klaas_outwire)
begin
  dirk = dirk_outwire;
  klaas = klaas_outwire;
end

wire hans_outwire, gerard_outwire;
carry_sum bep (.sin(lsd),.cin(joey),.sout(hans_outwire),.cout(gerard_outwire));

always @(hans_outwire or gerard_outwire)
begin
  hans = hans_outwire;
  gerard = gerard_outwire;
end

wire microscope_outwire, erasmus_outwire;
carry_sum leeuwenhoek (.sin(centaur),.cin(director_of_llamas),.sout(microscope_outwire),.cout(erasmus_outwire));

always @(microscope_outwire or erasmus_outwire)
begin
  microscope = microscope_outwire;
  erasmus = erasmus_outwire;
end

wire vangoh_outwire, fortuyn_outwire;
carry_sum deruyter (.sin(defoliant),.cin(wukong),.sout(vangoh_outwire),.cout(fortuyn_outwire));

always @(vangoh_outwire or fortuyn_outwire)
begin
  vangoh = vangoh_outwire;
  fortuyn = fortuyn_outwire;
end

wire schwinger_outwire, feynman_outwire;
carry_sum oranje (.sin(maryann),.cin(marijuana),.sout(schwinger_outwire),.cout(feynman_outwire));

always @(schwinger_outwire or feynman_outwire)
begin
  schwinger = schwinger_outwire;
  feynman = feynman_outwire;
end

wire automounter_outwire, boing_outwire;
carry_sum plague (.sin(maryann),.cin(fufu),.sout(automounter_outwire),.cout(boing_outwire));

always @(automounter_outwire or boing_outwire)
begin
  automounter = automounter_outwire;
  boing = boing_outwire;
end

wire pixie_outwire, stix_outwire;
carry_sum ykocens (.sin(gnd),.cin(eunice),.sout(pixie_outwire),.cout(stix_outwire));

always @(pixie_outwire or stix_outwire)
begin
  pixie = pixie_outwire;
  stix = stix_outwire;
end

wire tango_loud_outwire, cluckU_fuji_outwire;
carry_sum georgec (.sin(gnd),.cin(meth),.sout(tango_loud_outwire),.cout(cluckU_fuji_outwire));

always @(tango_loud_outwire or cluckU_fuji_outwire)
begin
  tango_loud = tango_loud_outwire;
  cluckU_fuji = cluckU_fuji_outwire;
end

wire sun_milhouse_outwire;
soft criminal_newt (moody,sun_milhouse_outwire);

always @(sun_milhouse_outwire)
begin
  sun_milhouse = sun_milhouse_outwire;
end

wire bomb_yak_outwire, romex_dingbat_outwire;
carry_sum condit_yak (.sin(furnace),.cin(skipper),.sout(bomb_yak_outwire),.cout(romex_dingbat_outwire));

always @(bomb_yak_outwire or romex_dingbat_outwire)
begin
  bomb_yak = bomb_yak_outwire;
  romex_dingbat = romex_dingbat_outwire;
end

reg feedback_pt_216;

always @(hypnotized or feedback_pt_216)
  begin
      sand_baron = !hypnotized & !feedback_pt_216;
  end

reg feedback_pt_217;

always @(honda or feedback_pt_217)
  begin
      nyc_rubeus =  honda &  feedback_pt_217;
  end

reg feedback_pt_218;

always @(zedong or feedback_pt_218)
  begin
      protest_bfs = !zedong | !feedback_pt_218;
  end

reg feedback_pt_219;

always @(jonas or feedback_pt_219)
  begin
      danger_star = !jonas | !feedback_pt_219;
  end

reg feedback_pt_220;

always @(vcc or feedback_pt_220)
  begin
      cain_jupiter = !vcc ^  feedback_pt_220;
  end

reg feedback_pt_221;

always @(snape or feedback_pt_221)
  begin
      peace_boots = !snape ^ !feedback_pt_221;
  end

reg feedback_pt_222;

always @(gnd or feedback_pt_222)
  begin
      kang_usa =  gnd | !feedback_pt_222;
  end

reg feedback_pt_223;

always @(badtzmaru or feedback_pt_223)
  begin
      tango_saturn = !badtzmaru |  feedback_pt_223;
  end

reg feedback_pt_224;

always @(gnd or feedback_pt_224)
  begin
      desade_touch =  gnd | !feedback_pt_224;
  end

reg feedback_pt_225;

always @(george or feedback_pt_225)
  begin
      bust_doobie = !george &  feedback_pt_225;
  end

reg feedback_pt_226;

always @(scabbers or feedback_pt_226)
  begin
      salmon_mickey = !scabbers ^ !feedback_pt_226;
  end

reg feedback_pt_227;

always @(vcc or feedback_pt_227)
  begin
      atilla_sheep = !vcc | !feedback_pt_227;
  end

reg feedback_pt_228;

always @(vcc or feedback_pt_228)
  begin
      gin_kdqcens = !vcc ^  feedback_pt_228;
  end

reg feedback_pt_229;

always @(vcc or feedback_pt_229)
  begin
      atchoo_deng =  vcc | !feedback_pt_229;
  end

reg feedback_pt_230;

always @(gnd or feedback_pt_230)
  begin
      salsa_hulk = !gnd |  feedback_pt_230;
  end

reg feedback_pt_231;

always @(vcc or feedback_pt_231)
  begin
      zulu_hagrid =  vcc &  feedback_pt_231;
  end

reg feedback_pt_232;

always @(atilla_sheep or feedback_pt_232)
  begin
      winner_bambi =  atilla_sheep & !feedback_pt_232;
  end

reg feedback_pt_233;

always @(zulu_hagrid or feedback_pt_233)
  begin
      weevil_tako = !zulu_hagrid &  feedback_pt_233;
  end

reg feedback_pt_234;

always @(sun or feedback_pt_234)
  begin
      elguapo_marco =  sun ^  feedback_pt_234;
  end

reg feedback_pt_235;

always @(sourcream or feedback_pt_235)
  begin
      china_ham = !sourcream ^ !feedback_pt_235;
  end

reg feedback_pt_236;

always @(bananarep or feedback_pt_236)
  begin
      cheese_tobiko = !bananarep & !feedback_pt_236;
  end

reg feedback_pt_237;

always @(minnow or feedback_pt_237)
  begin
      weevil_prison = !minnow ^ !feedback_pt_237;
  end

reg feedback_pt_238;

always @(gutter or feedback_pt_238)
  begin
      pork_eel = !gutter ^ !feedback_pt_238;
  end

reg feedback_pt_239;

always @(chips or feedback_pt_239)
  begin
      barnum_fufu = !chips ^ !feedback_pt_239;
  end

reg feedback_pt_240;

always @(hogwarts or feedback_pt_240)
  begin
      thedon_goofy =  hogwarts ^ !feedback_pt_240;
  end

reg feedback_pt_241;

always @(lad or feedback_pt_241)
  begin
      Iwin_odin =  lad & !feedback_pt_241;
  end

reg feedback_pt_242;

always @(hinkley or feedback_pt_242)
  begin
      skinner_ohno = !hinkley |  feedback_pt_242;
  end

reg feedback_pt_243;

always @(gopher or feedback_pt_243)
  begin
      jiminy_fear =  gopher & !feedback_pt_243;
  end

reg feedback_pt_244;

always @(ohthatcoconut or feedback_pt_244)
  begin
      boots_sanity = !ohthatcoconut ^ !feedback_pt_244;
  end

reg feedback_pt_245;

always @(vcc or feedback_pt_245)
  begin
      jupiter_ceres = !vcc ^ !feedback_pt_245;
  end

reg feedback_pt_246;

always @(vcc or feedback_pt_246)
  begin
      east_zealot =  vcc &  feedback_pt_246;
  end

reg feedback_pt_247;

always @(chuck or feedback_pt_247)
  begin
      yankee_huey =  chuck & !feedback_pt_247;
  end

reg feedback_pt_248;

always @(vcc or feedback_pt_248)
  begin
      stoner_zed = !vcc |  feedback_pt_248;
  end

reg feedback_pt_249;

always @(lestrange or feedback_pt_249)
  begin
      aphid_bullet = !lestrange ^ !feedback_pt_249;
  end

reg feedback_pt_250;

always @(vcc or feedback_pt_250)
  begin
      bach_onion = !vcc & !feedback_pt_250;
  end

reg feedback_pt_251;

always @(bumbledork or feedback_pt_251)
  begin
      chuck_golf = !bumbledork & !feedback_pt_251;
  end

wire hurt_saturn_wire;

dffea hurt_saturn_ff (
  .clk(clock1),
  .d(sinus),
  .ena(kang_usa),
  .adata(cluckU_fuji),
  .clrn(!reset1),
  .q(hurt_saturn_wire)
);

always @(hurt_saturn_wire) begin
   foxtrot_ring = hurt_saturn_wire;
end

always @(foxtrot_ring)
  begin
      feedback_pt_216 = foxtrot_ring;
  end

always @(foxtrot_ring)
  begin
      feedback_pt_217 = foxtrot_ring;
  end

always @(foxtrot_ring)
  begin
      feedback_pt_218 = foxtrot_ring;
  end

always @(foxtrot_ring)
  begin
      feedback_pt_219 = foxtrot_ring;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      red_barty <= 0;
    else if (school)
      red_barty <= 0;
    else if (fitter)
      red_barty <= furnace;
  end

always @(red_barty)
  begin
      feedback_pt_220 = red_barty;
  end

always @(red_barty)
  begin
      feedback_pt_221 = red_barty;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nyc_foliage <= 0;
    else if (witch)
      nyc_foliage <= 0;
    else if (gnd)
      nyc_foliage <= gnd;
  end

always @(nyc_foliage)
  begin
      feedback_pt_222 = nyc_foliage;
  end

always @(nyc_foliage)
  begin
      feedback_pt_223 = nyc_foliage;
  end

always @(nyc_foliage)
  begin
      feedback_pt_224 = nyc_foliage;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pluto_exodus <= 0;
    else if (salmon_mickey)
      pluto_exodus <= boots_sanity;
    else if (dukdodger)
      pluto_exodus <= 0;
  end

always @(pluto_exodus)
  begin
      feedback_pt_225 = pluto_exodus;
  end

always @(pluto_exodus)
  begin
      feedback_pt_226 = pluto_exodus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shark_avon <= 1;
    else
      shark_avon <= protest_bfs;
  end

always @(shark_avon)
  begin
      feedback_pt_227 = shark_avon;
  end

always @(shark_avon)
  begin
      feedback_pt_228 = shark_avon;
  end

always @(shark_avon)
  begin
      feedback_pt_229 = shark_avon;
  end

always @(shark_avon)
  begin
      feedback_pt_230 = shark_avon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marge_killme <= 0;
    else if (spastic)
      marge_killme <= 0;
    else if (lestrange)
      marge_killme <= arizona;
  end

always @(marge_killme)
  begin
      feedback_pt_231 = marge_killme;
  end

always @(marge_killme)
  begin
      feedback_pt_232 = marge_killme;
  end

always @(marge_killme)
  begin
      feedback_pt_233 = marge_killme;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ostrich_gap <= 0;
    else if (aspirin)
      ostrich_gap <= 0;
    else if (vcc)
      ostrich_gap <= gnd;
  end

always @(ostrich_gap)
  begin
      feedback_pt_234 = ostrich_gap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      helena_sinus <= 0;
    else if (nyc_foliage)
      helena_sinus <= 0;
    else if (zulu_hagrid)
      helena_sinus <= crank;
  end

always @(helena_sinus)
  begin
      feedback_pt_235 = helena_sinus;
  end

always @(helena_sinus)
  begin
      feedback_pt_236 = helena_sinus;
  end

always @(helena_sinus)
  begin
      feedback_pt_237 = helena_sinus;
  end

always @(helena_sinus)
  begin
      feedback_pt_238 = helena_sinus;
  end

always @(helena_sinus)
  begin
      feedback_pt_239 = helena_sinus;
  end

wire cluckU_klaas_wire;

dffeas cluckU_klaas_ff (
  .clk(clock1),
  .d(gnd),
  .ena(helena_sinus),
  .sclr(gnd),
  .sload(phenyalanine),
  .asdata(atoms),
  .clrn(!reset1),
  .q(cluckU_klaas_wire)
);

always @(cluckU_klaas_wire) begin
   pizza_popacap = cluckU_klaas_wire;
end

always @(pizza_popacap)
  begin
      feedback_pt_240 = pizza_popacap;
  end

always @(pizza_popacap)
  begin
      feedback_pt_241 = pizza_popacap;
  end

always @(pizza_popacap)
  begin
      feedback_pt_242 = pizza_popacap;
  end

always @(pizza_popacap)
  begin
      feedback_pt_243 = pizza_popacap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      odin_hotdog <= 0;
    else if (phoenix)
      odin_hotdog <= vcc;
  end

always @(odin_hotdog)
  begin
      feedback_pt_244 = odin_hotdog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goblin_romex <= 0;
    else if (sirius)
      goblin_romex <= stick;
    else if (weevil_prison)
      goblin_romex <= 0;
  end

always @(goblin_romex)
  begin
      feedback_pt_245 = goblin_romex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iguana_bullet <= 0;
    else if (wizard)
      iguana_bullet <= speed;
  end

always @(iguana_bullet)
  begin
      feedback_pt_246 = iguana_bullet;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tofu_leidiot <= 0;
    else if (dimetap)
      tofu_leidiot <= vcc;
  end

always @(tofu_leidiot)
  begin
      feedback_pt_247 = tofu_leidiot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turnip_doobie <= 0;
    else if (danger_star)
      turnip_doobie <= vcc;
    else if (voodoo)
      turnip_doobie <= 0;
  end

always @(turnip_doobie)
  begin
      feedback_pt_248 = turnip_doobie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_chief <= 0;
    else if (yankee_huey)
      ibm_chief <= arizona;
  end

always @(ibm_chief)
  begin
      feedback_pt_249 = ibm_chief;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_norbert <= 0;
    else if (balloon)
      south_norbert <= 0;
    else if (viagra)
      south_norbert <= viagra;
  end

always @(south_norbert)
  begin
      feedback_pt_250 = south_norbert;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gerrit_gyro <= 0;
    else if (gnd)
      gerrit_gyro <= 0;
    else if (wujing)
      gerrit_gyro <= bacon;
  end

always @(gerrit_gyro)
  begin
      feedback_pt_251 = gerrit_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hans_kungfu <= 0;
    else
      hans_kungfu <= ostrich_gap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      floo_xray <= 0;
    else if (albus)
      floo_xray <= 0;
    else if (crucio)
      floo_xray <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      solder_troll <= 1;
    else
      solder_troll <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pyro_kmfdm <= 1;
    else
      pyro_kmfdm <= dinoblaster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      copper_beef <= 0;
    else if (thurston)
      copper_beef <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stoner_saturn <= 0;
    else if (pixie)
      stoner_saturn <= ostrich_gap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maki_hp <= 0;
    else if (wukong)
      maki_hp <= 0;
    else if (gnd)
      maki_hp <= leaky;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_rose <= 0;
    else if (mcgonagall)
      advil_rose <= kedavra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spirit_shuda <= 0;
    else if (uncharted)
      spirit_shuda <= drumstrang;
  end

wire ohisee_malfoy_wire;

dffeas ohisee_malfoy_ff (
  .clk(clock1),
  .d(vcc),
  .ena(army),
  .sclr(fireplace),
  .sload(clothing),
  .asdata(erasmus),
  .clrn(!reset1),
  .q(ohisee_malfoy_wire)
);

always @(ohisee_malfoy_wire) begin
   moody_opus = ohisee_malfoy_wire;
end

wire army_cafe_wire;

dffea army_cafe_ff (
  .clk(clock1),
  .d(gnd),
  .ena(vcc),
  .adata(tango_saturn),
  .clrn(!reset1),
  .q(army_cafe_wire)
);

always @(army_cafe_wire) begin
   whale_ocha = army_cafe_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_yankee <= 0;
    else if (gnd)
      curie_yankee <= cornell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chillis_avon <= 0;
    else if (gnd)
      chillis_avon <= 0;
    else if (vcc)
      chillis_avon <= filch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_fish <= 0;
    else
      escape_fish <= weevil_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rojas_bull <= 0;
    else if (crank)
      rojas_bull <= coconut;
    else if (gerrit_gyro)
      rojas_bull <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sleeping_art <= 0;
    else if (protest)
      sleeping_art <= 0;
    else if (vcc)
      sleeping_art <= romex_dingbat;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonton_tonic <= 0;
    else if (vcc)
      wonton_tonic <= sinus;
    else if (vcc)
      wonton_tonic <= 0;
  end

wire hoser_holland_wire;

dffeas hoser_holland_ff (
  .clk(clock1),
  .d(witchdoctor),
  .ena(tonks),
  .sclr(witchdoctor),
  .sload(gnd),
  .asdata(papyrus),
  .clrn(!reset1),
  .q(hoser_holland_wire)
);

always @(hoser_holland_wire) begin
   leaky_sanity = hoser_holland_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_black <= 0;
    else
      ramone_black <= witchdoctor;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intuit_voodoo <= 0;
    else if (klaas)
      intuit_voodoo <= 0;
    else if (fitter)
      intuit_voodoo <= phoenix;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spain_stix <= 0;
    else if (gerrit)
      spain_stix <= 0;
    else if (stoner_saturn)
      spain_stix <= enoch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_tobiko <= 0;
    else if (turnip_doobie)
      oscar_tobiko <= moody_opus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_tinker <= 0;
    else if (quidditch)
      deng_tinker <= 0;
    else if (vcc)
      deng_tinker <= saccarine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shemp_floride <= 1;
    else
      shemp_floride <= sun;
  end

wire crack_donald_wire;

dffeas crack_donald_ff (
  .clk(clock1),
  .d(vcc),
  .ena(advil_rose),
  .sclr(gnd),
  .sload(gin_kdqcens),
  .asdata(sun_milhouse),
  .clrn(!reset1),
  .q(crack_donald_wire)
);

always @(crack_donald_wire) begin
   bathroom_elf = crack_donald_wire;
end

wire troll_lemon_wire;

dffeas troll_lemon_ff (
  .clk(clock1),
  .d(thedon_goofy),
  .ena(whale_ocha),
  .sclr(peaves),
  .sload(llamas_dont_eat_burrito),
  .asdata(vcc),
  .clrn(!reset1),
  .q(troll_lemon_wire)
);

always @(troll_lemon_wire) begin
   goblin_bear = troll_lemon_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      parrot_eeevil <= 0;
    else
      parrot_eeevil <= boing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quebec_webvan <= 0;
    else
      quebec_webvan <= salsa_hulk;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lsd_turnip <= 0;
    else if (blackbeans)
      lsd_turnip <= vcc;
  end

wire bach_maryann_wire;

dffea bach_maryann_ff (
  .clk(clock1),
  .d(furnace),
  .ena(picante),
  .adata(chuck_golf),
  .clrn(!reset1),
  .q(bach_maryann_wire)
);

always @(bach_maryann_wire) begin
   danger_pig = bach_maryann_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_sgates <= 0;
    else if (wancensorcens)
      lotus_sgates <= vcc;
    else if (pastrami)
      lotus_sgates <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pimpernel_moe <= 0;
    else if (powder)
      pimpernel_moe <= foxtrot_ring;
    else if (vcc)
      pimpernel_moe <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dopey_tattoo <= 1;
    else
      dopey_tattoo <= gnd;
  end

wire ready_tiger_wire;

dffeas ready_tiger_ff (
  .clk(clock1),
  .d(lao),
  .ena(rodriguez),
  .sclr(lovey),
  .sload(cheese_tobiko),
  .asdata(lsd_turnip),
  .clrn(!reset1),
  .q(ready_tiger_wire)
);

always @(ready_tiger_wire) begin
   rasp_stoned = ready_tiger_wire;
end

wire weasley_valve_wire;

dffea weasley_valve_ff (
  .clk(clock1),
  .d(gnd),
  .ena(gnd),
  .adata(vcc),
  .clrn(!reset1),
  .q(weasley_valve_wire)
);

always @(weasley_valve_wire) begin
   portnoy_stick = weasley_valve_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      palmer_emails <= 0;
    else if (vcc)
      palmer_emails <= 0;
    else if (pomodoro)
      palmer_emails <= intuit;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      weevil_solder <= 0;
    else if (papyrus)
      weevil_solder <= rojas_bull;
    else if (vcc)
      weevil_solder <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      isle_fufu <= 0;
    else if (winner_bambi)
      isle_fufu <= dirk;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_barnum <= 0;
    else if (gnd)
      ladder_barnum <= 0;
    else if (gerrit)
      ladder_barnum <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      guy_steaming <= 0;
    else
      guy_steaming <= boing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mike_mcnugget <= 0;
    else if (nyc_rubeus)
      mike_mcnugget <= 0;
    else if (gnd)
      mike_mcnugget <= vcc;
  end

reg feedback_pt_252;

always @(xiaoping or feedback_pt_252)
  begin
      kebab_nyquil = !xiaoping ^  feedback_pt_252;
  end

reg feedback_pt_253;

always @(lotus_sgates or feedback_pt_253)
  begin
      possum_yoda =  lotus_sgates ^ !feedback_pt_253;
  end

reg feedback_pt_254;

always @(saccarine or feedback_pt_254)
  begin
      sweetie_grams =  saccarine & !feedback_pt_254;
  end

reg feedback_pt_255;

always @(vcc or feedback_pt_255)
  begin
      avon_liberace = !vcc &  feedback_pt_255;
  end

reg feedback_pt_256;

always @(wonton_tonic or feedback_pt_256)
  begin
      achilles_lala = !wonton_tonic &  feedback_pt_256;
  end

reg feedback_pt_257;

always @(gnd or feedback_pt_257)
  begin
      ajax_too_big =  gnd ^  feedback_pt_257;
  end

reg feedback_pt_258;

always @(gnd or feedback_pt_258)
  begin
      chillis_willy = !gnd ^  feedback_pt_258;
  end

reg feedback_pt_259;

always @(vcc or feedback_pt_259)
  begin
      dow_amex = !vcc |  feedback_pt_259;
  end

reg feedback_pt_260;

always @(weevil_solder or feedback_pt_260)
  begin
      lion_popcorn =  weevil_solder ^  feedback_pt_260;
  end

reg feedback_pt_261;

always @(iguana_bullet or feedback_pt_261)
  begin
      kang_bacon =  iguana_bullet ^  feedback_pt_261;
  end

reg feedback_pt_262;

always @(vcc or feedback_pt_262)
  begin
      popcorn_advil = !vcc &  feedback_pt_262;
  end

reg feedback_pt_263;

always @(vcc or feedback_pt_263)
  begin
      gerard_kungfu =  vcc |  feedback_pt_263;
  end

reg feedback_pt_264;

always @(vcc or feedback_pt_264)
  begin
      whale_malfoy =  vcc | !feedback_pt_264;
  end

reg feedback_pt_265;

always @(guacamole or feedback_pt_265)
  begin
      stoned_sake =  guacamole ^ !feedback_pt_265;
  end

reg feedback_pt_266;

always @(gnd or feedback_pt_266)
  begin
      tylenol_otter =  gnd ^ !feedback_pt_266;
  end

reg feedback_pt_267;

always @(mexican or feedback_pt_267)
  begin
      yankee_hoser =  mexican & !feedback_pt_267;
  end

reg feedback_pt_268;

always @(gnd or feedback_pt_268)
  begin
      bush_wiggles = !gnd & !feedback_pt_268;
  end

reg feedback_pt_269;

always @(lion_popcorn or feedback_pt_269)
  begin
      west_eatem =  lion_popcorn |  feedback_pt_269;
  end

reg feedback_pt_270;

always @(rasp_stoned or feedback_pt_270)
  begin
      kappa_zed = !rasp_stoned ^ !feedback_pt_270;
  end

reg feedback_pt_271;

always @(gnd or feedback_pt_271)
  begin
      beast_uppers =  gnd ^ !feedback_pt_271;
  end

reg feedback_pt_272;

always @(curie_yankee or feedback_pt_272)
  begin
      blue_aphid = !curie_yankee |  feedback_pt_272;
  end

reg feedback_pt_273;

always @(gilligan or feedback_pt_273)
  begin
      tasty_ebi = !gilligan & !feedback_pt_273;
  end

reg feedback_pt_274;

always @(chowmein or feedback_pt_274)
  begin
      jonas_falafel = !chowmein &  feedback_pt_274;
  end

reg feedback_pt_275;

always @(weevil_prison or feedback_pt_275)
  begin
      zulu_eel =  weevil_prison ^ !feedback_pt_275;
  end

reg feedback_pt_276;

always @(cheese_tobiko or feedback_pt_276)
  begin
      wildboar_iron = !cheese_tobiko ^  feedback_pt_276;
  end

reg feedback_pt_277;

always @(whale_malfoy or feedback_pt_277)
  begin
      madeye_mozart = !whale_malfoy & !feedback_pt_277;
  end

reg feedback_pt_278;

always @(gnd or feedback_pt_278)
  begin
      obiwan_rabbi = !gnd & !feedback_pt_278;
  end

reg feedback_pt_279;

always @(portnoy_stick or feedback_pt_279)
  begin
      tuna_minerva =  portnoy_stick &  feedback_pt_279;
  end

reg feedback_pt_280;

always @(children or feedback_pt_280)
  begin
      parrot_doc =  children & !feedback_pt_280;
  end

reg feedback_pt_281;

always @(gnd or feedback_pt_281)
  begin
      homerun_stix = !gnd ^  feedback_pt_281;
  end

reg feedback_pt_282;

always @(kang_bacon or feedback_pt_282)
  begin
      edible_amex = !kang_bacon & !feedback_pt_282;
  end

reg feedback_pt_283;

always @(homerun_stix or feedback_pt_283)
  begin
      ham_alpha = !homerun_stix | !feedback_pt_283;
  end

reg feedback_pt_284;

always @(vcc or feedback_pt_284)
  begin
      moody_noah = !vcc &  feedback_pt_284;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_hagrid_neon.v
///////////////////////////////////////////

wire  nut_002_hagrid_neon_inst0_oscar_parrot, nut_002_hagrid_neon_inst0_spain_loser, nut_002_hagrid_neon_inst0_elian_romeo,
     nut_002_hagrid_neon_inst0_dingbat_palm, nut_002_hagrid_neon_inst0_superman_ebi, nut_002_hagrid_neon_inst0_grumby_lucent, nut_002_hagrid_neon_inst0_flew_bison,
     nut_002_hagrid_neon_inst0_troll_uppers, nut_002_hagrid_neon_inst0_dingbat_tesla, nut_002_hagrid_neon_inst0_homerun_echo, nut_002_hagrid_neon_inst0_kmfdm_school,
     nut_002_hagrid_neon_inst0_ocha_hercules, nut_002_hagrid_neon_inst0_gin_ceres, nut_002_hagrid_neon_inst0_tonic_dutch, nut_002_hagrid_neon_inst0_midas_hippo,
     nut_002_hagrid_neon_inst0_moody_zhuang, nut_002_hagrid_neon_inst0_whiskey_alpha, nut_002_hagrid_neon_inst0_howell_malfoy, nut_002_hagrid_neon_inst0_sears_george,
     nut_002_hagrid_neon_inst0_cybex_air, nut_002_hagrid_neon_inst0_trevor_jiminy, nut_002_hagrid_neon_inst0_dorkus_marge;

nut_002_hagrid_neon nut_002_hagrid_neon_inst0 (

    //inputs
     .diagon_willy(booming), .uppers_speed(vcc), .pentium_tin(leaky_sanity), .moulin_crank(vcc),
     .otter_kedavra(tapered), .kana_zi(robust), .saturn_simasu(professor), .ready_centaur(ghost), .rojas_tobe(dow_amex),
     .goofy_kappa(ajax_too_big), .hoser_zen(stix), .marco_freaky(snape), .zebra_lad(bomb_yak), .yellow_wine(kebab_nyquil),
     .wine_sand(professor), .curly_fear(microscope),

    //outputs
     .oscar_parrot(nut_002_hagrid_neon_inst0_oscar_parrot), .spain_loser(nut_002_hagrid_neon_inst0_spain_loser),
     .elian_romeo(nut_002_hagrid_neon_inst0_elian_romeo), .dingbat_palm(nut_002_hagrid_neon_inst0_dingbat_palm), .superman_ebi(nut_002_hagrid_neon_inst0_superman_ebi),
     .grumby_lucent(nut_002_hagrid_neon_inst0_grumby_lucent), .flew_bison(nut_002_hagrid_neon_inst0_flew_bison), .troll_uppers(nut_002_hagrid_neon_inst0_troll_uppers),
     .dingbat_tesla(nut_002_hagrid_neon_inst0_dingbat_tesla), .homerun_echo(nut_002_hagrid_neon_inst0_homerun_echo), .kmfdm_school(nut_002_hagrid_neon_inst0_kmfdm_school),
     .ocha_hercules(nut_002_hagrid_neon_inst0_ocha_hercules), .gin_ceres(nut_002_hagrid_neon_inst0_gin_ceres), .tonic_dutch(nut_002_hagrid_neon_inst0_tonic_dutch),
     .midas_hippo(nut_002_hagrid_neon_inst0_midas_hippo), .moody_zhuang(nut_002_hagrid_neon_inst0_moody_zhuang), .whiskey_alpha(nut_002_hagrid_neon_inst0_whiskey_alpha),
     .howell_malfoy(nut_002_hagrid_neon_inst0_howell_malfoy), .sears_george(nut_002_hagrid_neon_inst0_sears_george), .cybex_air(nut_002_hagrid_neon_inst0_cybex_air),
     .trevor_jiminy(nut_002_hagrid_neon_inst0_trevor_jiminy), .dorkus_marge(nut_002_hagrid_neon_inst0_dorkus_marge),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   moe_carolina = nut_002_hagrid_neon_inst0_oscar_parrot;
   doc_bathroom = nut_002_hagrid_neon_inst0_spain_loser;
   fury_saturn = nut_002_hagrid_neon_inst0_elian_romeo;
   hiway_jesus = nut_002_hagrid_neon_inst0_dingbat_palm;
   bison_mexican = nut_002_hagrid_neon_inst0_superman_ebi;
   wanton_flew = nut_002_hagrid_neon_inst0_grumby_lucent;
   killer_ready = nut_002_hagrid_neon_inst0_flew_bison;
   stemcell_zed = nut_002_hagrid_neon_inst0_troll_uppers;
   valve_loud = nut_002_hagrid_neon_inst0_dingbat_tesla;
   viagra_filch = nut_002_hagrid_neon_inst0_homerun_echo;
   peaves_dutch = nut_002_hagrid_neon_inst0_kmfdm_school;
   tabby_guy = nut_002_hagrid_neon_inst0_ocha_hercules;
   bacon_gyro = nut_002_hagrid_neon_inst0_gin_ceres;
   ready_chips = nut_002_hagrid_neon_inst0_tonic_dutch;
   copper_gerrit = nut_002_hagrid_neon_inst0_midas_hippo;
   water_foryou = nut_002_hagrid_neon_inst0_moody_zhuang;
   show_mrbill = nut_002_hagrid_neon_inst0_whiskey_alpha;
   tin_lestrange = nut_002_hagrid_neon_inst0_howell_malfoy;
   draco_october = nut_002_hagrid_neon_inst0_sears_george;
   clay_yohimbe = nut_002_hagrid_neon_inst0_cybex_air;
   beef_covad = nut_002_hagrid_neon_inst0_trevor_jiminy;
   curious_moron = nut_002_hagrid_neon_inst0_dorkus_marge;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_hagrid_neon.v
///////////////////////////////////////////

wire  nut_002_hagrid_neon_inst1_oscar_parrot, nut_002_hagrid_neon_inst1_spain_loser, nut_002_hagrid_neon_inst1_elian_romeo,
     nut_002_hagrid_neon_inst1_dingbat_palm, nut_002_hagrid_neon_inst1_superman_ebi, nut_002_hagrid_neon_inst1_grumby_lucent, nut_002_hagrid_neon_inst1_flew_bison,
     nut_002_hagrid_neon_inst1_troll_uppers, nut_002_hagrid_neon_inst1_dingbat_tesla, nut_002_hagrid_neon_inst1_homerun_echo, nut_002_hagrid_neon_inst1_kmfdm_school,
     nut_002_hagrid_neon_inst1_ocha_hercules, nut_002_hagrid_neon_inst1_gin_ceres, nut_002_hagrid_neon_inst1_tonic_dutch, nut_002_hagrid_neon_inst1_midas_hippo,
     nut_002_hagrid_neon_inst1_moody_zhuang, nut_002_hagrid_neon_inst1_whiskey_alpha, nut_002_hagrid_neon_inst1_howell_malfoy, nut_002_hagrid_neon_inst1_sears_george,
     nut_002_hagrid_neon_inst1_cybex_air, nut_002_hagrid_neon_inst1_trevor_jiminy, nut_002_hagrid_neon_inst1_dorkus_marge;

nut_002_hagrid_neon nut_002_hagrid_neon_inst1 (

    //inputs
     .diagon_willy(spirit_shuda), .uppers_speed(cheese_tobiko), .pentium_tin(abraham), .moulin_crank(fortuyn),
     .otter_kedavra(pork), .kana_zi(gnd), .saturn_simasu(stoner_zed), .ready_centaur(solder_troll), .rojas_tobe(shark),
     .goofy_kappa(sinew), .hoser_zen(south_norbert), .marco_freaky(broom), .zebra_lad(minerva), .yellow_wine(vcc),
     .wine_sand(psucensorc), .curly_fear(beast_uppers),

    //outputs
     .oscar_parrot(nut_002_hagrid_neon_inst1_oscar_parrot), .spain_loser(nut_002_hagrid_neon_inst1_spain_loser),
     .elian_romeo(nut_002_hagrid_neon_inst1_elian_romeo), .dingbat_palm(nut_002_hagrid_neon_inst1_dingbat_palm), .superman_ebi(nut_002_hagrid_neon_inst1_superman_ebi),
     .grumby_lucent(nut_002_hagrid_neon_inst1_grumby_lucent), .flew_bison(nut_002_hagrid_neon_inst1_flew_bison), .troll_uppers(nut_002_hagrid_neon_inst1_troll_uppers),
     .dingbat_tesla(nut_002_hagrid_neon_inst1_dingbat_tesla), .homerun_echo(nut_002_hagrid_neon_inst1_homerun_echo), .kmfdm_school(nut_002_hagrid_neon_inst1_kmfdm_school),
     .ocha_hercules(nut_002_hagrid_neon_inst1_ocha_hercules), .gin_ceres(nut_002_hagrid_neon_inst1_gin_ceres), .tonic_dutch(nut_002_hagrid_neon_inst1_tonic_dutch),
     .midas_hippo(nut_002_hagrid_neon_inst1_midas_hippo), .moody_zhuang(nut_002_hagrid_neon_inst1_moody_zhuang), .whiskey_alpha(nut_002_hagrid_neon_inst1_whiskey_alpha),
     .howell_malfoy(nut_002_hagrid_neon_inst1_howell_malfoy), .sears_george(nut_002_hagrid_neon_inst1_sears_george), .cybex_air(nut_002_hagrid_neon_inst1_cybex_air),
     .trevor_jiminy(nut_002_hagrid_neon_inst1_trevor_jiminy), .dorkus_marge(nut_002_hagrid_neon_inst1_dorkus_marge),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   chief_bambi = nut_002_hagrid_neon_inst1_oscar_parrot;
   rat_wakey = nut_002_hagrid_neon_inst1_spain_loser;
   aspirin_ritsu = nut_002_hagrid_neon_inst1_elian_romeo;
   tonks_snake = nut_002_hagrid_neon_inst1_dingbat_palm;
   what_husks = nut_002_hagrid_neon_inst1_superman_ebi;
   newt_sirius = nut_002_hagrid_neon_inst1_grumby_lucent;
   crack_lamer = nut_002_hagrid_neon_inst1_flew_bison;
   egg_homer = nut_002_hagrid_neon_inst1_troll_uppers;
   fear_star = nut_002_hagrid_neon_inst1_dingbat_tesla;
   rojas_kungfu = nut_002_hagrid_neon_inst1_homerun_echo;
   solder_issac = nut_002_hagrid_neon_inst1_kmfdm_school;
   kabar_whiskey = nut_002_hagrid_neon_inst1_ocha_hercules;
   eel_zinc = nut_002_hagrid_neon_inst1_gin_ceres;
   pluto_psycho = nut_002_hagrid_neon_inst1_tonic_dutch;
   yak_brothers = nut_002_hagrid_neon_inst1_midas_hippo;
   moreand_willy = nut_002_hagrid_neon_inst1_moody_zhuang;
   ajax_psycho = nut_002_hagrid_neon_inst1_whiskey_alpha;
   hp_eeevil = nut_002_hagrid_neon_inst1_howell_malfoy;
   mushroom_dork = nut_002_hagrid_neon_inst1_sears_george;
   boots_yellow = nut_002_hagrid_neon_inst1_cybex_air;
   oscar_bonker = nut_002_hagrid_neon_inst1_trevor_jiminy;
   bomb_yohimbe = nut_002_hagrid_neon_inst1_dorkus_marge;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_m47.v
///////////////////////////////////////////

wire [63:0] sun_tesla_dout;
wire [162:0] sun_tesla_din;
assign sun_tesla_din[162:153] = {hp_eeevil,jupiter_ceres,gnd,palmer_emails,pyro_kmfdm,army,rojas_bull,mundungus,ibm_chief,beast};
assign sun_tesla_din[152:143] = {ready_chips,rubeus,vcc,hans,vcc,quebec_webvan,sinus,fortuyn,icarus,ham_alpha};
assign sun_tesla_din[142:133] = {gnd,show_mrbill,leaky,hogwarts,moe_carolina,boots_sanity,sand_baron,tabasco,turkey,hiway_jesus};
assign sun_tesla_din[132:123] = {vcc,vcc,vcc,gnd,popcorn_advil,gap,intuit_voodoo,shark_avon,vcc,blue_aphid};
assign sun_tesla_din[122:113] = {onion,killer_ready,pluto_psycho,ocha,vcc,icarus,robust,gnd,peaves_dutch,vcc};
assign sun_tesla_din[112:103] = {bacon,yak_brothers,castaway,advil_rose,nyc_rubeus,vcc,newt_sirius,aphid_bullet,vcc,gnd};
assign sun_tesla_din[102:93] = {boing,papyrus,salmon_mickey,fear_star,sapporo,mario_owes,vcc,tuna_minerva,boots_yellow,jalapeno};
assign sun_tesla_din[92:83] = {sleeping_art,vcc,automounter,tabby_guy,vcc,vangoh,sweetie_grams,gerard,chief_bambi,tylenol_otter};
assign sun_tesla_din[82:73] = {rat_wakey,nation,obiwan_rabbi,possum_yoda,umbridge,danger_pig,bfs,tabasco,softball,att};
assign sun_tesla_din[72:63] = {deng,sand_baron,palmer_emails,lestrange,bfi,skinner_ohno,gnd,dopey_tattoo,vcc,ready_chips};
assign sun_tesla_din[62:53] = {pluto_psycho,vcc,sinew,viagra_filch,jinyong,peaves_dutch,gnd,oscar_tobiko,mike_mcnugget,parrot_doc};
assign sun_tesla_din[52:43] = {gnd,moody_noah,vcc,crack_lamer,feynman,vcc,shemp_floride,sand_baron,oscar_bonker,chief_bambi};
assign sun_tesla_din[42:33] = {jonas_falafel,edible_amex,copper_gerrit,hiway_jesus,sinew,gnd,lestrange,gnd,vcc,vcc};
assign sun_tesla_din[32:23] = {rodriguez,balloon,ibm_chief,desade_touch,deng_tinker,hp_eeevil,schwinger,lockheed,gnd,bach_onion};
assign sun_tesla_din[22:13] = {vcc,stix,jinyong,kabar_whiskey,vcc,vcc,wancensorcens,gnd,madeye_mozart,guy_steaming};
assign sun_tesla_din[12:3] = {rojas_kungfu,puttanesca,gnd,gnd,gap,cafe,ajax_psycho,tin_lestrange,sun,tylenol_otter};
assign sun_tesla_din[2:0] = {deng_tinker,pastrami,umbridge};

nut_002_m47 nut_002_m47_inst_sun_tesla (
  .ins(sun_tesla_din),
  .clock(clock1),
  .reset(reset1),
  .outs(sun_tesla_dout)
);

always @(sun_tesla_dout)
begin
  {metal_dog,tabby_moses,kanji_uppers,nobody_zeus,tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks,shark_palm,loud_ariel} = sun_tesla_dout[63:54];
  {fortuyn_heidi,mushroom_zed,brian_zulu,priest_echo,dork_love_in,kang_tsmc,boots_cuckoo,cybex_saturn,skipper_happy,what_peta} = sun_tesla_dout[53:44];
  {midas_trevor,donkey_genji,starwars_gyro,century_biker,dow_rubeus,bush_gutter,sun_wannabe,guy_ykocens,sake_ocha,oscar_gin} = sun_tesla_dout[43:34];
  {nasdaq_iron,po_killme,zinc_bust,joker_gotone,rojas_norbert,iguana_buddha,otter_hotel,books_gojira,tiger_drugs,pdaddy_powder} = sun_tesla_dout[33:24];
  {beauty_coffee,tabasco_snape,quail_minnie,barney_cannon,ghost_asahi,pirate_mrbill,black_intuit,atomic_lad,shark_peace,suffering_gm} = sun_tesla_dout[23:14];
  {spyro_lima,lao_beef,todd_malfoy,hulk_booming,eunice_eunice,marco_thread,sanity_fallen,dopey_bomb,ebi_bubba,roid_kungfu} = sun_tesla_dout[13:4];
  {hans_ritsu,rewire_bubba,wildboar_mao,money_donut} = sun_tesla_dout[3:0];
end

reg feedback_pt_285;

always @(ibm or feedback_pt_285)
  begin
      freaky_amex = !ibm &  feedback_pt_285;
  end

reg feedback_pt_286;

always @(gnd or feedback_pt_286)
  begin
      waffle_midas = !gnd ^ !feedback_pt_286;
  end

reg feedback_pt_287;

always @(gnd or feedback_pt_287)
  begin
      wizard_norris =  gnd & !feedback_pt_287;
  end

reg feedback_pt_288;

always @(dow_rubeus or feedback_pt_288)
  begin
      tango_would = !dow_rubeus &  feedback_pt_288;
  end

reg feedback_pt_289;

always @(black_intuit or feedback_pt_289)
  begin
      black_kebab =  black_intuit ^ !feedback_pt_289;
  end

reg feedback_pt_290;

always @(nasdaq_iron or feedback_pt_290)
  begin
      show_bacon = !nasdaq_iron ^  feedback_pt_290;
  end

reg feedback_pt_291;

always @(vcc or feedback_pt_291)
  begin
      coffee_wujing =  vcc |  feedback_pt_291;
  end

reg feedback_pt_292;

always @(vcc or feedback_pt_292)
  begin
      master_elf =  vcc |  feedback_pt_292;
  end

reg feedback_pt_293;

always @(pluto_psycho or feedback_pt_293)
  begin
      cartman_hurt =  pluto_psycho ^  feedback_pt_293;
  end

reg feedback_pt_294;

always @(hulk_booming or feedback_pt_294)
  begin
      purple_maki =  hulk_booming |  feedback_pt_294;
  end

reg feedback_pt_295;

always @(chillis_avon or feedback_pt_295)
  begin
      lala_agitator =  chillis_avon ^  feedback_pt_295;
  end

reg feedback_pt_296;

always @(show_bacon or feedback_pt_296)
  begin
      baron_juliet = !show_bacon ^ !feedback_pt_296;
  end

reg feedback_pt_297;

always @(century_biker or feedback_pt_297)
  begin
      yoda_kangaroo =  century_biker & !feedback_pt_297;
  end

reg feedback_pt_298;

always @(solder_troll or feedback_pt_298)
  begin
      banshee_think = !solder_troll | !feedback_pt_298;
  end

reg feedback_pt_299;

always @(oracle or feedback_pt_299)
  begin
      martin_bolt = !oracle &  feedback_pt_299;
  end

reg feedback_pt_300;

always @(gnd or feedback_pt_300)
  begin
      bush_kbtoys = !gnd ^  feedback_pt_300;
  end

reg feedback_pt_301;

always @(bach_onion or feedback_pt_301)
  begin
      mideast_bolt =  bach_onion | !feedback_pt_301;
  end

reg feedback_pt_302;

always @(siamese or feedback_pt_302)
  begin
      minnow_marco =  siamese & !feedback_pt_302;
  end

reg feedback_pt_303;

always @(solder_troll or feedback_pt_303)
  begin
      hurt_rose =  solder_troll & !feedback_pt_303;
  end

reg feedback_pt_304;

always @(lockheed or feedback_pt_304)
  begin
      hours_green =  lockheed | !feedback_pt_304;
  end

reg feedback_pt_305;

always @(gnd or feedback_pt_305)
  begin
      venus_elian = !gnd |  feedback_pt_305;
  end

reg feedback_pt_306;

always @(coffee_wujing or feedback_pt_306)
  begin
      pyro_zipporah = !coffee_wujing & !feedback_pt_306;
  end

reg feedback_pt_307;

always @(icarus or feedback_pt_307)
  begin
      killer_marker =  icarus ^  feedback_pt_307;
  end

reg feedback_pt_308;

always @(gnd or feedback_pt_308)
  begin
      snake_marco =  gnd ^  feedback_pt_308;
  end

reg feedback_pt_309;

always @(aspirin_ritsu or feedback_pt_309)
  begin
      bubba_peta =  aspirin_ritsu ^  feedback_pt_309;
  end

reg feedback_pt_310;

always @(lotus or feedback_pt_310)
  begin
      honda_pdaddy =  lotus ^ !feedback_pt_310;
  end

reg feedback_pt_311;

always @(stemcell_zed or feedback_pt_311)
  begin
      midas_macys =  stemcell_zed |  feedback_pt_311;
  end

reg feedback_pt_312;

always @(tabasco_snape or feedback_pt_312)
  begin
      zed_orange =  tabasco_snape &  feedback_pt_312;
  end

reg feedback_pt_313;

always @(robust or feedback_pt_313)
  begin
      drevil_spirit = !robust |  feedback_pt_313;
  end

reg feedback_pt_314;

always @(kang_tsmc or feedback_pt_314)
  begin
      ulysses_nyc = !kang_tsmc ^ !feedback_pt_314;
  end

reg feedback_pt_315;

always @(mushroom_zed or feedback_pt_315)
  begin
      mine_ostrich = !mushroom_zed &  feedback_pt_315;
  end

reg feedback_pt_316;

always @(baron_juliet or feedback_pt_316)
  begin
      art_zed = !baron_juliet &  feedback_pt_316;
  end

reg feedback_pt_317;

always @(vcc or feedback_pt_317)
  begin
      what_intel = !vcc & !feedback_pt_317;
  end

reg feedback_pt_318;

always @(nyquil or feedback_pt_318)
  begin
      gopher_minnow =  nyquil | !feedback_pt_318;
  end

reg feedback_pt_319;

always @(fury_saturn or feedback_pt_319)
  begin
      neon_snape =  fury_saturn &  feedback_pt_319;
  end

reg feedback_pt_320;

always @(sanity_fallen or feedback_pt_320)
  begin
      rufus_advil = !sanity_fallen |  feedback_pt_320;
  end

// Random combinatorial logic block
always@(*)
  begin
      zedong_lucius = ~( ~( ( ~( ( ~( burrito ) ^ ~( ~dukdodger ) ) & ( ~( tango_loud ) & ( ~( ~leaky & ~centaur ) ) ) ) ) ) );
  end

  always@(*)
  begin
    sake_bullet = ~( ~( ~( ~vcc ) ) ) ? gnd : ~( ~( ( ~( ( ~( ~( kang_tsmc ) & ( ~( ~vcc & ~wildboar_iron ) ) ) ) | ( ~( ~( lao ) ^ ~( beef_covad ) ) ) ) ) ) );
  end
// State Mek foryou_rubik Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foryou_rubik <= foryou_rubik_0;
    else
      case (foryou_rubik)
        foryou_rubik_0: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 11)
            foryou_rubik <= foryou_rubik_2;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 13)
            foryou_rubik <= foryou_rubik_9;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 15)
            foryou_rubik <= foryou_rubik_3;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 14)
            foryou_rubik <= foryou_rubik_6;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 10)
            foryou_rubik <= foryou_rubik_5;
          else
            foryou_rubik <= foryou_rubik_0;
          end
        foryou_rubik_1: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 11)
            foryou_rubik <= foryou_rubik_7;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 2)
            foryou_rubik <= foryou_rubik_5;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 1)
            foryou_rubik <= foryou_rubik_8;
          else
            foryou_rubik <= foryou_rubik_1;
          end
        foryou_rubik_2: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 4)
            foryou_rubik <= foryou_rubik_0;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 14)
            foryou_rubik <= foryou_rubik_5;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 3)
            foryou_rubik <= foryou_rubik_8;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 15)
            foryou_rubik <= foryou_rubik_3;
          else
            foryou_rubik <= foryou_rubik_2;
          end
        foryou_rubik_3: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 14)
            foryou_rubik <= foryou_rubik_10;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 12)
            foryou_rubik <= foryou_rubik_8;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 2)
            foryou_rubik <= foryou_rubik_10;
          else
            foryou_rubik <= foryou_rubik_3;
          end
        foryou_rubik_4: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 4)
            foryou_rubik <= foryou_rubik_6;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 13)
            foryou_rubik <= foryou_rubik_6;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 6)
            foryou_rubik <= foryou_rubik_5;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 1)
            foryou_rubik <= foryou_rubik_10;
          else
            foryou_rubik <= foryou_rubik_4;
          end
        foryou_rubik_5: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 14)
            foryou_rubik <= foryou_rubik_5;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 12)
            foryou_rubik <= foryou_rubik_1;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 8)
            foryou_rubik <= foryou_rubik_3;
          else
            foryou_rubik <= foryou_rubik_5;
          end
        foryou_rubik_6: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 7)
            foryou_rubik <= foryou_rubik_5;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 12)
            foryou_rubik <= foryou_rubik_3;
          else
            foryou_rubik <= foryou_rubik_6;
          end
        foryou_rubik_7: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 1)
            foryou_rubik <= foryou_rubik_5;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 4)
            foryou_rubik <= foryou_rubik_2;
          else
            foryou_rubik <= foryou_rubik_7;
          end
        foryou_rubik_8: begin
            foryou_rubik <= foryou_rubik_8;
          end
        foryou_rubik_9: begin
          if ({purple_maki,xbncensorcens,gnd,vcc} == 6)
            foryou_rubik <= foryou_rubik_3;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 12)
            foryou_rubik <= foryou_rubik_2;
          else if ({purple_maki,xbncensorcens,gnd,vcc} == 0)
            foryou_rubik <= foryou_rubik_4;
          else
            foryou_rubik <= foryou_rubik_9;
          end
        foryou_rubik_10: begin
            foryou_rubik <= foryou_rubik_10;
          end
        default: foryou_rubik <= foryou_rubik_0;
      endcase
  end

// State Mek foryou_rubik Output logic
always @(foryou_rubik)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (foryou_rubik[3:1])
        foryou_rubik_0: begin
            chairman_bfs = 1;
            sgates_thedon = 0;
            hulk_atomic = 1;
            peace_broom = 1;
            boing_illegal = 0;
            nobody_martin = 1;
            kang_minnie = 0;
            fortuyn_lamer = 0;
            pacific_asahi = 1;
          end
        foryou_rubik_1: begin
            chairman_bfs = 1;
            sgates_thedon = 1;
            hulk_atomic = 0;
            peace_broom = 1;
            boing_illegal = 0;
            nobody_martin = 0;
            kang_minnie = 0;
            fortuyn_lamer = 1;
            pacific_asahi = 1;
          end
        foryou_rubik_2: begin
            chairman_bfs = 1;
            sgates_thedon = 0;
            hulk_atomic = 0;
            peace_broom = 0;
            boing_illegal = 0;
            nobody_martin = 0;
            kang_minnie = 1;
            fortuyn_lamer = 0;
            pacific_asahi = 1;
          end
        foryou_rubik_3: begin
            chairman_bfs = 1;
            sgates_thedon = 0;
            hulk_atomic = 0;
            peace_broom = 1;
            boing_illegal = 1;
            nobody_martin = 0;
            kang_minnie = 1;
            fortuyn_lamer = 1;
            pacific_asahi = 0;
          end
        foryou_rubik_4: begin
            chairman_bfs = 0;
            sgates_thedon = 0;
            hulk_atomic = 1;
            peace_broom = 0;
            boing_illegal = 0;
            nobody_martin = 1;
            kang_minnie = 1;
            fortuyn_lamer = 0;
            pacific_asahi = 1;
          end
        default: begin
            chairman_bfs = 1;
            sgates_thedon = 0;
            hulk_atomic = 0;
            peace_broom = 0;
            boing_illegal = 1;
            nobody_martin = 0;
            kang_minnie = 0;
            fortuyn_lamer = 0;
            pacific_asahi = 1;
          end
      endcase
  end

always @(chairman_bfs)
  begin
      feedback_pt_252 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_253 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_254 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_255 = chairman_bfs;
  end

always @(chairman_bfs)
  begin
      feedback_pt_256 = chairman_bfs;
  end

always @(sgates_thedon)
  begin
      feedback_pt_257 = sgates_thedon;
  end

always @(hulk_atomic)
  begin
      feedback_pt_258 = hulk_atomic;
  end

always @(hulk_atomic)
  begin
      feedback_pt_259 = hulk_atomic;
  end

always @(hulk_atomic)
  begin
      feedback_pt_260 = hulk_atomic;
  end

always @(hulk_atomic)
  begin
      feedback_pt_261 = hulk_atomic;
  end

always @(peace_broom)
  begin
      feedback_pt_262 = peace_broom;
  end

always @(boing_illegal)
  begin
      feedback_pt_263 = boing_illegal;
  end

always @(boing_illegal)
  begin
      feedback_pt_264 = boing_illegal;
  end

always @(nobody_martin)
  begin
      feedback_pt_265 = nobody_martin;
  end

always @(kang_minnie)
  begin
      feedback_pt_266 = kang_minnie;
  end

always @(kang_minnie)
  begin
      feedback_pt_267 = kang_minnie;
  end

always @(kang_minnie)
  begin
      feedback_pt_268 = kang_minnie;
  end

always @(kang_minnie)
  begin
      feedback_pt_269 = kang_minnie;
  end

always @(fortuyn_lamer)
  begin
      feedback_pt_270 = fortuyn_lamer;
  end

always @(pacific_asahi)
  begin
      feedback_pt_271 = pacific_asahi;
  end

always @(pacific_asahi)
  begin
      feedback_pt_272 = pacific_asahi;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire thedon_potato_out;
nut_002_lut #(1) nut_002_lut_inst_thedon_potato (
  .din({sleeping_art}),
  .mask(2'b00),
  .out(thedon_potato_out)
);

always @(thedon_potato_out)
begin
   todd_pictures = thedon_potato_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire wujing_xray_out;
nut_002_lut #(2) nut_002_lut_inst_wujing_xray (
  .din({rubeus,shark_palm}),
  .mask(4'h5),
  .out(wujing_xray_out)
);

always @(wujing_xray_out)
begin
   holland_haze = wujing_xray_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire advil_cow_out;
nut_002_lut #(4) nut_002_lut_inst_advil_cow (
  .din({solder_issac,gnd,gnd,lala_agitator}),
  .mask(16'b0001001000010001),
  .out(advil_cow_out)
);

always @(advil_cow_out)
begin
   dopey_sinew = advil_cow_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire fire_waster_out;
nut_002_lut #(1) nut_002_lut_inst_fire_waster (
  .din({jupiter_ceres}),
  .mask(2'b01),
  .out(fire_waster_out)
);

always @(fire_waster_out)
begin
   platinum_haze = fire_waster_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire amex_potter_out;
nut_002_lut #(6) nut_002_lut_inst_amex_potter (
  .din({pluto_exodus,beef_covad,tonks_snake,pyro_zipporah,vcc,hulk_atomic}),
  .mask(64'b1000000000000000000101000111000010000001110100000010100100010010),
  .out(amex_potter_out)
);

always @(amex_potter_out)
begin
   iterate_sugar = amex_potter_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire loud_chiptrip_out;
nut_002_lut #(4) nut_002_lut_inst_loud_chiptrip (
  .din({gnd,brian_zulu,gnd,peace_broom}),
  .mask(16'b0100000000011010),
  .out(loud_chiptrip_out)
);

always @(loud_chiptrip_out)
begin
   thor_cucumber = loud_chiptrip_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire echo_eggsalad_out;
nut_002_lut #(6) nut_002_lut_inst_echo_eggsalad (
  .din({hp_eeevil,priest_echo,oscar_gin,stoned_sake,cain_jupiter,foliage}),
  .mask(64'hf7fc6b438613be90),
  .out(echo_eggsalad_out)
);

always @(echo_eggsalad_out)
begin
   south_toysrus = echo_eggsalad_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire homerun_deng_out;
nut_002_lut #(6) nut_002_lut_inst_homerun_deng (
  .din({sun_wannabe,children,stix,liberace,gnd,vcc}),
  .mask(64'h98b1d8f1294e59f3),
  .out(homerun_deng_out)
);

always @(homerun_deng_out)
begin
   cain_intel = homerun_deng_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire india_squad_out;
nut_002_lut #(4) nut_002_lut_inst_india_squad (
  .din({blackbeans,spyro_lima,snape,roid_kungfu}),
  .mask(16'h645e),
  .out(india_squad_out)
);

always @(india_squad_out)
begin
   dragon_malfoy = india_squad_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire concorde_show_out;
nut_002_lut #(5) nut_002_lut_inst_concorde_show (
  .din({boots_sanity,vcc,egg_homer,tin_lestrange,tango_loud}),
  .mask(32'h0589e6d7),
  .out(concorde_show_out)
);

always @(concorde_show_out)
begin
   sanity_tarzan = concorde_show_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire weevil_money_out;
nut_002_lut #(3) nut_002_lut_inst_weevil_money (
  .din({what_peta,master_elf,vcc}),
  .mask(8'ha3),
  .out(weevil_money_out)
);

always @(weevil_money_out)
begin
   covad_ocha = weevil_money_out;
end

// 7 to 3 bit A*Const mult
reg signed [6:0] loser_echo;
always @(what_peta or art_zed or vcc or vcc or vcc or atomic_lad or floo) begin
  loser_echo = {what_peta,art_zed,vcc,vcc,vcc,atomic_lad,floo};
end

always @(loser_echo)
  begin
      {potter_thor,money_fortuyn,blue_carolina} = 
	  	  ~loser_echo * 
		  45;
  end


initial begin
    {hanger_lizard,gregg_a_lovey,gap_tamago} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({gnd,gnd,curious_moron} < {nation,bomb_yohimbe,ebi_bubba})
       {hanger_lizard,gregg_a_lovey,gap_tamago} <= {nation,bomb_yohimbe,ebi_bubba};
    else
       {hanger_lizard,gregg_a_lovey,gap_tamago} <= {gnd,gnd,curious_moron};
  end

// 2s comp negate A
always @(ajax_too_big or bush_gutter or gnd or tesla_scrooge)
  begin
    {genji_stirfry,fish_waffle,daughter_sake,oscar_too_big} = - {ajax_too_big,bush_gutter,gnd,tesla_scrooge};
  end

// OR all of these bits together
always @(tylenol_otter or gnd or advil or chillis_willy or gnd)
  begin
      dork_rouge = | {tylenol_otter,gnd,advil,chillis_willy,gnd};
  end

always @(gnd or tofu_leidiot or vcc or cartman_hurt or boing_illegal or protest_bfs or whale_malfoy or psucensorc)
  begin
    jcrew_cow=1;
    casex ({gnd,tofu_leidiot,vcc,cartman_hurt,boing_illegal,protest_bfs,whale_malfoy,psucensorc})
      8'b1XXXXXXX: {jonas_rocks,husks_gotone,klaas_diagon}=7;
      8'b01XXXXXX: {jonas_rocks,husks_gotone,klaas_diagon}=6;
      8'b001XXXXX: {jonas_rocks,husks_gotone,klaas_diagon}=5;
      8'b0001XXXX: {jonas_rocks,husks_gotone,klaas_diagon}=4;
      8'b00001XXX: {jonas_rocks,husks_gotone,klaas_diagon}=3;
      8'b000001XX: {jonas_rocks,husks_gotone,klaas_diagon}=2;
      8'b0000001X: {jonas_rocks,husks_gotone,klaas_diagon}=1;
      8'b00000001: {jonas_rocks,husks_gotone,klaas_diagon}=0;
      default: begin
         jcrew_cow=0;
         {jonas_rocks,husks_gotone,klaas_diagon}=0;
      end
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rarest_emails <= 0;
    else
    case ({pirate_mrbill,gnd})
       0 : rarest_emails <= rarest_emails;
       1 : rarest_emails <= rarest_emails;
       2 : rarest_emails <= rarest_emails;
       3 : rarest_emails <= rarest_emails;
       default : rarest_emails <= 0;
    endcase
  end

always @(rarest_emails)
  begin
      feedback_pt_273 = rarest_emails;
  end

always @(rarest_emails)
  begin
      feedback_pt_274 = rarest_emails;
  end

always @(rarest_emails)
  begin
      feedback_pt_275 = rarest_emails;
  end

always @(rarest_emails)
  begin
      feedback_pt_276 = rarest_emails;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kanji_clay <= 0;
    else
    case ({fortuyn_lamer,sake_bullet})
       0 : kanji_clay <= kanji_clay;
       1 : kanji_clay <= peace_boots;
       2 : kanji_clay <= freaky_amex;
       3 : kanji_clay <= kanji_clay;
       default : kanji_clay <= 0;
    endcase
  end

always @(kanji_clay)
  begin
      feedback_pt_277 = kanji_clay;
  end

always @(kanji_clay)
  begin
      feedback_pt_278 = kanji_clay;
  end

always @(kanji_clay)
  begin
      feedback_pt_279 = kanji_clay;
  end

reg feedback_pt_321;

always @(killer_marker or feedback_pt_321)
  begin
      concorde_bart = !killer_marker | !feedback_pt_321;
  end

reg feedback_pt_322;

always @(bubba_peta or feedback_pt_322)
  begin
      master_bamboo =  bubba_peta | !feedback_pt_322;
  end

reg feedback_pt_323;

always @(gnd or feedback_pt_323)
  begin
      att_launcher =  gnd & !feedback_pt_323;
  end

reg feedback_pt_324;

always @(gnd or feedback_pt_324)
  begin
      surfer_tuna =  gnd |  feedback_pt_324;
  end

reg feedback_pt_325;

always @(vcc or feedback_pt_325)
  begin
      dig_shark =  vcc |  feedback_pt_325;
  end

reg feedback_pt_326;

always @(elguapo_marco or feedback_pt_326)
  begin
      illegal_rod =  elguapo_marco &  feedback_pt_326;
  end

reg feedback_pt_327;

always @(pdaddy_powder or feedback_pt_327)
  begin
      vegas_peace =  pdaddy_powder ^  feedback_pt_327;
  end

reg feedback_pt_328;

always @(brian_zulu or feedback_pt_328)
  begin
      beef_shuda =  brian_zulu & !feedback_pt_328;
  end

reg feedback_pt_329;

always @(spyro_lima or feedback_pt_329)
  begin
      soccer_speed =  spyro_lima &  feedback_pt_329;
  end

reg feedback_pt_330;

always @(what_husks or feedback_pt_330)
  begin
      zhuang_drugie = !what_husks &  feedback_pt_330;
  end

reg feedback_pt_331;

always @(hours_green or feedback_pt_331)
  begin
      falafel_sun =  hours_green & !feedback_pt_331;
  end

reg feedback_pt_332;

always @(gnd or feedback_pt_332)
  begin
      quebec_lovey =  gnd &  feedback_pt_332;
  end

reg feedback_pt_333;

always @(dow_rubeus or feedback_pt_333)
  begin
      potato_rod =  dow_rubeus |  feedback_pt_333;
  end

reg feedback_pt_334;

always @(tonks_snake or feedback_pt_334)
  begin
      south_nasdaq = !tonks_snake ^  feedback_pt_334;
  end

reg feedback_pt_335;

always @(jiminy_fear or feedback_pt_335)
  begin
      malfoy_boing =  jiminy_fear |  feedback_pt_335;
  end

reg feedback_pt_336;

always @(ramone_black or feedback_pt_336)
  begin
      yankees_heidi = !ramone_black ^  feedback_pt_336;
  end

reg feedback_pt_337;

always @(vcc or feedback_pt_337)
  begin
      giraffe_huey = !vcc |  feedback_pt_337;
  end

reg feedback_pt_338;

always @(isle_fufu or feedback_pt_338)
  begin
      bono_homer =  isle_fufu &  feedback_pt_338;
  end

reg feedback_pt_339;

always @(lost or feedback_pt_339)
  begin
      pig_fear = !lost ^ !feedback_pt_339;
  end

reg feedback_pt_340;

always @(bathroom_elf or feedback_pt_340)
  begin
      curly_baron =  bathroom_elf & !feedback_pt_340;
  end

reg feedback_pt_341;

always @(atchoo_deng or feedback_pt_341)
  begin
      loser_curious = !atchoo_deng | !feedback_pt_341;
  end

reg feedback_pt_342;

always @(gnd or feedback_pt_342)
  begin
      obiwan_quail =  gnd & !feedback_pt_342;
  end

reg feedback_pt_343;

always @(giraffe_huey or feedback_pt_343)
  begin
      bravo_haze = !giraffe_huey | !feedback_pt_343;
  end

reg feedback_pt_344;

always @(black_intuit or feedback_pt_344)
  begin
      rasp_bubba =  black_intuit & !feedback_pt_344;
  end

reg feedback_pt_345;

always @(vcc or feedback_pt_345)
  begin
      dork_dingbat =  vcc ^  feedback_pt_345;
  end

reg feedback_pt_346;

always @(boots_cuckoo or feedback_pt_346)
  begin
      drugie_pilot =  boots_cuckoo ^ !feedback_pt_346;
  end

reg feedback_pt_347;

always @(wizard_norris or feedback_pt_347)
  begin
      tsmc_safada = !wizard_norris ^  feedback_pt_347;
  end

reg feedback_pt_348;

always @(hp_eeevil or feedback_pt_348)
  begin
      ford_comtrex = !hp_eeevil |  feedback_pt_348;
  end

reg feedback_pt_349;

always @(copper_beef or feedback_pt_349)
  begin
      snort_jinyong =  copper_beef &  feedback_pt_349;
  end

reg feedback_pt_350;

always @(gerard_kungfu or feedback_pt_350)
  begin
      bert_south =  gerard_kungfu & !feedback_pt_350;
  end

reg feedback_pt_351;

always @(money_donut or feedback_pt_351)
  begin
      art_norbert = !money_donut & !feedback_pt_351;
  end

reg feedback_pt_352;

always @(mine_ostrich or feedback_pt_352)
  begin
      legos_tofu =  mine_ostrich |  feedback_pt_352;
  end

reg feedback_pt_353;

always @(covad_ocha or feedback_pt_353)
  begin
      ladder_pyro =  covad_ocha ^  feedback_pt_353;
  end

reg feedback_pt_354;

always @(vcc or feedback_pt_354)
  begin
      hotdog_sgates =  vcc & !feedback_pt_354;
  end

reg feedback_pt_355;

always @(gnd or feedback_pt_355)
  begin
      life_lao =  gnd |  feedback_pt_355;
  end

reg feedback_pt_356;

always @(shark_palm or feedback_pt_356)
  begin
      palm_haze = !shark_palm ^ !feedback_pt_356;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boitano_brian <= 0;
    else if (blue_carolina)
      boitano_brian <= cain_intel;
  end

always @(boitano_brian)
  begin
      feedback_pt_280 = boitano_brian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hippo_mozart <= 1;
    else
      hippo_mozart <= zed_orange;
  end

always @(hippo_mozart)
  begin
      feedback_pt_281 = hippo_mozart;
  end

always @(hippo_mozart)
  begin
      feedback_pt_282 = hippo_mozart;
  end

always @(hippo_mozart)
  begin
      feedback_pt_283 = hippo_mozart;
  end

always @(hippo_mozart)
  begin
      feedback_pt_284 = hippo_mozart;
  end

always @(hippo_mozart)
  begin
      feedback_pt_285 = hippo_mozart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nest_crank <= 1;
    else
      nest_crank <= schwinger;
  end

always @(nest_crank)
  begin
      feedback_pt_286 = nest_crank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roid_odin <= 1;
    else
      roid_odin <= dork_rouge;
  end

always @(roid_odin)
  begin
      feedback_pt_287 = roid_odin;
  end

always @(roid_odin)
  begin
      feedback_pt_288 = roid_odin;
  end

always @(roid_odin)
  begin
      feedback_pt_289 = roid_odin;
  end

always @(roid_odin)
  begin
      feedback_pt_290 = roid_odin;
  end

always @(roid_odin)
  begin
      feedback_pt_291 = roid_odin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_tango <= 1;
    else
      due_tango <= achilles_lala;
  end

always @(due_tango)
  begin
      feedback_pt_292 = due_tango;
  end

always @(due_tango)
  begin
      feedback_pt_293 = due_tango;
  end

always @(due_tango)
  begin
      feedback_pt_294 = due_tango;
  end

always @(due_tango)
  begin
      feedback_pt_295 = due_tango;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goofy_bach <= 0;
    else if (gnd)
      goofy_bach <= boitano_brian;
  end

always @(goofy_bach)
  begin
      feedback_pt_296 = goofy_bach;
  end

always @(goofy_bach)
  begin
      feedback_pt_297 = goofy_bach;
  end

always @(goofy_bach)
  begin
      feedback_pt_298 = goofy_bach;
  end

wire fufu_minnow_wire;

dffeas fufu_minnow_ff (
  .clk(clock1),
  .d(roid_odin),
  .ena(vcc),
  .sclr(beef),
  .sload(siamese),
  .asdata(lala),
  .clrn(!reset1),
  .q(fufu_minnow_wire)
);

always @(fufu_minnow_wire) begin
   trevor_wanton = fufu_minnow_wire;
end

always @(trevor_wanton)
  begin
      feedback_pt_299 = trevor_wanton;
  end

always @(trevor_wanton)
  begin
      feedback_pt_300 = trevor_wanton;
  end

always @(trevor_wanton)
  begin
      feedback_pt_301 = trevor_wanton;
  end

wire freaky_marco_wire;

dffea freaky_marco_ff (
  .clk(clock1),
  .d(drevil_spirit),
  .ena(trevor),
  .adata(vcc),
  .clrn(!reset1),
  .q(freaky_marco_wire)
);

always @(freaky_marco_wire) begin
   lagoon_broom = freaky_marco_wire;
end

always @(lagoon_broom)
  begin
      feedback_pt_302 = lagoon_broom;
  end

always @(lagoon_broom)
  begin
      feedback_pt_303 = lagoon_broom;
  end

always @(lagoon_broom)
  begin
      feedback_pt_304 = lagoon_broom;
  end

always @(lagoon_broom)
  begin
      feedback_pt_305 = lagoon_broom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tinker_sheep <= 0;
    else if (daughter_sake)
      tinker_sheep <= Iwin_odin;
    else if (bellatrix)
      tinker_sheep <= 0;
  end

always @(tinker_sheep)
  begin
      feedback_pt_306 = tinker_sheep;
  end

always @(tinker_sheep)
  begin
      feedback_pt_307 = tinker_sheep;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lizard_kanji <= 0;
    else
      lizard_kanji <= yankee_hoser;
  end

always @(lizard_kanji)
  begin
      feedback_pt_308 = lizard_kanji;
  end

always @(lizard_kanji)
  begin
      feedback_pt_309 = lizard_kanji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foxtrot_sears <= 0;
    else
      foxtrot_sears <= hans_ritsu;
  end

always @(foxtrot_sears)
  begin
      feedback_pt_310 = foxtrot_sears;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sheep_bart <= 1;
    else
      sheep_bart <= boing_illegal;
  end

always @(sheep_bart)
  begin
      feedback_pt_311 = sheep_bart;
  end

always @(sheep_bart)
  begin
      feedback_pt_312 = sheep_bart;
  end

wire air_monkey_wire;

dffeas air_monkey_ff (
  .clk(clock1),
  .d(vcc),
  .ena(curly_baron),
  .sclr(bert_south),
  .sload(what_husks),
  .asdata(fortuyn_heidi),
  .clrn(!reset1),
  .q(air_monkey_wire)
);

always @(air_monkey_wire) begin
   chief_peta = air_monkey_wire;
end

always @(chief_peta)
  begin
      feedback_pt_313 = chief_peta;
  end

always @(chief_peta)
  begin
      feedback_pt_314 = chief_peta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_powder <= 0;
    else if (vegas_peace)
      west_powder <= boing_illegal;
    else if (tiger_drugs)
      west_powder <= 0;
  end

always @(west_powder)
  begin
      feedback_pt_315 = west_powder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jacob_malfoy <= 0;
    else if (hiway_jesus)
      jacob_malfoy <= beef_shuda;
  end

always @(jacob_malfoy)
  begin
      feedback_pt_316 = jacob_malfoy;
  end

always @(jacob_malfoy)
  begin
      feedback_pt_317 = jacob_malfoy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dimetap_bagel <= 0;
    else if (nasdaq_iron)
      dimetap_bagel <= valve_loud;
  end

always @(dimetap_bagel)
  begin
      feedback_pt_318 = dimetap_bagel;
  end

always @(dimetap_bagel)
  begin
      feedback_pt_319 = dimetap_bagel;
  end

always @(dimetap_bagel)
  begin
      feedback_pt_320 = dimetap_bagel;
  end

always @(dimetap_bagel)
  begin
      feedback_pt_321 = dimetap_bagel;
  end

always @(dimetap_bagel)
  begin
      feedback_pt_322 = dimetap_bagel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_po <= 0;
    else
      neville_po <= metal_dog;
  end

always @(neville_po)
  begin
      feedback_pt_323 = neville_po;
  end

always @(neville_po)
  begin
      feedback_pt_324 = neville_po;
  end

always @(neville_po)
  begin
      feedback_pt_325 = neville_po;
  end

always @(neville_po)
  begin
      feedback_pt_326 = neville_po;
  end

always @(neville_po)
  begin
      feedback_pt_327 = neville_po;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      trevor_thread <= 0;
    else
      trevor_thread <= gnd;
  end

always @(trevor_thread)
  begin
      feedback_pt_328 = trevor_thread;
  end

always @(trevor_thread)
  begin
      feedback_pt_329 = trevor_thread;
  end

always @(trevor_thread)
  begin
      feedback_pt_330 = trevor_thread;
  end

always @(trevor_thread)
  begin
      feedback_pt_331 = trevor_thread;
  end

always @(trevor_thread)
  begin
      feedback_pt_332 = trevor_thread;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zen_tako <= 0;
    else if (gnd)
      zen_tako <= castaway;
    else if (minnow_marco)
      zen_tako <= 0;
  end

always @(zen_tako)
  begin
      feedback_pt_333 = zen_tako;
  end

always @(zen_tako)
  begin
      feedback_pt_334 = zen_tako;
  end

always @(zen_tako)
  begin
      feedback_pt_335 = zen_tako;
  end

always @(zen_tako)
  begin
      feedback_pt_336 = zen_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curie_macys <= 0;
    else if (nobody_zeus)
      curie_macys <= 0;
    else if (tesla_scrooge)
      curie_macys <= avon_liberace;
  end

always @(curie_macys)
  begin
      feedback_pt_337 = curie_macys;
  end

wire exodus_lima_wire;

dffea exodus_lima_ff (
  .clk(clock1),
  .d(loser_curious),
  .ena(pimpernel_moe),
  .adata(gnd),
  .clrn(!reset1),
  .q(exodus_lima_wire)
);

always @(exodus_lima_wire) begin
   nasdaq_ebay = exodus_lima_wire;
end

always @(nasdaq_ebay)
  begin
      feedback_pt_338 = nasdaq_ebay;
  end

always @(nasdaq_ebay)
  begin
      feedback_pt_339 = nasdaq_ebay;
  end

always @(nasdaq_ebay)
  begin
      feedback_pt_340 = nasdaq_ebay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zulu_baron <= 0;
    else if (vcc)
      zulu_baron <= zen_tako;
  end

always @(zulu_baron)
  begin
      feedback_pt_341 = zulu_baron;
  end

wire fury_beast_wire;

dffeas fury_beast_ff (
  .clk(clock1),
  .d(robust),
  .ena(gnd),
  .sclr(legos_tofu),
  .sload(vcc),
  .asdata(tesla_scrooge),
  .clrn(!reset1),
  .q(fury_beast_wire)
);

always @(fury_beast_wire) begin
   peaves_squad = fury_beast_wire;
end

always @(peaves_squad)
  begin
      feedback_pt_342 = peaves_squad;
  end

always @(peaves_squad)
  begin
      feedback_pt_343 = peaves_squad;
  end

always @(peaves_squad)
  begin
      feedback_pt_344 = peaves_squad;
  end

always @(peaves_squad)
  begin
      feedback_pt_345 = peaves_squad;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fury_grams <= 0;
    else if (wildboar_mao)
      fury_grams <= yankees_heidi;
    else if (edible_amex)
      fury_grams <= 0;
  end

always @(fury_grams)
  begin
      feedback_pt_346 = fury_grams;
  end

always @(fury_grams)
  begin
      feedback_pt_347 = fury_grams;
  end

always @(fury_grams)
  begin
      feedback_pt_348 = fury_grams;
  end

always @(fury_grams)
  begin
      feedback_pt_349 = fury_grams;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_golf <= 0;
    else if (psucensorc)
      lotus_golf <= yoda_kangaroo;
  end

always @(lotus_golf)
  begin
      feedback_pt_350 = lotus_golf;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rocks_ohisee <= 0;
    else if (jonas_falafel)
      rocks_ohisee <= moody_opus;
    else if (sand_baron)
      rocks_ohisee <= 0;
  end

always @(rocks_ohisee)
  begin
      feedback_pt_351 = rocks_ohisee;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jonas_monster <= 0;
    else
      jonas_monster <= water_foryou;
  end

always @(jonas_monster)
  begin
      feedback_pt_352 = jonas_monster;
  end

wire ginger_tsmc_wire;

dffeas ginger_tsmc_ff (
  .clk(clock1),
  .d(zen_tako),
  .ena(sheep_bart),
  .sclr(jonas_monster),
  .sload(pig_fear),
  .asdata(grumby),
  .clrn(!reset1),
  .q(ginger_tsmc_wire)
);

always @(ginger_tsmc_wire) begin
   hotel_macys = ginger_tsmc_wire;
end

always @(hotel_macys)
  begin
      feedback_pt_353 = hotel_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roe_abraham <= 0;
    else if (dimetap_bagel)
      roe_abraham <= 0;
    else if (doc_bathroom)
      roe_abraham <= onion;
  end

always @(roe_abraham)
  begin
      feedback_pt_354 = roe_abraham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tinker_george <= 0;
    else if (boots_cuckoo)
      tinker_george <= 0;
    else if (crookshanks)
      tinker_george <= oscar_too_big;
  end

always @(tinker_george)
  begin
      feedback_pt_355 = tinker_george;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pig_budlite <= 0;
    else if (holland_haze)
      pig_budlite <= 0;
    else if (goofy_bach)
      pig_budlite <= stix;
  end

always @(pig_budlite)
  begin
      feedback_pt_356 = pig_budlite;
  end

wire monkey_whale_wire;

dffeas monkey_whale_ff (
  .clk(clock1),
  .d(beauty_coffee),
  .ena(hotdog_sgates),
  .sclr(shark_palm),
  .sload(army),
  .asdata(eunice_eunice),
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
    else if (hanger_lizard)
      chillis_peace <= 0;
    else if (vcc)
      chillis_peace <= maki_hp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lima_hummer <= 1;
    else
      lima_hummer <= china_ham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bolt_foliage <= 0;
    else if (starwars_gyro)
      bolt_foliage <= 0;
    else if (gopher_minnow)
      bolt_foliage <= falafel_sun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      severus_valve <= 0;
    else
      severus_valve <= vcc;
  end

wire dweebie_bep_wire;

dffea dweebie_bep_ff (
  .clk(clock1),
  .d(clay_yohimbe),
  .ena(kang_minnie),
  .adata(curly_baron),
  .clrn(!reset1),
  .q(dweebie_bep_wire)
);

always @(dweebie_bep_wire) begin
   llama_palm = dweebie_bep_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      might_what <= 0;
    else if (rocks_ohisee)
      might_what <= vcc;
  end

wire kilo_knot_wire;

dffeas kilo_knot_ff (
  .clk(clock1),
  .d(vcc),
  .ena(chuck_golf),
  .sclr(vcc),
  .sload(marco_thread),
  .asdata(jiminy_fear),
  .clrn(!reset1),
  .q(kilo_knot_wire)
);

always @(kilo_knot_wire) begin
   emu_xiaoping = kilo_knot_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pastrami_bull <= 0;
    else if (cybex_saturn)
      pastrami_bull <= art_norbert;
    else if (nasdaq_ebay)
      pastrami_bull <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_dimetap <= 0;
    else if (howell)
      tiger_dimetap <= trevor_wanton;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_century <= 1;
    else
      water_century <= sirius;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ernie_woman <= 0;
    else
      ernie_woman <= floo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      woman_tiger <= 1;
    else
      woman_tiger <= todd_malfoy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      baron_foliage <= 1;
    else
      baron_foliage <= moreand_willy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bust_zen <= 0;
    else if (stix)
      bust_zen <= tiger_dimetap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_enoch <= 0;
    else if (curious_moron)
      hinge_enoch <= tango_loud;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      homer_goofy <= 0;
    else if (vcc)
      homer_goofy <= legos_tofu;
  end

wire theseus_maki_wire;

dffea theseus_maki_ff (
  .clk(clock1),
  .d(hotdog_sgates),
  .ena(salsa_hulk),
  .adata(vcc),
  .clrn(!reset1),
  .q(theseus_maki_wire)
);

always @(theseus_maki_wire) begin
   maklak_waffle = theseus_maki_wire;
end

wire egg_starwars_wire;

dffeas egg_starwars_ff (
  .clk(clock1),
  .d(master_bamboo),
  .ena(genji_stirfry),
  .sclr(sake_ocha),
  .sload(lao),
  .asdata(vcc),
  .clrn(!reset1),
  .q(egg_starwars_wire)
);

always @(egg_starwars_wire) begin
   drevil_sinus = egg_starwars_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      north_fortuyn <= 0;
    else
      north_fortuyn <= lao_beef;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ariel_wujing <= 0;
    else if (neville_beef)
      ariel_wujing <= 0;
    else if (thor_cucumber)
      ariel_wujing <= yoda_kangaroo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boitano_bagel <= 0;
    else if (draco_october)
      boitano_bagel <= donkey_genji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ladder_lizard <= 0;
    else
      ladder_lizard <= llama_palm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deuce_bismuth <= 0;
    else if (venus_elian)
      deuce_bismuth <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_skinner <= 0;
    else if (snort_jinyong)
      emu_skinner <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blessyou_haze <= 0;
    else if (gnd)
      blessyou_haze <= skinner_ohno;
    else if (black_kebab)
      blessyou_haze <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_neville <= 0;
    else
      knot_neville <= dig_shark;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_spanish <= 1;
    else
      pepsi_spanish <= beauty_coffee;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bolt_trevor <= 0;
    else if (rojas_norbert)
      bolt_trevor <= holland_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kungfu_surfer <= 0;
    else if (hotel_macys)
      kungfu_surfer <= 0;
    else if (gnd)
      kungfu_surfer <= banshee_think;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_green <= 1;
    else
      pizza_green <= yankee_hoser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gulp_mushroom <= 0;
    else if (vcc)
      gulp_mushroom <= hans;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ihilani_bert <= 0;
    else if (joker_gotone)
      ihilani_bert <= 0;
    else if (vcc)
      ihilani_bert <= jalapeno;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tattoo_east <= 0;
    else if (vcc)
      tattoo_east <= rewire_bubba;
    else if (vcc)
      tattoo_east <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ghost_zinc <= 1;
    else
      ghost_zinc <= sanity_tarzan;
  end

wire rat_xterm_wire;

dffeas rat_xterm_ff (
  .clk(clock1),
  .d(minnow_marco),
  .ena(concorde_bart),
  .sclr(floo_xray),
  .sload(west_eatem),
  .asdata(vcc),
  .clrn(!reset1),
  .q(rat_xterm_wire)
);

always @(rat_xterm_wire) begin
   master_bart = rat_xterm_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gonzo_eunice <= 0;
    else if (rarest_emails)
      gonzo_eunice <= sanity_tarzan;
    else if (todd_malfoy)
      gonzo_eunice <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_onthepc <= 1;
    else
      often_onthepc <= boing_illegal;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      floo_saturn <= 0;
    else
      floo_saturn <= ernie_woman;
  end

// 7 bit SOP selector
always @(
        zulu_baron or gnd  or 
        parrot_eeevil or rocks_ohisee  or 
        rarest_emails or att_launcher  or 
        cybex_saturn or zen_tako  or 
        gnd or gnd  or 
        gnd or sun_wannabe  or 
        obiwan_quail or vcc 
)

begin
    greenbay_sake = 
      zulu_baron & gnd |
      parrot_eeevil & rocks_ohisee |
      rarest_emails & att_launcher |
      cybex_saturn & zen_tako |
      gnd & gnd |
      gnd & sun_wannabe |
      obiwan_quail & vcc;
end

// XNOR all of these bits together
always @(might_what or vcc)
  begin
      llama_bismuth = ~^ {might_what,vcc};
  end

// 6 bit priority MUX
always @(
        money_fortuyn or balloon  or 
        gnd or vegas_peace  or 
        spirit_shuda or vcc  or 
        zulu_eel or priest_echo  or 
        copper_beef or tasty_ebi  or 
        life_lao or gnd 
)

  begin
    if (money_fortuyn) baron_clay = balloon;
    else if (gnd) baron_clay = vegas_peace;
    else if (spirit_shuda) baron_clay = vcc;
    else if (zulu_eel) baron_clay = priest_echo;
    else if (copper_beef) baron_clay = tasty_ebi;
    else if (life_lao) baron_clay = gnd;
    else baron_clay = 0;
  end

// XNOR all of these bits together
always @(tabby_guy or tinker_sheep or softball or mine_ostrich or homerun_stix or parrot_eeevil)
  begin
      southern_cow = ~^ {tabby_guy,tinker_sheep,softball,mine_ostrich,homerun_stix,parrot_eeevil};
  end

// Greater Equal Less compare
always @(waffle_midas or xbncensorcens or gnd or vcc or gnd or books_gojira)
  begin
    if ({waffle_midas,xbncensorcens,gnd} > {vcc,gnd,books_gojira})
       {gotone_marvin,marge_tofu,leaky_jinyong} = 3'b100;
    else if ({waffle_midas,xbncensorcens,gnd} < {vcc,gnd,books_gojira})
       {gotone_marvin,marge_tofu,leaky_jinyong} = 3'b010;
    else
       {gotone_marvin,marge_tofu,leaky_jinyong} = 3'b001;
  end

// NOR all of these bits together
always @(vcc or floo or midas_trevor or quail_minnie)
  begin
      vicks_skinner = ~| {vcc,floo,midas_trevor,quail_minnie};
  end

// Random 7 input look up table
always @(vcc or obiwan_quail or lotus or lima_hummer or vcc or tylenol or platinum_haze)
  begin
    casex ({vcc,obiwan_quail,lotus,lima_hummer,vcc,tylenol,platinum_haze})
      0: mexico_sears=1;
      1: mexico_sears=1;
      2: mexico_sears=0;
      3: mexico_sears=1;
      4: mexico_sears=1;
      5: mexico_sears=1;
      6: mexico_sears=1;
      7: mexico_sears=1;
      8: mexico_sears=1;
      9: mexico_sears=0;
      10: mexico_sears=1;
      11: mexico_sears=1;
      12: mexico_sears=0;
      13: mexico_sears=1;
      14: mexico_sears=1;
      15: mexico_sears=1;
      16: mexico_sears=0;
      17: mexico_sears=1;
      18: mexico_sears=0;
      19: mexico_sears=1;
      20: mexico_sears=0;
      21: mexico_sears=1;
      22: mexico_sears=1;
      23: mexico_sears=0;
      24: mexico_sears=0;
      25: mexico_sears=1;
      26: mexico_sears=0;
      27: mexico_sears=0;
      28: mexico_sears=0;
      29: mexico_sears=0;
      30: mexico_sears=0;
      31: mexico_sears=1;
      32: mexico_sears=0;
      33: mexico_sears=1;
      34: mexico_sears=0;
      35: mexico_sears=1;
      36: mexico_sears=1;
      37: mexico_sears=1;
      38: mexico_sears=0;
      39: mexico_sears=0;
      40: mexico_sears=0;
      41: mexico_sears=1;
      42: mexico_sears=0;
      43: mexico_sears=1;
      44: mexico_sears=1;
      45: mexico_sears=1;
      46: mexico_sears=0;
      47: mexico_sears=0;
      48: mexico_sears=0;
      49: mexico_sears=1;
      50: mexico_sears=0;
      51: mexico_sears=0;
      52: mexico_sears=1;
      53: mexico_sears=0;
      54: mexico_sears=1;
      55: mexico_sears=1;
      56: mexico_sears=1;
      57: mexico_sears=1;
      58: mexico_sears=1;
      59: mexico_sears=0;
      60: mexico_sears=1;
      61: mexico_sears=1;
      62: mexico_sears=1;
      63: mexico_sears=1;
      64: mexico_sears=1;
      65: mexico_sears=1;
      66: mexico_sears=0;
      67: mexico_sears=1;
      68: mexico_sears=0;
      69: mexico_sears=0;
      70: mexico_sears=0;
      71: mexico_sears=0;
      72: mexico_sears=0;
      73: mexico_sears=0;
      74: mexico_sears=1;
      75: mexico_sears=1;
      76: mexico_sears=1;
      77: mexico_sears=0;
      78: mexico_sears=0;
      79: mexico_sears=1;
      80: mexico_sears=1;
      81: mexico_sears=0;
      82: mexico_sears=1;
      83: mexico_sears=0;
      84: mexico_sears=0;
      85: mexico_sears=0;
      86: mexico_sears=1;
      87: mexico_sears=1;
      88: mexico_sears=0;
      89: mexico_sears=1;
      90: mexico_sears=1;
      91: mexico_sears=0;
      92: mexico_sears=0;
      93: mexico_sears=0;
      94: mexico_sears=1;
      95: mexico_sears=0;
      96: mexico_sears=0;
      97: mexico_sears=0;
      98: mexico_sears=1;
      99: mexico_sears=0;
      100: mexico_sears=0;
      101: mexico_sears=0;
      102: mexico_sears=1;
      103: mexico_sears=0;
      104: mexico_sears=1;
      105: mexico_sears=1;
      106: mexico_sears=1;
      107: mexico_sears=1;
      108: mexico_sears=1;
      109: mexico_sears=1;
      110: mexico_sears=0;
      111: mexico_sears=1;
      112: mexico_sears=0;
      113: mexico_sears=0;
      114: mexico_sears=1;
      115: mexico_sears=0;
      116: mexico_sears=1;
      117: mexico_sears=1;
      118: mexico_sears=1;
      119: mexico_sears=0;
      120: mexico_sears=0;
      121: mexico_sears=0;
      122: mexico_sears=0;
      123: mexico_sears=1;
      124: mexico_sears=0;
      125: mexico_sears=1;
      126: mexico_sears=0;
      127: mexico_sears=1;
      default: mexico_sears=0;
    endcase
  end

// Random 8 input look up table
always @(att or gnd or mexico_sears or pdaddy_powder or neville_po or surfer_tuna or foxtrot_sears or gnd)
  begin
    casex ({att,gnd,mexico_sears,pdaddy_powder,neville_po,surfer_tuna,foxtrot_sears,gnd})
      0: spyro_nirish=1;
      1: spyro_nirish=1;
      2: spyro_nirish=0;
      3: spyro_nirish=0;
      4: spyro_nirish=0;
      5: spyro_nirish=0;
      6: spyro_nirish=0;
      7: spyro_nirish=0;
      8: spyro_nirish=0;
      9: spyro_nirish=0;
      10: spyro_nirish=0;
      11: spyro_nirish=0;
      12: spyro_nirish=1;
      13: spyro_nirish=0;
      14: spyro_nirish=0;
      15: spyro_nirish=0;
      16: spyro_nirish=1;
      17: spyro_nirish=1;
      18: spyro_nirish=1;
      19: spyro_nirish=1;
      20: spyro_nirish=0;
      21: spyro_nirish=1;
      22: spyro_nirish=0;
      23: spyro_nirish=0;
      24: spyro_nirish=1;
      25: spyro_nirish=0;
      26: spyro_nirish=0;
      27: spyro_nirish=1;
      28: spyro_nirish=1;
      29: spyro_nirish=1;
      30: spyro_nirish=0;
      31: spyro_nirish=1;
      32: spyro_nirish=0;
      33: spyro_nirish=0;
      34: spyro_nirish=1;
      35: spyro_nirish=0;
      36: spyro_nirish=0;
      37: spyro_nirish=0;
      38: spyro_nirish=1;
      39: spyro_nirish=0;
      40: spyro_nirish=0;
      41: spyro_nirish=0;
      42: spyro_nirish=0;
      43: spyro_nirish=0;
      44: spyro_nirish=0;
      45: spyro_nirish=1;
      46: spyro_nirish=0;
      47: spyro_nirish=0;
      48: spyro_nirish=1;
      49: spyro_nirish=0;
      50: spyro_nirish=1;
      51: spyro_nirish=1;
      52: spyro_nirish=1;
      53: spyro_nirish=0;
      54: spyro_nirish=1;
      55: spyro_nirish=0;
      56: spyro_nirish=1;
      57: spyro_nirish=0;
      58: spyro_nirish=0;
      59: spyro_nirish=0;
      60: spyro_nirish=1;
      61: spyro_nirish=0;
      62: spyro_nirish=0;
      63: spyro_nirish=0;
      64: spyro_nirish=0;
      65: spyro_nirish=1;
      66: spyro_nirish=0;
      67: spyro_nirish=1;
      68: spyro_nirish=1;
      69: spyro_nirish=1;
      70: spyro_nirish=1;
      71: spyro_nirish=1;
      72: spyro_nirish=1;
      73: spyro_nirish=1;
      74: spyro_nirish=1;
      75: spyro_nirish=0;
      76: spyro_nirish=0;
      77: spyro_nirish=1;
      78: spyro_nirish=1;
      79: spyro_nirish=1;
      80: spyro_nirish=1;
      81: spyro_nirish=0;
      82: spyro_nirish=0;
      83: spyro_nirish=0;
      84: spyro_nirish=1;
      85: spyro_nirish=0;
      86: spyro_nirish=0;
      87: spyro_nirish=0;
      88: spyro_nirish=1;
      89: spyro_nirish=1;
      90: spyro_nirish=0;
      91: spyro_nirish=0;
      92: spyro_nirish=1;
      93: spyro_nirish=1;
      94: spyro_nirish=1;
      95: spyro_nirish=0;
      96: spyro_nirish=0;
      97: spyro_nirish=1;
      98: spyro_nirish=1;
      99: spyro_nirish=1;
      100: spyro_nirish=0;
      101: spyro_nirish=1;
      102: spyro_nirish=1;
      103: spyro_nirish=0;
      104: spyro_nirish=1;
      105: spyro_nirish=1;
      106: spyro_nirish=0;
      107: spyro_nirish=1;
      108: spyro_nirish=0;
      109: spyro_nirish=1;
      110: spyro_nirish=1;
      111: spyro_nirish=0;
      112: spyro_nirish=1;
      113: spyro_nirish=0;
      114: spyro_nirish=1;
      115: spyro_nirish=1;
      116: spyro_nirish=1;
      117: spyro_nirish=0;
      118: spyro_nirish=0;
      119: spyro_nirish=0;
      120: spyro_nirish=1;
      121: spyro_nirish=1;
      122: spyro_nirish=0;
      123: spyro_nirish=1;
      124: spyro_nirish=1;
      125: spyro_nirish=1;
      126: spyro_nirish=0;
      127: spyro_nirish=1;
      128: spyro_nirish=1;
      129: spyro_nirish=0;
      130: spyro_nirish=0;
      131: spyro_nirish=0;
      132: spyro_nirish=1;
      133: spyro_nirish=1;
      134: spyro_nirish=0;
      135: spyro_nirish=1;
      136: spyro_nirish=1;
      137: spyro_nirish=0;
      138: spyro_nirish=1;
      139: spyro_nirish=1;
      140: spyro_nirish=0;
      141: spyro_nirish=0;
      142: spyro_nirish=1;
      143: spyro_nirish=1;
      144: spyro_nirish=0;
      145: spyro_nirish=1;
      146: spyro_nirish=0;
      147: spyro_nirish=0;
      148: spyro_nirish=0;
      149: spyro_nirish=1;
      150: spyro_nirish=0;
      151: spyro_nirish=1;
      152: spyro_nirish=1;
      153: spyro_nirish=0;
      154: spyro_nirish=1;
      155: spyro_nirish=1;
      156: spyro_nirish=1;
      157: spyro_nirish=1;
      158: spyro_nirish=0;
      159: spyro_nirish=1;
      160: spyro_nirish=1;
      161: spyro_nirish=1;
      162: spyro_nirish=0;
      163: spyro_nirish=1;
      164: spyro_nirish=0;
      165: spyro_nirish=1;
      166: spyro_nirish=1;
      167: spyro_nirish=1;
      168: spyro_nirish=1;
      169: spyro_nirish=0;
      170: spyro_nirish=1;
      171: spyro_nirish=1;
      172: spyro_nirish=0;
      173: spyro_nirish=0;
      174: spyro_nirish=1;
      175: spyro_nirish=0;
      176: spyro_nirish=0;
      177: spyro_nirish=1;
      178: spyro_nirish=0;
      179: spyro_nirish=1;
      180: spyro_nirish=1;
      181: spyro_nirish=0;
      182: spyro_nirish=1;
      183: spyro_nirish=0;
      184: spyro_nirish=1;
      185: spyro_nirish=1;
      186: spyro_nirish=1;
      187: spyro_nirish=0;
      188: spyro_nirish=0;
      189: spyro_nirish=1;
      190: spyro_nirish=0;
      191: spyro_nirish=1;
      192: spyro_nirish=0;
      193: spyro_nirish=1;
      194: spyro_nirish=1;
      195: spyro_nirish=0;
      196: spyro_nirish=1;
      197: spyro_nirish=0;
      198: spyro_nirish=0;
      199: spyro_nirish=1;
      200: spyro_nirish=0;
      201: spyro_nirish=0;
      202: spyro_nirish=1;
      203: spyro_nirish=1;
      204: spyro_nirish=1;
      205: spyro_nirish=0;
      206: spyro_nirish=1;
      207: spyro_nirish=1;
      208: spyro_nirish=0;
      209: spyro_nirish=0;
      210: spyro_nirish=0;
      211: spyro_nirish=1;
      212: spyro_nirish=1;
      213: spyro_nirish=1;
      214: spyro_nirish=0;
      215: spyro_nirish=1;
      216: spyro_nirish=0;
      217: spyro_nirish=1;
      218: spyro_nirish=0;
      219: spyro_nirish=0;
      220: spyro_nirish=0;
      221: spyro_nirish=1;
      222: spyro_nirish=0;
      223: spyro_nirish=1;
      224: spyro_nirish=1;
      225: spyro_nirish=0;
      226: spyro_nirish=0;
      227: spyro_nirish=1;
      228: spyro_nirish=1;
      229: spyro_nirish=1;
      230: spyro_nirish=1;
      231: spyro_nirish=1;
      232: spyro_nirish=0;
      233: spyro_nirish=1;
      234: spyro_nirish=0;
      235: spyro_nirish=0;
      236: spyro_nirish=1;
      237: spyro_nirish=1;
      238: spyro_nirish=1;
      239: spyro_nirish=1;
      240: spyro_nirish=0;
      241: spyro_nirish=1;
      242: spyro_nirish=0;
      243: spyro_nirish=1;
      244: spyro_nirish=0;
      245: spyro_nirish=0;
      246: spyro_nirish=0;
      247: spyro_nirish=0;
      248: spyro_nirish=0;
      249: spyro_nirish=0;
      250: spyro_nirish=1;
      251: spyro_nirish=0;
      252: spyro_nirish=1;
      253: spyro_nirish=0;
      254: spyro_nirish=1;
      255: spyro_nirish=1;
      default: spyro_nirish=0;
    endcase
  end

// XNOR all of these bits together
always @(gnd or otter_hotel or nasdaq_iron)
  begin
      boing_jiminy = ~^ {gnd,otter_hotel,nasdaq_iron};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      skipper_would <= 0;
    else
    case ({lizard_kanji,marge_tofu})
       0 : skipper_would <= skipper_would;
       1 : skipper_would <= vcc;
       2 : skipper_would <= eel_zinc;
       3 : skipper_would <= skipper_would;
       default : skipper_would <= 0;
    endcase
  end

// OR all of these bits together
always @(gnd or nest_crank or jiminy_fear)
  begin
      honda_elf = | {gnd,nest_crank,jiminy_fear};
  end


initial begin
    {lsd_downers,chicken_romex,pdaddy_kappa,kabar_jacques,leidiot_duey,egg_might} = 0;
end

// Registered 6 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (bubba_peta)
      {lsd_downers,chicken_romex,pdaddy_kappa,kabar_jacques,leidiot_duey,egg_might} <= 0;
    else if (water_century)
      {lsd_downers,chicken_romex,pdaddy_kappa,kabar_jacques,leidiot_duey,egg_might} <=
		  {beef,odin_hotdog,theseus,grumby,bust_zen,tinker_george};
    else
      {lsd_downers,chicken_romex,pdaddy_kappa,kabar_jacques,leidiot_duey,egg_might} <=
		 {gnd,gnd,deuce_bismuth,lotus_golf,vcc,boitano_bagel} + 
		 {stoner_zed,gnd,maklak_waffle,tango_would,tattoo_east,escape_fish};
  end


initial begin
    {golden_sleepy,joseph_husks,avon_oranges} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (neon_snape)
      {golden_sleepy,joseph_husks,avon_oranges} <= 0;
    else if (baron_clay)
      {golden_sleepy,joseph_husks,avon_oranges} <=
		  {marge_killme,gnd,tsmc_safada};
    else
      {golden_sleepy,joseph_husks,avon_oranges} <=
		 {gnd,greenbay_sake,due_tango} + 
		 {giraffe_huey,tesla_scrooge,gnd};
  end

// XOR all of these bits together
always @(intuit or fortuyn_heidi or concorde_bart or gnd or vcc or gnd or vcc or bacon_gyro or killer_marker or vcc or ernie_woman or zhuang_drugie)
  begin
      bananarep_rum = ^ {intuit,fortuyn_heidi,concorde_bart,gnd,vcc,gnd,vcc,bacon_gyro,killer_marker,vcc,ernie_woman,zhuang_drugie};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tank_centaur <= 0;
    else
    case ({palm_haze,gulp_mushroom})
       0 : tank_centaur <= tank_centaur;
       1 : tank_centaur <= att;
       2 : tank_centaur <= tank_centaur;
       3 : tank_centaur <= mushroom_dork;
       default : tank_centaur <= 0;
    endcase
  end

// Greater Equal Less compare
always @(pacific_asahi or blessyou_haze or pig_budlite or midas_macys or bfs or vcc or hurt_rose or bananarep_rum or gnd or snake_marco)
  begin
    if ({pacific_asahi,blessyou_haze,pig_budlite,midas_macys,bfs} > {vcc,hurt_rose,bananarep_rum,gnd,snake_marco})
       {wonton_crack,advil_army,broom_eagle} = 3'b100;
    else if ({pacific_asahi,blessyou_haze,pig_budlite,midas_macys,bfs} < {vcc,hurt_rose,bananarep_rum,gnd,snake_marco})
       {wonton_crack,advil_army,broom_eagle} = 3'b010;
    else
       {wonton_crack,advil_army,broom_eagle} = 3'b001;
  end

// NOR all of these bits together
always @(gnd or ariel_wujing)
  begin
      clay_ritsu = ~| {gnd,ariel_wujing};
  end


// building a 8 to 1 MUX operator
reg [7:0] lemon_joseph_mux_dat;
reg [2:0] lemon_joseph_mux_sel;
always @(thor_cucumber or baron_foliage or iterate_sugar or husks_gotone or chicken_romex or joseph_husks or bomb_yohimbe or ihilani_bert)
  begin
    lemon_joseph_mux_dat = {thor_cucumber,baron_foliage,iterate_sugar,husks_gotone,chicken_romex,joseph_husks,bomb_yohimbe,ihilani_bert};
  end

always @(gap_tamago or due_tango or wonton_crack)
  begin
    lemon_joseph_mux_sel = {gap_tamago,due_tango,wonton_crack};
  end

always @(lemon_joseph_mux_dat or lemon_joseph_mux_sel)
  begin
    dimetap_vegan = lemon_joseph_mux_dat[lemon_joseph_mux_sel];
  end

// OR all of these bits together
always @(baron_foliage or jonas_rocks or whacky_husks or nest_crank or hurt_rose or vcc or ford_comtrex)
  begin
      ocean_huhhuh = | {baron_foliage,jonas_rocks,whacky_husks,nest_crank,hurt_rose,vcc,ford_comtrex};
  end

// 4 bit priority MUX
always @(
        emu_xiaoping or reallyloud  or 
        gnd or fish_waffle  or 
        gnd or drugie_pilot  or 
        knot_neville or gnd 
)

  begin
    if (emu_xiaoping) cybex_romex = reallyloud;
    else if (gnd) cybex_romex = fish_waffle;
    else if (gnd) cybex_romex = drugie_pilot;
    else if (knot_neville) cybex_romex = gnd;
    else cybex_romex = 0;
  end

// NOR all of these bits together
always @(thor_cucumber or boing_jiminy or skipper_happy or norbert or lupin)
  begin
      english_pyro = ~| {thor_cucumber,boing_jiminy,skipper_happy,norbert,lupin};
  end

// 6 bit priority MUX
always @(
        vcc or curly_baron  or 
        obiwan_rabbi or viagra_filch  or 
        joseph_husks or wizard_norris  or 
        gnd or floo  or 
        feynman or vcc  or 
        english_pyro or pizza_green 
)

  begin
    if (vcc) lamer_webvan = curly_baron;
    else if (obiwan_rabbi) lamer_webvan = viagra_filch;
    else if (joseph_husks) lamer_webvan = wizard_norris;
    else if (gnd) lamer_webvan = floo;
    else if (feynman) lamer_webvan = vcc;
    else if (english_pyro) lamer_webvan = pizza_green;
    else lamer_webvan = 0;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      papa_dadada <= 0;
    else
    case ({chillis_peace,lupin})
       0 : papa_dadada <= papa_dadada;
       1 : papa_dadada <= bfs;
       2 : papa_dadada <= papa_dadada;
       3 : papa_dadada <= papa_dadada;
       default : papa_dadada <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marker_bep <= 0;
    else
    case ({beast,dork_dingbat})
       0 : marker_bep <= marker_bep;
       1 : marker_bep <= ghost_asahi;
       2 : marker_bep <= leaky_jinyong;
       3 : marker_bep <= intuit_voodoo;
       default : marker_bep <= 0;
    endcase
  end


initial begin
    {sgates_think,ceres_elian,tamago_opus,mine_nasdaq,roid_crayons,chief_timmy} = 0;
end

// Registered 6 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (ghost_asahi)
      {sgates_think,ceres_elian,tamago_opus,mine_nasdaq,roid_crayons,chief_timmy} <= 0;
    else if (maklak_waffle)
      {sgates_think,ceres_elian,tamago_opus,mine_nasdaq,roid_crayons,chief_timmy} <=
		  {yankee_hoser,vcc,clay_ritsu,gnd,fury_grams,vcc};
    else
      {sgates_think,ceres_elian,tamago_opus,mine_nasdaq,roid_crayons,chief_timmy} <=
		 {vcc,gnd,maklak_waffle,gotone_marvin,maklak_waffle,tabby_moses} + 
		 {pizza_popacap,aspirin_ritsu,blackbeans,iguana_buddha,crookshanks,curie_macys};
  end

// XNOR all of these bits together
always @(chairman_bfs or tank_centaur or achilles_lala or beast or honda_pdaddy or vcc)
  begin
      atoms_art = ~^ {chairman_bfs,tank_centaur,achilles_lala,beast,honda_pdaddy,vcc};
  end

// 7 bit priority MUX
always @(
        vcc or dragon_malfoy  or 
        art_zed or gnd  or 
        egg_might or mario_owes  or 
        vcc or bravo_haze  or 
        egg_might or cybex_romex  or 
        gnd or gnd  or 
        pdiddy_dirty or howell 
)

  begin
    if (vcc) lucius_drax = dragon_malfoy;
    else if (art_zed) lucius_drax = gnd;
    else if (egg_might) lucius_drax = mario_owes;
    else if (vcc) lucius_drax = bravo_haze;
    else if (egg_might) lucius_drax = cybex_romex;
    else if (gnd) lucius_drax = gnd;
    else if (pdiddy_dirty) lucius_drax = howell;
    else lucius_drax = 0;
  end


// building a 16 to 1 MUX operator
reg [15:0] moderate_eel_mux_dat;
reg [3:0] moderate_eel_mux_sel;
always @(foxtrot_sears or vcc or tango_loud or jiminy_fear or gnd or east_zealot or lamer_webvan or llama_palm or vcc or ajax_psycho or nyc_foliage or ladder_barnum or zinc_bust or lotus_golf or vcc or potter_thor)
  begin
    moderate_eel_mux_dat = {foxtrot_sears,vcc,tango_loud,jiminy_fear,gnd,east_zealot,lamer_webvan,llama_palm,vcc,ajax_psycho,nyc_foliage,ladder_barnum,zinc_bust,lotus_golf,vcc,potter_thor};
  end

always @(parrot_eeevil or foliage or hippo_mozart or mine_nasdaq)
  begin
    moderate_eel_mux_sel = {parrot_eeevil,foliage,hippo_mozart,mine_nasdaq};
  end

always @(moderate_eel_mux_dat or moderate_eel_mux_sel)
  begin
    kappa_rufus = moderate_eel_mux_dat[moderate_eel_mux_sel];
  end

// OR all of these bits together
always @(holland_haze or gnd or gnd or falafel_sun or chuck_golf or quail_minnie or kappa_rufus)
  begin
      safeway_nest = | {holland_haze,gnd,gnd,falafel_sun,chuck_golf,quail_minnie,kappa_rufus};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      biker_bono <= 0;
    else
    case ({fish_waffle,ghost_asahi})
       0 : biker_bono <= vcc;
       1 : biker_bono <= biker_bono;
       2 : biker_bono <= biker_bono;
       3 : biker_bono <= biker_bono;
       default : biker_bono <= 0;
    endcase
  end

// AND all of these bits together
always @(vcc or bolt_foliage or elguapo_marco or vcc or chillis_peace or killer_marker or ocean_huhhuh or gnd or chief_peta)
  begin
      kilo_rojas = & {vcc,bolt_foliage,elguapo_marco,vcc,chillis_peace,killer_marker,ocean_huhhuh,gnd,chief_peta};
  end

// Random 5 input look up table
always @(chief_peta or barnum_fufu or woman_tiger or mao or zedong)
  begin
    casex ({chief_peta,barnum_fufu,woman_tiger,mao,zedong})
      0: green_gm=1;
      1: green_gm=1;
      2: green_gm=0;
      3: green_gm=1;
      4: green_gm=1;
      5: green_gm=1;
      6: green_gm=0;
      7: green_gm=1;
      8: green_gm=0;
      9: green_gm=1;
      10: green_gm=0;
      11: green_gm=1;
      12: green_gm=0;
      13: green_gm=0;
      14: green_gm=0;
      15: green_gm=1;
      16: green_gm=0;
      17: green_gm=0;
      18: green_gm=1;
      19: green_gm=0;
      20: green_gm=1;
      21: green_gm=1;
      22: green_gm=1;
      23: green_gm=1;
      24: green_gm=1;
      25: green_gm=0;
      26: green_gm=0;
      27: green_gm=1;
      28: green_gm=1;
      29: green_gm=1;
      30: green_gm=1;
      31: green_gm=0;
      default: green_gm=0;
    endcase
  end

// OR all of these bits together
always @(rarest_emails or dopey_sinew or waffle_midas or theseus or vcc)
  begin
      often_master = | {rarest_emails,dopey_sinew,waffle_midas,theseus,vcc};
  end

// 4 bit SOP selector
always @(
        gregg_a_lovey or peaves_squad  or 
        gregg_a_lovey or vcc  or 
        zhuang_drugie or often_master  or 
        hinge_enoch or kappa_zed 
)

begin
    floating_guy = 
      gregg_a_lovey & peaves_squad |
      gregg_a_lovey & vcc |
      zhuang_drugie & often_master |
      hinge_enoch & kappa_zed;
end

// XOR all of these bits together
always @(sgates_thedon or sake_ocha or chief_peta or tamago_opus)
  begin
      hawaii_danger = ^ {sgates_thedon,sake_ocha,chief_peta,tamago_opus};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_atchoo <= 0;
    else
    case ({money_fortuyn,po_killme})
       0 : life_atchoo <= life_atchoo;
       1 : life_atchoo <= crack_lamer;
       2 : life_atchoo <= potato_rod;
       3 : life_atchoo <= life_atchoo;
       default : life_atchoo <= 0;
    endcase
  end

// 4 bit SOP selector
always @(
        ladder_lizard or holland_haze  or 
        vcc or tamago_opus  or 
        green_gm or leaky_jinyong  or 
        babette_crank or husks_gotone 
)

begin
    noah_mexican = 
      ladder_lizard & holland_haze |
      vcc & tamago_opus |
      green_gm & leaky_jinyong |
      babette_crank & husks_gotone;
end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      daughter_lisa <= 0;
    else
    case ({vcc,avon_oranges})
       0 : daughter_lisa <= bush_wiggles;
       1 : daughter_lisa <= sgates_think;
       2 : daughter_lisa <= daughter_lisa;
       3 : daughter_lisa <= daughter_lisa;
       default : daughter_lisa <= 0;
    endcase
  end


initial begin
    {bfs_star,oscar_nyquil,tako_fortuyn,atoms_filch,zed_weevil,rescue_sun,haze_smithers} = 0;
end

// Registered 7 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (spirit_shuda)
      {bfs_star,oscar_nyquil,tako_fortuyn,atoms_filch,zed_weevil,rescue_sun,haze_smithers} <= 0;
    else if (cybex_romex)
      {bfs_star,oscar_nyquil,tako_fortuyn,atoms_filch,zed_weevil,rescue_sun,haze_smithers} <=
		  {chief_peta,vcc,floating_guy,kanji_clay,leidiot_duey,snake_marco,vcc};
    else
      {bfs_star,oscar_nyquil,tako_fortuyn,atoms_filch,zed_weevil,rescue_sun,haze_smithers} <=
		 {woman_tiger,gnd,ceres_elian,gnd,vcc,lsd_downers,odin_hotdog} + 
		 {pig_budlite,bono_homer,vcc,soccer_speed,vcc,leaky_jinyong,gregg_a_lovey};
  end


initial begin
    {burner_mrbill,squad_wukong,malfoy_nyc} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (dopey_sinew)
      {burner_mrbill,squad_wukong,malfoy_nyc} <= 0;
    else if (vcc)
      {burner_mrbill,squad_wukong,malfoy_nyc} <=
		  {sheep_bart,dork_love_in,hans};
    else
      {burner_mrbill,squad_wukong,malfoy_nyc} <=
		 {vcc,boots_cuckoo,ladder_barnum} + 
		 {bert_south,broom_eagle,gnd};
  end

// XNOR all of these bits together
always @(vcc or powder or donkey_genji or rufus_advil or baron_foliage or llama_palm or gnd or theseus or floating_guy or what_intel or quebec_lovey or ladder_barnum)
  begin
      dork_porfavor = ~^ {vcc,powder,donkey_genji,rufus_advil,baron_foliage,llama_palm,gnd,theseus,floating_guy,what_intel,quebec_lovey,ladder_barnum};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_downers <= 0;
    else
    case ({papa_dadada,llama_bismuth})
       0 : often_downers <= honda_elf;
       1 : often_downers <= often_downers;
       2 : often_downers <= often_downers;
       3 : often_downers <= money_fortuyn;
       default : often_downers <= 0;
    endcase
  end

// Random 7 input look up table
always @(golden_sleepy or vegas_peace or spyro_nirish or vcc or vcc or gnd or jonas_falafel)
  begin
    casex ({golden_sleepy,vegas_peace,spyro_nirish,vcc,vcc,gnd,jonas_falafel})
      0: sake_billnted=1;
      1: sake_billnted=1;
      2: sake_billnted=0;
      3: sake_billnted=1;
      4: sake_billnted=0;
      5: sake_billnted=1;
      6: sake_billnted=1;
      7: sake_billnted=0;
      8: sake_billnted=0;
      9: sake_billnted=1;
      10: sake_billnted=1;
      11: sake_billnted=1;
      12: sake_billnted=0;
      13: sake_billnted=0;
      14: sake_billnted=0;
      15: sake_billnted=0;
      16: sake_billnted=0;
      17: sake_billnted=1;
      18: sake_billnted=0;
      19: sake_billnted=1;
      20: sake_billnted=0;
      21: sake_billnted=1;
      22: sake_billnted=1;
      23: sake_billnted=0;
      24: sake_billnted=1;
      25: sake_billnted=0;
      26: sake_billnted=1;
      27: sake_billnted=1;
      28: sake_billnted=1;
      29: sake_billnted=0;
      30: sake_billnted=0;
      31: sake_billnted=0;
      32: sake_billnted=1;
      33: sake_billnted=0;
      34: sake_billnted=1;
      35: sake_billnted=1;
      36: sake_billnted=0;
      37: sake_billnted=1;
      38: sake_billnted=0;
      39: sake_billnted=0;
      40: sake_billnted=0;
      41: sake_billnted=1;
      42: sake_billnted=1;
      43: sake_billnted=1;
      44: sake_billnted=1;
      45: sake_billnted=1;
      46: sake_billnted=0;
      47: sake_billnted=0;
      48: sake_billnted=0;
      49: sake_billnted=0;
      50: sake_billnted=0;
      51: sake_billnted=0;
      52: sake_billnted=1;
      53: sake_billnted=0;
      54: sake_billnted=0;
      55: sake_billnted=1;
      56: sake_billnted=1;
      57: sake_billnted=1;
      58: sake_billnted=0;
      59: sake_billnted=1;
      60: sake_billnted=0;
      61: sake_billnted=0;
      62: sake_billnted=1;
      63: sake_billnted=0;
      64: sake_billnted=0;
      65: sake_billnted=1;
      66: sake_billnted=0;
      67: sake_billnted=1;
      68: sake_billnted=1;
      69: sake_billnted=0;
      70: sake_billnted=1;
      71: sake_billnted=1;
      72: sake_billnted=1;
      73: sake_billnted=1;
      74: sake_billnted=1;
      75: sake_billnted=0;
      76: sake_billnted=1;
      77: sake_billnted=1;
      78: sake_billnted=1;
      79: sake_billnted=1;
      80: sake_billnted=1;
      81: sake_billnted=0;
      82: sake_billnted=0;
      83: sake_billnted=0;
      84: sake_billnted=1;
      85: sake_billnted=0;
      86: sake_billnted=1;
      87: sake_billnted=0;
      88: sake_billnted=1;
      89: sake_billnted=0;
      90: sake_billnted=1;
      91: sake_billnted=0;
      92: sake_billnted=1;
      93: sake_billnted=1;
      94: sake_billnted=1;
      95: sake_billnted=1;
      96: sake_billnted=0;
      97: sake_billnted=1;
      98: sake_billnted=1;
      99: sake_billnted=0;
      100: sake_billnted=1;
      101: sake_billnted=0;
      102: sake_billnted=1;
      103: sake_billnted=1;
      104: sake_billnted=1;
      105: sake_billnted=1;
      106: sake_billnted=0;
      107: sake_billnted=0;
      108: sake_billnted=0;
      109: sake_billnted=1;
      110: sake_billnted=1;
      111: sake_billnted=0;
      112: sake_billnted=0;
      113: sake_billnted=1;
      114: sake_billnted=1;
      115: sake_billnted=0;
      116: sake_billnted=0;
      117: sake_billnted=0;
      118: sake_billnted=1;
      119: sake_billnted=1;
      120: sake_billnted=0;
      121: sake_billnted=0;
      122: sake_billnted=1;
      123: sake_billnted=0;
      124: sake_billnted=0;
      125: sake_billnted=1;
      126: sake_billnted=0;
      127: sake_billnted=1;
      default: sake_billnted=0;
    endcase
  end


// building a 128 to 1 MUX operator
reg [127:0] purple_rod_mux_dat;
reg [6:0] purple_rod_mux_sel;
always @(gnd or vcc or nobody_martin or hawaii_danger or oscar_nyquil or vcc or baron_foliage or gnd or palm_haze or gnd or gnd or bananarep_rum or haze_smithers or vcc or floo_xray or atoms_filch or vcc or pdiddy_dirty or zedong_lucius or vcc or sanity_tarzan or art_norbert or burner_mrbill or art_zed or beef_shuda or oscar_nyquil or gnd or gnd or drevil_sinus or often_downers or moody_opus or vcc or rarest_emails or oscar_tobiko or gnd or dow_rubeus or gonzo_eunice or rasp_bubba or vcc or vcc or vcc or martin_bolt or midas_trevor or umbridge or jcrew_cow or lagoon_broom or vcc or dimetap_vegan or dork_porfavor or gnd or baron_foliage or south_norbert or sake_billnted or safeway_nest or vcc or kanji_uppers or tako_fortuyn or kungfu_surfer or bfs_star or rarest_emails or south_nasdaq or skipper_would or life_atchoo or gnd or southern_cow or gnd or floo or kanji_clay or beef or llama_bismuth or gnd or bush_kbtoys or hours_green or tesla_scrooge or vcc or goblin_bear or wanton_flew or bolt_trevor or kanji_uppers or often_onthepc or kanji_clay or gnd or vcc or jonas_falafel or baron_foliage or severus or kungfu_surfer or pastrami_bull or vcc or joseph_husks or biker_bono or gnd or sake_billnted or homer_goofy or brian_zulu or master_bart or nest_crank or kilo_rojas or pig_budlite or lao or chief_timmy or vcc or golden_sleepy or zulu_baron or vegas_peace or vcc or wizard_norris or ladder_pyro or suffering_gm or skipper_happy or burner_mrbill or malfoy_nyc or west_powder or ulysses_nyc or vegas_peace or hinge_enoch or holland_haze or vcc or kungfu_surfer or often_master or achilles_lala or bono_homer or gonzo_eunice or gnd or gnd or ford_comtrex or chief_timmy or elguapo_marco)
  begin
    purple_rod_mux_dat = {gnd,vcc,nobody_martin,hawaii_danger,oscar_nyquil,vcc,baron_foliage,gnd,palm_haze,gnd,gnd,bananarep_rum,haze_smithers,vcc,floo_xray,atoms_filch,vcc,pdiddy_dirty,zedong_lucius,vcc,sanity_tarzan,art_norbert,burner_mrbill,art_zed,beef_shuda,oscar_nyquil,gnd,gnd,drevil_sinus,often_downers,moody_opus,vcc,rarest_emails,oscar_tobiko,gnd,dow_rubeus,gonzo_eunice,rasp_bubba,vcc,vcc,vcc,martin_bolt,midas_trevor,umbridge,jcrew_cow,lagoon_broom,vcc,dimetap_vegan,dork_porfavor,gnd,baron_foliage,south_norbert,sake_billnted,safeway_nest,vcc,kanji_uppers,tako_fortuyn,kungfu_surfer,bfs_star,rarest_emails,south_nasdaq,skipper_would,life_atchoo,gnd,southern_cow,gnd,floo,kanji_clay,beef,llama_bismuth,gnd,bush_kbtoys,hours_green,tesla_scrooge,vcc,goblin_bear,wanton_flew,bolt_trevor,kanji_uppers,often_onthepc,kanji_clay,gnd,vcc,jonas_falafel,baron_foliage,severus,kungfu_surfer,pastrami_bull,vcc,joseph_husks,biker_bono,gnd,sake_billnted,homer_goofy,brian_zulu,master_bart,nest_crank,kilo_rojas,pig_budlite,lao,chief_timmy,vcc,golden_sleepy,zulu_baron,vegas_peace,vcc,wizard_norris,ladder_pyro,suffering_gm,skipper_happy,burner_mrbill,malfoy_nyc,west_powder,ulysses_nyc,vegas_peace,hinge_enoch,holland_haze,vcc,kungfu_surfer,often_master,achilles_lala,bono_homer,gonzo_eunice,gnd,gnd,ford_comtrex,chief_timmy,elguapo_marco};
  end

always @(bison_mexican or vcc or art_zed or mario_owes or vcc or kabar_jacques or gnd)
  begin
    purple_rod_mux_sel = {bison_mexican,vcc,art_zed,mario_owes,vcc,kabar_jacques,gnd};
  end

always @(purple_rod_mux_dat or purple_rod_mux_sel)
  begin
    too_big_dirk = purple_rod_mux_dat[purple_rod_mux_sel];
  end

// NOR all of these bits together
always @(floo_saturn or vcc or xbncensorcens or severus_valve or vcc or drevil_sinus)
  begin
      baron_nihlist = ~| {floo_saturn,vcc,xbncensorcens,severus_valve,vcc,drevil_sinus};
  end

// 7 bit priority MUX
always @(
        eel_zinc or vcc  or 
        vcc or bach_onion  or 
        pepsi_spanish or emu_skinner  or 
        atoms_art or daughter_lisa  or 
        illegal_rod or vcc  or 
        mundungus or chief_peta  or 
        vcc or rarest_emails 
)

  begin
    if (eel_zinc) stroop_mexico = vcc;
    else if (vcc) stroop_mexico = bach_onion;
    else if (pepsi_spanish) stroop_mexico = emu_skinner;
    else if (atoms_art) stroop_mexico = daughter_lisa;
    else if (illegal_rod) stroop_mexico = vcc;
    else if (mundungus) stroop_mexico = chief_peta;
    else if (vcc) stroop_mexico = rarest_emails;
    else stroop_mexico = 0;
  end

// AND all of these bits together
always @(parrot_eeevil or gnd or gnd or might_what or gnd)
  begin
      bust_fear = & {parrot_eeevil,gnd,gnd,might_what,gnd};
  end

// Greater Equal Less compare
always @(drugie_pilot or ladder_pyro or neville_po or tabby_guy or tsmc_safada or vicks_skinner or palm_haze or too_big_dirk or dopey_bomb or xbncensorcens or pdaddy_kappa or ladder_pyro or bach_onion or chief_timmy or midas_trevor or exfoliant)
  begin
    if ({drugie_pilot,ladder_pyro,neville_po,tabby_guy,tsmc_safada,vicks_skinner,palm_haze,too_big_dirk} > {dopey_bomb,xbncensorcens,pdaddy_kappa,ladder_pyro,bach_onion,chief_timmy,midas_trevor,exfoliant})
       {due_firewalk,zedong_nyc,emu_abraham} = 3'b100;
    else if ({drugie_pilot,ladder_pyro,neville_po,tabby_guy,tsmc_safada,vicks_skinner,palm_haze,too_big_dirk} < {dopey_bomb,xbncensorcens,pdaddy_kappa,ladder_pyro,bach_onion,chief_timmy,midas_trevor,exfoliant})
       {due_firewalk,zedong_nyc,emu_abraham} = 3'b010;
    else
       {due_firewalk,zedong_nyc,emu_abraham} = 3'b001;
  end

reg feedback_pt_357;

always @(marker_bep or feedback_pt_357)
  begin
      timmy_bracket =  marker_bep &  feedback_pt_357;
  end

reg feedback_pt_358;

always @(ariel_wujing or feedback_pt_358)
  begin
      pilot_nasdaq =  ariel_wujing ^  feedback_pt_358;
  end

reg feedback_pt_359;

always @(todd_pictures or feedback_pt_359)
  begin
      sand_badger =  todd_pictures | !feedback_pt_359;
  end

reg feedback_pt_360;

always @(advil_army or feedback_pt_360)
  begin
      muffin_homer = !advil_army ^ !feedback_pt_360;
  end

reg feedback_pt_361;

always @(sanity_tarzan or feedback_pt_361)
  begin
      due_happy =  sanity_tarzan ^ !feedback_pt_361;
  end

reg feedback_pt_362;

always @(holland_haze or feedback_pt_362)
  begin
      skipper_gonzo = !holland_haze ^  feedback_pt_362;
  end

reg feedback_pt_363;

always @(atoms_art or feedback_pt_363)
  begin
      metal_covad =  atoms_art ^ !feedback_pt_363;
  end

reg feedback_pt_364;

always @(floo_xray or feedback_pt_364)
  begin
      klinton_macys =  floo_xray ^  feedback_pt_364;
  end

reg feedback_pt_365;

always @(art_zed or feedback_pt_365)
  begin
      quebec_crank =  art_zed |  feedback_pt_365;
  end

reg feedback_pt_366;

always @(zinc_bust or feedback_pt_366)
  begin
      nest_mcnugget = !zinc_bust ^  feedback_pt_366;
  end

reg feedback_pt_367;

always @(midas_trevor or feedback_pt_367)
  begin
      armand_lovey = !midas_trevor &  feedback_pt_367;
  end

reg feedback_pt_368;

always @(vcc or feedback_pt_368)
  begin
      priest_gopher = !vcc ^ !feedback_pt_368;
  end

reg feedback_pt_369;

always @(priest_gopher or feedback_pt_369)
  begin
      marvin_xterm = !priest_gopher & !feedback_pt_369;
  end

reg feedback_pt_370;

always @(oscar_tobiko or feedback_pt_370)
  begin
      lsd_shuda = !oscar_tobiko |  feedback_pt_370;
  end

reg feedback_pt_371;

always @(suffering_gm or feedback_pt_371)
  begin
      bambi_skipper =  suffering_gm & !feedback_pt_371;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegas_abraham <= 1;
    else
      vegas_abraham <= floo_xray;
  end

always @(vegas_abraham)
  begin
      feedback_pt_357 = vegas_abraham;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kanji_gyro <= 0;
    else if (vcc)
      kanji_gyro <= tabby_guy;
  end

always @(kanji_gyro)
  begin
      feedback_pt_358 = kanji_gyro;
  end

always @(kanji_gyro)
  begin
      feedback_pt_359 = kanji_gyro;
  end

always @(kanji_gyro)
  begin
      feedback_pt_360 = kanji_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beauty_dog <= 0;
    else if (nest_mcnugget)
      beauty_dog <= vcc;
    else if (zed_weevil)
      beauty_dog <= 0;
  end

always @(beauty_dog)
  begin
      feedback_pt_361 = beauty_dog;
  end

always @(beauty_dog)
  begin
      feedback_pt_362 = beauty_dog;
  end

always @(beauty_dog)
  begin
      feedback_pt_363 = beauty_dog;
  end

always @(beauty_dog)
  begin
      feedback_pt_364 = beauty_dog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_romex <= 0;
    else if (vicks_skinner)
      emu_romex <= 0;
    else if (potter_thor)
      emu_romex <= platinum_haze;
  end

always @(emu_romex)
  begin
      feedback_pt_365 = emu_romex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_trevor <= 0;
    else if (sand_badger)
      onion_trevor <= gnd;
    else if (zedong_nyc)
      onion_trevor <= 0;
  end

always @(onion_trevor)
  begin
      feedback_pt_366 = onion_trevor;
  end

wire rubeus_egg_wire;

dffeas rubeus_egg_ff (
  .clk(clock1),
  .d(water_foryou),
  .ena(skipper_gonzo),
  .sclr(fury_grams),
  .sload(zhuang_drugie),
  .asdata(loud_ariel),
  .clrn(!reset1),
  .q(rubeus_egg_wire)
);

always @(rubeus_egg_wire) begin
   avon_giants = rubeus_egg_wire;
end

always @(avon_giants)
  begin
      feedback_pt_367 = avon_giants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fatality_sun <= 0;
    else
      fatality_sun <= tabasco_snape;
  end

always @(fatality_sun)
  begin
      feedback_pt_368 = fatality_sun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rat_what <= 0;
    else
      rat_what <= vcc;
  end

always @(rat_what)
  begin
      feedback_pt_369 = rat_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marquis_husks <= 1;
    else
      marquis_husks <= lucius_drax;
  end

always @(marquis_husks)
  begin
      feedback_pt_370 = marquis_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_bravo <= 0;
    else if (oscar_nyquil)
      neville_bravo <= stroop_mexico;
  end

always @(neville_bravo)
  begin
      feedback_pt_371 = neville_bravo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_ykocens <= 1;
    else
      water_ykocens <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hotdog_priest <= 1;
    else
      hotdog_priest <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      thread_quail <= 0;
    else if (gnd)
      thread_quail <= marquis_husks;
    else if (po_killme)
      thread_quail <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grumby_haze <= 0;
    else if (emu_skinner)
      grumby_haze <= marvin_xterm;
    else if (vcc)
      grumby_haze <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      louie_heidi <= 0;
    else if (barney_cannon)
      louie_heidi <= grumby_haze;
    else if (gnd)
      louie_heidi <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      snort_quebec <= 1;
    else
      snort_quebec <= bach_onion;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spastic_pilot <= 0;
    else
      spastic_pilot <= west_powder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goat_mouse <= 0;
    else if (mundungus)
      goat_mouse <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mike_stirfry <= 0;
    else
      mike_stirfry <= pdaddy_kappa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hagrid_indigo <= 0;
    else if (pilot_nasdaq)
      hagrid_indigo <= quebec_crank;
    else if (malfoy_nyc)
      hagrid_indigo <= 0;
  end

// Random combinatorial logic block
always@(*)
  begin
      crayons_ibm = ~( ~( ~( ~( ~ford_comtrex ) ) ^ ~( hotdog_priest ^ ~avon_giants ) ) );
  end

  always@(*)
  begin
    hut_burnout = ( ( ~( ( ~( water_foryou & klaas_diagon | ~( ~drugie_pilot ) | ~( tabby_guy ) ) ) | ~newt_sirius ^ ~( ~( ~vcc ) ) ) ) & ~( ( guy_ykocens | ~( ~exfoliant ^ emu_romex ) ) ) ) ? ~( ~( ( ~( ( ( vcc & dopey_sinew ) & ~( vcc ) ) ^ ~( ( ~( often_master & ~todd_pictures ) ) ) ) ) ) ) : ~( ( ~north_fortuyn | ~( ~( master_bart ) ) ) ) & ~( ( ~( gnd & ~emu_abraham ) & ( ~( art_zed | vcc & ( ~( nyc_foliage | ~atoms_art ) ) ) ) ) );
  end

initial begin
    {oranje_zen,covad_pdiddy,eel_psycho} = 0;
end

// Registered 3 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (hagrid_indigo)
      {oranje_zen,covad_pdiddy,eel_psycho} <= 0;
    else if (emu_abraham)
      {oranje_zen,covad_pdiddy,eel_psycho} <=
		  {vcc,quebec_crank,bfs};
    else
      {oranje_zen,covad_pdiddy,eel_psycho} <=
		 {goat_mouse,barney_cannon,rarest_emails} + 
		 {dow_rubeus,noah_mexican,gnd};
  end

// AND all of these bits together
always @(gnd or gnd)
  begin
      rarest_chevys = & {gnd,gnd};
  end

reg feedback_pt_372;

always @(sanity_tarzan or feedback_pt_372)
  begin
      plaster_yummy = !sanity_tarzan ^  feedback_pt_372;
  end

reg feedback_pt_373;

always @(armand_lovey or feedback_pt_373)
  begin
      stix_broom =  armand_lovey &  feedback_pt_373;
  end

reg feedback_pt_374;

always @(vcc or feedback_pt_374)
  begin
      kbtoys_tofu = !vcc | !feedback_pt_374;
  end

reg feedback_pt_375;

always @(gnd or feedback_pt_375)
  begin
      theseus_rojas = !gnd | !feedback_pt_375;
  end

reg feedback_pt_376;

always @(vcc or feedback_pt_376)
  begin
      stroop_doc = !vcc |  feedback_pt_376;
  end

reg feedback_pt_377;

always @(vcc or feedback_pt_377)
  begin
      leaky_snort =  vcc |  feedback_pt_377;
  end

reg feedback_pt_378;

always @(oracle or feedback_pt_378)
  begin
      kilo_tylenol =  oracle ^  feedback_pt_378;
  end

reg feedback_pt_379;

always @(oranje_zen or feedback_pt_379)
  begin
      tiger_rubik = !oranje_zen ^  feedback_pt_379;
  end

reg feedback_pt_380;

always @(kilo_tylenol or feedback_pt_380)
  begin
      boing_kebab = !kilo_tylenol |  feedback_pt_380;
  end

reg feedback_pt_381;

always @(atoms_filch or feedback_pt_381)
  begin
      speed_tuna =  atoms_filch ^  feedback_pt_381;
  end

reg feedback_pt_382;

always @(vcc or feedback_pt_382)
  begin
      yankee_zi = !vcc |  feedback_pt_382;
  end

reg feedback_pt_383;

always @(metal_covad or feedback_pt_383)
  begin
      ladder_loser =  metal_covad | !feedback_pt_383;
  end

reg feedback_pt_384;

always @(mike_stirfry or feedback_pt_384)
  begin
      quail_fascist = !mike_stirfry ^  feedback_pt_384;
  end

reg feedback_pt_385;

always @(advil_army or feedback_pt_385)
  begin
      sogood_brian = !advil_army & !feedback_pt_385;
  end

reg feedback_pt_386;

always @(baron_nihlist or feedback_pt_386)
  begin
      condit_pirate = !baron_nihlist ^ !feedback_pt_386;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_moe <= 0;
    else if (timmy_bracket)
      pepsi_moe <= thread_quail;
  end

always @(pepsi_moe)
  begin
      feedback_pt_372 = pepsi_moe;
  end

always @(pepsi_moe)
  begin
      feedback_pt_373 = pepsi_moe;
  end

always @(pepsi_moe)
  begin
      feedback_pt_374 = pepsi_moe;
  end

always @(pepsi_moe)
  begin
      feedback_pt_375 = pepsi_moe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      albus_what <= 0;
    else if (crack_lamer)
      albus_what <= 0;
    else if (gnd)
      albus_what <= water_ykocens;
  end

always @(albus_what)
  begin
      feedback_pt_376 = albus_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_dimetap <= 0;
    else if (quail_fascist)
      oscar_dimetap <= often_master;
  end

always @(oscar_dimetap)
  begin
      feedback_pt_377 = oscar_dimetap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonks_jesus <= 0;
    else
      tonks_jesus <= kanji_gyro;
  end

always @(tonks_jesus)
  begin
      feedback_pt_378 = tonks_jesus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_romex <= 0;
    else if (roe_abraham)
      oldnavy_romex <= vegas_abraham;
    else if (ghost_zinc)
      oldnavy_romex <= 0;
  end

always @(oldnavy_romex)
  begin
      feedback_pt_379 = oldnavy_romex;
  end

wire crab_tank_wire;

dffeas crab_tank_ff (
  .clk(clock1),
  .d(holland_haze),
  .ena(oscar_nyquil),
  .sclr(dopey_bomb),
  .sload(advil_army),
  .asdata(gnd),
  .clrn(!reset1),
  .q(crab_tank_wire)
);

always @(crab_tank_wire) begin
   paper_english = crab_tank_wire;
end

always @(paper_english)
  begin
      feedback_pt_380 = paper_english;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hawaii_plague <= 0;
    else if (beauty_coffee)
      hawaii_plague <= 0;
    else if (ladder_loser)
      hawaii_plague <= floo_xray;
  end

always @(hawaii_plague)
  begin
      feedback_pt_381 = hawaii_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      po_yellowtail <= 0;
    else if (hut_burnout)
      po_yellowtail <= 0;
    else if (west_powder)
      po_yellowtail <= neville_bravo;
  end

always @(po_yellowtail)
  begin
      feedback_pt_382 = po_yellowtail;
  end

wire tonic_whale_wire;

dffeas tonic_whale_ff (
  .clk(clock1),
  .d(advil_army),
  .ena(often_master),
  .sclr(vcc),
  .sload(mario_owes),
  .asdata(achilles_lala),
  .clrn(!reset1),
  .q(tonic_whale_wire)
);

always @(tonic_whale_wire) begin
   egg_plague = tonic_whale_wire;
end

always @(egg_plague)
  begin
      feedback_pt_383 = egg_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cocaine_bart <= 0;
    else if (gnd)
      cocaine_bart <= 0;
    else if (plaster_yummy)
      cocaine_bart <= atoms_filch;
  end

always @(cocaine_bart)
  begin
      feedback_pt_384 = cocaine_bart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_hp <= 0;
    else
      rose_hp <= gnd;
  end

always @(rose_hp)
  begin
      feedback_pt_385 = rose_hp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deuce_salsa <= 0;
    else if (gnd)
      deuce_salsa <= leaky_snort;
    else if (rat_what)
      deuce_salsa <= 0;
  end

always @(deuce_salsa)
  begin
      feedback_pt_386 = deuce_salsa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_mickey <= 0;
    else if (ladder_pyro)
      stix_mickey <= klinton_macys;
    else if (spastic_pilot)
      stix_mickey <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eggsalad_dirk <= 0;
    else if (condit_pirate)
      eggsalad_dirk <= 0;
    else if (gnd)
      eggsalad_dirk <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_faster <= 0;
    else
      animal_faster <= oldnavy_romex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ginger_hinge <= 0;
    else if (crayons_ibm)
      ginger_hinge <= kilo_rojas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      curly_red <= 0;
    else if (zhuang_drugie)
      curly_red <= 0;
    else if (vcc)
      curly_red <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lad_zebra <= 0;
    else
      lad_zebra <= stix_broom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whacky_hinge <= 0;
    else if (vcc)
      whacky_hinge <= stroop_doc;
    else if (deuce_salsa)
      whacky_hinge <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drax_intuit <= 0;
    else if (bambi_skipper)
      drax_intuit <= gnd;
    else if (pilot_nasdaq)
      drax_intuit <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neville_over <= 0;
    else if (vcc)
      neville_over <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      issac_gonzo <= 0;
    else if (trevor_thread)
      issac_gonzo <= 0;
    else if (due_happy)
      issac_gonzo <= malfoy_nyc;
  end

wire green_sortout_wire;

dffea green_sortout_ff (
  .clk(clock1),
  .d(emu_abraham),
  .ena(malfoy_nyc),
  .adata(rescue_sun),
  .clrn(!reset1),
  .q(green_sortout_wire)
);

always @(green_sortout_wire) begin
   mine_chief = green_sortout_wire;
end

reg feedback_pt_387;

always @(fury_grams or feedback_pt_387)
  begin
      avon_neon =  fury_grams ^  feedback_pt_387;
  end

reg feedback_pt_388;

always @(spastic_pilot or feedback_pt_388)
  begin
      snake_copper = !spastic_pilot | !feedback_pt_388;
  end

reg feedback_pt_389;

always @(chief_timmy or feedback_pt_389)
  begin
      kmfdm_marvin = !chief_timmy ^ !feedback_pt_389;
  end

reg feedback_pt_390;

always @(roid_crayons or feedback_pt_390)
  begin
      crayons_fury = !roid_crayons ^  feedback_pt_390;
  end

reg feedback_pt_391;

always @(sogood_brian or feedback_pt_391)
  begin
      cubish_issac = !sogood_brian &  feedback_pt_391;
  end

reg feedback_pt_392;

always @(exfoliant or feedback_pt_392)
  begin
      dig_uppers = !exfoliant & !feedback_pt_392;
  end

reg feedback_pt_393;

always @(nest_crank or feedback_pt_393)
  begin
      liberace_lad =  nest_crank &  feedback_pt_393;
  end

reg feedback_pt_394;

always @(avon_neon or feedback_pt_394)
  begin
      boitano_wine = !avon_neon & !feedback_pt_394;
  end

reg feedback_pt_395;

always @(drax_intuit or feedback_pt_395)
  begin
      goblin_cubish =  drax_intuit & !feedback_pt_395;
  end

reg feedback_pt_396;

always @(eel_psycho or feedback_pt_396)
  begin
      west_sand = !eel_psycho &  feedback_pt_396;
  end

reg feedback_pt_397;

always @(cubish_issac or feedback_pt_397)
  begin
      emails_lamer =  cubish_issac ^  feedback_pt_397;
  end

reg feedback_pt_398;

always @(kbtoys_tofu or feedback_pt_398)
  begin
      lao_ritsu = !kbtoys_tofu | !feedback_pt_398;
  end

reg feedback_pt_399;

always @(beauty_dog or feedback_pt_399)
  begin
      malfoy_indigo =  beauty_dog |  feedback_pt_399;
  end

reg feedback_pt_400;

always @(oscar_nyquil or feedback_pt_400)
  begin
      kungfu_duey =  oscar_nyquil &  feedback_pt_400;
  end

reg feedback_pt_401;

always @(covad_pdiddy or feedback_pt_401)
  begin
      wine_monster =  covad_pdiddy |  feedback_pt_401;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stick_roid <= 0;
    else if (vcc)
      stick_roid <= vcc;
  end

always @(stick_roid)
  begin
      feedback_pt_387 = stick_roid;
  end

always @(stick_roid)
  begin
      feedback_pt_388 = stick_roid;
  end

always @(stick_roid)
  begin
      feedback_pt_389 = stick_roid;
  end

always @(stick_roid)
  begin
      feedback_pt_390 = stick_roid;
  end

always @(stick_roid)
  begin
      feedback_pt_391 = stick_roid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      metal_heidi <= 0;
    else if (goblin_cubish)
      metal_heidi <= trevor_thread;
  end

always @(metal_heidi)
  begin
      feedback_pt_392 = metal_heidi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      grams_wakey <= 0;
    else if (dow_rubeus)
      grams_wakey <= oscar_dimetap;
  end

always @(grams_wakey)
  begin
      feedback_pt_393 = grams_wakey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_hiway <= 0;
    else if (stick_roid)
      tiger_hiway <= onion_trevor;
  end

always @(tiger_hiway)
  begin
      feedback_pt_394 = tiger_hiway;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marco_chevys <= 0;
    else if (vcc)
      marco_chevys <= neville_over;
  end

always @(marco_chevys)
  begin
      feedback_pt_395 = marco_chevys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romex_whiskey <= 0;
    else if (issac_gonzo)
      romex_whiskey <= 0;
    else if (gnd)
      romex_whiskey <= hagrid_indigo;
  end

always @(romex_whiskey)
  begin
      feedback_pt_396 = romex_whiskey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tsmc_milhouse <= 0;
    else
      tsmc_milhouse <= wine_monster;
  end

always @(tsmc_milhouse)
  begin
      feedback_pt_397 = tsmc_milhouse;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_skipper <= 0;
    else if (dig_uppers)
      tiger_skipper <= 0;
    else if (ginger_hinge)
      tiger_skipper <= speed_tuna;
  end

always @(tiger_skipper)
  begin
      feedback_pt_398 = tiger_skipper;
  end

wire willy_emails_wire;

dffeas willy_emails_ff (
  .clk(clock1),
  .d(squad_wukong),
  .ena(kmfdm_marvin),
  .sclr(issac_gonzo),
  .sload(egg_plague),
  .asdata(jacob_malfoy),
  .clrn(!reset1),
  .q(willy_emails_wire)
);

always @(willy_emails_wire) begin
   bear_speedyg = willy_emails_wire;
end

always @(bear_speedyg)
  begin
      feedback_pt_399 = bear_speedyg;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yeanyow_atoms <= 0;
    else
      yeanyow_atoms <= vcc;
  end

always @(yeanyow_atoms)
  begin
      feedback_pt_400 = yeanyow_atoms;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_wiggles <= 0;
    else if (hotdog_priest)
      cain_wiggles <= vcc;
    else if (albus_what)
      cain_wiggles <= 0;
  end

always @(cain_wiggles)
  begin
      feedback_pt_401 = cain_wiggles;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zedong_coffee <= 0;
    else if (gnd)
      zedong_coffee <= 0;
    else if (snake_copper)
      zedong_coffee <= zhuang_drugie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      illegal_duck <= 0;
    else if (gnd)
      illegal_duck <= kbtoys_tofu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      square_hagrid <= 0;
    else
      square_hagrid <= covad_pdiddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vegan_floo <= 1;
    else
      vegan_floo <= vcc;
  end

wire gm_lotus_wire;

dffeas gm_lotus_ff (
  .clk(clock1),
  .d(pepsi_moe),
  .ena(exfoliant),
  .sclr(whacky_hinge),
  .sload(thread_quail),
  .asdata(tiger_rubik),
  .clrn(!reset1),
  .q(gm_lotus_wire)
);

always @(gm_lotus_wire) begin
   chainsaw_clay = gm_lotus_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nyc_pizza <= 0;
    else if (cocaine_bart)
      nyc_pizza <= 0;
    else if (crayons_ibm)
      nyc_pizza <= zedong_coffee;
  end

wire tabby_nuclear_wire;

dffeas tabby_nuclear_ff (
  .clk(clock1),
  .d(stix_broom),
  .ena(chainsaw_clay),
  .sclr(vcc),
  .sload(illegal_duck),
  .asdata(plaster_yummy),
  .clrn(!reset1),
  .q(tabby_nuclear_wire)
);

always @(tabby_nuclear_wire) begin
   mars_monkey = tabby_nuclear_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_amex <= 0;
    else if (marquis_husks)
      ramone_amex <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      remus_vicks <= 0;
    else if (vcc)
      remus_vicks <= vcc;
  end

// Random combinatorial logic block
always@(*)
  begin
      penguin_cheez = ~( ~( ~( ~( tiger_hiway ) ^ ~vcc | guy_ykocens ) ) );
  end

// State Mek turkey_tank Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turkey_tank <= turkey_tank_0;
    else
      case (turkey_tank)
        turkey_tank_0: begin
          if ({nest_crank,gnd,lad_zebra,curly_red} == 10)
            turkey_tank <= turkey_tank_3;
          else if ({nest_crank,gnd,lad_zebra,curly_red} == 13)
            turkey_tank <= turkey_tank_1;
          else
            turkey_tank <= turkey_tank_0;
          end
        turkey_tank_1: begin
          if ({nest_crank,gnd,lad_zebra,curly_red} == 15)
            turkey_tank <= turkey_tank_3;
          else if ({nest_crank,gnd,lad_zebra,curly_red} == 13)
            turkey_tank <= turkey_tank_3;
          else if ({nest_crank,gnd,lad_zebra,curly_red} == 7)
            turkey_tank <= turkey_tank_2;
          else if ({nest_crank,gnd,lad_zebra,curly_red} == 4)
            turkey_tank <= turkey_tank_0;
          else
            turkey_tank <= turkey_tank_1;
          end
        turkey_tank_2: begin
          if ({nest_crank,gnd,lad_zebra,curly_red} == 13)
            turkey_tank <= turkey_tank_3;
          else
            turkey_tank <= turkey_tank_2;
          end
        turkey_tank_3: begin
          if ({nest_crank,gnd,lad_zebra,curly_red} == 6)
            turkey_tank <= turkey_tank_1;
          else if ({nest_crank,gnd,lad_zebra,curly_red} == 2)
            turkey_tank <= turkey_tank_3;
          else if ({nest_crank,gnd,lad_zebra,curly_red} == 9)
            turkey_tank <= turkey_tank_1;
          else
            turkey_tank <= turkey_tank_3;
          end
        default: turkey_tank <= turkey_tank_0;
      endcase
  end

// State Mek turkey_tank Output logic
always @(turkey_tank)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (turkey_tank[3:1])
        turkey_tank_0: begin
            foxtrot_boots = 1;
            porfavor_ebi = 0;
            palmer_dadada = 0;
            dragon_paper = 0;
            gonzo_scrooge = 0;
            po_mario_owes = 1;
            stoner_candle = 0;
            bravo_hours = 0;
            george_lovey = 1;
            sheep_gyro = 1;
            jason_drunken = 1;
          end
        turkey_tank_1: begin
            foxtrot_boots = 0;
            porfavor_ebi = 1;
            palmer_dadada = 0;
            dragon_paper = 0;
            gonzo_scrooge = 1;
            po_mario_owes = 0;
            stoner_candle = 0;
            bravo_hours = 1;
            george_lovey = 1;
            sheep_gyro = 0;
            jason_drunken = 1;
          end
        default: begin
            foxtrot_boots = 1;
            porfavor_ebi = 0;
            palmer_dadada = 0;
            dragon_paper = 0;
            gonzo_scrooge = 0;
            po_mario_owes = 0;
            stoner_candle = 1;
            bravo_hours = 0;
            george_lovey = 1;
            sheep_gyro = 1;
            jason_drunken = 1;
          end
      endcase
  end

// 7 to 3 bit A*Const mult
reg  [6:0] bach_rewire;
always @(gnd or gnd or gnd or whacky_hinge or gnd or marco_chevys or tsmc_milhouse) begin
  bach_rewire = {gnd,gnd,gnd,whacky_hinge,gnd,marco_chevys,tsmc_milhouse};
end

always @(bach_rewire)
  begin
      {beetle_genji,cybex_hawaii,iron_gonzo} = 
	  	  ~bach_rewire * 
		  196;
  end


initial begin
    {advil_iceland,smack_beavis,southern_bfi,cafe_concorde} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({stoner_candle,fatality_sun,tiger_skipper,gnd} < {porfavor_ebi,vcc,hawaii_plague,crayons_fury})
       {advil_iceland,smack_beavis,southern_bfi,cafe_concorde} <= {porfavor_ebi,vcc,hawaii_plague,crayons_fury};
    else
       {advil_iceland,smack_beavis,southern_bfi,cafe_concorde} <= {stoner_candle,fatality_sun,tiger_skipper,gnd};
  end

// 9 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {west_stick,falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum,escape_escape} <= 0;
    else if (palmer_dadada)
      {west_stick,falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum,escape_escape} <= {west_stick,falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum,escape_escape} + 244;
    else
      {west_stick,falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum,escape_escape} <= {west_stick,falafel_north,beetle_star,genji_dweebie,rum_tukatuk,gulp_oitcen,lad_fascist,jacques_rum,escape_escape} - 1;
  end

// const - A
always @(gnd or beauty_coffee or gnd or metal_heidi or vcc or hagrid_indigo or rose_hp or vcc or vcc or mars_monkey)
  begin
    {rerun_husks,kabar_mortar,wine_eggsalad,frog_emails} = 247 - {gnd,beauty_coffee,gnd,metal_heidi,vcc,hagrid_indigo,rose_hp,vcc,vcc,mars_monkey};
  end

// OR all of these bits together
always @(egg_plague or gnd or ginger_hinge or vcc or vcc or gnd or gnd or gnd or ramone_amex)
  begin
      kana_red = | {egg_plague,gnd,ginger_hinge,vcc,vcc,gnd,gnd,gnd,ramone_amex};
  end

// Random 3 in 3 out table
always @(lsd_shuda or vcc or smack_beavis)
  begin
    casex ({lsd_shuda,vcc,smack_beavis})
      0: {kebab_arizona,leidiot_ghost,dweebie_issac}=5;
      1: {kebab_arizona,leidiot_ghost,dweebie_issac}=5;
      2: {kebab_arizona,leidiot_ghost,dweebie_issac}=2;
      3: {kebab_arizona,leidiot_ghost,dweebie_issac}=7;
      4: {kebab_arizona,leidiot_ghost,dweebie_issac}=5;
      5: {kebab_arizona,leidiot_ghost,dweebie_issac}=6;
      6: {kebab_arizona,leidiot_ghost,dweebie_issac}=3;
      7: {kebab_arizona,leidiot_ghost,dweebie_issac}=7;
      default: {kebab_arizona,leidiot_ghost,dweebie_issac}=0;
    endcase
  end


// building a 32 to 1 MUX operator
reg [31:0] bfi_obiwan_mux_dat;
reg [4:0] bfi_obiwan_mux_sel;
always @(gnd or po_mario_owes or kebab_arizona or gnd or genji_dweebie or boitano_wine or gnd or dow_rubeus or dragon_paper or gnd or gnd or wine_eggsalad or square_hagrid or egg_plague or jacob_malfoy or vcc or potato_rod or louie_heidi or gnd or vcc or gulp_oitcen or dow_rubeus or wizard_norris or george_lovey or vcc or jason_drunken or oldnavy_romex or gnd or west_stick or rarest_chevys or gnd or escape_escape)
  begin
    bfi_obiwan_mux_dat = {gnd,po_mario_owes,kebab_arizona,gnd,genji_dweebie,boitano_wine,gnd,dow_rubeus,dragon_paper,gnd,gnd,wine_eggsalad,square_hagrid,egg_plague,jacob_malfoy,vcc,potato_rod,louie_heidi,gnd,vcc,gulp_oitcen,dow_rubeus,wizard_norris,george_lovey,vcc,jason_drunken,oldnavy_romex,gnd,west_stick,rarest_chevys,gnd,escape_escape};
  end

always @(albus_what or timmy_bracket or cybex_hawaii or rescue_sun or romex_whiskey)
  begin
    bfi_obiwan_mux_sel = {albus_what,timmy_bracket,cybex_hawaii,rescue_sun,romex_whiskey};
  end

always @(bfi_obiwan_mux_dat or bfi_obiwan_mux_sel)
  begin
    seashell_mars = bfi_obiwan_mux_dat[bfi_obiwan_mux_sel];
  end

// NOR all of these bits together
always @(jonas_falafel or vcc or vegan_floo or gulp_oitcen or west_sand or leidiot_ghost or oldnavy_romex or liberace_lad)
  begin
      fire_whack = ~| {jonas_falafel,vcc,vegan_floo,gulp_oitcen,west_sand,leidiot_ghost,oldnavy_romex,liberace_lad};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lumber_kmfdm <= 0;
    else
    case ({gnd,gnd})
       0 : lumber_kmfdm <= lumber_kmfdm;
       1 : lumber_kmfdm <= vegan_floo;
       2 : lumber_kmfdm <= thread_quail;
       3 : lumber_kmfdm <= rerun_husks;
       default : lumber_kmfdm <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rouge_alpha <= 0;
    else
    case ({gnd,malfoy_indigo})
       0 : rouge_alpha <= rouge_alpha;
       1 : rouge_alpha <= rouge_alpha;
       2 : rouge_alpha <= rouge_alpha;
       3 : rouge_alpha <= rouge_alpha;
       default : rouge_alpha <= 0;
    endcase
  end

reg feedback_pt_402;

always @(cain_wiggles or feedback_pt_402)
  begin
      pixie_spain =  cain_wiggles |  feedback_pt_402;
  end

reg feedback_pt_403;

always @(lsd_shuda or feedback_pt_403)
  begin
      rouge_east =  lsd_shuda |  feedback_pt_403;
  end

reg feedback_pt_404;

always @(vcc or feedback_pt_404)
  begin
      phoenix_ebay = !vcc & !feedback_pt_404;
  end

reg feedback_pt_405;

always @(sheep_gyro or feedback_pt_405)
  begin
      zen_firstpart =  sheep_gyro ^ !feedback_pt_405;
  end

reg feedback_pt_406;

always @(gnd or feedback_pt_406)
  begin
      rarest_tabby = !gnd | !feedback_pt_406;
  end

reg feedback_pt_407;

always @(lsd_shuda or feedback_pt_407)
  begin
      viagra_plague = !lsd_shuda ^  feedback_pt_407;
  end

reg feedback_pt_408;

always @(vcc or feedback_pt_408)
  begin
      lupin_gotone = !vcc ^ !feedback_pt_408;
  end

reg feedback_pt_409;

always @(priest_echo or feedback_pt_409)
  begin
      dig_obiwan =  priest_echo ^  feedback_pt_409;
  end

reg feedback_pt_410;

always @(pixie_spain or feedback_pt_410)
  begin
      alpha_maryann = !pixie_spain & !feedback_pt_410;
  end

reg feedback_pt_411;

always @(ramone_amex or feedback_pt_411)
  begin
      often_pdaddy =  ramone_amex &  feedback_pt_411;
  end

reg feedback_pt_412;

always @(gnd or feedback_pt_412)
  begin
      aphid_lantern = !gnd &  feedback_pt_412;
  end

reg feedback_pt_413;

always @(vcc or feedback_pt_413)
  begin
      sugar_coconut =  vcc | !feedback_pt_413;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ernie_emu <= 0;
    else if (gnd)
      ernie_emu <= 0;
    else if (rum_tukatuk)
      ernie_emu <= vcc;
  end

always @(ernie_emu)
  begin
      feedback_pt_402 = ernie_emu;
  end

always @(ernie_emu)
  begin
      feedback_pt_403 = ernie_emu;
  end

always @(ernie_emu)
  begin
      feedback_pt_404 = ernie_emu;
  end

always @(ernie_emu)
  begin
      feedback_pt_405 = ernie_emu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burning_ohno <= 1;
    else
      burning_ohno <= priest_echo;
  end

always @(burning_ohno)
  begin
      feedback_pt_406 = burning_ohno;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rod_sebastian <= 0;
    else if (gnd)
      rod_sebastian <= stix_mickey;
    else if (southern_bfi)
      rod_sebastian <= 0;
  end

always @(rod_sebastian)
  begin
      feedback_pt_407 = rod_sebastian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zeus_hinkley <= 0;
    else
      zeus_hinkley <= lupin_gotone;
  end

always @(zeus_hinkley)
  begin
      feedback_pt_408 = zeus_hinkley;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shark_richard <= 1;
    else
      shark_richard <= illegal_duck;
  end

always @(shark_richard)
  begin
      feedback_pt_409 = shark_richard;
  end

wire avon_century_wire;

dffeas avon_century_ff (
  .clk(clock1),
  .d(vcc),
  .ena(curly_red),
  .sclr(beetle_genji),
  .sload(stick_roid),
  .asdata(gnd),
  .clrn(!reset1),
  .q(avon_century_wire)
);

always @(avon_century_wire) begin
   gyro_love_in = avon_century_wire;
end

always @(gyro_love_in)
  begin
      feedback_pt_410 = gyro_love_in;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spyro_lotus <= 0;
    else if (egg_plague)
      spyro_lotus <= viagra_plague;
    else if (oracle)
      spyro_lotus <= 0;
  end

always @(spyro_lotus)
  begin
      feedback_pt_411 = spyro_lotus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popcorn_whack <= 0;
    else if (zeus_hinkley)
      popcorn_whack <= muffin_homer;
  end

always @(popcorn_whack)
  begin
      feedback_pt_412 = popcorn_whack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eagle_beef <= 0;
    else if (gnd)
      eagle_beef <= falafel_north;
    else if (vcc)
      eagle_beef <= 0;
  end

always @(eagle_beef)
  begin
      feedback_pt_413 = eagle_beef;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      riddler_hans <= 1;
    else
      riddler_hans <= cain_wiggles;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_morrison <= 1;
    else
      bear_morrison <= rescue_sun;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dow_blue <= 1;
    else
      dow_blue <= iron_gonzo;
  end

wire protest_cow_wire;

dffeas protest_cow_ff (
  .clk(clock1),
  .d(spyro_lotus),
  .ena(tiger_skipper),
  .sclr(stix_broom),
  .sload(frog_emails),
  .asdata(dow_rubeus),
  .clrn(!reset1),
  .q(protest_cow_wire)
);

always @(protest_cow_wire) begin
   george_hp = protest_cow_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      opus_riddler <= 0;
    else if (zen_firstpart)
      opus_riddler <= gnd;
    else if (illegal_duck)
      opus_riddler <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_rose <= 0;
    else
      pizza_rose <= rarest_tabby;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_autotest <= 1;
    else
      kilo_autotest <= lad_fascist;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fitter_pilot <= 0;
    else
      fitter_pilot <= rarest_tabby;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bravo_exodus <= 0;
    else if (mine_chief)
      bravo_exodus <= 0;
    else if (often_pdaddy)
      bravo_exodus <= gnd;
  end

wire spastic_todd_wire;

dffeas spastic_todd_ff (
  .clk(clock1),
  .d(spyro_lotus),
  .ena(rarest_chevys),
  .sclr(gnd),
  .sload(vcc),
  .asdata(gnd),
  .clrn(!reset1),
  .q(spastic_todd_wire)
);

always @(spastic_todd_wire) begin
   golfland_roid = spastic_todd_wire;
end

wire richard_lamer_wire;

dffeas richard_lamer_ff (
  .clk(clock1),
  .d(gnd),
  .ena(vcc),
  .sclr(gonzo_scrooge),
  .sload(tonks_jesus),
  .asdata(vcc),
  .clrn(!reset1),
  .q(richard_lamer_wire)
);

always @(richard_lamer_wire) begin
   beemer_floo = richard_lamer_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vicks_tracy <= 0;
    else if (dow_blue)
      vicks_tracy <= 0;
    else if (pizza_rose)
      vicks_tracy <= marquis_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_jesus <= 0;
    else if (jacques_rum)
      escape_jesus <= gnd;
    else if (beemer_floo)
      escape_jesus <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dragon_broom <= 0;
    else if (gnd)
      dragon_broom <= beemer_floo;
    else if (beetle_genji)
      dragon_broom <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burner_bfi <= 0;
    else if (burning_ohno)
      burner_bfi <= gnd;
  end

wire egg_wonton_wire;

dffeas egg_wonton_ff (
  .clk(clock1),
  .d(vcc),
  .ena(emu_romex),
  .sclr(sugar_coconut),
  .sload(avon_giants),
  .asdata(bear_speedyg),
  .clrn(!reset1),
  .q(egg_wonton_wire)
);

always @(egg_wonton_wire) begin
   abraham_albus = egg_wonton_wire;
end

wire curie_lost_wire;

dffeas curie_lost_ff (
  .clk(clock1),
  .d(marquis_husks),
  .ena(often_pdaddy),
  .sclr(rod_sebastian),
  .sload(remus_vicks),
  .asdata(todd_malfoy),
  .clrn(!reset1),
  .q(curie_lost_wire)
);

always @(curie_lost_wire) begin
   wine_mine = curie_lost_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      monkey_barney <= 1;
    else
      monkey_barney <= beetle_star;
  end

reg feedback_pt_414;

always @(vcc or feedback_pt_414)
  begin
      mrbill_mars = !vcc ^  feedback_pt_414;
  end

reg feedback_pt_415;

always @(snake_copper or feedback_pt_415)
  begin
      athena_barty =  snake_copper | !feedback_pt_415;
  end

reg feedback_pt_416;

always @(ernie_emu or feedback_pt_416)
  begin
      marge_dirty = !ernie_emu ^  feedback_pt_416;
  end

reg feedback_pt_417;

always @(leidiot_ghost or feedback_pt_417)
  begin
      salsa_master = !leidiot_ghost &  feedback_pt_417;
  end

reg feedback_pt_418;

always @(bust_fear or feedback_pt_418)
  begin
      sirius_tobiko =  bust_fear &  feedback_pt_418;
  end

reg feedback_pt_419;

always @(sugar_coconut or feedback_pt_419)
  begin
      venus_martian =  sugar_coconut ^  feedback_pt_419;
  end

reg feedback_pt_420;

always @(wine_mine or feedback_pt_420)
  begin
      goat_romex = !wine_mine | !feedback_pt_420;
  end

reg feedback_pt_421;

always @(phoenix_ebay or feedback_pt_421)
  begin
      fang_atilla = !phoenix_ebay &  feedback_pt_421;
  end

reg feedback_pt_422;

always @(marge_dirty or feedback_pt_422)
  begin
      egg_barney = !marge_dirty &  feedback_pt_422;
  end

reg feedback_pt_423;

always @(gnd or feedback_pt_423)
  begin
      eagle_centaur = !gnd & !feedback_pt_423;
  end

reg feedback_pt_424;

always @(lupin_gotone or feedback_pt_424)
  begin
      ramone_palmer = !lupin_gotone & !feedback_pt_424;
  end

reg feedback_pt_425;

always @(bear_morrison or feedback_pt_425)
  begin
      schwinger_red =  bear_morrison &  feedback_pt_425;
  end

reg feedback_pt_426;

always @(aphid_lantern or feedback_pt_426)
  begin
      potato_bull = !aphid_lantern &  feedback_pt_426;
  end

reg feedback_pt_427;

always @(bravo_hours or feedback_pt_427)
  begin
      pixie_kungfu =  bravo_hours | !feedback_pt_427;
  end

reg feedback_pt_428;

always @(gnd or feedback_pt_428)
  begin
      pasta_shuda = !gnd ^ !feedback_pt_428;
  end

wire lost_agitator_wire;

dffeas lost_agitator_ff (
  .clk(clock1),
  .d(rouge_alpha),
  .ena(fang_atilla),
  .sclr(phoenix_ebay),
  .sload(kebab_arizona),
  .asdata(gnd),
  .clrn(!reset1),
  .q(lost_agitator_wire)
);

always @(lost_agitator_wire) begin
   square_cubish = lost_agitator_wire;
end

always @(square_cubish)
  begin
      feedback_pt_414 = square_cubish;
  end

always @(square_cubish)
  begin
      feedback_pt_415 = square_cubish;
  end

always @(square_cubish)
  begin
      feedback_pt_416 = square_cubish;
  end

always @(square_cubish)
  begin
      feedback_pt_417 = square_cubish;
  end

always @(square_cubish)
  begin
      feedback_pt_418 = square_cubish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dig_fsncens <= 0;
    else if (gnd)
      dig_fsncens <= opus_riddler;
  end

always @(dig_fsncens)
  begin
      feedback_pt_419 = dig_fsncens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lao_shudamak <= 0;
    else if (riddler_hans)
      lao_shudamak <= gnd;
    else if (po_yellowtail)
      lao_shudamak <= 0;
  end

always @(lao_shudamak)
  begin
      feedback_pt_420 = lao_shudamak;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hawaii_marco <= 0;
    else
      hawaii_marco <= frog_emails;
  end

always @(hawaii_marco)
  begin
      feedback_pt_421 = hawaii_marco;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      palmer_bust <= 1;
    else
      palmer_bust <= vcc;
  end

always @(palmer_bust)
  begin
      feedback_pt_422 = palmer_bust;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rodriguez_guy <= 0;
    else if (vcc)
      rodriguez_guy <= aphid_lantern;
  end

always @(rodriguez_guy)
  begin
      feedback_pt_423 = rodriguez_guy;
  end

wire wonder_stroop_wire;

dffea wonder_stroop_ff (
  .clk(clock1),
  .d(pizza_rose),
  .ena(goat_romex),
  .adata(vegan_floo),
  .clrn(!reset1),
  .q(wonder_stroop_wire)
);

always @(wonder_stroop_wire) begin
   marco_orange = wonder_stroop_wire;
end

always @(marco_orange)
  begin
      feedback_pt_424 = marco_orange;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bep_defoliant <= 0;
    else if (gnd)
      bep_defoliant <= fitter_pilot;
    else if (mrbill_mars)
      bep_defoliant <= 0;
  end

always @(bep_defoliant)
  begin
      feedback_pt_425 = bep_defoliant;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      what_eel <= 0;
    else
      what_eel <= gnd;
  end

always @(what_eel)
  begin
      feedback_pt_426 = what_eel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      happy_mortar <= 1;
    else
      happy_mortar <= fire_whack;
  end

always @(happy_mortar)
  begin
      feedback_pt_427 = happy_mortar;
  end

wire metal_romulus_wire;

dffeas metal_romulus_ff (
  .clk(clock1),
  .d(mundungus),
  .ena(rod_sebastian),
  .sclr(guy_ykocens),
  .sload(stix_broom),
  .asdata(kilo_autotest),
  .clrn(!reset1),
  .q(metal_romulus_wire)
);

always @(metal_romulus_wire) begin
   bravo_arcade = metal_romulus_wire;
end

always @(bravo_arcade)
  begin
      feedback_pt_428 = bravo_arcade;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chowmein_haze <= 0;
    else if (condit_pirate)
      chowmein_haze <= 0;
    else if (atoms_filch)
      chowmein_haze <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_bacon <= 0;
    else
      ham_bacon <= fang_atilla;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_gin <= 0;
    else if (marco_orange)
      moron_gin <= kebab_arizona;
    else if (athena_barty)
      moron_gin <= 0;
  end

wire roe_kanji_wire;

dffeas roe_kanji_ff (
  .clk(clock1),
  .d(beemer_floo),
  .ena(gnd),
  .sclr(bravo_hours),
  .sload(sirius_tobiko),
  .asdata(rodriguez_guy),
  .clrn(!reset1),
  .q(roe_kanji_wire)
);

always @(roe_kanji_wire) begin
   nyc_candle = roe_kanji_wire;
end

wire elf_killer_wire;

dffea elf_killer_ff (
  .clk(clock1),
  .d(gnd),
  .ena(fang_atilla),
  .adata(plaster_yummy),
  .clrn(!reset1),
  .q(elf_killer_wire)
);

always @(elf_killer_wire) begin
   curie_plague = elf_killer_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spyro_neon <= 1;
    else
      spyro_neon <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ocha_meffert <= 0;
    else if (abraham_albus)
      ocha_meffert <= 0;
    else if (vcc)
      ocha_meffert <= grams_wakey;
  end

wire kungfu_elian_wire;

dffea kungfu_elian_ff (
  .clk(clock1),
  .d(george_hp),
  .ena(ramone_palmer),
  .adata(floo),
  .clrn(!reset1),
  .q(kungfu_elian_wire)
);

always @(kungfu_elian_wire) begin
   gap_greenbay = kungfu_elian_wire;
end

wire gilligan_mine_wire;

dffea gilligan_mine_ff (
  .clk(clock1),
  .d(often_pdaddy),
  .ena(eagle_beef),
  .adata(chowmein_haze),
  .clrn(!reset1),
  .q(gilligan_mine_wire)
);

always @(gilligan_mine_wire) begin
   hector_potato = gilligan_mine_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tsmc_wildboar <= 0;
    else if (egg_barney)
      tsmc_wildboar <= 0;
    else if (sirius_tobiko)
      tsmc_wildboar <= lumber_kmfdm;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_curious <= 0;
    else if (happy_mortar)
      moron_curious <= gnd;
    else if (rod_sebastian)
      moron_curious <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jesus_rubik <= 1;
    else
      jesus_rubik <= moron_curious;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      what_doobie <= 0;
    else if (gnd)
      what_doobie <= seashell_mars;
    else if (advil_iceland)
      what_doobie <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_larry <= 0;
    else if (vcc)
      rose_larry <= 0;
    else if (foxtrot_boots)
      rose_larry <= gyro_love_in;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oscar_tapered <= 0;
    else if (pixie_spain)
      oscar_tapered <= vcc;
    else if (vcc)
      oscar_tapered <= 0;
  end

// State Mek chillis_cybex Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chillis_cybex <= chillis_cybex_0;
    else
      case (chillis_cybex)
        chillis_cybex_0: begin
          if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 13)
            chillis_cybex <= chillis_cybex_2;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 8)
            chillis_cybex <= chillis_cybex_0;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 7)
            chillis_cybex <= chillis_cybex_3;
          else
            chillis_cybex <= chillis_cybex_0;
          end
        chillis_cybex_1: begin
          if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 5)
            chillis_cybex <= chillis_cybex_1;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 10)
            chillis_cybex <= chillis_cybex_0;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 12)
            chillis_cybex <= chillis_cybex_0;
          else
            chillis_cybex <= chillis_cybex_1;
          end
        chillis_cybex_2: begin
          if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 12)
            chillis_cybex <= chillis_cybex_4;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 10)
            chillis_cybex <= chillis_cybex_2;
          else
            chillis_cybex <= chillis_cybex_2;
          end
        chillis_cybex_3: begin
          if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 5)
            chillis_cybex <= chillis_cybex_1;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 11)
            chillis_cybex <= chillis_cybex_1;
          else
            chillis_cybex <= chillis_cybex_3;
          end
        chillis_cybex_4: begin
          if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 5)
            chillis_cybex <= chillis_cybex_0;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 7)
            chillis_cybex <= chillis_cybex_0;
          else if ({eggsalad_dirk,vcc,west_sand,condit_pirate} == 11)
            chillis_cybex <= chillis_cybex_3;
          else
            chillis_cybex <= chillis_cybex_4;
          end
        default: chillis_cybex <= chillis_cybex_0;
      endcase
  end

// State Mek chillis_cybex Output logic
always @(chillis_cybex)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (chillis_cybex[3:1])
        chillis_cybex_0: begin
            spain_yellow = 1;
            homerun_meth = 0;
            advil_yummy = 0;
            foryou_subway = 1;
            freaky_pdaddy = 0;
            bonker_gonzo = 1;
            bfs_mortar = 0;
            hans_palmer = 1;
          end
        chillis_cybex_1: begin
            spain_yellow = 1;
            homerun_meth = 1;
            advil_yummy = 0;
            foryou_subway = 1;
            freaky_pdaddy = 0;
            bonker_gonzo = 1;
            bfs_mortar = 1;
            hans_palmer = 0;
          end
        default: begin
            spain_yellow = 1;
            homerun_meth = 0;
            advil_yummy = 0;
            foryou_subway = 1;
            freaky_pdaddy = 0;
            bonker_gonzo = 1;
            bfs_mortar = 1;
            hans_palmer = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire life_rabbi_out;
nut_002_lut #(1) nut_002_lut_inst_life_rabbi (
  .din({oracle}),
  .mask(2'b00),
  .out(life_rabbi_out)
);

always @(life_rabbi_out)
begin
   curie_sogood = life_rabbi_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire itchy_rose_out;
nut_002_lut #(2) nut_002_lut_inst_itchy_rose (
  .din({sirius_tobiko,rouge_east}),
  .mask(4'b0000),
  .out(itchy_rose_out)
);

always @(itchy_rose_out)
begin
   fear_exodus = itchy_rose_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire yak_holepunch_out;
nut_002_lut #(6) nut_002_lut_inst_yak_holepunch (
  .din({gnd,lao_shudamak,abraham_albus,beetle_genji,lumber_kmfdm,spain_yellow}),
  .mask(64'b0101000000101000010110000001000010000110000110001000001000001010),
  .out(yak_holepunch_out)
);

always @(yak_holepunch_out)
begin
   parrot_dragon = yak_holepunch_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire indigo_buddha_out;
nut_002_lut #(5) nut_002_lut_inst_indigo_buddha (
  .din({dweebie_issac,illegal_duck,vcc,spain_yellow,what_eel}),
  .mask(32'h02f33b63),
  .out(indigo_buddha_out)
);

always @(indigo_buddha_out)
begin
   ajax_spyro = indigo_buddha_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire minerva_wakey_out;
nut_002_lut #(4) nut_002_lut_inst_minerva_wakey (
  .din({eagle_beef,palmer_bust,porfavor_ebi,sheep_gyro}),
  .mask(16'b1000000000100010),
  .out(minerva_wakey_out)
);

always @(minerva_wakey_out)
begin
   wood_notalot = minerva_wakey_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire wonder_fronds_out;
nut_002_lut #(1) nut_002_lut_inst_wonder_fronds (
  .din({gnd}),
  .mask(2'b00),
  .out(wonder_fronds_out)
);

always @(wonder_fronds_out)
begin
   pirate_gutter = wonder_fronds_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire nasdaq_shemp_out;
nut_002_lut #(4) nut_002_lut_inst_nasdaq_shemp (
  .din({boitano_wine,jesus_rubik,gnd,vcc}),
  .mask(16'b0000001100000000),
  .out(nasdaq_shemp_out)
);

always @(nasdaq_shemp_out)
begin
   orange_cubish = nasdaq_shemp_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire opus_liberace_out;
nut_002_lut #(6) nut_002_lut_inst_opus_liberace (
  .din({alpha_maryann,schwinger_red,cafe_concorde,beemer_floo,cain_wiggles,golfland_roid}),
  .mask(64'b1100001110000000011001001110010111010110101010000000100100000100),
  .out(opus_liberace_out)
);

always @(opus_liberace_out)
begin
   whattime_bert = opus_liberace_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire stick_intuit_out;
nut_002_lut #(4) nut_002_lut_inst_stick_intuit (
  .din({parrot_dragon,vcc,monkey_barney,bear_morrison}),
  .mask(16'ha024),
  .out(stick_intuit_out)
);

always @(stick_intuit_out)
begin
   sanity_hp = stick_intuit_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire hulk_kaisha_out;
nut_002_lut #(3) nut_002_lut_inst_hulk_kaisha (
  .din({west_stick,mundungus,hector_potato}),
  .mask(8'b00110010),
  .out(hulk_kaisha_out)
);

always @(hulk_kaisha_out)
begin
   iron_cheese = hulk_kaisha_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire show_theseus_out;
nut_002_lut #(6) nut_002_lut_inst_show_theseus (
  .din({lupin_gotone,pasta_shuda,vcc,foryou_subway,bust_fear,gnd}),
  .mask(64'b0000000100000110010001000001000000010010000000010000001010000111),
  .out(show_theseus_out)
);

always @(show_theseus_out)
begin
   ready_spirit = show_theseus_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire seashell_abel_out;
nut_002_lut #(1) nut_002_lut_inst_seashell_abel (
  .din({lao_ritsu}),
  .mask(2'b11),
  .out(seashell_abel_out)
);

always @(seashell_abel_out)
begin
   molokai_rum = seashell_abel_out;
end


initial begin
    {maryann_yoku,lao_steaming,float_floo} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({hans_palmer,west_sand,bravo_exodus} < {vcc,lao_shudamak,rouge_east})
       {maryann_yoku,lao_steaming,float_floo} <= {vcc,lao_shudamak,rouge_east};
    else
       {maryann_yoku,lao_steaming,float_floo} <= {hans_palmer,west_sand,bravo_exodus};
  end

// 7 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {beetle_whale,elf_east,boitano_boing,pcp_master,isle_mortgate,acid_gopher,norbert_goofy} <= 0;
    else if (pirate_gutter)
      {beetle_whale,elf_east,boitano_boing,pcp_master,isle_mortgate,acid_gopher,norbert_goofy} <= {beetle_whale,elf_east,boitano_boing,pcp_master,isle_mortgate,acid_gopher,norbert_goofy} + 1;
    else
      {beetle_whale,elf_east,boitano_boing,pcp_master,isle_mortgate,acid_gopher,norbert_goofy} <= {beetle_whale,elf_east,boitano_boing,pcp_master,isle_mortgate,acid_gopher,norbert_goofy} - 1;
  end

// XNOR all of these bits together
always @(vcc or pixie_kungfu or vcc or vegas_peace or pcp_master or vcc or pixie_kungfu or tsmc_wildboar or timmy_bracket or often_pdaddy or oscar_tapered or hawaii_marco)
  begin
      yummy_pizza = ~^ {vcc,pixie_kungfu,vcc,vegas_peace,pcp_master,vcc,pixie_kungfu,tsmc_wildboar,timmy_bracket,often_pdaddy,oscar_tapered,hawaii_marco};
  end

reg feedback_pt_429;

always @(shark_richard or feedback_pt_429)
  begin
      deng_gerrit = !shark_richard |  feedback_pt_429;
  end

reg feedback_pt_430;

always @(whattime_bert or feedback_pt_430)
  begin
      echo_zealot = !whattime_bert ^  feedback_pt_430;
  end

reg feedback_pt_431;

always @(what_eel or feedback_pt_431)
  begin
      rerun_might =  what_eel &  feedback_pt_431;
  end

reg feedback_pt_432;

always @(what_doobie or feedback_pt_432)
  begin
      ebay_sogood =  what_doobie ^  feedback_pt_432;
  end

reg feedback_pt_433;

always @(isle_mortgate or feedback_pt_433)
  begin
      nigiri_chuck =  isle_mortgate & !feedback_pt_433;
  end

reg feedback_pt_434;

always @(gnd or feedback_pt_434)
  begin
      nigiri_ford = !gnd |  feedback_pt_434;
  end

reg feedback_pt_435;

always @(rose_larry or feedback_pt_435)
  begin
      lizard_peta = !rose_larry |  feedback_pt_435;
  end

reg feedback_pt_436;

always @(salsa_master or feedback_pt_436)
  begin
      donald_rescue =  salsa_master | !feedback_pt_436;
  end

reg feedback_pt_437;

always @(cain_wiggles or feedback_pt_437)
  begin
      jupiter_lsd = !cain_wiggles &  feedback_pt_437;
  end

reg feedback_pt_438;

always @(gnd or feedback_pt_438)
  begin
      kennyg_barney =  gnd & !feedback_pt_438;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      delta_desert <= 0;
    else if (cafe_concorde)
      delta_desert <= ocha_meffert;
    else if (golfland_roid)
      delta_desert <= 0;
  end

always @(delta_desert)
  begin
      feedback_pt_429 = delta_desert;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lao_pegasus <= 0;
    else if (kilo_autotest)
      lao_pegasus <= gnd;
  end

always @(lao_pegasus)
  begin
      feedback_pt_430 = lao_pegasus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blanket_tonks <= 0;
    else if (jupiter_lsd)
      blanket_tonks <= freaky_pdaddy;
  end

always @(blanket_tonks)
  begin
      feedback_pt_431 = blanket_tonks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_lovey <= 0;
    else if (blanket_tonks)
      richard_lovey <= 0;
    else if (lizard_peta)
      richard_lovey <= vcc;
  end

always @(richard_lovey)
  begin
      feedback_pt_432 = richard_lovey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_aphid <= 0;
    else if (vcc)
      pcp_aphid <= rodriguez_guy;
    else if (deng_gerrit)
      pcp_aphid <= 0;
  end

always @(pcp_aphid)
  begin
      feedback_pt_433 = pcp_aphid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      obiwan_tonks <= 0;
    else if (kabar_mortar)
      obiwan_tonks <= pasta_shuda;
    else if (nyc_candle)
      obiwan_tonks <= 0;
  end

always @(obiwan_tonks)
  begin
      feedback_pt_434 = obiwan_tonks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gin_golden <= 1;
    else
      gin_golden <= riddler_hans;
  end

always @(gin_golden)
  begin
      feedback_pt_435 = gin_golden;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_foiled <= 0;
    else
      tobe_foiled <= dow_blue;
  end

always @(tobe_foiled)
  begin
      feedback_pt_436 = tobe_foiled;
  end

wire burner_often_wire;

dffeas burner_often_ff (
  .clk(clock1),
  .d(yeanyow_atoms),
  .ena(wine_eggsalad),
  .sclr(iron_cheese),
  .sload(vcc),
  .asdata(rarest_tabby),
  .clrn(!reset1),
  .q(burner_often_wire)
);

always @(burner_often_wire) begin
   dweebie_ring = burner_often_wire;
end

always @(dweebie_ring)
  begin
      feedback_pt_437 = dweebie_ring;
  end

wire babette_aphid_wire;

dffeas babette_aphid_ff (
  .clk(clock1),
  .d(gnd),
  .ena(rose_larry),
  .sclr(gin_golden),
  .sload(vcc),
  .asdata(rescue_sun),
  .clrn(!reset1),
  .q(babette_aphid_wire)
);

always @(babette_aphid_wire) begin
   lockheed_fire = babette_aphid_wire;
end

always @(lockheed_fire)
  begin
      feedback_pt_438 = lockheed_fire;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_shuda <= 0;
    else if (gnd)
      bagel_shuda <= gap_greenbay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chainsaw_tofu <= 0;
    else if (tobe_foiled)
      chainsaw_tofu <= 0;
    else if (gnd)
      chainsaw_tofu <= curie_plague;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spirit_norris <= 0;
    else if (rerun_might)
      spirit_norris <= rarest_tabby;
    else if (vcc)
      spirit_norris <= 0;
  end

wire touch_scotch_wire;

dffeas touch_scotch_ff (
  .clk(clock1),
  .d(ebay_sogood),
  .ena(escape_escape),
  .sclr(ajax_spyro),
  .sload(bep_defoliant),
  .asdata(potato_bull),
  .clrn(!reset1),
  .q(touch_scotch_wire)
);

always @(touch_scotch_wire) begin
   cheez_zedong = touch_scotch_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      badger_donkey <= 0;
    else if (eagle_centaur)
      badger_donkey <= nigiri_ford;
    else if (sanity_hp)
      badger_donkey <= 0;
  end

wire lizard_donkey_wire;

dffea lizard_donkey_ff (
  .clk(clock1),
  .d(gnd),
  .ena(richard_lovey),
  .adata(vcc),
  .clrn(!reset1),
  .q(lizard_donkey_wire)
);

always @(lizard_donkey_wire) begin
   ihilani_vadar = lizard_donkey_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jonas_bep <= 1;
    else
      jonas_bep <= advil_yummy;
  end

wire vangoh_ebay_wire;

dffeas vangoh_ebay_ff (
  .clk(clock1),
  .d(pizza_rose),
  .ena(kana_red),
  .sclr(rouge_alpha),
  .sload(gnd),
  .asdata(cheez_zedong),
  .clrn(!reset1),
  .q(vangoh_ebay_wire)
);

always @(vangoh_ebay_wire) begin
   fire_boing = vangoh_ebay_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gap_india <= 0;
    else
      gap_india <= riddler_hans;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      my_tummy_zi <= 0;
    else if (beetle_whale)
      my_tummy_zi <= dragon_broom;
    else if (vcc)
      my_tummy_zi <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jonas_aspirin <= 0;
    else if (nigiri_chuck)
      jonas_aspirin <= spirit_norris;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      timmy_snake <= 1;
    else
      timmy_snake <= gap_india;
  end

wire emu_zipporah_wire;

dffeas emu_zipporah_ff (
  .clk(clock1),
  .d(nigiri_ford),
  .ena(timmy_snake),
  .sclr(boitano_boing),
  .sload(goat_romex),
  .asdata(vcc),
  .clrn(!reset1),
  .q(emu_zipporah_wire)
);

always @(emu_zipporah_wire) begin
   enoch_vangoh = emu_zipporah_wire;
end

reg feedback_pt_439;

always @(lao_shudamak or feedback_pt_439)
  begin
      dirty_cow =  lao_shudamak | !feedback_pt_439;
  end

reg feedback_pt_440;

always @(vcc or feedback_pt_440)
  begin
      newt_clothing =  vcc | !feedback_pt_440;
  end

reg feedback_pt_441;

always @(bravo_arcade or feedback_pt_441)
  begin
      mickey_willy =  bravo_arcade | !feedback_pt_441;
  end

reg feedback_pt_442;

always @(tobe_foiled or feedback_pt_442)
  begin
      soccer_moe = !tobe_foiled |  feedback_pt_442;
  end

reg feedback_pt_443;

always @(bonker_gonzo or feedback_pt_443)
  begin
      weasley_hinge = !bonker_gonzo & !feedback_pt_443;
  end

reg feedback_pt_444;

always @(vcc or feedback_pt_444)
  begin
      bismuth_fire =  vcc &  feedback_pt_444;
  end

reg feedback_pt_445;

always @(donald_rescue or feedback_pt_445)
  begin
      sand_lotus = !donald_rescue | !feedback_pt_445;
  end

reg feedback_pt_446;

always @(wood_notalot or feedback_pt_446)
  begin
      yoku_tonic = !wood_notalot |  feedback_pt_446;
  end

reg feedback_pt_447;

always @(bfs_mortar or feedback_pt_447)
  begin
      mexico_atoms =  bfs_mortar ^ !feedback_pt_447;
  end

reg feedback_pt_448;

always @(what_doobie or feedback_pt_448)
  begin
      south_curie =  what_doobie ^ !feedback_pt_448;
  end

reg feedback_pt_449;

always @(kennyg_barney or feedback_pt_449)
  begin
      att_maryann = !kennyg_barney ^ !feedback_pt_449;
  end

reg feedback_pt_450;

always @(badger_donkey or feedback_pt_450)
  begin
      whack_smack =  badger_donkey &  feedback_pt_450;
  end

reg feedback_pt_451;

always @(whack_smack or feedback_pt_451)
  begin
      hinge_questo =  whack_smack & !feedback_pt_451;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tsmc_snape <= 0;
    else if (spyro_neon)
      tsmc_snape <= 0;
    else if (rescue_sun)
      tsmc_snape <= deng_gerrit;
  end

always @(tsmc_snape)
  begin
      feedback_pt_439 = tsmc_snape;
  end

always @(tsmc_snape)
  begin
      feedback_pt_440 = tsmc_snape;
  end

always @(tsmc_snape)
  begin
      feedback_pt_441 = tsmc_snape;
  end

always @(tsmc_snape)
  begin
      feedback_pt_442 = tsmc_snape;
  end

always @(tsmc_snape)
  begin
      feedback_pt_443 = tsmc_snape;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      victor_cuanto <= 0;
    else if (wood_notalot)
      victor_cuanto <= marquis_husks;
    else if (ihilani_vadar)
      victor_cuanto <= 0;
  end

always @(victor_cuanto)
  begin
      feedback_pt_444 = victor_cuanto;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      baron_viagra <= 0;
    else if (norbert_goofy)
      baron_viagra <= liberace_lad;
  end

always @(baron_viagra)
  begin
      feedback_pt_445 = baron_viagra;
  end

wire elephant_gm_wire;

dffeas elephant_gm_ff (
  .clk(clock1),
  .d(lao_pegasus),
  .ena(moron_curious),
  .sclr(rerun_might),
  .sload(gnd),
  .asdata(nigiri_ford),
  .clrn(!reset1),
  .q(elephant_gm_wire)
);

always @(elephant_gm_wire) begin
   blanket_pilot = elephant_gm_wire;
end

always @(blanket_pilot)
  begin
      feedback_pt_446 = blanket_pilot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_intel <= 1;
    else
      ceres_intel <= marco_orange;
  end

always @(ceres_intel)
  begin
      feedback_pt_447 = ceres_intel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      superman_todd <= 0;
    else if (rarest_tabby)
      superman_todd <= 0;
    else if (sanity_hp)
      superman_todd <= jesus_rubik;
  end

always @(superman_todd)
  begin
      feedback_pt_448 = superman_todd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mike_lotus <= 0;
    else if (vcc)
      mike_lotus <= 0;
    else if (curly_red)
      mike_lotus <= ajax_spyro;
  end

always @(mike_lotus)
  begin
      feedback_pt_449 = mike_lotus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cocacola_milo <= 1;
    else
      cocacola_milo <= gnd;
  end

always @(cocacola_milo)
  begin
      feedback_pt_450 = cocacola_milo;
  end

wire parrot_hippo_wire;

dffeas parrot_hippo_ff (
  .clk(clock1),
  .d(kabar_mortar),
  .ena(tsmc_wildboar),
  .sclr(tsmc_snape),
  .sload(vcc),
  .asdata(pixie_kungfu),
  .clrn(!reset1),
  .q(parrot_hippo_wire)
);

always @(parrot_hippo_wire) begin
   nyc_rod = parrot_hippo_wire;
end

always @(nyc_rod)
  begin
      feedback_pt_451 = nyc_rod;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      acid_tapered <= 0;
    else if (kabar_mortar)
      acid_tapered <= badger_donkey;
    else if (jonas_bep)
      acid_tapered <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pepsi_gerard <= 0;
    else if (jonas_bep)
      pepsi_gerard <= freaky_pdaddy;
  end

wire crack_kungfu_wire;

dffeas crack_kungfu_ff (
  .clk(clock1),
  .d(nyc_pizza),
  .ena(bravo_arcade),
  .sclr(curie_sogood),
  .sload(hinge_questo),
  .asdata(isle_mortgate),
  .clrn(!reset1),
  .q(crack_kungfu_wire)
);

always @(crack_kungfu_wire) begin
   snape_neptune = crack_kungfu_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fish_itchy <= 0;
    else if (gnd)
      fish_itchy <= 0;
    else if (liberace_lad)
      fish_itchy <= ham_bacon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_ernie <= 0;
    else if (mike_lotus)
      star_ernie <= 0;
    else if (what_doobie)
      star_ernie <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dog_charlie <= 0;
    else
      dog_charlie <= acid_tapered;
  end

wire hp_rampacker_wire;

dffeas hp_rampacker_ff (
  .clk(clock1),
  .d(pixie_kungfu),
  .ena(soccer_moe),
  .sclr(ceres_intel),
  .sload(bismuth_fire),
  .asdata(nigiri_ford),
  .clrn(!reset1),
  .q(hp_rampacker_wire)
);

always @(hp_rampacker_wire) begin
   turnip_foiled = hp_rampacker_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jason_dirty <= 1;
    else
      jason_dirty <= float_floo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_burning <= 0;
    else if (fear_exodus)
      moe_burning <= 0;
    else if (fire_boing)
      moe_burning <= rouge_alpha;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mexican_mike <= 0;
    else
      mexican_mike <= gin_golden;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      papa_sun <= 0;
    else
      papa_sun <= advil_yummy;
  end

wire zen_drugie_wire;

dffeas zen_drugie_ff (
  .clk(clock1),
  .d(maryann_yoku),
  .ena(vcc),
  .sclr(bravo_arcade),
  .sload(jonas_aspirin),
  .asdata(moron_gin),
  .clrn(!reset1),
  .q(zen_drugie_wire)
);

always @(zen_drugie_wire) begin
   wizard_snape = zen_drugie_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tunafish_duey <= 0;
    else if (snape_neptune)
      tunafish_duey <= fish_itchy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whiskey_crank <= 0;
    else if (gnd)
      whiskey_crank <= vcc;
    else if (obiwan_tonks)
      whiskey_crank <= 0;
  end

wire bono_bonafide_wire;

dffeas bono_bonafide_ff (
  .clk(clock1),
  .d(weasley_hinge),
  .ena(cheez_zedong),
  .sclr(victor_cuanto),
  .sload(vcc),
  .asdata(south_curie),
  .clrn(!reset1),
  .q(bono_bonafide_wire)
);

always @(bono_bonafide_wire) begin
   sogood_drax = bono_bonafide_wire;
end

// Random combinatorial logic block
always@(*)
  begin
      burner_hurt = ~( ~( ~( ~( ~mexico_atoms | ~vcc ) ) ) );
  end

  always@(*)
  begin
    fury_mozart = ( ( ~( ( ( ~att_maryann & ~chainsaw_tofu ) | ~( ~mike_lotus ) ) & ( ~( ( ~( south_curie ^ donald_rescue ) ) & jonas_aspirin | ~gnd ) ) ) ) & ( ~( ( ~( ~( ~dig_obiwan ) ^ ~( ~bagel_shuda ) ) ) ^ ( ~( ~yummy_pizza & ( ~whiskey_crank & burner_hurt ) ) ) ) ) ^ ~( ( ~( ~( jonas_aspirin ) ^ ( ~( ~( beemer_floo ) ^ ~( ~vcc ) ) ) ) ) ) ) ? ~( ~( ~( ( ~( ~cocacola_milo ) & lao_steaming & blanket_pilot ) ) ) ) : ~( ~( ~( ~rescue_sun ) ) & ~( ( ~( ~ham_bacon | ~nyc_pizza ) ) ) ) | ( ~( ~( ( vcc ^ ~tunafish_duey ) ) ) & ~( nyc_pizza ) );
  end
// State Mek what_booming Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      what_booming <= what_booming_0;
    else
      case (what_booming)
        what_booming_0: begin
          if ({gnd,turnip_foiled,rescue_sun,vcc} == 7)
            what_booming <= what_booming_4;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 13)
            what_booming <= what_booming_1;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 11)
            what_booming <= what_booming_4;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 0)
            what_booming <= what_booming_0;
          else
            what_booming <= what_booming_0;
          end
        what_booming_1: begin
          if ({gnd,turnip_foiled,rescue_sun,vcc} == 0)
            what_booming <= what_booming_3;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 12)
            what_booming <= what_booming_1;
          else
            what_booming <= what_booming_1;
          end
        what_booming_2: begin
          if ({gnd,turnip_foiled,rescue_sun,vcc} == 1)
            what_booming <= what_booming_1;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 3)
            what_booming <= what_booming_1;
          else
            what_booming <= what_booming_2;
          end
        what_booming_3: begin
          if ({gnd,turnip_foiled,rescue_sun,vcc} == 11)
            what_booming <= what_booming_1;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 10)
            what_booming <= what_booming_2;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 14)
            what_booming <= what_booming_0;
          else if ({gnd,turnip_foiled,rescue_sun,vcc} == 4)
            what_booming <= what_booming_0;
          else
            what_booming <= what_booming_3;
          end
        what_booming_4: begin
          if ({gnd,turnip_foiled,rescue_sun,vcc} == 8)
            what_booming <= what_booming_1;
          else
            what_booming <= what_booming_4;
          end
        default: what_booming <= what_booming_0;
      endcase
  end

// State Mek what_booming Output logic
always @(what_booming)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (what_booming[3:1])
        what_booming_0: begin
            sinew_intel = 0;
            bacon_nest = 1;
            killme_arcade = 1;
            ariel_thedon = 1;
            crank_mozart = 0;
            diagon_zebra = 1;
            sgates_juliet = 1;
            itchy_oranje = 1;
            platinum_frog = 0;
            hulk_doobie = 1;
            echo_testyour = 0;
          end
        what_booming_1: begin
            sinew_intel = 0;
            bacon_nest = 1;
            killme_arcade = 1;
            ariel_thedon = 0;
            crank_mozart = 0;
            diagon_zebra = 1;
            sgates_juliet = 1;
            itchy_oranje = 0;
            platinum_frog = 1;
            hulk_doobie = 0;
            echo_testyour = 0;
          end
        default: begin
            sinew_intel = 1;
            bacon_nest = 1;
            killme_arcade = 0;
            ariel_thedon = 0;
            crank_mozart = 1;
            diagon_zebra = 1;
            sgates_juliet = 0;
            itchy_oranje = 1;
            platinum_frog = 0;
            hulk_doobie = 0;
            echo_testyour = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_002_lut.v
///////////////////////////////////////////

wire golden_robust_out;
nut_002_lut #(4) nut_002_lut_inst_golden_robust (
  .din({elf_east,killme_arcade,tunafish_duey,sgates_juliet}),
  .mask(16'h8adf),
  .out(golden_robust_out)
);

always @(golden_robust_out)
begin
   ykocens_kana = golden_robust_out;
end

// AND all of these bits together
always @(spain_yellow or star_ernie or nyc_rod or star_ernie or maryann_yoku)
  begin
      oscar_jupiter = & {spain_yellow,star_ernie,nyc_rod,star_ernie,maryann_yoku};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whiskey_bambi <= 0;
    else
    case ({gnd,enoch_vangoh})
       0 : whiskey_bambi <= gnd;
       1 : whiskey_bambi <= whiskey_bambi;
       2 : whiskey_bambi <= ham_bacon;
       3 : whiskey_bambi <= vcc;
       default : whiskey_bambi <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_romex <= 0;
    else
    case ({vcc,orange_cubish})
       0 : ramone_romex <= vcc;
       1 : ramone_romex <= ramone_romex;
       2 : ramone_romex <= ramone_romex;
       3 : ramone_romex <= vcc;
       default : ramone_romex <= 0;
    endcase
  end

reg feedback_pt_452;

always @(yoku_tonic or feedback_pt_452)
  begin
      protest_mine = !yoku_tonic & !feedback_pt_452;
  end

reg feedback_pt_453;

always @(iron_cheese or feedback_pt_453)
  begin
      illegal_dow = !iron_cheese | !feedback_pt_453;
  end

reg feedback_pt_454;

always @(orange_cubish or feedback_pt_454)
  begin
      kanji_bambi =  orange_cubish & !feedback_pt_454;
  end

reg feedback_pt_455;

always @(vcc or feedback_pt_455)
  begin
      furnace_kilo =  vcc & !feedback_pt_455;
  end

reg feedback_pt_456;

always @(what_doobie or feedback_pt_456)
  begin
      ceres_bach =  what_doobie |  feedback_pt_456;
  end

reg feedback_pt_457;

always @(star_ernie or feedback_pt_457)
  begin
      oranges_loud = !star_ernie |  feedback_pt_457;
  end

reg feedback_pt_458;

always @(att_maryann or feedback_pt_458)
  begin
      curie_aspirin =  att_maryann | !feedback_pt_458;
  end

reg feedback_pt_459;

always @(victor_cuanto or feedback_pt_459)
  begin
      fitter_honey = !victor_cuanto | !feedback_pt_459;
  end

reg feedback_pt_460;

always @(acid_gopher or feedback_pt_460)
  begin
      vangoh_dadada =  acid_gopher |  feedback_pt_460;
  end

reg feedback_pt_461;

always @(boitano_boing or feedback_pt_461)
  begin
      vegan_lupin =  boitano_boing |  feedback_pt_461;
  end

reg feedback_pt_462;

always @(goat_romex or feedback_pt_462)
  begin
      chevys_mexico = !goat_romex | !feedback_pt_462;
  end

reg feedback_pt_463;

always @(sinew_intel or feedback_pt_463)
  begin
      bacon_drugs =  sinew_intel &  feedback_pt_463;
  end

reg feedback_pt_464;

always @(curie_aspirin or feedback_pt_464)
  begin
      bolt_kabar =  curie_aspirin | !feedback_pt_464;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boots_macys <= 1;
    else
      boots_macys <= bagel_shuda;
  end

always @(boots_macys)
  begin
      feedback_pt_452 = boots_macys;
  end

always @(boots_macys)
  begin
      feedback_pt_453 = boots_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      roid_broom <= 0;
    else if (gnd)
      roid_broom <= 0;
    else if (gnd)
      roid_broom <= homerun_meth;
  end

always @(roid_broom)
  begin
      feedback_pt_454 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_455 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_456 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_457 = roid_broom;
  end

always @(roid_broom)
  begin
      feedback_pt_458 = roid_broom;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_arthur <= 0;
    else
      star_arthur <= tsmc_wildboar;
  end

always @(star_arthur)
  begin
      feedback_pt_459 = star_arthur;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turnip_deng <= 0;
    else if (papa_sun)
      turnip_deng <= sgates_juliet;
  end

always @(turnip_deng)
  begin
      feedback_pt_460 = turnip_deng;
  end

wire master_milo_wire;

dffeas master_milo_ff (
  .clk(clock1),
  .d(gnd),
  .ena(gnd),
  .sclr(gnd),
  .sload(spain_yellow),
  .asdata(ramone_romex),
  .clrn(!reset1),
  .q(master_milo_wire)
);

always @(master_milo_wire) begin
   raiders_louie = master_milo_wire;
end

always @(raiders_louie)
  begin
      feedback_pt_461 = raiders_louie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_picante <= 0;
    else
      knot_picante <= tunafish_duey;
  end

always @(knot_picante)
  begin
      feedback_pt_462 = knot_picante;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sirius_dopey <= 0;
    else if (sogood_drax)
      sirius_dopey <= kanji_bambi;
  end

always @(sirius_dopey)
  begin
      feedback_pt_463 = sirius_dopey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killer_hanger <= 0;
    else if (gnd)
      killer_hanger <= gnd;
  end

always @(killer_hanger)
  begin
      feedback_pt_464 = killer_hanger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      china_whacky <= 1;
    else
      china_whacky <= maryann_yoku;
  end

wire kappa_drax_wire;

dffeas kappa_drax_ff (
  .clk(clock1),
  .d(vcc),
  .ena(orange_cubish),
  .sclr(alpha_maryann),
  .sload(kanji_bambi),
  .asdata(alpha_maryann),
  .clrn(!reset1),
  .q(kappa_drax_wire)
);

always @(kappa_drax_wire) begin
   often_surfer = kappa_drax_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      acid_muffin <= 0;
    else if (furnace_kilo)
      acid_muffin <= 0;
    else if (kungfu_duey)
      acid_muffin <= molokai_rum;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elguapo_ghost <= 0;
    else if (my_tummy_zi)
      elguapo_ghost <= sand_lotus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tattoo_bloom <= 0;
    else if (acid_tapered)
      tattoo_bloom <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_badger <= 0;
    else
      salmon_badger <= gonzo_scrooge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fire_hiswife <= 0;
    else if (vcc)
      fire_hiswife <= dog_charlie;
    else if (gnd)
      fire_hiswife <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chips_jacuzzi <= 0;
    else if (whiskey_bambi)
      chips_jacuzzi <= ajax_spyro;
    else if (ykocens_kana)
      chips_jacuzzi <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rodent_south <= 0;
    else if (crank_mozart)
      rodent_south <= vangoh_dadada;
  end

reg feedback_pt_465;

always @(whiskey_crank or feedback_pt_465)
  begin
      iceland_egg =  whiskey_crank & !feedback_pt_465;
  end

reg feedback_pt_466;

always @(fury_mozart or feedback_pt_466)
  begin
      would_husks =  fury_mozart &  feedback_pt_466;
  end

reg feedback_pt_467;

always @(gnd or feedback_pt_467)
  begin
      kbtoys_pepsi =  gnd ^  feedback_pt_467;
  end

reg feedback_pt_468;

always @(vcc or feedback_pt_468)
  begin
      jacob_ulysses =  vcc |  feedback_pt_468;
  end

reg feedback_pt_469;

always @(gnd or feedback_pt_469)
  begin
      vicks_bach = !gnd |  feedback_pt_469;
  end

reg feedback_pt_470;

always @(dirty_cow or feedback_pt_470)
  begin
      uniform_crank = !dirty_cow &  feedback_pt_470;
  end

reg feedback_pt_471;

always @(kbtoys_pepsi or feedback_pt_471)
  begin
      Iwin_neon = !kbtoys_pepsi &  feedback_pt_471;
  end

reg feedback_pt_472;

always @(diagon_zebra or feedback_pt_472)
  begin
      spirit_loser = !diagon_zebra ^  feedback_pt_472;
  end

reg feedback_pt_473;

always @(acid_muffin or feedback_pt_473)
  begin
      roe_lad = !acid_muffin ^  feedback_pt_473;
  end

reg feedback_pt_474;

always @(turnip_deng or feedback_pt_474)
  begin
      george_soccer =  turnip_deng &  feedback_pt_474;
  end

reg feedback_pt_475;

always @(baron_viagra or feedback_pt_475)
  begin
      tiger_eagle = !baron_viagra ^ !feedback_pt_475;
  end

reg feedback_pt_476;

always @(turnip_deng or feedback_pt_476)
  begin
      zulu_satanist = !turnip_deng ^  feedback_pt_476;
  end

reg feedback_pt_477;

always @(chevys_mexico or feedback_pt_477)
  begin
      huey_banality = !chevys_mexico | !feedback_pt_477;
  end

reg feedback_pt_478;

always @(bacon_drugs or feedback_pt_478)
  begin
      saturn_iguana =  bacon_drugs |  feedback_pt_478;
  end

reg feedback_pt_479;

always @(tiger_eagle or feedback_pt_479)
  begin
      yak_edible = !tiger_eagle & !feedback_pt_479;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_vadar <= 0;
    else if (gnd)
      ham_vadar <= vcc;
    else if (gnd)
      ham_vadar <= 0;
  end

always @(ham_vadar)
  begin
      feedback_pt_465 = ham_vadar;
  end

always @(ham_vadar)
  begin
      feedback_pt_466 = ham_vadar;
  end

always @(ham_vadar)
  begin
      feedback_pt_467 = ham_vadar;
  end

always @(ham_vadar)
  begin
      feedback_pt_468 = ham_vadar;
  end

always @(ham_vadar)
  begin
      feedback_pt_469 = ham_vadar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boitano_romeo <= 0;
    else if (killer_hanger)
      boitano_romeo <= george_soccer;
    else if (gnd)
      boitano_romeo <= 0;
  end

always @(boitano_romeo)
  begin
      feedback_pt_470 = boitano_romeo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_crack <= 0;
    else if (burner_hurt)
      often_crack <= 0;
    else if (huey_banality)
      often_crack <= gnd;
  end

always @(often_crack)
  begin
      feedback_pt_471 = often_crack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_tylenol <= 0;
    else if (furnace_kilo)
      star_tylenol <= 0;
    else if (ceres_bach)
      star_tylenol <= china_whacky;
  end

always @(star_tylenol)
  begin
      feedback_pt_472 = star_tylenol;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dingbat_lad <= 0;
    else if (pcp_aphid)
      dingbat_lad <= gnd;
    else if (illegal_dow)
      dingbat_lad <= 0;
  end

always @(dingbat_lad)
  begin
      feedback_pt_473 = dingbat_lad;
  end

wire psycho_goofy_wire;

dffea psycho_goofy_ff (
  .clk(clock1),
  .d(oscar_jupiter),
  .ena(sinew_intel),
  .adata(lao_pegasus),
  .clrn(!reset1),
  .q(psycho_goofy_wire)
);

always @(psycho_goofy_wire) begin
   mushroom_east = psycho_goofy_wire;
end

always @(mushroom_east)
  begin
      feedback_pt_474 = mushroom_east;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      howell_hans <= 0;
    else if (burner_hurt)
      howell_hans <= vcc;
  end

always @(howell_hans)
  begin
      feedback_pt_475 = howell_hans;
  end

wire Iwin_intuit_wire;

dffeas Iwin_intuit_ff (
  .clk(clock1),
  .d(oscar_jupiter),
  .ena(what_doobie),
  .sclr(rodent_south),
  .sload(echo_testyour),
  .asdata(vcc),
  .clrn(!reset1),
  .q(Iwin_intuit_wire)
);

always @(Iwin_intuit_wire) begin
   zen_loud = Iwin_intuit_wire;
end

always @(zen_loud)
  begin
      feedback_pt_476 = zen_loud;
  end

wire iron_wonton_wire;

dffeas iron_wonton_ff (
  .clk(clock1),
  .d(vcc),
  .ena(mexican_mike),
  .sclr(salmon_badger),
  .sload(often_surfer),
  .asdata(pcp_aphid),
  .clrn(!reset1),
  .q(iron_wonton_wire)
);

always @(iron_wonton_wire) begin
   pirate_flew = iron_wonton_wire;
end

always @(pirate_flew)
  begin
      feedback_pt_477 = pirate_flew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_iterate <= 0;
    else if (Iwin_neon)
      crab_iterate <= 0;
    else if (vegan_lupin)
      crab_iterate <= chainsaw_tofu;
  end

always @(crab_iterate)
  begin
      feedback_pt_478 = crab_iterate;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hawaii_turnip <= 0;
    else
      hawaii_turnip <= Iwin_neon;
  end

always @(hawaii_turnip)
  begin
      feedback_pt_479 = hawaii_turnip;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      green_eeevil <= 0;
    else
      green_eeevil <= jacob_ulysses;
  end

wire rescue_hp_wire;

dffeas rescue_hp_ff (
  .clk(clock1),
  .d(acid_tapered),
  .ena(gnd),
  .sclr(fire_hiswife),
  .sload(chainsaw_tofu),
  .asdata(hulk_doobie),
  .clrn(!reset1),
  .q(rescue_hp_wire)
);

always @(rescue_hp_wire) begin
   touch_neptune = rescue_hp_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      foxtrot_honda <= 1;
    else
      foxtrot_honda <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      happy_bear <= 0;
    else if (green_eeevil)
      happy_bear <= enoch_vangoh;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dutch_victor <= 0;
    else if (vcc)
      dutch_victor <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      loud_romulus <= 0;
    else if (ariel_thedon)
      loud_romulus <= orange_cubish;
  end

wire hurt_pluto_wire;

dffea hurt_pluto_ff (
  .clk(clock1),
  .d(gnd),
  .ena(foryou_subway),
  .adata(furnace_kilo),
  .clrn(!reset1),
  .q(hurt_pluto_wire)
);

always @(hurt_pluto_wire) begin
   iterate_south = hurt_pluto_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mouse_icarus <= 0;
    else
      mouse_icarus <= often_crack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kaisha_yak <= 0;
    else
      kaisha_yak <= killme_arcade;
  end

wire homer_donkey_wire;

dffeas homer_donkey_ff (
  .clk(clock1),
  .d(sand_lotus),
  .ena(mexican_mike),
  .sclr(iceland_egg),
  .sload(lao_steaming),
  .asdata(tattoo_bloom),
  .clrn(!reset1),
  .q(homer_donkey_wire)
);

always @(homer_donkey_wire) begin
   ceres_whale = homer_donkey_wire;
end

// data words for bus muxing
wire [6:0] shrimp_eagle_word0_data;
wire [6:0] shrimp_eagle_word1_data;
wire [6:0] shrimp_eagle_word2_data;
wire [6:0] shrimp_eagle_word3_data;
wire [6:0] shrimp_eagle_word4_data;
wire [6:0] shrimp_eagle_word5_data;
wire [6:0] shrimp_eagle_word6_data;
wire [6:0] shrimp_eagle_word7_data;
wire [6:0] shrimp_eagle_word8_data;
wire [6:0] shrimp_eagle_word9_data;
wire [6:0] shrimp_eagle_word10_data;
wire [6:0] shrimp_eagle_word11_data;
wire [6:0] shrimp_eagle_word12_data;
assign shrimp_eagle_word0_data = {star_tylenol,vcc,zen_loud,george_soccer,oranges_loud,vcc,furnace_kilo};
assign shrimp_eagle_word1_data = {raiders_louie,gnd,cocacola_milo,gnd,venus_martian,kbtoys_pepsi,pepsi_gerard};
assign shrimp_eagle_word2_data = {itchy_oranje,vcc,kbtoys_pepsi,vcc,boitano_romeo,molokai_rum,mouse_icarus};
assign shrimp_eagle_word3_data = {hawaii_turnip,vcc,yak_edible,saturn_iguana,foryou_subway,gnd,vcc};
assign shrimp_eagle_word4_data = {spirit_loser,foxtrot_honda,bacon_nest,zulu_satanist,uniform_crank,often_surfer,uniform_crank};
assign shrimp_eagle_word5_data = {gnd,oranges_loud,protest_mine,bonker_gonzo,acid_tapered,dirty_cow,dingbat_lad};
assign shrimp_eagle_word6_data = {vcc,vcc,ceres_whale,boots_macys,alpha_maryann,wizard_snape,beemer_floo};
assign shrimp_eagle_word7_data = {salmon_badger,gnd,happy_mortar,boitano_romeo,gnd,kaisha_yak,tiger_eagle};
assign shrimp_eagle_word8_data = {gnd,lao_steaming,moe_burning,burner_hurt,ham_vadar,howell_hans,raiders_louie};
assign shrimp_eagle_word9_data = {yak_edible,moe_burning,touch_neptune,molokai_rum,burner_hurt,fitter_honey,fire_hiswife};
assign shrimp_eagle_word10_data = {bolt_kabar,sirius_dopey,gnd,gnd,venus_martian,gnd,chips_jacuzzi};
assign shrimp_eagle_word11_data = {gnd,gnd,gnd,moe_burning,salmon_badger,square_cubish,diagon_zebra};
assign shrimp_eagle_word12_data = {gnd,gnd,would_husks,crab_iterate,oranges_loud,vcc,dutch_victor};

// select control for bus muxing
wire [16:0] shrimp_eagle_select;
assign shrimp_eagle_select = {vcc,beemer_floo,lockheed_fire,tiger_eagle,boots_macys,vcc,dig_obiwan,vcc,loud_romulus,vcc,vcc,vcc,roid_broom,dig_fsncens,oscar_jupiter,platinum_frog,gnd};


// Mux output word
reg [6:0] shrimp_eagle_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    shrimp_eagle_result = shrimp_eagle_word0_data;
    if (shrimp_eagle_select[9])
        shrimp_eagle_result = shrimp_eagle_word9_data;

    if (shrimp_eagle_select == 108)
        shrimp_eagle_result = ~shrimp_eagle_word6_data;

    if (shrimp_eagle_select == 84)
        shrimp_eagle_result = 0;

    if (shrimp_eagle_select == 84)
        shrimp_eagle_result = 73;

    if (shrimp_eagle_select == 102)
        shrimp_eagle_result = 19;

    if (shrimp_eagle_select[2] && shrimp_eagle_select[2])
        shrimp_eagle_result = shrimp_eagle_word7_data;

    if (shrimp_eagle_select == 221)
        shrimp_eagle_result = 0;

    if (shrimp_eagle_select[14])
        shrimp_eagle_result = shrimp_eagle_word5_data;

    if (shrimp_eagle_select == 191)
        shrimp_eagle_result = ~shrimp_eagle_word8_data;

    if (shrimp_eagle_select[9])
        shrimp_eagle_result = shrimp_eagle_word2_data;

    if (shrimp_eagle_select == 130)
        shrimp_eagle_result = shrimp_eagle_word6_data;

    if (shrimp_eagle_select[9] && shrimp_eagle_select[9])
        shrimp_eagle_result = shrimp_eagle_word8_data;

end


// Send the out bus back to the world
always @(shrimp_eagle_result)
begin
    jacques_bach = shrimp_eagle_result[0];
    often_faster = shrimp_eagle_result[1];
    palm_what = shrimp_eagle_result[2];
    ladder_zinc = shrimp_eagle_result[3];
    whiskey_egg = shrimp_eagle_result[4];
    lion_sheep = shrimp_eagle_result[5];
    cheese_ebi = shrimp_eagle_result[6];
end

// XNOR all of these bits together
always @(howell_hans or whiskey_egg or hawaii_turnip or sirius_dopey or burner_hurt or mushroom_east)
  begin
      muffin_joseph = ~^ {howell_hans,whiskey_egg,hawaii_turnip,sirius_dopey,burner_hurt,mushroom_east};
  end


initial begin
    {balloon_yoku,tuna_bracket,mao_willem,arcade_chuck,malfoy_bull,dirk_charlie,prison_star} = 0;
end

// Registered 7 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (boots_macys)
      {balloon_yoku,tuna_bracket,mao_willem,arcade_chuck,malfoy_bull,dirk_charlie,prison_star} <= 0;
    else if (crab_iterate)
      {balloon_yoku,tuna_bracket,mao_willem,arcade_chuck,malfoy_bull,dirk_charlie,prison_star} <=
		  {platinum_frog,lockheed_fire,palm_what,often_faster,dig_fsncens,gnd,gnd};
    else
      {balloon_yoku,tuna_bracket,mao_willem,arcade_chuck,malfoy_bull,dirk_charlie,prison_star} <=
		 {mushroom_east,pepsi_gerard,roe_lad,vcc,tiger_eagle,roid_broom,kungfu_duey} + 
		 {venus_martian,roe_lad,gnd,gnd,ladder_zinc,vicks_bach,jacques_bach};
  end

// XNOR all of these bits together
always @(gnd or jacques_bach or vcc or arcade_chuck)
  begin
      broom_kabar = ~^ {gnd,jacques_bach,vcc,arcade_chuck};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dragon_golf <= 0;
    else
    case ({cheese_ebi,lion_sheep})
       0 : dragon_golf <= dragon_golf;
       1 : dragon_golf <= dragon_golf;
       2 : dragon_golf <= dragon_golf;
       3 : dragon_golf <= dragon_golf;
       default : dragon_golf <= 0;
    endcase
  end

// OR all of these bits together
always @(vcc or chips_jacuzzi or platinum_frog or lockheed_fire or gnd or Iwin_neon or vcc or lockheed_fire or cocacola_milo or hawaii_turnip)
  begin
      atilla_hans = | {vcc,chips_jacuzzi,platinum_frog,lockheed_fire,gnd,Iwin_neon,vcc,lockheed_fire,cocacola_milo,hawaii_turnip};
  end

// 5 bit SOP selector
always @(
        vcc or foryou_subway  or 
        muffin_joseph or balloon_yoku  or 
        cheese_ebi or vcc  or 
        jacques_bach or oscar_jupiter  or 
        vicks_bach or ceres_whale 
)

begin
    golden_fallen = 
      vcc & foryou_subway |
      muffin_joseph & balloon_yoku |
      cheese_ebi & vcc |
      jacques_bach & oscar_jupiter |
      vicks_bach & ceres_whale;
end

reg feedback_pt_480;

always @(gnd or feedback_pt_480)
  begin
      fufu_mandarin =  gnd &  feedback_pt_480;
  end

reg feedback_pt_481;

always @(jacques_bach or feedback_pt_481)
  begin
      ohno_minnow =  jacques_bach ^ !feedback_pt_481;
  end

reg feedback_pt_482;

always @(pirate_flew or feedback_pt_482)
  begin
      happy_deuce = !pirate_flew &  feedback_pt_482;
  end

reg feedback_pt_483;

always @(vcc or feedback_pt_483)
  begin
      cybex_moe = !vcc |  feedback_pt_483;
  end

reg feedback_pt_484;

always @(often_faster or feedback_pt_484)
  begin
      peace_tin =  often_faster & !feedback_pt_484;
  end

reg feedback_pt_485;

always @(ladder_zinc or feedback_pt_485)
  begin
      lovey_guy = !ladder_zinc |  feedback_pt_485;
  end

reg feedback_pt_486;

always @(gnd or feedback_pt_486)
  begin
      whammy_armand =  gnd | !feedback_pt_486;
  end

reg feedback_pt_487;

always @(vcc or feedback_pt_487)
  begin
      sanity_beast =  vcc ^ !feedback_pt_487;
  end

reg feedback_pt_488;

always @(what_doobie or feedback_pt_488)
  begin
      kungfu_itchy = !what_doobie ^  feedback_pt_488;
  end

reg feedback_pt_489;

always @(dirk_charlie or feedback_pt_489)
  begin
      platinum_crab =  dirk_charlie | !feedback_pt_489;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goat_wujing <= 0;
    else if (beemer_floo)
      goat_wujing <= roid_broom;
  end

always @(goat_wujing)
  begin
      feedback_pt_480 = goat_wujing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sand_wanton <= 0;
    else if (vcc)
      sand_wanton <= kungfu_itchy;
    else if (beemer_floo)
      sand_wanton <= 0;
  end

always @(sand_wanton)
  begin
      feedback_pt_481 = sand_wanton;
  end

wire athena_arthur_wire;

dffea athena_arthur_ff (
  .clk(clock1),
  .d(prison_star),
  .ena(knot_picante),
  .adata(vcc),
  .clrn(!reset1),
  .q(athena_arthur_wire)
);

always @(athena_arthur_wire) begin
   stix_marvin = athena_arthur_wire;
end

always @(stix_marvin)
  begin
      feedback_pt_482 = stix_marvin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neon_xuprocar <= 0;
    else if (often_surfer)
      neon_xuprocar <= 0;
    else if (broom_kabar)
      neon_xuprocar <= sand_wanton;
  end

always @(neon_xuprocar)
  begin
      feedback_pt_483 = neon_xuprocar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      broom_oranje <= 0;
    else if (stix_marvin)
      broom_oranje <= often_surfer;
    else if (happy_deuce)
      broom_oranje <= 0;
  end

always @(broom_oranje)
  begin
      feedback_pt_484 = broom_oranje;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maklak_gyro <= 0;
    else if (dragon_golf)
      maklak_gyro <= happy_bear;
  end

always @(maklak_gyro)
  begin
      feedback_pt_485 = maklak_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      schwinger_bfs <= 0;
    else if (jason_dirty)
      schwinger_bfs <= gnd;
  end

always @(schwinger_bfs)
  begin
      feedback_pt_486 = schwinger_bfs;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hiswife_zinc <= 0;
    else
      hiswife_zinc <= pirate_flew;
  end

always @(hiswife_zinc)
  begin
      feedback_pt_487 = hiswife_zinc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_martian <= 0;
    else if (gnd)
      lala_martian <= 0;
    else if (balloon_yoku)
      lala_martian <= often_faster;
  end

always @(lala_martian)
  begin
      feedback_pt_488 = lala_martian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oracle_pixie <= 0;
    else
      oracle_pixie <= peace_tin;
  end

always @(oracle_pixie)
  begin
      feedback_pt_489 = oracle_pixie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_unicorn <= 0;
    else if (iterate_south)
      stix_unicorn <= 0;
    else if (happy_deuce)
      stix_unicorn <= whiskey_egg;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_faster <= 0;
    else if (bacon_nest)
      ham_faster <= ceres_whale;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marge_uppers <= 0;
    else if (tiger_eagle)
      marge_uppers <= kungfu_itchy;
    else if (kungfu_duey)
      marge_uppers <= 0;
  end

// Vanilla tristate output pin
  bufif1 (due_theonion, atilla_hans, vcc);  // output,dat,oe

// Vanilla tristate output pin
  bufif0 (peta_willy, gnd, cybex_moe);  // output,dat,oe

// Tristate output pin with reg feedback
  bufif0 (penguin_genji,!atilla_hans,!arcade_chuck);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(arcade_chuck or penguin_genji) begin
    if ( arcade_chuck) sinew_rodent =  penguin_genji;
    else sinew_rodent = gnd;
end

// Internal TRI bus MUX built out of tri buffers;
// Z and conflict not possible
  tri tobe_davidlin_tri;
  wire [5:0] tobe_davidlin_dat = {kungfu_duey,Iwin_neon,vcc,sanity_beast,Iwin_neon};
  wire [5:0] tobe_davidlin_sel = {gnd,atilla_hans,hiswife_zinc,fufu_mandarin,golden_fallen};
  wire [5:0] tobe_davidlin_ohsel;
  wire tobe_davidlin_def;

  assign tobe_davidlin_ohsel[0] = tobe_davidlin_sel[0];
  assign tobe_davidlin_ohsel[1] = tobe_davidlin_sel[1] & !tobe_davidlin_ohsel[0];
  assign tobe_davidlin_ohsel[2] = tobe_davidlin_sel[2] & !tobe_davidlin_ohsel[1] & !tobe_davidlin_ohsel[0];
  assign tobe_davidlin_ohsel[3] = tobe_davidlin_sel[3] & !tobe_davidlin_ohsel[2] & !tobe_davidlin_ohsel[1] & !tobe_davidlin_ohsel[0];
  assign tobe_davidlin_ohsel[4] = tobe_davidlin_sel[4] & !tobe_davidlin_ohsel[3] & !tobe_davidlin_ohsel[2] & !tobe_davidlin_ohsel[1] & !tobe_davidlin_ohsel[0];

  assign tobe_davidlin_def = 
     !tobe_davidlin_ohsel[0] & !tobe_davidlin_ohsel[1] & !tobe_davidlin_ohsel[2] & !tobe_davidlin_ohsel[3] & !tobe_davidlin_ohsel[4];

  // onehot tristate MUX
  bufif1 (tobe_davidlin_tri,!tobe_davidlin_dat[0], tobe_davidlin_ohsel[0]);
  bufif0 (tobe_davidlin_tri,!tobe_davidlin_dat[1],!tobe_davidlin_ohsel[1]);
  bufif0 (tobe_davidlin_tri, tobe_davidlin_dat[2],!tobe_davidlin_ohsel[2]);
  bufif0 (tobe_davidlin_tri, tobe_davidlin_dat[3],!tobe_davidlin_ohsel[3]);
  bufif1 (tobe_davidlin_tri, tobe_davidlin_dat[4], tobe_davidlin_ohsel[4]);

  // default value for none-hot
  bufif1 (tobe_davidlin_tri,vcc,tobe_davidlin_def);
  always @(tobe_davidlin_tri) begin
    tobe_davidlin = tobe_davidlin_tri;
  end

reg feedback_pt_490;

always @(newt_clothing or feedback_pt_490)
  begin
      llama_tobiko =  newt_clothing | !feedback_pt_490;
  end

reg feedback_pt_491;

always @(lockheed_fire or feedback_pt_491)
  begin
      louie_mideast = !lockheed_fire ^  feedback_pt_491;
  end

reg feedback_pt_492;

always @(lao_steaming or feedback_pt_492)
  begin
      warlock_rod = !lao_steaming | !feedback_pt_492;
  end

reg feedback_pt_493;

always @(dingbat_lad or feedback_pt_493)
  begin
      zhuang_often =  dingbat_lad ^ !feedback_pt_493;
  end

reg feedback_pt_494;

always @(ariel_thedon or feedback_pt_494)
  begin
      star_obiwan = !ariel_thedon ^ !feedback_pt_494;
  end

reg feedback_pt_495;

always @(star_obiwan or feedback_pt_495)
  begin
      star_yoku = !star_obiwan &  feedback_pt_495;
  end

reg feedback_pt_496;

always @(marge_uppers or feedback_pt_496)
  begin
      jcrew_chips =  marge_uppers | !feedback_pt_496;
  end

reg feedback_pt_497;

always @(jason_dirty or feedback_pt_497)
  begin
      fronds_pluto =  jason_dirty &  feedback_pt_497;
  end

reg feedback_pt_498;

always @(fire_hiswife or feedback_pt_498)
  begin
      burning_tesla = !fire_hiswife & !feedback_pt_498;
  end

reg feedback_pt_499;

always @(tobe_davidlin or feedback_pt_499)
  begin
      gopher_thread =  tobe_davidlin ^ !feedback_pt_499;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_golf <= 0;
    else if (gnd)
      bear_golf <= louie_mideast;
    else if (muffin_joseph)
      bear_golf <= 0;
  end

always @(bear_golf)
  begin
      feedback_pt_490 = bear_golf;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ozzy_doc <= 0;
    else if (lovey_guy)
      ozzy_doc <= 0;
    else if (gnd)
      ozzy_doc <= sinew_rodent;
  end

always @(ozzy_doc)
  begin
      feedback_pt_491 = ozzy_doc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_rubik <= 0;
    else if (beemer_floo)
      bagel_rubik <= 0;
    else if (vcc)
      bagel_rubik <= chainsaw_tofu;
  end

always @(bagel_rubik)
  begin
      feedback_pt_492 = bagel_rubik;
  end

wire gm_school_wire;

dffeas gm_school_ff (
  .clk(clock1),
  .d(gopher_thread),
  .ena(vcc),
  .sclr(ham_vadar),
  .sload(lockheed_fire),
  .asdata(fronds_pluto),
  .clrn(!reset1),
  .q(gm_school_wire)
);

always @(gm_school_wire) begin
   rescue_george = gm_school_wire;
end

always @(rescue_george)
  begin
      feedback_pt_493 = rescue_george;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_devotion <= 0;
    else if (star_arthur)
      newt_devotion <= 0;
    else if (oranges_loud)
      newt_devotion <= fronds_pluto;
  end

always @(newt_devotion)
  begin
      feedback_pt_494 = newt_devotion;
  end

wire plumber_fish_wire;

dffeas plumber_fish_ff (
  .clk(clock1),
  .d(broom_oranje),
  .ena(whammy_armand),
  .sclr(gnd),
  .sload(stix_unicorn),
  .asdata(broom_oranje),
  .clrn(!reset1),
  .q(plumber_fish_wire)
);

always @(plumber_fish_wire) begin
   todd_beavis = plumber_fish_wire;
end

always @(todd_beavis)
  begin
      feedback_pt_495 = todd_beavis;
  end

wire stix_iterate_wire;

dffeas stix_iterate_ff (
  .clk(clock1),
  .d(bear_golf),
  .ena(pirate_flew),
  .sclr(newt_devotion),
  .sload(balloon_yoku),
  .asdata(warlock_rod),
  .clrn(!reset1),
  .q(stix_iterate_wire)
);

always @(stix_iterate_wire) begin
   iron_lizard = stix_iterate_wire;
end

always @(iron_lizard)
  begin
      feedback_pt_496 = iron_lizard;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonks_england <= 0;
    else if (burning_tesla)
      tonks_england <= vcc;
  end

always @(tonks_england)
  begin
      feedback_pt_497 = tonks_england;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugs_ozzy <= 0;
    else if (jason_dirty)
      drugs_ozzy <= kungfu_itchy;
  end

always @(drugs_ozzy)
  begin
      feedback_pt_498 = drugs_ozzy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killme_larry <= 0;
    else if (gnd)
      killme_larry <= gnd;
  end

always @(killme_larry)
  begin
      feedback_pt_499 = killme_larry;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arcade_ritsu <= 0;
    else
      arcade_ritsu <= goat_wujing;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      waster_beetle <= 1;
    else
      waster_beetle <= platinum_frog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_dirk <= 0;
    else if (fire_hiswife)
      meth_dirk <= 0;
    else if (bear_golf)
      meth_dirk <= waster_beetle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kabar_tabby <= 0;
    else
      kabar_tabby <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rod_wiggles <= 0;
    else if (kungfu_duey)
      rod_wiggles <= arcade_ritsu;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      raiders_bart <= 0;
    else if (tuna_bracket)
      raiders_bart <= kungfu_duey;
  end

reg feedback_pt_500;

always @(bagel_rubik or feedback_pt_500)
  begin
      air_gutter = !bagel_rubik &  feedback_pt_500;
  end

reg feedback_pt_501;

always @(platinum_crab or feedback_pt_501)
  begin
      air_wildboar = !platinum_crab ^  feedback_pt_501;
  end

reg feedback_pt_502;

always @(vcc or feedback_pt_502)
  begin
      sinew_ghost =  vcc &  feedback_pt_502;
  end

reg feedback_pt_503;

always @(sinew_ghost or feedback_pt_503)
  begin
      remus_fallen =  sinew_ghost ^ !feedback_pt_503;
  end

always @(gnd)
  begin
      tango_ykocens = !gnd;
  end

always @(gnd)
  begin
      maki_unicorn = !gnd;
  end

always @(gnd)
  begin
      parrot_east = !gnd;
  end

always @(maki_unicorn)
  begin
      rouge_plaster = !maki_unicorn;
  end

always @(kungfu_duey)
  begin
      powder_ariel = !kungfu_duey;
  end

always @(star_yoku)
  begin
      ants_edible = !star_yoku;
  end

always @(iterate_south)
  begin
      bert_kaisha = !iterate_south;
  end

always @(neon_xuprocar)
  begin
      dipsy_odin = !neon_xuprocar;
  end

always @(air_wildboar)
  begin
      rubeus_acid = !air_wildboar;
  end

always @(pirate_flew)
  begin
      nest_cow = !pirate_flew;
  end

always @(protest_mine)
  begin
      sears_rerun = !protest_mine;
  end

always @(star_yoku)
  begin
      arthur_att = !star_yoku;
  end

always @(chainsaw_tofu)
  begin
      pirate_joseph = !chainsaw_tofu;
  end

always @(gnd)
  begin
      newt_cheese = !gnd;
  end

always @(bagel_rubik)
  begin
      green_bep = !bagel_rubik;
  end

always @(vcc)
  begin
      draco_salmon = !vcc;
  end

wire lion_grumby_wire;

dffeas lion_grumby_ff (
  .clk(clock1),
  .d(arcade_ritsu),
  .ena(rouge_plaster),
  .sclr(chainsaw_tofu),
  .sload(stix_marvin),
  .asdata(rescue_george),
  .clrn(!reset1),
  .q(lion_grumby_wire)
);

always @(lion_grumby_wire) begin
   butthead_duey = lion_grumby_wire;
end

always @(butthead_duey)
  begin
      feedback_pt_500 = butthead_duey;
  end

wire mars_turkey_wire;

dffea mars_turkey_ff (
  .clk(clock1),
  .d(vcc),
  .ena(butthead_duey),
  .adata(maklak_gyro),
  .clrn(!reset1),
  .q(mars_turkey_wire)
);

always @(mars_turkey_wire) begin
   oscar_cheez = mars_turkey_wire;
end

always @(oscar_cheez)
  begin
      feedback_pt_501 = oscar_cheez;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hippo_lao <= 0;
    else if (whiskey_egg)
      hippo_lao <= 0;
    else if (nest_cow)
      hippo_lao <= malfoy_bull;
  end

always @(hippo_lao)
  begin
      feedback_pt_502 = hippo_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bravo_sapporo <= 0;
    else
      bravo_sapporo <= gnd;
  end

always @(bravo_sapporo)
  begin
      feedback_pt_503 = bravo_sapporo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      leaky_mortar <= 0;
    else if (gnd)
      leaky_mortar <= 0;
    else if (platinum_crab)
      leaky_mortar <= draco_salmon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_abel <= 0;
    else if (hippo_lao)
      egg_abel <= 0;
    else if (iron_lizard)
      egg_abel <= marge_uppers;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xterm_sierra <= 0;
    else if (balloon_yoku)
      xterm_sierra <= oranges_loud;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_ants <= 0;
    else if (chainsaw_tofu)
      tobe_ants <= rubeus_acid;
    else if (vcc)
      tobe_ants <= 0;
  end

wire zebra_bubba_wire;

dffeas zebra_bubba_ff (
  .clk(clock1),
  .d(vcc),
  .ena(marge_uppers),
  .sclr(remus_fallen),
  .sload(gnd),
  .asdata(prison_star),
  .clrn(!reset1),
  .q(zebra_bubba_wire)
);

always @(zebra_bubba_wire) begin
   hans_voodoo = zebra_bubba_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      Iwin_ladder <= 0;
    else
      Iwin_ladder <= oracle_pixie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rat_solder <= 1;
    else
      rat_solder <= tango_ykocens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_rojas <= 0;
    else
      escape_rojas <= rod_wiggles;
  end

wire spyro_might_wire;

dffeas spyro_might_ff (
  .clk(clock1),
  .d(sears_rerun),
  .ena(maklak_gyro),
  .sclr(killme_larry),
  .sload(air_wildboar),
  .asdata(balloon_yoku),
  .clrn(!reset1),
  .q(spyro_might_wire)
);

always @(spyro_might_wire) begin
   sun_mrbill = spyro_might_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_aspirin <= 0;
    else
      south_aspirin <= Iwin_neon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      togos_haze <= 0;
    else
      togos_haze <= sinew_rodent;
  end

wire papyrus_huey_wire;

dffea papyrus_huey_ff (
  .clk(clock1),
  .d(peace_tin),
  .ena(meth_dirk),
  .adata(gnd),
  .clrn(!reset1),
  .q(papyrus_huey_wire)
);

always @(papyrus_huey_wire) begin
   heidi_crank = papyrus_huey_wire;
end

///////////////////////////////////////////
// Verilog subdesign in nut_002_m270.v
///////////////////////////////////////////

wire [1:0] sinew_gulp_dout;
wire [4:0] sinew_gulp_din;
assign sinew_gulp_din[4:0] = {pirate_flew,gnd,iterate_south,gnd,air_wildboar};

nut_002_m270 nut_002_m270_inst_sinew_gulp (
  .ins(sinew_gulp_din),
  .clock(clock1),
  .reset(reset1),
  .outs(sinew_gulp_dout)
);

always @(sinew_gulp_dout)
begin
  {turkey_sanity,lovey_ring} = sinew_gulp_dout[1:0];
end

wire sun_larry_wire;

dffeas sun_larry_ff (
  .clk(clock1),
  .d(burning_tesla),
  .ena(marge_uppers),
  .sclr(ladder_zinc),
  .sload(schwinger_bfs),
  .asdata(sun_mrbill),
  .clrn(!reset1),
  .q(sun_larry_wire)
);

always @(sun_larry_wire) begin
   turtle_kilo = sun_larry_wire;
end

wire fang_honda_wire;

dffeas fang_honda_ff (
  .clk(clock1),
  .d(fronds_pluto),
  .ena(gnd),
  .sclr(leaky_mortar),
  .sload(zhuang_often),
  .asdata(vcc),
  .clrn(!reset1),
  .q(fang_honda_wire)
);

always @(fang_honda_wire) begin
   snort_nasdaq = fang_honda_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      charlie_ariel <= 0;
    else if (vcc)
      charlie_ariel <= togos_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mandarin_bfs <= 0;
    else if (jason_dirty)
      mandarin_bfs <= 0;
    else if (bravo_sapporo)
      mandarin_bfs <= turtle_kilo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      desert_albus <= 0;
    else if (tuna_bracket)
      desert_albus <= gopher_thread;
  end

wire zeus_po_wire;

dffeas zeus_po_ff (
  .clk(clock1),
  .d(ham_vadar),
  .ena(llama_tobiko),
  .sclr(air_gutter),
  .sload(vcc),
  .asdata(ham_vadar),
  .clrn(!reset1),
  .q(zeus_po_wire)
);

always @(zeus_po_wire) begin
   yellow_victor = zeus_po_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_popcorn <= 0;
    else
      crab_popcorn <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_bono <= 1;
    else
      fufu_bono <= desert_albus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_delta <= 0;
    else if (lala_martian)
      money_delta <= 0;
    else if (vcc)
      money_delta <= rat_solder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      doobie_macys <= 0;
    else if (sun_mrbill)
      doobie_macys <= money_delta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_vangoh <= 1;
    else
      fufu_vangoh <= doobie_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_sanity <= 0;
    else if (hans_voodoo)
      lala_sanity <= newt_cheese;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_marge <= 0;
    else if (vcc)
      kilo_marge <= zhuang_often;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_wine <= 0;
    else if (powder_ariel)
      sinew_wine <= todd_beavis;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bagel_howell <= 0;
    else if (sinew_wine)
      bagel_howell <= 0;
    else if (sun_mrbill)
      bagel_howell <= butthead_duey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_athena <= 0;
    else
      meth_athena <= vicks_bach;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hector_mao <= 0;
    else if (bear_golf)
      hector_mao <= 0;
    else if (parrot_east)
      hector_mao <= escape_rojas;
  end

wire spock_webvan_wire;

dffeas spock_webvan_ff (
  .clk(clock1),
  .d(burning_tesla),
  .ena(green_bep),
  .sclr(vcc),
  .sload(vcc),
  .asdata(muffin_joseph),
  .clrn(!reset1),
  .q(spock_webvan_wire)
);

always @(spock_webvan_wire) begin
   rat_fsncens = spock_webvan_wire;
end

wire chillis_fish_wire;

dffeas chillis_fish_ff (
  .clk(clock1),
  .d(star_obiwan),
  .ena(vcc),
  .sclr(whammy_armand),
  .sload(drugs_ozzy),
  .asdata(peace_tin),
  .clrn(!reset1),
  .q(chillis_fish_wire)
);

always @(chillis_fish_wire) begin
   bart_speed = chillis_fish_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      coconut_witch <= 0;
    else if (crab_popcorn)
      coconut_witch <= ham_vadar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mouse_ghost <= 0;
    else if (bagel_rubik)
      mouse_ghost <= oscar_cheez;
  end

wire bagel_atomic_wire;

dffeas bagel_atomic_ff (
  .clk(clock1),
  .d(pirate_joseph),
  .ena(gnd),
  .sclr(heidi_crank),
  .sload(bagel_howell),
  .asdata(fronds_pluto),
  .clrn(!reset1),
  .q(bagel_atomic_wire)
);

always @(bagel_atomic_wire) begin
   books_rodent = bagel_atomic_wire;
end


endmodule

