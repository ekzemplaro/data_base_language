VALA_COMMON=/var/www/data_base/common/vala_common
text_create: text_create.vala
	valac --pkg gio-2.0 -o text_create text_create.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f text_create
