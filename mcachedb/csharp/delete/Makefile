mcachedb_delete.exe: mcachedb_delete.cs
	mcs mcachedb_delete.cs \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
