module ALU(
	input [6:0] opcode,
	input signed [31:0] A, 
	input signed [31:0] B,
	input [3:0] ALUMode,
	output reg Zero,
	output reg [31:0] ALUOut
);
parameter B_Type = 7'b1100011;

always @(*) begin
	case (ALUMode)
		4'b0010: ALUOut = A + B;
		4'b0110: ALUOut = A - B;
		4'b0000: ALUOut = A & B;
		4'b0001: ALUOut = A | B;
		4'b0011: ALUOut = A ^ B;
		4'b0100: ALUOut = A * B;
		4'b1000: ALUOut = A << B;
		4'b1100: ALUOut = A >> B;
		default: ALUOut = 32'b0;	
	endcase
	Zero = 1'b0;
	
// beq is == , bne is != 	
//	if (opcode == B_Type & ALUOut == 32'b0) begin
//		Zero = 1'b1;
//	end	
	if (opcode == B_Type & ALUOut != 32'b0) begin
		Zero = 1'b1;
	end	
end

endmodule