VALA_COMMON=/var/www/data_base/common/vala_common
text_update: text_update.vala
	valac --pkg gio-2.0 -o text_update text_update.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f text_update
