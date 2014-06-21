VALA_COMMON=/var/www/data_base/common/vala_common
mcached_create: mcached_create.vala
	valac -o mcached_create mcached_create.vala \
			$(VALA_COMMON)/text_manipulate.vala \
			$(VALA_COMMON)/mcached_manipulate.vala \
			--pkg json-glib-1.0 \
			--pkg gio-2.0
clean:
	rm -f mcached_create
