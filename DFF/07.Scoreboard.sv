class scoreboard;
  mailbox m2s;
  virtual intf vif;
  event e1;
  function new(virtual intf vif, mailbox m2s);
    this.vif = vif;
    this.m2s = m2s;
  endfunction
  
  task main();  
    repeat (6) begin
         transaction trans;
	     m2s.get(trans); 

        $display("-----Scoreboard class data-----");
      $display("time=%0t,clk=%0b,reset=%0b,d=%0b,q=%0b",$time,vif.clk,vif.reset,trans.d,trans.q);

      if(((vif.reset==0)&&(trans.q == trans.d))||((vif.reset == 1)&&(trans.q ==0)))
        $display("	pass  ");
      else
        $display("	Fail  ");
      ->e1;
      end
  endtask
endclass
