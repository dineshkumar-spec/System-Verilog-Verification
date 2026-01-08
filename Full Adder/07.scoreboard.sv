class scoreboard;
  mailbox m2s;
  
  function new(mailbox m2s);
  this.m2s = m2s;
  endfunction
  
  task main();
     transaction trans;
    repeat(12)
    begin
   
      m2s.get(trans);#1;
    trans.display("Scoreboard signals");
    //reference modulr or golden dut
      if(((trans.a ^ trans.b ^ trans.c) == trans.sum) && (((trans.a & trans.b) | (trans.b & trans.c) | (trans.c & trans.a)) == trans.cout))    
      $display("Pass");
      else
      $display("Fail");
      $display("------------------------transaction done----------------------------");
       end
  endtask
endclass
