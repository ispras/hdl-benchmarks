/* two player version */
	module main(clk, RDealer1, RDealer2);
 	input clk;
	output RDealer1;
	output RDealer2;
   /* Declerations */
	reg[0:2]   strategy;
 	wire[0:3]  Dealer1; 
	wire[0:3]  Dealer2; 
	reg[0:3]   RDealer1;
	reg[0:3]   RDealer2;
	reg[0:3]   Flag;
	reg[0:4]   PScore1;
	reg[0:4]   PScore2;
	reg[0:4]   DScore;
	reg[0:1]   Status1;
	reg[0:1]   Status2;
	reg[0:1]   StatusD;
	reg[0:2]   Aces11P1;
	reg[0:2]   Aces11P2;
	reg[0:2]   Aces11D;
	reg[0:4]   CCard;
        reg[0:1]   GStatus;
	reg[0:2]   Winner; 
  /* Card Declerations */	
	reg[0:3]   Deck[0:15]; /* Will have 16 type of cards */
			    /* The cards from 0 to 12 have 8 instance */
			    /* Last 3 of them initially have 0 instance */
			    /* So even if they are dealt , it won`t count */ 
	reg[0:3] First6Card[0:5];
	reg[0:2] StartGame;
	reg[0:3] temp;
	wire[0:3] ZFFCard1;
	wire[0:3] ZFFCard2;
	wire[0:3] ZFFCard3;
	wire[0:3] ZFFCard4;
	wire[0:3] ZFFCard5;
	wire[0:3] ZFFCard6;

	reg[0:8] GameCounter; /* Counts How Many Games Played in this RUN */
	reg Error;
	reg[0:10] GStat0;
	reg[0:10] GStat1;
	reg[0:10] GStat2;
	reg[0:10] GStat3;
	reg[0:10] GStat4;
	reg[0:10] GStat5;
	reg[0:10] GStat6;
	reg[0:10] GStat7;

/* Inilialization of some variables */
	initial  begin
		strategy=0;
		RDealer1=0;
		RDealer2=0;
		Flag=0;
		PScore1=0;
		PScore2=0;
		DScore=0;
		Status1=0;
		Status2=0;
		StatusD=0;
		Aces11P1=0;
		Aces11P2=0;
		Aces11D=0;
		CCard=0;
	        GStatus=0;
		Winner=0; 
		StartGame=0;
		temp=0;
		GameCounter=0; /* Counts How Many Games Played in this RUN */
		Error=0;
		GStat0=0;
		GStat1=0;
		GStat2=0;
		GStat3=0;
		GStat4=0;
		GStat5=0;
		GStat6=0;
		GStat7=0;
		Deck[0] =8;
		Deck[1] =8;
		Deck[2] =8;
		Deck[3] =8;
		Deck[4] =8;
		Deck[5] =8;
		Deck[6] =8;
		Deck[7] =8;
		Deck[9] =8;
		Deck[10] =8;
		Deck[11] =8;
		Deck[12] =8;
		Deck[13] =0;
		Deck[14] =0;
		Deck[15] =0;
		First6Card[0]=$ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
		First6Card[1]=$ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
		First6Card[2]=$ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
		First6Card[3]=$ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
		First6Card[4]=$ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
		First6Card[5]=$ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
	end	
	
/* For each clock cycle */

assign Dealer1 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
assign Dealer2 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15); 
assign ZFFCard1 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
assign ZFFCard2 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
assign ZFFCard3 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
assign ZFFCard4 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
assign ZFFCard5 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
assign ZFFCard6 = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
/*assign Dealer = 5; */
always @(posedge clk) begin
if ( GStatus == 0) begin

