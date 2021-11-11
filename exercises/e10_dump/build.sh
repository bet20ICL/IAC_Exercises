#!/bin/bash
set -eou pipefail

srcs="rom.v"

iverilog -g 2012 -s e10_dump -o e10_dump e10_dump.v ${srcs}
>&2 echo "compiled"
./e10_dump