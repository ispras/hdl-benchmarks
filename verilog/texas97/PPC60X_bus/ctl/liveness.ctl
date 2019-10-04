# LIVENESS.CTL

# These properties are really basic tests for liveness

# here we make sure that both CPUs eventually get the bus
EF(BG1_=0);
EF(BG2_=0);

# here we make sure that both CPUs eventually drive the address bus
EF(ABB1_ = 0);
EF(ABB2_ = 0);

# here we make sure that once a CPU loses the bus, it will get it back again
AG((BG1_ = 1) -> AF(BG1_ = 0));
AG((BG2_ = 1) -> AF(BG2_ = 0));


# MC: formula passed --- EF(BG1_=0)
# MC: formula passed --- EF(BG2_=0)
# MC: formula passed --- EF(ABB1_=0)
# MC: formula passed --- EF(ABB2_=0)
# MC: formula failed --- AG((BG1_=1 -> AF(BG1_=0)))
# MC: formula failed --- AG((BG2_=1 -> AF(BG2_=0)))
#vis> time
#elapse: 1411.5 seconds, total: 1925.7 seconds

