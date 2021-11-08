module bor(
    input logic a, input logic b,
    output logic r
);

    assign r = a | b;

endmodule