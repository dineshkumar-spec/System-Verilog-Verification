class monitor;
  virtual intf vif;
  mailbox m2s;
  
  function new(virtual intf vif, mailbox m2s);
    this.vif = vif;
    this.m2s = m2s;
  endfunction
  
  task main();
    transaction trans;
    repeat(12)
    begin   
    //sampling
    #3;
    trans = new();
    trans.a = vif.a;
    trans.b = vif.b;
    trans.c = vif.c;
    trans.sum = vif.sum;
    trans.cout = vif.cout;
    m2s.put(trans);
    trans.display("Monitor class signals");
    end
  endtask
endclass
