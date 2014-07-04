CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_create.exe : redis_create.cs
	mcs redis_create.cs \
		$(CSHARP_COMMON)/lib/redis-sharp.cs \
			-r:table_manipulate.dll
clean:
	rm -f *.exe
