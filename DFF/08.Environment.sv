`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  mailbox g2d;
  mailbox m2s;
  
  event e1;
  
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    
    g2d = new();
    m2s = new();
    
    gen = new(vif,g2d);
    drv = new(vif,g2d);
    mon = new(vif,m2s);
    scb = new(vif,m2s);
    
    gen.e1=this.e1;
    scb.e1=this.e1;
  endfunction
  
  task run();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
  endtask
endclass
