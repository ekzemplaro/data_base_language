CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_delete.exe : redis_delete.cs
	mcs redis_delete.cs \
		$(CSHARP_COMMON)/lib/redis-sharp.cs
clean:
	rm -f *.exe
