# Task-3-PIPELINED-PROCESSOR-DESIGN

*COMPANY*: CODTECH IT SOLUTIONS 

*NAME*: Sujal Chavan

*INTERN ID*: CT04DF1863

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*: NEELA SANTOSH

# Description of the Task

In this internship task, I designed and implemented a simple 4-stage pipelined processor using Verilog HDL. The primary objective was to create a functional processor supporting basic arithmetic instructions like ADD, SUB, and memory instruction LOAD. The processor design was modular, consisting of instruction fetch (IF), instruction decode (ID), execute (EX), and write-back (WB) stages, enabling concurrent processing of instructions through pipelining. I also simulated the processor’s operation in ModelSim, analyzing waveforms to verify correct functionality of each stage.

Instruction Format and Pipeline Stages

The instruction format was fixed at 16 bits, divided into opcode and operand fields. The supported opcodes included ADD (for addition), SUB (subtraction), and LOAD (memory access). The instructions encoded register operands for arithmetic operations and a base register for memory load operations.

The processor pipeline consisted of four distinct stages:

Instruction Fetch (IF): The program counter (PC) outputs the address to instruction memory. The instruction memory outputs the instruction corresponding to the PC address. The PC increments every clock cycle, except when reset.

Instruction Decode (ID): The fetched instruction is decoded into opcode and operands. Register file reads source operands based on instruction fields.

Execute (EX): The arithmetic logic unit (ALU) performs the required operation (ADD, SUB) or computes the effective memory address for LOAD.

Write-Back (WB): The result from the ALU or loaded memory data is written back to the register file.

Pipeline registers between these stages hold intermediate data, ensuring the smooth flow of multiple instructions concurrently without data corruption.

Design Implementation Highlights

The instruction memory was implemented using a small Verilog memory array preloaded with sample instructions during initialization. A simple program counter module was created that increments on every clock cycle unless reset. The ALU module was designed to perform addition and subtraction based on opcode inputs.

To handle pipeline hazards and ensure correct data flow, pipeline registers were inserted after each stage. The design prioritized simplicity over complexity like forwarding or hazard detection, which could be extended in future iterations.

A testbench module was created to simulate the entire processor. It provided clock and reset signals and monitored key internal signals such as the program counter, current instruction, and ALU output, which were exposed as outputs for easy waveform observation.

Simulation and Results Discussion

The simulation was performed in ModelSim. After compiling the design files, the simulation was run for a specified time, allowing several instruction cycles to complete.

The waveform analysis showed:

The clock signal toggling consistently, driving all sequential elements.

The reset signal initially active, then deactivated to start normal operation.

The program counter incrementing every cycle, fetching instructions sequentially.

The instruction output (instr_wire) displaying correct 16-bit instruction codes during valid PC cycles, and a default zero value (NOP) after the last instruction to prevent undefined behavior.

The ALU output (alu_wire) showing computed results corresponding to the ADD and SUB instructions as expected.

Some observations included:

Initially, the instruction memory output showed undefined values when PC exceeded the number of preloaded instructions. This was resolved by adding a default zero instruction for all undefined addresses.

The ALU output waveform showed results with a one-cycle delay after instruction decode, reflecting the pipeline stages’ operation.

The reset properly initialized the PC and pipeline registers, ensuring predictable startup behavior.

Conclusion

The task successfully demonstrated the design and simulation of a basic 4-stage pipelined processor supporting fundamental instructions using Verilog. The processor pipeline allowed overlapping execution of instructions, increasing throughput compared to a non-pipelined design. Simulation waveforms verified the correctness of each pipeline stage’s operation and data flow.

This project provided practical experience in digital design, hardware description languages, and the concepts of pipelining in processor architectures. Future enhancements could include implementing hazard detection, branch prediction, and support for additional instructions, making the design closer to a practical CPU.

# OUTPUT

![Image](https://github.com/user-attachments/assets/885e28a8-d7f1-4532-baf5-159e23453dfc)

![Image](https://github.com/user-attachments/assets/645a3165-fc33-4299-8d60-2153b79e8330)

![Image](https://github.com/user-attachments/assets/bbb18128-8933-4144-912b-e318eea008b0)

![Image](https://github.com/user-attachments/assets/ed5a47d8-a35c-4511-8f96-43c8b4f31d83)
