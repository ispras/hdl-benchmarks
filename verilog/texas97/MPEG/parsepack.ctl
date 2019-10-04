EF (stop=1);
EX((monitor=1)&&(count<3>=0)&&(count<2>=0)&&(count<1>=0)&&(count<0>=1));
EX((monitor=1)&&EX((monitor=1)&&(count<3>=0)&&(count<2>=0)&&(count<1>=1)&&(count<0>=0)));
EF ((monitor=0)&&(stop=0)&&(count<0>=1)));