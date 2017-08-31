`timescale 1ns/1ps

module mealy(clk, rst, inp, out);
	input clk, rst, inp;
	output out;
	reg out;
	reg [1:0] state;

	always @ (posedge clk, posedge rst)
	begin
		if(rst) 
		begin
			state <= 2'b0;
			out <= 1'b0;
		end
		else
		begin
			case(state)
				2'b00: 
				begin
					if(inp)
					begin
						state <= 2'b01;
						out <= 1'b0;
					end
					else
					begin
						state <= 2'b10;
						out <= 1'b0;
					end
				end
				
				2'b01: 
				begin
					if(inp)
					begin
						state <= 2'b00;
						out <= 1'b1;
					end
					else
					begin
						state <= 2'b10;
						out <= 1'b0;
					end
				end
				
				2'b10: 
				begin
					if(inp)
					begin
						state <= 2'b01;
						out <= 1'b1;
					end
					else
					begin
						state <= 2'b00;
						out <= 1'b0;
					end
				end
				
				default:
				begin
					state <= 2'b00;
					out <= 0;
				end
			endcase
		end		
	end
endmodule