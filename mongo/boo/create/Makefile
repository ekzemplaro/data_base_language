COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
BOO_COMMON=$(COMMON)/boo_common
DLL=$(COMMON)/dll
mongo_create.exe : mongo_create.boo
	booc mongo_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:$(DLL)/MongoDB.dll
clean:
	rm -f *.exe *.mdb
