module instruction_data_mem(
	//input
	input clk,
	input [44:0] EXMEM,
	input [31:0] address,
	input [31:0] WRITE_DATA,
	input Zero,
	input [31:0] ALUresult,
	input [7:0] PCBranch_EXMEM,  // inout
	//output
	output reg [31:0] Pass_ALUresult,
	output reg [33:0] MEMWB,
	output [31:0] MEM_DATA,
	output reg PC_select,
	output reg [7:0] PCBranch
);

reg [31:0] wd;
wire [7:0] ADDRESS;

// instantiate data memory for data write or read

d_mem d_MEM(
	.address({2'b0,ALUresult[7:2]}),
	.clock(~clk),
	.data(WRITE_DATA),
	.wren(EXMEM[34]),
	.q(MEM_DATA)
	);

//DATA_MEM d_mem (
//	.clk(clk),
//	.address(ALUresult[7:0]),
//	.MemWrite(EXMEM[34]),
//	.MemRead(EXMEM[35]),
//	.DATA(MEM_DATA),
//	.WRITE_DATA(WRITE_DATA)
//);

assign ADDRESS = EXMEM[44:37];

always @ (posedge clk) begin
	MEMWB = EXMEM[33:0];
	PC_select = (EXMEM[36] & Zero);
	Pass_ALUresult = ALUresult;
	PCBranch = PCBranch_EXMEM;
end

endmodule