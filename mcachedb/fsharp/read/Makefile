CSHARP_COMMON=/var/www/uchida/data_base/common/csharp_common
mcachedb_read.exe: mcachedb_read.fs
	fsharpc mcachedb_read.fs \
		-r:table_manipulate.dll \
		-r:mcached_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
