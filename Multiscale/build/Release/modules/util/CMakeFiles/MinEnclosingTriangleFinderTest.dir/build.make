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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ovidiu/Temp/Mule/Multiscale

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ovidiu/Temp/Mule/Multiscale/build/Release

# Include any dependencies generated for this target.
include modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/depend.make

# Include the progress variables for this target.
include modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/progress.make

# Include the compile flags for this target's objects.
include modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/flags.make

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o: modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/flags.make
modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o: ../../modules/util/test/MinEnclosingTriangleFinderTest.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ovidiu/Temp/Mule/Multiscale/build/Release/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o"
	cd /home/ovidiu/Temp/Mule/Multiscale/build/Release/modules/util && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o -c /home/ovidiu/Temp/Mule/Multiscale/modules/util/test/MinEnclosingTriangleFinderTest.cpp

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.i"
	cd /home/ovidiu/Temp/Mule/Multiscale/build/Release/modules/util && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ovidiu/Temp/Mule/Multiscale/modules/util/test/MinEnclosingTriangleFinderTest.cpp > CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.i

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.s"
	cd /home/ovidiu/Temp/Mule/Multiscale/build/Release/modules/util && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ovidiu/Temp/Mule/Multiscale/modules/util/test/MinEnclosingTriangleFinderTest.cpp -o CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.s

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.requires:
.PHONY : modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.requires

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.provides: modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.requires
	$(MAKE) -f modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/build.make modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.provides.build
.PHONY : modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.provides

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.provides.build: modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o

# Object files for target MinEnclosingTriangleFinderTest
MinEnclosingTriangleFinderTest_OBJECTS = \
"CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o"

# External object files for target MinEnclosingTriangleFinderTest
MinEnclosingTriangleFinderTest_EXTERNAL_OBJECTS =

../../bin/test/MinEnclosingTriangleFinderTest: modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o
../../bin/test/MinEnclosingTriangleFinderTest: ../../lib/libutil.a
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_videostab.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_video.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_ts.a
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_superres.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_stitching.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_photo.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_ocl.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_objdetect.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_nonfree.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_ml.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_legacy.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_imgproc.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_highgui.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_gpu.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_flann.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_features2d.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_core.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_contrib.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_calib3d.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: ../../lib/libgtest.a
../../bin/test/MinEnclosingTriangleFinderTest: ../../lib/libgtest_main.a
../../bin/test/MinEnclosingTriangleFinderTest: /usr/lib/x86_64-linux-gnu/libGLU.so
../../bin/test/MinEnclosingTriangleFinderTest: /usr/lib/x86_64-linux-gnu/libGL.so
../../bin/test/MinEnclosingTriangleFinderTest: /usr/lib/x86_64-linux-gnu/libSM.so
../../bin/test/MinEnclosingTriangleFinderTest: /usr/lib/x86_64-linux-gnu/libICE.so
../../bin/test/MinEnclosingTriangleFinderTest: /usr/lib/x86_64-linux-gnu/libX11.so
../../bin/test/MinEnclosingTriangleFinderTest: /usr/lib/x86_64-linux-gnu/libXext.so
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_nonfree.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_ocl.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_gpu.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_photo.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_objdetect.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_legacy.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_video.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_ml.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_calib3d.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_features2d.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_highgui.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_imgproc.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_flann.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libopencv_core.so.2.4.10
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libxerces-c-3.1.so
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libboost_system.a
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libboost_filesystem.a
../../bin/test/MinEnclosingTriangleFinderTest: /usr/local/lib/libboost_program_options.a
../../bin/test/MinEnclosingTriangleFinderTest: ../../lib/libgtest.a
../../bin/test/MinEnclosingTriangleFinderTest: modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/build.make
../../bin/test/MinEnclosingTriangleFinderTest: modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../../../bin/test/MinEnclosingTriangleFinderTest"
	cd /home/ovidiu/Temp/Mule/Multiscale/build/Release/modules/util && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MinEnclosingTriangleFinderTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/build: ../../bin/test/MinEnclosingTriangleFinderTest
.PHONY : modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/build

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/requires: modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/test/MinEnclosingTriangleFinderTest.cpp.o.requires
.PHONY : modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/requires

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/clean:
	cd /home/ovidiu/Temp/Mule/Multiscale/build/Release/modules/util && $(CMAKE_COMMAND) -P CMakeFiles/MinEnclosingTriangleFinderTest.dir/cmake_clean.cmake
.PHONY : modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/clean

modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/depend:
	cd /home/ovidiu/Temp/Mule/Multiscale/build/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ovidiu/Temp/Mule/Multiscale /home/ovidiu/Temp/Mule/Multiscale/modules/util /home/ovidiu/Temp/Mule/Multiscale/build/Release /home/ovidiu/Temp/Mule/Multiscale/build/Release/modules/util /home/ovidiu/Temp/Mule/Multiscale/build/Release/modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/util/CMakeFiles/MinEnclosingTriangleFinderTest.dir/depend
