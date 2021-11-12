module e10_dump();

    logic clk;
    logic[7:0] address;
    logic[7:0] data_0, data_1, data_2, data_3;
    
    rom dut(.clk(clk), .address(address), .data_0(data_0), .data_1(data_1), .data_2(data_2), .data_3(data_3));

    initial begin
        clk = 0;
        forever begin
            #4 clk = !clk;
        end
    end

    logic[31:0] word;
    assign word = {data_0, data_1, data_2, data_3};
    initial begin
        address = 0;
        repeat (64) begin
            @(posedge clk);
            #1;
            $display("rom[%d] = %d", address, word);
            address = address + 4;
        end
        $finish(0);
    end

endmodule