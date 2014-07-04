CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_read.exe : redis_read.cs
	mcs redis_read.cs \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:DynamicJson.dll
clean:
	rm -f *.exe
