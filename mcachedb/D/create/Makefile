D_COMMON=/var/www/data_base/common/D_common
mcachedb_create: mcachedb_create.d
	dmd mcachedb_create.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d \
		$(D_COMMON)/mcached_manipulate.d
clean:
	rm -f mcachedb_create *.o
