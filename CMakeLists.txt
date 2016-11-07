cmake_minimum_required(VERSION 3.0)

# project name
project(sbe)

# path to sbe jar
set(sbe_jar "${CMAKE_CURRENT_SOURCE_DIR}/bin/sbe-all-1.5.2.jar" PARENT_SCOPE)

# create library entry
set(target sbe)
add_library(${target} INTERFACE)
target_include_directories(${target} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)
