
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Pipeline_Processor(

//	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
//	input 		          		MAX10_CLK2_50,
//
//	//////////// SDRAM //////////
//	output		    [12:0]		DRAM_ADDR,
//	output		     [1:0]		DRAM_BA,
//	output		          		DRAM_CAS_N,
//	output		          		DRAM_CKE,
//	output		          		DRAM_CLK,
//	output		          		DRAM_CS_N,
//	inout 		    [15:0]		DRAM_DQ,
//	output		          		DRAM_LDQM,
//	output		          		DRAM_RAS_N,
//	output		          		DRAM_UDQM,
//	output		          		DRAM_WE_N,
//
//	//////////// SEG7 //////////
//	output		     [7:0]		HEX0,
//	output		     [7:0]		HEX1,
//	output		     [7:0]		HEX2,
//	output		     [7:0]		HEX3,
//	output		     [7:0]		HEX4,
//	output		     [7:0]		HEX5,
//
//	//////////// KEY ////////////
//	input 		     [1:0]		KEY,
//
//	//////////// LED //////////
//	output		     [9:0]		LEDR,
//
//	//////////// SW //////////
	input 		     [1:0]		SW
	
	
	
	//input
//		input rst,
//		input clk,
//		input start
	
	
	
	//output
	
	
	//declaring pipeline register
	//output [31:0] IFID, // this only stores the instructions
	//output [39:0] IDEX, // this stores 32 bit instructions and 8 bit control signal for later execution, memory and write back
	//output [44:0] EXMEM, // this stores 32 bit instructions and 5 bit control signal for later memory and write back
	//output [33:0] MEMWB, // this stores 32 bit instrucitons and 2 bit control signal for write back
	//data path 
//	output PC_select,
//	output [7:0] PCBranch,
//	//output [7:0] IFID_PC,
//	//output [7:0] IDEX_PC,
//	output [31:0] imme32,
//	output [31:0] REGISTER_1,
//	output [31:0] REGISTER_2,
//	output Zero,
//	output [31:0] ALUresult,
//	output [31:0] WRITE_DATA,
//	output [7:0] PCBranch_EXMEM,
//	output [31:0] Pass_ALUresult,
//	output [31:0] MEM_DATA,
//	output [31:0] ins,
//	output [31:0] WRITE_BACK,
//	output RegWrite,
//	//output [31:0] IDEX_imme32,
//	output [4:0] rs1,
//	output [4:0] rs2,
//	output [4:0] rd,
//	output [31:0] writebackdata
	
	
	
	
	
);

wire clk;
wire rst;
wire start;

//declaring pipeline register
wire [31:0] IFID; // this only stores the instructions
wire [39:0] IDEX; // this stores 32 bit instructions and 8 bit control signal for later execution, memory and write back
wire [44:0] EXMEM; // this stores 32 bit instructions and 5 bit control signal for later memory and write back
wire [33:0] MEMWB; // this stores 32 bit instrucitons and 2 bit control signal for write back
////data path 
wire PC_select;
wire [7:0] PCBranch;
wire [7:0] IFID_PC;
wire [7:0] IDEX_PC;
wire [31:0] imme32;
wire [31:0] REGISTER_1;
wire [31:0] REGISTER_2;
wire Zero;
wire [31:0] ALUresult;
wire [31:0] WRITE_DATA;
wire [7:0] PCBranch_EXMEM;
wire [31:0] Pass_ALUresult;
wire [31:0] MEM_DATA;
wire [31:0] ins;
wire [31:0] WRITE_BACK;
wire RegWrite;
wire [31:0] IDEX_imme32;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [31:0] writebackdata;

