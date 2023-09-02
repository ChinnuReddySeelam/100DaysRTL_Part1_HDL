class transaction;
  rand bit [3:0] A;
  rand bit [3:0] B;
  rand bit Cin;
  bit [4:0] result;
  
  function new();
    A = $random;
    B = $random;
    Cin = $random;
  endfunction
  
  function void display();
    $display("Transaction: A=%h, B=%h, Cin=%b, Result=%h", A, B, Cin, result);
  endfunction
endclass