COMMON=/var/www/data_base/common/csharp_common
riak_update.exe: riak_update.cs
	dmcs riak_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
