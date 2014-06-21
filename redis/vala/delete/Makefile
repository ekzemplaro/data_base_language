VALA_COMMON=/var/www/data_base/common/vala_common
redis_delete: redis_delete.vala
	valac --pkg gio-2.0 -o redis_delete redis_delete.vala \
		$(VALA_COMMON)/redis_manipulate.vala
clean:
	rm -f redis_delete
