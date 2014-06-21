CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_delete.exe: redis_delete.fs
	fsharpc redis_delete.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll
clean:
	rm -f *.exe
