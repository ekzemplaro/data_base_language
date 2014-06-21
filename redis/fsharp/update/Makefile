CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_update.exe: redis_update.fs
	fsharpc redis_update.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll
clean:
	rm -f *.exe
