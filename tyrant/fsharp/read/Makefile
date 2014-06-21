CSHARP_COMMON=/var/www/uchida/data_base/common/csharp_common
tyrant_read.exe: tyrant_read.fs
	fsharpc tyrant_read.fs \
		-r:table_manipulate.dll \
		-r:mcached_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
