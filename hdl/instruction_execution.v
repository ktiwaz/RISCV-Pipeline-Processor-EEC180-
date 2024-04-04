module instruction_execution(
	//input
	input clk,
	input [39:0] IDEX,
	input [7:0] IDEX_PC,
	input [31:0] REGISTER_1,
	input [31:0] REGISTER_2,
	input [31:0] imme32,
	//output
	output reg Zero,
	output reg [44:0] EXMEM,
	output reg [31:0] ALUresult,
	output reg [31:0] WRITE_DATA,
	output reg [7:0] PCBranch_EXMEM
);


reg [31:0] ALU_BIN;
reg signed [31:0] OFFSET; // offset for PC to increment for potential branching
wire [31:0] ALUBin;
wire [3:0] ALUcontrol;
wire [31:0] PCBranch_result;
wire zero;
wire [31:0] ALUOut;
wire PC_Zero; // useless, to differentiate from the main ALU zero signal

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



// instantiate ALU_control for ALU control signals
ALU_control ALU_ctrl (
	.ALUop(IDEX[38:37]),
	.func3(IDEX[14:12]),
	.func7(IDEX[31:25]),
	.ALUcontrol(ALUcontrol)
);
// instantiate ALU for potential Branch instruction next PC calculation
ALU alu_PC (
	.A({24'b0,IDEX_PC}),
	.B(OFFSET),
	.ALUMode(4'b0010),
	.Zero(PC_Zero),
	.ALUOut(PCBranch_result),
	.opcode(IDEX[6:0])
);
// instantiate ALU for normal instruction execution
ALU alu_exe (
	.A(REGISTER_1),
	.B(ALU_BIN),
	.ALUMode(ALUcontrol),
	.Zero(zero),
	.ALUOut(ALUOut),
	.opcode(IDEX[6:0])
);



// instantiate MUX for alu_exe.B
//MUX alu_exe_b (
//	.clk(clk),
//	.a(imme32),
//	.b(REGISTER_2),
//	.s(IDEX[39]),
//	.out(ALUBin)
//);

always @(*)begin
	OFFSET = 2 * imme32;
end

always @(*)begin
	if (IDEX[39]) begin
		ALU_BIN = imme32;
	end
	else begin
		ALU_BIN = REGISTER_2;
	end
end
always @(posedge clk) begin
	WRITE_DATA = REGISTER_2;
	EXMEM = {ALUresult[7:0],IDEX[36:0]};
	PCBranch_EXMEM = PCBranch_result[7:0];
	ALUresult = ALUOut;
	Zero = zero;
end
endmodule