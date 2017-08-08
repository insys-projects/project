#!/bin/bash

TARGET=$1
BOARD=$2

echo "================================================"
echo " POST BUILD ARGS:"
echo " TARGET = ${TARGET}"
echo " BOARD =  ${BOARD}"
echo "================================================"

ROOTFS_USER=embedded
ROOTFS=${TARGET}

#
# gipcy
#

echo "==== Copy GIPCY ===="

sudo cp -f ${HOME}/bardy/gipcy/lib/*.so ${ROOTFS}/home/${ROOTFS_USER}/bardy
sudo cp -f ${HOME}/bardy/gipcy/lib/*.so.0 ${ROOTFS}/home/${ROOTFS_USER}/bardy
sudo cp -f ${HOME}/bardy/gipcy/lib/*.ko ${ROOTFS}/home/${ROOTFS_USER}/drivers

#
# bardy
#

echo "==== Copy BARDY ===="

sudo cp -f ${HOME}/bardy/bin/*.ko ${ROOTFS}/home/${ROOTFS_USER}/drivers
sudo cp -fa ${HOME}/bardy/bin/*.so ${ROOTFS}/home/${ROOTFS_USER}/bardy
sudo cp -fa ${HOME}/bardy/bin/*.so.0 ${ROOTFS}/home/${ROOTFS_USER}/bardy

#
# examples
#

echo "==== Copy EXAMPLES ===="

sudo cp -f ${HOME}/bardy/bin/exam_adc ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -f ${HOME}/bardy/bin/exam_edac ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -f ${HOME}/bardy/bin/exam_base ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -f ${HOME}/bardy/bin/exam_pio ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -f ${HOME}/bardy/bin/exam_fdds ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -f ${HOME}/bardy/bin/isvi_server ${ROOTFS}/home/${ROOTFS_USER}/examples

echo ================ DONE ================
