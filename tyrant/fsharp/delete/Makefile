CSHARP_COMMON=/var/www/uchida/data_base/common/csharp_common
tyrant_delete.exe: tyrant_delete.fs
	fsc.exe tyrant_delete.fs \
		-r:table_manipulate.dll \
		-r:mcached_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
