find_package(Java COMPONENTS Runtime REQUIRED)

function(sbe_make_codec schema target_ns target_var)
    set(output_dir ${CMAKE_CURRENT_BINARY_DIR}/sbe-codecs/include)
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
