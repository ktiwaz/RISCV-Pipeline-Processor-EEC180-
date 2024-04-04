module tb_instruction_execution;

//input
reg clk;
reg [39:0] IDEX;
reg [7:0] IDEX_PC;
reg [31:0] REGISTER_1;
reg [31:0] REGISTER_2;
reg [31:0] imme32;
//output
wire Zero;
wire [44:0] EXMEM;
wire [31:0] ALUresult;
wire [31:0] WRITE_DATA;
wire [7:0] PCBranch_EXMEM;

instruction_execution UUT (
	.clk(clk),
	.IDEX(IDEX),
	.IDEX_PC(IDEX_PC),
	.REGISTER_1(REGISTER_1),
	.REGISTER_2(REGISTER_2),
	.imme32(imme32),
	.Zero(Zero),
	.EXMEM(EXMEM),
	.ALUresult(ALUresult),
	.WRITE_DATA(WRITE_DATA),
	.PCBranch_EXMEM(PCBranch_EXMEM)
);

initial begin

	clk = 1'b0;
	forever #10 clk =~ clk;
end

initial begin
	REGISTER_1 = 32'h11110000;
	REGISTER_2 = 32'h00001111;
	IDEX_PC = 8'b00010101;
	imme32 = 32'h00000001;
	#20;
	IDEX = 40'b00000000000000000000000000000000000110011;
	#20;

end
endmodule