 // Controller

module Controller ( opcode,
					funct,
					RegDst,
					Branch,
					MemtoReg,
					ALUCtrl,
					MemWrite,
					ALUSrc,
					RegWrite,
					Jal,
					Jump,
					Jr,
					H_mark
					);

	input  [5:0] opcode;
    input  [5:0] funct;
    
    output RegDst;
    output Branch;
	output MemtoReg;
	output [3:0]ALUCtrl;
	output MemWrite;
	output ALUSrc;
	output RegWrite;
	output Jal;
	output Jump;
	output Jr;
	output H_mark;
	
	reg RegDst;
    reg Branch;
	reg MemtoReg;
	reg [3:0]ALUCtrl;
	reg MemWrite;
	reg ALUSrc;
	reg RegWrite;
	reg	Jal;
	reg Jump;
	reg Jr;
	reg H_mark;
	
	reg	[1:0] ALUOp;
    
	always@ (*)
		begin
			RegDst		= 0;	 
			Branch 		= 0;
			MemtoReg	= 0;
			ALUOp 		= 0;
			MemWrite 	= 0;
			ALUSrc 		= 0;
			RegWrite 	= 0;
			Jal			= 0;
			Jump		= 0;
			Jr			= 0;
			ALUCtrl		= 4'b0000;
			H_mark		= 0;
			
			case (opcode)
				6'b000000 : //R type
					case(funct)
						6'b100000 : //add
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b0010;
							end
						6'b100010 : //sub
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b0110;
							end
						6'b100100 : //and
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b0000;

							end
						6'b100101 : //or
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b0001;
							end
						6'b100110 : //xor
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b0011;
								
							end
						6'b100111 : //nor
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b1100;
								
							end
						6'b101010 : //slt 
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b0111;
							end
							
						6'b000000 : //sll
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b1000;
								ALUSrc		= 0;
							end
						6'b000010 : //srl
							begin
								RegDst		= 1;
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								ALUCtrl		= 4'b1001;
								ALUSrc		= 0;
							end
						6'b001000 : //jr
							begin
								Jr 			= 1;
								Jal			= 1;
							end
						6'b001001 : //jalr
							begin
								ALUOp 		= 2'b10;
								RegWrite	= 1;
								Jal			= 1;
								Jump		= 0;
								Jr 			= 1;
							end
					endcase
				
				//I type	
				6'b001000 : //addi
					begin
						RegDst		= 0;
						RegWrite	= 1;
						ALUSrc		= 1;
						ALUCtrl		= 4'b0010;
						MemtoReg	= 0;
						Jal			= 0;
					end				
				6'b001100 : //andi
					begin
						RegDst		= 0;
						RegWrite	= 1;
						ALUSrc		= 1;
						ALUCtrl		= 4'b0000;
						MemtoReg	= 0;
						Jal			= 0;
					end				
				6'b001010 : //slti
					begin
						RegDst		= 0;
						RegWrite	= 1;
						ALUSrc		= 1;
						ALUCtrl		= 4'b0111;
						MemtoReg	= 0;
						Jal			= 0;
					end				
				6'b000100 : //beq
					begin
						RegDst		= 0;
						ALUSrc		= 0;
						Branch		= 1;
						ALUCtrl		= 4'b0110;
					end				
				6'b000101 : //bne
					begin
						RegDst		= 0;
						ALUSrc		= 0;
						Branch		= 1;
						ALUCtrl		= 4'b1110;
					end				
				6'b100011 : //lw
					begin
						RegDst		= 0;
						ALUSrc		= 1;
						MemtoReg	= 1;
						RegWrite	= 1;
						Jal			= 0;
						ALUCtrl		= 4'b0010;
					end				
				6'b100001 : //lh
					begin
						
						RegDst		= 0;
						ALUSrc		= 1;
						MemtoReg	= 1;
						RegWrite	= 1;
						Jal			= 0;
						ALUCtrl		= 4'b0010;
						H_mark		= 1;		
					end				
				6'b101011 : //sw
					begin
						RegDst		= 0;
						ALUSrc		= 1;
						MemtoReg	= 1;
						RegWrite	= 0;
						Jal			= 0;
						ALUCtrl		= 4'b0010;
						MemWrite	= 1;
					end				
				6'b101001 : //sh
					begin
						RegDst		= 0;
						ALUSrc		= 1;
						MemtoReg	= 1;
						RegWrite	= 0;
						Jal			= 0;
						ALUCtrl		= 4'b0010;
						MemWrite	= 1;
						H_mark		= 1;
					end
				6'b000010 : //j
					begin
						Jump		= 1;
					end
				6'b000011 : //jal
					begin
						RegWrite	= 1;
						Jal			= 1;
						Jump		= 1;
					end					
			endcase	
			
		end
	
endmodule




