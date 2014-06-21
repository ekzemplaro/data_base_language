D_COMMON=/var/www/data_base/common/D_common
redis_update: redis_update.d
	dmd redis_update.d $(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/redis_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f redis_update *.o