RDealer1=Dealer1; 
RDealer2=Dealer2;  
if(StartGame < 6) begin
	if(First6Card[StartGame]<13) begin
		if(First6Card[StartGame]>9)  CCard=10;
		else CCard=First6Card[StartGame]+1;
		if(First6Card[StartGame]==0) CCard=11;
		case (StartGame)
			0:begin 
			 	DScore = DScore +CCard;
				if(First6Card[StartGame]==0)  Aces11D=1; 
				temp=First6Card[StartGame];
				Deck[temp]=Deck[temp]-1;
				StartGame = StartGame +1; 
			  end
			1:begin
				temp=First6Card[StartGame];
				Deck[temp]=Deck[temp]-1;
				StartGame = StartGame + 1; 
			  end
			2:begin
				PScore1=PScore1 + CCard;
				if(First6Card[StartGame]==0)  Aces11P1=1;
				temp=First6Card[StartGame];
				Deck[temp]=Deck[temp]-1;
				StartGame = StartGame + 1; 
			  end
			3:begin
				PScore1=PScore1 + CCard;
				if(First6Card[StartGame]==0) begin 
					if(Aces11P1 == 1) PScore1=PScore1 -10;
					Aces11P1 = Aces11P1+1;
				end	
				temp=First6Card[StartGame];
				Deck[temp]=Deck[temp]-1;
				StartGame = StartGame + 1; 
			  end 
			4:begin
				PScore2=PScore2 + CCard;
				if(First6Card[StartGame]==0)  Aces11P2=1;
				temp=First6Card[StartGame];
				Deck[temp]=Deck[temp]-1;
				StartGame = StartGame + 1; 
			  end
			5:begin
				PScore2=PScore2 + CCard;
				if(First6Card[StartGame]==0) begin 
					if(Aces11P2 == 1) PScore2=PScore2 -10;
					Aces11P2 = Aces11P2+1;
				end	
				temp=First6Card[StartGame];
				Deck[temp]=Deck[temp]-1;
				StartGame = StartGame + 1; 
			  end 
			default : Error=1;
		endcase 
	end
	else First6Card[StartGame]=Dealer1;	
end /*if startGame >6 */

else begin 