assign clk = ADC_CLK_10;
assign rst = SW[0];
assign start = SW[1];

 
// instantiate the data path
// Instruction fetch
instruction_fetch fetch (
	.clk(clk),
	.PCSelect(PC_select),
	.PCBranch(PCBranch),
	.IDEX(IDEX),
	.EXMEM(EXMEM),
	.start(start),
	.IFID_PC(IFID_PC),
	.IFID(IFID),
	.ins(ins),
	.rst(rst)
);
// Instruction decode
instruction_decode decode (
	.clk(clk),
	.IFID(IFID),
	.IFID_PC(IFID_PC),
	.IDEX(IDEX),
	.IDEX_PC(IDEX_PC),
	.IDEX_imme32(IDEX_imme32),
	//.REGISTER_1(REGISTER_1),
	//.REGISTER_2(REGISTER_2),
	.rs1(rs1),
	.rs2(rs2)
);
// Execution
instruction_execution execution (
	.clk(clk),
	.IDEX(IDEX),
	.IDEX_PC(IDEX_PC),
	.REGISTER_1(REGISTER_1),
	.REGISTER_2(REGISTER_2),
	.imme32(IDEX_imme32),
	.Zero(Zero),
	.EXMEM(EXMEM),
	.ALUresult(ALUresult),
	.WRITE_DATA(WRITE_DATA),
	.PCBranch_EXMEM(PCBranch_EXMEM)
);
// Access Memory
instruction_data_mem data_mem (
	.clk(clk),
	.EXMEM(EXMEM),
	.address(ALUresult),
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
// Write Back
instruction_write_back write_back (
	.clk(clk),
	.MEMWB(MEMWB),
	.MEM_DATA(MEM_DATA),
	.ALU_DATA(Pass_ALUresult),
	.WRITE_BACK(WRITE_BACK),
	.RegWrite(RegWrite),
	.rd(rd)
);
// register file
REGISTER regis (
	.clk(clk),
	.rd(rd),
	.rs1(rs1),
	.rs2(rs2),
	.REGISTER_1(REGISTER_1),
	.REGISTER_2(REGISTER_2),
	.RegWrite(RegWrite),
	.WRITE_BACK_DATA(WRITE_BACK),
	.MemToReg(MEMWB[33])
);





endmodule

//
////=======================================================
////  This code is generated by Terasic System Builder
////=======================================================
//
//module Pipeline_Processor(
//
////	//////////// CLOCK //////////
////	input 		          		ADC_CLK_10,
//	input 		          		MAX10_CLK1_50,
////	input 		          		MAX10_CLK2_50,
////
////	//////////// SDRAM //////////
////	output		    [12:0]		DRAM_ADDR,
////	output		     [1:0]		DRAM_BA,
////	output		          		DRAM_CAS_N,
////	output		          		DRAM_CKE,
////	output		          		DRAM_CLK,
////	output		          		DRAM_CS_N,
////	inout 		    [15:0]		DRAM_DQ,
////	output		          		DRAM_LDQM,
////	output		          		DRAM_RAS_N,
////	output		          		DRAM_UDQM,
////	output		          		DRAM_WE_N,
////
////	//////////// SEG7 //////////
//	output		     [7:0]		HEX0,
//	output		     [7:0]		HEX1,
//	output		     [7:0]		HEX2,
//	output		     [7:0]		HEX3,
//	output		     [7:0]		HEX4,
//	output		     [7:0]		HEX5,
////
////	//////////// KEY //////////
//	input 		     [1:0]		KEY,
////
////	//////////// LED //////////
//	output		     [9:0]		LEDR,
////
////	//////////// SW //////////
//	input 		     [9:0]		SW
//	
//	
//	
//	//input
//
//	
//	
//	
//	//output
//	
//	
//);
//
//		wire rst;
//		wire clk;
//		wire start;
//
////declaring pipeline register
//wire [31:0] IFID; // this only stores the instructions
//wire [39:0] IDEX; // this stores 32 bit instructions and 8 bit control signal for later execution, memory and write back
//wire [44:0] EXMEM; // this stores 32 bit instructions and 5 bit control signal for later memory and write back
//wire [33:0] MEMWB; // this stores 32 bit instrucitons and 2 bit control signal for write back
//
//wire PC_select;
//wire [7:0] PCBranch;
//wire [7:0] IFID_PC;
//wire [7:0] IDEX_PC;
//wire [31:0] imme32;
//wire [31:0] REGISTER_1;
//wire [31:0] REGISTER_2;
//wire Zero;
//wire [31:0] ALUresult;
//wire [31:0] WRITE_DATA;
//wire [7:0] PCBranch_EXMEM;
//wire [31:0] Pass_ALUresult;
//wire [31:0] MEM_DATA;
//wire [31:0] ins;
//wire [31:0] WRITE_BACK;
//wire RegWrite;
//wire [31:0] IDEX_imme32;
//wire [4:0] rs1;
//wire [4:0] rs2;
//wire [4:0] rd;
//wire [31:0] writebackdata;
//
//assign start = SW[0];
//assign rst = KEY[0];
//assign clk = MAX10_CLK1_50;
//assign LEDR[0] = IFID_PC;
//assign HEX0 = ALUresult[7:0];
//assign HEX1 = WRITE_DATA;
//assign HEX2 = MEM_DATA;
//assign HEX3 = WRITE_BACK;
//assign HEX4 = REGISTER_1;
//assign HEX5 = REGISTER_2;
// 
//// instantiate the data path
//// Instruction fetch
//instruction_fetch fetch (
//	.clk(clk),
//	.PCSelect(PC_select),
//	.PCBranch(PCBranch),
//	.IDEX(IDEX),
//	.EXMEM(EXMEM),
//	.start(start),
//	.IFID_PC(IFID_PC),
//	.IFID(IFID),
//	.ins(ins),
//	.rst(rst)
//);
//// Instruction decode
//instruction_decode decode (
//	.clk(clk),
//	.IFID(IFID),
//	.IFID_PC(IFID_PC),
//	.IDEX(IDEX),
//	.IDEX_PC(IDEX_PC),
//	.IDEX_imme32(IDEX_imme32),
//	//.REGISTER_1(REGISTER_1),
//	//.REGISTER_2(REGISTER_2),
//	.rs1(rs1),
//	.rs2(rs2)
//);
//// Execution
//instruction_execution execution (
//	.clk(clk),
//	.IDEX(IDEX),
//	.IDEX_PC(IDEX_PC),
//	.REGISTER_1(REGISTER_1),
//	.REGISTER_2(REGISTER_2),
//	.imme32(IDEX_imme32),
//	.Zero(Zero),
//	.EXMEM(EXMEM),
//	.ALUresult(ALUresult),
//	.WRITE_DATA(WRITE_DATA),
//	.PCBranch_EXMEM(PCBranch_EXMEM)
//);
//// Access Memory
//instruction_data_mem data_mem (
//	.clk(clk),
//	.EXMEM(EXMEM),
//	.address(ALUresult),
//	.ALUresult(ALUresult),
//	.Pass_ALUresult(Pass_ALUresult),
//	.WRITE_DATA(WRITE_DATA),
//	.Zero(Zero),
//	.MEMWB(MEMWB),
//	.MEM_DATA(MEM_DATA),
//	.PC_select(PC_select),
//	.PCBranch_EXMEM(PCBranch_EXMEM),
//	.PCBranch(PCBranch)
//);
//// Write Back
//instruction_write_back write_back (
//	.clk(clk),
//	.MEMWB(MEMWB),
//	.MEM_DATA(MEM_DATA),
//	.ALU_DATA(Pass_ALUresult),
//	.WRITE_BACK(WRITE_BACK),
//	.RegWrite(RegWrite),
//	.rd(rd)
//);
//// register file
//REGISTER regis (
//	.clk(clk),
//	.rd(rd),
//	.rs1(rs1),
//	.rs2(rs2),
//	.REGISTER_1(REGISTER_1),
//	.REGISTER_2(REGISTER_2),
//	.RegWrite(RegWrite),
//	.WRITE_BACK_DATA(WRITE_BACK),
//	.MemToReg(MEMWB[33])
//);
//
//
//
//
//endmodule
