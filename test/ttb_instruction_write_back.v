module tb_instruction_write_back;

reg clk;
reg [33:0] MEMWB;
reg [31:0] MEM_DATA;
reg [31:0] ALU_DATA;
wire [31:0] WRITE_BACK;
wire RegWrite;
wire [4:0] rd;

instruction_write_back UUT(
	.clk(clk),
	.MEMWB(MEMWB),
	.MEM_DATA(MEM_DATA),
	.ALU_DATA(ALU_DATA),
	.WRITE_BACK(WRITE_BACK),
	.RegWrite(RegWrite),
	.rd(rd)
);




initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	//$monitor("reg 1 is %b, write back is %b", UUT.regis.REGISTER[1], UUT.WRITE_BACK); 

	MEM_DATA = 32'h00000001;
	ALU_DATA = 32'h00000010;
	#20;
	MEMWB = 34'h100000080; // MemToReg RegWrite ins   01   00000000 00000000 00000000 10000000
	#20;
	MEMWB = 34'h300000080;
	#20;
end
endmodule