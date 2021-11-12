module regression_1_tb();

    //fault 1: subtraction not implemented correctly, missing + 1
    
    logic clk;
    initial begin
        clk = 0;
        repeat (50) begin
            #4 clk = !clk;
        end
    end

    logic [1:0] op;
    logic [31:0] a, b, r;
    logic [32:0] expected;
    alu dut(.op(op), .a(a), .b(b), .r(r), .clk(clk));
    initial begin
        op = 2;
        a = 5;
        b = 3;

        @(posedge clk);
        #1;
        expected = a - b;
        $display("a = %d, b = %d, r = %d, expected = %d", a, b, r, expected);
        assert(expected[31:0] == r) else $fatal(1);
        
        #1;
        a = 'hFF3;
        b = 'hF3;
        @(posedge clk);
        #1;
        expected = a - b;
        $display("a = %d, b = %d, r = %d, expected = %d", a, b, r, expected);
        assert(expected[31:0] == r) else $fatal(1);


        $finish(0);
    end

endmodule