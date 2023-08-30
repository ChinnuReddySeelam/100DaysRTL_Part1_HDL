class transaction;
randc bit rst,en;
bit div2,div4,div8,div16;
constraint r_n{
en dist {0:/50,1:/50};
rst dist{0:/50,1:/50}
;}
function void display(input string name);
$display("rst=%b,en=%b,div2=%b,div4=%b,div8=%b,div16=%b",rst,en,div2,div4,div8,div16);
endfunction
function transaction copy();
copy =new();
copy.rst=this.rst;
copy.en=this.en;
copy.div2=this.div2;
copy.div4=this.div4;
copy.div8=this.div8;
copy.div16=this.div16;
endfunction
endclass