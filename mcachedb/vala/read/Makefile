VALA_COMMON=/var/www/data_base/common/vala_common
mcachedb_read: mcachedb_read.vala
	valac -o mcachedb_read mcachedb_read.vala \
		$(VALA_COMMON)/mcached_manipulate.vala \
		--pkg json-glib-1.0 \
		--pkg gio-2.0
clean:
	rm -f mcachedb_read
