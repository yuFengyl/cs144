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
include doctests/CMakeFiles/socket_dt.dir/depend.make

# Include the progress variables for this target.
include doctests/CMakeFiles/socket_dt.dir/progress.make

# Include the compile flags for this target's objects.
include doctests/CMakeFiles/socket_dt.dir/flags.make

doctests/CMakeFiles/socket_dt.dir/socket_dt.cc.o: doctests/CMakeFiles/socket_dt.dir/flags.make
doctests/CMakeFiles/socket_dt.dir/socket_dt.cc.o: ../doctests/socket_dt.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object doctests/CMakeFiles/socket_dt.dir/socket_dt.cc.o"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/doctests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/socket_dt.dir/socket_dt.cc.o -c /home/yufeng/eat/cs144/cs144/doctests/socket_dt.cc

doctests/CMakeFiles/socket_dt.dir/socket_dt.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/socket_dt.dir/socket_dt.cc.i"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/doctests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yufeng/eat/cs144/cs144/doctests/socket_dt.cc > CMakeFiles/socket_dt.dir/socket_dt.cc.i

doctests/CMakeFiles/socket_dt.dir/socket_dt.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/socket_dt.dir/socket_dt.cc.s"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/doctests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yufeng/eat/cs144/cs144/doctests/socket_dt.cc -o CMakeFiles/socket_dt.dir/socket_dt.cc.s

# Object files for target socket_dt
socket_dt_OBJECTS = \
"CMakeFiles/socket_dt.dir/socket_dt.cc.o"

# External object files for target socket_dt
socket_dt_EXTERNAL_OBJECTS =

doctests/socket_dt: doctests/CMakeFiles/socket_dt.dir/socket_dt.cc.o
doctests/socket_dt: doctests/CMakeFiles/socket_dt.dir/build.make
doctests/socket_dt: libsponge/libsponge.a
doctests/socket_dt: /usr/lib/x86_64-linux-gnu/libpthread.so
doctests/socket_dt: doctests/CMakeFiles/socket_dt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable socket_dt"
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/doctests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/socket_dt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
doctests/CMakeFiles/socket_dt.dir/build: doctests/socket_dt

.PHONY : doctests/CMakeFiles/socket_dt.dir/build

doctests/CMakeFiles/socket_dt.dir/clean:
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/doctests && $(CMAKE_COMMAND) -P CMakeFiles/socket_dt.dir/cmake_clean.cmake
.PHONY : doctests/CMakeFiles/socket_dt.dir/clean

doctests/CMakeFiles/socket_dt.dir/depend:
	cd /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yufeng/eat/cs144/cs144 /home/yufeng/eat/cs144/cs144/doctests /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/doctests /home/yufeng/eat/cs144/cs144/cmake-build-debug-wsl/doctests/CMakeFiles/socket_dt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doctests/CMakeFiles/socket_dt.dir/depend

