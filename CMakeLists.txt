cmake_minimum_required(VERSION 3.0)

# project name
project(sbe)

get_directory_property(has_parent PARENT_DIRECTORY)
if (has_parent)
    set(sbe_INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/include" PARENT_SCOPE)
    set(sbe_jar "${CMAKE_CURRENT_SOURCE_DIR}/bin/sbe-all-1.5.2.jar" PARENT_SCOPE)
endif()
