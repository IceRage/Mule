#------------------------------------------------------------
# 
# This file contains the build configuration for the project.
#
# Important configuration parameters:
#
# + CMAKE_CUSTOM_BUILD 
#     if (value == "Package") then build package
#
# + CMAKE_CUSTOM_MODEL_CHECKER
#     if (value == "Generate") then generate custom model 
#     checker
#
# + CMAKE_BUILD_FOR_PROFILING
#     if (value == "Yes") then add gprof profiling flag -pg
#     to the project compilation flags
#------------------------------------------------------------


#------------------------------------------------------------
# General project configuration
#------------------------------------------------------------

# Project name
project(mule)

# Minimum version number
cmake_minimum_required(VERSION 2.8)

# Enable testing and dashboard creation
enable_testing()


#------------------------------------------------------------
# Incluse user-defined CMake modules
#------------------------------------------------------------

# Appends the cmake/modules and cmake/package paths inside the MAKE_MODULE_PATH variable 
# which stores the directories of additional CMake modules (e.g. MacroOutOfSourceBuild.cmake):
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_PATH})
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/package ${CMAKE_MODULE_PATH})

# Include user-defined CMake modules
include(AddDebugPostfix)
include(AddExecutableInstallTarget)
include(AddSample)
include(AddUnitTest)
include(GetCurrentDate)
include(GenerateCustomModelChecker)
include(UpdateProjectBuildNumber)
include(UpdateProjectModifiedDate)
include(MacroOutOfSourceBuild)


#------------------------------------------------------------
# Define global project variables 
#------------------------------------------------------------

GetCurrentYear(CURRENT_YEAR)
set(PROJECT_AUTHOR "Ovidiu Pârvu")
set(PROJECT_AUTHOR_EMAIL "<ovidiu.parvu[AT]gmail.com>")


#------------------------------------------------------------
# Define global project variables using relative paths
#------------------------------------------------------------

set(POLAR_GNUPLOT_SCRIPT_FILES_PATH "config/visualisation/circular")
set(POLAR_GNUPLOT_SCRIPT_HEADER_PATH "${POLAR_GNUPLOT_SCRIPT_FILES_PATH}/header.in")
set(POLAR_GNUPLOT_SCRIPT_CONTENT_PATH "${POLAR_GNUPLOT_SCRIPT_FILES_PATH}/content.in")
set(POLAR_GNUPLOT_SCRIPT_FOOTER_PATH "${POLAR_GNUPLOT_SCRIPT_FILES_PATH}/footer.in")

set(RECTANGULAR_GNUPLOT_SCRIPT_FILES_PATH "config/visualisation/rectangular")
set(RECTANGULAR_GNUPLOT_SCRIPT_HEADER_PATH "${RECTANGULAR_GNUPLOT_SCRIPT_FILES_PATH}/header.in")
set(RECTANGULAR_GNUPLOT_SCRIPT_CONTENT_PATH "${RECTANGULAR_GNUPLOT_SCRIPT_FILES_PATH}/content.in")
set(RECTANGULAR_GNUPLOT_SCRIPT_FOOTER_PATH "${RECTANGULAR_GNUPLOT_SCRIPT_FILES_PATH}/footer.in")

set(DETECTOR_CONFIG_FILES_PATH "config/analysis/spatial")
set(CIRCULAR_REGION_DETECTOR_CONFIG_PATH "${DETECTOR_CONFIG_FILES_PATH}/circular_region_detector.xml")
set(RECTANGULAR_REGION_DETECTOR_CONFIG_PATH "${DETECTOR_CONFIG_FILES_PATH}/rectangular_region_detector.xml")
set(SIMULATION_CLUSTER_DETECTOR_CONFIG_PATH "${DETECTOR_CONFIG_FILES_PATH}/simulation_cluster_detector.xml")

set(MULE_MSTML_SCHEMA_FOLDER_PATH "config/verification/spatial-temporal/schema")
set(MULE_MSTML_SCHEMA_PATH "${MULE_MSTML_SCHEMA_FOLDER_PATH}/MSTML_L1V1.xsd")

set(MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_FOLDER_PATH "${MULE_MSTML_SCHEMA_FOLDER_PATH}")
set(MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_PATH "${MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_FOLDER_PATH}/multiscale_architecture_graph.xsd")
    
    
#------------------------------------------------------------
# Files to be installed for "package" builds
#------------------------------------------------------------

