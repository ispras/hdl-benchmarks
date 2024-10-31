/////////////////////////////////////////////////////////////////
// Altera Corporation
// ROM helper circuit.
//   inferred ROM with MIF.
/////////////////////////////////////////////////////////////////
module nut_001_rom_tattoo (clock,read_addr,q);

parameter ADDR_WIDTH = 8;
parameter DATA_WIDTH = 16;
input clock;
input [ADDR_WIDTH-1:0] read_addr;
output [DATA_WIDTH-1:0] q;
reg [DATA_WIDTH-1:0] q;

// storage space
reg [DATA_WIDTH-1:0] 	 block [2**ADDR_WIDTH-1:0] /* synthesis ram_init_file = nut_001_rom_tattoo.mif */;

// Modelsim memory content initialization
// synthesis translate_off
integer mif,r,line,addr,dat,content;
reg [1024*8:1] str;
initial begin
  mif=$fopen("nut_001_tattoo.mif","r");
  if (mif == 0) begin
    $display("unable to read MIF file");
    $fflush();
    $stop;
  end
  line = 0;
  content = 0;
  r = 1;
  while (r > 0) begin
    r = $fgets(str,mif);
    if (str == "END;\n") content = 0;
    if (content) begin
       $sscanf (str,"%x : %x",addr,dat);
       block[addr] = dat;
    end
    if (str == "CONTENT BEGIN\n") content = 1;
    line=line+1;
  end
  $fclose (mif);
end
// synthesis translate_on
// Modelsim initial value read
initial begin
  q <= 0;

end

// Registered read
always @(posedge clock) begin
  q <= block[read_addr];
end
endmodule

