module MUX(
	input clk,
	input [31:0] a,b,
	input s,
	
	output reg [31:0] out
);

always @(s) begin
	if (s) begin
		out <= a;
	end
	else begin
		out <= b;
	end
end

endmodule