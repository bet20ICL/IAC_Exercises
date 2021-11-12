#!/bin/bash
set -eou pipefail

srcs="alu.v"
testbench="bt_regression/regression_1"

iverilog -g 2012 -s regression_1_tb -o ${testbench}_tb ${testbench}_tb.v ${srcs}
>&2 echo "compiled"
./${testbench}_tb