
CSHARP_COMMON=/var/www/uchida/data_base/common/csharp_common
FSHARP_COMMON=/var/www/uchida/data_base/common/fsharp_common
mcached_create.exe: mcached_create.fs
	fsharpc mcached_create.fs \
		-r:mcached_manipulate.dll \
		-r:table_manipulate.dll \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
clean:
	rm -f *.exe
