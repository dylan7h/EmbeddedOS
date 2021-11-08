TOOLCHAIN		:= /opt/arm/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin
CROSS_COMPILE	:= arm-none-eabi
AS				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-as
CC				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-gcc
CXX				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-g++
OC				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-objcopy
OD				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-objdump

ARCH			:= armv7-a
CPU				:= cortex-a8

all:
	$(AS) -march=$(ARCH) -mcpu=$(CPU) -o Entry.o boot/Entry.S
	$(OC) -O binary Entry.o Entry.bin
	hexdump Entry.bin
	