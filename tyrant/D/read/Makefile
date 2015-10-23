D_COMMON=/var/www/data_base/common/D_common
tyrant_read: tyrant_read.d
	dmd tyrant_read.d $(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/json_manipulate.d \
		$(D_COMMON)/text_manipulate.d
clean:
	rm -f tyrant_read *.o
