mcachedb_create.exe: mcachedb_create.boo
	booc mcachedb_create.boo \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe *.mdb
