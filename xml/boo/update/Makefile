BOO_COMMON=/var/www/data_base/common/boo_common
xml_update.exe: xml_update.boo
	booc xml_update.boo \
		$(BOO_COMMON)/file_io.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/xml_manipulate.boo
clean:
	rm -f *.exe *.mdb
