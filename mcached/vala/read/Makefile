VALA_COMMON=/var/www/data_base/common/vala_common
mcached_read: mcached_read.vala
	valac -o mcached_read mcached_read.vala \
		$(VALA_COMMON)/mcached_manipulate.vala \
		--pkg json-glib-1.0 \
		--pkg gio-2.0
clean:
	rm -f mcached_read
