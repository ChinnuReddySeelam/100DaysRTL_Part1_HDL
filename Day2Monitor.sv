class monitor;
	transcation tr;
	mailbox(transcation) mbx;
	virtual clkDix_if vif;
function new(mailbox #(transaction) mbx);
	this.mbx=mbx;
endfunction
task run();
	tr=new();
	forever begin
		@(posedge vif.clk);
		@(posedge vif.clk);
		tr.div2=vif.div2;
		tr.div4=vif.div4;
		tr.div8=vif.div8;
		tr.div16=vif.div16;
		mbx.put(tr);
		tr.display("MON");
	end
endtask
endclass