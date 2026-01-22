import typedefs::*;
timeunit 1ns;
timeprecision 100ps;
`timescale 1ns/100ps
module alu(
    input logic  [7:0] accum, 
    input logic  [7:0] data, 
    input logic clk,
    input  opcode_t   opcode,
    output logic [7:0] out,
    output logic  zero

);
always_comb begin 
    if(!accum==8'b0)
     zero=0;
    else 
     zero=1;
end
always_ff @(negedge clk )
    unique case(opcode)
    ADD: out<=data+accum;
    AND: out<=data&accum;
    XOR: out<= data^accum;
    LDA: out<=data;
    default: out<=accum;
    endcase
endmodule 