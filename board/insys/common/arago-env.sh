#!/bin/sh

#echo "================================================"
#echo " ARAGO ENV ARGS:"
#echo " ARG0 = $0"
#echo " ARG1 = $1"
#echo " ARG2 = $2"
#echo " ARGS = $#"
#echo "================================================"

SETTINGS_FILE='arago-env.sh'
SCRIPT_LOC="./"

if [ $# != 0 ]; then
        SCRIPT_LOC="$1"
else
        #  SCRIPT_LOC should point to script location
        if [ "$0" == "ksh" ]; then
                SCRIPT_LOC_TMP_UNI=`readlink -f ${BRD_ARG_}`
        else
                SCRIPT_LOC_TMP_UNI=$BASH_SOURCE
        fi
        SCRIPT_LOC_TMP_UNI=${SCRIPT_LOC_TMP_UNI%/*}
        if [ "$SCRIPT_LOC_TMP_UNI" != "" ]; then
                if [ "$SCRIPT_LOC_TMP_UNI" == "arago-env.sh" ]; then
                        SCRIPT_LOC_TMP_UNI="./"
                fi
                SCRIPT_LOC_TMP_UNI=`readlink -f ${SCRIPT_LOC_TMP_UNI}`
                if [ $? == 0 ]; then
                        SCRIPT_LOC=${SCRIPT_LOC_TMP_UNI}
                fi
        fi
        unset SCRIPT_LOC_TMP_UNI
fi

#export TOOLS_DIR=`readlink -f "${SCRIPT_LOC}"`
export TOOLS_DIR=${HOME}/project.git/fm403c
export TOOLCHAIN_PATH=${TOOLS_DIR}/host/opt/ext-toolchain/bin
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
export KERNELDIR=${TOOLS_DIR}/build/linux-master
export INSTALL_MOD_PATH=${HOME}/targetfs-${BOARD}
export CSTOOL_DIR=${TOOLCHAIN_PATH}
export CSTOOL_PREFIX=${TARGET_SYS}-
export INSTALL_PREFIX=${HOME}/targetfs-${BOARD}
export TARGETFS_USER=embedded
#export BUILD_DIR=${TOOLS_DIR}/build

export PS1="\[\e[32;1m\][arago-${BOARD}]\[\e[0m\]:\w> "
