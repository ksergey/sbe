cmake_minimum_required(VERSION 3.0)

# Project name
project(sbe)

# Create library entry
add_library(sbe INTERFACE)
add_library(ksergey::sbe ALIAS sbe)
target_include_directories(sbe INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

get_directory_property(has_parent PARENT_DIRECTORY)
if (has_parent)
    set(SBE_JAR "${CMAKE_CURRENT_SOURCE_DIR}/bin/sbe-all-1.10.0.jar" PARENT_SCOPE)
endif()

macro(sbe_make_codec output_dir schema target_ns target_var)
    file(MAKE_DIRECTORY ${output_dir})
    set(output "${output_dir}/${target_ns}/MessageHeader.h")
    message(STATUS ${target_var})
    add_custom_command(OUTPUT "${output}"
        COMMAND ${Java_JAVA_EXECUTABLE}
            "-Dsbe.output.dir=${output_dir}"
            "-Dsbe.target.language=CPP"
            "-jar" "${SBE_JAR}" "${schema}"
        DEPENDS "${schema}")
    add_custom_target(${target_var} DEPENDS "${output}" COMMENT "Updating ${target_ns} coder")
endfunction()
