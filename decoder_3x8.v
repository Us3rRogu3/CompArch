`timescale 1ns/1ps

module decoder(in, out);
	input [0:2] in;
	output [0:7] out;
	wire n1, n2, n3;
	
	not (n1, in[0]);
	not (n2, in[1]);
	not (n3, in[2]);
	
	and (out[0], n1, n2, n3);
	and (out[1], in[0], n2, n3);
	and (out[2], n1, in[1], n3);
	and (out[3], in[0], in[1], n3);
	and (out[4], n1, n2, in[2]);
	and (out[5], in[0], n2, in[2]);
	and (out[6], n1, in[1], in[2]);
	and (out[7], in[0], in[1], in[2]);
endmodule