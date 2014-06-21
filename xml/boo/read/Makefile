BOO_COMMON=/var/www/data_base/common/boo_common
xml_read.exe: xml_read.boo
	booc xml_read.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/xml_manipulate.boo \
		$(BOO_COMMON)/file_io.boo
clean:
	rm -f *.exe *.mdb
