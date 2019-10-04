AG(
(monitor_reset=1)
  ->AX((State<0>=0)*(State<1>=0)*(State<2>=0))
);
# if you apply reset then the next state is idle

AG(EF(State<0>=0)*(State<1>=1)*(State<2>=0));
AG(
((State<0>=0)*(State<1>=1)*(State<2>=0)*(monitor_nop=0))
  ->
((ARW=1)
*(BRW=1)
*(RegRW=0)
*(IRW=1)
*(IRRW=0)
*(PCRW=1)
*(NPCRW=0)
*(ALUoutRW=0)
*(MDRW=0)
*(BCRW=0))

);
#If in the ID stage and the opcode is not a nop 
#then `only signals ARW,BRW,IRW and PCRW

 



