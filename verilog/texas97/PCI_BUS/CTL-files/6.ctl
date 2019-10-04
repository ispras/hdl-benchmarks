AG( (t1.STOP_=1) -> AX( (t1.STOP_=0) ->  A((t1.STOP_=0) U (m1.rFRAME_=1) * AX(t1.STOP_=1)) ));

# Assertion of STOP_ should be sustained till the transaction has 
# been withdrawn by the master (by deasserting FRAME_). Also, STOP_
# must be deasserted in the clock following the assertion of FRAME_

# Formula Passed 

