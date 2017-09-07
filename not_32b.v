module not_32b(out, in1);
	input [31:0] in1;
	output [31:0] out;
	assign {out} = ~in1;
endmodule