if((RDealer1<13)&&(RDealer2<13)) begin  
 /* If there is no card of that kind find the next valid card */
	if(Deck[RDealer1]== 0) begin 
		Flag=0;			
		for(Flag =0; Flag<13; Flag=Flag+1) begin
			RDealer1=RDealer1+1;
			if(RDealer1==13) RDealer1=0;
			if(Deck[RDealer1]>0) Flag=15;
		end
		if(Flag ==13) GStatus=2;
	end   /* if(Deck[RDealer1]=0) begin */

	if(Deck[RDealer2]== 0) begin 	Flag=0;			
		for(Flag =0; Flag<13; Flag=Flag+1) begin
			RDealer2=RDealer2+1;
			if(RDealer2==13) RDealer2=0;
			if(Deck[RDealer2]>0) Flag=15;
		end
		if(Flag ==13) GStatus=2;
	end   /* if(Deck[RDealer2]=0) begin */


	if(GStatus == 0 ) begin  /* GO ON */
		if(Status1 == 0) begin
		        Deck[RDealer1]= Deck[RDealer1]-1; /* Take the card from deck */
		        /* Assign the value to a card */
		        if (RDealer1 > 9) CCard=10;
			      else CCard = RDealer1+1;
		        if(RDealer1 == 0) CCard=11;
			if (PScore1 > 21) begin
				if (Aces11P1>0) begin
					PScore1 = PScore1-10; 
					Aces11P1= Aces11P1-1;	
				end
				else  Status1=3; 
			end
			if ( PScore1 == 21) begin
				GStatus=1;
				Winner=1;
				Status1=2;
			end
		


			/* Check if player has to stand ? */
			if(strategy==0) begin
				if ((PScore1 < 21) && (PScore1>11) && (DScore<7)) Status1=1;
				if ((PScore1 < 21) && (PScore1>16))  Status1=1;
			end
			if(strategy==1) begin
				if ((PScore1 < 21) && (PScore1>12) && (DScore<4))  Status1=1;
				if ((PScore1 < 21) && (PScore1>11) && (DScore<7) && (DScore>3)) 
				 Status1=1;
				if ((PScore1< 21) && (PScore1>16) && (DScore>6))  Status1=1;
			end
			/* USER : insert your strategy for Player 1 here */
	
		
			if((Status1==1) && (Status2==1)) begin
				if(First6Card[1] > 9 ) DScore = DScore +10;
				else DScore = DScore + First6Card[1] +1;
				if(First6Card[1] == 0 ) DScore = DScore +10;
				if(First6Card[1]==0) begin 
					if(Aces11D == 1) DScore=DScore -10;
					Aces11D = Aces11D+1;
				end	
		      	end	
			else begin
				if((GStatus == 0)&&(Status1==0)) begin
					PScore1 = PScore1 + CCard;
					if (RDealer1 == 0) Aces11P1=Aces11P1+1;
				end
			end
		end
		


		if(Status2 == 0 ) begin
		        Deck[RDealer2]= Deck[RDealer2]-1; /* Take the card from deck */
		        /* Assign the value to a card */
		        if (RDealer2 > 9) CCard=10;
			      else CCard = RDealer2+1;
		        if(RDealer2 == 0) CCard=11;
			if (PScore2 > 21) begin
				if (Aces11P2>0) begin
					PScore2 = PScore2-10; 
					Aces11P2= Aces11P2-1;	
				end
				else  Status2=3; 
			end
			if ( PScore2 == 21) begin
				GStatus=1;
				Winner=2;
				Status2=2;
			end
		

			/* Check if player has to stand ? */
			if(strategy == 0) begin
				if ((PScore2 < 21) && (PScore2>11) && (DScore<7)) Status2=1;
				if ((PScore2 < 21) && (PScore2>16))  Status2=1;
			end
			if(strategy == 1) begin
				if ((PScore2 < 21) && (PScore2>12) && (DScore<4))  Status2=1;
				if ((PScore2 < 21) && (PScore2>11) && (DScore<7) && (DScore>3)) 
				 Status2=1;
				if ((PScore2< 21) && (PScore2>16) && (DScore>6))  Status2=1;
			end
			/* USER : insert your strategy for Player 2 here */

			if((Status2==1) && (Status2==1)) begin
				if(First6Card[1] > 9 ) DScore = DScore +10;
				else DScore = DScore + First6Card[1] +1;
				if(First6Card[1] == 0 ) DScore = DScore +10;
				if(First6Card[1]==0) begin 
					if(Aces11D == 1) DScore=DScore -10;
					Aces11D = Aces11D+1;
				end	
		      	end	
			else begin
				if((GStatus == 0)&&(Status2==0)) begin
					PScore2 = PScore2 + CCard;
					if (RDealer2 == 0) Aces11P2=Aces11P2+1;
				end
			end
		end
		


		if((Status1 == 1) && (Status2 == 1) ) begin /* Now dealer has to hit soft 17 */
		        Deck[RDealer1]= Deck[RDealer1]-1; /* Take the card from deck */
		        /* Assign the value to a card */
		        if (RDealer1 > 9) CCard=10;
			      else CCard = RDealer1+1;
		        if(RDealer1 == 0) CCard=11;
	
			if ( DScore > 21) begin
				if (Aces11D>0) begin
					DScore = DScore-10; 
					Aces11D= Aces11D-1;	
				end
			 	else begin
				GStatus=1; 				
				StatusD=3;
				end

			end
			if ( DScore == 21) begin
			       StatusD=2;
			       Winner=3;
			       GStatus=1;
			end


			if(GStatus ==1) begin  /* Find the winner */
				if( Winner == 0)begin /* noone has blackjack */
					if((Status1==1) && (Status2!=1) && (StatusD!=1)) Winner =1;
					if((Status1!=1) && (Status2==1) && (StatusD!=1)) Winner =2;
					if((Status1!=1) && (Status2!=1) && (StatusD==1)) Winner =3;
					if((Status1==1) && (Status2==1) && (StatusD!=1)) begin
						if(PScore1>PScore2) Winner =1;
						if(PScore1<PScore2) Winner =2;
						if(PScore1==PScore2) Winner =4;
					end				
					if((Status1==1) && (Status2!=1) && (StatusD==1)) begin
						if(PScore1>DScore) Winner =1;
						if(PScore1<DScore) Winner =3;
						if(PScore1==DScore) Winner =5;
					end
					if((Status1!=1) && (Status2==1) && (StatusD==1)) begin
						if(PScore2>DScore) Winner =2;
						if(PScore2<DScore) Winner =3;
						if(PScore2==DScore) Winner =6;
					end
					if((Status1==1) && (Status2==1) && (StatusD==1)) begin
						if((PScore1==PScore2)&& (PScore2==DScore)) Winner =7; /* all equal */
						if((PScore1>PScore2) && (PScore2>=DScore)) Winner=1;
						if((PScore1>DScore) && (DScore>=PScore2)) Winner=1;

						if((PScore2>PScore1) && (PScore1>=DScore)) Winner=2;
						if((PScore2>DScore) && (DScore>=PScore1)) Winner=2;

						if((DScore>PScore1) && (PScore1>=PScore2)) Winner=3;
						if((DScore>PScore2) && (PScore2>=PScore1)) Winner=3;

						if((PScore1==PScore2) && (PScore2>DScore)) Winner=4;
						if((PScore1==DScore) && (DScore>PScore2)) Winner=5;
						if((PScore2==DScore) && (DScore>PScore1)) Winner=6;

					end

				end
			end

			if(GStatus==0) begin  
				DScore = DScore + CCard;
				if (RDealer1 ==0 )  Aces11D=Aces11D+1;
			end

		end /* if((Status1 == 1) && (Status2 == 1) ) begin */


	end  /* if(GStatus == 0 ) begin */
