/////////////////////////////////////////////////////////////////
// Altera Corporation
// File - nut_001.v
// 159 inputs 37 outputs
//
//
/////////////////////////////////////////////////////////////////
module nut_001 (
// inputs
 bravo, charlie, delta, echo, november, oscar,
      papa, sierra, tango, whiskey, cybex, babette,
      hanger, hinge, nail, bolt, lumber, launcher,
      mortar, tank, cannon, mine, bullet, marker,
      red, blue, green, aphid, badger, bear,
      beetle, bison, bull, lion, lizard, llama,
      monkey, penguin, broom_eagle, clay_ritsu, emu_zipporah, enoch_vangoh,
      zen_drugie, wizard_snape, tunafish_duey, whiskey_crank, bono_bonafide, sogood_drax,
      burner_hurt, fury_mozart, what_booming, sinew_intel, bacon_nest, hulk_doobie,
      echo_testyour, ykocens_kana, golden_robust, oscar_jupiter, whiskey_bambi, ramone_romex,
      fitter_honey, vangoh_dadada, vegan_lupin, chevys_mexico, bacon_drugs, bolt_kabar,
      boots_macys, roid_broom, star_arthur, turnip_deng, acid_muffin, bull_would,
      snort_bfs, sogood_troll, biker_jesus, southern_cafe, dadada_ramone, minnie_floo,
      oscar_peace, tobe_boitano, neptune_willy, muffin_robust, icarus_pluto, rerun_hinge,
      opus_hp, saturn_would, air_minnie, oranje_bomb, oranges_draco, balloon_what,
      saturn_bull, safeway_willy, todd_green, kana_helena, aladdin_roid, desert_sierra,
      lantern_jcrew, delta_yohimbe, pepsi_foiled, loser_lad, ring_winner, geisha_dorkus,
      webvan_peta, dirty_xterm, huey_comtrex, vadar_wonder, hiswife_moe, donkey_lad,
      withme_fang, tiger_phoenix, bono_bomb, atoms_whacky, plumber_papa, devotion_knot,
      school_gerrit, broom_riddler, tin_think, guy_tuna, davidlin_fuji, fish_hummer,
      tiger_hurt, blueled_kilo, issac_ihilani, duey_speedyg, hurt_genesis, nation_soccer,
      southern_papa, ariel_century, grumby_deng, palmer_mrbill, oscar_comrade, piggish_might,
      dorkus_sand, robust_xterm, zhuang_goat, hinge_sears, concorde_kana, joker_lucius,
      money_covad, athena_sierra, tobe_bust, wujing_golf, duey_goblin, alpha_badger,
      bull_kmfdm, the_pope_palm, larry_subway, iceland_moses, sweetie_att, withme_yummy,
      minerva_tonic, sinus_goofy, hagrid_condit, pluto_sgates, fear_my_tummy, gulp_sapporo,
      drdeath_chuck, pluto_quebec, indigo_hurt,

     // outputs
 george, norris, eel_cuanto, luthor_square, rufus_huhhuh, show_fang,
      master_sugar, stroop_coffee, larry_hagrid, devotion_ants, hp_lala, victor_shuda,
      moron_ramone, dopey_bacon, dadada_eel, kangaroo_bolt, rubik_centaur, usa_chillis,
      fallen_ohno, parrot_tinker, nest_nuclear, heidi_might, gerrit_remus, cuckoo_clay,
      lxtcen_alpha, stirfry_wine, holland_honda, brian_beavis, deng_questo, chicken_nail,
      midas_thankee, alpha_clay, honda_kang, stick_foryou, usa_stoner, yummy_newt,
      freaky_condit,

     // tristate outputs
 pacific, yummy_pizza, echo_zealot, rerun_might, wiggum_curie, moulin_deuce,
      cheese_sheep, sinew_gonzo,

     clock0, clock1, reset0, reset1
);
  input bravo;
  input charlie;
  input delta;
  input echo;
  input november;
  input oscar;
  input papa;
  input sierra;
  input tango;
  input whiskey;
  input cybex;
  input babette;
  input hanger;
  input hinge;
  input nail;
  input bolt;
  input lumber;
  input launcher;
  input mortar;
  input tank;
  input cannon;
  input mine;
  input bullet;
  input marker;
  input red;
  input blue;
  input green;
  input aphid;
  input badger;
  input bear;
  input beetle;
  input bison;
  input bull;
  input lion;
  input lizard;
  input llama;
  input monkey;
  input penguin;
  input broom_eagle;
  input clay_ritsu;
  input emu_zipporah;
  input enoch_vangoh;
  input zen_drugie;
  input wizard_snape;
  input tunafish_duey;
  input whiskey_crank;
  input bono_bonafide;
  input sogood_drax;
  input burner_hurt;
  input fury_mozart;
  input what_booming;
  input sinew_intel;
  input bacon_nest;
  input hulk_doobie;
  input echo_testyour;
  input ykocens_kana;
  input golden_robust;
  input oscar_jupiter;
  input whiskey_bambi;
  input ramone_romex;
  input fitter_honey;
  input vangoh_dadada;
  input vegan_lupin;
  input chevys_mexico;
  input bacon_drugs;
  input bolt_kabar;
  input boots_macys;
  input roid_broom;
  input star_arthur;
  input turnip_deng;
  input acid_muffin;
  input bull_would;
  input snort_bfs;
  input sogood_troll;
  input biker_jesus;
  input southern_cafe;
  input dadada_ramone;
  input minnie_floo;
  input oscar_peace;
  input tobe_boitano;
  input neptune_willy;
  input muffin_robust;
  input icarus_pluto;
  input rerun_hinge;
  input opus_hp;
  input saturn_would;
  input air_minnie;
  input oranje_bomb;
  input oranges_draco;
  input balloon_what;
  input saturn_bull;
  input safeway_willy;
  input todd_green;
  input kana_helena;
  input aladdin_roid;
  input desert_sierra;
  input lantern_jcrew;
  input delta_yohimbe;
  input pepsi_foiled;
  input loser_lad;
  input ring_winner;
  input geisha_dorkus;
  input webvan_peta;
  input dirty_xterm;
  input huey_comtrex;
  input vadar_wonder;
  input hiswife_moe;
  input donkey_lad;
  input withme_fang;
  input tiger_phoenix;
  input bono_bomb;
  input atoms_whacky;
  input plumber_papa;
  input devotion_knot;
  input school_gerrit;
  input broom_riddler;
  input tin_think;
  input guy_tuna;
  input davidlin_fuji;
  input fish_hummer;
  input tiger_hurt;
  input blueled_kilo;
  input issac_ihilani;
  input duey_speedyg;
  input hurt_genesis;
  input nation_soccer;
  input southern_papa;
  input ariel_century;
  input grumby_deng;
  input palmer_mrbill;
  input oscar_comrade;
  input piggish_might;
  input dorkus_sand;
  input robust_xterm;
  input zhuang_goat;
  input hinge_sears;
  input concorde_kana;
  input joker_lucius;
  input money_covad;
  input athena_sierra;
  input tobe_bust;
  input wujing_golf;
  input duey_goblin;
  input alpha_badger;
  input bull_kmfdm;
  input the_pope_palm;
  input larry_subway;
  input iceland_moses;
  input sweetie_att;
  input withme_yummy;
  input minerva_tonic;
  input sinus_goofy;
  input hagrid_condit;
  input pluto_sgates;
  input fear_my_tummy;
  input gulp_sapporo;
  input drdeath_chuck;
  input pluto_quebec;
  input indigo_hurt;
  input clock0, clock1, reset0, reset1;

  output george;
  output norris;
  output eel_cuanto;
  output luthor_square;
  output rufus_huhhuh;
  output show_fang;
  output master_sugar;
  output stroop_coffee;
  output larry_hagrid;
  output devotion_ants;
  output hp_lala;
  output victor_shuda;
  output moron_ramone;
  output dopey_bacon;
  output dadada_eel;
  output kangaroo_bolt;
  output rubik_centaur;
  output usa_chillis;
  output fallen_ohno;
  output parrot_tinker;
  output nest_nuclear;
  output heidi_might;
  output gerrit_remus;
  output cuckoo_clay;
  output lxtcen_alpha;
  output stirfry_wine;
  output holland_honda;
  output brian_beavis;
  output deng_questo;
  output chicken_nail;
  output midas_thankee;
  output alpha_clay;
  output honda_kang;
  output stick_foryou;
  output usa_stoner;
  output yummy_newt;
  output freaky_condit;

//tristate outs
  output pacific;
  output yummy_pizza;
  output echo_zealot;
  output rerun_might;
  output wiggum_curie;
  output moulin_deuce;
  output cheese_sheep;
  output sinew_gonzo;


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
    parameter alpha_0 = 0,alpha_1 = 1,alpha_2 = 2,alpha_3 = 3,alpha_4 = 4,alpha_5 = 5;
    reg [3:0] alpha;

  reg quebec;
  reg uniform;
  reg xray;
  reg yankee;
  reg zulu;
  reg bomb_pop;
  reg for_gregg;
  reg adbcensor;
  reg gojira;
  reg richard;
  reg yeanyow;
  reg rubik;
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
  reg fish;
  reg frog;
  reg goat;
  reg hippo;
  reg iguana;
  reg jellyfish;
  reg kangaroo;
  reg mouse;
  reg newt;
  reg ostrich;
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
  reg bambi;
  reg pocahontas;
  reg buddha;
  reg dali_llama;
  reg bush;
  reg hamburger;
  reg hotdog;
  reg klinton;
  reg kang;
  reg water;
  reg air;
  reg fire;
  reg magicwand;
  reg beavis;
  reg butthead;
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
  reg vampire;
  reg pyro;
  reg criminal;
  reg orange;
  reg purple;
  reg yellow;
  reg clay;
  reg paper;
  reg crayons;
  reg indigo;
  reg kmfdm;
  reg pentium;
  reg bubba;
  reg ohno;
  reg fallen;
  reg comrade;
  reg chairman;
  reg biker;
  reg kanji;
  reg bellybutton;
  reg whammy;
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
    parameter deathguild_0 = 0,deathguild_1 = 1,deathguild_2 = 2,deathguild_3 = 3,deathguild_4 = 4,deathguild_5 = 5,deathguild_6 = 6,deathguild_7 = 7,deathguild_8 = 8,deathguild_9 = 9,deathguild_10 = 10,deathguild_11 = 11;
    reg [3:0] deathguild;

  reg probably;
  reg callme;
  reg fuji;
  reg dadada;
  reg parrot;
  reg onthepc;
  reg mariollama;
  reg freaky;
  reg blueled;
  reg prison;
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
  reg fascist;
  reg anarchist;
  reg capitalist;
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
  reg pyromaniac;
  reg waster;
  reg burner;
  reg crackhead;
  reg stoner;
  reg chemical;
  reg brothers;
  reg tunafish;
  reg eggsalad;
  reg postulator;
  reg satanist;
  reg whoiswho;
  reg money;
  reg morrison;
  reg firewalk;
  reg withme;
  reg palmer;
  reg brutality;
  reg hurt;
  reg tobe;
  reg yoku;
  reg simasu;
  reg geisha;
  reg pictures;
  reg star;
  reg ready;
  reg gokidsgo;
  reg lemon;
  reg speeding;
  reg hiway;
  reg grams;
  reg bust;
  reg gotone;
  reg foryou;
  reg moreand;
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
    parameter faster_0 = 0,faster_1 = 1,faster_2 = 2,faster_3 = 3,faster_4 = 4,faster_5 = 5,faster_6 = 6,faster_7 = 7;
    reg [3:0] faster;

  reg psycho;
  reg fruitcake;
  reg chainsaw;
  reg square;
  reg jxnbox;
  reg curie;
  reg plaster;
  reg rampacker;
  reg raiders;
  reg yankees;
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
  reg milhouse;
  reg rod;
  reg todd;
  reg chewbacca;
  reg timmy;
  reg tukatuk;
  reg weevil;
  reg deuce;
  reg eeevil;
  reg bert;
  reg ernie;
  reg life;
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
  reg ramone;
  reg stoned;
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
  reg ariel;
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
  reg pilot;
  reg leaky;
  reg potter;
  reg drax;
  reg moonraker;
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
  reg golden;
  reg egg;
  reg rodent;
  reg billnted;
  reg whiteboard;
  reg fitter;
  reg dingbat;
  reg sweetie;
  reg wiggles;
  reg wanton;
  reg rewire;
  reg thread;
  reg suffering;
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
  reg kana;
  reg crab;
  reg nigiri;
  reg handroll;
  reg maki;
  reg roe;
  reg tobiko;
  reg cucumber;
  reg california;
  reg ebay;
  reg covad;
  reg exodus;
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
    parameter abovenet_0 = 0,abovenet_1 = 1,abovenet_2 = 2,abovenet_3 = 3,abovenet_4 = 4,abovenet_5 = 5,abovenet_6 = 6,abovenet_7 = 7,abovenet_8 = 8,abovenet_9 = 9;
    reg [3:0] abovenet;

  reg amex;
  reg dow;
  reg liberace;
  reg sun;
  reg bfi;
  reg harrydavid;
  reg pepsi;
  reg att;
  reg bathbody;
  reg macys;
  reg mitsubishi;
  reg pimpernel;
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
  reg avon;
  reg bomb;
  reg school;
  reg cornell;
  reg soccer;
  reg softball;
  reg fieldhockey;
  reg nirish;
  reg peace;
  reg illegal;
  reg drugs;
  reg infesting;
  reg crank;
  reg marijuana;
  reg lsd;
  reg acid;
  reg crack;
  reg meth;
  reg crystal;
  reg uppers;
  reg viagra;
  reg decongestant;
  reg nyquil;
  reg dimetap;
  reg coughsyrup;
  reg vicks;
  reg comtrex;
  reg aspirin;
  reg naproxen;
  reg tylenol;
  reg sinus;
  reg sinew;
  reg snort;
  reg pcp;
  reg phenyalanine;
  reg nutrasweet;
  reg honey;
  reg rose;
  reg defoliant;
  reg exfoliant;
  reg curious;
  reg george;
  reg balloon;
  reg enoch;
  reg cheez;
  reg zen;
  reg falafel;
  reg dukdodger;
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
  reg goblin;
  reg elf;
  reg centaur;
  reg theseus;
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
  reg peaves;
  reg hagrid;
  reg bumbledork;
  reg moody;
  reg madeye;
  reg weasley;
  reg floo;
  reg broom;
  reg stick;
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
  reg neville;
  reg longbottom;
  reg bellatrix;
  reg lestrange;
  reg draco;
  reg lucius;
  reg narcissa;
  reg albus;
  reg mcgonagall;
  reg rubeus;
  reg drumstrang;
  reg norbert;
  reg wizard;
  reg diagon;
  reg fireplace;
  reg crucio;
  reg kedavra;
  reg gregg_a;
  reg burrito;
  reg cafe;
  reg synplicity_burrito;
  reg sourcream;
  reg onion;
  reg jalapeno;
  reg beef;
  reg blackbeans;
  reg pintobeans;
  reg tortilla;
  reg salsa;
  reg picante;
  reg chips;
  reg tabasco;
  reg mexican;
  reg llamas_dont_eat_burrito;
  reg director_of_llamas;
  reg fufu;
  reg castaway;
  reg coconut;
  reg maryann;
  reg gilligan;
  reg professor;
  reg moviestar;
  reg ginger;
  reg jonas;
  reg grumby;
  reg minnow;
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
  reg ohthatcoconut;
  reg booming;
  reg rarest;
  reg palm;
  reg seashell;
  reg ohisee;
  reg whacky;
  reg rerun;
  reg fronds;
  reg hut;
  reg rescue;
  reg hawaii;
  reg levelization;
  reg huhhuh;
  reg uomcensor;
  reg wildboar;
  reg lagoon;
  reg escape;
  reg foiled;
  reg bamboo;
  reg desert;
  reg isle;
  tri pacific;
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
  reg gonzo;
  reg gulp;
  reg bonafide;
  reg stroop;
  reg waffle;
  reg wheezer;
  reg ozzy;
  reg priest;
  reg wancensorcens;
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
  reg hurt_saturn;
  reg red_barty;
  reg nyc_foliage;
  reg shark_avon;
  reg marge_killme;
  reg helena_sinus;
  reg cluckU_klaas;
  reg odin_hotdog;
  reg goblin_romex;
  reg iguana_bullet;
  reg turnip_doobie;
  reg ibm_chief;
  reg south_norbert;
  reg gerrit_gyro;
  reg floo_xray;
  reg solder_troll;
  reg pyro_kmfdm;
  reg copper_beef;
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
  reg hoser_holland;
  reg leaky_sanity;
  reg ramone_black;
  reg intuit_voodoo;
  reg spain_stix;
  reg oscar_tobiko;
  reg deng_tinker;
  reg shemp_floride;
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
  reg blue_aphid;
  reg tasty_ebi;
  reg jonas_falafel;
  reg zulu_eel;
  reg wildboar_iron;
  reg madeye_mozart;
  reg obiwan_rabbi;
  reg tuna_minerva;
  reg homerun_stix;
  reg edible_amex;
  reg ham_alpha;
  reg hagrid_neon;
  reg diagon_willy;
  reg uppers_speed;
  reg pentium_tin;
  reg oscar_parrot;
  reg spain_loser;
  reg elian_romeo;
  reg superman_ebi;
  reg flew_bison;
  reg dingbat_tesla;
  reg homerun_echo;
  reg moulin_crank;
  reg otter_kedavra;
  reg kana_zi;
  reg saturn_simasu;
    parameter troll_uppers_0 = 0,troll_uppers_1 = 1,troll_uppers_2 = 2,troll_uppers_3 = 3,troll_uppers_4 = 4,troll_uppers_5 = 5,troll_uppers_6 = 6,troll_uppers_7 = 7,troll_uppers_8 = 8,troll_uppers_9 = 9,troll_uppers_10 = 10;
    reg [3:0] troll_uppers;

  reg rojas_tobe;
  reg goofy_kappa;
  reg hoser_zen;
  reg marco_freaky;
  reg zebra_lad;
  reg yellow_wine;
    parameter ready_centaur_0 = 0,ready_centaur_1 = 1,ready_centaur_2 = 2,ready_centaur_3 = 3,ready_centaur_4 = 4,ready_centaur_5 = 5,ready_centaur_6 = 6;
    reg [3:0] ready_centaur;

  reg wine_sand;
  reg kmfdm_school;
  reg gin_ceres;
  reg midas_hippo;
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
  reg iguana_buddha;
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
  reg show_bacon;
  reg coffee_wujing;
  reg cartman_hurt;
  reg purple_maki;
  reg lala_agitator;
  reg baron_juliet;
  reg yoda_kangaroo;
  reg martin_bolt;
  reg bush_kbtoys;
  reg mideast_bolt;
  reg minnow_marco;
  reg hurt_rose;
  reg venus_elian;
  reg pyro_zipporah;
  reg snake_marco;
  reg bubba_peta;
  reg honda_pdaddy;
  reg midas_macys;
  reg zed_orange;
  reg ulysses_nyc;
  reg mine_ostrich;
  reg art_zed;
  reg what_intel;
  reg gopher_minnow;
  reg neon_snape;
  reg rufus_advil;
  reg zedong_lucius;
    parameter drevil_spirit_0 = 0,drevil_spirit_1 = 1,drevil_spirit_2 = 2,drevil_spirit_3 = 3,drevil_spirit_4 = 4;
    reg [3:0] drevil_spirit;

  reg sake_bullet;
  reg chairman_bfs;
  reg hulk_atomic;
  reg boing_illegal;
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
  reg dork_rouge;
  reg jonas_rocks;
  reg klaas_diagon;
  reg jcrew_cow;
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
  reg hinge_enoch;
  reg homer_goofy;
  reg theseus_maki;
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
    parameter maklak_waffle_0 = 0,maklak_waffle_1 = 1,maklak_waffle_2 = 2,maklak_waffle_3 = 3,maklak_waffle_4 = 4,maklak_waffle_5 = 5;
    reg [3:0] maklak_waffle;

  reg ihilani_bert;
  reg ghost_zinc;
  reg master_bart;
  reg often_onthepc;
  reg greenbay_sake;
  reg baron_clay;
  reg gotone_marvin;
  reg leaky_jinyong;
  reg mexico_sears;
  reg boing_jiminy;
  reg honda_elf;
  reg chicken_romex;
  reg kabar_jacques;
  reg egg_might;
  reg joseph_husks;
  reg avon_oranges;
  reg bananarep_rum;
  reg tank_centaur;
  reg wonton_crack;
  reg advil_army;
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
  reg lucius_drax;
  reg moderate_eel;
  reg kappa_rufus;
  reg safeway_nest;
  reg biker_bono;
  reg kilo_rojas;
  reg green_gm;
  reg often_master;
  reg floating_guy;
  reg life_atchoo;
  reg noah_mexican;
  reg daughter_lisa;
  reg bfs_star;
  reg oscar_nyquil;
  reg tako_fortuyn;
  reg atoms_filch;
  reg zed_weevil;
  reg rescue_sun;
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
  reg kbtoys_tofu;
  reg stroop_doc;
  reg leaky_snort;
  reg tiger_rubik;
  reg boing_kebab;
  reg yankee_zi;
  reg ladder_loser;
  reg sogood_brian;
  reg pepsi_moe;
  reg albus_what;
  reg oscar_dimetap;
  reg oldnavy_romex;
  reg crab_tank;
  reg paper_english;
  reg hawaii_plague;
  reg po_yellowtail;
  reg tonic_whale;
  reg cocaine_bart;
  reg rose_hp;
  reg deuce_salsa;
  reg stix_mickey;
  reg eggsalad_dirk;
  reg animal_faster;
  reg ginger_hinge;
  reg curly_red;
  reg whacky_hinge;
  reg drax_intuit;
  reg neville_over;
  reg issac_gonzo;
  reg green_sortout;
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
    parameter lad_zebra_0 = 0,lad_zebra_1 = 1,lad_zebra_2 = 2,lad_zebra_3 = 3,lad_zebra_4 = 4,lad_zebra_5 = 5,lad_zebra_6 = 6,lad_zebra_7 = 7,lad_zebra_8 = 8;
    reg [3:0] lad_zebra;

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
  reg chainsaw_clay;
  reg nyc_pizza;
  reg tabby_nuclear;
  reg mars_monkey;
  reg ramone_amex;
  reg remus_vicks;
  reg penguin_cheez;
  reg turkey_tank;
  reg foxtrot_boots;
  reg palmer_dadada;
  reg dragon_paper;
  reg gonzo_scrooge;
  reg po_mario_owes;
  reg stoner_candle;
  reg bravo_hours;
  reg george_lovey;
  reg jason_drunken;
  reg bach_rewire;
  reg beetle_genji;
  reg iron_gonzo;
  reg advil_iceland;
  reg smack_beavis;
  reg cafe_concorde;
  reg west_stick;
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
  reg bfi_obiwan;
  reg seashell_mars;
  reg fire_whack;
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
    parameter lumber_kmfdm_0 = 0,lumber_kmfdm_1 = 1,lumber_kmfdm_2 = 2,lumber_kmfdm_3 = 3,lumber_kmfdm_4 = 4,lumber_kmfdm_5 = 5,lumber_kmfdm_6 = 6;
    reg [3:0] lumber_kmfdm;

  reg aphid_lantern;
  reg sugar_coconut;
  reg ernie_emu;
  reg burning_ohno;
  reg rod_sebastian;
  reg zeus_hinkley;
  reg shark_richard;
    parameter often_pdaddy_0 = 0,often_pdaddy_1 = 1,often_pdaddy_2 = 2,often_pdaddy_3 = 3;
    reg [3:0] often_pdaddy;

  reg avon_century;
  reg spyro_lotus;
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
  reg ready_spirit;
  reg show_theseus;
  reg molokai_rum;
  reg seashell_abel;
  reg lao_steaming;
  reg float_floo;
  reg elf_east;
  reg boitano_boing;
  reg pcp_master;
  reg isle_mortgate;
  reg norbert_goofy;
  tri yummy_pizza;
  reg deng_gerrit;
  tri echo_zealot;
  tri rerun_might;
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
  reg babette_aphid;
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
  reg dirty_cow;
  reg newt_clothing;
  reg mickey_willy;
  reg soccer_moe;
  reg weasley_hinge;
  reg bismuth_fire;
  reg sand_lotus;
  reg yoku_tonic;
  reg mexico_atoms;
    parameter timmy_snake_0 = 0,timmy_snake_1 = 1,timmy_snake_2 = 2,timmy_snake_3 = 3,timmy_snake_4 = 4;
    reg [3:0] timmy_snake;

  reg south_curie;
  reg whack_smack;
  reg tsmc_snape;
  reg baron_viagra;
  reg blanket_pilot;
  reg superman_todd;
  reg cocacola_milo;
  reg nyc_rod;
  reg pepsi_gerard;
  reg snape_neptune;
  reg star_ernie;
  reg hp_rampacker;
  reg jason_dirty;
  reg mexican_mike;
  reg killme_arcade;
  reg ariel_thedon;
  reg crank_mozart;
  reg diagon_zebra;
  reg sgates_juliet;
  reg itchy_oranje;
  reg platinum_frog;
  reg protest_mine;
  reg illegal_dow;
  reg kanji_bambi;
  reg furnace_kilo;
  reg ceres_bach;
  reg oranges_loud;
  reg curie_aspirin;
  reg master_milo;
  reg raiders_louie;
  reg knot_picante;
  reg sirius_dopey;
  reg killer_hanger;
  reg china_whacky;
  reg kappa_drax;
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
  reg hurt_pluto;
  reg mouse_icarus;
  reg homer_donkey;
  reg shrimp_eagle;
  reg often_faster;
  reg palm_what;
  reg whiskey_egg;
  reg lion_sheep;
  reg muffin_joseph;
  reg tuna_bracket;
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
  reg penguin_genji;
  reg sinew_rodent;
  reg llama_tobiko;
  reg louie_mideast;
  reg warlock_rod;
  reg zhuang_often;
  reg star_obiwan;
  reg star_yoku;
  reg jcrew_chips;
  reg fronds_pluto;
  reg burning_tesla;
  reg bear_golf;
  reg ozzy_doc;
  reg gm_school;
  reg rescue_george;
  reg newt_devotion;
  reg todd_beavis;
  reg stix_iterate;
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
  reg dog_vulture;
  reg platypus_Iwin;
  reg blaster_togos;
  reg copper_rubeus;
  reg riddler_stix;
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
  reg tuna_baron;
  reg fufu_eagle;
  reg beetle_wakey;
  reg dopey_pierre;
  reg deng_gyro;
  reg riddler_po;
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
  reg pixie_india;
  reg china_fitter;
  reg ebi_iwocensor;
  reg jesus_what;
  reg elian_bamboo;
  reg killer_curie;
  reg hp_richard;
  reg dingbat_snape;
  reg bubba_doc;
  reg vangoh_hinge;
  reg lotus_salami;
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
  reg zed_erncenso;
  reg midas_killer;
  reg square_cheese;
  reg jacuzzi_meth;
  reg moe_maritime;
  reg heidi_school;
  reg falafel_duey;
  reg deng_junkie;
  reg dadada_rescue;
  reg love_in_zulu;
    parameter dopey_master_0 = 0,dopey_master_1 = 1,dopey_master_2 = 2,dopey_master_3 = 3,dopey_master_4 = 4,dopey_master_5 = 5;
    reg [3:0] dopey_master;

  reg cow_tabasco;
  reg wonder_bart;
  reg tapered_xray;
  reg tobe_viagra;
  reg dadada_rubik;
  reg hogwarts_zeus;
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
  reg lxtcen_gopher;
  reg venus_georgec;
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
  reg kanji_todd;
  reg tracy_snape;
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
  reg larry_alpha;
  reg bep_pirate;
  reg onthepc_moe;
  reg tukatuk_mike;
  reg po_wizard;
  reg atomic_joker;
  reg tesla_icarus;
  reg meth_holland;
  reg ajax_shuda;
  reg yak_on_sale;
  reg whacky_exodus;
  reg pluto_armand;
  reg newt_bear;
  reg bison_midas;
  reg faster_rocks;
  reg macys_draco;
  reg advil_cocaine;
  reg oldnavy_tin;
  reg luthor_sleepy;
  reg pizza_tobiko;
  reg cheese_jonas;
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
  reg zinc_zealot;
  reg tango_lala;
  reg dipsy_ants;
  reg platypus_mars;
  reg lala_rojas;
  reg itchy_sun;
  reg drax_timmy;
  reg biker_snake;
  reg llama_eunice;
  reg po_yeanyow;
  reg huhhuh_smack;
  reg bfi_curious;
  reg vicks_monster;
  reg boing_comtrex;
    parameter badger_hotel_0 = 0,badger_hotel_1 = 1,badger_hotel_2 = 2,badger_hotel_3 = 3;
    reg [3:0] badger_hotel;

  reg curie_vicks;
  reg jacques_macys;
  reg heidi_joker;
  reg bison_mickey;
  reg kappa_bismuth;
  reg neville_xterm;
  reg xterm_wakey;
  reg dutch_ostrich;
  reg potter_zealot;
  reg huhhuh_dow;
  reg honda_goofy;
  reg tofu_bonker;
  reg copper_due;
  reg webvan_bubba;
  reg platinum_clay;
    parameter onion_shemp_0 = 0,onion_shemp_1 = 1,onion_shemp_2 = 2,onion_shemp_3 = 3;
    reg [3:0] onion_shemp;

  reg homer_egg;
  reg fang_dimetap;
  reg larry_advil;
  reg sugar_donut;
  reg ready_lovey;
  reg sake_waster;
  reg wonder_wood;
  reg mexico_green;
  reg square_hanger;
  reg lima_pictures;
  reg north_wonton;
  reg oranje_beef;
  reg egg_hinge;
  reg whack_woman;
  reg lad_spirit;
  reg zhuang_indigo;
  reg hp_zeus;
  reg neville_xray;
  reg draco_rabbi;
  reg mickey_fish;
  reg november_ebay;
  reg rufus_black;
  reg papyrus_lisa;
  reg abraham_yoda;
  reg clay_shark;
  reg turkey_ohno;
  reg ibm_ykocens;
  reg dipsy_spanish;
  reg rescue_wakey;
  reg kilo_star;
  reg touch_safeway;
  reg escape_acid;
  reg bear_cow;
  reg moe_stroop;
  reg ramone_spirit;
  reg doc_pictures;
  reg bust_ocean;
  reg kmfdm_bismuth;
  reg richard_ariel;
  reg eatem_lotus;
  reg ghost_school;
  reg ceres_bep;
  reg lumber_crucio;
  reg ramone_jcrew;
  reg psycho_danger;
  reg tasty_jjocen;
  reg deuce_juliet;
  reg egg_cafe;
  reg golf_xiaoping;
  reg ostrich_zi;
  reg crab_crayons;
  reg raiders_loser;
  reg luthor_turtle;
  reg arizona_water;
  reg sneezy_junkie;
  reg lion_would;
  reg tapered_dig;
  reg wine_athena;
  reg dig_bambi;
  reg tinker_sierra;
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
  reg hummer_star;
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
  reg hotdog_arthur;
  reg deng_love_in;
  reg wine_amadeus;
  reg monster_isle;
  reg moe_ihilani;
  reg smack_ohno;
  reg crab_golf;
  reg draco_moulin;
  reg blessyou_meth;
  reg ernie_spyro;
  reg siamese_rojas;
  reg homer_pirate;
  reg whammy_kabar;
  reg remus_bagel;
  reg purple_vegan;
  reg exodus_grumpy;
  reg ibm_rocks;
  reg plague_tango;
  reg aspirin_papa;
  reg zi_chowmein;
  reg zi_bloom;
  reg goat_marco;
  reg helena_rubik;
  reg sleepy_marco;
  reg pork_mine;
  reg fallen_pyro;
  reg cuckoo_cuckoo;
  reg nigiri_donut;
  reg zinc_foxtrot;
  reg money_picture;
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
  reg animal_danger;
  reg flew_valve;
  reg romex_pyro;
  reg otter_warlock;
  reg escape_questo;
  reg peta_zinc;
  reg golden_candle;
  reg loud_brian;
  reg wujing_rubik;
  reg rerun_marker;
  reg spain_wonton;
  reg bep_rafting;
  reg cain_floride;
  reg tank_nhtcenso;
  reg donald_dig;
  reg whammy_green;
  reg curie_cheez;
  reg east_boots;
  reg romex_ginger;
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
  reg due_guacamole;
  reg wicked_gonzo;
  reg emu_ebay;
  reg victor_copper;
  reg blessyou_palm;
  reg webvan_thor;
  reg aladdin_egg;
  reg vangoh_lovey;
  reg popacap_goofy;
  reg brian_cuanto;
  reg xray_arcade;
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
  reg crack_sortout;
  reg bach_salami;
  reg salmon_wood;
  reg life_comrade;
  reg babette_chuck;
  reg sogood_ceres;
  reg often_tylenol;
  reg shark_pork;
  reg quail_shemp;
  reg tortilla_red;
  reg cat_whiskey;
  reg ebi_bert;
  reg elian_heidi;
  reg whale_elguapo;
  reg moses_dig;
  reg rose_marvin;
  reg drugie_diagon;
  reg pixie_rufus;
  reg century_vegas;
  reg aphid_pluto;
  reg taoist_dipsy;
  reg barty_maryann;
  reg lala_cannon;
  reg klaas_tesla;
  reg naproxen_blue;
  reg pyro_booming;
  reg ebi_madeye;
    parameter amadeus_stick_0 = 0,amadeus_stick_1 = 1,amadeus_stick_2 = 2,amadeus_stick_3 = 3,amadeus_stick_4 = 4,amadeus_stick_5 = 5,amadeus_stick_6 = 6,amadeus_stick_7 = 7,amadeus_stick_8 = 8,amadeus_stick_9 = 9;
    reg [3:0] amadeus_stick;

  reg doc_whoiswho;
  reg holland_zeus;
  reg curious_vicks;
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
  reg husks_minnow;
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
  reg crank_comtrex;
  reg rose_martian;
  reg water_crystal;
  reg bloom_larry;
  reg goblin_buddha;
  reg drugs_drunken;
  reg biker_school;
  reg stapler_hulk;
  reg hours_floride;
  reg vadar_yoku;
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
  reg weevil_whammy;
  reg mortar_po;
  reg oldnavy_bacon;
  reg zealot_tesla;
  reg advil_gin;
  reg vicks_troll;
  reg desade_vegas;
  reg pasta_wukong;
  reg kana_rerun;
  reg cain_wizard;
  reg goblin_drevil;
  reg gonzo_kmfdm;
  reg uppers_bull;
  reg goat_ulysses;
  reg hp_safada;
  reg art_curly;
  reg albus_zen;
  reg fang_cuckoo;
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
    parameter blue_gonzo_0 = 0,blue_gonzo_1 = 1,blue_gonzo_2 = 2,blue_gonzo_3 = 3,blue_gonzo_4 = 4,blue_gonzo_5 = 5,blue_gonzo_6 = 6,blue_gonzo_7 = 7,blue_gonzo_8 = 8;
    reg [3:0] blue_gonzo;

  reg maki_maryann;
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
    parameter lala_athena_0 = 0,lala_athena_1 = 1,lala_athena_2 = 2,lala_athena_3 = 3,lala_athena_4 = 4;
    reg [3:0] lala_athena;

  reg uppers_att;
  reg illegal_vadar;
  reg zealot_elian;
  reg bush_isle;
  reg ebay_boing;
  reg mickey_hummer;
  reg peace_solder;
  reg wakey_ham;
  reg junkie_duck;
  reg ebi_cheese;
  reg mao_jason;
  reg floo_voodoo;
  reg drugs_bullet;
  reg newt_gin;
  reg animal_what;
  reg opus_geisha;
  reg advil_clay;
  reg louie_fsncens;
  reg gokidsgo_zeus;
  reg kbtoys_danger;
  reg yellow_marco;
  reg troll_coffee;
  reg abel_dingbat;
  reg frog_palm;
  reg rabbi_soccer;
  reg moron_ham;
  reg elf_stirfry;
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
  reg enoch_pork;
  reg smack_mozart;
  reg cuckoo_quail;
  reg zen_potato;
  reg romeo_tin;
  reg pixie_sortout;
  reg ocean_green;
  reg ford_flew;
  reg oitcen_rodent;
  reg grams_valve;
  reg oldnavy_rasp;
  reg tobiko_tabby;
  reg life_wine;
  reg brian_deuce;
  reg hinge_kmfdm;
  reg huhhuh_quebec;
  reg wonton_psycho;
  reg helena_goat;
  reg wiggum_avon;
  reg surfer_knot;
  reg kana_dorkus;
  reg speed_vegan;
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
  reg boots_ramone;
  reg safeway_tonic;
  reg isle_husks;
  reg deng_gregg_a;
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
  reg shuda_togos;
  reg arcade_sogood;
  reg giants_beavis;
  reg ibm_banality;
  reg china_subway;
  reg willem_indigo;
  reg sleepy_boots;
  reg ulysses_legos;
  reg cuanto_float;
  reg guy_rhvcens;
  reg chips_deng;
  reg speeding_fuji;
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
  reg tango_whiskey;
  reg hotdog_egg;
  reg english_kilo;
  reg candle_pig;
  reg honey_beavis;
  reg lsd_tobiko;
  reg solder_obiwan;
  reg kaisha_jonas;
  reg life_lima;
  reg cain_parrot;
  reg dr_zaius_bep;
  reg supurb_barnum;
  reg bolt_ibm;
  reg shrimp_peta;
  reg pirate_icarus;
  reg south_ham;
  reg shrimp_cubish;
  reg goat_ham;
  reg norbert_eel;
  reg frog_stroop;
  reg south_noah;
  reg crack_foxtrot;
  reg cheez_voodoo;
  reg xterm_simasu;
  reg beast_kdqcens;
  reg wonton_edible;
  reg master_giants;
  reg bart_joey;
  reg amadeus_romeo;
    parameter rewire_frog_0 = 0,rewire_frog_1 = 1,rewire_frog_2 = 2,rewire_frog_3 = 3,rewire_frog_4 = 4,rewire_frog_5 = 5,rewire_frog_6 = 6,rewire_frog_7 = 7,rewire_frog_8 = 8;
    reg [3:0] rewire_frog;

  reg guy_powder;
  reg peta_cryptic;
  reg jacob_bolt;
  reg jason_numbers;
  reg toysrus_roe;
  reg bert_life;
  reg tesla_whale;
  reg mouse_tiger;
  reg solder_tank;
  reg stix_nigiri;
  reg fuji_condit;
  reg quail_lumber;
  reg atilla_cuanto;
  reg spock_tango;
  reg advil_nobody;
  reg tiger_dorkus;
  reg pegasus_meth;
  reg coffee_fang;
  reg turnip_hinge;
  reg ihilani_army;
  reg cryptic_chief;
  reg salami_ibm;
  reg psycho_fang;
  reg blueled_army;
  reg otter_mexican;
  reg north_roe;
  reg uniform_would;
  reg genesis_black;
  reg wakey_neon;
  reg popcorn_tuna;
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
  reg school_cheez;
  reg bert_foiled;
  reg tasty_pdaddy;
  reg lotus_jacuzzi;
  reg tofu_squad;
  reg klaas_touch;
  reg whatelse_odin;
  reg heidi_eeevil;
  reg badger_baron;
  reg school_kmfdm;
  reg rewire_bison;
  reg greenland_doc;
  reg bison_exodus;
  reg abel_picante;
  reg jiminy_palm;
  reg plaster_echo;
  reg remus_blaster;
    parameter richard_thor_0 = 0,richard_thor_1 = 1,richard_thor_2 = 2,richard_thor_3 = 3,richard_thor_4 = 4,richard_thor_5 = 5,richard_thor_6 = 6,richard_thor_7 = 7,richard_thor_8 = 8,richard_thor_9 = 9;
    reg [3:0] richard_thor;

  reg draco_waffle;
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
  reg pixie_athena;
  reg master_crab;
  reg spock_south;
  reg moulin_willy;
  reg issac_opus;
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
  reg dog_webvan;
  reg leidiot_rat;
  reg knot_questo;
  reg unicorn_llama;
  reg xray_nest;
  reg juliet_doobie;
  reg acid_wheezer;
  reg larry_hagrid;
  reg popcorn_air;
  reg odin_brothers;
  reg deuce_crack;
  reg devotion_ants;
  reg crab_rarest;
  reg haze_children;
  reg hp_lala;
  reg cuckoo_haze;
  reg victor_shuda;
  reg touch_gm;
  reg tango_ulysses;
  reg moron_ramone;
  reg neon_sortout;
  reg dragon_bonker;
  reg dopey_bacon;
  reg gm_grams;
  tri wiggum_curie;
  tri moulin_deuce;
  reg bfs_monster;
  tri cheese_sheep;
  tri sinew_gonzo;
  reg beef_crank;
  reg dadada_eel;
  reg kangaroo_bolt;
  reg rubik_centaur;
  reg usa_chillis;
  reg yak_stemcell;
  reg fallen_ohno;
  reg parrot_tinker;
  reg nest_nuclear;
  reg heidi_might;
  reg gerrit_remus;
  reg cuckoo_clay;
  reg maki_indigo;
  reg juliet_rod;
  reg lxtcen_alpha;
  reg stirfry_wine;
  reg monster_golf;
  reg holland_honda;
  reg brian_beavis;
  reg deng_questo;
  reg chicken_nail;
  reg midas_thankee;
  reg alpha_clay;
  reg honda_kang;
  reg stick_foryou;
  reg usa_stoner;
  reg yummy_newt;
  reg freaky_condit;


// State Mek alpha Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      alpha <= alpha_0;
    else
      case (alpha)
        alpha_0: begin
          if ({bravo,charlie,delta,echo} == 1)
            alpha <= alpha_5;
          else if ({bravo,charlie,delta,echo} == 10)
            alpha <= alpha_0;
          else
            alpha <= alpha_0;
          end
        alpha_1: begin
          if ({bravo,charlie,delta,echo} == 10)
            alpha <= alpha_3;
          else if ({bravo,charlie,delta,echo} == 7)
            alpha <= alpha_3;
          else if ({bravo,charlie,delta,echo} == 2)
            alpha <= alpha_0;
          else
            alpha <= alpha_1;
          end
        alpha_2: begin
          if ({bravo,charlie,delta,echo} == 3)
            alpha <= alpha_2;
          else if ({bravo,charlie,delta,echo} == 0)
            alpha <= alpha_4;
          else if ({bravo,charlie,delta,echo} == 15)
            alpha <= alpha_2;
          else
            alpha <= alpha_2;
          end
        alpha_3: begin
          if ({bravo,charlie,delta,echo} == 6)
            alpha <= alpha_1;
          else if ({bravo,charlie,delta,echo} == 8)
            alpha <= alpha_1;
          else
            alpha <= alpha_3;
          end
        alpha_4: begin
          if ({bravo,charlie,delta,echo} == 5)
            alpha <= alpha_1;
          else if ({bravo,charlie,delta,echo} == 11)
            alpha <= alpha_5;
          else if ({bravo,charlie,delta,echo} == 0)
            alpha <= alpha_2;
          else
            alpha <= alpha_4;
          end
        alpha_5: begin
          if ({bravo,charlie,delta,echo} == 3)
            alpha <= alpha_5;
          else if ({bravo,charlie,delta,echo} == 4)
            alpha <= alpha_5;
          else if ({bravo,charlie,delta,echo} == 9)
            alpha <= alpha_4;
          else
            alpha <= alpha_5;
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
            golf = 0;
            hotel = 0;
            india = 1;
            juliet = 1;
            kilo = 1;
            lima = 1;
            mike = 1;
          end
        alpha_1: begin
            foxtrot = 0;
            golf = 1;
            hotel = 0;
            india = 0;
            juliet = 0;
            kilo = 1;
            lima = 1;
            mike = 1;
          end
        alpha_2: begin
            foxtrot = 0;
            golf = 0;
            hotel = 0;
            india = 1;
            juliet = 0;
            kilo = 1;
            lima = 1;
            mike = 1;
          end
        default: begin
            foxtrot = 1;
            golf = 1;
            hotel = 1;
            india = 1;
            juliet = 1;
            kilo = 0;
            lima = 0;
            mike = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire romeo_out;
nut_001_lut #(3) nut_001_lut_inst_romeo (
  .din({november,oscar,papa}),
  .mask(8'b01000100),
  .out(romeo_out)
);

always @(romeo_out)
begin
   quebec = romeo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire victor_out;
nut_001_lut #(5) nut_001_lut_inst_victor (
  .din({gnd,sierra,vcc,tango,vcc}),
  .mask(32'b10001100000010101010000000100100),
  .out(victor_out)
);

always @(victor_out)
begin
   uniform = victor_out;
end

// 10 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {xray,yankee,zulu,bomb_pop,for_gregg,adbcensor,gojira,richard,yeanyow,rubik} <= 0;
    else if (whiskey)
      {xray,yankee,zulu,bomb_pop,for_gregg,adbcensor,gojira,richard,yeanyow,rubik} <= {xray,yankee,zulu,bomb_pop,for_gregg,adbcensor,gojira,richard,yeanyow,rubik} + 1;
    else
      {xray,yankee,zulu,bomb_pop,for_gregg,adbcensor,gojira,richard,yeanyow,rubik} <= {xray,yankee,zulu,bomb_pop,for_gregg,adbcensor,gojira,richard,yeanyow,rubik} - 1;
  end

// Ternary sign extend bait
always @(vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or cybex or babette or hanger or nail or vcc or tank or bullet or blue or badger or beetle or golf or
         gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or bolt or launcher or cannon or marker or green or gnd or bison or yankee or
         vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or vcc or hinge or lumber or mortar or mine or red or aphid or bear or vcc or bull)
  begin
    {cassowary,cat,chicken,cow,dog,donkey,dragon,duck,eagle,eel,elephant,emu,fish,frog,goat,hippo,iguana,jellyfish,kangaroo} = 
        {vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,cybex,babette,hanger,nail,vcc,tank,bullet,blue,badger,beetle,golf} +
        {gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,bolt,launcher,cannon,marker,green,gnd,bison,yankee} -
        {vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,vcc,hinge,lumber,mortar,mine,red,aphid,bear,vcc,bull};
  end


initial begin
    {mouse,newt,ostrich} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({gnd,lion,vcc} < {lizard,llama,monkey})
       {mouse,newt,ostrich} <= {lizard,llama,monkey};
    else
       {mouse,newt,ostrich} <= {gnd,lion,vcc};
  end

// 80 bit shift register
reg [79:0] otter;

initial begin
    otter = 0;
end

always @(posedge clock0)
begin
    otter <= (otter << 1) | penguin;
end

// shift taps every 4 bits
always @(otter)
begin
    pig = otter[79];
    platypus = otter[75];
    possum = otter[71];
    quail = otter[67];
    rat = otter[63];
    sheep = otter[59];
    tiger = otter[55];
    turtle = otter[51];
    unicorn = otter[47];
    vulture = otter[43];
    whale = otter[39];
    wolverine = otter[35];
    woodpecker = otter[31];
    xuprocar = otter[27];
    yak = otter[23];
    zebra = otter[19];
    shuda = otter[15];
    maklak = otter[11];
    bcdcensor = otter[7];
    safada = otter[3];
end

always @(gnd)
  begin
      ceecensor = !gnd;
  end

always @(bcdcensor)
  begin
      dfecensorc = !bcdcensor;
  end

always @(rat)
  begin
      saturn = !rat;
  end

always @(maklak)
  begin
      neon = !maklak;
  end

always @(vcc)
  begin
      loser = !vcc;
  end

always @(whale)
  begin
      turnip = !whale;
  end

always @(kilo)
  begin
      potato = !kilo;
  end

always @(fish)
  begin
      nuclear = !fish;
  end

always @(gnd)
  begin
      insurance = !gnd;
  end

always @(vcc)
  begin
      bathroom = !vcc;
  end

always @(turnip)
  begin
      popcorn = !turnip;
  end

always @(vcc)
  begin
      jimmyjames = !vcc;
  end

always @(bcdcensor)
  begin
      dr_zaius = !bcdcensor;
  end

always @(vcc)
  begin
      amadeus = !vcc;
  end

always @(foxtrot)
  begin
      whack = !foxtrot;
  end

always @(fish)
  begin
      jason = !fish;
  end

reg feedback_pt_0;

always @(dog or feedback_pt_0)
  begin
      funkadelic = !dog ^  feedback_pt_0;
  end

reg feedback_pt_1;

always @(vcc or feedback_pt_1)
  begin
      books =  vcc |  feedback_pt_1;
  end

reg feedback_pt_2;

always @(turtle or feedback_pt_2)
  begin
      cluckU =  turtle & !feedback_pt_2;
  end

reg feedback_pt_3;

always @(zebra or feedback_pt_3)
  begin
      togos =  zebra & !feedback_pt_3;
  end

reg feedback_pt_4;

always @(emu or feedback_pt_4)
  begin
      chiptrip = !emu & !feedback_pt_4;
  end

reg feedback_pt_5;

always @(yeanyow or feedback_pt_5)
  begin
      what = !yeanyow & !feedback_pt_5;
  end

reg feedback_pt_6;

always @(eagle or feedback_pt_6)
  begin
      would = !eagle ^  feedback_pt_6;
  end

reg feedback_pt_7;

always @(unicorn or feedback_pt_7)
  begin
      brian = !unicorn & !feedback_pt_7;
  end

reg feedback_pt_8;

always @(xray or feedback_pt_8)
  begin
      boitano =  xray ^  feedback_pt_8;
  end

reg feedback_pt_9;

always @(gnd or feedback_pt_9)
  begin
      due = !gnd & !feedback_pt_9;
  end

reg feedback_pt_10;

always @(would or feedback_pt_10)
  begin
      genesis =  would & !feedback_pt_10;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_deuteronomy.v
///////////////////////////////////////////

wire  nut_001_deuteronomy_inst0_ceres, nut_001_deuteronomy_inst0_moulin, nut_001_deuteronomy_inst0_rouge,
     nut_001_deuteronomy_inst0_cellphone, nut_001_deuteronomy_inst0_mortgate, nut_001_deuteronomy_inst0_stapler, nut_001_deuteronomy_inst0_sneezy,
     nut_001_deuteronomy_inst0_happy, nut_001_deuteronomy_inst0_grumpy, nut_001_deuteronomy_inst0_bashful;

nut_001_deuteronomy nut_001_deuteronomy_inst0 (

    //inputs
     .leviticus(cat), .xterm(gnd), .numbers(vcc), .noah(lima),
     .bagel(gnd), .english(mouse), .muffin(cat), .holepunch(insurance), .metal(vcc),
     .dork(vcc), .autotest(nuclear), .picture(amadeus), .sleepy(gnd), .dopey(vcc),

    //outputs
     .ceres(nut_001_deuteronomy_inst0_ceres), .moulin(nut_001_deuteronomy_inst0_moulin),
     .rouge(nut_001_deuteronomy_inst0_rouge), .cellphone(nut_001_deuteronomy_inst0_cellphone), .mortgate(nut_001_deuteronomy_inst0_mortgate),
     .stapler(nut_001_deuteronomy_inst0_stapler), .sneezy(nut_001_deuteronomy_inst0_sneezy), .happy(nut_001_deuteronomy_inst0_happy),
     .grumpy(nut_001_deuteronomy_inst0_grumpy), .bashful(nut_001_deuteronomy_inst0_bashful),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   doc = nut_001_deuteronomy_inst0_ceres;
   donald = nut_001_deuteronomy_inst0_moulin;
   mickey = nut_001_deuteronomy_inst0_rouge;
   minnie = nut_001_deuteronomy_inst0_cellphone;
   spock = nut_001_deuteronomy_inst0_mortgate;
   goofy = nut_001_deuteronomy_inst0_stapler;
   gyro = nut_001_deuteronomy_inst0_sneezy;
   scrooge = nut_001_deuteronomy_inst0_happy;
   huey = nut_001_deuteronomy_inst0_grumpy;
   duey = nut_001_deuteronomy_inst0_bashful;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_deuteronomy.v
///////////////////////////////////////////

wire  nut_001_deuteronomy_inst1_ceres, nut_001_deuteronomy_inst1_moulin, nut_001_deuteronomy_inst1_rouge,
     nut_001_deuteronomy_inst1_cellphone, nut_001_deuteronomy_inst1_mortgate, nut_001_deuteronomy_inst1_stapler, nut_001_deuteronomy_inst1_sneezy,
     nut_001_deuteronomy_inst1_happy, nut_001_deuteronomy_inst1_grumpy, nut_001_deuteronomy_inst1_bashful;

nut_001_deuteronomy nut_001_deuteronomy_inst1 (

    //inputs
     .leviticus(gnd), .xterm(kangaroo), .numbers(jellyfish), .noah(bathroom),
     .bagel(scrooge), .english(potato), .muffin(lima), .holepunch(due), .metal(gyro),
     .dork(woodpecker), .autotest(juliet), .picture(vcc), .sleepy(vcc), .dopey(shuda),

    //outputs
     .ceres(nut_001_deuteronomy_inst1_ceres), .moulin(nut_001_deuteronomy_inst1_moulin),
     .rouge(nut_001_deuteronomy_inst1_rouge), .cellphone(nut_001_deuteronomy_inst1_cellphone), .mortgate(nut_001_deuteronomy_inst1_mortgate),
     .stapler(nut_001_deuteronomy_inst1_stapler), .sneezy(nut_001_deuteronomy_inst1_sneezy), .happy(nut_001_deuteronomy_inst1_happy),
     .grumpy(nut_001_deuteronomy_inst1_grumpy), .bashful(nut_001_deuteronomy_inst1_bashful),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   louie = nut_001_deuteronomy_inst1_ceres;
   jiminy = nut_001_deuteronomy_inst1_moulin;
   cinderella = nut_001_deuteronomy_inst1_rouge;
   sleeping = nut_001_deuteronomy_inst1_cellphone;
   beauty = nut_001_deuteronomy_inst1_mortgate;
   superman = nut_001_deuteronomy_inst1_stapler;
   batman = nut_001_deuteronomy_inst1_sneezy;
   wonder = nut_001_deuteronomy_inst1_happy;
   woman = nut_001_deuteronomy_inst1_grumpy;
   hulk = nut_001_deuteronomy_inst1_bashful;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_deuteronomy.v
///////////////////////////////////////////

wire  nut_001_deuteronomy_inst2_ceres, nut_001_deuteronomy_inst2_moulin, nut_001_deuteronomy_inst2_rouge,
     nut_001_deuteronomy_inst2_cellphone, nut_001_deuteronomy_inst2_mortgate, nut_001_deuteronomy_inst2_stapler, nut_001_deuteronomy_inst2_sneezy,
     nut_001_deuteronomy_inst2_happy, nut_001_deuteronomy_inst2_grumpy, nut_001_deuteronomy_inst2_bashful;

nut_001_deuteronomy nut_001_deuteronomy_inst2 (

    //inputs
     .leviticus(wonder), .xterm(cinderella), .numbers(quail), .noah(rat),
     .bagel(whack), .english(mike), .muffin(eagle), .holepunch(pig), .metal(vcc),
     .dork(rubik), .autotest(dfecensorc), .picture(hotel), .sleepy(gnd), .dopey(jason),

    //outputs
     .ceres(nut_001_deuteronomy_inst2_ceres), .moulin(nut_001_deuteronomy_inst2_moulin),
     .rouge(nut_001_deuteronomy_inst2_rouge), .cellphone(nut_001_deuteronomy_inst2_cellphone), .mortgate(nut_001_deuteronomy_inst2_mortgate),
     .stapler(nut_001_deuteronomy_inst2_stapler), .sneezy(nut_001_deuteronomy_inst2_sneezy), .happy(nut_001_deuteronomy_inst2_happy),
     .grumpy(nut_001_deuteronomy_inst2_grumpy), .bashful(nut_001_deuteronomy_inst2_bashful),

    //control
    .clock0(clock0), .clock1(clock1), .reset0(reset0), .reset1(reset1)
);

always @(*)
begin
   lantern = nut_001_deuteronomy_inst2_ceres;
   riddler = nut_001_deuteronomy_inst2_moulin;
   joker = nut_001_deuteronomy_inst2_rouge;
   luthor = nut_001_deuteronomy_inst2_cellphone;
   hercules = nut_001_deuteronomy_inst2_mortgate;
   ajax = nut_001_deuteronomy_inst2_stapler;
   achilles = nut_001_deuteronomy_inst2_sneezy;
   hector = nut_001_deuteronomy_inst2_happy;
   ulysses = nut_001_deuteronomy_inst2_grumpy;
   agamemnon = nut_001_deuteronomy_inst2_bashful;
end

wire bambi_outwire, pocahontas_outwire;
carry_sum aladdin (.sin(vcc),.cin(vcc),.sout(bambi_outwire),.cout(pocahontas_outwire));

always @(bambi_outwire or pocahontas_outwire)
begin
  bambi = bambi_outwire;
  pocahontas = pocahontas_outwire;
end

wire buddha_outwire, dali_llama_outwire;
carry_sum jesus (.sin(duck),.cin(quail),.sout(buddha_outwire),.cout(dali_llama_outwire));

always @(buddha_outwire or dali_llama_outwire)
begin
  buddha = buddha_outwire;
  dali_llama = dali_llama_outwire;
end

wire bush_outwire;
lcell clinton (vcc,bush_outwire);

always @(bush_outwire)
begin
  bush = bush_outwire;
end

wire hamburger_outwire, hotdog_outwire;
carry_sum washington (.sin(pocahontas),.cin(gnd),.sout(hamburger_outwire),.cout(hotdog_outwire));

always @(hamburger_outwire or hotdog_outwire)
begin
  hamburger = hamburger_outwire;
  hotdog = hotdog_outwire;
end

wire klinton_outwire;
cascade drdeath (vcc,klinton_outwire);

always @(klinton_outwire)
begin
  klinton = klinton_outwire;
end

reg feedback_pt_11;

always @(vcc or feedback_pt_11)
  begin
      kang = !vcc ^  feedback_pt_11;
  end

reg feedback_pt_12;

always @(gnd or feedback_pt_12)
  begin
      water =  gnd & !feedback_pt_12;
  end

reg feedback_pt_13;

always @(doc or feedback_pt_13)
  begin
      air = !doc ^  feedback_pt_13;
  end

reg feedback_pt_14;

always @(hotel or feedback_pt_14)
  begin
      fire = !hotel | !feedback_pt_14;
  end

reg feedback_pt_15;

always @(batman or feedback_pt_15)
  begin
      magicwand =  batman ^ !feedback_pt_15;
  end

reg feedback_pt_16;

always @(ostrich or feedback_pt_16)
  begin
      beavis = !ostrich ^ !feedback_pt_16;
  end

reg feedback_pt_17;

always @(gnd or feedback_pt_17)
  begin
      butthead =  gnd ^ !feedback_pt_17;
  end

reg feedback_pt_18;

always @(vcc or feedback_pt_18)
  begin
      homer = !vcc | !feedback_pt_18;
  end

reg feedback_pt_19;

always @(vcc or feedback_pt_19)
  begin
      barty =  vcc |  feedback_pt_19;
  end

reg feedback_pt_20;

always @(hamburger or feedback_pt_20)
  begin
      cartman = !hamburger &  feedback_pt_20;
  end

reg feedback_pt_21;

always @(vcc or feedback_pt_21)
  begin
      sand = !vcc &  feedback_pt_21;
  end

reg feedback_pt_22;

always @(loser or feedback_pt_22)
  begin
      hours = !loser ^ !feedback_pt_22;
  end

reg feedback_pt_23;

always @(buddha or feedback_pt_23)
  begin
      lamer =  buddha ^ !feedback_pt_23;
  end

reg feedback_pt_24;

always @(richard or feedback_pt_24)
  begin
      hoser =  richard |  feedback_pt_24;
  end

reg feedback_pt_25;

always @(vcc or feedback_pt_25)
  begin
      dweebie = !vcc |  feedback_pt_25;
  end

reg feedback_pt_26;

always @(gnd or feedback_pt_26)
  begin
      motorhead = !gnd & !feedback_pt_26;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burnout <= 1;
    else
      burnout <= eagle;
  end

always @(burnout)
  begin
      feedback_pt_0 = burnout;
  end

always @(burnout)
  begin
      feedback_pt_1 = burnout;
  end

always @(burnout)
  begin
      feedback_pt_2 = burnout;
  end

always @(burnout)
  begin
      feedback_pt_3 = burnout;
  end

always @(burnout)
  begin
      feedback_pt_4 = burnout;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacques <= 0;
    else
      jacques <= huey;
  end

always @(jacques)
  begin
      feedback_pt_5 = jacques;
  end

always @(jacques)
  begin
      feedback_pt_6 = jacques;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pdiddy <= 0;
    else if (barty)
      pdiddy <= 0;
    else if (buddha)
      pdiddy <= hulk;
  end

always @(pdiddy)
  begin
      feedback_pt_7 = pdiddy;
  end

always @(pdiddy)
  begin
      feedback_pt_8 = pdiddy;
  end

always @(pdiddy)
  begin
      feedback_pt_9 = pdiddy;
  end

always @(pdiddy)
  begin
      feedback_pt_10 = pdiddy;
  end

always @(pdiddy)
  begin
      feedback_pt_11 = pdiddy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pdaddy <= 0;
    else
      pdaddy <= cat;
  end

always @(pdaddy)
  begin
      feedback_pt_12 = pdaddy;
  end

always @(pdaddy)
  begin
      feedback_pt_13 = pdaddy;
  end

always @(pdaddy)
  begin
      feedback_pt_14 = pdaddy;
  end

always @(pdaddy)
  begin
      feedback_pt_15 = pdaddy;
  end

always @(pdaddy)
  begin
      feedback_pt_16 = pdaddy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dorkus <= 0;
    else if (quebec)
      dorkus <= chiptrip;
  end

always @(dorkus)
  begin
      feedback_pt_17 = dorkus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drunken <= 0;
    else if (turnip)
      drunken <= 0;
    else if (riddler)
      drunken <= vcc;
  end

always @(drunken)
  begin
      feedback_pt_18 = drunken;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      master <= 0;
    else
      master <= lamer;
  end

always @(master)
  begin
      feedback_pt_19 = master;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flew <= 0;
    else if (loser)
      flew <= 0;
    else if (joker)
      flew <= uniform;
  end

always @(flew)
  begin
      feedback_pt_20 = flew;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      over <= 0;
    else if (gnd)
      over <= vcc;
    else if (dorkus)
      over <= 0;
  end

always @(over)
  begin
      feedback_pt_21 = over;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cuckoo <= 1;
    else
      cuckoo <= donkey;
  end

always @(cuckoo)
  begin
      feedback_pt_22 = cuckoo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nest <= 0;
    else if (dragon)
      nest <= cat;
  end

always @(nest)
  begin
      feedback_pt_23 = nest;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      starwars <= 0;
    else if (jacques)
      starwars <= what;
    else if (gnd)
      starwars <= 0;
  end

always @(starwars)
  begin
      feedback_pt_24 = starwars;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yoda <= 0;
    else
      yoda <= fire;
  end

always @(yoda)
  begin
      feedback_pt_25 = yoda;
  end

wire obiwan_wire;

dffeas obiwan_ff (
  .clk(clock0),
  .d(whale),
  .ena(boitano),
  .sclr(vcc),
  .sload(vcc),
  .asdata(motorhead),
  .clrn(!reset0),
  .q(obiwan_wire)
);

always @(obiwan_wire) begin
   vadar = obiwan_wire;
end

always @(vadar)
  begin
      feedback_pt_26 = vadar;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skywalker <= 1;
    else
      skywalker <= amadeus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      north <= 0;
    else if (ceecensor)
      north <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      southern <= 0;
    else if (boitano)
      southern <= sheep;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      east <= 0;
    else
      east <= bush;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      west <= 0;
    else if (ostrich)
      west <= gnd;
    else if (bomb_pop)
      west <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      porfavor <= 0;
    else if (klinton)
      porfavor <= sheep;
    else if (gnd)
      porfavor <= 0;
  end

wire cuanto_wire;

dffeas cuanto_ff (
  .clk(clock0),
  .d(east),
  .ena(gnd),
  .sclr(sleeping),
  .sload(gnd),
  .asdata(beavis),
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
    else if (fish)
      pantalones <= bomb_pop;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rojas <= 0;
    else if (vcc)
      rojas <= 0;
    else if (porfavor)
      rojas <= popcorn;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      popacap <= 0;
    else if (hercules)
      popacap <= vcc;
    else if (gnd)
      popacap <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pizza <= 1;
    else
      pizza <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mushroom <= 0;
    else if (vcc)
      mushroom <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cheese <= 0;
    else if (bush)
      cheese <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mcnugget <= 0;
    else if (elephant)
      mcnugget <= 0;
    else if (gnd)
      mcnugget <= iguana;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      werewolf <= 0;
    else if (jimmyjames)
      werewolf <= 0;
    else if (vcc)
      werewolf <= frog;
  end

wire spirit_wire;

dffeas spirit_ff (
  .clk(clock0),
  .d(sand),
  .ena(rubik),
  .sclr(doc),
  .sload(pizza),
  .asdata(magicwand),
  .clrn(!reset0),
  .q(spirit_wire)
);

always @(spirit_wire) begin
   vampire = spirit_wire;
end

reg feedback_pt_27;

always @(louie or feedback_pt_27)
  begin
      pyro =  louie & !feedback_pt_27;
  end

reg feedback_pt_28;

always @(cuckoo or feedback_pt_28)
  begin
      criminal =  cuckoo ^  feedback_pt_28;
  end

reg feedback_pt_29;

always @(newt or feedback_pt_29)
  begin
      orange = !newt | !feedback_pt_29;
  end

reg feedback_pt_30;

always @(gnd or feedback_pt_30)
  begin
      purple = !gnd | !feedback_pt_30;
  end

reg feedback_pt_31;

always @(brian or feedback_pt_31)
  begin
      yellow = !brian |  feedback_pt_31;
  end

reg feedback_pt_32;

always @(cheese or feedback_pt_32)
  begin
      clay = !cheese ^ !feedback_pt_32;
  end

reg feedback_pt_33;

always @(kilo or feedback_pt_33)
  begin
      paper =  kilo & !feedback_pt_33;
  end

reg feedback_pt_34;

always @(wolverine or feedback_pt_34)
  begin
      crayons =  wolverine &  feedback_pt_34;
  end

reg feedback_pt_35;

always @(vcc or feedback_pt_35)
  begin
      indigo =  vcc | !feedback_pt_35;
  end

reg feedback_pt_36;

always @(boitano or feedback_pt_36)
  begin
      kmfdm =  boitano &  feedback_pt_36;
  end

reg feedback_pt_37;

always @(goofy or feedback_pt_37)
  begin
      pentium = !goofy ^  feedback_pt_37;
  end

reg feedback_pt_38;

always @(spock or feedback_pt_38)
  begin
      bubba =  spock |  feedback_pt_38;
  end

reg feedback_pt_39;

always @(vcc or feedback_pt_39)
  begin
      ohno =  vcc & !feedback_pt_39;
  end

reg feedback_pt_40;

always @(ulysses or feedback_pt_40)
  begin
      fallen =  ulysses | !feedback_pt_40;
  end

reg feedback_pt_41;

always @(water or feedback_pt_41)
  begin
      comrade = !water ^  feedback_pt_41;
  end

reg feedback_pt_42;

always @(hotdog or feedback_pt_42)
  begin
      chairman = !hotdog &  feedback_pt_42;
  end

reg feedback_pt_43;

always @(vcc or feedback_pt_43)
  begin
      biker = !vcc &  feedback_pt_43;
  end

///////////////////////////////////////////
// Verilog ROM subdesign in nut_001_rom_tattoo.v
///////////////////////////////////////////

wire [1-1:0] knot_out;
nut_001_rom_tattoo knot (
  .clock(clock0),
  .read_addr({pentium,homer,gnd,gnd,rojas,iguana,butthead,saturn,vcc,popacap,goat,neon}),
  .q(knot_out)
);

//defparam knot.MIF_NAME="nut_001_tattoo.mif";
defparam knot.DATA_WIDTH=1;
defparam knot.ADDR_WIDTH=12;

always @(knot_out)
begin
   {kanji} = knot_out;
end

// Random combinatorial logic block
always@(*)
  begin
      bellybutton = ~( homer );
  end

  always@(*)
  begin
    whammy = ~( ( ~( ~( ~clay ) | skywalker | ~genesis ) ) ) ^ ~( ~platypus ) ^ ~( ~( ( ~( ~( ~gnd ) ^ ~( drunken ) ) ) ) ) ? ~( ~cassowary ) : ~( ( ~( ( ~( ( zulu & north ) ) & ( ~( ( ~( gnd & hippo ) ) & ( air ^ ~over ) ) ) ) ^ ( ~( ~( ~( southern ) ) | ~( ~( jimmyjames ) ) ) ) ) ) );
  end
// State Mek deathguild Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deathguild <= deathguild_0;
    else
      case (deathguild)
        deathguild_0: begin
          if ({pdaddy,mickey,woman,ohno} == 1)
            deathguild <= deathguild_7;
          else
            deathguild <= deathguild_0;
          end
        deathguild_1: begin
          if ({pdaddy,mickey,woman,ohno} == 8)
            deathguild <= deathguild_7;
          else if ({pdaddy,mickey,woman,ohno} == 12)
            deathguild <= deathguild_2;
          else if ({pdaddy,mickey,woman,ohno} == 4)
            deathguild <= deathguild_10;
          else if ({pdaddy,mickey,woman,ohno} == 15)
            deathguild <= deathguild_6;
          else if ({pdaddy,mickey,woman,ohno} == 11)
            deathguild <= deathguild_5;
          else if ({pdaddy,mickey,woman,ohno} == 14)
            deathguild <= deathguild_6;
          else
            deathguild <= deathguild_1;
          end
        deathguild_2: begin
          if ({pdaddy,mickey,woman,ohno} == 9)
            deathguild <= deathguild_1;
          else if ({pdaddy,mickey,woman,ohno} == 5)
            deathguild <= deathguild_5;
          else if ({pdaddy,mickey,woman,ohno} == 13)
            deathguild <= deathguild_1;
          else
            deathguild <= deathguild_2;
          end
        deathguild_3: begin
          if ({pdaddy,mickey,woman,ohno} == 14)
            deathguild <= deathguild_1;
          else
            deathguild <= deathguild_3;
          end
        deathguild_4: begin
          if ({pdaddy,mickey,woman,ohno} == 9)
            deathguild <= deathguild_6;
          else if ({pdaddy,mickey,woman,ohno} == 8)
            deathguild <= deathguild_0;
          else
            deathguild <= deathguild_4;
          end
        deathguild_5: begin
          if ({pdaddy,mickey,woman,ohno} == 7)
            deathguild <= deathguild_4;
          else if ({pdaddy,mickey,woman,ohno} == 5)
            deathguild <= deathguild_9;
          else
            deathguild <= deathguild_5;
          end
        deathguild_6: begin
          if ({pdaddy,mickey,woman,ohno} == 1)
            deathguild <= deathguild_0;
          else if ({pdaddy,mickey,woman,ohno} == 12)
            deathguild <= deathguild_0;
          else
            deathguild <= deathguild_6;
          end
        deathguild_7: begin
          if ({pdaddy,mickey,woman,ohno} == 0)
            deathguild <= deathguild_8;
          else if ({pdaddy,mickey,woman,ohno} == 7)
            deathguild <= deathguild_10;
          else if ({pdaddy,mickey,woman,ohno} == 3)
            deathguild <= deathguild_3;
          else if ({pdaddy,mickey,woman,ohno} == 1)
            deathguild <= deathguild_4;
          else if ({pdaddy,mickey,woman,ohno} == 6)
            deathguild <= deathguild_4;
          else
            deathguild <= deathguild_7;
          end
        deathguild_8: begin
          if ({pdaddy,mickey,woman,ohno} == 15)
            deathguild <= deathguild_8;
          else if ({pdaddy,mickey,woman,ohno} == 7)
            deathguild <= deathguild_10;
          else
            deathguild <= deathguild_8;
          end
        deathguild_9: begin
          if ({pdaddy,mickey,woman,ohno} == 13)
            deathguild <= deathguild_2;
          else if ({pdaddy,mickey,woman,ohno} == 3)
            deathguild <= deathguild_4;
          else if ({pdaddy,mickey,woman,ohno} == 12)
            deathguild <= deathguild_10;
          else if ({pdaddy,mickey,woman,ohno} == 10)
            deathguild <= deathguild_6;
          else
            deathguild <= deathguild_9;
          end
        deathguild_10: begin
          if ({pdaddy,mickey,woman,ohno} == 7)
            deathguild <= deathguild_11;
          else if ({pdaddy,mickey,woman,ohno} == 13)
            deathguild <= deathguild_5;
          else
            deathguild <= deathguild_10;
          end
        deathguild_11: begin
          if ({pdaddy,mickey,woman,ohno} == 0)
            deathguild <= deathguild_10;
          else if ({pdaddy,mickey,woman,ohno} == 15)
            deathguild <= deathguild_7;
          else
            deathguild <= deathguild_11;
          end
        default: deathguild <= deathguild_0;
      endcase
  end

// State Mek deathguild Output logic
always @(deathguild)
  begin
    // consider all state regs when doing outputs
    case (deathguild)
        deathguild_0: begin
            maritime = 1;
            surfer = 0;
            moron = 1;
            iterate = 0;
            elkarchmero = 1;
            elguapo = 1;
            senorduck = 1;
            firstpart = 1;
            leidiot = 0;
            kidnapper = 1;
            ring = 1;
            think = 0;
            firewiggle = 1;
            bracket = 1;
          end
        deathguild_1: begin
            maritime = 0;
            surfer = 0;
            moron = 0;
            iterate = 1;
            elkarchmero = 1;
            elguapo = 0;
            senorduck = 0;
            firstpart = 0;
            leidiot = 0;
            kidnapper = 0;
            ring = 0;
            think = 0;
            firewiggle = 1;
            bracket = 0;
          end
        deathguild_2: begin
            maritime = 1;
            surfer = 0;
            moron = 1;
            iterate = 0;
            elkarchmero = 1;
            elguapo = 1;
            senorduck = 1;
            firstpart = 1;
            leidiot = 0;
            kidnapper = 1;
            ring = 0;
            think = 1;
            firewiggle = 1;
            bracket = 0;
          end
        deathguild_3: begin
            maritime = 0;
            surfer = 0;
            moron = 1;
            iterate = 1;
            elkarchmero = 0;
            elguapo = 1;
            senorduck = 1;
            firstpart = 0;
            leidiot = 1;
            kidnapper = 1;
            ring = 1;
            think = 0;
            firewiggle = 1;
            bracket = 0;
          end
        deathguild_4: begin
            maritime = 0;
            surfer = 1;
            moron = 1;
            iterate = 1;
            elkarchmero = 1;
            elguapo = 1;
            senorduck = 0;
            firstpart = 0;
            leidiot = 1;
            kidnapper = 0;
            ring = 1;
            think = 0;
            firewiggle = 1;
            bracket = 0;
          end
        deathguild_5: begin
            maritime = 1;
            surfer = 0;
            moron = 1;
            iterate = 0;
            elkarchmero = 0;
            elguapo = 0;
            senorduck = 0;
            firstpart = 0;
            leidiot = 1;
            kidnapper = 0;
            ring = 1;
            think = 0;
            firewiggle = 0;
            bracket = 0;
          end
        deathguild_6: begin
            maritime = 0;
            surfer = 1;
            moron = 0;
            iterate = 1;
            elkarchmero = 1;
            elguapo = 1;
            senorduck = 1;
            firstpart = 1;
            leidiot = 1;
            kidnapper = 0;
            ring = 1;
            think = 0;
            firewiggle = 0;
            bracket = 1;
          end
        deathguild_7: begin
            maritime = 1;
            surfer = 1;
            moron = 0;
            iterate = 1;
            elkarchmero = 0;
            elguapo = 1;
            senorduck = 0;
            firstpart = 1;
            leidiot = 0;
            kidnapper = 0;
            ring = 0;
            think = 0;
            firewiggle = 1;
            bracket = 0;
          end
        deathguild_8: begin
            maritime = 1;
            surfer = 0;
            moron = 0;
            iterate = 0;
            elkarchmero = 0;
            elguapo = 1;
            senorduck = 0;
            firstpart = 1;
            leidiot = 1;
            kidnapper = 1;
            ring = 0;
            think = 0;
            firewiggle = 0;
            bracket = 1;
          end
        deathguild_9: begin
            maritime = 1;
            surfer = 1;
            moron = 0;
            iterate = 1;
            elkarchmero = 0;
            elguapo = 1;
            senorduck = 0;
            firstpart = 0;
            leidiot = 1;
            kidnapper = 1;
            ring = 0;
            think = 0;
            firewiggle = 0;
            bracket = 0;
          end
        deathguild_10: begin
            maritime = 0;
            surfer = 1;
            moron = 1;
            iterate = 0;
            elkarchmero = 0;
            elguapo = 1;
            senorduck = 1;
            firstpart = 1;
            leidiot = 0;
            kidnapper = 0;
            ring = 1;
            think = 0;
            firewiggle = 0;
            bracket = 1;
          end
        deathguild_11: begin
            maritime = 1;
            surfer = 1;
            moron = 0;
            iterate = 1;
            elkarchmero = 0;
            elguapo = 1;
            senorduck = 1;
            firstpart = 0;
            leidiot = 0;
            kidnapper = 1;
            ring = 0;
            think = 0;
            firewiggle = 1;
            bracket = 1;
          end
        default: begin
            maritime = 1;
            surfer = 0;
            moron = 1;
            iterate = 0;
            elkarchmero = 0;
            elguapo = 1;
            senorduck = 0;
            firstpart = 0;
            leidiot = 1;
            kidnapper = 0;
            ring = 0;
            think = 0;
            firewiggle = 0;
            bracket = 1;
          end
      endcase
  end

always @(maritime)
  begin
      feedback_pt_27 = maritime;
  end

always @(maritime)
  begin
      feedback_pt_28 = maritime;
  end

always @(maritime)
  begin
      feedback_pt_29 = maritime;
  end

always @(surfer)
  begin
      feedback_pt_30 = surfer;
  end

always @(surfer)
  begin
      feedback_pt_31 = surfer;
  end

always @(surfer)
  begin
      feedback_pt_32 = surfer;
  end

always @(surfer)
  begin
      feedback_pt_33 = surfer;
  end

always @(surfer)
  begin
      feedback_pt_34 = surfer;
  end

always @(moron)
  begin
      feedback_pt_35 = moron;
  end

always @(iterate)
  begin
      feedback_pt_36 = iterate;
  end

always @(elkarchmero)
  begin
      feedback_pt_37 = elkarchmero;
  end

always @(elguapo)
  begin
      feedback_pt_38 = elguapo;
  end

always @(senorduck)
  begin
      feedback_pt_39 = senorduck;
  end

always @(firstpart)
  begin
      feedback_pt_40 = firstpart;
  end

always @(leidiot)
  begin
      feedback_pt_41 = leidiot;
  end

always @(kidnapper)
  begin
      feedback_pt_42 = kidnapper;
  end

always @(ring)
  begin
      feedback_pt_43 = ring;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire shudamak_out;
nut_001_lut #(5) nut_001_lut_inst_shudamak (
  .din({vcc,hamburger,vcc,gojira,gnd}),
  .mask(32'h65d07e95),
  .out(shudamak_out)
);

always @(shudamak_out)
begin
   probably = shudamak_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire wannabe_out;
nut_001_lut #(5) nut_001_lut_inst_wannabe (
  .din({gnd,gnd,ring,yankee,gnd}),
  .mask(32'hf4818713),
  .out(wannabe_out)
);

always @(wannabe_out)
begin
   callme = wannabe_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire emails_out;
nut_001_lut #(3) nut_001_lut_inst_emails (
  .din({west,pdaddy,firstpart}),
  .mask(8'b11000000),
  .out(emails_out)
);

always @(emails_out)
begin
   fuji = emails_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire conference_out;
nut_001_lut #(5) nut_001_lut_inst_conference (
  .din({gnd,brian,whammy,hoser,zulu}),
  .mask(32'b00000101100100000011000010110011),
  .out(conference_out)
);

always @(conference_out)
begin
   dadada = conference_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire workhere_out;
nut_001_lut #(5) nut_001_lut_inst_workhere (
  .din({gnd,cheese,ceecensor,vcc,batman}),
  .mask(32'b00100010100000000000000101000010),
  .out(workhere_out)
);

always @(workhere_out)
begin
   parrot = workhere_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire facetious_out;
nut_001_lut #(2) nut_001_lut_inst_facetious (
  .din({dali_llama,frog}),
  .mask(4'b0000),
  .out(facetious_out)
);

always @(facetious_out)
begin
   onthepc = facetious_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire rafting_out;
nut_001_lut #(3) nut_001_lut_inst_rafting (
  .din({nest,fallen,gnd}),
  .mask(8'b00000000),
  .out(rafting_out)
);

always @(rafting_out)
begin
   mariollama = rafting_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire davidlin_out;
nut_001_lut #(3) nut_001_lut_inst_davidlin (
  .din({beauty,leidiot,agamemnon}),
  .mask(8'b01100000),
  .out(davidlin_out)
);

always @(davidlin_out)
begin
   freaky = davidlin_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire pirate_out;
nut_001_lut #(3) nut_001_lut_inst_pirate (
  .din({orange,joker,fuji}),
  .mask(8'b00010100),
  .out(pirate_out)
);

always @(pirate_out)
begin
   blueled = pirate_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire marquis_out;
nut_001_lut #(2) nut_001_lut_inst_marquis (
  .din({west,crayons}),
  .mask(4'b0100),
  .out(marquis_out)
);

always @(marquis_out)
begin
   prison = marquis_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire baron_out;
nut_001_lut #(3) nut_001_lut_inst_baron (
  .din({vcc,dweebie,freaky}),
  .mask(8'h4d),
  .out(baron_out)
);

always @(baron_out)
begin
   desade = baron_out;
end


initial begin
    {vonmunchhausen,boots,narcotics,cocaine} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({eel,pdiddy,yoda,rojas} < {gnd,fallen,minnie,possum})
       {vonmunchhausen,boots,narcotics,cocaine} <= {gnd,fallen,minnie,possum};
    else
       {vonmunchhausen,boots,narcotics,cocaine} <= {eel,pdiddy,yoda,rojas};
  end

// 3 bit up counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {contractor,doobie,float} <= 0;
    else
      {contractor,doobie,float} <= {contractor,doobie,float} + 1;
  end

// XNOR all of these bits together
always @(hours or chairman or onthepc or callme or gnd or jason or elkarchmero or joker or gnd)
  begin
      budlite = ~^ {hours,chairman,onthepc,callme,gnd,jason,elkarchmero,joker,gnd};
  end

// 6 bit SOP selector
always @(
        gnd or parrot  or 
        contractor or vcc  or 
        would or float  or 
        bellybutton or possum  or 
        vcc or kanji  or 
        vcc or xuprocar 
)

begin
    morenames = 
      gnd & parrot |
      contractor & vcc |
      would & float |
      bellybutton & possum |
      vcc & kanji |
      vcc & xuprocar;
end

// NAND all of these bits together
always @(chicken or batman or burnout or cow)
  begin
      mrbill = ~& {chicken,batman,burnout,cow};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dutch <= 0;
    else
    case ({flew,gnd})
       0 : dutch <= dutch;
       1 : dutch <= dutch;
       2 : dutch <= gnd;
       3 : dutch <= mickey;
       default : dutch <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      candle <= 0;
    else
    case ({orange,biker})
       0 : candle <= candle;
       1 : candle <= candle;
       2 : candle <= beavis;
       3 : candle <= candle;
       default : candle <= 0;
    endcase
  end

reg feedback_pt_44;

always @(gnd or feedback_pt_44)
  begin
      spyro = !gnd |  feedback_pt_44;
  end

reg feedback_pt_45;

always @(ceecensor or feedback_pt_45)
  begin
      speedyg = !ceecensor & !feedback_pt_45;
  end

reg feedback_pt_46;

always @(fire or feedback_pt_46)
  begin
      kennyg = !fire & !feedback_pt_46;
  end

reg feedback_pt_47;

always @(candle or feedback_pt_47)
  begin
      johndenver = !candle ^  feedback_pt_47;
  end

reg feedback_pt_48;

always @(vcc or feedback_pt_48)
  begin
      jacklemon =  vcc ^  feedback_pt_48;
  end

reg feedback_pt_49;

always @(gnd or feedback_pt_49)
  begin
      theonion = !gnd & !feedback_pt_49;
  end

reg feedback_pt_50;

always @(pantalones or feedback_pt_50)
  begin
      chatanooga =  pantalones ^ !feedback_pt_50;
  end

reg feedback_pt_51;

always @(prison or feedback_pt_51)
  begin
      kebab =  prison | !feedback_pt_51;
  end

reg feedback_pt_52;

always @(mrbill or feedback_pt_52)
  begin
      kabar = !mrbill ^ !feedback_pt_52;
  end

reg feedback_pt_53;

always @(gnd or feedback_pt_53)
  begin
      fullmetal =  gnd ^ !feedback_pt_53;
  end

reg feedback_pt_54;

always @(vcc or feedback_pt_54)
  begin
      aluminum = !vcc & !feedback_pt_54;
  end

reg feedback_pt_55;

always @(loser or feedback_pt_55)
  begin
      copper = !loser &  feedback_pt_55;
  end

reg feedback_pt_56;

always @(desade or feedback_pt_56)
  begin
      zinc = !desade ^  feedback_pt_56;
  end

reg feedback_pt_57;

always @(freaky or feedback_pt_57)
  begin
      platinum = !freaky ^  feedback_pt_57;
  end

reg feedback_pt_58;

always @(vampire or feedback_pt_58)
  begin
      tin = !vampire |  feedback_pt_58;
  end

reg feedback_pt_59;

always @(vcc or feedback_pt_59)
  begin
      iron = !vcc &  feedback_pt_59;
  end

reg feedback_pt_60;

always @(kabar or feedback_pt_60)
  begin
      fascist = !kabar |  feedback_pt_60;
  end

reg feedback_pt_61;

always @(budlite or feedback_pt_61)
  begin
      anarchist =  budlite | !feedback_pt_61;
  end

reg feedback_pt_62;

always @(minnie or feedback_pt_62)
  begin
      capitalist = !minnie | !feedback_pt_62;
  end

reg feedback_pt_63;

always @(butthead or feedback_pt_63)
  begin
      socialist =  butthead & !feedback_pt_63;
  end

reg feedback_pt_64;

always @(safada or feedback_pt_64)
  begin
      moderate = !safada & !feedback_pt_64;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floating <= 1;
    else
      floating <= dadada;
  end

always @(floating)
  begin
      feedback_pt_44 = floating;
  end

always @(floating)
  begin
      feedback_pt_45 = floating;
  end

always @(floating)
  begin
      feedback_pt_46 = floating;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drevil <= 0;
    else if (copper)
      drevil <= 0;
    else if (theonion)
      drevil <= yeanyow;
  end

always @(drevil)
  begin
      feedback_pt_47 = drevil;
  end

always @(drevil)
  begin
      feedback_pt_48 = drevil;
  end

always @(drevil)
  begin
      feedback_pt_49 = drevil;
  end

always @(drevil)
  begin
      feedback_pt_50 = drevil;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      erncenso <= 1;
    else
      erncenso <= vcc;
  end

always @(erncenso)
  begin
      feedback_pt_51 = erncenso;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fsncens <= 1;
    else
      fsncens <= xray;
  end

always @(fsncens)
  begin
      feedback_pt_52 = fsncens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gtncensor <= 0;
    else
      gtncensor <= kmfdm;
  end

always @(gtncensor)
  begin
      feedback_pt_53 = gtncensor;
  end

always @(gtncensor)
  begin
      feedback_pt_54 = gtncensor;
  end

always @(gtncensor)
  begin
      feedback_pt_55 = gtncensor;
  end

always @(gtncensor)
  begin
      feedback_pt_56 = gtncensor;
  end

always @(gtncensor)
  begin
      feedback_pt_57 = gtncensor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tinker <= 0;
    else if (gnd)
      tinker <= senorduck;
    else if (vulture)
      tinker <= 0;
  end

always @(tinker)
  begin
      feedback_pt_58 = tinker;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lunchtime <= 0;
    else
      lunchtime <= questo;
  end

always @(lunchtime)
  begin
      feedback_pt_59 = lunchtime;
  end

wire roosevelt_wire;

dffeas roosevelt_ff (
  .clk(clock0),
  .d(zebra),
  .ena(gnd),
  .sclr(moderate),
  .sload(sand),
  .asdata(superman),
  .clrn(!reset0),
  .q(roosevelt_wire)
);

always @(roosevelt_wire) begin
   hxncensorce = roosevelt_wire;
end

always @(hxncensorce)
  begin
      feedback_pt_60 = hxncensorce;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      opus <= 0;
    else if (gnd)
      opus <= iron;
    else if (zinc)
      opus <= 0;
  end

always @(opus)
  begin
      feedback_pt_61 = opus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      portnoy <= 0;
    else if (doobie)
      portnoy <= 0;
    else if (vcc)
      portnoy <= kebab;
  end

always @(portnoy)
  begin
      feedback_pt_62 = portnoy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      milo <= 0;
    else if (erncenso)
      milo <= 0;
    else if (duey)
      milo <= speedyg;
  end

always @(milo)
  begin
      feedback_pt_63 = milo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bloom <= 0;
    else if (boitano)
      bloom <= vcc;
  end

always @(bloom)
  begin
      feedback_pt_64 = bloom;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      potatoskin <= 0;
    else
      potatoskin <= aluminum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hotpastrami <= 1;
    else
      hotpastrami <= lunchtime;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      roastbeef <= 0;
    else
      roastbeef <= portnoy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      donut <= 0;
    else if (vulture)
      donut <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      poppyseed <= 0;
    else if (gnd)
      poppyseed <= 0;
    else if (unicorn)
      poppyseed <= morenames;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      clubsandwich <= 0;
    else if (blueled)
      clubsandwich <= boots;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kungfu <= 1;
    else
      kungfu <= anarchist;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fatality <= 0;
    else if (speedyg)
      fatality <= copper;
    else if (moron)
      fatality <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      testyour <= 0;
    else if (iterate)
      testyour <= 0;
    else if (whale)
      testyour <= fsncens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      might <= 1;
    else
      might <= master;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      excellent <= 1;
    else
      excellent <= hotpastrami;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      Iwin <= 0;
    else if (surfer)
      Iwin <= gnd;
    else if (master)
      Iwin <= 0;
  end

reg feedback_pt_65;

always @(gnd or feedback_pt_65)
  begin
      danger = !gnd ^  feedback_pt_65;
  end

reg feedback_pt_66;

always @(vcc or feedback_pt_66)
  begin
      screaming =  vcc ^ !feedback_pt_66;
  end

reg feedback_pt_67;

always @(theonion or feedback_pt_67)
  begin
      atilla =  theonion & !feedback_pt_67;
  end

reg feedback_pt_68;

always @(johndenver or feedback_pt_68)
  begin
      famulan =  johndenver &  feedback_pt_68;
  end

reg feedback_pt_69;

always @(kebab or feedback_pt_69)
  begin
      supurb =  kebab ^ !feedback_pt_69;
  end

reg feedback_pt_70;

always @(mickey or feedback_pt_70)
  begin
      jayqueeze = !mickey & !feedback_pt_70;
  end

reg feedback_pt_71;

always @(vcc or feedback_pt_71)
  begin
      waydeelect =  vcc ^ !feedback_pt_71;
  end

reg feedback_pt_72;

always @(vcc or feedback_pt_72)
  begin
      iwocensor =  vcc |  feedback_pt_72;
  end

reg feedback_pt_73;

always @(poppyseed or feedback_pt_73)
  begin
      incompetent = !poppyseed & !feedback_pt_73;
  end

reg feedback_pt_74;

always @(vcc or feedback_pt_74)
  begin
      secondrate =  vcc & !feedback_pt_74;
  end

reg feedback_pt_75;

always @(dweebie or feedback_pt_75)
  begin
      inspection =  dweebie ^  feedback_pt_75;
  end

reg feedback_pt_76;

always @(sand or feedback_pt_76)
  begin
      thedon = !sand & !feedback_pt_76;
  end

reg feedback_pt_77;

always @(master or feedback_pt_77)
  begin
      marco =  master &  feedback_pt_77;
  end

reg feedback_pt_78;

always @(anarchist or feedback_pt_78)
  begin
      cocacola =  anarchist | !feedback_pt_78;
  end

reg feedback_pt_79;

always @(gnd or feedback_pt_79)
  begin
      ham = !gnd ^ !feedback_pt_79;
  end

reg feedback_pt_80;

always @(waydeelect or feedback_pt_80)
  begin
      mandarin =  waydeelect ^  feedback_pt_80;
  end

reg feedback_pt_81;

always @(yellow or feedback_pt_81)
  begin
      ihilani =  yellow |  feedback_pt_81;
  end

reg feedback_pt_82;

always @(jayqueeze or feedback_pt_82)
  begin
      october = !jayqueeze &  feedback_pt_82;
  end

reg feedback_pt_83;

always @(kidnapper or feedback_pt_83)
  begin
      tracy =  kidnapper & !feedback_pt_83;
  end

reg feedback_pt_84;

always @(vcc or feedback_pt_84)
  begin
      jjocen =  vcc ^  feedback_pt_84;
  end

reg feedback_pt_85;

always @(possum or feedback_pt_85)
  begin
      meffert = !possum |  feedback_pt_85;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bismuth <= 0;
    else if (lantern)
      bismuth <= 0;
    else if (ajax)
      bismuth <= pantalones;
  end

always @(bismuth)
  begin
      feedback_pt_65 = bismuth;
  end

always @(bismuth)
  begin
      feedback_pt_66 = bismuth;
  end

always @(bismuth)
  begin
      feedback_pt_67 = bismuth;
  end

always @(bismuth)
  begin
      feedback_pt_68 = bismuth;
  end

always @(bismuth)
  begin
      feedback_pt_69 = bismuth;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floride <= 0;
    else
      floride <= rat;
  end

always @(floride)
  begin
      feedback_pt_70 = floride;
  end

always @(floride)
  begin
      feedback_pt_71 = floride;
  end

always @(floride)
  begin
      feedback_pt_72 = floride;
  end

wire oranges_wire;

dffea oranges_ff (
  .clk(clock0),
  .d(supurb),
  .ena(starwars),
  .adata(vcc),
  .clrn(!reset0),
  .q(oranges_wire)
);

always @(oranges_wire) begin
   pyromaniac = oranges_wire;
end

always @(pyromaniac)
  begin
      feedback_pt_73 = pyromaniac;
  end

wire junkie_wire;

dffeas junkie_ff (
  .clk(clock0),
  .d(gnd),
  .ena(tracy),
  .sclr(bracket),
  .sload(vcc),
  .asdata(hector),
  .clrn(!reset0),
  .q(junkie_wire)
);

always @(junkie_wire) begin
   waster = junkie_wire;
end

always @(waster)
  begin
      feedback_pt_74 = waster;
  end

always @(waster)
  begin
      feedback_pt_75 = waster;
  end

always @(waster)
  begin
      feedback_pt_76 = waster;
  end

always @(waster)
  begin
      feedback_pt_77 = waster;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burner <= 1;
    else
      burner <= Iwin;
  end

always @(burner)
  begin
      feedback_pt_78 = burner;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crackhead <= 0;
    else
      crackhead <= iwocensor;
  end

always @(crackhead)
  begin
      feedback_pt_79 = crackhead;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stoner <= 0;
    else if (zebra)
      stoner <= fire;
    else if (moderate)
      stoner <= 0;
  end

always @(stoner)
  begin
      feedback_pt_80 = stoner;
  end

wire drugie_wire;

dffeas drugie_ff (
  .clk(clock0),
  .d(supurb),
  .ena(tin),
  .sclr(bubba),
  .sload(elguapo),
  .asdata(vcc),
  .clrn(!reset0),
  .q(drugie_wire)
);

always @(drugie_wire) begin
   chemical = drugie_wire;
end

always @(chemical)
  begin
      feedback_pt_81 = chemical;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      brothers <= 0;
    else if (cuckoo)
      brothers <= danger;
    else if (chemical)
      brothers <= 0;
  end

always @(brothers)
  begin
      feedback_pt_82 = brothers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tunafish <= 0;
    else if (gtncensor)
      tunafish <= elguapo;
  end

always @(tunafish)
  begin
      feedback_pt_83 = tunafish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eggsalad <= 0;
    else if (roastbeef)
      eggsalad <= 0;
    else if (chemical)
      eggsalad <= danger;
  end

always @(eggsalad)
  begin
      feedback_pt_84 = eggsalad;
  end

wire agitator_wire;

dffea agitator_ff (
  .clk(clock0),
  .d(floride),
  .ena(contractor),
  .adata(crackhead),
  .clrn(!reset0),
  .q(agitator_wire)
);

always @(agitator_wire) begin
   postulator = agitator_wire;
end

always @(postulator)
  begin
      feedback_pt_85 = postulator;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      satanist <= 1;
    else
      satanist <= drevil;
  end

wire plagarist_wire;

dffeas plagarist_ff (
  .clk(clock0),
  .d(gnd),
  .ena(books),
  .sclr(vcc),
  .sload(excellent),
  .asdata(testyour),
  .clrn(!reset0),
  .q(plagarist_wire)
);

always @(plagarist_wire) begin
   whoiswho = plagarist_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      money <= 0;
    else if (tunafish)
      money <= atilla;
    else if (sand)
      money <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      morrison <= 0;
    else if (firstpart)
      morrison <= vulture;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      firewalk <= 1;
    else
      firewalk <= vonmunchhausen;
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
      palmer <= 0;
    else if (vcc)
      palmer <= paper;
  end

wire banality_wire;

dffeas banality_ff (
  .clk(clock0),
  .d(postulator),
  .ena(kennyg),
  .sclr(gnd),
  .sload(gnd),
  .asdata(ham),
  .clrn(!reset0),
  .q(banality_wire)
);

always @(banality_wire) begin
   brutality = banality_wire;
end

wire fury_wire;

dffea fury_ff (
  .clk(clock0),
  .d(kungfu),
  .ena(vcc),
  .adata(dorkus),
  .clrn(!reset0),
  .q(fury_wire)
);

always @(fury_wire) begin
   hurt = fury_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tobe <= 1;
    else
      tobe <= firewalk;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yoku <= 0;
    else if (vcc)
      yoku <= clubsandwich;
    else if (roastbeef)
      yoku <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      simasu <= 1;
    else
      simasu <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      geisha <= 0;
    else if (gnd)
      geisha <= 0;
    else if (gnd)
      geisha <= money;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pictures <= 1;
    else
      pictures <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      star <= 0;
    else if (roastbeef)
      star <= bomb_pop;
  end

wire show_wire;

dffeas show_ff (
  .clk(clock0),
  .d(palmer),
  .ena(might),
  .sclr(vcc),
  .sload(hotpastrami),
  .asdata(cartman),
  .clrn(!reset0),
  .q(show_wire)
);

always @(show_wire) begin
   ready = show_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gokidsgo <= 1;
    else
      gokidsgo <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lemon <= 0;
    else
      lemon <= cocaine;
  end

wire winner_wire;

dffeas winner_ff (
  .clk(clock0),
  .d(ham),
  .ena(Iwin),
  .sclr(yoku),
  .sload(vcc),
  .asdata(hurt),
  .clrn(!reset0),
  .q(winner_wire)
);

always @(winner_wire) begin
   speeding = winner_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hiway <= 0;
    else
      hiway <= orange;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      grams <= 0;
    else if (loser)
      grams <= hotpastrami;
    else if (dorkus)
      grams <= 0;
  end

wire kdqcens_wire;

dffea kdqcens_ff (
  .clk(clock0),
  .d(grams),
  .ena(satanist),
  .adata(fatality),
  .clrn(!reset0),
  .q(kdqcens_wire)
);

always @(kdqcens_wire) begin
   bust = kdqcens_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gotone <= 0;
    else if (incompetent)
      gotone <= 0;
    else if (contractor)
      gotone <= maritime;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foryou <= 0;
    else
      foryou <= stoner;
  end

wire sogood_wire;

dffea sogood_ff (
  .clk(clock0),
  .d(kanji),
  .ena(gnd),
  .adata(gnd),
  .clrn(!reset0),
  .q(sogood_wire)
);

always @(sogood_wire) begin
   moreand = sogood_wire;
end

// State Mek faster Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      faster <= faster_0;
    else
      case (faster)
        faster_0: begin
          if ({bloom,stoner,kanji,lemon} == 9)
            faster <= faster_7;
          else if ({bloom,stoner,kanji,lemon} == 10)
            faster <= faster_6;
          else if ({bloom,stoner,kanji,lemon} == 15)
            faster <= faster_1;
          else if ({bloom,stoner,kanji,lemon} == 3)
            faster <= faster_5;
          else
            faster <= faster_0;
          end
        faster_1: begin
          if ({bloom,stoner,kanji,lemon} == 6)
            faster <= faster_4;
          else if ({bloom,stoner,kanji,lemon} == 5)
            faster <= faster_0;
          else if ({bloom,stoner,kanji,lemon} == 14)
            faster <= faster_2;
          else if ({bloom,stoner,kanji,lemon} == 8)
            faster <= faster_0;
          else
            faster <= faster_1;
          end
        faster_2: begin
          if ({bloom,stoner,kanji,lemon} == 2)
            faster <= faster_3;
          else if ({bloom,stoner,kanji,lemon} == 3)
            faster <= faster_5;
          else if ({bloom,stoner,kanji,lemon} == 12)
            faster <= faster_3;
          else if ({bloom,stoner,kanji,lemon} == 0)
            faster <= faster_1;
          else if ({bloom,stoner,kanji,lemon} == 6)
            faster <= faster_7;
          else
            faster <= faster_2;
          end
        faster_3: begin
          if ({bloom,stoner,kanji,lemon} == 5)
            faster <= faster_3;
          else
            faster <= faster_3;
          end
        faster_4: begin
            faster <= faster_4;
          end
        faster_5: begin
          if ({bloom,stoner,kanji,lemon} == 0)
            faster <= faster_0;
          else if ({bloom,stoner,kanji,lemon} == 5)
            faster <= faster_6;
          else
            faster <= faster_5;
          end
        faster_6: begin
          if ({bloom,stoner,kanji,lemon} == 9)
            faster <= faster_7;
          else if ({bloom,stoner,kanji,lemon} == 14)
            faster <= faster_3;
          else if ({bloom,stoner,kanji,lemon} == 13)
            faster <= faster_1;
          else if ({bloom,stoner,kanji,lemon} == 10)
            faster <= faster_1;
          else if ({bloom,stoner,kanji,lemon} == 6)
            faster <= faster_7;
          else
            faster <= faster_6;
          end
        faster_7: begin
            faster <= faster_7;
          end
        default: faster <= faster_0;
      endcase
  end

// State Mek faster Output logic
always @(faster)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (faster)
        faster_0: begin
            elementary = 1;
            sixyears = 0;
            graduated = 0;
            overeducated = 0;
            notalot = 0;
            nation = 0;
            protest = 0;
            animal = 0;
            vegan = 0;
            vegetarian = 0;
            liberation = 0;
          end
        faster_1: begin
            elementary = 0;
            sixyears = 1;
            graduated = 0;
            overeducated = 0;
            notalot = 0;
            nation = 0;
            protest = 0;
            animal = 0;
            vegan = 0;
            vegetarian = 0;
            liberation = 0;
          end
        faster_2: begin
            elementary = 0;
            sixyears = 1;
            graduated = 0;
            overeducated = 0;
            notalot = 0;
            nation = 0;
            protest = 0;
            animal = 0;
            vegan = 1;
            vegetarian = 0;
            liberation = 1;
          end
        faster_3: begin
            elementary = 1;
            sixyears = 1;
            graduated = 0;
            overeducated = 0;
            notalot = 1;
            nation = 1;
            protest = 1;
            animal = 0;
            vegan = 1;
            vegetarian = 0;
            liberation = 0;
          end
        faster_4: begin
            elementary = 0;
            sixyears = 0;
            graduated = 1;
            overeducated = 0;
            notalot = 1;
            nation = 0;
            protest = 0;
            animal = 0;
            vegan = 0;
            vegetarian = 1;
            liberation = 1;
          end
        faster_5: begin
            elementary = 0;
            sixyears = 0;
            graduated = 0;
            overeducated = 0;
            notalot = 0;
            nation = 1;
            protest = 0;
            animal = 0;
            vegan = 1;
            vegetarian = 1;
            liberation = 1;
          end
        faster_6: begin
            elementary = 0;
            sixyears = 0;
            graduated = 0;
            overeducated = 0;
            notalot = 0;
            nation = 0;
            protest = 1;
            animal = 0;
            vegan = 1;
            vegetarian = 0;
            liberation = 1;
          end
        faster_7: begin
            elementary = 0;
            sixyears = 0;
            graduated = 0;
            overeducated = 0;
            notalot = 0;
            nation = 0;
            protest = 0;
            animal = 1;
            vegan = 0;
            vegetarian = 0;
            liberation = 1;
          end
        default: begin
            elementary = 0;
            sixyears = 1;
            graduated = 1;
            overeducated = 0;
            notalot = 1;
            nation = 1;
            protest = 1;
            animal = 1;
            vegan = 0;
            vegetarian = 0;
            liberation = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire extremist_out;
nut_001_lut #(1) nut_001_lut_inst_extremist (
  .din({elementary}),
  .mask(2'b11),
  .out(extremist_out)
);

always @(extremist_out)
begin
   psycho = extremist_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire zealot_out;
nut_001_lut #(2) nut_001_lut_inst_zealot (
  .din({morrison,bismuth}),
  .mask(4'b0010),
  .out(zealot_out)
);

always @(zealot_out)
begin
   fruitcake = zealot_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire rasp_out;
nut_001_lut #(5) nut_001_lut_inst_rasp (
  .din({potatoskin,fruitcake,vegetarian,gnd,jiminy}),
  .mask(32'hd10f0bd3),
  .out(rasp_out)
);

always @(rasp_out)
begin
   chainsaw = rasp_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire romex_out;
nut_001_lut #(1) nut_001_lut_inst_romex (
  .din({gnd}),
  .mask(2'b11),
  .out(romex_out)
);

always @(romex_out)
begin
   square = romex_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire knockout_out;
nut_001_lut #(1) nut_001_lut_inst_knockout (
  .din({boitano}),
  .mask(2'b11),
  .out(knockout_out)
);

always @(knockout_out)
begin
   jxnbox = knockout_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire gutter_out;
nut_001_lut #(2) nut_001_lut_inst_gutter (
  .din({bust,kidnapper}),
  .mask(4'h3),
  .out(gutter_out)
);

always @(gutter_out)
begin
   curie = gutter_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire wood_out;
nut_001_lut #(4) nut_001_lut_inst_wood (
  .din({jxnbox,gnd,dr_zaius,meffert}),
  .mask(16'hf515),
  .out(wood_out)
);

always @(wood_out)
begin
   plaster = wood_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire greenbay_out;
nut_001_lut #(6) nut_001_lut_inst_greenbay (
  .din({gnd,gnd,inspection,narcotics,dragon,adbcensor}),
  .mask(64'h6efcb9378a839114),
  .out(greenbay_out)
);

always @(greenbay_out)
begin
   rampacker = greenbay_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire giants_out;
nut_001_lut #(5) nut_001_lut_inst_giants (
  .din({tiger,hiway,books,chatanooga,fullmetal}),
  .mask(32'b00010100010000001000000100000101),
  .out(giants_out)
);

always @(giants_out)
begin
   raiders = giants_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire nyc_out;
nut_001_lut #(5) nut_001_lut_inst_nyc (
  .din({october,animal,iguana,vegetarian,lemon}),
  .mask(32'he36699c4),
  .out(nyc_out)
);

always @(nyc_out)
begin
   yankees = nyc_out;
end

// 12 bit to 16 bit const mult
always @(cocacola or pyromaniac or star or vcc or crackhead or october or vcc or nation or thedon or vcc or dr_zaius or fullmetal)
  begin
      {broadway,dirty,noyoudirty,muggers,whattime,sanity,michelle,rocks,legos,eatem,blanket,china,usa,holland,puertorico,mexico} = 
	  	  {cocacola,pyromaniac,star,vcc,crackhead,october,vcc,nation,thedon,vcc,dr_zaius,fullmetal} * 
		  204232;
  end

// 7 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {spain,greenland,scotland,england,iceland,romulus,remus} <= 0;
    else if (platinum)
      {spain,greenland,scotland,england,iceland,romulus,remus} <= {spain,greenland,scotland,england,iceland,romulus,remus} + 164;
    else
      {spain,greenland,scotland,england,iceland,romulus,remus} <= {spain,greenland,scotland,england,iceland,romulus,remus} - 111;
  end

// NAND all of these bits together
always @(bust or mexico or purple or xray or screaming or morenames or vcc or foryou or gnd or blanket or pyromaniac)
  begin
      cain = ~& {bust,mexico,purple,xray,screaming,morenames,vcc,foryou,gnd,blanket,pyromaniac};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      abel <= 0;
    else
    case ({loser,broadway})
       0 : abel <= abel;
       1 : abel <= abel;
       2 : abel <= abel;
       3 : abel <= abel;
       default : abel <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zipporah <= 0;
    else
    case ({scotland,werewolf})
       0 : zipporah <= vcc;
       1 : zipporah <= zipporah;
       2 : zipporah <= gnd;
       3 : zipporah <= zipporah;
       default : zipporah <= 0;
    endcase
  end

reg feedback_pt_86;

always @(danger or feedback_pt_86)
  begin
      issac = !danger |  feedback_pt_86;
  end

reg feedback_pt_87;

always @(vcc or feedback_pt_87)
  begin
      abraham = !vcc &  feedback_pt_87;
  end

reg feedback_pt_88;

always @(plaster or feedback_pt_88)
  begin
      jacob =  plaster ^  feedback_pt_88;
  end

reg feedback_pt_89;

always @(danger or feedback_pt_89)
  begin
      joseph =  danger |  feedback_pt_89;
  end

reg feedback_pt_90;

always @(remus or feedback_pt_90)
  begin
      dreamcoat =  remus ^  feedback_pt_90;
  end

reg feedback_pt_91;

always @(vcc or feedback_pt_91)
  begin
      ringlingbros =  vcc & !feedback_pt_91;
  end

reg feedback_pt_92;

always @(gnd or feedback_pt_92)
  begin
      lxtcen = !gnd & !feedback_pt_92;
  end

reg feedback_pt_93;

always @(bracket or feedback_pt_93)
  begin
      terrance =  bracket &  feedback_pt_93;
  end

reg feedback_pt_94;

always @(vcc or feedback_pt_94)
  begin
      piggish =  vcc ^ !feedback_pt_94;
  end

reg feedback_pt_95;

always @(india or feedback_pt_95)
  begin
      cryptic = !india ^  feedback_pt_95;
  end

reg feedback_pt_96;

always @(withme or feedback_pt_96)
  begin
      crapeteria =  withme & !feedback_pt_96;
  end

reg feedback_pt_97;

always @(jacob or feedback_pt_97)
  begin
      mdtcensorc = !jacob | !feedback_pt_97;
  end

reg feedback_pt_98;

always @(gnd or feedback_pt_98)
  begin
      nihlist =  gnd ^  feedback_pt_98;
  end

reg feedback_pt_99;

always @(platinum or feedback_pt_99)
  begin
      moses = !platinum ^  feedback_pt_99;
  end

reg feedback_pt_100;

always @(opus or feedback_pt_100)
  begin
      burning =  opus ^ !feedback_pt_100;
  end

reg feedback_pt_101;

always @(china or feedback_pt_101)
  begin
      nhtcenso = !china &  feedback_pt_101;
  end

reg feedback_pt_102;

always @(mickey or feedback_pt_102)
  begin
      oitcen = !mickey ^  feedback_pt_102;
  end

reg feedback_pt_103;

always @(gnd or feedback_pt_103)
  begin
      daughter = !gnd ^ !feedback_pt_103;
  end

reg feedback_pt_104;

always @(narcotics or feedback_pt_104)
  begin
      wine =  narcotics &  feedback_pt_104;
  end

reg feedback_pt_105;

always @(psycho or feedback_pt_105)
  begin
      gin =  psycho & !feedback_pt_105;
  end

reg feedback_pt_106;

always @(dreamcoat or feedback_pt_106)
  begin
      tonic = !dreamcoat & !feedback_pt_106;
  end

reg feedback_pt_107;

always @(pyro or feedback_pt_107)
  begin
      rum =  pyro &  feedback_pt_107;
  end

reg feedback_pt_108;

always @(gnd or feedback_pt_108)
  begin
      scotch = !gnd | !feedback_pt_108;
  end

reg feedback_pt_109;

always @(dreamcoat or feedback_pt_109)
  begin
      larry =  dreamcoat | !feedback_pt_109;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      curly <= 1;
    else
      curly <= noyoudirty;
  end

always @(curly)
  begin
      feedback_pt_86 = curly;
  end

always @(curly)
  begin
      feedback_pt_87 = curly;
  end

always @(curly)
  begin
      feedback_pt_88 = curly;
  end

always @(curly)
  begin
      feedback_pt_89 = curly;
  end

always @(curly)
  begin
      feedback_pt_90 = curly;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      barnum <= 0;
    else if (gnd)
      barnum <= purple;
    else if (gnd)
      barnum <= 0;
  end

always @(barnum)
  begin
      feedback_pt_91 = barnum;
  end

always @(barnum)
  begin
      feedback_pt_92 = barnum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shemp <= 0;
    else
      shemp <= cheese;
  end

always @(shemp)
  begin
      feedback_pt_93 = shemp;
  end

always @(shemp)
  begin
      feedback_pt_94 = shemp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wiggum <= 1;
    else
      wiggum <= whattime;
  end

always @(wiggum)
  begin
      feedback_pt_95 = wiggum;
  end

always @(wiggum)
  begin
      feedback_pt_96 = wiggum;
  end

always @(wiggum)
  begin
      feedback_pt_97 = wiggum;
  end

always @(wiggum)
  begin
      feedback_pt_98 = wiggum;
  end

always @(wiggum)
  begin
      feedback_pt_99 = wiggum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bart <= 1;
    else
      bart <= gnd;
  end

always @(bart)
  begin
      feedback_pt_100 = bart;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lisa <= 0;
    else if (vcc)
      lisa <= nation;
  end

always @(lisa)
  begin
      feedback_pt_101 = lisa;
  end

wire marge_wire;

dffeas marge_ff (
  .clk(clock0),
  .d(senorduck),
  .ena(vcc),
  .sclr(tonic),
  .sload(jacklemon),
  .asdata(vcc),
  .clrn(!reset0),
  .q(marge_wire)
);

always @(marge_wire) begin
   homerun = marge_wire;
end

always @(homerun)
  begin
      feedback_pt_102 = homerun;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      barney <= 0;
    else
      barney <= nihlist;
  end

always @(barney)
  begin
      feedback_pt_103 = barney;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skinner <= 1;
    else
      skinner <= rum;
  end

always @(skinner)
  begin
      feedback_pt_104 = skinner;
  end

wire krabapple_wire;

dffeas krabapple_ff (
  .clk(clock0),
  .d(blanket),
  .ena(milo),
  .sclr(vcc),
  .sload(clubsandwich),
  .asdata(greenland),
  .clrn(!reset0),
  .q(krabapple_wire)
);

always @(krabapple_wire) begin
   tarzan = krabapple_wire;
end

always @(tarzan)
  begin
      feedback_pt_105 = tarzan;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moe <= 0;
    else if (iguana)
      moe <= vcc;
  end

always @(moe)
  begin
      feedback_pt_106 = moe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      smithers <= 1;
    else
      smithers <= liberation;
  end

always @(smithers)
  begin
      feedback_pt_107 = smithers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      comicbook <= 1;
    else
      comicbook <= comrade;
  end

always @(comicbook)
  begin
      feedback_pt_108 = comicbook;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      worstdesignever <= 0;
    else
      worstdesignever <= cryptic;
  end

always @(worstdesignever)
  begin
      feedback_pt_109 = worstdesignever;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      flanders <= 0;
    else if (dutch)
      flanders <= 0;
    else if (cuckoo)
      flanders <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      heidi <= 1;
    else
      heidi <= floating;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      steaming <= 0;
    else if (burner)
      steaming <= 0;
    else if (gnd)
      steaming <= yak;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      milhouse <= 0;
    else if (hiway)
      milhouse <= legos;
    else if (gnd)
      milhouse <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rod <= 0;
    else
      rod <= cheese;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      todd <= 0;
    else
      todd <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chewbacca <= 0;
    else
      chewbacca <= kanji;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      timmy <= 0;
    else if (vcc)
      timmy <= brothers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tukatuk <= 0;
    else if (gnd)
      tukatuk <= 0;
    else if (fascist)
      tukatuk <= gnd;
  end

wire slobbering_wire;

dffeas slobbering_ff (
  .clk(clock0),
  .d(gin),
  .ena(gnd),
  .sclr(flew),
  .sload(crapeteria),
  .asdata(yoda),
  .clrn(!reset0),
  .q(slobbering_wire)
);

always @(slobbering_wire) begin
   weevil = slobbering_wire;
end

wire psucensorc_wire;

dffeas psucensorc_ff (
  .clk(clock0),
  .d(gnd),
  .ena(milhouse),
  .sclr(chainsaw),
  .sload(steaming),
  .asdata(gnd),
  .clrn(!reset0),
  .q(psucensorc_wire)
);

always @(psucensorc_wire) begin
   deuce = psucensorc_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eeevil <= 1;
    else
      eeevil <= sanity;
  end

wire intuit_wire;

dffeas intuit_ff (
  .clk(clock0),
  .d(protest),
  .ena(vcc),
  .sclr(yak),
  .sload(think),
  .asdata(eatem),
  .clrn(!reset0),
  .q(intuit_wire)
);

always @(intuit_wire) begin
   bert = intuit_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ernie <= 0;
    else if (jjocen)
      ernie <= homerun;
    else if (mdtcensorc)
      ernie <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      life <= 0;
    else
      life <= tonic;
  end

wire snuffleupagus_wire;

dffeas snuffleupagus_ff (
  .clk(clock0),
  .d(tinker),
  .ena(life),
  .sclr(kungfu),
  .sload(tarzan),
  .asdata(graduated),
  .clrn(!reset0),
  .q(snuffleupagus_wire)
);

always @(snuffleupagus_wire) begin
   peta = snuffleupagus_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      happyists <= 0;
    else
      happyists <= steaming;
  end

wire atomic_wire;

dffeas atomic_ff (
  .clk(clock0),
  .d(issac),
  .ena(burner),
  .sclr(gnd),
  .sload(tobe),
  .asdata(gnd),
  .clrn(!reset0),
  .q(atomic_wire)
);

always @(atomic_wire) begin
   firemonkey = atomic_wire;
end

// const - A
always @(gnd or gnd or notalot or contractor or timmy or gnd or brutality or indigo)
  begin
    {qfvcensorce,captain,rhvcens,roid,itchy} = 122 - {gnd,gnd,notalot,contractor,timmy,gnd,brutality,indigo};
  end

// 6 bit add sub
always @(shemp or geisha or curie or vcc or probably or cain or gnd or vcc or roid or gnd or bart or curly)
  begin
    {squad,joey,ramone,stoned,often,south} = 
		({shemp,geisha,curie,vcc,probably,cain} ^ 210) - 
		({gnd,vcc,roid,gnd,bart,curly} ^ 121);
  end

// Ternary sign extend bait
always @(raiders or raiders or raiders or raiders or raiders or raiders or raiders or raiders or gnd or vcc or burning or romulus or gnd or vcc or jiminy or inspection or vcc or squad or usa or vcc or lisa or wine or indigo or ringlingbros or happyists or flanders or flanders or moses or
         gokidsgo or gokidsgo or gokidsgo or gokidsgo or gokidsgo or gokidsgo or gokidsgo or gokidsgo or gokidsgo or gokidsgo or gokidsgo or barney or curie or donut or lisa or gnd or rhvcens or cocacola or gnd or safada or moses or nhtcenso or whattime or vcc or england or scotch or comicbook or jiminy or
         ernie or ernie or ernie or ernie or ernie or ernie or ernie or ernie or chewbacca or spyro or speeding or gnd or gnd or protest or scotch or iceland or mcnugget or abel or joseph or werewolf or postulator or yankees or vcc or waster or wine or flanders or jiminy or vcc)
  begin
    {edible,srvcensorce,on_sale,aisle_two,dinoblaster,crunchyfrog,nobody,expects_the,spanish,inquisition,chief,weapons,fear,surprise,efficiency,fanatical,devotion,the_pope,yummy,love_in,my_tummy,po,lala,dipsy,touch,kissthesky,peopleeater,haze} = 
        {raiders,raiders,raiders,raiders,raiders,raiders,raiders,raiders,gnd,vcc,burning,romulus,gnd,vcc,jiminy,inspection,vcc,squad,usa,vcc,lisa,wine,indigo,ringlingbros,happyists,flanders,flanders,moses} +
        {gokidsgo,gokidsgo,gokidsgo,gokidsgo,gokidsgo,gokidsgo,gokidsgo,gokidsgo,gokidsgo,gokidsgo,gokidsgo,barney,curie,donut,lisa,gnd,rhvcens,cocacola,gnd,safada,moses,nhtcenso,whattime,vcc,england,scotch,comicbook,jiminy} +
        {ernie,ernie,ernie,ernie,ernie,ernie,ernie,ernie,chewbacca,spyro,speeding,gnd,gnd,protest,scotch,iceland,mcnugget,abel,joseph,werewolf,postulator,yankees,vcc,waster,wine,flanders,jiminy,vcc};
  end

// 9 bit to 17 bit const mult
always @(gnd or heidi or noyoudirty or fsncens or puertorico or terrance or fear or dinoblaster or love_in)
  begin
      {timingmodel,plumber,odin,thor,jupiter,zeus,athena,minerva,mars,venus,pluto,neptune,ariel,sebastian,bach,mozart,goodmonkey} = 
	  	  {gnd,heidi,noyoudirty,fsncens,puertorico,terrance,fear,dinoblaster,love_in} * 
		  114164;
  end

reg feedback_pt_110;

always @(crunchyfrog or feedback_pt_110)
  begin
      badmonkey =  crunchyfrog ^  feedback_pt_110;
  end

reg feedback_pt_111;

always @(gnd or feedback_pt_111)
  begin
      guy = !gnd | !feedback_pt_111;
  end

reg feedback_pt_112;

always @(vcc or feedback_pt_112)
  begin
      partners =  vcc |  feedback_pt_112;
  end

reg feedback_pt_113;

always @(mozart or feedback_pt_113)
  begin
      cubish =  mozart | !feedback_pt_113;
  end

reg feedback_pt_114;

always @(vcc or feedback_pt_114)
  begin
      solder =  vcc ^ !feedback_pt_114;
  end

reg feedback_pt_115;

always @(vcc or feedback_pt_115)
  begin
      valve = !vcc & !feedback_pt_115;
  end

reg feedback_pt_116;

always @(mariollama or feedback_pt_116)
  begin
      furnace = !mariollama ^  feedback_pt_116;
  end

reg feedback_pt_117;

always @(maritime or feedback_pt_117)
  begin
      pilot =  maritime | !feedback_pt_117;
  end

reg feedback_pt_118;

always @(gnd or feedback_pt_118)
  begin
      leaky =  gnd | !feedback_pt_118;
  end

reg feedback_pt_119;

always @(erncenso or feedback_pt_119)
  begin
      potter =  erncenso & !feedback_pt_119;
  end

reg feedback_pt_120;

always @(heidi or feedback_pt_120)
  begin
      drax =  heidi &  feedback_pt_120;
  end

reg feedback_pt_121;

always @(gnd or feedback_pt_121)
  begin
      moonraker = !gnd ^ !feedback_pt_121;
  end

reg feedback_pt_122;

always @(haze or feedback_pt_122)
  begin
      killme = !haze & !feedback_pt_122;
  end

reg feedback_pt_123;

always @(kissthesky or feedback_pt_123)
  begin
      tyycensor = !kissthesky ^ !feedback_pt_123;
  end

reg feedback_pt_124;

always @(chief or feedback_pt_124)
  begin
      sortout = !chief ^  feedback_pt_124;
  end

reg feedback_pt_125;

always @(lemon or feedback_pt_125)
  begin
      sgates = !lemon | !feedback_pt_125;
  end

reg feedback_pt_126;

always @(bomb_pop or feedback_pt_126)
  begin
      atoms = !bomb_pop | !feedback_pt_126;
  end

reg feedback_pt_127;

always @(sanity or feedback_pt_127)
  begin
      thankee = !sanity & !feedback_pt_127;
  end

reg feedback_pt_128;

always @(famulan or feedback_pt_128)
  begin
      wakey = !famulan ^ !feedback_pt_128;
  end

reg feedback_pt_129;

always @(indigo or feedback_pt_129)
  begin
      ants =  indigo | !feedback_pt_129;
  end

reg feedback_pt_130;

always @(vcc or feedback_pt_130)
  begin
      dig =  vcc ^ !feedback_pt_130;
  end

reg feedback_pt_131;

always @(daughter or feedback_pt_131)
  begin
      ladder =  daughter ^  feedback_pt_131;
  end

reg feedback_pt_132;

always @(gotone or feedback_pt_132)
  begin
      wrecker = !gotone ^ !feedback_pt_132;
  end

reg feedback_pt_133;

always @(yoku or feedback_pt_133)
  begin
      dumptruck =  yoku &  feedback_pt_133;
  end

reg feedback_pt_134;

always @(vadar or feedback_pt_134)
  begin
      dumbarton = !vadar ^ !feedback_pt_134;
  end

reg feedback_pt_135;

always @(capitalist or feedback_pt_135)
  begin
      golden = !capitalist &  feedback_pt_135;
  end

reg feedback_pt_136;

always @(south or feedback_pt_136)
  begin
      egg =  south |  feedback_pt_136;
  end

wire tofu_wire;

dffeas tofu_ff (
  .clk(clock0),
  .d(haze),
  .ena(spanish),
  .sclr(egg),
  .sload(bach),
  .asdata(vcc),
  .clrn(!reset0),
  .q(tofu_wire)
);

always @(tofu_wire) begin
   rodent = tofu_wire;
end

always @(rodent)
  begin
      feedback_pt_110 = rodent;
  end

always @(rodent)
  begin
      feedback_pt_111 = rodent;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      billnted <= 0;
    else if (ready)
      billnted <= 0;
    else if (partners)
      billnted <= vcc;
  end

always @(billnted)
  begin
      feedback_pt_112 = billnted;
  end

always @(billnted)
  begin
      feedback_pt_113 = billnted;
  end

always @(billnted)
  begin
      feedback_pt_114 = billnted;
  end

always @(billnted)
  begin
      feedback_pt_115 = billnted;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      whiteboard <= 1;
    else
      whiteboard <= yummy;
  end

always @(whiteboard)
  begin
      feedback_pt_116 = whiteboard;
  end

always @(whiteboard)
  begin
      feedback_pt_117 = whiteboard;
  end

always @(whiteboard)
  begin
      feedback_pt_118 = whiteboard;
  end

always @(whiteboard)
  begin
      feedback_pt_119 = whiteboard;
  end

always @(whiteboard)
  begin
      feedback_pt_120 = whiteboard;
  end

wire synthesis_wire;

dffeas synthesis_ff (
  .clk(clock0),
  .d(sixyears),
  .ena(rampacker),
  .sclr(xray),
  .sload(bart),
  .asdata(eggsalad),
  .clrn(!reset0),
  .q(synthesis_wire)
);

always @(synthesis_wire) begin
   fitter = synthesis_wire;
end

always @(fitter)
  begin
      feedback_pt_121 = fitter;
  end

always @(fitter)
  begin
      feedback_pt_122 = fitter;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dingbat <= 0;
    else if (gnd)
      dingbat <= 0;
    else if (heidi)
      dingbat <= atoms;
  end

always @(dingbat)
  begin
      feedback_pt_123 = dingbat;
  end

always @(dingbat)
  begin
      feedback_pt_124 = dingbat;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sweetie <= 0;
    else if (wrecker)
      sweetie <= eatem;
  end

always @(sweetie)
  begin
      feedback_pt_125 = sweetie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wiggles <= 0;
    else if (vcc)
      wiggles <= vcc;
  end

always @(wiggles)
  begin
      feedback_pt_126 = wiggles;
  end

always @(wiggles)
  begin
      feedback_pt_127 = wiggles;
  end

always @(wiggles)
  begin
      feedback_pt_128 = wiggles;
  end

always @(wiggles)
  begin
      feedback_pt_129 = wiggles;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wanton <= 0;
    else if (indigo)
      wanton <= curie;
    else if (aisle_two)
      wanton <= 0;
  end

always @(wanton)
  begin
      feedback_pt_130 = wanton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rewire <= 0;
    else if (gokidsgo)
      rewire <= nobody;
  end

always @(rewire)
  begin
      feedback_pt_131 = rewire;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      thread <= 0;
    else if (gnd)
      thread <= often;
    else if (on_sale)
      thread <= 0;
  end

always @(thread)
  begin
      feedback_pt_132 = thread;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      suffering <= 0;
    else
      suffering <= vegan;
  end

always @(suffering)
  begin
      feedback_pt_133 = suffering;
  end

wire art_wire;

dffea art_ff (
  .clk(clock0),
  .d(joey),
  .ena(fanatical),
  .adata(fitter),
  .clrn(!reset0),
  .q(art_wire)
);

always @(art_wire) begin
   vegas = art_wire;
end

always @(vegas)
  begin
      feedback_pt_134 = vegas;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tamago <= 1;
    else
      tamago <= thankee;
  end

always @(tamago)
  begin
      feedback_pt_135 = tamago;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tuna <= 1;
    else
      tuna <= minerva;
  end

always @(tuna)
  begin
      feedback_pt_136 = tuna;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salmon <= 0;
    else
      salmon <= furnace;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sake <= 1;
    else
      sake <= weapons;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ritsu <= 1;
    else
      ritsu <= my_tummy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ebi <= 0;
    else
      ebi <= moe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shrimp <= 0;
    else if (pilot)
      shrimp <= rodent;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rainbow <= 0;
    else if (vcc)
      rainbow <= thor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tako <= 0;
    else if (gnd)
      tako <= gnd;
    else if (yoku)
      tako <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      octapus <= 0;
    else if (moe)
      octapus <= gnd;
  end

wire hamachi_wire;

dffeas hamachi_ff (
  .clk(clock0),
  .d(vcc),
  .ena(gnd),
  .sclr(vcc),
  .sload(venus),
  .asdata(ritsu),
  .clrn(!reset0),
  .q(hamachi_wire)
);

always @(hamachi_wire) begin
   yellowtail = hamachi_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kana <= 0;
    else if (fitter)
      kana <= moreand;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crab <= 0;
    else
      crab <= thor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nigiri <= 1;
    else
      nigiri <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      handroll <= 1;
    else
      handroll <= marco;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      maki <= 0;
    else if (gnd)
      maki <= 0;
    else if (animal)
      maki <= efficiency;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      roe <= 1;
    else
      roe <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tobiko <= 0;
    else if (spanish)
      tobiko <= 0;
    else if (dumptruck)
      tobiko <= plumber;
  end

wire kappa_wire;

dffea kappa_ff (
  .clk(clock0),
  .d(dadada),
  .ena(shrimp),
  .adata(drax),
  .clrn(!reset0),
  .q(kappa_wire)
);

always @(kappa_wire) begin
   cucumber = kappa_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      california <= 0;
    else
      california <= wiggles;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ebay <= 0;
    else
      ebay <= england;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      covad <= 1;
    else
      covad <= jayqueeze;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      exodus <= 1;
    else
      exodus <= vcc;
  end

// State Mek abovenet Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      abovenet <= abovenet_0;
    else
      case (abovenet)
        abovenet_0: begin
          if ({vcc,crapeteria,pluto,fitter} == 13)
            abovenet <= abovenet_6;
          else if ({vcc,crapeteria,pluto,fitter} == 10)
            abovenet <= abovenet_6;
          else if ({vcc,crapeteria,pluto,fitter} == 1)
            abovenet <= abovenet_3;
          else
            abovenet <= abovenet_0;
          end
        abovenet_1: begin
          if ({vcc,crapeteria,pluto,fitter} == 0)
            abovenet <= abovenet_4;
          else
            abovenet <= abovenet_1;
          end
        abovenet_2: begin
          if ({vcc,crapeteria,pluto,fitter} == 1)
            abovenet <= abovenet_3;
          else if ({vcc,crapeteria,pluto,fitter} == 5)
            abovenet <= abovenet_5;
          else if ({vcc,crapeteria,pluto,fitter} == 14)
            abovenet <= abovenet_9;
          else
            abovenet <= abovenet_2;
          end
        abovenet_3: begin
          if ({vcc,crapeteria,pluto,fitter} == 10)
            abovenet <= abovenet_1;
          else if ({vcc,crapeteria,pluto,fitter} == 4)
            abovenet <= abovenet_3;
          else
            abovenet <= abovenet_3;
          end
        abovenet_4: begin
          if ({vcc,crapeteria,pluto,fitter} == 5)
            abovenet <= abovenet_6;
          else if ({vcc,crapeteria,pluto,fitter} == 0)
            abovenet <= abovenet_9;
          else if ({vcc,crapeteria,pluto,fitter} == 6)
            abovenet <= abovenet_1;
          else if ({vcc,crapeteria,pluto,fitter} == 15)
            abovenet <= abovenet_1;
          else if ({vcc,crapeteria,pluto,fitter} == 12)
            abovenet <= abovenet_7;
          else
            abovenet <= abovenet_4;
          end
        abovenet_5: begin
          if ({vcc,crapeteria,pluto,fitter} == 1)
            abovenet <= abovenet_7;
          else if ({vcc,crapeteria,pluto,fitter} == 6)
            abovenet <= abovenet_5;
          else if ({vcc,crapeteria,pluto,fitter} == 14)
            abovenet <= abovenet_6;
          else
            abovenet <= abovenet_5;
          end
        abovenet_6: begin
            abovenet <= abovenet_6;
          end
        abovenet_7: begin
          if ({vcc,crapeteria,pluto,fitter} == 0)
            abovenet <= abovenet_8;
          else if ({vcc,crapeteria,pluto,fitter} == 3)
            abovenet <= abovenet_3;
          else if ({vcc,crapeteria,pluto,fitter} == 5)
            abovenet <= abovenet_9;
          else
            abovenet <= abovenet_7;
          end
        abovenet_8: begin
          if ({vcc,crapeteria,pluto,fitter} == 6)
            abovenet <= abovenet_3;
          else if ({vcc,crapeteria,pluto,fitter} == 0)
            abovenet <= abovenet_9;
          else if ({vcc,crapeteria,pluto,fitter} == 4)
            abovenet <= abovenet_5;
          else
            abovenet <= abovenet_8;
          end
        abovenet_9: begin
          if ({vcc,crapeteria,pluto,fitter} == 9)
            abovenet <= abovenet_3;
          else if ({vcc,crapeteria,pluto,fitter} == 11)
            abovenet <= abovenet_7;
          else if ({vcc,crapeteria,pluto,fitter} == 14)
            abovenet <= abovenet_2;
          else
            abovenet <= abovenet_9;
          end
        default: abovenet <= abovenet_0;
      endcase
  end

// State Mek abovenet Output logic
always @(abovenet)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (abovenet)
        abovenet_0: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 1;
            hp = 0;
            gm = 0;
            ford = 0;
            chevys = 1;
            chillis = 1;
            macdonalds = 1;
            lockheed = 1;
            martin = 1;
            marvin = 0;
            martian = 0;
            molokai = 1;
          end
        abovenet_1: begin
            webvan = 0;
            sears = 1;
            lucent = 0;
            ibm = 0;
            intel = 0;
            hp = 0;
            gm = 0;
            ford = 0;
            chevys = 0;
            chillis = 0;
            macdonalds = 0;
            lockheed = 1;
            martin = 0;
            marvin = 0;
            martian = 1;
            molokai = 0;
          end
        abovenet_2: begin
            webvan = 0;
            sears = 1;
            lucent = 0;
            ibm = 0;
            intel = 0;
            hp = 0;
            gm = 0;
            ford = 0;
            chevys = 0;
            chillis = 0;
            macdonalds = 1;
            lockheed = 1;
            martin = 0;
            marvin = 0;
            martian = 0;
            molokai = 1;
          end
        abovenet_3: begin
            webvan = 1;
            sears = 1;
            lucent = 0;
            ibm = 0;
            intel = 1;
            hp = 0;
            gm = 0;
            ford = 0;
            chevys = 1;
            chillis = 1;
            macdonalds = 1;
            lockheed = 1;
            martin = 1;
            marvin = 1;
            martian = 0;
            molokai = 0;
          end
        abovenet_4: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 1;
            hp = 0;
            gm = 0;
            ford = 0;
            chevys = 0;
            chillis = 0;
            macdonalds = 0;
            lockheed = 1;
            martin = 1;
            marvin = 0;
            martian = 1;
            molokai = 0;
          end
        abovenet_5: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 0;
            hp = 1;
            gm = 0;
            ford = 0;
            chevys = 0;
            chillis = 0;
            macdonalds = 1;
            lockheed = 1;
            martin = 1;
            marvin = 1;
            martian = 0;
            molokai = 1;
          end
        abovenet_6: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 0;
            hp = 0;
            gm = 1;
            ford = 0;
            chevys = 0;
            chillis = 0;
            macdonalds = 1;
            lockheed = 1;
            martin = 0;
            marvin = 1;
            martian = 0;
            molokai = 1;
          end
        abovenet_7: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 0;
            hp = 0;
            gm = 0;
            ford = 1;
            chevys = 0;
            chillis = 0;
            macdonalds = 1;
            lockheed = 0;
            martin = 1;
            marvin = 0;
            martian = 0;
            molokai = 0;
          end
        abovenet_8: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 0;
            hp = 0;
            gm = 0;
            ford = 0;
            chevys = 1;
            chillis = 0;
            macdonalds = 0;
            lockheed = 1;
            martin = 1;
            marvin = 1;
            martian = 0;
            molokai = 1;
          end
        abovenet_9: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 0;
            hp = 0;
            gm = 0;
            ford = 0;
            chevys = 0;
            chillis = 1;
            macdonalds = 1;
            lockheed = 0;
            martin = 0;
            marvin = 0;
            martian = 1;
            molokai = 1;
          end
        default: begin
            webvan = 0;
            sears = 0;
            lucent = 0;
            ibm = 0;
            intel = 1;
            hp = 1;
            gm = 1;
            ford = 1;
            chevys = 0;
            chillis = 1;
            macdonalds = 1;
            lockheed = 0;
            martin = 0;
            marvin = 1;
            martian = 1;
            molokai = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire nasdaq_out;
nut_001_lut #(2) nut_001_lut_inst_nasdaq (
  .din({vcc,martian}),
  .mask(4'h2),
  .out(nasdaq_out)
);

always @(nasdaq_out)
begin
   amex = nasdaq_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire taoist_out;
nut_001_lut #(3) nut_001_lut_inst_taoist (
  .din({lucent,gnd,solder}),
  .mask(8'b01000000),
  .out(taoist_out)
);

always @(taoist_out)
begin
   dow = taoist_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire microsoft_out;
nut_001_lut #(4) nut_001_lut_inst_microsoft (
  .din({ants,inquisition,surprise,larry}),
  .mask(16'b0101010010100010),
  .out(microsoft_out)
);

always @(microsoft_out)
begin
   liberace = microsoft_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire oracle_out;
nut_001_lut #(3) nut_001_lut_inst_oracle (
  .din({rainbow,capitalist,thor}),
  .mask(8'hd5),
  .out(oracle_out)
);

always @(oracle_out)
begin
   sun = oracle_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire century_out;
nut_001_lut #(5) nut_001_lut_inst_century (
  .din({vcc,ebi,weapons,sortout,athena}),
  .mask(32'h6304503a),
  .out(century_out)
);

always @(century_out)
begin
   bfi = century_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire safeway_out;
nut_001_lut #(3) nut_001_lut_inst_safeway (
  .din({ibm,vcc,tako}),
  .mask(8'hb3),
  .out(safeway_out)
);

always @(safeway_out)
begin
   harrydavid = safeway_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire pacbell_out;
nut_001_lut #(1) nut_001_lut_inst_pacbell (
  .din({sears}),
  .mask(2'b00),
  .out(pacbell_out)
);

always @(pacbell_out)
begin
   pepsi = pacbell_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire tsmc_out;
nut_001_lut #(2) nut_001_lut_inst_tsmc (
  .din({abraham,tamago}),
  .mask(4'h4),
  .out(tsmc_out)
);

always @(tsmc_out)
begin
   att = tsmc_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire papyrus_out;
nut_001_lut #(4) nut_001_lut_inst_papyrus (
  .din({lxtcen,cryptic,wanton,firemonkey}),
  .mask(16'b1001000001000010),
  .out(papyrus_out)
);

always @(papyrus_out)
begin
   bathbody = papyrus_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire sharperimg_out;
nut_001_lut #(4) nut_001_lut_inst_sharperimg (
  .din({vcc,neptune,dirty,scotch}),
  .mask(16'b0100001000100010),
  .out(sharperimg_out)
);

always @(sharperimg_out)
begin
   macys = sharperimg_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire honda_out;
nut_001_lut #(2) nut_001_lut_inst_honda (
  .din({thread,rod}),
  .mask(4'b1101),
  .out(honda_out)
);

always @(honda_out)
begin
   mitsubishi = honda_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire kbtoys_out;
nut_001_lut #(4) nut_001_lut_inst_kbtoys (
  .din({wiggles,chevys,amex,vcc}),
  .mask(16'h9175),
  .out(kbtoys_out)
);

always @(kbtoys_out)
begin
   pimpernel = kbtoys_out;
end

// In range compare
always @(thread or thedon or att or qfvcensorce or chief or roid or macys)
  begin
    if ({thread,thedon,att,qfvcensorce,chief,roid,macys} > 199 &&
        {thread,thedon,att,qfvcensorce,chief,roid,macys} < 209)
      toysrus = 1;
    else
      toysrus = 0;
  end

// XNOR all of these bits together
always @(the_pope or square or south or nobody or expects_the or gnd or dreamcoat or vcc or gnd or gnd)
  begin
      gap = ~^ {the_pope,square,south,nobody,expects_the,gnd,dreamcoat,vcc,gnd,gnd};
  end

// XOR all of these bits together
always @(bust or moonraker or zeus or eeevil)
  begin
      bananarep = ^ {bust,moonraker,zeus,eeevil};
  end

reg feedback_pt_137;

always @(muggers or feedback_pt_137)
  begin
      oldnavy =  muggers &  feedback_pt_137;
  end

reg feedback_pt_138;

always @(sake or feedback_pt_138)
  begin
      clothing = !sake | !feedback_pt_138;
  end

reg feedback_pt_139;

always @(vcc or feedback_pt_139)
  begin
      starbucks = !vcc | !feedback_pt_139;
  end

reg feedback_pt_140;

always @(gnd or feedback_pt_140)
  begin
      coffee = !gnd ^  feedback_pt_140;
  end

reg feedback_pt_141;

always @(chillis or feedback_pt_141)
  begin
      structure = !chillis ^ !feedback_pt_141;
  end

reg feedback_pt_142;

always @(abraham or feedback_pt_142)
  begin
      jcrew =  abraham ^  feedback_pt_142;
  end

reg feedback_pt_143;

always @(handroll or feedback_pt_143)
  begin
      whatelse = !handroll ^ !feedback_pt_143;
  end

reg feedback_pt_144;

always @(vcc or feedback_pt_144)
  begin
      blessyou = !vcc | !feedback_pt_144;
  end

reg feedback_pt_145;

always @(valve or feedback_pt_145)
  begin
      kerchoozle = !valve | !feedback_pt_145;
  end

reg feedback_pt_146;

always @(vcc or feedback_pt_146)
  begin
      atchoo = !vcc ^  feedback_pt_146;
  end

reg feedback_pt_147;

always @(peta or feedback_pt_147)
  begin
      siamese =  peta ^ !feedback_pt_147;
  end

reg feedback_pt_148;

always @(thor or feedback_pt_148)
  begin
      tabby =  thor & !feedback_pt_148;
  end

reg feedback_pt_149;

always @(jiminy or feedback_pt_149)
  begin
      notsure = !jiminy ^  feedback_pt_149;
  end

reg feedback_pt_150;

always @(surprise or feedback_pt_150)
  begin
      monster = !surprise & !feedback_pt_150;
  end

reg feedback_pt_151;

always @(surprise or feedback_pt_151)
  begin
      incagardens = !surprise ^ !feedback_pt_151;
  end

reg feedback_pt_152;

always @(whiteboard or feedback_pt_152)
  begin
      genji = !whiteboard | !feedback_pt_152;
  end

reg feedback_pt_153;

always @(macys or feedback_pt_153)
  begin
      lafondue =  macys & !feedback_pt_153;
  end

reg feedback_pt_154;

always @(vcc or feedback_pt_154)
  begin
      subway = !vcc &  feedback_pt_154;
  end

reg feedback_pt_155;

always @(peopleeater or feedback_pt_155)
  begin
      pasta =  peopleeater | !feedback_pt_155;
  end

reg feedback_pt_156;

always @(guy or feedback_pt_156)
  begin
      pomodoro =  guy &  feedback_pt_156;
  end

reg feedback_pt_157;

always @(clothing or feedback_pt_157)
  begin
      puttanesca = !clothing ^  feedback_pt_157;
  end

reg feedback_pt_158;

always @(gnd or feedback_pt_158)
  begin
      golfland =  gnd ^ !feedback_pt_158;
  end

reg feedback_pt_159;

always @(guy or feedback_pt_159)
  begin
      arcade =  guy &  feedback_pt_159;
  end

reg feedback_pt_160;

always @(lala or feedback_pt_160)
  begin
      jacuzzi = !lala &  feedback_pt_160;
  end

reg feedback_pt_161;

always @(intel or feedback_pt_161)
  begin
      blaster = !intel ^  feedback_pt_161;
  end

reg feedback_pt_162;

always @(terrance or feedback_pt_162)
  begin
      bonker =  terrance | !feedback_pt_162;
  end

reg feedback_pt_163;

always @(dinoblaster or feedback_pt_163)
  begin
      beemer = !dinoblaster ^ !feedback_pt_163;
  end

reg feedback_pt_164;

always @(bonker or feedback_pt_164)
  begin
      bono = !bonker ^  feedback_pt_164;
  end

reg feedback_pt_165;

always @(safada or feedback_pt_165)
  begin
      concorde = !safada | !feedback_pt_165;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stemcell <= 0;
    else if (yummy)
      stemcell <= gnd;
  end

always @(stemcell)
  begin
      feedback_pt_137 = stemcell;
  end

always @(stemcell)
  begin
      feedback_pt_138 = stemcell;
  end

always @(stemcell)
  begin
      feedback_pt_139 = stemcell;
  end

always @(stemcell)
  begin
      feedback_pt_140 = stemcell;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shark <= 0;
    else if (vcc)
      shark <= mandarin;
  end

always @(shark)
  begin
      feedback_pt_141 = shark;
  end

always @(shark)
  begin
      feedback_pt_142 = shark;
  end

always @(shark)
  begin
      feedback_pt_143 = shark;
  end

wire carolina_wire;

dffeas carolina_ff (
  .clk(clock0),
  .d(notsure),
  .ena(harrydavid),
  .sclr(thedon),
  .sload(crapeteria),
  .asdata(yellowtail),
  .clrn(!reset0),
  .q(carolina_wire)
);

always @(carolina_wire) begin
   avon = carolina_wire;
end

always @(avon)
  begin
      feedback_pt_144 = avon;
  end

always @(avon)
  begin
      feedback_pt_145 = avon;
  end

always @(avon)
  begin
      feedback_pt_146 = avon;
  end

always @(avon)
  begin
      feedback_pt_147 = avon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bomb <= 0;
    else
      bomb <= gnd;
  end

always @(bomb)
  begin
      feedback_pt_148 = bomb;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      school <= 1;
    else
      school <= often;
  end

always @(school)
  begin
      feedback_pt_149 = school;
  end

always @(school)
  begin
      feedback_pt_150 = school;
  end

always @(school)
  begin
      feedback_pt_151 = school;
  end

always @(school)
  begin
      feedback_pt_152 = school;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cornell <= 0;
    else
      cornell <= gnd;
  end

always @(cornell)
  begin
      feedback_pt_153 = cornell;
  end

always @(cornell)
  begin
      feedback_pt_154 = cornell;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      soccer <= 0;
    else if (gnd)
      soccer <= ebay;
    else if (srvcensorce)
      soccer <= 0;
  end

always @(soccer)
  begin
      feedback_pt_155 = soccer;
  end

always @(soccer)
  begin
      feedback_pt_156 = soccer;
  end

always @(soccer)
  begin
      feedback_pt_157 = soccer;
  end

always @(soccer)
  begin
      feedback_pt_158 = soccer;
  end

always @(soccer)
  begin
      feedback_pt_159 = soccer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      softball <= 0;
    else if (jcrew)
      softball <= macdonalds;
    else if (wrecker)
      softball <= 0;
  end

always @(softball)
  begin
      feedback_pt_160 = softball;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fieldhockey <= 0;
    else
      fieldhockey <= bart;
  end

always @(fieldhockey)
  begin
      feedback_pt_161 = fieldhockey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nirish <= 1;
    else
      nirish <= rampacker;
  end

always @(nirish)
  begin
      feedback_pt_162 = nirish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peace <= 0;
    else if (gnd)
      peace <= ebi;
  end

always @(peace)
  begin
      feedback_pt_163 = peace;
  end

wire mideast_wire;

dffeas mideast_ff (
  .clk(clock0),
  .d(devotion),
  .ena(sweetie),
  .sclr(mars),
  .sload(california),
  .asdata(beemer),
  .clrn(!reset0),
  .q(mideast_wire)
);

always @(mideast_wire) begin
   illegal = mideast_wire;
end

always @(illegal)
  begin
      feedback_pt_164 = illegal;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drugs <= 1;
    else
      drugs <= clothing;
  end

always @(drugs)
  begin
      feedback_pt_165 = drugs;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      infesting <= 0;
    else
      infesting <= gnd;
  end

wire children_wire;

dffea children_ff (
  .clk(clock0),
  .d(captain),
  .ena(vcc),
  .adata(vcc),
  .clrn(!reset0),
  .q(children_wire)
);

always @(children_wire) begin
   crank = children_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marijuana <= 0;
    else
      marijuana <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lsd <= 0;
    else if (cornell)
      lsd <= secondrate;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      acid <= 1;
    else
      acid <= fieldhockey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crack <= 0;
    else if (itchy)
      crack <= billnted;
  end

wire speed_wire;

dffeas speed_ff (
  .clk(clock0),
  .d(gap),
  .ena(vcc),
  .sclr(pomodoro),
  .sload(vcc),
  .asdata(inquisition),
  .clrn(!reset0),
  .q(speed_wire)
);

always @(speed_wire) begin
   meth = speed_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crystal <= 0;
    else if (noyoudirty)
      crystal <= stemcell;
    else if (gnd)
      crystal <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      uppers <= 0;
    else
      uppers <= neptune;
  end

wire downers_wire;

dffeas downers_ff (
  .clk(clock0),
  .d(vcc),
  .ena(crystal),
  .sclr(acid),
  .sload(vcc),
  .asdata(gnd),
  .clrn(!reset0),
  .q(downers_wire)
);

always @(downers_wire) begin
   viagra = downers_wire;
end

wire yohimbe_wire;

dffeas yohimbe_ff (
  .clk(clock0),
  .d(gnd),
  .ena(bathbody),
  .sclr(tabby),
  .sload(gnd),
  .asdata(animal),
  .clrn(!reset0),
  .q(yohimbe_wire)
);

always @(yohimbe_wire) begin
   decongestant = yohimbe_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nyquil <= 0;
    else
      nyquil <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dimetap <= 0;
    else if (kana)
      dimetap <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      coughsyrup <= 0;
    else
      coughsyrup <= skinner;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vicks <= 0;
    else if (gnd)
      vicks <= 0;
    else if (plaster)
      vicks <= vegas;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      comtrex <= 0;
    else if (gnd)
      comtrex <= vcc;
    else if (weapons)
      comtrex <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aspirin <= 0;
    else if (vicks)
      aspirin <= fear;
    else if (golfland)
      aspirin <= 0;
  end

wire advil_wire;

dffeas advil_ff (
  .clk(clock0),
  .d(vcc),
  .ena(gnd),
  .sclr(peace),
  .sload(liberace),
  .asdata(illegal),
  .clrn(!reset0),
  .q(advil_wire)
);

always @(advil_wire) begin
   naproxen = advil_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tylenol <= 0;
    else if (concorde)
      tylenol <= killme;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sinus <= 0;
    else if (bomb)
      sinus <= 0;
    else if (nigiri)
      sinus <= dumbarton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sinew <= 0;
    else if (rewire)
      sinew <= brothers;
    else if (vcc)
      sinew <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      snort <= 0;
    else if (rocks)
      snort <= piggish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pcp <= 0;
    else if (homerun)
      pcp <= goodmonkey;
    else if (nirish)
      pcp <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      phenyalanine <= 0;
    else if (lxtcen)
      phenyalanine <= vcc;
    else if (vcc)
      phenyalanine <= 0;
  end

wire saccarine_wire;

dffeas saccarine_ff (
  .clk(clock0),
  .d(gnd),
  .ena(gnd),
  .sclr(subway),
  .sload(genji),
  .asdata(brothers),
  .clrn(!reset0),
  .q(saccarine_wire)
);

always @(saccarine_wire) begin
   nutrasweet = saccarine_wire;
end

wire sugar_wire;

dffeas sugar_ff (
  .clk(clock0),
  .d(iguana),
  .ena(tabby),
  .sclr(bust),
  .sload(vcc),
  .asdata(sgates),
  .clrn(!reset0),
  .q(sugar_wire)
);

always @(sugar_wire) begin
   honey = sugar_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rose <= 1;
    else
      rose <= blaster;
  end

wire foliage_wire;

dffeas foliage_ff (
  .clk(clock0),
  .d(gnd),
  .ena(pantalones),
  .sclr(vcc),
  .sload(sgates),
  .asdata(skinner),
  .clrn(!reset0),
  .q(foliage_wire)
);

always @(foliage_wire) begin
   defoliant = foliage_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      exfoliant <= 0;
    else if (vcc)
      exfoliant <= 0;
    else if (california)
      exfoliant <= deuce;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      curious <= 0;
    else if (possum)
      curious <= nutrasweet;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      george <= 0;
    else if (avon)
      george <= tukatuk;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      balloon <= 1;
    else
      balloon <= vcc;
  end

wire robust_wire;

dffeas robust_ff (
  .clk(clock0),
  .d(surprise),
  .ena(softball),
  .sclr(starbucks),
  .sload(edible),
  .asdata(dow),
  .clrn(!reset0),
  .q(robust_wire)
);

always @(robust_wire) begin
   enoch = robust_wire;
end

wire bobblehead_wire;

dffeas bobblehead_ff (
  .clk(clock0),
  .d(gnd),
  .ena(whatelse),
  .sclr(salmon),
  .sload(cucumber),
  .asdata(rampacker),
  .clrn(!reset0),
  .q(bobblehead_wire)
);

always @(bobblehead_wire) begin
   cheez = bobblehead_wire;
end

wire zed_wire;

dffeas zed_ff (
  .clk(clock0),
  .d(gnd),
  .ena(softball),
  .sclr(deuce),
  .sload(ladder),
  .asdata(pimpernel),
  .clrn(!reset0),
  .q(zed_wire)
);

always @(zed_wire) begin
   zen = zed_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      falafel <= 0;
    else if (curious)
      falafel <= 0;
    else if (siamese)
      falafel <= timingmodel;
  end

wire rodriguez_wire;

dffeas rodriguez_ff (
  .clk(clock0),
  .d(happyists),
  .ena(jcrew),
  .sclr(chainsaw),
  .sload(ariel),
  .asdata(pictures),
  .clrn(!reset0),
  .q(rodriguez_wire)
);

always @(rodriguez_wire) begin
   dukdodger = rodriguez_wire;
end

wire ocha_wire;

dffea ocha_ff (
  .clk(clock0),
  .d(gnd),
  .ena(gnd),
  .adata(iguana),
  .clrn(!reset0),
  .q(ocha_wire)
);

always @(ocha_wire) begin
   kaisha = ocha_wire;
end

reg feedback_pt_166;

always @(dirty or feedback_pt_166)
  begin
      hellokitty = !dirty ^ !feedback_pt_166;
  end

reg feedback_pt_167;

always @(gnd or feedback_pt_167)
  begin
      badtzmaru =  gnd &  feedback_pt_167;
  end

reg feedback_pt_168;

always @(lafondue or feedback_pt_168)
  begin
      sapporo =  lafondue | !feedback_pt_168;
  end

reg feedback_pt_169;

always @(blessyou or feedback_pt_169)
  begin
      asahi =  blessyou &  feedback_pt_169;
  end

reg feedback_pt_170;

always @(coughsyrup or feedback_pt_170)
  begin
      hummer =  coughsyrup & !feedback_pt_170;
  end

reg feedback_pt_171;

always @(crunchyfrog or feedback_pt_171)
  begin
      elian =  crunchyfrog & !feedback_pt_171;
  end

reg feedback_pt_172;

always @(dumbarton or feedback_pt_172)
  begin
      condit = !dumbarton &  feedback_pt_172;
  end

reg feedback_pt_173;

always @(gnd or feedback_pt_173)
  begin
      gopher = !gnd ^ !feedback_pt_173;
  end

reg feedback_pt_174;

always @(cryptic or feedback_pt_174)
  begin
      giraffe =  cryptic ^  feedback_pt_174;
  end

reg feedback_pt_175;

always @(siamese or feedback_pt_175)
  begin
      lotus =  siamese |  feedback_pt_175;
  end

reg feedback_pt_176;

always @(hellokitty or feedback_pt_176)
  begin
      flyingmonkey =  hellokitty &  feedback_pt_176;
  end

reg feedback_pt_177;

always @(smithers or feedback_pt_177)
  begin
      scotchtape =  smithers & !feedback_pt_177;
  end

reg feedback_pt_178;

always @(rose or feedback_pt_178)
  begin
      wicked = !rose ^  feedback_pt_178;
  end

reg feedback_pt_179;

always @(bert or feedback_pt_179)
  begin
      witch =  bert & !feedback_pt_179;
  end

reg feedback_pt_180;

always @(structure or feedback_pt_180)
  begin
      ghost =  structure & !feedback_pt_180;
  end

reg feedback_pt_181;

always @(crab or feedback_pt_181)
  begin
      goblin =  crab ^ !feedback_pt_181;
  end

reg feedback_pt_182;

always @(gnd or feedback_pt_182)
  begin
      elf =  gnd &  feedback_pt_182;
  end

reg feedback_pt_183;

always @(dumbarton or feedback_pt_183)
  begin
      centaur = !dumbarton ^  feedback_pt_183;
  end

reg feedback_pt_184;

always @(arcade or feedback_pt_184)
  begin
      theseus = !arcade |  feedback_pt_184;
  end

reg feedback_pt_185;

always @(uppers or feedback_pt_185)
  begin
      minotaur =  uppers & !feedback_pt_185;
  end

reg feedback_pt_186;

always @(phenyalanine or feedback_pt_186)
  begin
      midas = !phenyalanine ^  feedback_pt_186;
  end

reg feedback_pt_187;

always @(condit or feedback_pt_187)
  begin
      icarus =  condit & !feedback_pt_187;
  end

reg feedback_pt_188;

always @(gnd or feedback_pt_188)
  begin
      pegasus = !gnd | !feedback_pt_188;
  end

reg feedback_pt_189;

always @(comtrex or feedback_pt_189)
  begin
      troll = !comtrex &  feedback_pt_189;
  end

reg feedback_pt_190;

always @(vcc or feedback_pt_190)
  begin
      warlock =  vcc ^  feedback_pt_190;
  end

reg feedback_pt_191;

always @(aspirin or feedback_pt_191)
  begin
      chowmein = !aspirin | !feedback_pt_191;
  end

reg feedback_pt_192;

always @(ramone or feedback_pt_192)
  begin
      stirfry = !ramone ^ !feedback_pt_192;
  end

reg feedback_pt_193;

always @(cubish or feedback_pt_193)
  begin
      tasty = !cubish | !feedback_pt_193;
  end

reg feedback_pt_194;

always @(square or feedback_pt_194)
  begin
      pastrami =  square ^ !feedback_pt_194;
  end

reg feedback_pt_195;

always @(vcc or feedback_pt_195)
  begin
      turkey =  vcc ^  feedback_pt_195;
  end

reg feedback_pt_196;

always @(sun or feedback_pt_196)
  begin
      beast =  sun |  feedback_pt_196;
  end

reg feedback_pt_197;

always @(peta or feedback_pt_197)
  begin
      bacon =  peta & !feedback_pt_197;
  end

wire salami_wire;

dffeas salami_ff (
  .clk(clock0),
  .d(stemcell),
  .ena(kaisha),
  .sclr(balloon),
  .sload(troll),
  .asdata(falafel),
  .clrn(!reset0),
  .q(salami_wire)
);

always @(salami_wire) begin
   peaves = salami_wire;
end

always @(peaves)
  begin
      feedback_pt_166 = peaves;
  end

always @(peaves)
  begin
      feedback_pt_167 = peaves;
  end

always @(peaves)
  begin
      feedback_pt_168 = peaves;
  end

wire snape_wire;

dffeas snape_ff (
  .clk(clock0),
  .d(weevil),
  .ena(asahi),
  .sclr(gnd),
  .sload(dumbarton),
  .asdata(marijuana),
  .clrn(!reset0),
  .q(snape_wire)
);

always @(snape_wire) begin
   hagrid = snape_wire;
end

always @(hagrid)
  begin
      feedback_pt_169 = hagrid;
  end

always @(hagrid)
  begin
      feedback_pt_170 = hagrid;
  end

wire tonks_wire;

dffeas tonks_ff (
  .clk(clock0),
  .d(timingmodel),
  .ena(lsd),
  .sclr(cheez),
  .sload(vcc),
  .asdata(wakey),
  .clrn(!reset0),
  .q(tonks_wire)
);

always @(tonks_wire) begin
   bumbledork = tonks_wire;
end

always @(bumbledork)
  begin
      feedback_pt_171 = bumbledork;
  end

always @(bumbledork)
  begin
      feedback_pt_172 = bumbledork;
  end

always @(bumbledork)
  begin
      feedback_pt_173 = bumbledork;
  end

always @(bumbledork)
  begin
      feedback_pt_174 = bumbledork;
  end

always @(bumbledork)
  begin
      feedback_pt_175 = bumbledork;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moody <= 1;
    else
      moody <= minotaur;
  end

always @(moody)
  begin
      feedback_pt_176 = moody;
  end

always @(moody)
  begin
      feedback_pt_177 = moody;
  end

always @(moody)
  begin
      feedback_pt_178 = moody;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      madeye <= 0;
    else if (oldnavy)
      madeye <= barnum;
    else if (vcc)
      madeye <= 0;
  end

always @(madeye)
  begin
      feedback_pt_179 = madeye;
  end

always @(madeye)
  begin
      feedback_pt_180 = madeye;
  end

always @(madeye)
  begin
      feedback_pt_181 = madeye;
  end

always @(madeye)
  begin
      feedback_pt_182 = madeye;
  end

always @(madeye)
  begin
      feedback_pt_183 = madeye;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weasley <= 0;
    else if (gnd)
      weasley <= chewbacca;
  end

always @(weasley)
  begin
      feedback_pt_184 = weasley;
  end

always @(weasley)
  begin
      feedback_pt_185 = weasley;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floo <= 1;
    else
      floo <= gnd;
  end

always @(floo)
  begin
      feedback_pt_186 = floo;
  end

always @(floo)
  begin
      feedback_pt_187 = floo;
  end

wire powder_wire;

dffea powder_ff (
  .clk(clock0),
  .d(pantalones),
  .ena(lockheed),
  .adata(monster),
  .clrn(!reset0),
  .q(powder_wire)
);

always @(powder_wire) begin
   broom = powder_wire;
end

always @(broom)
  begin
      feedback_pt_188 = broom;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stick <= 0;
    else if (vcc)
      stick <= gnd;
  end

always @(stick)
  begin
      feedback_pt_189 = stick;
  end

wire quidditch_wire;

dffeas quidditch_ff (
  .clk(clock0),
  .d(witch),
  .ena(vcc),
  .sclr(gnd),
  .sload(george),
  .asdata(dukdodger),
  .clrn(!reset0),
  .q(quidditch_wire)
);

always @(quidditch_wire) begin
   phoenix = quidditch_wire;
end

always @(phoenix)
  begin
      feedback_pt_190 = phoenix;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      arizona <= 0;
    else if (jayqueeze)
      arizona <= pasta;
  end

always @(arizona)
  begin
      feedback_pt_191 = arizona;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fang <= 0;
    else if (chief)
      fang <= vcc;
  end

always @(fang)
  begin
      feedback_pt_192 = fang;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      scabbers <= 0;
    else
      scabbers <= animal;
  end

always @(scabbers)
  begin
      feedback_pt_193 = scabbers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      umbridge <= 0;
    else
      umbridge <= atchoo;
  end

always @(umbridge)
  begin
      feedback_pt_194 = umbridge;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      filch <= 1;
    else
      filch <= subway;
  end

always @(filch)
  begin
      feedback_pt_195 = filch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      norris <= 0;
    else
      norris <= defoliant;
  end

always @(norris)
  begin
      feedback_pt_196 = norris;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chuck <= 0;
    else if (gnd)
      chuck <= 0;
    else if (bumbledork)
      chuck <= timingmodel;
  end

always @(chuck)
  begin
      feedback_pt_197 = chuck;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sirius <= 0;
    else
      sirius <= george;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      black <= 0;
    else
      black <= timingmodel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lupin <= 0;
    else if (partners)
      lupin <= 0;
    else if (incagardens)
      lupin <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      severus <= 0;
    else if (kerchoozle)
      severus <= enoch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      arthur <= 0;
    else if (oitcen)
      arthur <= 0;
    else if (vcc)
      arthur <= po;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      snake <= 0;
    else if (vcc)
      snake <= dig;
    else if (wicked)
      snake <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mundungus <= 0;
    else if (ringlingbros)
      mundungus <= 0;
    else if (octapus)
      mundungus <= shrimp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      army <= 1;
    else
      army <= peaves;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crookshanks <= 0;
    else if (vcc)
      crookshanks <= beemer;
    else if (gnd)
      crookshanks <= 0;
  end

wire trevor_wire;

dffea trevor_ff (
  .clk(clock0),
  .d(concorde),
  .ena(hagrid),
  .adata(elian),
  .clrn(!reset0),
  .q(trevor_wire)
);

always @(trevor_wire) begin
   neville = trevor_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      longbottom <= 0;
    else
      longbottom <= ringlingbros;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bellatrix <= 0;
    else if (captain)
      bellatrix <= kaisha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lestrange <= 0;
    else
      lestrange <= blaster;
  end

wire malfoy_wire;

dffeas malfoy_ff (
  .clk(clock0),
  .d(bfi),
  .ena(chuck),
  .sclr(wiggum),
  .sload(icarus),
  .asdata(handroll),
  .clrn(!reset0),
  .q(malfoy_wire)
);

always @(malfoy_wire) begin
   draco = malfoy_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lucius <= 0;
    else if (snake)
      lucius <= hp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      narcissa <= 0;
    else
      narcissa <= animal;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      albus <= 0;
    else if (bert)
      albus <= 0;
    else if (incagardens)
      albus <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mcgonagall <= 1;
    else
      mcgonagall <= school;
  end

wire hogwarts_wire;

dffeas hogwarts_ff (
  .clk(clock0),
  .d(balloon),
  .ena(spain),
  .sclr(sinew),
  .sload(gnd),
  .asdata(roe),
  .clrn(!reset0),
  .q(hogwarts_wire)
);

always @(hogwarts_wire) begin
   rubeus = hogwarts_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drumstrang <= 0;
    else if (sweetie)
      drumstrang <= longbottom;
    else if (michelle)
      drumstrang <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      norbert <= 0;
    else if (soccer)
      norbert <= pilot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wizard <= 0;
    else if (gnd)
      wizard <= 0;
    else if (lestrange)
      wizard <= shrimp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      diagon <= 0;
    else
      diagon <= jacuzzi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fireplace <= 0;
    else if (chowmein)
      fireplace <= gnd;
    else if (wicked)
      fireplace <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crucio <= 1;
    else
      crucio <= army;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kedavra <= 0;
    else
      kedavra <= scabbers;
  end

wire mario_owes_wire;

dffeas mario_owes_ff (
  .clk(clock0),
  .d(vcc),
  .ena(whatelse),
  .sclr(wizard),
  .sload(tylenol),
  .asdata(gnd),
  .clrn(!reset0),
  .q(mario_owes_wire)
);

always @(mario_owes_wire) begin
   gregg_a = mario_owes_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burrito <= 0;
    else if (vcc)
      burrito <= jupiter;
  end

wire correctness_wire;

dffea correctness_ff (
  .clk(clock0),
  .d(noyoudirty),
  .ena(crucio),
  .adata(sirius),
  .clrn(!reset0),
  .q(correctness_wire)
);

always @(correctness_wire) begin
   cafe = correctness_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      synplicity_burrito <= 0;
    else if (vcc)
      synplicity_burrito <= tyycensor;
    else if (centaur)
      synplicity_burrito <= 0;
  end

wire guacamole_wire;

dffeas guacamole_ff (
  .clk(clock0),
  .d(filch),
  .ena(diagon),
  .sclr(broom),
  .sload(vadar),
  .asdata(hagrid),
  .clrn(!reset0),
  .q(guacamole_wire)
);

always @(guacamole_wire) begin
   sourcream = guacamole_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      onion <= 0;
    else if (mundungus)
      onion <= weevil;
    else if (scotchtape)
      onion <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jalapeno <= 1;
    else
      jalapeno <= elf;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beef <= 0;
    else if (norbert)
      beef <= gnd;
    else if (holland)
      beef <= 0;
  end

wire pork_wire;

dffeas pork_ff (
  .clk(clock0),
  .d(salmon),
  .ena(hiway),
  .sclr(mcgonagall),
  .sload(lestrange),
  .asdata(dingbat),
  .clrn(!reset0),
  .q(pork_wire)
);

always @(pork_wire) begin
   blackbeans = pork_wire;
end

// data words for bus muxing
wire [6:0] refriedbeans_word0_data;
wire [6:0] refriedbeans_word1_data;
wire [6:0] refriedbeans_word2_data;
wire [6:0] refriedbeans_word3_data;
wire [6:0] refriedbeans_word4_data;
wire [6:0] refriedbeans_word5_data;
wire [6:0] refriedbeans_word6_data;
wire [6:0] refriedbeans_word7_data;
assign refriedbeans_word0_data = {elian,touch,whatelse,bellatrix,sirius,gnd,vcc};
assign refriedbeans_word1_data = {vcc,gnd,mcgonagall,gregg_a,arthur,ford,gnd};
assign refriedbeans_word2_data = {puertorico,ariel,lupin,fang,sun,srvcensorce,gnd};
assign refriedbeans_word3_data = {billnted,vcc,rocks,gnd,diagon,kedavra,vcc};
assign refriedbeans_word4_data = {zen,vcc,gnd,pepsi,elguapo,onion,vcc};
assign refriedbeans_word5_data = {vcc,whatelse,ritsu,zinc,gnd,ford,vcc};
assign refriedbeans_word6_data = {liberation,tuna,rubeus,chowmein,stoned,sinew,tasty};
assign refriedbeans_word7_data = {army,psycho,drumstrang,gnd,nation,burrito,chuck};

// select control for bus muxing
wire [20:0] refriedbeans_select;
assign refriedbeans_select = {gnd,gnd,ritsu,molokai,vcc,england,rocks,pilot,synplicity_burrito,rainbow,macdonalds,chief,zinc,viagra,cain,blackbeans,gnd,pepsi,pegasus,macdonalds,pastrami};


// Mux output word
reg [6:0] refriedbeans_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    refriedbeans_result = refriedbeans_word0_data;
    if (refriedbeans_select[10])
        refriedbeans_result = refriedbeans_word7_data;

    if (refriedbeans_select == 25)
        refriedbeans_result = 34;

    if (refriedbeans_select == 153)
        refriedbeans_result = 0;

    if (refriedbeans_select == 162)
        refriedbeans_result = ~refriedbeans_word7_data;

    if (refriedbeans_select == 193)
        refriedbeans_result = ~refriedbeans_word4_data;

    if (refriedbeans_select == 196)
        refriedbeans_result = refriedbeans_word7_data;

    if (refriedbeans_select[13] && refriedbeans_select[13])
        refriedbeans_result = refriedbeans_word3_data;

    if (refriedbeans_select[3])
        refriedbeans_result = refriedbeans_word4_data;

    if (refriedbeans_select[6] && refriedbeans_select[6])
        refriedbeans_result = refriedbeans_word1_data;

    if (refriedbeans_select == 134)
        refriedbeans_result = 0;

    if (refriedbeans_select == 209)
        refriedbeans_result = ~refriedbeans_word1_data;

    if (refriedbeans_select == 213)
        refriedbeans_result = 23;

    if (refriedbeans_select == 133)
        refriedbeans_result = 0;

    if (refriedbeans_select[1])
        refriedbeans_result = refriedbeans_word0_data;

    if (refriedbeans_select == 76)
        refriedbeans_result = ~refriedbeans_word2_data;

end


// Send the out bus back to the world
always @(refriedbeans_result)
begin
    pintobeans = refriedbeans_result[0];
    tortilla = refriedbeans_result[1];
    salsa = refriedbeans_result[2];
    picante = refriedbeans_result[3];
    chips = refriedbeans_result[4];
    tabasco = refriedbeans_result[5];
    mexican = refriedbeans_result[6];
end

// RAM - Data is 5 bits. Depth is 32 words.
wire [4:0] too_big_d;
wire [4:0] too_big_raddr;
wire [4:0] too_big_waddr;
wire too_big_rclk, too_big_wclk, too_big_we;

assign too_big_d = {webvan,honey,vcc,nyquil,lotus};
assign too_big_raddr = {zinc,gnd,snort,gnd,scabbers};
assign too_big_waddr = {vcc,athena,vcc,mitsubishi,gnd};
assign too_big_rclk = clock0;
assign too_big_wclk = clock0;
assign too_big_we = exodus;

reg [4:0] too_big_q;
reg [4:0] too_big_ram [31:0];
reg [4:0] too_big_raddr_reg;
reg [4:0] too_big_waddr_reg;


// synthesis translate off
initial begin
    too_big_waddr_reg = 0;
    too_big_raddr_reg = 0;
    too_big_ram[0] = 0;
    too_big_ram[1] = 0;
    too_big_ram[2] = 0;
    too_big_ram[3] = 0;
    too_big_ram[4] = 0;
    too_big_ram[5] = 0;
    too_big_ram[6] = 0;
    too_big_ram[7] = 0;
    too_big_ram[8] = 0;
    too_big_ram[9] = 0;
    too_big_ram[10] = 0;
    too_big_ram[11] = 0;
    too_big_ram[12] = 0;
    too_big_ram[13] = 0;
    too_big_ram[14] = 0;
    too_big_ram[15] = 0;
    too_big_ram[16] = 0;
    too_big_ram[17] = 0;
    too_big_ram[18] = 0;
    too_big_ram[19] = 0;
    too_big_ram[20] = 0;
    too_big_ram[21] = 0;
    too_big_ram[22] = 0;
    too_big_ram[23] = 0;
    too_big_ram[24] = 0;
    too_big_ram[25] = 0;
    too_big_ram[26] = 0;
    too_big_ram[27] = 0;
    too_big_ram[28] = 0;
    too_big_ram[29] = 0;
    too_big_ram[30] = 0;
    too_big_ram[31] = 0;
    too_big_q = 0;
end
// synthesis translate on
always @ (posedge too_big_wclk)
begin
   too_big_waddr_reg <= too_big_waddr;
end

always @ (posedge too_big_wclk)
begin
  if (too_big_we) too_big_ram[too_big_waddr_reg] <= too_big_d;
end

// don't register the read addr
//   to prevent collision behavior mismatch
always @ (too_big_raddr)
begin
  too_big_raddr_reg <= too_big_raddr;
end

always @ (posedge too_big_rclk)
begin
  too_big_q <= too_big_ram[too_big_raddr_reg];
end

always @ (too_big_q)
begin
   llamas_dont_eat_burrito=too_big_q[0];
   director_of_llamas=too_big_q[1];
   fufu=too_big_q[2];
   castaway=too_big_q[3];
   coconut=too_big_q[4];
end

// OR all of these bits together
always @(marijuana or beast or gnd or gopher or lxtcen or vcc or vcc or crookshanks or vcc or animal)
  begin
      maryann = | {marijuana,beast,gnd,gopher,lxtcen,vcc,vcc,crookshanks,vcc,animal};
  end

// Random 2 input look up table
always @(severus or bananarep)
  begin
    casex ({severus,bananarep})
      0: gilligan=0;
      1: gilligan=1;
      2: gilligan=1;
      3: gilligan=0;
      default: gilligan=0;
    endcase
  end


// building a 8 to 1 MUX operator
reg [7:0] skipper_mux_dat;
reg [2:0] skipper_mux_sel;
always @(ghost or puertorico or potter or pintobeans or hellokitty or lucius or director_of_llamas or black)
  begin
    skipper_mux_dat = {ghost,puertorico,potter,pintobeans,hellokitty,lucius,director_of_llamas,black};
  end

always @(tortilla or scotchtape or think)
  begin
    skipper_mux_sel = {tortilla,scotchtape,think};
  end

always @(skipper_mux_dat or skipper_mux_sel)
  begin
    professor = skipper_mux_dat[skipper_mux_sel];
  end

// Random 8 input look up table
always @(maryann or vcc or gnd or partners or overeducated or director_of_llamas or vcc or mexican)
  begin
    casex ({maryann,vcc,gnd,partners,overeducated,director_of_llamas,vcc,mexican})
      0: moviestar=1;
      1: moviestar=1;
      2: moviestar=1;
      3: moviestar=1;
      4: moviestar=1;
      5: moviestar=0;
      6: moviestar=0;
      7: moviestar=1;
      8: moviestar=0;
      9: moviestar=0;
      10: moviestar=1;
      11: moviestar=1;
      12: moviestar=0;
      13: moviestar=0;
      14: moviestar=0;
      15: moviestar=0;
      16: moviestar=1;
      17: moviestar=1;
      18: moviestar=0;
      19: moviestar=1;
      20: moviestar=1;
      21: moviestar=0;
      22: moviestar=1;
      23: moviestar=0;
      24: moviestar=0;
      25: moviestar=1;
      26: moviestar=0;
      27: moviestar=1;
      28: moviestar=0;
      29: moviestar=0;
      30: moviestar=1;
      31: moviestar=1;
      32: moviestar=0;
      33: moviestar=0;
      34: moviestar=0;
      35: moviestar=0;
      36: moviestar=1;
      37: moviestar=1;
      38: moviestar=1;
      39: moviestar=0;
      40: moviestar=0;
      41: moviestar=1;
      42: moviestar=0;
      43: moviestar=0;
      44: moviestar=0;
      45: moviestar=0;
      46: moviestar=1;
      47: moviestar=0;
      48: moviestar=0;
      49: moviestar=1;
      50: moviestar=0;
      51: moviestar=1;
      52: moviestar=1;
      53: moviestar=1;
      54: moviestar=1;
      55: moviestar=0;
      56: moviestar=1;
      57: moviestar=1;
      58: moviestar=0;
      59: moviestar=1;
      60: moviestar=1;
      61: moviestar=0;
      62: moviestar=0;
      63: moviestar=1;
      64: moviestar=1;
      65: moviestar=1;
      66: moviestar=1;
      67: moviestar=0;
      68: moviestar=1;
      69: moviestar=0;
      70: moviestar=1;
      71: moviestar=0;
      72: moviestar=0;
      73: moviestar=0;
      74: moviestar=0;
      75: moviestar=1;
      76: moviestar=1;
      77: moviestar=0;
      78: moviestar=0;
      79: moviestar=1;
      80: moviestar=1;
      81: moviestar=0;
      82: moviestar=0;
      83: moviestar=0;
      84: moviestar=1;
      85: moviestar=0;
      86: moviestar=1;
      87: moviestar=0;
      88: moviestar=1;
      89: moviestar=0;
      90: moviestar=0;
      91: moviestar=1;
      92: moviestar=1;
      93: moviestar=0;
      94: moviestar=1;
      95: moviestar=1;
      96: moviestar=1;
      97: moviestar=0;
      98: moviestar=0;
      99: moviestar=0;
      100: moviestar=0;
      101: moviestar=1;
      102: moviestar=0;
      103: moviestar=0;
      104: moviestar=1;
      105: moviestar=0;
      106: moviestar=1;
      107: moviestar=0;
      108: moviestar=1;
      109: moviestar=1;
      110: moviestar=1;
      111: moviestar=1;
      112: moviestar=1;
      113: moviestar=1;
      114: moviestar=1;
      115: moviestar=0;
      116: moviestar=0;
      117: moviestar=0;
      118: moviestar=0;
      119: moviestar=1;
      120: moviestar=0;
      121: moviestar=0;
      122: moviestar=1;
      123: moviestar=1;
      124: moviestar=1;
      125: moviestar=1;
      126: moviestar=1;
      127: moviestar=0;
      128: moviestar=0;
      129: moviestar=0;
      130: moviestar=0;
      131: moviestar=1;
      132: moviestar=1;
      133: moviestar=1;
      134: moviestar=0;
      135: moviestar=1;
      136: moviestar=0;
      137: moviestar=0;
      138: moviestar=1;
      139: moviestar=0;
      140: moviestar=0;
      141: moviestar=1;
      142: moviestar=0;
      143: moviestar=0;
      144: moviestar=1;
      145: moviestar=0;
      146: moviestar=1;
      147: moviestar=0;
      148: moviestar=0;
      149: moviestar=1;
      150: moviestar=1;
      151: moviestar=1;
      152: moviestar=0;
      153: moviestar=1;
      154: moviestar=0;
      155: moviestar=1;
      156: moviestar=0;
      157: moviestar=1;
      158: moviestar=0;
      159: moviestar=0;
      160: moviestar=0;
      161: moviestar=0;
      162: moviestar=1;
      163: moviestar=0;
      164: moviestar=0;
      165: moviestar=0;
      166: moviestar=1;
      167: moviestar=1;
      168: moviestar=1;
      169: moviestar=1;
      170: moviestar=0;
      171: moviestar=0;
      172: moviestar=0;
      173: moviestar=1;
      174: moviestar=1;
      175: moviestar=1;
      176: moviestar=0;
      177: moviestar=1;
      178: moviestar=0;
      179: moviestar=0;
      180: moviestar=0;
      181: moviestar=0;
      182: moviestar=1;
      183: moviestar=1;
      184: moviestar=1;
      185: moviestar=0;
      186: moviestar=0;
      187: moviestar=0;
      188: moviestar=0;
      189: moviestar=0;
      190: moviestar=0;
      191: moviestar=1;
      192: moviestar=0;
      193: moviestar=0;
      194: moviestar=0;
      195: moviestar=0;
      196: moviestar=1;
      197: moviestar=0;
      198: moviestar=0;
      199: moviestar=0;
      200: moviestar=0;
      201: moviestar=1;
      202: moviestar=0;
      203: moviestar=1;
      204: moviestar=0;
      205: moviestar=1;
      206: moviestar=1;
      207: moviestar=1;
      208: moviestar=1;
      209: moviestar=0;
      210: moviestar=0;
      211: moviestar=0;
      212: moviestar=1;
      213: moviestar=1;
      214: moviestar=0;
      215: moviestar=1;
      216: moviestar=1;
      217: moviestar=1;
      218: moviestar=1;
      219: moviestar=0;
      220: moviestar=0;
      221: moviestar=1;
      222: moviestar=0;
      223: moviestar=0;
      224: moviestar=1;
      225: moviestar=1;
      226: moviestar=1;
      227: moviestar=0;
      228: moviestar=0;
      229: moviestar=1;
      230: moviestar=1;
      231: moviestar=0;
      232: moviestar=1;
      233: moviestar=1;
      234: moviestar=1;
      235: moviestar=0;
      236: moviestar=1;
      237: moviestar=0;
      238: moviestar=1;
      239: moviestar=0;
      240: moviestar=0;
      241: moviestar=1;
      242: moviestar=1;
      243: moviestar=0;
      244: moviestar=1;
      245: moviestar=0;
      246: moviestar=0;
      247: moviestar=0;
      248: moviestar=1;
      249: moviestar=0;
      250: moviestar=0;
      251: moviestar=0;
      252: moviestar=1;
      253: moviestar=1;
      254: moviestar=1;
      255: moviestar=0;
      default: moviestar=0;
    endcase
  end

// 8 bit SOP selector
always @(
        vcc or gnd  or 
        nyquil or meth  or 
        marvin or hp  or 
        srvcensorce or bellatrix  or 
        partners or professor  or 
        golfland or fufu  or 
        uppers or dimetap  or 
        gnd or crack 
)

begin
    ginger = 
      vcc & gnd |
      nyquil & meth |
      marvin & hp |
      srvcensorce & bellatrix |
      partners & professor |
      golfland & fufu |
      uppers & dimetap |
      gnd & crack;
end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jonas <= 0;
    else
    case ({phenyalanine,gnd})
       0 : jonas <= vcc;
       1 : jonas <= haze;
       2 : jonas <= jonas;
       3 : jonas <= jonas;
       default : jonas <= 0;
    endcase
  end

// Random 3 input look up table
always @(gregg_a or draco or gnd)
  begin
    casex ({gregg_a,draco,gnd})
      0: grumby=1;
      1: grumby=1;
      2: grumby=0;
      3: grumby=0;
      4: grumby=0;
      5: grumby=0;
      6: grumby=0;
      7: grumby=1;
      default: grumby=0;
    endcase
  end

// OR all of these bits together
always @(coughsyrup or vcc or lotus)
  begin
      minnow = | {coughsyrup,vcc,lotus};
  end


// building a 32 to 1 MUX operator
reg [31:0] lost_mux_dat;
reg [4:0] lost_mux_sel;
always @(vcc or umbridge or vcc or vegas or flyingmonkey or centaur or cafe or badtzmaru or hummer or onion or llamas_dont_eat_burrito or sinus or uppers or viagra or gnd or vcc or hellokitty or goblin or gnd or handroll or arizona or timingmodel or elguapo or neville or toysrus or gnd or bellatrix or potter or bellatrix or gilligan or crank or pcp)
  begin
    lost_mux_dat = {vcc,umbridge,vcc,vegas,flyingmonkey,centaur,cafe,badtzmaru,hummer,onion,llamas_dont_eat_burrito,sinus,uppers,viagra,gnd,vcc,hellokitty,goblin,gnd,handroll,arizona,timingmodel,elguapo,neville,toysrus,gnd,bellatrix,potter,bellatrix,gilligan,crank,pcp};
  end

always @(turkey or cornell or dimetap or gnd or concorde)
  begin
    lost_mux_sel = {turkey,cornell,dimetap,gnd,concorde};
  end

always @(lost_mux_dat or lost_mux_sel)
  begin
    bfs = lost_mux_dat[lost_mux_sel];
  end

// Greater Equal Less compare
always @(gnd or warlock or sinus or beef or england or vcc or gnd or castaway)
  begin
    if ({gnd,warlock,sinus,beef} > {england,vcc,gnd,castaway})
       {thurston,lovey,howell} = 3'b100;
    else if ({gnd,warlock,sinus,beef} < {england,vcc,gnd,castaway})
       {thurston,lovey,howell} = 3'b010;
    else
       {thurston,lovey,howell} = 3'b001;
  end

// OR all of these bits together
always @(narcissa or vcc or naproxen or onion or vcc)
  begin
      hinkley = | {narcissa,vcc,naproxen,onion,vcc};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eunice <= 0;
    else
    case ({athena,snake})
       0 : eunice <= lovey;
       1 : eunice <= moody;
       2 : eunice <= eunice;
       3 : eunice <= eunice;
       default : eunice <= 0;
    endcase
  end

// OR all of these bits together
always @(bono or vcc or leaky or capitalist or arcade or peta or chowmein or vcc or gnd or coffee or bust)
  begin
      witchdoctor = | {bono,vcc,leaky,capitalist,arcade,peta,chowmein,vcc,gnd,coffee,bust};
  end

// Greater Equal Less compare
always @(marvin or nyquil or vcc or genji or jonas or tabasco or vcc or badmonkey or gnd or director_of_llamas or sinew or thurston or lxtcen or vcc)
  begin
    if ({marvin,nyquil,vcc,genji,jonas,tabasco,vcc} > {badmonkey,gnd,director_of_llamas,sinew,thurston,lxtcen,vcc})
       {voodoo,uncharted,reallyloud} = 3'b100;
    else if ({marvin,nyquil,vcc,genji,jonas,tabasco,vcc} < {badmonkey,gnd,director_of_llamas,sinew,thurston,lxtcen,vcc})
       {voodoo,uncharted,reallyloud} = 3'b010;
    else
       {voodoo,uncharted,reallyloud} = 3'b001;
  end


// building a 16 to 1 MUX operator
reg [15:0] hypnotized_mux_dat;
reg [3:0] hypnotized_mux_sel;
always @(for_gregg or moviestar or uncharted or vcc or love_in or gnd or achilles or vcc or gnd or stick or vcc or snort or drax or drax or vcc or genji)
  begin
    hypnotized_mux_dat = {for_gregg,moviestar,uncharted,vcc,love_in,gnd,achilles,vcc,gnd,stick,vcc,snort,drax,drax,vcc,genji};
  end

always @(clothing or vcc or subway or bfs)
  begin
    hypnotized_mux_sel = {clothing,vcc,subway,bfs};
  end

always @(hypnotized_mux_dat or hypnotized_mux_sel)
  begin
    ohthatcoconut = hypnotized_mux_dat[hypnotized_mux_sel];
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      booming <= 0;
    else
    case ({beef,exfoliant})
       0 : booming <= booming;
       1 : booming <= infesting;
       2 : booming <= booming;
       3 : booming <= hinkley;
       default : booming <= 0;
    endcase
  end

// AND all of these bits together
always @(norris or reallyloud or gnd or gnd or stirfry or howell or vcc or ginger or stick or minnow or booming)
  begin
      rarest = & {norris,reallyloud,gnd,gnd,stirfry,howell,vcc,ginger,stick,minnow,booming};
  end


// building a 64 to 1 MUX operator
reg [63:0] butterfly_mux_dat;
reg [5:0] butterfly_mux_sel;
always @(bacon or bfs or theseus or cornell or gnd or leaky or hinkley or dimetap or roe or grumby or gilligan or moviestar or gnd or suffering or vcc or sapporo or capitalist or bacon or midas or gnd or chips or rarest or blackbeans or giraffe or vcc or minotaur or capitalist or gnd or bust or vcc or madeye or vcc or vcc or blackbeans or gnd or moviestar or leaky or salsa or blackbeans or warlock or gnd or dimetap or sourcream or drax or fireplace or gnd or gnd or tobiko or blackbeans or for_gregg or drugs or filch or scabbers or coconut or dipsy or weasley or albus or rocks or chief or blessyou or suffering or theseus or vcc or vcc)
  begin
    butterfly_mux_dat = {bacon,bfs,theseus,cornell,gnd,leaky,hinkley,dimetap,roe,grumby,gilligan,moviestar,gnd,suffering,vcc,sapporo,capitalist,bacon,midas,gnd,chips,rarest,blackbeans,giraffe,vcc,minotaur,capitalist,gnd,bust,vcc,madeye,vcc,vcc,blackbeans,gnd,moviestar,leaky,salsa,blackbeans,warlock,gnd,dimetap,sourcream,drax,fireplace,gnd,gnd,tobiko,blackbeans,for_gregg,drugs,filch,scabbers,coconut,dipsy,weasley,albus,rocks,chief,blessyou,suffering,theseus,vcc,vcc};
  end

always @(crack or athena or weasley or vcc or molokai or phenyalanine)
  begin
    butterfly_mux_sel = {crack,athena,weasley,vcc,molokai,phenyalanine};
  end

always @(butterfly_mux_dat or butterfly_mux_sel)
  begin
    palm = butterfly_mux_dat[butterfly_mux_sel];
  end

reg feedback_pt_198;

always @(noyoudirty or feedback_pt_198)
  begin
      seashell = !noyoudirty ^ !feedback_pt_198;
  end

reg feedback_pt_199;

always @(exodus or feedback_pt_199)
  begin
      ohisee = !exodus &  feedback_pt_199;
  end

reg feedback_pt_200;

always @(brothers or feedback_pt_200)
  begin
      whacky =  brothers |  feedback_pt_200;
  end

reg feedback_pt_201;

always @(eunice or feedback_pt_201)
  begin
      rerun =  eunice | !feedback_pt_201;
  end

reg feedback_pt_202;

always @(tabasco or feedback_pt_202)
  begin
      fronds = !tabasco & !feedback_pt_202;
  end

reg feedback_pt_203;

always @(phoenix or feedback_pt_203)
  begin
      hut =  phoenix & !feedback_pt_203;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rescue <= 0;
    else if (exodus)
      rescue <= snake;
  end

always @(rescue)
  begin
      feedback_pt_198 = rescue;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hawaii <= 0;
    else if (palm)
      hawaii <= vcc;
  end

always @(hawaii)
  begin
      feedback_pt_199 = hawaii;
  end

wire wallstreet_wire;

dffeas wallstreet_ff (
  .clk(clock0),
  .d(voodoo),
  .ena(sinus),
  .sclr(snake),
  .sload(chips),
  .asdata(gnd),
  .clrn(!reset0),
  .q(wallstreet_wire)
);

always @(wallstreet_wire) begin
   levelization = wallstreet_wire;
end

always @(levelization)
  begin
      feedback_pt_200 = levelization;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      huhhuh <= 1;
    else
      huhhuh <= crucio;
  end

always @(huhhuh)
  begin
      feedback_pt_201 = huhhuh;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      uomcensor <= 0;
    else if (puttanesca)
      uomcensor <= drugs;
  end

always @(uomcensor)
  begin
      feedback_pt_202 = uomcensor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wildboar <= 0;
    else if (castaway)
      wildboar <= blackbeans;
  end

always @(wildboar)
  begin
      feedback_pt_203 = wildboar;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lagoon <= 0;
    else if (drugs)
      lagoon <= 0;
    else if (huhhuh)
      lagoon <= minotaur;
  end

wire husks_wire;

dffea husks_ff (
  .clk(clock0),
  .d(gnd),
  .ena(rarest),
  .adata(vcc),
  .clrn(!reset0),
  .q(husks_wire)
);

always @(husks_wire) begin
   escape = husks_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foiled <= 1;
    else
      foiled <= blessyou;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bamboo <= 0;
    else if (timingmodel)
      bamboo <= whacky;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      desert <= 0;
    else if (sinus)
      desert <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      isle <= 1;
    else
      isle <= escape;
  end

// Tristate output pin with reg feedback
  bufif0 (pacific,!bacon,!levelization);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(posedge clock0 or posedge reset0) begin
    if (reset0) ocean <= 0;
    else if ( levelization) ocean <= !pacific;
end

always @(gnd)
  begin
      waterfall = !gnd;
  end

always @(gnd)
  begin
      tan_nodes = !gnd;
  end

always @(gnd)
  begin
      loud = !gnd;
  end

always @(noyoudirty)
  begin
      millionaire = !noyoudirty;
  end

always @(vcc)
  begin
      hiswife = !vcc;
  end

always @(fronds)
  begin
      smack = !fronds;
  end

always @(sinus)
  begin
      banshee = !sinus;
  end

always @(banshee)
  begin
      dillweed = !banshee;
  end

always @(fronds)
  begin
      vimcensorc = !fronds;
  end

always @(timingmodel)
  begin
      tesla = !timingmodel;
  end

always @(tan_nodes)
  begin
      killer = !tan_nodes;
  end

always @(levelization)
  begin
      wonton = !levelization;
  end

always @(ohthatcoconut)
  begin
      pierre = !ohthatcoconut;
  end

always @(blessyou)
  begin
      armand = !blessyou;
  end

reg feedback_pt_204;

always @(brothers or feedback_pt_204)
  begin
      rufus =  brothers |  feedback_pt_204;
  end

reg feedback_pt_205;

always @(eunice or feedback_pt_205)
  begin
      willy = !eunice | !feedback_pt_205;
  end

reg feedback_pt_206;

always @(drugs or feedback_pt_206)
  begin
      gonzo = !drugs |  feedback_pt_206;
  end

reg feedback_pt_207;

always @(ohisee or feedback_pt_207)
  begin
      gulp = !ohisee |  feedback_pt_207;
  end

reg feedback_pt_208;

always @(gnd or feedback_pt_208)
  begin
      bonafide = !gnd & !feedback_pt_208;
  end

reg feedback_pt_209;

always @(vcc or feedback_pt_209)
  begin
      stroop =  vcc ^  feedback_pt_209;
  end

reg feedback_pt_210;

always @(picante or feedback_pt_210)
  begin
      waffle =  picante |  feedback_pt_210;
  end

reg feedback_pt_211;

always @(phoenix or feedback_pt_211)
  begin
      wheezer = !phoenix &  feedback_pt_211;
  end

reg feedback_pt_212;

always @(puttanesca or feedback_pt_212)
  begin
      ozzy =  puttanesca &  feedback_pt_212;
  end

reg feedback_pt_213;

always @(waffle or feedback_pt_213)
  begin
      priest = !waffle ^ !feedback_pt_213;
  end

wire rabbi_wire;

dffea rabbi_ff (
  .clk(clock0),
  .d(capitalist),
  .ena(vcc),
  .adata(vcc),
  .clrn(!reset0),
  .q(rabbi_wire)
);

always @(rabbi_wire) begin
   wancensorcens = rabbi_wire;
end

always @(wancensorcens)
  begin
      feedback_pt_204 = wancensorcens;
  end

wire xbncensorcens_wire;

dffeas xbncensorcens_ff (
  .clk(clock0),
  .d(floo),
  .ena(vcc),
  .sclr(priest),
  .sload(vimcensorc),
  .asdata(gulp),
  .clrn(!reset0),
  .q(xbncensorcens_wire)
);

always @(xbncensorcens_wire) begin
   tapered = xbncensorcens_wire;
end

always @(tapered)
  begin
      feedback_pt_205 = tapered;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spastic <= 0;
    else if (minotaur)
      spastic <= gnd;
  end

always @(spastic)
  begin
      feedback_pt_206 = spastic;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lad <= 0;
    else if (killer)
      lad <= 0;
    else if (desert)
      lad <= loud;
  end

always @(lad)
  begin
      feedback_pt_207 = lad;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mao <= 0;
    else if (willy)
      mao <= bamboo;
    else if (snake)
      mao <= 0;
  end

always @(mao)
  begin
      feedback_pt_208 = mao;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zedong <= 0;
    else if (capitalist)
      zedong <= 0;
    else if (wonton)
      zedong <= millionaire;
  end

always @(zedong)
  begin
      feedback_pt_209 = zedong;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deng <= 0;
    else if (pierre)
      deng <= 0;
    else if (vcc)
      deng <= gnd;
  end

always @(deng)
  begin
      feedback_pt_210 = deng;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      xiaoping <= 0;
    else if (waterfall)
      xiaoping <= rescue;
    else if (zen)
      xiaoping <= 0;
  end

always @(xiaoping)
  begin
      feedback_pt_211 = xiaoping;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jinyong <= 0;
    else if (rufus)
      jinyong <= 0;
    else if (chips)
      jinyong <= jalapeno;
  end

always @(jinyong)
  begin
      feedback_pt_212 = jinyong;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lao <= 0;
    else if (gnd)
      lao <= smack;
  end

always @(lao)
  begin
      feedback_pt_213 = lao;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zi <= 1;
    else
      zi <= witchdoctor;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zhuang <= 1;
    else
      zhuang <= ohisee;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wujing <= 0;
    else if (bacon)
      wujing <= vcc;
    else if (rufus)
      wujing <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wukong <= 0;
    else if (vcc)
      wukong <= 0;
    else if (hut)
      wukong <= wheezer;
  end

wire helena_wire;

dffeas helena_ff (
  .clk(clock0),
  .d(wildboar),
  .ena(rerun),
  .sclr(bonafide),
  .sload(albus),
  .asdata(smack),
  .clrn(!reset0),
  .q(helena_wire)
);

always @(helena_wire) begin
   gerrit = helena_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      willem <= 0;
    else if (gnd)
      willem <= tapered;
  end

reg feedback_pt_214;

always @(voodoo or feedback_pt_214)
  begin
      dirk = !voodoo | !feedback_pt_214;
  end

reg feedback_pt_215;

always @(vcc or feedback_pt_215)
  begin
      klaas =  vcc ^  feedback_pt_215;
  end

reg feedback_pt_216;

always @(dimetap or feedback_pt_216)
  begin
      bep =  dimetap &  feedback_pt_216;
  end

reg feedback_pt_217;

always @(vcc or feedback_pt_217)
  begin
      hans = !vcc ^  feedback_pt_217;
  end

reg feedback_pt_218;

always @(foiled or feedback_pt_218)
  begin
      gerard =  foiled |  feedback_pt_218;
  end

reg feedback_pt_219;

always @(brothers or feedback_pt_219)
  begin
      leeuwenhoek = !brothers ^ !feedback_pt_219;
  end

reg feedback_pt_220;

always @(gerrit or feedback_pt_220)
  begin
      microscope =  gerrit |  feedback_pt_220;
  end

reg feedback_pt_221;

always @(albus or feedback_pt_221)
  begin
      erasmus = !albus ^  feedback_pt_221;
  end

reg feedback_pt_222;

always @(gonzo or feedback_pt_222)
  begin
      deruyter =  gonzo | !feedback_pt_222;
  end

reg feedback_pt_223;

always @(isle or feedback_pt_223)
  begin
      vangoh =  isle ^  feedback_pt_223;
  end

reg feedback_pt_224;

always @(fronds or feedback_pt_224)
  begin
      fortuyn =  fronds & !feedback_pt_224;
  end

// Random combinatorial logic block
always@(*)
  begin
      oranje = ( ~( ( ~( ~( ( ~( ( ~( wheezer & ~vangoh ) ) & hans | ~leeuwenhoek ) ) ) | ( ~( ~gnd ^ willem ) | ~( noyoudirty & tesla ) ) ) ) & ~( ( ( vcc | ( wonton | hiswife ) ) & ~( gnd ) ^ ~( vcc ) ) ) ) );
  end

  always@(*)
  begin
    schwinger = ( ~( ~( ( ~( ~( ~( ~xiaoping ) ) ^ ~priest ) ) ) & ~( seashell ) ) ) ? ~( gnd ) : killer;
  end

initial begin
    {feynman,plague,automounter} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({zedong,killer,naproxen} < {dimetap,for_gregg,deruyter})
       {feynman,plague,automounter} <= {dimetap,for_gregg,deruyter};
    else
       {feynman,plague,automounter} <= {zedong,killer,naproxen};
  end

// 9 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {boing,ykocens,pixie,stix,georgec,tango_loud,cluckU_fuji,criminal_newt,sun_milhouse} <= 0;
    else if (xiaoping)
      {boing,ykocens,pixie,stix,georgec,tango_loud,cluckU_fuji,criminal_newt,sun_milhouse} <= {boing,ykocens,pixie,stix,georgec,tango_loud,cluckU_fuji,criminal_newt,sun_milhouse} + 243;
    else
      {boing,ykocens,pixie,stix,georgec,tango_loud,cluckU_fuji,criminal_newt,sun_milhouse} <= {boing,ykocens,pixie,stix,georgec,tango_loud,cluckU_fuji,criminal_newt,sun_milhouse} - 7;
  end

reg feedback_pt_225;

always @(cluckU_fuji or feedback_pt_225)
  begin
      condit_yak = !cluckU_fuji & !feedback_pt_225;
  end

reg feedback_pt_226;

always @(wancensorcens or feedback_pt_226)
  begin
      bomb_yak = !wancensorcens ^  feedback_pt_226;
  end

reg feedback_pt_227;

always @(loud or feedback_pt_227)
  begin
      romex_dingbat =  loud ^  feedback_pt_227;
  end

reg feedback_pt_228;

always @(tango_loud or feedback_pt_228)
  begin
      sand_baron =  tango_loud |  feedback_pt_228;
  end

reg feedback_pt_229;

always @(gnd or feedback_pt_229)
  begin
      nyc_rubeus = !gnd & !feedback_pt_229;
  end

reg feedback_pt_230;

always @(ocean or feedback_pt_230)
  begin
      protest_bfs =  ocean & !feedback_pt_230;
  end

reg feedback_pt_231;

always @(zi or feedback_pt_231)
  begin
      danger_star =  zi ^  feedback_pt_231;
  end

reg feedback_pt_232;

always @(stix or feedback_pt_232)
  begin
      cain_jupiter = !stix &  feedback_pt_232;
  end

reg feedback_pt_233;

always @(tapered or feedback_pt_233)
  begin
      peace_boots =  tapered |  feedback_pt_233;
  end

reg feedback_pt_234;

always @(dillweed or feedback_pt_234)
  begin
      kang_usa =  dillweed |  feedback_pt_234;
  end

reg feedback_pt_235;

always @(gnd or feedback_pt_235)
  begin
      tango_saturn = !gnd | !feedback_pt_235;
  end

reg feedback_pt_236;

always @(condit_yak or feedback_pt_236)
  begin
      desade_touch = !condit_yak | !feedback_pt_236;
  end

reg feedback_pt_237;

always @(vcc or feedback_pt_237)
  begin
      bust_doobie = !vcc ^ !feedback_pt_237;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salmon_mickey <= 1;
    else
      salmon_mickey <= bep;
  end

always @(salmon_mickey)
  begin
      feedback_pt_214 = salmon_mickey;
  end

always @(salmon_mickey)
  begin
      feedback_pt_215 = salmon_mickey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atilla_sheep <= 0;
    else if (gnd)
      atilla_sheep <= timingmodel;
  end

always @(atilla_sheep)
  begin
      feedback_pt_216 = atilla_sheep;
  end

always @(atilla_sheep)
  begin
      feedback_pt_217 = atilla_sheep;
  end

always @(atilla_sheep)
  begin
      feedback_pt_218 = atilla_sheep;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gin_kdqcens <= 0;
    else if (hawaii)
      gin_kdqcens <= 0;
    else if (gnd)
      gin_kdqcens <= jinyong;
  end

always @(gin_kdqcens)
  begin
      feedback_pt_219 = gin_kdqcens;
  end

always @(gin_kdqcens)
  begin
      feedback_pt_220 = gin_kdqcens;
  end

always @(gin_kdqcens)
  begin
      feedback_pt_221 = gin_kdqcens;
  end

always @(gin_kdqcens)
  begin
      feedback_pt_222 = gin_kdqcens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atchoo_deng <= 1;
    else
      atchoo_deng <= vcc;
  end

always @(atchoo_deng)
  begin
      feedback_pt_223 = atchoo_deng;
  end

always @(atchoo_deng)
  begin
      feedback_pt_224 = atchoo_deng;
  end

always @(atchoo_deng)
  begin
      feedback_pt_225 = atchoo_deng;
  end

always @(atchoo_deng)
  begin
      feedback_pt_226 = atchoo_deng;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salsa_hulk <= 0;
    else if (oranje)
      salsa_hulk <= deng;
  end

always @(salsa_hulk)
  begin
      feedback_pt_227 = salsa_hulk;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zulu_hagrid <= 1;
    else
      zulu_hagrid <= avon;
  end

always @(zulu_hagrid)
  begin
      feedback_pt_228 = zulu_hagrid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      winner_bambi <= 1;
    else
      winner_bambi <= zulu_hagrid;
  end

always @(winner_bambi)
  begin
      feedback_pt_229 = winner_bambi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weevil_tako <= 1;
    else
      weevil_tako <= vcc;
  end

always @(weevil_tako)
  begin
      feedback_pt_230 = weevil_tako;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      elguapo_marco <= 0;
    else if (rerun)
      elguapo_marco <= 0;
    else if (vcc)
      elguapo_marco <= wujing;
  end

always @(elguapo_marco)
  begin
      feedback_pt_231 = elguapo_marco;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      china_ham <= 0;
    else if (vcc)
      china_ham <= 0;
    else if (vcc)
      china_ham <= salsa;
  end

always @(china_ham)
  begin
      feedback_pt_232 = china_ham;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cheese_tobiko <= 0;
    else if (nyc_rubeus)
      cheese_tobiko <= lao;
    else if (vcc)
      cheese_tobiko <= 0;
  end

always @(cheese_tobiko)
  begin
      feedback_pt_233 = cheese_tobiko;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      weevil_prison <= 0;
    else if (sun_milhouse)
      weevil_prison <= microscope;
  end

always @(weevil_prison)
  begin
      feedback_pt_234 = weevil_prison;
  end

wire pork_eel_wire;

dffeas pork_eel_ff (
  .clk(clock0),
  .d(hut),
  .ena(gnd),
  .sclr(kang_usa),
  .sload(feynman),
  .asdata(bust_doobie),
  .clrn(!reset0),
  .q(pork_eel_wire)
);

always @(pork_eel_wire) begin
   barnum_fufu = pork_eel_wire;
end

always @(barnum_fufu)
  begin
      feedback_pt_235 = barnum_fufu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      thedon_goofy <= 0;
    else if (naproxen)
      thedon_goofy <= 0;
    else if (protest_bfs)
      thedon_goofy <= gnd;
  end

always @(thedon_goofy)
  begin
      feedback_pt_236 = thedon_goofy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      Iwin_odin <= 0;
    else
      Iwin_odin <= thedon_goofy;
  end

always @(Iwin_odin)
  begin
      feedback_pt_237 = Iwin_odin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      skinner_ohno <= 1;
    else
      skinner_ohno <= dirk;
  end

reg feedback_pt_238;

always @(tesla or feedback_pt_238)
  begin
      jiminy_fear =  tesla |  feedback_pt_238;
  end

reg feedback_pt_239;

always @(pixie or feedback_pt_239)
  begin
      boots_sanity = !pixie &  feedback_pt_239;
  end

reg feedback_pt_240;

always @(plague or feedback_pt_240)
  begin
      jupiter_ceres = !plague | !feedback_pt_240;
  end

reg feedback_pt_241;

always @(barnum_fufu or feedback_pt_241)
  begin
      east_zealot =  barnum_fufu & !feedback_pt_241;
  end

reg feedback_pt_242;

always @(atilla_sheep or feedback_pt_242)
  begin
      yankee_huey = !atilla_sheep ^ !feedback_pt_242;
  end

reg feedback_pt_243;

always @(jiminy_fear or feedback_pt_243)
  begin
      stoner_zed = !jiminy_fear | !feedback_pt_243;
  end

reg feedback_pt_244;

always @(automounter or feedback_pt_244)
  begin
      aphid_bullet =  automounter & !feedback_pt_244;
  end

reg feedback_pt_245;

always @(mao or feedback_pt_245)
  begin
      bach_onion =  mao &  feedback_pt_245;
  end

wire chuck_golf_wire;

dffeas chuck_golf_ff (
  .clk(clock0),
  .d(willem),
  .ena(fortuyn),
  .sclr(ocean),
  .sload(stroop),
  .asdata(gnd),
  .clrn(!reset0),
  .q(chuck_golf_wire)
);

always @(chuck_golf_wire) begin
   hurt_saturn = chuck_golf_wire;
end

always @(hurt_saturn)
  begin
      feedback_pt_238 = hurt_saturn;
  end

wire foxtrot_ring_wire;

dffeas foxtrot_ring_ff (
  .clk(clock0),
  .d(bach_onion),
  .ena(weevil_tako),
  .sclr(boots_sanity),
  .sload(vcc),
  .asdata(bacon),
  .clrn(!reset0),
  .q(foxtrot_ring_wire)
);

always @(foxtrot_ring_wire) begin
   red_barty = foxtrot_ring_wire;
end

always @(red_barty)
  begin
      feedback_pt_239 = red_barty;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nyc_foliage <= 0;
    else if (fronds)
      nyc_foliage <= 0;
    else if (gerrit)
      nyc_foliage <= thedon_goofy;
  end

always @(nyc_foliage)
  begin
      feedback_pt_240 = nyc_foliage;
  end

wire pluto_exodus_wire;

dffeas pluto_exodus_ff (
  .clk(clock0),
  .d(vcc),
  .ena(rerun),
  .sclr(hawaii),
  .sload(salsa_hulk),
  .asdata(gnd),
  .clrn(!reset0),
  .q(pluto_exodus_wire)
);

always @(pluto_exodus_wire) begin
   shark_avon = pluto_exodus_wire;
end

always @(shark_avon)
  begin
      feedback_pt_241 = shark_avon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marge_killme <= 0;
    else
      marge_killme <= shark_avon;
  end

always @(marge_killme)
  begin
      feedback_pt_242 = marge_killme;
  end

wire ostrich_gap_wire;

dffeas ostrich_gap_ff (
  .clk(clock0),
  .d(ocean),
  .ena(stoner_zed),
  .sclr(microscope),
  .sload(yankee_huey),
  .asdata(rerun),
  .clrn(!reset0),
  .q(ostrich_gap_wire)
);

always @(ostrich_gap_wire) begin
   helena_sinus = ostrich_gap_wire;
end

always @(helena_sinus)
  begin
      feedback_pt_243 = helena_sinus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cluckU_klaas <= 0;
    else
      cluckU_klaas <= desade_touch;
  end

always @(cluckU_klaas)
  begin
      feedback_pt_244 = cluckU_klaas;
  end

wire pizza_popacap_wire;

dffea pizza_popacap_ff (
  .clk(clock0),
  .d(vcc),
  .ena(gnd),
  .adata(elguapo_marco),
  .clrn(!reset0),
  .q(pizza_popacap_wire)
);

always @(pizza_popacap_wire) begin
   odin_hotdog = pizza_popacap_wire;
end

always @(odin_hotdog)
  begin
      feedback_pt_245 = odin_hotdog;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goblin_romex <= 0;
    else if (vcc)
      goblin_romex <= 0;
    else if (salsa_hulk)
      goblin_romex <= elguapo_marco;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iguana_bullet <= 0;
    else if (albus)
      iguana_bullet <= gnd;
  end

wire tofu_leidiot_wire;

dffeas tofu_leidiot_ff (
  .clk(clock0),
  .d(klaas),
  .ena(gnd),
  .sclr(vcc),
  .sload(skinner_ohno),
  .asdata(cluckU_klaas),
  .clrn(!reset0),
  .q(tofu_leidiot_wire)
);

always @(tofu_leidiot_wire) begin
   turnip_doobie = tofu_leidiot_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ibm_chief <= 0;
    else
      ibm_chief <= theseus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      south_norbert <= 0;
    else if (weevil_prison)
      south_norbert <= criminal_newt;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gerrit_gyro <= 0;
    else if (salmon_mickey)
      gerrit_gyro <= 0;
    else if (vcc)
      gerrit_gyro <= iguana_bullet;
  end

wire hans_kungfu_wire;

dffeas hans_kungfu_ff (
  .clk(clock0),
  .d(gnd),
  .ena(vcc),
  .sclr(gerard),
  .sload(gnd),
  .asdata(boing),
  .clrn(!reset0),
  .q(hans_kungfu_wire)
);

always @(hans_kungfu_wire) begin
   floo_xray = hans_kungfu_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      solder_troll <= 0;
    else
      solder_troll <= criminal_newt;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pyro_kmfdm <= 1;
    else
      pyro_kmfdm <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      copper_beef <= 0;
    else
      copper_beef <= hiswife;
  end

wire stoner_saturn_wire;

dffea stoner_saturn_ff (
  .clk(clock0),
  .d(naproxen),
  .ena(wujing),
  .adata(ibm_chief),
  .clrn(!reset0),
  .q(stoner_saturn_wire)
);

always @(stoner_saturn_wire) begin
   maki_hp = stoner_saturn_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      advil_rose <= 0;
    else if (goblin_romex)
      advil_rose <= 0;
    else if (bach_onion)
      advil_rose <= danger_star;
  end

// Random combinatorial logic block
always@(*)
  begin
      spirit_shuda = ~( ~( ( ~( ~( pyro_kmfdm ) & ~( ~bomb_yak ) | ( ~( ~romex_dingbat ) ^ ~romex_dingbat ) ) ) ) );
  end

// 7 bit up counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {ohisee_malfoy,moody_opus,army_cafe,whale_ocha,curie_yankee,chillis_avon,escape_fish} <= 0;
    else
      {ohisee_malfoy,moody_opus,army_cafe,whale_ocha,curie_yankee,chillis_avon,escape_fish} <= {ohisee_malfoy,moody_opus,army_cafe,whale_ocha,curie_yankee,chillis_avon,escape_fish} + 1;
  end

// Ternary sign extend bait
always @(hawaii or hawaii or hawaii or hawaii or hawaii or hawaii or hawaii or wujing or vcc or copper_beef or whale_ocha or vcc or gnd or gnd or south_norbert or bep or atchoo_deng or east_zealot or east_zealot or spirit_shuda or aphid_bullet or ykocens or gnd or gnd or wukong or advil_rose or gnd or tango_saturn or
         army_cafe or army_cafe or army_cafe or army_cafe or zhuang or salmon_mickey or cain_jupiter or ykocens or vcc or aphid_bullet or for_gregg or romex_dingbat or marge_killme or gnd or ykocens or bomb_yak or sand_baron or gnd or voodoo or boots_sanity or cheese_tobiko or nyc_rubeus or vcc or klaas or jupiter_ceres or red_barty or spirit_shuda or gnd or
         ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or ohisee_malfoy or danger_star or yankee_huey or hurt_saturn or peace_boots or bomb_yak or jinyong or odin_hotdog or gnd or zi or red_barty or naproxen or vcc or escape_fish or wukong or gnd or uomcensor or Iwin_odin or microscope)
  begin
    {rojas_bull,sleeping_art,wonton_tonic,hoser_holland,leaky_sanity,ramone_black,intuit_voodoo,spain_stix,oscar_tobiko,deng_tinker,shemp_floride,crack_donald,bathroom_elf,troll_lemon,goblin_bear,parrot_eeevil,quebec_webvan,lsd_turnip,bach_maryann,danger_pig,lotus_sgates,pimpernel_moe,dopey_tattoo,ready_tiger,rasp_stoned,weasley_valve,portnoy_stick,palmer_emails} = 
        {hawaii,hawaii,hawaii,hawaii,hawaii,hawaii,hawaii,wujing,vcc,copper_beef,whale_ocha,vcc,gnd,gnd,south_norbert,bep,atchoo_deng,east_zealot,east_zealot,spirit_shuda,aphid_bullet,ykocens,gnd,gnd,wukong,advil_rose,gnd,tango_saturn} +
        {army_cafe,army_cafe,army_cafe,army_cafe,zhuang,salmon_mickey,cain_jupiter,ykocens,vcc,aphid_bullet,for_gregg,romex_dingbat,marge_killme,gnd,ykocens,bomb_yak,sand_baron,gnd,voodoo,boots_sanity,cheese_tobiko,nyc_rubeus,vcc,klaas,jupiter_ceres,red_barty,spirit_shuda,gnd} +
        {ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,ohisee_malfoy,danger_star,yankee_huey,hurt_saturn,peace_boots,bomb_yak,jinyong,odin_hotdog,gnd,zi,red_barty,naproxen,vcc,escape_fish,wukong,gnd,uomcensor,Iwin_odin,microscope};
  end

// AND all of these bits together
always @(cluckU_klaas or danger_pig or vcc or intuit_voodoo or escape_fish or voodoo or ykocens)
  begin
      weevil_solder = & {cluckU_klaas,danger_pig,vcc,intuit_voodoo,escape_fish,voodoo,ykocens};
  end

// 7 input 7 output permutation
always @(vcc or bach_onion or iguana_bullet or china_ham or snort or vcc or parrot_eeevil)
  begin
    case ({vcc,bach_onion,iguana_bullet,china_ham,snort,vcc,parrot_eeevil})
      0: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=0;
      1: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=35;
      2: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=102;
      3: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=118;
      4: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=101;
      5: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=13;
      6: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=40;
      7: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=95;
      8: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=94;
      9: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=121;
      10: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=26;
      11: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=115;
      12: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=43;
      13: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=64;
      14: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=70;
      15: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=41;
      16: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=123;
      17: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=72;
      18: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=3;
      19: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=100;
      20: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=49;
      21: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=16;
      22: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=71;
      23: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=31;
      24: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=10;
      25: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=85;
      26: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=17;
      27: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=1;
      28: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=47;
      29: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=68;
      30: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=78;
      31: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=53;
      32: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=93;
      33: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=56;
      34: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=76;
      35: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=66;
      36: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=5;
      37: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=12;
      38: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=38;
      39: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=28;
      40: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=30;
      41: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=19;
      42: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=33;
      43: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=57;
      44: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=55;
      45: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=82;
      46: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=18;
      47: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=104;
      48: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=2;
      49: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=89;
      50: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=54;
      51: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=63;
      52: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=25;
      53: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=111;
      54: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=86;
      55: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=84;
      56: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=99;
      57: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=8;
      58: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=77;
      59: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=27;
      60: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=11;
      61: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=96;
      62: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=22;
      63: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=122;
      64: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=112;
      65: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=83;
      66: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=80;
      67: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=126;
      68: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=79;
      69: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=116;
      70: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=6;
      71: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=62;
      72: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=117;
      73: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=120;
      74: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=127;
      75: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=61;
      76: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=21;
      77: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=119;
      78: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=50;
      79: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=4;
      80: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=103;
      81: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=46;
      82: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=98;
      83: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=106;
      84: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=90;
      85: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=32;
      86: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=73;
      87: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=36;
      88: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=23;
      89: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=75;
      90: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=92;
      91: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=20;
      92: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=69;
      93: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=37;
      94: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=29;
      95: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=124;
      96: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=113;
      97: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=44;
      98: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=42;
      99: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=48;
      100: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=74;
      101: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=87;
      102: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=65;
      103: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=125;
      104: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=45;
      105: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=58;
      106: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=107;
      107: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=52;
      108: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=81;
      109: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=109;
      110: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=15;
      111: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=67;
      112: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=7;
      113: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=97;
      114: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=91;
      115: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=14;
      116: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=110;
      117: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=9;
      118: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=24;
      119: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=34;
      120: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=108;
      121: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=105;
      122: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=114;
      123: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=88;
      124: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=39;
      125: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=60;
      126: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=59;
      127: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=51;
      default: {isle_fufu,ladder_barnum,guy_steaming,mike_mcnugget,kebab_nyquil,possum_yoda,sweetie_grams}=0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      avon_liberace <= 0;
    else
    case ({romex_dingbat,sleeping_art})
       0 : avon_liberace <= uomcensor;
       1 : avon_liberace <= curie_yankee;
       2 : avon_liberace <= avon_liberace;
       3 : avon_liberace <= avon_liberace;
       default : avon_liberace <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      achilles_lala <= 0;
    else
    case ({kebab_nyquil,portnoy_stick})
       0 : achilles_lala <= criminal_newt;
       1 : achilles_lala <= achilles_lala;
       2 : achilles_lala <= naproxen;
       3 : achilles_lala <= bomb_yak;
       default : achilles_lala <= 0;
    endcase
  end

reg feedback_pt_246;

always @(uomcensor or feedback_pt_246)
  begin
      ajax_too_big =  uomcensor ^  feedback_pt_246;
  end

reg feedback_pt_247;

always @(vcc or feedback_pt_247)
  begin
      chillis_willy = !vcc ^ !feedback_pt_247;
  end

reg feedback_pt_248;

always @(gnd or feedback_pt_248)
  begin
      dow_amex =  gnd & !feedback_pt_248;
  end

reg feedback_pt_249;

always @(dow_amex or feedback_pt_249)
  begin
      lion_popcorn = !dow_amex & !feedback_pt_249;
  end

reg feedback_pt_250;

always @(possum_yoda or feedback_pt_250)
  begin
      kang_bacon = !possum_yoda | !feedback_pt_250;
  end

reg feedback_pt_251;

always @(gnd or feedback_pt_251)
  begin
      popcorn_advil =  gnd ^  feedback_pt_251;
  end

reg feedback_pt_252;

always @(ocean or feedback_pt_252)
  begin
      gerard_kungfu = !ocean ^ !feedback_pt_252;
  end

reg feedback_pt_253;

always @(weevil_solder or feedback_pt_253)
  begin
      whale_malfoy =  weevil_solder | !feedback_pt_253;
  end

reg feedback_pt_254;

always @(peace_boots or feedback_pt_254)
  begin
      stoned_sake = !peace_boots ^  feedback_pt_254;
  end

reg feedback_pt_255;

always @(spastic or feedback_pt_255)
  begin
      tylenol_otter =  spastic | !feedback_pt_255;
  end

reg feedback_pt_256;

always @(goblin_bear or feedback_pt_256)
  begin
      yankee_hoser =  goblin_bear & !feedback_pt_256;
  end

reg feedback_pt_257;

always @(gnd or feedback_pt_257)
  begin
      bush_wiggles = !gnd |  feedback_pt_257;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      west_eatem <= 0;
    else if (ykocens)
      west_eatem <= 0;
    else if (dopey_tattoo)
      west_eatem <= gnd;
  end

always @(west_eatem)
  begin
      feedback_pt_246 = west_eatem;
  end

always @(west_eatem)
  begin
      feedback_pt_247 = west_eatem;
  end

always @(west_eatem)
  begin
      feedback_pt_248 = west_eatem;
  end

always @(west_eatem)
  begin
      feedback_pt_249 = west_eatem;
  end

always @(west_eatem)
  begin
      feedback_pt_250 = west_eatem;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kappa_zed <= 0;
    else if (tylenol_otter)
      kappa_zed <= 0;
    else if (lao)
      kappa_zed <= aphid_bullet;
  end

always @(kappa_zed)
  begin
      feedback_pt_251 = kappa_zed;
  end

wire beast_uppers_wire;

dffeas beast_uppers_ff (
  .clk(clock0),
  .d(chillis_willy),
  .ena(vcc),
  .sclr(palmer_emails),
  .sload(moody_opus),
  .asdata(snake),
  .clrn(!reset0),
  .q(beast_uppers_wire)
);

always @(beast_uppers_wire) begin
   blue_aphid = beast_uppers_wire;
end

always @(blue_aphid)
  begin
      feedback_pt_252 = blue_aphid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tasty_ebi <= 0;
    else if (erasmus)
      tasty_ebi <= popcorn_advil;
  end

always @(tasty_ebi)
  begin
      feedback_pt_253 = tasty_ebi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jonas_falafel <= 0;
    else
      jonas_falafel <= moody_opus;
  end

always @(jonas_falafel)
  begin
      feedback_pt_254 = jonas_falafel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zulu_eel <= 1;
    else
      zulu_eel <= floo_xray;
  end

always @(zulu_eel)
  begin
      feedback_pt_255 = zulu_eel;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wildboar_iron <= 1;
    else
      wildboar_iron <= tasty_ebi;
  end

always @(wildboar_iron)
  begin
      feedback_pt_256 = wildboar_iron;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      madeye_mozart <= 0;
    else if (achilles_lala)
      madeye_mozart <= 0;
    else if (gnd)
      madeye_mozart <= vcc;
  end

always @(madeye_mozart)
  begin
      feedback_pt_257 = madeye_mozart;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      obiwan_rabbi <= 1;
    else
      obiwan_rabbi <= wonton_tonic;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tuna_minerva <= 0;
    else if (wildboar_iron)
      tuna_minerva <= 0;
    else if (vcc)
      tuna_minerva <= gnd;
  end

wire parrot_doc_wire;

dffea parrot_doc_ff (
  .clk(clock0),
  .d(troll_lemon),
  .ena(leaky_sanity),
  .adata(avon_liberace),
  .clrn(!reset0),
  .q(parrot_doc_wire)
);

always @(parrot_doc_wire) begin
   homerun_stix = parrot_doc_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      edible_amex <= 0;
    else
      edible_amex <= wonton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ham_alpha <= 0;
    else if (for_gregg)
      ham_alpha <= possum_yoda;
  end

wire moody_noah_wire;

dffea moody_noah_ff (
  .clk(clock0),
  .d(gnd),
  .ena(kang_bacon),
  .adata(rasp_stoned),
  .clrn(!reset0),
  .q(moody_noah_wire)
);

always @(moody_noah_wire) begin
   hagrid_neon = moody_noah_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      diagon_willy <= 1;
    else
      diagon_willy <= schwinger;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      uppers_speed <= 0;
    else
      uppers_speed <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pentium_tin <= 0;
    else
      pentium_tin <= stoned_sake;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oscar_parrot <= 0;
    else
      oscar_parrot <= bomb_yak;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spain_loser <= 0;
    else if (gnd)
      spain_loser <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      elian_romeo <= 0;
    else if (goblin_bear)
      elian_romeo <= gnd;
    else if (lion_popcorn)
      elian_romeo <= 0;
  end

wire dingbat_palm_wire;

dffeas dingbat_palm_ff (
  .clk(clock0),
  .d(bep),
  .ena(gnd),
  .sclr(oscar_parrot),
  .sload(hoser_holland),
  .asdata(blue_aphid),
  .clrn(!reset0),
  .q(dingbat_palm_wire)
);

always @(dingbat_palm_wire) begin
   superman_ebi = dingbat_palm_wire;
end

wire grumby_lucent_wire;

dffeas grumby_lucent_ff (
  .clk(clock0),
  .d(vcc),
  .ena(gnd),
  .sclr(sweetie_grams),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset0),
  .q(grumby_lucent_wire)
);

always @(grumby_lucent_wire) begin
   flew_bison = grumby_lucent_wire;
end

// Note - state 2 is unreachable
// State Mek troll_uppers Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      troll_uppers <= troll_uppers_0;
    else
      case (troll_uppers)
        troll_uppers_0: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 8)
            troll_uppers <= troll_uppers_4;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 6)
            troll_uppers <= troll_uppers_10;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 14)
            troll_uppers <= troll_uppers_3;
          else
            troll_uppers <= troll_uppers_0;
          end
        troll_uppers_1: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 10)
            troll_uppers <= troll_uppers_8;
          else
            troll_uppers <= troll_uppers_1;
          end
        troll_uppers_2: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 9)
            troll_uppers <= troll_uppers_2;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 4)
            troll_uppers <= troll_uppers_6;
          else
            troll_uppers <= troll_uppers_2;
          end
        troll_uppers_3: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 6)
            troll_uppers <= troll_uppers_6;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 7)
            troll_uppers <= troll_uppers_3;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 13)
            troll_uppers <= troll_uppers_3;
          else
            troll_uppers <= troll_uppers_3;
          end
        troll_uppers_4: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 9)
            troll_uppers <= troll_uppers_10;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 10)
            troll_uppers <= troll_uppers_1;
          else
            troll_uppers <= troll_uppers_4;
          end
        troll_uppers_5: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 14)
            troll_uppers <= troll_uppers_6;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 1)
            troll_uppers <= troll_uppers_6;
          else
            troll_uppers <= troll_uppers_5;
          end
        troll_uppers_6: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 6)
            troll_uppers <= troll_uppers_9;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 5)
            troll_uppers <= troll_uppers_1;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 10)
            troll_uppers <= troll_uppers_4;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 2)
            troll_uppers <= troll_uppers_7;
          else
            troll_uppers <= troll_uppers_6;
          end
        troll_uppers_7: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 1)
            troll_uppers <= troll_uppers_4;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 13)
            troll_uppers <= troll_uppers_3;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 5)
            troll_uppers <= troll_uppers_10;
          else
            troll_uppers <= troll_uppers_7;
          end
        troll_uppers_8: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 12)
            troll_uppers <= troll_uppers_5;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 0)
            troll_uppers <= troll_uppers_9;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 13)
            troll_uppers <= troll_uppers_0;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 1)
            troll_uppers <= troll_uppers_0;
          else
            troll_uppers <= troll_uppers_8;
          end
        troll_uppers_9: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 7)
            troll_uppers <= troll_uppers_7;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 1)
            troll_uppers <= troll_uppers_9;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 8)
            troll_uppers <= troll_uppers_0;
          else if ({kappa_zed,edible_amex,vcc,uppers_speed} == 15)
            troll_uppers <= troll_uppers_1;
          else
            troll_uppers <= troll_uppers_9;
          end
        troll_uppers_10: begin
          if ({kappa_zed,edible_amex,vcc,uppers_speed} == 4)
            troll_uppers <= troll_uppers_3;
          else
            troll_uppers <= troll_uppers_10;
          end
        default: troll_uppers <= troll_uppers_0;
      endcase
  end

// State Mek troll_uppers Output logic
always @(troll_uppers)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (troll_uppers[3:1])
        troll_uppers_0: begin
            dingbat_tesla = 0;
            homerun_echo = 1;
            moulin_crank = 0;
            otter_kedavra = 0;
            kana_zi = 1;
            saturn_simasu = 1;
          end
        troll_uppers_1: begin
            dingbat_tesla = 0;
            homerun_echo = 1;
            moulin_crank = 1;
            otter_kedavra = 0;
            kana_zi = 0;
            saturn_simasu = 1;
          end
        troll_uppers_2: begin
            dingbat_tesla = 1;
            homerun_echo = 0;
            moulin_crank = 0;
            otter_kedavra = 1;
            kana_zi = 0;
            saturn_simasu = 0;
          end
        troll_uppers_3: begin
            dingbat_tesla = 0;
            homerun_echo = 1;
            moulin_crank = 1;
            otter_kedavra = 0;
            kana_zi = 0;
            saturn_simasu = 0;
          end
        troll_uppers_4: begin
            dingbat_tesla = 0;
            homerun_echo = 0;
            moulin_crank = 0;
            otter_kedavra = 1;
            kana_zi = 1;
            saturn_simasu = 1;
          end
        default: begin
            dingbat_tesla = 0;
            homerun_echo = 0;
            moulin_crank = 0;
            otter_kedavra = 0;
            kana_zi = 0;
            saturn_simasu = 0;
          end
      endcase
  end

// State Mek ready_centaur Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ready_centaur <= ready_centaur_0;
    else
      case (ready_centaur)
        ready_centaur_0: begin
          if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 6)
            ready_centaur <= ready_centaur_1;
          else
            ready_centaur <= ready_centaur_0;
          end
        ready_centaur_1: begin
          if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 8)
            ready_centaur <= ready_centaur_6;
          else
            ready_centaur <= ready_centaur_1;
          end
        ready_centaur_2: begin
          if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 1)
            ready_centaur <= ready_centaur_3;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 2)
            ready_centaur <= ready_centaur_1;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 14)
            ready_centaur <= ready_centaur_1;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 9)
            ready_centaur <= ready_centaur_4;
          else
            ready_centaur <= ready_centaur_2;
          end
        ready_centaur_3: begin
          if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 1)
            ready_centaur <= ready_centaur_5;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 12)
            ready_centaur <= ready_centaur_6;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 11)
            ready_centaur <= ready_centaur_6;
          else
            ready_centaur <= ready_centaur_3;
          end
        ready_centaur_4: begin
          if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 9)
            ready_centaur <= ready_centaur_5;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 15)
            ready_centaur <= ready_centaur_5;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 1)
            ready_centaur <= ready_centaur_2;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 6)
            ready_centaur <= ready_centaur_0;
          else
            ready_centaur <= ready_centaur_4;
          end
        ready_centaur_5: begin
          if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 10)
            ready_centaur <= ready_centaur_6;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 9)
            ready_centaur <= ready_centaur_2;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 15)
            ready_centaur <= ready_centaur_0;
          else
            ready_centaur <= ready_centaur_5;
          end
        ready_centaur_6: begin
          if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 15)
            ready_centaur <= ready_centaur_5;
          else if ({troll_lemon,curie_yankee,weevil_solder,elian_romeo} == 1)
            ready_centaur <= ready_centaur_6;
          else
            ready_centaur <= ready_centaur_6;
          end
        default: ready_centaur <= ready_centaur_0;
      endcase
  end

// State Mek ready_centaur Output logic
always @(ready_centaur)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (ready_centaur)
        ready_centaur_0: begin
            rojas_tobe = 0;
            goofy_kappa = 0;
            hoser_zen = 0;
            marco_freaky = 0;
            zebra_lad = 0;
            yellow_wine = 0;
          end
        ready_centaur_1: begin
            rojas_tobe = 1;
            goofy_kappa = 0;
            hoser_zen = 0;
            marco_freaky = 0;
            zebra_lad = 0;
            yellow_wine = 0;
          end
        ready_centaur_2: begin
            rojas_tobe = 0;
            goofy_kappa = 1;
            hoser_zen = 0;
            marco_freaky = 0;
            zebra_lad = 1;
            yellow_wine = 0;
          end
        ready_centaur_3: begin
            rojas_tobe = 1;
            goofy_kappa = 1;
            hoser_zen = 0;
            marco_freaky = 0;
            zebra_lad = 1;
            yellow_wine = 1;
          end
        ready_centaur_4: begin
            rojas_tobe = 0;
            goofy_kappa = 0;
            hoser_zen = 0;
            marco_freaky = 0;
            zebra_lad = 1;
            yellow_wine = 0;
          end
        ready_centaur_5: begin
            rojas_tobe = 0;
            goofy_kappa = 0;
            hoser_zen = 0;
            marco_freaky = 0;
            zebra_lad = 0;
            yellow_wine = 1;
          end
        ready_centaur_6: begin
            rojas_tobe = 0;
            goofy_kappa = 0;
            hoser_zen = 0;
            marco_freaky = 0;
            zebra_lad = 0;
            yellow_wine = 0;
          end
        default: begin
            rojas_tobe = 1;
            goofy_kappa = 0;
            hoser_zen = 0;
            marco_freaky = 1;
            zebra_lad = 0;
            yellow_wine = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire curly_fear_out;
nut_001_lut #(6) nut_001_lut_inst_curly_fear (
  .din({goofy_kappa,kebab_nyquil,dingbat_tesla,gerard_kungfu,otter_kedavra,jonas_falafel}),
  .mask(64'b0100001001100100011100010010100000001000110100100010001000100100),
  .out(curly_fear_out)
);

always @(curly_fear_out)
begin
   wine_sand = curly_fear_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire ocha_hercules_out;
nut_001_lut #(6) nut_001_lut_inst_ocha_hercules (
  .din({floo_xray,tuna_minerva,gnd,superman_ebi,wonton,kebab_nyquil}),
  .mask(64'b0010110010010011100111100100100000000000000000000011010100000100),
  .out(ocha_hercules_out)
);

always @(ocha_hercules_out)
begin
   kmfdm_school = ocha_hercules_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire tonic_dutch_out;
nut_001_lut #(2) nut_001_lut_inst_tonic_dutch (
  .din({vcc,tuna_minerva}),
  .mask(4'h4),
  .out(tonic_dutch_out)
);

always @(tonic_dutch_out)
begin
   gin_ceres = tonic_dutch_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire moody_zhuang_out;
nut_001_lut #(5) nut_001_lut_inst_moody_zhuang (
  .din({palmer_emails,crack_donald,gin_ceres,dingbat_tesla,bep}),
  .mask(32'h66ea8528),
  .out(moody_zhuang_out)
);

always @(moody_zhuang_out)
begin
   midas_hippo = moody_zhuang_out;
end

reg feedback_pt_258;

always @(rojas_bull or feedback_pt_258)
  begin
      whiskey_alpha = !rojas_bull |  feedback_pt_258;
  end

reg feedback_pt_259;

always @(wonton_tonic or feedback_pt_259)
  begin
      howell_malfoy =  wonton_tonic | !feedback_pt_259;
  end

reg feedback_pt_260;

always @(bach_maryann or feedback_pt_260)
  begin
      sears_george = !bach_maryann & !feedback_pt_260;
  end

reg feedback_pt_261;

always @(flew_bison or feedback_pt_261)
  begin
      cybex_air =  flew_bison ^ !feedback_pt_261;
  end

reg feedback_pt_262;

always @(vcc or feedback_pt_262)
  begin
      trevor_jiminy = !vcc |  feedback_pt_262;
  end

reg feedback_pt_263;

always @(wonton or feedback_pt_263)
  begin
      dorkus_marge = !wonton | !feedback_pt_263;
  end

reg feedback_pt_264;

always @(chillis_avon or feedback_pt_264)
  begin
      moe_carolina = !chillis_avon &  feedback_pt_264;
  end

reg feedback_pt_265;

always @(elian_romeo or feedback_pt_265)
  begin
      doc_bathroom =  elian_romeo ^ !feedback_pt_265;
  end

reg feedback_pt_266;

always @(oscar_tobiko or feedback_pt_266)
  begin
      fury_saturn =  oscar_tobiko |  feedback_pt_266;
  end

reg feedback_pt_267;

always @(blue_aphid or feedback_pt_267)
  begin
      hiway_jesus =  blue_aphid &  feedback_pt_267;
  end

reg feedback_pt_268;

always @(microscope or feedback_pt_268)
  begin
      bison_mexican =  microscope & !feedback_pt_268;
  end

reg feedback_pt_269;

always @(howell_malfoy or feedback_pt_269)
  begin
      wanton_flew = !howell_malfoy &  feedback_pt_269;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      killer_ready <= 0;
    else if (west_eatem)
      killer_ready <= 0;
    else if (trevor_jiminy)
      killer_ready <= pentium_tin;
  end

always @(killer_ready)
  begin
      feedback_pt_258 = killer_ready;
  end

always @(killer_ready)
  begin
      feedback_pt_259 = killer_ready;
  end

always @(killer_ready)
  begin
      feedback_pt_260 = killer_ready;
  end

always @(killer_ready)
  begin
      feedback_pt_261 = killer_ready;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stemcell_zed <= 0;
    else
      stemcell_zed <= hagrid_neon;
  end

always @(stemcell_zed)
  begin
      feedback_pt_262 = stemcell_zed;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      valve_loud <= 0;
    else if (bush_wiggles)
      valve_loud <= gnd;
    else if (kmfdm_school)
      valve_loud <= 0;
  end

always @(valve_loud)
  begin
      feedback_pt_263 = valve_loud;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      viagra_filch <= 0;
    else
      viagra_filch <= bomb_yak;
  end

always @(viagra_filch)
  begin
      feedback_pt_264 = viagra_filch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      peaves_dutch <= 0;
    else if (crack_donald)
      peaves_dutch <= hoser_zen;
  end

always @(peaves_dutch)
  begin
      feedback_pt_265 = peaves_dutch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tabby_guy <= 0;
    else if (guy_steaming)
      tabby_guy <= wujing;
    else if (microscope)
      tabby_guy <= 0;
  end

always @(tabby_guy)
  begin
      feedback_pt_266 = tabby_guy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bacon_gyro <= 0;
    else
      bacon_gyro <= vcc;
  end

always @(bacon_gyro)
  begin
      feedback_pt_267 = bacon_gyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ready_chips <= 0;
    else if (vcc)
      ready_chips <= vcc;
    else if (vcc)
      ready_chips <= 0;
  end

always @(ready_chips)
  begin
      feedback_pt_268 = ready_chips;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      copper_gerrit <= 0;
    else if (ramone_black)
      copper_gerrit <= 0;
    else if (peace_boots)
      copper_gerrit <= weevil_solder;
  end

always @(copper_gerrit)
  begin
      feedback_pt_269 = copper_gerrit;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      water_foryou <= 1;
    else
      water_foryou <= kang_usa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      show_mrbill <= 1;
    else
      show_mrbill <= viagra_filch;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tin_lestrange <= 0;
    else
      tin_lestrange <= yankee_hoser;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      draco_october <= 0;
    else if (gnd)
      draco_october <= oscar_tobiko;
    else if (whale_malfoy)
      draco_october <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      clay_yohimbe <= 0;
    else
      clay_yohimbe <= vcc;
  end

wire beef_covad_wire;

dffeas beef_covad_ff (
  .clk(clock0),
  .d(tabby_guy),
  .ena(weasley_valve),
  .sclr(moe_carolina),
  .sload(obiwan_rabbi),
  .asdata(moulin_crank),
  .clrn(!reset0),
  .q(beef_covad_wire)
);

always @(beef_covad_wire) begin
   curious_moron = beef_covad_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chief_bambi <= 0;
    else if (gnd)
      chief_bambi <= 0;
    else if (gerrit_gyro)
      chief_bambi <= gerrit_gyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rat_wakey <= 0;
    else
      rat_wakey <= midas_hippo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      aspirin_ritsu <= 0;
    else if (vcc)
      aspirin_ritsu <= wine_sand;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tonks_snake <= 1;
    else
      tonks_snake <= lsd_turnip;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      what_husks <= 0;
    else if (vcc)
      what_husks <= fury_saturn;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      newt_sirius <= 1;
    else
      newt_sirius <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crack_lamer <= 0;
    else if (dorkus_marge)
      crack_lamer <= 0;
    else if (doc_bathroom)
      crack_lamer <= goofy_kappa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      egg_homer <= 1;
    else
      egg_homer <= floo_xray;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fear_star <= 0;
    else if (vcc)
      fear_star <= 0;
    else if (clay_yohimbe)
      fear_star <= microscope;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rojas_kungfu <= 0;
    else if (gerrit)
      rojas_kungfu <= yellow_wine;
    else if (gnd)
      rojas_kungfu <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      solder_issac <= 0;
    else if (whale_malfoy)
      solder_issac <= 0;
    else if (peaves_dutch)
      solder_issac <= guy_steaming;
  end

// 13 bit to 16 bit const mult
always @(newt_sirius or skinner_ohno or tin_lestrange or zulu_eel or viagra_filch or gerard_kungfu or bathroom_elf or madeye_mozart or gnd or intuit_voodoo or copper_gerrit or diagon_willy or gnd)
  begin
      {kabar_whiskey,eel_zinc,pluto_psycho,yak_brothers,moreand_willy,ajax_psycho,hp_eeevil,mushroom_dork,boots_yellow,oscar_bonker,bomb_yohimbe,sun_tesla,metal_dog,tabby_moses,kanji_uppers,nobody_zeus} = 
	  	  {newt_sirius,skinner_ohno,tin_lestrange,zulu_eel,viagra_filch,gerard_kungfu,bathroom_elf,madeye_mozart,gnd,intuit_voodoo,copper_gerrit,diagon_willy,gnd} * 
		  204218;
  end

// 4 input 4 output permutation
always @(gnd or shemp_floride or maki_hp or ajax_too_big)
  begin
    case ({gnd,shemp_floride,maki_hp,ajax_too_big})
      0: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=1;
      1: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=15;
      2: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=7;
      3: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=6;
      4: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=11;
      5: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=5;
      6: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=4;
      7: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=13;
      8: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=14;
      9: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=3;
      10: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=2;
      11: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=12;
      12: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=0;
      13: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=8;
      14: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=10;
      15: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=9;
      default: {tesla_scrooge,pdiddy_dirty,neville_beef,whacky_husks}=0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shark_palm <= 0;
    else
    case ({hagrid_neon,vcc})
       0 : shark_palm <= gnd;
       1 : shark_palm <= shark_palm;
       2 : shark_palm <= rojas_bull;
       3 : shark_palm <= shark_palm;
       default : shark_palm <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      loud_ariel <= 0;
    else
    case ({pdiddy_dirty,chillis_avon})
       0 : loud_ariel <= loud_ariel;
       1 : loud_ariel <= loud_ariel;
       2 : loud_ariel <= killer_ready;
       3 : loud_ariel <= gnd;
       default : loud_ariel <= 0;
    endcase
  end

reg feedback_pt_270;

always @(vcc or feedback_pt_270)
  begin
      fortuyn_heidi = !vcc ^  feedback_pt_270;
  end

reg feedback_pt_271;

always @(gnd or feedback_pt_271)
  begin
      mushroom_zed = !gnd & !feedback_pt_271;
  end

reg feedback_pt_272;

always @(possum_yoda or feedback_pt_272)
  begin
      brian_zulu =  possum_yoda & !feedback_pt_272;
  end

reg feedback_pt_273;

always @(brian_zulu or feedback_pt_273)
  begin
      priest_echo = !brian_zulu & !feedback_pt_273;
  end

reg feedback_pt_274;

always @(ready_chips or feedback_pt_274)
  begin
      dork_love_in = !ready_chips |  feedback_pt_274;
  end

reg feedback_pt_275;

always @(marco_freaky or feedback_pt_275)
  begin
      kang_tsmc =  marco_freaky & !feedback_pt_275;
  end

reg feedback_pt_276;

always @(vcc or feedback_pt_276)
  begin
      boots_cuckoo = !vcc | !feedback_pt_276;
  end

reg feedback_pt_277;

always @(neville_beef or feedback_pt_277)
  begin
      cybex_saturn =  neville_beef | !feedback_pt_277;
  end

reg feedback_pt_278;

always @(gnd or feedback_pt_278)
  begin
      skipper_happy = !gnd | !feedback_pt_278;
  end

reg feedback_pt_279;

always @(priest_echo or feedback_pt_279)
  begin
      what_peta =  priest_echo ^ !feedback_pt_279;
  end

reg feedback_pt_280;

always @(hoser_zen or feedback_pt_280)
  begin
      midas_trevor = !hoser_zen & !feedback_pt_280;
  end

reg feedback_pt_281;

always @(bach_maryann or feedback_pt_281)
  begin
      donkey_genji = !bach_maryann |  feedback_pt_281;
  end

reg feedback_pt_282;

always @(whiskey_alpha or feedback_pt_282)
  begin
      starwars_gyro = !whiskey_alpha ^  feedback_pt_282;
  end

reg feedback_pt_283;

always @(deng_tinker or feedback_pt_283)
  begin
      century_biker =  deng_tinker ^  feedback_pt_283;
  end

reg feedback_pt_284;

always @(midas_trevor or feedback_pt_284)
  begin
      dow_rubeus = !midas_trevor | !feedback_pt_284;
  end

reg feedback_pt_285;

always @(pdiddy_dirty or feedback_pt_285)
  begin
      bush_gutter =  pdiddy_dirty &  feedback_pt_285;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sun_wannabe <= 0;
    else if (hoser_zen)
      sun_wannabe <= 0;
    else if (chief_bambi)
      sun_wannabe <= vcc;
  end

always @(sun_wannabe)
  begin
      feedback_pt_270 = sun_wannabe;
  end

always @(sun_wannabe)
  begin
      feedback_pt_271 = sun_wannabe;
  end

always @(sun_wannabe)
  begin
      feedback_pt_272 = sun_wannabe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      guy_ykocens <= 0;
    else if (show_mrbill)
      guy_ykocens <= 0;
    else if (cybex_saturn)
      guy_ykocens <= lotus_sgates;
  end

always @(guy_ykocens)
  begin
      feedback_pt_273 = guy_ykocens;
  end

always @(guy_ykocens)
  begin
      feedback_pt_274 = guy_ykocens;
  end

always @(guy_ykocens)
  begin
      feedback_pt_275 = guy_ykocens;
  end

always @(guy_ykocens)
  begin
      feedback_pt_276 = guy_ykocens;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sake_ocha <= 0;
    else if (bomb_yohimbe)
      sake_ocha <= gnd;
  end

always @(sake_ocha)
  begin
      feedback_pt_277 = sake_ocha;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oscar_gin <= 0;
    else
      oscar_gin <= dow_rubeus;
  end

always @(oscar_gin)
  begin
      feedback_pt_278 = oscar_gin;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nasdaq_iron <= 0;
    else if (wanton_flew)
      nasdaq_iron <= kana_zi;
  end

always @(nasdaq_iron)
  begin
      feedback_pt_279 = nasdaq_iron;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      po_killme <= 0;
    else if (intuit_voodoo)
      po_killme <= water_foryou;
    else if (boots_yellow)
      po_killme <= 0;
  end

always @(po_killme)
  begin
      feedback_pt_280 = po_killme;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zinc_bust <= 0;
    else if (gnd)
      zinc_bust <= 0;
    else if (aspirin_ritsu)
      zinc_bust <= ramone_black;
  end

always @(zinc_bust)
  begin
      feedback_pt_281 = zinc_bust;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      joker_gotone <= 1;
    else
      joker_gotone <= gnd;
  end

always @(joker_gotone)
  begin
      feedback_pt_282 = joker_gotone;
  end

wire rojas_norbert_wire;

dffea rojas_norbert_ff (
  .clk(clock0),
  .d(marge_killme),
  .ena(jupiter_ceres),
  .adata(diagon_willy),
  .clrn(!reset0),
  .q(rojas_norbert_wire)
);

always @(rojas_norbert_wire) begin
   iguana_buddha = rojas_norbert_wire;
end

always @(iguana_buddha)
  begin
      feedback_pt_283 = iguana_buddha;
  end

wire otter_hotel_wire;

dffeas otter_hotel_ff (
  .clk(clock0),
  .d(yankee_hoser),
  .ena(gnd),
  .sclr(kang_tsmc),
  .sload(vcc),
  .asdata(sake_ocha),
  .clrn(!reset0),
  .q(otter_hotel_wire)
);

always @(otter_hotel_wire) begin
   books_gojira = otter_hotel_wire;
end

always @(books_gojira)
  begin
      feedback_pt_284 = books_gojira;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tiger_drugs <= 0;
    else if (what_husks)
      tiger_drugs <= sake_ocha;
    else if (draco_october)
      tiger_drugs <= 0;
  end

always @(tiger_drugs)
  begin
      feedback_pt_285 = tiger_drugs;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pdaddy_powder <= 0;
    else if (gnd)
      pdaddy_powder <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beauty_coffee <= 0;
    else if (vcc)
      beauty_coffee <= vcc;
    else if (hagrid_neon)
      beauty_coffee <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tabasco_snape <= 1;
    else
      tabasco_snape <= gerard_kungfu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      quail_minnie <= 0;
    else
      quail_minnie <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      barney_cannon <= 0;
    else if (tiger_drugs)
      barney_cannon <= vcc;
    else if (water_foryou)
      barney_cannon <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ghost_asahi <= 0;
    else if (aspirin_ritsu)
      ghost_asahi <= whacky_husks;
    else if (guy_ykocens)
      ghost_asahi <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pirate_mrbill <= 0;
    else if (bush_gutter)
      pirate_mrbill <= 0;
    else if (nasdaq_iron)
      pirate_mrbill <= helena_sinus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      black_intuit <= 0;
    else if (quebec_webvan)
      black_intuit <= homerun_echo;
    else if (vcc)
      black_intuit <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atomic_lad <= 0;
    else
      atomic_lad <= shark_palm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      shark_peace <= 1;
    else
      shark_peace <= yak_brothers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      suffering_gm <= 0;
    else if (bacon_gyro)
      suffering_gm <= 0;
    else if (turnip_doobie)
      suffering_gm <= ladder_barnum;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spyro_lima <= 1;
    else
      spyro_lima <= po_killme;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lao_beef <= 0;
    else if (mushroom_dork)
      lao_beef <= crack_lamer;
    else if (deng_tinker)
      lao_beef <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      todd_malfoy <= 0;
    else if (tabby_guy)
      todd_malfoy <= yellow_wine;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hulk_booming <= 0;
    else
      hulk_booming <= whale_malfoy;
  end

reg feedback_pt_286;

always @(metal_dog or feedback_pt_286)
  begin
      eunice_eunice =  metal_dog |  feedback_pt_286;
  end

reg feedback_pt_287;

always @(vcc or feedback_pt_287)
  begin
      marco_thread = !vcc |  feedback_pt_287;
  end

reg feedback_pt_288;

always @(tabasco_snape or feedback_pt_288)
  begin
      sanity_fallen =  tabasco_snape ^  feedback_pt_288;
  end

reg feedback_pt_289;

always @(whiskey_alpha or feedback_pt_289)
  begin
      dopey_bomb = !whiskey_alpha & !feedback_pt_289;
  end

reg feedback_pt_290;

always @(wanton_flew or feedback_pt_290)
  begin
      ebi_bubba = !wanton_flew &  feedback_pt_290;
  end

reg feedback_pt_291;

always @(lao_beef or feedback_pt_291)
  begin
      roid_kungfu =  lao_beef |  feedback_pt_291;
  end

reg feedback_pt_292;

always @(what_peta or feedback_pt_292)
  begin
      hans_ritsu = !what_peta ^ !feedback_pt_292;
  end

reg feedback_pt_293;

always @(gnd or feedback_pt_293)
  begin
      rewire_bubba = !gnd &  feedback_pt_293;
  end

reg feedback_pt_294;

always @(gnd or feedback_pt_294)
  begin
      wildboar_mao =  gnd ^ !feedback_pt_294;
  end

reg feedback_pt_295;

always @(show_mrbill or feedback_pt_295)
  begin
      money_donut =  show_mrbill &  feedback_pt_295;
  end

reg feedback_pt_296;

always @(gnd or feedback_pt_296)
  begin
      freaky_amex = !gnd ^  feedback_pt_296;
  end

reg feedback_pt_297;

always @(eunice_eunice or feedback_pt_297)
  begin
      waffle_midas =  eunice_eunice | !feedback_pt_297;
  end

reg feedback_pt_298;

always @(whacky_husks or feedback_pt_298)
  begin
      wizard_norris = !whacky_husks |  feedback_pt_298;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tango_would <= 0;
    else if (gnd)
      tango_would <= oscar_gin;
    else if (rojas_tobe)
      tango_would <= 0;
  end

always @(tango_would)
  begin
      feedback_pt_286 = tango_would;
  end

always @(tango_would)
  begin
      feedback_pt_287 = tango_would;
  end

wire black_kebab_wire;

dffea black_kebab_ff (
  .clk(clock0),
  .d(curious_moron),
  .ena(boots_cuckoo),
  .adata(peaves_dutch),
  .clrn(!reset0),
  .q(black_kebab_wire)
);

always @(black_kebab_wire) begin
   show_bacon = black_kebab_wire;
end

always @(show_bacon)
  begin
      feedback_pt_288 = show_bacon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      coffee_wujing <= 0;
    else if (tesla_scrooge)
      coffee_wujing <= 0;
    else if (stoned_sake)
      coffee_wujing <= hp_eeevil;
  end

always @(coffee_wujing)
  begin
      feedback_pt_289 = coffee_wujing;
  end

wire master_elf_wire;

dffea master_elf_ff (
  .clk(clock0),
  .d(vcc),
  .ena(todd_malfoy),
  .adata(gnd),
  .clrn(!reset0),
  .q(master_elf_wire)
);

always @(master_elf_wire) begin
   cartman_hurt = master_elf_wire;
end

always @(cartman_hurt)
  begin
      feedback_pt_290 = cartman_hurt;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      purple_maki <= 0;
    else if (wizard_norris)
      purple_maki <= 0;
    else if (money_donut)
      purple_maki <= wizard_norris;
  end

always @(purple_maki)
  begin
      feedback_pt_291 = purple_maki;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lala_agitator <= 0;
    else
      lala_agitator <= roid_kungfu;
  end

always @(lala_agitator)
  begin
      feedback_pt_292 = lala_agitator;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      baron_juliet <= 0;
    else
      baron_juliet <= vcc;
  end

always @(baron_juliet)
  begin
      feedback_pt_293 = baron_juliet;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      yoda_kangaroo <= 1;
    else
      yoda_kangaroo <= vcc;
  end

always @(yoda_kangaroo)
  begin
      feedback_pt_294 = yoda_kangaroo;
  end

wire banshee_think_wire;

dffeas banshee_think_ff (
  .clk(clock0),
  .d(fury_saturn),
  .ena(hulk_booming),
  .sclr(purple_maki),
  .sload(priest_echo),
  .asdata(ajax_psycho),
  .clrn(!reset0),
  .q(banshee_think_wire)
);

always @(banshee_think_wire) begin
   martin_bolt = banshee_think_wire;
end

always @(martin_bolt)
  begin
      feedback_pt_295 = martin_bolt;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bush_kbtoys <= 0;
    else if (homerun_stix)
      bush_kbtoys <= 0;
    else if (gnd)
      bush_kbtoys <= isle_fufu;
  end

always @(bush_kbtoys)
  begin
      feedback_pt_296 = bush_kbtoys;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mideast_bolt <= 0;
    else if (gnd)
      mideast_bolt <= rat_wakey;
    else if (show_bacon)
      mideast_bolt <= 0;
  end

always @(mideast_bolt)
  begin
      feedback_pt_297 = mideast_bolt;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      minnow_marco <= 0;
    else if (deng_tinker)
      minnow_marco <= skipper_happy;
    else if (sake_ocha)
      minnow_marco <= 0;
  end

always @(minnow_marco)
  begin
      feedback_pt_298 = minnow_marco;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hurt_rose <= 0;
    else if (freaky_amex)
      hurt_rose <= barney_cannon;
  end

wire hours_green_wire;

dffeas hours_green_ff (
  .clk(clock0),
  .d(todd_malfoy),
  .ena(ham_alpha),
  .sclr(zinc_bust),
  .sload(pdaddy_powder),
  .asdata(possum_yoda),
  .clrn(!reset0),
  .q(hours_green_wire)
);

always @(hours_green_wire) begin
   venus_elian = hours_green_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pyro_zipporah <= 1;
    else
      pyro_zipporah <= sanity_fallen;
  end

wire killer_marker_wire;

dffeas killer_marker_ff (
  .clk(clock0),
  .d(vcc),
  .ena(beauty_coffee),
  .sclr(vcc),
  .sload(vcc),
  .asdata(spyro_lima),
  .clrn(!reset0),
  .q(killer_marker_wire)
);

always @(killer_marker_wire) begin
   snake_marco = killer_marker_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bubba_peta <= 1;
    else
      bubba_peta <= elian_romeo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      honda_pdaddy <= 0;
    else if (whacky_husks)
      honda_pdaddy <= 0;
    else if (fortuyn_heidi)
      honda_pdaddy <= nobody_zeus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      midas_macys <= 1;
    else
      midas_macys <= dopey_bomb;
  end

  always@(*)
  begin
    zed_orange = ( ~( ~dopey_bomb & ~( ~vcc ) ) ) & ~( ~( mideast_bolt ) ) ^ ~( ( shark_peace & sun_tesla ) ) ^ ~pyro_zipporah ? ( ( vcc ^ ( ~saturn_simasu ^ midas_macys ) & ~( ~suffering_gm ) ) ^ ~( ~( ( vcc ^ spain_stix ) ) ) ) ^ ~( ~( ~( ~( sun_wannabe ) ) ) ) : ~( ~( ~joker_gotone ) );
  end
// State Mek drevil_spirit Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      drevil_spirit <= drevil_spirit_0;
    else
      case (drevil_spirit)
        drevil_spirit_0: begin
          if ({vcc,deng_tinker,venus_elian,quail_minnie} == 0)
            drevil_spirit <= drevil_spirit_2;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 15)
            drevil_spirit <= drevil_spirit_3;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 11)
            drevil_spirit <= drevil_spirit_2;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 3)
            drevil_spirit <= drevil_spirit_4;
          else
            drevil_spirit <= drevil_spirit_0;
          end
        drevil_spirit_1: begin
          if ({vcc,deng_tinker,venus_elian,quail_minnie} == 8)
            drevil_spirit <= drevil_spirit_0;
          else
            drevil_spirit <= drevil_spirit_1;
          end
        drevil_spirit_2: begin
          if ({vcc,deng_tinker,venus_elian,quail_minnie} == 15)
            drevil_spirit <= drevil_spirit_3;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 3)
            drevil_spirit <= drevil_spirit_1;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 9)
            drevil_spirit <= drevil_spirit_4;
          else
            drevil_spirit <= drevil_spirit_2;
          end
        drevil_spirit_3: begin
          if ({vcc,deng_tinker,venus_elian,quail_minnie} == 11)
            drevil_spirit <= drevil_spirit_0;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 15)
            drevil_spirit <= drevil_spirit_0;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 5)
            drevil_spirit <= drevil_spirit_3;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 2)
            drevil_spirit <= drevil_spirit_2;
          else if ({vcc,deng_tinker,venus_elian,quail_minnie} == 8)
            drevil_spirit <= drevil_spirit_0;
          else
            drevil_spirit <= drevil_spirit_3;
          end
        drevil_spirit_4: begin
            drevil_spirit <= drevil_spirit_4;
          end
        default: drevil_spirit <= drevil_spirit_0;
      endcase
  end

// State Mek drevil_spirit Output logic
always @(drevil_spirit)
  begin
    // consider all state regs when doing outputs
    case (drevil_spirit)
        drevil_spirit_0: begin
            ulysses_nyc = 1;
            mine_ostrich = 1;
            art_zed = 1;
            what_intel = 0;
            gopher_minnow = 1;
            neon_snape = 0;
            rufus_advil = 0;
            zedong_lucius = 1;
          end
        drevil_spirit_1: begin
            ulysses_nyc = 1;
            mine_ostrich = 1;
            art_zed = 0;
            what_intel = 1;
            gopher_minnow = 1;
            neon_snape = 0;
            rufus_advil = 1;
            zedong_lucius = 0;
          end
        drevil_spirit_2: begin
            ulysses_nyc = 1;
            mine_ostrich = 1;
            art_zed = 1;
            what_intel = 0;
            gopher_minnow = 1;
            neon_snape = 1;
            rufus_advil = 0;
            zedong_lucius = 0;
          end
        drevil_spirit_3: begin
            ulysses_nyc = 0;
            mine_ostrich = 0;
            art_zed = 0;
            what_intel = 1;
            gopher_minnow = 1;
            neon_snape = 0;
            rufus_advil = 1;
            zedong_lucius = 0;
          end
        drevil_spirit_4: begin
            ulysses_nyc = 0;
            mine_ostrich = 1;
            art_zed = 1;
            what_intel = 1;
            gopher_minnow = 1;
            neon_snape = 1;
            rufus_advil = 1;
            zedong_lucius = 0;
          end
        default: begin
            ulysses_nyc = 0;
            mine_ostrich = 0;
            art_zed = 1;
            what_intel = 0;
            gopher_minnow = 1;
            neon_snape = 1;
            rufus_advil = 1;
            zedong_lucius = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire foryou_rubik_out;
nut_001_lut #(5) nut_001_lut_inst_foryou_rubik (
  .din({gnd,hurt_rose,egg_homer,pimpernel_moe,gnd}),
  .mask(32'b01111010000100001100110011001000),
  .out(foryou_rubik_out)
);

always @(foryou_rubik_out)
begin
   sake_bullet = foryou_rubik_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire sgates_thedon_out;
nut_001_lut #(3) nut_001_lut_inst_sgates_thedon (
  .din({bep,vcc,hurt_rose}),
  .mask(8'h06),
  .out(sgates_thedon_out)
);

always @(sgates_thedon_out)
begin
   chairman_bfs = sgates_thedon_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire peace_broom_out;
nut_001_lut #(1) nut_001_lut_inst_peace_broom (
  .din({zebra_lad}),
  .mask(2'b00),
  .out(peace_broom_out)
);

always @(peace_broom_out)
begin
   hulk_atomic = peace_broom_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire nobody_martin_out;
nut_001_lut #(6) nut_001_lut_inst_nobody_martin (
  .din({minnow_marco,eel_zinc,freaky_amex,dow_rubeus,moe_carolina,tesla_scrooge}),
  .mask(64'b0100000111000000000000100100000001010001000001100010000000100000),
  .out(nobody_martin_out)
);

always @(nobody_martin_out)
begin
   boing_illegal = nobody_martin_out;
end

// 10 bit up counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {kang_minnie,fortuyn_lamer,pacific_asahi,todd_pictures,thedon_potato,holland_haze,wujing_xray,dopey_sinew,advil_cow,platinum_haze} <= 0;
    else
      {kang_minnie,fortuyn_lamer,pacific_asahi,todd_pictures,thedon_potato,holland_haze,wujing_xray,dopey_sinew,advil_cow,platinum_haze} <= {kang_minnie,fortuyn_lamer,pacific_asahi,todd_pictures,thedon_potato,holland_haze,wujing_xray,dopey_sinew,advil_cow,platinum_haze} + 1;
  end

// NAND all of these bits together
always @(chairman_bfs or hulk_booming or nasdaq_iron or copper_gerrit or show_bacon or zed_orange or gnd or beauty_coffee or quail_minnie or gnd or freaky_amex or vcc)
  begin
      fire_waster = ~& {chairman_bfs,hulk_booming,nasdaq_iron,copper_gerrit,show_bacon,zed_orange,gnd,beauty_coffee,quail_minnie,gnd,freaky_amex,vcc};
  end

reg feedback_pt_299;

always @(vcc or feedback_pt_299)
  begin
      iterate_sugar =  vcc & !feedback_pt_299;
  end

reg feedback_pt_300;

always @(vcc or feedback_pt_300)
  begin
      amex_potter =  vcc ^ !feedback_pt_300;
  end

reg feedback_pt_301;

always @(advil_cow or feedback_pt_301)
  begin
      thor_cucumber =  advil_cow ^  feedback_pt_301;
  end

reg feedback_pt_302;

always @(gnd or feedback_pt_302)
  begin
      loud_chiptrip =  gnd &  feedback_pt_302;
  end

reg feedback_pt_303;

always @(vcc or feedback_pt_303)
  begin
      south_toysrus =  vcc &  feedback_pt_303;
  end

reg feedback_pt_304;

always @(starwars_gyro or feedback_pt_304)
  begin
      echo_eggsalad = !starwars_gyro |  feedback_pt_304;
  end

reg feedback_pt_305;

always @(gnd or feedback_pt_305)
  begin
      cain_intel = !gnd |  feedback_pt_305;
  end

reg feedback_pt_306;

always @(yoda_kangaroo or feedback_pt_306)
  begin
      homerun_deng =  yoda_kangaroo |  feedback_pt_306;
  end

reg feedback_pt_307;

always @(purple_maki or feedback_pt_307)
  begin
      dragon_malfoy =  purple_maki ^ !feedback_pt_307;
  end

reg feedback_pt_308;

always @(portnoy_stick or feedback_pt_308)
  begin
      india_squad =  portnoy_stick &  feedback_pt_308;
  end

reg feedback_pt_309;

always @(oscar_bonker or feedback_pt_309)
  begin
      sanity_tarzan = !oscar_bonker & !feedback_pt_309;
  end

reg feedback_pt_310;

always @(boots_cuckoo or feedback_pt_310)
  begin
      concorde_show = !boots_cuckoo & !feedback_pt_310;
  end

reg feedback_pt_311;

always @(dork_love_in or feedback_pt_311)
  begin
      covad_ocha =  dork_love_in &  feedback_pt_311;
  end

reg feedback_pt_312;

always @(quail_minnie or feedback_pt_312)
  begin
      weevil_money = !quail_minnie &  feedback_pt_312;
  end

reg feedback_pt_313;

always @(snake_marco or feedback_pt_313)
  begin
      loser_echo =  snake_marco ^  feedback_pt_313;
  end

reg feedback_pt_314;

always @(martin_bolt or feedback_pt_314)
  begin
      potter_thor =  martin_bolt | !feedback_pt_314;
  end

reg feedback_pt_315;

always @(gnd or feedback_pt_315)
  begin
      money_fortuyn =  gnd ^  feedback_pt_315;
  end

reg feedback_pt_316;

always @(vcc or feedback_pt_316)
  begin
      blue_carolina =  vcc ^ !feedback_pt_316;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hanger_lizard <= 0;
    else if (spyro_lima)
      hanger_lizard <= gnd;
  end

always @(hanger_lizard)
  begin
      feedback_pt_299 = hanger_lizard;
  end

always @(hanger_lizard)
  begin
      feedback_pt_300 = hanger_lizard;
  end

always @(hanger_lizard)
  begin
      feedback_pt_301 = hanger_lizard;
  end

always @(hanger_lizard)
  begin
      feedback_pt_302 = hanger_lizard;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gregg_a_lovey <= 1;
    else
      gregg_a_lovey <= gnd;
  end

always @(gregg_a_lovey)
  begin
      feedback_pt_303 = gregg_a_lovey;
  end

always @(gregg_a_lovey)
  begin
      feedback_pt_304 = gregg_a_lovey;
  end

always @(gregg_a_lovey)
  begin
      feedback_pt_305 = gregg_a_lovey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gap_tamago <= 1;
    else
      gap_tamago <= gnd;
  end

always @(gap_tamago)
  begin
      feedback_pt_306 = gap_tamago;
  end

always @(gap_tamago)
  begin
      feedback_pt_307 = gap_tamago;
  end

always @(gap_tamago)
  begin
      feedback_pt_308 = gap_tamago;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      genji_stirfry <= 0;
    else if (pluto_psycho)
      genji_stirfry <= 0;
    else if (hanger_lizard)
      genji_stirfry <= zed_orange;
  end

always @(genji_stirfry)
  begin
      feedback_pt_309 = genji_stirfry;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fish_waffle <= 0;
    else if (fortuyn_lamer)
      fish_waffle <= 0;
    else if (sears_george)
      fish_waffle <= gnd;
  end

always @(fish_waffle)
  begin
      feedback_pt_310 = fish_waffle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      daughter_sake <= 1;
    else
      daughter_sake <= gnd;
  end

always @(daughter_sake)
  begin
      feedback_pt_311 = daughter_sake;
  end

wire oscar_too_big_wire;

dffeas oscar_too_big_ff (
  .clk(clock0),
  .d(money_fortuyn),
  .ena(gnd),
  .sclr(vcc),
  .sload(vcc),
  .asdata(fish_waffle),
  .clrn(!reset0),
  .q(oscar_too_big_wire)
);

always @(oscar_too_big_wire) begin
   dork_rouge = oscar_too_big_wire;
end

always @(dork_rouge)
  begin
      feedback_pt_312 = dork_rouge;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jonas_rocks <= 1;
    else
      jonas_rocks <= sun_wannabe;
  end

always @(jonas_rocks)
  begin
      feedback_pt_313 = jonas_rocks;
  end

wire husks_gotone_wire;

dffeas husks_gotone_ff (
  .clk(clock0),
  .d(boots_cuckoo),
  .ena(kanji_uppers),
  .sclr(gnd),
  .sload(valve_loud),
  .asdata(baron_juliet),
  .clrn(!reset0),
  .q(husks_gotone_wire)
);

always @(husks_gotone_wire) begin
   klaas_diagon = husks_gotone_wire;
end

always @(klaas_diagon)
  begin
      feedback_pt_314 = klaas_diagon;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jcrew_cow <= 0;
    else if (holland_haze)
      jcrew_cow <= 0;
    else if (sanity_tarzan)
      jcrew_cow <= spain_loser;
  end

always @(jcrew_cow)
  begin
      feedback_pt_315 = jcrew_cow;
  end

wire rarest_emails_wire;

dffea rarest_emails_ff (
  .clk(clock0),
  .d(wizard_norris),
  .ena(gap_tamago),
  .adata(cybex_air),
  .clrn(!reset0),
  .q(rarest_emails_wire)
);

always @(rarest_emails_wire) begin
   kanji_clay = rarest_emails_wire;
end

always @(kanji_clay)
  begin
      feedback_pt_316 = kanji_clay;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      concorde_bart <= 0;
    else
      concorde_bart <= books_gojira;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      master_bamboo <= 1;
    else
      master_bamboo <= popcorn_advil;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      att_launcher <= 1;
    else
      att_launcher <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      surfer_tuna <= 0;
    else
      surfer_tuna <= echo_eggsalad;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dig_shark <= 1;
    else
      dig_shark <= genji_stirfry;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      illegal_rod <= 0;
    else
      illegal_rod <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      vegas_peace <= 0;
    else if (gnd)
      vegas_peace <= 0;
    else if (solder_issac)
      vegas_peace <= loser_echo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beef_shuda <= 0;
    else if (todd_pictures)
      beef_shuda <= vcc;
    else if (spain_loser)
      beef_shuda <= 0;
  end

// 4 bit add sub
always @(gnd or surfer_tuna or pacific_asahi or concorde_show or boing_illegal or wildboar_mao or beauty_coffee or hulk_booming)
  begin
    {soccer_speed,zhuang_drugie,falafel_sun,quebec_lovey} = 
		{gnd,surfer_tuna,pacific_asahi,concorde_show} - 
		{boing_illegal,wildboar_mao,beauty_coffee,hulk_booming};
  end

// A + const
always @(spain_loser or bubba_peta or vcc or atomic_lad or books_gojira)
  begin
    {potato_rod,south_nasdaq,malfoy_boing,yankees_heidi} = {spain_loser,bubba_peta,vcc,atomic_lad,books_gojira} + 56;
  end

// Triple add / sub bait
always @(vcc or dopey_sinew or skipper_happy or iterate_sugar or solder_issac or zhuang_drugie or vcc or show_bacon or lala_agitator or dig_shark or hiway_jesus or quebec_lovey or
         gnd or kanji_uppers or wildboar_mao or waffle_midas or stoned_sake or soccer_speed or fortuyn_lamer or gnd or weevil_money or zhuang_drugie or nasdaq_iron or tonks_snake or
         art_zed or honda_pdaddy or gnd or sake_bullet or vcc or vcc or gnd or gnd or gnd or daughter_sake or potato_rod or gnd)
  begin
    {giraffe_huey,bono_homer,pig_fear,curly_baron,loser_curious,obiwan_quail,bravo_haze,rasp_bubba,dork_dingbat,drugie_pilot,tsmc_safada,ford_comtrex} = 
        {vcc,dopey_sinew,skipper_happy,iterate_sugar,solder_issac,zhuang_drugie,vcc,show_bacon,lala_agitator,dig_shark,hiway_jesus,quebec_lovey} -
        {gnd,kanji_uppers,wildboar_mao,waffle_midas,stoned_sake,soccer_speed,fortuyn_lamer,gnd,weevil_money,zhuang_drugie,nasdaq_iron,tonks_snake} +
        {art_zed,honda_pdaddy,gnd,sake_bullet,vcc,vcc,gnd,gnd,gnd,daughter_sake,potato_rod,gnd};
  end

// 3 to 5 bit A*Const mult
reg  [2:0] snort_jinyong;
always @(fortuyn_lamer or gregg_a_lovey or concorde_show) begin
  snort_jinyong = {fortuyn_lamer,gregg_a_lovey,concorde_show};
end

always @(snort_jinyong)
  begin
      {bert_south,art_norbert,legos_tofu,ladder_pyro,hotdog_sgates} = 
	  	  snort_jinyong * 
		  187;
  end

// 6 bit SOP selector
always @(
        fire_waster or gopher_minnow  or 
        potter_thor or ebi_bubba  or 
        venus_elian or drugie_pilot  or 
        platinum_haze or loud_ariel  or 
        gnd or yankees_heidi  or 
        vcc or dork_rouge 
)

begin
    life_lao = 
      fire_waster & gopher_minnow |
      potter_thor & ebi_bubba |
      venus_elian & drugie_pilot |
      platinum_haze & loud_ariel |
      gnd & yankees_heidi |
      vcc & dork_rouge;
end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      palm_haze <= 0;
    else
    case ({gnd,kanji_clay})
       0 : palm_haze <= pirate_mrbill;
       1 : palm_haze <= gnd;
       2 : palm_haze <= zulu_eel;
       3 : palm_haze <= drugie_pilot;
       default : palm_haze <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      boitano_brian <= 0;
    else
    case ({obiwan_quail,dork_dingbat})
       0 : boitano_brian <= gnd;
       1 : boitano_brian <= boitano_brian;
       2 : boitano_brian <= freaky_amex;
       3 : boitano_brian <= vcc;
       default : boitano_brian <= 0;
    endcase
  end

// NAND all of these bits together
always @(hurt_rose or south_nasdaq or eel_zinc or vcc or drugie_pilot or whacky_husks)
  begin
      hippo_mozart = ~& {hurt_rose,south_nasdaq,eel_zinc,vcc,drugie_pilot,whacky_husks};
  end

// Greater Equal Less compare
always @(holland_haze or gnd or bush_kbtoys or dork_dingbat or thedon_potato or tsmc_safada or eel_zinc or minnow_marco or hulk_atomic or gnd)
  begin
    if ({holland_haze,gnd,bush_kbtoys,dork_dingbat,thedon_potato} > {tsmc_safada,eel_zinc,minnow_marco,hulk_atomic,gnd})
       {nest_crank,roid_odin,due_tango} = 3'b100;
    else if ({holland_haze,gnd,bush_kbtoys,dork_dingbat,thedon_potato} < {tsmc_safada,eel_zinc,minnow_marco,hulk_atomic,gnd})
       {nest_crank,roid_odin,due_tango} = 3'b010;
    else
       {nest_crank,roid_odin,due_tango} = 3'b001;
  end

// NAND all of these bits together
always @(weevil_money or vcc or spain_stix or quebec_webvan or beef_shuda or gnd or crack_lamer or vegas_peace or cain_intel)
  begin
      goofy_bach = ~& {weevil_money,vcc,spain_stix,quebec_webvan,beef_shuda,gnd,crack_lamer,vegas_peace,cain_intel};
  end


initial begin
    {fufu_minnow,trevor_wanton,freaky_marco,lagoon_broom} = 0;
end

// Registered 4 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (falafel_sun)
      {fufu_minnow,trevor_wanton,freaky_marco,lagoon_broom} <= 0;
    else if (beef_shuda)
      {fufu_minnow,trevor_wanton,freaky_marco,lagoon_broom} <=
		  {vcc,iguana_buddha,vcc,donkey_genji};
    else
      {fufu_minnow,trevor_wanton,freaky_marco,lagoon_broom} <=
		 {vcc,eunice_eunice,holland_haze,gnd} + 
		 {master_bamboo,hippo_mozart,marco_thread,concorde_bart};
  end

// NAND all of these bits together
always @(moe_carolina or att_launcher or lagoon_broom or ulysses_nyc)
  begin
      tinker_sheep = ~& {moe_carolina,att_launcher,lagoon_broom,ulysses_nyc};
  end

// 3 bit priority MUX
always @(
        rojas_kungfu or illegal_rod  or 
        gnd or homerun_deng  or 
        loser_curious or roid_odin 
)

  begin
    if (rojas_kungfu) lizard_kanji = illegal_rod;
    else if (gnd) lizard_kanji = homerun_deng;
    else if (loser_curious) lizard_kanji = roid_odin;
    else lizard_kanji = 0;
  end

// 7 bit priority MUX
always @(
        gnd or curly_baron  or 
        hotdog_sgates or gnd  or 
        amex_potter or gnd  or 
        ladder_pyro or pig_fear  or 
        hulk_atomic or ready_chips  or 
        gnd or whale_malfoy  or 
        vcc or mine_ostrich 
)

  begin
    if (gnd) foxtrot_sears = curly_baron;
    else if (hotdog_sgates) foxtrot_sears = gnd;
    else if (amex_potter) foxtrot_sears = gnd;
    else if (ladder_pyro) foxtrot_sears = pig_fear;
    else if (hulk_atomic) foxtrot_sears = ready_chips;
    else if (gnd) foxtrot_sears = whale_malfoy;
    else if (vcc) foxtrot_sears = mine_ostrich;
    else foxtrot_sears = 0;
  end


// building a 16 to 1 MUX operator
reg [15:0] sheep_bart_mux_dat;
reg [3:0] sheep_bart_mux_sel;
always @(curly_baron or vcc or what_intel or kanji_uppers or dragon_malfoy or crack_lamer or pyro_zipporah or skipper_happy or palm_haze or covad_ocha or holland_haze or lsd_turnip or holland_haze or nasdaq_iron or nyc_foliage or vcc)
  begin
    sheep_bart_mux_dat = {curly_baron,vcc,what_intel,kanji_uppers,dragon_malfoy,crack_lamer,pyro_zipporah,skipper_happy,palm_haze,covad_ocha,holland_haze,lsd_turnip,holland_haze,nasdaq_iron,nyc_foliage,vcc};
  end

always @(illegal_rod or gnd or lizard_kanji or zedong_lucius)
  begin
    sheep_bart_mux_sel = {illegal_rod,gnd,lizard_kanji,zedong_lucius};
  end

always @(sheep_bart_mux_dat or sheep_bart_mux_sel)
  begin
    air_monkey = sheep_bart_mux_dat[sheep_bart_mux_sel];
  end

// XNOR all of these bits together
always @(show_bacon or legos_tofu or fire_waster)
  begin
      chief_peta = ~^ {show_bacon,legos_tofu,fire_waster};
  end

// Random 4 input look up table
always @(gnd or gnd or trevor_wanton or hippo_mozart)
  begin
    casex ({gnd,gnd,trevor_wanton,hippo_mozart})
      0: west_powder=1;
      1: west_powder=1;
      2: west_powder=0;
      3: west_powder=1;
      4: west_powder=1;
      5: west_powder=0;
      6: west_powder=0;
      7: west_powder=0;
      8: west_powder=1;
      9: west_powder=1;
      10: west_powder=1;
      11: west_powder=0;
      12: west_powder=0;
      13: west_powder=1;
      14: west_powder=1;
      15: west_powder=0;
      default: west_powder=0;
    endcase
  end

// Random 6 input look up table
always @(tinker_sheep or vcc or lsd_turnip or coffee_wujing or boitano_brian or eel_zinc)
  begin
    casex ({tinker_sheep,vcc,lsd_turnip,coffee_wujing,boitano_brian,eel_zinc})
      0: jacob_malfoy=0;
      1: jacob_malfoy=1;
      2: jacob_malfoy=1;
      3: jacob_malfoy=1;
      4: jacob_malfoy=0;
      5: jacob_malfoy=0;
      6: jacob_malfoy=0;
      7: jacob_malfoy=0;
      8: jacob_malfoy=1;
      9: jacob_malfoy=1;
      10: jacob_malfoy=0;
      11: jacob_malfoy=1;
      12: jacob_malfoy=0;
      13: jacob_malfoy=0;
      14: jacob_malfoy=0;
      15: jacob_malfoy=1;
      16: jacob_malfoy=0;
      17: jacob_malfoy=1;
      18: jacob_malfoy=1;
      19: jacob_malfoy=1;
      20: jacob_malfoy=1;
      21: jacob_malfoy=1;
      22: jacob_malfoy=0;
      23: jacob_malfoy=0;
      24: jacob_malfoy=1;
      25: jacob_malfoy=1;
      26: jacob_malfoy=1;
      27: jacob_malfoy=0;
      28: jacob_malfoy=1;
      29: jacob_malfoy=1;
      30: jacob_malfoy=1;
      31: jacob_malfoy=0;
      32: jacob_malfoy=0;
      33: jacob_malfoy=0;
      34: jacob_malfoy=0;
      35: jacob_malfoy=1;
      36: jacob_malfoy=1;
      37: jacob_malfoy=0;
      38: jacob_malfoy=1;
      39: jacob_malfoy=1;
      40: jacob_malfoy=1;
      41: jacob_malfoy=0;
      42: jacob_malfoy=1;
      43: jacob_malfoy=1;
      44: jacob_malfoy=1;
      45: jacob_malfoy=0;
      46: jacob_malfoy=1;
      47: jacob_malfoy=1;
      48: jacob_malfoy=0;
      49: jacob_malfoy=1;
      50: jacob_malfoy=1;
      51: jacob_malfoy=1;
      52: jacob_malfoy=1;
      53: jacob_malfoy=1;
      54: jacob_malfoy=1;
      55: jacob_malfoy=1;
      56: jacob_malfoy=0;
      57: jacob_malfoy=1;
      58: jacob_malfoy=0;
      59: jacob_malfoy=1;
      60: jacob_malfoy=1;
      61: jacob_malfoy=1;
      62: jacob_malfoy=1;
      63: jacob_malfoy=0;
      default: jacob_malfoy=0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dimetap_bagel <= 0;
    else
    case ({guy_steaming,minnow_marco})
       0 : dimetap_bagel <= vcc;
       1 : dimetap_bagel <= chief_peta;
       2 : dimetap_bagel <= deng_tinker;
       3 : dimetap_bagel <= dimetap_bagel;
       default : dimetap_bagel <= 0;
    endcase
  end

// AND all of these bits together
always @(honda_pdaddy or wujing_xray or foxtrot_sears or rewire_bubba or snake_marco or bert_south or pig_fear or vcc)
  begin
      neville_po = & {honda_pdaddy,wujing_xray,foxtrot_sears,rewire_bubba,snake_marco,bert_south,pig_fear,vcc};
  end

// 3 bit priority MUX
always @(
        dragon_malfoy or pig_fear  or 
        gnd or thor_cucumber  or 
        jcrew_cow or hiway_jesus 
)

  begin
    if (dragon_malfoy) trevor_thread = pig_fear;
    else if (gnd) trevor_thread = thor_cucumber;
    else if (jcrew_cow) trevor_thread = hiway_jesus;
    else trevor_thread = 0;
  end

// NOR all of these bits together
always @(wizard_norris or art_norbert or fortuyn_lamer or moe_carolina or neon_snape)
  begin
      zen_tako = ~| {wizard_norris,art_norbert,fortuyn_lamer,moe_carolina,neon_snape};
  end

// 2 bit priority MUX
always @(
        books_gojira or neville_po  or 
        hans_ritsu or india_squad 
)

  begin
    if (books_gojira) curie_macys = neville_po;
    else if (hans_ritsu) curie_macys = india_squad;
    else curie_macys = 0;
  end

reg feedback_pt_317;

always @(vcc or feedback_pt_317)
  begin
      exodus_lima =  vcc |  feedback_pt_317;
  end

reg feedback_pt_318;

always @(wizard_norris or feedback_pt_318)
  begin
      nasdaq_ebay =  wizard_norris | !feedback_pt_318;
  end

reg feedback_pt_319;

always @(dimetap_bagel or feedback_pt_319)
  begin
      zulu_baron = !dimetap_bagel & !feedback_pt_319;
  end

reg feedback_pt_320;

always @(hippo_mozart or feedback_pt_320)
  begin
      fury_beast = !hippo_mozart |  feedback_pt_320;
  end

reg feedback_pt_321;

always @(cartman_hurt or feedback_pt_321)
  begin
      peaves_squad =  cartman_hurt | !feedback_pt_321;
  end

reg feedback_pt_322;

always @(fortuyn_lamer or feedback_pt_322)
  begin
      fury_grams =  fortuyn_lamer &  feedback_pt_322;
  end

reg feedback_pt_323;

always @(platinum_haze or feedback_pt_323)
  begin
      lotus_golf = !platinum_haze &  feedback_pt_323;
  end

reg feedback_pt_324;

always @(vcc or feedback_pt_324)
  begin
      rocks_ohisee =  vcc &  feedback_pt_324;
  end

reg feedback_pt_325;

always @(ajax_too_big or feedback_pt_325)
  begin
      jonas_monster = !ajax_too_big ^ !feedback_pt_325;
  end

reg feedback_pt_326;

always @(lizard_kanji or feedback_pt_326)
  begin
      ginger_tsmc =  lizard_kanji &  feedback_pt_326;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hotel_macys <= 0;
    else if (vcc)
      hotel_macys <= gnd;
    else if (ford_comtrex)
      hotel_macys <= 0;
  end

always @(hotel_macys)
  begin
      feedback_pt_317 = hotel_macys;
  end

wire roe_abraham_wire;

dffeas roe_abraham_ff (
  .clk(clock0),
  .d(ebi_bubba),
  .ena(gnd),
  .sclr(life_lao),
  .sload(vcc),
  .asdata(hippo_mozart),
  .clrn(!reset0),
  .q(roe_abraham_wire)
);

always @(roe_abraham_wire) begin
   tinker_george = roe_abraham_wire;
end

always @(tinker_george)
  begin
      feedback_pt_318 = tinker_george;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pig_budlite <= 1;
    else
      pig_budlite <= rocks_ohisee;
  end

always @(pig_budlite)
  begin
      feedback_pt_319 = pig_budlite;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      monkey_whale <= 0;
    else
      monkey_whale <= minnow_marco;
  end

always @(monkey_whale)
  begin
      feedback_pt_320 = monkey_whale;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      babette_crank <= 0;
    else if (loud_chiptrip)
      babette_crank <= freaky_marco;
  end

always @(babette_crank)
  begin
      feedback_pt_321 = babette_crank;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chillis_peace <= 0;
    else if (coffee_wujing)
      chillis_peace <= whacky_husks;
    else if (zen_tako)
      chillis_peace <= 0;
  end

always @(chillis_peace)
  begin
      feedback_pt_322 = chillis_peace;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lima_hummer <= 0;
    else if (zulu_baron)
      lima_hummer <= 0;
    else if (dimetap_bagel)
      lima_hummer <= vcc;
  end

always @(lima_hummer)
  begin
      feedback_pt_323 = lima_hummer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bolt_foliage <= 0;
    else if (jacob_malfoy)
      bolt_foliage <= 0;
    else if (lima_hummer)
      bolt_foliage <= ebi_bubba;
  end

always @(bolt_foliage)
  begin
      feedback_pt_324 = bolt_foliage;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      severus_valve <= 0;
    else if (life_lao)
      severus_valve <= 0;
    else if (legos_tofu)
      severus_valve <= bolt_foliage;
  end

always @(severus_valve)
  begin
      feedback_pt_325 = severus_valve;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dweebie_bep <= 0;
    else if (bravo_haze)
      dweebie_bep <= vcc;
    else if (gnd)
      dweebie_bep <= 0;
  end

always @(dweebie_bep)
  begin
      feedback_pt_326 = dweebie_bep;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      llama_palm <= 0;
    else if (hotel_macys)
      llama_palm <= nasdaq_ebay;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      might_what <= 0;
    else if (loud_chiptrip)
      might_what <= 0;
    else if (gnd)
      might_what <= mine_ostrich;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kilo_knot <= 0;
    else if (gnd)
      kilo_knot <= vcc;
    else if (cartman_hurt)
      kilo_knot <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      emu_xiaoping <= 0;
    else if (vcc)
      emu_xiaoping <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pastrami_bull <= 1;
    else
      pastrami_bull <= wujing_xray;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tiger_dimetap <= 0;
    else if (gnd)
      tiger_dimetap <= 0;
    else if (vcc)
      tiger_dimetap <= peaves_squad;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      water_century <= 0;
    else if (zulu_baron)
      water_century <= 0;
    else if (fufu_minnow)
      water_century <= starwars_gyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ernie_woman <= 0;
    else
      ernie_woman <= tinker_george;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      woman_tiger <= 0;
    else if (ernie_woman)
      woman_tiger <= hulk_atomic;
    else if (kilo_knot)
      woman_tiger <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      baron_foliage <= 0;
    else if (hippo_mozart)
      baron_foliage <= 0;
    else if (boing_illegal)
      baron_foliage <= gnd;
  end

wire bust_zen_wire;

dffeas bust_zen_ff (
  .clk(clock0),
  .d(gnd),
  .ena(starwars_gyro),
  .sclr(malfoy_boing),
  .sload(gnd),
  .asdata(blue_carolina),
  .clrn(!reset0),
  .q(bust_zen_wire)
);

always @(bust_zen_wire) begin
   hinge_enoch = bust_zen_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      homer_goofy <= 1;
    else
      homer_goofy <= exodus_lima;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      theseus_maki <= 0;
    else if (valve_loud)
      theseus_maki <= 0;
    else if (india_squad)
      theseus_maki <= water_century;
  end

// State Mek maklak_waffle Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      maklak_waffle <= maklak_waffle_0;
    else
      case (maklak_waffle)
        maklak_waffle_0: begin
          if ({gnd,fury_beast,due_tango,hanger_lizard} == 5)
            maklak_waffle <= maklak_waffle_5;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 14)
            maklak_waffle <= maklak_waffle_5;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 9)
            maklak_waffle <= maklak_waffle_1;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 1)
            maklak_waffle <= maklak_waffle_5;
          else
            maklak_waffle <= maklak_waffle_0;
          end
        maklak_waffle_1: begin
          if ({gnd,fury_beast,due_tango,hanger_lizard} == 15)
            maklak_waffle <= maklak_waffle_1;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 1)
            maklak_waffle <= maklak_waffle_0;
          else
            maklak_waffle <= maklak_waffle_1;
          end
        maklak_waffle_2: begin
          if ({gnd,fury_beast,due_tango,hanger_lizard} == 11)
            maklak_waffle <= maklak_waffle_4;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 0)
            maklak_waffle <= maklak_waffle_5;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 2)
            maklak_waffle <= maklak_waffle_5;
          else
            maklak_waffle <= maklak_waffle_2;
          end
        maklak_waffle_3: begin
          if ({gnd,fury_beast,due_tango,hanger_lizard} == 10)
            maklak_waffle <= maklak_waffle_5;
          else
            maklak_waffle <= maklak_waffle_3;
          end
        maklak_waffle_4: begin
          if ({gnd,fury_beast,due_tango,hanger_lizard} == 10)
            maklak_waffle <= maklak_waffle_5;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 6)
            maklak_waffle <= maklak_waffle_3;
          else
            maklak_waffle <= maklak_waffle_4;
          end
        maklak_waffle_5: begin
          if ({gnd,fury_beast,due_tango,hanger_lizard} == 15)
            maklak_waffle <= maklak_waffle_5;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 5)
            maklak_waffle <= maklak_waffle_2;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 7)
            maklak_waffle <= maklak_waffle_0;
          else if ({gnd,fury_beast,due_tango,hanger_lizard} == 11)
            maklak_waffle <= maklak_waffle_1;
          else
            maklak_waffle <= maklak_waffle_5;
          end
        default: maklak_waffle <= maklak_waffle_0;
      endcase
  end

// State Mek maklak_waffle Output logic
always @(maklak_waffle)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (maklak_waffle)
        maklak_waffle_0: begin
            egg_starwars = 1;
            drevil_sinus = 0;
            north_fortuyn = 0;
            ariel_wujing = 0;
            boitano_bagel = 0;
            ladder_lizard = 0;
            deuce_bismuth = 1;
            emu_skinner = 0;
            blessyou_haze = 1;
            knot_neville = 0;
            pepsi_spanish = 0;
            bolt_trevor = 1;
            kungfu_surfer = 0;
            pizza_green = 1;
            gulp_mushroom = 0;
          end
        maklak_waffle_1: begin
            egg_starwars = 1;
            drevil_sinus = 0;
            north_fortuyn = 0;
            ariel_wujing = 0;
            boitano_bagel = 1;
            ladder_lizard = 0;
            deuce_bismuth = 1;
            emu_skinner = 1;
            blessyou_haze = 0;
            knot_neville = 1;
            pepsi_spanish = 1;
            bolt_trevor = 0;
            kungfu_surfer = 1;
            pizza_green = 0;
            gulp_mushroom = 1;
          end
        maklak_waffle_2: begin
            egg_starwars = 0;
            drevil_sinus = 0;
            north_fortuyn = 1;
            ariel_wujing = 0;
            boitano_bagel = 0;
            ladder_lizard = 0;
            deuce_bismuth = 0;
            emu_skinner = 0;
            blessyou_haze = 0;
            knot_neville = 0;
            pepsi_spanish = 1;
            bolt_trevor = 1;
            kungfu_surfer = 0;
            pizza_green = 0;
            gulp_mushroom = 1;
          end
        maklak_waffle_3: begin
            egg_starwars = 0;
            drevil_sinus = 0;
            north_fortuyn = 0;
            ariel_wujing = 1;
            boitano_bagel = 0;
            ladder_lizard = 0;
            deuce_bismuth = 1;
            emu_skinner = 1;
            blessyou_haze = 0;
            knot_neville = 0;
            pepsi_spanish = 0;
            bolt_trevor = 1;
            kungfu_surfer = 0;
            pizza_green = 1;
            gulp_mushroom = 1;
          end
        maklak_waffle_4: begin
            egg_starwars = 0;
            drevil_sinus = 0;
            north_fortuyn = 0;
            ariel_wujing = 0;
            boitano_bagel = 1;
            ladder_lizard = 0;
            deuce_bismuth = 1;
            emu_skinner = 1;
            blessyou_haze = 0;
            knot_neville = 0;
            pepsi_spanish = 0;
            bolt_trevor = 1;
            kungfu_surfer = 1;
            pizza_green = 1;
            gulp_mushroom = 1;
          end
        maklak_waffle_5: begin
            egg_starwars = 1;
            drevil_sinus = 0;
            north_fortuyn = 1;
            ariel_wujing = 0;
            boitano_bagel = 0;
            ladder_lizard = 0;
            deuce_bismuth = 0;
            emu_skinner = 1;
            blessyou_haze = 1;
            knot_neville = 0;
            pepsi_spanish = 0;
            bolt_trevor = 0;
            kungfu_surfer = 0;
            pizza_green = 0;
            gulp_mushroom = 0;
          end
        default: begin
            egg_starwars = 0;
            drevil_sinus = 1;
            north_fortuyn = 0;
            ariel_wujing = 0;
            boitano_bagel = 0;
            ladder_lizard = 0;
            deuce_bismuth = 0;
            emu_skinner = 0;
            blessyou_haze = 0;
            knot_neville = 1;
            pepsi_spanish = 1;
            bolt_trevor = 0;
            kungfu_surfer = 1;
            pizza_green = 1;
            gulp_mushroom = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire tattoo_east_out;
nut_001_lut #(4) nut_001_lut_inst_tattoo_east (
  .din({vcc,legos_tofu,ariel_wujing,gnd}),
  .mask(16'h4dc2),
  .out(tattoo_east_out)
);

always @(tattoo_east_out)
begin
   ihilani_bert = tattoo_east_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire rat_xterm_out;
nut_001_lut #(2) nut_001_lut_inst_rat_xterm (
  .din({zedong_lucius,blessyou_haze}),
  .mask(4'b0011),
  .out(rat_xterm_out)
);

always @(rat_xterm_out)
begin
   ghost_zinc = rat_xterm_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire gonzo_eunice_out;
nut_001_lut #(2) nut_001_lut_inst_gonzo_eunice (
  .din({vcc,goofy_bach}),
  .mask(4'b0011),
  .out(gonzo_eunice_out)
);

always @(gonzo_eunice_out)
begin
   master_bart = gonzo_eunice_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire floo_saturn_out;
nut_001_lut #(3) nut_001_lut_inst_floo_saturn (
  .din({gnd,zulu_baron,pepsi_spanish}),
  .mask(8'b00001001),
  .out(floo_saturn_out)
);

always @(floo_saturn_out)
begin
   often_onthepc = floo_saturn_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire llama_bismuth_out;
nut_001_lut #(2) nut_001_lut_inst_llama_bismuth (
  .din({gnd,gnd}),
  .mask(4'b0000),
  .out(llama_bismuth_out)
);

always @(llama_bismuth_out)
begin
   greenbay_sake = llama_bismuth_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire southern_cow_out;
nut_001_lut #(1) nut_001_lut_inst_southern_cow (
  .din({beef_shuda}),
  .mask(2'b00),
  .out(southern_cow_out)
);

always @(southern_cow_out)
begin
   baron_clay = southern_cow_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire marge_tofu_out;
nut_001_lut #(3) nut_001_lut_inst_marge_tofu (
  .din({vcc,due_tango,master_bart}),
  .mask(8'b00000010),
  .out(marge_tofu_out)
);

always @(marge_tofu_out)
begin
   gotone_marvin = marge_tofu_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire vicks_skinner_out;
nut_001_lut #(5) nut_001_lut_inst_vicks_skinner (
  .din({gnd,wizard_norris,greenbay_sake,what_intel,gulp_mushroom}),
  .mask(32'b10101011000100000000000011000100),
  .out(vicks_skinner_out)
);

always @(vicks_skinner_out)
begin
   leaky_jinyong = vicks_skinner_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire spyro_nirish_out;
nut_001_lut #(5) nut_001_lut_inst_spyro_nirish (
  .din({llama_palm,gnd,gnd,rewire_bubba,covad_ocha}),
  .mask(32'h7e7b87ba),
  .out(spyro_nirish_out)
);

always @(spyro_nirish_out)
begin
   mexico_sears = spyro_nirish_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire skipper_would_out;
nut_001_lut #(5) nut_001_lut_inst_skipper_would (
  .din({west_powder,babette_crank,vcc,what_intel,knot_neville}),
  .mask(32'b01000000010101000000000000010000),
  .out(skipper_would_out)
);

always @(skipper_would_out)
begin
   boing_jiminy = skipper_would_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire lsd_downers_out;
nut_001_lut #(3) nut_001_lut_inst_lsd_downers (
  .din({kungfu_surfer,drevil_sinus,hulk_atomic}),
  .mask(8'h7a),
  .out(lsd_downers_out)
);

always @(lsd_downers_out)
begin
   honda_elf = lsd_downers_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire pdaddy_kappa_out;
nut_001_lut #(1) nut_001_lut_inst_pdaddy_kappa (
  .din({boitano_bagel}),
  .mask(2'b00),
  .out(pdaddy_kappa_out)
);

always @(pdaddy_kappa_out)
begin
   chicken_romex = pdaddy_kappa_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire leidiot_duey_out;
nut_001_lut #(3) nut_001_lut_inst_leidiot_duey (
  .din({mexico_sears,baron_foliage,curie_macys}),
  .mask(8'b01001000),
  .out(leidiot_duey_out)
);

always @(leidiot_duey_out)
begin
   kabar_jacques = leidiot_duey_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire golden_sleepy_out;
nut_001_lut #(3) nut_001_lut_inst_golden_sleepy (
  .din({vcc,chillis_peace,vcc}),
  .mask(8'b00011110),
  .out(golden_sleepy_out)
);

always @(golden_sleepy_out)
begin
   egg_might = golden_sleepy_out;
end


initial begin
    {joseph_husks,avon_oranges,bananarep_rum,tank_centaur,wonton_crack,advil_army} = 0;
end

// Registered 6 bit adder with SLD SCLR
always @(posedge clock0)
  begin
    if (gnd)
      {joseph_husks,avon_oranges,bananarep_rum,tank_centaur,wonton_crack,advil_army} <= 0;
    else if (gnd)
      {joseph_husks,avon_oranges,bananarep_rum,tank_centaur,wonton_crack,advil_army} <=
		  {loud_ariel,ihilani_bert,emu_xiaoping,whacky_husks,nyc_foliage,gnd};
    else
      {joseph_husks,avon_oranges,bananarep_rum,tank_centaur,wonton_crack,advil_army} <=
		 {honda_elf,boing_jiminy,gnd,rufus_advil,legos_tofu,freaky_marco} + 
		 {moreand_willy,vcc,gnd,lotus_golf,kang_minnie,giraffe_huey};
  end

// 128:1 MUX with repeating data
always @(gnd or freaky_amex or gulp_mushroom or spyro_lima or tank_centaur or vcc or dweebie_bep or broom_eagle or clay_ritsu or midas_macys)
  begin
    casex ({gnd,freaky_amex,gulp_mushroom,spyro_lima,tank_centaur,vcc,dweebie_bep})
      0: lemon_joseph=1;
      1: lemon_joseph=1;
      2: lemon_joseph=0;
      3: lemon_joseph=midas_macys;
      4: lemon_joseph=clay_ritsu;
      5: lemon_joseph=midas_macys;
      6: lemon_joseph=clay_ritsu;
      7: lemon_joseph=clay_ritsu;
      8: lemon_joseph=clay_ritsu;
      9: lemon_joseph=midas_macys;
      10: lemon_joseph=clay_ritsu;
      11: lemon_joseph=clay_ritsu;
      12: lemon_joseph=broom_eagle;
      13: lemon_joseph=midas_macys;
      14: lemon_joseph=midas_macys;
      15: lemon_joseph=midas_macys;
      16: lemon_joseph=midas_macys;
      17: lemon_joseph=0;
      18: lemon_joseph=clay_ritsu;
      19: lemon_joseph=broom_eagle;
      20: lemon_joseph=midas_macys;
      21: lemon_joseph=midas_macys;
      22: lemon_joseph=midas_macys;
      23: lemon_joseph=0;
      24: lemon_joseph=midas_macys;
      25: lemon_joseph=0;
      26: lemon_joseph=0;
      27: lemon_joseph=midas_macys;
      28: lemon_joseph=clay_ritsu;
      29: lemon_joseph=midas_macys;
      30: lemon_joseph=midas_macys;
      31: lemon_joseph=clay_ritsu;
      32: lemon_joseph=midas_macys;
      33: lemon_joseph=clay_ritsu;
      34: lemon_joseph=1;
      35: lemon_joseph=midas_macys;
      36: lemon_joseph=midas_macys;
      37: lemon_joseph=clay_ritsu;
      38: lemon_joseph=midas_macys;
      39: lemon_joseph=broom_eagle;
      40: lemon_joseph=midas_macys;
      41: lemon_joseph=0;
      42: lemon_joseph=midas_macys;
      43: lemon_joseph=midas_macys;
      44: lemon_joseph=midas_macys;
      45: lemon_joseph=broom_eagle;
      46: lemon_joseph=0;
      47: lemon_joseph=midas_macys;
      48: lemon_joseph=midas_macys;
      49: lemon_joseph=midas_macys;
      50: lemon_joseph=broom_eagle;
      51: lemon_joseph=clay_ritsu;
      52: lemon_joseph=midas_macys;
      53: lemon_joseph=broom_eagle;
      54: lemon_joseph=broom_eagle;
      55: lemon_joseph=broom_eagle;
      56: lemon_joseph=clay_ritsu;
      57: lemon_joseph=midas_macys;
      58: lemon_joseph=0;
      59: lemon_joseph=midas_macys;
      60: lemon_joseph=broom_eagle;
      61: lemon_joseph=midas_macys;
      62: lemon_joseph=midas_macys;
      63: lemon_joseph=midas_macys;
      64: lemon_joseph=midas_macys;
      65: lemon_joseph=broom_eagle;
      66: lemon_joseph=midas_macys;
      67: lemon_joseph=midas_macys;
      68: lemon_joseph=midas_macys;
      69: lemon_joseph=clay_ritsu;
      70: lemon_joseph=midas_macys;
      71: lemon_joseph=midas_macys;
      72: lemon_joseph=midas_macys;
      73: lemon_joseph=clay_ritsu;
      74: lemon_joseph=midas_macys;
      75: lemon_joseph=clay_ritsu;
      76: lemon_joseph=clay_ritsu;
      77: lemon_joseph=broom_eagle;
      78: lemon_joseph=midas_macys;
      79: lemon_joseph=midas_macys;
      80: lemon_joseph=clay_ritsu;
      81: lemon_joseph=midas_macys;
      82: lemon_joseph=broom_eagle;
      83: lemon_joseph=midas_macys;
      84: lemon_joseph=1;
      85: lemon_joseph=midas_macys;
      86: lemon_joseph=midas_macys;
      87: lemon_joseph=clay_ritsu;
      88: lemon_joseph=midas_macys;
      89: lemon_joseph=broom_eagle;
      90: lemon_joseph=midas_macys;
      91: lemon_joseph=midas_macys;
      92: lemon_joseph=midas_macys;
      93: lemon_joseph=broom_eagle;
      94: lemon_joseph=midas_macys;
      95: lemon_joseph=clay_ritsu;
      96: lemon_joseph=midas_macys;
      97: lemon_joseph=midas_macys;
      98: lemon_joseph=clay_ritsu;
      99: lemon_joseph=midas_macys;
      100: lemon_joseph=midas_macys;
      101: lemon_joseph=broom_eagle;
      102: lemon_joseph=midas_macys;
      103: lemon_joseph=1;
      104: lemon_joseph=clay_ritsu;
      105: lemon_joseph=midas_macys;
      106: lemon_joseph=clay_ritsu;
      107: lemon_joseph=broom_eagle;
      108: lemon_joseph=0;
      109: lemon_joseph=midas_macys;
      110: lemon_joseph=midas_macys;
      111: lemon_joseph=midas_macys;
      112: lemon_joseph=0;
      113: lemon_joseph=midas_macys;
      114: lemon_joseph=1;
      115: lemon_joseph=1;
      116: lemon_joseph=midas_macys;
      117: lemon_joseph=midas_macys;
      118: lemon_joseph=midas_macys;
      119: lemon_joseph=clay_ritsu;
      120: lemon_joseph=midas_macys;
      121: lemon_joseph=broom_eagle;
      122: lemon_joseph=midas_macys;
      123: lemon_joseph=midas_macys;
      124: lemon_joseph=clay_ritsu;
      125: lemon_joseph=midas_macys;
      126: lemon_joseph=broom_eagle;
      127: lemon_joseph=midas_macys;
      default: lemon_joseph=0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dimetap_vegan <= 0;
    else
    case ({honda_elf,nest_crank})
       0 : dimetap_vegan <= dimetap_vegan;
       1 : dimetap_vegan <= dimetap_vegan;
       2 : dimetap_vegan <= freaky_amex;
       3 : dimetap_vegan <= dimetap_vegan;
       default : dimetap_vegan <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ocean_huhhuh <= 0;
    else
    case ({hanger_lizard,woman_tiger})
       0 : ocean_huhhuh <= ocean_huhhuh;
       1 : ocean_huhhuh <= ocean_huhhuh;
       2 : ocean_huhhuh <= ocean_huhhuh;
       3 : ocean_huhhuh <= advil_army;
       default : ocean_huhhuh <= 0;
    endcase
  end

reg feedback_pt_327;

always @(gotone_marvin or feedback_pt_327)
  begin
      cybex_romex =  gotone_marvin ^ !feedback_pt_327;
  end

reg feedback_pt_328;

always @(zinc_bust or feedback_pt_328)
  begin
      english_pyro = !zinc_bust |  feedback_pt_328;
  end

reg feedback_pt_329;

always @(tank_centaur or feedback_pt_329)
  begin
      lamer_webvan =  tank_centaur ^  feedback_pt_329;
  end

reg feedback_pt_330;

always @(loud_ariel or feedback_pt_330)
  begin
      papa_dadada = !loud_ariel | !feedback_pt_330;
  end

reg feedback_pt_331;

always @(dweebie_bep or feedback_pt_331)
  begin
      marker_bep =  dweebie_bep & !feedback_pt_331;
  end

reg feedback_pt_332;

always @(egg_starwars or feedback_pt_332)
  begin
      sgates_think = !egg_starwars & !feedback_pt_332;
  end

reg feedback_pt_333;

always @(vcc or feedback_pt_333)
  begin
      ceres_elian = !vcc ^  feedback_pt_333;
  end

reg feedback_pt_334;

always @(curie_macys or feedback_pt_334)
  begin
      tamago_opus =  curie_macys ^ !feedback_pt_334;
  end

reg feedback_pt_335;

always @(fury_beast or feedback_pt_335)
  begin
      mine_nasdaq = !fury_beast ^  feedback_pt_335;
  end

reg feedback_pt_336;

always @(vcc or feedback_pt_336)
  begin
      roid_crayons =  vcc &  feedback_pt_336;
  end

reg feedback_pt_337;

always @(english_pyro or feedback_pt_337)
  begin
      chief_timmy = !english_pyro |  feedback_pt_337;
  end

reg feedback_pt_338;

always @(tango_would or feedback_pt_338)
  begin
      atoms_art =  tango_would ^  feedback_pt_338;
  end

reg feedback_pt_339;

always @(chief_timmy or feedback_pt_339)
  begin
      lucius_drax =  chief_timmy ^ !feedback_pt_339;
  end

reg feedback_pt_340;

always @(water_century or feedback_pt_340)
  begin
      moderate_eel = !water_century |  feedback_pt_340;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kappa_rufus <= 0;
    else if (bananarep_rum)
      kappa_rufus <= 0;
    else if (rasp_bubba)
      kappa_rufus <= knot_neville;
  end

always @(kappa_rufus)
  begin
      feedback_pt_327 = kappa_rufus;
  end

always @(kappa_rufus)
  begin
      feedback_pt_328 = kappa_rufus;
  end

always @(kappa_rufus)
  begin
      feedback_pt_329 = kappa_rufus;
  end

always @(kappa_rufus)
  begin
      feedback_pt_330 = kappa_rufus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      safeway_nest <= 0;
    else
      safeway_nest <= gnd;
  end

always @(safeway_nest)
  begin
      feedback_pt_331 = safeway_nest;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      biker_bono <= 0;
    else if (papa_dadada)
      biker_bono <= 0;
    else if (valve_loud)
      biker_bono <= vcc;
  end

always @(biker_bono)
  begin
      feedback_pt_332 = biker_bono;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kilo_rojas <= 0;
    else if (exodus_lima)
      kilo_rojas <= gotone_marvin;
  end

always @(kilo_rojas)
  begin
      feedback_pt_333 = kilo_rojas;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      green_gm <= 0;
    else
      green_gm <= gnd;
  end

always @(green_gm)
  begin
      feedback_pt_334 = green_gm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      often_master <= 0;
    else if (moderate_eel)
      often_master <= gnd;
  end

always @(often_master)
  begin
      feedback_pt_335 = often_master;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      floating_guy <= 0;
    else if (illegal_rod)
      floating_guy <= 0;
    else if (gnd)
      floating_guy <= monkey_whale;
  end

always @(floating_guy)
  begin
      feedback_pt_336 = floating_guy;
  end

wire hawaii_danger_wire;

dffeas hawaii_danger_ff (
  .clk(clock0),
  .d(vcc),
  .ena(lamer_webvan),
  .sclr(air_monkey),
  .sload(green_gm),
  .asdata(vcc),
  .clrn(!reset0),
  .q(hawaii_danger_wire)
);

always @(hawaii_danger_wire) begin
   life_atchoo = hawaii_danger_wire;
end

always @(life_atchoo)
  begin
      feedback_pt_337 = life_atchoo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      noah_mexican <= 0;
    else if (bolt_trevor)
      noah_mexican <= life_atchoo;
  end

always @(noah_mexican)
  begin
      feedback_pt_338 = noah_mexican;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      daughter_lisa <= 1;
    else
      daughter_lisa <= bananarep_rum;
  end

always @(daughter_lisa)
  begin
      feedback_pt_339 = daughter_lisa;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bfs_star <= 1;
    else
      bfs_star <= kungfu_surfer;
  end

always @(bfs_star)
  begin
      feedback_pt_340 = bfs_star;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oscar_nyquil <= 0;
    else
      oscar_nyquil <= llama_palm;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tako_fortuyn <= 0;
    else
      tako_fortuyn <= floating_guy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      atoms_filch <= 0;
    else if (gnd)
      atoms_filch <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      zed_weevil <= 0;
    else
      zed_weevil <= kilo_knot;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rescue_sun <= 0;
    else if (kungfu_surfer)
      rescue_sun <= 0;
    else if (pig_budlite)
      rescue_sun <= dig_shark;
  end

wire haze_smithers_wire;

dffeas haze_smithers_ff (
  .clk(clock0),
  .d(boitano_bagel),
  .ena(west_powder),
  .sclr(ocean_huhhuh),
  .sload(mine_nasdaq),
  .asdata(bolt_trevor),
  .clrn(!reset0),
  .q(haze_smithers_wire)
);

always @(haze_smithers_wire) begin
   burner_mrbill = haze_smithers_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      squad_wukong <= 1;
    else
      squad_wukong <= noah_mexican;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      malfoy_nyc <= 0;
    else
      malfoy_nyc <= dig_shark;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dork_porfavor <= 0;
    else if (oscar_nyquil)
      dork_porfavor <= ghost_zinc;
    else if (gnd)
      dork_porfavor <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      often_downers <= 1;
    else
      often_downers <= wonton_crack;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sake_billnted <= 0;
    else if (burner_mrbill)
      sake_billnted <= 0;
    else if (roid_crayons)
      sake_billnted <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      purple_rod <= 1;
    else
      purple_rod <= ladder_lizard;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      too_big_dirk <= 0;
    else if (hinge_enoch)
      too_big_dirk <= 0;
    else if (joseph_husks)
      too_big_dirk <= often_master;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      baron_nihlist <= 1;
    else
      baron_nihlist <= leaky_jinyong;
  end

// const - A
always @(vcc or boitano_bagel or west_powder or often_downers or gnd)
  begin
    {stroop_mexico,bust_fear,due_firewalk,zedong_nyc,emu_abraham,timmy_bracket} = 5 - {vcc,boitano_bagel,west_powder,often_downers,gnd};
  end

// const - A
always @(vcc or ginger_tsmc or gnd or biker_bono or homer_goofy or boing_jiminy or chicken_romex)
  begin
    {pilot_nasdaq,sand_badger,muffin_homer,due_happy,skipper_gonzo,metal_covad,klinton_macys,quebec_crank,nest_mcnugget} = 134 - {vcc,ginger_tsmc,gnd,biker_bono,homer_goofy,boing_jiminy,chicken_romex};
  end

// 5 bit add sub
always @(black_intuit or boitano_bagel or skipper_gonzo or joseph_husks or weevil_money or skipper_gonzo or vcc or gnd or lucius_drax or vcc)
  begin
    {armand_lovey,priest_gopher,marvin_xterm,lsd_shuda,bambi_skipper} = 
		{black_intuit,boitano_bagel,skipper_gonzo,joseph_husks,weevil_money} + 
		{skipper_gonzo,vcc,gnd,lucius_drax,vcc};
  end

// 6 bit modulus
always @(biker_bono or gnd or armand_lovey or gnd or marker_bep or gnd or emu_abraham or advil_army or vcc or daughter_lisa or vcc or pilot_nasdaq)
  begin
    if ({emu_abraham,advil_army,vcc,daughter_lisa,vcc,pilot_nasdaq} == 0)
       {vegas_abraham,kanji_gyro,beauty_dog,emu_romex,onion_trevor,rubeus_egg} = 0;
    else 
      {vegas_abraham,kanji_gyro,beauty_dog,emu_romex,onion_trevor,rubeus_egg} = 
	  	  {biker_bono,gnd,armand_lovey,gnd,marker_bep,gnd} % 
		  {emu_abraham,advil_army,vcc,daughter_lisa,vcc,pilot_nasdaq};
  end

reg feedback_pt_341;

always @(blessyou_haze or feedback_pt_341)
  begin
      avon_giants = !blessyou_haze &  feedback_pt_341;
  end

reg feedback_pt_342;

always @(onion_trevor or feedback_pt_342)
  begin
      fatality_sun = !onion_trevor |  feedback_pt_342;
  end

reg feedback_pt_343;

always @(burner_mrbill or feedback_pt_343)
  begin
      rat_what =  burner_mrbill | !feedback_pt_343;
  end

reg feedback_pt_344;

always @(lemon_joseph or feedback_pt_344)
  begin
      marquis_husks =  lemon_joseph | !feedback_pt_344;
  end

reg feedback_pt_345;

always @(egg_might or feedback_pt_345)
  begin
      neville_bravo =  egg_might ^  feedback_pt_345;
  end

reg feedback_pt_346;

always @(vcc or feedback_pt_346)
  begin
      water_ykocens =  vcc ^  feedback_pt_346;
  end

reg feedback_pt_347;

always @(gnd or feedback_pt_347)
  begin
      hotdog_priest =  gnd & !feedback_pt_347;
  end

reg feedback_pt_348;

always @(vcc or feedback_pt_348)
  begin
      thread_quail = !vcc & !feedback_pt_348;
  end

reg feedback_pt_349;

always @(ceres_elian or feedback_pt_349)
  begin
      grumby_haze = !ceres_elian &  feedback_pt_349;
  end

reg feedback_pt_350;

always @(vcc or feedback_pt_350)
  begin
      louie_heidi =  vcc |  feedback_pt_350;
  end

reg feedback_pt_351;

always @(onion_trevor or feedback_pt_351)
  begin
      snort_quebec =  onion_trevor &  feedback_pt_351;
  end

reg feedback_pt_352;

always @(often_downers or feedback_pt_352)
  begin
      spastic_pilot = !often_downers &  feedback_pt_352;
  end

reg feedback_pt_353;

always @(gnd or feedback_pt_353)
  begin
      goat_mouse =  gnd |  feedback_pt_353;
  end

reg feedback_pt_354;

always @(emu_romex or feedback_pt_354)
  begin
      mike_stirfry =  emu_romex ^  feedback_pt_354;
  end

reg feedback_pt_355;

always @(pizza_green or feedback_pt_355)
  begin
      hagrid_indigo = !pizza_green & !feedback_pt_355;
  end

reg feedback_pt_356;

always @(gnd or feedback_pt_356)
  begin
      crayons_ibm = !gnd &  feedback_pt_356;
  end

reg feedback_pt_357;

always @(gnd or feedback_pt_357)
  begin
      hut_burnout = !gnd |  feedback_pt_357;
  end

reg feedback_pt_358;

always @(hut_burnout or feedback_pt_358)
  begin
      oranje_zen = !hut_burnout ^  feedback_pt_358;
  end

reg feedback_pt_359;

always @(kilo_rojas or feedback_pt_359)
  begin
      covad_pdiddy =  kilo_rojas &  feedback_pt_359;
  end

reg feedback_pt_360;

always @(pepsi_spanish or feedback_pt_360)
  begin
      eel_psycho = !pepsi_spanish ^  feedback_pt_360;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rarest_chevys <= 0;
    else if (rubeus_egg)
      rarest_chevys <= kabar_whiskey;
    else if (gnd)
      rarest_chevys <= 0;
  end

always @(rarest_chevys)
  begin
      feedback_pt_341 = rarest_chevys;
  end

always @(rarest_chevys)
  begin
      feedback_pt_342 = rarest_chevys;
  end

always @(rarest_chevys)
  begin
      feedback_pt_343 = rarest_chevys;
  end

always @(rarest_chevys)
  begin
      feedback_pt_344 = rarest_chevys;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      plaster_yummy <= 0;
    else if (onion_trevor)
      plaster_yummy <= gnd;
    else if (gnd)
      plaster_yummy <= 0;
  end

always @(plaster_yummy)
  begin
      feedback_pt_345 = plaster_yummy;
  end

always @(plaster_yummy)
  begin
      feedback_pt_346 = plaster_yummy;
  end

always @(plaster_yummy)
  begin
      feedback_pt_347 = plaster_yummy;
  end

always @(plaster_yummy)
  begin
      feedback_pt_348 = plaster_yummy;
  end

wire stix_broom_wire;

dffea stix_broom_ff (
  .clk(clock0),
  .d(gnd),
  .ena(portnoy_stick),
  .adata(gnd),
  .clrn(!reset0),
  .q(stix_broom_wire)
);

always @(stix_broom_wire) begin
   kbtoys_tofu = stix_broom_wire;
end

always @(kbtoys_tofu)
  begin
      feedback_pt_349 = kbtoys_tofu;
  end

always @(kbtoys_tofu)
  begin
      feedback_pt_350 = kbtoys_tofu;
  end

always @(kbtoys_tofu)
  begin
      feedback_pt_351 = kbtoys_tofu;
  end

always @(kbtoys_tofu)
  begin
      feedback_pt_352 = kbtoys_tofu;
  end

wire theseus_rojas_wire;

dffeas theseus_rojas_ff (
  .clk(clock0),
  .d(baron_clay),
  .ena(rarest_chevys),
  .sclr(sand_badger),
  .sload(vcc),
  .asdata(sake_billnted),
  .clrn(!reset0),
  .q(theseus_rojas_wire)
);

always @(theseus_rojas_wire) begin
   stroop_doc = theseus_rojas_wire;
end

always @(stroop_doc)
  begin
      feedback_pt_353 = stroop_doc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      leaky_snort <= 0;
    else if (quebec_crank)
      leaky_snort <= stroop_mexico;
  end

always @(leaky_snort)
  begin
      feedback_pt_354 = leaky_snort;
  end

wire kilo_tylenol_wire;

dffeas kilo_tylenol_ff (
  .clk(clock0),
  .d(water_ykocens),
  .ena(kappa_rufus),
  .sclr(klaas_diagon),
  .sload(gnd),
  .asdata(vcc),
  .clrn(!reset0),
  .q(kilo_tylenol_wire)
);

always @(kilo_tylenol_wire) begin
   tiger_rubik = kilo_tylenol_wire;
end

always @(tiger_rubik)
  begin
      feedback_pt_355 = tiger_rubik;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      boing_kebab <= 0;
    else
      boing_kebab <= starwars_gyro;
  end

always @(boing_kebab)
  begin
      feedback_pt_356 = boing_kebab;
  end

wire speed_tuna_wire;

dffea speed_tuna_ff (
  .clk(clock0),
  .d(burner_mrbill),
  .ena(pepsi_spanish),
  .adata(might_what),
  .clrn(!reset0),
  .q(speed_tuna_wire)
);

always @(speed_tuna_wire) begin
   yankee_zi = speed_tuna_wire;
end

always @(yankee_zi)
  begin
      feedback_pt_357 = yankee_zi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ladder_loser <= 0;
    else if (gnd)
      ladder_loser <= often_master;
    else if (lucius_drax)
      ladder_loser <= 0;
  end

always @(ladder_loser)
  begin
      feedback_pt_358 = ladder_loser;
  end

wire quail_fascist_wire;

dffeas quail_fascist_ff (
  .clk(clock0),
  .d(gnd),
  .ena(deuce_bismuth),
  .sclr(gnd),
  .sload(life_atchoo),
  .asdata(gnd),
  .clrn(!reset0),
  .q(quail_fascist_wire)
);

always @(quail_fascist_wire) begin
   sogood_brian = quail_fascist_wire;
end

always @(sogood_brian)
  begin
      feedback_pt_359 = sogood_brian;
  end

wire condit_pirate_wire;

dffeas condit_pirate_ff (
  .clk(clock0),
  .d(vcc),
  .ena(hotdog_priest),
  .sclr(atoms_art),
  .sload(trevor_thread),
  .asdata(vcc),
  .clrn(!reset0),
  .q(condit_pirate_wire)
);

always @(condit_pirate_wire) begin
   pepsi_moe = condit_pirate_wire;
end

always @(pepsi_moe)
  begin
      feedback_pt_360 = pepsi_moe;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      albus_what <= 0;
    else
      albus_what <= often_master;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      oscar_dimetap <= 0;
    else if (atoms_art)
      oscar_dimetap <= gnd;
  end

wire tonks_jesus_wire;

dffeas tonks_jesus_ff (
  .clk(clock0),
  .d(ihilani_bert),
  .ena(neville_bravo),
  .sclr(vcc),
  .sload(often_onthepc),
  .asdata(rat_what),
  .clrn(!reset0),
  .q(tonks_jesus_wire)
);

always @(tonks_jesus_wire) begin
   oldnavy_romex = tonks_jesus_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      crab_tank <= 0;
    else if (spastic_pilot)
      crab_tank <= kappa_rufus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      paper_english <= 1;
    else
      paper_english <= bambi_skipper;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hawaii_plague <= 0;
    else
      hawaii_plague <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      po_yellowtail <= 0;
    else if (west_powder)
      po_yellowtail <= moreand_willy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tonic_whale <= 0;
    else if (too_big_dirk)
      tonic_whale <= po_yellowtail;
  end

wire egg_plague_wire;

dffeas egg_plague_ff (
  .clk(clock0),
  .d(theseus_maki),
  .ena(hawaii_plague),
  .sclr(goat_mouse),
  .sload(chief_timmy),
  .asdata(vcc),
  .clrn(!reset0),
  .q(egg_plague_wire)
);

always @(egg_plague_wire) begin
   cocaine_bart = egg_plague_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rose_hp <= 0;
    else if (skipper_happy)
      rose_hp <= kabar_jacques;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      deuce_salsa <= 0;
    else if (fury_grams)
      deuce_salsa <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stix_mickey <= 0;
    else if (gnd)
      stix_mickey <= bfs_star;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eggsalad_dirk <= 0;
    else if (thread_quail)
      eggsalad_dirk <= 0;
    else if (leaky_jinyong)
      eggsalad_dirk <= legos_tofu;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      animal_faster <= 0;
    else if (exodus_lima)
      animal_faster <= fatality_sun;
    else if (severus_valve)
      animal_faster <= 0;
  end

// Random combinatorial logic block
always@(*)
  begin
      ginger_hinge = ~woman_tiger;
  end

  always@(*)
  begin
    curly_red = ~( ~( ~( ~( ( priest_gopher & kbtoys_tofu ) ) ) ) ) ? vcc : grumby_haze;
  end
// Note - state 2 is unreachable
// Note - state 4 is unreachable
// Note - state 5 is unreachable
// State Mek lad_zebra Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lad_zebra <= lad_zebra_0;
    else
      case (lad_zebra)
        lad_zebra_0: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 13)
            lad_zebra <= lad_zebra_6;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 5)
            lad_zebra <= lad_zebra_6;
          else
            lad_zebra <= lad_zebra_0;
          end
        lad_zebra_1: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 9)
            lad_zebra <= lad_zebra_1;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 3)
            lad_zebra <= lad_zebra_7;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 7)
            lad_zebra <= lad_zebra_1;
          else
            lad_zebra <= lad_zebra_1;
          end
        lad_zebra_2: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 7)
            lad_zebra <= lad_zebra_5;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 2)
            lad_zebra <= lad_zebra_3;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 5)
            lad_zebra <= lad_zebra_1;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 14)
            lad_zebra <= lad_zebra_7;
          else
            lad_zebra <= lad_zebra_2;
          end
        lad_zebra_3: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 5)
            lad_zebra <= lad_zebra_8;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 7)
            lad_zebra <= lad_zebra_1;
          else
            lad_zebra <= lad_zebra_3;
          end
        lad_zebra_4: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 10)
            lad_zebra <= lad_zebra_1;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 11)
            lad_zebra <= lad_zebra_4;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 7)
            lad_zebra <= lad_zebra_4;
          else
            lad_zebra <= lad_zebra_4;
          end
        lad_zebra_5: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 9)
            lad_zebra <= lad_zebra_0;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 10)
            lad_zebra <= lad_zebra_5;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 5)
            lad_zebra <= lad_zebra_8;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 12)
            lad_zebra <= lad_zebra_5;
          else
            lad_zebra <= lad_zebra_5;
          end
        lad_zebra_6: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 13)
            lad_zebra <= lad_zebra_7;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 14)
            lad_zebra <= lad_zebra_7;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 15)
            lad_zebra <= lad_zebra_3;
          else
            lad_zebra <= lad_zebra_6;
          end
        lad_zebra_7: begin
          if ({marvin_xterm,paper_english,gnd,vcc} == 1)
            lad_zebra <= lad_zebra_8;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 10)
            lad_zebra <= lad_zebra_0;
          else if ({marvin_xterm,paper_english,gnd,vcc} == 8)
            lad_zebra <= lad_zebra_0;
          else
            lad_zebra <= lad_zebra_7;
          end
        lad_zebra_8: begin
            lad_zebra <= lad_zebra_8;
          end
        default: lad_zebra <= lad_zebra_0;
      endcase
  end

// State Mek lad_zebra Output logic
always @(lad_zebra)
  begin
    // consider all state regs when doing outputs
    case (lad_zebra)
        lad_zebra_0: begin
            whacky_hinge = 1;
            drax_intuit = 1;
            neville_over = 0;
            issac_gonzo = 0;
            green_sortout = 0;
            mine_chief = 0;
            avon_neon = 1;
            snake_copper = 0;
            kmfdm_marvin = 1;
            crayons_fury = 0;
            cubish_issac = 0;
            dig_uppers = 0;
            liberace_lad = 1;
            boitano_wine = 1;
            goblin_cubish = 0;
            west_sand = 1;
          end
        lad_zebra_1: begin
            whacky_hinge = 0;
            drax_intuit = 1;
            neville_over = 1;
            issac_gonzo = 1;
            green_sortout = 0;
            mine_chief = 1;
            avon_neon = 0;
            snake_copper = 1;
            kmfdm_marvin = 0;
            crayons_fury = 1;
            cubish_issac = 0;
            dig_uppers = 1;
            liberace_lad = 0;
            boitano_wine = 0;
            goblin_cubish = 1;
            west_sand = 0;
          end
        lad_zebra_2: begin
            whacky_hinge = 0;
            drax_intuit = 0;
            neville_over = 0;
            issac_gonzo = 1;
            green_sortout = 0;
            mine_chief = 1;
            avon_neon = 1;
            snake_copper = 1;
            kmfdm_marvin = 0;
            crayons_fury = 1;
            cubish_issac = 1;
            dig_uppers = 1;
            liberace_lad = 1;
            boitano_wine = 1;
            goblin_cubish = 1;
            west_sand = 0;
          end
        lad_zebra_3: begin
            whacky_hinge = 1;
            drax_intuit = 1;
            neville_over = 1;
            issac_gonzo = 1;
            green_sortout = 0;
            mine_chief = 0;
            avon_neon = 1;
            snake_copper = 1;
            kmfdm_marvin = 1;
            crayons_fury = 1;
            cubish_issac = 0;
            dig_uppers = 0;
            liberace_lad = 0;
            boitano_wine = 0;
            goblin_cubish = 0;
            west_sand = 0;
          end
        lad_zebra_4: begin
            whacky_hinge = 1;
            drax_intuit = 1;
            neville_over = 0;
            issac_gonzo = 1;
            green_sortout = 0;
            mine_chief = 0;
            avon_neon = 0;
            snake_copper = 1;
            kmfdm_marvin = 0;
            crayons_fury = 1;
            cubish_issac = 1;
            dig_uppers = 0;
            liberace_lad = 0;
            boitano_wine = 1;
            goblin_cubish = 1;
            west_sand = 1;
          end
        lad_zebra_5: begin
            whacky_hinge = 1;
            drax_intuit = 0;
            neville_over = 0;
            issac_gonzo = 0;
            green_sortout = 1;
            mine_chief = 1;
            avon_neon = 0;
            snake_copper = 1;
            kmfdm_marvin = 1;
            crayons_fury = 0;
            cubish_issac = 1;
            dig_uppers = 1;
            liberace_lad = 0;
            boitano_wine = 1;
            goblin_cubish = 0;
            west_sand = 0;
          end
        lad_zebra_6: begin
            whacky_hinge = 0;
            drax_intuit = 1;
            neville_over = 1;
            issac_gonzo = 1;
            green_sortout = 1;
            mine_chief = 1;
            avon_neon = 0;
            snake_copper = 1;
            kmfdm_marvin = 0;
            crayons_fury = 1;
            cubish_issac = 0;
            dig_uppers = 1;
            liberace_lad = 1;
            boitano_wine = 1;
            goblin_cubish = 1;
            west_sand = 0;
          end
        lad_zebra_7: begin
            whacky_hinge = 1;
            drax_intuit = 0;
            neville_over = 1;
            issac_gonzo = 0;
            green_sortout = 1;
            mine_chief = 0;
            avon_neon = 1;
            snake_copper = 0;
            kmfdm_marvin = 0;
            crayons_fury = 1;
            cubish_issac = 0;
            dig_uppers = 1;
            liberace_lad = 0;
            boitano_wine = 0;
            goblin_cubish = 0;
            west_sand = 1;
          end
        lad_zebra_8: begin
            whacky_hinge = 1;
            drax_intuit = 1;
            neville_over = 0;
            issac_gonzo = 1;
            green_sortout = 1;
            mine_chief = 1;
            avon_neon = 0;
            snake_copper = 0;
            kmfdm_marvin = 1;
            crayons_fury = 0;
            cubish_issac = 0;
            dig_uppers = 1;
            liberace_lad = 1;
            boitano_wine = 0;
            goblin_cubish = 1;
            west_sand = 1;
          end
        default: begin
            whacky_hinge = 1;
            drax_intuit = 1;
            neville_over = 0;
            issac_gonzo = 1;
            green_sortout = 1;
            mine_chief = 1;
            avon_neon = 0;
            snake_copper = 1;
            kmfdm_marvin = 0;
            crayons_fury = 0;
            cubish_issac = 1;
            dig_uppers = 0;
            liberace_lad = 1;
            boitano_wine = 1;
            goblin_cubish = 1;
            west_sand = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire lao_ritsu_out;
nut_001_lut #(2) nut_001_lut_inst_lao_ritsu (
  .din({animal_faster,bono_homer}),
  .mask(4'b0111),
  .out(lao_ritsu_out)
);

always @(lao_ritsu_out)
begin
   emails_lamer = lao_ritsu_out;
end

// 8 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {malfoy_indigo,kungfu_duey,wine_monster,stick_roid,metal_heidi,grams_wakey,tiger_hiway,marco_chevys} <= 0;
    else if (mine_chief)
      {malfoy_indigo,kungfu_duey,wine_monster,stick_roid,metal_heidi,grams_wakey,tiger_hiway,marco_chevys} <= {malfoy_indigo,kungfu_duey,wine_monster,stick_roid,metal_heidi,grams_wakey,tiger_hiway,marco_chevys} + 28;
    else
      {malfoy_indigo,kungfu_duey,wine_monster,stick_roid,metal_heidi,grams_wakey,tiger_hiway,marco_chevys} <= {malfoy_indigo,kungfu_duey,wine_monster,stick_roid,metal_heidi,grams_wakey,tiger_hiway,marco_chevys} - 10;
  end

// NOR all of these bits together
always @(ihilani_bert or fatality_sun or whacky_hinge or emails_lamer or tiger_hiway or wine_monster or gnd or curly_red or yankee_zi or cybex_romex or sogood_brian)
  begin
      romex_whiskey = ~| {ihilani_bert,fatality_sun,whacky_hinge,emails_lamer,tiger_hiway,wine_monster,gnd,curly_red,yankee_zi,cybex_romex,sogood_brian};
  end

reg feedback_pt_361;

always @(malfoy_nyc or feedback_pt_361)
  begin
      tsmc_milhouse = !malfoy_nyc & !feedback_pt_361;
  end

reg feedback_pt_362;

always @(hinge_enoch or feedback_pt_362)
  begin
      tiger_skipper =  hinge_enoch | !feedback_pt_362;
  end

reg feedback_pt_363;

always @(pastrami_bull or feedback_pt_363)
  begin
      willy_emails =  pastrami_bull &  feedback_pt_363;
  end

reg feedback_pt_364;

always @(gnd or feedback_pt_364)
  begin
      bear_speedyg =  gnd ^ !feedback_pt_364;
  end

reg feedback_pt_365;

always @(willy_emails or feedback_pt_365)
  begin
      yeanyow_atoms = !willy_emails ^ !feedback_pt_365;
  end

reg feedback_pt_366;

always @(oldnavy_romex or feedback_pt_366)
  begin
      cain_wiggles = !oldnavy_romex & !feedback_pt_366;
  end

reg feedback_pt_367;

always @(snort_quebec or feedback_pt_367)
  begin
      zedong_coffee =  snort_quebec ^ !feedback_pt_367;
  end

reg feedback_pt_368;

always @(baron_nihlist or feedback_pt_368)
  begin
      illegal_duck =  baron_nihlist ^  feedback_pt_368;
  end

reg feedback_pt_369;

always @(malfoy_indigo or feedback_pt_369)
  begin
      square_hagrid = !malfoy_indigo ^  feedback_pt_369;
  end

reg feedback_pt_370;

always @(goblin_cubish or feedback_pt_370)
  begin
      vegan_floo = !goblin_cubish |  feedback_pt_370;
  end

reg feedback_pt_371;

always @(rubeus_egg or feedback_pt_371)
  begin
      gm_lotus =  rubeus_egg | !feedback_pt_371;
  end

reg feedback_pt_372;

always @(avon_oranges or feedback_pt_372)
  begin
      chainsaw_clay = !avon_oranges & !feedback_pt_372;
  end

reg feedback_pt_373;

always @(lsd_shuda or feedback_pt_373)
  begin
      nyc_pizza = !lsd_shuda ^ !feedback_pt_373;
  end

reg feedback_pt_374;

always @(vegas_abraham or feedback_pt_374)
  begin
      tabby_nuclear = !vegas_abraham & !feedback_pt_374;
  end

reg feedback_pt_375;

always @(gnd or feedback_pt_375)
  begin
      mars_monkey = !gnd &  feedback_pt_375;
  end

reg feedback_pt_376;

always @(grams_wakey or feedback_pt_376)
  begin
      ramone_amex = !grams_wakey ^ !feedback_pt_376;
  end

reg feedback_pt_377;

always @(gnd or feedback_pt_377)
  begin
      remus_vicks = !gnd | !feedback_pt_377;
  end

reg feedback_pt_378;

always @(snake_copper or feedback_pt_378)
  begin
      penguin_cheez =  snake_copper ^ !feedback_pt_378;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      turkey_tank <= 0;
    else if (boing_kebab)
      turkey_tank <= 0;
    else if (gnd)
      turkey_tank <= vcc;
  end

always @(turkey_tank)
  begin
      feedback_pt_361 = turkey_tank;
  end

always @(turkey_tank)
  begin
      feedback_pt_362 = turkey_tank;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foxtrot_boots <= 1;
    else
      foxtrot_boots <= fatality_sun;
  end

always @(foxtrot_boots)
  begin
      feedback_pt_363 = foxtrot_boots;
  end

always @(foxtrot_boots)
  begin
      feedback_pt_364 = foxtrot_boots;
  end

wire porfavor_ebi_wire;

dffeas porfavor_ebi_ff (
  .clk(clock0),
  .d(eel_psycho),
  .ena(albus_what),
  .sclr(drax_intuit),
  .sload(gnd),
  .asdata(liberace_lad),
  .clrn(!reset0),
  .q(porfavor_ebi_wire)
);

always @(porfavor_ebi_wire) begin
   palmer_dadada = porfavor_ebi_wire;
end

always @(palmer_dadada)
  begin
      feedback_pt_365 = palmer_dadada;
  end

always @(palmer_dadada)
  begin
      feedback_pt_366 = palmer_dadada;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dragon_paper <= 0;
    else if (fatality_sun)
      dragon_paper <= tamago_opus;
  end

always @(dragon_paper)
  begin
      feedback_pt_367 = dragon_paper;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gonzo_scrooge <= 0;
    else
      gonzo_scrooge <= ghost_zinc;
  end

always @(gonzo_scrooge)
  begin
      feedback_pt_368 = gonzo_scrooge;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      po_mario_owes <= 1;
    else
      po_mario_owes <= safeway_nest;
  end

always @(po_mario_owes)
  begin
      feedback_pt_369 = po_mario_owes;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stoner_candle <= 1;
    else
      stoner_candle <= penguin_cheez;
  end

always @(stoner_candle)
  begin
      feedback_pt_370 = stoner_candle;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bravo_hours <= 0;
    else if (rescue_sun)
      bravo_hours <= babette_crank;
    else if (klinton_macys)
      bravo_hours <= 0;
  end

always @(bravo_hours)
  begin
      feedback_pt_371 = bravo_hours;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      george_lovey <= 0;
    else
      george_lovey <= vcc;
  end

always @(george_lovey)
  begin
      feedback_pt_372 = george_lovey;
  end

wire sheep_gyro_wire;

dffeas sheep_gyro_ff (
  .clk(clock0),
  .d(nest_mcnugget),
  .ena(stix_mickey),
  .sclr(ginger_hinge),
  .sload(babette_crank),
  .asdata(vcc),
  .clrn(!reset0),
  .q(sheep_gyro_wire)
);

always @(sheep_gyro_wire) begin
   jason_drunken = sheep_gyro_wire;
end

always @(jason_drunken)
  begin
      feedback_pt_373 = jason_drunken;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bach_rewire <= 0;
    else if (vcc)
      bach_rewire <= eggsalad_dirk;
  end

always @(bach_rewire)
  begin
      feedback_pt_374 = bach_rewire;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      beetle_genji <= 0;
    else if (neville_over)
      beetle_genji <= vcc;
  end

always @(beetle_genji)
  begin
      feedback_pt_375 = beetle_genji;
  end

wire cybex_hawaii_wire;

dffeas cybex_hawaii_ff (
  .clk(clock0),
  .d(gnd),
  .ena(priest_gopher),
  .sclr(mike_stirfry),
  .sload(plaster_yummy),
  .asdata(cybex_romex),
  .clrn(!reset0),
  .q(cybex_hawaii_wire)
);

always @(cybex_hawaii_wire) begin
   iron_gonzo = cybex_hawaii_wire;
end

always @(iron_gonzo)
  begin
      feedback_pt_376 = iron_gonzo;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      advil_iceland <= 0;
    else if (due_firewalk)
      advil_iceland <= vcc;
  end

always @(advil_iceland)
  begin
      feedback_pt_377 = advil_iceland;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      smack_beavis <= 1;
    else
      smack_beavis <= willy_emails;
  end

always @(smack_beavis)
  begin
      feedback_pt_378 = smack_beavis;
  end

wire southern_bfi_wire;

dffeas southern_bfi_ff (
  .clk(clock0),
  .d(vcc),
  .ena(squad_wukong),
  .sclr(snake_copper),
  .sload(gm_lotus),
  .asdata(tiger_rubik),
  .clrn(!reset0),
  .q(southern_bfi_wire)
);

always @(southern_bfi_wire) begin
   cafe_concorde = southern_bfi_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      west_stick <= 1;
    else
      west_stick <= vcc;
  end

wire falafel_north_wire;

dffea falafel_north_ff (
  .clk(clock0),
  .d(gnd),
  .ena(vegan_floo),
  .adata(boitano_wine),
  .clrn(!reset0),
  .q(falafel_north_wire)
);

always @(falafel_north_wire) begin
   beetle_star = falafel_north_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      genji_dweebie <= 1;
    else
      genji_dweebie <= bust_fear;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rum_tukatuk <= 0;
    else if (exodus_lima)
      rum_tukatuk <= green_sortout;
    else if (jonas_monster)
      rum_tukatuk <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gulp_oitcen <= 0;
    else if (vcc)
      gulp_oitcen <= moreand_willy;
    else if (atoms_filch)
      gulp_oitcen <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lad_fascist <= 0;
    else if (neville_bravo)
      lad_fascist <= 0;
    else if (romex_whiskey)
      lad_fascist <= skipper_happy;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      jacques_rum <= 0;
    else if (pepsi_spanish)
      jacques_rum <= 0;
    else if (amex_potter)
      jacques_rum <= tiger_skipper;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      escape_escape <= 1;
    else
      escape_escape <= oscar_dimetap;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rerun_husks <= 0;
    else
      rerun_husks <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kabar_mortar <= 0;
    else if (beetle_star)
      kabar_mortar <= 0;
    else if (due_happy)
      kabar_mortar <= dragon_paper;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wine_eggsalad <= 1;
    else
      wine_eggsalad <= genji_dweebie;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      frog_emails <= 0;
    else if (tsmc_milhouse)
      frog_emails <= cocaine_bart;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kana_red <= 0;
    else if (vcc)
      kana_red <= muffin_homer;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      kebab_arizona <= 0;
    else
      kebab_arizona <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      leidiot_ghost <= 0;
    else if (vcc)
      leidiot_ghost <= cain_wiggles;
    else if (drevil_sinus)
      leidiot_ghost <= 0;
  end

wire dweebie_issac_wire;

dffeas dweebie_issac_ff (
  .clk(clock0),
  .d(gm_lotus),
  .ena(gnd),
  .sclr(cain_wiggles),
  .sload(tabby_nuclear),
  .asdata(foxtrot_boots),
  .clrn(!reset0),
  .q(dweebie_issac_wire)
);

always @(dweebie_issac_wire) begin
   bfi_obiwan = dweebie_issac_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      seashell_mars <= 0;
    else
      seashell_mars <= dig_uppers;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fire_whack <= 0;
    else if (snort_quebec)
      fire_whack <= lad_fascist;
    else if (ladder_loser)
      fire_whack <= 0;
  end

// State Mek lumber_kmfdm Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lumber_kmfdm <= lumber_kmfdm_0;
    else
      case (lumber_kmfdm)
        lumber_kmfdm_0: begin
          if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 5)
            lumber_kmfdm <= lumber_kmfdm_3;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 0)
            lumber_kmfdm <= lumber_kmfdm_6;
          else
            lumber_kmfdm <= lumber_kmfdm_0;
          end
        lumber_kmfdm_1: begin
          if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 0)
            lumber_kmfdm <= lumber_kmfdm_2;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 2)
            lumber_kmfdm <= lumber_kmfdm_3;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 12)
            lumber_kmfdm <= lumber_kmfdm_2;
          else
            lumber_kmfdm <= lumber_kmfdm_1;
          end
        lumber_kmfdm_2: begin
          if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 6)
            lumber_kmfdm <= lumber_kmfdm_5;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 3)
            lumber_kmfdm <= lumber_kmfdm_4;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 14)
            lumber_kmfdm <= lumber_kmfdm_2;
          else
            lumber_kmfdm <= lumber_kmfdm_2;
          end
        lumber_kmfdm_3: begin
          if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 15)
            lumber_kmfdm <= lumber_kmfdm_1;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 3)
            lumber_kmfdm <= lumber_kmfdm_5;
          else
            lumber_kmfdm <= lumber_kmfdm_3;
          end
        lumber_kmfdm_4: begin
          if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 3)
            lumber_kmfdm <= lumber_kmfdm_0;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 15)
            lumber_kmfdm <= lumber_kmfdm_0;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 5)
            lumber_kmfdm <= lumber_kmfdm_3;
          else
            lumber_kmfdm <= lumber_kmfdm_4;
          end
        lumber_kmfdm_5: begin
          if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 9)
            lumber_kmfdm <= lumber_kmfdm_1;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 8)
            lumber_kmfdm <= lumber_kmfdm_5;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 15)
            lumber_kmfdm <= lumber_kmfdm_4;
          else if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 0)
            lumber_kmfdm <= lumber_kmfdm_4;
          else
            lumber_kmfdm <= lumber_kmfdm_5;
          end
        lumber_kmfdm_6: begin
          if ({kebab_arizona,bach_rewire,tonic_whale,romex_whiskey} == 11)
            lumber_kmfdm <= lumber_kmfdm_3;
          else
            lumber_kmfdm <= lumber_kmfdm_6;
          end
        default: lumber_kmfdm <= lumber_kmfdm_0;
      endcase
  end

// State Mek lumber_kmfdm Output logic
always @(lumber_kmfdm)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (lumber_kmfdm)
        lumber_kmfdm_0: begin
            rouge_alpha = 1;
            pixie_spain = 0;
            rouge_east = 0;
            phoenix_ebay = 0;
            zen_firstpart = 0;
            rarest_tabby = 0;
            viagra_plague = 0;
            lupin_gotone = 0;
            dig_obiwan = 0;
            alpha_maryann = 0;
          end
        lumber_kmfdm_1: begin
            rouge_alpha = 1;
            pixie_spain = 0;
            rouge_east = 0;
            phoenix_ebay = 0;
            zen_firstpart = 0;
            rarest_tabby = 1;
            viagra_plague = 0;
            lupin_gotone = 0;
            dig_obiwan = 0;
            alpha_maryann = 0;
          end
        lumber_kmfdm_2: begin
            rouge_alpha = 0;
            pixie_spain = 0;
            rouge_east = 1;
            phoenix_ebay = 0;
            zen_firstpart = 0;
            rarest_tabby = 0;
            viagra_plague = 0;
            lupin_gotone = 1;
            dig_obiwan = 0;
            alpha_maryann = 1;
          end
        lumber_kmfdm_3: begin
            rouge_alpha = 0;
            pixie_spain = 0;
            rouge_east = 0;
            phoenix_ebay = 1;
            zen_firstpart = 0;
            rarest_tabby = 0;
            viagra_plague = 0;
            lupin_gotone = 0;
            dig_obiwan = 1;
            alpha_maryann = 1;
          end
        lumber_kmfdm_4: begin
            rouge_alpha = 0;
            pixie_spain = 0;
            rouge_east = 0;
            phoenix_ebay = 0;
            zen_firstpart = 1;
            rarest_tabby = 0;
            viagra_plague = 0;
            lupin_gotone = 0;
            dig_obiwan = 0;
            alpha_maryann = 1;
          end
        lumber_kmfdm_5: begin
            rouge_alpha = 0;
            pixie_spain = 0;
            rouge_east = 0;
            phoenix_ebay = 0;
            zen_firstpart = 0;
            rarest_tabby = 1;
            viagra_plague = 0;
            lupin_gotone = 1;
            dig_obiwan = 0;
            alpha_maryann = 1;
          end
        lumber_kmfdm_6: begin
            rouge_alpha = 0;
            pixie_spain = 0;
            rouge_east = 0;
            phoenix_ebay = 0;
            zen_firstpart = 0;
            rarest_tabby = 0;
            viagra_plague = 1;
            lupin_gotone = 0;
            dig_obiwan = 0;
            alpha_maryann = 1;
          end
        default: begin
            rouge_alpha = 0;
            pixie_spain = 0;
            rouge_east = 1;
            phoenix_ebay = 1;
            zen_firstpart = 0;
            rarest_tabby = 0;
            viagra_plague = 1;
            lupin_gotone = 0;
            dig_obiwan = 1;
            alpha_maryann = 1;
          end
      endcase
  end

// State Mek often_pdaddy Next state logic
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      often_pdaddy <= often_pdaddy_0;
    else
      case (often_pdaddy)
        often_pdaddy_0: begin
          if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 5)
            often_pdaddy <= often_pdaddy_3;
          else if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 2)
            often_pdaddy <= often_pdaddy_0;
          else if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 10)
            often_pdaddy <= often_pdaddy_2;
          else
            often_pdaddy <= often_pdaddy_0;
          end
        often_pdaddy_1: begin
          if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 2)
            often_pdaddy <= often_pdaddy_1;
          else if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 8)
            often_pdaddy <= often_pdaddy_0;
          else if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 0)
            often_pdaddy <= often_pdaddy_2;
          else if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 6)
            often_pdaddy <= often_pdaddy_1;
          else if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 9)
            often_pdaddy <= often_pdaddy_1;
          else
            often_pdaddy <= often_pdaddy_1;
          end
        often_pdaddy_2: begin
          if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 0)
            often_pdaddy <= often_pdaddy_3;
          else
            often_pdaddy <= often_pdaddy_2;
          end
        often_pdaddy_3: begin
          if ({gnd,gonzo_scrooge,bolt_trevor,oranje_zen} == 3)
            often_pdaddy <= often_pdaddy_1;
          else
            often_pdaddy <= often_pdaddy_3;
          end
        default: often_pdaddy <= often_pdaddy_0;
      endcase
  end

// State Mek often_pdaddy Output logic
always @(often_pdaddy)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (often_pdaddy)
        often_pdaddy_0: begin
            aphid_lantern = 0;
            sugar_coconut = 0;
            ernie_emu = 0;
            burning_ohno = 0;
            rod_sebastian = 0;
            zeus_hinkley = 0;
            shark_richard = 0;
          end
        often_pdaddy_1: begin
            aphid_lantern = 0;
            sugar_coconut = 1;
            ernie_emu = 0;
            burning_ohno = 0;
            rod_sebastian = 0;
            zeus_hinkley = 1;
            shark_richard = 0;
          end
        often_pdaddy_2: begin
            aphid_lantern = 0;
            sugar_coconut = 1;
            ernie_emu = 0;
            burning_ohno = 0;
            rod_sebastian = 0;
            zeus_hinkley = 0;
            shark_richard = 0;
          end
        often_pdaddy_3: begin
            aphid_lantern = 1;
            sugar_coconut = 1;
            ernie_emu = 0;
            burning_ohno = 0;
            rod_sebastian = 0;
            zeus_hinkley = 1;
            shark_richard = 1;
          end
        default: begin
            aphid_lantern = 0;
            sugar_coconut = 1;
            ernie_emu = 0;
            burning_ohno = 0;
            rod_sebastian = 0;
            zeus_hinkley = 0;
            shark_richard = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire gyro_love_in_out;
nut_001_lut #(6) nut_001_lut_inst_gyro_love_in (
  .din({gulp_mushroom,fire_whack,yeanyow_atoms,shark_richard,vcc,fury_grams}),
  .mask(64'hb7f9b5bb3fac31ed),
  .out(gyro_love_in_out)
);

always @(gyro_love_in_out)
begin
   avon_century = gyro_love_in_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire popcorn_whack_out;
nut_001_lut #(4) nut_001_lut_inst_popcorn_whack (
  .din({stoner_candle,zeus_hinkley,lad_fascist,stroop_doc}),
  .mask(16'b0001000000011000),
  .out(popcorn_whack_out)
);

always @(popcorn_whack_out)
begin
   spyro_lotus = popcorn_whack_out;
end

reg feedback_pt_379;

always @(gulp_mushroom or feedback_pt_379)
  begin
      eagle_beef = !gulp_mushroom ^ !feedback_pt_379;
  end

reg feedback_pt_380;

always @(vcc or feedback_pt_380)
  begin
      riddler_hans =  vcc ^  feedback_pt_380;
  end

reg feedback_pt_381;

always @(yeanyow_atoms or feedback_pt_381)
  begin
      bear_morrison = !yeanyow_atoms ^ !feedback_pt_381;
  end

reg feedback_pt_382;

always @(emails_lamer or feedback_pt_382)
  begin
      dow_blue = !emails_lamer | !feedback_pt_382;
  end

reg feedback_pt_383;

always @(malfoy_nyc or feedback_pt_383)
  begin
      protest_cow =  malfoy_nyc ^  feedback_pt_383;
  end

reg feedback_pt_384;

always @(sgates_think or feedback_pt_384)
  begin
      george_hp =  sgates_think ^ !feedback_pt_384;
  end

reg feedback_pt_385;

always @(spyro_lotus or feedback_pt_385)
  begin
      opus_riddler =  spyro_lotus & !feedback_pt_385;
  end

reg feedback_pt_386;

always @(covad_ocha or feedback_pt_386)
  begin
      pizza_rose =  covad_ocha | !feedback_pt_386;
  end

reg feedback_pt_387;

always @(eggsalad_dirk or feedback_pt_387)
  begin
      kilo_autotest = !eggsalad_dirk ^ !feedback_pt_387;
  end

reg feedback_pt_388;

always @(jason_drunken or feedback_pt_388)
  begin
      fitter_pilot = !jason_drunken & !feedback_pt_388;
  end

reg feedback_pt_389;

always @(crayons_fury or feedback_pt_389)
  begin
      bravo_exodus =  crayons_fury | !feedback_pt_389;
  end

reg feedback_pt_390;

always @(vcc or feedback_pt_390)
  begin
      spastic_todd = !vcc |  feedback_pt_390;
  end

reg feedback_pt_391;

always @(vcc or feedback_pt_391)
  begin
      golfland_roid = !vcc &  feedback_pt_391;
  end

reg feedback_pt_392;

always @(metal_covad or feedback_pt_392)
  begin
      richard_lamer =  metal_covad & !feedback_pt_392;
  end

reg feedback_pt_393;

always @(viagra_plague or feedback_pt_393)
  begin
      beemer_floo = !viagra_plague |  feedback_pt_393;
  end

reg feedback_pt_394;

always @(deuce_salsa or feedback_pt_394)
  begin
      vicks_tracy = !deuce_salsa | !feedback_pt_394;
  end

reg feedback_pt_395;

always @(marco_thread or feedback_pt_395)
  begin
      escape_jesus = !marco_thread |  feedback_pt_395;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dragon_broom <= 0;
    else if (bravo_exodus)
      dragon_broom <= vcc;
    else if (gnd)
      dragon_broom <= 0;
  end

always @(dragon_broom)
  begin
      feedback_pt_379 = dragon_broom;
  end

always @(dragon_broom)
  begin
      feedback_pt_380 = dragon_broom;
  end

always @(dragon_broom)
  begin
      feedback_pt_381 = dragon_broom;
  end

always @(dragon_broom)
  begin
      feedback_pt_382 = dragon_broom;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      burner_bfi <= 1;
    else
      burner_bfi <= often_master;
  end

always @(burner_bfi)
  begin
      feedback_pt_383 = burner_bfi;
  end

always @(burner_bfi)
  begin
      feedback_pt_384 = burner_bfi;
  end

always @(burner_bfi)
  begin
      feedback_pt_385 = burner_bfi;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      egg_wonton <= 0;
    else if (vcc)
      egg_wonton <= 0;
    else if (vcc)
      egg_wonton <= often_onthepc;
  end

always @(egg_wonton)
  begin
      feedback_pt_386 = egg_wonton;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      abraham_albus <= 0;
    else
      abraham_albus <= vegan_floo;
  end

always @(abraham_albus)
  begin
      feedback_pt_387 = abraham_albus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      curie_lost <= 0;
    else if (pixie_spain)
      curie_lost <= 0;
    else if (richard_lamer)
      curie_lost <= drevil_sinus;
  end

always @(curie_lost)
  begin
      feedback_pt_388 = curie_lost;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wine_mine <= 0;
    else
      wine_mine <= avon_century;
  end

always @(wine_mine)
  begin
      feedback_pt_389 = wine_mine;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      monkey_barney <= 0;
    else if (tango_would)
      monkey_barney <= 0;
    else if (zen_firstpart)
      monkey_barney <= gnd;
  end

always @(monkey_barney)
  begin
      feedback_pt_390 = monkey_barney;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      mrbill_mars <= 0;
    else
      mrbill_mars <= vcc;
  end

always @(mrbill_mars)
  begin
      feedback_pt_391 = mrbill_mars;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      athena_barty <= 1;
    else
      athena_barty <= leaky_snort;
  end

always @(athena_barty)
  begin
      feedback_pt_392 = athena_barty;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marge_dirty <= 0;
    else
      marge_dirty <= vcc;
  end

always @(marge_dirty)
  begin
      feedback_pt_393 = marge_dirty;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      salsa_master <= 1;
    else
      salsa_master <= metal_heidi;
  end

always @(salsa_master)
  begin
      feedback_pt_394 = salsa_master;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sirius_tobiko <= 1;
    else
      sirius_tobiko <= wine_mine;
  end

always @(sirius_tobiko)
  begin
      feedback_pt_395 = sirius_tobiko;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      venus_martian <= 1;
    else
      venus_martian <= avon_giants;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      goat_romex <= 0;
    else if (jonas_monster)
      goat_romex <= golfland_roid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      fang_atilla <= 0;
    else if (gm_lotus)
      fang_atilla <= eggsalad_dirk;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      egg_barney <= 0;
    else if (vcc)
      egg_barney <= 0;
    else if (marco_chevys)
      egg_barney <= cubish_issac;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      eagle_centaur <= 0;
    else if (rarest_chevys)
      eagle_centaur <= 0;
    else if (ladder_loser)
      eagle_centaur <= dig_obiwan;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ramone_palmer <= 1;
    else
      ramone_palmer <= rose_hp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      schwinger_red <= 0;
    else if (gnd)
      schwinger_red <= 0;
    else if (metal_covad)
      schwinger_red <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      potato_bull <= 0;
    else if (smack_beavis)
      potato_bull <= aphid_lantern;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pixie_kungfu <= 1;
    else
      pixie_kungfu <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pasta_shuda <= 1;
    else
      pasta_shuda <= gnd;
  end

wire lost_agitator_wire;

dffeas lost_agitator_ff (
  .clk(clock0),
  .d(vegas_abraham),
  .ena(might_what),
  .sclr(remus_vicks),
  .sload(bravo_hours),
  .asdata(vcc),
  .clrn(!reset0),
  .q(lost_agitator_wire)
);

always @(lost_agitator_wire) begin
   square_cubish = lost_agitator_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      dig_fsncens <= 0;
    else if (rod_sebastian)
      dig_fsncens <= po_mario_owes;
    else if (ceres_elian)
      dig_fsncens <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lao_shudamak <= 0;
    else if (gnd)
      lao_shudamak <= 0;
    else if (vcc)
      lao_shudamak <= seashell_mars;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      hawaii_marco <= 0;
    else if (timmy_bracket)
      hawaii_marco <= spastic_todd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      palmer_bust <= 1;
    else
      palmer_bust <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      rodriguez_guy <= 0;
    else if (gnd)
      rodriguez_guy <= 0;
    else if (wine_eggsalad)
      rodriguez_guy <= leidiot_ghost;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wonder_stroop <= 0;
    else if (klinton_macys)
      wonder_stroop <= george_lovey;
    else if (egg_barney)
      wonder_stroop <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      marco_orange <= 0;
    else if (gnd)
      marco_orange <= alpha_maryann;
    else if (legos_tofu)
      marco_orange <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bep_defoliant <= 0;
    else if (might_what)
      bep_defoliant <= beauty_dog;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      what_eel <= 0;
    else if (vcc)
      what_eel <= 0;
    else if (pixie_kungfu)
      what_eel <= dimetap_vegan;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      happy_mortar <= 0;
    else
      happy_mortar <= seashell_mars;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      metal_romulus <= 1;
    else
      metal_romulus <= tango_would;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      bravo_arcade <= 0;
    else if (abraham_albus)
      bravo_arcade <= marco_orange;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chowmein_haze <= 1;
    else
      chowmein_haze <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ham_bacon <= 1;
    else
      ham_bacon <= kabar_mortar;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      moron_gin <= 0;
    else if (gnd)
      moron_gin <= 0;
    else if (lad_fascist)
      moron_gin <= vcc;
  end

// XOR all of these bits together
always @(foxtrot_boots or gnd or sirius_tobiko)
  begin
      roe_kanji = ^ {foxtrot_boots,gnd,sirius_tobiko};
  end

// 3 bit SOP selector
always @(
        gnd or hawaii_marco  or 
        stroop_doc or curie_lost  or 
        metal_romulus or pixie_spain 
)

begin
    nyc_candle = 
      gnd & hawaii_marco |
      stroop_doc & curie_lost |
      metal_romulus & pixie_spain;
end

// 3 bit SOP selector
always @(
        lad_fascist or spastic_todd  or 
        bach_rewire or lao_shudamak  or 
        gnd or issac_gonzo 
)

begin
    elf_killer = 
      lad_fascist & spastic_todd |
      bach_rewire & lao_shudamak |
      gnd & issac_gonzo;
end

// 7 bit priority MUX
always @(
        dow_blue or pasta_shuda  or 
        frog_emails or freaky_amex  or 
        george_hp or kungfu_duey  or 
        avon_century or zedong_coffee  or 
        vicks_tracy or metal_covad  or 
        dork_porfavor or pizza_rose  or 
        bfi_obiwan or palmer_bust 
)

  begin
    if (dow_blue) curie_plague = pasta_shuda;
    else if (frog_emails) curie_plague = freaky_amex;
    else if (george_hp) curie_plague = kungfu_duey;
    else if (avon_century) curie_plague = zedong_coffee;
    else if (vicks_tracy) curie_plague = metal_covad;
    else if (dork_porfavor) curie_plague = pizza_rose;
    else if (bfi_obiwan) curie_plague = palmer_bust;
    else curie_plague = 0;
  end

// XNOR all of these bits together
always @(beauty_dog or sugar_coconut or rerun_husks or sirius_tobiko or wonder_stroop or zedong_lucius or turkey_tank or covad_pdiddy or rarest_tabby or klinton_macys)
  begin
      spyro_neon = ~^ {beauty_dog,sugar_coconut,rerun_husks,sirius_tobiko,wonder_stroop,zedong_lucius,turkey_tank,covad_pdiddy,rarest_tabby,klinton_macys};
  end

// Greater Equal Less compare
always @(aphid_lantern or tabby_nuclear or gnd or phoenix_ebay or palmer_bust or west_sand or vcc or ramone_amex or mars_monkey or covad_pdiddy or gnd or genji_dweebie or gnd or vcc)
  begin
    if ({aphid_lantern,tabby_nuclear,gnd,phoenix_ebay,palmer_bust,west_sand,vcc} > {ramone_amex,mars_monkey,covad_pdiddy,gnd,genji_dweebie,gnd,vcc})
       {ocha_meffert,kungfu_elian,gap_greenbay} = 3'b100;
    else if ({aphid_lantern,tabby_nuclear,gnd,phoenix_ebay,palmer_bust,west_sand,vcc} < {ramone_amex,mars_monkey,covad_pdiddy,gnd,genji_dweebie,gnd,vcc})
       {ocha_meffert,kungfu_elian,gap_greenbay} = 3'b010;
    else
       {ocha_meffert,kungfu_elian,gap_greenbay} = 3'b001;
  end

// AND all of these bits together
always @(illegal_duck or vcc or chief_timmy or pizza_rose or escape_escape or ocha_meffert or legos_tofu)
  begin
      gilligan_mine = & {illegal_duck,vcc,chief_timmy,pizza_rose,escape_escape,ocha_meffert,legos_tofu};
  end

// Random 8 input look up table
always @(hagrid_indigo or dig_fsncens or metal_heidi or metal_heidi or bfi_obiwan or what_eel or lad_fascist or bolt_trevor)
  begin
    casex ({hagrid_indigo,dig_fsncens,metal_heidi,metal_heidi,bfi_obiwan,what_eel,lad_fascist,bolt_trevor})
      0: hector_potato=1;
      1: hector_potato=0;
      2: hector_potato=0;
      3: hector_potato=1;
      4: hector_potato=1;
      5: hector_potato=0;
      6: hector_potato=1;
      7: hector_potato=1;
      8: hector_potato=0;
      9: hector_potato=1;
      10: hector_potato=0;
      11: hector_potato=0;
      12: hector_potato=1;
      13: hector_potato=1;
      14: hector_potato=1;
      15: hector_potato=0;
      16: hector_potato=1;
      17: hector_potato=0;
      18: hector_potato=1;
      19: hector_potato=1;
      20: hector_potato=1;
      21: hector_potato=1;
      22: hector_potato=0;
      23: hector_potato=0;
      24: hector_potato=1;
      25: hector_potato=1;
      26: hector_potato=0;
      27: hector_potato=0;
      28: hector_potato=0;
      29: hector_potato=1;
      30: hector_potato=0;
      31: hector_potato=0;
      32: hector_potato=1;
      33: hector_potato=0;
      34: hector_potato=1;
      35: hector_potato=0;
      36: hector_potato=0;
      37: hector_potato=1;
      38: hector_potato=0;
      39: hector_potato=0;
      40: hector_potato=1;
      41: hector_potato=1;
      42: hector_potato=0;
      43: hector_potato=1;
      44: hector_potato=1;
      45: hector_potato=1;
      46: hector_potato=0;
      47: hector_potato=0;
      48: hector_potato=0;
      49: hector_potato=0;
      50: hector_potato=0;
      51: hector_potato=1;
      52: hector_potato=0;
      53: hector_potato=1;
      54: hector_potato=1;
      55: hector_potato=1;
      56: hector_potato=1;
      57: hector_potato=0;
      58: hector_potato=1;
      59: hector_potato=0;
      60: hector_potato=1;
      61: hector_potato=0;
      62: hector_potato=1;
      63: hector_potato=0;
      64: hector_potato=0;
      65: hector_potato=0;
      66: hector_potato=0;
      67: hector_potato=1;
      68: hector_potato=0;
      69: hector_potato=1;
      70: hector_potato=1;
      71: hector_potato=0;
      72: hector_potato=0;
      73: hector_potato=1;
      74: hector_potato=1;
      75: hector_potato=1;
      76: hector_potato=1;
      77: hector_potato=1;
      78: hector_potato=0;
      79: hector_potato=0;
      80: hector_potato=0;
      81: hector_potato=1;
      82: hector_potato=0;
      83: hector_potato=0;
      84: hector_potato=0;
      85: hector_potato=1;
      86: hector_potato=1;
      87: hector_potato=1;
      88: hector_potato=0;
      89: hector_potato=0;
      90: hector_potato=0;
      91: hector_potato=1;
      92: hector_potato=1;
      93: hector_potato=1;
      94: hector_potato=0;
      95: hector_potato=1;
      96: hector_potato=0;
      97: hector_potato=1;
      98: hector_potato=1;
      99: hector_potato=1;
      100: hector_potato=1;
      101: hector_potato=0;
      102: hector_potato=0;
      103: hector_potato=0;
      104: hector_potato=1;
      105: hector_potato=0;
      106: hector_potato=1;
      107: hector_potato=1;
      108: hector_potato=1;
      109: hector_potato=0;
      110: hector_potato=0;
      111: hector_potato=0;
      112: hector_potato=1;
      113: hector_potato=1;
      114: hector_potato=0;
      115: hector_potato=0;
      116: hector_potato=1;
      117: hector_potato=1;
      118: hector_potato=1;
      119: hector_potato=0;
      120: hector_potato=1;
      121: hector_potato=1;
      122: hector_potato=1;
      123: hector_potato=0;
      124: hector_potato=1;
      125: hector_potato=1;
      126: hector_potato=0;
      127: hector_potato=1;
      128: hector_potato=1;
      129: hector_potato=0;
      130: hector_potato=1;
      131: hector_potato=1;
      132: hector_potato=1;
      133: hector_potato=1;
      134: hector_potato=1;
      135: hector_potato=0;
      136: hector_potato=0;
      137: hector_potato=1;
      138: hector_potato=0;
      139: hector_potato=1;
      140: hector_potato=1;
      141: hector_potato=1;
      142: hector_potato=0;
      143: hector_potato=0;
      144: hector_potato=0;
      145: hector_potato=1;
      146: hector_potato=1;
      147: hector_potato=0;
      148: hector_potato=0;
      149: hector_potato=0;
      150: hector_potato=1;
      151: hector_potato=1;
      152: hector_potato=1;
      153: hector_potato=1;
      154: hector_potato=1;
      155: hector_potato=1;
      156: hector_potato=1;
      157: hector_potato=0;
      158: hector_potato=1;
      159: hector_potato=0;
      160: hector_potato=1;
      161: hector_potato=0;
      162: hector_potato=1;
      163: hector_potato=0;
      164: hector_potato=0;
      165: hector_potato=0;
      166: hector_potato=1;
      167: hector_potato=0;
      168: hector_potato=1;
      169: hector_potato=1;
      170: hector_potato=0;
      171: hector_potato=0;
      172: hector_potato=0;
      173: hector_potato=0;
      174: hector_potato=1;
      175: hector_potato=0;
      176: hector_potato=1;
      177: hector_potato=1;
      178: hector_potato=0;
      179: hector_potato=0;
      180: hector_potato=1;
      181: hector_potato=1;
      182: hector_potato=0;
      183: hector_potato=0;
      184: hector_potato=0;
      185: hector_potato=1;
      186: hector_potato=1;
      187: hector_potato=0;
      188: hector_potato=0;
      189: hector_potato=1;
      190: hector_potato=0;
      191: hector_potato=0;
      192: hector_potato=1;
      193: hector_potato=0;
      194: hector_potato=1;
      195: hector_potato=1;
      196: hector_potato=1;
      197: hector_potato=0;
      198: hector_potato=1;
      199: hector_potato=1;
      200: hector_potato=0;
      201: hector_potato=1;
      202: hector_potato=0;
      203: hector_potato=0;
      204: hector_potato=1;
      205: hector_potato=0;
      206: hector_potato=1;
      207: hector_potato=1;
      208: hector_potato=0;
      209: hector_potato=1;
      210: hector_potato=1;
      211: hector_potato=1;
      212: hector_potato=1;
      213: hector_potato=0;
      214: hector_potato=1;
      215: hector_potato=1;
      216: hector_potato=1;
      217: hector_potato=0;
      218: hector_potato=0;
      219: hector_potato=1;
      220: hector_potato=0;
      221: hector_potato=1;
      222: hector_potato=0;
      223: hector_potato=0;
      224: hector_potato=0;
      225: hector_potato=1;
      226: hector_potato=1;
      227: hector_potato=0;
      228: hector_potato=1;
      229: hector_potato=0;
      230: hector_potato=0;
      231: hector_potato=1;
      232: hector_potato=1;
      233: hector_potato=1;
      234: hector_potato=1;
      235: hector_potato=1;
      236: hector_potato=0;
      237: hector_potato=0;
      238: hector_potato=1;
      239: hector_potato=1;
      240: hector_potato=0;
      241: hector_potato=0;
      242: hector_potato=1;
      243: hector_potato=0;
      244: hector_potato=0;
      245: hector_potato=0;
      246: hector_potato=0;
      247: hector_potato=1;
      248: hector_potato=0;
      249: hector_potato=0;
      250: hector_potato=0;
      251: hector_potato=0;
      252: hector_potato=1;
      253: hector_potato=1;
      254: hector_potato=1;
      255: hector_potato=1;
      default: hector_potato=0;
    endcase
  end

// Random 2 input look up table
always @(vcc or ocha_meffert)
  begin
    casex ({vcc,ocha_meffert})
      0: tsmc_wildboar=0;
      1: tsmc_wildboar=0;
      2: tsmc_wildboar=0;
      3: tsmc_wildboar=1;
      default: tsmc_wildboar=0;
    endcase
  end

// 5 bit priority MUX
always @(
        elf_killer or ernie_emu  or 
        gilligan_mine or gnd  or 
        nyc_candle or gnd  or 
        west_stick or bep_defoliant  or 
        nyc_pizza or vcc 
)

  begin
    if (elf_killer) moron_curious = ernie_emu;
    else if (gilligan_mine) moron_curious = gnd;
    else if (nyc_candle) moron_curious = gnd;
    else if (west_stick) moron_curious = bep_defoliant;
    else if (nyc_pizza) moron_curious = vcc;
    else moron_curious = 0;
  end

// OR all of these bits together
always @(eagle_centaur or potato_bull or bust_fear or burner_bfi or marco_chevys or stroop_doc or dragon_broom or iron_gonzo or escape_escape or jonas_monster)
  begin
      jesus_rubik = | {eagle_centaur,potato_bull,bust_fear,burner_bfi,marco_chevys,stroop_doc,dragon_broom,iron_gonzo,escape_escape,jonas_monster};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      what_doobie <= 0;
    else
    case ({gap_greenbay,zed_weevil})
       0 : what_doobie <= what_doobie;
       1 : what_doobie <= vcc;
       2 : what_doobie <= what_doobie;
       3 : what_doobie <= what_doobie;
       default : what_doobie <= 0;
    endcase
  end

// XNOR all of these bits together
always @(vcc or kmfdm_marvin or moron_curious or dimetap_vegan or kungfu_elian or phoenix_ebay or beemer_floo or marquis_husks or monkey_barney or rouge_east or fang_atilla or covad_ocha)
  begin
      rose_larry = ~^ {vcc,kmfdm_marvin,moron_curious,dimetap_vegan,kungfu_elian,phoenix_ebay,beemer_floo,marquis_husks,monkey_barney,rouge_east,fang_atilla,covad_ocha};
  end

// 9 bit SOP selector
always @(
        gnd or roe_kanji  or 
        eagle_beef or jesus_rubik  or 
        beetle_genji or iron_gonzo  or 
        rouge_alpha or avon_oranges  or 
        advil_iceland or palmer_bust  or 
        avon_oranges or ramone_palmer  or 
        vcc or lupin_gotone  or 
        escape_jesus or gnd  or 
        happy_mortar or kilo_autotest 
)

begin
    oscar_tapered = 
      gnd & roe_kanji |
      eagle_beef & jesus_rubik |
      beetle_genji & iron_gonzo |
      rouge_alpha & avon_oranges |
      advil_iceland & palmer_bust |
      avon_oranges & ramone_palmer |
      vcc & lupin_gotone |
      escape_jesus & gnd |
      happy_mortar & kilo_autotest;
end

// NOR all of these bits together
always @(egg_wonton or spyro_neon or gnd or nyc_pizza or bolt_trevor or stroop_doc or burner_mrbill or deuce_salsa)
  begin
      chillis_cybex = ~| {egg_wonton,spyro_neon,gnd,nyc_pizza,bolt_trevor,stroop_doc,burner_mrbill,deuce_salsa};
  end

// Random 8 input look up table
always @(spastic_todd or kana_red or advil_iceland or fitter_pilot or salsa_master or might_what or vcc or egg_wonton)
  begin
    casex ({spastic_todd,kana_red,advil_iceland,fitter_pilot,salsa_master,might_what,vcc,egg_wonton})
      0: spain_yellow=0;
      1: spain_yellow=0;
      2: spain_yellow=1;
      3: spain_yellow=0;
      4: spain_yellow=1;
      5: spain_yellow=1;
      6: spain_yellow=0;
      7: spain_yellow=1;
      8: spain_yellow=0;
      9: spain_yellow=1;
      10: spain_yellow=0;
      11: spain_yellow=0;
      12: spain_yellow=1;
      13: spain_yellow=1;
      14: spain_yellow=1;
      15: spain_yellow=0;
      16: spain_yellow=0;
      17: spain_yellow=0;
      18: spain_yellow=0;
      19: spain_yellow=0;
      20: spain_yellow=0;
      21: spain_yellow=0;
      22: spain_yellow=0;
      23: spain_yellow=1;
      24: spain_yellow=1;
      25: spain_yellow=0;
      26: spain_yellow=0;
      27: spain_yellow=0;
      28: spain_yellow=0;
      29: spain_yellow=0;
      30: spain_yellow=1;
      31: spain_yellow=1;
      32: spain_yellow=1;
      33: spain_yellow=1;
      34: spain_yellow=0;
      35: spain_yellow=0;
      36: spain_yellow=1;
      37: spain_yellow=0;
      38: spain_yellow=0;
      39: spain_yellow=1;
      40: spain_yellow=0;
      41: spain_yellow=1;
      42: spain_yellow=1;
      43: spain_yellow=0;
      44: spain_yellow=0;
      45: spain_yellow=1;
      46: spain_yellow=0;
      47: spain_yellow=0;
      48: spain_yellow=1;
      49: spain_yellow=0;
      50: spain_yellow=0;
      51: spain_yellow=1;
      52: spain_yellow=0;
      53: spain_yellow=0;
      54: spain_yellow=1;
      55: spain_yellow=0;
      56: spain_yellow=1;
      57: spain_yellow=1;
      58: spain_yellow=0;
      59: spain_yellow=0;
      60: spain_yellow=1;
      61: spain_yellow=0;
      62: spain_yellow=0;
      63: spain_yellow=0;
      64: spain_yellow=0;
      65: spain_yellow=0;
      66: spain_yellow=1;
      67: spain_yellow=1;
      68: spain_yellow=1;
      69: spain_yellow=1;
      70: spain_yellow=0;
      71: spain_yellow=0;
      72: spain_yellow=1;
      73: spain_yellow=1;
      74: spain_yellow=0;
      75: spain_yellow=0;
      76: spain_yellow=0;
      77: spain_yellow=0;
      78: spain_yellow=0;
      79: spain_yellow=1;
      80: spain_yellow=0;
      81: spain_yellow=1;
      82: spain_yellow=0;
      83: spain_yellow=1;
      84: spain_yellow=0;
      85: spain_yellow=1;
      86: spain_yellow=0;
      87: spain_yellow=0;
      88: spain_yellow=0;
      89: spain_yellow=1;
      90: spain_yellow=0;
      91: spain_yellow=1;
      92: spain_yellow=1;
      93: spain_yellow=1;
      94: spain_yellow=0;
      95: spain_yellow=1;
      96: spain_yellow=1;
      97: spain_yellow=0;
      98: spain_yellow=1;
      99: spain_yellow=0;
      100: spain_yellow=1;
      101: spain_yellow=0;
      102: spain_yellow=0;
      103: spain_yellow=0;
      104: spain_yellow=0;
      105: spain_yellow=1;
      106: spain_yellow=1;
      107: spain_yellow=0;
      108: spain_yellow=1;
      109: spain_yellow=0;
      110: spain_yellow=0;
      111: spain_yellow=1;
      112: spain_yellow=0;
      113: spain_yellow=0;
      114: spain_yellow=0;
      115: spain_yellow=0;
      116: spain_yellow=1;
      117: spain_yellow=0;
      118: spain_yellow=1;
      119: spain_yellow=0;
      120: spain_yellow=1;
      121: spain_yellow=1;
      122: spain_yellow=0;
      123: spain_yellow=0;
      124: spain_yellow=0;
      125: spain_yellow=1;
      126: spain_yellow=0;
      127: spain_yellow=0;
      128: spain_yellow=1;
      129: spain_yellow=1;
      130: spain_yellow=0;
      131: spain_yellow=0;
      132: spain_yellow=0;
      133: spain_yellow=1;
      134: spain_yellow=0;
      135: spain_yellow=1;
      136: spain_yellow=1;
      137: spain_yellow=1;
      138: spain_yellow=1;
      139: spain_yellow=1;
      140: spain_yellow=1;
      141: spain_yellow=1;
      142: spain_yellow=0;
      143: spain_yellow=1;
      144: spain_yellow=0;
      145: spain_yellow=1;
      146: spain_yellow=0;
      147: spain_yellow=1;
      148: spain_yellow=1;
      149: spain_yellow=0;
      150: spain_yellow=1;
      151: spain_yellow=1;
      152: spain_yellow=1;
      153: spain_yellow=0;
      154: spain_yellow=1;
      155: spain_yellow=1;
      156: spain_yellow=0;
      157: spain_yellow=1;
      158: spain_yellow=1;
      159: spain_yellow=1;
      160: spain_yellow=0;
      161: spain_yellow=0;
      162: spain_yellow=1;
      163: spain_yellow=0;
      164: spain_yellow=0;
      165: spain_yellow=0;
      166: spain_yellow=0;
      167: spain_yellow=0;
      168: spain_yellow=0;
      169: spain_yellow=0;
      170: spain_yellow=0;
      171: spain_yellow=0;
      172: spain_yellow=1;
      173: spain_yellow=0;
      174: spain_yellow=1;
      175: spain_yellow=0;
      176: spain_yellow=0;
      177: spain_yellow=0;
      178: spain_yellow=1;
      179: spain_yellow=1;
      180: spain_yellow=1;
      181: spain_yellow=0;
      182: spain_yellow=1;
      183: spain_yellow=1;
      184: spain_yellow=0;
      185: spain_yellow=1;
      186: spain_yellow=0;
      187: spain_yellow=0;
      188: spain_yellow=1;
      189: spain_yellow=1;
      190: spain_yellow=1;
      191: spain_yellow=1;
      192: spain_yellow=0;
      193: spain_yellow=1;
      194: spain_yellow=1;
      195: spain_yellow=0;
      196: spain_yellow=1;
      197: spain_yellow=0;
      198: spain_yellow=1;
      199: spain_yellow=1;
      200: spain_yellow=0;
      201: spain_yellow=0;
      202: spain_yellow=0;
      203: spain_yellow=0;
      204: spain_yellow=1;
      205: spain_yellow=1;
      206: spain_yellow=0;
      207: spain_yellow=0;
      208: spain_yellow=1;
      209: spain_yellow=0;
      210: spain_yellow=1;
      211: spain_yellow=0;
      212: spain_yellow=1;
      213: spain_yellow=0;
      214: spain_yellow=0;
      215: spain_yellow=0;
      216: spain_yellow=1;
      217: spain_yellow=1;
      218: spain_yellow=0;
      219: spain_yellow=1;
      220: spain_yellow=0;
      221: spain_yellow=0;
      222: spain_yellow=0;
      223: spain_yellow=1;
      224: spain_yellow=1;
      225: spain_yellow=1;
      226: spain_yellow=0;
      227: spain_yellow=0;
      228: spain_yellow=1;
      229: spain_yellow=1;
      230: spain_yellow=0;
      231: spain_yellow=0;
      232: spain_yellow=0;
      233: spain_yellow=0;
      234: spain_yellow=0;
      235: spain_yellow=1;
      236: spain_yellow=0;
      237: spain_yellow=0;
      238: spain_yellow=1;
      239: spain_yellow=0;
      240: spain_yellow=1;
      241: spain_yellow=1;
      242: spain_yellow=1;
      243: spain_yellow=0;
      244: spain_yellow=1;
      245: spain_yellow=1;
      246: spain_yellow=0;
      247: spain_yellow=1;
      248: spain_yellow=1;
      249: spain_yellow=1;
      250: spain_yellow=1;
      251: spain_yellow=1;
      252: spain_yellow=1;
      253: spain_yellow=0;
      254: spain_yellow=1;
      255: spain_yellow=1;
      default: spain_yellow=0;
    endcase
  end

// NAND all of these bits together
always @(curie_plague or bear_morrison or covad_pdiddy or gnd or vcc or happy_mortar or fire_whack or fatality_sun or hector_potato)
  begin
      homerun_meth = ~& {curie_plague,bear_morrison,covad_pdiddy,gnd,vcc,happy_mortar,fire_whack,fatality_sun,hector_potato};
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      advil_yummy <= 0;
    else
    case ({gnd,eagle_centaur})
       0 : advil_yummy <= advil_yummy;
       1 : advil_yummy <= advil_yummy;
       2 : advil_yummy <= vegas_abraham;
       3 : advil_yummy <= homerun_meth;
       default : advil_yummy <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      foryou_subway <= 0;
    else
    case ({venus_martian,mushroom_dork})
       0 : foryou_subway <= oscar_tapered;
       1 : foryou_subway <= foryou_subway;
       2 : foryou_subway <= foryou_subway;
       3 : foryou_subway <= foryou_subway;
       default : foryou_subway <= 0;
    endcase
  end

reg feedback_pt_396;

always @(roe_kanji or feedback_pt_396)
  begin
      freaky_pdaddy = !roe_kanji &  feedback_pt_396;
  end

reg feedback_pt_397;

always @(chainsaw_clay or feedback_pt_397)
  begin
      bonker_gonzo =  chainsaw_clay | !feedback_pt_397;
  end

reg feedback_pt_398;

always @(goat_romex or feedback_pt_398)
  begin
      bfs_mortar =  goat_romex ^  feedback_pt_398;
  end

reg feedback_pt_399;

always @(gnd or feedback_pt_399)
  begin
      hans_palmer = !gnd |  feedback_pt_399;
  end

reg feedback_pt_400;

always @(hans_palmer or feedback_pt_400)
  begin
      curie_sogood = !hans_palmer ^ !feedback_pt_400;
  end

reg feedback_pt_401;

always @(spain_yellow or feedback_pt_401)
  begin
      life_rabbi = !spain_yellow |  feedback_pt_401;
  end

reg feedback_pt_402;

always @(curie_lost or feedback_pt_402)
  begin
      fear_exodus = !curie_lost & !feedback_pt_402;
  end

reg feedback_pt_403;

always @(vcc or feedback_pt_403)
  begin
      itchy_rose = !vcc | !feedback_pt_403;
  end

reg feedback_pt_404;

always @(zen_firstpart or feedback_pt_404)
  begin
      parrot_dragon = !zen_firstpart ^  feedback_pt_404;
  end

reg feedback_pt_405;

always @(vcc or feedback_pt_405)
  begin
      yak_holepunch =  vcc &  feedback_pt_405;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      ajax_spyro <= 0;
    else
      ajax_spyro <= oscar_tapered;
  end

always @(ajax_spyro)
  begin
      feedback_pt_396 = ajax_spyro;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      indigo_buddha <= 0;
    else if (monkey_barney)
      indigo_buddha <= oscar_tapered;
  end

always @(indigo_buddha)
  begin
      feedback_pt_397 = indigo_buddha;
  end

wire wood_notalot_wire;

dffeas wood_notalot_ff (
  .clk(clock0),
  .d(kmfdm_marvin),
  .ena(zen_firstpart),
  .sclr(ham_bacon),
  .sload(schwinger_red),
  .asdata(gnd),
  .clrn(!reset0),
  .q(wood_notalot_wire)
);

always @(wood_notalot_wire) begin
   minerva_wakey = wood_notalot_wire;
end

always @(minerva_wakey)
  begin
      feedback_pt_398 = minerva_wakey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pirate_gutter <= 0;
    else if (burning_ohno)
      pirate_gutter <= yak_holepunch;
    else if (often_onthepc)
      pirate_gutter <= 0;
  end

always @(pirate_gutter)
  begin
      feedback_pt_399 = pirate_gutter;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      wonder_fronds <= 0;
    else if (indigo_buddha)
      wonder_fronds <= stick_roid;
    else if (beetle_star)
      wonder_fronds <= 0;
  end

always @(wonder_fronds)
  begin
      feedback_pt_400 = wonder_fronds;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      orange_cubish <= 1;
    else
      orange_cubish <= rodriguez_guy;
  end

always @(orange_cubish)
  begin
      feedback_pt_401 = orange_cubish;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      nasdaq_shemp <= 0;
    else if (bravo_arcade)
      nasdaq_shemp <= fitter_pilot;
    else if (riddler_hans)
      nasdaq_shemp <= 0;
  end

always @(nasdaq_shemp)
  begin
      feedback_pt_402 = nasdaq_shemp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      whattime_bert <= 1;
    else
      whattime_bert <= klinton_macys;
  end

always @(whattime_bert)
  begin
      feedback_pt_403 = whattime_bert;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      opus_liberace <= 1;
    else
      opus_liberace <= whattime_bert;
  end

always @(opus_liberace)
  begin
      feedback_pt_404 = opus_liberace;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      sanity_hp <= 0;
    else if (tiger_dimetap)
      sanity_hp <= 0;
    else if (fatality_sun)
      sanity_hp <= pirate_gutter;
  end

always @(sanity_hp)
  begin
      feedback_pt_405 = sanity_hp;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      stick_intuit <= 0;
    else if (fear_exodus)
      stick_intuit <= might_what;
    else if (george_hp)
      stick_intuit <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      iron_cheese <= 0;
    else if (curie_plague)
      iron_cheese <= ajax_spyro;
    else if (life_rabbi)
      iron_cheese <= 0;
  end

wire hulk_kaisha_wire;

dffeas hulk_kaisha_ff (
  .clk(clock0),
  .d(beetle_star),
  .ena(fitter_pilot),
  .sclr(freaky_pdaddy),
  .sload(dragon_broom),
  .asdata(genji_dweebie),
  .clrn(!reset0),
  .q(hulk_kaisha_wire)
);

always @(hulk_kaisha_wire) begin
   ready_spirit = hulk_kaisha_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      show_theseus <= 0;
    else if (vcc)
      show_theseus <= metal_romulus;
    else if (gap_greenbay)
      show_theseus <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      molokai_rum <= 1;
    else
      molokai_rum <= monkey_barney;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      seashell_abel <= 0;
    else if (what_doobie)
      seashell_abel <= kmfdm_marvin;
  end

wire maryann_yoku_wire;

dffea maryann_yoku_ff (
  .clk(clock0),
  .d(burner_mrbill),
  .ena(athena_barty),
  .adata(molokai_rum),
  .clrn(!reset0),
  .q(maryann_yoku_wire)
);

always @(maryann_yoku_wire) begin
   lao_steaming = maryann_yoku_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      float_floo <= 0;
    else
      float_floo <= gnd;
  end

wire beetle_whale_wire;

dffeas beetle_whale_ff (
  .clk(clock0),
  .d(orange_cubish),
  .ena(often_onthepc),
  .sclr(bfs_mortar),
  .sload(rod_sebastian),
  .asdata(turkey_tank),
  .clrn(!reset0),
  .q(beetle_whale_wire)
);

always @(beetle_whale_wire) begin
   elf_east = beetle_whale_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      boitano_boing <= 0;
    else if (gnd)
      boitano_boing <= kmfdm_marvin;
    else if (rose_larry)
      boitano_boing <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pcp_master <= 0;
    else if (vcc)
      pcp_master <= athena_barty;
    else if (crayons_ibm)
      pcp_master <= 0;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      isle_mortgate <= 0;
    else if (vcc)
      isle_mortgate <= 0;
    else if (lupin_gotone)
      isle_mortgate <= gnd;
  end

wire acid_gopher_wire;

dffea acid_gopher_ff (
  .clk(clock0),
  .d(vcc),
  .ena(curie_sogood),
  .adata(isle_mortgate),
  .clrn(!reset0),
  .q(acid_gopher_wire)
);

always @(acid_gopher_wire) begin
   norbert_goofy = acid_gopher_wire;
end

// Vanilla tristate output pin
  bufif1 (yummy_pizza,!elf_east, pcp_master);  // output,dat,oe

// Internal TRI bus MUX built out of tri buffers;
// Z and conflict not possible
  tri deng_gerrit_tri;
  wire [5:0] deng_gerrit_dat = {gnd,minerva_wakey,jacques_rum,fear_exodus,onion_trevor};
  wire [5:0] deng_gerrit_sel = {itchy_rose,moron_gin,zen_firstpart,vcc,george_hp};
  wire [5:0] deng_gerrit_ohsel;
  wire deng_gerrit_def;

  assign deng_gerrit_ohsel[0] = deng_gerrit_sel[0];
  assign deng_gerrit_ohsel[1] = deng_gerrit_sel[1] & !deng_gerrit_ohsel[0];
  assign deng_gerrit_ohsel[2] = deng_gerrit_sel[2] & !deng_gerrit_ohsel[1] & !deng_gerrit_ohsel[0];
  assign deng_gerrit_ohsel[3] = deng_gerrit_sel[3] & !deng_gerrit_ohsel[2] & !deng_gerrit_ohsel[1] & !deng_gerrit_ohsel[0];
  assign deng_gerrit_ohsel[4] = deng_gerrit_sel[4] & !deng_gerrit_ohsel[3] & !deng_gerrit_ohsel[2] & !deng_gerrit_ohsel[1] & !deng_gerrit_ohsel[0];

  assign deng_gerrit_def = 
     !deng_gerrit_ohsel[0] & !deng_gerrit_ohsel[1] & !deng_gerrit_ohsel[2] & !deng_gerrit_ohsel[3] & !deng_gerrit_ohsel[4];

  // onehot tristate MUX
  bufif1 (deng_gerrit_tri, deng_gerrit_dat[0], deng_gerrit_ohsel[0]);
  bufif1 (deng_gerrit_tri,!deng_gerrit_dat[1], deng_gerrit_ohsel[1]);
  bufif1 (deng_gerrit_tri, deng_gerrit_dat[2], deng_gerrit_ohsel[2]);
  bufif0 (deng_gerrit_tri,!deng_gerrit_dat[3],!deng_gerrit_ohsel[3]);
  bufif1 (deng_gerrit_tri, deng_gerrit_dat[4], deng_gerrit_ohsel[4]);

  // default value for none-hot
  bufif1 (deng_gerrit_tri,vcc,deng_gerrit_def);
  always @(deng_gerrit_tri) begin
    deng_gerrit = deng_gerrit_tri;
  end

// Vanilla tristate output pin
  bufif0 (echo_zealot, lao_steaming, opus_riddler);  // output,dat,oe

// Tristate output pin with reg feedback
  bufif0 (rerun_might, itchy_rose, nyc_pizza);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(nyc_pizza or rerun_might) begin
    if (!nyc_pizza) ebay_sogood =  rerun_might;
    else ebay_sogood = vcc;
end

reg feedback_pt_406;

always @(burner_mrbill or feedback_pt_406)
  begin
      nigiri_chuck =  burner_mrbill ^  feedback_pt_406;
  end

reg feedback_pt_407;

always @(ready_spirit or feedback_pt_407)
  begin
      nigiri_ford =  ready_spirit &  feedback_pt_407;
  end

reg feedback_pt_408;

always @(covad_pdiddy or feedback_pt_408)
  begin
      lizard_peta =  covad_pdiddy & !feedback_pt_408;
  end

reg feedback_pt_409;

always @(advil_yummy or feedback_pt_409)
  begin
      donald_rescue =  advil_yummy &  feedback_pt_409;
  end

reg feedback_pt_410;

always @(curie_sogood or feedback_pt_410)
  begin
      jupiter_lsd =  curie_sogood |  feedback_pt_410;
  end

reg feedback_pt_411;

always @(marco_thread or feedback_pt_411)
  begin
      kennyg_barney =  marco_thread ^  feedback_pt_411;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      delta_desert <= 0;
    else if (ready_spirit)
      delta_desert <= 0;
    else if (eagle_beef)
      delta_desert <= onion_trevor;
  end

always @(delta_desert)
  begin
      feedback_pt_406 = delta_desert;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      lao_pegasus <= 1;
    else
      lao_pegasus <= hawaii_marco;
  end

always @(lao_pegasus)
  begin
      feedback_pt_407 = lao_pegasus;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      blanket_tonks <= 0;
    else if (elf_killer)
      blanket_tonks <= boitano_boing;
    else if (nigiri_chuck)
      blanket_tonks <= 0;
  end

always @(blanket_tonks)
  begin
      feedback_pt_408 = blanket_tonks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      richard_lovey <= 0;
    else
      richard_lovey <= freaky_pdaddy;
  end

always @(richard_lovey)
  begin
      feedback_pt_409 = richard_lovey;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      pcp_aphid <= 1;
    else
      pcp_aphid <= gnd;
  end

always @(pcp_aphid)
  begin
      feedback_pt_410 = pcp_aphid;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      obiwan_tonks <= 1;
    else
      obiwan_tonks <= ramone_palmer;
  end

always @(obiwan_tonks)
  begin
      feedback_pt_411 = obiwan_tonks;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      gin_golden <= 1;
    else
      gin_golden <= vcc;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      tobe_foiled <= 1;
    else
      tobe_foiled <= gap_greenbay;
  end

wire burner_often_wire;

dffea burner_often_ff (
  .clk(clock0),
  .d(starwars_gyro),
  .ena(egg_wonton),
  .adata(metal_covad),
  .clrn(!reset0),
  .q(burner_often_wire)
);

always @(burner_often_wire) begin
   dweebie_ring = burner_often_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      babette_aphid <= 0;
    else if (foryou_subway)
      babette_aphid <= vcc;
    else if (gin_golden)
      babette_aphid <= 0;
  end

wire lockheed_fire_wire;

dffeas lockheed_fire_ff (
  .clk(clock0),
  .d(parrot_dragon),
  .ena(metal_covad),
  .sclr(show_theseus),
  .sload(gnd),
  .asdata(chillis_cybex),
  .clrn(!reset0),
  .q(lockheed_fire_wire)
);

always @(lockheed_fire_wire) begin
   bagel_shuda = lockheed_fire_wire;
end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      chainsaw_tofu <= 0;
    else if (ham_bacon)
      chainsaw_tofu <= tiger_dimetap;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      spirit_norris <= 0;
    else if (pcp_aphid)
      spirit_norris <= gnd;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      touch_scotch <= 0;
    else
      touch_scotch <= wonder_fronds;
  end

always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      cheez_zedong <= 0;
    else
      cheez_zedong <= kungfu_duey;
  end

reg feedback_pt_412;

always @(lao_steaming or feedback_pt_412)
  begin
      badger_donkey =  lao_steaming |  feedback_pt_412;
  end

reg feedback_pt_413;

always @(burner_mrbill or feedback_pt_413)
  begin
      lizard_donkey = !burner_mrbill |  feedback_pt_413;
  end

reg feedback_pt_414;

always @(curie_sogood or feedback_pt_414)
  begin
      ihilani_vadar = !curie_sogood | !feedback_pt_414;
  end

reg feedback_pt_415;

always @(lao_pegasus or feedback_pt_415)
  begin
      jonas_bep = !lao_pegasus ^ !feedback_pt_415;
  end

reg feedback_pt_416;

always @(burner_mrbill or feedback_pt_416)
  begin
      vangoh_ebay =  burner_mrbill ^  feedback_pt_416;
  end

reg feedback_pt_417;

always @(vcc or feedback_pt_417)
  begin
      fire_boing =  vcc &  feedback_pt_417;
  end

reg feedback_pt_418;

always @(gnd or feedback_pt_418)
  begin
      gap_india = !gnd ^  feedback_pt_418;
  end

reg feedback_pt_419;

always @(tobe_foiled or feedback_pt_419)
  begin
      my_tummy_zi = !tobe_foiled ^  feedback_pt_419;
  end

reg feedback_pt_420;

always @(gnd or feedback_pt_420)
  begin
      jonas_aspirin = !gnd & !feedback_pt_420;
  end

// State Mek timmy_snake Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      timmy_snake <= timmy_snake_0;
    else
      case (timmy_snake)
        timmy_snake_0: begin
          if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 4)
            timmy_snake <= timmy_snake_4;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 2)
            timmy_snake <= timmy_snake_4;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 12)
            timmy_snake <= timmy_snake_3;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 6)
            timmy_snake <= timmy_snake_4;
          else
            timmy_snake <= timmy_snake_0;
          end
        timmy_snake_1: begin
          if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 15)
            timmy_snake <= timmy_snake_3;
          else
            timmy_snake <= timmy_snake_1;
          end
        timmy_snake_2: begin
          if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 9)
            timmy_snake <= timmy_snake_4;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 0)
            timmy_snake <= timmy_snake_4;
          else
            timmy_snake <= timmy_snake_2;
          end
        timmy_snake_3: begin
          if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 1)
            timmy_snake <= timmy_snake_1;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 11)
            timmy_snake <= timmy_snake_2;
          else
            timmy_snake <= timmy_snake_3;
          end
        timmy_snake_4: begin
          if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 2)
            timmy_snake <= timmy_snake_4;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 12)
            timmy_snake <= timmy_snake_4;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 3)
            timmy_snake <= timmy_snake_4;
          else if ({emu_zipporah,gnd,enoch_vangoh,vcc} == 5)
            timmy_snake <= timmy_snake_1;
          else
            timmy_snake <= timmy_snake_4;
          end
        default: timmy_snake <= timmy_snake_0;
      endcase
  end

// State Mek timmy_snake Output logic
always @(timmy_snake)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (timmy_snake[3:1])
        timmy_snake_0: begin
            dirty_cow = 1;
            newt_clothing = 0;
            mickey_willy = 1;
            soccer_moe = 0;
            weasley_hinge = 1;
            bismuth_fire = 0;
            sand_lotus = 1;
            yoku_tonic = 0;
            mexico_atoms = 1;
          end
        timmy_snake_1: begin
            dirty_cow = 0;
            newt_clothing = 0;
            mickey_willy = 0;
            soccer_moe = 0;
            weasley_hinge = 0;
            bismuth_fire = 0;
            sand_lotus = 1;
            yoku_tonic = 1;
            mexico_atoms = 1;
          end
        default: begin
            dirty_cow = 0;
            newt_clothing = 1;
            mickey_willy = 0;
            soccer_moe = 0;
            weasley_hinge = 1;
            bismuth_fire = 0;
            sand_lotus = 1;
            yoku_tonic = 1;
            mexico_atoms = 0;
          end
      endcase
  end

always @(dirty_cow)
  begin
      feedback_pt_412 = dirty_cow;
  end

always @(newt_clothing)
  begin
      feedback_pt_413 = newt_clothing;
  end

always @(mickey_willy)
  begin
      feedback_pt_414 = mickey_willy;
  end

always @(soccer_moe)
  begin
      feedback_pt_415 = soccer_moe;
  end

always @(weasley_hinge)
  begin
      feedback_pt_416 = weasley_hinge;
  end

always @(bismuth_fire)
  begin
      feedback_pt_417 = bismuth_fire;
  end

always @(sand_lotus)
  begin
      feedback_pt_418 = sand_lotus;
  end

always @(yoku_tonic)
  begin
      feedback_pt_419 = yoku_tonic;
  end

always @(mexico_atoms)
  begin
      feedback_pt_420 = mexico_atoms;
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire att_maryann_out;
nut_001_lut #(4) nut_001_lut_inst_att_maryann (
  .din({lizard_peta,gnd,babette_aphid,spastic_todd}),
  .mask(16'b0100000000011100),
  .out(att_maryann_out)
);

always @(att_maryann_out)
begin
   south_curie = att_maryann_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire hinge_questo_out;
nut_001_lut #(4) nut_001_lut_inst_hinge_questo (
  .din({vcc,spirit_norris,chowmein_haze,gnd}),
  .mask(16'hf7f5),
  .out(hinge_questo_out)
);

always @(hinge_questo_out)
begin
   whack_smack = hinge_questo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire victor_cuanto_out;
nut_001_lut #(1) nut_001_lut_inst_victor_cuanto (
  .din({square_hagrid}),
  .mask(2'b00),
  .out(victor_cuanto_out)
);

always @(victor_cuanto_out)
begin
   tsmc_snape = victor_cuanto_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire elephant_gm_out;
nut_001_lut #(3) nut_001_lut_inst_elephant_gm (
  .din({curie_sogood,obiwan_tonks,vcc}),
  .mask(8'h5c),
  .out(elephant_gm_out)
);

always @(elephant_gm_out)
begin
   baron_viagra = elephant_gm_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire ceres_intel_out;
nut_001_lut #(5) nut_001_lut_inst_ceres_intel (
  .din({chillis_cybex,bonker_gonzo,burner_bfi,norbert_goofy,boitano_boing}),
  .mask(32'b00101000010000000101000100000000),
  .out(ceres_intel_out)
);

always @(ceres_intel_out)
begin
   blanket_pilot = ceres_intel_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire mike_lotus_out;
nut_001_lut #(1) nut_001_lut_inst_mike_lotus (
  .din({vcc}),
  .mask(2'b00),
  .out(mike_lotus_out)
);

always @(mike_lotus_out)
begin
   superman_todd = mike_lotus_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire parrot_hippo_out;
nut_001_lut #(3) nut_001_lut_inst_parrot_hippo (
  .din({sanity_hp,badger_donkey,baron_viagra}),
  .mask(8'b01100010),
  .out(parrot_hippo_out)
);

always @(parrot_hippo_out)
begin
   cocacola_milo = parrot_hippo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire acid_tapered_out;
nut_001_lut #(6) nut_001_lut_inst_acid_tapered (
  .din({chillis_cybex,nasdaq_shemp,nigiri_chuck,dweebie_ring,stick_intuit,lupin_gotone}),
  .mask(64'b0000000101010100011111100100000000000001000010000000000001000000),
  .out(acid_tapered_out)
);

always @(acid_tapered_out)
begin
   nyc_rod = acid_tapered_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire crack_kungfu_out;
nut_001_lut #(2) nut_001_lut_inst_crack_kungfu (
  .din({gnd,ihilani_vadar}),
  .mask(4'hc),
  .out(crack_kungfu_out)
);

always @(crack_kungfu_out)
begin
   pepsi_gerard = crack_kungfu_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire fish_itchy_out;
nut_001_lut #(3) nut_001_lut_inst_fish_itchy (
  .din({tobe_foiled,gnd,vangoh_ebay}),
  .mask(8'b10100000),
  .out(fish_itchy_out)
);

always @(fish_itchy_out)
begin
   snape_neptune = fish_itchy_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire dog_charlie_out;
nut_001_lut #(3) nut_001_lut_inst_dog_charlie (
  .din({newt_clothing,gap_greenbay,gnd}),
  .mask(8'b00011100),
  .out(dog_charlie_out)
);

always @(dog_charlie_out)
begin
   star_ernie = dog_charlie_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire turnip_foiled_out;
nut_001_lut #(2) nut_001_lut_inst_turnip_foiled (
  .din({eggsalad_dirk,vcc}),
  .mask(4'b1000),
  .out(turnip_foiled_out)
);

always @(turnip_foiled_out)
begin
   hp_rampacker = turnip_foiled_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire moe_burning_out;
nut_001_lut #(1) nut_001_lut_inst_moe_burning (
  .din({norbert_goofy}),
  .mask(2'b11),
  .out(moe_burning_out)
);

always @(moe_burning_out)
begin
   jason_dirty = moe_burning_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire papa_sun_out;
nut_001_lut #(5) nut_001_lut_inst_papa_sun (
  .din({vcc,bonker_gonzo,chillis_cybex,cheez_zedong,dirty_cow}),
  .mask(32'he8447baa),
  .out(papa_sun_out)
);

always @(papa_sun_out)
begin
   mexican_mike = papa_sun_out;
end

// 7 bit add sub
always @(zen_drugie or wizard_snape or tunafish_duey or whiskey_crank or bono_bonafide or sogood_drax or burner_hurt or gnd or fury_mozart or gnd or gnd or what_booming or sinew_intel or bacon_nest)
  begin
    {killme_arcade,ariel_thedon,crank_mozart,diagon_zebra,sgates_juliet,itchy_oranje,platinum_frog} = 
		({zen_drugie,wizard_snape,tunafish_duey,whiskey_crank,bono_bonafide,sogood_drax,burner_hurt} ^ 11) - 
		({gnd,fury_mozart,gnd,gnd,what_booming,sinew_intel,bacon_nest} ^ 196);
  end

// 7 input 7 output permutation
always @(hulk_doobie or echo_testyour or ykocens_kana or golden_robust or oscar_jupiter or whiskey_bambi or ramone_romex)
  begin
    case ({hulk_doobie,echo_testyour,ykocens_kana,golden_robust,oscar_jupiter,whiskey_bambi,ramone_romex})
      0: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=56;
      1: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=86;
      2: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=34;
      3: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=42;
      4: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=75;
      5: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=88;
      6: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=24;
      7: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=123;
      8: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=90;
      9: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=52;
      10: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=62;
      11: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=16;
      12: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=47;
      13: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=54;
      14: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=57;
      15: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=121;
      16: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=37;
      17: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=83;
      18: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=94;
      19: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=19;
      20: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=32;
      21: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=17;
      22: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=13;
      23: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=28;
      24: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=113;
      25: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=93;
      26: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=45;
      27: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=70;
      28: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=44;
      29: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=82;
      30: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=10;
      31: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=126;
      32: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=61;
      33: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=101;
      34: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=12;
      35: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=18;
      36: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=59;
      37: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=21;
      38: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=112;
      39: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=1;
      40: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=6;
      41: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=3;
      42: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=114;
      43: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=43;
      44: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=122;
      45: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=80;
      46: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=79;
      47: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=74;
      48: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=60;
      49: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=67;
      50: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=30;
      51: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=53;
      52: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=20;
      53: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=8;
      54: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=110;
      55: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=89;
      56: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=63;
      57: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=2;
      58: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=69;
      59: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=81;
      60: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=7;
      61: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=5;
      62: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=115;
      63: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=66;
      64: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=4;
      65: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=85;
      66: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=14;
      67: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=108;
      68: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=27;
      69: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=103;
      70: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=72;
      71: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=125;
      72: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=102;
      73: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=39;
      74: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=73;
      75: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=71;
      76: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=55;
      77: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=64;
      78: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=100;
      79: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=15;
      80: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=31;
      81: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=104;
      82: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=109;
      83: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=76;
      84: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=68;
      85: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=26;
      86: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=0;
      87: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=87;
      88: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=38;
      89: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=11;
      90: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=48;
      91: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=35;
      92: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=107;
      93: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=49;
      94: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=97;
      95: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=95;
      96: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=124;
      97: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=119;
      98: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=77;
      99: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=84;
      100: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=33;
      101: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=118;
      102: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=50;
      103: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=46;
      104: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=9;
      105: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=120;
      106: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=127;
      107: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=25;
      108: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=111;
      109: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=96;
      110: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=116;
      111: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=92;
      112: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=40;
      113: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=41;
      114: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=98;
      115: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=23;
      116: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=106;
      117: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=105;
      118: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=36;
      119: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=58;
      120: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=91;
      121: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=51;
      122: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=29;
      123: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=99;
      124: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=117;
      125: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=22;
      126: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=65;
      127: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=78;
      default: {protest_mine,illegal_dow,kanji_bambi,furnace_kilo,ceres_bach,oranges_loud,curie_aspirin}=0;
    endcase
  end


initial begin
    {master_milo,raiders_louie,knot_picante,sirius_dopey,killer_hanger,china_whacky,kappa_drax} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({gnd,fitter_honey,vcc,vangoh_dadada,vcc,vegan_lupin,chevys_mexico} < {bacon_drugs,vcc,bolt_kabar,boots_macys,roid_broom,star_arthur,turnip_deng})
       {master_milo,raiders_louie,knot_picante,sirius_dopey,killer_hanger,china_whacky,kappa_drax} <= {bacon_drugs,vcc,bolt_kabar,boots_macys,roid_broom,star_arthur,turnip_deng};
    else
       {master_milo,raiders_louie,knot_picante,sirius_dopey,killer_hanger,china_whacky,kappa_drax} <= {gnd,fitter_honey,vcc,vangoh_dadada,vcc,vegan_lupin,chevys_mexico};
  end

// 72 bit shift register
reg [71:0] often_surfer;

initial begin
    often_surfer = 0;
end

always @(posedge clock1)
begin
    often_surfer <= (often_surfer << 1) | acid_muffin;
end

// shift taps every 4 bits
always @(often_surfer)
begin
    elguapo_ghost = often_surfer[71];
    tattoo_bloom = often_surfer[67];
    salmon_badger = often_surfer[63];
    fire_hiswife = often_surfer[59];
    chips_jacuzzi = often_surfer[55];
    rodent_south = often_surfer[51];
    iceland_egg = often_surfer[47];
    would_husks = often_surfer[43];
    kbtoys_pepsi = often_surfer[39];
    jacob_ulysses = often_surfer[35];
    vicks_bach = often_surfer[31];
    uniform_crank = often_surfer[27];
    Iwin_neon = often_surfer[23];
    spirit_loser = often_surfer[19];
    roe_lad = often_surfer[15];
    george_soccer = often_surfer[11];
    tiger_eagle = often_surfer[7];
    zulu_satanist = often_surfer[3];
end

always @(jupiter_lsd)
  begin
      huey_banality = !jupiter_lsd;
  end

always @(tsmc_snape)
  begin
      saturn_iguana = !tsmc_snape;
  end

always @(itchy_oranje)
  begin
      yak_edible = !itchy_oranje;
  end

always @(often_onthepc)
  begin
      ham_vadar = !often_onthepc;
  end

always @(lao_pegasus)
  begin
      boitano_romeo = !lao_pegasus;
  end

always @(tiger_eagle)
  begin
      often_crack = !tiger_eagle;
  end

always @(uniform_crank)
  begin
      star_tylenol = !uniform_crank;
  end

always @(lao_pegasus)
  begin
      dingbat_lad = !lao_pegasus;
  end

always @(chainsaw_tofu)
  begin
      psycho_goofy = !chainsaw_tofu;
  end

always @(vcc)
  begin
      mushroom_east = !vcc;
  end

always @(china_whacky)
  begin
      howell_hans = !china_whacky;
  end

always @(wonder_fronds)
  begin
      Iwin_intuit = !wonder_fronds;
  end

always @(gnd)
  begin
      zen_loud = !gnd;
  end

always @(dingbat_lad)
  begin
      iron_wonton = !dingbat_lad;
  end

always @(illegal_dow)
  begin
      pirate_flew = !illegal_dow;
  end

always @(gnd)
  begin
      crab_iterate = !gnd;
  end

always @(dig_fsncens)
  begin
      hawaii_turnip = !dig_fsncens;
  end

always @(crab_iterate)
  begin
      green_eeevil = !crab_iterate;
  end

always @(vcc)
  begin
      rescue_hp = !vcc;
  end

always @(delta_desert)
  begin
      touch_neptune = !delta_desert;
  end

always @(diagon_zebra)
  begin
      foxtrot_honda = !diagon_zebra;
  end

always @(saturn_iguana)
  begin
      happy_bear = !saturn_iguana;
  end

always @(fire_boing)
  begin
      dutch_victor = !fire_boing;
  end

wire hurt_pluto_outwire;
lcell loud_romulus (roe_lad,hurt_pluto_outwire);

always @(hurt_pluto_outwire)
begin
  hurt_pluto = hurt_pluto_outwire;
end

wire mouse_icarus_outwire;
exp iterate_south (rescue_hp,mouse_icarus_outwire);

always @(mouse_icarus_outwire)
begin
  mouse_icarus = mouse_icarus_outwire;
end

wire homer_donkey_outwire;
soft kaisha_yak (would_husks,homer_donkey_outwire);

always @(homer_donkey_outwire)
begin
  homer_donkey = homer_donkey_outwire;
end

wire shrimp_eagle_outwire;
exp ceres_whale (dweebie_ring,shrimp_eagle_outwire);

always @(shrimp_eagle_outwire)
begin
  shrimp_eagle = shrimp_eagle_outwire;
end

wire often_faster_outwire, palm_what_outwire;
carry_sum jacques_bach (.sin(ham_vadar),.cin(vcc),.sout(often_faster_outwire),.cout(palm_what_outwire));

always @(often_faster_outwire or palm_what_outwire)
begin
  often_faster = often_faster_outwire;
  palm_what = palm_what_outwire;
end

wire whiskey_egg_outwire, lion_sheep_outwire;
carry_sum ladder_zinc (.sin(gnd),.cin(curie_sogood),.sout(whiskey_egg_outwire),.cout(lion_sheep_outwire));

always @(whiskey_egg_outwire or lion_sheep_outwire)
begin
  whiskey_egg = whiskey_egg_outwire;
  lion_sheep = lion_sheep_outwire;
end

wire muffin_joseph_outwire;
lcell cheese_ebi (jonas_bep,muffin_joseph_outwire);

always @(muffin_joseph_outwire)
begin
  muffin_joseph = muffin_joseph_outwire;
end

wire tuna_bracket_outwire;
soft balloon_yoku (tattoo_bloom,tuna_bracket_outwire);

always @(tuna_bracket_outwire)
begin
  tuna_bracket = tuna_bracket_outwire;
end

wire arcade_chuck_outwire;
soft mao_willem (furnace_kilo,arcade_chuck_outwire);

always @(arcade_chuck_outwire)
begin
  arcade_chuck = arcade_chuck_outwire;
end

reg feedback_pt_421;

always @(homer_donkey or feedback_pt_421)
  begin
      malfoy_bull = !homer_donkey ^ !feedback_pt_421;
  end

reg feedback_pt_422;

always @(psycho_goofy or feedback_pt_422)
  begin
      dirk_charlie =  psycho_goofy ^  feedback_pt_422;
  end

reg feedback_pt_423;

always @(star_tylenol or feedback_pt_423)
  begin
      prison_star = !star_tylenol |  feedback_pt_423;
  end

reg feedback_pt_424;

always @(shrimp_eagle or feedback_pt_424)
  begin
      broom_kabar =  shrimp_eagle |  feedback_pt_424;
  end

reg feedback_pt_425;

always @(south_curie or feedback_pt_425)
  begin
      dragon_golf = !south_curie &  feedback_pt_425;
  end

reg feedback_pt_426;

always @(vicks_bach or feedback_pt_426)
  begin
      atilla_hans =  vicks_bach |  feedback_pt_426;
  end

reg feedback_pt_427;

always @(gnd or feedback_pt_427)
  begin
      golden_fallen =  gnd |  feedback_pt_427;
  end

reg feedback_pt_428;

always @(kanji_bambi or feedback_pt_428)
  begin
      fufu_mandarin = !kanji_bambi &  feedback_pt_428;
  end

reg feedback_pt_429;

always @(vcc or feedback_pt_429)
  begin
      ohno_minnow =  vcc ^ !feedback_pt_429;
  end

reg feedback_pt_430;

always @(sirius_dopey or feedback_pt_430)
  begin
      happy_deuce =  sirius_dopey | !feedback_pt_430;
  end

reg feedback_pt_431;

always @(sand_lotus or feedback_pt_431)
  begin
      cybex_moe = !sand_lotus & !feedback_pt_431;
  end

reg feedback_pt_432;

always @(howell_hans or feedback_pt_432)
  begin
      peace_tin = !howell_hans | !feedback_pt_432;
  end

reg feedback_pt_433;

always @(gnd or feedback_pt_433)
  begin
      lovey_guy = !gnd ^  feedback_pt_433;
  end

reg feedback_pt_434;

always @(gnd or feedback_pt_434)
  begin
      whammy_armand = !gnd & !feedback_pt_434;
  end

reg feedback_pt_435;

always @(boitano_romeo or feedback_pt_435)
  begin
      sanity_beast = !boitano_romeo |  feedback_pt_435;
  end

reg feedback_pt_436;

always @(lao_steaming or feedback_pt_436)
  begin
      kungfu_itchy = !lao_steaming ^  feedback_pt_436;
  end

reg feedback_pt_437;

always @(gnd or feedback_pt_437)
  begin
      platinum_crab = !gnd |  feedback_pt_437;
  end

reg feedback_pt_438;

always @(vcc or feedback_pt_438)
  begin
      goat_wujing = !vcc |  feedback_pt_438;
  end

wire sand_wanton_wire;

dffea sand_wanton_ff (
  .clk(clock1),
  .d(vcc),
  .ena(vangoh_ebay),
  .adata(gnd),
  .clrn(!reset1),
  .q(sand_wanton_wire)
);

always @(sand_wanton_wire) begin
   athena_arthur = sand_wanton_wire;
end

always @(athena_arthur)
  begin
      feedback_pt_421 = athena_arthur;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_marvin <= 0;
    else
      stix_marvin <= saturn_iguana;
  end

always @(stix_marvin)
  begin
      feedback_pt_422 = stix_marvin;
  end

always @(stix_marvin)
  begin
      feedback_pt_423 = stix_marvin;
  end

always @(stix_marvin)
  begin
      feedback_pt_424 = stix_marvin;
  end

always @(stix_marvin)
  begin
      feedback_pt_425 = stix_marvin;
  end

always @(stix_marvin)
  begin
      feedback_pt_426 = stix_marvin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neon_xuprocar <= 1;
    else
      neon_xuprocar <= bismuth_fire;
  end

always @(neon_xuprocar)
  begin
      feedback_pt_427 = neon_xuprocar;
  end

always @(neon_xuprocar)
  begin
      feedback_pt_428 = neon_xuprocar;
  end

always @(neon_xuprocar)
  begin
      feedback_pt_429 = neon_xuprocar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      broom_oranje <= 0;
    else if (whack_smack)
      broom_oranje <= itchy_oranje;
    else if (vcc)
      broom_oranje <= 0;
  end

always @(broom_oranje)
  begin
      feedback_pt_430 = broom_oranje;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maklak_gyro <= 1;
    else
      maklak_gyro <= donald_rescue;
  end

always @(maklak_gyro)
  begin
      feedback_pt_431 = maklak_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      schwinger_bfs <= 0;
    else if (touch_scotch)
      schwinger_bfs <= vcc;
    else if (vcc)
      schwinger_bfs <= 0;
  end

always @(schwinger_bfs)
  begin
      feedback_pt_432 = schwinger_bfs;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hiswife_zinc <= 0;
    else if (obiwan_tonks)
      hiswife_zinc <= happy_deuce;
  end

always @(hiswife_zinc)
  begin
      feedback_pt_433 = hiswife_zinc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_martian <= 0;
    else
      lala_martian <= stick_intuit;
  end

always @(lala_martian)
  begin
      feedback_pt_434 = lala_martian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oracle_pixie <= 0;
    else if (blanket_pilot)
      oracle_pixie <= vcc;
  end

always @(oracle_pixie)
  begin
      feedback_pt_435 = oracle_pixie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_unicorn <= 0;
    else if (mexican_mike)
      stix_unicorn <= 0;
    else if (hp_rampacker)
      stix_unicorn <= Iwin_intuit;
  end

always @(stix_unicorn)
  begin
      feedback_pt_436 = stix_unicorn;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ham_faster <= 0;
    else
      ham_faster <= would_husks;
  end

always @(ham_faster)
  begin
      feedback_pt_437 = ham_faster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marge_uppers <= 0;
    else if (fire_boing)
      marge_uppers <= nyc_rod;
    else if (kungfu_elian)
      marge_uppers <= 0;
  end

always @(marge_uppers)
  begin
      feedback_pt_438 = marge_uppers;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_theonion <= 0;
    else if (raiders_louie)
      due_theonion <= 0;
    else if (gnd)
      due_theonion <= gnd;
  end

wire peta_willy_wire;

dffeas peta_willy_ff (
  .clk(clock1),
  .d(gnd),
  .ena(master_milo),
  .sclr(vcc),
  .sload(nasdaq_shemp),
  .asdata(spirit_loser),
  .clrn(!reset1),
  .q(peta_willy_wire)
);

always @(peta_willy_wire) begin
   penguin_genji = peta_willy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sinew_rodent <= 0;
    else if (bear_speedyg)
      sinew_rodent <= 0;
    else if (vcc)
      sinew_rodent <= palm_what;
  end

wire tobe_davidlin_wire;

dffeas tobe_davidlin_ff (
  .clk(clock1),
  .d(muffin_joseph),
  .ena(opus_liberace),
  .sclr(protest_mine),
  .sload(yoku_tonic),
  .asdata(whack_smack),
  .clrn(!reset1),
  .q(tobe_davidlin_wire)
);

always @(tobe_davidlin_wire) begin
   llama_tobiko = tobe_davidlin_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      louie_mideast <= 1;
    else
      louie_mideast <= jacob_ulysses;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      warlock_rod <= 0;
    else if (muffin_joseph)
      warlock_rod <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zhuang_often <= 0;
    else
      zhuang_often <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_obiwan <= 0;
    else if (lala_martian)
      star_obiwan <= mexico_atoms;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      star_yoku <= 1;
    else
      star_yoku <= blanket_tonks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jcrew_chips <= 0;
    else if (elf_east)
      jcrew_chips <= 0;
    else if (superman_todd)
      jcrew_chips <= kbtoys_pepsi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_pluto <= 0;
    else
      fronds_pluto <= golden_fallen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burning_tesla <= 1;
    else
      burning_tesla <= tuna_bracket;
  end

wire gopher_thread_wire;

dffeas gopher_thread_ff (
  .clk(clock1),
  .d(gnd),
  .ena(badger_donkey),
  .sclr(newt_clothing),
  .sload(vcc),
  .asdata(louie_mideast),
  .clrn(!reset1),
  .q(gopher_thread_wire)
);

always @(gopher_thread_wire) begin
   bear_golf = gopher_thread_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ozzy_doc <= 0;
    else if (weasley_hinge)
      ozzy_doc <= 0;
    else if (float_floo)
      ozzy_doc <= babette_aphid;
  end

wire bagel_rubik_wire;

dffeas bagel_rubik_ff (
  .clk(clock1),
  .d(fire_hiswife),
  .ena(sinew_rodent),
  .sclr(marge_uppers),
  .sload(warlock_rod),
  .asdata(blanket_tonks),
  .clrn(!reset1),
  .q(bagel_rubik_wire)
);

always @(bagel_rubik_wire) begin
   gm_school = bagel_rubik_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rescue_george <= 0;
    else
      rescue_george <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      newt_devotion <= 0;
    else if (sanity_beast)
      newt_devotion <= 0;
    else if (vcc)
      newt_devotion <= huey_banality;
  end

wire plumber_fish_wire;

dffeas plumber_fish_ff (
  .clk(clock1),
  .d(star_yoku),
  .ena(often_faster),
  .sclr(vcc),
  .sload(vcc),
  .asdata(ham_faster),
  .clrn(!reset1),
  .q(plumber_fish_wire)
);

always @(plumber_fish_wire) begin
   todd_beavis = plumber_fish_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stix_iterate <= 0;
    else if (george_soccer)
      stix_iterate <= 0;
    else if (gnd)
      stix_iterate <= fronds_pluto;
  end

wire iron_lizard_wire;

dffea iron_lizard_ff (
  .clk(clock1),
  .d(knot_picante),
  .ena(sanity_beast),
  .adata(often_crack),
  .clrn(!reset1),
  .q(iron_lizard_wire)
);

always @(iron_lizard_wire) begin
   tonks_england = iron_lizard_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugs_ozzy <= 0;
    else
      drugs_ozzy <= chips_jacuzzi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killme_larry <= 0;
    else if (often_master)
      killme_larry <= 0;
    else if (jcrew_chips)
      killme_larry <= richard_lovey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arcade_ritsu <= 0;
    else if (killme_arcade)
      arcade_ritsu <= badger_donkey;
    else if (gm_school)
      arcade_ritsu <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      waster_beetle <= 0;
    else
      waster_beetle <= rescue_hp;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_dirk <= 0;
    else if (killer_hanger)
      meth_dirk <= curie_aspirin;
    else if (bear_speedyg)
      meth_dirk <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kabar_tabby <= 1;
    else
      kabar_tabby <= starwars_gyro;
  end

reg feedback_pt_439;

always @(sand_lotus or feedback_pt_439)
  begin
      rod_wiggles = !sand_lotus ^ !feedback_pt_439;
  end

reg feedback_pt_440;

always @(vcc or feedback_pt_440)
  begin
      raiders_bart = !vcc ^ !feedback_pt_440;
  end

reg feedback_pt_441;

always @(float_floo or feedback_pt_441)
  begin
      air_gutter =  float_floo |  feedback_pt_441;
  end

reg feedback_pt_442;

always @(tonks_england or feedback_pt_442)
  begin
      air_wildboar = !tonks_england |  feedback_pt_442;
  end

reg feedback_pt_443;

always @(palmer_dadada or feedback_pt_443)
  begin
      sinew_ghost =  palmer_dadada &  feedback_pt_443;
  end

reg feedback_pt_444;

always @(soccer_moe or feedback_pt_444)
  begin
      remus_fallen =  soccer_moe & !feedback_pt_444;
  end

reg feedback_pt_445;

always @(platinum_crab or feedback_pt_445)
  begin
      tango_ykocens = !platinum_crab & !feedback_pt_445;
  end

reg feedback_pt_446;

always @(vcc or feedback_pt_446)
  begin
      maki_unicorn =  vcc |  feedback_pt_446;
  end

reg feedback_pt_447;

always @(vcc or feedback_pt_447)
  begin
      parrot_east = !vcc ^  feedback_pt_447;
  end

reg feedback_pt_448;

always @(gnd or feedback_pt_448)
  begin
      rouge_plaster =  gnd |  feedback_pt_448;
  end

reg feedback_pt_449;

always @(kungfu_itchy or feedback_pt_449)
  begin
      powder_ariel =  kungfu_itchy ^ !feedback_pt_449;
  end

reg feedback_pt_450;

always @(elguapo_ghost or feedback_pt_450)
  begin
      ants_edible = !elguapo_ghost & !feedback_pt_450;
  end

reg feedback_pt_451;

always @(square_cubish or feedback_pt_451)
  begin
      bert_kaisha = !square_cubish ^ !feedback_pt_451;
  end

reg feedback_pt_452;

always @(dutch_victor or feedback_pt_452)
  begin
      dipsy_odin =  dutch_victor |  feedback_pt_452;
  end

reg feedback_pt_453;

always @(hiswife_zinc or feedback_pt_453)
  begin
      rubeus_acid =  hiswife_zinc ^ !feedback_pt_453;
  end

reg feedback_pt_454;

always @(psycho_goofy or feedback_pt_454)
  begin
      nest_cow = !psycho_goofy ^ !feedback_pt_454;
  end

reg feedback_pt_455;

always @(badger_donkey or feedback_pt_455)
  begin
      sears_rerun = !badger_donkey &  feedback_pt_455;
  end

reg feedback_pt_456;

always @(gnd or feedback_pt_456)
  begin
      arthur_att =  gnd &  feedback_pt_456;
  end

reg feedback_pt_457;

always @(arcade_chuck or feedback_pt_457)
  begin
      pirate_joseph =  arcade_chuck ^ !feedback_pt_457;
  end

reg feedback_pt_458;

always @(tsmc_snape or feedback_pt_458)
  begin
      newt_cheese =  tsmc_snape ^ !feedback_pt_458;
  end

reg feedback_pt_459;

always @(kabar_tabby or feedback_pt_459)
  begin
      green_bep =  kabar_tabby ^  feedback_pt_459;
  end

reg feedback_pt_460;

always @(goat_wujing or feedback_pt_460)
  begin
      draco_salmon =  goat_wujing ^  feedback_pt_460;
  end

reg feedback_pt_461;

always @(sinew_ghost or feedback_pt_461)
  begin
      lion_grumby =  sinew_ghost &  feedback_pt_461;
  end

reg feedback_pt_462;

always @(cocacola_milo or feedback_pt_462)
  begin
      butthead_duey = !cocacola_milo ^  feedback_pt_462;
  end

reg feedback_pt_463;

always @(vcc or feedback_pt_463)
  begin
      mars_turkey =  vcc ^ !feedback_pt_463;
  end

reg feedback_pt_464;

always @(kungfu_itchy or feedback_pt_464)
  begin
      oscar_cheez = !kungfu_itchy |  feedback_pt_464;
  end

reg feedback_pt_465;

always @(gnd or feedback_pt_465)
  begin
      hippo_lao =  gnd & !feedback_pt_465;
  end

reg feedback_pt_466;

always @(bert_kaisha or feedback_pt_466)
  begin
      bravo_sapporo =  bert_kaisha ^  feedback_pt_466;
  end

reg feedback_pt_467;

always @(mickey_willy or feedback_pt_467)
  begin
      leaky_mortar =  mickey_willy &  feedback_pt_467;
  end

reg feedback_pt_468;

always @(tango_ykocens or feedback_pt_468)
  begin
      egg_abel =  tango_ykocens ^ !feedback_pt_468;
  end

reg feedback_pt_469;

always @(star_ernie or feedback_pt_469)
  begin
      xterm_sierra = !star_ernie &  feedback_pt_469;
  end

reg feedback_pt_470;

always @(vcc or feedback_pt_470)
  begin
      tobe_ants =  vcc |  feedback_pt_470;
  end

reg feedback_pt_471;

always @(bear_golf or feedback_pt_471)
  begin
      zebra_bubba = !bear_golf &  feedback_pt_471;
  end

reg feedback_pt_472;

always @(neon_xuprocar or feedback_pt_472)
  begin
      hans_voodoo = !neon_xuprocar |  feedback_pt_472;
  end

reg feedback_pt_473;

always @(starwars_gyro or feedback_pt_473)
  begin
      Iwin_ladder =  starwars_gyro &  feedback_pt_473;
  end

reg feedback_pt_474;

always @(waster_beetle or feedback_pt_474)
  begin
      rat_solder = !waster_beetle |  feedback_pt_474;
  end

reg feedback_pt_475;

always @(prison_star or feedback_pt_475)
  begin
      escape_rojas =  prison_star ^ !feedback_pt_475;
  end

reg feedback_pt_476;

always @(zulu_satanist or feedback_pt_476)
  begin
      spyro_might =  zulu_satanist | !feedback_pt_476;
  end

reg feedback_pt_477;

always @(fufu_mandarin or feedback_pt_477)
  begin
      sun_mrbill = !fufu_mandarin | !feedback_pt_477;
  end

reg feedback_pt_478;

always @(hurt_pluto or feedback_pt_478)
  begin
      south_aspirin = !hurt_pluto ^ !feedback_pt_478;
  end

reg feedback_pt_479;

always @(gnd or feedback_pt_479)
  begin
      togos_haze =  gnd &  feedback_pt_479;
  end

reg feedback_pt_480;

always @(vcc or feedback_pt_480)
  begin
      papyrus_huey = !vcc ^  feedback_pt_480;
  end

reg feedback_pt_481;

always @(gnd or feedback_pt_481)
  begin
      heidi_crank = !gnd &  feedback_pt_481;
  end

reg feedback_pt_482;

always @(newt_cheese or feedback_pt_482)
  begin
      sinew_gulp =  newt_cheese & !feedback_pt_482;
  end

reg feedback_pt_483;

always @(salmon_badger or feedback_pt_483)
  begin
      turkey_sanity =  salmon_badger | !feedback_pt_483;
  end

reg feedback_pt_484;

always @(star_tylenol or feedback_pt_484)
  begin
      lovey_ring = !star_tylenol | !feedback_pt_484;
  end

reg feedback_pt_485;

always @(richard_lovey or feedback_pt_485)
  begin
      sun_larry = !richard_lovey |  feedback_pt_485;
  end

reg feedback_pt_486;

always @(meth_dirk or feedback_pt_486)
  begin
      turtle_kilo =  meth_dirk & !feedback_pt_486;
  end

reg feedback_pt_487;

always @(burning_tesla or feedback_pt_487)
  begin
      fang_honda =  burning_tesla | !feedback_pt_487;
  end

reg feedback_pt_488;

always @(vcc or feedback_pt_488)
  begin
      snort_nasdaq = !vcc &  feedback_pt_488;
  end

reg feedback_pt_489;

always @(foxtrot_honda or feedback_pt_489)
  begin
      charlie_ariel =  foxtrot_honda & !feedback_pt_489;
  end

  always@(*)
  begin
    mandarin_bfs = ~( ~( ( ~( ~( gnd ) ) & ~( vcc ) ^ ~( deng_gerrit ) ) ) ) ? ~( ~( ~( ~( ~( sun_larry ) ) ) ) ) : ~( ~( ( ~( ( ~( ~dragon_golf ^ killme_larry ) ) ^ jason_dirty ) ) ) ) & ( ( ~( ~( bravo_sapporo ) ) | ( ~( hurt_pluto ^ ~heidi_crank ) ) ^ ~( xterm_sierra ) ) & ~( ~( Iwin_ladder ^ ozzy_doc ) ) );
  end
// 4 to 5 bit A*Const mult
reg  [3:0] desert_albus;
always @(cheez_zedong or huey_banality or sinew_rodent or louie_mideast) begin
  desert_albus = {cheez_zedong,huey_banality,sinew_rodent,louie_mideast};
end

always @(desert_albus)
  begin
      {zeus_po,yellow_victor,crab_popcorn,fufu_bono,money_delta} = 
	  	  desert_albus * 
		  225;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      doobie_macys <= 0;
    else
    case ({jonas_aspirin,iron_wonton})
       0 : doobie_macys <= snort_nasdaq;
       1 : doobie_macys <= spastic_todd;
       2 : doobie_macys <= doobie_macys;
       3 : doobie_macys <= often_crack;
       default : doobie_macys <= 0;
    endcase
  end

always @(doobie_macys)
  begin
      feedback_pt_439 = doobie_macys;
  end

always @(doobie_macys)
  begin
      feedback_pt_440 = doobie_macys;
  end

always @(doobie_macys)
  begin
      feedback_pt_441 = doobie_macys;
  end

always @(doobie_macys)
  begin
      feedback_pt_442 = doobie_macys;
  end

always @(doobie_macys)
  begin
      feedback_pt_443 = doobie_macys;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_vangoh <= 0;
    else
    case ({marge_uppers,oscar_cheez})
       0 : fufu_vangoh <= gnd;
       1 : fufu_vangoh <= zeus_po;
       2 : fufu_vangoh <= fufu_vangoh;
       3 : fufu_vangoh <= newt_devotion;
       default : fufu_vangoh <= 0;
    endcase
  end

always @(fufu_vangoh)
  begin
      feedback_pt_444 = fufu_vangoh;
  end

always @(fufu_vangoh)
  begin
      feedback_pt_445 = fufu_vangoh;
  end

always @(fufu_vangoh)
  begin
      feedback_pt_446 = fufu_vangoh;
  end

always @(fufu_vangoh)
  begin
      feedback_pt_447 = fufu_vangoh;
  end

reg feedback_pt_490;

always @(pirate_joseph or feedback_pt_490)
  begin
      lala_sanity = !pirate_joseph & !feedback_pt_490;
  end

reg feedback_pt_491;

always @(lizard_donkey or feedback_pt_491)
  begin
      kilo_marge = !lizard_donkey |  feedback_pt_491;
  end

reg feedback_pt_492;

always @(penguin_genji or feedback_pt_492)
  begin
      sinew_wine =  penguin_genji | !feedback_pt_492;
  end

reg feedback_pt_493;

always @(vcc or feedback_pt_493)
  begin
      bagel_howell = !vcc ^  feedback_pt_493;
  end

reg feedback_pt_494;

always @(vcc or feedback_pt_494)
  begin
      meth_athena =  vcc ^  feedback_pt_494;
  end

reg feedback_pt_495;

always @(kilo_marge or feedback_pt_495)
  begin
      hector_mao = !kilo_marge |  feedback_pt_495;
  end

reg feedback_pt_496;

always @(south_aspirin or feedback_pt_496)
  begin
      spock_webvan = !south_aspirin &  feedback_pt_496;
  end

reg feedback_pt_497;

always @(todd_beavis or feedback_pt_497)
  begin
      rat_fsncens = !todd_beavis & !feedback_pt_497;
  end

reg feedback_pt_498;

always @(powder_ariel or feedback_pt_498)
  begin
      chillis_fish = !powder_ariel ^  feedback_pt_498;
  end

reg feedback_pt_499;

always @(sun_mrbill or feedback_pt_499)
  begin
      bart_speed =  sun_mrbill |  feedback_pt_499;
  end

reg feedback_pt_500;

always @(vcc or feedback_pt_500)
  begin
      coconut_witch = !vcc |  feedback_pt_500;
  end

reg feedback_pt_501;

always @(turtle_kilo or feedback_pt_501)
  begin
      mouse_ghost =  turtle_kilo &  feedback_pt_501;
  end

reg feedback_pt_502;

always @(gnd or feedback_pt_502)
  begin
      bagel_atomic =  gnd & !feedback_pt_502;
  end

reg feedback_pt_503;

always @(coconut_witch or feedback_pt_503)
  begin
      books_rodent =  coconut_witch | !feedback_pt_503;
  end

reg feedback_pt_504;

always @(lovey_guy or feedback_pt_504)
  begin
      bush_uppers =  lovey_guy ^  feedback_pt_504;
  end

reg feedback_pt_505;

always @(gnd or feedback_pt_505)
  begin
      lamer_fear =  gnd | !feedback_pt_505;
  end

reg feedback_pt_506;

always @(air_gutter or feedback_pt_506)
  begin
      midas_dirty = !air_gutter | !feedback_pt_506;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turtle_life <= 0;
    else if (green_bep)
      turtle_life <= louie_mideast;
    else if (lion_grumby)
      turtle_life <= 0;
  end

always @(turtle_life)
  begin
      feedback_pt_448 = turtle_life;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ibm_fsncens <= 0;
    else if (star_obiwan)
      ibm_fsncens <= psycho_goofy;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_449 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_450 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_451 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_452 = ibm_fsncens;
  end

always @(ibm_fsncens)
  begin
      feedback_pt_453 = ibm_fsncens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      north_pacbell <= 1;
    else
      north_pacbell <= platinum_frog;
  end

always @(north_pacbell)
  begin
      feedback_pt_454 = north_pacbell;
  end

always @(north_pacbell)
  begin
      feedback_pt_455 = north_pacbell;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      black_yoku <= 0;
    else if (lamer_fear)
      black_yoku <= mouse_ghost;
    else if (Iwin_neon)
      black_yoku <= 0;
  end

always @(black_yoku)
  begin
      feedback_pt_456 = black_yoku;
  end

always @(black_yoku)
  begin
      feedback_pt_457 = black_yoku;
  end

always @(black_yoku)
  begin
      feedback_pt_458 = black_yoku;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hummer_potter <= 0;
    else
      hummer_potter <= killme_larry;
  end

always @(hummer_potter)
  begin
      feedback_pt_459 = hummer_potter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nobody_ebi <= 1;
    else
      nobody_ebi <= mars_turkey;
  end

always @(nobody_ebi)
  begin
      feedback_pt_460 = nobody_ebi;
  end

always @(nobody_ebi)
  begin
      feedback_pt_461 = nobody_ebi;
  end

always @(nobody_ebi)
  begin
      feedback_pt_462 = nobody_ebi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pdaddy_willy <= 0;
    else if (vcc)
      pdaddy_willy <= 0;
    else if (vcc)
      pdaddy_willy <= bush_uppers;
  end

always @(pdaddy_willy)
  begin
      feedback_pt_463 = pdaddy_willy;
  end

always @(pdaddy_willy)
  begin
      feedback_pt_464 = pdaddy_willy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tako_handroll <= 1;
    else
      tako_handroll <= vcc;
  end

always @(tako_handroll)
  begin
      feedback_pt_465 = tako_handroll;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_platypus <= 0;
    else if (gnd)
      meth_platypus <= 0;
    else if (rod_wiggles)
      meth_platypus <= yellow_victor;
  end

always @(meth_platypus)
  begin
      feedback_pt_466 = meth_platypus;
  end

always @(meth_platypus)
  begin
      feedback_pt_467 = meth_platypus;
  end

always @(meth_platypus)
  begin
      feedback_pt_468 = meth_platypus;
  end

always @(meth_platypus)
  begin
      feedback_pt_469 = meth_platypus;
  end

always @(meth_platypus)
  begin
      feedback_pt_470 = meth_platypus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sugar_newt <= 0;
    else if (foxtrot_honda)
      sugar_newt <= 0;
    else if (vcc)
      sugar_newt <= meth_dirk;
  end

always @(sugar_newt)
  begin
      feedback_pt_471 = sugar_newt;
  end

always @(sugar_newt)
  begin
      feedback_pt_472 = sugar_newt;
  end

wire jacuzzi_tabby_wire;

dffeas jacuzzi_tabby_ff (
  .clk(clock1),
  .d(mouse_icarus),
  .ena(my_tummy_zi),
  .sclr(gnd),
  .sload(lovey_ring),
  .asdata(rubeus_acid),
  .clrn(!reset1),
  .q(jacuzzi_tabby_wire)
);

always @(jacuzzi_tabby_wire) begin
   joseph_hoser = jacuzzi_tabby_wire;
end

always @(joseph_hoser)
  begin
      feedback_pt_473 = joseph_hoser;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      macys_neptune <= 0;
    else if (waster_beetle)
      macys_neptune <= vcc;
  end

always @(macys_neptune)
  begin
      feedback_pt_474 = macys_neptune;
  end

always @(macys_neptune)
  begin
      feedback_pt_475 = macys_neptune;
  end

always @(macys_neptune)
  begin
      feedback_pt_476 = macys_neptune;
  end

always @(macys_neptune)
  begin
      feedback_pt_477 = macys_neptune;
  end

always @(macys_neptune)
  begin
      feedback_pt_478 = macys_neptune;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stroop_bart <= 1;
    else
      stroop_bart <= vcc;
  end

always @(stroop_bart)
  begin
      feedback_pt_479 = stroop_bart;
  end

always @(stroop_bart)
  begin
      feedback_pt_480 = stroop_bart;
  end

always @(stroop_bart)
  begin
      feedback_pt_481 = stroop_bart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      maryann_hotel <= 0;
    else if (ariel_thedon)
      maryann_hotel <= bart_speed;
    else if (starwars_gyro)
      maryann_hotel <= 0;
  end

always @(maryann_hotel)
  begin
      feedback_pt_482 = maryann_hotel;
  end

always @(maryann_hotel)
  begin
      feedback_pt_483 = maryann_hotel;
  end

always @(maryann_hotel)
  begin
      feedback_pt_484 = maryann_hotel;
  end

always @(maryann_hotel)
  begin
      feedback_pt_485 = maryann_hotel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tracy_gyro <= 0;
    else if (escape_rojas)
      tracy_gyro <= 0;
    else if (mouse_icarus)
      tracy_gyro <= cocacola_milo;
  end

always @(tracy_gyro)
  begin
      feedback_pt_486 = tracy_gyro;
  end

always @(tracy_gyro)
  begin
      feedback_pt_487 = tracy_gyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_bolt <= 1;
    else
      due_bolt <= vcc;
  end

always @(due_bolt)
  begin
      feedback_pt_488 = due_bolt;
  end

always @(due_bolt)
  begin
      feedback_pt_489 = due_bolt;
  end

always @(due_bolt)
  begin
      feedback_pt_490 = due_bolt;
  end

always @(due_bolt)
  begin
      feedback_pt_491 = due_bolt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kennyg_tracy <= 1;
    else
      kennyg_tracy <= rouge_plaster;
  end

always @(kennyg_tracy)
  begin
      feedback_pt_492 = kennyg_tracy;
  end

always @(kennyg_tracy)
  begin
      feedback_pt_493 = kennyg_tracy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      genji_fuji <= 1;
    else
      genji_fuji <= dipsy_odin;
  end

always @(genji_fuji)
  begin
      feedback_pt_494 = genji_fuji;
  end

always @(genji_fuji)
  begin
      feedback_pt_495 = genji_fuji;
  end

always @(genji_fuji)
  begin
      feedback_pt_496 = genji_fuji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_waster <= 0;
    else
      pcp_waster <= gnd;
  end

always @(pcp_waster)
  begin
      feedback_pt_497 = pcp_waster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tako_remus <= 0;
    else if (air_gutter)
      tako_remus <= 0;
    else if (starwars_gyro)
      tako_remus <= gnd;
  end

always @(tako_remus)
  begin
      feedback_pt_498 = tako_remus;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      achilles_dig <= 0;
    else if (gnd)
      achilles_dig <= vcc;
    else if (lao_steaming)
      achilles_dig <= 0;
  end

always @(achilles_dig)
  begin
      feedback_pt_499 = achilles_dig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      marker_tako <= 0;
    else if (vcc)
      marker_tako <= 0;
    else if (vcc)
      marker_tako <= atilla_hans;
  end

always @(marker_tako)
  begin
      feedback_pt_500 = marker_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xuprocar_fuji <= 0;
    else if (whiskey_egg)
      xuprocar_fuji <= gnd;
    else if (seashell_abel)
      xuprocar_fuji <= 0;
  end

always @(xuprocar_fuji)
  begin
      feedback_pt_501 = xuprocar_fuji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      phoenix_ozzy <= 0;
    else if (bagel_shuda)
      phoenix_ozzy <= 0;
    else if (nobody_ebi)
      phoenix_ozzy <= tobe_ants;
  end

always @(phoenix_ozzy)
  begin
      feedback_pt_502 = phoenix_ozzy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nation_potato <= 0;
    else
      nation_potato <= mushroom_east;
  end

always @(nation_potato)
  begin
      feedback_pt_503 = nation_potato;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bambi_bubba <= 0;
    else if (vcc)
      bambi_bubba <= vcc;
    else if (sears_rerun)
      bambi_bubba <= 0;
  end

always @(bambi_bubba)
  begin
      feedback_pt_504 = bambi_bubba;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      martin_sirius <= 0;
    else if (gnd)
      martin_sirius <= 0;
    else if (stix_unicorn)
      martin_sirius <= gnd;
  end

always @(martin_sirius)
  begin
      feedback_pt_505 = martin_sirius;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_wukong <= 1;
    else
      itchy_wukong <= gnd;
  end

always @(itchy_wukong)
  begin
      feedback_pt_506 = itchy_wukong;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oranje_spyro <= 0;
    else if (due_bolt)
      oranje_spyro <= nest_cow;
    else if (parrot_east)
      oranje_spyro <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_pomodoro <= 0;
    else
      moe_pomodoro <= ohno_minnow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deuce_air <= 1;
    else
      deuce_air <= spyro_might;
  end

wire hagrid_zeus_wire;

dffea hagrid_zeus_ff (
  .clk(clock1),
  .d(lion_sheep),
  .ena(zebra_bubba),
  .adata(elguapo_ghost),
  .clrn(!reset1),
  .q(hagrid_zeus_wire)
);

always @(hagrid_zeus_wire) begin
   dog_vulture = hagrid_zeus_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      platypus_Iwin <= 0;
    else if (Iwin_intuit)
      platypus_Iwin <= turkey_sanity;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blaster_togos <= 1;
    else
      blaster_togos <= broom_kabar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      copper_rubeus <= 0;
    else
      copper_rubeus <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      riddler_stix <= 0;
    else if (oranges_loud)
      riddler_stix <= 0;
    else if (arthur_att)
      riddler_stix <= gnd;
  end

wire tasty_condit_wire;

dffea tasty_condit_ff (
  .clk(clock1),
  .d(tako_handroll),
  .ena(vcc),
  .adata(sinew_gulp),
  .clrn(!reset1),
  .q(tasty_condit_wire)
);

always @(tasty_condit_wire) begin
   marker_potter = tasty_condit_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bracket_boing <= 0;
    else if (north_pacbell)
      bracket_boing <= 0;
    else if (bert_kaisha)
      bracket_boing <= bear_speedyg;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zi_zed <= 0;
    else
      zi_zed <= sears_rerun;
  end

reg feedback_pt_507;

always @(vcc or feedback_pt_507)
  begin
      tank_eagle =  vcc & !feedback_pt_507;
  end

reg feedback_pt_508;

always @(escape_rojas or feedback_pt_508)
  begin
      george_roe = !escape_rojas |  feedback_pt_508;
  end

reg feedback_pt_509;

always @(curie_aspirin or feedback_pt_509)
  begin
      banality_tuna = !curie_aspirin ^ !feedback_pt_509;
  end

reg feedback_pt_510;

always @(gnd or feedback_pt_510)
  begin
      south_crank = !gnd |  feedback_pt_510;
  end

reg feedback_pt_511;

always @(lion_sheep or feedback_pt_511)
  begin
      rubeus_att =  lion_sheep | !feedback_pt_511;
  end

reg feedback_pt_512;

always @(fire_boing or feedback_pt_512)
  begin
      freaky_winner = !fire_boing ^  feedback_pt_512;
  end

reg feedback_pt_513;

always @(martin_sirius or feedback_pt_513)
  begin
      kdqcens_ritsu =  martin_sirius &  feedback_pt_513;
  end

reg feedback_pt_514;

always @(rodent_south or feedback_pt_514)
  begin
      sirius_zhuang = !rodent_south |  feedback_pt_514;
  end

reg feedback_pt_515;

always @(crab_iterate or feedback_pt_515)
  begin
      wukong_float = !crab_iterate & !feedback_pt_515;
  end

reg feedback_pt_516;

always @(draco_salmon or feedback_pt_516)
  begin
      exodus_touch = !draco_salmon &  feedback_pt_516;
  end

reg feedback_pt_517;

always @(meth_athena or feedback_pt_517)
  begin
      tuna_baron =  meth_athena & !feedback_pt_517;
  end

reg feedback_pt_518;

always @(lupin_gotone or feedback_pt_518)
  begin
      fufu_eagle =  lupin_gotone & !feedback_pt_518;
  end

reg feedback_pt_519;

always @(bush_uppers or feedback_pt_519)
  begin
      beetle_wakey =  bush_uppers |  feedback_pt_519;
  end

reg feedback_pt_520;

always @(banality_tuna or feedback_pt_520)
  begin
      dopey_pierre =  banality_tuna | !feedback_pt_520;
  end

reg feedback_pt_521;

always @(gnd or feedback_pt_521)
  begin
      deng_gyro =  gnd ^ !feedback_pt_521;
  end

wire advil_tango_wire;

dffeas advil_tango_ff (
  .clk(clock1),
  .d(tobe_ants),
  .ena(gnd),
  .sclr(salmon_badger),
  .sload(arcade_ritsu),
  .asdata(deng_gerrit),
  .clrn(!reset1),
  .q(advil_tango_wire)
);

always @(advil_tango_wire) begin
   riddler_po = advil_tango_wire;
end

always @(riddler_po)
  begin
      feedback_pt_507 = riddler_po;
  end

always @(riddler_po)
  begin
      feedback_pt_508 = riddler_po;
  end

always @(riddler_po)
  begin
      feedback_pt_509 = riddler_po;
  end

always @(riddler_po)
  begin
      feedback_pt_510 = riddler_po;
  end

always @(riddler_po)
  begin
      feedback_pt_511 = riddler_po;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_lxtcen <= 0;
    else
      fronds_lxtcen <= midas_dirty;
  end

always @(fronds_lxtcen)
  begin
      feedback_pt_512 = fronds_lxtcen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubeus_mortar <= 0;
    else if (fufu_eagle)
      rubeus_mortar <= gnd;
  end

always @(rubeus_mortar)
  begin
      feedback_pt_513 = rubeus_mortar;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_clay <= 0;
    else if (moe_pomodoro)
      knot_clay <= sun_mrbill;
  end

always @(knot_clay)
  begin
      feedback_pt_514 = knot_clay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mao_honey <= 0;
    else if (sun_mrbill)
      mao_honey <= 0;
    else if (gnd)
      mao_honey <= gnd;
  end

always @(mao_honey)
  begin
      feedback_pt_515 = mao_honey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      surfer_fuji <= 1;
    else
      surfer_fuji <= blanket_pilot;
  end

always @(surfer_fuji)
  begin
      feedback_pt_516 = surfer_fuji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonks_fallen <= 0;
    else if (gnd)
      tonks_fallen <= vcc;
    else if (broom_oranje)
      tonks_fallen <= 0;
  end

always @(tonks_fallen)
  begin
      feedback_pt_517 = tonks_fallen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_tuna <= 0;
    else if (hector_mao)
      cain_tuna <= phoenix_ozzy;
    else if (wukong_float)
      cain_tuna <= 0;
  end

always @(cain_tuna)
  begin
      feedback_pt_518 = cain_tuna;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wood_gokidsgo <= 0;
    else if (opus_liberace)
      wood_gokidsgo <= 0;
    else if (lion_grumby)
      wood_gokidsgo <= bush_uppers;
  end

always @(wood_gokidsgo)
  begin
      feedback_pt_519 = wood_gokidsgo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_freaky <= 0;
    else
      boing_freaky <= penguin_genji;
  end

always @(boing_freaky)
  begin
      feedback_pt_520 = boing_freaky;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      animal_mickey <= 1;
    else
      animal_mickey <= ham_faster;
  end

always @(animal_mickey)
  begin
      feedback_pt_521 = animal_mickey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      duey_superman <= 0;
    else if (ramone_palmer)
      duey_superman <= fufu_eagle;
    else if (tobe_ants)
      duey_superman <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wine_edible <= 1;
    else
      wine_edible <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      joseph_deuce <= 0;
    else if (bracket_boing)
      joseph_deuce <= ham_faster;
  end

wire brian_advil_wire;

dffeas brian_advil_ff (
  .clk(clock1),
  .d(louie_mideast),
  .ena(whammy_armand),
  .sclr(gnd),
  .sload(stroop_bart),
  .asdata(kdqcens_ritsu),
  .clrn(!reset1),
  .q(brian_advil_wire)
);

always @(brian_advil_wire) begin
   pixie_india = brian_advil_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      china_fitter <= 0;
    else
      china_fitter <= penguin_genji;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ebi_iwocensor <= 0;
    else
      ebi_iwocensor <= xterm_sierra;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jesus_what <= 1;
    else
      jesus_what <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      elian_bamboo <= 0;
    else if (rubeus_att)
      elian_bamboo <= 0;
    else if (square_cubish)
      elian_bamboo <= pirate_flew;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killer_curie <= 0;
    else if (macys_neptune)
      killer_curie <= gnd;
    else if (kennyg_barney)
      killer_curie <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hp_richard <= 0;
    else if (hawaii_turnip)
      hp_richard <= vcc;
    else if (butthead_duey)
      hp_richard <= 0;
  end

wire hotel_zed_wire;

dffea hotel_zed_ff (
  .clk(clock1),
  .d(beetle_wakey),
  .ena(freaky_winner),
  .adata(kabar_tabby),
  .clrn(!reset1),
  .q(hotel_zed_wire)
);

always @(hotel_zed_wire) begin
   dingbat_snape = hotel_zed_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bubba_doc <= 1;
    else
      bubba_doc <= chowmein_haze;
  end

wire pixie_hummer_wire;

dffeas pixie_hummer_ff (
  .clk(clock1),
  .d(lupin_gotone),
  .ena(money_delta),
  .sclr(dirk_charlie),
  .sload(newt_devotion),
  .asdata(whammy_armand),
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
    else if (vcc)
      lotus_salami <= 0;
    else if (vcc)
      lotus_salami <= stix_marvin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      martin_safada <= 0;
    else if (vcc)
      martin_safada <= 0;
    else if (rubeus_mortar)
      martin_safada <= south_aspirin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peaves_hut <= 0;
    else if (vcc)
      peaves_hut <= warlock_rod;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ready_xray <= 0;
    else if (zhuang_often)
      ready_xray <= jesus_what;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rerun_tapered <= 0;
    else if (nigiri_chuck)
      rerun_tapered <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vadar_protest <= 0;
    else if (square_cubish)
      vadar_protest <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      picante_meth <= 0;
    else if (bagel_atomic)
      picante_meth <= vcc;
    else if (todd_beavis)
      picante_meth <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_ebi <= 0;
    else if (zulu_satanist)
      south_ebi <= 0;
    else if (lion_grumby)
      south_ebi <= togos_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      questo_tamago <= 0;
    else
      questo_tamago <= nigiri_chuck;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lisa_yoku <= 0;
    else if (hurt_pluto)
      lisa_yoku <= 0;
    else if (soccer_moe)
      lisa_yoku <= questo_tamago;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nasdaq_doc <= 0;
    else if (pdaddy_willy)
      nasdaq_doc <= escape_rojas;
    else if (green_eeevil)
      nasdaq_doc <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pork_balloon <= 0;
    else
      pork_balloon <= babette_aphid;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moulin_Iwin <= 0;
    else if (gnd)
      moulin_Iwin <= 0;
    else if (china_fitter)
      moulin_Iwin <= animal_mickey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drax_rat <= 0;
    else
      drax_rat <= platypus_Iwin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rabbi_waffle <= 1;
    else
      rabbi_waffle <= bambi_bubba;
  end

wire peace_cannon_wire;

dffeas peace_cannon_ff (
  .clk(clock1),
  .d(rescue_hp),
  .ena(vcc),
  .sclr(vcc),
  .sload(turkey_sanity),
  .asdata(mars_turkey),
  .clrn(!reset1),
  .q(peace_cannon_wire)
);

always @(peace_cannon_wire) begin
   zed_erncenso = peace_cannon_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      midas_killer <= 0;
    else if (gnd)
      midas_killer <= george_roe;
    else if (fronds_lxtcen)
      midas_killer <= 0;
  end

// Random combinatorial logic block
always@(*)
  begin
      square_cheese = ~( ~( ( ~( ~( ~( ~phoenix_ozzy ) ) ^ ~( vcc ^ ~malfoy_bull ) ) ) ) );
  end

  always@(*)
  begin
    jacuzzi_meth = ( ~( ~( ~( ( ~( ~vcc ^ egg_abel ) ) ) ) ) | ~( ~( ~( nation_potato ) ) & ( ~( dingbat_snape & ( ~gnd & ~vcc ) ) ) ) ) ? ~( ~surfer_fuji ) | ( ~( vcc ) & black_yoku ) ^ ( ~( nest_cow ) ^ ( crank_mozart & knot_clay ) ) ^ ~chillis_fish : ( ~( ~( gnd ) ) | ( ~( picante_meth ) & ~( gnd ) ) ) ^ fufu_bono & ~( ( ~( ( ~( ~square_cheese ) & ~( ~vcc ) ) | blaster_togos ) ) );
  end
// State Mek dopey_master Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dopey_master <= dopey_master_0;
    else
      case (dopey_master)
        dopey_master_0: begin
          if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 0)
            dopey_master <= dopey_master_3;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 14)
            dopey_master <= dopey_master_5;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 3)
            dopey_master <= dopey_master_1;
          else
            dopey_master <= dopey_master_0;
          end
        dopey_master_1: begin
          if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 2)
            dopey_master <= dopey_master_4;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 11)
            dopey_master <= dopey_master_3;
          else
            dopey_master <= dopey_master_1;
          end
        dopey_master_2: begin
          if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 12)
            dopey_master <= dopey_master_3;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 8)
            dopey_master <= dopey_master_0;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 14)
            dopey_master <= dopey_master_3;
          else
            dopey_master <= dopey_master_2;
          end
        dopey_master_3: begin
          if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 2)
            dopey_master <= dopey_master_0;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 7)
            dopey_master <= dopey_master_2;
          else
            dopey_master <= dopey_master_3;
          end
        dopey_master_4: begin
          if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 13)
            dopey_master <= dopey_master_1;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 6)
            dopey_master <= dopey_master_4;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 5)
            dopey_master <= dopey_master_1;
          else
            dopey_master <= dopey_master_4;
          end
        dopey_master_5: begin
          if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 2)
            dopey_master <= dopey_master_5;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 3)
            dopey_master <= dopey_master_3;
          else if ({rubeus_acid,oscar_cheez,wood_gokidsgo,ibm_fsncens} == 8)
            dopey_master <= dopey_master_4;
          else
            dopey_master <= dopey_master_5;
          end
        default: dopey_master <= dopey_master_0;
      endcase
  end

// State Mek dopey_master Output logic
always @(dopey_master)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (dopey_master[3:1])
        dopey_master_0: begin
            moe_maritime = 0;
            heidi_school = 0;
            falafel_duey = 0;
            deng_junkie = 0;
            dadada_rescue = 0;
            love_in_zulu = 1;
          end
        dopey_master_1: begin
            moe_maritime = 0;
            heidi_school = 1;
            falafel_duey = 0;
            deng_junkie = 0;
            dadada_rescue = 0;
            love_in_zulu = 0;
          end
        dopey_master_2: begin
            moe_maritime = 0;
            heidi_school = 1;
            falafel_duey = 0;
            deng_junkie = 0;
            dadada_rescue = 0;
            love_in_zulu = 0;
          end
        default: begin
            moe_maritime = 0;
            heidi_school = 1;
            falafel_duey = 1;
            deng_junkie = 1;
            dadada_rescue = 1;
            love_in_zulu = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire drugie_maki_out;
nut_001_lut #(5) nut_001_lut_inst_drugie_maki (
  .din({gnd,cain_tuna,tank_eagle,star_obiwan,neon_xuprocar}),
  .mask(32'b00001011001000100010010110000000),
  .out(drugie_maki_out)
);

always @(drugie_maki_out)
begin
   cow_tabasco = drugie_maki_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire tasty_floo_out;
nut_001_lut #(6) nut_001_lut_inst_tasty_floo (
  .din({vcc,dog_vulture,ebi_iwocensor,tuna_baron,gnd,cybex_moe}),
  .mask(64'hb02d898ef2e9c96d),
  .out(tasty_floo_out)
);

always @(tasty_floo_out)
begin
   wonder_bart = tasty_floo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire dork_valve_out;
nut_001_lut #(3) nut_001_lut_inst_dork_valve (
  .din({vcc,mao_honey,gnd}),
  .mask(8'b10001100),
  .out(dork_valve_out)
);

always @(dork_valve_out)
begin
   tapered_xray = dork_valve_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire genesis_ozzy_out;
nut_001_lut #(5) nut_001_lut_inst_genesis_ozzy (
  .din({lisa_yoku,gnd,gnd,bubba_doc,neon_xuprocar}),
  .mask(32'b00010000011100000010100011001000),
  .out(genesis_ozzy_out)
);

always @(genesis_ozzy_out)
begin
   tobe_viagra = genesis_ozzy_out;
end

// Bus inputs for MACing
reg  [16:0] mao_pacbell_a;
reg  [14:0] mao_pacbell_b;
reg  [16:0] mao_pacbell_c;
reg  [14:0] mao_pacbell_d;
initial mao_pacbell_a <= 0;
always @(posedge clock1) begin
  mao_pacbell_a <= {malfoy_bull,peaves_hut,gnd,tapered_xray,fang_honda,spyro_might,sugar_newt,roe_lad,air_wildboar,elian_bamboo,vcc,bert_kaisha,stix_iterate,dadada_rescue,lupin_gotone,kennyg_barney,kungfu_elian};
end
always @(hippo_lao or south_crank or tuna_baron or moe_maritime or chowmein_haze or vcc or due_theonion or tapered_xray or vcc or turtle_kilo or hummer_potter or zulu_satanist or rat_solder or ants_edible or jesus_what) begin
  mao_pacbell_b = {hippo_lao,south_crank,tuna_baron,moe_maritime,chowmein_haze,vcc,due_theonion,tapered_xray,vcc,turtle_kilo,hummer_potter,zulu_satanist,rat_solder,ants_edible,jesus_what};
end
initial mao_pacbell_c <= 0;
always @(posedge clock1) begin
  mao_pacbell_c <= {vcc,jacuzzi_meth,sinew_gulp,midas_killer,deng_junkie,vcc,vcc,nasdaq_doc,kungfu_itchy,picante_meth,spyro_might,vcc,vcc,ibm_fsncens,tuna_baron,george_roe,xuprocar_fuji};
end
initial mao_pacbell_d <= 0;
always @(posedge clock1) begin
  mao_pacbell_d <= {whiskey_egg,gnd,vcc,vcc,gnd,boing_freaky,vcc,black_yoku,tako_remus,cocacola_milo,meth_athena,gnd,sirius_zhuang,vcc,curie_sogood};
end

// MAC inference bait
always @(mao_pacbell_a or mao_pacbell_b or mao_pacbell_c or mao_pacbell_d)
  begin
    {dadada_rubik,hogwarts_zeus,hp_asahi,mortar_school,peace_willem,lagoon_rodent,fallen_pdaddy,clay_marco,kanji_mars,escape_star,kilo_pixie,odin_hamachi,vegas_clay,jcrew_siamese,bert_burning,bracket_barty} = 
        (-mao_pacbell_a *
        mao_pacbell_b) +
        (~mao_pacbell_c *
        -mao_pacbell_d);
  end

// A + const
always @(egg_abel or pork_balloon or gnd or copper_rubeus or marker_tako or vcc or raiders_bart)
  begin
    {lxtcen_gopher,venus_georgec,witch_drugs,fatality_noah,howell_eatem,golf_onion,togos_piggish,rose_vangoh,ham_donut,would_chips} = {egg_abel,pork_balloon,gnd,copper_rubeus,marker_tako,vcc,raiders_bart} + 31;
  end

// NAND all of these bits together
always @(dingbat_lad or gnd or witch_drugs or fallen_pdaddy or martin_safada or chillis_fish or louie_mideast or bravo_sapporo or questo_tamago or itchy_wukong)
  begin
      marco_icarus = ~& {dingbat_lad,gnd,witch_drugs,fallen_pdaddy,martin_safada,chillis_fish,louie_mideast,bravo_sapporo,questo_tamago,itchy_wukong};
  end

// XOR all of these bits together
always @(gnd or bart_speed or hans_voodoo or ebi_iwocensor or gnd or meth_platypus or bush_uppers or vcc or killer_curie or rabbi_waffle or gnd or vcc)
  begin
      rodent_badger = ^ {gnd,bart_speed,hans_voodoo,ebi_iwocensor,gnd,meth_platypus,bush_uppers,vcc,killer_curie,rabbi_waffle,gnd,vcc};
  end

reg feedback_pt_522;

always @(pixie_india or feedback_pt_522)
  begin
      deng_atoms = !pixie_india & !feedback_pt_522;
  end

reg feedback_pt_523;

always @(love_in_zulu or feedback_pt_523)
  begin
      onion_moses = !love_in_zulu | !feedback_pt_523;
  end

reg feedback_pt_524;

always @(xterm_sierra or feedback_pt_524)
  begin
      callme_stoned = !xterm_sierra &  feedback_pt_524;
  end

reg feedback_pt_525;

always @(mortar_school or feedback_pt_525)
  begin
      advil_bep =  mortar_school & !feedback_pt_525;
  end

reg feedback_pt_526;

always @(surfer_fuji or feedback_pt_526)
  begin
      mexico_pork = !surfer_fuji ^ !feedback_pt_526;
  end

reg feedback_pt_527;

always @(gnd or feedback_pt_527)
  begin
      kanji_todd =  gnd &  feedback_pt_527;
  end

reg feedback_pt_528;

always @(ham_donut or feedback_pt_528)
  begin
      tracy_snape =  ham_donut &  feedback_pt_528;
  end

reg feedback_pt_529;

always @(vcc or feedback_pt_529)
  begin
      rarest_yummy = !vcc &  feedback_pt_529;
  end

reg feedback_pt_530;

always @(onion_moses or feedback_pt_530)
  begin
      crank_star =  onion_moses ^  feedback_pt_530;
  end

reg feedback_pt_531;

always @(mexico_pork or feedback_pt_531)
  begin
      thread_plague = !mexico_pork | !feedback_pt_531;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      itchy_fallen <= 0;
    else if (gnd)
      itchy_fallen <= 0;
    else if (gnd)
      itchy_fallen <= vcc;
  end

always @(itchy_fallen)
  begin
      feedback_pt_522 = itchy_fallen;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_yummy <= 0;
    else
      water_yummy <= saturn_iguana;
  end

always @(water_yummy)
  begin
      feedback_pt_523 = water_yummy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lagoon_ebay <= 0;
    else if (vadar_protest)
      lagoon_ebay <= bagel_howell;
    else if (sgates_juliet)
      lagoon_ebay <= 0;
  end

always @(lagoon_ebay)
  begin
      feedback_pt_524 = lagoon_ebay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubik_whack <= 1;
    else
      rubik_whack <= fufu_mandarin;
  end

always @(rubik_whack)
  begin
      feedback_pt_525 = rubik_whack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      beavis_kbtoys <= 1;
    else
      beavis_kbtoys <= joseph_hoser;
  end

always @(beavis_kbtoys)
  begin
      feedback_pt_526 = beavis_kbtoys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      psycho_eagle <= 1;
    else
      psycho_eagle <= falafel_duey;
  end

always @(psycho_eagle)
  begin
      feedback_pt_527 = psycho_eagle;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bambi_lao <= 0;
    else if (doobie_macys)
      bambi_lao <= 0;
    else if (dragon_golf)
      bambi_lao <= deng_atoms;
  end

always @(bambi_lao)
  begin
      feedback_pt_528 = bambi_lao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_books <= 0;
    else if (gnd)
      webvan_books <= 0;
    else if (vcc)
      webvan_books <= fang_honda;
  end

always @(webvan_books)
  begin
      feedback_pt_529 = webvan_books;
  end

wire spain_nail_wire;

dffeas spain_nail_ff (
  .clk(clock1),
  .d(vcc),
  .ena(cain_tuna),
  .sclr(vcc),
  .sload(thread_plague),
  .asdata(peace_willem),
  .clrn(!reset1),
  .q(spain_nail_wire)
);

always @(spain_nail_wire) begin
   larry_alpha = spain_nail_wire;
end

always @(larry_alpha)
  begin
      feedback_pt_530 = larry_alpha;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bep_pirate <= 1;
    else
      bep_pirate <= turtle_kilo;
  end

always @(bep_pirate)
  begin
      feedback_pt_531 = bep_pirate;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onthepc_moe <= 1;
    else
      onthepc_moe <= rarest_yummy;
  end

wire turnip_jason_wire;

dffea turnip_jason_ff (
  .clk(clock1),
  .d(rodent_badger),
  .ena(marker_potter),
  .adata(vcc),
  .clrn(!reset1),
  .q(turnip_jason_wire)
);

always @(turnip_jason_wire) begin
   tukatuk_mike = turnip_jason_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      po_wizard <= 1;
    else
      po_wizard <= kanji_mars;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      atomic_joker <= 0;
    else if (golf_onion)
      atomic_joker <= 0;
    else if (vcc)
      atomic_joker <= escape_star;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tesla_icarus <= 0;
    else if (rescue_george)
      tesla_icarus <= gnd;
    else if (sgates_juliet)
      tesla_icarus <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      meth_holland <= 1;
    else
      meth_holland <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ajax_shuda <= 0;
    else if (howell_eatem)
      ajax_shuda <= advil_bep;
    else if (vcc)
      ajax_shuda <= 0;
  end

wire desade_cuckoo_wire;

dffeas desade_cuckoo_ff (
  .clk(clock1),
  .d(due_theonion),
  .ena(vcc),
  .sclr(vcc),
  .sload(iceland_egg),
  .asdata(killme_larry),
  .clrn(!reset1),
  .q(desade_cuckoo_wire)
);

always @(desade_cuckoo_wire) begin
   yak_on_sale = desade_cuckoo_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whacky_exodus <= 1;
    else
      whacky_exodus <= maryann_hotel;
  end

wire drdeath_gulp_wire;

dffeas drdeath_gulp_ff (
  .clk(clock1),
  .d(vcc),
  .ena(ready_xray),
  .sclr(jcrew_siamese),
  .sload(gnd),
  .asdata(chillis_fish),
  .clrn(!reset1),
  .q(drdeath_gulp_wire)
);

always @(drdeath_gulp_wire) begin
   pluto_armand = drdeath_gulp_wire;
end

wire vegan_isle_wire;

dffeas vegan_isle_ff (
  .clk(clock1),
  .d(schwinger_bfs),
  .ena(gnd),
  .sclr(questo_tamago),
  .sload(gnd),
  .asdata(tuna_baron),
  .clrn(!reset1),
  .q(vegan_isle_wire)
);

always @(vegan_isle_wire) begin
   newt_bear = vegan_isle_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bison_midas <= 0;
    else if (gnd)
      bison_midas <= books_rodent;
    else if (riddler_po)
      bison_midas <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      faster_rocks <= 1;
    else
      faster_rocks <= knot_clay;
  end

wire speed_george_wire;

dffeas speed_george_ff (
  .clk(clock1),
  .d(gnd),
  .ena(lxtcen_gopher),
  .sclr(marker_potter),
  .sload(kennyg_tracy),
  .asdata(gnd),
  .clrn(!reset1),
  .q(speed_george_wire)
);

always @(speed_george_wire) begin
   macys_draco = speed_george_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_cocaine <= 1;
    else
      advil_cocaine <= rat_fsncens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_tin <= 0;
    else if (itchy_wukong)
      oldnavy_tin <= achilles_dig;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      luthor_sleepy <= 1;
    else
      luthor_sleepy <= kilo_pixie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_tobiko <= 0;
    else
      pizza_tobiko <= mexico_pork;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheese_jonas <= 1;
    else
      cheese_jonas <= moulin_Iwin;
  end

wire mortar_rouge_wire;

dffeas mortar_rouge_ff (
  .clk(clock1),
  .d(webvan_books),
  .ena(dadada_rubik),
  .sclr(whacky_exodus),
  .sload(gnd),
  .asdata(duey_superman),
  .clrn(!reset1),
  .q(mortar_rouge_wire)
);

always @(mortar_rouge_wire) begin
   wonder_luthor = mortar_rouge_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      senorduck_pig <= 1;
    else
      senorduck_pig <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bison_donut <= 0;
    else if (wine_edible)
      bison_donut <= muffin_joseph;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_jupiter <= 1;
    else
      art_jupiter <= oracle_pixie;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_kungfu <= 0;
    else if (vcc)
      lotus_kungfu <= 0;
    else if (gnd)
      lotus_kungfu <= zen_loud;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rum_thankee <= 0;
    else if (joseph_deuce)
      rum_thankee <= advil_cocaine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      icarus_dig <= 0;
    else if (drax_rat)
      icarus_dig <= pixie_india;
    else if (hogwarts_zeus)
      icarus_dig <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      remus_peta <= 0;
    else
      remus_peta <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oitcen_fuji <= 0;
    else
      oitcen_fuji <= bracket_barty;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_safeway <= 0;
    else if (vcc)
      often_safeway <= ajax_shuda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      advil_picture <= 0;
    else if (pepsi_gerard)
      advil_picture <= 0;
    else if (arcade_chuck)
      advil_picture <= Iwin_neon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eatem_pixie <= 0;
    else if (gnd)
      eatem_pixie <= rodent_south;
    else if (sears_rerun)
      eatem_pixie <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nyc_witch <= 0;
    else if (bagel_howell)
      nyc_witch <= zed_erncenso;
  end

// A + const
always @(rat_solder or ariel_thedon or vcc or wine_edible or mouse_ghost or often_safeway or oranje_spyro or hans_voodoo or riddler_stix or heidi_school)
  begin
    {rouge_burner,pasta_jupiter,kbtoys_often,cocaine_bush,spirit_bust,hut_athena,doc_copper,hours_would,pasta_buddha,nyquil_desert} = {rat_solder,ariel_thedon,vcc,wine_edible,mouse_ghost,often_safeway,oranje_spyro,hans_voodoo,riddler_stix,heidi_school} + 211;
  end

// A + const
always @(marker_potter or maklak_gyro or vcc or escape_rojas or deng_gyro or riddler_po or remus_fallen or bert_burning or mortar_school)
  begin
    {onthepc_guy,kangaroo_Iwin,illegal_loser,arthur_ring,smack_thread,rubik_palmer} = {marker_potter,maklak_gyro,vcc,escape_rojas,deng_gyro,riddler_po,remus_fallen,bert_burning,mortar_school} + 153;
  end

// Triple add / sub bait
always @(advil_cocaine or advil_cocaine or jcrew_siamese or lala_sanity or odin_hamachi or pdaddy_willy or doc_copper or marker_potter or illegal_loser or
         venus_georgec or star_tylenol or deng_gerrit or hours_would or advil_bep or drugs_ozzy or whacky_exodus or gnd or gnd or
         turtle_life or ceres_bach or kanji_mars or touch_scotch or thread_plague or rum_thankee or south_crank or vcc or vcc)
  begin
    {mortar_alpha,shemp_rufus,burnout_louie,winner_cubish,vegas_emails,broadway_duck,jacuzzi_lotus,usa_salmon,loud_art} = 
        {advil_cocaine,advil_cocaine,jcrew_siamese,lala_sanity,odin_hamachi,pdaddy_willy,doc_copper,marker_potter,illegal_loser} -
        {venus_georgec,star_tylenol,deng_gerrit,hours_would,advil_bep,drugs_ozzy,whacky_exodus,gnd,gnd} -
        {turtle_life,ceres_bach,kanji_mars,touch_scotch,thread_plague,rum_thankee,south_crank,vcc,vcc};
  end

// 3 by 3 to 7 bit A*B mult
reg  [2:0] golfland_rose_a;
always @(genji_fuji or tukatuk_mike or vcc) begin
  golfland_rose_a = {genji_fuji,tukatuk_mike,vcc};
end

reg  [2:0] golfland_rose_b;
always @(beavis_kbtoys or kappa_drax or larry_alpha) begin
  golfland_rose_b = {beavis_kbtoys,kappa_drax,larry_alpha};
end

always @(golfland_rose_a or golfland_rose_b)
  begin
      {zinc_zealot,tango_lala,dipsy_ants,platypus_mars,lala_rojas,itchy_sun,drax_timmy} = 
	  	  ~golfland_rose_a * 
		  ~golfland_rose_b;
  end

// State Mek badger_hotel Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      badger_hotel <= badger_hotel_0;
    else
      case (badger_hotel)
        badger_hotel_0: begin
          if ({crank_star,sinew_wine,gnd,would_chips} == 11)
            badger_hotel <= badger_hotel_2;
          else if ({crank_star,sinew_wine,gnd,would_chips} == 4)
            badger_hotel <= badger_hotel_0;
          else if ({crank_star,sinew_wine,gnd,would_chips} == 15)
            badger_hotel <= badger_hotel_2;
          else if ({crank_star,sinew_wine,gnd,would_chips} == 7)
            badger_hotel <= badger_hotel_3;
          else
            badger_hotel <= badger_hotel_0;
          end
        badger_hotel_1: begin
          if ({crank_star,sinew_wine,gnd,would_chips} == 1)
            badger_hotel <= badger_hotel_1;
          else
            badger_hotel <= badger_hotel_1;
          end
        badger_hotel_2: begin
          if ({crank_star,sinew_wine,gnd,would_chips} == 3)
            badger_hotel <= badger_hotel_1;
          else if ({crank_star,sinew_wine,gnd,would_chips} == 9)
            badger_hotel <= badger_hotel_3;
          else if ({crank_star,sinew_wine,gnd,would_chips} == 11)
            badger_hotel <= badger_hotel_1;
          else
            badger_hotel <= badger_hotel_2;
          end
        badger_hotel_3: begin
          if ({crank_star,sinew_wine,gnd,would_chips} == 13)
            badger_hotel <= badger_hotel_0;
          else if ({crank_star,sinew_wine,gnd,would_chips} == 6)
            badger_hotel <= badger_hotel_1;
          else
            badger_hotel <= badger_hotel_3;
          end
        default: badger_hotel <= badger_hotel_0;
      endcase
  end

// State Mek badger_hotel Output logic
always @(badger_hotel)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (badger_hotel[3:1])
        badger_hotel_0: begin
            biker_snake = 1;
            llama_eunice = 1;
            po_yeanyow = 1;
            huhhuh_smack = 0;
            bfi_curious = 1;
            vicks_monster = 1;
            boing_comtrex = 0;
          end
        badger_hotel_1: begin
            biker_snake = 1;
            llama_eunice = 0;
            po_yeanyow = 1;
            huhhuh_smack = 0;
            bfi_curious = 0;
            vicks_monster = 0;
            boing_comtrex = 1;
          end
        default: begin
            biker_snake = 0;
            llama_eunice = 1;
            po_yeanyow = 1;
            huhhuh_smack = 0;
            bfi_curious = 1;
            vicks_monster = 1;
            boing_comtrex = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire freaky_tasty_out;
nut_001_lut #(6) nut_001_lut_inst_freaky_tasty (
  .din({vcc,kappa_drax,exodus_touch,arthur_ring,vangoh_hinge,rouge_plaster}),
  .mask(64'b0000100101000100001000100000011000100010000001001011111000000000),
  .out(freaky_tasty_out)
);

always @(freaky_tasty_out)
begin
   curie_vicks = freaky_tasty_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire togos_monster_out;
nut_001_lut #(2) nut_001_lut_inst_togos_monster (
  .din({iceland_egg,vangoh_hinge}),
  .mask(4'hb),
  .out(togos_monster_out)
);

always @(togos_monster_out)
begin
   jacques_macys = togos_monster_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire waster_jjocen_out;
nut_001_lut #(5) nut_001_lut_inst_waster_jjocen (
  .din({riddler_stix,gnd,lovey_guy,vcc,oracle_pixie}),
  .mask(32'h42b68468),
  .out(waster_jjocen_out)
);

always @(waster_jjocen_out)
begin
   heidi_joker = waster_jjocen_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire nyc_drevil_out;
nut_001_lut #(3) nut_001_lut_inst_nyc_drevil (
  .din({faster_rocks,gnd,witch_drugs}),
  .mask(8'h29),
  .out(nyc_drevil_out)
);

always @(nyc_drevil_out)
begin
   bison_mickey = nyc_drevil_out;
end

// State Mek onion_shemp Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_shemp <= onion_shemp_0;
    else
      case (onion_shemp)
        onion_shemp_0: begin
          if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 5)
            onion_shemp <= onion_shemp_1;
          else
            onion_shemp <= onion_shemp_0;
          end
        onion_shemp_1: begin
          if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 10)
            onion_shemp <= onion_shemp_0;
          else if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 2)
            onion_shemp <= onion_shemp_3;
          else
            onion_shemp <= onion_shemp_1;
          end
        onion_shemp_2: begin
          if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 5)
            onion_shemp <= onion_shemp_2;
          else if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 15)
            onion_shemp <= onion_shemp_1;
          else if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 3)
            onion_shemp <= onion_shemp_3;
          else if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 14)
            onion_shemp <= onion_shemp_2;
          else
            onion_shemp <= onion_shemp_2;
          end
        onion_shemp_3: begin
          if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 10)
            onion_shemp <= onion_shemp_2;
          else if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 11)
            onion_shemp <= onion_shemp_0;
          else if ({hut_athena,gnd,duey_superman,jacuzzi_lotus} == 9)
            onion_shemp <= onion_shemp_0;
          else
            onion_shemp <= onion_shemp_3;
          end
        default: onion_shemp <= onion_shemp_0;
      endcase
  end

// State Mek onion_shemp Output logic
always @(onion_shemp)
  begin
    // leaking current state onto output pins
    // consider a subset of the state regs when 
    // doing outputs.
    case (onion_shemp[3:1])
        onion_shemp_0: begin
            kappa_bismuth = 0;
            neville_xterm = 0;
            xterm_wakey = 0;
            dutch_ostrich = 0;
            potter_zealot = 1;
            huhhuh_dow = 1;
            honda_goofy = 1;
            tofu_bonker = 0;
            copper_due = 0;
            webvan_bubba = 0;
            platinum_clay = 0;
          end
        onion_shemp_1: begin
            kappa_bismuth = 1;
            neville_xterm = 0;
            xterm_wakey = 0;
            dutch_ostrich = 0;
            potter_zealot = 0;
            huhhuh_dow = 1;
            honda_goofy = 1;
            tofu_bonker = 1;
            copper_due = 0;
            webvan_bubba = 0;
            platinum_clay = 0;
          end
        default: begin
            kappa_bismuth = 0;
            neville_xterm = 0;
            xterm_wakey = 0;
            dutch_ostrich = 1;
            potter_zealot = 0;
            huhhuh_dow = 0;
            honda_goofy = 0;
            tofu_bonker = 0;
            copper_due = 1;
            webvan_bubba = 1;
            platinum_clay = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire chuck_tattoo_out;
nut_001_lut #(2) nut_001_lut_inst_chuck_tattoo (
  .din({rose_vangoh,gnd}),
  .mask(4'b1001),
  .out(chuck_tattoo_out)
);

always @(chuck_tattoo_out)
begin
   homer_egg = chuck_tattoo_out;
end

reg feedback_pt_532;

always @(pasta_buddha or feedback_pt_532)
  begin
      fang_dimetap = !pasta_buddha & !feedback_pt_532;
  end

reg feedback_pt_533;

always @(itchy_sun or feedback_pt_533)
  begin
      larry_advil =  itchy_sun ^ !feedback_pt_533;
  end

reg feedback_pt_534;

always @(deuce_air or feedback_pt_534)
  begin
      sugar_donut = !deuce_air | !feedback_pt_534;
  end

reg feedback_pt_535;

always @(platypus_mars or feedback_pt_535)
  begin
      ready_lovey =  platypus_mars | !feedback_pt_535;
  end

reg feedback_pt_536;

always @(goat_wujing or feedback_pt_536)
  begin
      sake_waster =  goat_wujing & !feedback_pt_536;
  end

reg feedback_pt_537;

always @(gnd or feedback_pt_537)
  begin
      wonder_wood = !gnd | !feedback_pt_537;
  end

reg feedback_pt_538;

always @(potter_zealot or feedback_pt_538)
  begin
      mexico_green =  potter_zealot & !feedback_pt_538;
  end

reg feedback_pt_539;

always @(marge_uppers or feedback_pt_539)
  begin
      square_hanger =  marge_uppers |  feedback_pt_539;
  end

reg feedback_pt_540;

always @(bison_mickey or feedback_pt_540)
  begin
      lima_pictures = !bison_mickey & !feedback_pt_540;
  end

reg feedback_pt_541;

always @(opus_liberace or feedback_pt_541)
  begin
      north_wonton = !opus_liberace |  feedback_pt_541;
  end

reg feedback_pt_542;

always @(vcc or feedback_pt_542)
  begin
      oranje_beef =  vcc ^ !feedback_pt_542;
  end

reg feedback_pt_543;

always @(smack_thread or feedback_pt_543)
  begin
      egg_hinge =  smack_thread &  feedback_pt_543;
  end

reg feedback_pt_544;

always @(goat_wujing or feedback_pt_544)
  begin
      whack_woman = !goat_wujing & !feedback_pt_544;
  end

reg feedback_pt_545;

always @(bart_speed or feedback_pt_545)
  begin
      lad_spirit = !bart_speed | !feedback_pt_545;
  end

reg feedback_pt_546;

always @(potter_zealot or feedback_pt_546)
  begin
      zhuang_indigo = !potter_zealot | !feedback_pt_546;
  end

reg feedback_pt_547;

always @(kappa_drax or feedback_pt_547)
  begin
      hp_zeus = !kappa_drax |  feedback_pt_547;
  end

reg feedback_pt_548;

always @(vcc or feedback_pt_548)
  begin
      neville_xray =  vcc |  feedback_pt_548;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      draco_rabbi <= 0;
    else if (south_ebi)
      draco_rabbi <= would_chips;
  end

always @(draco_rabbi)
  begin
      feedback_pt_532 = draco_rabbi;
  end

always @(draco_rabbi)
  begin
      feedback_pt_533 = draco_rabbi;
  end

always @(draco_rabbi)
  begin
      feedback_pt_534 = draco_rabbi;
  end

always @(draco_rabbi)
  begin
      feedback_pt_535 = draco_rabbi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      mickey_fish <= 0;
    else
      mickey_fish <= lagoon_rodent;
  end

always @(mickey_fish)
  begin
      feedback_pt_536 = mickey_fish;
  end

always @(mickey_fish)
  begin
      feedback_pt_537 = mickey_fish;
  end

always @(mickey_fish)
  begin
      feedback_pt_538 = mickey_fish;
  end

wire suffering_pig_wire;

dffea suffering_pig_ff (
  .clk(clock1),
  .d(square_hanger),
  .ena(homer_egg),
  .adata(gnd),
  .clrn(!reset1),
  .q(suffering_pig_wire)
);

always @(suffering_pig_wire) begin
   november_ebay = suffering_pig_wire;
end

always @(november_ebay)
  begin
      feedback_pt_539 = november_ebay;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rufus_black <= 1;
    else
      rufus_black <= jacques_macys;
  end

always @(rufus_black)
  begin
      feedback_pt_540 = rufus_black;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      papyrus_lisa <= 1;
    else
      papyrus_lisa <= gnd;
  end

always @(papyrus_lisa)
  begin
      feedback_pt_541 = papyrus_lisa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      abraham_yoda <= 0;
    else if (psycho_eagle)
      abraham_yoda <= webvan_bubba;
    else if (wonder_wood)
      abraham_yoda <= 0;
  end

always @(abraham_yoda)
  begin
      feedback_pt_542 = abraham_yoda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      clay_shark <= 1;
    else
      clay_shark <= zi_zed;
  end

always @(clay_shark)
  begin
      feedback_pt_543 = clay_shark;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turkey_ohno <= 0;
    else if (dog_vulture)
      turkey_ohno <= gnd;
  end

always @(turkey_ohno)
  begin
      feedback_pt_544 = turkey_ohno;
  end

wire duck_wood_wire;

dffeas duck_wood_ff (
  .clk(clock1),
  .d(arthur_att),
  .ena(lagoon_ebay),
  .sclr(nyc_witch),
  .sload(escape_star),
  .asdata(sugar_donut),
  .clrn(!reset1),
  .q(duck_wood_wire)
);

always @(duck_wood_wire) begin
   ibm_ykocens = duck_wood_wire;
end

always @(ibm_ykocens)
  begin
      feedback_pt_545 = ibm_ykocens;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dipsy_spanish <= 0;
    else if (soccer_moe)
      dipsy_spanish <= togos_haze;
    else if (vcc)
      dipsy_spanish <= 0;
  end

always @(dipsy_spanish)
  begin
      feedback_pt_546 = dipsy_spanish;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rescue_wakey <= 0;
    else if (gnd)
      rescue_wakey <= gnd;
    else if (curie_vicks)
      rescue_wakey <= 0;
  end

always @(rescue_wakey)
  begin
      feedback_pt_547 = rescue_wakey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_star <= 0;
    else if (vcc)
      kilo_star <= lotus_kungfu;
    else if (honda_goofy)
      kilo_star <= 0;
  end

always @(kilo_star)
  begin
      feedback_pt_548 = kilo_star;
  end

wire zedong_eunice_wire;

dffeas zedong_eunice_ff (
  .clk(clock1),
  .d(kanji_todd),
  .ena(huhhuh_smack),
  .sclr(tango_lala),
  .sload(shemp_rufus),
  .asdata(gnd),
  .clrn(!reset1),
  .q(zedong_eunice_wire)
);

always @(zedong_eunice_wire) begin
   touch_safeway = zedong_eunice_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_acid <= 0;
    else if (onthepc_moe)
      escape_acid <= xuprocar_fuji;
    else if (cheese_jonas)
      escape_acid <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bear_cow <= 0;
    else if (gnd)
      bear_cow <= gnd;
    else if (genji_fuji)
      bear_cow <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_stroop <= 0;
    else if (rubik_whack)
      moe_stroop <= vcc;
    else if (kanji_todd)
      moe_stroop <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_spirit <= 1;
    else
      ramone_spirit <= papyrus_lisa;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      doc_pictures <= 0;
    else if (kdqcens_ritsu)
      doc_pictures <= callme_stoned;
    else if (deng_gerrit)
      doc_pictures <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bust_ocean <= 1;
    else
      bust_ocean <= llama_eunice;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kmfdm_bismuth <= 0;
    else if (nasdaq_doc)
      kmfdm_bismuth <= po_wizard;
    else if (tango_lala)
      kmfdm_bismuth <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_ariel <= 1;
    else
      richard_ariel <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      eatem_lotus <= 0;
    else if (love_in_zulu)
      eatem_lotus <= 0;
    else if (fang_dimetap)
      eatem_lotus <= beavis_kbtoys;
  end

wire thankee_homer_wire;

dffea thankee_homer_ff (
  .clk(clock1),
  .d(gnd),
  .ena(south_ebi),
  .adata(vcc),
  .clrn(!reset1),
  .q(thankee_homer_wire)
);

always @(thankee_homer_wire) begin
   ghost_school = thankee_homer_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_bep <= 0;
    else if (zulu_satanist)
      ceres_bep <= oldnavy_tin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lumber_crucio <= 0;
    else if (larry_advil)
      lumber_crucio <= remus_peta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ramone_jcrew <= 0;
    else if (louie_mideast)
      ramone_jcrew <= dipsy_spanish;
  end

wire biker_homer_wire;

dffea biker_homer_ff (
  .clk(clock1),
  .d(pasta_jupiter),
  .ena(togos_haze),
  .adata(gnd),
  .clrn(!reset1),
  .q(biker_homer_wire)
);

always @(biker_homer_wire) begin
   psycho_danger = biker_homer_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tasty_jjocen <= 1;
    else
      tasty_jjocen <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deuce_juliet <= 0;
    else if (draco_rabbi)
      deuce_juliet <= ramone_spirit;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      egg_cafe <= 1;
    else
      egg_cafe <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golf_xiaoping <= 1;
    else
      golf_xiaoping <= water_yummy;
  end

wire chowmein_guy_wire;

dffeas chowmein_guy_ff (
  .clk(clock1),
  .d(pluto_armand),
  .ena(winner_cubish),
  .sclr(vcc),
  .sload(joseph_deuce),
  .asdata(gnd),
  .clrn(!reset1),
  .q(chowmein_guy_wire)
);

always @(chowmein_guy_wire) begin
   ostrich_zi = chowmein_guy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      crab_crayons <= 1;
    else
      crab_crayons <= muffin_joseph;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      raiders_loser <= 0;
    else if (vcc)
      raiders_loser <= biker_snake;
    else if (art_jupiter)
      raiders_loser <= 0;
  end

wire bach_thankee_wire;

dffea bach_thankee_ff (
  .clk(clock1),
  .d(llama_tobiko),
  .ena(lumber_crucio),
  .adata(ready_lovey),
  .clrn(!reset1),
  .q(bach_thankee_wire)
);

always @(bach_thankee_wire) begin
   luthor_turtle = bach_thankee_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      arizona_water <= 1;
    else
      arizona_water <= po_yeanyow;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sneezy_junkie <= 0;
    else if (gnd)
      sneezy_junkie <= snort_nasdaq;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lion_would <= 1;
    else
      lion_would <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tapered_dig <= 0;
    else if (zhuang_indigo)
      tapered_dig <= november_ebay;
    else if (rerun_tapered)
      tapered_dig <= 0;
  end

wire think_would_wire;

dffeas think_would_ff (
  .clk(clock1),
  .d(drax_rat),
  .ena(vcc),
  .sclr(draco_salmon),
  .sload(nyquil_desert),
  .asdata(wonder_wood),
  .clrn(!reset1),
  .q(think_would_wire)
);

always @(think_would_wire) begin
   wine_athena = think_would_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dig_bambi <= 0;
    else if (gnd)
      dig_bambi <= rescue_wakey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tinker_sierra <= 1;
    else
      tinker_sierra <= yak_on_sale;
  end

wire cannon_hanger_wire;

dffea cannon_hanger_ff (
  .clk(clock1),
  .d(gnd),
  .ena(vcc),
  .adata(pepsi_gerard),
  .clrn(!reset1),
  .q(cannon_hanger_wire)
);

always @(cannon_hanger_wire) begin
   sneezy_zealot = cannon_hanger_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      asahi_bloom <= 0;
    else if (whack_woman)
      asahi_bloom <= deng_gyro;
    else if (huhhuh_dow)
      asahi_bloom <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rasp_green <= 0;
    else
      rasp_green <= jacques_macys;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jason_emu <= 0;
    else if (ostrich_zi)
      jason_emu <= rat_fsncens;
    else if (dopey_pierre)
      jason_emu <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_doc <= 0;
    else if (snort_nasdaq)
      webvan_doc <= questo_tamago;
    else if (newt_bear)
      webvan_doc <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boing_gutter <= 0;
    else if (boing_comtrex)
      boing_gutter <= 0;
    else if (vcc)
      boing_gutter <= rouge_plaster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      art_smack <= 1;
    else
      art_smack <= arthur_ring;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blue_tracy <= 0;
    else if (genji_fuji)
      blue_tracy <= 0;
    else if (dig_bambi)
      blue_tracy <= boing_gutter;
  end

// Random combinatorial logic block
always@(*)
  begin
      lemon_tapered = ~( ~( ( ~( ~( ( ~( gnd ^ ~arizona_water ) ) ) & shemp_rufus ) ) ) );
  end

  always@(*)
  begin
    pcp_valve = ( ~( ~( ~( ( ~( ~vcc | ~onthepc_guy ) ) ) ) & ~( ( tinker_sierra & ~mortar_school ) & ~( ~gnd ) ) ) ) | ( ~( ~( vcc ) ^ ~( ~egg_hinge ) ^ ( ~( ~clay_shark ^ ~( hummer_potter ) ) ) ) ) | ~( ( ~( ( xuprocar_fuji & gnd ) | ~vcc ) ) ) ? ~( ( ~( ~( ( ~oldnavy_tin | ~rouge_burner ) ) ^ ( ~( drax_timmy ) & ceres_bep | ~happy_bear ) ) ) ^ ( ~( ( ~( platinum_clay ) | ( ~( ~riddler_stix | turtle_kilo ) ) ) ^ ( ( ~whammy_armand & ~zhuang_indigo ) | wonder_wood | vcc ) ) ) ) : ~( ( ~( ~( ~( ~( oranje_beef ) ) ) ^ ~( ~( ~( rubik_whack ) ) ) ) ) );
  end
// 6 bit divide
always @(icarus_dig or gnd or senorduck_pig or ajax_shuda or gnd or vcc or vcc or cocaine_bush or vcc or vcc or vcc or lotus_salami)
  begin
    if ({vcc,cocaine_bush,vcc,vcc,vcc,lotus_salami} == 0)
       {aphid_diagon,hummer_star,snake_often,madeye_badger,joey_golden,bubba_plague} = 0;
    else 
      {aphid_diagon,hummer_star,snake_often,madeye_badger,joey_golden,bubba_plague} = 
	  	  {icarus_dig,gnd,senorduck_pig,ajax_shuda,gnd,vcc} / 
		  {vcc,cocaine_bush,vcc,vcc,vcc,lotus_salami};
  end


initial begin
    {armand_tesla,arizona_newt,rum_partners,bloom_batman,waster_minnie,bear_candle} = 0;
end

// Viterbi style compare-select
always @(posedge clock1)
  begin
    if ({snake_often,gnd,mickey_fish,rubik_palmer,tako_handroll,pcp_valve} < {arizona_water,vcc,luthor_turtle,platypus_mars,vcc,ibm_ykocens})
       {armand_tesla,arizona_newt,rum_partners,bloom_batman,waster_minnie,bear_candle} <= {arizona_water,vcc,luthor_turtle,platypus_mars,vcc,ibm_ykocens};
    else
       {armand_tesla,arizona_newt,rum_partners,bloom_batman,waster_minnie,bear_candle} <= {snake_often,gnd,mickey_fish,rubik_palmer,tako_handroll,pcp_valve};
  end

// 9 bit updown counter
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      {sanity_minnie,sheep_grams,art_potato,hinge_vegan,hotdog_arthur,deng_love_in,wine_amadeus,monster_isle,moe_ihilani} <= 0;
    else if (tuna_baron)
      {sanity_minnie,sheep_grams,art_potato,hinge_vegan,hotdog_arthur,deng_love_in,wine_amadeus,monster_isle,moe_ihilani} <= {sanity_minnie,sheep_grams,art_potato,hinge_vegan,hotdog_arthur,deng_love_in,wine_amadeus,monster_isle,moe_ihilani} + 51;
    else
      {sanity_minnie,sheep_grams,art_potato,hinge_vegan,hotdog_arthur,deng_love_in,wine_amadeus,monster_isle,moe_ihilani} <= {sanity_minnie,sheep_grams,art_potato,hinge_vegan,hotdog_arthur,deng_love_in,wine_amadeus,monster_isle,moe_ihilani} - 123;
  end

reg feedback_pt_549;

always @(sake_waster or feedback_pt_549)
  begin
      smack_ohno = !sake_waster ^  feedback_pt_549;
  end

reg feedback_pt_550;

always @(vcc or feedback_pt_550)
  begin
      crab_golf = !vcc ^ !feedback_pt_550;
  end

reg feedback_pt_551;

always @(jacques_macys or feedback_pt_551)
  begin
      draco_moulin =  jacques_macys ^  feedback_pt_551;
  end

reg feedback_pt_552;

always @(asahi_bloom or feedback_pt_552)
  begin
      blessyou_meth =  asahi_bloom | !feedback_pt_552;
  end

reg feedback_pt_553;

always @(turtle_kilo or feedback_pt_553)
  begin
      ernie_spyro =  turtle_kilo & !feedback_pt_553;
  end

reg feedback_pt_554;

always @(vcc or feedback_pt_554)
  begin
      siamese_rojas = !vcc | !feedback_pt_554;
  end

reg feedback_pt_555;

always @(burnout_louie or feedback_pt_555)
  begin
      homer_pirate =  burnout_louie | !feedback_pt_555;
  end

reg feedback_pt_556;

always @(doc_pictures or feedback_pt_556)
  begin
      whammy_kabar =  doc_pictures ^  feedback_pt_556;
  end

reg feedback_pt_557;

always @(lion_would or feedback_pt_557)
  begin
      remus_bagel = !lion_would | !feedback_pt_557;
  end

reg feedback_pt_558;

always @(jacques_macys or feedback_pt_558)
  begin
      purple_vegan =  jacques_macys | !feedback_pt_558;
  end

reg feedback_pt_559;

always @(heidi_joker or feedback_pt_559)
  begin
      exodus_grumpy =  heidi_joker &  feedback_pt_559;
  end

reg feedback_pt_560;

always @(platypus_mars or feedback_pt_560)
  begin
      ibm_rocks = !platypus_mars &  feedback_pt_560;
  end

reg feedback_pt_561;

always @(huhhuh_smack or feedback_pt_561)
  begin
      plague_tango = !huhhuh_smack ^ !feedback_pt_561;
  end

reg feedback_pt_562;

always @(gnd or feedback_pt_562)
  begin
      aspirin_papa =  gnd ^ !feedback_pt_562;
  end

reg feedback_pt_563;

always @(vcc or feedback_pt_563)
  begin
      zi_chowmein = !vcc ^ !feedback_pt_563;
  end

reg feedback_pt_564;

always @(vcc or feedback_pt_564)
  begin
      zi_bloom =  vcc ^  feedback_pt_564;
  end

reg feedback_pt_565;

always @(monster_isle or feedback_pt_565)
  begin
      goat_marco =  monster_isle ^ !feedback_pt_565;
  end

reg feedback_pt_566;

always @(kungfu_itchy or feedback_pt_566)
  begin
      helena_rubik = !kungfu_itchy ^ !feedback_pt_566;
  end

reg feedback_pt_567;

always @(mortar_alpha or feedback_pt_567)
  begin
      sleepy_marco = !mortar_alpha & !feedback_pt_567;
  end

wire bison_gotone_wire;

dffeas bison_gotone_ff (
  .clk(clock1),
  .d(vegas_emails),
  .ena(gnd),
  .sclr(gnd),
  .sload(rat_fsncens),
  .asdata(touch_safeway),
  .clrn(!reset1),
  .q(bison_gotone_wire)
);

always @(bison_gotone_wire) begin
   pork_mine = bison_gotone_wire;
end

always @(pork_mine)
  begin
      feedback_pt_549 = pork_mine;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fallen_pyro <= 0;
    else if (Iwin_neon)
      fallen_pyro <= 0;
    else if (vcc)
      fallen_pyro <= vcc;
  end

always @(fallen_pyro)
  begin
      feedback_pt_550 = fallen_pyro;
  end

always @(fallen_pyro)
  begin
      feedback_pt_551 = fallen_pyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuckoo_cuckoo <= 0;
    else
      cuckoo_cuckoo <= leaky_mortar;
  end

always @(cuckoo_cuckoo)
  begin
      feedback_pt_552 = cuckoo_cuckoo;
  end

always @(cuckoo_cuckoo)
  begin
      feedback_pt_553 = cuckoo_cuckoo;
  end

always @(cuckoo_cuckoo)
  begin
      feedback_pt_554 = cuckoo_cuckoo;
  end

always @(cuckoo_cuckoo)
  begin
      feedback_pt_555 = cuckoo_cuckoo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nigiri_donut <= 1;
    else
      nigiri_donut <= bambi_lao;
  end

always @(nigiri_donut)
  begin
      feedback_pt_556 = nigiri_donut;
  end

always @(nigiri_donut)
  begin
      feedback_pt_557 = nigiri_donut;
  end

wire paper_yoku_wire;

dffeas paper_yoku_ff (
  .clk(clock1),
  .d(gnd),
  .ena(gnd),
  .sclr(ernie_spyro),
  .sload(lala_rojas),
  .asdata(crab_crayons),
  .clrn(!reset1),
  .q(paper_yoku_wire)
);

always @(paper_yoku_wire) begin
   zinc_foxtrot = paper_yoku_wire;
end

always @(zinc_foxtrot)
  begin
      feedback_pt_558 = zinc_foxtrot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      money_picture <= 0;
    else if (vcc)
      money_picture <= madeye_badger;
    else if (zi_zed)
      money_picture <= 0;
  end

always @(money_picture)
  begin
      feedback_pt_559 = money_picture;
  end

wire whale_mexico_wire;

dffeas whale_mexico_ff (
  .clk(clock1),
  .d(platypus_mars),
  .ena(lotus_salami),
  .sclr(hp_richard),
  .sload(gnd),
  .asdata(aspirin_papa),
  .clrn(!reset1),
  .q(whale_mexico_wire)
);

always @(whale_mexico_wire) begin
   ebay_ihilani = whale_mexico_wire;
end

always @(ebay_ihilani)
  begin
      feedback_pt_560 = ebay_ihilani;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tiger_tako <= 0;
    else if (bear_candle)
      tiger_tako <= clay_marco;
    else if (rufus_black)
      tiger_tako <= 0;
  end

always @(tiger_tako)
  begin
      feedback_pt_561 = tiger_tako;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sleepy_gin <= 0;
    else if (vcc)
      sleepy_gin <= zinc_zealot;
    else if (hp_asahi)
      sleepy_gin <= 0;
  end

always @(sleepy_gin)
  begin
      feedback_pt_562 = sleepy_gin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      asahi_too_big <= 1;
    else
      asahi_too_big <= xterm_wakey;
  end

always @(asahi_too_big)
  begin
      feedback_pt_563 = asahi_too_big;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hulk_feynman <= 1;
    else
      hulk_feynman <= gnd;
  end

always @(hulk_feynman)
  begin
      feedback_pt_564 = hulk_feynman;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      west_athena <= 1;
    else
      west_athena <= money_picture;
  end

always @(west_athena)
  begin
      feedback_pt_565 = west_athena;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_india <= 0;
    else if (vcc)
      kilo_india <= vcc;
    else if (waster_minnie)
      kilo_india <= 0;
  end

always @(kilo_india)
  begin
      feedback_pt_566 = kilo_india;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      over_rabbi <= 0;
    else if (gnd)
      over_rabbi <= muffin_joseph;
    else if (vcc)
      over_rabbi <= 0;
  end

always @(over_rabbi)
  begin
      feedback_pt_567 = over_rabbi;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      klaas_oitcen <= 0;
    else
      klaas_oitcen <= hummer_potter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      touch_homerun <= 0;
    else
      touch_homerun <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sapporo_chuck <= 1;
    else
      sapporo_chuck <= goat_wujing;
  end

wire gin_zhuang_wire;

dffea gin_zhuang_ff (
  .clk(clock1),
  .d(turkey_ohno),
  .ena(ernie_spyro),
  .adata(fang_honda),
  .clrn(!reset1),
  .q(gin_zhuang_wire)
);

always @(gin_zhuang_wire) begin
   animal_danger = gin_zhuang_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      flew_valve <= 0;
    else
      flew_valve <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romex_pyro <= 1;
    else
      romex_pyro <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      otter_warlock <= 1;
    else
      otter_warlock <= golf_xiaoping;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      escape_questo <= 0;
    else if (rerun_tapered)
      escape_questo <= 0;
    else if (rum_thankee)
      escape_questo <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      peta_zinc <= 0;
    else
      peta_zinc <= gnd;
  end

wire fire_pierre_wire;

dffeas fire_pierre_ff (
  .clk(clock1),
  .d(smack_ohno),
  .ena(gnd),
  .sclr(gnd),
  .sload(peta_zinc),
  .asdata(vcc),
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
    else if (touch_homerun)
      loud_brian <= deuce_juliet;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wujing_rubik <= 0;
    else if (sanity_minnie)
      wujing_rubik <= sleepy_marco;
  end

wire protest_goofy_wire;

dffeas protest_goofy_ff (
  .clk(clock1),
  .d(ebi_iwocensor),
  .ena(macys_draco),
  .sclr(animal_danger),
  .sload(vcc),
  .asdata(tango_lala),
  .clrn(!reset1),
  .q(protest_goofy_wire)
);

always @(protest_goofy_wire) begin
   rerun_marker = protest_goofy_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spain_wonton <= 0;
    else if (vcc)
      spain_wonton <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bep_rafting <= 0;
    else if (abraham_yoda)
      bep_rafting <= mortar_school;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_floride <= 0;
    else
      cain_floride <= bison_midas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tank_nhtcenso <= 0;
    else
      tank_nhtcenso <= nyc_witch;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      donald_dig <= 1;
    else
      donald_dig <= onthepc_guy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whammy_green <= 1;
    else
      whammy_green <= neville_xterm;
  end

wire nail_north_wire;

dffeas nail_north_ff (
  .clk(clock1),
  .d(vcc),
  .ena(louie_mideast),
  .sclr(vcc),
  .sload(rubik_palmer),
  .asdata(vcc),
  .clrn(!reset1),
  .q(nail_north_wire)
);

always @(nail_north_wire) begin
   curie_cheez = nail_north_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      east_boots <= 1;
    else
      east_boots <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romex_ginger <= 0;
    else if (vcc)
      romex_ginger <= vcc;
    else if (tofu_bonker)
      romex_ginger <= 0;
  end

wire hinge_nirish_wire;

dffea hinge_nirish_ff (
  .clk(clock1),
  .d(flew_valve),
  .ena(hinge_vegan),
  .adata(vcc),
  .clrn(!reset1),
  .q(hinge_nirish_wire)
);

always @(hinge_nirish_wire) begin
   pdiddy_tracy = hinge_nirish_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      att_hinge <= 0;
    else if (tasty_jjocen)
      att_hinge <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ocean_think <= 0;
    else
      ocean_think <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      burrito_venus <= 0;
    else if (opus_liberace)
      burrito_venus <= neville_xray;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ceres_mars <= 0;
    else if (kappa_drax)
      ceres_mars <= 0;
    else if (atomic_joker)
      ceres_mars <= gnd;
  end

reg feedback_pt_568;

always @(vicks_monster or feedback_pt_568)
  begin
      dweebie_elian =  vicks_monster | !feedback_pt_568;
  end

reg feedback_pt_569;

always @(kappa_bismuth or feedback_pt_569)
  begin
      rodent_ford =  kappa_bismuth &  feedback_pt_569;
  end

reg feedback_pt_570;

always @(cain_floride or feedback_pt_570)
  begin
      yoku_zed =  cain_floride |  feedback_pt_570;
  end

reg feedback_pt_571;

always @(siamese_rojas or feedback_pt_571)
  begin
      wakey_zebra =  siamese_rojas ^ !feedback_pt_571;
  end

reg feedback_pt_572;

always @(gnd or feedback_pt_572)
  begin
      bfi_quebec = !gnd | !feedback_pt_572;
  end

reg feedback_pt_573;

always @(vegas_clay or feedback_pt_573)
  begin
      england_red = !vegas_clay | !feedback_pt_573;
  end

reg feedback_pt_574;

always @(homer_pirate or feedback_pt_574)
  begin
      giraffe_hp =  homer_pirate &  feedback_pt_574;
  end

reg feedback_pt_575;

always @(rerun_marker or feedback_pt_575)
  begin
      blue_popcorn =  rerun_marker ^  feedback_pt_575;
  end

reg feedback_pt_576;

always @(ocean_think or feedback_pt_576)
  begin
      bull_rufus =  ocean_think ^  feedback_pt_576;
  end

reg feedback_pt_577;

always @(vcc or feedback_pt_577)
  begin
      subway_speed = !vcc &  feedback_pt_577;
  end

reg feedback_pt_578;

always @(gnd or feedback_pt_578)
  begin
      rose_roe =  gnd & !feedback_pt_578;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rarest_newt <= 1;
    else
      rarest_newt <= tonks_fallen;
  end

always @(rarest_newt)
  begin
      feedback_pt_568 = rarest_newt;
  end

always @(rarest_newt)
  begin
      feedback_pt_569 = rarest_newt;
  end

always @(rarest_newt)
  begin
      feedback_pt_570 = rarest_newt;
  end

always @(rarest_newt)
  begin
      feedback_pt_571 = rarest_newt;
  end

always @(rarest_newt)
  begin
      feedback_pt_572 = rarest_newt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lion_hotdog <= 0;
    else if (webvan_bubba)
      lion_hotdog <= 0;
    else if (gnd)
      lion_hotdog <= hp_asahi;
  end

always @(lion_hotdog)
  begin
      feedback_pt_573 = lion_hotdog;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pizza_tapered <= 0;
    else
      pizza_tapered <= vcc;
  end

always @(pizza_tapered)
  begin
      feedback_pt_574 = pizza_tapered;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      testyour_duey <= 0;
    else if (rubik_whack)
      testyour_duey <= lemon_tapered;
  end

always @(testyour_duey)
  begin
      feedback_pt_575 = testyour_duey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gyro_copper <= 0;
    else if (testyour_duey)
      gyro_copper <= 0;
    else if (ibm_rocks)
      gyro_copper <= zulu_satanist;
  end

always @(gyro_copper)
  begin
      feedback_pt_576 = gyro_copper;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_moonraker <= 1;
    else
      pcp_moonraker <= nigiri_donut;
  end

always @(pcp_moonraker)
  begin
      feedback_pt_577 = pcp_moonraker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fronds_shuda <= 0;
    else if (flew_valve)
      fronds_shuda <= 0;
    else if (leaky_mortar)
      fronds_shuda <= tukatuk_mike;
  end

always @(fronds_shuda)
  begin
      feedback_pt_578 = fronds_shuda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      due_guacamole <= 0;
    else
      due_guacamole <= bloom_batman;
  end

wire soccer_viagra_wire;

dffeas soccer_viagra_ff (
  .clk(clock1),
  .d(psycho_danger),
  .ena(sneezy_junkie),
  .sclr(togos_haze),
  .sload(art_potato),
  .asdata(questo_tamago),
  .clrn(!reset1),
  .q(soccer_viagra_wire)
);

always @(soccer_viagra_wire) begin
   wicked_gonzo = soccer_viagra_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      emu_ebay <= 0;
    else if (sapporo_chuck)
      emu_ebay <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      victor_copper <= 0;
    else if (togos_haze)
      victor_copper <= 0;
    else if (flew_valve)
      victor_copper <= dweebie_elian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blessyou_palm <= 0;
    else if (hp_asahi)
      blessyou_palm <= gnd;
    else if (rubik_whack)
      blessyou_palm <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      webvan_thor <= 1;
    else
      webvan_thor <= loud_brian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      aladdin_egg <= 0;
    else if (zulu_satanist)
      aladdin_egg <= deng_love_in;
  end

wire portnoy_lost_wire;

dffeas portnoy_lost_ff (
  .clk(clock1),
  .d(hulk_feynman),
  .ena(emu_ebay),
  .sclr(vcc),
  .sload(kanji_mars),
  .asdata(vcc),
  .clrn(!reset1),
  .q(portnoy_lost_wire)
);

always @(portnoy_lost_wire) begin
   vangoh_lovey = portnoy_lost_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popacap_goofy <= 0;
    else if (golf_xiaoping)
      popacap_goofy <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      brian_cuanto <= 0;
    else if (kanji_mars)
      brian_cuanto <= lion_would;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xray_arcade <= 0;
    else
      xray_arcade <= hours_would;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yoda_cubish <= 1;
    else
      yoda_cubish <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      willy_lxtcen <= 0;
    else if (vcc)
      willy_lxtcen <= loud_brian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fsncens_draco <= 0;
    else if (xterm_wakey)
      fsncens_draco <= vcc;
    else if (klaas_oitcen)
      fsncens_draco <= 0;
  end

wire intuit_nyquil_wire;

dffeas intuit_nyquil_ff (
  .clk(clock1),
  .d(rouge_plaster),
  .ena(vcc),
  .sclr(doc_pictures),
  .sload(burrito_venus),
  .asdata(vcc),
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
    else if (vcc)
      wicked_desade <= 0;
    else if (mexico_green)
      wicked_desade <= plague_tango;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      scotland_over <= 0;
    else if (exodus_grumpy)
      scotland_over <= boing_freaky;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      century_delta <= 0;
    else if (bambi_lao)
      century_delta <= 0;
    else if (klaas_oitcen)
      century_delta <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      naproxen_loud <= 1;
    else
      naproxen_loud <= kmfdm_bismuth;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_narcissa <= 0;
    else
      rose_narcissa <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      erncenso_mine <= 0;
    else
      erncenso_mine <= joey_golden;
  end

wire hercules_opus_wire;

dffeas hercules_opus_ff (
  .clk(clock1),
  .d(lumber_crucio),
  .ena(hp_zeus),
  .sclr(winner_cubish),
  .sload(vcc),
  .asdata(tango_lala),
  .clrn(!reset1),
  .q(hercules_opus_wire)
);

always @(hercules_opus_wire) begin
   crack_sortout = hercules_opus_wire;
end

wire meth_ykocens_wire;

dffeas meth_ykocens_ff (
  .clk(clock1),
  .d(fallen_pyro),
  .ena(arthur_ring),
  .sclr(arthur_ring),
  .sload(wicked_gonzo),
  .asdata(cuckoo_cuckoo),
  .clrn(!reset1),
  .q(meth_ykocens_wire)
);

always @(meth_ykocens_wire) begin
   bach_salami = meth_ykocens_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_wood <= 0;
    else if (yoda_cubish)
      salmon_wood <= sneezy_zealot;
    else if (witch_drugs)
      salmon_wood <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_comrade <= 0;
    else if (otter_warlock)
      life_comrade <= crack_sortout;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      babette_chuck <= 0;
    else if (usa_salmon)
      babette_chuck <= 0;
    else if (bach_salami)
      babette_chuck <= att_hinge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      sogood_ceres <= 0;
    else
      sogood_ceres <= moe_stroop;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      often_tylenol <= 0;
    else if (vcc)
      often_tylenol <= oranje_beef;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shark_pork <= 0;
    else if (ceres_mars)
      shark_pork <= pork_mine;
    else if (popacap_goofy)
      shark_pork <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      quail_shemp <= 1;
    else
      quail_shemp <= rouge_plaster;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tortilla_red <= 1;
    else
      tortilla_red <= hummer_star;
  end

wire alpha_black_wire;

dffeas alpha_black_ff (
  .clk(clock1),
  .d(vcc),
  .ena(tiger_tako),
  .sclr(vcc),
  .sload(vcc),
  .asdata(brian_cuanto),
  .clrn(!reset1),
  .q(alpha_black_wire)
);

always @(alpha_black_wire) begin
   cat_whiskey = alpha_black_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ebi_bert <= 1;
    else
      ebi_bert <= gnd;
  end

// State Mek amadeus_stick Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      amadeus_stick <= amadeus_stick_0;
    else
      case (amadeus_stick)
        amadeus_stick_0: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 13)
            amadeus_stick <= amadeus_stick_0;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 3)
            amadeus_stick <= amadeus_stick_9;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 2)
            amadeus_stick <= amadeus_stick_3;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 15)
            amadeus_stick <= amadeus_stick_5;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 10)
            amadeus_stick <= amadeus_stick_0;
          else
            amadeus_stick <= amadeus_stick_0;
          end
        amadeus_stick_1: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 9)
            amadeus_stick <= amadeus_stick_5;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 0)
            amadeus_stick <= amadeus_stick_8;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 4)
            amadeus_stick <= amadeus_stick_2;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 2)
            amadeus_stick <= amadeus_stick_1;
          else
            amadeus_stick <= amadeus_stick_1;
          end
        amadeus_stick_2: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 0)
            amadeus_stick <= amadeus_stick_0;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 13)
            amadeus_stick <= amadeus_stick_3;
          else
            amadeus_stick <= amadeus_stick_2;
          end
        amadeus_stick_3: begin
            amadeus_stick <= amadeus_stick_3;
          end
        amadeus_stick_4: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 9)
            amadeus_stick <= amadeus_stick_2;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 7)
            amadeus_stick <= amadeus_stick_9;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 10)
            amadeus_stick <= amadeus_stick_8;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 1)
            amadeus_stick <= amadeus_stick_5;
          else
            amadeus_stick <= amadeus_stick_4;
          end
        amadeus_stick_5: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 2)
            amadeus_stick <= amadeus_stick_7;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 9)
            amadeus_stick <= amadeus_stick_0;
          else
            amadeus_stick <= amadeus_stick_5;
          end
        amadeus_stick_6: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 12)
            amadeus_stick <= amadeus_stick_9;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 5)
            amadeus_stick <= amadeus_stick_6;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 7)
            amadeus_stick <= amadeus_stick_8;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 9)
            amadeus_stick <= amadeus_stick_5;
          else
            amadeus_stick <= amadeus_stick_6;
          end
        amadeus_stick_7: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 9)
            amadeus_stick <= amadeus_stick_5;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 4)
            amadeus_stick <= amadeus_stick_6;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 15)
            amadeus_stick <= amadeus_stick_1;
          else
            amadeus_stick <= amadeus_stick_7;
          end
        amadeus_stick_8: begin
            amadeus_stick <= amadeus_stick_8;
          end
        amadeus_stick_9: begin
          if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 15)
            amadeus_stick <= amadeus_stick_4;
          else if ({popacap_goofy,romex_ginger,rum_partners,copper_due} == 13)
            amadeus_stick <= amadeus_stick_6;
          else
            amadeus_stick <= amadeus_stick_9;
          end
        default: amadeus_stick <= amadeus_stick_0;
      endcase
  end

// State Mek amadeus_stick Output logic
always @(amadeus_stick)
  begin
    // consider all state regs when doing outputs
    case (amadeus_stick)
        amadeus_stick_0: begin
            elian_heidi = 0;
            whale_elguapo = 1;
            moses_dig = 0;
            rose_marvin = 1;
            drugie_diagon = 0;
            pixie_rufus = 0;
            century_vegas = 1;
            aphid_pluto = 1;
            taoist_dipsy = 0;
            barty_maryann = 0;
            lala_cannon = 1;
            klaas_tesla = 1;
            naproxen_blue = 1;
            pyro_booming = 1;
            ebi_madeye = 0;
          end
        amadeus_stick_1: begin
            elian_heidi = 0;
            whale_elguapo = 0;
            moses_dig = 0;
            rose_marvin = 1;
            drugie_diagon = 0;
            pixie_rufus = 0;
            century_vegas = 1;
            aphid_pluto = 0;
            taoist_dipsy = 0;
            barty_maryann = 0;
            lala_cannon = 1;
            klaas_tesla = 1;
            naproxen_blue = 1;
            pyro_booming = 0;
            ebi_madeye = 1;
          end
        amadeus_stick_2: begin
            elian_heidi = 0;
            whale_elguapo = 1;
            moses_dig = 1;
            rose_marvin = 0;
            drugie_diagon = 0;
            pixie_rufus = 1;
            century_vegas = 1;
            aphid_pluto = 1;
            taoist_dipsy = 0;
            barty_maryann = 0;
            lala_cannon = 1;
            klaas_tesla = 1;
            naproxen_blue = 0;
            pyro_booming = 0;
            ebi_madeye = 0;
          end
        amadeus_stick_3: begin
            elian_heidi = 0;
            whale_elguapo = 0;
            moses_dig = 0;
            rose_marvin = 0;
            drugie_diagon = 0;
            pixie_rufus = 0;
            century_vegas = 0;
            aphid_pluto = 1;
            taoist_dipsy = 1;
            barty_maryann = 1;
            lala_cannon = 0;
            klaas_tesla = 0;
            naproxen_blue = 1;
            pyro_booming = 1;
            ebi_madeye = 1;
          end
        amadeus_stick_4: begin
            elian_heidi = 1;
            whale_elguapo = 0;
            moses_dig = 0;
            rose_marvin = 0;
            drugie_diagon = 0;
            pixie_rufus = 0;
            century_vegas = 1;
            aphid_pluto = 0;
            taoist_dipsy = 0;
            barty_maryann = 0;
            lala_cannon = 1;
            klaas_tesla = 0;
            naproxen_blue = 1;
            pyro_booming = 1;
            ebi_madeye = 0;
          end
        amadeus_stick_5: begin
            elian_heidi = 0;
            whale_elguapo = 0;
            moses_dig = 1;
            rose_marvin = 1;
            drugie_diagon = 0;
            pixie_rufus = 1;
            century_vegas = 1;
            aphid_pluto = 0;
            taoist_dipsy = 1;
            barty_maryann = 1;
            lala_cannon = 1;
            klaas_tesla = 0;
            naproxen_blue = 0;
            pyro_booming = 0;
            ebi_madeye = 1;
          end
        amadeus_stick_6: begin
            elian_heidi = 0;
            whale_elguapo = 0;
            moses_dig = 1;
            rose_marvin = 0;
            drugie_diagon = 1;
            pixie_rufus = 0;
            century_vegas = 1;
            aphid_pluto = 1;
            taoist_dipsy = 0;
            barty_maryann = 1;
            lala_cannon = 0;
            klaas_tesla = 0;
            naproxen_blue = 0;
            pyro_booming = 1;
            ebi_madeye = 0;
          end
        amadeus_stick_7: begin
            elian_heidi = 1;
            whale_elguapo = 0;
            moses_dig = 0;
            rose_marvin = 1;
            drugie_diagon = 1;
            pixie_rufus = 0;
            century_vegas = 1;
            aphid_pluto = 1;
            taoist_dipsy = 0;
            barty_maryann = 0;
            lala_cannon = 0;
            klaas_tesla = 1;
            naproxen_blue = 1;
            pyro_booming = 1;
            ebi_madeye = 0;
          end
        amadeus_stick_8: begin
            elian_heidi = 0;
            whale_elguapo = 0;
            moses_dig = 0;
            rose_marvin = 0;
            drugie_diagon = 0;
            pixie_rufus = 0;
            century_vegas = 0;
            aphid_pluto = 0;
            taoist_dipsy = 1;
            barty_maryann = 1;
            lala_cannon = 1;
            klaas_tesla = 0;
            naproxen_blue = 0;
            pyro_booming = 1;
            ebi_madeye = 0;
          end
        amadeus_stick_9: begin
            elian_heidi = 1;
            whale_elguapo = 1;
            moses_dig = 1;
            rose_marvin = 1;
            drugie_diagon = 1;
            pixie_rufus = 1;
            century_vegas = 0;
            aphid_pluto = 0;
            taoist_dipsy = 1;
            barty_maryann = 1;
            lala_cannon = 1;
            klaas_tesla = 1;
            naproxen_blue = 0;
            pyro_booming = 0;
            ebi_madeye = 0;
          end
        default: begin
            elian_heidi = 0;
            whale_elguapo = 0;
            moses_dig = 1;
            rose_marvin = 1;
            drugie_diagon = 0;
            pixie_rufus = 0;
            century_vegas = 0;
            aphid_pluto = 1;
            taoist_dipsy = 0;
            barty_maryann = 1;
            lala_cannon = 0;
            klaas_tesla = 0;
            naproxen_blue = 0;
            pyro_booming = 1;
            ebi_madeye = 1;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire siamese_pyro_out;
nut_001_lut #(1) nut_001_lut_inst_siamese_pyro (
  .din({money_picture}),
  .mask(2'b11),
  .out(siamese_pyro_out)
);

always @(siamese_pyro_out)
begin
   doc_whoiswho = siamese_pyro_out;
end

// Bus inputs for MACing
reg signed [10:0] drugs_chief_a;
reg  [8:0] drugs_chief_b;
reg  [18:0] drugs_chief_c;
reg  [16:0] drugs_chief_d;
always @(achilles_dig or rose_marvin or gnd or gnd or vcc or pyro_yummy or bep_pirate or subway_speed or homer_pirate or gnd or gnd) begin
  drugs_chief_a = {achilles_dig,rose_marvin,gnd,gnd,vcc,pyro_yummy,bep_pirate,subway_speed,homer_pirate,gnd,gnd};
end
always @(nyc_witch or vangoh_lovey or vcc or gnd or wine_athena or otter_warlock or xterm_sierra or blessyou_meth or achilles_dig) begin
  drugs_chief_b = {nyc_witch,vangoh_lovey,vcc,gnd,wine_athena,otter_warlock,xterm_sierra,blessyou_meth,achilles_dig};
end
always @(spain_wonton or vcc or fufu_bono or ebay_ihilani or hans_voodoo or pyro_booming or rose_narcissa or gnd or goat_marco or brian_cuanto or fufu_bono or lion_hotdog or eatem_pixie or aphid_pluto or neville_xterm or vcc or zi_bloom or hummer_star or sneezy_junkie) begin
  drugs_chief_c = {spain_wonton,vcc,fufu_bono,ebay_ihilani,hans_voodoo,pyro_booming,rose_narcissa,gnd,goat_marco,brian_cuanto,fufu_bono,lion_hotdog,eatem_pixie,aphid_pluto,neville_xterm,vcc,zi_bloom,hummer_star,sneezy_junkie};
end
always @(taoist_dipsy or vcc or blessyou_palm or sleepy_gin or moe_stroop or egg_cafe or vcc or bfi_curious or luthor_sleepy or rarest_newt or tracy_snape or due_guacamole or raiders_loser or bear_cow or erncenso_mine or pcp_moonraker or nyc_witch) begin
  drugs_chief_d = {taoist_dipsy,vcc,blessyou_palm,sleepy_gin,moe_stroop,egg_cafe,vcc,bfi_curious,luthor_sleepy,rarest_newt,tracy_snape,due_guacamole,raiders_loser,bear_cow,erncenso_mine,pcp_moonraker,nyc_witch};
end

// MAC inference bait
always @(drugs_chief_a or drugs_chief_b or drugs_chief_c or drugs_chief_d)
  begin
    {holland_zeus,curious_vicks,condit_bambi,devotion_mao,over_athena,minnow_potter,grumpy_hotel} = 
        ( drugs_chief_a *
        drugs_chief_b) +
        ( drugs_chief_c *
         drugs_chief_d);
  end

// Greater Equal Less compare
always @(klaas_tesla or att_hinge or wonder_bart or gnd)
  begin
    if ({klaas_tesla,att_hinge} > {wonder_bart,gnd})
       {sinew_willem,stoned_zeus,golf_pizza} = 3'b100;
    else if ({klaas_tesla,att_hinge} < {wonder_bart,gnd})
       {sinew_willem,stoned_zeus,golf_pizza} = 3'b010;
    else
       {sinew_willem,stoned_zeus,golf_pizza} = 3'b001;
  end

// OR all of these bits together
always @(rum_thankee or wonder_bart)
  begin
      kebab_books = | {rum_thankee,wonder_bart};
  end

// 4 input 4 output permutation
always @(neville_xterm or naproxen_loud or willy_lxtcen or zi_chowmein)
  begin
    case ({neville_xterm,naproxen_loud,willy_lxtcen,zi_chowmein})
      0: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=10;
      1: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=1;
      2: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=14;
      3: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=2;
      4: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=0;
      5: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=4;
      6: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=5;
      7: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=7;
      8: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=3;
      9: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=13;
      10: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=11;
      11: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=12;
      12: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=6;
      13: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=9;
      14: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=15;
      15: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=8;
      default: {dig_molokai,whatelse_bull,lala_drugs,nuclear_jonas}=0;
    endcase
  end


// building a 128 to 1 MUX operator
reg [127:0] tobe_fear_mux_dat;
reg [6:0] tobe_fear_mux_sel;
always @(escape_acid or vcc or escape_questo or cocaine_bush or platinum_clay or popacap_goofy or ebi_madeye or cat_whiskey or art_jupiter or whatelse_bull or quail_shemp or hotdog_arthur or fsncens_draco or blue_popcorn or giraffe_hp or dweebie_elian or nasdaq_doc or psycho_danger or kilo_star or klaas_tesla or gnd or turtle_kilo or loud_art or quail_shemp or vcc or shark_pork or tank_nhtcenso or kmfdm_bismuth or gnd or tapered_dig or lala_drugs or nasdaq_doc or naproxen_blue or draco_moulin or abraham_yoda or tank_nhtcenso or rerun_marker or armand_tesla or fronds_shuda or platinum_clay or sneezy_zealot or gnd or usa_salmon or vcc or ghost_school or vcc or monster_isle or grumpy_hotel or popacap_goofy or england_red or money_picture or advil_picture or zi_chowmein or gnd or yoku_zed or east_boots or pixie_rufus or rodent_ford or vcc or gnd or wine_amadeus or cain_floride or ghost_school or siamese_rojas or lion_hotdog or gnd or zinc_foxtrot or aladdin_egg or ramone_jcrew or goat_wujing or babette_chuck or gnd or rarest_yummy or eatem_lotus or sapporo_chuck or gnd or romex_pyro or draco_moulin or barty_maryann or oranje_beef or vcc or dipsy_ants or gnd or babette_chuck or kappa_drax or zi_bloom or turtle_kilo or wine_amadeus or wujing_rubik or genji_fuji or crab_golf or rasp_green or golf_pizza or dutch_ostrich or whammy_kabar or kennyg_barney or vcc or stoned_zeus or boing_freaky or century_vegas or century_vegas or mickey_fish or itchy_fallen or gnd or hp_asahi or neville_xterm or life_comrade or whammy_kabar or webvan_doc or wicked_desade or vcc or rouge_plaster or sinew_willem or kappa_drax or raiders_loser or lad_spirit or gnd or wicked_gonzo or over_rabbi or pixie_rufus or aladdin_egg or wakey_zebra or vcc or money_picture or vcc or curious_vicks or vcc or vcc)
  begin
    tobe_fear_mux_dat = {escape_acid,vcc,escape_questo,cocaine_bush,platinum_clay,popacap_goofy,ebi_madeye,cat_whiskey,art_jupiter,whatelse_bull,quail_shemp,hotdog_arthur,fsncens_draco,blue_popcorn,giraffe_hp,dweebie_elian,nasdaq_doc,psycho_danger,kilo_star,klaas_tesla,gnd,turtle_kilo,loud_art,quail_shemp,vcc,shark_pork,tank_nhtcenso,kmfdm_bismuth,gnd,tapered_dig,lala_drugs,nasdaq_doc,naproxen_blue,draco_moulin,abraham_yoda,tank_nhtcenso,rerun_marker,armand_tesla,fronds_shuda,platinum_clay,sneezy_zealot,gnd,usa_salmon,vcc,ghost_school,vcc,monster_isle,grumpy_hotel,popacap_goofy,england_red,money_picture,advil_picture,zi_chowmein,gnd,yoku_zed,east_boots,pixie_rufus,rodent_ford,vcc,gnd,wine_amadeus,cain_floride,ghost_school,siamese_rojas,lion_hotdog,gnd,zinc_foxtrot,aladdin_egg,ramone_jcrew,goat_wujing,babette_chuck,gnd,rarest_yummy,eatem_lotus,sapporo_chuck,gnd,romex_pyro,draco_moulin,barty_maryann,oranje_beef,vcc,dipsy_ants,gnd,babette_chuck,kappa_drax,zi_bloom,turtle_kilo,wine_amadeus,wujing_rubik,genji_fuji,crab_golf,rasp_green,golf_pizza,dutch_ostrich,whammy_kabar,kennyg_barney,vcc,stoned_zeus,boing_freaky,century_vegas,century_vegas,mickey_fish,itchy_fallen,gnd,hp_asahi,neville_xterm,life_comrade,whammy_kabar,webvan_doc,wicked_desade,vcc,rouge_plaster,sinew_willem,kappa_drax,raiders_loser,lad_spirit,gnd,wicked_gonzo,over_rabbi,pixie_rufus,aladdin_egg,wakey_zebra,vcc,money_picture,vcc,curious_vicks,vcc,vcc};
  end

always @(bep_rafting or whale_elguapo or art_jupiter or touch_safeway or minnow_potter or achilles_dig or ebay_ihilani)
  begin
    tobe_fear_mux_sel = {bep_rafting,whale_elguapo,art_jupiter,touch_safeway,minnow_potter,achilles_dig,ebay_ihilani};
  end

always @(tobe_fear_mux_dat or tobe_fear_mux_sel)
  begin
    rocks_lumber = tobe_fear_mux_dat[tobe_fear_mux_sel];
  end

reg feedback_pt_579;

always @(vcc or feedback_pt_579)
  begin
      juliet_simasu = !vcc ^  feedback_pt_579;
  end

reg feedback_pt_580;

always @(whammy_green or feedback_pt_580)
  begin
      sheep_octapus = !whammy_green & !feedback_pt_580;
  end

reg feedback_pt_581;

always @(togos_piggish or feedback_pt_581)
  begin
      midas_balloon =  togos_piggish ^ !feedback_pt_581;
  end

reg feedback_pt_582;

always @(macys_draco or feedback_pt_582)
  begin
      filch_rojas =  macys_draco |  feedback_pt_582;
  end

reg feedback_pt_583;

always @(achilles_dig or feedback_pt_583)
  begin
      husks_minnow =  achilles_dig &  feedback_pt_583;
  end

reg feedback_pt_584;

always @(gnd or feedback_pt_584)
  begin
      kang_howell =  gnd & !feedback_pt_584;
  end

reg feedback_pt_585;

always @(rouge_plaster or feedback_pt_585)
  begin
      due_valve =  rouge_plaster | !feedback_pt_585;
  end

reg feedback_pt_586;

always @(sogood_ceres or feedback_pt_586)
  begin
      alpha_zeus = !sogood_ceres & !feedback_pt_586;
  end

reg feedback_pt_587;

always @(taoist_dipsy or feedback_pt_587)
  begin
      extremist_due = !taoist_dipsy | !feedback_pt_587;
  end

reg feedback_pt_588;

always @(curie_cheez or feedback_pt_588)
  begin
      sneezy_zulu = !curie_cheez &  feedback_pt_588;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      workhere_mao <= 0;
    else
      workhere_mao <= pdiddy_tracy;
  end

always @(workhere_mao)
  begin
      feedback_pt_579 = workhere_mao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      castaway_bull <= 0;
    else
      castaway_bull <= rouge_plaster;
  end

always @(castaway_bull)
  begin
      feedback_pt_580 = castaway_bull;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      intel_warlock <= 0;
    else if (tracy_snape)
      intel_warlock <= macys_draco;
    else if (togos_piggish)
      intel_warlock <= 0;
  end

always @(intel_warlock)
  begin
      feedback_pt_581 = intel_warlock;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      captain_milo <= 0;
    else if (aladdin_egg)
      captain_milo <= husks_minnow;
    else if (gyro_copper)
      captain_milo <= 0;
  end

always @(captain_milo)
  begin
      feedback_pt_582 = captain_milo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gutter_giants <= 0;
    else if (holland_zeus)
      gutter_giants <= wonder_luthor;
  end

always @(gutter_giants)
  begin
      feedback_pt_583 = gutter_giants;
  end

wire shrimp_sogood_wire;

dffeas shrimp_sogood_ff (
  .clk(clock1),
  .d(rocks_lumber),
  .ena(midas_balloon),
  .sclr(itchy_fallen),
  .sload(vcc),
  .asdata(ramone_jcrew),
  .clrn(!reset1),
  .q(shrimp_sogood_wire)
);

always @(shrimp_sogood_wire) begin
   crank_comtrex = shrimp_sogood_wire;
end

always @(crank_comtrex)
  begin
      feedback_pt_584 = crank_comtrex;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rose_martian <= 0;
    else if (vcc)
      rose_martian <= 0;
    else if (doc_copper)
      rose_martian <= romex_ginger;
  end

always @(rose_martian)
  begin
      feedback_pt_585 = rose_martian;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      water_crystal <= 0;
    else
      water_crystal <= hans_voodoo;
  end

always @(water_crystal)
  begin
      feedback_pt_586 = water_crystal;
  end

wire money_wiggles_wire;

dffeas money_wiggles_ff (
  .clk(clock1),
  .d(midas_balloon),
  .ena(gnd),
  .sclr(water_crystal),
  .sload(mexico_green),
  .asdata(sneezy_zulu),
  .clrn(!reset1),
  .q(money_wiggles_wire)
);

always @(money_wiggles_wire) begin
   bloom_larry = money_wiggles_wire;
end

always @(bloom_larry)
  begin
      feedback_pt_587 = bloom_larry;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goblin_buddha <= 0;
    else if (xray_arcade)
      goblin_buddha <= gnd;
    else if (blessyou_palm)
      goblin_buddha <= 0;
  end

always @(goblin_buddha)
  begin
      feedback_pt_588 = goblin_buddha;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drugs_drunken <= 0;
    else
      drugs_drunken <= armand_tesla;
  end

wire air_goat_wire;

dffeas air_goat_ff (
  .clk(clock1),
  .d(dutch_ostrich),
  .ena(aphid_diagon),
  .sclr(arizona_newt),
  .sload(tesla_icarus),
  .asdata(vcc),
  .clrn(!reset1),
  .q(air_goat_wire)
);

always @(air_goat_wire) begin
   biker_school = air_goat_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stapler_hulk <= 0;
    else if (spirit_bust)
      stapler_hulk <= 0;
    else if (rose_martian)
      stapler_hulk <= curious_vicks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hours_floride <= 1;
    else
      hours_floride <= pcp_moonraker;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vadar_yoku <= 0;
    else if (boing_freaky)
      vadar_yoku <= winner_cubish;
    else if (fatality_noah)
      vadar_yoku <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pcp_tattoo <= 0;
    else
      pcp_tattoo <= century_delta;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      golden_boots <= 1;
    else
      golden_boots <= huey_banality;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bravo_foliage <= 0;
    else if (meth_athena)
      bravo_foliage <= rubik_whack;
    else if (taoist_dipsy)
      bravo_foliage <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      onion_egg <= 0;
    else
      onion_egg <= draco_salmon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drunken_paper <= 1;
    else
      drunken_paper <= captain_milo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      loud_bullet <= 0;
    else if (vcc)
      loud_bullet <= 0;
    else if (vcc)
      loud_bullet <= peta_zinc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lupin_bullet <= 0;
    else
      lupin_bullet <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cow_alpha <= 0;
    else if (sogood_ceres)
      cow_alpha <= rose_marvin;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_jxnbox <= 1;
    else
      kilo_jxnbox <= taoist_dipsy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rocks_killme <= 0;
    else if (century_vegas)
      rocks_killme <= drunken_paper;
    else if (over_athena)
      rocks_killme <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      safeway_egg <= 0;
    else
      safeway_egg <= drugie_diagon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dutch_zebra <= 0;
    else if (dipsy_ants)
      dutch_zebra <= deng_love_in;
    else if (gnd)
      dutch_zebra <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tobe_crystal <= 0;
    else if (doc_whoiswho)
      tobe_crystal <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      warlock_remus <= 0;
    else if (gnd)
      warlock_remus <= castaway_bull;
    else if (goblin_buddha)
      warlock_remus <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gutter_jcrew <= 0;
    else if (tobe_crystal)
      gutter_jcrew <= vcc;
    else if (bust_ocean)
      gutter_jcrew <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      jiminy_draco <= 1;
    else
      jiminy_draco <= safeway_egg;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wine_money <= 0;
    else if (sogood_ceres)
      wine_money <= devotion_mao;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tonks_marquis <= 0;
    else
      tonks_marquis <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonton_guy <= 0;
    else if (gutter_jcrew)
      wonton_guy <= extremist_due;
    else if (dutch_zebra)
      wonton_guy <= 0;
  end

// Triple add / sub bait
always @(vcc or hotdog_arthur or gnd or bubba_plague or due_valve or gnd or popacap_goofy or blue_tracy or gnd or vcc or cow_alpha or pizza_tapered or vcc or webvan_thor or
         due_valve or vcc or tortilla_red or popacap_goofy or moe_ihilani or meth_holland or gnd or victor_copper or gnd or filch_rojas or armand_tesla or sogood_ceres or armand_tesla or scotland_over or
         gnd or att_hinge or naproxen_loud or vcc or art_smack or bravo_foliage or century_delta or gnd or moe_ihilani or gnd or crank_comtrex or sears_rerun or asahi_too_big or rose_martian)
  begin
    {spock_cain,potato_bert,dragon_zen,float_severus,troll_water,pierre_tasty,heidi_neville,timmy_scotch,heidi_deuce,stroop_prison,jinyong_eagle,moulin_lizard,kilo_waffle,newt_bach} = 
        {vcc,hotdog_arthur,gnd,bubba_plague,due_valve,gnd,popacap_goofy,blue_tracy,gnd,vcc,cow_alpha,pizza_tapered,vcc,webvan_thor} +
        {due_valve,vcc,tortilla_red,popacap_goofy,moe_ihilani,meth_holland,gnd,victor_copper,gnd,filch_rojas,armand_tesla,sogood_ceres,armand_tesla,scotland_over} +
        {gnd,att_hinge,naproxen_loud,vcc,art_smack,bravo_foliage,century_delta,gnd,moe_ihilani,gnd,crank_comtrex,sears_rerun,asahi_too_big,rose_martian};
  end

// Ternary sign extend bait
always @(salmon_wood or salmon_wood or salmon_wood or salmon_wood or salmon_wood or salmon_wood or salmon_wood or donald_dig or newt_bach or gutter_giants or heidi_neville or sinew_willem or jason_emu or ebi_bert or jiminy_draco or
         gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or vcc or stapler_hulk or gnd or dipsy_ants or vcc or
         gnd or gnd or gnd or gnd or gnd or gnd or gnd or gnd or heidi_neville or art_smack or deng_love_in or curious_vicks or stapler_hulk or gnd or goblin_buddha)
  begin
    {starwars_rum,spastic_haze,ulysses_kappa,curly_frog,money_nirish,eel_iceland,salmon_think,plaster_isle,woman_elian,howell_dopey,pcp_nyc,trevor_beavis,stick_budlite,weevil_whammy,mortar_po} = 
        {salmon_wood,salmon_wood,salmon_wood,salmon_wood,salmon_wood,salmon_wood,salmon_wood,donald_dig,newt_bach,gutter_giants,heidi_neville,sinew_willem,jason_emu,ebi_bert,jiminy_draco} +
        {gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,vcc,stapler_hulk,gnd,dipsy_ants,vcc} -
        {gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,heidi_neville,art_smack,deng_love_in,curious_vicks,stapler_hulk,gnd,goblin_buddha};
  end

// 2s comp negate A
always @(sinew_willem or stick_budlite or rose_marvin or waster_minnie or vcc)
  begin
    {oldnavy_bacon,zealot_tesla,advil_gin,vicks_troll} = - {sinew_willem,stick_budlite,rose_marvin,waster_minnie,vcc};
  end

// Bus inputs for MACing
reg signed [18:0] usa_lizard_a;
reg signed [7:0] usa_lizard_b;
reg signed [18:0] usa_lizard_c;
reg  [7:0] usa_lizard_d;
always @(gnd or waster_minnie or often_tylenol or hans_voodoo or often_tylenol or filch_rojas or vcc or goat_marco or moulin_lizard or curious_vicks or dutch_zebra or gnd or vcc or kilo_waffle or wine_money or vcc or vcc or stoned_zeus or rubik_whack) begin
  usa_lizard_a = {gnd,waster_minnie,often_tylenol,hans_voodoo,often_tylenol,filch_rojas,vcc,goat_marco,moulin_lizard,curious_vicks,dutch_zebra,gnd,vcc,kilo_waffle,wine_money,vcc,vcc,stoned_zeus,rubik_whack};
end
always @(tonks_marquis or timmy_scotch or west_athena or float_severus or vadar_yoku or bull_rufus or gnd or mickey_fish) begin
  usa_lizard_b = {tonks_marquis,timmy_scotch,west_athena,float_severus,vadar_yoku,bull_rufus,gnd,mickey_fish};
end
initial usa_lizard_c <= 0;
always @(posedge clock1) begin
  usa_lizard_c <= {moses_dig,vcc,money_nirish,rarest_yummy,vcc,loud_bullet,kappa_drax,juliet_simasu,rocks_killme,money_nirish,hours_floride,gnd,potato_bert,howell_dopey,gnd,biker_school,starwars_rum,curly_frog,vicks_troll};
end
initial usa_lizard_d <= 0;
always @(posedge clock1) begin
  usa_lizard_d <= {heidi_deuce,wonder_bart,starwars_rum,vcc,vcc,gnd,condit_bambi,gnd};
end

// MAC inference bait
always @(usa_lizard_a or usa_lizard_b or usa_lizard_c or usa_lizard_d)
  begin
    {desade_vegas,pasta_wukong,kana_rerun,cain_wizard,goblin_drevil,gonzo_kmfdm,uppers_bull,goat_ulysses,hp_safada} = 
        ( usa_lizard_a *
        usa_lizard_b) -
        ( usa_lizard_c *
         usa_lizard_d);
  end

// State Mek blue_gonzo Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blue_gonzo <= blue_gonzo_0;
    else
      case (blue_gonzo)
        blue_gonzo_0: begin
          if ({victor_copper,vcc,vcc,vcc} == 8)
            blue_gonzo <= blue_gonzo_0;
          else if ({victor_copper,vcc,vcc,vcc} == 4)
            blue_gonzo <= blue_gonzo_4;
          else
            blue_gonzo <= blue_gonzo_0;
          end
        blue_gonzo_1: begin
          if ({victor_copper,vcc,vcc,vcc} == 12)
            blue_gonzo <= blue_gonzo_3;
          else if ({victor_copper,vcc,vcc,vcc} == 3)
            blue_gonzo <= blue_gonzo_4;
          else if ({victor_copper,vcc,vcc,vcc} == 4)
            blue_gonzo <= blue_gonzo_3;
          else
            blue_gonzo <= blue_gonzo_1;
          end
        blue_gonzo_2: begin
          if ({victor_copper,vcc,vcc,vcc} == 11)
            blue_gonzo <= blue_gonzo_1;
          else if ({victor_copper,vcc,vcc,vcc} == 12)
            blue_gonzo <= blue_gonzo_8;
          else if ({victor_copper,vcc,vcc,vcc} == 7)
            blue_gonzo <= blue_gonzo_2;
          else if ({victor_copper,vcc,vcc,vcc} == 13)
            blue_gonzo <= blue_gonzo_8;
          else if ({victor_copper,vcc,vcc,vcc} == 2)
            blue_gonzo <= blue_gonzo_6;
          else if ({victor_copper,vcc,vcc,vcc} == 6)
            blue_gonzo <= blue_gonzo_8;
          else if ({victor_copper,vcc,vcc,vcc} == 1)
            blue_gonzo <= blue_gonzo_1;
          else
            blue_gonzo <= blue_gonzo_2;
          end
        blue_gonzo_3: begin
          if ({victor_copper,vcc,vcc,vcc} == 8)
            blue_gonzo <= blue_gonzo_7;
          else if ({victor_copper,vcc,vcc,vcc} == 15)
            blue_gonzo <= blue_gonzo_0;
          else if ({victor_copper,vcc,vcc,vcc} == 10)
            blue_gonzo <= blue_gonzo_0;
          else
            blue_gonzo <= blue_gonzo_3;
          end
        blue_gonzo_4: begin
          if ({victor_copper,vcc,vcc,vcc} == 14)
            blue_gonzo <= blue_gonzo_5;
          else
            blue_gonzo <= blue_gonzo_4;
          end
        blue_gonzo_5: begin
          if ({victor_copper,vcc,vcc,vcc} == 7)
            blue_gonzo <= blue_gonzo_2;
          else if ({victor_copper,vcc,vcc,vcc} == 9)
            blue_gonzo <= blue_gonzo_4;
          else if ({victor_copper,vcc,vcc,vcc} == 4)
            blue_gonzo <= blue_gonzo_7;
          else if ({victor_copper,vcc,vcc,vcc} == 11)
            blue_gonzo <= blue_gonzo_2;
          else
            blue_gonzo <= blue_gonzo_5;
          end
        blue_gonzo_6: begin
          if ({victor_copper,vcc,vcc,vcc} == 0)
            blue_gonzo <= blue_gonzo_1;
          else
            blue_gonzo <= blue_gonzo_6;
          end
        blue_gonzo_7: begin
            blue_gonzo <= blue_gonzo_7;
          end
        blue_gonzo_8: begin
          if ({victor_copper,vcc,vcc,vcc} == 0)
            blue_gonzo <= blue_gonzo_5;
          else if ({victor_copper,vcc,vcc,vcc} == 12)
            blue_gonzo <= blue_gonzo_8;
          else if ({victor_copper,vcc,vcc,vcc} == 6)
            blue_gonzo <= blue_gonzo_2;
          else
            blue_gonzo <= blue_gonzo_8;
          end
        default: blue_gonzo <= blue_gonzo_0;
      endcase
  end

// State Mek blue_gonzo Output logic
always @(blue_gonzo)
  begin
    // consider all state regs when doing outputs
    case (blue_gonzo)
        blue_gonzo_0: begin
            art_curly = 0;
            albus_zen = 0;
            fang_cuckoo = 0;
            minerva_pcp = 0;
            rerun_desert = 1;
            goblin_bison = 0;
            baron_coconut = 1;
            genji_att = 1;
            homer_babette = 0;
            often_foryou = 0;
            icarus_cow = 1;
            venus_madeye = 0;
            nigiri_delta = 1;
            giants_romex = 1;
            cheese_gap = 1;
          end
        blue_gonzo_1: begin
            art_curly = 0;
            albus_zen = 0;
            fang_cuckoo = 0;
            minerva_pcp = 1;
            rerun_desert = 1;
            goblin_bison = 1;
            baron_coconut = 1;
            genji_att = 1;
            homer_babette = 0;
            often_foryou = 1;
            icarus_cow = 0;
            venus_madeye = 1;
            nigiri_delta = 1;
            giants_romex = 1;
            cheese_gap = 1;
          end
        blue_gonzo_2: begin
            art_curly = 1;
            albus_zen = 1;
            fang_cuckoo = 0;
            minerva_pcp = 1;
            rerun_desert = 0;
            goblin_bison = 0;
            baron_coconut = 0;
            genji_att = 1;
            homer_babette = 1;
            often_foryou = 1;
            icarus_cow = 1;
            venus_madeye = 0;
            nigiri_delta = 1;
            giants_romex = 1;
            cheese_gap = 0;
          end
        blue_gonzo_3: begin
            art_curly = 1;
            albus_zen = 0;
            fang_cuckoo = 1;
            minerva_pcp = 1;
            rerun_desert = 0;
            goblin_bison = 1;
            baron_coconut = 1;
            genji_att = 0;
            homer_babette = 0;
            often_foryou = 0;
            icarus_cow = 0;
            venus_madeye = 0;
            nigiri_delta = 1;
            giants_romex = 1;
            cheese_gap = 0;
          end
        blue_gonzo_4: begin
            art_curly = 0;
            albus_zen = 0;
            fang_cuckoo = 0;
            minerva_pcp = 1;
            rerun_desert = 0;
            goblin_bison = 1;
            baron_coconut = 0;
            genji_att = 1;
            homer_babette = 1;
            often_foryou = 1;
            icarus_cow = 1;
            venus_madeye = 0;
            nigiri_delta = 1;
            giants_romex = 0;
            cheese_gap = 0;
          end
        blue_gonzo_5: begin
            art_curly = 1;
            albus_zen = 1;
            fang_cuckoo = 0;
            minerva_pcp = 1;
            rerun_desert = 0;
            goblin_bison = 1;
            baron_coconut = 0;
            genji_att = 1;
            homer_babette = 1;
            often_foryou = 0;
            icarus_cow = 0;
            venus_madeye = 1;
            nigiri_delta = 0;
            giants_romex = 1;
            cheese_gap = 0;
          end
        blue_gonzo_6: begin
            art_curly = 0;
            albus_zen = 0;
            fang_cuckoo = 1;
            minerva_pcp = 1;
            rerun_desert = 1;
            goblin_bison = 0;
            baron_coconut = 1;
            genji_att = 0;
            homer_babette = 0;
            often_foryou = 0;
            icarus_cow = 1;
            venus_madeye = 0;
            nigiri_delta = 1;
            giants_romex = 0;
            cheese_gap = 0;
          end
        blue_gonzo_7: begin
            art_curly = 0;
            albus_zen = 1;
            fang_cuckoo = 1;
            minerva_pcp = 0;
            rerun_desert = 0;
            goblin_bison = 0;
            baron_coconut = 1;
            genji_att = 1;
            homer_babette = 0;
            often_foryou = 0;
            icarus_cow = 0;
            venus_madeye = 1;
            nigiri_delta = 0;
            giants_romex = 0;
            cheese_gap = 1;
          end
        blue_gonzo_8: begin
            art_curly = 1;
            albus_zen = 0;
            fang_cuckoo = 1;
            minerva_pcp = 0;
            rerun_desert = 1;
            goblin_bison = 0;
            baron_coconut = 1;
            genji_att = 1;
            homer_babette = 1;
            often_foryou = 1;
            icarus_cow = 0;
            venus_madeye = 1;
            nigiri_delta = 0;
            giants_romex = 1;
            cheese_gap = 1;
          end
        default: begin
            art_curly = 1;
            albus_zen = 1;
            fang_cuckoo = 0;
            minerva_pcp = 0;
            rerun_desert = 1;
            goblin_bison = 1;
            baron_coconut = 0;
            genji_att = 1;
            homer_babette = 1;
            often_foryou = 0;
            icarus_cow = 0;
            venus_madeye = 1;
            nigiri_delta = 1;
            giants_romex = 1;
            cheese_gap = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire quail_lao_out;
nut_001_lut #(5) nut_001_lut_inst_quail_lao (
  .din({vangoh_lovey,rat_fsncens,tesla_icarus,jinyong_eagle,golden_candle}),
  .mask(32'b10000000000000000000000110000101),
  .out(quail_lao_out)
);

always @(quail_lao_out)
begin
   maki_maryann = quail_lao_out;
end

// State Mek lala_athena Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lala_athena <= lala_athena_0;
    else
      case (lala_athena)
        lala_athena_0: begin
          if ({dig_molokai,gnd,desade_vegas,gnd} == 11)
            lala_athena <= lala_athena_0;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 3)
            lala_athena <= lala_athena_1;
          else
            lala_athena <= lala_athena_0;
          end
        lala_athena_1: begin
          if ({dig_molokai,gnd,desade_vegas,gnd} == 1)
            lala_athena <= lala_athena_1;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 7)
            lala_athena <= lala_athena_2;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 3)
            lala_athena <= lala_athena_4;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 6)
            lala_athena <= lala_athena_0;
          else
            lala_athena <= lala_athena_1;
          end
        lala_athena_2: begin
          if ({dig_molokai,gnd,desade_vegas,gnd} == 12)
            lala_athena <= lala_athena_4;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 10)
            lala_athena <= lala_athena_3;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 2)
            lala_athena <= lala_athena_2;
          else
            lala_athena <= lala_athena_2;
          end
        lala_athena_3: begin
          if ({dig_molokai,gnd,desade_vegas,gnd} == 15)
            lala_athena <= lala_athena_2;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 1)
            lala_athena <= lala_athena_1;
          else if ({dig_molokai,gnd,desade_vegas,gnd} == 0)
            lala_athena <= lala_athena_1;
          else
            lala_athena <= lala_athena_3;
          end
        lala_athena_4: begin
          if ({dig_molokai,gnd,desade_vegas,gnd} == 8)
            lala_athena <= lala_athena_1;
          else
            lala_athena <= lala_athena_4;
          end
        default: lala_athena <= lala_athena_0;
      endcase
  end

// State Mek lala_athena Output logic
always @(lala_athena)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (lala_athena[3:1])
        lala_athena_0: begin
            jacuzzi_cow = 0;
            frog_umbridge = 0;
            red_gilligan = 0;
            sgates_lupin = 1;
            ants_gap = 1;
            roid_att = 0;
            athena_onion = 0;
            ginger_supurb = 1;
            star_meffert = 1;
            armand_smack = 0;
            yoku_bono = 0;
            palm_erasmus = 1;
            red_issac = 0;
            legos_cow = 0;
            valve_salami = 0;
          end
        lala_athena_1: begin
            jacuzzi_cow = 1;
            frog_umbridge = 1;
            red_gilligan = 1;
            sgates_lupin = 0;
            ants_gap = 0;
            roid_att = 1;
            athena_onion = 1;
            ginger_supurb = 1;
            star_meffert = 0;
            armand_smack = 1;
            yoku_bono = 0;
            palm_erasmus = 0;
            red_issac = 0;
            legos_cow = 1;
            valve_salami = 0;
          end
        default: begin
            jacuzzi_cow = 0;
            frog_umbridge = 0;
            red_gilligan = 0;
            sgates_lupin = 0;
            ants_gap = 0;
            roid_att = 1;
            athena_onion = 1;
            ginger_supurb = 1;
            star_meffert = 0;
            armand_smack = 1;
            yoku_bono = 0;
            palm_erasmus = 0;
            red_issac = 1;
            legos_cow = 0;
            valve_salami = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire lucent_animal_out;
nut_001_lut #(1) nut_001_lut_inst_lucent_animal (
  .din({eel_iceland}),
  .mask(2'b00),
  .out(lucent_animal_out)
);

always @(lucent_animal_out)
begin
   uppers_att = lucent_animal_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire flew_coffee_out;
nut_001_lut #(5) nut_001_lut_inst_flew_coffee (
  .din({bubba_plague,siamese_rojas,onion_egg,filch_rojas,condit_bambi}),
  .mask(32'b01010010100010100000010101101000),
  .out(flew_coffee_out)
);

always @(flew_coffee_out)
begin
   illegal_vadar = flew_coffee_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire lupin_moreand_out;
nut_001_lut #(6) nut_001_lut_inst_lupin_moreand (
  .din({weevil_whammy,dragon_zen,taoist_dipsy,gnd,nigiri_delta,sheep_octapus}),
  .mask(64'hbb961fac5dcc3c04),
  .out(lupin_moreand_out)
);

always @(lupin_moreand_out)
begin
   zealot_elian = lupin_moreand_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire ring_meth_out;
nut_001_lut #(1) nut_001_lut_inst_ring_meth (
  .din({giants_romex}),
  .mask(2'b00),
  .out(ring_meth_out)
);

always @(ring_meth_out)
begin
   bush_isle = ring_meth_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire ants_Iwin_out;
nut_001_lut #(3) nut_001_lut_inst_ants_Iwin (
  .din({pcp_tattoo,gnd,sapporo_chuck}),
  .mask(8'b01000000),
  .out(ants_Iwin_out)
);

always @(ants_Iwin_out)
begin
   ebay_boing = ants_Iwin_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire ceecensor_gap_out;
nut_001_lut #(1) nut_001_lut_inst_ceecensor_gap (
  .din({romex_ginger}),
  .mask(2'b01),
  .out(ceecensor_gap_out)
);

always @(ceecensor_gap_out)
begin
   mickey_hummer = ceecensor_gap_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire october_jonas_out;
nut_001_lut #(5) nut_001_lut_inst_october_jonas (
  .din({eel_iceland,often_foryou,kappa_drax,mickey_fish,vcc}),
  .mask(32'b00101100000101000100000001000100),
  .out(october_jonas_out)
);

always @(october_jonas_out)
begin
   peace_solder = october_jonas_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire centaur_black_out;
nut_001_lut #(4) nut_001_lut_inst_centaur_black (
  .din({frog_umbridge,curious_vicks,athena_onion,moulin_lizard}),
  .mask(16'h553b),
  .out(centaur_black_out)
);

always @(centaur_black_out)
begin
   wakey_ham = centaur_black_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire gojira_huhhuh_out;
nut_001_lut #(3) nut_001_lut_inst_gojira_huhhuh (
  .din({vcc,vcc,genji_att}),
  .mask(8'b00000010),
  .out(gojira_huhhuh_out)
);

always @(gojira_huhhuh_out)
begin
   junkie_duck = gojira_huhhuh_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire marvin_hours_out;
nut_001_lut #(4) nut_001_lut_inst_marvin_hours (
  .din({ceres_mars,wujing_rubik,pizza_tapered,icarus_cow}),
  .mask(16'h7148),
  .out(marvin_hours_out)
);

always @(marvin_hours_out)
begin
   ebi_cheese = marvin_hours_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire nobody_east_out;
nut_001_lut #(6) nut_001_lut_inst_nobody_east (
  .din({troll_water,illegal_vadar,intel_warlock,biker_school,kebab_books,mortar_po}),
  .mask(64'b1000011000010001000100001001100011000000010001001100001010001010),
  .out(nobody_east_out)
);

always @(nobody_east_out)
begin
   mao_jason = nobody_east_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire foxtrot_gonzo_out;
nut_001_lut #(6) nut_001_lut_inst_foxtrot_gonzo (
  .din({gnd,kana_rerun,red_gilligan,vcc,salmon_think,mao_jason}),
  .mask(64'b0001001001100000001011001000001000001010000101000110000101111010),
  .out(foxtrot_gonzo_out)
);

always @(foxtrot_gonzo_out)
begin
   floo_voodoo = foxtrot_gonzo_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire rocks_batman_out;
nut_001_lut #(3) nut_001_lut_inst_rocks_batman (
  .din({crab_golf,star_meffert,kilo_waffle}),
  .mask(8'hd8),
  .out(rocks_batman_out)
);

always @(rocks_batman_out)
begin
   drugs_bullet = rocks_batman_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire shrimp_priest_out;
nut_001_lut #(5) nut_001_lut_inst_shrimp_priest (
  .din({art_curly,drugs_bullet,gnd,valve_salami,gnd}),
  .mask(32'b00000100000000010101000001000000),
  .out(shrimp_priest_out)
);

always @(shrimp_priest_out)
begin
   newt_gin = shrimp_priest_out;
end

// Greater Equal Less compare
always @(vcc or nigiri_delta or stroop_prison or money_picture or elian_heidi or mickey_fish or gutter_jcrew or troll_water)
  begin
    if ({vcc,nigiri_delta,stroop_prison,money_picture} > {elian_heidi,mickey_fish,gutter_jcrew,troll_water})
       {animal_what,opus_geisha,advil_clay} = 3'b100;
    else if ({vcc,nigiri_delta,stroop_prison,money_picture} < {elian_heidi,mickey_fish,gutter_jcrew,troll_water})
       {animal_what,opus_geisha,advil_clay} = 3'b010;
    else
       {animal_what,opus_geisha,advil_clay} = 3'b001;
  end

// XNOR all of these bits together
always @(vcc or wujing_rubik or gnd or nigiri_delta or genji_att or gnd or uppers_bull or albus_zen or gnd)
  begin
      louie_fsncens = ~^ {vcc,wujing_rubik,gnd,nigiri_delta,genji_att,gnd,uppers_bull,albus_zen,gnd};
  end

// Random 8 input look up table
always @(jason_emu or gnd or vcc or gnd or warlock_remus or kilo_jxnbox or trevor_beavis or pcp_nyc)
  begin
    casex ({jason_emu,gnd,vcc,gnd,warlock_remus,kilo_jxnbox,trevor_beavis,pcp_nyc})
      0: gokidsgo_zeus=0;
      1: gokidsgo_zeus=0;
      2: gokidsgo_zeus=0;
      3: gokidsgo_zeus=0;
      4: gokidsgo_zeus=0;
      5: gokidsgo_zeus=0;
      6: gokidsgo_zeus=1;
      7: gokidsgo_zeus=0;
      8: gokidsgo_zeus=1;
      9: gokidsgo_zeus=0;
      10: gokidsgo_zeus=0;
      11: gokidsgo_zeus=1;
      12: gokidsgo_zeus=1;
      13: gokidsgo_zeus=1;
      14: gokidsgo_zeus=0;
      15: gokidsgo_zeus=0;
      16: gokidsgo_zeus=1;
      17: gokidsgo_zeus=0;
      18: gokidsgo_zeus=1;
      19: gokidsgo_zeus=0;
      20: gokidsgo_zeus=0;
      21: gokidsgo_zeus=0;
      22: gokidsgo_zeus=0;
      23: gokidsgo_zeus=1;
      24: gokidsgo_zeus=0;
      25: gokidsgo_zeus=0;
      26: gokidsgo_zeus=0;
      27: gokidsgo_zeus=0;
      28: gokidsgo_zeus=1;
      29: gokidsgo_zeus=0;
      30: gokidsgo_zeus=1;
      31: gokidsgo_zeus=0;
      32: gokidsgo_zeus=0;
      33: gokidsgo_zeus=0;
      34: gokidsgo_zeus=0;
      35: gokidsgo_zeus=0;
      36: gokidsgo_zeus=0;
      37: gokidsgo_zeus=0;
      38: gokidsgo_zeus=0;
      39: gokidsgo_zeus=0;
      40: gokidsgo_zeus=1;
      41: gokidsgo_zeus=1;
      42: gokidsgo_zeus=1;
      43: gokidsgo_zeus=1;
      44: gokidsgo_zeus=1;
      45: gokidsgo_zeus=0;
      46: gokidsgo_zeus=0;
      47: gokidsgo_zeus=1;
      48: gokidsgo_zeus=0;
      49: gokidsgo_zeus=1;
      50: gokidsgo_zeus=1;
      51: gokidsgo_zeus=1;
      52: gokidsgo_zeus=0;
      53: gokidsgo_zeus=0;
      54: gokidsgo_zeus=1;
      55: gokidsgo_zeus=0;
      56: gokidsgo_zeus=1;
      57: gokidsgo_zeus=0;
      58: gokidsgo_zeus=0;
      59: gokidsgo_zeus=1;
      60: gokidsgo_zeus=0;
      61: gokidsgo_zeus=0;
      62: gokidsgo_zeus=0;
      63: gokidsgo_zeus=1;
      64: gokidsgo_zeus=0;
      65: gokidsgo_zeus=1;
      66: gokidsgo_zeus=0;
      67: gokidsgo_zeus=1;
      68: gokidsgo_zeus=1;
      69: gokidsgo_zeus=1;
      70: gokidsgo_zeus=0;
      71: gokidsgo_zeus=0;
      72: gokidsgo_zeus=0;
      73: gokidsgo_zeus=1;
      74: gokidsgo_zeus=0;
      75: gokidsgo_zeus=0;
      76: gokidsgo_zeus=0;
      77: gokidsgo_zeus=0;
      78: gokidsgo_zeus=0;
      79: gokidsgo_zeus=1;
      80: gokidsgo_zeus=0;
      81: gokidsgo_zeus=1;
      82: gokidsgo_zeus=0;
      83: gokidsgo_zeus=0;
      84: gokidsgo_zeus=0;
      85: gokidsgo_zeus=1;
      86: gokidsgo_zeus=1;
      87: gokidsgo_zeus=0;
      88: gokidsgo_zeus=0;
      89: gokidsgo_zeus=1;
      90: gokidsgo_zeus=0;
      91: gokidsgo_zeus=0;
      92: gokidsgo_zeus=1;
      93: gokidsgo_zeus=1;
      94: gokidsgo_zeus=1;
      95: gokidsgo_zeus=1;
      96: gokidsgo_zeus=1;
      97: gokidsgo_zeus=0;
      98: gokidsgo_zeus=0;
      99: gokidsgo_zeus=0;
      100: gokidsgo_zeus=1;
      101: gokidsgo_zeus=1;
      102: gokidsgo_zeus=1;
      103: gokidsgo_zeus=0;
      104: gokidsgo_zeus=0;
      105: gokidsgo_zeus=1;
      106: gokidsgo_zeus=1;
      107: gokidsgo_zeus=1;
      108: gokidsgo_zeus=0;
      109: gokidsgo_zeus=1;
      110: gokidsgo_zeus=1;
      111: gokidsgo_zeus=0;
      112: gokidsgo_zeus=0;
      113: gokidsgo_zeus=1;
      114: gokidsgo_zeus=1;
      115: gokidsgo_zeus=1;
      116: gokidsgo_zeus=0;
      117: gokidsgo_zeus=0;
      118: gokidsgo_zeus=1;
      119: gokidsgo_zeus=0;
      120: gokidsgo_zeus=1;
      121: gokidsgo_zeus=0;
      122: gokidsgo_zeus=1;
      123: gokidsgo_zeus=1;
      124: gokidsgo_zeus=1;
      125: gokidsgo_zeus=1;
      126: gokidsgo_zeus=1;
      127: gokidsgo_zeus=1;
      128: gokidsgo_zeus=1;
      129: gokidsgo_zeus=1;
      130: gokidsgo_zeus=1;
      131: gokidsgo_zeus=1;
      132: gokidsgo_zeus=0;
      133: gokidsgo_zeus=0;
      134: gokidsgo_zeus=1;
      135: gokidsgo_zeus=0;
      136: gokidsgo_zeus=1;
      137: gokidsgo_zeus=1;
      138: gokidsgo_zeus=1;
      139: gokidsgo_zeus=1;
      140: gokidsgo_zeus=0;
      141: gokidsgo_zeus=0;
      142: gokidsgo_zeus=1;
      143: gokidsgo_zeus=0;
      144: gokidsgo_zeus=1;
      145: gokidsgo_zeus=0;
      146: gokidsgo_zeus=1;
      147: gokidsgo_zeus=1;
      148: gokidsgo_zeus=1;
      149: gokidsgo_zeus=0;
      150: gokidsgo_zeus=1;
      151: gokidsgo_zeus=0;
      152: gokidsgo_zeus=0;
      153: gokidsgo_zeus=1;
      154: gokidsgo_zeus=1;
      155: gokidsgo_zeus=1;
      156: gokidsgo_zeus=1;
      157: gokidsgo_zeus=0;
      158: gokidsgo_zeus=0;
      159: gokidsgo_zeus=0;
      160: gokidsgo_zeus=1;
      161: gokidsgo_zeus=0;
      162: gokidsgo_zeus=0;
      163: gokidsgo_zeus=1;
      164: gokidsgo_zeus=0;
      165: gokidsgo_zeus=1;
      166: gokidsgo_zeus=0;
      167: gokidsgo_zeus=1;
      168: gokidsgo_zeus=0;
      169: gokidsgo_zeus=0;
      170: gokidsgo_zeus=1;
      171: gokidsgo_zeus=1;
      172: gokidsgo_zeus=0;
      173: gokidsgo_zeus=1;
      174: gokidsgo_zeus=1;
      175: gokidsgo_zeus=1;
      176: gokidsgo_zeus=1;
      177: gokidsgo_zeus=0;
      178: gokidsgo_zeus=0;
      179: gokidsgo_zeus=1;
      180: gokidsgo_zeus=0;
      181: gokidsgo_zeus=1;
      182: gokidsgo_zeus=1;
      183: gokidsgo_zeus=1;
      184: gokidsgo_zeus=0;
      185: gokidsgo_zeus=0;
      186: gokidsgo_zeus=0;
      187: gokidsgo_zeus=0;
      188: gokidsgo_zeus=0;
      189: gokidsgo_zeus=0;
      190: gokidsgo_zeus=1;
      191: gokidsgo_zeus=1;
      192: gokidsgo_zeus=0;
      193: gokidsgo_zeus=1;
      194: gokidsgo_zeus=0;
      195: gokidsgo_zeus=0;
      196: gokidsgo_zeus=1;
      197: gokidsgo_zeus=1;
      198: gokidsgo_zeus=1;
      199: gokidsgo_zeus=1;
      200: gokidsgo_zeus=1;
      201: gokidsgo_zeus=1;
      202: gokidsgo_zeus=0;
      203: gokidsgo_zeus=0;
      204: gokidsgo_zeus=1;
      205: gokidsgo_zeus=1;
      206: gokidsgo_zeus=1;
      207: gokidsgo_zeus=1;
      208: gokidsgo_zeus=1;
      209: gokidsgo_zeus=0;
      210: gokidsgo_zeus=1;
      211: gokidsgo_zeus=0;
      212: gokidsgo_zeus=0;
      213: gokidsgo_zeus=0;
      214: gokidsgo_zeus=1;
      215: gokidsgo_zeus=1;
      216: gokidsgo_zeus=1;
      217: gokidsgo_zeus=1;
      218: gokidsgo_zeus=0;
      219: gokidsgo_zeus=0;
      220: gokidsgo_zeus=0;
      221: gokidsgo_zeus=1;
      222: gokidsgo_zeus=0;
      223: gokidsgo_zeus=0;
      224: gokidsgo_zeus=1;
      225: gokidsgo_zeus=1;
      226: gokidsgo_zeus=0;
      227: gokidsgo_zeus=0;
      228: gokidsgo_zeus=1;
      229: gokidsgo_zeus=1;
      230: gokidsgo_zeus=0;
      231: gokidsgo_zeus=0;
      232: gokidsgo_zeus=0;
      233: gokidsgo_zeus=0;
      234: gokidsgo_zeus=1;
      235: gokidsgo_zeus=0;
      236: gokidsgo_zeus=1;
      237: gokidsgo_zeus=0;
      238: gokidsgo_zeus=0;
      239: gokidsgo_zeus=1;
      240: gokidsgo_zeus=1;
      241: gokidsgo_zeus=0;
      242: gokidsgo_zeus=0;
      243: gokidsgo_zeus=1;
      244: gokidsgo_zeus=0;
      245: gokidsgo_zeus=0;
      246: gokidsgo_zeus=0;
      247: gokidsgo_zeus=0;
      248: gokidsgo_zeus=0;
      249: gokidsgo_zeus=1;
      250: gokidsgo_zeus=0;
      251: gokidsgo_zeus=1;
      252: gokidsgo_zeus=0;
      253: gokidsgo_zeus=1;
      254: gokidsgo_zeus=1;
      255: gokidsgo_zeus=1;
      default: gokidsgo_zeus=0;
    endcase
  end

// 3 bit priority MUX
always @(
        red_issac or vcc  or 
        workhere_mao or louie_fsncens  or 
        huey_banality or ulysses_kappa 
)

  begin
    if (red_issac) kbtoys_danger = vcc;
    else if (workhere_mao) kbtoys_danger = louie_fsncens;
    else if (huey_banality) kbtoys_danger = ulysses_kappa;
    else kbtoys_danger = 0;
  end

// XNOR all of these bits together
always @(plaster_isle or often_tylenol or goat_ulysses or often_tylenol or kbtoys_danger or north_wonton or taoist_dipsy or vcc or curious_vicks)
  begin
      yellow_marco = ~^ {plaster_isle,often_tylenol,goat_ulysses,often_tylenol,kbtoys_danger,north_wonton,taoist_dipsy,vcc,curious_vicks};
  end

// 4 bit SOP selector
always @(
        tobe_crystal or peace_solder  or 
        nuclear_jonas or drunken_paper  or 
        vcc or homer_babette  or 
        jiminy_draco or floo_voodoo 
)

begin
    troll_coffee = 
      tobe_crystal & peace_solder |
      nuclear_jonas & drunken_paper |
      vcc & homer_babette |
      jiminy_draco & floo_voodoo;
end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      abel_dingbat <= 0;
    else
    case ({vcc,palm_erasmus})
       0 : abel_dingbat <= abel_dingbat;
       1 : abel_dingbat <= abel_dingbat;
       2 : abel_dingbat <= taoist_dipsy;
       3 : abel_dingbat <= alpha_zeus;
       default : abel_dingbat <= 0;
    endcase
  end

// 3 bit SOP selector
always @(
        ginger_supurb or zealot_tesla  or 
        junkie_duck or advil_gin  or 
        nuclear_jonas or ginger_supurb 
)

begin
    frog_palm = 
      ginger_supurb & zealot_tesla |
      junkie_duck & advil_gin |
      nuclear_jonas & ginger_supurb;
end

// OR all of these bits together
always @(popacap_goofy or genji_att)
  begin
      rabbi_soccer = | {popacap_goofy,genji_att};
  end

// Greater Equal Less compare
always @(troll_coffee or pierre_tasty or gnd or gonzo_kmfdm or remus_bagel or athena_onion or wakey_zebra or warlock_remus or popacap_goofy or palm_erasmus or drugs_drunken or palm_erasmus or vcc or century_delta or yoku_bono or venus_madeye)
  begin
    if ({troll_coffee,pierre_tasty,gnd,gonzo_kmfdm,remus_bagel,athena_onion,wakey_zebra,warlock_remus} > {popacap_goofy,palm_erasmus,drugs_drunken,palm_erasmus,vcc,century_delta,yoku_bono,venus_madeye})
       {moron_ham,elf_stirfry,sgates_amex} = 3'b100;
    else if ({troll_coffee,pierre_tasty,gnd,gonzo_kmfdm,remus_bagel,athena_onion,wakey_zebra,warlock_remus} < {popacap_goofy,palm_erasmus,drugs_drunken,palm_erasmus,vcc,century_delta,yoku_bono,venus_madeye})
       {moron_ham,elf_stirfry,sgates_amex} = 3'b010;
    else
       {moron_ham,elf_stirfry,sgates_amex} = 3'b001;
  end


initial begin
    {tobe_priest,lucent_grumpy,curie_haze,peta_mickey} = 0;
end

// Registered 4 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (ants_gap)
      {tobe_priest,lucent_grumpy,curie_haze,peta_mickey} <= 0;
    else if (hp_safada)
      {tobe_priest,lucent_grumpy,curie_haze,peta_mickey} <=
		  {lupin_bullet,albus_zen,alpha_zeus,gnd};
    else
      {tobe_priest,lucent_grumpy,curie_haze,peta_mickey} <=
		 {sears_rerun,legos_cow,moron_ham,yellow_marco} + 
		 {vcc,spock_cain,jason_emu,genji_att};
  end

// XNOR all of these bits together
always @(vcc or century_vegas or sgates_amex)
  begin
      mao_att = ~^ {vcc,century_vegas,sgates_amex};
  end

// Greater Equal Less compare
always @(pasta_wukong or uppers_att or tukatuk_mike or baron_coconut or ebay_boing or elf_stirfry or gnd or bloom_larry)
  begin
    if ({pasta_wukong,uppers_att,tukatuk_mike,baron_coconut} > {ebay_boing,elf_stirfry,gnd,bloom_larry})
       {vadar_army,howell_nation,goblin_snape} = 3'b100;
    else if ({pasta_wukong,uppers_att,tukatuk_mike,baron_coconut} < {ebay_boing,elf_stirfry,gnd,bloom_larry})
       {vadar_army,howell_nation,goblin_snape} = 3'b010;
    else
       {vadar_army,howell_nation,goblin_snape} = 3'b001;
  end

// Greater Equal Less compare
always @(advil_clay or gnd or jason_emu or gnd or gnd or goblin_drevil or vcc or vcc or vcc or jason_emu or kang_howell or vcc or often_tylenol or uppers_bull or vcc or louie_fsncens)
  begin
    if ({advil_clay,gnd,jason_emu,gnd,gnd,goblin_drevil,vcc,vcc} > {vcc,jason_emu,kang_howell,vcc,often_tylenol,uppers_bull,vcc,louie_fsncens})
       {tracy_numbers,madeye_maki,ceres_crab} = 3'b100;
    else if ({advil_clay,gnd,jason_emu,gnd,gnd,goblin_drevil,vcc,vcc} < {vcc,jason_emu,kang_howell,vcc,often_tylenol,uppers_bull,vcc,louie_fsncens})
       {tracy_numbers,madeye_maki,ceres_crab} = 3'b010;
    else
       {tracy_numbers,madeye_maki,ceres_crab} = 3'b001;
  end

// 5 bit priority MUX
always @(
        ceres_crab or taoist_dipsy  or 
        taoist_dipsy or uppers_bull  or 
        stroop_prison or rat_fsncens  or 
        dig_molokai or mao_att  or 
        gnd or century_vegas 
)

  begin
    if (ceres_crab) noah_yellow = taoist_dipsy;
    else if (taoist_dipsy) noah_yellow = uppers_bull;
    else if (stroop_prison) noah_yellow = rat_fsncens;
    else if (dig_molokai) noah_yellow = mao_att;
    else if (gnd) noah_yellow = century_vegas;
    else noah_yellow = 0;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gopher_cheez <= 0;
    else
    case ({golf_pizza,uppers_bull})
       0 : gopher_cheez <= mickey_hummer;
       1 : gopher_cheez <= vcc;
       2 : gopher_cheez <= spastic_haze;
       3 : gopher_cheez <= moses_dig;
       default : gopher_cheez <= 0;
    endcase
  end

// NAND all of these bits together
always @(tobe_priest or gnd or curly_frog or floo_voodoo or fang_cuckoo or bust_ocean or vcc or spock_cain)
  begin
      wrecker_lsd = ~& {tobe_priest,gnd,curly_frog,floo_voodoo,fang_cuckoo,bust_ocean,vcc,spock_cain};
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huhhuh_wujing <= 0;
    else
    case ({zealot_tesla,aladdin_egg})
       0 : huhhuh_wujing <= moulin_lizard;
       1 : huhhuh_wujing <= curious_vicks;
       2 : huhhuh_wujing <= huhhuh_wujing;
       3 : huhhuh_wujing <= icarus_cow;
       default : huhhuh_wujing <= 0;
    endcase
  end

// Greater Equal Less compare
always @(gokidsgo_zeus or giants_romex or venus_madeye or howell_nation or wakey_ham or spain_wonton or cain_wizard or maki_maryann or madeye_maki or vcc)
  begin
    if ({gokidsgo_zeus,giants_romex,venus_madeye,howell_nation,wakey_ham} > {spain_wonton,cain_wizard,maki_maryann,madeye_maki,vcc})
       {stix_comrade,might_popacap,juliet_west} = 3'b100;
    else if ({gokidsgo_zeus,giants_romex,venus_madeye,howell_nation,wakey_ham} < {spain_wonton,cain_wizard,maki_maryann,madeye_maki,vcc})
       {stix_comrade,might_popacap,juliet_west} = 3'b010;
    else
       {stix_comrade,might_popacap,juliet_west} = 3'b001;
  end

reg feedback_pt_589;

always @(gopher_cheez or feedback_pt_589)
  begin
      peaves_pilot = !gopher_cheez | !feedback_pt_589;
  end

reg feedback_pt_590;

always @(vicks_troll or feedback_pt_590)
  begin
      west_beast = !vicks_troll ^  feedback_pt_590;
  end

reg feedback_pt_591;

always @(troll_coffee or feedback_pt_591)
  begin
      tesla_think = !troll_coffee |  feedback_pt_591;
  end

reg feedback_pt_592;

always @(golf_pizza or feedback_pt_592)
  begin
      elf_stroop =  golf_pizza ^  feedback_pt_592;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whammy_supurb <= 0;
    else if (rerun_desert)
      whammy_supurb <= might_popacap;
    else if (victor_copper)
      whammy_supurb <= 0;
  end

always @(whammy_supurb)
  begin
      feedback_pt_589 = whammy_supurb;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      partners_ring <= 0;
    else if (genji_att)
      partners_ring <= legos_cow;
    else if (roid_att)
      partners_ring <= 0;
  end

always @(partners_ring)
  begin
      feedback_pt_590 = partners_ring;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      avon_todd <= 0;
    else if (juliet_west)
      avon_todd <= oldnavy_bacon;
    else if (tesla_think)
      avon_todd <= 0;
  end

always @(avon_todd)
  begin
      feedback_pt_591 = avon_todd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xterm_ginger <= 0;
    else if (huhhuh_wujing)
      xterm_ginger <= rabbi_soccer;
    else if (elf_stroop)
      xterm_ginger <= 0;
  end

always @(xterm_ginger)
  begin
      feedback_pt_592 = xterm_ginger;
  end

wire broom_meth_wire;

dffea broom_meth_ff (
  .clk(clock1),
  .d(gnd),
  .ena(rerun_desert),
  .adata(goblin_snape),
  .clrn(!reset1),
  .q(broom_meth_wire)
);

always @(broom_meth_wire) begin
   enoch_pork = broom_meth_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      smack_mozart <= 0;
    else if (armand_smack)
      smack_mozart <= 0;
    else if (gokidsgo_zeus)
      smack_mozart <= cheese_gap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuckoo_quail <= 0;
    else
      cuckoo_quail <= might_popacap;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      zen_potato <= 0;
    else
      zen_potato <= armand_smack;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      romeo_tin <= 0;
    else if (cuckoo_quail)
      romeo_tin <= uppers_att;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pixie_sortout <= 0;
    else if (goat_ulysses)
      pixie_sortout <= 0;
    else if (vcc)
      pixie_sortout <= abel_dingbat;
  end

wire holland_romeo_wire;

dffeas holland_romeo_ff (
  .clk(clock1),
  .d(zealot_tesla),
  .ena(gnd),
  .sclr(xterm_ginger),
  .sload(genji_att),
  .asdata(newt_gin),
  .clrn(!reset1),
  .q(holland_romeo_wire)
);

always @(holland_romeo_wire) begin
   ocean_green = holland_romeo_wire;
end

wire nail_scotch_wire;

dffeas nail_scotch_ff (
  .clk(clock1),
  .d(vcc),
  .ena(gnd),
  .sclr(mickey_hummer),
  .sload(rabbi_soccer),
  .asdata(avon_todd),
  .clrn(!reset1),
  .q(nail_scotch_wire)
);

always @(nail_scotch_wire) begin
   ford_flew = nail_scotch_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oitcen_rodent <= 1;
    else
      oitcen_rodent <= rarest_yummy;
  end

wire metal_drugie_wire;

dffea metal_drugie_ff (
  .clk(clock1),
  .d(huhhuh_wujing),
  .ena(ocean_green),
  .adata(tracy_numbers),
  .clrn(!reset1),
  .q(metal_drugie_wire)
);

always @(metal_drugie_wire) begin
   grams_valve = metal_drugie_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      oldnavy_rasp <= 1;
    else
      oldnavy_rasp <= gnd;
  end

wire dutch_ariel_wire;

dffeas dutch_ariel_ff (
  .clk(clock1),
  .d(frog_umbridge),
  .ena(grams_valve),
  .sclr(pixie_sortout),
  .sload(goblin_bison),
  .asdata(stix_comrade),
  .clrn(!reset1),
  .q(dutch_ariel_wire)
);

always @(dutch_ariel_wire) begin
   tobiko_tabby = dutch_ariel_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_wine <= 1;
    else
      life_wine <= gnd;
  end

wire stroop_vadar_wire;

dffeas stroop_vadar_ff (
  .clk(clock1),
  .d(gnd),
  .ena(noah_yellow),
  .sclr(genji_att),
  .sload(gnd),
  .asdata(icarus_cow),
  .clrn(!reset1),
  .q(stroop_vadar_wire)
);

always @(stroop_vadar_wire) begin
   brian_deuce = stroop_vadar_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      hinge_kmfdm <= 0;
    else if (gnd)
      hinge_kmfdm <= smack_mozart;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      huhhuh_quebec <= 0;
    else if (romeo_tin)
      huhhuh_quebec <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wonton_psycho <= 0;
    else if (genji_att)
      wonton_psycho <= 0;
    else if (vcc)
      wonton_psycho <= peaves_pilot;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      helena_goat <= 0;
    else if (zealot_elian)
      helena_goat <= 0;
    else if (life_wine)
      helena_goat <= kappa_bismuth;
  end

  always@(*)
  begin
    wiggum_avon = ~( ( ~( ~enoch_pork ) | ~( vcc ) & ( ~ocean_green | ~louie_fsncens ) & ( ~( ~kappa_bismuth & vadar_army ) ) | ~oldnavy_rasp ) ) ? ~( ~( ( ~( ( ~( ( ~( ~vcc | kappa_bismuth ) ) ^ gnd | ~sgates_lupin ) ) ^ ( helena_goat & abel_dingbat | ebi_bert | cuckoo_quail ) ) ) ) ) : ~( ~( ( jason_emu & ~( ~( life_wine ) ) ) ) );
  end

initial begin
    {surfer_knot,kana_dorkus,speed_vegan,eatem_spanish,candle_army} = 0;
end

// Registered 5 bit adder with SLD SCLR
always @(posedge clock1)
  begin
    if (life_wine)
      {surfer_knot,kana_dorkus,speed_vegan,eatem_spanish,candle_army} <= 0;
    else if (tobiko_tabby)
      {surfer_knot,kana_dorkus,speed_vegan,eatem_spanish,candle_army} <=
		  {dipsy_ants,avon_todd,hinge_kmfdm,rarest_yummy,xterm_ginger};
    else
      {surfer_knot,kana_dorkus,speed_vegan,eatem_spanish,candle_army} <=
		 {frog_umbridge,tonks_marquis,jacuzzi_cow,spain_wonton,wonton_guy} + 
		 {gnd,uppers_bull,vcc,partners_ring,workhere_mao};
  end

// 4 bit priority MUX
always @(
        gnd or lucent_grumpy  or 
        vcc or pcp_nyc  or 
        wrecker_lsd or tonks_marquis  or 
        kana_dorkus or gnd 
)

  begin
    if (gnd) wakey_tesla = lucent_grumpy;
    else if (vcc) wakey_tesla = pcp_nyc;
    else if (wrecker_lsd) wakey_tesla = tonks_marquis;
    else if (kana_dorkus) wakey_tesla = gnd;
    else wakey_tesla = 0;
  end

// AND all of these bits together
always @(louie_fsncens or brian_deuce or frog_umbridge or gnd or vcc or vcc or vcc or rerun_desert or ebi_cheese or tracy_numbers)
  begin
      lxtcen_wonton = & {louie_fsncens,brian_deuce,frog_umbridge,gnd,vcc,vcc,vcc,rerun_desert,ebi_cheese,tracy_numbers};
  end

reg feedback_pt_593;

always @(grams_valve or feedback_pt_593)
  begin
      sogood_bonker = !grams_valve |  feedback_pt_593;
  end

reg feedback_pt_594;

always @(eatem_spanish or feedback_pt_594)
  begin
      speedyg_abel = !eatem_spanish | !feedback_pt_594;
  end

reg feedback_pt_595;

always @(pcp_nyc or feedback_pt_595)
  begin
      popacap_bull = !pcp_nyc | !feedback_pt_595;
  end

reg feedback_pt_596;

always @(mickey_hummer or feedback_pt_596)
  begin
      knockout_dow = !mickey_hummer ^  feedback_pt_596;
  end

reg feedback_pt_597;

always @(frog_palm or feedback_pt_597)
  begin
      wine_ham = !frog_palm & !feedback_pt_597;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wood_dragon <= 0;
    else if (eel_iceland)
      wood_dragon <= gnd;
    else if (vcc)
      wood_dragon <= 0;
  end

always @(wood_dragon)
  begin
      feedback_pt_593 = wood_dragon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wiggum_wanton <= 1;
    else
      wiggum_wanton <= moulin_lizard;
  end

always @(wiggum_wanton)
  begin
      feedback_pt_594 = wiggum_wanton;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kabar_floo <= 1;
    else
      kabar_floo <= wakey_tesla;
  end

always @(kabar_floo)
  begin
      feedback_pt_595 = kabar_floo;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whack_mouse <= 0;
    else if (moulin_lizard)
      whack_mouse <= 0;
    else if (curie_haze)
      whack_mouse <= wiggum_wanton;
  end

always @(whack_mouse)
  begin
      feedback_pt_596 = whack_mouse;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      drevil_air <= 0;
    else
      drevil_air <= popacap_bull;
  end

always @(drevil_air)
  begin
      feedback_pt_597 = drevil_air;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      boots_ramone <= 0;
    else if (surfer_knot)
      boots_ramone <= 0;
    else if (gnd)
      boots_ramone <= wiggum_avon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      safeway_tonic <= 1;
    else
      safeway_tonic <= kana_dorkus;
  end

wire pork_george_wire;

dffea pork_george_ff (
  .clk(clock1),
  .d(gnd),
  .ena(grams_valve),
  .adata(gnd),
  .clrn(!reset1),
  .q(pork_george_wire)
);

always @(pork_george_wire) begin
   isle_husks = pork_george_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_gregg_a <= 0;
    else if (gnd)
      deng_gregg_a <= wiggum_wanton;
    else if (wine_money)
      deng_gregg_a <= 0;
  end

wire moses_bull_wire;

dffeas moses_bull_ff (
  .clk(clock1),
  .d(rarest_yummy),
  .ena(huhhuh_quebec),
  .sclr(gnd),
  .sload(vcc),
  .asdata(noah_yellow),
  .clrn(!reset1),
  .q(moses_bull_wire)
);

always @(moses_bull_wire) begin
   zen_hp = moses_bull_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_sheep <= 0;
    else if (elf_stirfry)
      pirate_sheep <= 0;
    else if (grams_valve)
      pirate_sheep <= rabbi_soccer;
  end

// 5 bit add sub
always @(candle_army or frog_palm or gnd or spain_wonton or pirate_sheep or icarus_cow or kana_dorkus or vcc or brian_deuce or madeye_maki)
  begin
    {pcp_bfs,yummy_wine,minnie_moses,juliet_hummer,winner_howell} = 
		({candle_army,frog_palm,gnd,spain_wonton,pirate_sheep} ^ 129) - 
		({icarus_cow,kana_dorkus,vcc,brian_deuce,madeye_maki} ^ 141);
  end

// Triple add / sub bait
always @(maki_maryann or vcc or wine_money or gnd or animal_what or pcp_bfs or vcc or pirate_sheep or brian_deuce or albus_zen or tobiko_tabby or drevil_air or
         tobiko_tabby or albus_zen or vcc or spain_wonton or yummy_wine or biker_school or abel_dingbat or peta_mickey or gnd or lxtcen_wonton or icarus_cow or speedyg_abel or
         jacuzzi_cow or ford_flew or tortilla_red or vcc or wonton_psycho or sapporo_chuck or spain_wonton or wood_dragon or rabbi_soccer or bush_isle or wood_dragon or pcp_bfs)
  begin
    {huey_golfland,emu_cornell,ready_star,yoku_weasley,icarus_sun,eel_cuanto,sun_cassowary,solder_kbtoys,devotion_red,lxtcen_copper,shuda_togos,arcade_sogood} = 
        {maki_maryann,vcc,wine_money,gnd,animal_what,pcp_bfs,vcc,pirate_sheep,brian_deuce,albus_zen,tobiko_tabby,drevil_air} -
        {tobiko_tabby,albus_zen,vcc,spain_wonton,yummy_wine,biker_school,abel_dingbat,peta_mickey,gnd,lxtcen_wonton,icarus_cow,speedyg_abel} -
        {jacuzzi_cow,ford_flew,tortilla_red,vcc,wonton_psycho,sapporo_chuck,spain_wonton,wood_dragon,rabbi_soccer,bush_isle,wood_dragon,pcp_bfs};
  end

// 3 bit add sub
always @(safeway_tonic or gnd or vcc or whack_mouse or isle_husks or sun_cassowary)
  begin
    {giants_beavis,ibm_banality,china_subway} = 
		{safeway_tonic,gnd,vcc} + 
		{whack_mouse,isle_husks,sun_cassowary};
  end

// 9 bit to 21 bit const mult
always @(whammy_supurb or gnd or whack_mouse or devotion_red or gnd or shuda_togos or vcc or zealot_tesla or ford_flew)
  begin
      {willem_indigo,sleepy_boots,ulysses_legos,cuanto_float,guy_rhvcens,chips_deng,speeding_fuji,att_buddha,tracy_lamer,knot_foryou,pizza_salami,jiminy_ariel,odin_midas,vegan_guy,noah_zedong,ohno_sixyears,intel_stoned,bolt_dragon,rod_mcnugget,viagra_red,deng_cannon} = 
	  	  {whammy_supurb,gnd,whack_mouse,devotion_red,gnd,shuda_togos,vcc,zealot_tesla,ford_flew} * 
		  175239;
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      nigiri_wonder <= 0;
    else
    case ({enoch_pork,might_popacap})
       0 : nigiri_wonder <= enoch_pork;
       1 : nigiri_wonder <= nigiri_wonder;
       2 : nigiri_wonder <= nigiri_wonder;
       3 : nigiri_wonder <= gnd;
       default : nigiri_wonder <= 0;
    endcase
  end

// Registered 4:1 MUX
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      doobie_Iwin <= 0;
    else
    case ({sleepy_boots,gnd})
       0 : doobie_Iwin <= doobie_Iwin;
       1 : doobie_Iwin <= doobie_Iwin;
       2 : doobie_Iwin <= doobie_Iwin;
       3 : doobie_Iwin <= doobie_Iwin;
       default : doobie_Iwin <= 0;
    endcase
  end


// building a 64 to 1 MUX operator
reg [63:0] tasty_meffert_mux_dat;
reg [5:0] tasty_meffert_mux_sel;
always @(gnd or vcc or surfer_knot or madeye_maki or zen_hp or mickey_hummer or giants_beavis or curly_frog or wine_ham or tracy_lamer or shuda_togos or gnd or noah_zedong or huey_golfland or ebi_bert or huey_golfland or huey_golfland or noah_zedong or rod_mcnugget or ebi_bert or west_beast or kabar_floo or kabar_floo or lucent_grumpy or solder_kbtoys or woman_elian or speeding_fuji or vcc or deng_gregg_a or juliet_hummer or pcp_bfs or vcc or odin_midas or drevil_air or winner_howell or isle_husks or att_buddha or deng_cannon or vcc or boots_ramone or life_wine or hinge_kmfdm or kilo_jxnbox or gnd or deng_gregg_a or emu_cornell or sapporo_chuck or giants_beavis or gnd or gnd or bolt_dragon or speed_vegan or spastic_haze or opus_geisha or icarus_sun or emu_cornell or sapporo_chuck or vcc or west_beast or winner_howell or rod_mcnugget or icarus_sun or vcc or ebi_cheese)
  begin
    tasty_meffert_mux_dat = {gnd,vcc,surfer_knot,madeye_maki,zen_hp,mickey_hummer,giants_beavis,curly_frog,wine_ham,tracy_lamer,shuda_togos,gnd,noah_zedong,huey_golfland,ebi_bert,huey_golfland,huey_golfland,noah_zedong,rod_mcnugget,ebi_bert,west_beast,kabar_floo,kabar_floo,lucent_grumpy,solder_kbtoys,woman_elian,speeding_fuji,vcc,deng_gregg_a,juliet_hummer,pcp_bfs,vcc,odin_midas,drevil_air,winner_howell,isle_husks,att_buddha,deng_cannon,vcc,boots_ramone,life_wine,hinge_kmfdm,kilo_jxnbox,gnd,deng_gregg_a,emu_cornell,sapporo_chuck,giants_beavis,gnd,gnd,bolt_dragon,speed_vegan,spastic_haze,opus_geisha,icarus_sun,emu_cornell,sapporo_chuck,vcc,west_beast,winner_howell,rod_mcnugget,icarus_sun,vcc,ebi_cheese};
  end

always @(frog_umbridge or ibm_banality or might_popacap or vcc or ready_star or ebi_bert)
  begin
    tasty_meffert_mux_sel = {frog_umbridge,ibm_banality,might_popacap,vcc,ready_star,ebi_bert};
  end

always @(tasty_meffert_mux_dat or tasty_meffert_mux_sel)
  begin
    tango_whiskey = tasty_meffert_mux_dat[tasty_meffert_mux_sel];
  end

reg feedback_pt_598;

always @(gnd or feedback_pt_598)
  begin
      hotdog_egg =  gnd & !feedback_pt_598;
  end

reg feedback_pt_599;

always @(pizza_salami or feedback_pt_599)
  begin
      english_kilo = !pizza_salami ^  feedback_pt_599;
  end

reg feedback_pt_600;

always @(rarest_yummy or feedback_pt_600)
  begin
      candle_pig =  rarest_yummy |  feedback_pt_600;
  end

reg feedback_pt_601;

always @(gnd or feedback_pt_601)
  begin
      honey_beavis =  gnd |  feedback_pt_601;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lsd_tobiko <= 0;
    else if (gnd)
      lsd_tobiko <= vcc;
  end

always @(lsd_tobiko)
  begin
      feedback_pt_598 = lsd_tobiko;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      solder_obiwan <= 0;
    else if (honey_beavis)
      solder_obiwan <= candle_pig;
    else if (guy_rhvcens)
      solder_obiwan <= 0;
  end

always @(solder_obiwan)
  begin
      feedback_pt_599 = solder_obiwan;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kaisha_jonas <= 0;
    else if (viagra_red)
      kaisha_jonas <= rod_mcnugget;
    else if (lucent_grumpy)
      kaisha_jonas <= 0;
  end

always @(kaisha_jonas)
  begin
      feedback_pt_600 = kaisha_jonas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      life_lima <= 0;
    else if (biker_school)
      life_lima <= 0;
    else if (homer_babette)
      life_lima <= wiggum_wanton;
  end

always @(life_lima)
  begin
      feedback_pt_601 = life_lima;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cain_parrot <= 0;
    else if (ulysses_legos)
      cain_parrot <= gnd;
    else if (pcp_nyc)
      cain_parrot <= 0;
  end

wire doc_senorduck_wire;

dffeas doc_senorduck_ff (
  .clk(clock1),
  .d(speed_vegan),
  .ena(intel_stoned),
  .sclr(lxtcen_copper),
  .sload(english_kilo),
  .asdata(surfer_knot),
  .clrn(!reset1),
  .q(doc_senorduck_wire)
);

always @(doc_senorduck_wire) begin
   dr_zaius_bep = doc_senorduck_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      supurb_barnum <= 0;
    else if (vcc)
      supurb_barnum <= bolt_dragon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bolt_ibm <= 0;
    else
      bolt_ibm <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shrimp_peta <= 1;
    else
      shrimp_peta <= bolt_dragon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_icarus <= 0;
    else
      pirate_icarus <= tango_whiskey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      south_ham <= 0;
    else if (vcc)
      south_ham <= isle_husks;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      shrimp_cubish <= 0;
    else
      shrimp_cubish <= life_lima;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      goat_ham <= 0;
    else if (whammy_supurb)
      goat_ham <= 0;
    else if (hinge_kmfdm)
      goat_ham <= nigiri_wonder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      norbert_eel <= 1;
    else
      norbert_eel <= kaisha_jonas;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      frog_stroop <= 0;
    else if (ebi_cheese)
      frog_stroop <= 0;
    else if (ebi_bert)
      frog_stroop <= drevil_air;
  end

// Random combinatorial logic block
always@(*)
  begin
      south_noah = ~( ( ( ~( ( ~( ~honey_beavis ^ wakey_tesla ) ) | ~( vcc ) ) ) & ~( ~( shrimp_peta ) ) ^ ( ~( ( ~( ( ~ford_flew & ~shrimp_peta ) | ~( ~safeway_tonic ) ) ) | ( ~( ~surfer_knot ) ^ ~( pirate_icarus ) ) ) ) ) );
  end

// State Mek rewire_frog Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rewire_frog <= rewire_frog_0;
    else
      case (rewire_frog)
        rewire_frog_0: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 0)
            rewire_frog <= rewire_frog_6;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 11)
            rewire_frog <= rewire_frog_5;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 12)
            rewire_frog <= rewire_frog_7;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 4)
            rewire_frog <= rewire_frog_4;
          else
            rewire_frog <= rewire_frog_0;
          end
        rewire_frog_1: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 10)
            rewire_frog <= rewire_frog_5;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 11)
            rewire_frog <= rewire_frog_0;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 4)
            rewire_frog <= rewire_frog_8;
          else
            rewire_frog <= rewire_frog_1;
          end
        rewire_frog_2: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 2)
            rewire_frog <= rewire_frog_4;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 11)
            rewire_frog <= rewire_frog_3;
          else
            rewire_frog <= rewire_frog_2;
          end
        rewire_frog_3: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 12)
            rewire_frog <= rewire_frog_6;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 14)
            rewire_frog <= rewire_frog_2;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 8)
            rewire_frog <= rewire_frog_5;
          else
            rewire_frog <= rewire_frog_3;
          end
        rewire_frog_4: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 6)
            rewire_frog <= rewire_frog_4;
          else
            rewire_frog <= rewire_frog_4;
          end
        rewire_frog_5: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 5)
            rewire_frog <= rewire_frog_8;
          else
            rewire_frog <= rewire_frog_5;
          end
        rewire_frog_6: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 4)
            rewire_frog <= rewire_frog_7;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 7)
            rewire_frog <= rewire_frog_3;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 9)
            rewire_frog <= rewire_frog_6;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 11)
            rewire_frog <= rewire_frog_1;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 10)
            rewire_frog <= rewire_frog_5;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 15)
            rewire_frog <= rewire_frog_1;
          else
            rewire_frog <= rewire_frog_6;
          end
        rewire_frog_7: begin
          if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 15)
            rewire_frog <= rewire_frog_1;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 14)
            rewire_frog <= rewire_frog_8;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 9)
            rewire_frog <= rewire_frog_5;
          else if ({china_subway,honey_beavis,tango_whiskey,lxtcen_wonton} == 7)
            rewire_frog <= rewire_frog_7;
          else
            rewire_frog <= rewire_frog_7;
          end
        rewire_frog_8: begin
            rewire_frog <= rewire_frog_8;
          end
        default: rewire_frog <= rewire_frog_0;
      endcase
  end

// State Mek rewire_frog Output logic
always @(rewire_frog)
  begin
    // consider a subset of the state regs when 
    // doing outputs.
    case (rewire_frog[3:1])
        rewire_frog_0: begin
            crack_foxtrot = 1;
            cheez_voodoo = 0;
            xterm_simasu = 1;
            beast_kdqcens = 0;
            wonton_edible = 0;
            master_giants = 1;
            bart_joey = 1;
            amadeus_romeo = 1;
          end
        rewire_frog_1: begin
            crack_foxtrot = 0;
            cheez_voodoo = 0;
            xterm_simasu = 1;
            beast_kdqcens = 1;
            wonton_edible = 0;
            master_giants = 0;
            bart_joey = 1;
            amadeus_romeo = 0;
          end
        rewire_frog_2: begin
            crack_foxtrot = 1;
            cheez_voodoo = 0;
            xterm_simasu = 0;
            beast_kdqcens = 0;
            wonton_edible = 0;
            master_giants = 1;
            bart_joey = 1;
            amadeus_romeo = 1;
          end
        rewire_frog_3: begin
            crack_foxtrot = 0;
            cheez_voodoo = 0;
            xterm_simasu = 0;
            beast_kdqcens = 0;
            wonton_edible = 0;
            master_giants = 1;
            bart_joey = 0;
            amadeus_romeo = 1;
          end
        default: begin
            crack_foxtrot = 1;
            cheez_voodoo = 0;
            xterm_simasu = 0;
            beast_kdqcens = 0;
            wonton_edible = 0;
            master_giants = 1;
            bart_joey = 1;
            amadeus_romeo = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire danger_zinc_out;
nut_001_lut #(5) nut_001_lut_inst_danger_zinc (
  .din({xterm_simasu,vcc,south_noah,gnd,west_beast}),
  .mask(32'hf3360322),
  .out(danger_zinc_out)
);

always @(danger_zinc_out)
begin
   guy_powder = danger_zinc_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire mouse_tobe_out;
nut_001_lut #(3) nut_001_lut_inst_mouse_tobe (
  .din({cuanto_float,goat_ham,south_noah}),
  .mask(8'h4c),
  .out(mouse_tobe_out)
);

always @(mouse_tobe_out)
begin
   peta_cryptic = mouse_tobe_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire tracy_aphid_out;
nut_001_lut #(5) nut_001_lut_inst_tracy_aphid (
  .din({chips_deng,shrimp_cubish,bart_joey,vcc,amadeus_romeo}),
  .mask(32'h9c0f26ab),
  .out(tracy_aphid_out)
);

always @(tracy_aphid_out)
begin
   jacob_bolt = tracy_aphid_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire vampire_gyro_out;
nut_001_lut #(5) nut_001_lut_inst_vampire_gyro (
  .din({jacob_bolt,jacuzzi_cow,supurb_barnum,jiminy_ariel,sapporo_chuck}),
  .mask(32'b01000110100000000100100001010000),
  .out(vampire_gyro_out)
);

always @(vampire_gyro_out)
begin
   jason_numbers = vampire_gyro_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire chiptrip_pig_out;
nut_001_lut #(6) nut_001_lut_inst_chiptrip_pig (
  .din({south_ham,life_wine,knockout_dow,vcc,south_ham,deng_cannon}),
  .mask(64'b1001100100000000000100000010000001111000001001000000010000010001),
  .out(chiptrip_pig_out)
);

always @(chiptrip_pig_out)
begin
   toysrus_roe = chiptrip_pig_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire dragon_deng_out;
nut_001_lut #(4) nut_001_lut_inst_dragon_deng (
  .din({toysrus_roe,sapporo_chuck,deng_gregg_a,vcc}),
  .mask(16'b0100001000010000),
  .out(dragon_deng_out)
);

always @(dragon_deng_out)
begin
   bert_life = dragon_deng_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire waffle_hummer_out;
nut_001_lut #(4) nut_001_lut_inst_waffle_hummer (
  .din({gnd,knot_foryou,deng_gregg_a,wine_ham}),
  .mask(16'b1010000000001100),
  .out(waffle_hummer_out)
);

always @(waffle_hummer_out)
begin
   tesla_whale = waffle_hummer_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire sneezy_stoned_out;
nut_001_lut #(3) nut_001_lut_inst_sneezy_stoned (
  .din({supurb_barnum,jason_numbers,biker_school}),
  .mask(8'h51),
  .out(sneezy_stoned_out)
);

always @(sneezy_stoned_out)
begin
   mouse_tiger = sneezy_stoned_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire ozzy_southern_out;
nut_001_lut #(1) nut_001_lut_inst_ozzy_southern (
  .din({peta_cryptic}),
  .mask(2'b01),
  .out(ozzy_southern_out)
);

always @(ozzy_southern_out)
begin
   solder_tank = ozzy_southern_out;
end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire dipsy_ginger_out;
nut_001_lut #(6) nut_001_lut_inst_dipsy_ginger (
  .din({eel_cuanto,bolt_dragon,guy_rhvcens,tango_whiskey,brian_deuce,jiminy_ariel}),
  .mask(64'b0011101000110000010100000101110000001100100000000001001000101000),
  .out(dipsy_ginger_out)
);

always @(dipsy_ginger_out)
begin
   stix_nigiri = dipsy_ginger_out;
end

always @(guy_powder or roid_att or biker_school or cuanto_float or gnd or ohno_sixyears or sgates_amex or gnd)
  begin
    spock_tango=1;
    casex ({guy_powder,roid_att,biker_school,cuanto_float,gnd,ohno_sixyears,sgates_amex,gnd})
      8'b1XXXXXXX: {fuji_condit,quail_lumber,atilla_cuanto}=7;
      8'b01XXXXXX: {fuji_condit,quail_lumber,atilla_cuanto}=6;
      8'b001XXXXX: {fuji_condit,quail_lumber,atilla_cuanto}=5;
      8'b0001XXXX: {fuji_condit,quail_lumber,atilla_cuanto}=4;
      8'b00001XXX: {fuji_condit,quail_lumber,atilla_cuanto}=3;
      8'b000001XX: {fuji_condit,quail_lumber,atilla_cuanto}=2;
      8'b0000001X: {fuji_condit,quail_lumber,atilla_cuanto}=1;
      8'b00000001: {fuji_condit,quail_lumber,atilla_cuanto}=0;
      default: begin
         spock_tango=0;
         {fuji_condit,quail_lumber,atilla_cuanto}=0;
      end
    endcase
  end

reg feedback_pt_602;

always @(gnd or feedback_pt_602)
  begin
      advil_nobody =  gnd ^  feedback_pt_602;
  end

reg feedback_pt_603;

always @(surfer_knot or feedback_pt_603)
  begin
      tiger_dorkus =  surfer_knot &  feedback_pt_603;
  end

reg feedback_pt_604;

always @(intel_stoned or feedback_pt_604)
  begin
      pegasus_meth = !intel_stoned ^  feedback_pt_604;
  end

reg feedback_pt_605;

always @(abel_dingbat or feedback_pt_605)
  begin
      coffee_fang = !abel_dingbat |  feedback_pt_605;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      turnip_hinge <= 0;
    else
      turnip_hinge <= vcc;
  end

always @(turnip_hinge)
  begin
      feedback_pt_602 = turnip_hinge;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      ihilani_army <= 0;
    else if (gnd)
      ihilani_army <= 0;
    else if (dr_zaius_bep)
      ihilani_army <= willem_indigo;
  end

always @(ihilani_army)
  begin
      feedback_pt_603 = ihilani_army;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cryptic_chief <= 1;
    else
      cryptic_chief <= vcc;
  end

always @(cryptic_chief)
  begin
      feedback_pt_604 = cryptic_chief;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salami_ibm <= 0;
    else if (vcc)
      salami_ibm <= 0;
    else if (tiger_dorkus)
      salami_ibm <= fuji_condit;
  end

always @(salami_ibm)
  begin
      feedback_pt_605 = salami_ibm;
  end

wire emu_pixie_wire;

dffeas emu_pixie_ff (
  .clk(clock1),
  .d(pegasus_meth),
  .ena(kaisha_jonas),
  .sclr(lxtcen_wonton),
  .sload(gnd),
  .asdata(tesla_whale),
  .clrn(!reset1),
  .q(emu_pixie_wire)
);

always @(emu_pixie_wire) begin
   psycho_fang = emu_pixie_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      blueled_army <= 0;
    else if (vcc)
      blueled_army <= nigiri_wonder;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      otter_mexican <= 0;
    else if (vcc)
      otter_mexican <= 0;
    else if (crack_foxtrot)
      otter_mexican <= minnie_moses;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      north_roe <= 0;
    else if (blueled_army)
      north_roe <= 0;
    else if (kaisha_jonas)
      north_roe <= bert_life;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      uniform_would <= 0;
    else if (crack_foxtrot)
      uniform_would <= eel_iceland;
  end

wire waffle_meth_wire;

dffeas waffle_meth_ff (
  .clk(clock1),
  .d(supurb_barnum),
  .ena(vcc),
  .sclr(sapporo_chuck),
  .sload(brian_deuce),
  .asdata(beast_kdqcens),
  .clrn(!reset1),
  .q(waffle_meth_wire)
);

always @(waffle_meth_wire) begin
   genesis_black = waffle_meth_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wakey_neon <= 0;
    else
      wakey_neon <= biker_school;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      popcorn_tuna <= 0;
    else if (opus_geisha)
      popcorn_tuna <= 0;
    else if (gnd)
      popcorn_tuna <= roid_att;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rufus_pdaddy <= 0;
    else if (advil_nobody)
      rufus_pdaddy <= solder_tank;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      questo_kabar <= 1;
    else
      questo_kabar <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      pirate_pluto <= 0;
    else if (rarest_yummy)
      pirate_pluto <= arcade_sogood;
  end

// XNOR all of these bits together
always @(gnd or eel_cuanto or surfer_knot)
  begin
      metal_willem = ~^ {gnd,eel_cuanto,surfer_knot};
  end

// 6 bit SOP selector
always @(
        advil_nobody or psycho_fang  or 
        brian_deuce or vcc  or 
        vcc or eel_cuanto  or 
        frog_stroop or genesis_black  or 
        turnip_hinge or ebi_bert  or 
        gnd or ebi_bert 
)

begin
    gulp_ready = 
      advil_nobody & psycho_fang |
      brian_deuce & vcc |
      vcc & eel_cuanto |
      frog_stroop & genesis_black |
      turnip_hinge & ebi_bert |
      gnd & ebi_bert;
end

reg feedback_pt_606;

always @(coffee_fang or feedback_pt_606)
  begin
      hotel_quail =  coffee_fang ^ !feedback_pt_606;
  end

reg feedback_pt_607;

always @(tesla_whale or feedback_pt_607)
  begin
      iceland_advil =  tesla_whale |  feedback_pt_607;
  end

reg feedback_pt_608;

always @(turnip_hinge or feedback_pt_608)
  begin
      cafe_kang = !turnip_hinge &  feedback_pt_608;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honey_huey <= 0;
    else if (popcorn_tuna)
      honey_huey <= 0;
    else if (atilla_cuanto)
      honey_huey <= questo_kabar;
  end

always @(honey_huey)
  begin
      feedback_pt_606 = honey_huey;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      killme_pyro <= 0;
    else if (north_roe)
      killme_pyro <= willem_indigo;
  end

always @(killme_pyro)
  begin
      feedback_pt_607 = killme_pyro;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moe_nation <= 0;
    else if (coffee_fang)
      moe_nation <= solder_obiwan;
    else if (vcc)
      moe_nation <= 0;
  end

always @(moe_nation)
  begin
      feedback_pt_608 = moe_nation;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kilo_gutter <= 0;
    else
      kilo_gutter <= iceland_advil;
  end

wire arcade_uppers_wire;

dffeas arcade_uppers_ff (
  .clk(clock1),
  .d(vcc),
  .ena(psycho_fang),
  .sclr(vcc),
  .sload(north_roe),
  .asdata(frog_stroop),
  .clrn(!reset1),
  .q(arcade_uppers_wire)
);

always @(arcade_uppers_wire) begin
   school_cheez = arcade_uppers_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      bert_foiled <= 0;
    else if (vcc)
      bert_foiled <= vcc;
  end

wire naproxen_dig_wire;

dffeas naproxen_dig_ff (
  .clk(clock1),
  .d(life_wine),
  .ena(wakey_neon),
  .sclr(ebi_bert),
  .sload(moe_nation),
  .asdata(spock_tango),
  .clrn(!reset1),
  .q(naproxen_dig_wire)
);

always @(naproxen_dig_wire) begin
   tasty_pdaddy = naproxen_dig_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      lotus_jacuzzi <= 0;
    else if (vcc)
      lotus_jacuzzi <= 0;
    else if (vcc)
      lotus_jacuzzi <= metal_willem;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tofu_squad <= 0;
    else
      tofu_squad <= school_cheez;
  end

wire tinker_pasta_wire;

dffea tinker_pasta_ff (
  .clk(clock1),
  .d(tofu_squad),
  .ena(yoku_weasley),
  .adata(spock_tango),
  .clrn(!reset1),
  .q(tinker_pasta_wire)
);

always @(tinker_pasta_wire) begin
   klaas_touch = tinker_pasta_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      whatelse_odin <= 0;
    else
      whatelse_odin <= rufus_pdaddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      heidi_eeevil <= 0;
    else if (roid_att)
      heidi_eeevil <= peta_cryptic;
  end

// Random combinatorial logic block
always@(*)
  begin
      badger_baron = ~( ~( ( ~( ~kilo_gutter ) | ( brian_deuce & ~otter_mexican ) ) ) ) & ~( ( ~( ~( ( ~gnd | ~gnd ) ) & ~( ~( lotus_jacuzzi ) ) ) ) );
  end

  always@(*)
  begin
    school_kmfdm = ~( ~heidi_eeevil ) ? ( ( ~( ~( whatelse_odin ) & ~( ~iceland_advil ) ^ ~( ~( intel_stoned ) ) | ~( ~( ~( dr_zaius_bep ) ) ) ) ) | ~( ~norbert_eel ) ^ ( ~( ~( ~bert_foiled ) ) | ( ~( ~life_lima ) ^ ( ~( ~vegan_guy ^ peta_cryptic ) ) ) ) ) : ( ~( ~( ~( ~( ~( ~sapporo_chuck ) ) ) ) | ~( norbert_eel ) ^ ( ~( ~( ~gulp_ready ) ) ^ ~( ( ~( ~uniform_would ^ ~gnd ) ) ) ) ) );
  end
// State Mek richard_thor Next state logic
always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      richard_thor <= richard_thor_0;
    else
      case (richard_thor)
        richard_thor_0: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 2)
            richard_thor <= richard_thor_8;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 3)
            richard_thor <= richard_thor_4;
          else
            richard_thor <= richard_thor_0;
          end
        richard_thor_1: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 2)
            richard_thor <= richard_thor_6;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 8)
            richard_thor <= richard_thor_2;
          else
            richard_thor <= richard_thor_1;
          end
        richard_thor_2: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 11)
            richard_thor <= richard_thor_2;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 13)
            richard_thor <= richard_thor_6;
          else
            richard_thor <= richard_thor_2;
          end
        richard_thor_3: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 0)
            richard_thor <= richard_thor_9;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 13)
            richard_thor <= richard_thor_5;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 2)
            richard_thor <= richard_thor_9;
          else
            richard_thor <= richard_thor_3;
          end
        richard_thor_4: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 5)
            richard_thor <= richard_thor_4;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 10)
            richard_thor <= richard_thor_1;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 3)
            richard_thor <= richard_thor_0;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 13)
            richard_thor <= richard_thor_9;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 9)
            richard_thor <= richard_thor_4;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 1)
            richard_thor <= richard_thor_7;
          else
            richard_thor <= richard_thor_4;
          end
        richard_thor_5: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 11)
            richard_thor <= richard_thor_1;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 4)
            richard_thor <= richard_thor_7;
          else
            richard_thor <= richard_thor_5;
          end
        richard_thor_6: begin
            richard_thor <= richard_thor_6;
          end
        richard_thor_7: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 1)
            richard_thor <= richard_thor_0;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 12)
            richard_thor <= richard_thor_2;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 6)
            richard_thor <= richard_thor_9;
          else
            richard_thor <= richard_thor_7;
          end
        richard_thor_8: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 8)
            richard_thor <= richard_thor_3;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 7)
            richard_thor <= richard_thor_9;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 11)
            richard_thor <= richard_thor_9;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 9)
            richard_thor <= richard_thor_0;
          else
            richard_thor <= richard_thor_8;
          end
        richard_thor_9: begin
          if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 15)
            richard_thor <= richard_thor_0;
          else if ({shrimp_cubish,questo_kabar,badger_baron,quail_lumber} == 2)
            richard_thor <= richard_thor_5;
          else
            richard_thor <= richard_thor_9;
          end
        default: richard_thor <= richard_thor_0;
      endcase
  end

// State Mek richard_thor Output logic
always @(richard_thor)
  begin
    // leaking current state onto output pins
    // consider all state regs when doing outputs
    case (richard_thor)
        richard_thor_0: begin
            rewire_bison = 1;
            greenland_doc = 0;
            bison_exodus = 0;
            abel_picante = 0;
            jiminy_palm = 0;
            plaster_echo = 0;
            remus_blaster = 0;
          end
        richard_thor_1: begin
            rewire_bison = 1;
            greenland_doc = 0;
            bison_exodus = 0;
            abel_picante = 0;
            jiminy_palm = 1;
            plaster_echo = 0;
            remus_blaster = 0;
          end
        richard_thor_2: begin
            rewire_bison = 0;
            greenland_doc = 0;
            bison_exodus = 1;
            abel_picante = 0;
            jiminy_palm = 0;
            plaster_echo = 0;
            remus_blaster = 0;
          end
        richard_thor_3: begin
            rewire_bison = 0;
            greenland_doc = 0;
            bison_exodus = 0;
            abel_picante = 1;
            jiminy_palm = 0;
            plaster_echo = 0;
            remus_blaster = 0;
          end
        richard_thor_4: begin
            rewire_bison = 0;
            greenland_doc = 0;
            bison_exodus = 1;
            abel_picante = 0;
            jiminy_palm = 0;
            plaster_echo = 1;
            remus_blaster = 0;
          end
        richard_thor_5: begin
            rewire_bison = 1;
            greenland_doc = 0;
            bison_exodus = 1;
            abel_picante = 0;
            jiminy_palm = 1;
            plaster_echo = 1;
            remus_blaster = 0;
          end
        richard_thor_6: begin
            rewire_bison = 0;
            greenland_doc = 0;
            bison_exodus = 0;
            abel_picante = 0;
            jiminy_palm = 0;
            plaster_echo = 0;
            remus_blaster = 1;
          end
        richard_thor_7: begin
            rewire_bison = 1;
            greenland_doc = 1;
            bison_exodus = 1;
            abel_picante = 0;
            jiminy_palm = 1;
            plaster_echo = 1;
            remus_blaster = 1;
          end
        richard_thor_8: begin
            rewire_bison = 0;
            greenland_doc = 0;
            bison_exodus = 0;
            abel_picante = 1;
            jiminy_palm = 1;
            plaster_echo = 0;
            remus_blaster = 1;
          end
        richard_thor_9: begin
            rewire_bison = 0;
            greenland_doc = 0;
            bison_exodus = 0;
            abel_picante = 0;
            jiminy_palm = 0;
            plaster_echo = 0;
            remus_blaster = 0;
          end
        default: begin
            rewire_bison = 0;
            greenland_doc = 0;
            bison_exodus = 0;
            abel_picante = 0;
            jiminy_palm = 1;
            plaster_echo = 0;
            remus_blaster = 0;
          end
      endcase
  end

///////////////////////////////////////////
// Verilog subdesign in nut_001_lut.v
///////////////////////////////////////////

wire boing_diagon_out;
nut_001_lut #(3) nut_001_lut_inst_boing_diagon (
  .din({vcc,badger_baron,genesis_black}),
  .mask(8'b00001000),
  .out(boing_diagon_out)
);

always @(boing_diagon_out)
begin
   draco_waffle = boing_diagon_out;
end

// Greater Equal Less compare
always @(intel_stoned or uniform_would or iceland_advil or greenland_doc or vcc or frog_stroop or gnd or gnd or draco_waffle or blueled_army or vcc or gnd or wonton_edible or vcc)
  begin
    if ({intel_stoned,uniform_would,iceland_advil,greenland_doc,vcc,frog_stroop,gnd} > {gnd,draco_waffle,blueled_army,vcc,gnd,wonton_edible,vcc})
       {broom_school,luthor_square,ibm_kidnapper} = 3'b100;
    else if ({intel_stoned,uniform_would,iceland_advil,greenland_doc,vcc,frog_stroop,gnd} < {gnd,draco_waffle,blueled_army,vcc,gnd,wonton_edible,vcc})
       {broom_school,luthor_square,ibm_kidnapper} = 3'b010;
    else
       {broom_school,luthor_square,ibm_kidnapper} = 3'b001;
  end

// XOR all of these bits together
always @(cain_parrot or life_lima or jiminy_palm or vegan_guy or ibm_kidnapper)
  begin
      yummy_over = ^ {cain_parrot,life_lima,jiminy_palm,vegan_guy,ibm_kidnapper};
  end

// XNOR all of these bits together
always @(gnd or vcc or gnd or gnd or doobie_Iwin or bolt_ibm or gnd)
  begin
      malfoy_jcrew = ~^ {gnd,vcc,gnd,gnd,doobie_Iwin,bolt_ibm,gnd};
  end

reg feedback_pt_609;

always @(school_kmfdm or feedback_pt_609)
  begin
      rufus_huhhuh = !school_kmfdm | !feedback_pt_609;
  end

reg feedback_pt_610;

always @(gnd or feedback_pt_610)
  begin
      master_lao =  gnd |  feedback_pt_610;
  end

reg feedback_pt_611;

always @(ford_flew or feedback_pt_611)
  begin
      lala_davidlin = !ford_flew &  feedback_pt_611;
  end

reg feedback_pt_612;

always @(wakey_tesla or feedback_pt_612)
  begin
      floating_todd = !wakey_tesla ^  feedback_pt_612;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cheese_bull <= 0;
    else if (spock_tango)
      cheese_bull <= 0;
    else if (honey_huey)
      cheese_bull <= malfoy_jcrew;
  end

always @(cheese_bull)
  begin
      feedback_pt_609 = cheese_bull;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      iguana_fire <= 1;
    else
      iguana_fire <= master_lao;
  end

always @(iguana_fire)
  begin
      feedback_pt_610 = iguana_fire;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xray_potter <= 0;
    else
      xray_potter <= gnd;
  end

always @(xray_potter)
  begin
      feedback_pt_611 = xray_potter;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_rod <= 0;
    else if (killme_pyro)
      knot_rod <= 0;
    else if (gnd)
      knot_rod <= gnd;
  end

always @(knot_rod)
  begin
      feedback_pt_612 = knot_rod;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      wiggum_doobie <= 0;
    else if (mouse_tiger)
      wiggum_doobie <= tasty_pdaddy;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      vicks_raiders <= 0;
    else
      vicks_raiders <= floating_todd;
  end

wire salmon_armand_wire;

dffeas salmon_armand_ff (
  .clk(clock1),
  .d(klaas_touch),
  .ena(xray_potter),
  .sclr(gnd),
  .sload(mouse_tiger),
  .asdata(hotel_quail),
  .clrn(!reset1),
  .q(salmon_armand_wire)
);

always @(salmon_armand_wire) begin
   pixie_athena = salmon_armand_wire;
end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      master_crab <= 1;
    else
      master_crab <= brian_deuce;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      spock_south <= 0;
    else if (gnd)
      spock_south <= 0;
    else if (sapporo_chuck)
      spock_south <= north_roe;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moulin_willy <= 0;
    else if (jiminy_palm)
      moulin_willy <= wiggum_doobie;
    else if (lala_davidlin)
      moulin_willy <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      issac_opus <= 0;
    else if (salami_ibm)
      issac_opus <= cheese_bull;
    else if (stix_nigiri)
      issac_opus <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chicken_louie <= 0;
    else if (ford_flew)
      chicken_louie <= deng_cannon;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      isle_mcnugget <= 0;
    else
      isle_mcnugget <= salami_ibm;
  end

reg feedback_pt_613;

always @(cheese_bull or feedback_pt_613)
  begin
      show_fang =  cheese_bull ^  feedback_pt_613;
  end

reg feedback_pt_614;

always @(hotdog_egg or feedback_pt_614)
  begin
      master_sugar =  hotdog_egg |  feedback_pt_614;
  end

reg feedback_pt_615;

always @(psycho_fang or feedback_pt_615)
  begin
      hp_elephant = !psycho_fang ^ !feedback_pt_615;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      salmon_todd <= 0;
    else if (mouse_tiger)
      salmon_todd <= 0;
    else if (gnd)
      salmon_todd <= iceland_advil;
  end

always @(salmon_todd)
  begin
      feedback_pt_613 = salmon_todd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      desade_india <= 0;
    else if (plaster_echo)
      desade_india <= frog_stroop;
  end

always @(desade_india)
  begin
      feedback_pt_614 = desade_india;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      scotch_beast <= 1;
    else
      scotch_beast <= malfoy_jcrew;
  end

always @(scotch_beast)
  begin
      feedback_pt_615 = scotch_beast;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      guy_neptune <= 0;
    else if (gnd)
      guy_neptune <= cryptic_chief;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stroop_coffee <= 1;
    else
      stroop_coffee <= hp_elephant;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      fufu_jonas <= 0;
    else if (desade_india)
      fufu_jonas <= 0;
    else if (workhere_mao)
      fufu_jonas <= salmon_todd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      juliet_hotel <= 0;
    else if (master_sugar)
      juliet_hotel <= moulin_willy;
    else if (otter_mexican)
      juliet_hotel <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dog_webvan <= 1;
    else
      dog_webvan <= mouse_tiger;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      leidiot_rat <= 1;
    else
      leidiot_rat <= yummy_over;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      knot_questo <= 0;
    else if (quail_lumber)
      knot_questo <= 0;
    else if (gnd)
      knot_questo <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      unicorn_llama <= 0;
    else if (moe_nation)
      unicorn_llama <= 0;
    else if (knot_rod)
      unicorn_llama <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      xray_nest <= 0;
    else if (show_fang)
      xray_nest <= ihilani_army;
    else if (moe_nation)
      xray_nest <= 0;
  end

// data words for bus muxing
wire [8:0] freaky_deuce_word0_data;
wire [8:0] freaky_deuce_word1_data;
wire [8:0] freaky_deuce_word2_data;
wire [8:0] freaky_deuce_word3_data;
wire [8:0] freaky_deuce_word4_data;
wire [8:0] freaky_deuce_word5_data;
wire [8:0] freaky_deuce_word6_data;
wire [8:0] freaky_deuce_word7_data;
wire [8:0] freaky_deuce_word8_data;
wire [8:0] freaky_deuce_word9_data;
wire [8:0] freaky_deuce_word10_data;
wire [8:0] freaky_deuce_word11_data;
wire [8:0] freaky_deuce_word12_data;
wire [8:0] freaky_deuce_word13_data;
wire [8:0] freaky_deuce_word14_data;
wire [8:0] freaky_deuce_word15_data;
wire [8:0] freaky_deuce_word16_data;
wire [8:0] freaky_deuce_word17_data;
wire [8:0] freaky_deuce_word18_data;
wire [8:0] freaky_deuce_word19_data;
wire [8:0] freaky_deuce_word20_data;
wire [8:0] freaky_deuce_word21_data;
assign freaky_deuce_word0_data = {broom_school,gnd,issac_opus,solder_obiwan,school_cheez,gnd,gnd,remus_blaster,remus_blaster};
assign freaky_deuce_word1_data = {gnd,isle_mcnugget,workhere_mao,bison_exodus,vcc,guy_neptune,stroop_coffee,vcc,plaster_echo};
assign freaky_deuce_word2_data = {whatelse_odin,bison_exodus,plaster_echo,xray_nest,lala_davidlin,juliet_hotel,vicks_raiders,gnd,cafe_kang};
assign freaky_deuce_word3_data = {pirate_pluto,gulp_ready,bison_exodus,cheez_voodoo,vcc,vcc,hotel_quail,vcc,pixie_athena};
assign freaky_deuce_word4_data = {fufu_jonas,spock_tango,rufus_huhhuh,killme_pyro,ford_flew,eel_cuanto,cheez_voodoo,salami_ibm,school_cheez};
assign freaky_deuce_word5_data = {hp_elephant,gulp_ready,vcc,stix_nigiri,master_crab,draco_waffle,knot_questo,salami_ibm,brian_deuce};
assign freaky_deuce_word6_data = {guy_neptune,scotch_beast,dog_webvan,show_fang,cryptic_chief,chicken_louie,fufu_jonas,bison_exodus,remus_blaster};
assign freaky_deuce_word7_data = {dr_zaius_bep,hp_elephant,dog_webvan,dr_zaius_bep,isle_mcnugget,vcc,killme_pyro,remus_blaster,hotel_quail};
assign freaky_deuce_word8_data = {master_lao,guy_neptune,hp_elephant,quail_lumber,vicks_raiders,eel_cuanto,juliet_hotel,roid_att,rewire_bison};
assign freaky_deuce_word9_data = {vcc,isle_mcnugget,vcc,dog_webvan,school_cheez,quail_lumber,iguana_fire,roid_att,deng_cannon};
assign freaky_deuce_word10_data = {school_cheez,deng_cannon,workhere_mao,unicorn_llama,bull_would,vcc,snort_bfs,sogood_troll,gnd};
assign freaky_deuce_word11_data = {gnd,biker_jesus,southern_cafe,dadada_ramone,vcc,minnie_floo,oscar_peace,tobe_boitano,neptune_willy};
assign freaky_deuce_word12_data = {muffin_robust,icarus_pluto,rerun_hinge,opus_hp,saturn_would,air_minnie,oranje_bomb,oranges_draco,vcc};
assign freaky_deuce_word13_data = {vcc,vcc,balloon_what,saturn_bull,safeway_willy,todd_green,kana_helena,aladdin_roid,desert_sierra};
assign freaky_deuce_word14_data = {lantern_jcrew,delta_yohimbe,vcc,pepsi_foiled,gnd,vcc,loser_lad,ring_winner,gnd};
assign freaky_deuce_word15_data = {geisha_dorkus,webvan_peta,dirty_xterm,huey_comtrex,vadar_wonder,hiswife_moe,donkey_lad,withme_fang,tiger_phoenix};
assign freaky_deuce_word16_data = {bono_bomb,vcc,atoms_whacky,plumber_papa,gnd,devotion_knot,school_gerrit,gnd,broom_riddler};
assign freaky_deuce_word17_data = {tin_think,gnd,guy_tuna,vcc,davidlin_fuji,fish_hummer,tiger_hurt,blueled_kilo,issac_ihilani};
assign freaky_deuce_word18_data = {gnd,duey_speedyg,hurt_genesis,nation_soccer,southern_papa,gnd,ariel_century,grumby_deng,gnd};
assign freaky_deuce_word19_data = {palmer_mrbill,gnd,gnd,oscar_comrade,piggish_might,dorkus_sand,robust_xterm,zhuang_goat,hinge_sears};
assign freaky_deuce_word20_data = {concorde_kana,joker_lucius,money_covad,athena_sierra,tobe_bust,wujing_golf,vcc,duey_goblin,alpha_badger};
assign freaky_deuce_word21_data = {bull_kmfdm,the_pope_palm,vcc,larry_subway,vcc,vcc,iceland_moses,sweetie_att,withme_yummy};

// select control for bus muxing
wire [12:0] freaky_deuce_select;
assign freaky_deuce_select = {minerva_tonic,sinus_goofy,hagrid_condit,pluto_sgates,vcc,fear_my_tummy,gulp_sapporo,drdeath_chuck,pluto_quebec,gnd,indigo_hurt,vcc,vcc};


// Mux output word
reg [8:0] freaky_deuce_result;

// Do some bus muxing. The star is Verilog 2001 OK
always @(*)
begin
    freaky_deuce_result = freaky_deuce_word0_data;
    if (freaky_deuce_select[0] && freaky_deuce_select[0])
        freaky_deuce_result = freaky_deuce_word0_data;

    if (freaky_deuce_select == 235)
        freaky_deuce_result = freaky_deuce_word11_data;

    if (freaky_deuce_select == 185)
        freaky_deuce_result = freaky_deuce_word10_data;

    if (freaky_deuce_select == 102)
        freaky_deuce_result = 24;

    if (freaky_deuce_select == 27)
        freaky_deuce_result = freaky_deuce_word20_data;

    if (freaky_deuce_select == 205)
        freaky_deuce_result = 0;

    if (freaky_deuce_select == 150)
        freaky_deuce_result = ~freaky_deuce_word20_data;

    if (freaky_deuce_select == 45)
        freaky_deuce_result = 0;

    if (freaky_deuce_select[5] && freaky_deuce_select[5])
        freaky_deuce_result = freaky_deuce_word6_data;

    if (freaky_deuce_select[4])
        freaky_deuce_result = freaky_deuce_word19_data;

    if (freaky_deuce_select == 192)
        freaky_deuce_result = ~freaky_deuce_word21_data;

    if (freaky_deuce_select == 57)
        freaky_deuce_result = 0;

    if (freaky_deuce_select == 63)
        freaky_deuce_result = 11;

    if (freaky_deuce_select == 24)
        freaky_deuce_result = 0;

    if (freaky_deuce_select == 36)
        freaky_deuce_result = freaky_deuce_word20_data;

    if (freaky_deuce_select == 196)
        freaky_deuce_result = 29;

end


// Send the out bus back to the world
always @(freaky_deuce_result)
begin
    juliet_doobie = freaky_deuce_result[0];
    acid_wheezer = freaky_deuce_result[1];
    larry_hagrid = freaky_deuce_result[2];
    popcorn_air = freaky_deuce_result[3];
    odin_brothers = freaky_deuce_result[4];
    deuce_crack = freaky_deuce_result[5];
    devotion_ants = freaky_deuce_result[6];
    crab_rarest = freaky_deuce_result[7];
    haze_children = freaky_deuce_result[8];
end

reg feedback_pt_616;

always @(luthor_square or feedback_pt_616)
  begin
      hp_lala = !luthor_square |  feedback_pt_616;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      cuckoo_haze <= 0;
    else
      cuckoo_haze <= hp_elephant;
  end

always @(cuckoo_haze)
  begin
      feedback_pt_616 = cuckoo_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      victor_shuda <= 0;
    else
      victor_shuda <= acid_wheezer;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      touch_gm <= 0;
    else if (rewire_bison)
      touch_gm <= 0;
    else if (roid_att)
      touch_gm <= cryptic_chief;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      tango_ulysses <= 0;
    else if (devotion_ants)
      tango_ulysses <= hp_elephant;
    else if (touch_gm)
      tango_ulysses <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      moron_ramone <= 0;
    else if (tango_ulysses)
      moron_ramone <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      neon_sortout <= 0;
    else if (haze_children)
      neon_sortout <= 0;
    else if (cuckoo_haze)
      neon_sortout <= cuckoo_haze;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dragon_bonker <= 0;
    else if (hotel_quail)
      dragon_bonker <= leidiot_rat;
    else if (vicks_raiders)
      dragon_bonker <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dopey_bacon <= 0;
    else if (popcorn_air)
      dopey_bacon <= 0;
    else if (vcc)
      dopey_bacon <= vcc;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      gm_grams <= 0;
    else if (fufu_jonas)
      gm_grams <= crab_rarest;
    else if (tango_ulysses)
      gm_grams <= 0;
  end

// Vanilla tristate output pin
  bufif1 (wiggum_curie,!rufus_huhhuh, hp_lala);  // output,dat,oe

// Tristate output pin with reg feedback
  bufif0 (moulin_deuce, quail_lumber,!tango_ulysses);  // output,dat,oe

  // read from the pin only when output is enabled
  always @(posedge clock1 or posedge reset1) begin
    if (reset1) bfs_monster <= 0;
    else if ( tango_ulysses) bfs_monster <= !moulin_deuce;
end

// Priority MUX built out of tri buffers;
// None-hot is Z, conflict not possible
  wire [3:0] cheese_sheep_dat = {quail_lumber,master_sugar,bfs_monster};
  wire [3:0] cheese_sheep_sel = {gnd,gm_grams,gnd};
  wire [3:0] cheese_sheep_ohsel;

  assign cheese_sheep_ohsel[0] = cheese_sheep_sel[0];
  assign cheese_sheep_ohsel[1] = cheese_sheep_sel[1] & !cheese_sheep_ohsel[0];
  assign cheese_sheep_ohsel[2] = cheese_sheep_sel[2] & !cheese_sheep_ohsel[1] & !cheese_sheep_ohsel[0];

  bufif0 (cheese_sheep, cheese_sheep_dat[0],!cheese_sheep_ohsel[0]);
  bufif1 (cheese_sheep,!cheese_sheep_dat[1], cheese_sheep_ohsel[1]);
  bufif0 (cheese_sheep, cheese_sheep_dat[2],!cheese_sheep_ohsel[2]);

// Vanilla tristate output pin
  bufif0 (sinew_gonzo,!odin_brothers,!acid_wheezer);  // output,dat,oe

reg feedback_pt_617;

always @(deuce_crack or feedback_pt_617)
  begin
      beef_crank = !deuce_crack &  feedback_pt_617;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      dadada_eel <= 0;
    else if (vcc)
      dadada_eel <= odin_brothers;
    else if (gnd)
      dadada_eel <= 0;
  end

always @(dadada_eel)
  begin
      feedback_pt_617 = dadada_eel;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      kangaroo_bolt <= 0;
    else
      kangaroo_bolt <= neon_sortout;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      rubik_centaur <= 0;
    else
      rubik_centaur <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      usa_chillis <= 0;
    else if (vcc)
      usa_chillis <= kangaroo_bolt;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yak_stemcell <= 0;
    else
      yak_stemcell <= hotdog_egg;
  end

reg feedback_pt_618;

always @(gnd or feedback_pt_618)
  begin
      fallen_ohno =  gnd & !feedback_pt_618;
  end

always @(rufus_huhhuh)
  begin
      parrot_tinker = !rufus_huhhuh;
  end

always @(stroop_coffee)
  begin
      nest_nuclear = !stroop_coffee;
  end

always @(fufu_jonas)
  begin
      heidi_might = !fufu_jonas;
  end

always @(neon_sortout)
  begin
      gerrit_remus = !neon_sortout;
  end

always @(ford_flew)
  begin
      cuckoo_clay = !ford_flew;
  end

always @(beef_crank)
  begin
      maki_indigo = !beef_crank;
  end

always @(gerrit_remus)
  begin
      juliet_rod = !gerrit_remus;
  end

always @(juliet_rod)
  begin
      lxtcen_alpha = !juliet_rod;
  end

always @(rufus_huhhuh)
  begin
      stirfry_wine = !rufus_huhhuh;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      monster_golf <= 1;
    else
      monster_golf <= yak_stemcell;
  end

always @(monster_golf)
  begin
      feedback_pt_618 = monster_golf;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      holland_honda <= 0;
    else if (larry_hagrid)
      holland_honda <= 0;
    else if (stirfry_wine)
      holland_honda <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      brian_beavis <= 1;
    else
      brian_beavis <= moron_ramone;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      deng_questo <= 0;
    else if (juliet_doobie)
      deng_questo <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      chicken_nail <= 0;
    else if (vcc)
      chicken_nail <= maki_indigo;
    else if (maki_indigo)
      chicken_nail <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      midas_thankee <= 0;
    else if (gnd)
      midas_thankee <= odin_brothers;
    else if (gnd)
      midas_thankee <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      alpha_clay <= 0;
    else
      alpha_clay <= devotion_ants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      honda_kang <= 1;
    else
      honda_kang <= gnd;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      stick_foryou <= 0;
    else if (monster_golf)
      stick_foryou <= vcc;
    else if (usa_chillis)
      stick_foryou <= 0;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      usa_stoner <= 0;
    else if (brian_beavis)
      usa_stoner <= devotion_ants;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      yummy_newt <= 1;
    else
      yummy_newt <= holland_honda;
  end

always @(posedge clock1 or posedge reset1)
  begin
    if (reset1)
      freaky_condit <= 0;
    else if (hotdog_egg)
      freaky_condit <= gnd;
    else if (maki_indigo)
      freaky_condit <= 0;
  end


endmodule

