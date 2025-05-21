cmake_minimum_required(VERSION 3.10)
project(myapp C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_compile_options(-Wall -Wextra -pedantic -g)

set(SRC_DIR ${CMAKE_SOURCE_DIR}/src)
include_directories(${SRC_DIR})

# file(GLOB_RECURSE SRC_FILES ${SRC_DIR}/*.c)
set(SRC_FILES
    # ---------- START FILES ----------
# ---------- END FILES ----------
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_executable(myapp ${SRC_FILES})

add_custom_command(
    OUTPUT myapp.bin
    COMMAND ${CMAKE_OBJCOPY} -O binary myapp myapp.bin
    DEPENDS myapp
    COMMENT "Generating myapp.bin from executable"
)

add_custom_target(bin ALL DEPENDS myapp.bin)

add_custom_target(test
    COMMAND ${CMAKE_BINARY_DIR}/myapp --help
    DEPENDS myapp
    COMMENT "Running myapp with --help"
)
