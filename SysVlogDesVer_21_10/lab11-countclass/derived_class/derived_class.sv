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


class upcounter extends counter;
function new(input int start);
 super.new(start);
endfunction
function void next();
count++;
$display("upcounter next %0d", count);
endfunction
endclass

class downcounter extends counter;
function new(input int start);
 super.new(start);
endfunction
function void next();
count--;
$display("upcounter next %0d", count);
endfunction
endclass
int countval;

upcounter up1 = new(4);
downcounter down2 = new(0);


initial
begin

  countval = up1.getcount();
  $display("getcount from up1 constructor %0d", countval);

  up1.next();
  
  countval = down2.getcount();
  $display("getcount from down2 constructor %0d", countval);

  down2.next();  
  down2.next();
 
    
end
endmodule