include config.mk

BINS = inputpipe-server inputpipe-client
COMMON_OBJS = src/packet.o
SERVER_OBJS = $(COMMON_OBJS) src/server.o
CLIENT_OBJS = $(COMMON_OBJS) src/client.o
INSTALL = install

all: $(BINS)

install: $(BINS)
	$(INSTALL) inputpipe-server $(DESTDIR)/inputpipe-server
	$(INSTALL) inputpipe-client $(DESTDIR)/inputpipe-client

inputpipe-server: $(SERVER_OBJS)
	$(CC) -o $@ $(SERVER_OBJS) $(LDFLAGS)

inputpipe-client: $(CLIENT_OBJS)
	$(CC) -o $@ $(CLIENT_OBJS) $(LDFLAGS)

clean:
	rm -f $(BINS) $(SERVER_OBJS) $(CLIENT_OBJS)

distclean: clean
	rm -rf kernel-headers

getheaders:
	git clone --depth=1 git://github.com/sabotage-linux/kernel-headers
