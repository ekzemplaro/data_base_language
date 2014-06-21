VALA_COMMON=/var/www/data_base/common/vala_common
csv_read: csv_read.vala
	valac --pkg gio-2.0 -o csv_read csv_read.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f csv_read
