/////////////////////////////////////////////////////////////////
// Altera Corporation
//
// File - nut_001_deuteronomy.v
// 14 inputs 10 outputs
//
/////////////////////////////////////////////////////////////////
module nut_001_deuteronomy (
// inputs
 leviticus, xterm, numbers, noah, bagel, english,
      muffin, holepunch, metal, dork, autotest, picture,
      sleepy, dopey,

     // outputs
 ceres, moulin, rouge, cellphone, mortgate, stapler,
      sneezy, happy, grumpy, bashful,

     // tristate outputs


     clock0, clock1, reset0, reset1
);
  input leviticus;
  input xterm;
  input numbers;
  input noah;
  input bagel;
  input english;
  input muffin;
  input holepunch;
  input metal;
  input dork;
  input autotest;
  input picture;
  input sleepy;
  input dopey;
  input clock0, clock1, reset0, reset1;

  output ceres;
  output moulin;
  output rouge;
  output cellphone;
  output mortgate;
  output stapler;
  output sneezy;
  output happy;
  output grumpy;
  output bashful;

//tristate outs


//constants
  wire vcc;
  wire gnd;
  assign vcc = 1'b1;
  assign gnd = 1'b0;



  reg ceres;
  reg moulin;
  reg rouge;
  reg cellphone;
  reg mortgate;
  reg stapler;
  reg sneezy;
  reg happy;
  reg grumpy;
  reg bashful;


// 6 bit add sub
always @(leviticus or gnd or xterm or numbers or gnd or gnd or vcc or noah or bagel or english or muffin or gnd)
  begin
    {ceres,moulin,rouge,cellphone,mortgate,stapler} = 
		({leviticus,gnd,xterm,numbers,gnd,gnd} ^ 127) - 
		({vcc,noah,bagel,english,muffin,gnd} ^ 206);
  end


initial begin
    {sneezy,happy,grumpy,bashful} = 0;
end

// Viterbi style compare-select
always @(posedge clock0)
  begin
    if ({holepunch,metal,dork,autotest} < {vcc,picture,sleepy,dopey})
       {sneezy,happy,grumpy,bashful} <= {vcc,picture,sleepy,dopey};
    else
       {sneezy,happy,grumpy,bashful} <= {holepunch,metal,dork,autotest};
  end


endmodule

