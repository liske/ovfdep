all:

install: all
	mkdir -p "$(DESTDIR)/etc/init.d"
	cp ex/init.d "$(DESTDIR)/etc/init.d/ovfdep"
	
	mkdir -p "$(DESTDIR)/etc/ovfdep/hook.d"
	cp ex/ovfdep.conf "$(DESTDIR)/etc/ovfdep/"
	cp hook.d/* "$(DESTDIR)/etc/ovfdep/hook.d/"
	
	mkdir -p "$(DESTDIR)/usr/share/ovfdep"
	cp share/* "$(DESTDIR)/usr/share/ovfdep/"
	
	mkdir -p "$(DESTDIR)/usr/sbin"
	cp ovfdep "$(DESTDIR)/usr/sbin/"
	
	mkdir -p "$(DESTDIR)/etc/network/if-pre-up.d"
	mkdir -p "$(DESTDIR)/etc/network/if-down.d"
	cp ovfdep-up "$(DESTDIR)/etc/network/if-pre-up.d/"
	cp ovfdep-down "$(DESTDIR)/etc/network/if-down.d/"

clean:
