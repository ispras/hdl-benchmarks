AG((t1.DEVSEL_=0) -> AF(t1.TRDY_=0));

# If DEVSEL_ is asserted, ultimately TRDY_ should be asserted.

# Formula passed for normal termination
#Not for abnormal as RETRY or master abort may happen
