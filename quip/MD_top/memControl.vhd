library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memControl is
	generic(intlength : integer := 60;
                log_num_particles : integer := 14);
	port(
	
	clk: in std_logic;
	-- in the final version ve should have one data signal
	-- as inout
	tm3_sram_data : inout std_logic_vector(intlength-1 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;

	md_pos_in_x: in std_logic_vector(intlength-1 downto 0);
	md_pos_in_y: in std_logic_vector(intlength-1 downto 0);
	md_pos_in_z: in std_logic_vector(intlength-1 downto 0);

	md_veloc_in_x: in std_logic_vector(intlength-1 downto 0);
	md_veloc_in_y: in std_logic_vector(intlength-1 downto 0);
	md_veloc_in_z: in std_logic_vector(intlength-1 downto 0);
	-- acceleration inputs
	md_accel_in_x: in std_logic_vector(intlength-1 downto 0);
	md_accel_in_y: in std_logic_vector(intlength-1 downto 0);
	md_accel_in_z: in std_logic_vector(intlength-1 downto 0);
	-- data outputs (can be position, velocity or accel
	-- it depends on which w/r-complete signal is high
	md_data_out_x: out std_logic_vector(intlength-1 downto 0);
	md_data_out_y: out std_logic_vector(intlength-1 downto 0);
	md_data_out_z: out std_logic_vector(intlength-1 downto 0);
	-- particle id seperate for r, v, a
	md_particle_id_pos_pg: in std_logic_vector(log_num_particles-1 downto 0);
	md_particle_id_pos_vu: in std_logic_vector(log_num_particles-1 downto 0);
	md_particle_id_veloc: in std_logic_vector(log_num_particles-1 downto 0);
	md_particle_id_accel: in std_logic_vector(log_num_particles-1 downto 0);
        -- write/read enables are the same as 'valid' signal
	md_we_pos: in std_logic;
	md_re_pos_pg: in std_logic;
	md_re_pos_vu: in std_logic;
	-- write/read complete are the same as 'accept' signal
	md_write_complete_pos: out std_logic;
	md_read_complete_pos_pg: out std_logic;
	md_read_complete_pos_vu: out std_logic;
	-- the same set but for velocity
	md_we_veloc: in std_logic;
	md_re_veloc: in std_logic;
	md_write_complete_veloc: out std_logic;
	md_read_complete_veloc: out std_logic;
	-- the same as above but for acceleration
	md_we_accel: in std_logic;
	md_re_accel: in std_logic;
	md_write_complete_accel: out std_logic;
	md_read_complete_accel: out std_logic;
	--bank selection
	md_position_bank_sel_vu : in std_logic;
	md_switch_bank : in std_logic;
	-- reset signal
	md_async_reset_bar : in std_logic);
end memControl;

architecture arch_memControl of memControl is

COMPONENT mc_data_reg

  generic (
    width : integer := 16);

  port (
    D        : in  std_logic_vector(width-1 downto 0);
    Q        : out std_logic_vector(width-1 downto 0);
    clk      : in  std_logic;
    enable   : in  std_logic;           -- enable signal
    areset_b : in  std_logic);

end COMPONENT;

type memControl_states is( wait_state, wait_idle_state, state_write_pos_x_2,
				state_write_pos_y_1,state_write_pos_y_2,
				state_write_pos_z_1,state_write_pos_z_2,
					
				state_read_pos_pg_1_2,state_read_pos_pg_1_2_idle,
				state_read_pos_pg_2_1, state_read_pos_pg_2_2,
				state_read_pos_pg_2_2_dummy,
				state_read_pos_pg_3_1, state_read_pos_pg_3_2,
	
				state_read_pos_vu_1_2, state_read_pos_vu_1_2_idle,
				state_read_pos_vu_2_1, state_read_pos_vu_2_2,
				state_read_pos_vu_2_2_dummy,
				state_read_pos_vu_3_1,state_read_pos_vu_3_2,	
	
				state_write_veloc_x_2,state_write_veloc_y_1,
				state_write_veloc_y_2,state_write_veloc_z_1,
				state_write_veloc_z_2,
				
				
				state_read_veloc_1_2, state_read_veloc_1_2_idle,
				state_read_veloc_2_1, state_read_veloc_2_2,
				state_read_veloc_2_2_dummy,
				state_read_veloc_3_1, state_read_veloc_3_2,
				
				state_write_accel_x_2,
				state_write_accel_y_1,state_write_accel_y_2,				
				state_write_accel_z_1,state_write_accel_z_2,
				
				state_read_accel_1_2, state_read_accel_1_2_idle,
				state_read_accel_2_1, state_read_accel_2_2,
				state_read_accel_2_2_dummy,
				state_read_accel_3_1, state_read_accel_3_2);


--signal leading_zero: std_logic;
signal leading_zero: std_logic_vector(18 downto log_num_particles+4);
signal data_in_y_buf,data_in_z_buf: std_logic_vector(intlength-1 downto 0);
--signal curren_state, next_state : memControl_states;
signal curren_state, next_state : memControl_states;
signal req_sum : std_logic_vector(6 downto 0);
signal md_write_pos_flag :std_logic;
signal md_read_pos_pg_flag :std_logic;
signal md_read_pos_vu_flag :std_logic;
signal md_write_veloc_flag :std_logic;
signal md_read_veloc_flag :std_logic;
signal md_write_accel_flag :std_logic;
signal md_read_accel_flag :std_logic;
--signal md_switch_bank_buff :std_logic;

signal tm3_sram_addr_select : std_logic_vector(5 downto 0);
signal tm3_sram_data_select : std_logic_vector(3 downto 0);
signal data_in_y_buf_select : std_logic_vector( 2 downto 0);
signal data_in_z_buf_select : std_logic_vector( 2 downto 0);


signal data_in_y_buf_enable : std_logic;
signal data_in_z_buf_enable : std_logic;
signal tm3_sram_data_enable : std_logic;
signal tm3_sram_addr_enable : std_logic;
signal data_out_x_enable : std_logic;
signal data_out_y_enable : std_logic;
signal data_out_z_enable : std_logic;


signal data_in_y_buf_sel_out : std_logic_vector(intlength-1 downto 0);
signal data_in_z_buf_sel_out : std_logic_vector(intlength-1 downto 0);
signal tm3_sram_data_sel_out: std_logic_vector(intlength-1 downto 0);
signal tm3_sram_data_reg : std_logic_vector(intlength-1 downto 0);
signal tm3_sram_addr_sel_out: std_logic_vector(18 downto 0);

begin
--leading_zero <= '0';
  leading_zero <= (others => '0');

req_sum <=	md_write_pos_flag & md_read_pos_pg_flag &
			md_read_pos_vu_flag & md_write_veloc_flag &
			md_read_veloc_flag & md_write_accel_flag &
			md_read_accel_flag;


--Registers
data_in_y_buf_r0: mc_data_reg generic map (intlength) port map (data_in_y_buf_sel_out, data_in_y_buf,clk,data_in_y_buf_enable,md_async_reset_bar);
data_in_z_buf_r0: mc_data_reg generic map (intlength) port map (data_in_z_buf_sel_out, data_in_z_buf,clk,data_in_z_buf_enable,md_async_reset_bar);
tm3_sram_data_r0: mc_data_reg generic map(intlength) port map(tm3_sram_data_sel_out, tm3_sram_data_reg,clk,tm3_sram_data_enable,md_async_reset_bar);
tm3_sram_addr_r0: mc_data_reg generic map(19) port map(tm3_sram_addr_sel_out, tm3_sram_addr,clk,tm3_sram_addr_enable,md_async_reset_bar);
data_out_x_r0: mc_data_reg generic map(intlength) port map(tm3_sram_data,md_data_out_x,clk,data_out_x_enable,md_async_reset_bar);
data_out_y_r0: mc_data_reg generic map(intlength) port map(tm3_sram_data,md_data_out_y,clk,data_out_y_enable,md_async_reset_bar);
data_out_z_r0: mc_data_reg generic map(intlength) port map(tm3_sram_data,md_data_out_z,clk,data_out_z_enable,md_async_reset_bar);

--Multiplexor for data_in_y_buf
WITH data_in_y_buf_select SELECT
		data_in_y_buf_sel_out <= md_pos_in_y when "000",
													md_veloc_in_y when "001",
													md_accel_in_y when "011",
													(OTHERS => '0') when others;
--Multiplexor for data_in_z_buf
WITH data_in_z_buf_select SELECT
		data_in_z_buf_sel_out <= md_pos_in_z when "000",
													md_veloc_in_z when "001",
													md_accel_in_z when "011",
													(OTHERS => '0') when others;

--Multiplexor for tm3_sram_data
WITH tm3_sram_data_select SELECT
		tm3_sram_data_sel_out <= md_pos_in_x when "0000",
													md_veloc_in_x when "0001",
--													(others => 'Z') when "0010",
													md_accel_in_x when "0011",
													data_in_y_buf when "1000",
													data_in_z_buf when "1001",
													(OTHERS => '1') when others;
WITH tm3_sram_data_select SELECT
		tm3_sram_data <= (others => 'Z') when "0010",
		                  tm3_sram_data_reg when others;


--Multiplexor for tm3_sram_addr
WITH tm3_sram_addr_select SELECT
		tm3_sram_addr_sel_out <= (leading_zero & '0' & (md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "11") when "000000",
													(leading_zero & "10" & md_particle_id_veloc & "11") when "000001",
													(leading_zero & "10" & md_particle_id_veloc & "11") when "000010",
													(leading_zero & "11" & md_particle_id_accel & "11") when "000011",
													(leading_zero & "11" & md_particle_id_accel & "11") when "000100",
													(leading_zero & '0' & (md_position_bank_sel_vu xor md_switch_bank) &	md_particle_id_pos_pg & "11") when "000101",
													(leading_zero & '0' & (md_position_bank_sel_vu xor md_switch_bank) &	md_particle_id_pos_vu & "11") when "000110",
													(others => '0') when "000111",
													(leading_zero & '0' & 	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "01") when "001000",
													(leading_zero & '0' &	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "10") when "001001",
													(leading_zero & '0' &	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_pg & "11") when "001010",
													(leading_zero & '0' &	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_pg & "01") when "001011",
													(leading_zero & '0' &  (md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_pg & "01") when "001100",
													(leading_zero & '0' & 	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_pg & "10") when "001101",
													(leading_zero & '0' &	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_pg & "10") when "001110",
													(leading_zero & '0' &  (md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_pg & "10") when "001111",
													(leading_zero & '0' &  (md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_pg & "10") when "010000",
													(leading_zero & '0' &	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "11") when "010001",
													(leading_zero & '0' &	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "01") when "010010",
													(leading_zero & '0' &  (md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "01") when "010011",
													(leading_zero & '0' &  (md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "10") when "010100",
													(leading_zero & '0' &	(md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "10") when "010101",
													(leading_zero & '0' &  (md_position_bank_sel_vu xor md_switch_bank) & md_particle_id_pos_vu & "10") when "010110",
													(leading_zero & "10" & md_particle_id_veloc & "11") when "010111",
													(leading_zero & "10" & md_particle_id_veloc & "01") when "011000",
													(leading_zero & "10" & md_particle_id_veloc & "10") when "011001",
													(leading_zero & "10" & md_particle_id_veloc & "11") when "011010",
													(leading_zero & "10" & md_particle_id_veloc & "01") when "011011",
													(leading_zero & "10" & md_particle_id_veloc & "01") when "011100",
													(leading_zero & "10" & md_particle_id_veloc & "10") when "011101",
													(leading_zero & "10" & md_particle_id_veloc & "10") when "011110",
													(leading_zero & "10" & md_particle_id_veloc & "10") when "011111",
													(leading_zero & "10" & md_particle_id_veloc & "10") when "100000",
													(leading_zero & "11" & md_particle_id_accel & "11") when "100001",
													(leading_zero & "11" & md_particle_id_accel & "01") when "100010",
													(leading_zero & "11" & md_particle_id_accel & "10") when "100011",
													(leading_zero & "11" & md_particle_id_accel & "11") when "100100",
													(leading_zero & "11" & md_particle_id_accel & "01") when "100101",
													(leading_zero & "11" & md_particle_id_accel & "10") when "100110",
													(leading_zero & "11" & md_particle_id_accel & "10") when "100111",
													(leading_zero & "11" & md_particle_id_accel & "10") when "101000",



													(OTHERS => '1') when others;








	process(next_state, md_we_pos,md_re_pos_pg,md_re_pos_vu,md_we_veloc,md_re_veloc,md_we_accel,md_re_accel,req_sum,md_write_pos_flag,md_read_pos_pg_flag,md_read_pos_vu_flag,md_write_veloc_flag,md_read_veloc_flag,md_write_accel_flag,md_read_accel_flag) begin
			case (next_state) is
			
			
				when wait_idle_state =>   -- write_idle_state
					tm3_sram_oe <= "11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";
					data_in_z_buf_select <= "000";
					tm3_sram_data_select <= "0010";
					tm3_sram_addr_select <= "000111";
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '0';
					tm3_sram_addr_enable <= '0';
					data_out_x_enable <= '0';					
					data_out_y_enable <= '0';					
					data_out_z_enable <= '0';

				when wait_state =>      -- wait state
					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';
					if ((md_we_pos = '1') and (req_sum = "1000000" or md_write_pos_flag = '0')) then
						
						tm3_sram_adsp <= '0';
						
						tm3_sram_oe <= "11";
						tm3_sram_we <= "11111111";  	--Modified by ICK from all zeros to solve writing to zero problem 

						--multiplexing and enable for registers
						data_in_y_buf_select <= "000";
						data_in_z_buf_select <= "000";
						tm3_sram_data_select <= "0000";
						tm3_sram_addr_select <= "000000";
						data_in_y_buf_enable <= '1';
						data_in_z_buf_enable <= '1';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';

					elsif (md_we_veloc = '1' and (req_sum = "0001000" or md_write_veloc_flag='0')) then

						tm3_sram_adsp <= '0';
						tm3_sram_oe <= "11";
						tm3_sram_we <= "11111111";	--Modified by ICK from all zeros to solve writing to zero problem

						--multiplexing and enable for registers
						data_in_y_buf_select <= "001";
						data_in_z_buf_select <= "001";
						tm3_sram_data_select <= "0001";
						tm3_sram_addr_select <= "000001";
						data_in_y_buf_enable <= '1';
						data_in_z_buf_enable <= '1';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';						
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


					elsif (md_re_veloc = '1' and (req_sum = "0000100" or md_read_veloc_flag='0')) then
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "10";
						tm3_sram_adsp <= '0';

						--multiplexing and enable for registers
						data_in_y_buf_select <= "000";  --don't care
						data_in_z_buf_select <= "000";  --don't care
						tm3_sram_data_select <= "0010";
						tm3_sram_addr_select <= "000010";
						data_in_y_buf_enable <= '0';
						data_in_z_buf_enable <= '0';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';								
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
						
						

					elsif (md_we_accel = '1' and (req_sum = "0000010" or md_write_accel_flag='0')) then

						tm3_sram_adsp <= '0';
						tm3_sram_oe <= "11";

						tm3_sram_we <= "11111111";	--Modified by ICK for writing to zero problem

						--multiplexing and enable for registers
						data_in_y_buf_select <= "011";
						data_in_z_buf_select <= "011";
						tm3_sram_data_select <= "0011";
						tm3_sram_addr_select <= "000011";
						data_in_y_buf_enable <= '1';
						data_in_z_buf_enable <= '1';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';									
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';

					elsif (md_re_accel = '1' and (req_sum = "0000001" or md_read_accel_flag='0')) then
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "10";
						tm3_sram_adsp <= '0';

						--multiplexing and enable for registers
						data_in_y_buf_select <= "000";  --don't care
						data_in_z_buf_select <= "000";  --don't care
						tm3_sram_data_select <= "0010"; -- Z's
						tm3_sram_addr_select <= "000100"; 
						data_in_y_buf_enable <= '0';
						data_in_z_buf_enable <= '0';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';									
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';

					elsif (md_re_pos_pg = '1' and (req_sum = "0100000" or md_read_pos_pg_flag='0')) then
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "10";
						tm3_sram_adsp <= '0';

						--multiplexing and enable for registers
						data_in_y_buf_select <= "000";  --don't care
						data_in_z_buf_select <= "000";  --don't care
						tm3_sram_data_select <= "0010"; -- Z's
						tm3_sram_addr_select <= "000101"; 
						data_in_y_buf_enable <= '0';
						data_in_z_buf_enable <= '0';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';									
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';




					elsif (md_re_pos_vu = '1' and (req_sum = "0010000" or md_read_pos_vu_flag='0')) then
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "10";
						tm3_sram_adsp <= '0';

						--multiplexing and enable for registers
						data_in_y_buf_select <= "000";  --don't care
						data_in_z_buf_select <= "000";    --don't care
						tm3_sram_data_select <= "0010"; -- Z's
						tm3_sram_addr_select <= "000110"; 
						data_in_y_buf_enable <= '0';
						data_in_z_buf_enable <= '0';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';									
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';

					else

						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_adsp <= '0';

						--multiplexing and enable for registers
						data_in_y_buf_select <= "000";  --don't care
						data_in_z_buf_select <= "000";    --don't care
						tm3_sram_data_select <= "0010"; -- Z's
						tm3_sram_addr_select <= "000111"; 
						data_in_y_buf_enable <= '0';
						data_in_z_buf_enable <= '0';
						tm3_sram_data_enable <= '1';
						tm3_sram_addr_enable <= '1';								
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';

					end if;
					
------------------------------------------------------------------------------------------------------
--------------------------------   write_pose_vu     -------------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when state_write_pos_x_2 =>   -- write_pose_vu_x_2

					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
  					tm3_sram_adsp <= '0';
					
					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0000"; -- md_pos_in_x
					tm3_sram_addr_select <= "000000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';								
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					


				when state_write_pos_y_1 =>   -- write_pose_vu_y_1
					
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1000"; 
					tm3_sram_addr_select <= "001000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';								
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';



				when state_write_pos_y_2 =>   -- write_pose_vu_y_2
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1000"; 
					tm3_sram_addr_select <= "001000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';		
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


				when state_write_pos_z_1 =>      -- write_pose_vu_z_1
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1001"; 
					tm3_sram_addr_select <= "001001"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


				when state_write_pos_z_2 =>      -- write_pose_vu_z_2

					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '1';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1001"; 
					tm3_sram_addr_select <= "001001"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					


------------------------------------------------------------------------------------------------------
--------------------------------   read_pose_pg   -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when state_read_pos_pg_1_2_idle =>		-- read pos_pg_1_2 extra idle state

					tm3_sram_oe <= "10";  --  changed in may 1st -- "11"
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "001010"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';





				when state_read_pos_pg_1_2 =>		-- read pos_pg_1_2
					tm3_sram_oe <= "10";  --  changed in may 1st -- "11"
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "001011"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '1';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';




				when state_read_pos_pg_2_1 =>		-- read pos_pg_2_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "001100"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';			
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';




				when state_read_pos_pg_2_2 =>		-- read pos_pg_2_2
					tm3_sram_oe <= "10"; --  changed in may 1st --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "001101"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '1';					
						data_out_z_enable <= '0';



				when state_read_pos_pg_2_2_dummy =>		-- read pos_pg_2_2_dummy
					tm3_sram_oe <= "10"; --  changed in may 1st --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';


					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "001110"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					


				when state_read_pos_pg_3_1 =>		-- read pos_pg_3_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "001111"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '1';
					

				when state_read_pos_pg_3_2 =>		-- read pos_pg_3_2
		

					tm3_sram_oe <= "10"; --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '1';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "010000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					


------------------------------------------------------------------------------------------------------
--------------------------------   read_pose_vu   -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when state_read_pos_vu_1_2_idle =>	-- read pos vu 1_2 extra idle state
						
 					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "010001"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';



				when state_read_pos_vu_1_2 =>		-- read pos vu 1_2
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "010010"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '1';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					
				when state_read_pos_vu_2_1 =>		-- read pos vu 2_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "010011"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					




				when state_read_pos_vu_2_2 =>		-- read pos vu 2_2
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "010100"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '1';					
						data_out_z_enable <= '0';
					


				when state_read_pos_vu_2_2_dummy =>		-- read pos vu 2_2_dummy
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "010101"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';



				when state_read_pos_vu_3_1 =>		-- read pos vu 3_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "010110"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '1';



				when state_read_pos_vu_3_2 =>		-- read pos vu 3_2
					tm3_sram_oe <= "10"; --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '1';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "000111"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					

------------------------------------------------------------------------------------------------------
--------------------------------   write_veloc       -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when state_write_veloc_x_2 => 		-- write veloc x_2
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0001";  
					tm3_sram_addr_select <= "010111"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';									
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


				when state_write_veloc_y_1 => 		-- write veloc y_1
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1000";  
					tm3_sram_addr_select <= "011000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';



				when state_write_veloc_y_2 => 		-- write veloc y_2
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';
					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1000";  
					tm3_sram_addr_select <= "011000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';



				when state_write_veloc_z_1 =>		--  write veloc z_1
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1001";  
					tm3_sram_addr_select <= "011001"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					



				when state_write_veloc_z_2 =>		--  write veloc z_2
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '1';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1001";  
					tm3_sram_addr_select <= "011001"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					

------------------------------------------------------------------------------------------------------
--------------------------------   read_veloc        -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when state_read_veloc_1_2_idle =>		--  read veloc 1_2 extra idle state
					tm3_sram_oe <= "10"; --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "011010"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


				when state_read_veloc_1_2 =>		--  read veloc 1_2
					tm3_sram_oe <= "10"; --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "011011"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '1';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';




				when state_read_veloc_2_1 =>		--  read veloc 2_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "011100"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';





				when state_read_veloc_2_2 =>		--  read veloc 2_2
					
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "011101"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '1';					
						data_out_z_enable <= '0';
					

				
				when state_read_veloc_2_2_dummy =>		--  read veloc 2_2_dummy
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "011110"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					


				when state_read_veloc_3_1 =>		--  read veloc 3_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "011111"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '1';


				when state_read_veloc_3_2 =>		--  read veloc 3_2

					
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '1';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0010";  --Z's
					tm3_sram_addr_select <= "100000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


------------------------------------------------------------------------------------------------------
--------------------------------   write_accel       -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when state_write_accel_x_2 =>		--  write accel x_2
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';
					
					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";  
					tm3_sram_addr_select <= "100001"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


				when state_write_accel_y_1 =>		--  write accel y_1
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1000";  
					tm3_sram_addr_select <= "100010"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					

				when state_write_accel_y_2 =>		--  write accel y_2
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1000";  
					tm3_sram_addr_select <= "100010"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


				when state_write_accel_z_1 =>		--  write accel z_1
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1001";  
					tm3_sram_addr_select <= "100011"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					


				when state_write_accel_z_2 =>		--  write accel z_2
					tm3_sram_oe <= "11";
					tm3_sram_we <= "00000000";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '1';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "1001";  
					tm3_sram_addr_select <= "100011"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					


------------------------------------------------------------------------------------------------------
--------------------------------   read_accel        -------------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when state_read_accel_1_2_idle =>		--  read accel 1_2 extra idle state
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "100100"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';




				when state_read_accel_1_2 =>		--  read accel 1_2
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "100101"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '1';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					



				when state_read_accel_2_1 =>		--  read accel 2_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "100101"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';
					




				when state_read_accel_2_2 =>		--  read accel 2_2
					tm3_sram_oe <= "10";  --  changed in may 1st  --"11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "100110"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';								
						data_out_x_enable <= '0';					
						data_out_y_enable <= '1';					
						data_out_z_enable <= '0';


				when state_read_accel_2_2_dummy =>		--  read accel 2_2_dummy
					tm3_sram_oe <= "10"; 
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "100111"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';								
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';




				when state_read_accel_3_1 =>		--  read accel 3_1
					tm3_sram_oe <= "10";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';

					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "101000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '1';


				when state_read_accel_3_2 =>		--  read accel 3_2
					tm3_sram_oe <= "10"; 
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';


					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '1';


					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "101000"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';							
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';


------------------------------------------------------------------------------------------------------
--------------------------------                     -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when others =>

					tm3_sram_oe <= "11";
					tm3_sram_we <= "11111111";
					tm3_sram_adsp <= '0';


					md_write_complete_pos <= '0';
					md_read_complete_pos_pg <= '0';
					md_read_complete_pos_vu <= '0';
					md_write_complete_veloc <= '0';
					md_read_complete_veloc <= '0';
					md_write_complete_accel <= '0';
					md_read_complete_accel <= '0';

					--multiplexing and enable for registers
					data_in_y_buf_select <= "000";  --don't care
					data_in_z_buf_select <= "000";    --don't care
					tm3_sram_data_select <= "0011";   --Z's
					tm3_sram_addr_select <= "000111"; 
					data_in_y_buf_enable <= '0';
					data_in_z_buf_enable <= '0';
					tm3_sram_data_enable <= '1';
					tm3_sram_addr_enable <= '1';								
						data_out_x_enable <= '0';					
						data_out_y_enable <= '0';					
						data_out_z_enable <= '0';

			end case;
		end process;










































process(md_async_reset_bar,clk) begin
		if md_async_reset_bar = '0' then
			next_state <= wait_state;
			
				md_write_pos_flag <= '0';
				md_read_pos_pg_flag <= '0';
				md_read_pos_vu_flag <= '0';
				md_write_veloc_flag <= '0';
				md_read_veloc_flag <= '0';
				md_write_accel_flag <= '0';
				md_read_accel_flag <= '0';
			


		elsif (clk'event and clk = '1') then
			case (next_state) is
			
			
				when wait_idle_state =>      -- wait state

					next_state <= wait_state;
					
					md_write_pos_flag <= md_write_pos_flag;
					md_read_pos_pg_flag <= md_read_pos_pg_flag;
					md_read_pos_vu_flag <= md_read_pos_vu_flag;
					md_write_veloc_flag <= md_write_veloc_flag;
					md_read_veloc_flag <= md_read_veloc_flag;
					md_write_accel_flag <= md_write_accel_flag;
					md_read_accel_flag <= md_read_accel_flag;


				when wait_state =>      -- wait state

					if ((md_we_pos = '1') and (req_sum = "1000000" or md_write_pos_flag = '0')) then
						next_state <= state_write_pos_x_2;

						md_write_pos_flag <= '1';
						md_read_pos_pg_flag <= '0';
						md_read_pos_vu_flag <= '0';
						md_write_veloc_flag <= '0';
						md_read_veloc_flag <= '0';
						md_write_accel_flag <= '0';
						md_read_accel_flag <= '0';


					elsif (md_we_veloc = '1' and (req_sum = "0001000" or md_write_veloc_flag='0')) then
						md_write_pos_flag <= '0';
						md_read_pos_pg_flag <= '0';
						md_read_pos_vu_flag <= '0';
						md_write_veloc_flag <= '1';
						md_read_veloc_flag <= '0';
						md_write_accel_flag <= '0';
						md_read_accel_flag <= '0';

						next_state <= state_write_veloc_x_2;


					elsif (md_re_veloc = '1' and (req_sum = "0000100" or md_read_veloc_flag='0')) then
						md_write_pos_flag <= '0';
						md_read_pos_pg_flag <= '0';
						md_read_pos_vu_flag <= '0';
						md_write_veloc_flag <= '0';
						md_read_veloc_flag <= '1';
						md_write_accel_flag <= '0';
						md_read_accel_flag <= '0';

						next_state <= state_read_veloc_1_2_idle;

					elsif (md_we_accel = '1' and (req_sum = "0000010" or md_write_accel_flag='0')) then
						md_write_pos_flag <= '0';
						md_read_pos_pg_flag <= '0';
						md_read_pos_vu_flag <= '0';
						md_write_veloc_flag <= '0';
						md_read_veloc_flag <= '0';
						md_write_accel_flag <= '1';
						md_read_accel_flag <= '0';

						next_state <= state_write_accel_x_2;


					elsif (md_re_accel = '1' and (req_sum = "0000001" or md_read_accel_flag='0')) then
						md_write_pos_flag <= '0';
						md_read_pos_pg_flag <= '0';
						md_read_pos_vu_flag <= '0';
						md_write_veloc_flag <= '0';
						md_read_veloc_flag <= '0';
						md_write_accel_flag <= '0';
						md_read_accel_flag <= '1';

						next_state <= state_read_accel_1_2_idle;
					elsif (md_re_pos_pg = '1' and (req_sum = "0100000" or md_read_pos_pg_flag='0')) then
						md_write_pos_flag <= '0';
						md_read_pos_pg_flag <= '1';
						md_read_pos_vu_flag <= '0';
						md_write_veloc_flag <= '0';
						md_read_veloc_flag <= '0';
						md_write_accel_flag <= '0';
						md_read_accel_flag <= '0';

						next_state <= state_read_pos_pg_1_2_idle;

					elsif (md_re_pos_vu = '1' and (req_sum = "0010000" or md_read_pos_vu_flag='0')) then
						md_write_pos_flag <= '0';
						md_read_pos_pg_flag <= '0';
						md_read_pos_vu_flag <= '1';
						md_write_veloc_flag <= '0';
						md_read_veloc_flag <= '0';
						md_write_accel_flag <= '0';
						md_read_accel_flag <= '0';

						next_state <= state_read_pos_vu_1_2_idle;


					else
						md_write_pos_flag <= '0';
						md_read_pos_pg_flag <= '0';
						md_read_pos_vu_flag <= '0';
						md_write_veloc_flag <= '0';
						md_read_veloc_flag <= '0';
						md_write_accel_flag <= '0';
						md_read_accel_flag <= '0';

						next_state <= wait_state;

					end if;
------------------------------------------------------------------------------------------------------
--------------------------------   write_pos_vu      -------------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when state_write_pos_x_2 =>   -- write_pose_vu_x_2

					md_write_pos_flag <= '1';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_write_pos_y_1;
					

				when state_write_pos_y_1 =>   -- write_pose_vu_y_1

					md_write_pos_flag <= '1';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_write_pos_y_2;
					
				when state_write_pos_y_2 =>   -- write_pose_vu_y_2

					md_write_pos_flag <= '1';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_write_pos_z_1;
					
				when state_write_pos_z_1 =>      -- write_pose_vu_z_1

					md_write_pos_flag <= '1';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_write_pos_z_2;
					
				when state_write_pos_z_2 =>      -- write_pose_vu_z_2

					md_write_pos_flag <= '1';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= wait_idle_state;


------------------------------------------------------------------------------------------------------
--------------------------------   read_pos_pg        -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when state_read_pos_pg_1_2_idle =>		-- read pos_pg_1_2 extra idle state
					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '1';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_pos_pg_1_2;
					

				when state_read_pos_pg_1_2 =>		-- read pos_pg_1_2


					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '1';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_pos_pg_2_1;
					

				when state_read_pos_pg_2_1 =>		-- read pos_pg_2_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '1';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_pos_pg_2_2;
					

				when state_read_pos_pg_2_2 =>		-- read pos_pg_2_2
					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '1';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_pos_pg_2_2_dummy;
					

				when state_read_pos_pg_2_2_dummy =>	-- read pos_pg_2_2_dummy
					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '1';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_pos_pg_3_1;
					

				when state_read_pos_pg_3_1 =>		-- read pos_pg_3_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '1';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_pos_pg_3_2;
					

				when state_read_pos_pg_3_2 =>		-- read pos_pg_3_2
					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '1';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= wait_idle_state;
					
------------------------------------------------------------------------------------------------------
--------------------------------   read_pos_vu        -----------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when state_read_pos_vu_1_2_idle =>	-- read pos vu 1_2 extra idle state


					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '1';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_pos_vu_1_2;
					

				when state_read_pos_vu_1_2 =>		-- read pos vu 1_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '1';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_pos_vu_2_1;


				when state_read_pos_vu_2_1 =>		-- read pos vu 2_1


					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '1';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_pos_vu_2_2;

				when state_read_pos_vu_2_2 =>		-- read pos vu 2_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '1';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_pos_vu_2_2_dummy;

				when state_read_pos_vu_2_2_dummy =>		-- read pos vu 2_2_dummy

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '1';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_pos_vu_3_1;

				when state_read_pos_vu_3_1 =>		-- read pos vu 3_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '1';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_pos_vu_3_2;

				when state_read_pos_vu_3_2 =>		-- read pos vu 3_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '1';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= wait_idle_state;

------------------------------------------------------------------------------------------------------
--------------------------------   write_veloc       -------------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when state_write_veloc_x_2 => 		-- write veloc x_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '1';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_write_veloc_y_1;


				when state_write_veloc_y_1 => 		-- write veloc y_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '1';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_write_veloc_y_2;


				when state_write_veloc_y_2 => 		-- write veloc y_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '1';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_write_veloc_z_1;
					
					
				when state_write_veloc_z_1 =>		--  write veloc z_1


					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '1';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_write_veloc_z_2;
	
				when state_write_veloc_z_2 =>		--  write veloc z_2


					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '1';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= wait_idle_state;

------------------------------------------------------------------------------------------------------
--------------------------------   read_veloc        -------------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when state_read_veloc_1_2_idle =>	--  read veloc 1_2 extra idle state

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '1';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_veloc_1_2;


				when state_read_veloc_1_2 =>		--  read veloc 1_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '1';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_veloc_2_1;


				when state_read_veloc_2_1 =>		--  read veloc 2_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '1';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_veloc_2_2;


				when state_read_veloc_2_2 =>		--  read veloc 2_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '1';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_veloc_2_2_dummy;


				when state_read_veloc_2_2_dummy =>		--  read veloc 2_2_dummy

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '1';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= state_read_veloc_3_1;


				when state_read_veloc_3_1 =>		--  read veloc 3_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '1';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= state_read_veloc_3_2;



				when state_read_veloc_3_2 =>		--  read veloc 3_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '1';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';
					next_state <= wait_idle_state;

------------------------------------------------------------------------------------------------------
--------------------------------   write_accel        -------------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when state_write_accel_x_2 =>		--  write accel x_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '1';
					md_read_accel_flag <= '0';
					next_state <= state_write_accel_y_1;


				when state_write_accel_y_1 =>		--  write accel y_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '1';
					md_read_accel_flag <= '0';
					next_state <= state_write_accel_y_2;


				when state_write_accel_y_2 =>		--  write accel y_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '1';
					md_read_accel_flag <= '0';
					next_state <= state_write_accel_z_1;



				when state_write_accel_z_1 =>		--  write accel z_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '1';
					md_read_accel_flag <= '0';
					next_state <= state_write_accel_z_2;


				when state_write_accel_z_2 =>		--  write accel z_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '1';
					md_read_accel_flag <= '0';
					next_state <= wait_idle_state;
					
					
------------------------------------------------------------------------------------------------------
--------------------------------   read_accel        -------------------------------------------------      					
------------------------------------------------------------------------------------------------------


				when state_read_accel_1_2_idle =>		--  read accel 1_2 extra idle state

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '1';
					next_state <= state_read_accel_1_2;


				when state_read_accel_1_2 =>		--  read accel 1_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '1';

					next_state <= state_read_accel_2_1;


				when state_read_accel_2_1 =>		--  read accel 2_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '1';
					next_state <= state_read_accel_2_2;


				when state_read_accel_2_2 =>		--  read accel 2_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '1';
					next_state <= state_read_accel_2_2_dummy;


				when state_read_accel_2_2_dummy =>	--  read accel 2_2_dummy

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '1';
					next_state <= state_read_accel_3_1;

				when state_read_accel_3_1 =>		--  read accel 3_1

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '1';

					next_state <= state_read_accel_3_2;

				when state_read_accel_3_2 =>		--  read accel 3_2

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '1';

					next_state <= wait_idle_state;
------------------------------------------------------------------------------------------------------
--------------------------------   end               -------------------------------------------------      					
------------------------------------------------------------------------------------------------------

				when others =>

					md_write_pos_flag <= '0';
					md_read_pos_pg_flag <= '0';
					md_read_pos_vu_flag <= '0';
					md_write_veloc_flag <= '0';
					md_read_veloc_flag <= '0';
					md_write_accel_flag <= '0';
					md_read_accel_flag <= '0';

					next_state <= wait_state;


			end case;
		end if;
	end process;


end arch_memControl;



library ieee;
use ieee.std_logic_1164.all;

entity mc_data_reg is

  generic (
    width : integer := 16);

  port (
    D        : in  std_logic_vector(width-1 downto 0);
    Q        : out std_logic_vector(width-1 downto 0);
    clk      : in  std_logic;
    enable   : in  std_logic;           -- enable signal
    areset_b : in  std_logic);

end mc_data_reg;


architecture behav of mc_data_reg is
  signal Q_internal : std_logic_vector(width-1 downto 0);
begin  -- behav

                                        -- purpose: Register with asynchronous reset
                                        -- type   : sequential
                                        -- inputs : clk, reset, D, enable, reset, shiftr
                                        -- outputs: Q
  regular_reg : process (clk, areset_b)
  begin  -- process shiftty
    if areset_b = '0' then              -- asynchronous reset (active low)
      Q_internal <= (others => '0');
    elsif clk'event and clk = '1' then  -- rising clock edge
      if enable = '1' then
        Q_internal <= D;
      else
        Q_internal <= Q_internal;
      end if;
    end if;
  end process regular_reg;
  Q <= Q_internal;
end behav;

