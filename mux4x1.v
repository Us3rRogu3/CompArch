`timescale 1ns/1ps

module mux4x1_gate(in, out, sel);
	input [0:3] in;
	input [0:1] sel;
	output out;
	wire a1, a2, a3, a4, n1, n2;
	
	not (n1, sel[1]);
	not (n2, sel[0]);
	
	and (a1, in[0], n1, n2);
	and (a2, in[1], n1, sel[0]);
	and (a3, in[2], sel[1], n2);
	and (a4, in[3], sel[1], sel[0]);
	
	or (out, a1, a2, a3, a4);
endmodule