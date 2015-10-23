VALA_COMMON=/var/www/data_base/common/vala_common
text_delete: text_delete.vala
	valac --pkg gio-2.0 -o text_delete text_delete.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f text_delete
