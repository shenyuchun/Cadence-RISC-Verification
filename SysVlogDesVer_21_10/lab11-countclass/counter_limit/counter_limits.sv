module counterclas3;

// add counter class here  
class counter; 
int count;
int max,min;
function new(input int start,m1,m2);
check_set(start);
check_limits(m1,m2);
endfunction
function int getcount();
return (count);
endfunction
function void load(int val);
count=val;
endfunction
function void check_limits(input int m1,m2);
if (m1>m2) begin
max=m1;
min=m2;
end
else begin
max=m2;
min=m1;
end
endfunction

function void check_set(input int set);
if((set<min)||(set>max))
count=min;
else 
count=set;
endfunction

endclass


class upcounter extends counter;
function new(input int start,m1,m2);
super.new(start,m1,m2);
endfunction
function void next();
if(count==max)
count=min;
else 
count++;
$display("upcounter next %0d", count);
endfunction
endclass

class downcounter extends counter;
function new(input int start,m1,m2);
super.new(start,m1,m2);
endfunction
function void next();
if(count==min)
count=max;
else
count--;
$display("upcounter next %0d", count);
endfunction
endclass
int countval;

upcounter up1 = new(4, 3, 1);  // start outside bounds
downcounter down2 = new(4, 2, 5);  // upper < lower
upcounter up3 = new(2, 3, 0);
downcounter down4 = new(2, 3, 0);


initial
begin

  up3.next();
  up3.next();
  up3.next();
  down4.next();  
  down4.next();
  down4.next();
  up1.next();
  up1.next();
    
end
endmodule