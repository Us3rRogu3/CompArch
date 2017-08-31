`timescale 1ns/1ps

module dff_sync_clear(d, clearb, clock, q);
	input d, clearb, clock;
	output q;
	reg q;

	always @ (posedge clock)
	begin
		if (!clearb) q <= 1'b0;
		else q <= d;
	end
endmodule

module dff_async_clear(d, clearb, clock, q);
	input d, clearb, clock;
	output q;
	reg q;
	
	always @ (negedge clearb or posedge clock)
	begin
		if (!clearb) q <= 1'b0;
		else q <= d;
	end
endmodule
