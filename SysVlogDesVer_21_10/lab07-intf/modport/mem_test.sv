///////////////////////////////////////////////////////////////////////////
// (c) Copyright 2013 Cadence Design Systems, Inc. All Rights Reserved.
//
// File name   : mem_test.sv
// Title       : Memory Testbench Module
// Project     : SystemVerilog Training
// Created     : 2013-4-8
// Description : Defines the Memory testbench module
// Notes       :
// 
///////////////////////////////////////////////////////////////////////////

module mem_test ( 
                  mem_intf.test intf_inst
                );
// SYSTEMVERILOG: timeunit and timeprecision specification
timeunit 1ns;
timeprecision 1ns;

// SYSTEMVERILOG: new data types - bit ,logic
bit         debug = 1;
logic [7:0] rdata;      // stores data read from memory for checking

// Monitor Results
  initial begin
      $timeformat ( -9, 0, " ns", 9 );
// SYSTEMVERILOG: Time Literals
      #40000ns $display ( "MEMORY TEST TIMEOUT" );
      $finish;
    end

initial
  begin: memtest
  int error_status;

    $display("Clear Memory Test");
    error_status=0;
    for (int i = 0; i< 32; i++)
       // Write zero data to every address location
    mem_write(.waddr(i),.wdata(8'h00),.debug(debug));
    for (int i = 0; i<32; i++)
      begin 
       // Read every address location
     mem_read(.raddr(i),.rdata(rdata),.debug(debug));
       // check each memory location for data = 'h00
      if (rdata !== 8'h00)begin
        error_status++;
        $display("Error at addr %d expect %d got %h", i,i,rdata);
      end
      end
   // print results of test
    printstatus(error_status);
    $display("Data = Address Test");
    error_status=0;

    for (int i = 0; i< 32; i++)
       // Write data = address to every address location
      mem_write(.waddr(i),.wdata(i),.debug(debug));
    for (int i = 0; i<32; i++)
      begin
       // Read every address location
      mem_read(.raddr(i),.rdata(rdata),.debug(debug));
       // check each memory location for data = address
      if (rdata !== i)begin
        error_status++;
        $display("Error at addr %d expect %d got %h", i,i,rdata);
      end
      end

   // print results of test
    printstatus(error_status);
    $finish;
  end

// add read_mem and write_mem tasks
task mem_write(
  input logic [4:0] waddr,
  input logic [7:0] wdata,
  input bit debug=0
);
@(negedge intf_inst.clk);
intf_inst.addr=waddr;
intf_inst.data_in=wdata;
intf_inst.write=1;
intf_inst.read=0;

@(negedge intf_inst.clk);
intf_inst.write=0;
if(debug)
  $display("Write Address: %h  Data: %h", intf_inst.addr, intf_inst.data_in);
endtask
task mem_read(
  input logic [4:0] raddr,
  output logic [7:0] rdata,
  input bit debug=0
);
@(negedge intf_inst.clk);
intf_inst.read=1;
intf_inst.write=0;
intf_inst.addr=raddr;
@(negedge intf_inst.clk);
rdata=intf_inst.data_out;
intf_inst.read=0;
if(debug)
  $display("READ Address: %h  Data: %h", intf_inst.addr, rdata);
endtask
// add result print function
function void printstatus(input int status);
if (status==0)
  $display("Test PASSED");
else
  $display("Test ERROR with %0d errors",status);
endfunction

endmodule

