BOO_COMMON=/var/www/data_base/common/boo_common
json_create.exe: json_create.boo
	booc json_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/file_io.boo
clean:
	rm -f *.exe *.mdb
