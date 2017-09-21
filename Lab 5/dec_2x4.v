module dec_2x4(register, reg_no);
	output [3:0] register;
	input [1:0] reg_no;
	wire n0,n1;
	not (n0, reg_no[0]);
	not (n1, reg_no[1]);
	and (register[3],reg_no[0],reg_no[1]);
	and (register[1],reg_no[0],n1);
	and (register[2],n0,reg_no[1]);
	and (register[0],n0,n1);
endmodule