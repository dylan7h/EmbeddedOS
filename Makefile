TOOLCHAIN		:= /opt/arm/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin
CROSS_COMPILE	:= arm-none-eabi
AS				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-as
CC				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-gcc
CXX				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-g++
OC				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-objcopy
OD				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-objdump
LD				:= $(TOOLCHAIN)/$(CROSS_COMPILE)-ld

ARCH			:= armv7-a
CPU				:= cortex-a8

all:
	$(AS) -march=$(ARCH) -mcpu=$(CPU) -o Entry.o boot/Entry.S
	$(OC) -O binary Entry.o Entry.bin
	hexdump Entry.bin
	$(LD) -n -T navilos.ld -nostdlib -o navilos.axf Entry.o
	$(OD) -D navilos.axf

debug:
	qemu-system-arm -M realview-pb-a8 -kernel navilos.axf -S -gdb tcp::1234,ipv4
	