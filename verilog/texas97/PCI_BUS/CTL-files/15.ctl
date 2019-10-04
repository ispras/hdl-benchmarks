AG((m1.rFRAME_=1)->AX((m1.rFRAME_=0)->AX(AX((t1.DEVSEL_=0)->AX(AX(t1.rTRDY_=0))))));

#this formula checks for the timing of DEVSEL_ followed by TRDY_
#first we had placed an AG condition before DEVSEL_ which was causing
#formula failure when GNT_ got removed (leading to deassertion of DEVSEL#)
#1.the Starting address was set to 0 so the Target must decode it
#2.DecodeWait register is fixed to medium decode so DEVSEL_ should get
#asserted 2 clocks after frame is asserted.
#3. Target Wait is fixed at 3 so TRDY_ should be asserted 2 clocks after
#DEVSEL_ (Note that all abnormal terminations are disabled, so TRDY_ WILL
#be asserted once Decode is done.

# Formula passed for normal term
#For Abnormal term neither Devsel nor Trdy need to be asserted so it
#fails
