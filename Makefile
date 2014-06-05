all:

install: all
	mkdir -p "$(DESTDIR)/etc/init.d"
	cp ex/init.d "$(DESTDIR)/etc/init.d/ovfdep"
	
	mkdir -p "$(DESTDIR)/etc/ovfdep/hook.d"
	cp ex/ovfdep.conf "$(DESTDIR)/etc/ovfdep/"
	cp hook.d/* "$(DESTDIR)/etc/ovfdep/hook.de/"
	
	mkdir -p "$(DESTDIR)/usr/share/ovfdep"
	cp share/* "$(DESTDIR)/usr/share/ovfdep/"

clean:
