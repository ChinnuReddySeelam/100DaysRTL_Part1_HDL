class scoreboard;
transaction tr;
mailbox (transaction) mbx;
mailbox (transaction) mbxref;
event sconext;
function new(mailbox (transaction) mbx,mailbox (transaction) mbxref);
this.mbx=mbx;
this.mbxref=mbxref;
endfunction
task run();
forever begin
mbx.get(tr);
mbx.get(tr);
tr.display("SCO");
if(tr.div3==tr.di2ref && tr.div3==tr.di2ref && tr.div3==tr.di2ref)
$display("Data matched");
else
$display("Data Not matched");
->sconext;
end
endtask
endclass