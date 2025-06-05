module top_module (
    input wire clk,
    input wire reset,
    output wire [3:0] pc_out,
    output wire [15:0] instr_out,
    output wire [7:0] alu_out
);

    // Program Counter
    reg [3:0] pc;
    assign pc_out = pc;

    // Instruction Memory Output
    wire [15:0] instruction;
    assign instr_out = instruction;

    // Register File
    reg [7:0] register_file [0:7];
    wire [2:0] opcode, rd, rs1, rs2;
    wire [7:0] op1, op2;

    // ALU Result
    reg [7:0] alu_result;
    assign alu_out = alu_result;

    // Instruction Decode
    assign opcode = instruction[15:13];
    assign rd     = instruction[12:10];
    assign rs1    = instruction[9:7];
    assign rs2    = instruction[6:4];

    assign op1 = register_file[rs1];
    assign op2 = register_file[rs2];

    // PC Logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 0;
        else
            pc <= pc + 1;
    end

    // Instruction Memory
    instruction_memory imem_inst (
        .pc(pc),
        .instruction(instruction)
    );

    // ALU and Register Writeback
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            alu_result <= 0;
        end else begin
            case (opcode)
                3'b000: alu_result <= op1 + op2;       // ADD
                3'b001: alu_result <= op1 - op2;       // SUB
                3'b010: alu_result <= op1;             // LOAD dummy
                default: alu_result <= 8'd0;
            endcase

            register_file[rd] <= alu_result;
        end
    end

    // Initialize register file
    integer i;
    initial begin
        for (i = 0; i < 8; i = i + 1)
            register_file[i] = i * 2; // 0, 2, 4, ..., 14
    end

endmodule

