// ALU

module ALU ( ALUCtrl,
			 src1,
			 src2,
			 shamt,
			 ALU_result,
			 Zero);
	
	parameter bit_size = 32;
	
	input [3:0] ALUCtrl;
	input [bit_size-1:0] src1;
	input [bit_size-1:0] src2;
	input [4:0] shamt;
	
	output [bit_size-1:0] ALU_result;
	output Zero;
			
	reg [bit_size-1:0] ALU_result;
	reg Zero;

	always @(*)
		begin
		ALU_result		=0;
		Zero			=0;
			case(ALUCtrl)	
				4'b0010:	//add
					begin
						ALU_result = src1 + src2;
						Zero = (ALU_result==0)? 1 : 0;				
					end
				4'b0110:	//sub
					begin
						ALU_result = src1 - src2;
						Zero = (ALU_result==0)? 1 : 0;
					end
				4'b1110:	//sub(only for bne)
					begin
						ALU_result = src1 - src2;
						Zero = (ALU_result==0)? 0 : 1;
					end
				4'b0000:	//and
					begin
						ALU_result = src1 & src2;
						Zero = (ALU_result==0)? 1 : 0;
					end
				4'b0001:	//0r
					begin
						ALU_result = 	src1 | src2;
						Zero = (ALU_result==0)? 1 : 0;
					end
				4'b1100:	//nor
					begin
						ALU_result = ~(src1 | src2);
						Zero = (ALU_result==0)? 1 : 0;
					end
				4'b0111:	//slt
					begin
						ALU_result = (src1 < src2) ? 1 : 0;
						Zero = (ALU_result==0)? 1 : 0;	
					end	
				4'b0011:	//xor
					begin
						ALU_result = src1 ^ src2;
						Zero = (ALU_result==0)? 1 : 0;	
					end
				4'b1000:	//sll
					begin
						ALU_result = src2 << shamt;
						Zero = (ALU_result==0)? 1 : 0;
					end
				4'b1001:	//srl
					begin
						ALU_result = src2 >> shamt;
						Zero = (ALU_result==0)? 1 : 0;	
					end
			endcase	
		end
endmodule  





