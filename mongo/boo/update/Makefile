COMMON=/var/www/data_base/common
BOO_COMMON=$(COMMON)/boo_common
DLL=$(COMMON)/dll
mongo_update.exe : mongo_update.boo
	booc mongo_update.boo \
		$(BOO_COMMON)/mongo_manipulate.boo \
		-r:$(DLL)/MongoDB.dll
clean:
	rm -f *.exe *.mdb
