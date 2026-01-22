interface mem_intf (input logic clk);
timeunit 1ns;
timeprecision 100ps;
  logic [7:0] data_in;
  logic [7:0] data_out;
  logic [4:0] addr;
  logic read;
  logic write;
  modport test (
    input data_out, clk,
    output read, write, addr, data_in,
    
  );
  modport mem (
    input read, write, addr, data_in,clk,
    output data_out
  );
endinterface: mem_intf