if(CMAKE_CUSTOM_BUILD_TYPE STREQUAL "Package")
    # Define relative installation paths
    if(UNIX)
        set(PACKAGE_CONFIG_INSTALL_PREFIX "share/${PROJECT_NAME}")
    elseif(WIN32)
        set(PACKAGE_CONFIG_INSTALL_PREFIX ".")
    endif(UNIX)
    
    # Define files to be installed
    install(
        FILES "${PROJECT_SOURCE_DIR}/${POLAR_GNUPLOT_SCRIPT_HEADER_PATH}"
              "${PROJECT_SOURCE_DIR}/${POLAR_GNUPLOT_SCRIPT_CONTENT_PATH}"
              "${PROJECT_SOURCE_DIR}/${POLAR_GNUPLOT_SCRIPT_FOOTER_PATH}"
        DESTINATION "${PACKAGE_CONFIG_INSTALL_PREFIX}/${POLAR_GNUPLOT_SCRIPT_FILES_PATH}"    
    )
    
    install(
        FILES "${PROJECT_SOURCE_DIR}/${RECTANGULAR_GNUPLOT_SCRIPT_HEADER_PATH}"
              "${PROJECT_SOURCE_DIR}/${RECTANGULAR_GNUPLOT_SCRIPT_CONTENT_PATH}"
              "${PROJECT_SOURCE_DIR}/${RECTANGULAR_GNUPLOT_SCRIPT_FOOTER_PATH}"
        DESTINATION "${PACKAGE_CONFIG_INSTALL_PREFIX}/${RECTANGULAR_GNUPLOT_SCRIPT_FILES_PATH}"    
    )
    
    install(
        FILES "${PROJECT_SOURCE_DIR}/${CIRCULAR_REGION_DETECTOR_CONFIG_PATH}"
              "${PROJECT_SOURCE_DIR}/${RECTANGULAR_REGION_DETECTOR_CONFIG_PATH}"
              "${PROJECT_SOURCE_DIR}/${SIMULATION_CLUSTER_DETECTOR_CONFIG_PATH}"
        DESTINATION "${PACKAGE_CONFIG_INSTALL_PREFIX}/${DETECTOR_CONFIG_FILES_PATH}"    
    )
    
    install(
        FILES "${PROJECT_SOURCE_DIR}/${MULE_MSTML_SCHEMA_PATH}"
        DESTINATION "${PACKAGE_CONFIG_INSTALL_PREFIX}/${MULE_MSTML_SCHEMA_FOLDER_PATH}"    
    )
    
    install(
        FILES "${PROJECT_SOURCE_DIR}/${MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_PATH}"
        DESTINATION "${PACKAGE_CONFIG_INSTALL_PREFIX}/${MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_FOLDER_PATH}"    
    )
endif(CMAKE_CUSTOM_BUILD_TYPE STREQUAL "Package")


#------------------------------------------------------------
# Update project global variables using absolute paths
#------------------------------------------------------------

