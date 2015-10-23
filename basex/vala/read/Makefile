VALA_COMMON=/var/www/data_base/common/vala_common
basex_read: basex_read.vala
	valac  --thread --pkg libsoup-2.4 --pkg libxml-2.0 --pkg gio-2.0 \
		-o basex_read basex_read.vala \
		$(VALA_COMMON)/xml_parse.vala
clean:
	rm -f basex_read
