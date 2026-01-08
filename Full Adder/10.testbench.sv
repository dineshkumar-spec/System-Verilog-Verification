`include "test.sv"
module testbench;
  intf intff();

  test tst(intff);

  full_adder dut(
    .a(intff.a),
    .b(intff.b),
    .c(intff.c),
    .sum(intff.sum),
    .cout(intff.cout)
  );

  initial begin
  //  tst = new(intff);
  //  tst.run();

    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
