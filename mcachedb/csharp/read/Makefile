mcachedb_read.exe: mcachedb_read.cs
	mcs mcachedb_read.cs \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
