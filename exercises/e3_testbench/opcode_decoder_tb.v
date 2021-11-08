module opcode_decoder_tb();

    logic[5:0] opcode;
    logic itype;
    logic rtype;
    logic jtype;

    initial begin
        // $dumpfile("opcode_decoder_tb.vcd");
        // $dumpvars(0, opcode_decoder_tb);
        //rtype

        opcode = 0;
        #10;
        assert((itype == 0) && (rtype == 1) && (jtype == 0)) else $fatal(1);

        //jtype
        opcode = 2;
        #10;
        assert((itype == 0) && (rtype == 0) && (jtype == 1)) else $fatal(1);

        opcode = 3;
        #10;
        assert((itype == 0) && (rtype == 0) && (jtype == 1)) else $fatal(1);

        //itype
        opcode = 4;
        #10;
        assert((itype == 1) && (rtype == 0) && (jtype == 0)) else $fatal(1);

        opcode = 10;
        #10;
        assert((itype == 1) && (rtype == 0) && (jtype == 0)) else $fatal(1);

        opcode = 6'b111111;
        #10;
        assert((itype == 1) && (rtype == 0) && (jtype == 0)) else $fatal(1);

        $finish;
    end

    opcode_decoder dut(
        .opcode(opcode),
        .itype(itype), .rtype(rtype), .jtype(jtype)
    );

endmodule