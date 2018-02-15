#!/bin/bash

#
# Скрипт конвертирует boot.cmd -> boot.scr
#

mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n 'U-boot Script' -d $1 $2

cp $2 ${HOME}/tftpboot/$2
