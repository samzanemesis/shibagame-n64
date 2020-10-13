include_directories(
	${N64_NEWLIBINCDIR}/
	$ENV{ROOT}/usr/include/
	$ENV{ROOT}/usr/include/nusys
	$ENV{ROOT}/usr/include/PR/
)

link_directories(
	${N64_NEWLIBDIR}/
	$ENV{ROOT}/usr/lib
	$ENV{ROOT}/usr/lib/nusys
	$ENV{ROOT}/usr/lib/PR/
)

#set(N64SDK_C_FLAGS "-D_MIPS_SZLONG=32 -D_MIPS_SZINT=32 -D_LANGUAGE_C -D_ULTRA64 -D__EXTENSIONS__ -fno-PIC -mabi=32 -mno-shared -mno-abicalls -DF3DEX_GBI_2")
#set(N64SDK_ASM_FLAGS "-x assembler-with-cpp -fno-PIC -mabi=32 -mno-shared -mno-abicalls" )

set(N64SDK_C_FLAGS "-mabi=32 -mno-shared -mno-abicalls --specs=nosys.specs")
set(N64SDK_ASM_FLAGS " -fno-PIC -mabi=32 -mno-shared -mno-abicalls" )

# Extra util definition from N64SDK
set(FLT2C flt2c)
set(IC ic)
set(MIDIPARSE midiparse)
set(MIDICVT midicvt)
set(MIDICOMP midicomp)
set(SBC sbc)
set(NLD nld)
set(RGB2C rgb2c)
set(MKSPRITE mksprite)
set(MKISPRITE mkisprite)
set(TABLEDESIGN tabledesign)
set(VADPCM_ENC vadpcm_enc)
set(VADPCM_DEC vadpcm_dec)
set(RSPASM rspasm)
set(BUILDTASK buildtask)
set(RSP2ELF rsp2elf)
set(DATA2RDRAM data2rdram)
set(RDRAM2DATA rdram2data)
set(TMEMFMT tmemfmt)
set(ECS2VL ecs2vl)
set(ECSGEN ecs_gen)
set(MERRG merrg)
set(RMVCOM remove_comments)
set(TAB2VMEM tab2vmem)
set(TAB2WVS tab2wvs)
set(VSIG vsig)
set(XNET xnet)
set(MAKEROM spicy --as_command=mips64-elf-as --cpp_command=cpp --ld_command=${CMAKE_LD} --objcopy_command=${CMAKE_OBJCOPY} )

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.mips64-elf.cmake)