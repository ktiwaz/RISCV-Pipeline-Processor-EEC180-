module imme_generator(
 input clk,
 input [6:0] opcode,
 input [31:0] ins,
 output reg [31:0] imme32
);

reg [11:0] immeI;
reg [11:0] immeB;
reg [11:0] immeS;

parameter I_Type = 7'b0010011;
parameter Lw = 7'b0000011;
parameter Sw = 7'b0100011;
parameter B_Type = 7'b1100011;

			
always @(*) begin
	immeI = ins[31:20];
	immeB = {ins[31],ins[7],ins[30:25],ins[11:8]};
	immeS = {ins[31:25],ins[11:7]};
	imme32 = 32'h00000000;
	if (opcode == I_Type | opcode == Lw) begin
		if (immeI[11] == 1'b0) begin
			imme32 = {20'b0, immeI};
		end
		else begin
			imme32 = {20'hFFFFF, immeI};
		end
	end
	else if (opcode == Sw) begin
		if (immeS[11] == 1'b0) begin
			imme32 = {20'b0, immeS};
		end
		else begin
			imme32 = {20'hFFFFF, immeS};
			end
		end
	else if (opcode == B_Type) begin
		if (immeB[11] == 1'b0) begin
			imme32 = {20'b0, immeB};
		end
		else begin
			imme32 = {20'hFFFFF, immeB};
		end
	end
end
endmodule