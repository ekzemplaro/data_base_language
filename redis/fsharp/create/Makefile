CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_create.exe: redis_create.fs
	fsharpc redis_create.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll
clean:
	rm -f *.exe
