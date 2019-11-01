EF (done=1);
AG (((timeBytes<3>=0)&&(timeBytes<2>=0)&&(timeBytes<1>=0)&&(timeBytes<0>=0)) +((timeBytes<3>=0)&&(timeBytes<2>=0)&&( timeBytes<1>=0)&&(timeBytes<0>=1)) + ((timeBytes<3>=0)&&(timeBytes<2>=1)&&(timeBytes<1>=0)&&(timeBytes<0>=1))+ ((timeBytes<3>=1)&&(timeBytes<2>=0)&&(timeBytes<1>=1)&&(timeBytes<0>=0)));
EF ((timeBytes<3>=0)&&(timeBytes<2>=1)&&(timeBytes<1>=0)&&(timeBytes<0>=1));
EF ((timeBytes<3>=1)&&(timeBytes<2>=1)&&(timeBytes<1>=0)&&(timeBytes<0>=0));
AG( (state<3>=1)* ( state<2>=1)* (state<1>=1) * (state<0>=1)->(EX(state<3>=0)* ( state<2>=0)* (state<1>=0) * (state<0>=0)));
