COMMON=/var/www/uchida/data_base/common
CSHARP_COMMON=$COMMON/csharp_common
DLL=$COMMON/dll
mcached_update.exe: mcached_update.fs
	fsharpc mcached_update.fs \
		-r:table_manipulate.dll \
		-r:mcached_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
