#!/bin/bash
set -eou pipefail

iverilog -g 2012 -s opcode_decoder_tb -o opcode_decoder_tb opcode_decoder_tb.v opcode_decoder.v 
./opcode_decoder_tb