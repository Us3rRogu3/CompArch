`timescale 1ns/1ps

module fsm(clk, rst, inp, out);
	input clk, rst, inp;
	output out;
	reg out;
	reg [2:0] state;

	always @ (posedge clk, posedge rst)
	begin
		if(rst) 
		begin
			state <= 3'b0;
			out <= 1'b0;
		end
		else
		begin
			case(state)
				3'b000: 
				begin
					if(inp)
					begin
						state <= 3'b001;
						out <= 1'b0;
					end
					else
					begin
						state <= 3'b000;
						out <= 1'b0;
					end
				end
				
				3'b001: 
				begin
					if(inp)
					begin
						state <= 3'b001;
						out <= 1'b0;
					end
					else
					begin
						state <= 3'b010;
						out <= 1'b0;
					end
				end
				
				3'b010: 
				begin
					if(inp)
					begin
						state <= 3'b011;
						out <= 1'b0;
					end
					else
					begin
						state <= 3'b000;
						out <= 1'b0;
					end
				end
				
				3'b011: 
				begin
					if(inp)
					begin
						state <= 3'b100;
						out <= 1'b0;
					end
					else
					begin
						state <= 3'b010;
						out <= 1'b0;
					end
				end
				
				3'b100: 
				begin
					if(inp)
					begin
						state <= 3'b001;
						out <= 1'b0;
					end
					else
					begin
						state <= 3'b010;
						out <= 1'b1;
					end
				end
				
				default:
				begin
					state <= 3'b000;
					out <= 1'b0;
				end
			endcase
		end		
	end
endmodule