if(CMAKE_CUSTOM_BUILD_TYPE STREQUAL "Package")
    # Define absolute installation paths
    set(PACKAGE_CONFIG_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/${PACKAGE_CONFIG_INSTALL_PREFIX}")
    
    # Update configuration files absolute paths
    set(POLAR_GNUPLOT_SCRIPT_HEADER_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${POLAR_GNUPLOT_SCRIPT_HEADER_PATH}")
    set(POLAR_GNUPLOT_SCRIPT_CONTENT_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${POLAR_GNUPLOT_SCRIPT_CONTENT_PATH}")
    set(POLAR_GNUPLOT_SCRIPT_FOOTER_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${POLAR_GNUPLOT_SCRIPT_FOOTER_PATH}")
    
    set(RECTANGULAR_GNUPLOT_SCRIPT_HEADER_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${RECTANGULAR_GNUPLOT_SCRIPT_HEADER_PATH}")
    set(RECTANGULAR_GNUPLOT_SCRIPT_CONTENT_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${RECTANGULAR_GNUPLOT_SCRIPT_CONTENT_PATH}")
    set(RECTANGULAR_GNUPLOT_SCRIPT_FOOTER_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${RECTANGULAR_GNUPLOT_SCRIPT_FOOTER_PATH}")
    
    set(CIRCULAR_REGION_DETECTOR_CONFIG_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${CIRCULAR_REGION_DETECTOR_CONFIG_PATH}")
    set(RECTANGULAR_REGION_DETECTOR_CONFIG_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${RECTANGULAR_REGION_DETECTOR_CONFIG_PATH}")
    set(SIMULATION_CLUSTER_DETECTOR_CONFIG_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${SIMULATION_CLUSTER_DETECTOR_CONFIG_PATH}")
    
    set(MULE_MSTML_SCHEMA_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${MULE_MSTML_SCHEMA_PATH}")
    
    set(MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_PATH "${PACKAGE_CONFIG_INSTALL_PREFIX}/${MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_PATH}")
elseif(CMAKE_CUSTOM_BUILD_TYPE STREQUAL "AbsoluteConfigurationPaths")
    set(POLAR_GNUPLOT_SCRIPT_HEADER_PATH "${PROJECT_SOURCE_DIR}/${POLAR_GNUPLOT_SCRIPT_HEADER_PATH}")
    set(POLAR_GNUPLOT_SCRIPT_CONTENT_PATH "${PROJECT_SOURCE_DIR}/${POLAR_GNUPLOT_SCRIPT_CONTENT_PATH}")
    set(POLAR_GNUPLOT_SCRIPT_FOOTER_PATH "${PROJECT_SOURCE_DIR}/${POLAR_GNUPLOT_SCRIPT_FOOTER_PATH}")
    
    set(RECTANGULAR_GNUPLOT_SCRIPT_HEADER_PATH "${PROJECT_SOURCE_DIR}/${RECTANGULAR_GNUPLOT_SCRIPT_HEADER_PATH}")
    set(RECTANGULAR_GNUPLOT_SCRIPT_CONTENT_PATH "${PROJECT_SOURCE_DIR}/${RECTANGULAR_GNUPLOT_SCRIPT_CONTENT_PATH}")
    set(RECTANGULAR_GNUPLOT_SCRIPT_FOOTER_PATH "${PROJECT_SOURCE_DIR}/${RECTANGULAR_GNUPLOT_SCRIPT_FOOTER_PATH}")
    
    set(CIRCULAR_REGION_DETECTOR_CONFIG_PATH "${PROJECT_SOURCE_DIR}/${CIRCULAR_REGION_DETECTOR_CONFIG_PATH}")
    set(RECTANGULAR_REGION_DETECTOR_CONFIG_PATH "${PROJECT_SOURCE_DIR}/${RECTANGULAR_REGION_DETECTOR_CONFIG_PATH}")
    set(SIMULATION_CLUSTER_DETECTOR_CONFIG_PATH "${PROJECT_SOURCE_DIR}/${SIMULATION_CLUSTER_DETECTOR_CONFIG_PATH}")
    
    set(MULE_MSTML_SCHEMA_PATH "${PROJECT_SOURCE_DIR}/${MULE_MSTML_SCHEMA_PATH}")
    
    set(MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_PATH "${PROJECT_SOURCE_DIR}/${MULTISCALE_ARCHITECTURE_GRAPH_SCHEMA_PATH}")
endif(CMAKE_CUSTOM_BUILD_TYPE STREQUAL "Package")


#------------------------------------------------------------
# Configuration dependent details
#------------------------------------------------------------

# Change the names of the output libraries depending on the chosen configuration
set(CMAKE_DEBUG_POSTFIX _d)

# Set debug define macro in order to change compilation of cpp source files 
# depending on the build type i.e. Release/Debug
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(PROJECT_BUILD_TYPE "#define PROJECT_BUILD_TYPE_DEBUG")
else(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(PROJECT_BUILD_TYPE "")
endif(CMAKE_BUILD_TYPE STREQUAL "Debug")


#------------------------------------------------------------
# Enforce "out of source" build
#------------------------------------------------------------

# Check if an "out of source" build folder was chosen
macro_ensure_out_of_source_build("${PROJECT_NAME} requires an out of source build.")


#------------------------------------------------------------
# Compilation details
#------------------------------------------------------------

# Compiler flags
if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wfloat-equal -Wmissing-include-dirs")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fmessage-length=0")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast")
    
    if("${CMAKE_BUILD_FOR_PROFILING}" STREQUAL "Yes")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pg")
    endif("${CMAKE_BUILD_FOR_PROFILING}" STREQUAL "Yes")
endif()


#------------------------------------------------------------
# Find the required packages
#------------------------------------------------------------

# Boost
set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED OFF)
set(Boost_USE_STATIC_RUNTIME OFF)

find_package(Boost COMPONENTS system filesystem program_options REQUIRED)

if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS})

    message(STATUS "Boost library was successfully found.")
endif()

# OpenCV
find_package(OpenCV REQUIRED)

if(OpenCV_FOUND)
    include_directories(${OpenCV_INCLUDE_DIRS})

    message(STATUS "OpenCV library was successfully found.")
endif()

# Xerces
find_package(Xerces REQUIRED)

if(XERCESC_FOUND)
    include_directories(${XERCESC_INCLUDE})

    message(STATUS "Xerces C++ library was successfully found.")
endif()


#------------------------------------------------------------
# Project build number
#------------------------------------------------------------

UpdateProjectBuildNumber(
    "Release" 
    ${PROJECT_SOURCE_DIR}/doc/Multiscale.doxyfile.in 
    ${PROJECT_SOURCE_DIR}/doc/Multiscale.doxyfile
)


#------------------------------------------------------------
# Prerequisites for generating a custom model checker 
#------------------------------------------------------------

# Check if the prerequisites for generating a custom model checker are met (if requested)
if("${CMAKE_CUSTOM_MODEL_CHECKER}" STREQUAL "Generate")
    ArePrerequisitesForGeneratingACustomModelCheckerMet()
endif("${CMAKE_CUSTOM_MODEL_CHECKER}" STREQUAL "Generate")


#------------------------------------------------------------
# Add the include directories
#------------------------------------------------------------

# Project include
include_directories(${PROJECT_SOURCE_DIR}/include)

# Google Test framework include
include_directories(${PROJECT_SOURCE_DIR}/extern/gtest-1.7.0/include)


#------------------------------------------------------------
# Output path for binaries and libraries
#------------------------------------------------------------

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)


#------------------------------------------------------------
# Add subdirectories
#------------------------------------------------------------
 
add_subdirectory(extern)
add_subdirectory(modules)


#------------------------------------------------------------
# Include CPack if the CMAKE_CUSTOM_BUILD_TYPE is Package
#------------------------------------------------------------

if(CMAKE_CUSTOM_BUILD_TYPE STREQUAL "Package")
    include(CPackConfig)
endif(CMAKE_CUSTOM_BUILD_TYPE STREQUAL "Package")