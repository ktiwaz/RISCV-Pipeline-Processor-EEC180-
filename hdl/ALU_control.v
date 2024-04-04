module ALU_control(
	input [1:0] ALUop,
	input [2:0] func3,
	input [6:0] func7,
	output reg [3:0] ALUcontrol
);
wire [9:0] func;

assign func = {func3,func7};



//reference for opcode and func
// add   0110011  000  0000000
// sub   0110011  000  0100000
// mul   0110011  000  0000001
// and   0110011  111  0000000
// or    0110011  110  0000000
// xor   0110011  100  0000000

// addi  0010011  000  
// srli  0010011  001  imme[5:11] = 0x00
// slli  0010011  101  imme[5:11] = 0x00

// lw    0000011  010
// sw    0100011  010

// beq   1100011  000
// bne   1100011  001
//// blt   1100011  100
//// bge   1100011  101

//// jal   1101111 



always @(ALUop,func,func3,func7) begin	
	ALUcontrol = 4'bxxxx;
	case (ALUop) 
		2'b10: begin  // sw lw add
			ALUcontrol = 4'b0010;
		end
		2'b01: begin  // branch minus
			ALUcontrol = 4'b0110;
		end
		2'b00: begin  // R-type instructions
			if (func == 10'b0000000000)begin
				ALUcontrol = 4'b0010;
			end
			else if (func == 10'b0000100000)begin 
				ALUcontrol = 4'b0110;
			end
			else if (func == 10'b1110000000)begin
				ALUcontrol = 4'b0000;
			end
			else if (func == 10'b1100000000)begin
				ALUcontrol = 4'b0001;
			end
			else if (func == 10'b1000000000)begin
				ALUcontrol = 4'b0011;
			end
			else if (func == 10'b0000000001)begin
				ALUcontrol = 4'b0100;
			end
		end
		2'b11: begin // I-Type instructions
			if (func3 == 3'b000) begin
				ALUcontrol = 4'b0010;
			end
			else if (func3 == 3'b001) begin
				ALUcontrol = 4'b1100;
			end
			else if (func3 == 3'b101) begin
				ALUcontrol = 4'b1000;
			end
		end
	endcase
end

endmodule