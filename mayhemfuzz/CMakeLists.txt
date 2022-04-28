cmake_minimum_required(VERSION 3.16)
project(minimp3)

add_executable(fuzz fuzz.c)

## Uncomment these lines after converting fuzzme.c into a libFuzzer target
if (NOT CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    message(FATAL_ERROR "Clang is required for libFuzzer!")
endif()
target_compile_options(fuzz PUBLIC -fsanitize=fuzzer)
target_link_options(fuzz PUBLIC -fsanitize=fuzzer)

