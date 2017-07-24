#!/bin/bash

BOARD=$2

echo "================================================"
echo "==== prepare filesystem for board: ${BOARD} ===="
echo "================================================"

ROOTFS_USER=embedded
ROOTFS=${HOME}/targetfs-${BOARD}

#
# Подготовим корневую файловую систему
#
sudo mkdir -p ${ROOTFS}
cd ${ROOTFS}
sudo rm -fr *
sudo cp ${BINARIES_DIR}/rootfs.tar.bz2 ${ROOTFS}
sudo tar -xjvf rootfs.tar.bz2
sudo chown -R ${USER}:${USER} ${ROOTFS}/home ${ROOTFS}/etc ${ROOTFS}/lib
sudo rm rootfs.tar.bz2

#
# gipcy
#
sudo cp -fv ${HOME}/bardy/gipcy/lib/*.so ${ROOTFS}/home/${ROOTFS_USER}/bardy
sudo cp -fv ${HOME}/bardy/gipcy/lib/*.so.0 ${ROOTFS}/home/${ROOTFS_USER}/bardy
sudo cp -fv ${HOME}/bardy/gipcy/lib/*.ko ${ROOTFS}/home/${ROOTFS_USER}/drivers

#
# bardy
#
sudo cp -fv ${HOME}/bardy/bin/*.ko ${ROOTFS}/home/${ROOTFS_USER}/drivers
sudo cp -fva ${HOME}/bardy/bin/*.so ${ROOTFS}/home/${ROOTFS_USER}/bardy
sudo cp -fva ${HOME}/bardy/bin/*.so.0 ${ROOTFS}/home/${ROOTFS_USER}/bardy

#
# examples
#
sudo cp -fv ${HOME}/bardy/bin/exam_adc ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -fv ${HOME}/bardy/bin/exam_edac ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -fv ${HOME}/bardy/bin/exam_base ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -fv ${HOME}/bardy/bin/exam_pio ${ROOTFS}/home/${ROOTFS_USER}/examples
sudo cp -fv ${HOME}/bardy/bin/exam_fdds ${ROOTFS}/home/${ROOTFS_USER}/examples

#
# linux kernel for tftpboot
#
sudo cp -fv ${HOME}/project/${BOARD}/images/uImage ${HOME}/tftpboot/${BOARD}/uImage-${BOARD}

echo ================ DONE ================
