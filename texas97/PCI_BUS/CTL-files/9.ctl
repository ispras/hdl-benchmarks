AG( (m1.rFRAME_=1) -> AX ( (m1.rFRAME_=0) -> ( AX(t1.rTRDY_=1))) );

# There has to be a turnaround cycle for the AD lines in a READ
# transaction. This is achieved by ensuring that TRDY_ is asserted
# at least one clock cycle after FRAME_ is asserted. 

# Formula passed because in all test cases the transaction 
#was a read transaction
 
