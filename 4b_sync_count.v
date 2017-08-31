`timescale 1ns/1ps
`include "jkff.v"

module sync_count_4b(inp, ck, rst, out);
	input inp, ck, rst;
	output [3:0] out;
	reg [3:0] out;
	wire w1, w2, w3, w4, a1, a2;
	wire clk = ck & inp;

	jkff ffa(inp, inp, rst, clk, w1);
	jkff ffb(w1, w1, rst, clk, w2);
	
	and (a1, w1, w2);
	jkff ffc(a1, a1, rst, clk, w3);		
	
	and (a2, a1, w3);
	jkff ffd(a2, a2, rst, clk, w4);
	
	always @ (posedge clk)
	begin
		out={w4,w3,w2,w1};
	end
endmodule
