CPLUS_COMMON=/var/www/data_base/common/cplus_common
riak_update.exe: riak_update.cpp
	g++ -o riak_update riak_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f riak_update
