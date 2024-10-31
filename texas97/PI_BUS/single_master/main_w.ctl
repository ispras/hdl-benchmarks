#saya that if the master device requests data then it eventually receives data
AG(((M_CONT.mst_rd=1)*(M_CONT.state=MST_IDLE))->EF(M_CONT.st_mst_rd=1));
#says that the master device cannot lock up the bus forever.
#AG((lock=1)->AF(lock = 0));
#EF(timeout = 1);
#there exits a path in which mst gets slaves data -not AF as timeout or Err may happen --passes
#EF((B_CONT.state = BUS_ADDRDATA)&&(B_CONT.TOUT_cnt[0] = 1)&&(B_CONT.TOUT_cnt[1] = 1)&&(B_CONT.TOUT_cnt[2] = 1)&&(B_CONT.TOUT_cnt[3] = 1)&&(B_CONT.TOUT_cnt[4] = 1)&&(B_CONT.TOUT_cnt[5] = 1)&&(B_CONT.TOUT_cnt[6] = 1)&&(B_CONT.TOUT_cnt[7] =1 )); 
#if mst requests, it will always get grant
#AG(req=1 -> AF(gnt=1)); --passes
#mst goes to err state after one clock from addr_data or data state if gets err --passses
AG((M_CONT.state=MST_ADDR_DATA + M_CONT.state=MST_DATA) * (M_CONT.ACK=ERR) -> AX(M_CONT.state=MST_IDLE)); --pas
#there exists a path s.t. mst gets slave's data -not AF as may geterrortout
EF((M_CONT.GNT=1 * M_CONT.READ=0 * M_CONT.state=MST_REQ) -> EX(slave_0.datain[31]=1)); --passes
#if no err, then mst gets slaves data at the same cycle --passes
AG((slave_0.state=ADDRESS + slave_0.state=DATA_WAIT)*(slave_0.acknowledge=RDY)*(slave_0.READ=1)*(slave_0.dataout[31]=1)*(slave_0.SEL_0=1)->(M_CONT.mst_data_tmp[31]= 1)); --passes
AG(M_CONT.mst_data_tmp[10]=0); --passes, checks if it reads the Dataport(set to 0 by slave) at wrong time; mst_data_tmp default is {{16{1'b0}},{16{1'b1}}}



