VALA_COMMON=/var/www/data_base/common/vala_common
mcached_delete: mcached_delete.vala
	valac --pkg gio-2.0 -o mcached_delete mcached_delete.vala \
		$(VALA_COMMON)/mcached_manipulate.vala \
		--pkg json-glib-1.0
clean:
	rm -f mcached_delete
