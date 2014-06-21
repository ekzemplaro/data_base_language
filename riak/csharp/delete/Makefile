COMMON=/var/www/data_base/common/csharp_common
riak_delete.exe: riak_delete.cs
	dmcs riak_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
