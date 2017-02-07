D_COMMON=/var/www/data_base/common/D_common
mcached_create: mcached_create.d
	dmd mcached_create.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d \
		$(D_COMMON)/mcached_manipulate.d
clean:
	rm -f mcached_create *.o
