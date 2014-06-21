mcachedb_create.exe: mcachedb_create.cs
	dmcs mcachedb_create.cs \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
