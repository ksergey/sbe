cmake_minimum_required(VERSION 3.0)

# Project name
project(sbe)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Create library entry
add_library(sbe INTERFACE)
add_library(ksergey::sbe ALIAS sbe)
target_include_directories(sbe INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

get_directory_property(has_parent PARENT_DIRECTORY)
if (has_parent)
    set(SBE_JAR "${CMAKE_CURRENT_SOURCE_DIR}/bin/sbe-all-1.10.0.jar" PARENT_SCOPE)
endif()

include(SBEMakeCodec)
