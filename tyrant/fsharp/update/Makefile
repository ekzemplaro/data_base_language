CSHARP_COMMON=/var/www/uchida/data_base/common/csharp_common
tyrant_update.exe: tyrant_update.fs
	fsc.exe tyrant_update.fs \
		-r:table_manipulate.dll \
		-r:mcached_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
