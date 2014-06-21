VALA_COMMON=/var/www/data_base/common/vala_common
xml_read: xml_read.vala
	valac  --thread --pkg libxml-2.0 -o xml_read xml_read.vala \
		$(VALA_COMMON)/xml_parse.vala
clean:
	rm -f xml_read
