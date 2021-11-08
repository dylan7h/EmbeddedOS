#!/bin/bash
ARCH="x86_64"
VERSION="10.2-2020.11"
PRE_FIX="https://developer.arm.com/-/media/Files/downloads/gnu-a/${VERSION}/binrel/gcc-arm-${VERSION}-${ARCH}-"
EXTENSION="tar.xz"
TOOLCHAIN=(\
    "arm-none-eabi" \
    "arm-none-linux-gnueabihf" \
    "aarch64-none-elf" \
    "aarch64-none-linux-gnu" \
    "aarch64_be-none-linux-gnu"
)

echo sudo apt update
sudo apt update

echo sudo apt install aria2
sudo apt install aria2

for var in ${TOOLCHAIN[@]} 
do
    ARGUMENTS+="${PRE_FIX}${var}.${EXTENSION} "
done

aria2c -Z ${ARGUMENTS}

echo rm -rf /opt/arm
sudo rm -rf /opt/arm 

echo mkdir -p /opt/arm
sudo mkdir -p /opt/arm

sudo chown $(whoami):$(whoami) /opt/arm
chmod g+w /opt/arm

for var in ${TOOLCHAIN[@]} 
do
    tar Jxvf gcc-arm-${VERSION}-${ARCH}-${var}.${EXTENSION} -C /opt/arm
done

for var in ${TOOLCHAIN[@]} 
do
    rm -rf gcc-arm-${VERSION}-${ARCH}-${var}.${EXTENSION}
done
