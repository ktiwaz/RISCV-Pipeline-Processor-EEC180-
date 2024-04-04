module tb_Pipeline_Processor;

reg rst;
reg clk;
reg start;

Pipeline_Processor UUT (
	.rst(rst),
	.clk(clk),
	.start(start)
);

initial begin 

//Instruction
//	// add x3, x1, x2

//	UUT.fetch.i_MEM.i_MEM[0] = 8'b00000000;
//	UUT.fetch.i_MEM.i_MEM[1] = 8'b00100000;
//	UUT.fetch.i_MEM.i_MEM[2] = 8'b10000001;
//	UUT.fetch.i_MEM.i_MEM[3] = 8'b10110011;

//	// beq x1, x2, offset(6) PC = PC + 12 = 0 + 12 = 12
//	UUT.fetch.i_MEM.i_MEM[4] = 8'b00000000;
//	UUT.fetch.i_MEM.i_MEM[5] = 8'b00100000;
//	UUT.fetch.i_MEM.i_MEM[6] = 8'b10000100;
//	UUT.fetch.i_MEM.i_MEM[7] = 8'b01100011;

//	//addi x5, x4, 2
//	UUT.fetch.i_MEM.i_MEM[4] = 8'b00000000;
//	UUT.fetch.i_MEM.i_MEM[5] = 8'b00100001;
//	UUT.fetch.i_MEM.i_MEM[6] = 8'b10000010;
//	UUT.fetch.i_MEM.i_MEM[7] = 8'b10010011;

//	//sw 0000000 rs6 rs1 (010) 00010 (0100011)    0 0 000000 0001 = 1s
//	UUT.fetch.i_MEM.i_MEM[8] = 8'b00000000;
//	UUT.fetch.i_MEM.i_MEM[9] = 8'b01100000;
//	UUT.fetch.i_MEM.i_MEM[10] = 8'b10100000;
//	UUT.fetch.i_MEM.i_MEM[11] = 8'b10100011;

//	//lw x7, (0)x1
//	UUT.fetch.i_MEM.i_MEM[12] = 8'b00000000;
//	UUT.fetch.i_MEM.i_MEM[13] = 8'b00000000;
//	UUT.fetch.i_MEM.i_MEM[14] = 8'b10100011;
//	UUT.fetch.i_MEM.i_MEM[15] = 8'b10000011;

//	//	beq x1, x2, offset, PC is 16 we want to back to 8, offset is -4, 4 is 000000000100, -4 is 1 1 111111 1100 
//	UUT.fetch.i_MEM.i_MEM[16] = 8'b11111110;
//	UUT.fetch.i_MEM.i_MEM[17] = 8'b00100000;
//	UUT.fetch.i_MEM.i_MEM[18] = 8'b10001100;
//	UUT.fetch.i_MEM.i_MEM[19] = 8'b11100011;

//	//Register
//	UUT.data_mem.PC_select = 1'b0;
//	UUT.data_mem.d_mem.d_MEM[1] = 32'h000000FF;
//	UUT.regis.REGISTER[1] = 32'h00000001;
//	UUT.regis.REGISTER[2] = 32'h00000001;
//	UUT.regis.REGISTER[4] = 32'h00000010;
//	UUT.regis.REGISTER[6] = 32'h00000010;
//	//0x00042503		lw x10 0(x8)
//	UUT.fetch.i_MEM.i_MEM[32] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[33] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[34] = 8'h25;
//	UUT.fetch.i_MEM.i_MEM[35] = 8'h03;



//instruction mem
//0x00300113		addi x2 x0 3     
	UUT.fetch.i_MEM.i_MEM[0] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[1] = 8'h30;
	UUT.fetch.i_MEM.i_MEM[2] = 8'h01;
	UUT.fetch.i_MEM.i_MEM[3] = 8'h13;
//0x00040413		addi x8 x8 0     
	UUT.fetch.i_MEM.i_MEM[4] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[5] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[6] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[7] = 8'h13;
//0x02448493		addi x9 x9 36    
	UUT.fetch.i_MEM.i_MEM[8] = 8'h02;
	UUT.fetch.i_MEM.i_MEM[9] = 8'h44;
	UUT.fetch.i_MEM.i_MEM[10] = 8'h84;
	UUT.fetch.i_MEM.i_MEM[11] = 8'h93;
