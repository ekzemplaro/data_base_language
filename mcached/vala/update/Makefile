VALA_COMMON=/var/www/data_base/common/vala_common
mcached_update: mcached_update.vala
	valac -o mcached_update mcached_update.vala \
		$(VALA_COMMON)/mcached_manipulate.vala \
		--pkg json-glib-1.0 \
		--pkg gio-2.0
clean:
	rm -f mcached_update
