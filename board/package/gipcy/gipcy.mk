################################################################################
#
# gipcy makefile
#
################################################################################

GIPCY_VERSION = master
GIPCY_SITE = $(call github,karakozov,gipcy,$(GIPCY_VERSION))
#GIPCY_SITE = $(HOME)/bardy/gipcy
#GIPCY_SITE_METHOD = local
GIPCY_INSTALL_TARGET = YES
GIPCY_INSTALL_STAGING = YES
GIPCY_LIBNAME = libgipcy.so
GIPCY_DRVNAME = ipcdrv.ko
GIPCY_START = S51ipcdrv

define GIPCY_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

GIPCY_DIR = $(TARGET_DIR)/home/embedded/gipcy
GIPCY_INCDIR = $(TARGET_DIR)/home/embedded/gipcy/include

define GIPCY_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0644 -D $(@D)/lib/$(GIPCY_LIBNAME) $(TARGET_DIR)/home/embedded/gipcy/$(GIPCY_LIBNAME)
        $(INSTALL) -m 0644 -D $(@D)/lib/$(GIPCY_DRVNAME) $(TARGET_DIR)/home/embedded/gipcy/$(GIPCY_DRVNAME)
endef

define GIPCY_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 755 package/gipcy/$(GIPCY_START) $(TARGET_DIR)/etc/init.d/$(GIPCY_START)
endef

define GIPCY_INSTALL_STAGING_CMDS
        $(INSTALL) -m 0644 -D $(@D)/lib/$(GIPCY_LIBNAME) $(STAGING_DIR)/usr/lib/$(GIPCY_LIBNAME)
        cp -r $(@D)/include $(STAGING_DIR)/usr/include/gipcy
endef

$(eval $(kernel-module))
$(eval $(generic-package))
