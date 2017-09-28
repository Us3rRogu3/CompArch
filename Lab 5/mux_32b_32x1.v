module mux_32b_32x1(sel, inp, out);
	input[4:0] sel;
	input[31:0][31:0] inp;
	output[31:0] out;
	integer i;
	always@(sel) begin
		i = sel;
	end
	assign out = inp[i];
endmodule
	