
module codec_decode ( resetb,
                sys_clk,
                addr_a_cycle,
                p1,
                p2,
                p3,
                p4,
                rom_data,
                p2_t_left,
                p2_ram_left,
                p2_a_right,
                p2_write_reg_a,
                p3_t_left,
                p3_a_right,
                p3_write_reg_a,
                p4_ram_left,
                p4_t_left,
                p4_y_left,
                p4_inport_left,
                p4_a_right,
                p4_y_right, 
                p4_write_reg_t,
                p4_write_reg_a, 
                p4_write_outport,
                p4_write_reg_y,
                p4_write_memory,
                addr_a_only,
                ram_clk, ram_addr, ram_web,
                p2_shift, p3_shift, p4_shift,
                p2_plus, p3_plus, p4_plus
                );

// INPUTS
input 	                        resetb; 
input 	                        sys_clk; 
input 	                        addr_a_cycle; 
input 	                        p1; 
input 	                        p2; 
input 	                        p3; 
input 	                        p4; 
input 	[25:0]	rom_data;    

// OUTPUTS
output          p2_t_left, p2_ram_left;
output          p2_a_right;
output          p2_write_reg_a;
output          p3_t_left;
output          p3_a_right;
output		p3_write_reg_a;
output          p4_ram_left, p4_t_left, p4_y_left, p4_inport_left;
output          p4_a_right, p4_y_right; 
output          p4_write_reg_t, p4_write_reg_a; 
output          p4_write_outport, p4_write_reg_y, p4_write_memory;
output		addr_a_only;
output		ram_clk;
output		ram_web;
output  [4:0]   ram_addr;       

output  [3:0]                   p2_shift;       
output  [3:0]                   p3_shift;       
output  [3:0]                   p4_shift;      
output                          p2_plus;       
output                          p3_plus;       
output                          p4_plus;       





reg             p2_t_left, p2_ram_left;
reg             p2_a_right;
reg             p2_write_reg_a;
reg             p3_t_left;
reg             p3_a_right;
reg             p3_write_reg_a; 
reg             p4_ram_left, p4_t_left, p4_y_left, p4_inport_left;
reg             p4_a_right, p4_y_right; 
reg             p4_write_reg_t, p4_write_reg_a; 
reg             p4_write_outport, p4_write_reg_y, p4_write_memory;
reg             addr_a_only;


wire    [4:0]     ram_addr_advance;       
wire    [4:0]     ram_addr;       
wire    [4:0]     logical_addr_a;       
wire    [4:0]     logical_addr_b;       
reg     [4:0]     base_addr;      
reg     [4:0]     physical_addr_a;      
reg     [4:0]     physical_addr_b;      

wire             ram_clk;
wire             ram_cs;
wire             ram_oe;
wire             ram_web_advance;
wire             ram_web;

reg     [3:0]                   p2_shift;       
reg     [3:0]                   p3_shift;       
reg     [3:0]                   p4_shift;       
reg                             p2_plus;        
reg                             p3_plus;        
reg                             p4_plus;        

// ASSIGN STATEMENTS



always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
      begin
      p2_t_left        <=  1'b0;
      p2_ram_left      <=  1'b0;
      p2_a_right       <=  1'b0;
      p2_write_reg_a   <=  1'b0;

      p3_t_left        <=  1'b0;
      p3_a_right       <=  1'b0;
      p3_write_reg_a   <=  1'b0;

      p4_t_left        <=  1'b0;
      p4_y_left        <=  1'b0;
      p4_ram_left      <=  1'b0;
      p4_inport_left   <=  1'b0;
      p4_a_right       <=  1'b0;
      p4_y_right       <=  1'b0;
      p4_write_reg_a   <=  1'b0;
      p4_write_reg_t   <=  1'b0;
      p4_write_reg_y   <=  1'b0;
      p4_write_memory  <=  1'b0;
      p4_write_outport <=  1'b0;

      addr_a_only      <=  1'b1;
      end
  else
    if (p4)
        case (rom_data[25:22])
          4'h0 : begin  // NOP, NULL, NULL, NULL
               // All controls are 0
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
	  4'h1 : begin // add  memory(addr_1) & memory(addr_2)
                       // and then save result to Reg_A & Reg_T
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b1;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b1;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b1;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b1;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b1;
               p4_write_reg_t   <=  1'b1;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b0;
               end 
	  4'h2 : begin // A=T+A>>2, A=T-A>>3, A=T-A>>2,
                       // same instruction 3 three times
               p2_t_left        <=  1'b1;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b1;
               p2_write_reg_a   <=  1'b1;

               p3_t_left        <=  1'b1;
               p3_a_right       <=  1'b1;
               p3_write_reg_a   <=  1'b1;

               p4_t_left        <=  1'b1;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b1;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b1;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
	  4'h3 : begin 
               // A=T+A>>2, A=T-A>>3, Y=Y-A>>14, Final to Y
               p2_t_left        <=  1'b1;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b1;
               p2_write_reg_a   <=  1'b1;

               p3_t_left        <=  1'b1;
               p3_a_right       <=  1'b1;
               p3_write_reg_a   <=  1'b1;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b1;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b1;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b1;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;

               end 
	  4'h4 : begin // NULL, A=T+A>>2,  Y=Y-A>>14, Final to Y
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b1;
               p3_a_right       <=  1'b1;
               p3_write_reg_a   <=  1'b1;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b1;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b1;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b1;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;

               end
	  4'h5 : begin // NULL, NULL, Y=Y-A>>14, Final to Y
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b1;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b1;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b1;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end
	  4'h6 : begin // NULL, NULL, Clear Y
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b1;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
	  4'h7 : begin // NULL, NULL, Save Y reg to Memory
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b1;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b1;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
	  4'h8 : begin // NULL, NULL, Import Memory
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b1;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b1;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
	  4'h9 : begin // NULL, NULL, Export Memopry
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b1;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b1;

               addr_a_only      <=  1'b1;
               end 
	  4'ha : begin // Load Memory to Reg Y
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b1;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b1;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
	  4'hb : begin // A=T+A>>2,  A=0+A>>3, Y=Y-A>>14, Final to Y
               p2_t_left        <=  1'b1;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b1;
               p2_write_reg_a   <=  1'b1;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b1;
               p3_write_reg_a   <=  1'b1;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b1;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b1;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b1;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end
	  4'hc : begin // Load memory(addr_1) & memory(addr_2)
                       // and then save to Reg_A & Reg_T
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b1;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b1;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b1;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b1;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b0;
               end 
	  4'hd : begin // NULL, NULL, Save A reg to Memory
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b1;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b1;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
          4'hf : begin  // Decrement Base Counter
               // All controls are 0
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
          default: begin
               // All other controls are 0
               p2_t_left        <=  1'b0;
               p2_ram_left      <=  1'b0;
               p2_a_right       <=  1'b0;
               p2_write_reg_a   <=  1'b0;

               p3_t_left        <=  1'b0;
               p3_a_right       <=  1'b0;
               p3_write_reg_a   <=  1'b0;

               p4_t_left        <=  1'b0;
               p4_y_left        <=  1'b0;
               p4_ram_left      <=  1'b0;
               p4_inport_left   <=  1'b0;
               p4_a_right       <=  1'b0;
               p4_y_right       <=  1'b0;
               p4_write_reg_a   <=  1'b0;
               p4_write_reg_t   <=  1'b0;
               p4_write_reg_y   <=  1'b0;
               p4_write_memory  <=  1'b0;
               p4_write_outport <=  1'b0;

               addr_a_only      <=  1'b1;
               end 
        endcase
