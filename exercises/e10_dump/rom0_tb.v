module rom0_tb();
    logic clk;
    logic[7:0] address;
    logic[7:0] data_0, data_1, data_2, data_3;

    rom dut(.clk(clk), .address(address), .data_0(data_0), .data_1(data_1), .data_2(data_2), .data_3(data_3));

    initial begin
        address = 0;
        clk = 0;
        forever begin
            #4; 
            clk = !clk;
        end
    end

    initial begin
        integer i;
        for(i = 0; i < 20; i++) begin
            #1;
            $display("byte %d: %h", address, data_0);
            address = address + 1;
        end
        $finish(0);
    end

endmodule