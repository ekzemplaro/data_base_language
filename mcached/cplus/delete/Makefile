CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: mcached_delete
mcached_delete: mcached_delete.cpp
	g++ -o mcached_delete mcached_delete.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f mcached_delete

