module search(
    input logic clk,
    input logic reset,
    output logic[31:0] addr
);

    logic[31:0] len;
    logic r;
    logic r_next;
    logic found;

    initial begin
        @(posedge reset);
        found = 1;
        addr = 32'hFFFFFFFF >> 1;
        len = (addr >> 1) + 1;

        @(negedge reset);
        found = 0;
    end

    always_ff @(posedge clk) begin
        if (found == 0) begin
            len <= len >> 1;
            if (r == 0 && r_next == 1) begin
                found <= 1;
            end 
            else if (r == 0) begin
                addr <= addr + len;
            end 
            else begin
                addr <= addr - len;
            end
        end
    end

    f func(.x(addr), .r(r));
    f func_next(.x(addr + 1), .r(r_next));

endmodule