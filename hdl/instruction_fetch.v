module instruction_fetch(
	//input
	input rst,
	input clk,
	input PCSelect,
	input [7:0] PCBranch,
	input [39:0] IDEX,
	input [44:0] EXMEM,
	input start,
	//output
	output reg [7:0] IFID_PC,
	output [31:0] ins,
	output reg [31:0] IFID
);
//reg for state machine
reg [2:0] state;
reg [2:0] nextstate;


//states for state machine
localparam S1 = 3'b001; // normal fetching instruction state
localparam S2 = 3'b010; // inserting NOP
localparam S3 = 3'b100; // the start state
localparam S4 = 3'b111; // branch NOP state
// NOP
parameter NOP = 32'h00000000;

//instructions types
parameter R_Type = 7'b0110011;
parameter I_Type = 7'b0010011;
parameter Lw = 7'b0000011;
parameter Sw = 7'b0100011;
parameter B_Type = 7'b1100011;
parameter J_Type = 7'b1101111;


// instruction fetch signals
reg [7:0] nextPC;
reg [7:0] PC;
//instantiate the instruction memory for instruction fetch




 ins_mem i_MEM(
	.address({2'b0,IFID_PC[7:2]}),
	.clock(~clk),
	.data(),
	.wren(1'b0),
	.q(ins)
);

//instruction_MEM i_MEM (
//	.PC(IFID_PC),
//	.clk(clk),
//	.instruction(ins)
//);
always @ (*) begin
	if (PCSelect) begin
		IFID_PC = PCBranch;
	end
	else begin
		IFID_PC = PC;
	end
end




always @ (posedge clk or posedge rst) begin
	if (rst) begin
		state <= S3;
		PC <= 8'b0;
	end
	else begin
		state <= nextstate;
		if (PCSelect) begin
			PC <= IFID_PC;
		end
		else begin
			PC <= nextPC;
		end
	end
end

always @ (*) begin
	case(state) 
		S3: begin
			if (start) begin
				nextstate = S1;
				nextPC = 8'b0;
				IFID = NOP;
			end
			else begin
				nextstate = S3;
				nextPC = 8'b0;
				IFID = NOP;
			end
		end
		S1: begin // logic to check whether is hazard or is the instruction branch
			if  (EXMEM[6:0] == R_Type | EXMEM[6:0] == I_Type | EXMEM[6:0] == Lw) begin 
			// possible hazard from 2 cycles ahead
				if ((ins[6:0] == Lw | ins[6:0] == I_Type) & (ins[19:15] == EXMEM[11:7])) begin
				// for I-type or Lw instructions, should only check register source 1
					nextstate = S1;
					nextPC = PC;
					IFID = NOP;
				end
				
				else if ((ins[6:0] == R_Type | ins[6:0] == Sw | ins[6:0] == B_Type) & (ins[19:15] == EXMEM[11:7] | ins[24:20] == EXMEM[11:7])) begin
					nextstate = S1;
					nextPC = PC;
					IFID = NOP;
				end
				
				
				// for R-type or Sw or Branch instructions, should check both source address: rs1 and rs2
				else if (IDEX[6:0] == R_Type | IDEX[6:0] == I_Type | | IDEX[6:0] == Lw) begin 
				// is there hazard from last instructions
				
					if ((ins[6:0] == Lw | ins[6:0] == I_Type) & (ins[19:15] == IDEX[11:7])) begin
						nextstate = S2;
						nextPC = PC;
						IFID = NOP;
					end
					else if( (ins[6:0] == R_Type | ins[6:0] == Sw | ins[6:0] == B_Type) & (ins[19:15] == IDEX[11:7] | ins[24:20] == IDEX[11:7])) begin
						nextstate = S2;
						nextPC = PC;
						IFID = NOP;
					end
					
					else if (ins[6:0] == B_Type) begin // no hazard? is it a branch
						nextstate = S2;
						nextPC = PC;
						IFID = ins;
					end
					
					else begin
						nextstate = S1;
						nextPC = PC + 8'b00000100;
						IFID = ins;
					end
				end
				
				
				else if (ins[6:0] == B_Type) begin 
				// no hazard? is it a branch
					nextstate = S2;
					nextPC = PC;
					IFID = ins;
				end
				
				
				else begin
				// if there is no hazard or branch increment the PC and push the current instruction to IFID register
					nextstate = S1;
					nextPC = PC + 8'b00000100; // nextPC = PC + 4
					IFID = ins;
				end
			end
			else if (IDEX[6:0] == R_Type | IDEX[6:0] == I_Type | | IDEX[6:0] == Lw) begin 
			// possible hazard from 1 cycles ahead
				if ((ins[6:0] == Lw | ins[6:0] == I_Type) & (ins[19:15] == IDEX[11:7])) begin
				// for I-type or Lw instructions, should only check register source 1
					nextstate = S2;
					nextPC = PC;
					IFID = NOP;
				end
				else if ( (ins[6:0] == R_Type | ins [6:0] == Sw | ins[6:0] == B_Type) & (ins[19:15] == IDEX[11:7] | ins[24:20] == IDEX[11:7])) begin
				// for R-type or Sw or Branch instructions, should check both source address: rs1 and rs2
					nextstate = S2;
					nextPC = PC;
					IFID = NOP;
				end
				
				else if (ins[6:0] == B_Type) begin 
				// no hazard? is it a branch
					nextstate = S2;
					nextPC = PC;
					IFID = ins;
				end				
				
				else begin
				// if there is no hazard or branch increment the PC and push the current instruction to IFID register
					nextstate = S1;
					nextPC = PC + 8'b00000100;
					IFID = ins;
				end
			end		
			else if (ins[6:0] == B_Type) begin // no hazard? is it a branch
				nextstate = S2;
				nextPC = PC;
				IFID = ins;
			end
			
			else begin //nothing
				nextstate = S1;
				nextPC = PC + 8'b00000100;
				IFID = ins;
			end

		end
		
		S2: begin // second NOPs 
			
			if (IDEX[6:0] == B_Type) begin
				nextstate = S4;
			end
			else begin
				nextstate = S1;
			end
			
			nextPC = PC;
			IFID = NOP;
		end
		
		S4: begin // additional Branch NOPs
			nextstate = S1;
			nextPC = PC + 8'b00000100;
			IFID = NOP;
		end
		

	
	endcase
end

endmodule