//0x080A0A13		addi x20 x20 128  
	UUT.fetch.i_MEM.i_MEM[12] = 8'h08;
	UUT.fetch.i_MEM.i_MEM[13] = 8'h0A;
	UUT.fetch.i_MEM.i_MEM[14] = 8'h0A;
	UUT.fetch.i_MEM.i_MEM[15] = 8'h13;
//0x000002B3		add x5 x0 x0      
	UUT.fetch.i_MEM.i_MEM[16] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[17] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[18] = 8'h02;
	UUT.fetch.i_MEM.i_MEM[19] = 8'hB3;
//0x00000333		add x6 x0 x0      
	UUT.fetch.i_MEM.i_MEM[20] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[21] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[22] = 8'h03;
	UUT.fetch.i_MEM.i_MEM[23] = 8'h33;
//0x000003B3		add x7 x0 x0		
	UUT.fetch.i_MEM.i_MEM[24] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[25] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[26] = 8'h03;
	UUT.fetch.i_MEM.i_MEM[27] = 8'hB3;
//0x00000E33		add x28 x0 x0	
	UUT.fetch.i_MEM.i_MEM[28] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[29] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[30] = 8'h0E;
	UUT.fetch.i_MEM.i_MEM[31] = 8'h33;
//0x00042503		lw x10 0(x8)       
	UUT.fetch.i_MEM.i_MEM[32] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[33] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[34] = 8'h25;
	UUT.fetch.i_MEM.i_MEM[35] = 8'h03;
//0x0004A583		lw x11 0(x9)       
	UUT.fetch.i_MEM.i_MEM[36] = 8'h00; 
	UUT.fetch.i_MEM.i_MEM[37] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[38] = 8'hA5;
	UUT.fetch.i_MEM.i_MEM[39] = 8'h83;
//0x00138393        addi x7 x7 1     
	UUT.fetch.i_MEM.i_MEM[40] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[41] = 8'h13;
	UUT.fetch.i_MEM.i_MEM[42] = 8'h83;
	UUT.fetch.i_MEM.i_MEM[43] = 8'h93;
//0x00440413        addi x8 x8 4    
	UUT.fetch.i_MEM.i_MEM[44] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[45] = 8'h44;
	UUT.fetch.i_MEM.i_MEM[46] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[47] = 8'h13;
//0x02B50533        mul x10 x10 x11	
	UUT.fetch.i_MEM.i_MEM[48] = 8'h02;
	UUT.fetch.i_MEM.i_MEM[49] = 8'hB5;
	UUT.fetch.i_MEM.i_MEM[50] = 8'h05;
	UUT.fetch.i_MEM.i_MEM[51] = 8'h33;
//0x00C48493		addi x9 x9 12	
	UUT.fetch.i_MEM.i_MEM[52] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[53] = 8'hC4;
	UUT.fetch.i_MEM.i_MEM[54] = 8'h84;
	UUT.fetch.i_MEM.i_MEM[55] = 8'h93;
//0x00AE0E33        add x28 x28 x10  
	UUT.fetch.i_MEM.i_MEM[56] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[57] = 8'hAE;
	UUT.fetch.i_MEM.i_MEM[58] = 8'h0E;
	UUT.fetch.i_MEM.i_MEM[59] = 8'h33;
//0xFE2392E3		bne x7 x2 -28       
	UUT.fetch.i_MEM.i_MEM[60] = 8'hFE;
	UUT.fetch.i_MEM.i_MEM[61] = 8'h23;
	UUT.fetch.i_MEM.i_MEM[62] = 8'h92;
	UUT.fetch.i_MEM.i_MEM[63] = 8'hE3;
//0x01CA2023		sw x28 0(x20)
	UUT.fetch.i_MEM.i_MEM[64] = 8'h01;
	UUT.fetch.i_MEM.i_MEM[65] = 8'hCA;
	UUT.fetch.i_MEM.i_MEM[66] = 8'h20;
	UUT.fetch.i_MEM.i_MEM[67] = 8'h23;
//0x004A0A13		addi x20 x20 4
	UUT.fetch.i_MEM.i_MEM[68] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[69] = 8'h4A;
	UUT.fetch.i_MEM.i_MEM[70] = 8'h0A;
	UUT.fetch.i_MEM.i_MEM[71] = 8'h13;
