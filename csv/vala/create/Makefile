VALA_COMMON=/var/www/data_base/common/vala_common
csv_create: csv_create.vala
	valac --pkg gio-2.0 -o csv_create csv_create.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f csv_create
