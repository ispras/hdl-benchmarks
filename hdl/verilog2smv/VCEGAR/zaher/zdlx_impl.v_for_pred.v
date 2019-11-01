module main;
    reg [2:0] ALUCtrl;
    wire Clk;
    reg [4:0] EXCtrl;
    reg [3:0] EX_MEM_ALUOut;
    reg [3:0] EX_MEM_B;
    reg EX_MEM_BC;
    reg [31:0] EX_MEM_IR;
    reg [2:0] EX_MEM_MEMCTRL;
    reg [2:0] EX_MEM_WBCTRL;
    reg EX_MEM_update_pc;
    reg EX_MEM_valid;
    reg EX_valid;
    reg [3:0] ID_EX_A;
    reg [3:0] ID_EX_B;
    reg [4:0] ID_EX_EXCTRL;
    reg [3:0] ID_EX_I;
    reg [31:0] ID_EX_IR;
    reg [2:0] ID_EX_MEMCTRL;
    reg [3:0] ID_EX_NPC;
    reg [2:0] ID_EX_WBCTRL;
    reg ID_EX_fwd_a_from_ex;
    reg ID_EX_fwd_a_from_mem;
    reg ID_EX_fwd_a_from_wb;
    reg ID_EX_fwd_b_from_ex;
    reg ID_EX_fwd_b_from_mem;
    reg ID_EX_fwd_b_from_wb;
    reg ID_EX_update_pc;
    reg ID_EX_valid;
    reg [31:0] IF_ID_IR;
    reg [3:0] IF_ID_NPC;
    reg IF_ID_update_pc;
    reg IF_ID_valid;
    wire J_identified;
    reg [2:0] MEMCtrl;
    reg [3:0] MEM_WB_ALUOut;
    reg [31:0] MEM_WB_IR;
    reg [3:0] MEM_WB_MD;
    reg [2:0] MEM_WB_WBCTRL;
    reg MEM_WB_update_pc;
    reg MEM_WB_valid;
    reg [3:0] PC;
    reg PC_valid;
    wire Reset;
    reg [2:0] WBCtrl;
    wire [3:0] aluain;
    wire [3:0] alubin;
    wire [3:0] aluout;
    reg [3:0] argumentA;
    reg [3:0] argumentB;
    wire [3:0] aux1;
    wire axiom;
    wire bcin;
    wire [3:0] concat1;
    wire [3:0] dmemout;
    wire flush;
    wire [31:0] four;
    wire fwd_a_from_ex;
    wire fwd_a_from_mem;
    wire fwd_a_from_wb;
    wire fwd_b_from_ex;
    wire fwd_b_from_mem;
    wire fwd_b_from_wb;
    reg [5:0] icnt;
    wire [3:0] iin;
    wire [31:0] imemout_tmp;
    wire [31:0] imemout_tmp1;
    reg [3:0] next_PC;
    wire [3:0] npcin;
    wire [31:0] one;
    reg [3:0] prev_wb2rf;
    wire [2:0] rd;
    wire [2:0] rd1;
    wire [2:0] rd2;
    wire [2:0] rd_reg1;
    wire [2:0] rd_reg2;
    wire [3:0] rf2a;
    wire [3:0] rf2b;
    wire tmp1;
    wire tmp2;
    wire [31:0] two;
    reg update_pc;
    wire [3:0] updpc;
    wire [3:0] wb2rf;
    wire [31:0] zero;
    assign  zero = 32'b00000000000000000000000000000000;
    assign  one = 32'b00000000000000000000000000000001;
    assign  two = 32'b00000000000000000000000000000010;
    assign  four = 32'b00000000000000000000000000000100;
    assign  axiom = 1;
    assign  Reset = 1'b0;
    assign  imemout_tmp1 = imemout_tmp;
    assign  flush = 0;
    assign  J_identified = (EX_MEM_valid)&&(EX_MEM_MEMCTRL[0]);
    assign  updpc = (J_identified)?(0):((PC)+(1));
    assign  npcin = (PC)+(1);
    assign  tmp1 = MEM_WB_WBCTRL[2];
    assign  rd_reg1 = IF_ID_IR[23:21];
    assign  rd_reg2 = IF_ID_IR[18:16];
    assign  rd = (MEM_WB_WBCTRL[1])?(MEM_WB_IR[13:11]):(MEM_WB_IR[18:16]);
    assign  concat1 = {2'b00, IF_ID_IR[1:0]};
    assign  iin = {2'b00, IF_ID_IR[1:0]};
    assign  aluout = aluain;
    assign  aux1 = (EX_MEM_WBCTRL[0])?(EX_MEM_ALUOut):(dmemout);
    assign  bcin = (ID_EX_EXCTRL[2])?(((argumentA)!==(0))?(1):(0)):(((argumentA)===(0))?(1):(0));
    assign  aluain = (ID_EX_EXCTRL[1])?(argumentA):(ID_EX_NPC);
    assign  alubin = (ID_EX_EXCTRL[0])?(argumentB):(ID_EX_I);
    assign  tmp2 = EX_MEM_MEMCTRL[2];
    assign  wb2rf = (MEM_WB_WBCTRL[0])?(MEM_WB_ALUOut):(MEM_WB_MD);
    assign  rd1 = (EX_MEM_WBCTRL[1])?(EX_MEM_IR[13:11]):(EX_MEM_IR[18:16]);
    assign  rd2 = (ID_EX_WBCTRL[1])?(ID_EX_IR[13:11]):(ID_EX_IR[18:16]);
    assign  fwd_a_from_ex = (IF_ID_valid)&&((ID_EX_WBCTRL[2])&&((rd2)==(rd_reg1)));
    assign  fwd_b_from_ex = (IF_ID_valid)&&((ID_EX_WBCTRL[2])&&((rd2)==(rd_reg2)));
    assign  fwd_a_from_mem = (IF_ID_valid)&&((EX_MEM_WBCTRL[2])&&((rd1)==(rd_reg1)));
    assign  fwd_b_from_mem = (IF_ID_valid)&&((EX_MEM_WBCTRL[2])&&((rd1)==(rd_reg2)));
    assign  fwd_a_from_wb = (IF_ID_valid)&&((MEM_WB_WBCTRL[2])&&((rd)==(rd_reg1)));
    assign  fwd_b_from_wb = (IF_ID_valid)&&((MEM_WB_WBCTRL[2])&&((rd)==(rd_reg2)));
    initial /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:60 */
      begin
        update_pc =  0;  /* :61 */
        PC_valid =  1;  /* :62 */
        IF_ID_valid =  0;  /* :63 */
        IF_ID_update_pc =  0;  /* :64 */
        ID_EX_update_pc =  0;  /* :65 */
        EX_MEM_update_pc =  0;  /* :66 */
        MEM_WB_update_pc =  0;  /* :67 */
        ID_EX_valid =  0;  /* :68 */
        EX_MEM_valid =  0;  /* :69 */
        MEM_WB_valid =  0;  /* :70 */
      end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:79 */
      @(PC)
        begin
          if (((J_identified)||(!(flush)))||((MEM_WB_update_pc)&&(MEM_WB_valid)))
             next_PC =  updpc;  /* :83 */
          else
             next_PC =  PC;  /* :85 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:88 */
      @(posedge Clk)
        begin
          if (((J_identified)||(!(flush)))||((MEM_WB_update_pc)&&(MEM_WB_valid)))
             IF_ID_update_pc <=  0;  /* :90 */
          else
             IF_ID_update_pc <=  PC_valid;  /* :92 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:95 */
      @(posedge Clk)
        begin
          PC_valid <=  !(flush);  /* :96 */
          update_pc <=  !(flush);  /* :97 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:100 */
      @(posedge Clk)
        begin
          if (J_identified)
             begin
               IF_ID_valid <=  0;  /* :102 */
               EX_MEM_valid <=  0;  /* :103 */
             end
          else
             begin
               IF_ID_valid <=  PC_valid;  /* :105 */
               EX_MEM_valid <=  ID_EX_valid;  /* :106 */
             end
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:110 */
      @(posedge Clk)
        begin
          MEM_WB_valid <=  EX_MEM_valid;  /* :111 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:114 */
      @(posedge Clk)
        begin
          ID_EX_update_pc <=  IF_ID_update_pc;  /* :115 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:117 */
      @(posedge Clk)
        begin
          EX_MEM_update_pc <=  ID_EX_update_pc;  /* :118 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:120 */
      @(posedge Clk)
        begin
          MEM_WB_update_pc <=  (EX_MEM_update_pc)&&(!(J_identified));  /* :121 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:127 */
      @(posedge Clk)
        begin
 /* :133 */
            PC =  next_PC;  /* :133 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:160 */
      @(posedge Clk)
 /* :161 */
          IF_ID_NPC =  npcin;  /* :161 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:164 */
      @(posedge Clk)
 /* :165 */
          IF_ID_IR =  imemout_tmp1;  /* :165 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:185 */
      @(posedge Clk)
 /* :186 */
          ID_EX_NPC =  IF_ID_NPC;  /* :186 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:189 */
      @(posedge Clk)
 /* :190 */
          ID_EX_A =  rf2a;  /* :190 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:193 */
      @(posedge Clk)
 /* :194 */
          ID_EX_B =  rf2b;  /* :194 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:197 */
      @(posedge Clk)
 /* :198 */
          ID_EX_I =  iin;  /* :198 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:201 */
      @(posedge Clk)
 /* :202 */
          ID_EX_IR =  IF_ID_IR;  /* :202 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:206 */
      @(posedge Clk)
 /* :207 */
          ID_EX_WBCTRL =  WBCtrl;  /* :207 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:210 */
      @(posedge Clk)
 /* :211 */
          ID_EX_MEMCTRL =  MEMCtrl;  /* :211 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:214 */
      @(posedge Clk)
 /* :215 */
          ID_EX_EXCTRL =  EXCtrl;  /* :215 */
    wire [7:0] concat_rep50_0;
    assign concat_rep50_0 = {ID_EX_EXCTRL[4:3], ID_EX_IR[31:26]};
    wire [7:0] concat_rep50_1;
    assign concat_rep50_1 = {2'b11, 6'b001000};
    wire [7:0] concat_rep50_2;
    assign concat_rep50_2 = {2'b01, 6'b000000};
    wire [7:0] concat_rep50_3;
    assign concat_rep50_3 = {2'b00, 6'b000000};
    wire [7:0] concat_rep50_4;
    assign concat_rep50_4 = {2'b10, 6'b100100};
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:284 */
      @(ID_EX_EXCTRL[4:3] or ID_EX_IR[31:26] or ID_EX_IR[5:0])
        begin
          if (((ID_EX_EXCTRL[4:3])==(2'b11))||((ID_EX_EXCTRL[4:3])==(2'b01)))
             begin
               case (concat_rep50_0) /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:286 */
                 concat_rep50_1:
                     ALUCtrl =  3'b010;  /* :287 */
                 concat_rep50_2:
                     ALUCtrl =  3'b010;  /* :288 */
               endcase
             end
          else
             begin
               case (ID_EX_EXCTRL[4:3]) /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:293 */
                 concat_rep50_3:
                     ALUCtrl =  3'b010;  /* :294 */
                 concat_rep50_4:
                     ALUCtrl =  0;  /* :295 */
               endcase
             end
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:320 */
      @(posedge Clk)
        begin
          ID_EX_fwd_a_from_ex <=  fwd_a_from_ex;  /* :321 */
          ID_EX_fwd_b_from_ex <=  fwd_b_from_ex;  /* :322 */
          ID_EX_fwd_a_from_mem <=  fwd_a_from_mem;  /* :323 */
          ID_EX_fwd_b_from_mem <=  fwd_b_from_mem;  /* :324 */
          ID_EX_fwd_a_from_wb <=  fwd_a_from_wb;  /* :325 */
          ID_EX_fwd_b_from_wb <=  fwd_b_from_wb;  /* :326 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:333 */
      @(ID_EX_A)
        begin
          if (ID_EX_fwd_a_from_ex)
             argumentA =  aux1;  /* :335 */
          else
             if (ID_EX_fwd_a_from_mem)
                argumentA =  wb2rf;  /* :337 */
             else
                if (ID_EX_fwd_a_from_wb)
                   argumentA =  prev_wb2rf;  /* :339 */
                else
                   argumentA =  ID_EX_A;  /* :341 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:345 */
      @(ID_EX_B)
        begin
          if (ID_EX_fwd_b_from_ex)
             argumentB =  aux1;  /* :347 */
          else
             if (ID_EX_fwd_b_from_mem)
                argumentB =  wb2rf;  /* :349 */
             else
                if (ID_EX_fwd_b_from_wb)
                   argumentB =  prev_wb2rf;  /* :351 */
                else
                   argumentB =  ID_EX_B;  /* :353 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:372 */
      @(posedge Clk)
 /* :373 */
          EX_MEM_BC =  bcin;  /* :373 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:376 */
      @(posedge Clk)
 /* :377 */
          EX_MEM_ALUOut =  aluout;  /* :377 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:380 */
      @(posedge Clk)
 /* :381 */
          EX_MEM_B =  argumentB;  /* :381 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:384 */
      @(posedge Clk)
 /* :385 */
          EX_MEM_IR =  ID_EX_IR;  /* :385 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:389 */
      @(posedge Clk)
        if (J_identified)
           EX_MEM_WBCTRL =  0;  /* :391 */
        else
 /* :393 */
             EX_MEM_WBCTRL =  ID_EX_WBCTRL;  /* :393 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:396 */
      @(posedge Clk)
        if (J_identified)
           EX_MEM_MEMCTRL =  0;  /* :398 */
        else
 /* :400 */
             EX_MEM_MEMCTRL =  ID_EX_MEMCTRL;  /* :400 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:412 */
      @(posedge Clk)
 /* :413 */
          MEM_WB_ALUOut =  EX_MEM_ALUOut;  /* :413 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:416 */
      @(posedge Clk)
 /* :417 */
          MEM_WB_MD =  dmemout;  /* :417 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:420 */
      @(posedge Clk)
 /* :421 */
          MEM_WB_IR =  EX_MEM_IR;  /* :421 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:425 */
      @(posedge Clk)
 /* :426 */
          MEM_WB_WBCTRL =  EX_MEM_WBCTRL;  /* :426 */
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:434 */
      @(posedge Clk)
        begin
          prev_wb2rf <=  wb2rf;  /* :435 */
        end
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:469 */
      @(posedge Clk)
        begin
          ID_EX_valid =  EX_valid;  /* :470 */
        end
    wire [4:0] concat_rep66_0;
    assign concat_rep66_0 = {2'b10, 3'b011};
    wire [4:0] concat_rep66_1;
    assign concat_rep66_1 = {2'b10, 3'b011};
    wire [4:0] concat_rep66_2;
    assign concat_rep66_2 = {2'b10, 3'b010};
    wire [4:0] concat_rep66_3;
    assign concat_rep66_3 = {2'b01, 3'b001};
    wire [4:0] concat_rep66_4;
    assign concat_rep66_4 = {2'b01, 3'b001};
    wire [4:0] concat_rep66_5;
    assign concat_rep66_5 = {2'b01, 3'b101};
    wire [4:0] concat_rep66_6;
    assign concat_rep66_6 = {2'b11, 3'b011};
    wire [4:0] concat_rep66_7;
    assign concat_rep66_7 = {2'b00, 3'b011};
    wire [4:0] concat_rep66_8;
    assign concat_rep66_8 = {2'b00, 3'b011};
    always /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:473 */
      @(IF_ID_IR)
        begin
          if ((!(IF_ID_valid))||(J_identified))
             begin
               EXCtrl =  0;  /* :478 */
               MEMCtrl =  0;  /* :479 */
               WBCtrl =  0;  /* :480 */
               EX_valid =  0;  /* :481 */
             end
          else
             if (!(Reset))
                begin
                  EX_valid =  1;  /* :486 */
                  case (IF_ID_IR[31:26]) /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:488 */
                    6'b000000:
                        begin
                          if ((IF_ID_IR)==(0))
                             begin
                               EXCtrl =  0;  /* :491 */
                               MEMCtrl =  0;  /* :492 */
                               WBCtrl =  0;  /* :493 */
                             end
                          else
                             begin
                               case (IF_ID_IR[5:0]) /* /z/zandrawi/UCLID/Parser/Icarus/OurCode/Flow/files/zdlx_impl.v:497 */
                                 6'b000000:
                                     begin
                                       EXCtrl =  concat_rep66_0;  /* :499 */
                                       MEMCtrl =  0;  /* :500 */
                                       WBCtrl =  3'b111;  /* :501 */
                                     end
                                 6'b000010:
                                     begin
                                       EXCtrl =  concat_rep66_1;  /* :504 */
                                       MEMCtrl =  0;  /* :505 */
                                       WBCtrl =  3'b111;  /* :506 */
                                     end
                                 default:
                                     begin
                                       EXCtrl =  concat_rep66_2;  /* :509 */
                                       MEMCtrl =  0;  /* :510 */
                                       WBCtrl =  3'b111;  /* :511 */
                                     end
                               endcase
                             end
                        end
                    6'b000010:
                        begin
                          EXCtrl =  concat_rep66_3;  /* :519 */
                          MEMCtrl =  3'b010;  /* :520 */
                          WBCtrl =  0;  /* :521 */
                        end
                    6'b000100:
                        begin
                          EXCtrl =  concat_rep66_4;  /* :525 */
                          MEMCtrl =  3'b001;  /* :526 */
                          WBCtrl =  0;  /* :527 */
                        end
                    6'b000101:
                        begin
                          EXCtrl =  concat_rep66_5;  /* :531 */
                          MEMCtrl =  3'b001;  /* :532 */
                          WBCtrl =  0;  /* :533 */
                        end
                    6'b001000:
                        begin
                          EXCtrl =  concat_rep66_6;  /* :537 */
                          MEMCtrl =  0;  /* :538 */
                          WBCtrl =  3'b101;  /* :539 */
                        end
                    6'b100011:
                        begin
                          EXCtrl =  concat_rep66_7;  /* :543 */
                          MEMCtrl =  0;  /* :544 */
                          WBCtrl =  3'b100;  /* :545 */
                        end
                    6'b101011:
                        begin
                          EXCtrl =  concat_rep66_8;  /* :549 */
                          MEMCtrl =  3'b100;  /* :550 */
                          WBCtrl =  0;  /* :551 */
                        end
                  endcase
                end
             else
                begin
                  EXCtrl =  0;  /* :557 */
                  MEMCtrl =  0;  /* :558 */
                  WBCtrl =  0;  /* :559 */
                end
        end // always @(IF_ID_IR)

   assert property (~(~EX_MEM_valid & ~MEM_WB_update_pc & ~PC_valid & ~ID_EX_valid & IF_ID_valid & ~IF_ID_update_pc & ~ID_EX_update_pc & ~EX_MEM_update_pc));
   

endmodule
