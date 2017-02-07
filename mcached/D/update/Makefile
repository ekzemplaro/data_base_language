D_COMMON=/var/www/data_base/common/D_common
mcached_update: mcached_update.d
	dmd mcached_update.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f mcached_update *.o
