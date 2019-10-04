
#Verilog files are:
#1- IFetchControl1.v
#IFetchControl  combinational=1023  pi=28  po=38  latches=59  pseudo=0  const=92  edges=1735
#machine americanmaid was used for the following results
#********************************
#Default Image method: IWLS95
#Reachability analysis results:
#FSM depth =                 28
#reachable states =  4.39674e+08
#BDD size =             1244873
#analysis time =           3121
#
#After using dynamic_var_ordering -f sift
#********************************
#Reachability analysis results:
#FSM depth =                 28
#reachable states =  4.39674e+08
#BDD size =               61080
#analysis time =             93

#2- IFetchControl2.v
#IFetchControl  combinational=1016  pi=27  po=38  latches=59  pseudo=0  const=93  edges=1720
#machine americanmaid was used for the following results
#********************************
#Default Image method: IWLS95
#Reachability analysis results:
#FSM depth =                 28
#reachable states =  2.5046e+08
#BDD size =              321362
#analysis time =            585
#
#After using dynamic_var_ordering -f sift
#Reachability analysis results:
#FSM depth =                 28
#reachable states =  2.5046e+08
#BDD size =               12490
#analysis time =             19

#3- IFetchControl3.v
#IFetchControl  combinational=1022  pi=27  po=38  latches=61  pseudo=0  const=95  edges=1728
#machine americanmaid was used for the following results
#********************************
#Default Image method: IWLS95
#Reachability analysis results:
#FSM depth =                 28
#reachable states =  1.00184e+09
#BDD size =              321374
#analysis time =            689
#
#After using dynamic_var_ordering -f sift
********************************
Reachability analysis results:
FSM depth =                 28
reachable states =  1.00184e+09
BDD size =               34291
analysis time =             41




################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: check_invariant
#This invariant captures the property that extension bytes of the instruction block can be transfered if and only if the current state of instruction refilling operation is $EXTBYTE$
#===============================================================================

(( ExtMuxSelect_s1 = 1 ) <-> (( PresState_s1<0> = 1)*( PresState_s1<1> = 1)*( PresState_s1<2> = 1)*( PresState_s1<3> = 0) ) );

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: check_invariant
#This invariant captures the property that $LatchShiftReg_s1$ (which is used in Instruction Fetch Datapath module to transfer the contents of the shared memory, when there are extension bytes in it, during instruction refilling operation) is high only if instruction refilling operation is at states $EXTBYTE$, $XFER1$, $XFER2$, $XFER3$.
#===============================================================================
(( LatchShiftReg_s1 = 1 ) <-> 
((( PresState_s1<0> = 1)*( PresState_s1<1> = 1)*( PresState_s1<2> = 1)*( PresState_s1<3> = 0) ) +
(( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 1)*( PresState_s1<3> = 0) ) + 
(( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 0)*( PresState_s1<3> = 1) ) +
(( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 1)*( PresState_s1<3> = 1)  ) ) );

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: check_invariant
#This invariant captures the property that $LatchDataReg_s1$ (which is used in Instruction Fetch Datapath module to transfer the contents of the shared memory, when there are instructions in it, during instruction refilling operation) is high only if instruction refilling operation is at states $XFER0$, $XFER1$, $XFER2$, $XFER3$.
#===============================================================================
(( LatchDataReg_s1 = 1 ) <-> 
((( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 0)*( PresState_s1<3> = 0) ) +
(( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 1)*( PresState_s1<3> = 0) ) + 
(( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 0)*( PresState_s1<3> = 1) ) +
(( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 1)*( PresState_s1<3> = 1) )));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: check_invariant
#This in variant is similar to the above invariants and signals the availbaility of cache, because it goes high only if you are at $CACHEHIT$ state which means no cache miss operation or $REFETCH$ state which means cache refilling has been completed.
#===============================================================================
(( ReadCache_v1i = 1 ) <->
(((( PresState_s1<0> = 0)*( PresState_s1<1> = 1)*( PresState_s1<2> = 0)*( PresState_s1<3> = 0) ) +
((PresState_s1<0> = 1)*( PresState_s1<1> = 1)*( PresState_s1<2> = 1)*( PresState_s1<3> = 1) ) ) ) *
( NonCacheableHeld_s1 = 0 ) );

