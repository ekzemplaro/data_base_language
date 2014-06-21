CPLUS_COMMON=/var/www/data_base/common/cplus_common
riak_delete.exe: riak_delete.cpp
	g++ -o riak_delete riak_delete.cpp \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f riak_delete
