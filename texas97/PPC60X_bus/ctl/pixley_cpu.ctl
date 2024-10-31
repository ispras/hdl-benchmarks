# PIXLEY_CPU.CTL

# This group of rules was adapted directly from Pixley's rules. Because I did not
# force the bus to be fair, the rules below are the ones in which Pixley did not 
# require fairness.


	##############################
	## Book IV page 45:

	AG((cpu1.qualified_bus_grant =1 ) -> AX(AX(BR1_ = 1)));		# fail


	##############################
	## Book IV page 45:
	## If BG1_ is negated, then typhoon is not the next bus master.

	AG(((cpu1.address_tenure_fsm = AddressTenureIDLE) * (BG1_ = 1)) ->
		AX(AX(cpu1.address_tenure_fsm = AddressTenureIDLE)));   # fail 


	##############################
	## Book IV, page 50:
	## Typhoon may not assert BR1_ in the "window of opportunity", two cycles after
	## AACK_ assertion (unless it asserted ARTRY_ itself).

	AG((AACK_ = 0) ->
		AX(AX((ARTRY_ = 0) *  cpu1.snoop_control_fsm = SnoopControlIDLE ->
			AX(AX(BR1_ = 1)))));    # pass 2 cpu


	## See comment in bus_request_fsm for why we care about the following spec:

	AG((cpu1.qualified_bus_grant = 1) -> (cpu1.snoop_push_required = 0)); # fail


	## AACK_ cannot be asserted until 3 cycles after
	## TS_ is asserted, for a 1:1 processor-to-bus ratio.

	AG((cpu1.address_tenure_fsm = AddressTenureTS) ->
		AX(AX((AACK_ = 1) *
			AX(AX(AACK_ = 1))))); # fail

	## We can always get back to a given state.  In some cases, under fairness we are
	## guaranteed to get back to a given state.

	## The following spec is even true for one cpu, because some address-only TT codes
	## cause a cpu to do snoop its own address transaction.

	AG(EF(cpu1.address_tenure_fsm = AddressTenureARTRY_HOLD)); pass

	AG(EF(cpu1.data_tenure_fsm = DataTenureIDLE)); # pass
	AG(EF(cpu1.data_tenure_fsm = DataTenureTA_WAIT)); # pass 
	AG(EF(cpu1.data_tenure_fsm = DataTenureDRTRY_CHK_DBB)); #pass
	AG(EF(cpu1.data_tenure_fsm = DataTenureDRTRY_CHK_NOT_DBB)); # pass

	# These rules imply that the bus is not necessarily fair.

	AG(EF(cpu1.address_tenure_fsm = AddressTenureTS));         # pass
	AG(EF(cpu1.address_tenure_fsm = AddressTenureAACK_WAIT));  # pass
	AG(EF(cpu1.address_tenure_fsm = AddressTenureAWINDOW));    # pass


	## Presumably we always eventually need the bus in this model.

	AG(EF(cpu1.qualified_need_bus = 1)); # pass




