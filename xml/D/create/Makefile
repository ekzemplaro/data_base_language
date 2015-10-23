D_COMMON=/var/www/data_base/common/D_common
xml_create: xml_create.d
	dmd xml_create.d \
		$(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/xml_manipulate.d
clean:
	rm -f xml_create *.o
