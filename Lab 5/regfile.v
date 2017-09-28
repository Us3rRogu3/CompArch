`include "demux_5b_5x32.v"
`include "mux_5b_5x32.v"
`include "reg32.v"

module regFile(clk, rst, read1, read2, writed, writer, regwrite, read_d1, read_d2);
	input clk, rst;
	input[4:0] read1, read2;
	output[31:0] read_d1, read_d2;
	input[31:0] writed;
	input[4:0] writer;
	input regwrite;
	wire[31:0][31:0] qs;
	wire[31:0] cs;
	wire[31:0] fc;
	wire[4:0] reg1,reg2;
	demux_5b_5x32 dm(writer, cs);
	
	always @(read1 or read2)
		begin
			reg1 = read1;
			reg2 = read2;
		end
	
	always @(regwrite)
		begin
			genvar i;
			generate for(i=0; i<32; i=i+1) begin:clk_assign
				and (fc[i], cs[i], clk, regwrite);
			end endgenerate
			reg1 = writer;
			reg2 = 5'd0;
		end

	generate for(i=0; i<32; i=i+1) begin:reg_generate
		reg32 r(qs[i], writed, fc[i], rst);
	end endgenerate
	
	mux_32b_32x1 m1(read1, qs, read_d1);
	mux_32b_32x1 m2(read2, qs, read_d2);
endmodule