CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: mcached_create
mcached_create: mcached_create.cpp
	g++ -o mcached_create mcached_create.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f mcached_create

