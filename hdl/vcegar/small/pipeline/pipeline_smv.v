module main (dataIn, dataOut, c1, c2, clock, reset);
 input    [310:0]  dataIn, c1, c2;
 input             clock;	
 input             reset;
 output   [310:0]  dataOut;
 reg      [310:0]  dataOut;

 reg      [310:0]  stageOne;
 reg      [310:0]  stageTwo;

 reg      [310:0]  tmp_stageOne; //to remember last state value 
 reg      [310:0]  tmp_stageTwo; //to remember last state value 



initial 
  begin
    dataOut = 0;	
    stageTwo = 0;		
    stageOne =0;
    tmp_stageTwo = 0;
    tmp_stageOne = 0;
  end

 always @(posedge clock) 
 begin
   tmp_stageOne <= stageOne;
   tmp_stageTwo <= stageTwo;
   stageOne <= dataIn + c1;
   stageTwo <= stageOne & c2;
   if (~reset)
     dataOut <= stageTwo + stageOne;
   else
      dataOut <= 0; 
 end

 always begin
   assert property: ((dataOut == tmp_stageTwo + tmp_stageOne) || (dataOut == 0));
 end 

endmodule 
