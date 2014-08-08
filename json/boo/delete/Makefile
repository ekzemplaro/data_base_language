BOO_COMMON=/var/www/data_base/common/boo_common
json_delete.exe: json_delete.boo
	booc json_delete.boo \
		$(BOO_COMMON)/file_io.boo \
		$(BOO_COMMON)/json_manipulate.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe *.mdb
