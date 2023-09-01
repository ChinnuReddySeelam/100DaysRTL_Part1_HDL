class monitor;
transaction tr;
mailbox (transaction) mbx;
virtual clk_div_by_odd vif;
function new(mailbox (transaction) mbx);
this.mbx=mbx;
endfunction
task run();
tr=new();
forever begin
@(posedge vif.clk);
@(posedge vif.clk);
tr.div3=vif.div3;
tr.div5=vif.div5;
tr.div9=vif.div9;
mbx.put(tr);
tr.display("MON");
end
endtask
endclass