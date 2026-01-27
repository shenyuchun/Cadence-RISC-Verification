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
logic carry;
static int up;
function new(input int start,m1,m2);
super.new(start,m1,m2);
up++;
endfunction
function void next();
if(count==max) begin
carry=1;
count=min; end
else begin
carry=0;
count++; end
$display("upcounter next %0d, carry %b", count, carry);
endfunction
static function int number_of();
    return (up);
  endfunction
endclass

class downcounter extends counter;
logic borrow;
static int down;
function new(input int start,m1,m2);
super.new(start,m1,m2);
down++;
endfunction
function void next();
if(count==min) begin
borrow=1;
count=max;
end
else begin
borrow=0;
count--; end
$display("downcounter next %0d, borrow %b", count, borrow);
endfunction
static function int number_of();
    return (down);
  endfunction
endclass
int countval;

upcounter up1 = new(4, 3, 1);  // start outside bounds
downcounter down2 = new(4, 2, 5);  // upper < lower
upcounter up3 = new(2, 3, 0);
downcounter down4 = new(2, 3, 0);


initial
begin

  countval = upcounter::number_of();
  $display("number of upcounters is %d", countval);
  countval = downcounter::number_of();
  $display("number of downcounters is %d", countval);
  up1 = new (0, 5, 0);
  down2 = new(5, 5, 0);
  countval = upcounter::number_of();
  $display("number of upcounters is %d", countval);
  countval = downcounter::number_of();
  $display("number of downcounters is %d", countval);
  up3 = null;
  down4 = null;
  countval = upcounter::number_of();
  $display("number of upcounters is %d", countval);
  countval = downcounter::number_of();
  $display("number of downcounters is %d", countval);
  
    
end
endmodule