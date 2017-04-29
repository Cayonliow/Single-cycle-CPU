// Mux2to1

module Mux2to1_h ( I,
				 S,
				 out);

	parameter bit_size = 32;

	input  [bit_size-1:0] I;
	input  S;
	
	output [bit_size-1:0] out;
	
	reg	[bit_size-1:0] temp;
  	reg [bit_size-1:0] out; 
  	
  	
	always@ (*) begin
		if(S==0)
			begin
			assign out  = I;
			end
		else
			begin
			assign out  = {{16{I[15]}},I[15:0]};
			end
	end

endmodule





