///////////////////////////////////////////////////////////////////////////
// (c) Copyright 2013 Cadence Design Systems, Inc. All Rights Reserved.
//
// File name   : counter.sv
// Title       : Simple class
// Project     : SystemVerilog Training
// Created     : 2013-4-8
// Description : Simple counter class
// Notes       :
// 
///////////////////////////////////////////////////////////////////////////

module counterclass;

// add counter class here  
class counter; 
int count;
function int getcount();
return (count);
endfunction
function void load(int val);
count=val;
endfunction
endclass

int countval;

counter c1 = new;


initial
begin

  countval = c1.getcount();
  $display("getcount %0d", countval);
  c1.load(3); 
  countval = c1.getcount();
  $display("getcount %0d", countval);
 
    
end

endmodule
