mcachedb_read.exe: mcachedb_read.cs
	dmcs mcachedb_read.cs \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll \
		-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
