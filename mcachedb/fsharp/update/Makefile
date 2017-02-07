CSHARP_COMMON=/var/www/uchida/data_base/common/csharp_common
mcachedb_update.exe: mcachedb_update.fs
	fsharpc mcachedb_update.fs \
		-r:table_manipulate.dll \
		-r:mcached_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