//0x00130313        addi x6 x6 1
	UUT.fetch.i_MEM.i_MEM[72] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[73] = 8'h13;
	UUT.fetch.i_MEM.i_MEM[74] = 8'h03;
	UUT.fetch.i_MEM.i_MEM[75] = 8'h13;
//0xFF440413        addi x8 x8 -12
	UUT.fetch.i_MEM.i_MEM[76] = 8'hFF;
	UUT.fetch.i_MEM.i_MEM[77] = 8'h44;
	UUT.fetch.i_MEM.i_MEM[78] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[79] = 8'h13;
//0xFE048493        addi x9 x9 -32
	UUT.fetch.i_MEM.i_MEM[80] = 8'hFE;
	UUT.fetch.i_MEM.i_MEM[81] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[82] = 8'h84;
	UUT.fetch.i_MEM.i_MEM[83] = 8'h93;
//0xFC2312E3        bne x6 x2 -60
	UUT.fetch.i_MEM.i_MEM[84] = 8'hFC;
	UUT.fetch.i_MEM.i_MEM[85] = 8'h23;
	UUT.fetch.i_MEM.i_MEM[86] = 8'h12;
	UUT.fetch.i_MEM.i_MEM[87] = 8'hE3;
//0x00128293		addi x5 x5 1
	UUT.fetch.i_MEM.i_MEM[88] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[89] = 8'h12;
	UUT.fetch.i_MEM.i_MEM[90] = 8'h82;
	UUT.fetch.i_MEM.i_MEM[91] = 8'h93;
//0x00C40413		addi x8 x8 12
	UUT.fetch.i_MEM.i_MEM[92] = 8'h00;
	UUT.fetch.i_MEM.i_MEM[93] = 8'hC4;
	UUT.fetch.i_MEM.i_MEM[94] = 8'h04;
	UUT.fetch.i_MEM.i_MEM[95] = 8'h13;
//0xFF448493		addi x9 x9 -12
	UUT.fetch.i_MEM.i_MEM[96] = 8'hFF;
	UUT.fetch.i_MEM.i_MEM[97] = 8'h44;
	UUT.fetch.i_MEM.i_MEM[98] = 8'h84;
	UUT.fetch.i_MEM.i_MEM[99] = 8'h93;
//0xFA2298E3        bne x5 x2 -80    
	UUT.fetch.i_MEM.i_MEM[100] = 8'hFA;
	UUT.fetch.i_MEM.i_MEM[101] = 8'h22;
	UUT.fetch.i_MEM.i_MEM[102] = 8'h98;
	UUT.fetch.i_MEM.i_MEM[103] = 8'hE3;





