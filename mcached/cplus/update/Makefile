CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: mcached_update
mcached_update: mcached_update.cpp
	clang++ -o mcached_update mcached_update.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f mcached_update

