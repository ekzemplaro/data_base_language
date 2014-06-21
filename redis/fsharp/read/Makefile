CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_read.exe: redis_read.fs
	fsharpc redis_read.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll
clean:
	rm -f *.exe
