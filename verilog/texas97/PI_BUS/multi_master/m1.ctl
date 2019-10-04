#saya that if the master device requests data then it eventually receives data
#AG(((M_CONT.mst_rd=1)*(M_CONT.state=MST_IDLE))->EF(M_CONT.st_mst_rd=1));
#says that the master device cannot lock up the bus forever.
#AG((lock=1)->AF(lock = 0));
#EF(timeout = 1);
#timeout cannot be at zero forever ---- fails this
#AG(!(EG(timeout = 0)));
#if error is asserted then in the next bus cycle the master must withdraw all lines
#AG(((acknowledge = ERR)&&(select=1))->AX((lock =0)));
#AG((acknowledge = ERR) ->((M_CONT.state = MST_ADDR)||(M_CONT.state=MST_ADDR_DATA)||(M_CONT.state = MST_DATA)));
#AG((M_CONT.state=MST_ADDR_DATA * M_CONT.ACK=ERR)->AX(M_CONT.state = MST_IDLE));
#timeout stuff
#!(AG(B_CONT.TOUT_cnt[0] = 0));
#!(AG(B_CONT.r_TOUT = 0));
#if the above props pass then it means that it is possible for the master to lock the bus forever.
#EF((B_CONT.state = BUS_ADDRDATA)&&(B_CONT.TOUT_cnt[0] = 1)&&(B_CONT.TOUT_cnt[1] = 1)&&(B_CONT.TOUT_cnt[2] = 1)&&(B_CONT.TOUT_cnt[3] = 1)&&(B_CONT.TOUT_cnt[4] = 1)&&(B_CONT.TOUT_cnt[5] = 1)&&(B_CONT.TOUT_cnt[6] = 1)&&(B_CONT.TOUT_cnt[7] =1 )); 
#EF(B_CONT.r_TOUT =1);
#-----passes timeout counter = 127
#EF(B_CONT.r_TOUT = 1);
#EF(B_CONT.state = BUS_ADDRDATA); ------passes

#(EG
#just checking..
#AG(lock_temp =1);
#checking if it reaches addrdata ---- fails
#EF(B_CONT.state = BUS_ADDRDATA);
#-----fails this property
#AG((B_CONT.state =BUS_ADDR)->(EF(B_CONT.state = BUS_ADDRDATA)));
#EF(B_CONT.REQ_0 = 1);
#EF(!((B_CONT.OPC[0]=0)&&(B_CONT.OPC[1]=0)&&(B_CONT.OPC[2]=0)&&(B_CONT.OPC[3]=0))); ---now passes
#EF(acknowledge = WAT); ----passes
#EF(B_CONT.GNTndm_tmp = 1);
#EF(select =1); ---passes 
#AG(req=1 -> AF(gnt=1)); --passes
#AF(M_CONT.state=MST_ADDR); --passes
#AG((M_CONT.state=MST_ADDR_DATA + M_CONT.state=MST_DATA) * (M_CONT.ACK=ERR) -> AX(M_CONT.state=MST_IDLE)); --pas
#EF((M_CONT.GNT=1 * M_CONT.READ=0 * M_CONT.state=MST_REQ) -> EX(slave_0.datain[31]=1)); --passes
#AG((slave_0.state=ADDRESS + slave_0.state=DATA_WAIT)*(slave_0.acknowledge=RDY)*(slave_0.READ=1)*(slave_0.dataout[31]=1)*(slave_0.SEL_0=1)->(M_CONT.mst_data_tmp[31]= 1)); --passes
#AG(M_CONT.mst_data_tmp[10]=0); --passes, checks if it reads the Dataport(set to 0 by slave) at wrong time; mst_data_tmp default is {{16{1'b0}},{16{1'b1}}}



