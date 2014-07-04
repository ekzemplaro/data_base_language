CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_update.exe : redis_update.cs
	dmcs redis_update.cs \
			-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
