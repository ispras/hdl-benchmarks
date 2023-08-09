/////////////////////////////////////////////////////////////////
// Altera Corporation
//
// File - nut_002_rarest.v
// 34 inputs 15 outputs
//
//
/////////////////////////////////////////////////////////////////
module nut_002_rarest (
// inputs
 butterfly, palm, seashell, ohisee, whacky, rerun,
      fronds, hut, rescue, hawaii, wallstreet, levelization,
      huhhuh, uomcensor, wildboar, lagoon, husks, escape,
      foiled, bamboo, desert, isle, pacific, ocean,
      waterfall, tan_nodes, loud, millionaire, hiswife, stroop,
      waffle, wheezer, ozzy, priest,

     // outputs
 smack, banshee, dillweed, vimcensorc, tesla, killer,
      wonton, pierre, armand, rufus, willy, gonzo,
      gulp, bonafide, rabbi,

     // tristate outputs


     clock0, clock1, reset0, reset1
);
  input butterfly;
  input palm;
  input seashell;
  input ohisee;
  input whacky;
  input rerun;
  input fronds;
  input hut;
  input rescue;
  input hawaii;
  input wallstreet;
  input levelization;
  input huhhuh;
  input uomcensor;
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
  input hiswife;
  input stroop;
  input waffle;
  input wheezer;
  input ozzy;
  input priest;
  input clock0, clock1, reset0, reset1;

  output smack;
  output banshee;
  output dillweed;
  output vimcensorc;
  output tesla;
  output killer;
  output wonton;
  output pierre;
  output armand;
  output rufus;
  output willy;
  output gonzo;
  output gulp;
  output bonafide;
  output rabbi;

//tristate outs


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



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
  reg rabbi;


// Triple add / sub bait
always @(butterfly or palm or seashell or ohisee or vcc or whacky or rerun or fronds or hut or rescue or vcc or hawaii or vcc or wallstreet or
         levelization or huhhuh or uomcensor or wildboar or lagoon or vcc or husks or escape or vcc or foiled or vcc or bamboo or vcc or desert or
         isle or pacific or ocean or gnd or waterfall or tan_nodes or loud or gnd or gnd or vcc or millionaire or gnd or gnd or hiswife)
  begin
    {smack,banshee,dillweed,vimcensorc,tesla,killer,wonton,pierre,armand,rufus,willy,gonzo,gulp,bonafide} = 
        {butterfly,palm,seashell,ohisee,vcc,whacky,rerun,fronds,hut,rescue,vcc,hawaii,vcc,wallstreet} +
        {levelization,huhhuh,uomcensor,wildboar,lagoon,vcc,husks,escape,vcc,foiled,vcc,bamboo,vcc,desert} -
        {isle,pacific,ocean,gnd,waterfall,tan_nodes,loud,gnd,gnd,vcc,millionaire,gnd,gnd,hiswife};
  end

// XOR all of these bits together
always @(stroop or waffle or gnd or vcc or wheezer or ozzy or priest)
  begin
      rabbi = ^ {stroop,waffle,gnd,vcc,wheezer,ozzy,priest};
  end


endmodule

