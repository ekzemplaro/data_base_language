COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
mongo_create.exe : mongo_create.cs
	dmcs mongo_create.cs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(DLL)/MongoDB.dll
clean:
	rm -f *.exe
