COMMON=/var/www/data_base/common
BOO_COMMON=$(COMMON)/boo_common
DLL=$(COMMON)/dll
mongo_read.exe : mongo_read.boo
	booc mongo_read.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/mongo_manipulate.boo \
		-r:$(DLL)/MongoDB.dll
clean:
	rm -f *.exe *.mdb