////instruction mem
////0x00300113		addi x2 x0 3     
//	UUT.fetch.i_MEM.i_MEM[0] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[1] = 8'h30;
//	UUT.fetch.i_MEM.i_MEM[2] = 8'h01;
//	UUT.fetch.i_MEM.i_MEM[3] = 8'h13;
////0x00040413		addi x8 x8 0            
//	UUT.fetch.i_MEM.i_MEM[4] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[5] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[6] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[7] = 8'h13;
////0x02448493		addi x9 x9 36           
//	UUT.fetch.i_MEM.i_MEM[8] = 8'h02;
//	UUT.fetch.i_MEM.i_MEM[9] = 8'h44;
//	UUT.fetch.i_MEM.i_MEM[10] = 8'h84;
//	UUT.fetch.i_MEM.i_MEM[11] = 8'h93;
////0x080A0A13		addi x20 x20 128
//	UUT.fetch.i_MEM.i_MEM[12] = 8'h08;
//	UUT.fetch.i_MEM.i_MEM[13] = 8'h0A;
//	UUT.fetch.i_MEM.i_MEM[14] = 8'h0A;
//	UUT.fetch.i_MEM.i_MEM[15] = 8'h13;
////0x000002B3		add x5 x0 x0
//	UUT.fetch.i_MEM.i_MEM[16] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[17] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[18] = 8'h02;
//	UUT.fetch.i_MEM.i_MEM[19] = 8'hB3;
////0x00000333		add x6 x0 x0       
//	UUT.fetch.i_MEM.i_MEM[20] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[21] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[22] = 8'h03;
//	UUT.fetch.i_MEM.i_MEM[23] = 8'h33;
////0x000003B3		add x7 x0 x0
//	UUT.fetch.i_MEM.i_MEM[24] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[25] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[26] = 8'h03;
//	UUT.fetch.i_MEM.i_MEM[27] = 8'hB3;
////0x00000E33		add x28 x0 x0
//	UUT.fetch.i_MEM.i_MEM[28] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[29] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[30] = 8'h0E;
//	UUT.fetch.i_MEM.i_MEM[31] = 8'h33;
////0x00042503		lw x10 0(x8)       
//	UUT.fetch.i_MEM.i_MEM[32] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[33] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[34] = 8'h25;
//	UUT.fetch.i_MEM.i_MEM[35] = 8'h03;
////0x0004A583		lw x11 0(x9)            
//	UUT.fetch.i_MEM.i_MEM[36] = 8'h00; 
//	UUT.fetch.i_MEM.i_MEM[37] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[38] = 8'hA5;
//	UUT.fetch.i_MEM.i_MEM[39] = 8'h83;
////0x02B50533		mul x10 x10 x11    
//	UUT.fetch.i_MEM.i_MEM[40] = 8'h02;
//	UUT.fetch.i_MEM.i_MEM[41] = 8'hB5;
//	UUT.fetch.i_MEM.i_MEM[42] = 8'h05;
//	UUT.fetch.i_MEM.i_MEM[43] = 8'h33;
////0x00AE0E33		add x28 x28 x10
//	UUT.fetch.i_MEM.i_MEM[44] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[45] = 8'hAE;
//	UUT.fetch.i_MEM.i_MEM[46] = 8'h0E;
//	UUT.fetch.i_MEM.i_MEM[47] = 8'h33;
////0x00440413		addi x8 x8 4
//	UUT.fetch.i_MEM.i_MEM[48] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[49] = 8'h44;
//	UUT.fetch.i_MEM.i_MEM[50] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[51] = 8'h13;
////0x00C48493		addi x9 x9 12
//	UUT.fetch.i_MEM.i_MEM[52] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[53] = 8'hC4;
//	UUT.fetch.i_MEM.i_MEM[54] = 8'h84;
//	UUT.fetch.i_MEM.i_MEM[55] = 8'h93;
////0x00138393		addi x7 x7 1       
//	UUT.fetch.i_MEM.i_MEM[56] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[57] = 8'h13;
//	UUT.fetch.i_MEM.i_MEM[58] = 8'h83;
//	UUT.fetch.i_MEM.i_MEM[59] = 8'h93;
////0xFE2392E3		bne x7 x2 -28     
//	UUT.fetch.i_MEM.i_MEM[60] = 8'hFE;
//	UUT.fetch.i_MEM.i_MEM[61] = 8'h23;
//	UUT.fetch.i_MEM.i_MEM[62] = 8'h92;
//	UUT.fetch.i_MEM.i_MEM[63] = 8'hE3;
////0x01CA2023		sw x28 0(x20)
//	UUT.fetch.i_MEM.i_MEM[64] = 8'h01;
//	UUT.fetch.i_MEM.i_MEM[65] = 8'hCA;
//	UUT.fetch.i_MEM.i_MEM[66] = 8'h20;
//	UUT.fetch.i_MEM.i_MEM[67] = 8'h23;
////0x004A0A13		addi x20 x20 4
//	UUT.fetch.i_MEM.i_MEM[68] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[69] = 8'h4A;
//	UUT.fetch.i_MEM.i_MEM[70] = 8'h0A;
//	UUT.fetch.i_MEM.i_MEM[71] = 8'h13;
////0xFF440413		addi x8 x8 -12
//	UUT.fetch.i_MEM.i_MEM[72] = 8'hFF;
//	UUT.fetch.i_MEM.i_MEM[73] = 8'h44;
//	UUT.fetch.i_MEM.i_MEM[74] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[75] = 8'h13;
////0xFDC48493		addi x9 x9 -36
//	UUT.fetch.i_MEM.i_MEM[76] = 8'hFD;
//	UUT.fetch.i_MEM.i_MEM[77] = 8'hC4;
//	UUT.fetch.i_MEM.i_MEM[78] = 8'h84;
//	UUT.fetch.i_MEM.i_MEM[79] = 8'h93;
////0x00448493		addi x9 x9 4
//	UUT.fetch.i_MEM.i_MEM[80] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[81] = 8'h44;
//	UUT.fetch.i_MEM.i_MEM[82] = 8'h84;
//	UUT.fetch.i_MEM.i_MEM[83] = 8'h93;
////0x00130313		addi x6 x6 1      
//	UUT.fetch.i_MEM.i_MEM[84] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[85] = 8'h13;
//	UUT.fetch.i_MEM.i_MEM[86] = 8'h03;
//	UUT.fetch.i_MEM.i_MEM[87] = 8'h13;
////0xFC2310E3		bne x6 x2 -64
//	UUT.fetch.i_MEM.i_MEM[88] = 8'hFC;
//	UUT.fetch.i_MEM.i_MEM[89] = 8'h23;
//	UUT.fetch.i_MEM.i_MEM[90] = 8'h10;
//	UUT.fetch.i_MEM.i_MEM[91] = 8'hE3;
////0x00C40413		addi x8 x8 12
//	UUT.fetch.i_MEM.i_MEM[92] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[93] = 8'hC4;
//	UUT.fetch.i_MEM.i_MEM[94] = 8'h04;
//	UUT.fetch.i_MEM.i_MEM[95] = 8'h13;
////0xFF448493		addi x9 x9 -12
//	UUT.fetch.i_MEM.i_MEM[96] = 8'hFF;
//	UUT.fetch.i_MEM.i_MEM[97] = 8'h44;
//	UUT.fetch.i_MEM.i_MEM[98] = 8'h84;
//	UUT.fetch.i_MEM.i_MEM[99] = 8'h93;
////0x00128293		addi x5 x5 1
//	UUT.fetch.i_MEM.i_MEM[100] = 8'h00;
//	UUT.fetch.i_MEM.i_MEM[101] = 8'h12;
//	UUT.fetch.i_MEM.i_MEM[102] = 8'h82;
//	UUT.fetch.i_MEM.i_MEM[103] = 8'h93;
////0xFA2296E3		bne x5 x2 -84       
//	UUT.fetch.i_MEM.i_MEM[104] = 8'hFA;
//	UUT.fetch.i_MEM.i_MEM[105] = 8'h22;
//	UUT.fetch.i_MEM.i_MEM[106] = 8'h96;
//	UUT.fetch.i_MEM.i_MEM[107] = 8'hE3;

