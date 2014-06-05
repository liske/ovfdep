all:

install: all
	mkdir -p "$(DESTDIR)/usr/share/ovfdep"
	cp share/* "$(DESTDIR)/usr/share/ovfdep/"

clean:
