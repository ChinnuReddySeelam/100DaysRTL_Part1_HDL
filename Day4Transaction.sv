class transaction;
  rand bit rst;
  bit div3,div5,div9;
  function void display(input string name);
    $display("rst=%b,div3=%b,div5=%b,div9=%b",rst,div3,div5,div9);
  endfunction
  function transaction copy();
    copy=new();
    copy.rst=this.rst;
    copy.div3=this.div3;
    copy.div5=this.div5;
    copy.div9=this.div9;
  endfunction
endclass