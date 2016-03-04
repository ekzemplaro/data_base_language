CSHARP_COMMON=/var/www/uchida/data_base/common/csharp_common
mcached_delete.exe: mcached_delete.fs
	fsharpc mcached_delete.fs \
		-r:table_manipulate.dll \
		-r:mcached_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
