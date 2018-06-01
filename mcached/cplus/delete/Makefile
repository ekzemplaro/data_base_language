CPLUS_COMMON=/var/www/data_base/common/cplus_common
mcached_delete: mcached_delete.cpp
	clang++ -o mcached_delete mcached_delete.cpp \
		$(CPLUS_COMMON)/mcached_socket.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/socket_manipulate.o \
			-ljson11
clean:
	rm -f mcached_delete

