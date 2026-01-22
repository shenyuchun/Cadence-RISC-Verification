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
endmodule