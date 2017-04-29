// Regfile

module Regfile ( clk, 
				 rst,
				 Read_addr_1,
				 Read_addr_2,
				 Read_data_1,
                 		Read_data_2,
				 RegWrite,
				 Write_addr,
				 Write_data);
	
	parameter bit_size = 32;
	
	input  clk, rst;
	input  [4:0] Read_addr_1;
	input  [4:0] Read_addr_2;
	
	output [bit_size-1:0] Read_data_1;
	output [bit_size-1:0] Read_data_2;
	
	input  RegWrite;
	input  [4:0] Write_addr;
	input  [bit_size-1:0] Write_data;

	reg	[bit_size-1:0] Reg_file[bit_size-1:0];
	
	assign Read_data_1 = Reg_file[Read_addr_1];
	assign Read_data_2 = Reg_file[Read_addr_2];

	integer i;
	
	initial 
		begin
			for(i = 0; i < bit_size; i = i+1)
				begin
					Reg_file[i] = 0;
				end
		end
	
    	always @(posedge clk or posedge rst)
		begin
			if(RegWrite)
				begin
					Reg_file[Write_addr] <= Write_data;
				end
		end
	
endmodule
