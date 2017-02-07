COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
mongo_delete.exe : mongo_delete.fs
	fsharpc mongo_delete.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(DLL)/MongoDB.dll
clean:
	rm -f *.exe
