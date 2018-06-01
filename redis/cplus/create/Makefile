CPLUS_COMMON=/var/www/data_base/common/cplus_common
all: redis_create
redis_create: redis_create.cpp
	clang++ -o redis_create redis_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/redis_manipulate.o \
		$(CPLUS_COMMON)/socket_manipulate.o \
			-ljson11
clean:
	rm -f redis_create

