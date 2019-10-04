# CONTENTION.CTL

# This group of formulas is intended to show that my solution
# of emulating bi-directional wires into two signals is not too 
# great. My assumption was that if the model worked correctly,
# that both CPUs would not assert the below signals at the same time.

# it took me about 514 cpu seconds to check these

AG(!((CI1_ = 0) * (CI2_ = 0)));		# formula passes two cpu model

AG(!((SHD1_ = 0) * (SHD2_ = 0)));	# fails 2 cpu

AG(!((BG1_ = 0) * (BG2_ = 0)));		# passes 2 cpu

AG(!((WT1_ = 0) * (WT2_ = 0)));		# passes 2 cpu

AG(!((ARTRY1_ = 0) * (ARTRY2_ = 0)));	# fails 2 cpu

AG(!((GBL1_ = 0) * (GBL2_ = 0)));	# passes 2 cpu

AG(!((TBST1_ = 0) * (TBST2_ = 0)));	# passes 2 cpu

AG(!((TS1_ = 0) * (TS2_ = 0)));		# passes 2 cpu

AG(!((ABB1_ = 0) * (ABB2_ = 0)));	# passes 2 cpu

AG(!((DBB1_ = 0) * (DBB2_ = 0)));	# passes 2 cpu

