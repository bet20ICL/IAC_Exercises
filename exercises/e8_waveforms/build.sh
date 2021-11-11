#!/bin/bash
set -eou pipefail

srcs="f.v"
iverilog -g 2012 -s e8_waveforms -o e8_waveforms e8_waveforms.v ${srcs}
>&2 echo "compiled"
./e8_waveforms