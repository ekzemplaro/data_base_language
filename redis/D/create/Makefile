D_COMMON=/var/www/data_base/common/D_common
redis_create: redis_create.d
	dmd redis_create.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d \
		$(D_COMMON)/redis_manipulate.d
clean:
	rm -f redis_create *.o
