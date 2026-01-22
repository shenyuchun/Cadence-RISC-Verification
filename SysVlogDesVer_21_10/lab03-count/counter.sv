module counter (

    input logic [4:0] data,
    output logic [4:0] count,
    input logic load,
    input logic enable,
    input logic clk,
    input logic rst_
);
timeunit 1ns;
timeprecision 100ps;
always_ff@(posedge clk)
if (!rst_) begin 
    count<=5'b0;
end 
    else if (load)begin 
        count<=data;
    end 
    else if (enable) begin 
        count+=1;
    end 
endmodule