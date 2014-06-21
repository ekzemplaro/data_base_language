VALA_COMMON=/var/www/data_base/common/vala_common
xml_create: xml_create.vala
	valac --pkg gio-2.0 -o xml_create xml_create.vala \
		$(VALA_COMMON)/text_manipulate.vala
clean:
	rm -f xml_create
