`include "dec_2x4.v"

module mux_4x1(regData, q1, q2, q3, q4, reg_no);
	output [31:0] regData;
	input [31:0] q1, q2, q3, q4;
	input [1:0] reg_no;
	wire[3:0] register;
	dec_2x4 dec(register, reg_no);
	genvar i;
	generate for(i=0; i<32; i=i+1) begin: generate_block_identifier
		wire a1, a2, a3, a4;
		and (a1, q1[i], register[0]);
		and (a2, q2[i], register[1]);
		and (a3, q3[i], register[2]);
		and (a4, q4[i], register[3]); 
		or (regData[i], a1, a2, a3, a4);
	end endgenerate
endmodule