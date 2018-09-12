#!/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/wzy/gr-my_preamble_pilot/lib
export PATH=/home/wzy/gr-my_preamble_pilot/build/lib:$PATH
export LD_LIBRARY_PATH=/home/wzy/gr-my_preamble_pilot/build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH
test-my_preamble_pilot 
