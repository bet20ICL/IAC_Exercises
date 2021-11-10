module shift16_tb();

    logic clk;
    logic[15:0] a;
    logic[3:0] distance;


    localparam integer STEPS = 50;

    initial begin
        $dumpfile("shift16_tb.vcd");
        $dumpvars(0, shift16_tb);
        clk = 0;
        #5;
        forever begin
            #5 clk = 1;
            #5 clk = 0;
        end
    end    

    initial begin
        a = 0;
        distance = 0;
        
        repeat (STEPS) begin
            @(posedge clk)

            #9;
            a = 16'h1;
            distance = distance + 4'h1;
        end
    end

    logic[15:0] r_d1, r_d2;

    always_ff @(posedge clk) begin
        r_d1 <= a << distance;
        r_d2 <= r_d1;
    end

    initial begin
        @(posedge clk);

        repeat (STEPS) begin
            @(posedge clk);
            #1;
            $display("a=%b, shift=%d, r=%b, sim=%b", a, distance, r_d2, r_d2);
            assert(r_d2 == r) else $fatal(1);
        end

        $finish;
    end

    logic[15:0] r;
    shift16 dut(.clk(clk), .a(a), .distance(distance), .r(r));

endmodule