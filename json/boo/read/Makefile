BOO_COMMON=/var/www/data_base/common/boo_common
json_read.exe: json_read.boo
	booc json_read.boo \
		$(BOO_COMMON)/json_manipulate.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/file_io.boo \
		-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