end



always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       base_addr <=  5'h0;
  else
       if (p4)
           if (rom_data[25:22]==4'hf)
               base_addr <=  base_addr - 1;
end

assign  logical_addr_a = rom_data[19:15];
assign  logical_addr_b = rom_data[12:8];

// **** Physical address a & Physical address b
always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       physical_addr_a <=  5'h0;
  else
       if (p4)
           physical_addr_a <=  base_addr + logical_addr_a;
end

always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       physical_addr_b <=  5'h0;
  else
       if (p4)
           physical_addr_b <=  base_addr + logical_addr_b;
end

assign  ram_addr_advance = addr_a_only ? 
                                physical_addr_a :
                                (addr_a_cycle ? physical_addr_a : physical_addr_b);

DELC uram_addr_0 (.O (ram_addr[0]), .I (ram_addr_advance[0] ));
DELC uram_addr_1 (.O (ram_addr[1]), .I (ram_addr_advance[1] ));
DELC uram_addr_2 (.O (ram_addr[2]), .I (ram_addr_advance[2] ));
DELC uram_addr_3 (.O (ram_addr[3]), .I (ram_addr_advance[3] ));
DELC uram_addr_4 (.O (ram_addr[4]), .I (ram_addr_advance[4] ));


wire    p1_rd_clk, p3_rd_clk, p4_wr_clk;
wire    p4_del1,p4_del2;
DELD    up4_del1 (.O (p4_del1), .I (p4));
DELD    up4_del2 (.O (p4_del2), .I (p4_del1));


assign  p1_rd_clk = (p1 && !sys_clk);
assign  p3_rd_clk = (p3 && !sys_clk);
assign  p4_wr_clk = (p4 && !p4_del2);


wire    ram_clk_advance;

assign  ram_clk_advance =   !(p2_ram_left && p1_rd_clk) &&
                            !(p4_ram_left && p3_rd_clk) &&
                            !(p4_write_memory && p4_wr_clk) ;

wire    ram_clk_advance_d1;
DELB uram_clk (.O (ram_clk_advance_d1), .I (ram_clk_advance));

assign ram_clk = ram_clk_advance_d1 || ram_clk_advance;


assign  ram_web_advance = ~(p4_write_memory && p4);

DELD uram_web (.O(ram_web), .I(ram_web_advance));

always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       p2_shift <=  4'h0;
  else
    if (p4)
        case (rom_data[25:22])
          4'h1   : p2_shift <=  4'h0;
          4'hc   : p2_shift <=  4'h0;
          default: p2_shift <=  rom_data[11:8];
        endcase
end

always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       p3_shift <=  4'h0;
  else
    if (p4)
        p3_shift <=  rom_data[7:4];
end

always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       p4_shift <=  4'h0;
  else
    if (p4)
        p4_shift <=  rom_data[3:0];
end

// **** + - operation, 0:+, 1:-
always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       p2_plus  <=  1'b0;
  else
    if (p4)
        case (rom_data[25:22])
          4'h1   : p2_plus <=  1'b0;
          4'hc   : p2_plus <=  1'b0;
          default: p2_plus <=  rom_data[14];
        endcase
end

always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       p3_plus  <=  1'b0;
  else
    if (p4)
        case (rom_data[25:22])
          4'h1   : p3_plus <=  1'b0;
          4'hc   : p3_plus <=  1'b0;
          default: p3_plus <=  rom_data[13];
        endcase
end

always @(negedge resetb or posedge sys_clk)
begin
  if (~resetb)
       p4_plus  <=  1'b0;
  else
    if (p4)
        case (rom_data[25:22])
          4'h1   : p4_plus <=  1'b0;
          4'hc   : p4_plus <=  1'b0;
          default: p4_plus <=  rom_data[12];
        endcase
end

endmodule    // decode 
