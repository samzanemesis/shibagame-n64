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
	${PROJECT_SOURCE_DIR}/*.cc
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

# Microcode BS
set(N64_MICROCODE_DIR $ENV{ROOT}/usr/lib/PR/)
target_link_libraries( ${ELF_NAME} 
	${N64_MICROCODE_DIR}/rspboot.o
	${N64_MICROCODE_DIR}/gspF3DEX2.fifo.o
	${N64_MICROCODE_DIR}/gspL3DEX2.fifo.o
	${N64_MICROCODE_DIR}/gspF3DEX2.Rej.fifo.o
	${N64_MICROCODE_DIR}/gspF3DEX2.NoN.fifo.o
	${N64_MICROCODE_DIR}/gspF3DLX2.Rej.fifo.o
	${N64_MICROCODE_DIR}/gspS2DEX2.fifo.o
	nusys
	ultra_rom
)


#add_custom_command(TARGET ${ELF_NAME}
#                  POST_BUILD
#				  COMMAND makemask ARGS ${ELF_NAME}
#				  )

#add_custom_command(TARGET ${ELF_NAME}
#                  POST_BUILD
#				  COMMAND ${MAKEROM} ARGS -s 9 -r ${ELF_NAME} spec
#				  )