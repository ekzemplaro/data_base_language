D_COMMON=/var/www/data_base/common/D_common
mcached_read: mcached_read.d
	dmd mcached_read.d $(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/json_manipulate.d \
		$(D_COMMON)/text_manipulate.d
clean:
	rm -f mcached_read *.o