################################################################################
#Formula PASSED when MemStall_s1 = 0 was used in original Verilog code otherwise FAILED
#Verilog file: 2
#VIS command used: check_invariant
#The original implementation says $WriteTag_s2=1$ if $PrevState_s2=XFER3$(which is caught by the next formula), which should imply that $PresState_s1=CACHEHIT$ or $PresState_s1=REFETCH$. But I guess due to the two phase clock system this will occur after necessary clock cycles are reached, therefore this formula fails as soon as $WriteTag_s2=1$.
#===============================================================================
((WriteTag_s2 = 1 ) ->
((( PresState_s1<0> = 0)*( PresState_s1<1> = 1)*( PresState_s1<2> = 0)*( PresState_s1<3> = 0) ) +
(( PresState_s1<0> = 1)*( PresState_s1<1> = 1)*( PresState_s1<2> = 1)*( PresState_s1<3> = 1))));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: check_invariant
#$WriteTag_s2=1$  if $PrevState_s2=XFER3$, cache refilling has finished. 
#===============================================================================
((WriteTag_s2 = 1 ) ->
(( PrevState_s2<0> = 1)*( PrevState_s2<1> = 0)*( PrevState_s2<2> = 1)*( PrevState_s2<3> = 1)));

################################################################################
#Formula FAILED even when only MemStall_s1 = 0
#Verilog file: 1, 2
#VIS command used: check_invariant
#This formula states that state $XFER3$ must follow $XFER3$, $XFER2$, $WAITXfer3$. 
#===============================================================================
((( PresState_s1<0> = 1)*( PresState_s1<1> = 0)*( PresState_s1<2> = 1)*( PresState_s1<3> = 1)) ->
((( PrevState_s2<0> = 1)*( PrevState_s2<1> = 0)*( PrevState_s2<2> = 0)*( PrevState_s2<3> = 1)) +
(( PrevState_s2<0> = 1)*( PrevState_s2<1> = 0)*( PrevState_s2<2> = 1)*( PrevState_s2<3> = 1)) +
(( PrevState_s2<0> = 0)*( PrevState_s2<1> = 0)*( PrevState_s2<2> = 1)*( PrevState_s2<3> = 1))));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#Always at some future time finally latched variable should take its next state value. This can happen either in $Phi1$ or $Phi2$ cycle of the two phase clock system.
#===============================================================================
AG((ReadCache_v1i = 1) -> AF(ReadCache_s2i = 1 ) );

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#Always at the next state delayed version of the same signal should have its previous value.
#===============================================================================
AG((IStall_s1 = 1) -> AX( IStall_s2=1 ));

################################################################################
#Formula PASSED 
#Verilog file: 1
#VIS command used: model_check
#===============================================================================
AG(( ADynamicBit_s2r = 1 ) -> AX( ADynamicBit_s1e = 1) );

################################################################################
#Formula PASSED when MemStall_s1 = 0 was used in original Verilog code otherwise FAILED
#Verilog file: 2
#VIS command used: model_check
#===============================================================================
AG((( PresState_s1<0> = 1)*( PresState_s1<1> = 1)*( PresState_s1<2> = 1)*( PresState_s1<3> = 1)) ->
AX((( PrevState_s2<0> = 1)*( PrevState_s2<1> = 1)*( PrevState_s2<2> = 1)*( PrevState_s2<3> = 1))));

################################################################################
#Formula FAILED even when only MemStall_s1 = 0
#Verilog file: 1, 2
#VIS command used: model_check
#===============================================================================
AG((( PrevState_s2<0> = 1)*( PrevState_s2<1> = 1)*( PrevState_s2<2> = 1)*( PrevState_s2<3> = 1) )->
AF((( PresState_s1<0> = 0)*( PresState_s1<1> = 1)*( PresState_s1<2> = 0)*( PresState_s1<3> = 0) ) +
(( PresState_s1<0> = 1)*( PresState_s1<1> = 1)*( PresState_s1<2> = 1)*( PresState_s1<3> = 1) )));

