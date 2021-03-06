
xl2tpd-configure:
	@true

xl2tpd:
#	$(MAKE) -C xl2tpd CFLAGS="$(COPTS) $(MIPS16_OPT) -ffunction-sections -fdata-sections -Wl,--gc-sections -fno-builtin -Wall -DSANITY -DLINUX -I$(TOP)/kernel_headers/$(KERNELRELEASE)/include -I$(LINUXDIR)/include/ -DUSE_KERNEL -DIP_ALLOCATION -I$(TOP)/libpcap" LDFLAGS+="-L$(TOP)/libpcap"
	$(MAKE) -C xl2tpd CFLAGS="$(COPTS) $(MIPS16_OPT) -ffunction-sections -fdata-sections -Wl,--gc-sections -fno-builtin -Wall -DNEED_PRINTF -DSANITY -DLINUX -DDEBUG_PPPD -DTRUST_PPPD_TO_DIE -I$(TOP)/kernel_headers/$(KERNELRELEASE)/include -I$(LINUXDIR)/include/ -DUSE_KERNEL -DIP_ALLOCATION -I$(TOP)/libpcap" LDFLAGS+="-L$(TOP)/libpcap" LDLIBS+=" -lm"

xl2tpd-clean:
	$(MAKE) -C xl2tpd clean

xl2tpd-install:
	mkdir -p $(INSTALLDIR)/xl2tpd/usr/sbin
	install -D xl2tpd/xl2tpd $(INSTALLDIR)/xl2tpd/usr/sbin/xl2tpd
	install -D xl2tpd/xl2tpd-control $(INSTALLDIR)/xl2tpd/usr/sbin/xl2tpd-control
	mkdir -p ${INSTALLDIR}/xl2tpd/etc/xl2tpd
	ln -sf /tmp/xl2tpd/xl2tpd.conf ${INSTALLDIR}/xl2tpd/etc/xl2tpd/xl2tpd.conf
