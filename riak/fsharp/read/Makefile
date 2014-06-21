COMMON=/var/www/data_base/common/csharp_common
riak_read.exe: riak_read.fs
	fsharpc riak_read.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:FSharp.Data.dll
clean:
	rm -f *.exe
