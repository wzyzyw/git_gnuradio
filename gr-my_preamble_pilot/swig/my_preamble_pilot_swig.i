/* -*- c++ -*- */

#define MY_PREAMBLE_PILOT_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "my_preamble_pilot_swig_doc.i"

%{
#include "my_preamble_pilot/add_preamble_pilot.h"
#include "my_preamble_pilot/my_preamble_detector.h"
#include "my_preamble_pilot/remove_pilot.h"
%}


%include "my_preamble_pilot/add_preamble_pilot.h"
GR_SWIG_BLOCK_MAGIC2(my_preamble_pilot, add_preamble_pilot);
%include "my_preamble_pilot/my_preamble_detector.h"
GR_SWIG_BLOCK_MAGIC2(my_preamble_pilot, my_preamble_detector);
%include "my_preamble_pilot/remove_pilot.h"
GR_SWIG_BLOCK_MAGIC2(my_preamble_pilot, remove_pilot);
