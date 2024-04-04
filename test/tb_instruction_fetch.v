module tb_instruction_fetch;

reg rst;
reg clk;
reg PCSelect;
reg [7:0] PCBranch;
reg [39:0] IDEX;
reg [44:0] EXMEM;
reg start;

wire [31:0] ins;
wire [7:0] IFID_PC;
wire [31:0] IFID;

instruction_fetch UUT (
	.clk(clk),
	.PCSelect(PCSelect),
	.PCBranch(PCBranch),
	.IDEX(IDEX),
	.EXMEM(EXMEM),
	.IFID_PC(IFID_PC),
	.IFID(IFID),
	.start(start),
	.ins(ins),
	.rst(rst)
);



initial begin
	///memory
	UUT.i_MEM.i_MEM[0] = 8'b00000000;
	UUT.i_MEM.i_MEM[1] = 8'b01010000;
	UUT.i_MEM.i_MEM[2] = 8'b00000000;
	UUT.i_MEM.i_MEM[3] = 8'b10010011;
	
	UUT.i_MEM.i_MEM[8] = 8'b00000000;
	UUT.i_MEM.i_MEM[9] = 8'b00010000;
	UUT.i_MEM.i_MEM[10] = 8'b10000001;
	UUT.i_MEM.i_MEM[11] = 8'b00110011;
	
	UUT.i_MEM.i_MEM[4] = 8'b00000000;
	UUT.i_MEM.i_MEM[5] = 8'b00110001;
	UUT.i_MEM.i_MEM[6] = 8'b10000001;
	UUT.i_MEM.i_MEM[7] = 8'b10110011;
		
	clk = 1'b1;
	forever #10 clk = ~clk;
end

initial begin
	rst = 1'b0;
	start = 1'b0;
	UUT.state = 3'b100;
	IDEX = 32'b0;
	EXMEM = 32'b0;
	PCBranch = 1'b0;
	PCSelect = 1'b0;
	$monitor("the ins is %b, the state is %b, the PC is %b, nextstate is %b", UUT.ins , UUT.state, UUT.PC, UUT.nextstate);
	#20;
	start = 1'b1;
	#20;
	#20;
	IDEX = 32'b00000000010100000000000010010011;
	EXMEM = 32'b0;
	#20
	IDEX	= 32'b00000000001100011000000110110011;
	EXMEM = 32'b00000000010100000000000010010011;
	#20
	IDEX = 32'b0;
	EXMEM = 32'b00000000001100011000000110110011;
	
end

endmodule