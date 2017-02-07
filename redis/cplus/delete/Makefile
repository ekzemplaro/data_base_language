CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: redis_delete
redis_delete: redis_delete.cpp
	g++ -o redis_delete redis_delete.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f redis_delete

