CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: redis_update
redis_update: redis_update.cpp
	g++ -o redis_update redis_update.cpp \
		$(CPLUS_COMMON)/redis_socket.o \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f redis_update

