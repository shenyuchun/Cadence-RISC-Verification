///////////////////////////////////////////////////////////////////////////
// (c) Copyright 2013 Cadence Design Systems, Inc. All Rights Reserved.
//
// File name   : control.sv
// Title       : Control Module
// Project     : SystemVerilog Training
// Created     : 2013-4-8
// Description : Defines the Control module
// Notes       :
// 
///////////////////////////////////////////////////////////////////////////
import typedefs::*;
timeunit 1ns;
timeprecision 100ps;
`timescale 1ns/100ps
// import SystemVerilog package for opcode_t and state_t
module control  (
   
                output logic      load_ac ,
                output logic      mem_rd  ,
                output logic      mem_wr  ,
                output logic      inc_pc  ,
                output logic      load_pc ,
                output logic      load_ir ,
                output logic      halt    ,
                input  opcode_t opcode  , // opcode type name must be opcode_t
                input   logic      zero    ,
                input   logic          clk     ,
                input     logic        rst_   
                );
// SystemVerilog: time units and time precision specification


state_t current_state, next_state;

always_ff @(posedge clk or negedge rst_)
  if (!rst_)
     current_state<=INST_ADDR;
  else
     current_state<=next_state;

always_comb begin 
   unique case(current_state)
   INST_ADDR:  next_state=INST_FETCH;
   INST_FETCH: next_state=INST_LOAD;
   INST_LOAD: next_state=IDLE;
   IDLE: next_state=OP_ADDR;
   OP_ADDR: next_state=OP_FETCH;
   OP_FETCH: next_state=ALU_OP;
   ALU_OP: next_state=STORE;
   STORE: next_state=INST_ADDR;
   endcase
end
logic aluop;
always_comb begin
   
   {mem_rd,load_ir,halt,inc_pc,load_ac,load_pc,mem_wr}=7'b0;
   
   aluop=(opcode== ADD ||opcode== AND ||opcode== XOR || opcode== LDA );
      
   unique case (current_state)
   INST_ADDR:begin 
   end 
   INST_FETCH: begin 
      mem_rd=1'b1;
   end 
   INST_LOAD:begin 
      mem_rd=1'b1;
      load_ir=1'b1;
   end 
   IDLE:begin 
      mem_rd=1'b1;
      load_ir=1'b1;
   end
   OP_ADDR: begin 
      halt= (opcode==HLT);
      inc_pc=1'b1;
   end
   OP_FETCH:begin
   mem_rd=aluop;
   end
   ALU_OP: begin 
   mem_rd=aluop;
   inc_pc= (opcode == SKZ && zero);
   load_ac=aluop;
   load_pc=(opcode == JMP);
   end
   STORE: begin 
   mem_rd=aluop;
   inc_pc=(opcode == JMP);
   load_ac=aluop;
   load_pc=(opcode == JMP);
   mem_wr=(opcode == STO);
   end
   default: begin
      {mem_rd,load_ir,halt,inc_pc,load_ac,load_pc,mem_wr}=7'b0;
   end 
   endcase
end


endmodule
