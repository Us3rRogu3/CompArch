`timescale 1ns/1ps
`include "alu.v"

module tb_alu;
	reg Binvert, Carryin;
	reg [1:0] Operation;
	reg [31:0] a,b;
	wire [31:0] Result;
	wire CarryOut;
	ALU a1(a,b,Binvert,Carryin,Operation,Result,CarryOut);
	initial begin
		$monitor("a = %b, b = %b, op = %d, binv = %b, cin = %b, out = %b, cout = %b", a, b, Operation, Binvert, Carryin, Result, CarryOut);
		a=32'ha5a5a5a5;
		b=32'h5a5a5a5a;
		Operation=2'b00;
		Binvert=1'b0;
		Carryin=1'b0; //must perform AND resulting in zero
		#100 Operation=2'b01; //OR
		#100 Operation=2'b10; //ADD
		#100 Binvert=1'b1;//SUB
		#200 $finish;
	end
endmodule
