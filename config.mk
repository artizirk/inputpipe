DESTDIR = /usr/local/bin
CC = gcc
CFLAGS = -I./src -g

# Want to build with musl? run make getheaders and uncomment lines below
CFLAGS += -Ikernel-headers/$(shell uname -m)/include
CC = musl-gcc
