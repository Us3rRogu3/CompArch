`timescale 1ns/1ps

module bcd_gray(i[0:3], f[0:3]);
	output [0:3] f;
	input [0:3] i;
	
	xor(f[3], i[2], i[3]);
	xor(f[2], i[1], i[2]);
	xor(f[1], i[0], i[1]);
	assign f[0] = i[0];
endmodule