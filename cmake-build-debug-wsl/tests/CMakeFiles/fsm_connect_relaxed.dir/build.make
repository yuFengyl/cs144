# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/yufeng/eat/cs144/cs144

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl

# Include any dependencies generated for this target.
include tests/CMakeFiles/fsm_connect_relaxed.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/fsm_connect_relaxed.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/fsm_connect_relaxed.dir/flags.make

tests/CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.o: tests/CMakeFiles/fsm_connect_relaxed.dir/flags.make
tests/CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.o: ../tests/fsm_connect_relaxed.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.o"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.o -c /home/yufeng/eat/cs144/cs144/tests/fsm_connect_relaxed.cc

tests/CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.i"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yufeng/eat/cs144/cs144/tests/fsm_connect_relaxed.cc > CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.i

tests/CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.s"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yufeng/eat/cs144/cs144/tests/fsm_connect_relaxed.cc -o CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.s

# Object files for target fsm_connect_relaxed
fsm_connect_relaxed_OBJECTS = \
"CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.o"

# External object files for target fsm_connect_relaxed
fsm_connect_relaxed_EXTERNAL_OBJECTS =

tests/fsm_connect_relaxed: tests/CMakeFiles/fsm_connect_relaxed.dir/fsm_connect_relaxed.cc.o
tests/fsm_connect_relaxed: tests/CMakeFiles/fsm_connect_relaxed.dir/build.make
tests/fsm_connect_relaxed: tests/libspongechecks.a
tests/fsm_connect_relaxed: libsponge/libsponge.a
tests/fsm_connect_relaxed: tests/CMakeFiles/fsm_connect_relaxed.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fsm_connect_relaxed"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fsm_connect_relaxed.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/fsm_connect_relaxed.dir/build: tests/fsm_connect_relaxed

.PHONY : tests/CMakeFiles/fsm_connect_relaxed.dir/build

tests/CMakeFiles/fsm_connect_relaxed.dir/clean:
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && $(CMAKE_COMMAND) -P CMakeFiles/fsm_connect_relaxed.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/fsm_connect_relaxed.dir/clean

tests/CMakeFiles/fsm_connect_relaxed.dir/depend:
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yufeng/eat/cs144/cs144 /home/yufeng/eat/cs144/cs144/tests /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests/CMakeFiles/fsm_connect_relaxed.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/fsm_connect_relaxed.dir/depend

