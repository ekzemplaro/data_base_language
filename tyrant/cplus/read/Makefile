CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: tyrant_read
tyrant_read: tyrant_read.cpp
	g++ -o tyrant_read tyrant_read.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f tyrant_read

