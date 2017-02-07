COMMON=/var/www/data_base/common/csharp_common
riak_create.exe: riak_create.cs
	dmcs riak_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
