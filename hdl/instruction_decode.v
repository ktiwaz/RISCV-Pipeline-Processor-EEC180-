module instruction_decode(
	//input
	input clk,
	input [31:0] IFID,
	input [7:0] IFID_PC,
	//output
	output reg [39:0] IDEX,
	output reg [7:0] IDEX_PC,
	output reg [31:0] IDEX_imme32,
//	output [31:0] REGISTER_1,
//	output [31:0] REGISTER_2,
	output [4:0] rs1,
	output [4:0] rs2
//	output reg [4:0] rs1,
//	output reg [4:0] rs2
);

	
wire ALUSrc;
wire [1:0] ALUOp;
wire Branch;
wire MemRead;
wire MemWrite;
wire MemToReg;
wire RegWrite;
wire [31:0] imme32;

assign rs1 = IFID[19:15];
assign rs2 = IFID[24:20];

// instantiate the control module that calculates the control signal for later stage
control ctrl (
	.opcode(IFID[6:0]),
	.ALUSrc(ALUSrc),
	.ALUOp(ALUOp),
	.Branch(Branch),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.MemToReg(MemToReg),
	.RegWrite(RegWrite)
);
// instantiate the immediate generator
imme_generator imme_gene (
	.clk(clk),
	.opcode(IFID[6:0]),
	.ins(IFID),
	.imme32(imme32)
);



always @(posedge clk) begin
	IDEX = {ALUSrc,ALUOp,Branch,MemRead,MemWrite,MemToReg,RegWrite,IFID}; 
	IDEX_PC = IFID_PC[7:0]; 
	IDEX_imme32 = imme32;
end

endmodule