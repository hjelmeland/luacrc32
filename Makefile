LUA_INCLUDE = /usr/include/lua5.1

CC	?= gcc
CFLAGS1	= -fPIC
CFLAGS	?= -I . -I $(LUA_INCLUDE)
LDFLAGS1	= -shared
LDFLAGS	?=
STRIP	?= $(CROSS_COMPILE)strip

DESTDIR		?=
prefix		?= /usr
libdir		?= $(prefix)/lib
includedir	?= $(prefix)/include

lualibdir	?= $(libdir)/lua/5.1
luaincludedir	?= $(includedir)/lua5.1

INSTALL		:= install
INSTALL_DATA	:= $(INSTALL) -m 644
INSTALL_DIR	:= $(INSTALL) -m 755 -d
INSTALL_PROGRAM	:= $(INSTALL) -m 755
RM		:= rm -f

TARGET	= crc32.so 
OBJS	= crc32.o wrap.o
HEADER	= crc32.h

default: $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET) 

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS1) $(LDFLAGS) -o $(TARGET) $(OBJS) $(LIBS)
	$(STRIP) $(TARGET)

.c.o:
	$(CC) $(CFLAGS1) $(CFLAGS) -c $< -o $@

install:
	$(INSTALL_DIR) $(DESTDIR)$(lualibdir)
	$(INSTALL_DATA) $(TARGET) $(DESTDIR)$(lualibdir)
