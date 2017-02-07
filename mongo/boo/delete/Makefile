COMMON=/var/www/data_base/common
BOO_COMMON=$(COMMON)/boo_common
DLL=$(COMMON)/dll
mongo_delete.exe : mongo_delete.boo
	booc mongo_delete.boo \
		$(BOO_COMMON)/mongo_manipulate.boo \
		-r:$(DLL)/MongoDB.dll
clean:
	rm -f *.exe *.mdb
