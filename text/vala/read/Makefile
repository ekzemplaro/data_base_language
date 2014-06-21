VALA_COMMON=/var/www/data_base/common/vala_common
text_read: text_read.vala
	valac --pkg gio-2.0 -o text_read text_read.vala \
			$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f text_read *.c
