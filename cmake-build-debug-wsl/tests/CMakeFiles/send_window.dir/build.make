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
include tests/CMakeFiles/send_window.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/send_window.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/send_window.dir/flags.make

tests/CMakeFiles/send_window.dir/send_window.cc.o: tests/CMakeFiles/send_window.dir/flags.make
tests/CMakeFiles/send_window.dir/send_window.cc.o: ../tests/send_window.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/send_window.dir/send_window.cc.o"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/send_window.dir/send_window.cc.o -c /home/yufeng/eat/cs144/cs144/tests/send_window.cc

tests/CMakeFiles/send_window.dir/send_window.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/send_window.dir/send_window.cc.i"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yufeng/eat/cs144/cs144/tests/send_window.cc > CMakeFiles/send_window.dir/send_window.cc.i

tests/CMakeFiles/send_window.dir/send_window.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/send_window.dir/send_window.cc.s"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yufeng/eat/cs144/cs144/tests/send_window.cc -o CMakeFiles/send_window.dir/send_window.cc.s

# Object files for target send_window
send_window_OBJECTS = \
"CMakeFiles/send_window.dir/send_window.cc.o"

# External object files for target send_window
send_window_EXTERNAL_OBJECTS =

tests/send_window: tests/CMakeFiles/send_window.dir/send_window.cc.o
tests/send_window: tests/CMakeFiles/send_window.dir/build.make
tests/send_window: tests/libspongechecks.a
tests/send_window: libsponge/libsponge.a
tests/send_window: tests/CMakeFiles/send_window.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable send_window"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/send_window.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/send_window.dir/build: tests/send_window

.PHONY : tests/CMakeFiles/send_window.dir/build

tests/CMakeFiles/send_window.dir/clean:
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests && $(CMAKE_COMMAND) -P CMakeFiles/send_window.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/send_window.dir/clean

tests/CMakeFiles/send_window.dir/depend:
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yufeng/eat/cs144/cs144 /home/yufeng/eat/cs144/cs144/tests /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/tests/CMakeFiles/send_window.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/send_window.dir/depend