//data mem
	// matrix 1
//	UUT.data_mem.d_mem.d_MEM[0] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[4] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[8] = 32'h00000001;
//	
//	UUT.data_mem.d_mem.d_MEM[12] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[16] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[20] = 32'h00000001;
//	
//	UUT.data_mem.d_mem.d_MEM[24] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[28] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[32] = 32'h00000001;
//
//	// matrix 2
//	UUT.data_mem.d_mem.d_MEM[36] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[40] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[44] = 32'h00000001;
//	
//	UUT.data_mem.d_mem.d_MEM[48] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[52] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[56] = 32'h00000001;
//	
//	UUT.data_mem.d_mem.d_MEM[60] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[64] = 32'h00000001;
//	UUT.data_mem.d_mem.d_MEM[68] = 32'h00000001;
	
	
		// matrix 1
	UUT.data_mem.d_mem.d_MEM[0] = 32'h00000002;
	UUT.data_mem.d_mem.d_MEM[4] = 32'h00000001;
	UUT.data_mem.d_mem.d_MEM[8] = 32'h00000004;
	
	UUT.data_mem.d_mem.d_MEM[12] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[16] = 32'h00000002;
	UUT.data_mem.d_mem.d_MEM[20] = 32'h00000004;
	
	UUT.data_mem.d_mem.d_MEM[24] = 32'h00000003;
	UUT.data_mem.d_mem.d_MEM[28] = 32'h00000001;
	UUT.data_mem.d_mem.d_MEM[32] = 32'h00000001;

	// matrix 2
	UUT.data_mem.d_mem.d_MEM[36] = 32'h00000005;
	UUT.data_mem.d_mem.d_MEM[40] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[44] = 32'h00000000;
	
	UUT.data_mem.d_mem.d_MEM[48] = 32'h00000001;
	UUT.data_mem.d_mem.d_MEM[52] = 32'h00000001;
	UUT.data_mem.d_mem.d_MEM[56] = 32'h00000002;
	
	UUT.data_mem.d_mem.d_MEM[60] = 32'h00000003;
	UUT.data_mem.d_mem.d_MEM[64] = 32'h00000004;
	UUT.data_mem.d_mem.d_MEM[68] = 32'h00000002;
	
	//data mem initial
	UUT.data_mem.d_mem.d_MEM[128] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[132] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[136] = 32'h00000000;
				
	UUT.data_mem.d_mem.d_MEM[140] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[144] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[148] = 32'h00000000;
				
	UUT.data_mem.d_mem.d_MEM[152] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[156] = 32'h00000000;
	UUT.data_mem.d_mem.d_MEM[160] = 32'h00000000;
	//register file initial
	UUT.regis.REGISTER[0] = 32'h00000000;
	UUT.regis.REGISTER[1] = 32'h00000000;
	UUT.regis.REGISTER[2] = 32'h00000000;
	UUT.regis.REGISTER[3] = 32'h00000000;
	UUT.regis.REGISTER[4] = 32'h00000000;
	UUT.regis.REGISTER[5] = 32'h00000000;
	UUT.regis.REGISTER[6] = 32'h00000000;
	UUT.regis.REGISTER[7] = 32'h00000000;
	UUT.regis.REGISTER[8] = 32'h00000000;
	UUT.regis.REGISTER[9] = 32'h00000000;
	UUT.regis.REGISTER[10] = 32'h00000000;
	UUT.regis.REGISTER[11] = 32'h00000000;
	UUT.regis.REGISTER[12] = 32'h00000000;
	UUT.regis.REGISTER[13] = 32'h00000000;
	UUT.regis.REGISTER[14] = 32'h00000000;
	UUT.regis.REGISTER[15] = 32'h00000000;
	UUT.regis.REGISTER[16] = 32'h00000000;
	UUT.regis.REGISTER[17] = 32'h00000000;
	UUT.regis.REGISTER[18] = 32'h00000000;
	UUT.regis.REGISTER[19] = 32'h00000000;
	UUT.regis.REGISTER[20] = 32'h00000000;
	UUT.regis.REGISTER[21] = 32'h00000000;
	UUT.regis.REGISTER[22] = 32'h00000000;
	UUT.regis.REGISTER[23] = 32'h00000000;
	UUT.regis.REGISTER[24] = 32'h00000000;
	UUT.regis.REGISTER[25] = 32'h00000000;
	UUT.regis.REGISTER[26] = 32'h00000000;
	UUT.regis.REGISTER[27] = 32'h00000000;
	UUT.regis.REGISTER[28] = 32'h00000000;
	UUT.regis.REGISTER[29] = 32'h00000000;
	UUT.regis.REGISTER[30] = 32'h00000000;
	UUT.regis.REGISTER[31] = 32'h00000000;
	// clock
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin	
	rst = 1'b1;
	#20;	
	rst = 1'b0;
	#20;
	start = 1'b0;

	#20;
	start = 1'b1;

	$display("Input matrix 1 :");
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[0],
				UUT.data_mem.d_mem.d_MEM[4],
				UUT.data_mem.d_mem.d_MEM[8]
	);
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[12],
				UUT.data_mem.d_mem.d_MEM[16],
				UUT.data_mem.d_mem.d_MEM[20]
	);
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[24],
				UUT.data_mem.d_mem.d_MEM[28],
				UUT.data_mem.d_mem.d_MEM[32]
	);
	$display("Input matrix 2 :");
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[36],
				UUT.data_mem.d_mem.d_MEM[40],
				UUT.data_mem.d_mem.d_MEM[44]
	);
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[48],
				UUT.data_mem.d_mem.d_MEM[52],
				UUT.data_mem.d_mem.d_MEM[56]
	);
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[60],
				UUT.data_mem.d_mem.d_MEM[64],
				UUT.data_mem.d_mem.d_MEM[68]
	);
	// matrix 2
	#8580;
	$display("The answer is :");
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[128],
				UUT.data_mem.d_mem.d_MEM[132],
				UUT.data_mem.d_mem.d_MEM[136]
	);
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[140],
				UUT.data_mem.d_mem.d_MEM[144],
				UUT.data_mem.d_mem.d_MEM[148]
	);
	$display("   %d   %d   %d",
				UUT.data_mem.d_mem.d_MEM[152],
				UUT.data_mem.d_mem.d_MEM[156],
				UUT.data_mem.d_mem.d_MEM[160]
	);
end
endmodule