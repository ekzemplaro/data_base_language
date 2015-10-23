mcached_delete.exe: mcached_delete.cs
	mcs mcached_delete.cs \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
