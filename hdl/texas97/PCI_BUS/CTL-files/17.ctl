#these are all with abnormal transactions enabled
AG(!(m1.TransStatus[3]=0 * m1.TransStatus[2]=0 * m1.TransStatus[1]=0 * m1.TransStatus[0]=0));
#whether any transaction completes successfully?
#Yes it does,  (the Formula Fails.)


AG(!(m1.TransStatus[3]=0 * m1.TransStatus[2]=0 * m1.TransStatus[1]=0 * m1.TransStatus[0]=1));
#whether any transaction completes with Retry?
#Yes it does, when preterm=1, (the Formula Fails.)


AG(!(m1.TransStatus[3]=0 * m1.TransStatus[2]=0 * m1.TransStatus[1]=1 * m1.TransStatus[0]=1));
#whether any transaction completes as a disconnect?
#No it does not, because preterm is set initially as $ND so 
#it cannot become preterm=1 after the cycles start (Formula Passes)


AG(!(m1.TransStatus[3]=0 * m1.TransStatus[2]=0 * m1.TransStatus[1]=1 * m1.TransStatus[0]=0));
#whether any transaction completes as target Abort?
#Yes it does, whenever preterm takes the value of 2 or 3 (Formula Fails) 



AG(!(m1.TransStatus[3]=0 * m1.TransStatus[2]=1 * m1.TransStatus[1]=1 * m1.TransStatus[0]=0));
#whether any transaction sees the master to be busy?
#No, as there is never such a condition in the Master. (formula passes)



AG(!(m1.TransStatus[3]=0 * m1.TransStatus[2]=1 * m1.TransStatus[1]=0 * m1.TransStatus[0]=0));
#whether any transaction completes with Device Time Out?
#Yes it does, when the starting address exceeds the target's decode
#range Devsel Time Out occurs. (Formula Fails)



AG(!(m1.TransStatus[3]=0 * m1.TransStatus[2]=1 * m1.TransStatus[1]=0 * m1.TransStatus[0]=1));
#whether any transaction completes with master preempted?
#Yes it does,  when the master's Grant is removed due to
#too long a burst. (Formula Failed).


AG(!(m1.TransStatus[3]=1 * m1.TransStatus[2]=0 * m1.TransStatus[1]=0 * m1.TransStatus[0]=0));
#whether transaction status becomes Incomplete?
#Yes it does, Whenever a cycle starts  (Formula Fails.)
