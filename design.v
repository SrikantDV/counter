module counter(input clk, rst, output reg[3:0] count, output reg clkout)
	
	always@(posedge clk or negedge rst) begin
		if(!rst)begin
			count <= 4'b0000;
			clkout <= 1'b0;
		end
		else begin
			if(count == 15)begin
				count <= 4'b0000;
				clkout = ~clkout;
			end
			else begin
				count <= count+1;
			end
		end
	end
endmodule
