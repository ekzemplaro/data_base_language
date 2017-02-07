VALA_COMMON=/var/www/data_base/common/vala_common
mcachedb_delete: mcachedb_delete.vala
	valac --pkg gio-2.0 -o mcachedb_delete mcachedb_delete.vala \
		$(VALA_COMMON)/mcached_manipulate.vala
clean:
	rm -f mcachedb_delete
