CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: redis_read
redis_read: redis_read.cpp
	g++ -o redis_read redis_read.cpp \
		$(CPLUS_COMMON)/redis_socket.o \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f redis_read

