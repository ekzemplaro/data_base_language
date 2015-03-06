CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: mcachedb_read
mcachedb_read: mcachedb_read.cpp
	clang++ -o mcachedb_read mcachedb_read.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f mcachedb_read

