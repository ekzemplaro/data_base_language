VALA_COMMON=/var/www/data_base/common/vala_common
json_create: json_create.vala
	valac -o json_create json_create.vala \
		$(VALA_COMMON)/text_manipulate.vala \
			--pkg gio-2.0 \
			--pkg json-glib-1.0
clean:
	rm -f json_create
