CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: mcachedb_update
mcachedb_update: mcachedb_update.cpp
	clang++ -o mcachedb_update mcachedb_update.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f mcachedb_update

