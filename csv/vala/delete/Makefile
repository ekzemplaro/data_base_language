VALA_COMMON=/var/www/data_base/common/vala_common
csv_delete: csv_delete.vala
	valac --pkg gio-2.0 -o csv_delete csv_delete.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f csv_delete
