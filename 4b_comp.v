`timescale 1ns/1ps

module comp_4b(a[0:3], b[0:3], g, e, l);
	output g, e, l;
	input [0:3] a,b;
	reg g=1'b0;
	reg e=1'b0;
	reg l=1'b0;

	always@(a or b)
		if(a<b) 
			begin l=1'b1;g=1'b0;e=1'b0; end
		else if(a>b)
			begin l=1'b0;g=1'b1;e=1'b0; end
		else 
			begin l=1'b0;g=1'b0;e=1'b1; end
endmodule