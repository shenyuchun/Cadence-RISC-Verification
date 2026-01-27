module counterclass2;

// add counter class here  
class counter; 
int count;
function new(input int start=0);
count = start;
endfunction
function int getcount();
return (count);
endfunction
function void load(int val);
count=val;
endfunction

endclass
int countval;

counter c1 = new(6);

initial
begin

  countval = c1.getcount();
  $display("getcount from constructor %0d", countval);
  c1.load(3); 
  countval = c1.getcount();
  $display("getcount from load %0d", countval);
 
    
end
endmodule