module vendingmc_tb;
    reg clk, rst;
    reg [2:0] money;
    wire [1:0] prod;
    wire [3:0] bal;
    vendingmc dut(clk, rst, money, prod, bal);

    initial
    clk = 1'b0;
    always
    #10 clk=~clk;
    initial
    begin
        $dumpfile("vending_machine.vcd");
    $dumpvars(0,vendingmc_tb);
        rst = 1'b1;      
        #20
        rst = 1'b0;
        money = 3'd5;
        #40
        money = 3'd2;
        #30
        money = 3'd1;
        #10
        money = 3'd0;
        rst = 1'b1;
        #10 $finish;        
     end
endmodule
