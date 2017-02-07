D_COMMON=/var/www/data_base/common/D_common
tyrant_update: tyrant_update.d
	dmd tyrant_update.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f tyrant_update *.o
