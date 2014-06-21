BOO_COMMON=/var/www/data_base/common/boo_common
CSHARP_COMMON=/var/www/data_base/common/csharp_common
ftp_create.exe: ftp_create.boo
	booc ftp_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
