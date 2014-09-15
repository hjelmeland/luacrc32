LUA_INCLUDE = /usr/include/lua5.1

CC	= gcc
STRIP	= strip
TARGET	= crc32.so 
OBJS	= crc32.o wrap.o
CFLAGS	= -I . -I $(LUA_INCLUDE) -fPIC
LDFLAGS	= -shared -fPIC 

default: $(TARGET)


clean:
	rm -f $(OBJS) $(TARGET) 

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $(TARGET) $(OBJS) $(LIBS)
	$(STRIP) $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
