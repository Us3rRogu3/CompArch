`timescale 1ns/1ps

module dff(d, clearb, clock, q);
	input d, clearb, clock;
	output q;
	reg q;

	always @ (!clearb)
		begin
			q <= 1'b0;
		end
	
	always @ (posedge clock)
		begin
			if(!clearb) q <= d;
		end
endmodule