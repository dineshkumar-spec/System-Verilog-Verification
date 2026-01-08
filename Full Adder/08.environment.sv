`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver dv;
  monitor mon;
  scoreboard scb;
  
  mailbox gen2drv;
  mailbox m2s;
  
  virtual intf vif;
  
  function new (virtual intf vif); 
    this.vif = vif;
    gen2drv = new();
    m2s = new();
    
    gen = new(gen2drv);
    dv = new(vif, gen2drv);
    mon = new(vif, m2s);
    scb = new(m2s);
  endfunction
  
  task run();
    fork
    gen.main();
    dv.main();
    mon.main();
    scb.main();
    join
  endtask
endclass
