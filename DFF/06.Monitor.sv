class monitor;
  mailbox m2s;
  virtual intf vif;
  
  function new(virtual intf vif, mailbox m2s);
    this.vif = vif;
    this.m2s = m2s;
  endfunction
  
  task main();
    transaction trans;
    trans = new();
    
    repeat (6) begin
      @(posedge vif.clk)#1;
      trans.d = vif.d;
      trans.q = vif.q;
        m2s.put(trans);
        $display("-----Monitor class data-----");
        $display("time=%0t,clk=%0b,reset=%0b,d=%0b,q=%0b",$time,vif.clk,vif.reset,trans.d,trans.q);
    end
  endtask
endclass
