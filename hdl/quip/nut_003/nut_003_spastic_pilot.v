/////////////////////////////////////////////////////////////////
// Altera Corporation 
//
// File - nut_003_spastic_pilot.v
// 8 inputs 8 outputs
//
//
/////////////////////////////////////////////////////////////////
module nut_003_spastic_pilot (
// inputs
 goat_mouse, mike_stirfry, hagrid_indigo, crayons_ibm, hut_burnout, oranje_zen,
      covad_pdiddy, stroop_doc,

     // outputs
 eel_psycho, rarest_chevys, plaster_yummy, stix_broom, kbtoys_tofu, theseus_rojas,
      leaky_snort, kilo_tylenol,

     // tristate outputs


     clock0, clock1, reset0, reset1
);
  input goat_mouse;
  input mike_stirfry;
  input hagrid_indigo;
  input crayons_ibm;
  input hut_burnout;
  input oranje_zen;
  input covad_pdiddy;
  input stroop_doc;
  input clock0, clock1, reset0, reset1;

  output eel_psycho;
  output rarest_chevys;
  output plaster_yummy;
  output stix_broom;
  output kbtoys_tofu;
  output theseus_rojas;
  output leaky_snort;
  output kilo_tylenol;

//tristate outs


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



  reg eel_psycho;
  reg rarest_chevys;
  reg plaster_yummy;
  reg stix_broom;
  reg kbtoys_tofu;
  reg theseus_rojas;
  reg leaky_snort;
  reg kilo_tylenol;


// 6 bit add sub
always @(goat_mouse or mike_stirfry or hagrid_indigo or vcc or crayons_ibm or gnd or vcc or hut_burnout or vcc or oranje_zen or gnd or covad_pdiddy)
  begin
    {eel_psycho,rarest_chevys,plaster_yummy,stix_broom,kbtoys_tofu,theseus_rojas} = 
		({goat_mouse,mike_stirfry,hagrid_indigo,vcc,crayons_ibm,gnd} ^ 245) + 
		({vcc,hut_burnout,vcc,oranje_zen,gnd,covad_pdiddy} ^ 101);
  end

// 2 bit updown counter
always @(posedge clock0 or posedge reset0)
  begin
    if (reset0)
      {leaky_snort,kilo_tylenol} <= 0;
    else if (stroop_doc)
      {leaky_snort,kilo_tylenol} <= {leaky_snort,kilo_tylenol} + 1;
    else
      {leaky_snort,kilo_tylenol} <= {leaky_snort,kilo_tylenol} - 1;
  end


endmodule

