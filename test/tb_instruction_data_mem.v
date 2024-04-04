module tb_instruction_data_mem;

reg clk;
reg [44:0] EXMEM;
reg [31:0] address;
reg [31:0] WRITE_DATA;
reg Zero;
reg [31:0] ALUresult;
reg [7:0] PCBranch_EXMEM;
//output
wire [31:0] Pass_ALUresult;
wire [33:0] MEMWB;
wire [31:0] MEM_DATA;
wire PC_select;
wire [7:0] PCBranch;

instruction_data_mem UUT (
	.clk(clk),
	.EXMEM(EXMEM),
	.address(address),
	.ALUresult(ALUresult),
	.Pass_ALUresult(Pass_ALUresult),
	.WRITE_DATA(WRITE_DATA),
	.Zero(Zero),
	.MEMWB(MEMWB),
	.MEM_DATA(MEM_DATA),
	.PC_select(PC_select),
	.PCBranch_EXMEM(PCBranch_EXMEM),
	.PCBranch(PCBranch)
);

initial begin 
	UUT.d_mem.d_MEM[1] = 32'h11001100;
	clk = 1'b0;
	forever #10 clk = ~clk;
	
end

initial begin
	Zero = 1'b0;
	PCBranch_EXMEM = 8'h33;
	ALUresult = 32'h12345678;
	WRITE_DATA = 32'h00110011;
	address = 8'h02;
	#20;
	EXMEM = 37'h0400000000;  // write      37 = 5 + 32
	#20;
	address = 8'h01;
	EXMEM = 37'h0800000000;  // read 01000 
	#20;
	Zero = 1'b1;
	EXMEM = 37'h1000000000;  // b
	$display("mem 2 is %b", UUT.d_mem.d_MEM[1]);
end
endmodule