COMMON=/var/www/data_base/common/csharp_common
riak_read.exe: riak_read.cs
	dmcs riak_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
