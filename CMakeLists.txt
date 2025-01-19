cmake_minimum_required(VERSION 3.20)
project(DecimalSGX "C" "CXX")
set(PROJECT_VERSION 4.0.0)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
message(STATUS "CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(SGX REQUIRED)

set(LIBMPDEC_SRC_FILES
        libmpdec/basearith.c
        libmpdec/constants.c
        libmpdec/context.c
        libmpdec/convolute.c
        libmpdec/crt.c
        libmpdec/difradix2.c
        libmpdec/fnt.c
        libmpdec/fourstep.c
        libmpdec/io.c
        libmpdec/mpalloc.c
        libmpdec/mpdecimal.c
        libmpdec/mpsignal.c
        libmpdec/numbertheory.c
        libmpdec/sixstep.c
        libmpdec/transpose.c
)

add_trusted_library(${PROJECT_NAME}
        SRCS ${LIBMPDEC_SRC_FILES}
)

target_compile_definitions(${PROJECT_NAME} PRIVATE CONFIG_64)
target_compile_definitions(${PROJECT_NAME} PRIVATE ASM)
target_compile_definitions(${PROJECT_NAME} PUBLIC MPDECIMAL_ENABLE_SGX)

include("cmake/setup_installation.cmake")
