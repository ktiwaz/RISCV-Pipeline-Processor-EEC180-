module NOP(
	//input
	input clk,
	input rs1,
	input rs2,
	input opcode,
	input PCSelect,
	input [7:0] PCBranch,
	//output
	output reg [7:0] PC_next
);
//reg for state machine
reg [2:0] state;
reg [2:0] nextstate;
//states for state machine
localparam S1 = 3'b001; // normal fetching instruction state
localparam S2 = 3'b010; // first cycle for inserting NOP
localparam S3 = 3'b100; // second cycle for inserting NOP   // this may be not needed
//instructions types
parameter R_Type = 7'b0110011;
parameter I_Type = 7'b0010011;
parameter Lw = 7'b0000011;
parameter Sw = 7'b0100011;
parameter B_Type = 7'b1100011;
parameter J_Type = 7'b1101111;

// NOP and memory
parameter NOP = 32h'00000000;
reg [31:0] ins; 

// instruction fetch signals
reg [7:0] nextPC;
reg [7:0] PC;

reg [4:0] last_rd;
reg [6:0] last_op;



//instantiate the instruction memory for instruction fetch
instruction_MEM i_MEM (
	.PC(PC_next),
	.clk(clk),
	.instruction(ins)
);

MUX alu_exe_b (
	.a(PCBranch),
	.b(PC),
	.s(PCSelect),
	.out(PC_next)
);



always @ (posedge clk) begin
	state <= nextstate;
	PC <= nextPC;
end


always @ (state) begin
	case(state) 
		S1: begin
			if (opcode == B_Type) begin // since we dont have branch prediction, when branching we wait for the result to fetch the next code.
				nextstate = S2;
				nextPC = PC - 4;
				IFID = NOP;
			end
			else begin
				if (last_op == R_Type | last_op = I_Type) begin // only R_Type and I_Type instruction could result a change to the register value
					if ((opcode == Lw | opcode = I_Type) & rs1 == last_rd) begin // if the instruction is I_type and lw, they only have 1 source register input
						nextstate = S2;
						nextPC = PC -4;
						IFID = NOP;
					end
					else if (rs1 == last_rd | rs2 == last_rd) begin // remaining instruction have 2 source insturction
						nextstate = S2;
						nextPC = PC -4;
						IFID = NOP;
					end
					else begin // no potential data hazards, continue fetching next instruction
						nextstate = S1;
						nextPC = PC + 4;
						IFID = ins;
					end
				end
				else begin // store instruction and branch instruction dont change the register file 
					nextstate = S1;
					nextPC = PC + 4;
					IFID = ins;
				end
			end
		end
		S2: begin // first nop state
			nextstate = S3;
			nextPC = PC + 4;
			IFID = NOP;
		end
//		S3: begin // second nop state, value should be calculated, can fetch the next instruction
//			nextstate = S1;
//			//
//			nextPC = ( PC + 4 )|(PC + 2*imme32);
//		end
	
	endcase
end

endmodule