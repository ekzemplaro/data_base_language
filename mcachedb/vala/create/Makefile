VALA_COMMON=/var/www/data_base/common/vala_common
mcachedb_create: mcachedb_create.vala
	valac -o mcachedb_create mcachedb_create.vala \
			$(VALA_COMMON)/text_manipulate.vala \
			$(VALA_COMMON)/mcached_manipulate.vala \
			--pkg json-glib-1.0 \
			--pkg gio-2.0
clean:
	rm -f mcachedb_create
