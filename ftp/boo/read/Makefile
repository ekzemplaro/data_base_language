BOO_COMMON=/var/www/data_base/common/boo_common
ftp_read.exe: ftp_read.boo
	booc ftp_read.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/json_manipulate.boo \
		$(BOO_COMMON)/ftp_manipulate.boo \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe *.mdb
