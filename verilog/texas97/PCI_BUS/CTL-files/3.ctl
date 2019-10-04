AG( m1.rFRAME_=1 -> AX(( m1.rFRAME_=0) -> A( (t1.rTRDY_ = 1) U (t1.DEVSEL_ = 0) ))) ;

# In a transaction, TRDY_ should not be asserted before DEVSEL_

# Formula passed for normal termination 
#fail for abnormal termination as DEVSEL_ may never  be asserted
#for outside the address range

