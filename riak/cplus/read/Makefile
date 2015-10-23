CPLUS_COMMON=/var/www/data_base/common/cplus_common
riak_read: riak_read.cpp
	clang++ -o riak_read riak_read.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f riak_read
