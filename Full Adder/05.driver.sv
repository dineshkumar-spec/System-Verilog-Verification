class driver;
  virtual intf vif;
   mailbox gen2drv;
  
  function new(virtual intf vif,mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    repeat(12)
    begin
    transaction trans;
    gen2drv.get(trans);
     #1; 
    vif.a <= trans.a;
    vif.b <= trans.b;
    vif.c <= trans.c;
      trans.display("Driver class signals");
      #2;
    end
  endtask
endclass
