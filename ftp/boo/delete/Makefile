COMMON=/var/www/data_base/common/csharp_common
ftp_delete.exe: ftp_delete.boo
	booc ftp_delete.boo \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe *.mdb
