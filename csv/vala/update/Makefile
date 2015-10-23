VALA_COMMON=/var/www/data_base/common/vala_common
csv_update: csv_update.vala
	valac --pkg gio-2.0 -o csv_update csv_update.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f csv_update
