D_COMMON=/var/www/data_base/common/D_common
mcachedb_read: mcachedb_read.d
	dmd mcachedb_read.d $(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/json_manipulate.d \
		$(D_COMMON)/text_manipulate.d
clean:
	rm -f mcachedb_read *.o
