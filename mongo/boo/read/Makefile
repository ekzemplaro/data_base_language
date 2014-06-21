COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
mongo_read.exe : mongo_read.boo
	booc mongo_read.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(DLL)/MongoDB.dll
clean:
	rm -f *.exe *.mdb
