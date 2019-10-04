AG ((m1.FRAME_=1) -> AX ( m1.FRAME_=0 ->  A(m1.OE_CBE_=1 U ((m1.IRDY_=0)*(t1.TRDY_=0) + (m1.IRDY_=0)*(t1.STOP_=0)) )) ) ;  

# Once FRAME_ has been asserted, the CBE_ lines should be driven till the
# end of the transaction. Note: Abnormal terminations are disabled here.
# The end of transaction is modelled as the normal end of transaction.

# Formula passed

#When StartAddress became > TargetResponseRange then Master ABort
#occured causing failure of formula (as expected)
