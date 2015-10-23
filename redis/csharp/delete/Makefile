CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_delete.exe : redis_delete.cs
	dmcs redis_delete.cs \
		$(CSHARP_COMMON)/lib/redis-sharp.cs \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
