AG ( ( ((t1.rTRDY_=1)*(t1.STOP_=1)) -> AX( (t1.STOP_=0) -> A( ((t1.rTRDY_=1)*(t1.STOP_=0)) U ((m1.rIRDY_=0)*(t1.rTRDY_=0) + (m1.rIRDY_=0)*(t1.STOP_=0) )))) +(((t1.rTRDY_=0)*(t1.STOP_=1)) -> AX( (t1.STOP_=0) -> A( ((t1.rTRDY_=0)*(t1.STOP_=0)) U ((m1.rIRDY_=0)*(t1.rTRDY_=0) + (m1.rIRDY_=0)*(t1.STOP_=0)) ) ) ));  

# Once STOP_ has been asserted, TRDY_ and STOP_ must remain unchanged
# till the end of the transaction.

# Formula passed

