`timescale 1ns/1ps
`include "decoder_3x8.v"

module fadder(in, s, c);
	input [0:2] in;
	output s, c;
	wire [0:7] t;
	
	decoder dec(in[0:2], t[0:7]);
	
	assign s = t[1] | t[2] | t[4] | t[7];
	assign c = t[3] | t[5] | t[6] | t[7];
endmodule