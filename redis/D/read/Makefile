D_COMMON=/var/www/data_base/common/D_common
redis_read: redis_read.d
	dmd redis_read.d $(D_COMMON)/mcached_manipulate.d \
		$(D_COMMON)/redis_manipulate.d
clean:
	rm -f redis_read *.o
