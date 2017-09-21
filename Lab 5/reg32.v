`include "dff.v"

module reg32(q, d, clock, reset);
	input [31:0] d;
	output [31:0] q; 
	input clock, reset;
	genvar i;
	generate for(i=0; i<=31; i=i+1) begin: generate_block_identifier
		dff df(d[i],reset,clock,q[i]);
	end endgenerate
endmodule