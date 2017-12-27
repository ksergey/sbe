cmake_minimum_required(VERSION 3.0)

# project name
project(sbe)

# create library entry
add_library(sbe INTERFACE)
add_library(ksergey::sbe ALIAS sbe)
target_include_directories(sbe INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)

get_directory_property(has_parent PARENT_DIRECTORY)
if (has_parent)
    set(SBE_JAR "${CMAKE_CURRENT_SOURCE_DIR}/bin/sbe-all-1.7.6.jar" PARENT_SCOPE)
endif()
