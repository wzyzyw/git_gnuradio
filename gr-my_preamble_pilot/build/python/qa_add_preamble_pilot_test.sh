#!/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/wzy/gr-my_preamble_pilot/python
export PATH=/home/wzy/gr-my_preamble_pilot/build/python:$PATH
export LD_LIBRARY_PATH=/home/wzy/gr-my_preamble_pilot/build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/home/wzy/gr-my_preamble_pilot/build/swig:$PYTHONPATH
/usr/bin/python2 /home/wzy/gr-my_preamble_pilot/python/qa_add_preamble_pilot.py 
