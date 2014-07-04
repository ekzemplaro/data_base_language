tyrant_create.exe: tyrant_create.cs
	mcs tyrant_create.cs \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