end /* if(RDealer<13) begin */
end /* if StartGame >=5 */









end /* if (GStatus == 0 ) */
else begin  /* reinitialize the Game and Start playing again*/

/* update Game statistics */
GameCounter=GameCounter +1 ;
	case(Winner)
		0: begin
			GStat0=GStat0+1;	
		end
		1: begin
			GStat1=GStat1+1;
		end
		2: begin
			GStat2=GStat2+1;
		end
		3:begin
			GStat3=GStat3+1;
		end
		4:begin
			GStat4=GStat4+1;
		end
		5: begin
			GStat5=GStat5+1;
		end
		6:begin
			GStat6=GStat6+1;
		end
		7:begin
			GStat7=GStat7+1;
		end

		default:	Error=1;	
	endcase	
	/*Reinitialize the system here */
		RDealer1=0;
		RDealer2=0;
		Flag=0;
		PScore1=0;
		PScore2=0;
		DScore=0;
		Status1=0;
		Status2=0;
		StatusD=0;
		Aces11P1=0;
		Aces11P2=0;
		Aces11D=0;
		CCard=0;
	        GStatus=0;
		Winner=0; 
		StartGame=0;
		temp=0;
		Deck[0] =8;
		Deck[1] =8;
		Deck[2] =8;
		Deck[3] =8;
		Deck[4] =8;
		Deck[5] =8;
		Deck[6] =8;
		Deck[7] =8;
		Deck[9] =8;
		Deck[10] =8;
		Deck[11] =8;
		Deck[12] =8;
		Deck[13] =0;
		Deck[14] =0;
		Deck[15] =0;
		First6Card[0]=ZFFCard1;
		First6Card[1]=ZFFCard2;
		First6Card[2]=ZFFCard3;
		First6Card[3]=ZFFCard4;
		First6Card[4]=ZFFCard5;
		First6Card[5]=ZFFCard6;
end  /*Reinitialize the system */



end /* always */
endmodule /* end of the program */


























