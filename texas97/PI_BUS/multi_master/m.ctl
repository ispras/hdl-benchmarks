#checks if mst0 can always get a grant --passes
#AG((M_cnt_0.REQ=1)->AF(M_cnt_0.GNT=1));
#checks if mst1 can always get a grant --passes
#AG((M_cnt_1.REQ=1)->AF(M_cnt_1.GNT=1));
#checks if both msts are sending request --passes
#EF(M_cnt_0.REQ=1) * EF(M_cnt_1.REQ=1);
#check if both mst0 and mst1 gets slaves data at together at the same cycle. Bus contamination test! default value of mst_data_tmp <LSB,MSB> = <16(0),16(1)> and slave sends <32(1)>  --passes, cool!!! May check the other way around
AG((!((M_cnt_0.mst_data_tmp<10>=1)*(M_cnt_1.mst_data_tmp<10>=1))));
