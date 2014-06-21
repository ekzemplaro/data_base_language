mcached_read.exe: mcached_read.cs
	mcs mcached_read.cs \
		-r:table_manipulate.dll \
		-r:Memcached.ClientLibrary.dll \
		-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
