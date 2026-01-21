`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk;
  logic reset;
  
  initial begin
    clk=0;
    forever #5 clk = ~clk;
  end
  
  initial begin
  reset=1;#10;
  reset=0;
  end
  
  intf vif(clk,reset);
  test tst (vif);
  dff dut (.clk(vif.clk), .reset(vif.reset), .d(vif.d), .q(vif.q));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #1000;
    $finish;
  end
endmodule
