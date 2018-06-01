CPLUS_COMMON=/var/www/data_base/common/cplus_common
redis_delete: redis_delete.cpp
	clang++ -o redis_delete redis_delete.cpp \
		$(CPLUS_COMMON)/redis_manipulate.o \
		$(CPLUS_COMMON)/socket_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/text_manipulate.o \
			-ljson11
clean:
	rm -f redis_delete

