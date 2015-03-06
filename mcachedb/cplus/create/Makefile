CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: mcachedb_create
mcachedb_create: mcachedb_create.cpp
	clang++ -o mcachedb_create mcachedb_create.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f mcachedb_create

