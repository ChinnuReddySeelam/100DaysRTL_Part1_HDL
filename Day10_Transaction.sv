class transaction;
rand bit [3:0] A, B;
rand bit m;
bit [4:0] result;
constraint CA{A>7;}
constraint CB{B>2;
B<15;}
constraint Cm{m dist{0:/50,1/50}; }
function void display (input string name); $display("A=%b, B=%b, m=%b, result=%b", A, B, m, result);
endfunction
function transaction copy();
copy=new(); copy.A =this.A; copy.B=this.B; copy.m=this.m;
copy.result=this.result;
endfunction
endclass