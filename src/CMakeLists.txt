cmake_minimum_required(VERSION 3.15)

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.n64sdkmod.cmake)

set(CMAKE_VERBOSE_MAKEFILE ON CACHE BOOL "ON" FORCE) # debug helper

project(SHIBAGAME #rename for your ROM name
		LANGUAGES C ASM)

set( ELF_NAME 			${PROJECT_NAME}.elf )
set( BIN_NAME 			${PROJECT_NAME}.bin )
set( ROM_NAME 			${PROJECT_NAME}.n64 )

file(GLOB_RECURSE SHIBAGAME_SOURCES
	${PROJECT_SOURCE_DIR}/*.c
	${PROJECT_SOURCE_DIR}/*.cpp
)
file(GLOB_RECURSE SHIBAGAME_INCLUDE
	${PROJECT_SOURCE_DIR}/*.h
)

add_executable( ${ELF_NAME}
	${SHIBAGAME_SOURCES}
)

target_include_directories( ${ELF_NAME}
	PUBLIC
)

#Run our custom linker
#include $(COMMONRULES)

#add_custom_command(TARGET ${ELF_NAME}
#                  POST_BUILD
#				  COMMAND makemask ARGS ${ELF_NAME}
#				  )

#add_custom_command(TARGET ${ELF_NAME}
#                  POST_BUILD
#				  COMMAND ${MAKEROM} ARGS -s 9 -r ${ELF_NAME} spec
#				  )