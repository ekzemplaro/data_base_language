CPLUS_COMMON=/var/www/data_base/common/cplus_common
riak_create.exe: riak_create.cpp
	g++ -o riak_create riak_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
			-lcurl
clean:
	rm -f riak_create
