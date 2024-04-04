module tb_instruction_decode;

reg clk;
reg [31:0] IFID;
reg [7:0] IFID_PC;
	
wire [39:0] IDEX;
wire [7:0] IDEX_PC;
wire [31:0] imme32;
wire [31:0] REGISTER_1;
wire [31:0] REGISTER_2;
wire [31:0] IDEX_imme32;
wire [4:0] rs1;
wire [4:0] rs2;

instruction_decode UUT (
	.clk(clk),
	.IFID(IFID),
	.IFID_PC(IFID_PC),
	.IDEX(IDEX),
	.IDEX_PC(IDEX_PC),
	.IDEX_imme32(IDEX_imme32),
	.rs1(rs1),
	.rs2(rs2)
//	.imme32(imme32),
//	.REGISTER_1(REGISTER_1),
//	.REGISTER_2(REGISTER_2)
);


initial begin 
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	IFID = 32'b00000000001000001000000110110011;
	IFID_PC = 8'h00;
	$monitor ("ctrl signal is %b", IDEX); 
end
endmodule

