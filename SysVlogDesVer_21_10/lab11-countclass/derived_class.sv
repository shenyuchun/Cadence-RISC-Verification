module counterclas3;

// add counter class here  
class counter; 
int count;
function new(input int start);
count = start;
endfunction
function int getcount();
return (count);
endfunction
function void load(int val);
count=val;
endfunction

endclass


class upcounter extend counter;
function new(input int start);
super.new(start);
endfunction
function void next();
count++;
$display("upcounter next %0d", count);
endfunction
endclass

class downcounter extend counter;
function new(input int start);
super.new(start);
endfunction
function void next();
count--;
$display("upcounter next %0d", count);
endfunction
endclass
endmodule