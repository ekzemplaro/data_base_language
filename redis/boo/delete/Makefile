CSHARP_COMMON=/var/www/data_base/common/csharp_common
redis_delete.exe : redis_delete.boo
	booc redis_delete.boo \
		-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
