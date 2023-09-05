class generator;
  mailbox #(transaction) mbx;
  event done;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run(int count);
    repeat (count) begin
      transaction tr = new();
      tr.result = tr.A + tr.B + tr.Cin;
      mbx.put(tr);
      tr.display();
    end
    ->done;
  endtask
endclass