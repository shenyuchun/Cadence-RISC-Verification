interface mem_intf (input logic clk);
timeunit 1ns;
timeprecision 100ps;
  logic [7:0] data_in;
  logic [7:0] data_out;
  logic [4:0] addr;
  logic read;
  logic write;
    task mem_write(
  input logic [4:0] waddr,
  input logic [7:0] wdata,
  input bit debug=0
);
@(negedge clk);
addr=waddr;
data_in=wdata;
write=1;
read=0;

@(negedge clk);
write=0;
if(debug)
  $display("Write Address: %h  Data: %h", addr, data_in);
endtask
task mem_read(
  input logic [4:0] raddr,
  output logic [7:0] rdata,
  input bit debug=0
);
@(negedge clk);
read=1;
write=0;
addr=raddr;
@(negedge clk);
rdata=data_out;
read=0;
if(debug)
  $display("READ Address: %h  Data: %h", addr, rdata);
endtask
  modport test (
    input data_out, clk,
    output read, write, addr, data_in,
    import  mem_write,
    import  mem_read
  );

  modport mem (
    input read, write, addr, data_in,clk,
    output data_out
  );

endinterface: mem_intf