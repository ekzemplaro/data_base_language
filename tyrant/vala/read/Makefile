VALA_COMMON=/var/www/data_base/common/vala_common
tyrant_read: tyrant_read.vala
	valac -o tyrant_read tyrant_read.vala \
		$(VALA_COMMON)/mcached_manipulate.vala \
		--pkg json-glib-1.0 \
		--pkg gio-2.0
clean:
	rm -f tyrant_read
