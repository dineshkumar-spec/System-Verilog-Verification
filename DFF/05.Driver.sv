class driver;
  mailbox g2d;
  virtual intf vif;
  
  function new(virtual intf vif, mailbox g2d);
    this.vif = vif;
    this.g2d = g2d;
  endfunction
  
  task main();
    transaction trans;
    repeat (6) begin
      g2d.get(trans);
      @(negedge vif.clk)begin
      vif.d <= trans.d;
        $display("-----Driver class data-----");
        $display("time=%0t,clk=%0b,reset=%0b,d=%0b,q=%0b",$time,vif.clk,vif.reset,trans.d,trans.q);
      end
    end
  endtask
endclass
