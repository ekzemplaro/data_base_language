VALA_COMMON=/var/www/data_base/common/vala_common
exist_read: exist_read.vala
	valac  --thread --pkg libsoup-2.4 --pkg libxml-2.0 --pkg gio-2.0 \
		-o exist_read exist_read.vala \
		$(VALA_COMMON)/xml_parse.vala
clean:
	rm -f exist_read
