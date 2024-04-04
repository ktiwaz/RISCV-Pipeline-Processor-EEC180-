module control(
	
	input [6:0] opcode,
	
	output reg ALUSrc,
	output reg [1:0] ALUOp,
	output reg Branch,
	output reg MemRead,
	output reg MemWrite,
	output reg MemToReg,
	output reg RegWrite
);
// 
parameter R_Type = 7'b0110011;
parameter I_Type = 7'b0010011;
parameter Lw = 7'b0000011;
parameter Sw = 7'b0100011;
parameter B_Type = 7'b1100011;
parameter J_Type = 7'b1101111;

always @(opcode) begin
	case (opcode)
		R_Type: begin
			ALUSrc = 1'b0;
			ALUOp = 2'b00;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b1;
		end
		I_Type: begin
			ALUSrc = 1'b1;
			ALUOp = 2'b11;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b1;
		end
		Lw: begin
			ALUSrc = 1'b1;
			ALUOp = 2'b10;
			Branch = 1'b0;
			MemRead = 1'b1;
			MemWrite = 1'b0;
			MemToReg = 1'b1;
			RegWrite = 1'b1;
		end
		Sw: begin
			ALUSrc = 1'b1;
			ALUOp = 2'b10;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b1;
			MemToReg = 1'b0;
			RegWrite = 1'b0;
		end
		B_Type: begin
			ALUSrc = 1'b0;
			ALUOp = 2'b01;
			Branch = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b0;
		end
		default begin
			ALUSrc = 1'b0;
			ALUOp = 2'b00;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b0;
		end
	endcase
end

endmodule