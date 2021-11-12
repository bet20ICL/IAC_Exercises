module fsm_tb();
    logic clk;
    initial begin
        $dumpfile("fsm_tb.vcd");
        $dumpvars(0, fsm_tb);
        clk = 0;
        repeat (20) begin
            #4;
            clk = !clk;
        end
        $finish(0);
    end

    logic reset, sample_valid;
    logic[2:0] sample_value;
    logic[7:0] sum, count;
    initial begin
        reset = 1;
        sample_valid = 0;
        sample_value = 1;
        @(posedge clk);
        #1;
        $display("sum: %d count:%d", sum, count);
        assert(sum == 0 && count == 0);

        reset = 0;
        sample_valid = 1;
        @(posedge clk);
        #1;
        $display("sum: %d count:%d", sum, count);
        assert(sum == 1 && count == 1);

        sample_valid = 0;
        sample_value = 2;
        @(posedge clk);
        #1;
        $display("sum: %d count:%d", sum, count);
        assert(sum == 1 && count == 1);

        sample_valid = 1;
        sample_value = 3;
        @(posedge clk);
        #1;
        $display("sum: %d count:%d", sum, count);
        assert(sum == 4 && count == 2);

        sample_valid = 0;
        sample_value = 3;
        @(posedge clk);
        #1;
        $display("sum: %d count:%d", sum, count);
        assert(sum == 4 && count == 2);

        reset = 1;
        @(posedge clk);
        #1;
        $display("sum: %d count:%d", sum, count);
        assert(sum == 0 && count == 0);


    end

    fsm dut(
        .clk(clk), .reset(reset), .sample_valid(sample_valid),
        .sample_value(sample_value),
        .sum(sum),
        .count(count)
    );

endmodule