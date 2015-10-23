D_COMMON=/var/www/data_base/common/D_common
tyrant_create: tyrant_create.d
	dmd tyrant_create.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d \
		$(D_COMMON)/mcached_manipulate.d
clean:
	rm -f tyrant_create *.o
