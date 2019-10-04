#EF (packHeadStart=1);
#(!AG(packHeadStart=1));
#EF (packHeadStop=1);
#EF (packetStart=1);
#EF (packParseStart = 1);
#EF (sysHeadParseStart = 1);
#AG (mod3.stop = 0);
#AX ((mod3.state<2>=0) &&(mod3.state<1>=0) && (mod3.state<0>=1)); 


#AG (((mod3.state<2>=0) &&(mod3.state<1>=0) && (mod3.state<0>=1))->EX ((mod3.state<2>=0) &&(mod3.state<1>=1) && (mod3.state<0>=0)));

#AG (((mod3.state<2>=0) &&(mod3.state<1>=0) && (mod3.state<0>=0))->EX ((mod3.state<2>=0) &&(mod3.state<1>=0) && (mod3.state<0>=1)));

#EF((mod3.state<2>=0) &&(mod3.state<1>=1) && (mod3.state<0>=0));

#AG ((read_enable=0)->AF (read_enable=1));

#AG(enable=0);
#EF(enable=1);
EF(mod3.stop=1);
EF(mod4.stop=1);
EF(mod6.stop=1);
EF(mod7.stop=1);
#AG(enable=0)->(AG(mod3.stop=0));













