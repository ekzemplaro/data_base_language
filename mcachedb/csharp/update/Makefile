mcachedb_update.exe: mcachedb_update.cs
	dmcs mcachedb_update.cs \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
