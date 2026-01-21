class generator;
  transaction trans;
  mailbox g2d;
  virtual intf vif;
  event e1;
  function new(virtual intf vif, mailbox g2d);
    this.vif = vif;
    this.g2d = g2d;
  endfunction
  
  task main();
    trans = new();
    repeat(6)begin
      if(trans.randomize())begin
        $display("---------------GENERATE-------------");
        $display("time=%0t randomize is done in generator clk=%0b,reset=%0d,d=%0b,q=%0b",$time,vif.clk,vif.reset,trans.d,trans.q);
      end
                 g2d.put(trans);
                 @e1;
    end
  endtask
endclass
