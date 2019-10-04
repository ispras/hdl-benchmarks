#AG(
#((State<0>=0)*(State<1>=0)*(State<2>=0)) + 
#((State<0>=1)*(State<1>=0)*(State<2>=0)) + 
#((State<0>=0)*(State<1>=1)*(State<2>=0)) +
#((State<0>=1)*(State<1>=1)*(State<2>=0)) + 
#((State<0>=0)*(State<1>=0)*(State<2>=1)) + 
#((State<0>=1)*(State<1>=0)*(State<2>=1))
#);

#AF((State<0>=0)*(State<1>=0)*(State<2>=0));
#EF((State<0>=1)*(State<1>=0)*(State<2>=0));
#EF((State<0>=0)*(State<1>=1)*(State<2>=0));
#EF((State<0>=1)*(State<1>=1)*(State<2>=0));
EF((State<0>=0)*(State<1>=0)*(State<2>=1));
#EF((State<0>=1)*(State<1>=1)*(State<2>=0)->EX((State<0>=0)*(State<1>=0)*(State<2>=1)));
#AG(
#((monitor_opcode[5]=1)*
#(monitor_opcode[4]=0)*
#(monitor_opcode[3]=1)*
#(monitor_opcode[2]=0)*
#(monitor_opcode[1]=1)*
#(monitor_opcode[0]=1)*
#(monitor_reset=0))-> 
#EF((State<0>=0)*(State<1>=0)*(State<2>=1))
#);

#EF((State<0>=1)*(State<1>=0)*(State<2>=1));



#AF((monitor=1) + 
#(
#((State<0>=0)*(State<1>=0)*(State<2>=0)) ->
#AX((State<0>=1)*(State<1>=0)*(State<2>=0)))
#); 

EF(
((monitor_opcode[5]=1)*
(monitor_opcode[4]=0)*
(monitor_opcode[3]=1)*
(monitor_opcode[2]=0)*
(monitor_opcode[1]=1)*
(monitor_opcode[0]=1)*
(monitor_reset=0)*
((State<0>=1)*(State<1>=1)*(State<2>=0)))

-> 
AX((State<0>=1)*(State<1>=0)*(State<2>=0))
);







