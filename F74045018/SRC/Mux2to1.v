// Mux2to1

module Mux2to1 ( I0,
				 I1,
				 S,
				 out);

	parameter bit_size = 32;

	input  [bit_size-1:0] I0;
	input  [bit_size-1:0] I1;
	input  S;
	
	output [bit_size-1:0] out;
	
  reg [bit_size-1:0] out;
	/* implement Mux2to1 */
	// assign out =  ;
	always@ (*) begin
		if(S==0)
			begin
			assign out = I0;
			end
		else
			begin
			assign out = I1;
			end
	end

endmodule





