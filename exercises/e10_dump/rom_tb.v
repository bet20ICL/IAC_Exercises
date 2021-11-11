module rom_tb();
    logic clk;
    logic[7:0] address;
    logic[7:0] data_0, data_1, data_2, data_3;

    rom dut(.clk(clk), .address(address), .data_0(data_0), .data_1(data_1), .data_2(data_2), .data_3(data_3));

    initial begin
        $dumpfile("rom_tb.vcd");
        $dumpvars(0, rom_tb);
        address = 0;
        clk = 0;
        forever begin
            #4; 
            clk = !clk;
        end
    end

    initial begin
        repeat (20) begin
            @(posedge clk);
            #1
            $display("byte %d: %h", address, data_0);
            #6;
            address = address + 1;
        end
        $finish(0);
    end

endmodule