################################################################################
#Formula PASSED when added register variable Match_s3r and ICacheLineValid_s3r to keep the values respectively and initialized them to 1.
#Verilog file: 3
#VIS command used: model_check
#This property is related with the instruction cache refilling state machine. From all the states where an instruction cache miss occurs there exist a path to a $REFETCH$ state, meaning that instruction cache has been refilled. The reason to use $EF$ instead of $AF$ is that whenever a reset occurs this may not be accomplished since you have to return back to the $CACHEHIT$ state. While checking for this formula VIS gave the error "Node ICacheMiss\_v2r is not driven only by latches and constants" so I added register variables $Match\_s3r$ and $ICacheLineValid\_s3r$ to keep the values respectively and initialized them to 1.
#===============================================================================
AG( (ICacheMiss_v2r=1)-> 
EF( ( PrevState_s2<0> = 1)*( PrevState_s2<1> = 1)*( PrevState_s2<2> = 1)*( PrevState_s2<3> = 1) ));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#This property attempts to say that always a cache refill operation should be completed. Actually $TempState\_v2$ is the same as present state at the next $Phi2$ cycle.
#===============================================================================
AG((( TempState_v2<0> = 0)*( TempState_v2<1> = 1)*( TempState_v2<2> = 0)*( TempState_v2<3> = 0))->
EF(( TempState_v2<0> = 1)*( TempState_v2<1> = 1)*( TempState_v2<2> = 1)*( TempState_v2<3> = 1)));

################################################################################
#Formula FAILED
#Verilog file: 1, 2, 3
#VIS command used: model_check
#===============================================================================
AG((( ADynamicBit_s1e = 1 ) * (ADynamicBit_s2r =1) * (MipsMode_s1 = 0)) -> (BDrvA_s2r = 0));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#If the present state is different than $CACHEHIT$ state(which means there is no cache miss) then we must have a cache miss and instruction pipeline should be stalled unless a higher priority event takes place like resetting.
#===============================================================================
AG (!(( PresState_s1<0> = 0)*( PresState_s1<1> = 1)*( PresState_s1<2> = 0)*( PresState_s1<3> = 0)) -> EF( IStall_s1 = 1) );

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#===============================================================================
AG(( IFetchStall_s2 = 0 ) ->  
EF!(( PrevState_s2<0> = 0)*( PrevState_s2<1> = 1)*( PrevState_s2<2> = 0)*( PrevState_s2<3> = 0)));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#Similar to the above formula
#===============================================================================
AG(!(( PrevState_s2<0> = 0)*( PrevState_s2<1> = 1)*( PrevState_s2<2> = 0)*( PrevState_s2<3> = 0))->
EF(IFetchStall_s2 = 0 ));

################################################################################
#Formula FAILED
#Verilog file: 1, 2, 3
#VIS command used: model_check
#Actually this seemes to be as a true formula but it turns out that it fails.
#===============================================================================
AG(( IFetchStall_s2 = 1 ) -> ( IStall_s2 = 1));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#This formula passed so it meant that actually tag writing on the cache was something different than reading of the cache because you could read from cache an instruction only if an other instruction is not being written to the cache whereas you can write the tag while an instruction is being written.
#===============================================================================
EF((WriteCache_s2= 1) * ( WriteTag_s2 = 1));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#Supporting formula for the above goal
#===============================================================================
EF((WriteTag_s2=1)*(NonCacheableHeld_s1=1));

################################################################################
#Formula PASSED
#Verilog file: 1
#VIS command used: model_check
#WriteCache\_s2 becomes one in some paths before WriteTag\_s2 becomes one. Again not for all states because if a reset arrives then $WriteCache\_s2$ may not become one since we wont be in instruction transfer states.
#===============================================================================
E(( WriteTag_s2 = 0) U ( (WriteCache_s2= 1) * ( WriteTag_s2 = 0) ) );

################################################################################
#Formula FAILED
#Verilog file: 1, 2, 3
#VIS command used: model_check
#===============================================================================
AG(!((ADrvB_s2r=1)*(BDrvA_s2r=1)));
