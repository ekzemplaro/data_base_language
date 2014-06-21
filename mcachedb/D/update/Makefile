D_COMMON=/var/www/data_base/common/D_common
mcachedb_update: mcachedb_update.d
	dmd mcachedb_update.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f mcachedb_update *.o
