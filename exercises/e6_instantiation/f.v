module f(
    input logic[31:0] x,
    output logic r
);

    assign r = (x <= 32'h00001000 ? 0 : 1);

endmodule