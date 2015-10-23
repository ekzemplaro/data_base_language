CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_create.exe : redis_create.boo
	booc redis_create.boo \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
