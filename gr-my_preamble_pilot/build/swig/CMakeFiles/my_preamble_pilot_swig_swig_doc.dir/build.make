# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wzy/gr-my_preamble_pilot

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wzy/gr-my_preamble_pilot/build

# Utility rule file for my_preamble_pilot_swig_swig_doc.

# Include the progress variables for this target.
include swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/progress.make

swig/CMakeFiles/my_preamble_pilot_swig_swig_doc: swig/my_preamble_pilot_swig_doc.i

swig/my_preamble_pilot_swig_doc.i: swig/my_preamble_pilot_swig_doc_swig_docs/xml/index.xml
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wzy/gr-my_preamble_pilot/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating python docstrings for my_preamble_pilot_swig_doc"
	cd /home/wzy/gr-my_preamble_pilot/docs/doxygen && /usr/bin/python2 -B /home/wzy/gr-my_preamble_pilot/docs/doxygen/swig_doc.py /home/wzy/gr-my_preamble_pilot/build/swig/my_preamble_pilot_swig_doc_swig_docs/xml /home/wzy/gr-my_preamble_pilot/build/swig/my_preamble_pilot_swig_doc.i

swig/my_preamble_pilot_swig_doc_swig_docs/xml/index.xml: swig/_my_preamble_pilot_swig_doc_tag
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wzy/gr-my_preamble_pilot/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating doxygen xml for my_preamble_pilot_swig_doc docs"
	cd /home/wzy/gr-my_preamble_pilot/build/swig && ./_my_preamble_pilot_swig_doc_tag
	cd /home/wzy/gr-my_preamble_pilot/build/swig && /usr/bin/doxygen /home/wzy/gr-my_preamble_pilot/build/swig/my_preamble_pilot_swig_doc_swig_docs/Doxyfile

my_preamble_pilot_swig_swig_doc: swig/CMakeFiles/my_preamble_pilot_swig_swig_doc
my_preamble_pilot_swig_swig_doc: swig/my_preamble_pilot_swig_doc.i
my_preamble_pilot_swig_swig_doc: swig/my_preamble_pilot_swig_doc_swig_docs/xml/index.xml
my_preamble_pilot_swig_swig_doc: swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/build.make
.PHONY : my_preamble_pilot_swig_swig_doc

# Rule to build all files generated by this target.
swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/build: my_preamble_pilot_swig_swig_doc
.PHONY : swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/build

swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/clean:
	cd /home/wzy/gr-my_preamble_pilot/build/swig && $(CMAKE_COMMAND) -P CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/cmake_clean.cmake
.PHONY : swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/clean

swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/depend:
	cd /home/wzy/gr-my_preamble_pilot/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wzy/gr-my_preamble_pilot /home/wzy/gr-my_preamble_pilot/swig /home/wzy/gr-my_preamble_pilot/build /home/wzy/gr-my_preamble_pilot/build/swig /home/wzy/gr-my_preamble_pilot/build/swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : swig/CMakeFiles/my_preamble_pilot_swig_swig_doc.dir/depend

