################################################################################
#
# bardy makefile
#
################################################################################

BARDY_VERSION = master
BARDY_SITE = $(HOME)/bardy
BARDY_SITE_METHOD = local
BARDY_INSTALL_TARGET = YES
BARDY_INSTALL_STAGING = NO

BDIR = $(@D)
GINC = $(STAGING_DIR)/usr/include/gipcy
GLIB = $(STAGING_DIR)/usr/local/lib

BARDY_MAKE_OPTS += BARDYDIR=$(BDIR)
BARDY_MAKE_OPTS += GIPCYINC=$(GINC)
BARDY_MAKE_OPTS += GIPCYLIB=$(GLIB)

BARDY_CFLAGS = $(TARGET_CFLAGS) -I$(BDIR)/BRDINC -I$(BDIR)/BRDINC/ctrladmpro -I$(GINC)
BARDY_CPPFLAGS = $(TARGET_CPPFLAGS) -I$(BDIR)/BRDINC -I$(BDIR)/BRDINC/ctrladmpro -I$(GINC)
BARDY_CXXFLAGS = $(TARGET_CXXFLAGS) -I$(BDIR)/BRDINC -I$(BDIR)/BRDINC/ctrladmpro -I$(GINC)

BARDY_MAKE_OPTS += CFLAGS="$(BARDY_CFLAGS)"
BARDY_MAKE_OPTS += CPPFLAGS="$(BARDY_CPPFLAGS)"
BARDY_MAKE_OPTS += CXXFLAGS="$(BARDY_CXXFLAGS)"

define BARDY_CONFIGURE_CMDS
endef

define BARDY_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
            $(BARDY_MAKE_OPTS) -C $(@D)
endef

BARDY_DIR = $(TARGET_DIR)/home/embedded/bardy

define BARDY_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0644 -D $(@D)/bin/libbrd.so $(TARGET_DIR)/home/embedded/bardy/lib
        $(INSTALL) -m 0644 -D $(@D)/bin/lambpex.ko $(TARGET_DIR)/home/embedded/bardy/drivers
endef

$(eval $(generic-package))
