CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_read.exe : redis_read.boo
	booc redis_read.boo \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
