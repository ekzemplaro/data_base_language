VALA_COMMON=/var/www/data_base/common/vala_common
tyrant_delete: tyrant_delete.vala
	valac --pkg gio-2.0 -o tyrant_delete tyrant_delete.vala \
		$(VALA_COMMON)/mcached_manipulate.vala
clean:
	rm -f tyrant_delete
