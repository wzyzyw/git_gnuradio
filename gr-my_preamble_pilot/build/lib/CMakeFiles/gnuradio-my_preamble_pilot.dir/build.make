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

# Include any dependencies generated for this target.
include lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/flags.make

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/flags.make
lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o: ../lib/add_preamble_pilot_impl.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wzy/gr-my_preamble_pilot/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o -c /home/wzy/gr-my_preamble_pilot/lib/add_preamble_pilot_impl.cc

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.i"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/wzy/gr-my_preamble_pilot/lib/add_preamble_pilot_impl.cc > CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.i

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.s"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/wzy/gr-my_preamble_pilot/lib/add_preamble_pilot_impl.cc -o CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.s

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.requires:
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.requires

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.provides: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/build.make lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.provides.build
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.provides

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.provides.build: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/flags.make
lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o: ../lib/my_preamble_detector_impl.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wzy/gr-my_preamble_pilot/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o -c /home/wzy/gr-my_preamble_pilot/lib/my_preamble_detector_impl.cc

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.i"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/wzy/gr-my_preamble_pilot/lib/my_preamble_detector_impl.cc > CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.i

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.s"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/wzy/gr-my_preamble_pilot/lib/my_preamble_detector_impl.cc -o CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.s

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.requires:
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.requires

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.provides: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/build.make lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.provides.build
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.provides

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.provides.build: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/flags.make
lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o: ../lib/remove_pilot_impl.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wzy/gr-my_preamble_pilot/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o -c /home/wzy/gr-my_preamble_pilot/lib/remove_pilot_impl.cc

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.i"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/wzy/gr-my_preamble_pilot/lib/remove_pilot_impl.cc > CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.i

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.s"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/wzy/gr-my_preamble_pilot/lib/remove_pilot_impl.cc -o CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.s

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.requires:
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.requires

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.provides: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/build.make lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.provides.build
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.provides

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.provides.build: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o

# Object files for target gnuradio-my_preamble_pilot
gnuradio__my_preamble_pilot_OBJECTS = \
"CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o" \
"CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o" \
"CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o"

# External object files for target gnuradio-my_preamble_pilot
gnuradio__my_preamble_pilot_EXTERNAL_OBJECTS =

lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/build.make
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: /usr/local/lib/libgnuradio-runtime.so
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: /usr/local/lib/libgnuradio-pmt.so
lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libgnuradio-my_preamble_pilot-1.0.0git.so"
	cd /home/wzy/gr-my_preamble_pilot/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gnuradio-my_preamble_pilot.dir/link.txt --verbose=$(VERBOSE)
	cd /home/wzy/gr-my_preamble_pilot/build/lib && $(CMAKE_COMMAND) -E cmake_symlink_library libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0 libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0 libgnuradio-my_preamble_pilot-1.0.0git.so
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/cmake -E create_symlink libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0 /home/wzy/gr-my_preamble_pilot/build/lib/libgnuradio-my_preamble_pilot.so
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/cmake -E create_symlink libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0 /home/wzy/gr-my_preamble_pilot/build/lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0
	cd /home/wzy/gr-my_preamble_pilot/build/lib && /usr/bin/cmake -E touch libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0

lib/libgnuradio-my_preamble_pilot-1.0.0git.so: lib/libgnuradio-my_preamble_pilot-1.0.0git.so.0.0.0

# Rule to build all files generated by this target.
lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/build: lib/libgnuradio-my_preamble_pilot-1.0.0git.so
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/build

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/requires: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/add_preamble_pilot_impl.cc.o.requires
lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/requires: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/my_preamble_detector_impl.cc.o.requires
lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/requires: lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/remove_pilot_impl.cc.o.requires
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/requires

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/clean:
	cd /home/wzy/gr-my_preamble_pilot/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/gnuradio-my_preamble_pilot.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/clean

lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/depend:
	cd /home/wzy/gr-my_preamble_pilot/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wzy/gr-my_preamble_pilot /home/wzy/gr-my_preamble_pilot/lib /home/wzy/gr-my_preamble_pilot/build /home/wzy/gr-my_preamble_pilot/build/lib /home/wzy/gr-my_preamble_pilot/build/lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/gnuradio-my_preamble_pilot.dir/depend

