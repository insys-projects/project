#!/bin/sh

PWD=${HOME}/project/${BOARD}

export TOOLCHAIN_PATH=${PWD}/host/opt/ext-toolchain/bin
export TARGET_SYS=arm-arago-linux-gnueabi
export CC=${TARGET_SYS}-gcc
export CPP="${TARGET_SYS}-gcc"
export CXX="${TARGET_SYS}-gcc"
export NM=${TARGET_SYS}-nm
export RANLIB=${TARGET_SYS}-ranlib
export OBJCOPY=${TARGET_SYS}-objcopy
export STRIP=${TARGET_SYS}-strip
export AS=${TARGET_SYS}-as
export AR=${TARGET_SYS}-ar
export OBJDUMP=${TARGET_SYS}-objdump
export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
export PATH=${TOOLCHAIN_PATH}:${PATH}
export PATH=${HOME}/embedded/common:${PATH}
export PATH=${TOOLCHAIN_PATH}:${PATH}
export CROSS_COMPILE=${TARGET_SYS}-
export ARCH=arm
export KERNELDIR=${PWD}/build/linux-master
export INSTALL_MOD_PATH=${HOME}/targetfs-${BOARD}
export CSTOOL_DIR=${TOOLCHAIN_PATH}
export CSTOOL_PREFIX=${TARGET_SYS}-
export INSTALL_PREFIX=${HOME}/targetfs-${BOARD}
export TARGETFS_USER=embedded
export BUILD_DIR=${PWD}/build

export PS1="\[\e[32;1m\][arago-${BOARD}]\[\e[0m\]:\w> "