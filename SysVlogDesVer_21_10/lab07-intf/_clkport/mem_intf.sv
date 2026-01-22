interface mem_intf (input logic clk);
timeunit 1ns;
timeprecision 1ns;
  logic [7:0] data_in;
  logic [7:0] data_out;
  logic [4:0] addr;
  logic read;
  logic write;
 
endinterface: mem_intf