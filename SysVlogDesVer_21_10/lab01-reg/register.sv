module register(
output logic [7:0]   out,
input  logic [7:0]   data,
input  logic         enable,
input logic        rst_,
input logic         clk 

);
timeunit 1ns;
timeprecision 100ps;
always_ff@(posedge clk, negedge rst_) begin
    if(!rst_) begin
        out<=8'b0;
    end 
    else if (enable) begin
        out<=data;
    end
end
endmodule