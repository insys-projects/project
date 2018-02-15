

setenv hw_name fm403c
#setenv hw_name d2xt005
#setenv hw_name d2xt006
#setenv hw_name d2xt007
#setenv hw_name pegas
#setenv hw_name ku_sscos
setenv tftp_root ./${hw_name}
setenv name_kern uImage-${hw_name}
setenv host_user karak
setenv nfs_root /home/${host_user}/targetfs-${hw_name}
#setenv nfs_root /home/${host_user}/targetfs
setenv dbg_uart 2

setenv autoload yes
setenv cpuid 0
setenv targetip 192.168.0.24${cpuid}
setenv server 192.168.0.102
setenv gateway 192.168.0.1
setenv netmask 255.255.255.0
setenv serverip ${server}
setenv nfsserver ${server}
setenv gatewayip ${gateway}
setenv ipaddr ${targetip}


#
# Boot from SD
#

setenv bootargs_sd 'console=ttyO'${dbg_uart}',115200n8 \
rootdelay=3 rw mem=512M@0x80000000 earlyprintk \
root=/dev/mmcblk0p2 rootfstype=ext3 \
ip='${targetip}':'${server}':'${gateway}':'${netmask}':'${hw-name}':eth0:off'

setenv bootcmd_sd 'mmc rescan 0; \
fatload mmc 0 0x82000000 arm.bmp; \
bmp display 0x82000000; \
fatload mmc 0 0x81000000 '${name_kern}'; \
bootm 0x81000000;'

#
# Boot from NFS
#

setenv addip_fix 'setenv bootargs ${bootargs_nfs} ip=${ipaddr}:${nfsserver}:${gateway}:${netmask}:${hw_name}:eth0:off'
setenv addip_dyn 'setenv bootargs ${bootargs_nfs} ip=dhcp'
setenv addip_dyn_ti 'setenv bootargs ${bootargs_nfs_ti} ip=dhcp'

setenv bootargs_nfs 'console=ttyO'${dbg_uart}',115200n8 \
root=/dev/nfs nfsroot='${server}':'${nfs_root}', nolock rw rootwait \
mem=176M earlyprintk'

setenv bootargs_nfs_ti 'console=ttyO'${dbg_uart}',115200n8 \
root=/dev/nfs nfsroot='${server}':'${nfs_root}', nolock rw rootwait \
mem=512M@0x80000000 earlyprintk vti816xfb.vram=0:16M,1:16M,2:6M'

setenv bootcmd_nfs_fix 'tftp 0x81000000 '${tftp_root}/${name_kern}'; \
run addip_fix; \
bootm 0x81000000;'

setenv bootcmd_nfs_dyn 'tftp 0x81000000 '${tftp_root}/${name_kern}'; \
run addip_dyn; \
bootm 0x81000000;'

setenv bootcmd_nfs_dyn_ti 'tftp 0x81000000 '${tftp_root}/${name_kern}'; \
run addip_dyn_ti; \
bootm 0x81000000;'

#
# Boot from SPI
#

setenv bootargs_spi 'console=ttyO'${dbg_uart}',115200n8 mem=512M@0x80000000 earlyprintk \
root=/dev/ram0 rw initrd=0x82000000,64M ramdisk_size=65536 \
ip='${targetip}':'${server}':'${gateway}':'${netmask}':'${hw-name}':eth0:on'

setenv bootcmd_spi 'sf probe 0; \
sf read 0x81000000 0x80000 0x280000; \
sf read 0x82000000 0x300000 0xD00000; \
bootm 0x81000000;'

#
# Boot from NAND
#

setenv bootargs_nand 'console=ttyO'${dbg_uart}',115200n8 mem=512M@0x80000000 earlyprintk \
root=/dev/ram0 rw initrd=0x82000000,64M ramdisk_size=65536 \
ip='${targetip}':'${server}':'${gateway}':'${netmask}':'${hw-name}':eth0:on'

setenv bootcmd_nand 'nand device 0; \
nand read 0x81000000 0x280000 0x460000; \
nand read 0x82000000 0x6C0000 0xc820000; \
bootm 0x81000000;'

#setenv bootargs ${bootargs_nand}
#setenv bootcmd ${bootcmd_nand}

#setenv bootargs ${bootargs_spi}
#setenv bootcmd ${bootcmd_spi}

setenv bootargs ${bootargs_sd}
setenv bootcmd ${bootcmd_sd}

#setenv bootargs ${bootargs_nfs}
#setenv bootcmd ${bootcmd_nfs_dyn}
#setenv bootcmd ${bootcmd_nfs_fix}

#setenv bootargs ${bootargs_nfs_ti}
#setenv bootcmd ${bootcmd_nfs_dyn_ti}

echo Save environment: ${hw_name}
saveenv

echo Start booting module: ${hw_name}

boot
