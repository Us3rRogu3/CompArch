module fa_32b(out, in1, in2, cin, cout);
	input [31:0] in1, in2;
	output [31:0] out;
	input cin;
	output cout;
	assign {cout,out} = in1+in2+cin;
endmodule