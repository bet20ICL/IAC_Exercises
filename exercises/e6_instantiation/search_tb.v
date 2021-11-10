module search_tb();

    localparam integer STEPS = 1000;

    logic clk;
    initial begin
        clk = 0;
        repeat (STEPS) begin
            #5 clk = 0;
            #5 clk = 1;
        end    
        $fatal(1);
    end

    logic reset;
    logic[31:0] i;
    logic[10:0] counter;
    initial begin
        reset = 0;
        counter = 1;
        #2 reset = 1;
        #2 reset = 0;
        repeat (STEPS) begin
            @(posedge clk);
            $display("%d    %d", counter, i);
            counter <= counter + 1;
            if (i == 32'h00001000) begin
                $finish();
            end
        end
    end

    search dut(.clk(clk), .reset(reset), .addr(i));

endmodule